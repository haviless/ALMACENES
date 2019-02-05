object FApeCieOpe: TFApeCieOpe
  Left = 453
  Top = 83
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Apertura / Cierre Operativo'
  ClientHeight = 563
  ClientWidth = 419
  Color = 14869218
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
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
  TextHeight = 15
  object Label1: TLabel
    Left = 93
    Top = -1
    Width = 232
    Height = 35
    Caption = 'Periodos Operativos'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -24
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object bbtnGraba: TBitBtn
    Left = 11
    Top = 535
    Width = 95
    Height = 26
    Caption = 'Aceptar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Visible = False
    OnClick = bbtnGrabaClick
  end
  object bbtnSalir: TBitBtn
    Left = 314
    Top = 535
    Width = 95
    Height = 26
    Caption = '&Salir'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = bbtnSalirClick
  end
  object Panel1: TPanel
    Left = 10
    Top = 38
    Width = 400
    Height = 159
    BevelInner = bvLowered
    BevelWidth = 2
    Color = 14869218
    TabOrder = 2
    object lblCia: TLabel
      Left = 14
      Top = 10
      Width = 49
      Height = 15
      Caption = 'Compa'#241#237'a'
    end
    object Label16: TLabel
      Left = 14
      Top = 123
      Width = 43
      Height = 15
      Caption = 'Almac'#233'n'
    end
    object Label17: TLabel
      Left = 14
      Top = 48
      Width = 49
      Height = 15
      Caption = 'Localidad'
    end
    object Label18: TLabel
      Left = 14
      Top = 86
      Width = 68
      Height = 15
      Caption = 'T. Inventario'
    end
    object dblcCia: TwwDBLookupCombo
      Left = 88
      Top = 10
      Width = 55
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Cia'#9'F'
        'CIAABR'#9'15'#9'Raz'#243'n Social'#9'F')
      LookupTable = DMALM.cdsCIA
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      DropDownCount = 15
      MaxLength = 2
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnEnter = dblcCiaEnter
      OnExit = dblcCiaExit
    end
    object edtCia: TEdit
      Left = 144
      Top = 10
      Width = 240
      Height = 23
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object dbeALM: TwwDBEdit
      Left = 144
      Top = 123
      Width = 240
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeLOC: TwwDBEdit
      Left = 144
      Top = 48
      Width = 240
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcLOC: TwwDBLookupCombo
      Left = 88
      Top = 48
      Width = 55
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'LOCID'#9'2'#9'C'#243'digo'#9'F'
        'LOCABR'#9'10'#9'Abreviatura'#9'F')
      DataField = 'LOCID'
      LookupTable = DMALM.cdsLOC
      LookupField = 'LOCID'
      Options = [loColLines, loRowLines, loTitles]
      MaxLength = 2
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnEnter = dblcLOCEnter
      OnExit = dblcLOCExit
    end
    object dblcALM: TwwDBLookupCombo
      Left = 88
      Top = 123
      Width = 55
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'ALMID'#9'2'#9'C'#243'digo'#9'F'
        'ALMABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'ALMID'
      LookupTable = DMALM.cdsALM
      LookupField = 'ALMID'
      Options = [loColLines, loRowLines, loTitles]
      MaxLength = 2
      TabOrder = 6
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnEnter = dblcALMEnter
      OnExit = dblcALMExit
    end
    object dblcTIN: TwwDBLookupCombo
      Left = 88
      Top = 86
      Width = 55
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TINID'#9'3'#9'Tipo Inventario'#9'F'
        'TINDES'#9'40'#9'Descripci'#243'n'#9'F')
      DataField = 'TINID'
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
      OnEnter = dblcTINEnter
      OnExit = dblcTINExit
    end
    object dbeTIN: TEdit
      Left = 144
      Top = 86
      Width = 240
      Height = 23
      Enabled = False
      TabOrder = 5
    end
  end
  object pnlReg2: TPanel
    Left = 10
    Top = 202
    Width = 400
    Height = 145
    BevelInner = bvLowered
    BevelWidth = 2
    Color = 14869218
    Enabled = False
    TabOrder = 3
    Visible = False
    object Label2: TLabel
      Left = 209
      Top = 10
      Width = 62
      Height = 15
      Caption = 'Nro.Periodo'
    end
    object Label3: TLabel
      Left = 12
      Top = 45
      Width = 65
      Height = 15
      Caption = 'Fecha Inicio'
    end
    object Label4: TLabel
      Left = 12
      Top = 10
      Width = 169
      Height = 19
      Caption = 'Periodo Actual de Trabajo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 209
      Top = 45
      Width = 58
      Height = 15
      Caption = 'Fecha Final'
    end
    object Label6: TLabel
      Left = 12
      Top = 80
      Width = 40
      Height = 15
      Caption = 'Usuario'
    end
    object Label7: TLabel
      Left = 209
      Top = 80
      Width = 55
      Height = 15
      Caption = 'Fecha Reg.'
    end
    object Label8: TLabel
      Left = 209
      Top = 115
      Width = 50
      Height = 15
      Caption = 'Hora Reg.'
    end
    object dbeNoCierreU: TwwDBEdit
      Left = 275
      Top = 10
      Width = 95
      Height = 23
      TabOrder = 0
      UnboundDataType = wwDefault
      UnboundAlignment = taRightJustify
      WantReturns = False
      WordWrap = False
    end
    object dtpFIniU: TwwDBDateTimePicker
      Left = 81
      Top = 45
      Width = 95
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 1
    end
    object dtpFCierreU: TwwDBDateTimePicker
      Left = 275
      Top = 45
      Width = 95
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 2
    end
    object dtpFRegU: TwwDBDateTimePicker
      Left = 275
      Top = 80
      Width = 95
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 3
      UnboundDataType = wwDTEdtDate
    end
    object dtpHRegU: TwwDBDateTimePicker
      Left = 275
      Top = 115
      Width = 95
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 4
      UnboundDataType = wwDTEdtTime
    end
    object dbeUserU: TwwDBEdit
      Left = 81
      Top = 80
      Width = 95
      Height = 23
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object pnlReg3: TPanel
    Left = 10
    Top = 386
    Width = 400
    Height = 146
    BevelInner = bvLowered
    BevelWidth = 2
    Color = 14869218
    TabOrder = 4
    Visible = False
    object Label9: TLabel
      Left = 209
      Top = 10
      Width = 62
      Height = 15
      Caption = 'Nro.Periodo'
    end
    object Label10: TLabel
      Left = 12
      Top = 45
      Width = 65
      Height = 15
      Caption = 'Fecha Inicio'
    end
    object Label11: TLabel
      Left = 12
      Top = 10
      Width = 166
      Height = 19
      Caption = 'Nuevo Periodo de Trabajo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 209
      Top = 45
      Width = 58
      Height = 15
      Caption = 'Fecha Final'
    end
    object Label13: TLabel
      Left = 12
      Top = 80
      Width = 40
      Height = 15
      Caption = 'Usuario'
    end
    object Label14: TLabel
      Left = 209
      Top = 80
      Width = 55
      Height = 15
      Caption = 'Fecha Reg.'
    end
    object Label15: TLabel
      Left = 209
      Top = 115
      Width = 50
      Height = 15
      Caption = 'Hora Reg.'
    end
    object dbeNoCierre: TwwDBEdit
      Left = 275
      Top = 10
      Width = 95
      Height = 23
      DataField = 'NOCIERRE'
      DataSource = DMALM.dsCierre
      Enabled = False
      TabOrder = 0
      UnboundDataType = wwDefault
      UnboundAlignment = taRightJustify
      WantReturns = False
      WordWrap = False
      OnExit = dbeNoCierreExit
    end
    object dtpFIni: TwwDBDateTimePicker
      Left = 81
      Top = 45
      Width = 95
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'CNSPRICIE'
      DataSource = DMALM.dsCierre
      Epoch = 1950
      Enabled = False
      ShowButton = True
      TabOrder = 1
    end
    object dtpFCierre: TwwDBDateTimePicker
      Left = 275
      Top = 45
      Width = 95
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'CNSULTCIE'
      DataSource = DMALM.dsCierre
      Epoch = 1950
      ShowButton = True
      TabOrder = 2
      OnExit = dtpFCierreExit
    end
    object dtpFReg: TwwDBDateTimePicker
      Left = 275
      Top = 80
      Width = 95
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'CNSPRICIE'
      DataSource = DMALM.dsCierre
      Epoch = 1950
      Enabled = False
      ShowButton = True
      TabOrder = 3
      UnboundDataType = wwDTEdtDate
    end
    object dtpHReg: TwwDBDateTimePicker
      Left = 275
      Top = 115
      Width = 95
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'HREG'
      DataSource = DMALM.dsCierre
      Epoch = 1950
      Enabled = False
      ShowButton = True
      TabOrder = 4
      UnboundDataType = wwDTEdtTime
    end
    object dbeUser: TwwDBEdit
      Left = 81
      Top = 80
      Width = 95
      Height = 23
      DataField = 'USUARIO'
      DataSource = DMALM.dsCierre
      Enabled = False
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object bbtnNuevo: TBitBtn
    Left = 11
    Top = 355
    Width = 95
    Height = 26
    Caption = 'Nuevo Periodo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    Visible = False
    OnClick = bbtnNuevoClick
  end
  object bbtnElimina: TBitBtn
    Left = 314
    Top = 355
    Width = 95
    Height = 26
    Caption = 'Elimina Periodo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    Visible = False
    OnClick = bbtnEliminaClick
  end
end
