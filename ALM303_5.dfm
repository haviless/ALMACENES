object FAjustesS: TFAjustesS
  Left = -1
  Top = 92
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Ajuste por Salida '
  ClientHeight = 573
  ClientWidth = 792
  Color = 12904163
  Constraints.MaxHeight = 607
  Constraints.MaxWidth = 800
  Constraints.MinHeight = 600
  Constraints.MinWidth = 800
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object pnlCabecera: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 267
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 10207162
    TabOrder = 0
    OnClick = FormCreate
    object Bevel1: TBevel
      Left = 6
      Top = 5
      Width = 780
      Height = 226
      Shape = bsFrame
    end
    object lblCIA: TLabel
      Left = 18
      Top = 9
      Width = 49
      Height = 15
      Caption = 'Compa'#241#237'a'
    end
    object lblNumNS: TLabel
      Left = 685
      Top = 52
      Width = 93
      Height = 15
      Caption = 'N'#186' Nota de Salida'
    end
    object lblObs: TLabel
      Left = 404
      Top = 186
      Width = 151
      Height = 15
      Caption = 'Observaciones / Comentarios'
    end
    object Label2: TLabel
      Left = 580
      Top = 9
      Width = 43
      Height = 15
      Caption = 'Almac'#233'n'
    end
    object lblFReg: TLabel
      Left = 213
      Top = 99
      Width = 73
      Height = 15
      Caption = 'F. Nota Salida'
    end
    object lblTDocumento: TLabel
      Left = 20
      Top = 144
      Width = 132
      Height = 15
      Caption = 'Documento de Referencia'
    end
    object lblNDoc: TLabel
      Left = 262
      Top = 144
      Width = 73
      Height = 15
      Caption = 'N'#186' Documento'
      Enabled = False
    end
    object lblFDoc: TLabel
      Left = 354
      Top = 144
      Width = 89
      Height = 15
      Caption = 'Fecha Documento'
      Enabled = False
    end
    object lblSolic: TLabel
      Left = 466
      Top = 144
      Width = 57
      Height = 15
      Caption = 'Solicitante'
    end
    object lblTransacc: TLabel
      Left = 192
      Top = 51
      Width = 63
      Height = 15
      Caption = 'Transacci'#243'n'
    end
    object lblCC: TLabel
      Left = 323
      Top = 99
      Width = 85
      Height = 15
      Caption = 'Centro de Costos'
    end
    object lblProv: TLabel
      Left = 520
      Top = 97
      Width = 36
      Height = 15
      Caption = 'Cliente'
      Enabled = False
    end
    object Label7: TLabel
      Left = 18
      Top = 51
      Width = 97
      Height = 15
      Caption = 'Tipo de Documento'
    end
    object Bevel2: TBevel
      Left = 10
      Top = 94
      Width = 770
      Height = 9
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 192
      Top = 9
      Width = 49
      Height = 15
      Caption = 'Localidad'
    end
    object lblSerie: TLabel
      Left = 213
      Top = 144
      Width = 29
      Height = 15
      Caption = 'Serie'
      Enabled = False
    end
    object Label6: TLabel
      Left = 21
      Top = 186
      Width = 26
      Height = 15
      Caption = 'Obra'
    end
    object Label8: TLabel
      Left = 116
      Top = 186
      Width = 22
      Height = 15
      Caption = 'Lote'
    end
    object Label9: TLabel
      Left = 211
      Top = 186
      Width = 70
      Height = 15
      Caption = 'Packed Order'
    end
    object Label10: TLabel
      Left = 306
      Top = 186
      Width = 92
      Height = 15
      Caption = 'N'#250'mero de Pedido'
    end
    object Label11: TLabel
      Left = 349
      Top = 52
      Width = 91
      Height = 15
      Caption = 'Localidad Destino'
    end
    object Label12: TLabel
      Left = 18
      Top = 100
      Width = 85
      Height = 15
      Caption = 'Almac'#233'n Destino'
    end
    object Label4: TLabel
      Left = 395
      Top = 9
      Width = 68
      Height = 15
      Caption = 'T. Inventario'
    end
    object Label5: TLabel
      Left = 520
      Top = 50
      Width = 89
      Height = 15
      Caption = 'Tipo Inv. Destino'
    end
    object dblcCIA: TwwDBLookupCombo
      Left = 18
      Top = 26
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'C'#243'digo'#9'F'
        'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
        'CIAABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'CIAID'
      DataSource = DMALM.dsNIS
      LookupTable = DMALM.cdsCIA
      LookupField = 'CIAID'
      Options = [loColLines, loTitles]
      MaxLength = 2
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcNISAChange
      OnExit = dblcCIAExit
      OnNotInList = dblcNotInList
    end
    object Z2bbtnOK: TBitBtn
      Left = 756
      Top = 234
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
      TabOrder = 31
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
      Left = 724
      Top = 234
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
      TabOrder = 32
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
    object dbeNumNISA: TwwDBEdit
      Left = 685
      Top = 68
      Width = 88
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NISAID'
      DataSource = DMALM.dsNIS
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      TabOrder = 12
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeNumNISAExit
    end
    object dbmObs: TDBMemo
      Left = 404
      Top = 202
      Width = 366
      Height = 23
      DataField = 'NISAOBS'
      DataSource = DMALM.dsNIS
      TabOrder = 30
      OnKeyPress = dbmObsKeyPress
    end
    object dbeCIA: TwwDBEdit
      Left = 69
      Top = 26
      Width = 119
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcTALM: TwwDBLookupCombo
      Left = 580
      Top = 26
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'ALMID'#9'2'#9'C'#243'digo'#9'F'
        'ALMDES'#9'40'#9'Descripci'#243'n'#9'F'
        'ALMABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'ALMID'
      DataSource = DMALM.dsNIS
      LookupTable = DMALM.cdsALM
      LookupField = 'ALMID'
      Options = [loColLines, loTitles]
      MaxLength = 2
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcNISAChange
      OnExit = dblcTALMExit
      OnNotInList = dblcNotInList
    end
    object dbeALM: TwwDBEdit
      Left = 630
      Top = 26
      Width = 143
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbdtpFNS: TwwDBDateTimePicker
      Left = 213
      Top = 117
      Width = 106
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'NISAFREG'
      DataSource = DMALM.dsNIS
      Date = 36759.000000000000000000
      Epoch = 1950
      ShowButton = True
      TabOrder = 15
      DisplayFormat = 'dd/mm/yyyy'
    end
    object dbeTDOC: TwwDBEdit
      Left = 71
      Top = 160
      Width = 138
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 21
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeNDoc: TwwDBEdit
      Left = 262
      Top = 160
      Width = 88
      Height = 23
      CharCase = ecUpperCase
      DataField = 'NISANDOC'
      DataSource = DMALM.dsNIS
      Enabled = False
      TabOrder = 23
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbdtpFDoc: TwwDBDateTimePicker
      Left = 353
      Top = 160
      Width = 107
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'NISAFDOC'
      DataSource = DMALM.dsNIS
      Date = 36759.000000000000000000
      Epoch = 1950
      Enabled = False
      ShowButton = True
      TabOrder = 24
      DisplayFormat = 'dd/mm/yyyy'
    end
    object dbeSolic: TwwDBEdit
      Left = 466
      Top = 160
      Width = 305
      Height = 23
      CharCase = ecUpperCase
      DataField = 'NISASOLIC'
      DataSource = DMALM.dsNIS
      TabOrder = 25
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcdTDOC: TwwDBLookupComboDlg
      Left = 20
      Top = 160
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
        'DOCID'#9'2'#9'C'#243'digo'#9'F'
        'DOCDES'#9'30'#9'Descripci'#243'n'#9'F'
        'DOCABR'#9'8'#9'Abreviatura'#9'F')
      DataField = 'DOCID'
      DataSource = DMALM.dsNIS
      LookupTable = DMALM.cdsTDOC
      LookupField = 'DOCID'
      MaxLength = 2
      TabOrder = 20
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnChange = dblcdTDOCChange
      OnExit = dblcdTDOCExit
    end
    object dblcTransac: TwwDBLookupCombo
      Left = 192
      Top = 68
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TRIID'#9'2'#9'C'#243'digo'#9'F'
        'TRIDES'#9'40'#9'Descripci'#243'n'#9'F'
        'TRIABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'TRIID'
      DataSource = DMALM.dsNIS
      LookupTable = DMALM.cdsTRAN
      LookupField = 'TRIID'
      Options = [loColLines, loTitles]
      MaxLength = 2
      TabOrder = 9
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcTransacChange
      OnExit = dblcTransacExit
      OnNotInList = dblcNotInList
    end
    object dbeTransac: TwwDBEdit
      Left = 244
      Top = 68
      Width = 101
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 8
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcdCC: TwwDBLookupComboDlg
      Left = 323
      Top = 117
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
        'CCOSID'#9'3'#9'C'#243'digo'#9'F'
        'CCOSDES'#9'40'#9'Descripci'#243'n'#9'F'
        'CCOSABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'CCOSID'
      DataSource = DMALM.dsNIS
      LookupTable = DMALM.cdsCCost
      LookupField = 'CCOSID'
      Enabled = False
      MaxLength = 3
      TabOrder = 16
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcdCCExit
    end
    object dbeCC: TwwDBEdit
      Left = 377
      Top = 117
      Width = 138
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 17
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcdProv: TwwDBLookupComboDlg
      Left = 520
      Top = 117
      Width = 82
      Height = 23
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taCenter
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'CLIEID'#9'8'#9'CLIEID'#9'F'
        'CLIEDES'#9'40'#9'CLIEDES'#9'F'
        'CLIEABR'#9'15'#9'CLIEABR'#9'F'
        'CLIERUC'#9'10'#9'CLIERUC'#9'F')
      DataField = 'PROV'
      DataSource = DMALM.dsNIS
      LookupTable = DMALM.cdsClient
      LookupField = 'CLIEID'
      Enabled = False
      MaxLength = 8
      TabOrder = 18
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcdProvExit
    end
    object dbeProv: TwwDBEdit
      Left = 605
      Top = 117
      Width = 166
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 19
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcTDA: TwwDBLookupCombo
      Left = 18
      Top = 68
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TDAID'#9'2'#9'C'#243'digo'#9'F'
        'TDADES'#9'40'#9'Descripci'#243'n'#9'F'
        'TDAABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'TDAID'
      DataSource = DMALM.dsNIS
      LookupTable = DMALM.cdsTDNISA
      LookupField = 'TDAID'
      Options = [loColLines, loTitles]
      MaxLength = 2
      TabOrder = 6
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcTDAChange
      OnExit = dblcTDAExit
      OnNotInList = dblcNotInList
    end
    object dbeTDNISA: TwwDBEdit
      Left = 69
      Top = 68
      Width = 119
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcLOC: TwwDBLookupCombo
      Left = 192
      Top = 26
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'LOCID'#9'2'#9'C'#243'digo'#9'F'
        'LOCDES'#9'30'#9'Descripci'#243'n'#9'F'
        'LOCABR'#9'10'#9'Abreviatura'#9'F')
      DataField = 'LOCID'
      DataSource = DMALM.dsNIS
      LookupTable = DMALM.cdsLOC
      LookupField = 'LOCID'
      Options = [loColLines, loTitles]
      MaxLength = 2
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcNISAChange
      OnExit = dblcLOCExit
      OnNotInList = dblcNotInList
    end
    object dbeLOC: TwwDBEdit
      Left = 242
      Top = 26
      Width = 146
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeSerie: TwwDBEdit
      Left = 212
      Top = 160
      Width = 46
      Height = 23
      CharCase = ecUpperCase
      DataField = 'NISASERIE'
      DataSource = DMALM.dsNIS
      Enabled = False
      TabOrder = 22
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object deObra: TwwDBEdit
      Left = 20
      Top = 202
      Width = 91
      Height = 23
      CharCase = ecUpperCase
      DataField = 'NISAOBRA'
      DataSource = DMALM.dsNIS
      TabOrder = 26
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeLote: TwwDBEdit
      Left = 115
      Top = 202
      Width = 91
      Height = 23
      CharCase = ecUpperCase
      DataField = 'NISALOTE'
      DataSource = DMALM.dsNIS
      TabOrder = 27
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbePO: TwwDBEdit
      Left = 210
      Top = 202
      Width = 91
      Height = 23
      CharCase = ecUpperCase
      DataField = 'NISPORD'
      DataSource = DMALM.dsNIS
      TabOrder = 28
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeNP: TwwDBEdit
      Left = 305
      Top = 202
      Width = 91
      Height = 23
      CharCase = ecUpperCase
      DataField = 'NISNPED'
      DataSource = DMALM.dsNIS
      TabOrder = 29
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcLOCOri: TwwDBLookupCombo
      Left = 349
      Top = 68
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'LOCID'#9'2'#9'C'#243'digo'#9'F'
        'LOCDES'#9'30'#9'Descripci'#243'n'#9'F'
        'LOCABR'#9'10'#9'Abreviatura'#9'F')
      DataField = 'LOCORIID'
      DataSource = DMALM.dsNIS
      LookupTable = DMALM.cdsLKLOC
      LookupField = 'LOCID'
      Options = [loColLines, loTitles]
      MaxLength = 2
      TabOrder = 10
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcNISAChange
      OnEnter = dblcLOCOriEnter
      OnNotInList = dblcNotInList
    end
    object dbeLOCOri: TwwDBEdit
      Left = 399
      Top = 68
      Width = 116
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 11
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcTALMOri: TwwDBLookupCombo
      Left = 20
      Top = 117
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'ALMID'#9'2'#9'C'#243'digo'#9'F'
        'ALMDES'#9'40'#9'Descripci'#243'n'#9'F'
        'ALMABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'ALMORIID'
      DataSource = DMALM.dsNIS
      LookupTable = DMALM.cdsLKALM
      LookupField = 'ALMID'
      Options = [loColLines, loTitles]
      MaxLength = 2
      TabOrder = 13
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcNISAChange
      OnExit = dblcExist
      OnNotInList = dblcNotInList
    end
    object dbeALMOri: TwwDBEdit
      Left = 72
      Top = 117
      Width = 138
      Height = 23
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 14
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcTInv: TwwDBLookupCombo
      Left = 395
      Top = 26
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TINID'#9'2'#9'Tipo Inventario'#9'F'
        'TINDES'#9'40'#9'Descripci'#243'n'#9'F')
      DataField = 'TINID'
      DataSource = DMALM.dsNIS
      LookupTable = DMALM.cdsTINID
      LookupField = 'TINID'
      Options = [loColLines, loTitles]
      DropDownCount = 18
      MaxLength = 2
      TabOrder = 33
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnNotInList = dblcNotInList
    end
    object dbeTinv: TEdit
      Left = 445
      Top = 26
      Width = 135
      Height = 23
      Enabled = False
      TabOrder = 34
    end
    object dblcTINOri: TwwDBLookupCombo
      Left = 518
      Top = 68
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TINID'#9'2'#9'Tipo Inventario'#9'F'
        'TINDES'#9'40'#9'Descripci'#243'n'#9'F')
      DataField = 'TINORIID'
      DataSource = DMALM.dsNIS
      LookupTable = DMALM.cdsLKTIN
      LookupField = 'TINID'
      Options = [loColLines, loTitles]
      DropDownCount = 18
      Enabled = False
      MaxLength = 2
      TabOrder = 35
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnNotInList = dblcNotInList
    end
    object dbeTINOri: TEdit
      Left = 569
      Top = 68
      Width = 113
      Height = 23
      Enabled = False
      TabOrder = 36
    end
  end
  object pnlDetalleG: TPanel
    Left = 1
    Top = 269
    Width = 792
    Height = 303
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'pnlDetalleG'
    Color = 10207162
    TabOrder = 1
    object lblEstado: TLabel
      Left = 290
      Top = 274
      Width = 69
      Height = 23
      Caption = 'lblEstado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object dbgDReqs: TwwDBGrid
      Left = 5
      Top = 23
      Width = 782
      Height = 240
      DisableThemesInTitle = False
      Selected.Strings = (
        'KDXID'#9'6'#9'N'#186
        'ARTID'#9'20'#9'C'#243'digo~Art'#237'culo'
        'ARTPCG'#9'10'#9'Ajustge G.'
        'ARTPCU'#9'10'#9'AJuste U.')
      IniAttributes.Delimiter = ';;'
      TitleColor = 11974251
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DMALM.dsKDX
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
      OnDblClick = dbgDReqsDblClick
      OnKeyDown = dbgDReqsKeyDown
      object Z2dbgDReqsIButton: TwwIButton
        Left = 0
        Top = 0
        Width = 25
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
    object stxTitulo1: TPanel
      Left = 2
      Top = 2
      Width = 788
      Height = 20
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'Detalle de Nota de Salida'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object Z2bbtnAceptar: TBitBtn
      Left = 609
      Top = 268
      Width = 30
      Height = 30
      Hint = 'Confirma Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = Z2bbtnAceptarClick
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
    object Z2bbtnRegresa: TBitBtn
      Left = 643
      Top = 268
      Width = 30
      Height = 30
      Hint = 'Modifica Datos de Cabecera'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
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
      Left = 679
      Top = 268
      Width = 30
      Height = 30
      Hint = 'Cancela Actualizaciones del Detalle'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
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
      Left = 714
      Top = 268
      Width = 30
      Height = 30
      Hint = 'Grabar Registro'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
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
      Left = 757
      Top = 268
      Width = 30
      Height = 30
      Hint = 'Nueva Requisici'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'Garamond'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
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
  object pnlDetalleA: TPanel
    Left = 172
    Top = 367
    Width = 464
    Height = 167
    Color = 12904163
    TabOrder = 2
    Visible = False
    object bvlDetalle: TBevel
      Left = 5
      Top = 21
      Width = 453
      Height = 108
      Shape = bsFrame
    end
    object lblItem: TLabel
      Left = 14
      Top = 25
      Width = 14
      Height = 15
      Caption = 'N'#186
      Transparent = True
    end
    object lblArti: TLabel
      Left = 64
      Top = 27
      Width = 42
      Height = 15
      Caption = 'Art'#237'culo'
      Transparent = True
    end
    object lblCntS: TLabel
      Left = 349
      Top = 84
      Width = 94
      Height = 15
      Caption = 'Cantidad Atendida'
      Transparent = True
      Visible = False
    end
    object blUnimedG: TLabel
      Left = 33
      Top = 80
      Width = 76
      Height = 15
      Alignment = taCenter
      Caption = 'Ajuste General'
      Transparent = True
      Layout = tlCenter
    end
    object blUnimedU: TLabel
      Left = 211
      Top = 80
      Width = 79
      Height = 15
      Alignment = taCenter
      Caption = 'Ajuste Unitaria'
      Transparent = True
      Layout = tlCenter
    end
    object Z2bbtnRegOk: TBitBtn
      Left = 396
      Top = 133
      Width = 30
      Height = 28
      Hint = 'Confirma Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
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
      Left = 428
      Top = 133
      Width = 30
      Height = 28
      Hint = 'Cancela Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
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
      Top = 44
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
      Top = 44
      Width = 272
      Height = 23
      Enabled = False
      ReadOnly = True
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbcldArti: TwwDBLookupComboDlg
      Left = 64
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
      LookupTable = DMALM.cdsArti
      LookupField = 'ARTID'
      MaxLength = 15
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = dbcldArtiChange
      OnExit = dblcExist
    end
    object dbeCantidadG: TwwDBEdit
      Left = 376
      Top = 81
      Width = 71
      Height = 23
      Picture.PictureMask = '*12[#][.*2[#]]'
      TabOrder = 9
      UnboundDataType = wwDefault
      Visible = False
      WantReturns = False
      WordWrap = False
      OnExit = dbeCantidadGExit
    end
    object dbePrecioG: TwwDBEdit
      Left = 114
      Top = 80
      Width = 87
      Height = 23
      Picture.PictureMask = '*12[#][.*2[#]]'
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object stxTitulo2: TPanel
      Left = 1
      Top = 1
      Width = 462
      Height = 20
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'Detalle de Nota de Salida'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object dbePrecioU: TwwDBEdit
      Left = 290
      Top = 80
      Width = 87
      Height = 23
      Picture.PictureMask = '*12[#][.*2[#]]'
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeCantidadU: TwwDBEdit
      Left = 376
      Top = 79
      Width = 71
      Height = 23
      Picture.PictureMask = '*12[#][.*2[#]]'
      TabOrder = 8
      UnboundDataType = wwDefault
      Visible = False
      WantReturns = False
      WordWrap = False
      OnExit = dbeCantidadGExit
    end
  end
end
