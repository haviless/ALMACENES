object FGenAsiAlm: TFGenAsiAlm
  Left = 245
  Top = 113
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Generaci'#243'n de Asientos'
  ClientHeight = 535
  ClientWidth = 707
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
    Width = 707
    Height = 197
    Align = alTop
    Color = 10207162
    TabOrder = 0
    object Label8: TLabel
      Left = 16
      Top = 7
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
    object Label1: TLabel
      Left = 16
      Top = 89
      Width = 96
      Height = 15
      Caption = 'Periodo a Procesar'
      Transparent = True
    end
    object Label2: TLabel
      Left = 26
      Top = 102
      Width = 21
      Height = 15
      Caption = 'Mes'
      Transparent = True
    end
    object Label3: TLabel
      Left = 74
      Top = 102
      Width = 20
      Height = 15
      Caption = 'A'#241'o'
      Transparent = True
    end
    object Label4: TLabel
      Left = 123
      Top = 86
      Width = 66
      Height = 30
      Alignment = taCenter
      Caption = 'Fecha Comprobante'
      WordWrap = True
    end
    object lblCambio: TLabel
      Left = 143
      Top = 143
      Width = 37
      Height = 15
      Caption = 'Cambio'
    end
    object lblTipCam: TLabel
      Left = 16
      Top = 143
      Width = 78
      Height = 15
      Alignment = taCenter
      Caption = 'Tipo de Cambio'
    end
    object Label5: TLabel
      Left = 224
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
    object Label9: TLabel
      Left = 364
      Top = 7
      Width = 102
      Height = 13
      AutoSize = False
      Caption = 'Localidad'
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
    object Label10: TLabel
      Left = 16
      Top = 46
      Width = 102
      Height = 13
      AutoSize = False
      Caption = 'T. Inventario'
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
    object Label11: TLabel
      Left = 364
      Top = 46
      Width = 102
      Height = 13
      AutoSize = False
      Caption = 'Almac'#233'n'
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
      Left = 16
      Top = 22
      Width = 44
      Height = 23
      AutoSize = False
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Compa'#241'ia'#9'F'
        'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
        'CIAABR'#9'15'#9'Abreviatura'#9'F')
      LookupTable = DMALM.cdsCIA
      LookupField = 'CIAID'
      Options = [loColLines, loTitles]
      AutoSelect = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcCiaExit
      OnNotInList = dblcNotInList
    end
    object dbseMes: TwwDBSpinEdit
      Left = 16
      Top = 117
      Width = 41
      Height = 22
      Increment = 1.000000000000000000
      MaxValue = 12.000000000000000000
      MinValue = 1.000000000000000000
      Value = 1.000000000000000000
      AutoFillDate = False
      AutoSelect = False
      AutoSize = False
      DataField = 'CNTANOMM'
      TabOrder = 8
      UnboundDataType = wwDefault
    end
    object dbseAnio: TwwDBSpinEdit
      Left = 66
      Top = 117
      Width = 49
      Height = 22
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
      TabOrder = 9
      UnboundDataType = wwDefault
    end
    object dtpFCambio: TDateTimePicker
      Left = 121
      Top = 117
      Width = 95
      Height = 22
      Date = 0.701918518498132000
      Time = 0.701918518498132000
      TabOrder = 10
      OnChange = dtpFCambioChange
      OnExit = dtpFCambioExit
    end
    object dbeTipCam: TwwDBEdit
      Left = 136
      Top = 160
      Width = 65
      Height = 23
      DataField = 'CNTTCAMBIO'
      Enabled = False
      ReadOnly = True
      TabOrder = 14
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object cbItemTCam: TComboBox
      Left = 16
      Top = 160
      Width = 108
      Height = 23
      ItemHeight = 15
      TabOrder = 13
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
      Left = 272
      Top = 117
      Width = 241
      Height = 23
      Enabled = False
      TabOrder = 11
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcMoneda: TwwDBLookupCombo
      Left = 224
      Top = 117
      Width = 44
      Height = 22
      AutoSize = False
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TMONID'#9'3'#9'C'#243'digo'#9'F'
        'TMONDES'#9'30'#9'Descripci'#243'n'#9'F')
      LookupTable = DMALM.cdsTMoneda
      LookupField = 'TMONID'
      Options = [loColLines, loRowLines, loTitles]
      AutoSelect = False
      TabOrder = 12
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcMonedaExit
      OnNotInList = dblcNotInList
    end
    object bbGenera: TBitBtn
      Left = 563
      Top = 161
      Width = 38
      Height = 26
      Hint = 'Genera el Asiento'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
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
      Left = 610
      Top = 161
      Width = 38
      Height = 26
      Hint = 'Cierra Generaci'#243'n de Asientos'
      Cancel = True
      TabOrder = 16
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
    object dblcLOC: TwwDBLookupCombo
      Left = 362
      Top = 22
      Width = 44
      Height = 23
      AutoSize = False
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'LOCID'#9'2'#9'Localidad'#9'F'
        'LOCDES'#9'30'#9'Descripci'#243'n'#9'F'
        'LOCABR'#9'10'#9'Abreviatura'#9'F')
      LookupTable = DMALM.cdsLOC
      LookupField = 'LOCID'
      Options = [loColLines, loTitles]
      AutoSelect = False
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcLOCExit
      OnNotInList = dblcNotInList
    end
    object dbeCIA: TEdit
      Left = 67
      Top = 22
      Width = 260
      Height = 23
      Enabled = False
      TabOrder = 1
    end
    object dbeLOC: TEdit
      Left = 413
      Top = 22
      Width = 260
      Height = 23
      Enabled = False
      TabOrder = 3
    end
    object dblcTInv: TwwDBLookupCombo
      Left = 16
      Top = 61
      Width = 44
      Height = 23
      AutoSize = False
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TINID'#9'2'#9'Inventario'#9'F'
        'TINDES'#9'40'#9'Descripci'#243'n'#9'F'
        'TINABR'#9'15'#9'Abreviatura'#9'F')
      LookupTable = DMALM.cdsTINID
      LookupField = 'TINID'
      Options = [loColLines, loTitles]
      AutoSelect = False
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcTInvExit
      OnNotInList = dblcNotInList
    end
    object dbeTInv: TEdit
      Left = 67
      Top = 61
      Width = 260
      Height = 23
      Enabled = False
      TabOrder = 5
    end
    object dblcAlm: TwwDBLookupCombo
      Left = 362
      Top = 61
      Width = 44
      Height = 23
      AutoSize = False
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'ALMID'#9'2'#9'Almac'#233'n'#9'F'
        'ALMDES'#9'40'#9'Descripci'#243'n'#9'F'
        'ALMABR'#9'15'#9'Abreviatura'#9'F')
      LookupTable = DMALM.cdsALM
      LookupField = 'ALMID'
      Options = [loColLines, loTitles]
      AutoSelect = False
      TabOrder = 6
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcAlmExit
      OnNotInList = dblcNotInList
    end
    object dbeAlm: TEdit
      Left = 413
      Top = 61
      Width = 260
      Height = 23
      Enabled = False
      TabOrder = 7
    end
  end
  object pnlDetalle: TPanel
    Left = 0
    Top = 201
    Width = 707
    Height = 334
    Align = alBottom
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
      Caption = 'Asientos'
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
    object dbgAsientoS: TwwDBGrid
      Left = 7
      Top = 24
      Width = 690
      Height = 245
      DisableThemesInTitle = False
      Selected.Strings = (
        'CIAID'#9'2'#9'CIAID'
        'LOCID'#9'2'#9'LOCID'
        'TINID'#9'2'#9'TINID'
        'ALMID'#9'2'#9'ALMID'
        'GRARID'#9'15'#9'GRARID'
        'CUENTAID'#9'20'#9'CUENTAID'
        'CCOSID'#9'15'#9'CCOSID'
        'DEBES'#9'10'#9'DEBES'
        'DEBED'#9'10'#9'DEBED'
        'HABERS'#9'10'#9'HABERS'
        'HABERD'#9'10'#9'HABERD'
        'CCOSDES'#9'40'#9'CCOSDES')
      IniAttributes.Delimiter = ';;'
      TitleColor = 11974251
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DMALM.dsTGE
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
    object bbGraba: TBitBtn
      Left = 509
      Top = 285
      Width = 40
      Height = 34
      Hint = 'Genera el Asiento'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bbGrabaClick
      Glyph.Data = {
        F6020000424DF602000000000000760000002800000021000000200000000100
        04000000000080020000CE0E0000D80E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888880000000888888888888888888888888888888888000
        0000888888888888888888888888888888888000000080000000000000000000
        000000000000800000000000000000000000000000000000000000000000000F
        0F0F0F0F0F0F0F0F0F0F0F0FF0000000000000F0F0F0F0F0F0F0F0F0F0F0F0F0
        0F000000000000FF00000000000000000000000000F00000000000FF00000000
        00000000000000000F000000000000FF00000000BBBBBBBBBBBBB00000F00000
        000000FF0000000000000000000000000F000000000000FF0000000000000000
        0000000000F00000000000FF0000BBBBBBBBBBBBBBBBBBBB0F000000000000FF
        00000000000000000000000000F00000000000FF000000000000000000000000
        0F000000000000FF0BBBB0BBB00B0B0B0BBB0BBB00F00000000000FF0B00B0B0
        B00B0B0B0B0B0B0B0F000000000000FF0B00B0B0B00B0B0B0BBB0B0B00F00000
        000000FF0B0000B0B00B0B0B000B0B0B0F000000000000FF0B0000BBB0BBBB0B
        0BBB0BBB00F00000000000FF0B000000000000BBB0000B000F000000000000FF
        0B00B0000000000B00000B0000F00000000000FF0BBBB0000000000000000000
        0F000000000000FF00000000000000000000000000F00000000000FF00000000
        00000000000000000F000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000
        0000000FFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000
        0000000000000000000080000000000000000000000000000000800000008888
        8888888888888888888888888888800000008888888888888888888888888888
        8888800000008888888888888888888888888888888880000000}
    end
    object bbModi: TBitBtn
      Left = 453
      Top = 285
      Width = 40
      Height = 34
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
      TabOrder = 2
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
      Left = 622
      Top = 285
      Width = 40
      Height = 34
      Hint = 'Cierra la Generaci'#243'n de Asientos'
      Default = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
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
    object Z1sbCCosto: TBitBtn
      Left = 566
      Top = 285
      Width = 40
      Height = 34
      Hint = 'Asiento Contable de Almac'#233'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = Z1sbCCostoClick
      Glyph.Data = {
        CE020000424DCE020000000000007600000028000000220000001E0000000100
        0400000000005802000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFF0078800FFFFFFFFFFFFFFFF000000FFFFFFFFF00777888800
        FFFFFFFFFFFFFF000000FFFFFFF007777800888800FFFFFFFFFFFF000000FFFF
        F0077778878800888800FFFFFFFFFF000000FFF00777788787888800888800FF
        FFFFFF000000FF07777887778788888800888800FFFFFF000000FF8778877777
        87888888880088880FFFFF000000FF888777777787888888888800880FFFFF00
        0000F8878777777787888888888888000FFFFF000000F8F7877777778F888888
        8888888800FFFF000000F8F78777777F8877888888888888800FFF000000F8F7
        87777FF777887788888888888080FF000000F8F7877FF7777777887788888888
        80780F000000F8F78FF77799778877887788888880788F000000F8FF8877AA77
        8877777088778888808FFF000000F88F778877887777700F7088778880FFFF00
        0000FFF88F77888877700FFFF077887780FFFF000000FFFFF88F7788800FFFCC
        F7087788FFFFFF000000FFFFFFF88F7788FFCCFFFF0888FFFFFFFF000000FFFF
        FFFFF88F778FFFFCCF70FFFFFFFFFF000000FFFFFFFFFFF88F8FFCCFFFF70FFF
        FFFFFF000000FFFFFFFFFFFFF888FFFFCCFF70FFFFFFFF000000FFFFFFFFFFFF
        FFF8FFCCFFFFF70FFFFFFF000000FFFFFFFFFFFFFFFF8FFFFFCCFF700FFFFF00
        0000FFFFFFFFFFFFFFFFF8FFCCFFFFF88FFFFF000000FFFFFFFFFFFFFFFFFF8F
        FFFFF88FFFFFFF000000FFFFFFFFFFFFFFFFFFF8FFF88FFFFFFFFF000000FFFF
        FFFFFFFFFFFFFFFF888FFFFFFFFFFF000000}
    end
    object Z1sbAContable: TBitBtn
      Left = 42
      Top = 281
      Width = 40
      Height = 34
      Hint = 'Asiento Contable de Almac'#233'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = Z1sbAContableClick
      Glyph.Data = {
        CE020000424DCE020000000000007600000028000000220000001E0000000100
        0400000000005802000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFF0078800FFFFFFFFFFFFFFFF000000FFFFFFFFF00777888800
        FFFFFFFFFFFFFF000000FFFFFFF007777800888800FFFFFFFFFFFF000000FFFF
        F0077778878800888800FFFFFFFFFF000000FFF00777788787888800888800FF
        FFFFFF000000FF07777887778788888800888800FFFFFF000000FF8778877777
        87888888880088880FFFFF000000FF888777777787888888888800880FFFFF00
        0000F8878777777787888888888888000FFFFF000000F8F7877777778F888888
        8888888800FFFF000000F8F78777777F8877888888888888800FFF000000F8F7
        87777FF777887788888888888080FF000000F8F7877FF7777777887788888888
        80780F000000F8F78FF77799778877887788888880788F000000F8FF8877AA77
        8877777088778888808FFF000000F88F778877887777700F7088778880FFFF00
        0000FFF88F77888877700FFFF077887780FFFF000000FFFFF88F7788800FFFCC
        F7087788FFFFFF000000FFFFFFF88F7788FFCCFFFF0888FFFFFFFF000000FFFF
        FFFFF88F778FFFFCCF70FFFFFFFFFF000000FFFFFFFFFFF88F8FFCCFFFF70FFF
        FFFFFF000000FFFFFFFFFFFFF888FFFFCCFF70FFFFFFFF000000FFFFFFFFFFFF
        FFF8FFCCFFFFF70FFFFFFF000000FFFFFFFFFFFFFFFF8FFFFFCCFF700FFFFF00
        0000FFFFFFFFFFFFFFFFF8FFCCFFFFF88FFFFF000000FFFFFFFFFFFFFFFFFF8F
        FFFFF88FFFFFFF000000FFFFFFFFFFFFFFFFFFF8FFF88FFFFFFFFF000000FFFF
        FFFFFFFFFFFFFFFF888FFFFFFFFFFF000000}
    end
  end
  object pprAsientoCtbl: TppReport
    AutoStop = False
    DataPipeline = ppdbMovi
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rContabilizado'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\SOLExes\SOLFormatos\Alm\Incoresa\RptAsientoCtblAlm.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprAsientoCtblPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 165
    Top = 361
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbMovi'
    object ppHeaderBand2: TppHeaderBand
      BeforePrint = ppHeaderBand2BeforePrint
      mmBottomOffset = 0
      mmHeight = 69850
      mmPrintPosition = 0
      object ppLine15: TppLine
        UserName = 'Line15'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 0
        mmTop = 15610
        mmWidth = 197379
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 2646
        mmLeft = 0
        mmTop = 39158
        mmWidth = 197379
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 0
        mmTop = 58473
        mmWidth = 197379
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 0
        mmTop = 67469
        mmWidth = 197379
        BandType = 0
      end
      object ppShape8: TppShape
        UserName = 'Shape8'
        Brush.Style = bsClear
        ParentWidth = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 62706
        mmWidth = 197379
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Glosa :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 46567
        mmWidth = 8996
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 170657
        mmTop = 2910
        mmWidth = 14288
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 170657
        mmTop = 8996
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'T.Cambio:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 168275
        mmTop = 46567
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = ' Cuenta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 63765
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'DEBE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 164042
        mmTop = 63500
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'HABER'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 184415
        mmTop = 63500
        mmWidth = 9260
        BandType = 0
      end
      object lblGlosa: TppLabel
        UserName = 'lblGlosa'
        Caption = 'lblGlosa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 18521
        mmTop = 46567
        mmWidth = 11642
        BandType = 0
      end
      object lblTipoCamb: TppLabel
        UserName = 'lblTipoCamb'
        AutoSize = False
        Caption = 'lblTipoCamb'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 182563
        mmTop = 46567
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Moneda  :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 140229
        mmTop = 46567
        mmWidth = 12435
        BandType = 0
      end
      object lblmoneda: TppLabel
        UserName = 'lblmoneda'
        AutoSize = False
        Caption = 'lblmoneda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 153194
        mmTop = 46567
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'Almacen'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 1852
        mmTop = 8996
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Descripci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 41540
        mmTop = 63765
        mmWidth = 15081
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 19315
        mmLeft = 0
        mmTop = 39158
        mmWidth = 3969
        BandType = 0
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 19579
        mmLeft = 194205
        mmTop = 39158
        mmWidth = 3175
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CIADES'
        DataPipeline = ppdbMovi
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbMovi'
        mmHeight = 5821
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 73819
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'C. Costo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 116681
        mmTop = 64029
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 78846
        mmTop = 19579
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'No.Comprobante'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 98690
        mmTop = 19579
        mmWidth = 24606
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Diario'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 19579
        mmWidth = 8202
        BandType = 0
      end
      object lblPeriodo: TppLabel
        UserName = 'lblPeriodo'
        Caption = 'lblPeriodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 78846
        mmTop = 25135
        mmWidth = 12171
        BandType = 0
      end
      object lblDiario: TppLabel
        UserName = 'lblDiario'
        AutoSize = False
        Caption = 'este es el diari'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10054
        mmTop = 25135
        mmWidth = 59796
        BandType = 0
      end
      object lblNoComp: TppLabel
        UserName = 'lblNoComp'
        Caption = 'lblNoComp'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 98690
        mmTop = 25135
        mmWidth = 13229
        BandType = 0
      end
      object lblTD: TppLabel
        UserName = 'lblTD'
        Caption = 'lblTD'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 25135
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Importe'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 155575
        mmTop = 21696
        mmWidth = 9260
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 10848
        mmLeft = 134938
        mmTop = 27781
        mmWidth = 56886
        BandType = 0
      end
      object lblImporte: TppLabel
        UserName = 'Label101'
        Caption = '0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5821
        mmLeft = 180711
        mmTop = 31485
        mmWidth = 10054
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 3704
        mmLeft = 174625
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 3704
        mmLeft = 150813
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'CUENTAID'
        DataPipeline = ppdbMovi
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbMovi'
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 0
        mmWidth = 35190
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'DEBES'
        DataPipeline = ppdbMovi
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbMovi'
        mmHeight = 3704
        mmLeft = 153988
        mmTop = 0
        mmWidth = 19000
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentHeight = True
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 3704
        mmLeft = 196850
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'HABERS'
        DataPipeline = ppdbMovi
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbMovi'
        mmHeight = 3704
        mmLeft = 176742
        mmTop = 0
        mmWidth = 19000
        BandType = 4
      end
      object pptDesc: TppDBText
        UserName = 'tDesc'
        DataField = 'CCOSDES'
        DataPipeline = ppdbMovi
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbMovi'
        mmHeight = 3704
        mmLeft = 41804
        mmTop = 0
        mmWidth = 71702
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CCOSID'
        DataPipeline = ppdbMovi
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbMovi'
        mmHeight = 3704
        mmLeft = 117211
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 34131
      mmPrintPosition = 0
      object ppShape10: TppShape
        UserName = 'Shape10'
        mmHeight = 7938
        mmLeft = 0
        mmTop = 0
        mmWidth = 197380
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        AutoSize = True
        DataField = 'DEBES'
        DataPipeline = ppdbMovi
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbMovi'
        mmHeight = 3704
        mmLeft = 155046
        mmTop = 2381
        mmWidth = 17992
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        AutoSize = True
        DataField = 'HABERS'
        DataPipeline = ppdbMovi
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbMovi'
        mmHeight = 3704
        mmLeft = 175419
        mmTop = 2381
        mmWidth = 20373
        BandType = 7
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Almac'#233'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 11377
        mmTop = 29898
        mmWidth = 11113
        BandType = 7
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Contabilidad'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 39688
        mmTop = 29898
        mmWidth = 15346
        BandType = 7
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'G.Financiera'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 72496
        mmTop = 29898
        mmWidth = 16140
        BandType = 7
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'G.General'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 106627
        mmTop = 29898
        mmWidth = 12965
        BandType = 7
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'Tesoreria'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 142346
        mmTop = 29898
        mmWidth = 12171
        BandType = 7
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'Presidente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 173567
        mmTop = 29898
        mmWidth = 13494
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 2117
        mmTop = 27517
        mmWidth = 28046
        BandType = 7
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 34925
        mmTop = 27517
        mmWidth = 28046
        BandType = 7
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 68263
        mmTop = 27517
        mmWidth = 28046
        BandType = 7
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 101071
        mmTop = 27517
        mmWidth = 28046
        BandType = 7
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 134938
        mmTop = 27517
        mmWidth = 28046
        BandType = 7
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 167217
        mmTop = 27517
        mmWidth = 28046
        BandType = 7
      end
    end
  end
  object ppdbMovi: TppDBPipeline
    DataSource = DMALM.dsTGE
    UserName = 'dbMovi'
    Left = 97
    Top = 360
    object ppField1: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'LOCID'
      FieldName = 'LOCID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'TINID'
      FieldName = 'TINID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'ALMID'
      FieldName = 'ALMID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'GRARID'
      FieldName = 'GRARID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object ppField6: TppField
      FieldAlias = 'CUENTAID'
      FieldName = 'CUENTAID'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppField7: TppField
      FieldAlias = 'CCOSID'
      FieldName = 'CCOSID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 6
    end
    object ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBES'
      FieldName = 'DEBES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBED'
      FieldName = 'DEBED'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABERS'
      FieldName = 'HABERS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABERD'
      FieldName = 'HABERD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppField12: TppField
      FieldAlias = 'CCOSDES'
      FieldName = 'CCOSDES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 11
    end
    object ppField13: TppField
      FieldAlias = 'CIADES'
      FieldName = 'CIADES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 12
    end
  end
  object pprAContable: TppReport
    AutoStop = False
    DataPipeline = ppdbMovi
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rPreview1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 5350
    PrinterSetup.mmMarginLeft = 1350
    PrinterSetup.mmMarginRight = 1350
    PrinterSetup.mmMarginTop = 3350
    PrinterSetup.mmPaperHeight = 215900
    PrinterSetup.mmPaperWidth = 279401
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\SOLAlmacen\SOLFormatos\AlmVoucherG.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprAContablePreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 160
    Top = 297
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbMovi'
    object ppHeaderBand1: TppHeaderBand
      BeforePrint = ppHeaderBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 88106
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape1'
        mmHeight = 11906
        mmLeft = 3440
        mmTop = 76200
        mmWidth = 264848
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape2'
        mmHeight = 33073
        mmLeft = 3440
        mmTop = 43127
        mmWidth = 264848
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'lblGlosa1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 35190
        mmTop = 67998
        mmWidth = 33338
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'ASIENTO CONTABLE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 113771
        mmTop = 16933
        mmWidth = 46567
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label1'
        Caption = 'FECHA:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 223838
        mmTop = 35190
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'PROVEEDOR/CLIENTE :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 5821
        mmTop = 46567
        mmWidth = 40217
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'FACTURA No.:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 5821
        mmTop = 53446
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'BANCO :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 5821
        mmTop = 60854
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'DESCRIPCION :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 5821
        mmTop = 67469
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'CHEQUE NO.:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 102923
        mmTop = 60854
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'NOTA DE ABONO No .:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 177007
        mmTop = 60854
        mmWidth = 40217
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = 'CUENTA CONTABLE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 9525
        mmTop = 78317
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Caption = 'CENTRO COSTOS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 82021
        mmTop = 78317
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        Caption = 'D E B E'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 168805
        mmTop = 82815
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        Caption = 'H A B E R'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 193675
        mmTop = 82815
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = 'D E B E'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 222250
        mmTop = 82815
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label41'
        Caption = 'H A B E R'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 246592
        mmTop = 82815
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = 'GLOSA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 119592
        mmTop = 80169
        mmWidth = 9260
        BandType = 0
      end
      object ppLine17: TppLine
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11906
        mmLeft = 32808
        mmTop = 76200
        mmWidth = 1852
        BandType = 0
      end
      object ppLine18: TppLine
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11906
        mmLeft = 188648
        mmTop = 76200
        mmWidth = 1852
        BandType = 0
      end
      object ppLine21: TppLine
        UserName = 'Line21'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11906
        mmLeft = 215107
        mmTop = 76200
        mmWidth = 1852
        BandType = 0
      end
      object ppLine22: TppLine
        UserName = 'Line22'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11906
        mmLeft = 161925
        mmTop = 76200
        mmWidth = 1852
        BandType = 0
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11906
        mmLeft = 93398
        mmTop = 76200
        mmWidth = 1852
        BandType = 0
      end
      object ppLine25: TppLine
        UserName = 'Line25'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11906
        mmLeft = 241565
        mmTop = 76200
        mmWidth = 1852
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'lblTD1'
        Caption = 'lblTD'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 89429
        mmTop = 35190
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'lblDiario1'
        Caption = 'lblDiario'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 98425
        mmTop = 35190
        mmWidth = 19050
        BandType = 0
      end
      object lblProveedor: TppLabel
        UserName = 'lblProveedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 49213
        mmTop = 46567
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'lblTipoCamb1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 218282
        mmTop = 46567
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'lblperiodo1'
        Caption = 'lblperiodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 182563
        mmTop = 35190
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'lblNoComp1'
        Caption = 'lblNoComp'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 33338
        mmTop = 35190
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'lblMoneda1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 128059
        mmTop = 53446
        mmWidth = 19050
        BandType = 0
      end
      object pplblMesDia: TppLabel
        UserName = 'lblMesDia'
        Caption = 'lblMesDia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 152665
        mmTop = 48154
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel100: TppLabel
        UserName = 'Label100'
        Caption = 'No.REGISTRO:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 7673
        mmTop = 35190
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Caption = 'MONEDA:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 102923
        mmTop = 53446
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        Caption = 'DIARIO:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 71967
        mmTop = 35190
        mmWidth = 14817
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'CNTFCOMP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 240507
        mmTop = 35190
        mmWidth = 22490
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label4'
        Caption = 'PERIODO:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 164307
        mmTop = 35190
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label15'
        Caption = 'Label15'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 152665
        mmTop = 53711
        mmWidth = 14817
        BandType = 0
      end
      object ppLine19: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11906
        mmLeft = 80963
        mmTop = 76200
        mmWidth = 1852
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label46'
        Caption = 'NOMBRE CUENTA CONTABLE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 35983
        mmTop = 82021
        mmWidth = 40746
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        Caption = '$'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 173567
        mmTop = 77788
        mmWidth = 2646
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        Caption = '$'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 201084
        mmTop = 77788
        mmWidth = 2646
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'Label102'
        Caption = 'S/.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 224632
        mmTop = 77788
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'Label50'
        Caption = 'S/.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 250826
        mmTop = 77788
        mmWidth = 7938
        BandType = 0
      end
      object pplNoDoc: TppLabel
        UserName = 'lNoDoc'
        Caption = 'lNoDoc'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 35454
        mmTop = 53446
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel51: TppLabel
        UserName = 'Label51'
        Caption = 'T.Cambio S.B.S.:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 176477
        mmTop = 53446
        mmWidth = 33867
        BandType = 0
      end
      object ppLabel52: TppLabel
        UserName = 'Label52'
        Caption = 'T.Cambio Libre :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 176213
        mmTop = 46567
        mmWidth = 33867
        BandType = 0
      end
      object pplTCSBS: TppLabel
        UserName = 'lTCSBS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 218546
        mmTop = 53446
        mmWidth = 12700
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageNoDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 241036
        mmTop = 6615
        mmWidth = 14817
        BandType = 0
      end
      object lblBanco: TppLabel
        UserName = 'lblBanco'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 22490
        mmTop = 60854
        mmWidth = 30427
        BandType = 0
      end
      object lblCuenta: TppLabel
        UserName = 'lblCuenta'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 55033
        mmTop = 60854
        mmWidth = 42598
        BandType = 0
      end
      object lblNumChq: TppLabel
        UserName = 'lblNumChq'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 128059
        mmTop = 60854
        mmWidth = 41010
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CIADES'
        DataPipeline = ppdbMovi
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbMovi'
        mmHeight = 5821
        mmLeft = 3440
        mmTop = 6615
        mmWidth = 98954
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLine20: TppLine
        UserName = 'Line17'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 3440
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppLine24: TppLine
        UserName = 'Line18'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 32808
        mmTop = 0
        mmWidth = 2910
        BandType = 4
      end
      object ppLine26: TppLine
        UserName = 'Line19'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 93398
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppLine27: TppLine
        UserName = 'Line201'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 161925
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine28: TppLine
        UserName = 'Line28'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 188648
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine29: TppLine
        UserName = 'Line29'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 268023
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine30: TppLine
        UserName = 'Line30'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 215107
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine31: TppLine
        UserName = 'Line31'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 241565
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'CUENTAID'
        DataPipeline = ppdbMovi
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbMovi'
        mmHeight = 3704
        mmLeft = 4763
        mmTop = 794
        mmWidth = 27517
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText2'
        DataField = 'CCOSID'
        DataPipeline = ppdbMovi
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbMovi'
        mmHeight = 3704
        mmLeft = 82021
        mmTop = 794
        mmWidth = 10319
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText4'
        DataField = 'CCOSDES'
        DataPipeline = ppdbMovi
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbMovi'
        mmHeight = 3704
        mmLeft = 94721
        mmTop = 794
        mmWidth = 66146
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        BlankWhenZero = True
        DataField = 'DEBED'
        DataPipeline = ppdbMovi
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbMovi'
        mmHeight = 3704
        mmLeft = 163513
        mmTop = 794
        mmWidth = 24000
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        BlankWhenZero = True
        DataField = 'HABERD'
        DataPipeline = ppdbMovi
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbMovi'
        mmHeight = 3704
        mmLeft = 189971
        mmTop = 794
        mmWidth = 24000
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        BlankWhenZero = True
        DataField = 'DEBES'
        DataPipeline = ppdbMovi
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbMovi'
        mmHeight = 3704
        mmLeft = 216430
        mmTop = 794
        mmWidth = 24000
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        BlankWhenZero = True
        DataField = 'HABERS'
        DataPipeline = ppdbMovi
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbMovi'
        mmHeight = 3704
        mmLeft = 242888
        mmTop = 794
        mmWidth = 24000
        BandType = 4
      end
      object ppLine32: TppLine
        UserName = 'Line32'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 80963
        mmTop = 0
        mmWidth = 1588
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'CTADES'
        DataPipeline = ppdbMovi
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbMovi'
        mmHeight = 3704
        mmLeft = 33602
        mmTop = 794
        mmWidth = 46038
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 39952
      mmPrintPosition = 0
      object ppLine33: TppLine
        UserName = 'Line26'
        Weight = 0.750000000000000000
        mmHeight = 2646
        mmLeft = 3440
        mmTop = 0
        mmWidth = 264848
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc1'
        BlankWhenZero = True
        DataField = 'DEBED'
        DataPipeline = ppdbMovi
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbMovi'
        mmHeight = 3704
        mmLeft = 163513
        mmTop = 2381
        mmWidth = 24000
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc2'
        BlankWhenZero = True
        DataField = 'HABERD'
        DataPipeline = ppdbMovi
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbMovi'
        mmHeight = 3704
        mmLeft = 189971
        mmTop = 2381
        mmWidth = 24000
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc3'
        BlankWhenZero = True
        DataField = 'DEBES'
        DataPipeline = ppdbMovi
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbMovi'
        mmHeight = 3704
        mmLeft = 216430
        mmTop = 2381
        mmWidth = 24000
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc4'
        BlankWhenZero = True
        DataField = 'HABERS'
        DataPipeline = ppdbMovi
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbMovi'
        mmHeight = 3704
        mmLeft = 242888
        mmTop = 2381
        mmWidth = 24000
        BandType = 7
      end
      object ppLabel53: TppLabel
        UserName = 'Label11'
        Caption = 'TOTAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 136261
        mmTop = 2117
        mmWidth = 10583
        BandType = 7
      end
      object ppLine34: TppLine
        UserName = 'Line34'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 161925
        mmTop = 0
        mmWidth = 2117
        BandType = 7
      end
      object ppLine35: TppLine
        UserName = 'Line35'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 188648
        mmTop = 0
        mmWidth = 2117
        BandType = 7
      end
      object ppLine36: TppLine
        UserName = 'Line302'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 215107
        mmTop = 0
        mmWidth = 2117
        BandType = 7
      end
      object ppLine37: TppLine
        UserName = 'Line37'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 241565
        mmTop = 0
        mmWidth = 2117
        BandType = 7
      end
      object ppLine38: TppLine
        UserName = 'Line38'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 268023
        mmTop = 0
        mmWidth = 2117
        BandType = 7
      end
      object ppLine39: TppLine
        UserName = 'Line39'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 124090
        mmTop = 265
        mmWidth = 2117
        BandType = 7
      end
      object ppLine40: TppLine
        UserName = 'Line40'
        Weight = 0.750000000000000000
        mmHeight = 2646
        mmLeft = 124090
        mmTop = 8467
        mmWidth = 143934
        BandType = 7
      end
      object ppLabel54: TppLabel
        UserName = 'Label54'
        Caption = 'Hecho Por'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 63765
        mmTop = 35190
        mmWidth = 16669
        BandType = 7
      end
      object ppLine41: TppLine
        UserName = 'Line41'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 51065
        mmTop = 32279
        mmWidth = 44715
        BandType = 7
      end
      object ppLine42: TppLine
        UserName = 'Line42'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 165365
        mmTop = 32544
        mmWidth = 44715
        BandType = 7
      end
      object ppLabel55: TppLabel
        UserName = 'Label55'
        Caption = 'Autorizado Por'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 175419
        mmTop = 35190
        mmWidth = 25929
        BandType = 7
      end
    end
  end
end
