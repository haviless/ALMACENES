object FMovAlmEnt: TFMovAlmEnt
  Left = 8
  Top = 92
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FMovAlmEnt'
  ClientHeight = 335
  ClientWidth = 749
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCabecera: TPanel
    Left = 0
    Top = 0
    Width = 749
    Height = 321
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = '|'
    TabOrder = 0
    object bvl4: TBevel
      Left = 6
      Top = 5
      Width = 780
      Height = 280
      Shape = bsFrame
    end
    object lblCIA: TLabel
      Left = 16
      Top = 12
      Width = 49
      Height = 13
      Caption = 'Compañía'
    end
    object lblNumNS: TLabel
      Left = 685
      Top = 58
      Width = 74
      Height = 13
      Caption = 'Nº Nota de Ing.'
    end
    object lblObs: TLabel
      Left = 16
      Top = 203
      Width = 140
      Height = 13
      Caption = 'Observaciones / Comentarios'
    end
    object Label2: TLabel
      Left = 522
      Top = 12
      Width = 41
      Height = 13
      Caption = 'Almacén'
    end
    object lblFReg: TLabel
      Left = 273
      Top = 59
      Width = 73
      Height = 13
      Caption = 'F. Nota Ingreso'
    end
    object lblTDocumento: TLabel
      Left = 609
      Top = 113
      Width = 125
      Height = 13
      Caption = 'Documento de Referencia'
    end
    object lblNDoc: TLabel
      Left = 17
      Top = 160
      Width = 70
      Height = 13
      Caption = 'Nº Documento'
      Enabled = False
    end
    object lblFDoc: TLabel
      Left = 120
      Top = 160
      Width = 88
      Height = 13
      Caption = 'Fecha Documento'
      Enabled = False
    end
    object lblTransacc: TLabel
      Left = 365
      Top = 59
      Width = 59
      Height = 13
      Caption = 'Transacción'
    end
    object lblCC: TLabel
      Left = 11
      Top = 112
      Width = 81
      Height = 13
      Caption = 'Centro de Costos'
      Enabled = False
    end
    object lblProv: TLabel
      Left = 224
      Top = 112
      Width = 49
      Height = 13
      Caption = 'Proveedor'
      Enabled = False
    end
    object Label7: TLabel
      Left = 17
      Top = 59
      Width = 94
      Height = 13
      Caption = 'Tipo de Documento'
    end
    object lblNOC: TLabel
      Left = 468
      Top = 112
      Width = 98
      Height = 13
      Caption = 'Nº Orden de Compra'
      Enabled = False
    end
    object Label6: TLabel
      Left = 268
      Top = 12
      Width = 46
      Height = 13
      Caption = 'Localidad'
    end
    object Bevel1: TBevel
      Left = 12
      Top = 101
      Width = 770
      Height = 7
      Shape = bsTopLine
    end
    object Label8: TLabel
      Left = 217
      Top = 160
      Width = 21
      Height = 13
      Caption = 'Lote'
    end
    object Label11: TLabel
      Left = 325
      Top = 160
      Width = 66
      Height = 13
      Caption = 'Packed Order'
    end
    object Label12: TLabel
      Left = 441
      Top = 159
      Width = 88
      Height = 13
      Caption = 'Numero de Pedido'
    end
    object edNOrdC: TEdit
      Left = 468
      Top = 128
      Width = 117
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 16
    end
    object dblcCIA: TwwDBLookupCombo
      Left = 16
      Top = 29
      Width = 49
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Código'#9'F'
        'CIADES'#9'40'#9'Descripción'#9'F'
        'CIAABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'CIAID'
      DataSource = dm1.dsNIA
      LookupTable = dm1.cdsCIA
      LookupField = 'CIAID'
      Options = [loColLines, loTitles]
      MaxLength = 2
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object Z2bbtnOK: TBitBtn
      Left = 756
      Top = 288
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
      TabOrder = 26
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
      Top = 288
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
      Top = 75
      Width = 88
      Height = 21
      CharCase = ecUpperCase
      Color = clInfoBk
      DataField = 'NISAID'
      DataSource = dm1.dsNIA
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      TabOrder = 11
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbmObs: TDBMemo
      Left = 16
      Top = 221
      Width = 754
      Height = 58
      DataField = 'NISAOBS'
      DataSource = dm1.dsNIA
      TabOrder = 25
    end
    object dbeCIA: TwwDBEdit
      Left = 67
      Top = 29
      Width = 198
      Height = 21
      CharCase = ecUpperCase
      DataField = 'LKCIADES'
      DataSource = dm1.dsNIA
      Enabled = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcTALM: TwwDBLookupCombo
      Left = 521
      Top = 29
      Width = 49
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'ALMID'#9'2'#9'Código'#9'F'
        'ALMDES'#9'40'#9'Descripción'#9'F'
        'ALMABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'ALMID'
      DataSource = dm1.dsNIA
      LookupTable = dm1.cdsALM
      LookupField = 'ALMID'
      Options = [loColLines, loTitles]
      MaxLength = 2
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object dbeALM: TwwDBEdit
      Left = 572
      Top = 29
      Width = 198
      Height = 21
      CharCase = ecUpperCase
      DataField = 'LKALMDES'
      DataSource = dm1.dsNIA
      Enabled = False
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbdtpFNS: TwwDBDateTimePicker
      Left = 271
      Top = 76
      Width = 96
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'NISAFREG'
      DataSource = dm1.dsNIA
      Date = 36726
      Epoch = 1950
      ShowButton = True
      TabOrder = 8
      DisplayFormat = 'dd/mm/yyyy'
    end
    object dbeTDOC: TwwDBEdit
      Left = 660
      Top = 129
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      DataField = 'LKTDOCDES'
      DataSource = dm1.dsNIA
      Enabled = False
      TabOrder = 19
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeNDoc: TwwDBEdit
      Left = 16
      Top = 176
      Width = 102
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NISANDOC'
      DataSource = dm1.dsNIA
      Enabled = False
      TabOrder = 20
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbdtpFDoc: TwwDBDateTimePicker
      Left = 120
      Top = 176
      Width = 94
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'NISAFDOC'
      DataSource = dm1.dsNIA
      Date = 36712
      Epoch = 1950
      Enabled = False
      ShowButton = True
      TabOrder = 21
      DisplayFormat = 'dd/mm/yyyy'
    end
    object dblcdTDOC: TwwDBLookupComboDlg
      Left = 609
      Top = 129
      Width = 49
      Height = 21
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taCenter
      Caption = 'Documento de Referencia ...'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'DOCID'#9'2'#9'Código'#9'F'
        'DOCDES'#9'30'#9'Descripción'#9'F'
        'DOCABR'#9'8'#9'Abreviatura'#9'F')
      DataField = 'DOCID'
      DataSource = dm1.dsNIA
      LookupTable = dm1.cdsTDOC
      LookupField = 'DOCID'
      MaxLength = 2
      TabOrder = 18
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcTransac: TwwDBLookupCombo
      Left = 367
      Top = 76
      Width = 52
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TRIID'#9'2'#9'Código'#9'F'
        'TRIDES'#9'40'#9'Descripción'#9'F'
        'TRIABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'TRIID'
      DataSource = dm1.dsNIA
      LookupTable = dm1.cdsTRAN
      LookupField = 'TRIID'
      Options = [loColLines, loTitles]
      MaxLength = 2
      TabOrder = 9
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object dbeTransac: TwwDBEdit
      Left = 422
      Top = 76
      Width = 155
      Height = 21
      CharCase = ecUpperCase
      DataField = 'LKTRIDES'
      DataSource = dm1.dsNIA
      Enabled = False
      TabOrder = 10
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcdCC: TwwDBLookupComboDlg
      Left = 15
      Top = 129
      Width = 51
      Height = 21
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taCenter
      Caption = 'Centro de Costos'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'CCOSID'#9'3'#9'Código'#9'F'
        'CCOSDES'#9'40'#9'Descripción'#9'F'
        'CCOSABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'CCOSID'
      DataSource = dm1.dsNIA
      LookupTable = dm1.cdsCCost
      LookupField = 'CCOSID'
      Enabled = False
      MaxLength = 3
      TabOrder = 12
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dbeCC: TwwDBEdit
      Left = 68
      Top = 129
      Width = 154
      Height = 21
      CharCase = ecUpperCase
      DataField = 'LKCCOSDES'
      DataSource = dm1.dsNIA
      Enabled = False
      TabOrder = 13
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcdProv: TwwDBLookupComboDlg
      Left = 225
      Top = 129
      Width = 82
      Height = 21
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taCenter
      Caption = 'Proveedores'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'PROV'#9'8'#9'Código'#9'F'
        'PROVDES'#9'40'#9'Descripción'#9'F'
        'PROVABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'PROV'
      DataSource = dm1.dsNIA
      LookupTable = dm1.cdsProv
      LookupField = 'PROV'
      Enabled = False
      MaxLength = 8
      TabOrder = 14
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dbeProv: TwwDBEdit
      Left = 309
      Top = 129
      Width = 155
      Height = 21
      CharCase = ecUpperCase
      DataField = 'LKPROVDES'
      DataSource = dm1.dsNIA
      Enabled = False
      TabOrder = 15
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcTDA: TwwDBLookupCombo
      Left = 17
      Top = 76
      Width = 49
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TDAID'#9'2'#9'Código'#9'F'
        'TDADES'#9'40'#9'Descripción'#9'F'
        'TDAABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'TDAID'
      DataSource = dm1.dsNIA
      LookupTable = dm1.cdsTDNISA
      LookupField = 'TDAID'
      Options = [loColLines, loTitles]
      MaxLength = 2
      TabOrder = 6
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object dbeTDNISA: TwwDBEdit
      Left = 68
      Top = 76
      Width = 201
      Height = 21
      CharCase = ecUpperCase
      DataField = 'LKTDADES'
      DataSource = dm1.dsNIA
      Enabled = False
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object btnOC: TButton
      Left = 589
      Top = 128
      Width = 18
      Height = 21
      Caption = '>>'
      Enabled = False
      TabOrder = 17
    end
    object dblcLOC: TwwDBLookupCombo
      Left = 268
      Top = 29
      Width = 49
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'LOCID'#9'2'#9'Código'#9'F'
        'LOCDES'#9'30'#9'Descripción'#9'F'
        'LOCABR'#9'10'#9'Abreviatura'#9'F')
      DataField = 'LOCID'
      DataSource = dm1.dsNIA
      LookupTable = dm1.cdsLOC
      LookupField = 'LOCID'
      Options = [loColLines, loTitles]
      MaxLength = 2
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object dbeLOC: TwwDBEdit
      Left = 320
      Top = 29
      Width = 198
      Height = 21
      CharCase = ecUpperCase
      DataField = 'LKLOCDES'
      DataSource = dm1.dsNIA
      Enabled = False
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeLote: TwwDBEdit
      Left = 216
      Top = 174
      Width = 104
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NISALOTE'
      DataSource = dm1.dsNIA
      TabOrder = 22
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbePO: TwwDBEdit
      Left = 324
      Top = 174
      Width = 104
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NISPORD'
      DataSource = dm1.dsNIA
      TabOrder = 23
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeNP: TwwDBEdit
      Left = 433
      Top = 174
      Width = 104
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NISNPED'
      DataSource = dm1.dsNIA
      TabOrder = 24
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
end
