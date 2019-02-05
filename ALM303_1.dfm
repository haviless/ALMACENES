object FStockVal: TFStockVal
  Left = 245
  Top = 288
  Width = 696
  Height = 117
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  Caption = '+'
  Color = 12904163
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 15
  object pnlParame: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 91
    Align = alTop
    BevelInner = bvLowered
    BevelWidth = 2
    Color = 10207162
    TabOrder = 0
    object lblTipMon: TLabel
      Left = 131
      Top = 10
      Width = 81
      Height = 15
      Caption = 'Tipo de Moneda'
    end
    object lblTipCam: TLabel
      Left = 387
      Top = 37
      Width = 78
      Height = 15
      Alignment = taCenter
      Caption = 'Tipo de Cambio'
    end
    object lblCambio: TLabel
      Left = 497
      Top = 37
      Width = 37
      Height = 15
      Caption = 'Cambio'
    end
    object lblFCambio: TLabel
      Left = 284
      Top = 15
      Width = 78
      Height = 30
      Alignment = taCenter
      Caption = 'Fecha para el Tipo de Cambio'
      WordWrap = True
    end
    object dblcTipMon: TwwDBLookupCombo
      Left = 131
      Top = 28
      Width = 41
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TMONID'#9'3'#9'C'#243'digo'#9'F'
        'TMONDES'#9'20'#9'Descripci'#243'n'#9'F')
      LookupTable = DM1.cdsTMoneda
      LookupField = 'TMONDES'
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcTipMonChange
      OnNotInList = dblcTipMonNotInList
    end
    object dbeTipCam: TwwDBEdit
      Left = 497
      Top = 52
      Width = 65
      Height = 23
      ReadOnly = True
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object bbSalir: TBitBtn
      Left = 648
      Top = 48
      Width = 29
      Height = 27
      Hint = 'Cierra Stock Valorizado'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbSalirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
    end
    object rgTipVal: TRadioGroup
      Left = 6
      Top = 10
      Width = 119
      Height = 73
      Caption = 'Tipo de Stock'
      Items.Strings = (
        'Inicial'
        'L'#243'gico'
        'F'#237'sico')
      TabOrder = 3
      OnClick = rgTipValClick
    end
    object dbeTipmondes: TwwDBEdit
      Left = 131
      Top = 52
      Width = 148
      Height = 23
      ReadOnly = True
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object BitBtn1: TBitBtn
      Left = 616
      Top = 48
      Width = 29
      Height = 27
      Hint = 'Calcula el Stock Valorizado'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
        73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
        0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
        0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
        0333337F777777737F333308888888880333337F333333337F33330888888888
        03333373FFFFFFFF733333700000000073333337777777773333}
      NumGlyphs = 2
    end
    object dtpFCambio: TDateTimePicker
      Left = 283
      Top = 52
      Width = 97
      Height = 23
      Date = 0.701918518498132000
      Time = 0.701918518498132000
      TabOrder = 6
      OnChange = dtpFCambioChange
    end
    object cbItemTCam: TComboBox
      Left = 384
      Top = 52
      Width = 108
      Height = 23
      ItemHeight = 15
      TabOrder = 7
      Text = 'cbItemTCam'
      OnChange = cbItemTCamChange
      Items.Strings = (
        'Bancario Compra'
        'Bancario Venta'
        'Paralelo Compra'
        'Paralelo Venta'
        'Oco'#241'a Compra'
        'Oco'#241'a Venta'
        'Otros Compra'
        'Otros Venta')
    end
  end
  object dbgStockVal: TwwDBGrid
    Left = 0
    Top = 91
    Width = 688
    Height = 326
    DisableThemesInTitle = False
    Selected.Strings = (
      'CIAID'#9'2'#9'Compa'#241'ia'
      'STKANO'#9'4'#9'Peri'#243'do'
      'ALMID'#9'2'#9'Almacen'
      'LOCID'#9'2'#9'Localidad'
      'TINID'#9'2'#9'Tipo~Inventario'
      'GRARID'#9'15'#9'Grupo / Linea~Articulo'
      'FAMID'#9'3'#9'Familia~Articulo'
      'SFAMID'#9'8'#9'Sub Familia~Articulo'
      'ARTID'#9'15'#9'C'#243'digo~Articulo'
      'ARTDES'#9'40'#9'Articulo Descripci'#243'n'
      'STOCKG'#9'10'#9'Stock~General'
      'STOCKU'#9'10'#9'Stock~Unitario'
      'PRECIOG'#9'10'#9'Precio~General'
      'PRECIOU'#9'10'#9'Precio~Unitario'
      'IMPORTEG'#9'10'#9'Importe~General'
      'IMPORTEU'#9'10'#9'Importe~Unitario'
      'TOTALVAL'#9'10'#9'Total~Valorizaci'#243'n')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alTop
    DataSource = DM1.dsStockVal
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs]
    TabOrder = 1
    TitleAlignment = taCenter
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clNavy
    TitleFont.Height = -11
    TitleFont.Name = 'Comic Sans MS'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    Visible = False
  end
  object ppDBPStockVal: TppDBPipeline
    DataSource = DM1.dsStockVal
    UserName = 'DBPStockVal'
    Left = 616
    Top = 8
    object ppField1: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'STKANO'
      FieldName = 'STKANO'
      FieldLength = 4
      DisplayWidth = 4
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'ALMID'
      FieldName = 'ALMID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'LOCID'
      FieldName = 'LOCID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'TINID'
      FieldName = 'TINID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 4
    end
    object ppField6: TppField
      FieldAlias = 'GRARID'
      FieldName = 'GRARID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 5
    end
    object ppField7: TppField
      FieldAlias = 'FAMID'
      FieldName = 'FAMID'
      FieldLength = 3
      DisplayWidth = 3
      Position = 6
    end
    object ppField8: TppField
      FieldAlias = 'SFAMID'
      FieldName = 'SFAMID'
      FieldLength = 8
      DisplayWidth = 8
      Position = 7
    end
    object ppField9: TppField
      FieldAlias = 'ARTID'
      FieldName = 'ARTID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 8
    end
    object ppField10: TppField
      FieldAlias = 'ARTDES'
      FieldName = 'ARTDES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 9
    end
    object ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'STOCKG'
      FieldName = 'STOCKG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'STOCKU'
      FieldName = 'STOCKU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRECIOG'
      FieldName = 'PRECIOG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRECIOU'
      FieldName = 'PRECIOU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMPORTEG'
      FieldName = 'IMPORTEG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'IMPORTEU'
      FieldName = 'IMPORTEU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALVAL'
      FieldName = 'TOTALVAL'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 16
    end
    object ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'ARTCONT'
      FieldName = 'ARTCONT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppField19: TppField
      FieldAlias = 'UNMIDG'
      FieldName = 'UNMIDG'
      FieldLength = 2
      DisplayWidth = 2
      Position = 18
    end
    object ppField20: TppField
      FieldAlias = 'UNMIDU'
      FieldName = 'UNMIDU'
      FieldLength = 2
      DisplayWidth = 2
      Position = 19
    end
    object ppField21: TppField
      FieldAlias = 'FABID'
      FieldName = 'FABID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 20
    end
    object ppField22: TppField
      FieldAlias = 'ARTSPRO'
      FieldName = 'ARTSPRO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 21
    end
    object ppField23: TppField
      FieldAlias = 'ARTSCA'
      FieldName = 'ARTSCA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 22
    end
    object ppField24: TppField
      FieldAlias = 'ARTPARA'
      FieldName = 'ARTPARA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 23
    end
    object ppField25: TppField
      FieldAlias = 'ARTSNA'
      FieldName = 'ARTSNA'
      FieldLength = 20
      DisplayWidth = 20
      Position = 24
    end
    object ppField26: TppField
      FieldAlias = 'ARTFUC'
      FieldName = 'ARTFUC'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 25
    end
    object ppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'ARTCRGO'
      FieldName = 'ARTCRGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object ppField28: TppField
      FieldAlias = 'ARTACTIVO'
      FieldName = 'ARTACTIVO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 27
    end
    object ppField29: TppField
      FieldAlias = 'CUENTAID'
      FieldName = 'CUENTAID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 28
    end
    object ppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSANTG'
      FieldName = 'STKSANTG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object ppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSANTU'
      FieldName = 'STKSANTU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object ppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKMANTG'
      FieldName = 'STKMANTG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object ppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKMANTU'
      FieldName = 'STKMANTU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object ppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKISG01'
      FieldName = 'STKISG01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object ppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKISU01'
      FieldName = 'STKISU01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object ppField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKIMG01'
      FieldName = 'STKIMG01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object ppField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKIMU01'
      FieldName = 'STKIMU01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 36
    end
    object ppField38: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSSG01'
      FieldName = 'STKSSG01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 37
    end
    object ppField39: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSSU01'
      FieldName = 'STKSSU01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 38
    end
    object ppField40: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMG01'
      FieldName = 'STKSMG01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 39
    end
    object ppField41: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMU01'
      FieldName = 'STKSMU01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 40
    end
    object ppField42: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKISG02'
      FieldName = 'STKISG02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 41
    end
    object ppField43: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKISU02'
      FieldName = 'STKISU02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 42
    end
    object ppField44: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKIMG02'
      FieldName = 'STKIMG02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 43
    end
    object ppField45: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKIMU02'
      FieldName = 'STKIMU02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 44
    end
    object ppField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSSG02'
      FieldName = 'STKSSG02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 45
    end
    object ppField47: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSSU02'
      FieldName = 'STKSSU02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 46
    end
    object ppField48: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMG02'
      FieldName = 'STKSMG02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 47
    end
    object ppField49: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMU02'
      FieldName = 'STKSMU02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 48
    end
    object ppField50: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKISG03'
      FieldName = 'STKISG03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 49
    end
    object ppField51: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKISU03'
      FieldName = 'STKISU03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 50
    end
    object ppField52: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKIMG03'
      FieldName = 'STKIMG03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 51
    end
    object ppField53: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKIMU03'
      FieldName = 'STKIMU03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 52
    end
    object ppField54: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSSG03'
      FieldName = 'STKSSG03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 53
    end
    object ppField55: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSSU03'
      FieldName = 'STKSSU03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 54
    end
    object ppField56: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMG03'
      FieldName = 'STKSMG03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 55
    end
    object ppField57: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMU03'
      FieldName = 'STKSMU03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 56
    end
    object ppField58: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKISG04'
      FieldName = 'STKISG04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 57
    end
    object ppField59: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKISU04'
      FieldName = 'STKISU04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 58
    end
    object ppField60: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKIMG04'
      FieldName = 'STKIMG04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 59
    end
    object ppField61: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKIMU04'
      FieldName = 'STKIMU04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 60
    end
    object ppField62: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSSG04'
      FieldName = 'STKSSG04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 61
    end
    object ppField63: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSSU04'
      FieldName = 'STKSSU04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 62
    end
    object ppField64: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMG04'
      FieldName = 'STKSMG04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 63
    end
    object ppField65: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMU04'
      FieldName = 'STKSMU04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 64
    end
    object ppField66: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKISG05'
      FieldName = 'STKISG05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 65
    end
    object ppField67: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKISU05'
      FieldName = 'STKISU05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 66
    end
    object ppField68: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKIMG05'
      FieldName = 'STKIMG05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 67
    end
    object ppField69: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKIMU05'
      FieldName = 'STKIMU05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 68
    end
    object ppField70: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSSG05'
      FieldName = 'STKSSG05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 69
    end
    object ppField71: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSSU05'
      FieldName = 'STKSSU05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 70
    end
    object ppField72: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMG05'
      FieldName = 'STKSMG05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 71
    end
    object ppField73: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMU05'
      FieldName = 'STKSMU05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 72
    end
    object ppField74: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKISG06'
      FieldName = 'STKISG06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 73
    end
    object ppField75: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKISU06'
      FieldName = 'STKISU06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 74
    end
    object ppField76: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKIMG06'
      FieldName = 'STKIMG06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 75
    end
    object ppField77: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKIMU06'
      FieldName = 'STKIMU06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 76
    end
    object ppField78: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSSG06'
      FieldName = 'STKSSG06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 77
    end
    object ppField79: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSSU06'
      FieldName = 'STKSSU06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 78
    end
    object ppField80: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMG06'
      FieldName = 'STKSMG06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 79
    end
    object ppField81: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMU06'
      FieldName = 'STKSMU06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 80
    end
    object ppField82: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKISG07'
      FieldName = 'STKISG07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 81
    end
    object ppField83: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKISU07'
      FieldName = 'STKISU07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 82
    end
    object ppField84: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKIMG07'
      FieldName = 'STKIMG07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 83
    end
    object ppField85: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKIMU07'
      FieldName = 'STKIMU07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 84
    end
    object ppField86: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSSG07'
      FieldName = 'STKSSG07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 85
    end
    object ppField87: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSSU07'
      FieldName = 'STKSSU07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 86
    end
    object ppField88: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMG07'
      FieldName = 'STKSMG07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 87
    end
    object ppField89: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMU07'
      FieldName = 'STKSMU07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 88
    end
    object ppField90: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKISG08'
      FieldName = 'STKISG08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 89
    end
    object ppField91: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKISU08'
      FieldName = 'STKISU08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 90
    end
    object ppField92: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKIMG08'
      FieldName = 'STKIMG08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 91
    end
    object ppField93: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKIMU08'
      FieldName = 'STKIMU08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 92
    end
    object ppField94: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSSG08'
      FieldName = 'STKSSG08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 93
    end
    object ppField95: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSSU08'
      FieldName = 'STKSSU08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 94
    end
    object ppField96: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMG08'
      FieldName = 'STKSMG08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 95
    end
    object ppField97: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMU08'
      FieldName = 'STKSMU08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 96
    end
    object ppField98: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKISG09'
      FieldName = 'STKISG09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 97
    end
    object ppField99: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKISU09'
      FieldName = 'STKISU09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 98
    end
    object ppField100: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKIMG09'
      FieldName = 'STKIMG09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 99
    end
    object ppField101: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKIMU09'
      FieldName = 'STKIMU09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 100
    end
    object ppField102: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSSG09'
      FieldName = 'STKSSG09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 101
    end
    object ppField103: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSSU09'
      FieldName = 'STKSSU09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 102
    end
    object ppField104: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMG09'
      FieldName = 'STKSMG09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 103
    end
    object ppField105: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMU09'
      FieldName = 'STKSMU09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 104
    end
    object ppField106: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKISG10'
      FieldName = 'STKISG10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 105
    end
    object ppField107: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKISU10'
      FieldName = 'STKISU10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 106
    end
    object ppField108: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKIMG10'
      FieldName = 'STKIMG10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 107
    end
    object ppField109: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKIMU10'
      FieldName = 'STKIMU10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 108
    end
    object ppField110: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSSG10'
      FieldName = 'STKSSG10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 109
    end
    object ppField111: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSSU10'
      FieldName = 'STKSSU10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 110
    end
    object ppField112: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMG10'
      FieldName = 'STKSMG10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 111
    end
    object ppField113: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMU10'
      FieldName = 'STKSMU10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 112
    end
    object ppField114: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKISG11'
      FieldName = 'STKISG11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 113
    end
    object ppField115: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKISU11'
      FieldName = 'STKISU11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 114
    end
    object ppField116: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKIMG11'
      FieldName = 'STKIMG11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 115
    end
    object ppField117: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKIMU11'
      FieldName = 'STKIMU11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 116
    end
    object ppField118: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSSG11'
      FieldName = 'STKSSG11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 117
    end
    object ppField119: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSSU11'
      FieldName = 'STKSSU11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 118
    end
    object ppField120: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMG11'
      FieldName = 'STKSMG11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 119
    end
    object ppField121: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMU11'
      FieldName = 'STKSMU11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 120
    end
    object ppField122: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKISG12'
      FieldName = 'STKISG12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 121
    end
    object ppField123: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKISU12'
      FieldName = 'STKISU12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 122
    end
    object ppField124: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKIMG12'
      FieldName = 'STKIMG12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 123
    end
    object ppField125: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKIMU12'
      FieldName = 'STKIMU12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 124
    end
    object ppField126: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSSG12'
      FieldName = 'STKSSG12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 125
    end
    object ppField127: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSSU12'
      FieldName = 'STKSSU12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 126
    end
    object ppField128: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMG12'
      FieldName = 'STKSMG12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 127
    end
    object ppField129: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMU12'
      FieldName = 'STKSMU12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 128
    end
    object ppField130: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSACTG'
      FieldName = 'STKSACTG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 129
    end
    object ppField131: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSACTU'
      FieldName = 'STKSACTU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 130
    end
    object ppField132: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKMACTG'
      FieldName = 'STKMACTG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 131
    end
    object ppField133: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKMACTU'
      FieldName = 'STKMACTU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 132
    end
    object ppField134: TppField
      FieldAlias = 'UBID'
      FieldName = 'UBID'
      FieldLength = 4
      DisplayWidth = 4
      Position = 133
    end
    object ppField135: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSFISG'
      FieldName = 'STKSFISG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 134
    end
    object ppField136: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSFISU'
      FieldName = 'STKSFISU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 135
    end
    object ppField137: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMAXG'
      FieldName = 'STKSMAXG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 136
    end
    object ppField138: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMING'
      FieldName = 'STKSMING'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 137
    end
    object ppField139: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMAXU'
      FieldName = 'STKSMAXU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 138
    end
    object ppField140: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSMINU'
      FieldName = 'STKSMINU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 139
    end
    object ppField141: TppField
      FieldAlias = 'TMONID'
      FieldName = 'TMONID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 140
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPStockVal
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Continuo USA est'#225'ndar: 310 x 280 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 378000
    PrinterSetup.PaperSize = 121
    Template.FileName = 'C:\SolAmacen\SOLFormatos\Containve.Rtm'
    Units = utMillimeters
    BeforePrint = ppReport1BeforePrint
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport1PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 648
    Top = 8
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPStockVal'
    object ppHeaderBand1: TppHeaderBand
      BeforePrint = ppHeaderBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 31485
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CIAID'
        DataPipeline = ppDBPStockVal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'ppDBPStockVal'
        mmHeight = 4233
        mmLeft = 3175
        mmTop = 6879
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'STKANO'
        DataPipeline = ppDBPStockVal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPStockVal'
        mmHeight = 4233
        mmLeft = 19844
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Almac'#233'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3175
        mmTop = 25665
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Articulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 21431
        mmTop = 25665
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Descripci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 44450
        mmTop = 25665
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Precio General'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 148696
        mmTop = 21431
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Precio Unitario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 169863
        mmTop = 21431
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Stock General'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 191559
        mmTop = 21431
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Stock Unitario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 212725
        mmTop = 21431
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Importe General'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 234421
        mmTop = 21431
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Importe Unitario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 255059
        mmTop = 21431
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Total Valorizaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 273844
        mmTop = 21431
        mmWidth = 21167
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 3
        Weight = 2.250000000000000000
        mmHeight = 1000
        mmLeft = 3175
        mmTop = 30427
        mmWidth = 292630
        BandType = 0
      end
      object ppLblTit1: TppLabel
        UserName = 'LblTit1'
        Caption = 'Contabilidad de Inventarios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 106892
        mmTop = 3440
        mmWidth = 55298
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Peri'#243'do : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3175
        mmTop = 17463
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Compa'#241'ia : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3175
        mmTop = 11642
        mmWidth = 20373
        BandType = 0
      end
      object ppLblTit2: TppLabel
        UserName = 'LblTit2'
        Caption = 'Valorizaci'#243'n en '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 106892
        mmTop = 9790
        mmWidth = 32279
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = '.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 24606
        mmTop = 11642
        mmWidth = 1058
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'ALMID'
        DataPipeline = ppDBPStockVal
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPStockVal'
        mmHeight = 3704
        mmLeft = 5821
        mmTop = 529
        mmWidth = 6085
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'ARTID'
        DataPipeline = ppDBPStockVal
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPStockVal'
        mmHeight = 3704
        mmLeft = 21696
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'ARTDES'
        DataPipeline = ppDBPStockVal
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPStockVal'
        mmHeight = 3704
        mmLeft = 44715
        mmTop = 529
        mmWidth = 96309
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'PRECIOG'
        DataPipeline = ppDBPStockVal
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPStockVal'
        mmHeight = 3704
        mmLeft = 144463
        mmTop = 529
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'PRECIOU'
        DataPipeline = ppDBPStockVal
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPStockVal'
        mmHeight = 3704
        mmLeft = 166159
        mmTop = 529
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'STOCKG'
        DataPipeline = ppDBPStockVal
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPStockVal'
        mmHeight = 3704
        mmLeft = 187855
        mmTop = 529
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'STOCKU'
        DataPipeline = ppDBPStockVal
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPStockVal'
        mmHeight = 3704
        mmLeft = 209550
        mmTop = 529
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'IMPORTEG'
        DataPipeline = ppDBPStockVal
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPStockVal'
        mmHeight = 3704
        mmLeft = 231246
        mmTop = 529
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'IMPORTEU'
        DataPipeline = ppDBPStockVal
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPStockVal'
        mmHeight = 3704
        mmLeft = 252942
        mmTop = 529
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'TOTALVAL'
        DataPipeline = ppDBPStockVal
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPStockVal'
        mmHeight = 3704
        mmLeft = 274903
        mmTop = 529
        mmWidth = 21167
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object pplbltotal: TppLabel
        UserName = 'lbltotal'
        AutoSize = False
        Caption = 'lbltotal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 269346
        mmTop = 1588
        mmWidth = 26988
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Color = clWindowText
        Pen.Width = 3
        Weight = 2.250000000000000000
        mmHeight = 1058
        mmLeft = 269082
        mmTop = 265
        mmWidth = 27252
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Pen.Color = clWindowText
        Pen.Width = 3
        Weight = 2.250000000000000000
        mmHeight = 1058
        mmLeft = 269082
        mmTop = 6085
        mmWidth = 27517
        BandType = 7
      end
    end
  end
end
