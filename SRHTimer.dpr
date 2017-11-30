program SRHTimer;

uses
  Vcl.Forms,
  SRHTimer1 in 'SRHTimer1.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '≈∏¿Ã∏”';
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
