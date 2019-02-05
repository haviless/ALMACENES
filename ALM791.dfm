object FToolLote: TFToolLote
  Left = 162
  Top = 435
  BorderStyle = bsSingle
  Caption = 'Consulta por Lote'
  ClientHeight = 148
  ClientWidth = 792
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 430
    Top = 60
    Width = 32
    Height = 13
    Caption = 'Familia'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object pnlTool: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 148
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
      Left = 16
      Top = 7
      Width = 49
      Height = 15
      Caption = 'Compa'#241#237'a'
    end
    object lblLoc: TLabel
      Left = 206
      Top = 7
      Width = 49
      Height = 15
      Caption = 'Localidad'
    end
    object Label1: TLabel
      Left = 396
      Top = 7
      Width = 68
      Height = 15
      Caption = 'T. Inventario'
    end
    object lblAlm: TLabel
      Left = 586
      Top = 7
      Width = 43
      Height = 15
      Caption = 'Almac'#233'n'
    end
    object Label2: TLabel
      Left = 16
      Top = 51
      Width = 28
      Height = 15
      Caption = 'L'#237'nea'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label10: TLabel
      Left = 206
      Top = 51
      Width = 37
      Height = 15
      Caption = 'Familia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 423
      Top = 51
      Width = 60
      Height = 15
      Caption = 'Sub Familia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblCnpEgr: TLabel
      Left = 16
      Top = 94
      Width = 51
      Height = 15
      Caption = 'Articulo   '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 408
      Top = 96
      Width = 64
      Height = 15
      Caption = 'Und. Medida'
    end
    object dblcCIA: TwwDBLookupCombo
      Left = 16
      Top = 24
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
      Left = 66
      Top = 24
      Width = 135
      Height = 23
      Enabled = False
      TabOrder = 1
    end
    object dblcLOC: TwwDBLookupCombo
      Left = 205
      Top = 24
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
      Left = 256
      Top = 24
      Width = 135
      Height = 23
      Enabled = False
      TabOrder = 3
    end
    object dblcTIN: TwwDBLookupCombo
      Left = 396
      Top = 24
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
      Left = 447
      Top = 24
      Width = 135
      Height = 23
      Enabled = False
      TabOrder = 5
    end
    object dbeALM: TEdit
      Left = 636
      Top = 24
      Width = 135
      Height = 23
      Enabled = False
      TabOrder = 7
    end
    object dblcTALM: TwwDBLookupCombo
      Left = 585
      Top = 24
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
    object edtLinea: TEdit
      Left = 79
      Top = 67
      Width = 121
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
    object edtFamilia: TEdit
      Left = 270
      Top = 67
      Width = 148
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
    object dblcdArticulo: TwwDBLookupComboDlg
      Left = 16
      Top = 110
      Width = 74
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Maestro de Articulos'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'ARTID'#9'9'#9'C'#243'digo'#9'F'
        'ARTDES'#9'40'#9'Articulo'#9'F'
        'UNMIDG'#9'3'#9'U.M'#9'F'
        'ARTPVG'#9'10'#9'Precio Vta.'#9'F'
        'ARTABR'#9'15'#9'Abrev.'#9'F'
        'GRARID'#9'3'#9'L'#237'nea'#9'F')
      LookupTable = DMALM.cdsArti
      LookupField = 'ARTID'
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      MaxLength = 15
      ParentFont = False
      TabOrder = 14
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      OnExit = dblcdArticuloExit
    end
    object bbtnConsultaLote: TBitBtn
      Left = 736
      Top = 96
      Width = 41
      Height = 35
      TabOrder = 15
      OnClick = bbtnConsultaLoteClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
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
    object dblcdLinea: TwwDBLookupComboDlg
      Left = 16
      Top = 67
      Width = 60
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'GRARID'#9'15'#9'L'#237'nea'#9'F'
        'GRARDES'#9'40'#9'Descripci'#243'n'#9'F')
      LookupTable = DMALM.cdsGArti
      LookupField = 'GRARID'
      TabOrder = 8
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcdLineaExit
    end
    object dblcdFamilia: TwwDBLookupComboDlg
      Left = 205
      Top = 67
      Width = 65
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'FAMID'#9'4'#9'Familia'#9'F'
        'FAMDES'#9'40'#9'Descripci'#243'n'#9'F')
      LookupTable = DMALM.cdsFAM
      LookupField = 'FAMID'
      TabOrder = 10
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcdFamiliaExit
    end
    object dblcdSFamilia: TwwDBLookupComboDlg
      Left = 423
      Top = 67
      Width = 65
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'SFAMID'#9'8'#9'SubFamilia'#9'F'
        'SFAMDES'#9'40'#9'Descripci'#243'n'#9'F')
      LookupTable = DMALM.cdsSUBFAM
      LookupField = 'SFAMID'
      TabOrder = 12
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcdSFamiliaExit
    end
    object edtSFamilia: TEdit
      Left = 489
      Top = 67
      Width = 148
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
    end
    object dbeArticulo: TEdit
      Left = 95
      Top = 110
      Width = 306
      Height = 23
      Enabled = False
      TabOrder = 16
    end
    object dbeUnMidG: TEdit
      Left = 408
      Top = 111
      Width = 121
      Height = 23
      Enabled = False
      TabOrder = 17
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 616
    Top = 96
  end
end
