unit SRHTimer1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  Vcl.ExtCtrls, Vcl.StdCtrls, AdvEdit, AdvEdBtn, AdvOfficeButtons;

type
  TForm2 = class(TForm)
    pnl_Header: TPanel;
    pnl_Body: TPanel;
    pnl_Body_1: TPanel;
    pnl_Body_TAIL: TPanel;
    asg_timer: TAdvStringGrid;
    aEdtB_TimeAmount: TAdvEditBtn;
    tmr1: TTimer;
    aEdtB_Desc: TAdvEditBtn;
    aCkBox_Top: TAdvOfficeCheckBox;
    aCkBox_save_history: TAdvOfficeCheckBox;
    dlgSave1: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure asg_timerGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure asg_timerButtonClick(Sender: TObject; ACol, ARow: Integer);
    procedure tmr1Timer(Sender: TObject);
    procedure asg_timerGetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure aCkBox_TopClick(Sender: TObject);
    procedure aCkBox_save_historyClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure asg_timerGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
  private
    { Private declarations }
    logfile : TextFile;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;


const
  CI_SEQ = 0;
  CI_NAME = CI_SEQ + 1;
  CI_TIME = CI_NAME + 1;
  CI_PRGR = CI_TIME + 1;
  CI_STATE = CI_PRGR + 1;
  CI_REMAIN_SEC = CI_STATE + 1;
  CI_MAX_SEC = CI_REMAIN_SEC + 1;

implementation

{$R *.dfm}

procedure TForm2.aCkBox_save_historyClick(Sender: TObject);
begin
  if aCkBox_save_history.Checked then
  begin
    // File 저장 대화상자 열기. - 파일명. 위치 지정.
    dlgSave1.filename := '치료이력_'+formatDateTime('YYYYMMDD', date)  + '.txt';
    if dlgSave1.Execute = False then
    begin
        ShowMessage('저장을 취소 하였습니다.');
        aCkBox_save_history.Checked := False;
        Exit;
    end;
    {  버튼 클릭시 오픈으로 변경
    // File Open
    try
      assignFile(logfile, dlgSave1.FileName);
      if FileExists(dlgSave1.FileName) then
        Append(logFile)
      else
        Rewrite(logFile); // ? 없으면 덮어쓰기?

    except
      on E: Exception do
      begin
        showMessage('파일 열기 실패');
        aCkBox_save_history.Checked := False;
      end;
    end;
     }

//    setCurrentDir(extractFilePath(application.ExeName));
  end else
  begin
    //if logFile <> nil then
    { check = true인 경우 무조건 파일핸들이 생성된 것일터 }
     //CloseFile(logFile);  타이머 시작 버튼 클릭시 오픈-쓰기-닫기 처리
  end;
end;

procedure TForm2.aCkBox_TopClick(Sender: TObject);
begin
  if aCkBox_Top.Checked then
  begin
    SetWindowLong(Form2.Handle, GWL_HWNDPARENT, TForm(Owner).Handle);
    SetWindowPos(Form2.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);
  end
  else begin
    SetWindowLong(Form2.Handle, GWL_HWNDPARENT, TForm(Owner).Handle);
    SetWindowPos(Form2.Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);
  end;
end;

procedure TForm2.asg_timerButtonClick(Sender: TObject; ACol, ARow: Integer);
var
 t_sec : integer;
begin
  with asg_timer do
  begin
    case  strToIntdef(cells[CI_STATE, ARow], 0) of
      0 :   // 정지상태. 클릭으로 시작
      begin
        Cells[CI_STATE, ARow] := '1';
        ints[CI_REMAIN_SEC, ARow] := strToIntDef(aEdtB_TimeAmount.text, 3) * 60;
        ints[CI_MAX_SEC, ARow] := ints[CI_REMAIN_SEC, ARow];
        t_sec := ints[CI_REMAIN_SEC, ARow];
        SetButtonText(ACol, ARow, format('%.2d:%.2d:%.2d'
                                         , [  Trunc(t_sec/(60*60))
                                            , Trunc(t_sec/60) mod 60
                                            , t_sec mod 60 ]   ));
//        Cells[CI_NAME, ARow] := aEdtB_Desc.Text;
        {
        AddProgressFormatted(CI_NAME, ARow
                             , $0024E30F, $0074ACDE
                             , $00DFFFF5, $0024E30F
                             , '%d'
                             , 0, ints[CI_REMAIN_SEC, ARow] );
        }
        SetProgressPie(CI_PRGR, ARow, 0);

        // File Open
        try
          assignFile(logfile, dlgSave1.FileName);
          if FileExists(dlgSave1.FileName) then
            Append(logFile)
          else
            Rewrite(logFile); // ? 없으면 덮어쓰기?

        except
          on E: Exception do
          begin
            showMessage('파일 열기 실패');
            aCkBox_save_history.Checked := False;
          end;
        end;
        // log file writing..
        if aCkBox_save_history.Checked then
        begin
          Writeln(logfile, formatdatetime('YYYY-MM-DD hh:nn', Now())
                           +'   '+ asg_timer.Cells[CI_NAME, ARow]);
        end;
        closeFile(logFile);
      end;
      1 :  // 동작상태. 클릭으로 정지
      begin
        Cells[CI_STATE, ARow] := '2';
        t_sec := ints[CI_REMAIN_SEC, ARow];
        SetButtonText(ACol, ARow, format('%.2d:%.2d:%.2d'
                                         , [  Trunc(t_sec/(60*60))
                                            , Trunc(t_sec/60) mod 60
                                            , t_sec mod 60 ] )+' !!!');
      end;
      2 :  // 완료상태 . 클릭으로 초기화
      begin
        Cells[CI_STATE, ARow] := '0';
        Cells[CI_NAME, ARow] := '';
        t_sec := 0;
        ints[CI_REMAIN_SEC, ARow] := t_sec;
        ints[CI_MAX_SEC, ARow] := t_sec;
        SetProgressPie(CI_PRGR, ARow, 0);
        SetButtonText(ACol, ARow, format('%.2d:%.2d:%.2d'
                                         , [  Trunc(t_sec/(60*60))
                                            , Trunc(t_sec/60) mod 60
                                            , t_sec mod 60 ]   ));
      end;

    end;
    Refresh;
  end;
end;

procedure TForm2.asg_timerGetAlignment(Sender: TObject; ARow, ACol: Integer;
  var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  VAlign :=  vtaCenter; //vtaBottom; //vtaCenter;
  HAlign :=  taCenter;
end;

procedure TForm2.asg_timerGetCellColor(Sender: TObject; ARow, ACol: Integer;
  AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
  if (ARow < asg_timer.FixedRows) or (ACol < asg_timer.FixedCols)
  then exit;
  if ACol = CI_NAME then
  begin
    case asg_timer.Ints[CI_STATE, ARow] of
      0 : ABrush.Color := clWindow;
      1 : ABrush.Color := $00DFFFF5;
      2 : ABrush.Color := $00A596F5;
    else
      ABrush.Color := clyellow;
    end;
  end;
end;

procedure TForm2.asg_timerGetEditorType(Sender: TObject; ACol, ARow: Integer;
  var AEditor: TEditorType);
begin
  with asg_timer
  do begin
    if ACol = CI_NAME then
    begin
      AEditor :=  edNormal;

    end;
  end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // close file first
  //if logFile <> nil then
  //if aCkBox_save_history.Checked then  closeFile(logFile);

end;

procedure TForm2.FormCreate(Sender: TObject);
var
  i : integer;
  tmp_rect : TRect;
begin
  with asg_timer do
  begin
    for I := 1 to RowCount-1 do
    begin
      Cells[CI_SEQ, i] := intToStr(i);
      ints[CI_REMAIN_SEC, i] := 0;
      tmp_rect := CellRect(CI_TIME, i);
      AddButton(CI_TIME, i, tmp_rect.Width-1, tmp_rect.Height-1
                          , Cells[CI_REMAIN_SEC, i], haCenter, vaCenter);
      Ints[CI_STATE, i] := 0;
      AddProgressPie(CI_PRGR, i, $0074ACDE, ints[CI_REMAIN_SEC, i] );
    end;
  end;

end;

procedure TForm2.tmr1Timer(Sender: TObject);
var
  i, cnt, t_sec :integer;
  tmp :string;
begin
  with asg_timer do
  begin
    cnt := 0;
    for I := RowCount-1 downto 1 do
    begin
      if Cells[CI_STATE, i] <> '1' then continue;
      inc(cnt);
      t_sec := Ints[CI_REMAIN_SEC, i] -1;
      Ints[CI_REMAIN_SEC, i] := t_sec;
      tmp := format('%.2d:%.2d:%.2d', [ Trunc(t_sec/(60*60))
                                       , Trunc(t_sec/60) mod 60
                                       , t_sec mod 60]   );
      SetButtonText(CI_TIME, i, tmp);
      SetProgressPie(CI_PRGR, i
                    , round(((ints[CI_MAX_SEC, i]-ints[CI_REMAIN_SEC, i])
                             /ints[CI_MAX_SEC, i])*100)  );
      if Ints[CI_REMAIN_SEC, i] = 0 then
      begin
        Ints[CI_STATE, i] := 2;
        SetButtonText(CI_TIME, i, '완료');
        beep;
      end;
    end;

    if cnt <> 0 then
      asg_timer.Refresh;
  end;
end;

end.
