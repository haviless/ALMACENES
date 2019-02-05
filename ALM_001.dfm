object FGRemSalidasAlm: TFGRemSalidasAlm
  Left = 233
  Top = 94
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'SALIDAS DE ALMACEN'
  ClientHeight = 557
  ClientWidth = 769
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 6
    Top = 3
    Width = 760
    Height = 101
    Color = 14869218
    TabOrder = 0
    object fcLabel1: TfcLabel
      Left = 20
      Top = 8
      Width = 260
      Height = 32
      Caption = 'Salidas de Almacen'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TextOptions.Alignment = taLeftJustify
      TextOptions.VAlignment = vaTop
    end
    object lblCIA: TLabel
      Left = 21
      Top = 42
      Width = 49
      Height = 17
      Caption = 'Compa'#241#237'a'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 312
      Top = 42
      Width = 40
      Height = 17
      Caption = 'Periodo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object dblcCIA: TwwDBLookupCombo
      Left = 19
      Top = 62
      Width = 45
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'C'#243'digo'#9'F'
        'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
        'CIAABR'#9'15'#9'Abreviatura'#9'F')
      LookupField = 'CIAID'
      Options = [loColLines, loTitles]
      DropDownCount = 15
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcCIAExit
      OnNotInList = dblcCIANotInList
    end
    object dbeCIA: TEdit
      Left = 65
      Top = 62
      Width = 200
      Height = 23
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object seAno: TSpinEdit
      Left = 286
      Top = 62
      Width = 53
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      MaxLength = 4
      MaxValue = 2050
      MinValue = 2006
      ParentFont = False
      TabOrder = 2
      Value = 2006
    end
    object seMes: TSpinEdit
      Left = 343
      Top = 62
      Width = 43
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      MaxLength = 2
      MaxValue = 12
      MinValue = 1
      ParentFont = False
      TabOrder = 3
      Value = 12
    end
    object bbtnFiltra: TBitBtn
      Left = 405
      Top = 55
      Width = 38
      Height = 33
      Hint = 'Mostrar Gu'#237'as de Remisi'#243'n del Mes'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = bbtnFiltraClick
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
    object GroupBox1: TGroupBox
      Left = 488
      Top = 10
      Width = 249
      Height = 79
      Caption = 'Guia de Remisi'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object fcsbtnGuiaNueva: TfcShapeBtn
        Left = 13
        Top = 30
        Width = 106
        Height = 36
        Hint = 'Nueva Guia de Remisi'#243'n desde Nota de Salida'
        Caption = 'Nueva'
        Color = 14728630
        DitherColor = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        Layout = blGlyphRight
        NumGlyphs = 2
        Options = [boFocusable]
        ParentClipping = True
        ParentFont = False
        ParentShowHint = False
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        Shape = bsRoundRect
        ShowHint = True
        TabOrder = 0
        TabStop = True
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = fcsbtnGuiaNuevaClick
      end
      object fcbtnEditaGuia: TfcShapeBtn
        Left = 128
        Top = 30
        Width = 106
        Height = 36
        Hint = 'Editar Guia de Remisi'#243'n'
        Caption = 'Edita'
        Color = 14728630
        DitherColor = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        Layout = blGlyphRight
        NumGlyphs = 2
        Options = [boFocusable]
        ParentClipping = True
        ParentFont = False
        ParentShowHint = False
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        Shape = bsRoundRect
        ShowHint = True
        TabOrder = 1
        TabStop = True
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = fcbtnEditaGuiaClick
      end
    end
  end
  object dbgGuia: TwwDBGrid
    Left = 6
    Top = 107
    Width = 760
    Height = 395
    DisableThemesInTitle = False
    Selected.Strings = (
      'CIAID'#9'4'#9'C'#237'a'
      'NISANOMM'#9'7'#9'Periodo'
      'LOCID'#9'5'#9'Loc~Inv.'
      'TINID'#9'5'#9'Tipo~Inv.'
      'ALMID'#9'5'#9'Alm.'
      'TDAID'#9'5'#9'Doc.'
      'TRIID'#9'5'#9'Trans.'
      'NISAFREG'#9'10'#9'Fecha~Doc'
      'NISAID'#9'10'#9'Nota~Salida'
      'CCOSID'#9'08'#9'Centro~Costo'
      'NISSIT'#9'10'#9'Estado'
      'NISAUSER'#9'12'#9'Usuario')
    IniAttributes.Delimiter = ';;'
    TitleColor = 7566265
    FixedCols = 0
    ShowHorzScrollBar = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    KeyOptions = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    ParentFont = False
    TabOrder = 1
    TitleAlignment = taCenter
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clNavy
    TitleFont.Height = -11
    TitleFont.Name = 'Comic Sans MS'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = True
    OnTitleButtonClick = dbgGuiaTitleButtonClick
    OnDblClick = dbgGuiaDblClick
  end
  object Panel2: TPanel
    Left = 6
    Top = 504
    Width = 760
    Height = 41
    Color = 14869218
    TabOrder = 2
    object Z2bbtnSalir: TBitBtn
      Left = 704
      Top = 6
      Width = 32
      Height = 31
      Hint = 'Salir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'Garamond'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
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
    object pnlBusca: TPanel
      Left = 248
      Top = 5
      Width = 285
      Height = 32
      BevelInner = bvRaised
      TabOrder = 1
      Visible = False
      object lblBusca1: TLabel
        Left = 7
        Top = 10
        Width = 48
        Height = 13
        Caption = 'Busca por'
      end
      object lblBusca2: TLabel
        Left = 61
        Top = 10
        Width = 89
        Height = 13
        Caption = 'Titulo de cabecera'
      end
      object isBusca: TwwIncrementalSearch
        Left = 164
        Top = 5
        Width = 111
        Height = 21
        TabOrder = 0
        OnExit = isBuscaExit
      end
    end
    object Z2bbtnPrint: TBitBtn
      Left = 651
      Top = 6
      Width = 32
      Height = 31
      Hint = 'Imprimir Reporte de Guias de Remisi'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TabStop = False
      Visible = False
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
  end
end
