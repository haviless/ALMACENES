object FTomaInventario: TFTomaInventario
  Left = 304
  Top = 269
  BorderStyle = bsDialog
  Caption = 'Toma de Inventario'
  ClientHeight = 179
  ClientWidth = 665
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlOpciones: TPanel
    Left = 0
    Top = 0
    Width = 665
    Height = 179
    Align = alClient
    Color = 14869218
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object lblCia: TLabel
      Left = 13
      Top = 2
      Width = 49
      Height = 15
      Caption = 'Compa'#241#237'a'
    end
    object lblLoc: TLabel
      Left = 325
      Top = 2
      Width = 49
      Height = 15
      Caption = 'Localidad'
    end
    object Label1: TLabel
      Left = 12
      Top = 41
      Width = 68
      Height = 15
      Caption = 'T. Inventario'
    end
    object lblAlm: TLabel
      Left = 325
      Top = 41
      Width = 43
      Height = 15
      Caption = 'Almac'#233'n'
    end
    object Label2: TLabel
      Left = 12
      Top = 85
      Width = 65
      Height = 15
      Caption = 'Observaci'#243'n'
    end
    object lblFechaToma: TLabel
      Left = 13
      Top = 127
      Width = 75
      Height = 15
      Caption = 'Fecha de Toma'
    end
    object lblAnoMes: TLabel
      Left = 162
      Top = 127
      Width = 160
      Height = 15
      Caption = 'A'#241'o+Mes del Archivo de Saldos'
    end
    object dblcCIA: TwwDBLookupCombo
      Left = 13
      Top = 20
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'ID'#9'F'
        'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
        'CIAABR'#9'15'#9'Abreviatura'#9'F')
      LookupTable = DMALM.cdsCIA
      LookupField = 'CIAID'
      Options = [loColLines, loTitles]
      DropDownCount = 15
      MaxLength = 2
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcCIAExit
      OnNotInList = NotInList
    end
    object dbeCIA: TEdit
      Left = 67
      Top = 20
      Width = 240
      Height = 23
      Enabled = False
      TabOrder = 1
    end
    object dblcLOC: TwwDBLookupCombo
      Left = 325
      Top = 20
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'LOCID'#9'2'#9'ID'#9'F'
        'LOCDES'#9'30'#9'Descripci'#243'n'#9'F'
        'LOCABR'#9'10'#9'Abreviatura'#9'F')
      LookupTable = DMALM.cdsLOC
      LookupField = 'LOCID'
      Options = [loColLines, loTitles]
      DropDownCount = 18
      MaxLength = 2
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcLOCExit
      OnNotInList = NotInList
    end
    object dbeLOC: TEdit
      Left = 379
      Top = 20
      Width = 240
      Height = 23
      Enabled = False
      TabOrder = 3
    end
    object dblcTIN: TwwDBLookupCombo
      Left = 12
      Top = 59
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TINID'#9'3'#9'Tipo Inventario'#9'F'
        'TINDES'#9'40'#9'Descripci'#243'n'#9'F')
      LookupTable = DMALM.cdsTINID
      LookupField = 'TINID'
      Options = [loColLines, loTitles]
      DropDownCount = 18
      MaxLength = 2
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcTINExit
      OnNotInList = NotInList
    end
    object dbeTIN: TEdit
      Left = 66
      Top = 59
      Width = 240
      Height = 23
      Enabled = False
      TabOrder = 5
    end
    object dblcTALM: TwwDBLookupCombo
      Left = 325
      Top = 59
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'ALMID'#9'2'#9'ID'#9'F'
        'ALMDES'#9'40'#9'Descripci'#243'n'#9'F'
        'ALMABR'#9'15'#9'Abreviatura'#9'F')
      LookupTable = DMALM.cdsALM
      LookupField = 'ALMID'
      Options = [loColLines, loTitles]
      DropDownCount = 18
      MaxLength = 2
      TabOrder = 6
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcTALMExit
      OnNotInList = NotInList
    end
    object dbeALM: TEdit
      Left = 381
      Top = 59
      Width = 240
      Height = 23
      Enabled = False
      TabOrder = 7
    end
    object dbeObs: TEdit
      Left = 10
      Top = 99
      Width = 607
      Height = 23
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 8
    end
    object bbtnOk: TBitBtn
      Left = 628
      Top = 144
      Width = 33
      Height = 25
      TabOrder = 9
      OnClick = bbtnOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object dtpFechaToma: TwwDBDateTimePicker
      Left = 11
      Top = 144
      Width = 121
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 10
    end
    object dbeAnoMesToma: TwwDBEdit
      Left = 160
      Top = 144
      Width = 121
      Height = 23
      TabOrder = 11
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 624
    Top = 8
  end
end
