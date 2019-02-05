object FGenAsi: TFGenAsi
  Left = 196
  Top = 41
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Generaci'#243'n de Asientos'
  ClientHeight = 507
  ClientWidth = 431
  Color = 12904163
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 15
  object pnlCabecera: TPanel
    Left = 0
    Top = 0
    Width = 431
    Height = 180
    Align = alTop
    Color = 10207162
    TabOrder = 0
    object Label8: TLabel
      Left = 8
      Top = 8
      Width = 102
      Height = 13
      AutoSize = False
      Caption = 'Compa'#241'ia'
      Color = 10207162
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
    end
    object lblTipComp: TLabel
      Left = 8
      Top = 60
      Width = 102
      Height = 13
      AutoSize = False
      Caption = 'Tipo de Diario'
      Color = 10207162
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
    end
    object Label1: TLabel
      Left = 227
      Top = 47
      Width = 96
      Height = 15
      Caption = 'Periodo a Procesar'
      Transparent = True
    end
    object Label2: TLabel
      Left = 234
      Top = 60
      Width = 21
      Height = 15
      Caption = 'Mes'
      Transparent = True
    end
    object Label3: TLabel
      Left = 282
      Top = 60
      Width = 20
      Height = 15
      Caption = 'A'#241'o'
      Transparent = True
    end
    object Label4: TLabel
      Left = 330
      Top = 43
      Width = 66
      Height = 30
      Alignment = taCenter
      Caption = 'Fecha Comprobante'
      WordWrap = True
    end
    object lblCambio: TLabel
      Left = 351
      Top = 102
      Width = 37
      Height = 15
      Caption = 'Cambio'
    end
    object lblTipCam: TLabel
      Left = 231
      Top = 102
      Width = 78
      Height = 15
      Alignment = taCenter
      Caption = 'Tipo de Cambio'
    end
    object Label5: TLabel
      Left = 8
      Top = 102
      Width = 102
      Height = 13
      AutoSize = False
      Caption = 'Moneda'
      Color = 10207162
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
    end
    object dblcCia: TwwDBLookupCombo
      Left = 8
      Top = 22
      Width = 44
      Height = 21
      AutoSize = False
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'C'#243'digo'#9'F'
        'CIAABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'CIAID'
      LookupTable = DMALM.cdsCIA
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      AutoSelect = False
      Enabled = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcCiaChange
      OnExit = dblcCiaExit
      OnNotInList = dblcNotInList
    end
    object dbeCia: TwwDBEdit
      Left = 55
      Top = 22
      Width = 210
      Height = 23
      Enabled = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcTipDir: TwwDBLookupCombo
      Left = 8
      Top = 74
      Width = 44
      Height = 21
      AutoSize = False
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TRIID'#9'2'#9'Codigo'#9'F'
        'TRIABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'TDIARID'
      LookupTable = DMALM.cdsTRAN
      LookupField = 'TRIID'
      Options = [loColLines, loRowLines, loTitles]
      AutoSelect = False
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcTipDirChange
      OnExit = dblcTipDirExit
      OnNotInList = dblcNotInList
    end
    object dbeTipComp: TwwDBEdit
      Left = 56
      Top = 74
      Width = 149
      Height = 23
      DataField = 'TDIARDES'
      Enabled = False
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbseMes: TwwDBSpinEdit
      Left = 226
      Top = 74
      Width = 41
      Height = 21
      Increment = 1.000000000000000000
      MaxValue = 12.000000000000000000
      MinValue = 1.000000000000000000
      Value = 1.000000000000000000
      AutoFillDate = False
      AutoSelect = False
      AutoSize = False
      DataField = 'CNTANOMM'
      TabOrder = 4
      UnboundDataType = wwDefault
    end
    object dbseAnio: TwwDBSpinEdit
      Left = 274
      Top = 74
      Width = 49
      Height = 21
      EditorEnabled = False
      Increment = 1.000000000000000000
      MaxValue = 2050.000000000000000000
      MinValue = 1990.000000000000000000
      Value = 1990.000000000000000000
      AutoFillDate = False
      AutoSelect = False
      AutoSize = False
      DataField = 'CNTANO'
      MaxLength = 4
      TabOrder = 5
      UnboundDataType = wwDefault
    end
    object dtpFCambio: TDateTimePicker
      Left = 329
      Top = 74
      Width = 94
      Height = 23
      Date = 0.701918518498132000
      Time = 0.701918518498132000
      TabOrder = 6
      OnChange = dtpFCambioChange
      OnExit = dtpFCambioExit
    end
    object dbeTipCam: TwwDBEdit
      Left = 351
      Top = 117
      Width = 65
      Height = 23
      DataField = 'CNTTCAMBIO'
      Enabled = False
      ReadOnly = True
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object cbItemTCam: TComboBox
      Left = 231
      Top = 117
      Width = 108
      Height = 23
      ItemHeight = 15
      TabOrder = 8
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
    object dbeMoneda: TwwDBEdit
      Left = 56
      Top = 116
      Width = 168
      Height = 23
      Enabled = False
      TabOrder = 9
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcMoneda: TwwDBLookupCombo
      Left = 8
      Top = 116
      Width = 44
      Height = 21
      AutoSize = False
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TMONID'#9'3'#9'C'#243'digo'#9'F'
        'TMONDES'#9'30'#9'Descripci'#243'n'#9'F')
      LookupTable = DMALM.cdsTMoneda
      LookupField = 'TMONID'
      Options = [loColLines, loRowLines, loTitles]
      AutoSelect = False
      TabOrder = 10
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcMonedaExit
      OnNotInList = dblcNotInList
    end
    object bbGenera: TBitBtn
      Left = 359
      Top = 153
      Width = 33
      Height = 25
      Hint = 'Genera el Asiento'
      Default = True
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = bbGeneraClick
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
    object bbCierra: TBitBtn
      Left = 396
      Top = 151
      Width = 32
      Height = 25
      Hint = 'Cierra Generaci'#243'n de Asientos'
      Cancel = True
      TabOrder = 12
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object pnlDetalle: TPanel
    Left = 0
    Top = 180
    Width = 431
    Height = 327
    Align = alTop
    BevelInner = bvRaised
    Color = 10207162
    Enabled = False
    TabOrder = 1
    object Label6: TLabel
      Left = 14
      Top = 5
      Width = 102
      Height = 13
      AutoSize = False
      Caption = 'Asientos por Entradas'
      Color = 10207162
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
    end
    object Label7: TLabel
      Left = 14
      Top = 146
      Width = 102
      Height = 13
      AutoSize = False
      Caption = 'Asientos por Salidas'
      Color = 10207162
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
    end
    object dbgAsientoE: TwwDBGrid
      Left = 14
      Top = 20
      Width = 395
      Height = 120
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = 11974251
      FixedCols = 0
      ShowHorzScrollBar = True
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
    end
    object dbgAsientoS: TwwDBGrid
      Left = 14
      Top = 164
      Width = 395
      Height = 120
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = 11974251
      FixedCols = 0
      ShowHorzScrollBar = True
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
    end
    object bbGraba: TBitBtn
      Left = 332
      Top = 295
      Width = 33
      Height = 25
      Hint = 'Genera el Asiento'
      Default = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbGrabaClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
    end
    object bbModi: TBitBtn
      Left = 292
      Top = 295
      Width = 33
      Height = 25
      Hint = 'Cambia Datos de Cabecera'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = bbModiClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
        55555575555555775F55509999999901055557F55555557F75F5001111111101
        105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
        01105777F555557F7FF75500FFFFFF0F00105577F555FF7F77575550FF70000F
        0F0055575FF777757F775555000FFFFF0F005555777555FF7F77555550FF7000
        0F055555575FF777757F555555000FFFFF05555555777555FF7F55555550FF70
        0005555555575FF7777555555555000555555555555577755555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
    end
    object bbsalir: TBitBtn
      Left = 372
      Top = 295
      Width = 33
      Height = 25
      Hint = 'Cierra la Generaci'#243'n de Asientos'
      Default = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = bbsalirClick
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
  end
end
