object FGuiaRemisionALM: TFGuiaRemisionALM
  Left = 337
  Top = 113
  Width = 794
  Height = 565
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Guia de Remisi'#243'n'
  Color = 12904163
  Constraints.MaxHeight = 600
  Constraints.MaxWidth = 800
  Constraints.MinHeight = 560
  Constraints.MinWidth = 780
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCab: TPanel
    Left = 6
    Top = 1
    Width = 761
    Height = 246
    Color = 10207162
    TabOrder = 0
    object lblFReg: TLabel
      Left = 487
      Top = 5
      Width = 84
      Height = 13
      Caption = 'Fecha de Guia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 595
      Top = 5
      Width = 89
      Height = 13
      Caption = 'Fecha Traslado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblObs: TLabel
      Left = 310
      Top = 166
      Width = 168
      Height = 13
      Caption = 'Observaciones / Comentarios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label21: TLabel
      Left = 15
      Top = 113
      Width = 80
      Height = 13
      Caption = 'Departamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label22: TLabel
      Left = 158
      Top = 113
      Width = 54
      Height = 13
      Caption = 'Provincia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label23: TLabel
      Left = 316
      Top = 113
      Width = 41
      Height = 13
      Caption = 'Distrito'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 472
      Top = 114
      Width = 102
      Height = 13
      Caption = 'Direcci'#243'n Destino'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 414
      Top = 73
      Width = 133
      Height = 13
      Caption = 'Razon Social / Nombre'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label27: TLabel
      Left = 662
      Top = 73
      Width = 83
      Height = 13
      Caption = 'R.U.C./ D.N.I.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 17
      Top = 162
      Width = 105
      Height = 13
      Caption = 'TRANSPORTISTA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 201
      Width = 87
      Height = 13
      Caption = 'R.U.C. / D.N.I.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 126
      Top = 201
      Width = 137
      Height = 13
      Caption = 'Veh'#237'culo Marca y Placa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 14
      Top = 58
      Width = 93
      Height = 13
      Caption = 'DESTINATARIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 8
      Top = 52
      Width = 745
      Height = 3
    end
    object Bevel2: TBevel
      Left = 8
      Top = 155
      Width = 745
      Height = 3
    end
    object Bevel3: TBevel
      Left = 289
      Top = 159
      Width = 4
      Height = 83
    end
    object lblCC: TLabel
      Left = 16
      Top = 73
      Width = 98
      Height = 13
      Caption = 'Centro de Costos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 690
      Top = 5
      Width = 58
      Height = 13
      Caption = 'Dir.Origen'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object dbdtpFNS: TwwDBDateTimePicker
      Left = 485
      Top = 24
      Width = 88
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'FECGUIA'
      DataSource = DMALM.dsCnt300
      Epoch = 1950
      Enabled = False
      ShowButton = True
      TabOrder = 0
      DisplayFormat = 'dd/mm/yyyy'
    end
    object dtpFectra: TwwDBDateTimePicker
      Left = 593
      Top = 24
      Width = 88
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'GUIAFECTRA'
      DataSource = DMALM.dsCnt300
      Epoch = 1950
      ShowButton = True
      TabOrder = 1
      DisplayFormat = 'dd/mm/yyyy'
    end
    object dbmObs: TDBMemo
      Left = 305
      Top = 183
      Width = 440
      Height = 54
      DataField = 'OBSGUIA'
      DataSource = DMALM.dsCnt300
      MaxLength = 256
      ScrollBars = ssVertical
      TabOrder = 17
    end
    object dblcdProvinc: TwwDBLookupComboDlg
      Left = 158
      Top = 128
      Width = 45
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'CIUDID'#9'3'#9'Id'#9'F'
        'CIUDDES'#9'30'#9'Descripci'#243'n'#9'F')
      DataField = 'CIUDID'
      DataSource = DMALM.dsCnt300
      LookupTable = DMALM.cdsProvinc
      LookupField = 'CIUDID'
      MaxLength = 2
      TabOrder = 8
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnEnter = dblcdProvincEnter
      OnExit = dblcdProvincExit
    end
    object dblcdDistrito: TwwDBLookupComboDlg
      Left = 314
      Top = 128
      Width = 45
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'ZIPID'#9'3'#9'Id'#9'F'
        'ZIPDES'#9'35'#9'Distrito'#9'F')
      DataField = 'ZIPID'
      DataSource = DMALM.dsCnt300
      LookupTable = DMALM.cdsDistrito
      LookupField = 'ZIPID'
      MaxLength = 2
      TabOrder = 9
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnEnter = dblcdDistritoEnter
      OnExit = dblcdDistritoExit
    end
    object dbeDirCom: TwwDBEdit
      Left = 469
      Top = 128
      Width = 280
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DIRECC'
      DataSource = DMALM.dsCnt300
      MaxLength = 50
      TabOrder = 10
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeDeparta: TwwDBEdit
      Left = 60
      Top = 128
      Width = 90
      Height = 21
      CharCase = ecUpperCase
      Color = clInfoBk
      Enabled = False
      TabOrder = 11
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeProvinc: TwwDBEdit
      Left = 205
      Top = 128
      Width = 100
      Height = 21
      CharCase = ecUpperCase
      Color = clInfoBk
      Enabled = False
      TabOrder = 12
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeDistrito: TwwDBEdit
      Left = 360
      Top = 128
      Width = 100
      Height = 21
      CharCase = ecUpperCase
      Color = clInfoBk
      Enabled = False
      TabOrder = 13
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeRazSoc: TwwDBEdit
      Left = 296
      Top = 87
      Width = 355
      Height = 21
      CharCase = ecUpperCase
      DataField = 'RAZSOC'
      DataSource = DMALM.dsCnt300
      MaxLength = 50
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcdCC: TwwDBLookupComboDlg
      Left = 13
      Top = 87
      Width = 70
      Height = 21
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taCenter
      Caption = 'Centro de Costos'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'CCOSID'#9'8'#9'C'#243'digo'#9'F'
        'CCOSDES'#9'40'#9'Descripci'#243'n'#9'F'
        'CCOSGRUPO'#9'30'#9'Grupo Centro Costo'#9'F')
      DataField = 'CCOSID'
      DataSource = DMALM.dsCnt300
      LookupTable = DMALM.cdsCCost
      LookupField = 'CCOSID'
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcdCCExit
    end
    object dbeRuc: TwwDBEdit
      Left = 660
      Top = 87
      Width = 88
      Height = 21
      AutoFillDate = False
      AutoSelect = False
      AutoSize = False
      CharCase = ecUpperCase
      DataField = 'DESRUC'
      DataSource = DMALM.dsCnt300
      MaxLength = 12
      Picture.PictureMask = '[#][#][#][#][#][#][#][#][#][#][#]'
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeTraNom: TwwDBEdit
      Left = 13
      Top = 177
      Width = 262
      Height = 21
      CharCase = ecUpperCase
      DataField = 'TRANNOM'
      DataSource = DMALM.dsCnt300
      MaxLength = 50
      TabOrder = 14
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeTraRuc: TwwDBEdit
      Left = 13
      Top = 215
      Width = 90
      Height = 21
      AutoFillDate = False
      AutoSelect = False
      CharCase = ecUpperCase
      DataField = 'TRANRUC'
      DataSource = DMALM.dsCnt300
      MaxLength = 12
      Picture.PictureMask = '[#][#][#][#][#][#][#][#][#][#][#]'
      TabOrder = 15
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeTraPla: TwwDBEdit
      Left = 114
      Top = 215
      Width = 161
      Height = 21
      AutoFillDate = False
      AutoSelect = False
      CharCase = ecUpperCase
      DataField = 'TRANPLA'
      DataSource = DMALM.dsCnt300
      MaxLength = 30
      TabOrder = 16
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeCC: TwwDBEdit
      Left = 84
      Top = 87
      Width = 203
      Height = 21
      CharCase = ecUpperCase
      Color = clInfoBk
      Enabled = False
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeDirOri: TwwDBEdit
      Left = 687
      Top = 24
      Width = 64
      Height = 21
      DataField = 'DIRORI'
      DataSource = DMALM.dsCnt300
      MaxLength = 50
      TabOrder = 2
      UnboundDataType = wwDefault
      Visible = False
      WantReturns = False
      WordWrap = False
    end
    object Panel2: TPanel
      Left = 7
      Top = 3
      Width = 469
      Height = 48
      BevelOuter = bvNone
      Color = 10207162
      Enabled = False
      TabOrder = 18
      object lblCIA: TLabel
        Left = 5
        Top = 2
        Width = 58
        Height = 13
        Caption = 'Compa'#241#237'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTI: TLabel
        Left = 287
        Top = 2
        Width = 70
        Height = 13
        Caption = 'T.Inventario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDoc: TLabel
        Left = 369
        Top = 2
        Width = 85
        Height = 13
        Caption = 'Nota de Salida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dblcCIA: TwwDBLookupCombo
        Left = 5
        Top = 18
        Width = 47
        Height = 27
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CIAID'#9'2'#9'C'#243'digo'#9'F'
          'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
          'CIAABR'#9'15'#9'Abreviatura'#9'F')
        DataField = 'CIAID'
        DataSource = DMALM.dsCnt300
        LookupTable = DMALM.cdsCIA
        LookupField = 'CIAID'
        Options = [loColLines, loTitles]
        Color = clInfoBk
        DropDownCount = 15
        MaxLength = 2
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcCIAExit
      end
      object dbeCIA: TEdit
        Left = 53
        Top = 18
        Width = 224
        Height = 27
        Color = clInfoBk
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object dbeTinId: TwwDBEdit
        Left = 304
        Top = 18
        Width = 35
        Height = 27
        CharCase = ecUpperCase
        Color = clInfoBk
        DataField = 'TINID'
        DataSource = DMALM.dsCnt300
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        MaxLength = 8
        ParentFont = False
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeNisaId: TwwDBEdit
        Left = 370
        Top = 18
        Width = 80
        Height = 27
        CharCase = ecUpperCase
        Color = clInfoBk
        DataField = 'NISAID'
        DataSource = DMALM.dsCnt300
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        MaxLength = 8
        ParentFont = False
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object dblcDeparta: TwwDBLookupComboDlg
      Left = 13
      Top = 128
      Width = 45
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      DataField = 'DPTOID'
      DataSource = DMALM.dsCnt300
      LookupTable = DMALM.cdsDpto
      LookupField = 'DPTOID'
      TabOrder = 7
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcDepartaExit
    end
  end
  object pnlBoton: TPanel
    Left = 6
    Top = 481
    Width = 764
    Height = 43
    Color = 10207162
    TabOrder = 1
    object sbDiseno: TSpeedButton
      Left = 4
      Top = 25
      Width = 5
      Height = 15
      Flat = True
      OnClick = sbDisenoClick
    end
    object Z2bbtnGraba: TBitBtn
      Left = 539
      Top = 7
      Width = 32
      Height = 30
      Hint = 'Grabar Registro'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
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
    object Z2bbtnAceptar: TBitBtn
      Left = 579
      Top = 7
      Width = 32
      Height = 30
      Hint = 'Confirma Actualizaci'#243'n'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
    object Panel3: TPanel
      Left = 248
      Top = 4
      Width = 209
      Height = 36
      Enabled = False
      TabOrder = 2
      object Label5: TLabel
        Left = 18
        Top = 9
        Width = 50
        Height = 16
        Caption = 'Estado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbeEstado: TwwDBEdit
        Left = 83
        Top = 5
        Width = 103
        Height = 26
        AutoSize = False
        DataField = 'ESTADO'
        DataSource = DMALM.dsCnt300
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object Z2bbtnPrint: TBitBtn
      Left = 619
      Top = 7
      Width = 32
      Height = 30
      Hint = 'Emitir Orden de Compra'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
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
    object bbtnExp: TfcShapeBtn
      Left = 661
      Top = 6
      Width = 38
      Height = 33
      Hint = 'Exportar Articulos a Texto'
      Color = 11577276
      DitherColor = clMaroon
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
        7700333333337777777733333333008088003333333377F73377333333330088
        88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
        000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
        FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
        99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
      ParentClipping = True
      ParentShowHint = False
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      Shape = bsRoundRect
      ShowHint = True
      TabOrder = 5
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = bbtnExpClick
    end
    object Z2bbtnOK: TBitBtn
      Left = 497
      Top = 6
      Width = 215
      Height = 33
      Hint = 'Pasa a Registrar Detalle'
      Caption = 'Generar Guia(s) de Remisi'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = Z2bbtnOKClick
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
      Margin = 4
      NumGlyphs = 2
    end
    object bbtnNumero: TBitBtn
      Left = 44
      Top = 7
      Width = 32
      Height = 30
      Hint = 'Cambiar N'#250'mero de Guia de Remisi'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = bbtnNumeroClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF03337F33F333F3337F330FF0FFF0FFF
        F03337F37F337F3337F330FF0FFF0FFFF03337F37FFF7FFF37F330F00000000F
        F03337F77777777337F330FFF0FFF0FFF03337F337F337F337F330FFF0FFF0FF
        F03337F337FFF7FFF7F330FF00000000F03337F37777777737F330FFFF0FFF0F
        F03337F3337F337F37F330FFFF0FFF0FF03337F33373337337F330FFFFFFFFFF
        F03337F33333333FF7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
        F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
        333337FFFFFFFF77333330000000000333333777777777733333}
      NumGlyphs = 2
    end
    object bbtnAnular: TBitBtn
      Left = 96
      Top = 7
      Width = 32
      Height = 30
      Hint = 'Anular Guia(s) de Remisi'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = bbtnAnularClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFF33FF333FFF339993370733
        999333777FF37FF377733339993000399933333777F777F77733333399970799
        93333333777F7377733333333999399933333333377737773333333333990993
        3333333333737F73333333333331013333333333333777FF3333333333910193
        333333333337773FF3333333399000993333333337377737FF33333399900099
        93333333773777377FF333399930003999333337773777F777FF339993370733
        9993337773337333777333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object cbDiseno: TCheckBox
      Left = 3
      Top = 7
      Width = 13
      Height = 14
      Caption = 'cbDiseno'
      TabOrder = 8
      Visible = False
    end
  end
  object dbgDReqs: TwwDBGrid
    Left = 202
    Top = 253
    Width = 567
    Height = 230
    DisableThemesInTitle = False
    Selected.Strings = (
      'KDXID'#9'5'#9'Item'
      'ARTID'#9'10'#9'C'#243'digo~Art'#237'culo'
      'ARTDES'#9'52'#9'Detalle'
      'UNMIDG'#9'6'#9'Unidad~Medida'
      'KDXCNTG'#9'10'#9'Cantidad~Atendida')
    IniAttributes.Delimiter = ';;'
    TitleColor = 10207162
    FixedCols = 0
    ShowHorzScrollBar = True
    Color = clWhite
    DataSource = DMALM.dsKDX
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    KeyOptions = [dgEnterToTab]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    ParentFont = False
    TabOrder = 2
    TitleAlignment = taCenter
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    UseTFields = False
    OnDblClick = dbgDReqsDblClick
  end
  object Z2bbtnSalir: TBitBtn
    Left = 732
    Top = 488
    Width = 32
    Height = 30
    Hint = 'Salir'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Garamond'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
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
  object dbgGuia: TwwDBGrid
    Left = 6
    Top = 250
    Width = 179
    Height = 230
    DisableThemesInTitle = False
    Selected.Strings = (
      'SERGUIA'#9'06'#9'Serie'
      'NUMGUIA'#9'10'#9'Guia(s) de~Remisi'#243'n')
    IniAttributes.Delimiter = ';;'
    TitleColor = 10207162
    OnRowChanged = dbgGuiaRowChanged
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DMALM.dsCnt300
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    ParentFont = False
    TabOrder = 4
    TitleAlignment = taCenter
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clNavy
    TitleFont.Height = -13
    TitleFont.Name = 'Comic Sans MS'
    TitleFont.Style = [fsBold]
    TitleLines = 2
    TitleButtons = False
  end
  object dbgDetalle: TwwDBGrid
    Left = 202
    Top = 250
    Width = 567
    Height = 230
    DisableThemesInTitle = False
    Selected.Strings = (
      'ITEM'#9'5'#9'Item'
      'ARTID'#9'10'#9'C'#243'digo~Art'#237'culo'
      'ARTDES'#9'52'#9'Detalle'
      'UNMIDG'#9'6'#9'Unidad~Medida'
      'CANTIDAD'#9'10'#9'Cantidad~Atendida')
    IniAttributes.Delimiter = ';;'
    TitleColor = 10207162
    FixedCols = 0
    ShowHorzScrollBar = True
    Color = clWhite
    DataSource = DMALM.dsCnt301
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    KeyOptions = [dgEnterToTab]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    ParentFont = False
    TabOrder = 5
    TitleAlignment = taCenter
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clNavy
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    UseTFields = False
    OnDblClick = dbgDetalleDblClick
  end
  object pnlArticulo: TPanel
    Left = 272
    Top = 304
    Width = 385
    Height = 153
    TabOrder = 6
    Visible = False
    object Label8: TLabel
      Left = 16
      Top = 24
      Width = 24
      Height = 15
      Caption = 'Item'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 88
      Top = 24
      Width = 64
      Height = 15
      Caption = 'C'#243'd Art'#237'culo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 16
      Top = 64
      Width = 62
      Height = 15
      Caption = 'Descripci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 16
      Top = 104
      Width = 65
      Height = 15
      Caption = 'Unid Medida'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 240
      Top = 104
      Width = 45
      Height = 15
      Caption = 'Cantidad'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object edtDetItem: TwwDBEdit
      Left = 16
      Top = 40
      Width = 57
      Height = 21
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtDetArticulo: TwwDBEdit
      Left = 88
      Top = 40
      Width = 89
      Height = 21
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtDetDescripcion: TwwDBEdit
      Left = 16
      Top = 80
      Width = 353
      Height = 21
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtDetCantidad: TwwDBEdit
      Left = 240
      Top = 120
      Width = 65
      Height = 21
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcDetUnidMedida: TwwDBLookupCombo
      Left = 16
      Top = 120
      Width = 49
      Height = 21
      DropDownAlignment = taLeftJustify
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
    end
    object edtUnidMedida: TwwDBEdit
      Left = 72
      Top = 120
      Width = 153
      Height = 21
      Enabled = False
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object stxTitulo3: TStaticText
      Left = 1
      Top = 1
      Width = 383
      Height = 19
      Align = alTop
      Alignment = taCenter
      BorderStyle = sbsSunken
      Caption = 'Detalle de Gu'#237'a de Remisi'#243'n'
      Color = clHighlight
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      TabOrder = 6
    end
    object btnDetGrabar: TBitBtn
      Left = 313
      Top = 109
      Width = 27
      Height = 28
      Hint = 'Confirma Actualizaci'#243'n de Servicio'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = btnDetGrabarClick
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
    object btnDetCancelar: TBitBtn
      Left = 345
      Top = 109
      Width = 30
      Height = 28
      Hint = 'Cancelar Registro'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = btnDetCancelarClick
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
  end
  object ppdbDet: TppBDEPipeline
    UserName = 'dbDet'
    Left = 632
    Top = 456
  end
  object ppr1: TppReport
    AutoStop = False
    DataPipeline = ppdbDet
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 15000
    PrinterSetup.mmMarginLeft = 5000
    PrinterSetup.mmMarginRight = 5000
    PrinterSetup.mmMarginTop = 10000
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\DemaExes\RTMS\ALMSG\Dema\GuiaRemision.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zsPercentage
    PreviewFormSettings.ZoomPercentage = 75
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 664
    Top = 456
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbDet'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 100277
      mmPrintPosition = 0
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'NUMGUIA'
        DataPipeline = ppdbCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbCab'
        mmHeight = 4233
        mmLeft = 156369
        mmTop = 20902
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'SERGUIA'
        DataPipeline = ppdbCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbCab'
        mmHeight = 4233
        mmLeft = 146844
        mmTop = 20902
        mmWidth = 6879
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'FECGUIA'
        DataPipeline = ppdbCab
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbCab'
        mmHeight = 3260
        mmLeft = 26194
        mmTop = 37835
        mmWidth = 14139
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'GUIAFECTRA'
        DataPipeline = ppdbCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbCab'
        mmHeight = 4233
        mmLeft = 93663
        mmTop = 37835
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'DIRECC'
        DataPipeline = ppdbCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbCab'
        mmHeight = 4233
        mmLeft = 132027
        mmTop = 51329
        mmWidth = 70908
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'DESRUC'
        DataPipeline = ppdbCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbCab'
        mmHeight = 4233
        mmLeft = 27781
        mmTop = 62442
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'DOCIDE'
        DataPipeline = ppdbCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbCab'
        mmHeight = 3969
        mmLeft = 73025
        mmTop = 62442
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'RAZSOC'
        DataPipeline = ppdbCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbCab'
        mmHeight = 4233
        mmLeft = 11906
        mmTop = 53181
        mmWidth = 87842
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'TRANNOM'
        DataPipeline = ppdbCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbCab'
        mmHeight = 4233
        mmLeft = 27517
        mmTop = 76200
        mmWidth = 60590
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'TRANRUC'
        DataPipeline = ppdbCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbCab'
        mmHeight = 4233
        mmLeft = 105569
        mmTop = 76200
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'TRANPLA'
        DataPipeline = ppdbCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbCab'
        mmHeight = 4233
        mmLeft = 153723
        mmTop = 76200
        mmWidth = 38365
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'TRIID'
        DataPipeline = ppdbCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbCab'
        mmHeight = 4233
        mmLeft = 44979
        mmTop = 87313
        mmWidth = 5027
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'DPTODES'
        DataPipeline = ppdbOtros
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbOtros'
        mmHeight = 4233
        mmLeft = 175419
        mmTop = 61648
        mmWidth = 28840
        BandType = 0
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'CIUDDES'
        DataPipeline = ppdbOtros
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbOtros'
        mmHeight = 4233
        mmLeft = 146579
        mmTop = 61648
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'ZIPDES'
        DataPipeline = ppdbOtros
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbOtros'
        mmHeight = 4233
        mmLeft = 114829
        mmTop = 61648
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        AutoSize = True
        DataField = 'TRIDES'
        DataPipeline = ppdbOtros
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbOtros'
        mmHeight = 3260
        mmLeft = 51858
        mmTop = 87313
        mmWidth = 25485
        BandType = 0
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'NISAID'
        DataPipeline = ppdbCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbCab'
        mmHeight = 4233
        mmLeft = 179123
        mmTop = 37835
        mmWidth = 14552
        BandType = 0
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        AutoSize = True
        DataField = 'TINID'
        DataPipeline = ppdbCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbCab'
        mmHeight = 3260
        mmLeft = 153459
        mmTop = 37835
        mmWidth = 3133
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'N.SALIDA:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 164042
        mmTop = 37835
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'T.INV.:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 142082
        mmTop = 37835
        mmWidth = 10372
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'ARTID'
        DataPipeline = ppdbDet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbDet'
        mmHeight = 3260
        mmLeft = 13494
        mmTop = 529
        mmWidth = 12531
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'ARTDES'
        DataPipeline = ppdbDet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppdbDet'
        mmHeight = 4233
        mmLeft = 48419
        mmTop = 529
        mmWidth = 67733
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'ITEM'
        DataPipeline = ppdbDet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbDet'
        mmHeight = 4233
        mmLeft = 5292
        mmTop = 529
        mmWidth = 4445
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'UNMIDG'
        DataPipeline = ppdbDet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbDet'
        mmHeight = 3260
        mmLeft = 119063
        mmTop = 529
        mmWidth = 6096
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        BlankWhenZero = True
        DataField = 'CANTIDAD_REP'
        DataPipeline = ppdbDet
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbDet'
        mmHeight = 4233
        mmLeft = 125413
        mmTop = 529
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        AutoSize = True
        DataField = 'CODBAR'
        DataPipeline = ppdbDet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbDet'
        mmHeight = 3302
        mmLeft = 28840
        mmTop = 529
        mmWidth = 9398
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'ACFSERIE'
        DataPipeline = ppdbDet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbDet'
        mmHeight = 4233
        mmLeft = 141817
        mmTop = 529
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'MODELO'
        DataPipeline = ppdbDet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbDet'
        mmHeight = 4233
        mmLeft = 178859
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'MARCA'
        DataPipeline = ppdbDet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbDet'
        mmHeight = 4233
        mmLeft = 166952
        mmTop = 529
        mmWidth = 10319
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        DataField = 'ORDEN'
        DataPipeline = ppdbDet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbDet'
        mmHeight = 4233
        mmLeft = 42333
        mmTop = 529
        mmWidth = 4233
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 30163
      mmPrintPosition = 0
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'OBSGUIA'
        DataPipeline = ppdbCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbCab'
        mmHeight = 12700
        mmLeft = 30692
        mmTop = 8731
        mmWidth = 157957
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = 'USUARIO'
        DataPipeline = ppdbCab
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppdbCab'
        mmHeight = 3260
        mmLeft = 118920
        mmTop = 23548
        mmWidth = 13250
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = '-----.-----'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 94776
        mmTop = 0
        mmWidth = 16298
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'ARTID'
      DataPipeline = ppdbDet
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdbDet'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppd1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppr1
    IniStorageType = 'IniFile'
    IniStorageName = 'C:\DemaExes\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 688
    Top = 456
  end
  object ppdbCab: TppDBPipeline
    UserName = 'dbCab'
    Left = 600
    Top = 448
  end
  object ppdbOtros: TppDBPipeline
    UserName = 'dbOtros'
    Left = 568
    Top = 448
  end
  object scFile: TStrContainer
    Left = 112
    Top = 442
  end
  object sdGraba: TSaveDialog
    DefaultExt = 'txt'
    FileName = 'c:\oaEjecuta\*.txt'
    Filter = '*.txt '
    Title = 'Archivo de Planillas'
    Left = 146
    Top = 442
  end
end
