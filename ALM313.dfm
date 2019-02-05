object FDetalleInventario: TFDetalleInventario
  Left = 305
  Top = 278
  BorderStyle = bsDialog
  Caption = 'Ingreso de Art'#237'culos para Inventario'
  ClientHeight = 196
  ClientWidth = 801
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTool: TPanel
    Left = 0
    Top = 0
    Width = 801
    Height = 195
    Align = alTop
    Color = 14869218
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object lblCia: TLabel
      Left = 16
      Top = 44
      Width = 49
      Height = 15
      Caption = 'Compa'#241#237'a'
    end
    object lblLoc: TLabel
      Left = 206
      Top = 44
      Width = 49
      Height = 15
      Caption = 'Localidad'
    end
    object Label1: TLabel
      Left = 396
      Top = 44
      Width = 68
      Height = 15
      Caption = 'T. Inventario'
    end
    object lblAlm: TLabel
      Left = 586
      Top = 44
      Width = 43
      Height = 15
      Caption = 'Almac'#233'n'
    end
    object Label2: TLabel
      Left = 16
      Top = 88
      Width = 28
      Height = 15
      Caption = 'L'#237'nea'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label10: TLabel
      Left = 262
      Top = 88
      Width = 37
      Height = 15
      Caption = 'Familia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 515
      Top = 88
      Width = 60
      Height = 15
      Caption = 'Sub Familia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblCnpEgr: TLabel
      Left = 16
      Top = 131
      Width = 51
      Height = 15
      Caption = 'Art'#237'culo   '
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 422
      Top = 131
      Width = 64
      Height = 15
      Caption = 'Und. Medida'
    end
    object Label3: TLabel
      Left = 16
      Top = 5
      Width = 85
      Height = 15
      Caption = 'Toma Inventario'
    end
    object Label6: TLabel
      Left = 140
      Top = 5
      Width = 20
      Height = 15
      Caption = 'A'#241'o'
    end
    object Label7: TLabel
      Left = 526
      Top = 131
      Width = 69
      Height = 15
      Caption = 'Cnt. Act. Gral'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label8: TLabel
      Left = 602
      Top = 131
      Width = 72
      Height = 15
      Caption = 'Cnt. Act. Unit.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object dblcCIA: TwwDBLookupCombo
      Left = 16
      Top = 61
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'ID'#9'F'
        'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
        'CIAABR'#9'15'#9'Abreviatura'#9'F')
      LookupTable = DMALM.cdsCIA
      LookupField = 'CIAID'
      Options = [loColLines, loTitles]
      Enabled = False
      MaxLength = 2
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcCIAExit
      OnNotInList = NotInList
    end
    object dbeCIA: TEdit
      Left = 66
      Top = 61
      Width = 135
      Height = 23
      Enabled = False
      TabOrder = 1
    end
    object dblcLOC: TwwDBLookupCombo
      Left = 205
      Top = 61
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'LOCID'#9'2'#9'ID'#9'F'
        'LOCDES'#9'30'#9'Descripci'#243'n'#9'F'
        'LOCABR'#9'10'#9'Abreviatura'#9'F')
      LookupTable = DMALM.cdsLOC
      LookupField = 'LOCID'
      Options = [loColLines, loTitles]
      DropDownCount = 18
      Enabled = False
      MaxLength = 2
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcLOCExit
      OnNotInList = NotInList
    end
    object dbeLOC: TEdit
      Left = 256
      Top = 61
      Width = 135
      Height = 23
      Enabled = False
      TabOrder = 3
    end
    object dblcTIN: TwwDBLookupCombo
      Left = 396
      Top = 61
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TINID'#9'3'#9'Tipo Inventario'#9'F'
        'TINDES'#9'40'#9'Descripci'#243'n'#9'F')
      LookupTable = DMALM.cdsTINID
      LookupField = 'TINID'
      Options = [loColLines, loTitles]
      DropDownCount = 18
      Enabled = False
      MaxLength = 2
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcTINExit
      OnNotInList = NotInList
    end
    object dbeTIN: TEdit
      Left = 447
      Top = 61
      Width = 135
      Height = 23
      Enabled = False
      TabOrder = 5
    end
    object dbeALM: TEdit
      Left = 636
      Top = 61
      Width = 135
      Height = 23
      Enabled = False
      TabOrder = 7
    end
    object dblcTALM: TwwDBLookupCombo
      Left = 585
      Top = 61
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'ALMID'#9'2'#9'ID'#9'F'
        'ALMDES'#9'40'#9'Descripci'#243'n'#9'F'
        'ALMABR'#9'15'#9'Abreviatura'#9'F')
      LookupTable = DMALM.cdsALM
      LookupField = 'ALMID'
      Options = [loColLines, loTitles]
      DropDownCount = 18
      Enabled = False
      MaxLength = 2
      TabOrder = 6
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcTALMExit
      OnNotInList = NotInList
    end
    object edtLinea: TEdit
      Left = 79
      Top = 104
      Width = 180
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
    object edtFamilia: TEdit
      Left = 330
      Top = 104
      Width = 180
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
    object dblcdArticulo: TwwDBLookupComboDlg
      Left = 16
      Top = 147
      Width = 91
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Maestro de Articulos'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'ARTID'#9'9'#9'C'#243'digo'#9'F'
        'ARTDES'#9'40'#9'Articulo'#9'F'
        'UNMIDG'#9'3'#9'U.M'#9'F'
        'ARTPVG'#9'10'#9'Precio Vta.'#9'F'
        'ARTABR'#9'15'#9'Abrev.'#9'F'
        'GRARID'#9'3'#9'L'#237'nea'#9'F')
      LookupTable = DMALM.cdsArti
      LookupField = 'ARTID'
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      MaxLength = 15
      ParentFont = False
      TabOrder = 14
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      OnEnter = dblcdArticuloEnter
      OnExit = dblcdArticuloExit
    end
    object bbtnOk: TBitBtn
      Left = 690
      Top = 140
      Width = 41
      Height = 35
      TabOrder = 21
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
    object dblcdLinea: TwwDBLookupComboDlg
      Left = 16
      Top = 104
      Width = 60
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'GRARID'#9'15'#9'L'#237'nea'#9'F'
        'GRARDES'#9'40'#9'Descripci'#243'n'#9'F')
      LookupTable = DMALM.cdsGArti
      LookupField = 'GRARID'
      TabOrder = 8
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcdLineaExit
    end
    object dblcdFamilia: TwwDBLookupComboDlg
      Left = 261
      Top = 104
      Width = 65
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'FAMID'#9'4'#9'Familia'#9'F'
        'FAMDES'#9'40'#9'Descripci'#243'n'#9'F')
      LookupTable = DMALM.cdsFAM
      LookupField = 'FAMID'
      TabOrder = 10
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcdFamiliaExit
    end
    object dblcdSFamilia: TwwDBLookupComboDlg
      Left = 512
      Top = 104
      Width = 76
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'SFAMID'#9'8'#9'SubFamilia'#9'F'
        'SFAMDES'#9'40'#9'Descripci'#243'n'#9'F')
      LookupTable = DMALM.cdsSUBFAM
      LookupField = 'SFAMID'
      TabOrder = 12
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcdSFamiliaExit
    end
    object edtSFamilia: TEdit
      Left = 593
      Top = 104
      Width = 180
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
    end
    object dbeArticulo: TEdit
      Left = 109
      Top = 147
      Width = 306
      Height = 23
      Enabled = False
      TabOrder = 15
    end
    object dbeUnMidG: TEdit
      Left = 422
      Top = 148
      Width = 101
      Height = 23
      Enabled = False
      TabOrder = 16
    end
    object dbeToInId: TEdit
      Left = 16
      Top = 20
      Width = 121
      Height = 23
      Enabled = False
      TabOrder = 17
    end
    object dbeSTKAno: TEdit
      Left = 140
      Top = 20
      Width = 73
      Height = 23
      Enabled = False
      TabOrder = 18
    end
    object bbtnCancel: TBitBtn
      Left = 732
      Top = 140
      Width = 41
      Height = 35
      TabOrder = 22
      OnClick = bbtnCancelClick
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
    object dbeCntG: TwwDBEdit
      Left = 530
      Top = 148
      Width = 65
      Height = 23
      TabOrder = 19
      UnboundDataType = wwDefault
      UnboundAlignment = taRightJustify
      Visible = False
      WantReturns = False
      WordWrap = False
      OnKeyPress = dbeCntGKeyPress
    end
    object dbeCntU: TwwDBEdit
      Left = 610
      Top = 148
      Width = 65
      Height = 23
      TabOrder = 20
      UnboundDataType = wwDefault
      UnboundAlignment = taRightJustify
      Visible = False
      WantReturns = False
      WordWrap = False
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 608
    Top = 24
  end
end
