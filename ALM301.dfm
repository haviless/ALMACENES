object FMovAlmSalEnt: TFMovAlmSalEnt
  Left = 299
  Top = 229
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Ajustes  de Inventarios Automaticos'
  ClientHeight = 522
  ClientWidth = 711
  Color = 14869218
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object dbgAjuSal: TwwDBGrid
    Left = 0
    Top = 0
    Width = 711
    Height = 477
    DisableThemesInTitle = False
    Selected.Strings = (
      'INVCORR'#9'6'#9'N'#186#9'F'
      'CIAID'#9'4'#9'Cia'#9'F'
      'LOCID'#9'3'#9'Loc'#9'F'
      'TINID'#9'4'#9'T. Inv.'#9'F'
      'ALMID'#9'3'#9'Alm'#9'F'
      'NISAIDS'#9'10'#9'Salida'#9'F'
      'NISAIDE'#9'8'#9'Ingreso'#9'F'
      'FLAGVAR'#9'5'#9'Flag'#9'F'
      'FREG'#9'10'#9'F. Registro'#9'F'
      'KDXUSER'#9'10'#9'Usuario'#9'F'
      'OBSER'#9'20'#9'Observaci'#243'n'#9'F')
    MemoAttributes = [mSizeable, mWordWrap, mGridShow, mViewOnly, mDisableDialog]
    IniAttributes.Delimiter = ';;'
    TitleColor = 7566265
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alClient
    Color = clWhite
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
    OnDblClick = dbgAjuSalDblClick
    object dbgAjuSalIButton: TwwIButton
      Left = 0
      Top = 0
      Width = 33
      Height = 31
      AllowAllUp = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333FF33333333FF333993333333300033377F3333333777333993333333
        300033F77FFF3333377739999993333333333777777F3333333F399999933333
        33003777777333333377333993333333330033377F3333333377333993333333
        3333333773333333333F333333333333330033333333F33333773333333C3333
        330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
        333333333337733333FF3333333C333330003333333733333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = dbgAjuSalIButtonClick
    end
  end
  object pnlCabecera: TPanel
    Left = 122
    Top = 124
    Width = 455
    Height = 330
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 14869218
    TabOrder = 1
    Visible = False
    object Bevel1: TBevel
      Left = 9
      Top = 29
      Width = 435
      Height = 257
      Shape = bsFrame
    end
    object lblCIA: TLabel
      Left = 22
      Top = 35
      Width = 49
      Height = 15
      Caption = 'Compa'#241#237'a'
    end
    object lblObs: TLabel
      Left = 21
      Top = 204
      Width = 151
      Height = 15
      Caption = 'Observaciones / Comentarios'
    end
    object Label2: TLabel
      Left = 232
      Top = 79
      Width = 43
      Height = 15
      Caption = 'Almac'#233'n'
    end
    object Bevel2: TBevel
      Left = 11
      Top = 127
      Width = 430
      Height = 7
      Shape = bsTopLine
    end
    object Label3: TLabel
      Left = 233
      Top = 35
      Width = 49
      Height = 15
      Caption = 'Localidad'
    end
    object Bevel3: TBevel
      Left = 234
      Top = 142
      Width = 198
      Height = 51
    end
    object lblNumNS: TLabel
      Left = 244
      Top = 147
      Width = 80
      Height = 15
      Caption = 'N'#186' N. de Salida'
    end
    object Label1: TLabel
      Left = 337
      Top = 147
      Width = 87
      Height = 15
      Caption = 'N'#186' N. de Ingreso'
    end
    object Label4: TLabel
      Left = 138
      Top = 148
      Width = 88
      Height = 15
      Caption = 'Fecha de Proceso'
    end
    object Label5: TLabel
      Left = 20
      Top = 79
      Width = 68
      Height = 15
      Caption = 'T. Inventario'
    end
    object Z2bbtnProc: TBitBtn
      Left = 269
      Top = 293
      Width = 28
      Height = 28
      Hint = 'Procesar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      OnClick = Z2bbtnProcClick
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
    object dblcLOC: TwwDBLookupCombo
      Left = 233
      Top = 53
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'LOCID'#9'2'#9'C'#243'digo'#9'F'
        'LOCDES'#9'30'#9'Descripci'#243'n'#9'F'
        'LOCABR'#9'10'#9'Abreviatura'#9'F')
      DataField = 'LOCID'
      DataSource = DMALM.dsAjuSal
      LookupTable = DMALM.cdsLOC
      LookupField = 'LOCID'
      Options = [loColLines, loTitles]
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
    object dtpAjuSal: TDateTimePicker
      Left = 137
      Top = 165
      Width = 89
      Height = 23
      CalColors.TextColor = clMaroon
      CalColors.TrailingTextColor = clGreen
      Date = 36752.000000000000000000
      Format = 'dd/MM/yyyy'
      Time = 36752.000000000000000000
      TabOrder = 9
    end
    object Z2bbtnCancel: TBitBtn
      Left = 414
      Top = 293
      Width = 28
      Height = 28
      Hint = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      OnClick = Z2bbtnCancelClick
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
    object gbPer: TGroupBox
      Left = 17
      Top = 141
      Width = 114
      Height = 51
      TabOrder = 8
      object speAno: TSpinEdit
        Left = 7
        Top = 18
        Width = 55
        Height = 24
        MaxLength = 4
        MaxValue = 2100
        MinValue = 1990
        TabOrder = 0
        Value = 2006
      end
      object speMM: TSpinEdit
        Left = 66
        Top = 18
        Width = 39
        Height = 24
        MaxLength = 2
        MaxValue = 13
        MinValue = 0
        TabOrder = 1
        Value = 12
        OnExit = speMMExit
      end
    end
    object Z2bbtnAcep: TBitBtn
      Left = 380
      Top = 293
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
      TabOrder = 15
      OnClick = Z2bbtnAcepClick
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
    object dbeSal: TwwDBEdit
      Left = 244
      Top = 163
      Width = 81
      Height = 23
      DataField = 'NISAIDS'
      DataSource = DMALM.dsAjuSal
      Enabled = False
      ReadOnly = True
      TabOrder = 10
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeIng: TwwDBEdit
      Left = 339
      Top = 163
      Width = 81
      Height = 23
      DataField = 'NISAIDE'
      DataSource = DMALM.dsAjuSal
      Enabled = False
      ReadOnly = True
      TabOrder = 11
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcCIA: TwwDBLookupCombo
      Left = 20
      Top = 53
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'C'#243'digo'#9'F'
        'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
        'CIAABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'CIAID'
      DataSource = DMALM.dsAjuSal
      LookupTable = DMALM.cdsCIA
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
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
    object dblcALM: TwwDBLookupCombo
      Left = 233
      Top = 96
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'ALMID'#9'2'#9'C'#243'digo'#9'F'
        'ALMDES'#9'40'#9'Descripci'#243'n'#9'F'
        'ALMABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'ALMID'
      DataSource = DMALM.dsAjuSal
      LookupTable = DMALM.cdsALM
      LookupField = 'ALMID'
      Options = [loColLines, loRowLines, loTitles]
      Enabled = False
      MaxLength = 2
      TabOrder = 6
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcALMExit
      OnNotInList = NotInList
    end
    object pnlEtiq: TPanel
      Left = 2
      Top = 2
      Width = 451
      Height = 22
      Align = alTop
      Color = clHighlight
      TabOrder = 16
      object lblCaption: TLabel
        Left = 9
        Top = 4
        Width = 182
        Height = 13
        Caption = 'Ajuste Automatico de Inventario'
        Color = clActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
    object pbProceso: TProgressBar
      Left = 12
      Top = 297
      Width = 250
      Height = 16
      Cursor = crArrow
      BorderWidth = 2
      TabOrder = 17
      Visible = False
    end
    object Z2bbtnDetAju: TBitBtn
      Left = 304
      Top = 293
      Width = 62
      Height = 28
      Hint = 'Detalle de Ajuste'
      Caption = 'Detalle'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 18
      OnClick = Z2bbtnDetAjuClick
      NumGlyphs = 2
    end
    object dbeCIA: TEdit
      Left = 71
      Top = 53
      Width = 153
      Height = 23
      Enabled = False
      TabOrder = 1
    end
    object dbeLOC: TEdit
      Left = 284
      Top = 53
      Width = 150
      Height = 23
      Enabled = False
      TabOrder = 3
    end
    object dbeALM: TEdit
      Left = 284
      Top = 96
      Width = 150
      Height = 23
      Enabled = False
      TabOrder = 7
    end
    object dbmObs: TMemo
      Left = 22
      Top = 222
      Width = 409
      Height = 53
      TabOrder = 12
    end
    object dblcTIN: TwwDBLookupCombo
      Left = 21
      Top = 96
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TINID'#9'2'#9'Id'#9'F'
        'TINDES'#9'25'#9'Descripci'#243'n'#9'F')
      DataField = 'TINID'
      DataSource = DMALM.dsAjuSal
      LookupTable = DMALM.cdsTINID
      LookupField = 'TINID'
      Options = [loColLines, loRowLines, loTitles]
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
      Left = 72
      Top = 96
      Width = 154
      Height = 23
      Enabled = False
      TabOrder = 5
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 477
    Width = 711
    Height = 45
    Align = alBottom
    Color = 14869218
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 456
      Top = 5
      Width = 72
      Height = 30
      Hint = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn1Click
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
end
