object FRegNtaE: TFRegNtaE
  Left = 295
  Top = 135
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Nota de Ingreso'
  ClientHeight = 589
  ClientWidth = 816
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
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object sbDisenoRep: TSpeedButton
    Left = 0
    Top = 561
    Width = 9
    Height = 22
    Flat = True
    OnClick = sbDisenoRepClick
  end
  object pnlDetalleG: TPanel
    Left = 10
    Top = 245
    Width = 792
    Height = 340
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'pnlDetalleG'
    Color = 14869218
    Enabled = False
    TabOrder = 1
    object lblEstado1: TLabel
      Left = 361
      Top = 303
      Width = 85
      Height = 25
      Caption = 'lblEstado1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -17
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbgDKDX: TwwDBGrid
      Left = 5
      Top = 24
      Width = 782
      Height = 269
      DisableThemesInTitle = False
      Selected.Strings = (
        'KDXID'#9'8'#9'N'#186#9'F'
        'ARTID'#9'10'#9'C'#243'digo~Art'#237'culo'#9'F'
        'ARTDES'#9'45'#9'Detalle'#9'F'
        'KDXCNTG'#9'9'#9'Cantidad G'#9'F'
        'ARTPCG'#9'9'#9'Precio G'#9'F'
        'KDXCNTU'#9'9'#9'Cantidad U'#9'F'
        'ARTPCU'#9'9'#9'Precio U'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = 7566265
      FixedCols = 0
      ShowHorzScrollBar = True
      Color = clWhite
      KeyOptions = [dgEnterToTab]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      UseTFields = False
      OnDblClick = dbgDKDXDblClick
      OnKeyDown = dbgDKDXKeyDown
      DesignSize = (
        778
        265)
      object Z2dbgDReqsIButton: TwwIButton
        Left = 0
        Top = 0
        Width = 28
        Height = 35
        AllowAllUp = True
        Anchors = [akLeft]
        Caption = 'P'
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
        OnClick = Z2dbgDReqsIButtonClick
      end
    end
    object stxTitulo1: TPanel
      Left = 2
      Top = 2
      Width = 788
      Height = 19
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'Detalle de Nota de Ingreso'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object pnlControl: TPanel
      Left = 552
      Top = 299
      Width = 232
      Height = 31
      BevelOuter = bvNone
      Color = clSilver
      TabOrder = 2
      object Z2bbtnAceptar: TBitBtn
        Left = 88
        Top = 0
        Width = 30
        Height = 30
        Hint = 'Confirma Actualizaci'#243'n'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TabStop = False
        OnClick = Z2bbtnAceptarClick
        Glyph.Data = {
          F2010000424DF201000000000000760000002800000024000000130000000100
          0400000000007C01000000000000000000001000000010000000000000000000
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
      object Z2bbtnRegresa: TBitBtn
        Left = 1
        Top = 0
        Width = 32
        Height = 31
        Hint = 'Modifica Datos de Cabecera'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TabStop = False
        OnClick = Z2bbtnRegresaClick
        Glyph.Data = {
          9A050000424D9A05000000000000360000002800000014000000170000000100
          1800000000006405000000000000000000000000000000000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0000000FF0000FF0000FF0000FF0000FF0000FF00
          00FF0000FF0000FF0000000000C0C0C0C0C0C0C0C0C0C0C0C000000000000000
          0000000000000000000000FF0000000000FF0000FF0000FF0000FF0000FF0000
          FF0000FF0000000000000000000000000000C0C0C0000000FFFFFFFFFFFFFFFF
          FFCCCCCC00000000000000000000000000000000000000000000000000000000
          0000000000FFFFFFFFFFFF000000C0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFF
          000000000000CCCCCCCCCCCCCCCCCCCCCCCC999999CCCCCC9999990000000000
          00FFFFFFFFFFFF000000C0C0C0000000FFFFFFFFFFFFFFFFFF000000CCCCCCFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF666666999999CCCCCC999999000000FFFFFF
          FFFFFF000000C0C0C0000000FFFFFFFFFFFFCCCCCC000000FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFCCCCCC999999666666CCCCCC666666000000FFFFFFFFFFFF00
          0000C0C0C0000000FFFFFFFFFFFF999999999999FFFFFFFFFFFFFFFFFFFFFFFF
          CCCCCC666666000000666666CCCCCC999999000000FFFFFFFFFFFF000000C0C0
          C0000000FFFFFFFFFFFF000000CCCCCCFFFFFFFFFFFFFFFFFFFFFFFF00000099
          9999000000999999000000000000000000FFFFFFFFFFFF000000C0C0C0000000
          FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFCCCCCC0000000000000000
          00000000666666CCCCCC000000000000FFFFFF000000C0C0C0000000FFFFFFFF
          FFFF000000FFFFFFCCCCCCFFFFFFFFFFFF999999000000000000666666CCCCCC
          000000CCCCCC666666000000FFFFFF000000C0C0C0000000FFFFFFFFFFFF0000
          00FFFFFFCCCCCCFFFFFFFFFFFF666666000000999999000000CCCCCC00000066
          6666CCCCCC000000FFFFFF000000C0C0C0000000FFFFFFFFFFFF000000FFFFFF
          CCCCCCFFFFFFFFFFFF999999000000CCCCCC000000666666CCCCCC0000000000
          00FFFFFFFFFFFF000000C0C0C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC66
          6666FFFFFFFFFFFF000000666666CCCCCC000000FFFFFF000000FFFFFFFFFFFF
          FFFFFF000000C0C0C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC0000009999
          99FFFFFF000000000000FFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFF00
          0000C0C0C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC000000000000FFFFFF
          666666000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0
          C0000000FFFFFFFFFFFF000000FFFFFFCCCCCC000000000000FFFFFFCCCCCC00
          0000FFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C0C0C0000000
          FFFFFFFFFFFF000000FFFFFFCCCCCC000000000000FFFFFFCCCCCC000000FFFF
          FFFFFFFF000000000000000000000000000000000000C0C0C0000000FFFFFFFF
          FFFF000000FFFFFFCCCCCC000000FFFFFF000000000000FFFFFFFFFFFFFFFFFF
          000000FFFFFFFFFFFFFFFFFF000000C0C0C0C0C0C0000000FFFFFFFFFFFF0000
          00FFFFFFCCCCCC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
          FFFFFFFFFF000000C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFF000000FFFFFF
          666666000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF0000
          00C0C0C0C0C0C0C0C0C0C0C0C0000000000000000000000000FFFFFF99999900
          0000000000000000000000000000000000000000000000000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000999999999999000000C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
      end
      object Z2bbtnCanc2: TBitBtn
        Left = 121
        Top = 0
        Width = 32
        Height = 31
        Hint = 'Cancela Actualizaciones del Detalle'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        TabStop = False
        OnClick = Z2bbtnCanc2Click
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
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
      object Z2bbtnGraba: TBitBtn
        Left = 52
        Top = 0
        Width = 32
        Height = 31
        Hint = 'Grabar Registro'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        TabStop = False
        OnClick = Z2bbtnGrabaClick
        Glyph.Data = {
          8A010000424D8A01000000000000760000002800000017000000170000000100
          0400000000001401000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333303000077777777777770003300000078888888888880000300000
          0780088888888800003000000780088888888800003000000780088888888800
          0030000007888888888888000030000000000000000000000030000000000000
          0000000000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
          FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF00
          00300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFF
          FFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
          FFFFFFFFFFFFFF07703000009999999999999907703000009999999999999900
          0030300099999999999999000330}
      end
      object Z2bbtnNuevo: TBitBtn
        Left = 157
        Top = 0
        Width = 32
        Height = 31
        Hint = 'Nueva Nota de Ingreso'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -17
        Font.Name = 'Garamond'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        TabStop = False
        OnClick = Z2bbtnNuevoClick
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
      end
    end
    object Memo1: TMemo
      Left = 48
      Top = 152
      Width = 185
      Height = 89
      TabOrder = 3
      Visible = False
    end
    object cbDisenoRep: TCheckBox
      Left = 328
      Top = 321
      Width = 97
      Height = 17
      Caption = 'Dise'#241'o Rep'
      TabOrder = 4
      Visible = False
    end
  end
  object pnlCabecera: TPanel
    Left = 0
    Top = 0
    Width = 816
    Height = 241
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 14869218
    TabOrder = 0
    object lblCia: TLabel
      Left = 16
      Top = 7
      Width = 49
      Height = 15
      Caption = 'Compa'#241#237'a'
    end
    object lblNro: TLabel
      Left = 681
      Top = 51
      Width = 81
      Height = 15
      Caption = 'N'#186' Nota de Ing.'
    end
    object lblObs: TLabel
      Left = 410
      Top = 144
      Width = 151
      Height = 15
      Caption = 'Observaciones / Comentarios'
    end
    object lblAlm: TLabel
      Left = 586
      Top = 7
      Width = 43
      Height = 15
      Caption = 'Almac'#233'n'
    end
    object lblFIng: TLabel
      Left = 257
      Top = 51
      Width = 80
      Height = 15
      Caption = 'F. Nota Ingreso'
    end
    object lblDref: TLabel
      Left = 17
      Top = 145
      Width = 132
      Height = 15
      Caption = 'Documento de Referencia'
    end
    object lblNDoc: TLabel
      Left = 206
      Top = 144
      Width = 73
      Height = 15
      Caption = 'N'#186' Documento'
      Enabled = False
    end
    object lblFDoc: TLabel
      Left = 311
      Top = 144
      Width = 89
      Height = 15
      Caption = 'Fecha Documento'
      Enabled = False
    end
    object lblTrans: TLabel
      Left = 356
      Top = 51
      Width = 63
      Height = 15
      Caption = 'Transacci'#243'n'
    end
    object lblCC: TLabel
      Left = 16
      Top = 100
      Width = 85
      Height = 15
      Caption = 'Centro de Costos'
      Enabled = False
    end
    object lblProv: TLabel
      Left = 227
      Top = 100
      Width = 52
      Height = 15
      Caption = 'Proveedor'
      Enabled = False
    end
    object lblTDoc: TLabel
      Left = 16
      Top = 51
      Width = 97
      Height = 15
      Caption = 'Tipo de Documento'
    end
    object lblNOC: TLabel
      Left = 524
      Top = 100
      Width = 116
      Height = 15
      Caption = 'N'#186' Ordenes de Compra'
      Enabled = False
    end
    object lblLoc: TLabel
      Left = 206
      Top = 7
      Width = 49
      Height = 15
      Caption = 'Localidad'
    end
    object DEBEL: TBevel
      Left = 12
      Top = 97
      Width = 770
      Height = 7
      Shape = bsTopLine
    end
    object lblLote: TLabel
      Left = 673
      Top = 139
      Width = 22
      Height = 15
      Caption = 'Lote'
      Visible = False
    end
    object lblPacked: TLabel
      Left = 117
      Top = 187
      Width = 70
      Height = 15
      Caption = 'Packed Order'
    end
    object lblNPed: TLabel
      Left = 17
      Top = 187
      Width = 92
      Height = 15
      Caption = 'Numero de Pedido'
    end
    object Label1: TLabel
      Left = 396
      Top = 7
      Width = 68
      Height = 15
      Caption = 'T. Inventario'
    end
    object lblNroNota: TLabel
      Left = 213
      Top = 187
      Width = 78
      Height = 15
      Caption = 'N'#186' Nota Salida'
      Enabled = False
      Visible = False
    end
    object lblClie: TLabel
      Left = 227
      Top = 100
      Width = 36
      Height = 15
      Caption = 'Cliente'
      Enabled = False
    end
    object lblGuia: TLabel
      Left = 212
      Top = 187
      Width = 24
      Height = 15
      Caption = 'Guia'
      Enabled = False
      Visible = False
    end
    object Label12: TLabel
      Left = 326
      Top = 187
      Width = 48
      Height = 17
      Caption = 'T.Cambio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object dblcdProv: TwwDBLookupComboDlg
      Left = 227
      Top = 116
      Width = 85
      Height = 23
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taCenter
      Caption = 'Proveedores'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'PROV'#9'8'#9'ID'#9'F'
        'PROVDES'#9'40'#9'Descripci'#243'n'#9'F'
        'PROVABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'PROV'
      LookupField = 'PROV'
      Enabled = False
      TabOrder = 15
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnEnter = dblcdProvEnter
      OnExit = dblcdProvExit
    end
    object dblcdClie: TwwDBLookupComboDlg
      Left = 227
      Top = 116
      Width = 82
      Height = 23
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taCenter
      Caption = 'Cliente'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'CLIEID'#9'15'#9'C'#243'digo'#9'F'
        'CLIEDES'#9'40'#9'Nombres'#9'F'
        'CLIERUC'#9'15'#9'R.U.C.'#9'F')
      DataField = 'CLIEID'
      LookupField = 'CLIEID'
      Enabled = False
      TabOrder = 16
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      UseTFields = False
      ShowMatchText = True
      OnEnter = dblcdClieEnter
    end
    object dbeTDNISA: TEdit
      Left = 67
      Top = 66
      Width = 186
      Height = 23
      Enabled = False
      TabOrder = 9
    end
    object dbeCIA: TEdit
      Left = 66
      Top = 24
      Width = 135
      Height = 23
      Enabled = False
      TabOrder = 1
    end
    object edNOrdC: TEdit
      Left = 544
      Top = 116
      Width = 234
      Height = 23
      Enabled = False
      ReadOnly = True
      TabOrder = 20
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
      DataField = 'CIAID'
      LookupField = 'CIAID'
      Options = [loColLines, loTitles]
      MaxLength = 2
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcCIAExit
      OnNotInList = dblcNotInList
    end
    object Z2bbtnOK: TBitBtn
      Left = 719
      Top = 200
      Width = 28
      Height = 24
      Hint = 'Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 32
      OnClick = Z2bbtnOKClick
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
    object Z2bbtnBorrar: TBitBtn
      Left = 719
      Top = 167
      Width = 28
      Height = 28
      Hint = 'Modificar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 33
      OnClick = Z2bbtnBorrarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
    end
    object dbmObs: TDBMemo
      Left = 410
      Top = 161
      Width = 305
      Height = 66
      DataField = 'NISAOBS'
      ScrollBars = ssVertical
      TabOrder = 31
      OnKeyPress = dbmObsKeyPress
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
      DataField = 'ALMID'
      LookupField = 'ALMID'
      Options = [loColLines, loTitles]
      DropDownCount = 18
      MaxLength = 2
      TabOrder = 6
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnEnter = dblcTALMEnter
      OnExit = dblcTALMExit
      OnNotInList = dblcNotInList
    end
    object dbdtpFNS: TwwDBDateTimePicker
      Left = 257
      Top = 66
      Width = 96
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'NISAFREG'
      Epoch = 1950
      ShowButton = True
      TabOrder = 10
      DisplayFormat = 'dd/mm/yyyy'
      OnExit = dbdtpFNSExit
    end
    object dbeNDoc: TwwDBEdit
      Left = 206
      Top = 161
      Width = 102
      Height = 23
      CharCase = ecUpperCase
      DataField = 'NISANDOC'
      Enabled = False
      TabOrder = 23
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeNDocExit
    end
    object dbdtpFDoc: TwwDBDateTimePicker
      Left = 311
      Top = 161
      Width = 94
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'NISAFDOC'
      Epoch = 1950
      Enabled = False
      ShowButton = True
      TabOrder = 24
      DisplayFormat = 'dd/mm/yyyy'
    end
    object dblcdTDOC: TwwDBLookupComboDlg
      Left = 17
      Top = 161
      Width = 49
      Height = 23
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taCenter
      Caption = 'Documento de Referencia ...'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'DOCID'#9'2'#9'ID'#9'F'
        'DOCDES'#9'30'#9'Descripci'#243'n'#9'F'
        'DOCABR'#9'8'#9'Abreviatura'#9'F')
      DataField = 'DOCID'
      LookupField = 'DOCID'
      MaxLength = 2
      TabOrder = 21
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcdTDOCExit
    end
    object dblcTransac: TwwDBLookupCombo
      Left = 356
      Top = 66
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TRIID'#9'2'#9'ID'#9'F'
        'TRIDES'#9'40'#9'Descripci'#243'n'#9'F')
      DataField = 'TRIID'
      LookupField = 'TRIID'
      Options = [loColLines, loTitles]
      DropDownCount = 18
      MaxLength = 2
      TabOrder = 11
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnEnter = dblcTransacEnter
      OnExit = dblcTransacExit
      OnNotInList = dblcNotInList
    end
    object dblcdCC: TwwDBLookupComboDlg
      Left = 16
      Top = 116
      Width = 51
      Height = 23
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taCenter
      Caption = 'Centro de Costos'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'CCOSID'#9'3'#9'ID'#9'F'
        'CCOSDES'#9'40'#9'Descripci'#243'n'#9'F'
        'CCOSABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'CCOSID'
      LookupField = 'CCOSID'
      Enabled = False
      MaxLength = 3
      TabOrder = 13
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcdCCExit
    end
    object dblcTDA: TwwDBLookupCombo
      Left = 16
      Top = 66
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TDAID'#9'2'#9'ID'#9'F'
        'TDADES'#9'40'#9'Descripci'#243'n'#9'F'
        'TDAABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'TDAID'
      LookupField = 'TDAID'
      Options = [loColLines, loTitles]
      DropDownCount = 18
      MaxLength = 2
      TabOrder = 8
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcTDAExit
      OnNotInList = dblcNotInList
    end
    object btnOC: TButton
      Left = 525
      Top = 116
      Width = 18
      Height = 23
      Caption = '>>'
      Enabled = False
      TabOrder = 19
      TabStop = False
      OnClick = btnOCClick
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
      DataField = 'LOCID'
      LookupField = 'LOCID'
      Options = [loColLines, loTitles]
      DropDownCount = 18
      MaxLength = 2
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnEnter = dblcLOCEnter
      OnExit = dblcLOCExit
      OnNotInList = dblcNotInList
    end
    object dbeLote1: TwwDBEdit
      Left = 697
      Top = 140
      Width = 87
      Height = 23
      CharCase = ecUpperCase
      DataField = 'NISALOTE'
      TabOrder = 28
      UnboundDataType = wwDefault
      Visible = False
      WantReturns = False
      WordWrap = False
    end
    object dbePO: TwwDBEdit
      Left = 116
      Top = 204
      Width = 88
      Height = 23
      CharCase = ecUpperCase
      DataField = 'NISPORD'
      TabOrder = 27
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeNP: TwwDBEdit
      Left = 17
      Top = 204
      Width = 94
      Height = 23
      CharCase = ecUpperCase
      DataField = 'NISNPED'
      TabOrder = 25
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeTDOC: TEdit
      Left = 68
      Top = 161
      Width = 134
      Height = 23
      Enabled = False
      TabOrder = 22
    end
    object dbeLOC: TEdit
      Left = 256
      Top = 24
      Width = 135
      Height = 23
      Enabled = False
      TabOrder = 3
    end
    object dbeALM: TEdit
      Left = 636
      Top = 24
      Width = 135
      Height = 23
      Enabled = False
      TabOrder = 7
    end
    object dbeTransac: TEdit
      Left = 407
      Top = 66
      Width = 270
      Height = 23
      Enabled = False
      TabOrder = 12
    end
    object dbeCC: TEdit
      Left = 68
      Top = 116
      Width = 154
      Height = 23
      Enabled = False
      TabOrder = 14
    end
    object dbeProv: TEdit
      Left = 312
      Top = 116
      Width = 206
      Height = 23
      Enabled = False
      TabOrder = 17
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
      DataField = 'TINID'
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
      OnNotInList = dblcNotInList
    end
    object dbeTIN: TEdit
      Left = 447
      Top = 24
      Width = 135
      Height = 23
      Enabled = False
      TabOrder = 5
    end
    object dblcdNSal: TwwDBLookupComboDlg
      Left = 212
      Top = 204
      Width = 107
      Height = 23
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taCenter
      Caption = 'Documento de Referencia ...'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'NISAID'#9'15'#9'N'#186' Nota Salida'#9'F'
        'NISAFREG'#9'10'#9'Fecha Registro'#9'F'
        'CCOSID'#9'15'#9'Centro de Costo'#9'F')
      DataField = 'NISAIDNSAL'
      LookupField = 'NISAID'
      Enabled = False
      MaxLength = 2
      TabOrder = 29
      Visible = False
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnDropDown = dblcdNSalDropDown
      OnExit = dblcdNSalExit
    end
    object dblcdGuia: TwwDBLookupComboDlg
      Left = 213
      Top = 204
      Width = 105
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Guia'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'NGUIA'#9'10'#9'Guia'#9'F'
        'GREMFECHA'#9'10'#9'Fecha'#9'F')
      DataField = 'NISANDOC'
      LookupField = 'NGUIA'
      Enabled = False
      TabOrder = 30
      Visible = False
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      UseTFields = False
      OnExit = dblcdGuiaExit
    end
    object dblcdPedido: TwwDBLookupComboDlg
      Left = 17
      Top = 204
      Width = 96
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Busquedad'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'PEDIDO'#9'10'#9'Pedido'#9'F'
        'PEDFECHA'#9'10'#9'Fecha'#9'F')
      DataField = 'NISNPED'
      LookupField = 'PEDIDO'
      Enabled = False
      TabOrder = 26
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      UseTFields = False
      OnExit = dblcdPedidoExit
    end
    object dbeClie: TEdit
      Left = 312
      Top = 116
      Width = 206
      Height = 23
      Enabled = False
      TabOrder = 18
    end
    object bbtnLote: TBitBtn
      Left = 750
      Top = 167
      Width = 28
      Height = 28
      Hint = 'Ingresa datos del Lote'
      TabOrder = 34
      Visible = False
      OnClick = bbtnLoteClick
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
    object dbeTCambio: TwwDBEdit
      Left = 326
      Top = 204
      Width = 55
      Height = 25
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      DataField = 'CPTCAMPR'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 35
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object TPanel
      Left = 681
      Top = 64
      Width = 97
      Height = 24
      Enabled = False
      TabOrder = 36
      object dbeNumNISA: TwwDBEdit
        Left = 1
        Top = 1
        Width = 94
        Height = 21
        CharCase = ecUpperCase
        Color = clInfoBk
        DataField = 'NISAID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 8
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeNumNISAExit
        OnKeyPress = dbeNumNISAKeyPress
      end
    end
  end
  object pnlActuali: TPanel
    Left = 288
    Top = 320
    Width = 185
    Height = 57
    BevelInner = bvLowered
    BorderStyle = bsSingle
    Color = 7566265
    Enabled = False
    TabOrder = 6
    Visible = False
    object lblActuali: TLabel
      Left = 2
      Top = 2
      Width = 177
      Height = 49
      Align = alClient
      Alignment = taCenter
      Caption = 'Actualizando...'
      Color = 7566265
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
  end
  object Z2bbtnSalir: TBitBtn
    Left = 749
    Top = 543
    Width = 32
    Height = 31
    Hint = 'Salir'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -17
    Font.Name = 'Garamond'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    TabStop = False
    OnClick = Z2bbtnSalirClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
  end
  object Z2bbtnPrint: TBitBtn
    Left = 521
    Top = 543
    Width = 32
    Height = 31
    Hint = 'Emitir Orden de Compra'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    TabStop = False
    OnClick = Z2bbtnPrintClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      0003377777777777777308888888888888807F33333333333337088888888888
      88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
      8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
      8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
  end
  object pnlDetalleA: TPanel
    Left = 540
    Top = 285
    Width = 594
    Height = 186
    Color = 14869218
    TabOrder = 2
    Visible = False
    object TBevel
      Left = 7
      Top = 24
      Width = 580
      Height = 124
      Shape = bsFrame
    end
    object TLabel
      Left = 14
      Top = 30
      Width = 14
      Height = 15
      Caption = 'N'#186
      Transparent = True
    end
    object TLabel
      Left = 64
      Top = 32
      Width = 42
      Height = 15
      Caption = 'Art'#237'culo'
      Transparent = True
    end
    object lblMedUni: TLabel
      Left = 15
      Top = 119
      Width = 84
      Height = 15
      Caption = 'Medida Unitaria'
      Transparent = True
    end
    object lblMotivo: TLabel
      Left = 287
      Top = 76
      Width = 36
      Height = 15
      Caption = 'Motivo'
      Visible = False
    end
    object lblPrecio: TLabel
      Left = 211
      Top = 76
      Width = 33
      Height = 15
      Caption = 'Precio'
      Transparent = True
    end
    object lblMedGnrl: TLabel
      Left = 15
      Top = 93
      Width = 81
      Height = 15
      Caption = 'Medida General'
      Transparent = True
    end
    object lblCant: TLabel
      Left = 141
      Top = 76
      Width = 45
      Height = 15
      Caption = 'Cantidad'
      Transparent = True
    end
    object Z2bbtnRegOk: TBitBtn
      Left = 487
      Top = 152
      Width = 30
      Height = 28
      Hint = 'Confirma Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = Z2bbtnRegOkClick
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
    object Z2bbtnRegCanc: TBitBtn
      Left = 528
      Top = 152
      Width = 30
      Height = 28
      Hint = 'Cancela Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = Z2bbtnRegCancClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
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
    object dbeItem: TwwDBEdit
      Left = 14
      Top = 49
      Width = 47
      Height = 23
      Enabled = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeArti: TwwDBEdit
      Left = 177
      Top = 49
      Width = 401
      Height = 23
      Enabled = False
      ReadOnly = True
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbcldArti: TwwDBLookupComboDlg
      Left = 64
      Top = 49
      Width = 111
      Height = 23
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Art'#237'culo'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'ARTID'#9'15'#9'ID'#9'F'
        'ARTDES'#9'40'#9'Descripci'#243'n'#9'F'
        'ARTABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'ARTID'
      LookupField = 'ARTID'
      SeqSearchOptions = []
      MaxLength = 15
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dbcldArtiExit
    end
    object dbeCantidadU: TwwDBEdit
      Left = 139
      Top = 117
      Width = 66
      Height = 23
      Picture.PictureMask = '*12[#][.*4[#]]'
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object stxTitulo2: TPanel
      Left = 1
      Top = 1
      Width = 592
      Height = 20
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'Detalle de Nota de Ingreso'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      OnExit = stxTitulo2Exit
    end
    object dblcConcAlm: TwwDBLookupCombo
      Left = 288
      Top = 91
      Width = 45
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CALID'#9'3'#9'ID'#9'F'
        'CALDESC'#9'35'#9'Descripcion'#9'F'
        'CALABR'#9'15'#9'Abreviatura'#9'F')
      LookupField = 'CALID'
      Options = [loColLines, loTitles]
      TabOrder = 7
      Visible = False
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcConcAlmExit
      OnNotInList = dblcNotInList
    end
    object dbePrecioG: TwwDBEdit
      Left = 209
      Top = 91
      Width = 74
      Height = 23
      Picture.PictureMask = '*12[#][.*5[#]]'
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnEnter = dbePrecioGEnter
      OnExit = dbePrecioGExit
    end
    object dbeCantidadG: TwwDBEdit
      Left = 139
      Top = 91
      Width = 66
      Height = 23
      Picture.PictureMask = '*12[#][.*4[#]]'
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeCantidadGExit
    end
    object dbePrecioU: TwwDBEdit
      Left = 209
      Top = 117
      Width = 74
      Height = 23
      Picture.PictureMask = '*12[#][.*4[#]]'
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnEnter = dbePrecioGEnter
      OnExit = dbePrecioUExit
    end
    object edtConcAlm: TEdit
      Left = 337
      Top = 91
      Width = 239
      Height = 23
      Enabled = False
      TabOrder = 8
      Visible = False
    end
  end
  object pnlSELOC: TPanel
    Left = 582
    Top = 341
    Width = 393
    Height = 159
    Color = 14869218
    TabOrder = 4
    Visible = False
    object lblOCom: TBevel
      Left = 6
      Top = 22
      Width = 384
      Height = 99
      Shape = bsFrame
    end
    object TLabel
      Left = 14
      Top = 29
      Width = 93
      Height = 15
      Caption = 'N'#186' Ord.de Compra'
    end
    object lblConCom: TLabel
      Left = 226
      Top = 29
      Width = 127
      Height = 15
      Caption = 'Condiciones Comerciales'
    end
    object lblFoCom: TLabel
      Left = 120
      Top = 29
      Width = 80
      Height = 15
      Caption = 'Fecha de Orden'
    end
    object lblTGen: TLabel
      Left = 162
      Top = 77
      Width = 69
      Height = 15
      Caption = 'Total General'
    end
    object Z2bbtnSOCOK1: TBitBtn
      Left = 318
      Top = 124
      Width = 30
      Height = 28
      Hint = 'Confirma Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = Z2bbtnSOCOK1Click
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
    object Z2bbtnSOCCA1: TBitBtn
      Left = 355
      Top = 124
      Width = 30
      Height = 28
      Hint = 'Cancela Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = Z2bbtnSOCCA1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
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
    object dblcdSODC: TwwDBLookupComboDlg
      Left = 13
      Top = 45
      Width = 103
      Height = 23
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taCenter
      Caption = 'Ordenes de Compra x Proveedor'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'ODCID'#9'9'#9'N'#186' Orden~de Compra'#9'F'
        'ODCFEMI'#9'18'#9'Fecha de Orden~de Compra'#9'F'
        'ODCTOTALG'#9'10'#9'Importe~Total'#9'F')
      DataField = 'ODCID'
      LookupField = 'ODCID'
      MaxLength = 2
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcdSODCExit
    end
    object dbeF1: TwwDBEdit
      Left = 118
      Top = 45
      Width = 104
      Height = 23
      CharCase = ecUpperCase
      DataField = 'ODCFEOC'
      Enabled = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeF2: TwwDBEdit
      Left = 224
      Top = 45
      Width = 157
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object stxTitulo4: TPanel
      Left = 1
      Top = 1
      Width = 391
      Height = 20
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'Selecci'#243'n de Ordenes de Compra'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object dbeF3: TwwDBEdit
      Left = 130
      Top = 92
      Width = 133
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      Picture.PictureMask = '### ### ##0.0000'
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object bbtnKDXSerie: TBitBtn
    Left = 32
    Top = 543
    Width = 32
    Height = 31
    Hint = 'Actualiza Numeros de Serie'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = bbtnKDXSerieClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
      000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
      00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
      F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
      0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
      FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
      FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
      0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
      00333377737FFFFF773333303300000003333337337777777333}
    NumGlyphs = 2
  end
  object pnlLote: TPanel
    Left = 645
    Top = 379
    Width = 249
    Height = 81
    BevelInner = bvLowered
    BevelWidth = 2
    Color = 14869218
    TabOrder = 11
    Visible = False
    object Label2: TLabel
      Left = 16
      Top = 22
      Width = 40
      Height = 15
      Caption = 'N'#250'mero'
    end
    object Label3: TLabel
      Left = 112
      Top = 22
      Width = 30
      Height = 15
      Caption = 'Fecha'
    end
    object StaticText2: TStaticText
      Left = 4
      Top = 4
      Width = 241
      Height = 17
      Align = alTop
      Alignment = taCenter
      Caption = 'Lote'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
    object dbeLote: TwwDBEdit
      Left = 16
      Top = 38
      Width = 89
      Height = 23
      DataField = 'NISALOTE'
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dtpFecLote: TwwDBDateTimePicker
      Left = 112
      Top = 38
      Width = 121
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'NISAFEXP'
      Epoch = 1950
      ShowButton = True
      TabOrder = 2
    end
    object bbntnCancelLote: TBitBtn
      Left = 224
      Top = 5
      Width = 19
      Height = 16
      Cancel = True
      Caption = 'X'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = bbntnCancelLoteClick
      NumGlyphs = 2
    end
  end
  object pnlNIxOC: TPanel
    Left = 746
    Top = 256
    Width = 641
    Height = 269
    Color = 14869218
    TabOrder = 5
    Visible = False
    object TBevel
      Left = 5
      Top = 20
      Width = 634
      Height = 208
      Shape = bsFrame
    end
    object z2bbtnOkNIOC: TBitBtn
      Left = 279
      Top = 232
      Width = 36
      Height = 28
      Hint = 'Confirma Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = z2bbtnOkNIOCClick
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
    object z2bbtnCancNIOC: TBitBtn
      Left = 327
      Top = 232
      Width = 36
      Height = 28
      Hint = 'Cancela Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = z2bbtnCancNIOCClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
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
    object dbgNIxOC: TwwDBGrid
      Left = 8
      Top = 23
      Width = 625
      Height = 200
      DisableThemesInTitle = False
      Selected.Strings = (
        'ODCID'#9'8'#9'N'#186' ~O. Compra'#9'F'
        'DODCID'#9'5'#9'Id'
        'ARTID'#9'7'#9'Articulo'
        'DET'#9'40'#9'Detalle'
        'UNMID'#9'3'#9'U~Med'
        'TPMED'#9'3'#9'Tipo~Med'
        'CANT'#9'6'#9'Cant.'
        'PUNIT'#9'8'#9'Precio~Unit'
        'PUNITATN'#9'8'#9'Precio~Unit IGV')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      KeyOptions = [dgAllowDelete]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ReadOnly = True
      TabOrder = 2
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      OnDblClick = dbgNIxOCDblClick
    end
    object stxNIxOC: TStaticText
      Left = 1
      Top = 1
      Width = 639
      Height = 17
      Align = alTop
      Alignment = taCenter
      Caption = 'Articulos existentes en la Ordenes de Compra seleccionados'
      Color = clHighlight
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 3
    end
  end
  object pnlOC: TPanel
    Left = 784
    Top = 21
    Width = 452
    Height = 302
    Caption = 'pnlOC'
    Color = 14869218
    TabOrder = 3
    Visible = False
    object TBevel
      Left = 4
      Top = 26
      Width = 443
      Height = 238
      Shape = bsFrame
    end
    object Z2bbtnSOCOK: TBitBtn
      Left = 384
      Top = 269
      Width = 30
      Height = 28
      Hint = 'Confirma Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = Z2bbtnSOCOKClick
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
    object Z2bbtnSOCCA: TBitBtn
      Left = 416
      Top = 269
      Width = 30
      Height = 28
      Hint = 'Cancela Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Z2bbtnSOCCAClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
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
    object stxTitulo3: TPanel
      Left = 1
      Top = 1
      Width = 450
      Height = 20
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'Selecci'#243'n de Ordenes de Compra'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object dbgOrdComp: TwwDBGrid
      Left = 9
      Top = 30
      Width = 432
      Height = 227
      DisableThemesInTitle = False
      Selected.Strings = (
        'ODCID'#9'14'#9'N'#186' Orden~de Compra'#9'F'
        'ODCFEOC'#9'15'#9'Fecha de~Orden Compra'#9'F'
        'ODCTOTALG'#9'18'#9'Importe~Total'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = 7566265
      FixedCols = 0
      ShowHorzScrollBar = True
      Color = clWhite
      KeyOptions = [dgAllowDelete]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgWordWrap]
      ReadOnly = True
      RowHeightPercent = 95
      TabOrder = 2
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      UseTFields = False
      OnDblClick = dbgOrdCompDblClick
      OnKeyDown = dbgOrdCompKeyDown
      object dbgOrdCompIbtn: TwwIButton
        Left = 0
        Top = 0
        Width = 27
        Height = 34
        AllowAllUp = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clYellow
        Font.Height = -12
        Font.Name = 'Comic Sans MS'
        Font.Style = []
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
        ParentFont = False
        OnClick = dbgOrdCompIbtnClick
      end
    end
  end
  object bbtnDetxOC: TBitBtn
    Left = 72
    Top = 543
    Width = 32
    Height = 31
    Hint = 'Detalle desde O.Compra'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    Visible = False
    OnClick = bbtnDetxOCClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550FF0559
      1950555FF75F7557F7F757000FF055591903557775F75557F77570FFFF055559
      1933575FF57F5557F7FF0F00FF05555919337F775F7F5557F7F700550F055559
      193577557F7F55F7577F07550F0555999995755575755F7FFF7F5570F0755011
      11155557F755F777777555000755033305555577755F75F77F55555555503335
      0555555FF5F75F757F5555005503335505555577FF75F7557F55505050333555
      05555757F75F75557F5505000333555505557F777FF755557F55000000355557
      07557777777F55557F5555000005555707555577777FF5557F55553000075557
      0755557F7777FFF5755555335000005555555577577777555555}
    NumGlyphs = 2
  end
  object bbtnRecalSld: TBitBtn
    Left = 178
    Top = 543
    Width = 32
    Height = 31
    Hint = 'Calcula Saldos'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    Visible = False
    OnClick = bbtnRecalSldClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550FF0559
      1950555FF75F7557F7F757000FF055591903557775F75557F77570FFFF055559
      1933575FF57F5557F7FF0F00FF05555919337F775F7F5557F7F700550F055559
      193577557F7F55F7577F07550F0555999995755575755F7FFF7F5570F0755011
      11155557F755F777777555000755033305555577755F75F77F55555555503335
      0555555FF5F75F757F5555005503335505555577FF75F7557F55505050333555
      05555757F75F75557F5505000333555505557F777FF755557F55000000355557
      07557777777F55557F5555000005555707555577777FF5557F55553000075557
      0755557F7777FFF5755555335000005555555577577777555555}
    NumGlyphs = 2
  end
  object bbtnDetxTransf: TBitBtn
    Left = 112
    Top = 543
    Width = 32
    Height = 31
    Hint = 'Detalle por Transferencia'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    Visible = False
    OnClick = bbtnDetxTransfClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550FF0559
      1950555FF75F7557F7F757000FF055591903557775F75557F77570FFFF055559
      1933575FF57F5557F7FF0F00FF05555919337F775F7F5557F7F700550F055559
      193577557F7F55F7577F07550F0555999995755575755F7FFF7F5570F0755011
      11155557F755F777777555000755033305555577755F75F77F55555555503335
      0555555FF5F75F757F5555005503335505555577FF75F7557F55505050333555
      05555757F75F75557F5505000333555505557F777FF755557F55000000355557
      07557777777F55557F5555000005555707555577777FF5557F55553000075557
      0755557F7777FFF5755555335000005555555577577777555555}
    NumGlyphs = 2
  end
  object Button1: TButton
    Left = 224
    Top = 552
    Width = 75
    Height = 25
    Caption = 'Estado'
    TabOrder = 15
    Visible = False
    OnClick = Button1Click
  end
  object pnlNumeSerie: TPanel
    Left = 761
    Top = 41
    Width = 778
    Height = 346
    BevelInner = bvLowered
    BevelWidth = 2
    Color = 14869218
    TabOrder = 9
    Visible = False
    object Bevel1: TBevel
      Left = 4
      Top = 22
      Width = 764
      Height = 251
    end
    object Label4: TLabel
      Left = 472
      Top = 277
      Width = 35
      Height = 15
      Caption = 'Codigo'
    end
    object Label5: TLabel
      Left = 472
      Top = 292
      Width = 34
      Height = 15
      Caption = 'Barras'
    end
    object Label6: TLabel
      Left = 574
      Top = 304
      Width = 102
      Height = 15
      Caption = 'Verifica Duplicidad'
    end
    object Label7: TLabel
      Left = 573
      Top = 319
      Width = 127
      Height = 15
      Caption = 'de Serie y Cod.Barras -->'
    end
    object lblMarca: TLabel
      Left = 16
      Top = 277
      Width = 33
      Height = 15
      Caption = 'Marca'
    end
    object lblModelo: TLabel
      Left = 15
      Top = 322
      Width = 37
      Height = 15
      Caption = 'Modelo'
    end
    object lblColor: TLabel
      Left = 288
      Top = 317
      Width = 27
      Height = 15
      Caption = 'Color'
    end
    object StaticText1: TStaticText
      Left = 4
      Top = 4
      Width = 770
      Height = 17
      Align = alTop
      Alignment = taCenter
      Caption = 'Detalle de N'#250'meros de Serie'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
    object dbgGridSerie: TwwDBGrid
      Left = 7
      Top = 24
      Width = 757
      Height = 241
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = 7566265
      FixedCols = 0
      ShowHorzScrollBar = True
      Color = clWhite
      KeyOptions = [dgEnterToTab]
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
    end
    object bbtnOKSerie: TBitBtn
      Left = 702
      Top = 309
      Width = 34
      Height = 25
      Hint = 'Cheque Duplicidad (Serie, Barras)'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = bbtnOKSerieClick
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
    object bbtnCancelSerie: TBitBtn
      Left = 737
      Top = 309
      Width = 34
      Height = 25
      Cancel = True
      TabOrder = 9
      OnClick = bbtnCancelSerieClick
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
    object edCodBar: TEdit
      Left = 520
      Top = 280
      Width = 73
      Height = 23
      MaxLength = 6
      TabOrder = 6
    end
    object bbtnCodBar: TBitBtn
      Left = 603
      Top = 280
      Width = 33
      Height = 25
      Hint = 'Actualiza Codigo Barrras'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = bbtnCodBarClick
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
    object edMarca: TEdit
      Left = 64
      Top = 280
      Width = 105
      Height = 23
      MaxLength = 20
      TabOrder = 2
    end
    object edModelo: TEdit
      Left = 64
      Top = 312
      Width = 217
      Height = 23
      MaxLength = 20
      TabOrder = 3
    end
    object edColor: TEdit
      Left = 320
      Top = 312
      Width = 73
      Height = 23
      MaxLength = 20
      TabOrder = 4
    end
    object bbtnMarca: TBitBtn
      Left = 411
      Top = 312
      Width = 33
      Height = 25
      Hint = 'Actualiza Codigo Marca,Modelo,Color'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = bbtnMarcaClick
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
  end
  object ppDBCab: TppDBPipeline
    UserName = 'DBCab'
    Left = 492
    Top = 6
  end
  object ppdbOC: TppDBPipeline
    UserName = 'dbOC'
    Left = 638
    Top = 13
  end
  object pprNiaEnt: TppReport
    AutoStop = False
    DataPipeline = ppDBCab
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rNiaEnt'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 350
    PrinterSetup.mmMarginLeft = 350
    PrinterSetup.mmMarginRight = 350
    PrinterSetup.mmMarginTop = 350
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 1
    Template.FileName = 
      'D:\01.Abelardo\02.Derrama_Trabajos\40.Pendientes Servicios Gener' +
      'ales\HPP_201102_ALM\RTM\ALM\NISAENT.RTM'
    Template.SaveTo = stDatabase
    Units = utMillimeters
    BeforePrint = pprNiaEntBeforePrint
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprNiaEntPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 374
    Top = 85
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBCab'
    object ppHeaderBand2: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 86519
      mmPrintPosition = 0
      object ppDBText57: TppDBText
        UserName = 'DBText57'
        DataField = 'NISAID'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 167746
        mmTop = 7408
        mmWidth = 34925
        BandType = 0
      end
      object ppDBText58: TppDBText
        UserName = 'DBText58'
        DataField = 'NISAFREG'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 167746
        mmTop = 12700
        mmWidth = 23813
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'Almac'#233'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8202
        mmTop = 42598
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'Almac'#233'n Destino'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8202
        mmTop = 47625
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'Proveedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8202
        mmTop = 52652
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = 'N'#186
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 160073
        mmTop = 7408
        mmWidth = 3440
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = 'FECHA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 155046
        mmTop = 12700
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Caption = 'Guia de Entrada de Almac'#233'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 10cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 87048
        mmTop = 24342
        mmWidth = 39423
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        AutoSize = False
        Caption = 'Departamento de Almac'#233'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 4498
        mmLeft = 7144
        mmTop = 16140
        mmWidth = 84402
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label46'
        Caption = 'CODIGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 24606
        mmTop = 79640
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        Caption = 'D E S C R I P C I O N '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 45508
        mmTop = 79640
        mmWidth = 29898
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        Caption = 'U.M.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 142875
        mmTop = 79640
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'Label202'
        Caption = 'CANT.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 157692
        mmTop = 79640
        mmWidth = 8996
        BandType = 0
      end
      object ppDBText70: TppDBText
        UserName = 'DBText1'
        DataField = 'CIADES'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 10cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3969
        mmLeft = 6879
        mmTop = 9260
        mmWidth = 110596
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'ALMDES'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 40217
        mmTop = 42598
        mmWidth = 84138
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'ALMDESORI'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 40217
        mmTop = 47625
        mmWidth = 84138
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Observaciones'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8202
        mmTop = 72761
        mmWidth = 17463
        BandType = 0
      end
      object ppDBMemo3: TppDBMemo
        UserName = 'DBMemo3'
        CharWrap = False
        DataField = 'NISAOBS'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 40217
        mmTop = 72761
        mmWidth = 156369
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Pag.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 156369
        mmTop = 17463
        mmWidth = 5821
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 167746
        mmTop = 17463
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Item'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 7673
        mmTop = 79640
        mmWidth = 6350
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText2'
        DataField = 'TRIDES'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 265
        mmTop = 29633
        mmWidth = 209021
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Doc. Referen.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8202
        mmTop = 57679
        mmWidth = 16933
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText8'
        DataField = 'DOCDES'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 40217
        mmTop = 57679
        mmWidth = 84138
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'N'#186' Doc.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8202
        mmTop = 62706
        mmWidth = 9525
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText9'
        DataField = 'NISANDOC'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 40217
        mmTop = 62706
        mmWidth = 84138
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Ord. Compra'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8202
        mmTop = 67733
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3669
        mmLeft = 40217
        mmTop = 67733
        mmWidth = 776
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'TOTAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 195527
        mmTop = 79640
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'UNIT.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 176477
        mmTop = 79640
        mmWidth = 7673
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 529
        mmTop = 84402
        mmWidth = 208492
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText3'
        DataField = 'PROVDES'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 40217
        mmTop = 52652
        mmWidth = 83873
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText11'
        DataField = 'TINDES'
        DataPipeline = ppDBCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBCab'
        mmHeight = 3704
        mmLeft = 40217
        mmTop = 37306
        mmWidth = 84138
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Tipo de Inventario'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8202
        mmTop = 37042
        mmWidth = 23283
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      DataPipeline = ppdbOC
      object ppDBText60: TppDBText
        UserName = 'DBText60'
        DataField = 'ARTID'
        DataPipeline = ppdbOC
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 0
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText62: TppDBText
        UserName = 'DBText62'
        DataField = 'UNMABR'
        DataPipeline = ppdbOC
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3704
        mmLeft = 141288
        mmTop = 0
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText63: TppDBText
        UserName = 'DBText63'
        DataField = 'KDXCNT'
        DataPipeline = ppdbOC
        DisplayFormat = '### ###,###.#0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3704
        mmLeft = 152136
        mmTop = 0
        mmWidth = 15081
        BandType = 4
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = 'ARTDES'
        DataPipeline = ppdbOC
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3969
        mmLeft = 45508
        mmTop = 0
        mmWidth = 86254
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText7'
        DataField = 'KDXID'
        DataPipeline = ppdbOC
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3704
        mmLeft = 7673
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'TOTAL'
        DataPipeline = ppdbOC
        DisplayFormat = '###,###,##0.00000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3246
        mmLeft = 191823
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText4'
        DataField = 'ARTPC'
        DataPipeline = ppdbOC
        DisplayFormat = '###,###,##0.00000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3704
        mmLeft = 172509
        mmTop = 0
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'CODBAR'
        DataPipeline = ppDBLOG332
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBLOG332'
        mmHeight = 3175
        mmLeft = 129646
        mmTop = 265
        mmWidth = 9260
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Total Documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 133086
        mmTop = 1852
        mmWidth = 23283
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 179388
        mmTop = 529
        mmWidth = 26458
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        AutoSize = True
        DataField = 'TOTAL'
        DataPipeline = ppdbOC
        DisplayFormat = '###,###,##0.00000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbOC'
        mmHeight = 3302
        mmLeft = 188373
        mmTop = 1852
        mmWidth = 16679
        BandType = 7
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 179388
        mmTop = 6350
        mmWidth = 26458
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'ARTID'
        DataPipeline = ppdbOC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppdbOC'
        mmHeight = 3704
        mmLeft = 35190
        mmTop = 1852
        mmWidth = 17198
        BandType = 7
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Total Registros'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 11113
        mmTop = 1852
        mmWidth = 20638
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 529
        mmTop = 529
        mmWidth = 214313
        BandType = 7
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppReport1: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 304
    Top = 80
    Version = '7.02'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object ppDisenoRep: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = pprNiaEnt
    IniStorageType = 'IniFile'
    IniStorageName = 'C:\DemaExes\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 432
    Top = 96
  end
  object ppDBLOG332: TppDBPipeline
    UserName = 'dbCodBarras'
    Left = 678
    Top = 5
  end
end
