object FReprocesa: TFReprocesa
  Left = 291
  Top = 300
  Width = 438
  Height = 326
  Caption = 'Reprocesa Movimientos por Art'#237'culo'
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblCIA: TLabel
    Left = 18
    Top = 8
    Width = 49
    Height = 13
    Caption = 'Compa'#241#237'a'
  end
  object Label2: TLabel
    Left = 19
    Top = 57
    Width = 41
    Height = 13
    Caption = 'Almac'#233'n'
  end
  object lblArti: TLabel
    Left = 19
    Top = 101
    Width = 37
    Height = 13
    Caption = 'Art'#237'culo'
    Transparent = True
  end
  object Label1: TLabel
    Left = 223
    Top = 8
    Width = 60
    Height = 13
    Caption = 'T. Inventario'
  end
  object lblArticulo: TLabel
    Left = 30
    Top = 284
    Width = 321
    Height = 15
    AutoSize = False
    Caption = 'Articulo'
  end
  object dblcCIA: TwwDBLookupCombo
    Left = 18
    Top = 25
    Width = 49
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'CIAID'#9'2'#9'C'#243'digo'#9'F'
      'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
      'CIAABR'#9'15'#9'Abreviatura'#9'F')
    DataField = 'CIAID'
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
  end
  object edtCia: TEdit
    Left = 69
    Top = 25
    Width = 135
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object dblcTALM: TwwDBLookupCombo
    Left = 17
    Top = 74
    Width = 49
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'ALMID'#9'2'#9'C'#243'digo'#9'F'
      'ALMDES'#9'25'#9'Descripci'#243'n'#9'F')
    DataField = 'ALMID'
    LookupTable = DMALM.cdsALM
    LookupField = 'ALMID'
    Options = [loColLines, loTitles]
    DropDownCount = 18
    MaxLength = 2
    TabOrder = 4
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcTALMExit
  end
  object edtALM: TEdit
    Left = 71
    Top = 74
    Width = 139
    Height = 21
    Enabled = False
    TabOrder = 5
  end
  object dblcdArt: TwwDBLookupComboDlg
    Left = 19
    Top = 118
    Width = 111
    Height = 21
    CharCase = ecUpperCase
    GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
    GridColor = clWhite
    GridTitleAlignment = taLeftJustify
    Caption = 'Art'#237'culo'
    MaxWidth = 0
    MaxHeight = 209
    Selected.Strings = (
      'ARTID'#9'15'#9'Articulo'#9'F'
      'ARTDES'#9'40'#9'Descripci'#243'n'#9'F'
      'ARTABR'#9'15'#9'Abreviatura'#9'F')
    DataField = 'ARTID'
    LookupField = 'ARTID'
    SeqSearchOptions = []
    MaxLength = 15
    TabOrder = 6
    AutoDropDown = False
    ShowButton = True
    AllowClearKey = False
    OnExit = dblcdArtExit
  end
  object edtArti: TwwDBEdit
    Left = 132
    Top = 118
    Width = 279
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 7
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object gbPeriodo: TGroupBox
    Left = 18
    Top = 147
    Width = 289
    Height = 97
    Caption = 'Periodo'
    TabOrder = 8
    object Label3: TLabel
      Left = 29
      Top = 31
      Width = 31
      Height = 13
      Caption = 'Desde'
    end
    object Label4: TLabel
      Left = 167
      Top = 32
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object dtpDesde: TDateTimePicker
      Left = 29
      Top = 46
      Width = 99
      Height = 23
      Date = 36951.719144328700000000
      Time = 36951.719144328700000000
      TabOrder = 0
    end
    object dtpHasta: TDateTimePicker
      Left = 167
      Top = 47
      Width = 97
      Height = 23
      Date = 36981.719144328700000000
      Time = 36981.719144328700000000
      TabOrder = 1
    end
  end
  object bbtnProcMes: TButton
    Left = 11
    Top = 255
    Width = 121
    Height = 25
    Caption = 'Saldos Mes Actual'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = bbtnProcMesClick
  end
  object dblcTInv: TwwDBLookupCombo
    Left = 221
    Top = 25
    Width = 49
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'TINID'#9'2'#9'Tipo Inventario'#9'F'
      'TINDES'#9'40'#9'Descripci'#243'n'#9'F')
    DataField = 'TINID'
    LookupTable = DMALM.cdsTINID
    LookupField = 'TINID'
    Options = [loColLines, loTitles]
    DropDownCount = 18
    MaxLength = 2
    TabOrder = 2
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcTInvExit
  end
  object edtTInv: TEdit
    Left = 271
    Top = 25
    Width = 135
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object pbProceso: TProgressBar
    Left = 138
    Top = 255
    Width = 284
    Height = 25
    Max = 0
    TabOrder = 10
  end
end
