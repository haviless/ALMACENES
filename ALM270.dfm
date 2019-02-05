object FRegArti: TFRegArti
  Left = 222
  Top = 183
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Maestro de Art'#237'culos '
  ClientHeight = 473
  ClientWidth = 786
  Color = 14869218
  Constraints.MaxHeight = 511
  Constraints.MaxWidth = 809
  Constraints.MinHeight = 461
  Constraints.MinWidth = 756
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Label11: TLabel
    Left = 48
    Top = 448
    Width = 27
    Height = 15
    Caption = 'V.3.0'
  end
  object pnlDetalleA: TPanel
    Left = 344
    Top = 166
    Width = 440
    Height = 115
    Color = 14869218
    TabOrder = 6
    Visible = False
    object bvlCAJA6: TBevel
      Left = 5
      Top = 20
      Width = 431
      Height = 53
      Shape = bsFrame
    end
    object lblArti: TLabel
      Left = 17
      Top = 23
      Width = 42
      Height = 15
      Caption = 'Art'#237'culo'
      Transparent = True
    end
    object Z2bbtnRegOk: TBitBtn
      Left = 374
      Top = 75
      Width = 30
      Height = 28
      Hint = 'Confirma Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
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
      Left = 406
      Top = 75
      Width = 30
      Height = 28
      Hint = 'Cancela Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
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
    object stxTitulo2: TStaticText
      Left = 1
      Top = 1
      Width = 438
      Height = 17
      Align = alTop
      Alignment = taCenter
      BorderStyle = sbsSunken
      Caption = 'Componentes de Art'#237'culo'
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
    object dbeArti: TwwDBEdit
      Left = 129
      Top = 39
      Width = 296
      Height = 23
      Enabled = False
      ReadOnly = True
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbcldArti: TwwDBLookupComboDlg
      Left = 15
      Top = 39
      Width = 113
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Art'#237'culo'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'ARTID'#9'15'#9'ID'#9'F'
        'ARTDES'#9'40'#9'Articulo'#9'F')
      LookupTable = DMALM.cdsKDXTemp
      LookupField = 'ARTID'
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnEnter = dbcldArtiEnter
      OnExit = dbcldArtiExit
    end
  end
  object pgArti: TPageControl
    Left = 1
    Top = 108
    Width = 777
    Height = 329
    ActivePage = tsGeneral
    Enabled = False
    HotTrack = True
    TabOrder = 4
    object tsGeneral: TTabSheet
      Caption = '&Datos Generales'
      object bvlCAJA0: TBevel
        Left = 0
        Top = 0
        Width = 769
        Height = 299
        Align = alClient
        Shape = bsFrame
      end
      object bvlCAJA1: TBevel
        Left = 11
        Top = 16
        Width = 342
        Height = 265
      end
      object lblGRUPO: TLabel
        Left = 28
        Top = 1
        Width = 59
        Height = 15
        Caption = 'Agrupaci'#243'n'
      end
      object lblTMON: TLabel
        Left = 23
        Top = 19
        Width = 96
        Height = 15
        Caption = 'Tipo de Inventario'
      end
      object lblGrArtID: TLabel
        Left = 22
        Top = 59
        Width = 91
        Height = 15
        Caption = 'L'#237'nea de Producto'
      end
      object lblFAM: TLabel
        Left = 22
        Top = 97
        Width = 37
        Height = 15
        Caption = 'Familia'
      end
      object lblSUBFAM: TLabel
        Left = 21
        Top = 138
        Width = 60
        Height = 15
        Caption = 'Sub Familia'
      end
      object bvlCAJA2: TBevel
        Left = 394
        Top = 15
        Width = 368
        Height = 240
      end
      object lblUMG: TLabel
        Left = 407
        Top = 66
        Width = 92
        Height = 15
        Caption = 'Unidad de Medida'
        Transparent = True
      end
      object lblPRESEN: TLabel
        Left = 407
        Top = 23
        Width = 66
        Height = 15
        Caption = 'Presentaci'#243'n'
      end
      object lblFECADQ: TLabel
        Left = 580
        Top = 65
        Width = 79
        Height = 15
        Caption = 'Fecha Creaci'#243'n'
      end
      object lblFECVEN: TLabel
        Left = 651
        Top = 23
        Width = 90
        Height = 15
        Caption = 'Fecha Expiraci'#243'n'
      end
      object lblLOTE: TLabel
        Left = 410
        Top = 144
        Width = 22
        Height = 15
        Caption = 'Lote'
      end
      object lblNSERIE: TLabel
        Left = 523
        Top = 105
        Width = 55
        Height = 15
        Caption = 'Nro. Serie'
      end
      object lblCTACON: TLabel
        Left = 409
        Top = 105
        Width = 64
        Height = 15
        Caption = 'Cta Contable'
      end
      object lblCodBar: TLabel
        Left = 524
        Top = 143
        Width = 87
        Height = 15
        Caption = 'C'#243'digo de Barras'
      end
      object Label2: TLabel
        Left = 21
        Top = 186
        Width = 27
        Height = 15
        Caption = 'Clase'
      end
      object Label3: TLabel
        Left = 21
        Top = 234
        Width = 47
        Height = 15
        Caption = 'SubClase'
      end
      object Label5: TLabel
        Left = 639
        Top = 188
        Width = 75
        Height = 15
        Caption = 'Descontinuado'
      end
      object Label16: TLabel
        Left = 409
        Top = 256
        Width = 96
        Height = 15
        Caption = 'C'#243'digo de Etiqueta'
      end
      object Z2bbtnBorrar: TBitBtn
        Left = 678
        Top = 266
        Width = 28
        Height = 28
        Hint = 'Modificar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 27
        Visible = False
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
      object dblcUMedG: TwwDBLookupCombo
        Left = 410
        Top = 81
        Width = 51
        Height = 23
        CharCase = ecUpperCase
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'UNMID'#9'5'#9'ID'#9'F'
          'UNMDES'#9'40'#9'Descripci'#243'n'#9'F'
          'UNMABR'#9'15'#9'Abreviatura'#9'F')
        DataField = 'UNMIDG'
        DataSource = DMALM.dsArti
        LookupTable = DMALM.cdsUMed
        LookupField = 'UNMID'
        Options = [loColLines, loTitles]
        DropDownCount = 15
        TabOrder = 14
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        ShowMatchText = True
        OnExit = dblcUMedGExit
        OnNotInList = dblcNotInListOr
      end
      object dbeUMedG: TwwDBEdit
        Left = 462
        Top = 81
        Width = 80
        Height = 23
        Enabled = False
        ReadOnly = True
        TabOrder = 15
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblcTINID: TwwDBLookupCombo
        Left = 21
        Top = 34
        Width = 45
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TINID'#9'2'#9'ID'#9'F'
          'TINDES'#9'40'#9'Descripci'#243'n'#9'F')
        DataField = 'TINID'
        DataSource = DMALM.dsArti
        LookupTable = DMALM.cdsTINID
        LookupField = 'TINID'
        Options = [loColLines, loTitles]
        DropDownCount = 15
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnEnter = dblcTINIDEnter
        OnExit = dblcTINIDExit
        OnNotInList = dblcNotInListOr
      end
      object dblcGrpArti: TwwDBLookupCombo
        Left = 21
        Top = 73
        Width = 45
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'GRARID'#9'15'#9'Grupos'#9'F'
          'GRARDES'#9'40'#9'Descripci'#243'n'#9'F')
        DataField = 'GRARID'
        DataSource = DMALM.dsArti
        LookupTable = DMALM.cdsGArti
        LookupField = 'GRARID'
        Options = [loColLines, loTitles]
        DropDownCount = 15
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnEnter = dblcGrpArtiEnter
        OnExit = dblcGrpArtiExit
        OnNotInList = dblcNotInListOr
      end
      object dbeGrpArti: TwwDBEdit
        Left = 67
        Top = 73
        Width = 270
        Height = 23
        CharCase = ecUpperCase
        Enabled = False
        ReadOnly = True
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblcFAM: TwwDBLookupCombo
        Left = 21
        Top = 112
        Width = 45
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'FAMID'#9'3'#9'ID'#9'F'
          'FAMDES'#9'40'#9'Descripci'#243'n'#9'F')
        DataField = 'FAMID'
        DataSource = DMALM.dsArti
        LookupTable = DMALM.cdsFAM
        LookupField = 'FAMID'
        Options = [loColLines, loTitles]
        DropDownCount = 15
        TabOrder = 4
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnEnter = dblcFAMEnter
        OnExit = dblcFAMExit
        OnNotInList = dblcNotInListOr
      end
      object dblcSUBFAM: TwwDBLookupCombo
        Left = 21
        Top = 153
        Width = 45
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SFAMID'#9'8'#9'Id'#9'F'
          'SFAMDES'#9'40'#9'Sub-Familia'#9'F')
        DataField = 'SFAMID'
        DataSource = DMALM.dsArti
        LookupTable = DMALM.cdsSUBFAM
        LookupField = 'SFAMID'
        Options = [loColLines, loTitles]
        DropDownCount = 12
        TabOrder = 6
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnEnter = dblcSUBFAMEnter
        OnExit = dblcSUBFAMExit
        OnNotInList = dblcNotInListOr
      end
      object dbePRESEN: TwwDBEdit
        Left = 407
        Top = 38
        Width = 216
        Height = 23
        DataField = 'ARTPRE'
        DataSource = DMALM.dsArti
        TabOrder = 12
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbdtpFECADQ: TwwDBDateTimePicker
        Left = 580
        Top = 81
        Width = 102
        Height = 23
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'ARTFADQ'
        DataSource = DMALM.dsArti
        Epoch = 1950
        ShowButton = True
        TabOrder = 16
        DisplayFormat = 'dd/mm/yyyy'
      end
      object dbdtpFECVEN: TwwDBDateTimePicker
        Left = 651
        Top = 38
        Width = 102
        Height = 23
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'ARTFVEN'
        DataSource = DMALM.dsArti
        Epoch = 1950
        ShowButton = True
        TabOrder = 13
        DisplayFormat = 'dd/mm/yyyy'
      end
      object dbeLOTE: TwwDBEdit
        Left = 410
        Top = 159
        Width = 57
        Height = 23
        DataField = 'ARTLOTE'
        DataSource = DMALM.dsArti
        TabOrder = 19
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeNSERIE: TwwDBEdit
        Left = 523
        Top = 121
        Width = 139
        Height = 23
        DataField = 'ARTNSER'
        DataSource = DMALM.dsArti
        TabOrder = 18
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeTINID: TwwDBEdit
        Left = 67
        Top = 34
        Width = 270
        Height = 23
        CharCase = ecUpperCase
        Enabled = False
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeFAM: TwwDBEdit
        Left = 67
        Top = 112
        Width = 270
        Height = 23
        CharCase = ecUpperCase
        Enabled = False
        ReadOnly = True
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeSFAM: TwwDBEdit
        Left = 67
        Top = 153
        Width = 270
        Height = 23
        CharCase = ecUpperCase
        Enabled = False
        ReadOnly = True
        TabOrder = 7
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbcbAFijo: TDBCheckBox
        Left = 422
        Top = 204
        Width = 79
        Height = 17
        Caption = 'Activo Fijo'
        DataField = 'ARTACTIVO'
        DataSource = DMALM.dsArti
        TabOrder = 21
        ValueChecked = 'ACTIVO'
        ValueUnchecked = 'STOCK'
      end
      object dbeCodBar: TwwDBEdit
        Left = 523
        Top = 159
        Width = 90
        Height = 23
        DataField = 'ARTCODBAR'
        DataSource = DMALM.dsArti
        TabOrder = 26
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeCtaCon: TwwDBEdit
        Left = 410
        Top = 122
        Width = 81
        Height = 23
        DataField = 'CUENTAID'
        DataSource = DMALM.dsArti
        Enabled = False
        TabOrder = 17
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbcbNSerie: TDBCheckBox
        Left = 422
        Top = 188
        Width = 79
        Height = 17
        Caption = 'N'#186' Serie'
        DataField = 'FNSERIE'
        DataSource = DMALM.dsArti
        TabOrder = 20
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbcbEst: TDBCheckBox
        Left = 521
        Top = 188
        Width = 79
        Height = 17
        Caption = 'Habilitado'
        DataField = 'ARTEST'
        DataSource = DMALM.dsArti
        TabOrder = 23
        ValueChecked = 'H'
        ValueUnchecked = 'A'
      end
      object dbcbObsequio: TDBCheckBox
        Left = 521
        Top = 204
        Width = 79
        Height = 17
        Caption = 'Obsequio'
        DataField = 'OBSEQUIO'
        DataSource = DMALM.dsArti
        TabOrder = 24
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCheckBox1: TDBCheckBox
        Left = 521
        Top = 220
        Width = 127
        Height = 17
        Caption = 'Por Consignaci'#243'n'
        DataField = 'CONSIGNACION'
        DataSource = DMALM.dsArti
        TabOrder = 25
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dblcClase: TwwDBLookupCombo
        Left = 21
        Top = 201
        Width = 45
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CLASEID'#9'8'#9'Id'#9'F'
          'CLASEDES'#9'40'#9'Clase'#9'F')
        DataField = 'CLASEID'
        DataSource = DMALM.dsArti
        LookupTable = DMALM.cdsCLASE
        LookupField = 'CLASEID'
        Options = [loColLines, loTitles]
        DropDownCount = 12
        TabOrder = 8
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnEnter = dblcCLASEEnter
        OnExit = dblcCLASEExit
        OnNotInList = dblcNotInListOr
      end
      object dbeClase: TwwDBEdit
        Left = 67
        Top = 201
        Width = 270
        Height = 23
        CharCase = ecUpperCase
        Enabled = False
        ReadOnly = True
        TabOrder = 9
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblcSClase: TwwDBLookupCombo
        Left = 21
        Top = 249
        Width = 45
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SCLASEID'#9'8'#9'Id'#9'F'
          'SCLASEDES'#9'40'#9'Sub-Clase'#9'F')
        DataField = 'SCLASEID'
        DataSource = DMALM.dsArti
        LookupTable = DMALM.cdsSCLASE
        LookupField = 'SCLASEID'
        Options = [loColLines, loTitles]
        DropDownCount = 12
        TabOrder = 10
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnEnter = dblcSCLASEEnter
        OnExit = dblcSCLASEExit
        OnNotInList = dblcNotInListOr
      end
      object dbeSClase: TwwDBEdit
        Left = 67
        Top = 249
        Width = 270
        Height = 23
        CharCase = ecUpperCase
        Enabled = False
        ReadOnly = True
        TabOrder = 11
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object chkCRITICO: TDBCheckBox
        Left = 422
        Top = 220
        Width = 97
        Height = 17
        Caption = 'Cr'#237'tico'
        DataField = 'CRITICO'
        DataSource = DMALM.dsArti
        TabOrder = 22
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dblcContinuidad: TwwDBLookupCombo
        Left = 717
        Top = 184
        Width = 36
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TMONID'#9'3'#9'ID'#9'F'
          'TMONDES'#9'30'#9'Descripci'#243'n'#9'F'
          'TMONABR'#9'8'#9'Abreviatura'#9'F')
        DataField = 'DISCONTINUO'
        DataSource = DMALM.dsArti
        Options = [loColLines, loTitles]
        TabOrder = 28
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcTMonedaExit
        OnNotInList = dblcNotInListOr
      end
      object edtcodeti: TEdit
        Left = 409
        Top = 270
        Width = 136
        Height = 23
        Enabled = False
        TabOrder = 29
      end
    end
    object tsParRep: TTabSheet
      Caption = 'Par'#225'metros de Rep.'
      ImageIndex = 3
      object Bevel1: TBevel
        Left = 15
        Top = 14
        Width = 740
        Height = 117
      end
      object Bevel4: TBevel
        Left = 15
        Top = 141
        Width = 741
        Height = 117
      end
      object Bevel2: TBevel
        Left = 381
        Top = 17
        Width = 2
        Height = 112
        Shape = bsLeftLine
      end
      object lblFCOMPRA: TLabel
        Left = 37
        Top = 148
        Width = 101
        Height = 15
        Caption = #218'ltima F. de Compra'
      end
      object lblFULTPRE: TLabel
        Left = 37
        Top = 206
        Width = 129
        Height = 15
        Caption = 'Fecha Ultima Movimiento'
      end
      object Label1: TLabel
        Left = 197
        Top = 148
        Width = 102
        Height = 15
        Caption = 'Fecha Ultima Precio'
      end
      object lblVALORI: TLabel
        Left = 258
        Top = 28
        Width = 65
        Height = 15
        Caption = 'Valorizaci'#243'n'
      end
      object lblSOCKACT: TLabel
        Left = 62
        Top = 28
        Width = 66
        Height = 15
        Caption = 'Stock Actual'
      end
      object lblCPROMEDIO: TLabel
        Left = 160
        Top = 28
        Width = 78
        Height = 15
        Caption = 'Costo Promedio'
      end
      object lblUSUARIO: TLabel
        Left = 556
        Top = 155
        Width = 40
        Height = 15
        Caption = 'Usuario'
      end
      object lblFUSUARIO: TLabel
        Left = 556
        Top = 189
        Width = 30
        Height = 15
        Caption = 'Fecha'
      end
      object lblHUSUARIO: TLabel
        Left = 556
        Top = 224
        Width = 25
        Height = 15
        Caption = 'Hora'
      end
      object Bevel3: TBevel
        Left = 523
        Top = 143
        Width = 2
        Height = 114
        Shape = bsLeftLine
      end
      object Label4: TLabel
        Left = 349
        Top = 148
        Width = 98
        Height = 15
        Caption = 'Fecha Ultima Venta'
      end
      object Label6: TLabel
        Left = 394
        Top = 85
        Width = 44
        Height = 31
        AutoSize = False
        Caption = 'Cant .a Reponer'
        Layout = tlCenter
        WordWrap = True
      end
      object lblStkMax: TLabel
        Left = 446
        Top = 28
        Width = 74
        Height = 15
        Caption = 'Stock Maximo'
      end
      object lblStkMin: TLabel
        Left = 544
        Top = 28
        Width = 71
        Height = 15
        Caption = 'Stock Minimo'
      end
      object lblStkRep: TLabel
        Left = 644
        Top = 28
        Width = 102
        Height = 15
        Caption = 'Punto de Reposici'#243'n'
      end
      object Label7: TLabel
        Left = 197
        Top = 206
        Width = 66
        Height = 15
        Caption = 'Fecha Actual'
      end
      object Label8: TLabel
        Left = 349
        Top = 206
        Width = 81
        Height = 15
        Caption = 'Sin Movimiento'
      end
      object Bevel6: TBevel
        Left = 17
        Top = 199
        Width = 505
        Height = 4
        Shape = bsTopLine
      end
      object lblCiVida: TLabel
        Left = 572
        Top = 72
        Width = 62
        Height = 49
        Alignment = taCenter
        AutoSize = False
        Caption = 'Ciclo de Existencia (Dias)'
        Layout = tlCenter
        WordWrap = True
      end
      object wwDBGrid1: TwwDBGrid
        Left = -72
        Top = 273
        Width = 89
        Height = 72
        TabStop = False
        DisableThemesInTitle = False
        Selected.Strings = (
          'CIADES'#9'25'#9'Compa'#241'ia'
          'LOCDES'#9'25'#9'Localidad'
          'ALMDES'#9'25'#9'Almac'#233'n'
          'STKSACTG'#9'10'#9'Stock Actual~Genera'
          'STKSACTU'#9'10'#9'Stock Actual~Unitario'
          'STKSMAXG'#9'10'#9'Stock M'#225'ximo~General'
          'STKSMAXU'#9'10'#9'Stock M'#225'ximo~Unitario'
          'STKSMING'#9'10'#9'Stock M'#237'nimo~General'
          'STKSMINU'#9'10'#9'Stock M'#237'nimo~Unitario'
          'COSTPROG'#9'10'#9'Costo Prom.~General'
          'COSTPROU'#9'10'#9'Costo Prom.~Unitario'
          'UBDES'#9'25'#9'Ubicaci'#243'n')
        IniAttributes.Delimiter = ';;'
        TitleColor = 11974251
        FixedCols = 0
        ShowHorzScrollBar = True
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
      object dbeFCompra: TwwDBEdit
        Left = 37
        Top = 165
        Width = 102
        Height = 23
        TabStop = False
        Color = clCream
        DataField = 'ARTFUC'
        DataSource = DMALM.dsArti
        ReadOnly = True
        TabOrder = 9
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeFUMov: TwwDBEdit
        Left = 37
        Top = 224
        Width = 102
        Height = 23
        TabStop = False
        Color = clCream
        DataField = 'ARTFUMV'
        DataSource = DMALM.dsArti
        ReadOnly = True
        TabOrder = 12
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeFUPrecio: TwwDBEdit
        Left = 197
        Top = 165
        Width = 102
        Height = 23
        TabStop = False
        Color = clCream
        DataField = 'ARTFUPRC'
        DataSource = DMALM.dsArti
        ReadOnly = True
        TabOrder = 10
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeSAG: TwwDBEdit
        Left = 62
        Top = 46
        Width = 94
        Height = 23
        TabStop = False
        AutoSize = False
        Color = clCream
        DataField = 'ARTCNTG'
        DataSource = DMALM.dsArti
        ReadOnly = True
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeVALG: TwwDBEdit
        Left = 258
        Top = 46
        Width = 94
        Height = 23
        TabStop = False
        Color = clCream
        DataField = 'ARTMNTG'
        DataSource = DMALM.dsArti
        ReadOnly = True
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeCPROMG: TwwDBEdit
        Left = 160
        Top = 46
        Width = 94
        Height = 23
        TabStop = False
        Color = clCream
        DataField = 'ARTCPROG'
        DataSource = DMALM.dsArti
        ReadOnly = True
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeUsuario: TwwDBEdit
        Left = 612
        Top = 155
        Width = 102
        Height = 23
        TabStop = False
        Color = clCream
        DataField = 'CCUSER'
        DataSource = DMALM.dsArti
        ReadOnly = True
        TabOrder = 15
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeFRegistro: TwwDBEdit
        Left = 612
        Top = 190
        Width = 102
        Height = 23
        TabStop = False
        Color = clCream
        DataField = 'CCFREG'
        DataSource = DMALM.dsArti
        ReadOnly = True
        TabOrder = 16
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeHRegistro: TwwDBEdit
        Left = 612
        Top = 224
        Width = 102
        Height = 23
        TabStop = False
        Color = clCream
        DataField = 'CCHREG'
        DataSource = DMALM.dsArti
        ReadOnly = True
        TabOrder = 17
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeFUVenta: TwwDBEdit
        Left = 349
        Top = 165
        Width = 102
        Height = 23
        TabStop = False
        Color = clCream
        DataField = 'ARTFVEN'
        DataSource = DMALM.dsArti
        ReadOnly = True
        TabOrder = 11
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeSMaxG: TwwDBEdit
        Left = 446
        Top = 46
        Width = 94
        Height = 23
        Color = clCream
        DataField = 'STKSMAX'
        DataSource = DMALM.dsArti
        Enabled = False
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeSMaxGExit
      end
      object dbeSMinG: TwwDBEdit
        Left = 544
        Top = 46
        Width = 94
        Height = 23
        Color = clCream
        DataField = 'STKSMIN'
        DataSource = DMALM.dsArti
        Enabled = False
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeSMinGExit
      end
      object dbeSCRep: TwwDBEdit
        Left = 446
        Top = 85
        Width = 94
        Height = 23
        Color = clCream
        DataField = 'STKSCPE'
        DataSource = DMALM.dsArti
        Enabled = False
        TabOrder = 7
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeSCRepExit
      end
      object dbeSRepG: TwwDBEdit
        Left = 644
        Top = 46
        Width = 94
        Height = 23
        DataField = 'STKSPRE'
        DataSource = DMALM.dsArti
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeSRepGExit
      end
      object edtNow: TEdit
        Left = 197
        Top = 224
        Width = 102
        Height = 23
        Color = clCream
        ReadOnly = True
        TabOrder = 13
      end
      object edtDiasSMov: TEdit
        Left = 349
        Top = 224
        Width = 153
        Height = 23
        Color = clCream
        ReadOnly = True
        TabOrder = 14
      end
      object dbeCExis: TwwDBEdit
        Left = 644
        Top = 85
        Width = 94
        Height = 23
        Color = clCream
        DataField = 'ARTCVIDA'
        DataSource = DMALM.dsArti
        Enabled = False
        TabOrder = 8
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeCExisExit
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Valorizaci'#243'n y Otros'
      ImageIndex = 4
      object Bevel5: TBevel
        Left = 23
        Top = 11
        Width = 725
        Height = 246
      end
      object lblPCOSTOG: TLabel
        Left = 523
        Top = 78
        Width = 64
        Height = 15
        Caption = 'Precio Costo'
        Transparent = True
      end
      object lblPVENTAG: TLabel
        Left = 621
        Top = 78
        Width = 65
        Height = 15
        Caption = 'Precio Venta'
        Transparent = True
        Visible = False
      end
      object lblCRGO: TLabel
        Left = 73
        Top = 157
        Width = 40
        Height = 15
        Caption = 'Carguio'
      end
      object Label9: TLabel
        Left = 37
        Top = 136
        Width = 114
        Height = 15
        Caption = '% Incremento al Costo'
      end
      object Label10: TLabel
        Left = 523
        Top = 132
        Width = 46
        Height = 15
        Caption = 'Comisi'#243'n'
      end
      object lblTMONEDA: TLabel
        Left = 37
        Top = 83
        Width = 81
        Height = 15
        Caption = 'Tipo de Moneda'
      end
      object lblProv: TLabel
        Left = 327
        Top = 18
        Width = 52
        Height = 15
        Caption = 'Proveedor'
      end
      object lblFAB: TLabel
        Left = 37
        Top = 18
        Width = 55
        Height = 15
        Caption = 'Fabricante'
        Transparent = True
      end
      object lblPArancel: TLabel
        Left = 622
        Top = 136
        Width = 101
        Height = 15
        Caption = 'Partida Arancelaria'
        Visible = False
      end
      object dbePCOSTOG: TwwDBEdit
        Left = 523
        Top = 98
        Width = 87
        Height = 23
        DataField = 'ARTPCG'
        DataSource = DMALM.dsArti
        Enabled = False
        TabOrder = 13
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbePVENTAG: TwwDBEdit
        Left = 621
        Top = 98
        Width = 87
        Height = 23
        DataField = 'ARTPVG'
        DataSource = DMALM.dsArti
        Enabled = False
        TabOrder = 14
        UnboundDataType = wwDefault
        Visible = False
        WantReturns = False
        WordWrap = False
      end
      object dbcbDCTG: TDBCheckBox
        Left = 250
        Top = 86
        Width = 75
        Height = 17
        Caption = 'Descuento'
        DataField = 'ARTDCTG'
        DataSource = DMALM.dsArti
        TabOrder = 8
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbcbIGV: TDBCheckBox
        Left = 250
        Top = 106
        Width = 97
        Height = 17
        Caption = 'Afecto IGV'
        DataField = 'ARTIGV'
        DataSource = DMALM.dsArti
        TabOrder = 9
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbcbIsc: TDBCheckBox
        Left = 250
        Top = 130
        Width = 97
        Height = 17
        Caption = 'Afecto ISC'
        DataField = 'ARTISC'
        DataSource = DMALM.dsArti
        Enabled = False
        TabOrder = 10
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbeCRGO: TwwDBEdit
        Left = 37
        Top = 156
        Width = 113
        Height = 23
        DataField = 'ARTCRGO'
        DataSource = DMALM.dsArti
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbcbInc: TDBCheckBox
        Left = 37
        Top = 210
        Width = 124
        Height = 17
        Caption = 'Permite Incremento'
        DataField = 'ARTFLAGINC'
        DataSource = DMALM.dsArti
        TabOrder = 7
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbeComision: TwwDBEdit
        Left = 523
        Top = 152
        Width = 88
        Height = 23
        DataField = 'ARTCOMVTA'
        DataSource = DMALM.dsArti
        TabOrder = 15
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbcbExo: TDBCheckBox
        Left = 250
        Top = 154
        Width = 120
        Height = 17
        Caption = 'Exonerado de IGV'
        DataField = 'ART_IGV_EXO'
        DataSource = DMALM.dsArti
        TabOrder = 11
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbcCargServ: TDBCheckBox
        Left = 250
        Top = 178
        Width = 120
        Height = 17
        Caption = 'Cargo por Servicio'
        DataField = 'FLGSERV'
        DataSource = DMALM.dsArti
        TabOrder = 12
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dblcTMoneda: TwwDBLookupCombo
        Left = 37
        Top = 99
        Width = 42
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TMONID'#9'3'#9'ID'#9'F'
          'TMONDES'#9'30'#9'Descripci'#243'n'#9'F'
          'TMONABR'#9'8'#9'Abreviatura'#9'F')
        DataField = 'TMONID'
        DataSource = DMALM.dsArti
        LookupTable = DMALM.cdsTMoneda
        LookupField = 'TMONID'
        Options = [loColLines, loTitles]
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcTMonedaExit
        OnNotInList = dblcNotInListOr
      end
      object dbeTMoneda: TwwDBEdit
        Left = 82
        Top = 99
        Width = 140
        Height = 23
        CharCase = ecUpperCase
        Enabled = False
        ReadOnly = True
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblcdProv: TwwDBLookupComboDlg
        Left = 327
        Top = 35
        Width = 82
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
        DataSource = DMALM.dsArti
        LookupTable = DMALM.cdsProv2
        LookupField = 'PROV'
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcdProvExit
      end
      object dbeProv: TEdit
        Left = 410
        Top = 35
        Width = 255
        Height = 23
        Enabled = False
        TabOrder = 3
      end
      object dbrdProcede: TDBRadioGroup
        Left = 523
        Top = 187
        Width = 167
        Height = 46
        Caption = 'Procedencia'
        Columns = 2
        DataField = 'ARTSPRO'
        DataSource = DMALM.dsArti
        Items.Strings = (
          'Nacional'
          'Importado')
        TabOrder = 17
        Values.Strings = (
          'NACIONAL'
          'IMPORTADO')
      end
      object dblcFAB: TwwDBLookupCombo
        Left = 37
        Top = 34
        Width = 51
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'FABID'#9'2'#9'ID'#9'F'
          'FABDES'#9'40'#9'Descripci'#243'n'#9'F'
          'FABABR'#9'15'#9'Abreviatura'#9'F')
        DataField = 'FABID'
        DataSource = DMALM.dsArti
        LookupTable = DMALM.cdsFAB
        LookupField = 'FABID'
        Options = [loColLines, loTitles]
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcFABExit
        OnNotInList = dblcNotInListOr
      end
      object dbeFAB: TEdit
        Left = 93
        Top = 35
        Width = 195
        Height = 23
        Enabled = False
        TabOrder = 1
      end
      object dbePArancel: TwwDBEdit
        Left = 622
        Top = 152
        Width = 116
        Height = 23
        DataField = 'ARTPARA'
        DataSource = DMALM.dsArti
        TabOrder = 16
        UnboundDataType = wwDefault
        Visible = False
        WantReturns = False
        WordWrap = False
      end
      object cbEditaPrecio: TCheckBox
        Left = 250
        Top = 200
        Width = 135
        Height = 17
        Hint = 'Permite la modificaci'#243'n del Precio en m'#243'dulo de Facturaci'#243'n'
        Caption = 'Permite modif Precio'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 18
      end
    end
    object tsComponent: TTabSheet
      Caption = '&Componentes'
      ImageIndex = 1
      object dbgDArti: TwwDBGrid
        Left = 15
        Top = 15
        Width = 740
        Height = 240
        DisableThemesInTitle = False
        Selected.Strings = (
          'EARTID'#9'12'#9'C'#243'digo~Art'#237'culo'#9'F'
          'EARTDES'#9'70'#9'Descripci'#243'n'#9'F'
          'EARTABR'#9'15'#9'Abreviatura'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = 7566265
        FixedCols = 0
        ShowHorzScrollBar = True
        Color = clWhite
        DataSource = DMALM.dsEARTI
        KeyOptions = [dgEnterToTab]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
        OnDblClick = dbgDArtiDblClick
        OnKeyDown = dbgDArtiKeyDown
        object Z2dbgDReqsIButton: TwwIButton
          Left = 0
          Top = 0
          Width = 24
          Height = 30
          AllowAllUp = True
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
    end
    object tsEquals: TTabSheet
      Caption = '&Equivalentes'
      ImageIndex = 2
      object dbgEQ: TwwDBGrid
        Left = 15
        Top = 15
        Width = 740
        Height = 240
        DisableThemesInTitle = False
        Selected.Strings = (
          'QARTID'#9'12'#9'C'#243'digo~Art'#237'culo'#9'F'
          'QARTDES'#9'70'#9'Descripci'#243'n'#9'F'
          'QARTABR'#9'15'#9'Abreviatura'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = 7566265
        FixedCols = 0
        ShowHorzScrollBar = True
        Color = clWhite
        DataSource = DMALM.dsQARTI
        KeyOptions = [dgEnterToTab]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
        OnKeyDown = dbgEQKeyDown
        object Z2dbgDEQIButton: TwwIButton
          Left = 0
          Top = 0
          Width = 24
          Height = 30
          AllowAllUp = True
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
          OnClick = Z2dbgDEQIButtonClick
        end
      end
    end
  end
  object Z2bbtnRegresa: TBitBtn
    Left = 597
    Top = 440
    Width = 32
    Height = 31
    Hint = 'Modifica Datos de Cabecera'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
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
    Left = 641
    Top = 440
    Width = 32
    Height = 31
    Hint = 'Cancela Actualizaciones del Detalle'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
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
    Left = 686
    Top = 440
    Width = 31
    Height = 31
    Hint = 'Grabar Registro'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
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
    Left = 729
    Top = 439
    Width = 32
    Height = 31
    Hint = 'Nueva Articulo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Garamond'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
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
  object pnlCabecera: TPanel
    Left = 0
    Top = 0
    Width = 781
    Height = 106
    BevelOuter = bvNone
    Color = 14869218
    TabOrder = 5
    object bvlBox1: TBevel
      Left = 4
      Top = 4
      Width = 774
      Height = 100
      Shape = bsFrame
    end
    object lblCIA: TLabel
      Left = 15
      Top = 10
      Width = 49
      Height = 15
      Caption = 'Compa'#241#237'a'
    end
    object lblNSolCot: TLabel
      Left = 194
      Top = 10
      Width = 35
      Height = 15
      Caption = 'C'#243'digo'
    end
    object lblDescrip: TLabel
      Left = 238
      Top = 56
      Width = 122
      Height = 15
      Caption = 'Descripci'#243'n de Articulo'
    end
    object lblAbre: TLabel
      Left = 588
      Top = 56
      Width = 118
      Height = 15
      Caption = 'Descripci'#243'n Abreviada'
    end
    object Label12: TLabel
      Left = 283
      Top = 10
      Width = 33
      Height = 15
      Caption = 'Marca'
    end
    object Label13: TLabel
      Left = 462
      Top = 10
      Width = 82
      Height = 15
      Caption = 'Art'#237'culo ( Tipo )'
    end
    object Label14: TLabel
      Left = 648
      Top = 10
      Width = 37
      Height = 15
      Caption = 'Modelo'
    end
    object Label15: TLabel
      Left = 20
      Top = 56
      Width = 79
      Height = 15
      Caption = 'Caracter'#237'sticas'
    end
    object dblcCIA: TwwDBLookupCombo
      Left = 15
      Top = 28
      Width = 45
      Height = 23
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Id'#9'F'
        'CIADES'#9'40'#9'Descripci'#243'n'#9'F')
      DataField = 'CIAID'
      DataSource = DMALM.dsArti
      LookupTable = DMALM.cdsCIA
      LookupField = 'CIAID'
      Options = [loColLines, loTitles]
      DropDownCount = 15
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcCIAExit
      OnNotInList = dblcNotInListOr
    end
    object dbeCodArti: TwwDBEdit
      Left = 190
      Top = 28
      Width = 75
      Height = 23
      CharCase = ecUpperCase
      DataField = 'ARTID'
      DataSource = DMALM.dsArti
      MaxLength = 8
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeCodArtiExit
    end
    object dbeDescrip: TwwDBEdit
      Left = 228
      Top = 73
      Width = 350
      Height = 23
      CharCase = ecUpperCase
      DataField = 'ARTDES'
      DataSource = DMALM.dsArti
      Enabled = False
      TabOrder = 10
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeAbrev: TwwDBEdit
      Left = 588
      Top = 73
      Width = 133
      Height = 23
      CharCase = ecUpperCase
      DataField = 'ARTABR'
      DataSource = DMALM.dsArti
      TabOrder = 11
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object Z2bbtnCOk: TBitBtn
      Left = 736
      Top = 67
      Width = 29
      Height = 26
      Hint = 'Aceptar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      OnClick = Z2bbtnCOkClick
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
    object dbeCIA: TEdit
      Left = 61
      Top = 28
      Width = 120
      Height = 23
      Enabled = False
      TabOrder = 1
    end
    object dblcdMarca: TwwDBLookupComboDlg
      Left = 274
      Top = 28
      Width = 58
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'MARCA'#9'6'#9'Id'#9'F'
        'MARDES'#9'30'#9'Marca'#9'F')
      DataField = 'MARCA'
      DataSource = DMALM.dsArti
      LookupTable = DMALM.cdsMarca
      LookupField = 'MARCA'
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcdMarcaExit
    end
    object edtMarca: TEdit
      Left = 333
      Top = 28
      Width = 115
      Height = 23
      Enabled = False
      TabOrder = 5
    end
    object dblcdArtTipo: TwwDBLookupComboDlg
      Left = 457
      Top = 28
      Width = 58
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'TIPART'#9'6'#9'Id'#9'F'
        'TIPARTDES'#9'30'#9'Tipo de Art'#237'culo'#9'F')
      DataField = 'TIPART'
      DataSource = DMALM.dsArti
      LookupTable = DMALM.cdsTipArt
      LookupField = 'TIPART'
      TabOrder = 6
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcdArtTipoExit
    end
    object edtTipArt: TEdit
      Left = 516
      Top = 28
      Width = 120
      Height = 23
      Enabled = False
      TabOrder = 7
    end
    object dbeModelo: TwwDBEdit
      Left = 645
      Top = 28
      Width = 122
      Height = 23
      DataField = 'MODELO'
      DataSource = DMALM.dsArti
      MaxLength = 20
      TabOrder = 8
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeModeloExit
    end
    object dbeCaracteristicas: TwwDBEdit
      Left = 15
      Top = 73
      Width = 202
      Height = 23
      CharCase = ecUpperCase
      DataField = 'CARART'
      DataSource = DMALM.dsArti
      MaxLength = 30
      TabOrder = 9
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeCaracteristicasExit
    end
    object bbtnBuscar: TBitBtn
      Left = 334
      Top = 8
      Width = 70
      Height = 19
      Caption = 'Buscar C'#243'digo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = bbtnBuscarClick
    end
  end
  object Z2bbtnOK: TBitBtn
    Left = 718
    Top = 400
    Width = 28
    Height = 28
    Hint = 'Aceptar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
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
end
