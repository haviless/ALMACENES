object FKardex: TFKardex
  Left = 528
  Top = 110
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Formulario de Kardex'
  ClientHeight = 504
  ClientWidth = 439
  Color = 14869218
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object lblTMON: TLabel
    Left = 49
    Top = 127
    Width = 96
    Height = 15
    Caption = 'Tipo de Inventario'
  end
  object lblGrArtID: TLabel
    Left = 49
    Top = 168
    Width = 91
    Height = 15
    Caption = 'Linea de Producto'
  end
  object lblFAM: TLabel
    Left = 49
    Top = 207
    Width = 37
    Height = 15
    Caption = 'Familia'
  end
  object lblSUBFAM: TLabel
    Left = 227
    Top = 206
    Width = 60
    Height = 15
    Caption = 'Sub Familia'
  end
  object lblCIA: TLabel
    Left = 49
    Top = 6
    Width = 49
    Height = 15
    Caption = 'Compa'#241#237'a'
  end
  object Label2: TLabel
    Left = 50
    Top = 87
    Width = 43
    Height = 15
    Caption = 'Almac'#233'n'
  end
  object Label1: TLabel
    Left = 48
    Top = 48
    Width = 49
    Height = 15
    Caption = 'Localidad'
  end
  object lblNSolCot: TLabel
    Left = 50
    Top = 247
    Width = 35
    Height = 15
    Caption = 'C'#243'digo'
  end
  object bbtnOk: TBitBtn
    Left = 113
    Top = 463
    Width = 95
    Height = 25
    Caption = 'Aceptar'
    TabOrder = 18
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
    Left = 222
    Top = 463
    Width = 95
    Height = 25
    Cancel = True
    Caption = 'Cerrar'
    ModalResult = 2
    TabOrder = 19
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
  object gbPeriodo: TGroupBox
    Left = 101
    Top = 303
    Width = 227
    Height = 55
    Caption = 'Periodo'
    TabOrder = 16
    object Label3: TLabel
      Left = 13
      Top = 12
      Width = 31
      Height = 15
      Caption = 'Desde'
    end
    object Label4: TLabel
      Left = 124
      Top = 12
      Width = 29
      Height = 15
      Caption = 'Hasta'
    end
    object dtpDesde: TDateTimePicker
      Left = 13
      Top = 25
      Width = 99
      Height = 23
      Date = 35988.719144328700000000
      Time = 35988.719144328700000000
      TabOrder = 0
      OnExit = dtpDesdeExit
    end
    object dtpHasta: TDateTimePicker
      Left = 124
      Top = 25
      Width = 97
      Height = 23
      Date = 38180.719144328700000000
      Time = 38180.719144328700000000
      TabOrder = 1
      OnExit = dtpHastaExit
    end
  end
  object rgTipoReporte: TRadioGroup
    Left = 374
    Top = 367
    Width = 43
    Height = 39
    Caption = 'Tipo de Reporte'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Detallado'
      'Resumido')
    TabOrder = 17
    Visible = False
  end
  object dblcTINID: TwwDBLookupCombo
    Left = 49
    Top = 143
    Width = 49
    Height = 23
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'TINID'#9'2'#9'ID'#9'F'
      'TINDES'#9'40'#9'Descripci'#243'n'#9'F')
    Options = [loColLines, loTitles]
    Enabled = False
    TabOrder = 6
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
  end
  object edtTINID: TwwDBEdit
    Left = 101
    Top = 143
    Width = 280
    Height = 23
    CharCase = ecUpperCase
    Enabled = False
    ReadOnly = True
    TabOrder = 7
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dblcGArti: TwwDBLookupCombo
    Left = 49
    Top = 183
    Width = 49
    Height = 23
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'GRARID'#9'15'#9'Grupos'#9'F'
      'GRARDES'#9'40'#9'Descripci'#243'n'#9'F')
    Options = [loColLines, loTitles]
    Enabled = False
    TabOrder = 8
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
  end
  object edtGArti: TwwDBEdit
    Left = 101
    Top = 183
    Width = 280
    Height = 23
    CharCase = ecUpperCase
    Enabled = False
    ReadOnly = True
    TabOrder = 9
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dblcFAM: TwwDBLookupCombo
    Left = 49
    Top = 223
    Width = 49
    Height = 23
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'FAMID'#9'3'#9'ID'#9'F'
      'FAMDES'#9'40'#9'Descripci'#243'n'#9'F')
    Options = [loColLines, loTitles]
    Enabled = False
    TabOrder = 10
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
  end
  object edtFAM: TwwDBEdit
    Left = 101
    Top = 223
    Width = 121
    Height = 23
    CharCase = ecUpperCase
    Enabled = False
    ReadOnly = True
    TabOrder = 11
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dblcSUBFAM: TwwDBLookupCombo
    Left = 227
    Top = 223
    Width = 49
    Height = 23
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'SFAMID'#9'8'#9'Id'#9'F'
      'SFAMDES'#9'40'#9'Sub-Familia'#9'F')
    Options = [loColLines, loTitles]
    Enabled = False
    TabOrder = 12
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
  end
  object edtSUBFAM: TwwDBEdit
    Left = 278
    Top = 223
    Width = 102
    Height = 23
    CharCase = ecUpperCase
    Enabled = False
    ReadOnly = True
    TabOrder = 13
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dblcCIA: TwwDBLookupCombo
    Left = 49
    Top = 23
    Width = 49
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
    Enabled = False
    TabOrder = 0
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
  end
  object dbeCIA: TEdit
    Left = 101
    Top = 23
    Width = 280
    Height = 23
    Enabled = False
    TabOrder = 1
  end
  object dblcTALM: TwwDBLookupCombo
    Left = 49
    Top = 103
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
    Enabled = False
    MaxLength = 2
    TabOrder = 4
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
  end
  object dbeALM: TwwDBEdit
    Left = 100
    Top = 103
    Width = 280
    Height = 23
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 5
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dblcLOC: TwwDBLookupCombo
    Left = 49
    Top = 63
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
    Enabled = False
    MaxLength = 2
    TabOrder = 2
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
  end
  object dbeLOC: TwwDBEdit
    Left = 100
    Top = 63
    Width = 280
    Height = 23
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 3
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object lvArticulos: TwwDBEdit
    Left = 49
    Top = 263
    Width = 78
    Height = 23
    CharCase = ecUpperCase
    DataField = 'ARTID'
    DataSource = DMALM.dsArti
    Enabled = False
    TabOrder = 14
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object edtArti: TwwDBEdit
    Left = 132
    Top = 263
    Width = 251
    Height = 23
    CharCase = ecUpperCase
    DataField = 'ARTDES'
    DataSource = DMALM.dsArti
    Enabled = False
    TabOrder = 15
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object rgTipoStocValo: TRadioGroup
    Left = 102
    Top = 371
    Width = 219
    Height = 39
    Caption = 'Tipo'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Stock'
      'Valorizado')
    TabOrder = 20
  end
  object pprDetalle: TppReport
    AutoStop = False
    DataPipeline = ppdbFuente
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rDetalle'
    PrinterSetup.PaperName = 'B5 ISO'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 340900
    PrinterSetup.PaperSize = 125
    Template.FileName = 'C:\SOLAlmacen\SOLFormatos\KardexUni.rtm'
    Units = utMillimeters
    BeforePrint = pprDetalleBeforePrint
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprDetallePreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 17
    Top = 312
    Version = '7.02'
    mmColumnWidth = 198174
    DataPipelineName = 'ppdbFuente'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 47361
      mmPrintPosition = 0
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = 'P'#225'gina:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 163777
        mmTop = 2117
        mmWidth = 12700
        BandType = 0
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 178065
        mmTop = 2117
        mmWidth = 1852
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        AutoSize = False
        Caption = 'Hora   :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 163777
        mmTop = 6350
        mmWidth = 12700
        BandType = 0
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable5'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 178065
        mmTop = 6350
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = 'Fecha :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 163777
        mmTop = 10583
        mmWidth = 12700
        BandType = 0
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable6'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 178065
        mmTop = 10583
        mmWidth = 16933
        BandType = 0
      end
      object pplblTitulo: TppLabel
        UserName = 'lblTitulo'
        AutoSize = False
        Caption = 'lblTitulo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 11113
        mmLeft = 64029
        mmTop = 8996
        mmWidth = 84402
        BandType = 0
      end
      object pplblLin0: TppLabel
        UserName = 'lblLin0'
        AutoSize = False
        Caption = 
          '================================================================' +
          '================================================================' +
          '===================='
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 30692
        mmWidth = 312209
        BandType = 0
      end
      object pplblLin1: TppLabel
        UserName = 'lblLin01'
        AutoSize = False
        Caption = 
          '================================================================' +
          '================================================================' +
          '===================='
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 43127
        mmWidth = 312209
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Producto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2910
        mmTop = 34660
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 63765
        mmTop = 38894
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Nro.Doc.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 33602
        mmTop = 38894
        mmWidth = 27781
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Transaccion'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 2910
        mmTop = 38894
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Ing. Gen.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 114300
        mmTop = 38894
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Sal. Ant. Gen.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 85461
        mmTop = 38894
        mmWidth = 24000
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label102'
        AutoSize = False
        Caption = 'Sal. Gen.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 143140
        mmTop = 38894
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label103'
        AutoSize = False
        Caption = 'Sal. Act. Gen.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 171980
        mmTop = 38894
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'UM'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 22490
        mmTop = 34660
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Tipo de Inv. :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 20902
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label6'
        Caption = 'Linea de Producto :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 3175
        mmTop = 26458
        mmWidth = 29898
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Label24'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 21431
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'Label27'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 26194
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'Cia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 7673
        mmLeft = 2381
        mmTop = 794
        mmWidth = 102394
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        AutoSize = False
        Caption = 'Sal. Uni.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 258498
        mmTop = 38894
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        AutoSize = False
        Caption = 'Sal. Act. Uni.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 287603
        mmTop = 38894
        mmWidth = 24000
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        AutoSize = False
        Caption = 'Ing. Uni.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 229659
        mmTop = 38894
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        AutoSize = False
        Caption = 'Sal. Ant. Uni.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 200819
        mmTop = 38894
        mmWidth = 24077
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 169334
        mmTop = 34396
        mmWidth = 265
        BandType = 0
      end
    end
    object ppdetbDetalle: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object pplblUStkActual: TppLabel
        UserName = 'lblUStkActual'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 171980
        mmTop = 265
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'TDAABR'
        DataPipeline = ppdbFuente
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 4233
        mmLeft = 2646
        mmTop = 265
        mmWidth = 28046
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'NISAFREG'
        DataPipeline = ppdbFuente
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 4233
        mmLeft = 62442
        mmTop = 265
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'NISAID'
        DataPipeline = ppdbFuente
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 4233
        mmLeft = 33338
        mmTop = 265
        mmWidth = 27252
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'KDXCNTGI'
        DataPipeline = ppdbFuente
        DisplayFormat = '#.###'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 4233
        mmLeft = 114300
        mmTop = 265
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'KDXCNTGS'
        DataPipeline = ppdbFuente
        DisplayFormat = '#.###'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 4233
        mmLeft = 143140
        mmTop = 265
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'SALDOG'
        DataPipeline = ppdbFuente
        DisplayFormat = '#.###'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 4233
        mmLeft = 85461
        mmTop = 265
        mmWidth = 24000
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'SALDOU'
        DataPipeline = ppdbFuente
        DisplayFormat = '#.###'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 4233
        mmLeft = 200819
        mmTop = 265
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'KDXCNTUI'
        DataPipeline = ppdbFuente
        DisplayFormat = '#.###'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 4233
        mmLeft = 229659
        mmTop = 265
        mmWidth = 24077
        BandType = 4
      end
      object ppLabel35: TppLabel
        UserName = 'lblUStkActual1'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 287603
        mmTop = 265
        mmWidth = 24000
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'KDXCNTUS'
        DataPipeline = ppdbFuente
        DisplayFormat = '#.###'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 4233
        mmLeft = 258498
        mmTop = 265
        mmWidth = 24077
        BandType = 4
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppLabel30: TppLabel
        UserName = 'Label30'
        AutoSize = False
        Caption = 'Stock'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 54240
        mmTop = 2117
        mmWidth = 28310
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'KDXCNTGI'
        DataPipeline = ppdbFuente
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 4233
        mmLeft = 114300
        mmTop = 2117
        mmWidth = 24077
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'KDXCNTGS'
        DataPipeline = ppdbFuente
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 4233
        mmLeft = 143140
        mmTop = 2117
        mmWidth = 24077
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'SALDOG'
        DataPipeline = ppdbFuente
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 4233
        mmLeft = 85461
        mmTop = 2117
        mmWidth = 24000
        BandType = 7
      end
      object ppVariable1: TppVariable
        UserName = 'Variable1'
        CalcOrder = 0
        DataType = dtDouble
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        OnCalc = ppVariable1Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 171980
        mmTop = 2117
        mmWidth = 24077
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 529
        mmWidth = 312209
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'SALDOU'
        DataPipeline = ppdbFuente
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 4233
        mmLeft = 200819
        mmTop = 2117
        mmWidth = 24077
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'KDXCNTUI'
        DataPipeline = ppdbFuente
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 4233
        mmLeft = 229659
        mmTop = 2117
        mmWidth = 24077
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'KDXCNTUS'
        DataPipeline = ppdbFuente
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 4233
        mmLeft = 258498
        mmTop = 2117
        mmWidth = 24077
        BandType = 7
      end
      object ppVariable2: TppVariable
        UserName = 'Variable2'
        CalcOrder = 1
        DataType = dtDouble
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        OnCalc = ppVariable2Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 287603
        mmTop = 2117
        mmWidth = 24000
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'ARTID'
      DataPipeline = ppdbFuente
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdbFuente'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'ARTDES'
          DataPipeline = ppdbFuente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppdbFuente'
          mmHeight = 4233
          mmLeft = 60590
          mmTop = 0
          mmWidth = 104246
          BandType = 3
          GroupNo = 1
        end
        object pptxtArtiId: TppDBText
          UserName = 'txtArtiId'
          DataField = 'ARTID'
          DataPipeline = ppdbFuente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbFuente'
          mmHeight = 4233
          mmLeft = 2117
          mmTop = 0
          mmWidth = 25135
          BandType = 3
          GroupNo = 1
        end
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          DataField = 'UMEDGDES'
          DataPipeline = ppdbFuente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbFuente'
          mmHeight = 4233
          mmLeft = 28046
          mmTop = 0
          mmWidth = 24606
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object pprResumen: TppReport
    AutoStop = False
    Columns = 2
    DataPipeline = ppdbFuente
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'pprDetallado'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 296863
    PrinterSetup.mmPaperWidth = 210874
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\Josue_Lopez\SOLAlmacen\kardex\Kardex.rtm'
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprResumenPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 17
    Top = 24
    Version = '7.02'
    mmColumnWidth = 99087
    DataPipelineName = 'ppdbFuente'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23283
      mmPrintPosition = 0
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Almacen'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 6085
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label201'
        AutoSize = False
        Caption = 'P'#225'gina:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 162984
        mmTop = 4233
        mmWidth = 11642
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        AutoSize = False
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 175684
        mmTop = 4233
        mmWidth = 1852
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Hora   :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 162984
        mmTop = 8467
        mmWidth = 11642
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        AutoSize = False
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 175684
        mmTop = 8467
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = 'Fecha :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 162984
        mmTop = 12700
        mmWidth = 11642
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 175684
        mmTop = 12700
        mmWidth = 16933
        BandType = 0
      end
      object pplblRTitulo: TppLabel
        UserName = 'lblTitulo1'
        AutoSize = False
        Caption = 'pplblRTitulo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 13758
        mmLeft = 50800
        mmTop = 4233
        mmWidth = 104775
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'lblLin02'
        AutoSize = False
        Caption = 
          '================================================================' +
          '============================='
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 19050
        mmWidth = 196850
        BandType = 0
      end
    end
    object ppColumnHeaderBand1: TppColumnHeaderBand
      mmBottomOffset = 0
      mmHeight = 13494
      mmPrintPosition = 0
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = 'Codigo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 529
        mmWidth = 11906
        BandType = 2
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Caption = 'Transaccion'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 4763
        mmWidth = 29633
        BandType = 2
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 8996
        mmWidth = 97367
        BandType = 2
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Caption = 'Producto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 529
        mmWidth = 71702
        BandType = 2
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        AutoSize = False
        Caption = 'Cant.Gen.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 45773
        mmTop = 4763
        mmWidth = 24606
        BandType = 2
      end
      object ppLabel28: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'Cant.Unit.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 74083
        mmTop = 4763
        mmWidth = 21696
        BandType = 2
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'TDAABR'
        DataPipeline = ppdbFuente
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 4233
        mmLeft = 6350
        mmTop = 794
        mmWidth = 28840
        BandType = 4
      end
      object pplblRGStkActual: TppLabel
        UserName = 'lblRGStkActual'
        AutoSize = False
        Caption = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 46567
        mmTop = 529
        mmWidth = 24871
        BandType = 4
      end
      object pplblRUStkActual: TppLabel
        UserName = 'lblRUStkActual'
        AutoSize = False
        Caption = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 74083
        mmTop = 529
        mmWidth = 24871
        BandType = 4
      end
    end
    object ppColumnFooterBand1: TppColumnFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel36: TppLabel
        UserName = 'Label36'
        AutoSize = False
        Caption = 
          '================================================================' +
          '============================='
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 3440
        mmWidth = 196850
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'KDXCNTG'
        DataPipeline = ppdbFuente
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 3969
        mmLeft = 46038
        mmTop = 4233
        mmWidth = 24606
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'KDXCNTU'
        DataPipeline = ppdbFuente
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbFuente'
        mmHeight = 3969
        mmLeft = 74083
        mmTop = 4233
        mmWidth = 23548
        BandType = 7
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Total General => '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3704
        mmTop = 4233
        mmWidth = 29369
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'ARTID'
      DataPipeline = ppdbFuente
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdbFuente'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14288
        mmPrintPosition = 0
        object ppdbtxtResArtID: TppDBText
          UserName = 'dbtxtResArtID'
          DataField = 'ARTID'
          DataPipeline = ppdbFuente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppdbFuente'
          mmHeight = 4233
          mmLeft = 6085
          mmTop = 794
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          DataField = 'ARTDES'
          DataPipeline = ppdbFuente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppdbFuente'
          mmHeight = 4233
          mmLeft = 25400
          mmTop = 794
          mmWidth = 65617
          BandType = 3
          GroupNo = 0
        end
        object pplblRGStkInicial: TppLabel
          UserName = 'lblRGStkInicial'
          AutoSize = False
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 46567
          mmTop = 10054
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object pplblRUStkInicial: TppLabel
          UserName = 'lblRUStkInicial'
          AutoSize = False
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 74083
          mmTop = 10054
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          DataField = 'UMEDUDES'
          DataPipeline = ppdbFuente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbFuente'
          mmHeight = 4233
          mmLeft = 74083
          mmTop = 5027
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText101'
          DataField = 'UMEDGDES'
          DataPipeline = ppdbFuente
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbFuente'
          mmHeight = 4233
          mmLeft = 46567
          mmTop = 5027
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          AutoSize = False
          Caption = 'Saldo Anterior -->'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 15610
          mmTop = 9525
          mmWidth = 28840
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel37: TppLabel
          UserName = 'Label301'
          AutoSize = False
          Caption = 'Stock Actual -->'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 16933
          mmTop = 794
          mmWidth = 28310
          BandType = 5
          GroupNo = 0
        end
        object pplblRGStkFinal: TppLabel
          UserName = 'lblRGStkFinal'
          AutoSize = False
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 46567
          mmTop = 794
          mmWidth = 24871
          BandType = 5
          GroupNo = 0
        end
        object pplblRUStkFinal: TppLabel
          UserName = 'lblRUStkFinal'
          AutoSize = False
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 12cpi'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 74083
          mmTop = 794
          mmWidth = 24871
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppdbFuente: TppDBPipeline
    DataSource = DMALM.dsKDXTemp
    UserName = 'dbFuente'
    Left = 33
    Top = 376
    object ppField1: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'LOCID'
      FieldName = 'LOCID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'ALMID'
      FieldName = 'ALMID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'TINID'
      FieldName = 'TINID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'NISAFREG'
      FieldName = 'NISAFREG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 4
    end
    object ppField6: TppField
      FieldAlias = 'TDAID'
      FieldName = 'TDAID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 5
    end
    object ppField7: TppField
      FieldAlias = 'TDAABR'
      FieldName = 'TDAABR'
      FieldLength = 1
      DisplayWidth = 1
      Position = 6
    end
    object ppField8: TppField
      FieldAlias = 'ARTFUC'
      FieldName = 'ARTFUC'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 7
    end
    object ppField9: TppField
      FieldAlias = 'ARTID'
      FieldName = 'ARTID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 8
    end
    object ppField10: TppField
      FieldAlias = 'ARTDES'
      FieldName = 'ARTDES'
      FieldLength = 60
      DisplayWidth = 60
      Position = 9
    end
    object ppField11: TppField
      FieldAlias = 'UNMIDG'
      FieldName = 'UNMIDG'
      FieldLength = 3
      DisplayWidth = 3
      Position = 10
    end
    object ppField12: TppField
      FieldAlias = 'UMEDGDES'
      FieldName = 'UMEDGDES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 11
    end
    object ppField13: TppField
      FieldAlias = 'UNMIDU'
      FieldName = 'UNMIDU'
      FieldLength = 3
      DisplayWidth = 3
      Position = 12
    end
    object ppField14: TppField
      FieldAlias = 'UMEDUDES'
      FieldName = 'UMEDUDES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 13
    end
    object ppField15: TppField
      FieldAlias = 'NISAID'
      FieldName = 'NISAID'
      FieldLength = 13
      DisplayWidth = 13
      Position = 14
    end
    object ppField16: TppField
      FieldAlias = 'NISATIP'
      FieldName = 'NISATIP'
      FieldLength = 1
      DisplayWidth = 1
      Position = 15
    end
    object ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOG'
      FieldName = 'SALDOG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOU'
      FieldName = 'SALDOU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'KDXCNTG'
      FieldName = 'KDXCNTG'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 18
    end
    object ppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'KDXCNTU'
      FieldName = 'KDXCNTU'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 19
    end
    object ppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'KDXCNTGI'
      FieldName = 'KDXCNTGI'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 20
    end
    object ppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'KDXCNTUI'
      FieldName = 'KDXCNTUI'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 21
    end
    object ppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'KDXCNTGS'
      FieldName = 'KDXCNTGS'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 22
    end
    object ppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'KDXCNTUS'
      FieldName = 'KDXCNTUS'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 23
    end
    object ppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'ARTCPROG'
      FieldName = 'ARTCPROG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object ppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'ARTCPROU'
      FieldName = 'ARTCPROU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object ppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'KDXCPROGI'
      FieldName = 'KDXCPROGI'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 26
    end
    object ppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'KDXCPROUI'
      FieldName = 'KDXCPROUI'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 27
    end
    object ppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'KDXCPROGS'
      FieldName = 'KDXCPROGS'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 28
    end
    object ppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'KDXCPROUS'
      FieldName = 'KDXCPROUS'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 29
    end
    object ppField31: TppField
      FieldAlias = 'CIADES'
      FieldName = 'CIADES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 30
    end
    object ppField32: TppField
      FieldAlias = 'LOCDES'
      FieldName = 'LOCDES'
      FieldLength = 30
      DisplayWidth = 30
      Position = 31
    end
    object ppField33: TppField
      FieldAlias = 'ALMDES'
      FieldName = 'ALMDES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 32
    end
    object ppField34: TppField
      FieldAlias = 'TINDES'
      FieldName = 'TINDES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 33
    end
    object ppField35: TppField
      FieldAlias = 'GRARDES'
      FieldName = 'GRARDES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 34
    end
  end
  object pmArticulos: TPopupMenu
    Left = 352
    Top = 304
    object pmArticulosMarcar: TMenuItem
      Caption = 'Marcar'
    end
    object pmArticulosDesmarcar: TMenuItem
      Caption = 'Desmarcar'
    end
  end
end
