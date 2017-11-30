object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Timer'
  ClientHeight = 537
  ClientWidth = 303
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_Header: TPanel
    Left = 0
    Top = 0
    Width = 303
    Height = 57
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 329
    object aEdtB_TimeAmount: TAdvEditBtn
      Left = 244
      Top = 25
      Width = 57
      Height = 27
      EditType = etNumeric
      EmptyTextStyle = []
      Flat = True
      FocusColor = clBtnFace
      LabelCaption = #49444#51221' '#49884#44036'('#20998')'
      LabelPosition = lpTopRight
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = #44404#47548#52404
      LabelFont.Style = [fsBold]
      Lookup.ValueList.Strings = (
        '5'
        '8'
        '10'
        '15'
        '20'
        '25'
        '30'
        '60')
      Lookup.Separator = ';'
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeName = 'Microsoft IME 2010'
      ParentFont = False
      ReadOnly = False
      TabOrder = 1
      Text = '20'
      Visible = True
      Version = '1.3.3.4'
      ButtonStyle = bsDropDown
      ButtonWidth = 16
      Etched = False
    end
    object aEdtB_Desc: TAdvEditBtn
      Left = 55
      Top = 48
      Width = 201
      Height = 27
      EmptyTextStyle = []
      Flat = True
      FocusColor = clBtnFace
      LabelCaption = #53440#51060#47672' '#49444#47749
      LabelPosition = lpTopRight
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -12
      LabelFont.Name = #44404#47548#52404
      LabelFont.Style = [fsBold]
      Lookup.ValueList.Strings = (
        '5'
        '8'
        '10'
        '15'
        '20'
        '25'
        '30'
        '60')
      Lookup.Separator = ';'
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #44404#47548#52404
      Font.Style = []
      ImeMode = imSHanguel
      ImeName = 'Microsoft IME 2010'
      ParentFont = False
      ReadOnly = False
      TabOrder = 0
      Text = #44608#44049#49688
      Visible = False
      Version = '1.3.3.4'
      ButtonStyle = bsButton
      ButtonWidth = 16
      Etched = False
    end
  end
  object pnl_Body: TPanel
    Left = 0
    Top = 57
    Width = 303
    Height = 480
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 329
    ExplicitHeight = 483
    object pnl_Body_1: TPanel
      Left = 1
      Top = 1
      Width = 301
      Height = 457
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 327
      ExplicitHeight = 460
      object asg_timer: TAdvStringGrid
        Left = 1
        Top = 1
        Width = 299
        Height = 455
        Cursor = crDefault
        Align = alClient
        ColCount = 4
        Ctl3D = True
        DefaultRowHeight = 30
        DrawingStyle = gdsClassic
        RowCount = 15
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        Font.Quality = fqClearTypeNatural
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
        ParentCtl3D = False
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        ActiveRowColor = 15790320
        GridFixedLineColor = clNone
        HoverRowCells = [hcNormal, hcSelected]
        OnGetCellColor = asg_timerGetCellColor
        OnGetAlignment = asg_timerGetAlignment
        OnGetEditorType = asg_timerGetEditorType
        OnButtonClick = asg_timerButtonClick
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clDefault
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ActiveCellColor = 14680053
        ActiveCellColorTo = 4730091
        ColumnHeaders.Strings = (
          '#'
          'Client'
          'Time '
          'P')
        ControlLook.FixedGradientFrom = clWhite
        ControlLook.FixedGradientTo = clBtnFace
        ControlLook.FixedGradientHoverFrom = 13619409
        ControlLook.FixedGradientHoverTo = 12502728
        ControlLook.FixedGradientHoverMirrorFrom = 12502728
        ControlLook.FixedGradientHoverMirrorTo = 11254975
        ControlLook.FixedGradientDownFrom = 8816520
        ControlLook.FixedGradientDownTo = 7568510
        ControlLook.FixedGradientDownMirrorFrom = 7568510
        ControlLook.FixedGradientDownMirrorTo = 6452086
        ControlLook.FixedGradientDownBorder = 10852085
        ControlLook.ControlStyle = csTMS
        ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownHeader.Font.Color = clWindowText
        ControlLook.DropDownHeader.Font.Height = -11
        ControlLook.DropDownHeader.Font.Name = 'Tahoma'
        ControlLook.DropDownHeader.Font.Style = []
        ControlLook.DropDownHeader.Visible = True
        ControlLook.DropDownHeader.Buttons = <>
        ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownFooter.Font.Color = clWindowText
        ControlLook.DropDownFooter.Font.Height = -11
        ControlLook.DropDownFooter.Font.Name = 'Tahoma'
        ControlLook.DropDownFooter.Font.Style = []
        ControlLook.DropDownFooter.Visible = True
        ControlLook.DropDownFooter.Buttons = <>
        ControlLook.NoDisabledButtonLook = True
        ControlLook.ProgressXP = True
        DefaultAlignment = taCenter
        Filter = <>
        FilterDropDown.Font.Charset = DEFAULT_CHARSET
        FilterDropDown.Font.Color = clWindowText
        FilterDropDown.Font.Height = -11
        FilterDropDown.Font.Name = 'Tahoma'
        FilterDropDown.Font.Style = []
        FilterDropDownClear = '(All)'
        FixedColWidth = 30
        FixedRowHeight = 30
        FixedRowAlways = True
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clWindowText
        FixedFont.Height = -16
        FixedFont.Name = #47569#51008' '#44256#46357
        FixedFont.Style = [fsBold, fsItalic]
        FixedFont.Quality = fqClearTypeNatural
        FloatFormat = '%.2f'
        Grouping.HeaderColor = 15790320
        Grouping.HeaderColorTo = 10264290
        Grouping.SummaryColor = clSilver
        MouseActions.WheelAction = waScroll
        Multilinecells = True
        PrintSettings.DateFormat = 'dd/mm/yyyy'
        PrintSettings.Font.Charset = DEFAULT_CHARSET
        PrintSettings.Font.Color = clWindowText
        PrintSettings.Font.Height = -11
        PrintSettings.Font.Name = 'Tahoma'
        PrintSettings.Font.Style = []
        PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
        PrintSettings.FixedFont.Color = clWindowText
        PrintSettings.FixedFont.Height = -11
        PrintSettings.FixedFont.Name = 'Tahoma'
        PrintSettings.FixedFont.Style = []
        PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
        PrintSettings.HeaderFont.Color = clWindowText
        PrintSettings.HeaderFont.Height = -11
        PrintSettings.HeaderFont.Name = 'Tahoma'
        PrintSettings.HeaderFont.Style = []
        PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
        PrintSettings.FooterFont.Color = clWindowText
        PrintSettings.FooterFont.Height = -11
        PrintSettings.FooterFont.Name = 'Tahoma'
        PrintSettings.FooterFont.Style = []
        PrintSettings.PageNumSep = '/'
        ScrollProportional = True
        ScrollSynch = True
        SearchFooter.Color = 15790320
        SearchFooter.ColorTo = clSilver
        SearchFooter.FindNextCaption = 'Find &next'
        SearchFooter.FindPrevCaption = 'Find &previous'
        SearchFooter.Font.Charset = DEFAULT_CHARSET
        SearchFooter.Font.Color = clWindowText
        SearchFooter.Font.Height = -11
        SearchFooter.Font.Name = 'Tahoma'
        SearchFooter.Font.Style = []
        SearchFooter.HighLightCaption = 'Highlight'
        SearchFooter.HintClose = 'Close'
        SearchFooter.HintFindNext = 'Find next occurrence'
        SearchFooter.HintFindPrev = 'Find previous occurrence'
        SearchFooter.HintHighlight = 'Highlight occurrences'
        SearchFooter.MatchCaseCaption = 'Match case'
        ShowSelection = False
        ShowDesignHelper = False
        SortSettings.HeaderColorTo = 16579058
        SortSettings.HeaderMirrorColor = 16380385
        SortSettings.HeaderMirrorColorTo = 16182488
        VAlignment = vtaBottom
        Version = '6.2.1.1'
        ExplicitWidth = 325
        ExplicitHeight = 458
        ColWidths = (
          30
          115
          111
          38)
      end
    end
    object pnl_Body_TAIL: TPanel
      Left = 1
      Top = 458
      Width = 301
      Height = 21
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 461
      ExplicitWidth = 327
      DesignSize = (
        301
        21)
      object aCkBox_Top: TAdvOfficeCheckBox
        Left = 8
        Top = 0
        Width = 81
        Height = 20
        TabOrder = 0
        OnClick = aCkBox_TopClick
        Alignment = taLeftJustify
        Caption = #52285' '#47592#50948#47196
        ReturnIsTab = False
        Version = '1.3.5.0'
      end
      object aCkBox_save_history: TAdvOfficeCheckBox
        Left = 197
        Top = -2
        Width = 119
        Height = 23
        Anchors = [akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = aCkBox_save_historyClick
        Alignment = taLeftJustify
        ButtonVertAlign = tlCenter
        Caption = #49324#50857#51060#47141' '#51200#51109
        ReturnIsTab = False
        Version = '1.3.5.0'
      end
    end
  end
  object tmr1: TTimer
    OnTimer = tmr1Timer
    Left = 288
    Top = 88
  end
  object dlgSave1: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'text '#54028#51068'|*.txt'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = #53440#51060#47672' '#49324#50857' '#51060#47141' '#51200#51109' '#54028#51068' '#49440#53469
    Left = 184
    Top = 704
  end
end
