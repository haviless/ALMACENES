object FInventario: TFInventario
  Left = 282
  Top = 116
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Captura de Datos para Inventario F'#237'sico'
  ClientHeight = 446
  ClientWidth = 692
  Color = 14869218
  Constraints.MaxHeight = 484
  Constraints.MaxWidth = 708
  Constraints.MinHeight = 480
  Constraints.MinWidth = 600
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
  object pnlPrincipal: TPanel
    Left = 10
    Top = 7
    Width = 425
    Height = 186
    BevelWidth = 2
    BorderStyle = bsSingle
    Color = 14869218
    TabOrder = 0
    object lblArticulo: TLabel
      Left = 16
      Top = 7
      Width = 35
      Height = 16
      Caption = 'C'#243'digo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 128
      Top = 7
      Width = 45
      Height = 16
      Caption = 'U/Med.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 53
      Width = 45
      Height = 16
      Caption = 'Articulo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbeArtId: TwwDBEdit
      Left = 16
      Top = 23
      Width = 100
      Height = 23
      DataField = 'ARTID'
      DataSource = DMALM.dsDInventario
      Enabled = False
      ReadOnly = True
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeUMed: TwwDBEdit
      Left = 128
      Top = 23
      Width = 58
      Height = 23
      DataField = 'UNMIDG'
      DataSource = DMALM.dsDInventario
      Enabled = False
      ReadOnly = True
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object bbtnOk: TBitBtn
      Left = 331
      Top = 116
      Width = 80
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 4
      OnClick = bbtnOkClick
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
    object bbtnCanc: TBitBtn
      Left = 331
      Top = 145
      Width = 80
      Height = 25
      Cancel = True
      Caption = 'Cerrar'
      ModalResult = 2
      TabOrder = 5
      OnClick = bbtnCancClick
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
    object pnlIngreso: TPanel
      Left = 16
      Top = 104
      Width = 233
      Height = 70
      BevelInner = bvRaised
      BevelOuter = bvLowered
      BevelWidth = 2
      Color = 14869218
      TabOrder = 3
      object lblSGen: TLabel
        Left = 30
        Top = 10
        Width = 36
        Height = 19
        Caption = 'Stock'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 153
        Top = 7
        Width = 42
        Height = 19
        Caption = 'Estado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbeStock: TwwDBEdit
        Left = 21
        Top = 29
        Width = 76
        Height = 23
        Picture.PictureMask = '#[*#]'
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object cbEstado: TCheckBox
        Left = 144
        Top = 31
        Width = 58
        Height = 17
        Caption = 'Bueno'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbChecked
        TabOrder = 1
      end
    end
    object dbeArtDes: TwwDBEdit
      Left = 16
      Top = 69
      Width = 393
      Height = 23
      DataField = 'ARTDES'
      DataSource = DMALM.dsDInventario
      Enabled = False
      ReadOnly = True
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object Panel1: TPanel
    Left = 456
    Top = 7
    Width = 225
    Height = 186
    BevelWidth = 2
    BorderStyle = bsSingle
    Color = 14869218
    TabOrder = 1
    object Label4: TLabel
      Left = 2
      Top = 2
      Width = 217
      Height = 16
      Align = alTop
      Alignment = taCenter
      Caption = 'Buscar'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object dblcdArt: TwwDBLookupComboDlg
      Left = 11
      Top = 33
      Width = 85
      Height = 25
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      OnCloseDialog = dblcdArtCloseDialog
      Selected.Strings = (
        'ARTID'#9'10'#9'Art'#237'culo'#9'F'
        'ARTDES'#9'40'#9'Descripci'#243'n'#9'F')
      LookupField = 'ARTID'
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object bbtnBuscar: TBitBtn
      Left = 104
      Top = 30
      Width = 80
      Height = 30
      Caption = 'Buscar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = bbtnBuscarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
        300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
        330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
        333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
        339977FF777777773377000BFB03333333337773FF733333333F333000333333
        3300333777333333337733333333333333003333333333333377333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
    end
    object bbtnArtAnterior: TBitBtn
      Left = 20
      Top = 76
      Width = 130
      Height = 38
      Caption = 'Art Anterior'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      WordWrap = True
      OnClick = bbtnArtAnteriorClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000130B0000130B0000100000000000000000000000FFFF
        FF00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000111100000001
        1111111100000001111111110000000111111111000000011111111100000001
        1111111100000001111111110000000111111111000000011111000000000000
        0001100000000000001111000000000001111110000000001111111100000001
        1111111110000011111111111100011111111111111011111111}
      Spacing = 2
    end
    object bbtnArtSiguiente: TBitBtn
      Left = 20
      Top = 137
      Width = 130
      Height = 38
      Caption = 'Art Siguiente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = bbtnArtSiguienteClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000130B0000130B0000100000000000000000000000FFFF
        FF00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000111111110111
        1111111111100011111111111100000111111111100000001111111100000000
        0111111000000000001111000000000000011000000000000000111110000000
        1111111110000000111111111000000011111111100000001111111110000000
        1111111110000000111111111000000011111111100000001111}
      Spacing = 2
    end
  end
  object Panel2: TPanel
    Left = 9
    Top = 199
    Width = 672
    Height = 243
    BevelWidth = 2
    BorderStyle = bsSingle
    Color = 14869218
    TabOrder = 2
    object Label5: TLabel
      Left = 2
      Top = 2
      Width = 664
      Height = 16
      Align = alTop
      Alignment = taCenter
      Caption = 'Detalle Ingresado'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object dbgDetReg: TwwDBGrid
      Left = 14
      Top = 26
      Width = 643
      Height = 178
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DMALM.dsQry8
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = dbgDetRegCalcCellColors
      OnKeyDown = dbgDetRegKeyDown
      FooterHeight = 25
    end
    object bbtnFilReg: TBitBtn
      Left = 582
      Top = 208
      Width = 75
      Height = 25
      Caption = 'Filtrar'
      TabOrder = 1
      OnClick = bbtnFilRegClick
    end
  end
end
