object FGuiaConsulta: TFGuiaConsulta
  Left = 210
  Top = 61
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta'
  ClientHeight = 553
  ClientWidth = 780
  Color = 12904163
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object dbgGuia: TwwDBGrid
    Left = 6
    Top = 93
    Width = 770
    Height = 412
    DisableThemesInTitle = False
    Selected.Strings = (
      'CIAID'#9'3'#9'C'#237'a'
      'SERGUIA'#9'5'#9'Guia~Serie'
      'NUMGUIA'#9'8'#9'Guia~Numero'
      'FECGUIA'#9'10'#9'Fecha'
      'CCOSID'#9'6'#9'Centro~Costo'
      'RAZSOC'#9'34'#9'Raz'#243'n Social/Nombre'
      'TINID'#9'04'#9'Tipo~Inv.'
      'ALMID'#9'04'#9'Alm.'
      'NISAID'#9'09'#9'Nota~Salida'
      'ESTADO'#9'09'#9'Estado'
      'ORIGEN'#9'5'#9'Origen')
    IniAttributes.Delimiter = ';;'
    TitleColor = 10207162
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
    TabOrder = 0
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
    OnKeyDown = dbgGuiaKeyDown
  end
  object Panel1: TPanel
    Left = 6
    Top = 2
    Width = 768
    Height = 87
    Color = 10207162
    TabOrder = 1
    object fcLabel1: TfcLabel
      Left = 21
      Top = 6
      Width = 243
      Height = 29
      Caption = 'GUIAS DE REMISION'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TextOptions.Alignment = taLeftJustify
      TextOptions.VAlignment = vaTop
    end
    object lblCIA: TLabel
      Left = 21
      Top = 38
      Width = 71
      Height = 16
      Caption = 'Compa'#241#237'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 297
      Top = 38
      Width = 56
      Height = 16
      Caption = 'Periodo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 468
      Top = 3
      Width = 4
      Height = 81
    end
    object dblcCIA: TwwDBLookupCombo
      Left = 19
      Top = 56
      Width = 45
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'C'#243'digo'#9'F'
        'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
        'CIAABR'#9'15'#9'Abreviatura'#9'F')
      LookupField = 'CIAID'
      Options = [loColLines, loTitles]
      DropDownCount = 15
      MaxLength = 2
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcCIAExit
    end
    object dbeCIA: TEdit
      Left = 64
      Top = 56
      Width = 184
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 1
    end
    object seAno: TSpinEdit
      Left = 279
      Top = 56
      Width = 51
      Height = 22
      MaxLength = 4
      MaxValue = 2012
      MinValue = 2006
      TabOrder = 2
      Value = 2006
    end
    object seMes: TSpinEdit
      Left = 333
      Top = 56
      Width = 41
      Height = 22
      MaxLength = 2
      MaxValue = 12
      MinValue = 1
      TabOrder = 3
      Value = 12
    end
    object bbtnFiltra: TBitBtn
      Left = 401
      Top = 46
      Width = 37
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
    object BitBtn1: TBitBtn
      Left = 506
      Top = 14
      Width = 233
      Height = 27
      Caption = 'Desde Nota de Salida'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 506
      Top = 50
      Width = 233
      Height = 27
      Caption = 'Desde Traslado de Activo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = BitBtn2Click
    end
  end
  object Panel2: TPanel
    Left = 6
    Top = 506
    Width = 768
    Height = 44
    Color = 10207162
    TabOrder = 2
    object Label2: TLabel
      Left = 5
      Top = 31
      Width = 25
      Height = 13
      Caption = 'V.2.1'
    end
    object Z2bbtnSalir: TBitBtn
      Left = 712
      Top = 7
      Width = 35
      Height = 34
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
      Top = 7
      Width = 300
      Height = 34
      BevelInner = bvRaised
      TabOrder = 1
      Visible = False
      object lblBusca1: TLabel
        Left = 7
        Top = 11
        Width = 48
        Height = 13
        Caption = 'Busca por'
      end
      object lblBusca2: TLabel
        Left = 61
        Top = 11
        Width = 89
        Height = 13
        Caption = 'Titulo de cabecera'
      end
      object isBusca: TwwIncrementalSearch
        Left = 168
        Top = 6
        Width = 118
        Height = 21
        TabOrder = 0
        OnExit = isBuscaExit
      end
    end
    object Z2bbtnPrint: TBitBtn
      Left = 659
      Top = 7
      Width = 35
      Height = 34
      Hint = 'Imprimir Reporte de Guias de Remisi'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
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
    object bbtnAnula: TBitBtn
      Left = 34
      Top = 7
      Width = 137
      Height = 34
      Caption = 'Genera Gu'#237'a Anulada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = bbtnAnulaClick
    end
  end
  object ppdbCab: TppDBPipeline
    UserName = 'dbCab'
    Left = 368
    Top = 400
  end
  object ppr1: TppReport
    AutoStop = False
    DataPipeline = FGuiaRemisionALM.ppdbDet
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
    Template.FileName = 'C:\oaEjecuta\RTMS\ALM\Dema\GuiaRemisionMes.rtm'
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
    Left = 416
    Top = 400
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
        mmTop = 27517
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
        mmTop = 27517
        mmWidth = 6879
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'FECGUIA'
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
        mmLeft = 20373
        mmTop = 34396
        mmWidth = 14817
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
        mmLeft = 87842
        mmTop = 34396
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
        mmLeft = 109802
        mmTop = 50800
        mmWidth = 74348
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
        mmLeft = 17198
        mmTop = 59796
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
        mmLeft = 62442
        mmTop = 59796
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
        mmLeft = 5027
        mmTop = 52652
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
        mmLeft = 5027
        mmTop = 76994
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
        mmLeft = 81756
        mmTop = 76994
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
        mmLeft = 122767
        mmTop = 76994
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
        mmLeft = 37042
        mmTop = 84402
        mmWidth = 5027
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'DPTODES'
        DataPipeline = FGuiaRemisionALM.ppdbOtros
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbOtros'
        mmHeight = 4233
        mmLeft = 109538
        mmTop = 59796
        mmWidth = 28840
        BandType = 0
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'CIUDDES'
        DataPipeline = FGuiaRemisionALM.ppdbOtros
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbOtros'
        mmHeight = 4233
        mmLeft = 141817
        mmTop = 59796
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'ZIPDES'
        DataPipeline = FGuiaRemisionALM.ppdbOtros
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbOtros'
        mmHeight = 4233
        mmLeft = 169863
        mmTop = 59796
        mmWidth = 23548
        BandType = 0
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        AutoSize = True
        DataField = 'TRIDES'
        DataPipeline = FGuiaRemisionALM.ppdbOtros
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbOtros'
        mmHeight = 4233
        mmLeft = 43921
        mmTop = 84402
        mmWidth = 26670
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
        mmLeft = 173302
        mmTop = 34396
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
        mmHeight = 4233
        mmLeft = 147638
        mmTop = 34396
        mmWidth = 2910
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
        mmLeft = 158221
        mmTop = 34396
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
        mmLeft = 136261
        mmTop = 34396
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
        DataPipeline = FGuiaRemisionALM.ppdbDet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbDet'
        mmHeight = 4233
        mmLeft = 15081
        mmTop = 529
        mmWidth = 11853
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'ARTDES'
        DataPipeline = FGuiaRemisionALM.ppdbDet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbDet'
        mmHeight = 4233
        mmLeft = 49477
        mmTop = 529
        mmWidth = 66940
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'ITEM'
        DataPipeline = FGuiaRemisionALM.ppdbDet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbDet'
        mmHeight = 4233
        mmLeft = 5821
        mmTop = 529
        mmWidth = 4445
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'UNMIDG'
        DataPipeline = FGuiaRemisionALM.ppdbDet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbDet'
        mmHeight = 4233
        mmLeft = 118798
        mmTop = 529
        mmWidth = 4445
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        BlankWhenZero = True
        DataField = 'CANTIDAD'
        DataPipeline = FGuiaRemisionALM.ppdbDet
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
        mmLeft = 126736
        mmTop = 529
        mmWidth = 16140
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
        mmHeight = 4233
        mmLeft = 119618
        mmTop = 23548
        mmWidth = 11853
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
    Left = 464
    Top = 400
  end
end
