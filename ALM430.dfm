object FAlmacen: TFAlmacen
  Left = 122
  Top = 23
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pedidos x Atender'
  ClientHeight = 567
  ClientWidth = 695
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
  ShowHint = True
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object pnlDetalle: TPanel
    Left = 0
    Top = 0
    Width = 695
    Height = 511
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 1
    BorderStyle = bsSingle
    Color = 10207162
    TabOrder = 0
    object dbgDetFac: TwwDBGrid
      Left = 1
      Top = 1
      Width = 689
      Height = 505
      DisableThemesInTitle = False
      Selected.Strings = (
        'DPEDITEM'#9'6'#9'Nro.~Item'#9'F'
        'GRARID'#9'3'#9'Linea'#9'F'
        'ARTID'#9'8'#9'Articulo'#9'F'
        'ARTDES'#9'35'#9'Descripci'#243'n'#9'F'
        'UNMIDO'#9'3'#9'U.M.'#9'F'
        'DPEDCANTAC'#9'9'#9'Cant~Pedida'#9'F'
        'DPEDCANTXA'#9'9'#9'Cant. x~ Atender'#9'F'
        'DPEDSALDO'#9'9'#9'Cant.~Pendiente'#9'F'
        'STKSACTG'#9'9'#9'Disponible'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = 7566265
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      BorderStyle = bsNone
      Color = clWhite
      DataSource = DMALM.dsQry4
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      KeyOptions = [dgEnterToTab]
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgWordWrap, dgFooter3DCells]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      UseTFields = False
      OnDblClick = dbgDetFacDblClick
      FooterColor = 11974251
      FooterCellColor = clHighlightText
      object btnActReg: TwwIButton
        Left = 0
        Top = 0
        Width = 25
        Height = 30
        Hint = 'A'#241'ade Registros'
        AllowAllUp = True
        BiDiMode = bdLeftToRight
        Enabled = False
        Glyph.Data = {
          96010000424D9601000000000000760000002800000017000000180000000100
          0400000000002001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00BBBBBBBBBBBB
          BBBBBBBBBBB08887777777777777777778B08800000000000000000078B0880F
          FFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF0
          78B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFF
          FFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880F
          FFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF0
          78B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFFFFFFFFF078B0880FFFFFFFFF
          FF00000078B0880FFFFFFFFFFF0FF88088B0880FFFFFFFFFFF0F880888B0880F
          FFFFFFFFFF08808888B0880FFFFFFFFFFF08088888B088000000000000008888
          88B08888888888888888888888B08888888888888888888888B0}
        ParentShowHint = False
        ParentBiDiMode = False
        ShowHint = True
        Visible = False
      end
    end
  end
  object pnlPie: TPanel
    Left = 0
    Top = 514
    Width = 695
    Height = 53
    Align = alBottom
    BevelOuter = bvNone
    BorderWidth = 1
    BorderStyle = bsSingle
    Color = 14869218
    TabOrder = 1
    object bbtnCalc: TBitBtn
      Left = 20
      Top = 4
      Width = 32
      Height = 31
      Hint = 'Calculadora'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = bbtnCalcClick
      Glyph.Data = {
        36010000424D3601000000000000760000002800000010000000180000000100
        040000000000C0000000CE0E0000D80E00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777700000000000007708888888888888070800800899999807080080089999
        9807088888888888880708008008008008070800800800800807088888888888
        8807080080080080080708008008008008070888888888888807080080080080
        0807080080080080080708888888888888070888888888888807088888888888
        8807080000000000080708000EE0EEEE080708000EE0EEEE0807080000000000
        0807088888888888880708888888888888077000000000000077}
    end
    object Z2bbtnCancela: TBitBtn
      Left = 476
      Top = 11
      Width = 32
      Height = 31
      Hint = 'Regresa Pedido a Registro'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Visible = False
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        04000000000068010000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033911833333333333333333F333333333333
        0000339111833333911333333388F333333F3333000033911118333911118333
        38F38F333F88F33300003339111183911111833338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003339
        1118333911183333338F33838F338F33000033911183333391118333338FF833
        38F338F300003391183333333911133333388333338FFF830000333913333333
        3391833333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object pnlEstado: TPanel
      Left = 213
      Top = 9
      Width = 236
      Height = 32
      Color = clSilver
      TabOrder = 2
      Visible = False
      object lblReserva: TLabel
        Left = 65
        Top = 7
        Width = 103
        Height = 19
        Caption = 'RESERVADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblDespacho: TLabel
        Left = 63
        Top = 4
        Width = 117
        Height = 24
        Caption = 'DESPACHO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblActivo: TLabel
        Left = 94
        Top = 7
        Width = 60
        Height = 19
        Caption = 'ACTIVO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lblAcepta: TLabel
        Left = 74
        Top = 7
        Width = 90
        Height = 19
        Caption = 'ACEPTADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label14: TLabel
        Left = 6
        Top = 7
        Width = 46
        Height = 16
        Caption = 'Estado:'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lblInicial: TLabel
        Left = 93
        Top = 7
        Width = 57
        Height = 19
        Caption = 'INICIAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
    end
    object Z2bbtnOk: TBitBtn
      Left = 525
      Top = 11
      Width = 33
      Height = 31
      Hint = 'Envia Pedido a Despacho'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = Z2bbtnOkClick
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
    end
    object bbtnOrdenDespacho: TBitBtn
      Left = 573
      Top = 11
      Width = 32
      Height = 31
      Hint = 'Imprimir Orden Despacho'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = bbtnOrdenDespachoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
  end
  object pnlRegistro: TPanel
    Left = 185
    Top = 107
    Width = 324
    Height = 129
    BevelInner = bvRaised
    BorderWidth = 1
    Color = 14869218
    TabOrder = 2
    Visible = False
    object Label5: TLabel
      Left = 17
      Top = 58
      Width = 77
      Height = 15
      Caption = 'Cant. Aceptada'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 18
      Top = 88
      Width = 79
      Height = 15
      Caption = 'Cant. a Atender'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblUMAC: TLabel
      Left = 186
      Top = 66
      Width = 33
      Height = 15
      Caption = 'UMAC'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblUMAT: TLabel
      Left = 186
      Top = 88
      Width = 33
      Height = 15
      Caption = 'UMAT'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 16
      Top = 31
      Width = 42
      Height = 15
      Caption = 'Art'#237'culo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object stTitulo: TStaticText
      Left = 3
      Top = 3
      Width = 318
      Height = 17
      Align = alTop
      Alignment = taCenter
      BorderStyle = sbsSingle
      Caption = 'Detalle de Atenci'#243'n'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
    object dbeCantAc: TwwDBEdit
      Left = 111
      Top = 58
      Width = 69
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Picture.PictureMask = '#[*#][.[#][#][#]]'
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeCantAt: TwwDBEdit
      Left = 112
      Top = 86
      Width = 69
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Picture.PictureMask = '#[*#][.[#][#][#]]'
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeCantAtExit
    end
    object bbtnRegOk: TBitBtn
      Left = 244
      Top = 93
      Width = 30
      Height = 28
      Hint = 'Confirma Ingreso de Articulo'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = bbtnRegOkClick
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
    object bbtnRegCanc: TBitBtn
      Left = 275
      Top = 93
      Width = 30
      Height = 28
      Hint = 'Cancela Ingreso de Articulo'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = bbtnRegCancClick
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
    object dblcdArticulo: TwwDBLookupComboDlg
      Left = 65
      Top = 28
      Width = 81
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Articulo'
      MaxWidth = 0
      MaxHeight = 209
      Enabled = False
      ParentFont = False
      TabOrder = 5
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object edtArticulo: TEdit
      Left = 146
      Top = 28
      Width = 174
      Height = 23
      Color = clMenu
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object edtPedido: TEdit
      Left = 16
      Top = 128
      Width = 121
      Height = 23
      TabOrder = 7
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DMALM.dsDetFac
    UserName = 'DBPipeline1'
    Left = 87
    Top = 520
    object ppField1: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'CLIEID'
      FieldName = 'CLIEID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'PEDIDO'
      FieldName = 'PEDIDO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'CLAUXID'
      FieldName = 'CLAUXID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'CLIERUC'
      FieldName = 'CLIERUC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object ppField6: TppField
      FieldAlias = 'GRARID'
      FieldName = 'GRARID'
      FieldLength = 3
      DisplayWidth = 3
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
      FieldLength = 60
      DisplayWidth = 60
      Position = 9
    end
    object ppField11: TppField
      FieldAlias = 'UNMIDG'
      FieldName = 'UNMIDG'
      FieldLength = 3
      DisplayWidth = 3
      Position = 10
    end
    object ppField12: TppField
      FieldAlias = 'UNMABR'
      FieldName = 'UNMABR'
      FieldLength = 15
      DisplayWidth = 15
      Position = 11
    end
    object ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'DPEDCANTP'
      FieldName = 'DPEDCANTP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppField14: TppField
      FieldAlias = 'TLISTAID'
      FieldName = 'TLISTAID'
      FieldLength = 3
      DisplayWidth = 3
      Position = 13
    end
    object ppField15: TppField
      FieldAlias = 'VEID'
      FieldName = 'VEID'
      FieldLength = 4
      DisplayWidth = 4
      Position = 14
    end
    object ppField16: TppField
      FieldAlias = 'FPAGOID'
      FieldName = 'FPAGOID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 15
    end
    object ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'DPEDPREUMO'
      FieldName = 'DPEDPREUMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'DPEDPREUMN'
      FieldName = 'DPEDPREUMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'DPEDPREUME'
      FieldName = 'DPEDPREUME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'DPEDDCTOMO'
      FieldName = 'DPEDDCTOMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'DPEDDCTOMN'
      FieldName = 'DPEDDCTOMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'DPEDDCTOME'
      FieldName = 'DPEDDCTOME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'DPEDMTOMO'
      FieldName = 'DPEDMTOMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'DPEDMTOMN'
      FieldName = 'DPEDMTOMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'DPEDMTOME'
      FieldName = 'DPEDMTOME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object ppField26: TppField
      FieldAlias = 'DPEDUSER'
      FieldName = 'DPEDUSER'
      FieldLength = 10
      DisplayWidth = 10
      Position = 25
    end
    object ppField27: TppField
      FieldAlias = 'DPEDFREG'
      FieldName = 'DPEDFREG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 26
    end
    object ppField28: TppField
      FieldAlias = 'DPEDHREG'
      FieldName = 'DPEDHREG'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 27
    end
    object ppField29: TppField
      FieldAlias = 'DPEDANOMES'
      FieldName = 'DPEDANOMES'
      FieldLength = 6
      DisplayWidth = 6
      Position = 28
    end
    object ppField30: TppField
      FieldAlias = 'DPEDAAAA'
      FieldName = 'DPEDAAAA'
      FieldLength = 4
      DisplayWidth = 4
      Position = 29
    end
    object ppField31: TppField
      FieldAlias = 'DPEDMM'
      FieldName = 'DPEDMM'
      FieldLength = 2
      DisplayWidth = 2
      Position = 30
    end
    object ppField32: TppField
      FieldAlias = 'DPEDDD'
      FieldName = 'DPEDDD'
      FieldLength = 2
      DisplayWidth = 2
      Position = 31
    end
    object ppField33: TppField
      FieldAlias = 'DPEDTRI'
      FieldName = 'DPEDTRI'
      FieldLength = 1
      DisplayWidth = 1
      Position = 32
    end
    object ppField34: TppField
      FieldAlias = 'DPEDSEM'
      FieldName = 'DPEDSEM'
      FieldLength = 1
      DisplayWidth = 1
      Position = 33
    end
    object ppField35: TppField
      FieldAlias = 'DPEDSS'
      FieldName = 'DPEDSS'
      FieldLength = 2
      DisplayWidth = 2
      Position = 34
    end
    object ppField36: TppField
      FieldAlias = 'DPEDAATRI'
      FieldName = 'DPEDAATRI'
      FieldLength = 5
      DisplayWidth = 5
      Position = 35
    end
    object ppField37: TppField
      FieldAlias = 'DPEDAASEM'
      FieldName = 'DPEDAASEM'
      FieldLength = 5
      DisplayWidth = 5
      Position = 36
    end
    object ppField38: TppField
      FieldAlias = 'DPEDAASS'
      FieldName = 'DPEDAASS'
      FieldLength = 6
      DisplayWidth = 6
      Position = 37
    end
    object ppField39: TppField
      Alignment = taRightJustify
      FieldAlias = 'PEDTCAM'
      FieldName = 'PEDTCAM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 38
    end
    object ppField40: TppField
      FieldAlias = 'TMONID'
      FieldName = 'TMONID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 39
    end
    object ppField41: TppField
      Alignment = taRightJustify
      FieldAlias = 'CLIECREMAX'
      FieldName = 'CLIECREMAX'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 40
    end
    object ppField42: TppField
      FieldAlias = 'DPEDIGV'
      FieldName = 'DPEDIGV'
      FieldLength = 1
      DisplayWidth = 1
      Position = 41
    end
    object ppField43: TppField
      FieldAlias = 'DPEDISC'
      FieldName = 'DPEDISC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 42
    end
    object ppField44: TppField
      FieldAlias = 'DPEDESTADO'
      FieldName = 'DPEDESTADO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 43
    end
    object ppField45: TppField
      Alignment = taRightJustify
      FieldAlias = 'DPEDCANTAT'
      FieldName = 'DPEDCANTAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 44
    end
    object ppField46: TppField
      FieldAlias = 'DPEDFLAGV'
      FieldName = 'DPEDFLAGV'
      FieldLength = 2
      DisplayWidth = 2
      Position = 45
    end
    object ppField47: TppField
      Alignment = taRightJustify
      FieldAlias = 'DPEDGARAN'
      FieldName = 'DPEDGARAN'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 46
    end
    object ppField48: TppField
      Alignment = taRightJustify
      FieldAlias = 'DPEDSALDO'
      FieldName = 'DPEDSALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 47
    end
    object ppField49: TppField
      FieldAlias = 'UNMIDU'
      FieldName = 'UNMIDU'
      FieldLength = 3
      DisplayWidth = 3
      Position = 48
    end
    object ppField50: TppField
      FieldAlias = 'LOCID'
      FieldName = 'LOCID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 49
    end
    object ppField51: TppField
      FieldAlias = 'ALMID'
      FieldName = 'ALMID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 50
    end
    object ppField52: TppField
      FieldAlias = 'DPEDFLAGRE'
      FieldName = 'DPEDFLAGRE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 51
    end
    object ppField53: TppField
      FieldAlias = 'UNMIDO'
      FieldName = 'UNMIDO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 52
    end
    object ppField54: TppField
      Alignment = taRightJustify
      FieldAlias = 'DPEDDCTO1'
      FieldName = 'DPEDDCTO1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 53
    end
    object ppField55: TppField
      Alignment = taRightJustify
      FieldAlias = 'DPEDDCTO2'
      FieldName = 'DPEDDCTO2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 54
    end
    object ppField56: TppField
      Alignment = taRightJustify
      FieldAlias = 'DPEDDTOMO2'
      FieldName = 'DPEDDTOMO2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 55
    end
    object ppField57: TppField
      Alignment = taRightJustify
      FieldAlias = 'DPEDDTOMN2'
      FieldName = 'DPEDDTOMN2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 56
    end
    object ppField58: TppField
      Alignment = taRightJustify
      FieldAlias = 'DPEDDTOME2'
      FieldName = 'DPEDDTOME2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 57
    end
    object ppField59: TppField
      FieldAlias = 'CONTENIDO'
      FieldName = 'CONTENIDO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 58
    end
    object ppField60: TppField
      Alignment = taRightJustify
      FieldAlias = 'DPEDDCTO3'
      FieldName = 'DPEDDCTO3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 59
    end
    object ppField61: TppField
      Alignment = taRightJustify
      FieldAlias = 'DPEDDTOMO3'
      FieldName = 'DPEDDTOMO3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 60
    end
    object ppField62: TppField
      Alignment = taRightJustify
      FieldAlias = 'DPEDDTOMN3'
      FieldName = 'DPEDDTOMN3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 61
    end
    object ppField63: TppField
      Alignment = taRightJustify
      FieldAlias = 'DPEDDTOME3'
      FieldName = 'DPEDDTOME3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 62
    end
    object ppField64: TppField
      Alignment = taRightJustify
      FieldAlias = 'STKSACTG'
      FieldName = 'STKSACTG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 63
    end
    object ppField65: TppField
      FieldAlias = 'PROV'
      FieldName = 'PROV'
      FieldLength = 15
      DisplayWidth = 15
      Position = 64
    end
    object ppField66: TppField
      Alignment = taRightJustify
      FieldAlias = 'DPEDCANTAC'
      FieldName = 'DPEDCANTAC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 65
    end
    object ppField67: TppField
      Alignment = taRightJustify
      FieldAlias = 'DPEDCANTRE'
      FieldName = 'DPEDCANTRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 66
    end
    object ppField68: TppField
      FieldAlias = 'PEDSIT'
      FieldName = 'PEDSIT'
      FieldLength = 10
      DisplayWidth = 10
      Position = 67
    end
    object ppField69: TppField
      Alignment = taRightJustify
      FieldAlias = 'DPEDCANTXA'
      FieldName = 'DPEDCANTXA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 68
    end
    object ppField70: TppField
      FieldAlias = 'DPEDFLAGRQ'
      FieldName = 'DPEDFLAGRQ'
      FieldLength = 1
      DisplayWidth = 1
      Position = 69
    end
    object ppField71: TppField
      FieldAlias = 'PEDFLAGDEP'
      FieldName = 'PEDFLAGDEP'
      FieldLength = 1
      DisplayWidth = 1
      Position = 70
    end
    object ppField72: TppField
      FieldAlias = 'TINID'
      FieldName = 'TINID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 71
    end
    object ppField73: TppField
      FieldAlias = 'DPEDARTIAN'
      FieldName = 'DPEDARTIAN'
      FieldLength = 1
      DisplayWidth = 1
      Position = 72
    end
    object ppField74: TppField
      FieldAlias = 'DPEDITEM'
      FieldName = 'DPEDITEM'
      FieldLength = 5
      DisplayWidth = 5
      Position = 73
    end
    object ppField75: TppField
      FieldAlias = 'PIDEUNID'
      FieldName = 'PIDEUNID'
      FieldLength = 1
      DisplayWidth = 1
      Position = 74
    end
    object ppField76: TppField
      FieldAlias = 'PEDFECHA'
      FieldName = 'PEDFECHA'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 75
    end
    object ppField77: TppField
      FieldAlias = 'DPEDSIT'
      FieldName = 'DPEDSIT'
      FieldLength = 15
      DisplayWidth = 15
      Position = 76
    end
  end
  object ppRepOrden: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    OnPrintingComplete = ppRepOrdenPrintingComplete
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rPedido'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 16510
    PrinterSetup.mmMarginLeft = 2540
    PrinterSetup.mmMarginRight = 0
    PrinterSetup.mmMarginTop = 2540
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 228600
    PrinterSetup.PaperSize = 256
    Template.FileName = 'C:\SOLExes\SOLFormatos\Alm\Incoresa\OrdenDespacho.rtm'
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppRepOrdenPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 146
    Top = 498
    Version = '7.02'
    mmColumnWidth = 210820
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand3: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 69056
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 13229
        mmLeft = 150284
        mmTop = 794
        mmWidth = 42598
        BandType = 0
      end
      object pplblCia: TppLabel
        UserName = 'lblCia1'
        Caption = 'pplblCia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3704
        mmTop = 529
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel62: TppLabel
        UserName = 'Label62'
        Caption = 'Articulo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 176477
        mmTop = 64029
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel63: TppLabel
        UserName = 'Label63'
        AutoSize = False
        Caption = 'Descripci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 69056
        mmTop = 64029
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel64: TppLabel
        UserName = 'Label64'
        AutoSize = False
        Caption = 'Cantidad'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 4763
        mmTop = 64029
        mmWidth = 17198
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Pen.Style = psInsideFrame
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2381
        mmTop = 68527
        mmWidth = 190765
        BandType = 0
      end
      object ppLabel68: TppLabel
        UserName = 'Label68'
        Caption = 'Pedido:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 152929
        mmTop = 7673
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel77: TppLabel
        UserName = 'Label77'
        Caption = 'U.M'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 35983
        mmTop = 64029
        mmWidth = 5556
        BandType = 0
      end
      object pplblCopia2: TppLabel
        UserName = 'lblCopia2'
        Caption = 'pplblCopia2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3969
        mmLeft = 179123
        mmTop = 51329
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel92: TppLabel
        UserName = 'Label92'
        Caption = 'ORDEN DE DESPACHO DE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3704
        mmTop = 23548
        mmWidth = 37042
        BandType = 0
      end
      object pplblZona: TppLabel
        UserName = 'lblZona'
        Caption = 'pplblZona'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 44979
        mmTop = 23548
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel94: TppLabel
        UserName = 'Label94'
        Caption = 'R.U.C'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 153194
        mmTop = 2381
        mmWidth = 9260
        BandType = 0
      end
      object pplbRucCia: TppLabel
        UserName = 'lblRuc1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 166159
        mmTop = 2381
        mmWidth = 20373
        BandType = 0
      end
      object pplblDirEmp: TppLabel
        UserName = 'lblEmpdir1'
        Caption = 'pplblDirEmp'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3704
        mmTop = 5821
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel101: TppLabel
        UserName = 'Label101'
        Caption = 'Email-Ventas:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3704
        mmTop = 10054
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel102: TppLabel
        UserName = 'Label102'
        Caption = 'P'#225'gina Web:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3704
        mmTop = 13758
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel103: TppLabel
        UserName = 'Label103'
        Caption = 'Serv. al Cliente:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3704
        mmTop = 17727
        mmWidth = 31485
        BandType = 0
      end
      object pplblEmail: TppLabel
        UserName = 'lblemail1'
        Caption = 'pplblEmail'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 28840
        mmTop = 10054
        mmWidth = 18521
        BandType = 0
      end
      object pplblPaginaWeb: TppLabel
        UserName = 'lblWeb1'
        Caption = 'pplblPaginaWeb'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 24871
        mmTop = 14023
        mmWidth = 25929
        BandType = 0
      end
      object pplblServ: TppLabel
        UserName = 'lblFonoServ1'
        Caption = 'pplblServ'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 35719
        mmTop = 17727
        mmWidth = 16669
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'PEDIDO'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4233
        mmLeft = 166688
        mmTop = 7673
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel65: TppLabel
        UserName = 'Label65'
        Caption = 'Pagina   :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 162984
        mmTop = 19844
        mmWidth = 18521
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 182827
        mmTop = 19844
        mmWidth = 1852
        BandType = 0
      end
      object ppLabel66: TppLabel
        UserName = 'Label201'
        Caption = 'Fecha    :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 162984
        mmTop = 23813
        mmWidth = 18521
        BandType = 0
      end
      object ppSystemVariable7: TppSystemVariable
        UserName = 'SystemVariable7'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 182827
        mmTop = 23813
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel67: TppLabel
        UserName = 'Label67'
        Caption = 'Hora     :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 162984
        mmTop = 27781
        mmWidth = 18521
        BandType = 0
      end
      object ppSystemVariable8: TppSystemVariable
        UserName = 'SystemVariable8'
        VarType = vtTime
        DisplayFormat = 'hh:mm am/pm'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 182827
        mmTop = 27781
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel82: TppLabel
        UserName = 'Label82'
        Caption = 'Usuario :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 162984
        mmTop = 32279
        mmWidth = 16669
        BandType = 0
      end
      object pplblUsuario: TppLabel
        UserName = 'lblUsuario'
        Caption = 'pplblUsuario'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 182827
        mmTop = 32279
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel69: TppLabel
        UserName = 'Label69'
        Caption = 'Cliente      :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 5821
        mmTop = 31221
        mmWidth = 25929
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'Label70'
        Caption = 'R.U.C. '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 5821
        mmTop = 41540
        mmWidth = 12965
        BandType = 0
      end
      object ppdbtClieId: TppDBText
        UserName = 'dbtClieId'
        AutoSize = True
        DataField = 'CLIEID'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 32279
        mmTop = 31221
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel75: TppLabel
        UserName = 'Label75'
        Caption = 'Direcci'#243'n :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 5821
        mmTop = 36248
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel78: TppLabel
        UserName = 'Label78'
        Caption = 'Vendedor   :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 5821
        mmTop = 56356
        mmWidth = 22225
        BandType = 0
      end
      object pplblVendedor: TppLabel
        UserName = 'lblVendedor'
        Caption = 'pplblVendedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 29633
        mmTop = 56356
        mmWidth = 24077
        BandType = 0
      end
      object pplblLugarEntrega: TppLabel
        UserName = 'lblLugarEntrega'
        Caption = 'pplblLugarEntrega'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 20373
        mmTop = 46302
        mmWidth = 31485
        BandType = 0
      end
      object ppLabel86: TppLabel
        UserName = 'Label302'
        Caption = 'Lugar :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 5821
        mmTop = 46302
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel88: TppLabel
        UserName = 'Label88'
        Caption = 'Condiciones de Pago:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 5821
        mmTop = 51329
        mmWidth = 37042
        BandType = 0
      end
      object pplblCCom: TppLabel
        UserName = 'lblCCom'
        Caption = 'pplblCCom'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 44715
        mmTop = 51329
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel91: TppLabel
        UserName = 'Label91'
        Caption = '% Descuento :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 94721
        mmTop = 51329
        mmWidth = 24077
        BandType = 0
      end
      object ppdbtDcto1: TppDBText
        UserName = 'dbtDcto1'
        AutoSize = True
        DataField = 'DPEDDCTO1'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,###.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 120386
        mmTop = 51329
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel61: TppLabel
        UserName = 'Label61'
        Caption = 'Zona:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 89165
        mmTop = 56356
        mmWidth = 9260
        BandType = 0
      end
      object pplblZonaD: TppLabel
        UserName = 'lblZonaD'
        Caption = 'pplblZonaD'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 98954
        mmTop = 56356
        mmWidth = 18521
        BandType = 0
      end
      object ppdbtClieDes: TppDBText
        UserName = 'dbtClieDes'
        AutoSize = True
        DataField = 'CLIEDES'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 54240
        mmTop = 31221
        mmWidth = 12965
        BandType = 0
      end
      object ppdbtClieDir: TppDBText
        UserName = 'dbtClieDir'
        AutoSize = True
        DataField = 'CLIEDIR'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 26988
        mmTop = 36248
        mmWidth = 12965
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line101'
        Pen.Style = psInsideFrame
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2381
        mmTop = 63236
        mmWidth = 190765
        BandType = 0
      end
      object ppdbClieRUC: TppDBText
        UserName = 'dbClieRUC'
        DataField = 'CLIERUC'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 19579
        mmTop = 41540
        mmWidth = 17198
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppdbtArtId: TppDBText
        UserName = 'DBText101'
        DataField = 'ARTID'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 175419
        mmTop = 265
        mmWidth = 15081
        BandType = 4
      end
      object ppdbtArtDes: TppDBText
        UserName = 'dbtArtDes'
        DataField = 'ARTDES'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 44715
        mmTop = 265
        mmWidth = 127529
        BandType = 4
      end
      object ppdbtUM: TppDBText
        UserName = 'dbtUM'
        DataField = 'UNMIDG'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 35454
        mmTop = 265
        mmWidth = 7408
        BandType = 4
      end
      object ppvCantEnt: TppVariable
        UserName = 'vCantEnt'
        CalcOrder = 0
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 4498
        mmTop = 265
        mmWidth = 12171
        BandType = 4
      end
      object ppvCantFrac: TppVariable
        UserName = 'vCantFrac'
        CalcOrder = 1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 16933
        mmTop = 265
        mmWidth = 13229
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 24077
      mmPrintPosition = 0
      object ppLine11: TppLine
        UserName = 'Line11'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 6085
        mmTop = 4498
        mmWidth = 45508
        BandType = 8
      end
      object ppLabel108: TppLabel
        UserName = 'Label108'
        Caption = 'R.U.C:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 6085
        mmTop = 9790
        mmWidth = 11113
        BandType = 8
      end
      object pplbRuc2: TppLabel
        UserName = 'lbRuc2'
        Caption = 'pplbRuc2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 17992
        mmTop = 9790
        mmWidth = 14817
        BandType = 8
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 107950
        mmTop = 4498
        mmWidth = 66675
        BandType = 8
      end
      object ppLabel110: TppLabel
        UserName = 'Label110'
        Caption = '- Esta Venta se sujeta a la aprobaci'#243'n de la Gerencia y'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 108744
        mmTop = 5556
        mmWidth = 101865
        BandType = 8
      end
      object ppLabel111: TppLabel
        UserName = 'Label111'
        Caption = 'regir'#225' en caso de no agotarse la mercader'#237'a ofrecida'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 114300
        mmTop = 9790
        mmWidth = 96309
        BandType = 8
      end
      object ppLabel112: TppLabel
        UserName = 'Label112'
        Caption = '- La mercader'#237'a viaja por cuenta y riesgo del comprador'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 108744
        mmTop = 14023
        mmWidth = 101865
        BandType = 8
      end
      object pplblPorCia: TppLabel
        UserName = 'lblPorCia'
        Caption = 'pplblPorCia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 6085
        mmTop = 5556
        mmWidth = 20373
        BandType = 8
      end
      object ppLabel114: TppLabel
        UserName = 'Label114'
        Caption = 'CLIENTE:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 108744
        mmTop = 0
        mmWidth = 14817
        BandType = 8
      end
      object ppdbtClientePie: TppDBText
        UserName = 'dbtClieDes1'
        AutoSize = True
        DataField = 'CLIEDES'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 15cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 124090
        mmTop = 0
        mmWidth = 12965
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
end
