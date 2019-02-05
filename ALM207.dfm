object FArtAtt: TFArtAtt
  Left = 119
  Top = 185
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Atenci'#243'n de Articulos por Orden de Compra '
  ClientHeight = 345
  ClientWidth = 734
  Color = 14869218
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Bevel1: TBevel
    Left = 4
    Top = -4
    Width = 725
    Height = 314
    Shape = bsFrame
  end
  object dbgODCATT: TwwDBGrid
    Left = 9
    Top = 2
    Width = 715
    Height = 124
    DisableThemesInTitle = False
    Selected.Strings = (
      'ODCID'#9'12'#9'N'#186' Orden~de Compra'#9'F'
      'ODCFEOC'#9'17'#9'Fecha de~Orden Compra'#9'F'
      'ODCTOTALG'#9'14'#9'Importe~Total'#9'F')
    IniAttributes.Delimiter = ';;'
    TitleColor = 7566265
    FixedCols = 0
    ShowHorzScrollBar = True
    Color = clWhite
    DataSource = DMALM.dsOCNIA
    KeyOptions = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
  end
  object stxTitulo6: TStaticText
    Left = 9
    Top = 129
    Width = 716
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSunken
    Caption = 'Art'#237'culos a Atender'
    Color = clHighlight
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ShowAccelChar = False
    TabOrder = 1
  end
  object dbgODARTT: TwwDBGrid
    Left = 9
    Top = 147
    Width = 716
    Height = 157
    DisableThemesInTitle = False
    Selected.Strings = (
      'DODCID'#9'5'#9'N'#186' Item'#9'F'
      'ARTID'#9'15'#9'C'#243'digo~Art'#237'culo'#9'F'
      'DODCCNT'#9'10'#9'Cant.~General'#9'F'
      'DODCCNTU'#9'10'#9'Canti.~Unitaria'#9'F'
      'DODCCATE'#9'10'#9'Cant. At.~Gral'#9'F'
      'DODCCATEU'#9'10'#9'Cant. At.~Unitaria'#9'F'
      'DODCCSLD'#9'10'#9'Saldo~General'#9'F'
      'DODCCSLDU'#9'10'#9'Saldo~Unitario'#9'F')
    IniAttributes.Delimiter = ';;'
    TitleColor = 7566265
    FixedCols = 0
    ShowHorzScrollBar = True
    Color = clWhite
    DataSource = DMALM.dsDOCATT
    KeyOptions = []
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
    UseTFields = False
    OnDblClick = dbgODARTTDblClick
  end
  object Z2bbtnOAOK: TBitBtn
    Left = 667
    Top = 315
    Width = 30
    Height = 28
    Hint = 'Confirma Actualizaci'#243'n'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = Z2bbtnOAOKClick
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
  object Z2bbtnOACancel: TBitBtn
    Left = 699
    Top = 315
    Width = 30
    Height = 28
    Hint = 'Cancela Actualizaci'#243'n'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = Z2bbtnOACancelClick
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
  object pnlAttArt: TPanel
    Left = 218
    Top = 219
    Width = 298
    Height = 121
    Color = 14869218
    TabOrder = 5
    Visible = False
    object Bevel2: TBevel
      Left = 5
      Top = 10
      Width = 289
      Height = 74
      Shape = bsFrame
    end
    object Label6: TLabel
      Left = 14
      Top = 25
      Width = 14
      Height = 15
      Caption = 'N'#186
      Transparent = True
    end
    object Label8: TLabel
      Left = 64
      Top = 27
      Width = 42
      Height = 15
      Caption = 'Art'#237'culo'
      Transparent = True
    end
    object Label9: TLabel
      Left = 178
      Top = 26
      Width = 98
      Height = 15
      Caption = 'Cantidad a Atender'
      Transparent = True
    end
    object StaticText1: TStaticText
      Left = 1
      Top = 1
      Width = 296
      Height = 17
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'Art'#237'culo a Atender'
      Color = clHighlight
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      TabOrder = 0
    end
    object Z2bbtnATTOK: TBitBtn
      Left = 230
      Top = 88
      Width = 30
      Height = 28
      Hint = 'Confirma Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Z2bbtnATTOKClick
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
    object Z2bbtnATTCancel: TBitBtn
      Left = 262
      Top = 88
      Width = 30
      Height = 28
      Hint = 'Cancela Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = Z2bbtnATTCancelClick
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
      Left = 13
      Top = 44
      Width = 47
      Height = 23
      DataField = 'DODCID'
      DataSource = DMALM.dsDOCATT
      Enabled = False
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblkdlgArti: TwwDBLookupComboDlg
      Left = 63
      Top = 44
      Width = 111
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Art'#237'culo'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'ARTID'#9'15'#9'C'#243'digo'#9'F'
        'ARTDES'#9'40'#9'Descripci'#243'n'#9'F'
        'ARTABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'ARTID'
      DataSource = DMALM.dsDOCATT
      LookupTable = DMALM.cdsArti
      LookupField = 'ARTID'
      Enabled = False
      MaxLength = 15
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = dbcldArtiChange
      OnExit = dblcExist
    end
    object dbeCNTA: TwwDBEdit
      Left = 177
      Top = 44
      Width = 59
      Height = 23
      DataField = 'DODCCNT'
      DataSource = DMALM.dsDOCATT
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit1: TwwDBEdit
      Left = 239
      Top = 43
      Width = 50
      Height = 23
      DataField = 'DODCCNTU'
      DataSource = DMALM.dsDOCATT
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
end
