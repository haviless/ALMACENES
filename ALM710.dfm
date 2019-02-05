object FToolConxArt: TFToolConxArt
  Left = 202
  Top = 509
  Width = 798
  Height = 155
  Caption = 'FToolConxArt'
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTool: TPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 117
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    Color = 14869218
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object lblCia: TLabel
      Left = 19
      Top = 7
      Width = 49
      Height = 15
      Caption = 'Compa'#241#237'a'
    end
    object lblLoc: TLabel
      Left = 542
      Top = 7
      Width = 49
      Height = 15
      Caption = 'Localidad'
      Visible = False
    end
    object Label1: TLabel
      Left = 228
      Top = 7
      Width = 68
      Height = 15
      Caption = 'T. Inventario'
    end
    object Z1sbActFiltro: TBitBtn
      Left = 438
      Top = 8
      Width = 45
      Height = 39
      Hint = 'Ejecutar Condici'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = Z1sbActFiltroClick
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
    object dblcCIA: TwwDBLookupCombo
      Left = 19
      Top = 24
      Width = 45
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'ID'#9'F'
        'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
        'CIAABR'#9'15'#9'Abreviatura'#9'F')
      LookupTable = DMALM.cdsCIA
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
      OnNotInList = dblcNotInList
    end
    object dbeCIA: TEdit
      Left = 65
      Top = 24
      Width = 150
      Height = 23
      Enabled = False
      TabOrder = 1
    end
    object dblcLOC: TwwDBLookupCombo
      Left = 539
      Top = 25
      Width = 45
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
      MaxLength = 2
      TabOrder = 5
      Visible = False
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcLOCExit
      OnNotInList = dblcNotInList
    end
    object dbeLOC: TEdit
      Left = 593
      Top = 25
      Width = 150
      Height = 23
      Enabled = False
      TabOrder = 6
      Visible = False
    end
    object dblcTIN: TwwDBLookupCombo
      Left = 228
      Top = 24
      Width = 45
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TINID'#9'3'#9'Tipo Inventario'#9'F'
        'TINDES'#9'40'#9'Descripci'#243'n'#9'F')
      LookupTable = DMALM.cdsTINID
      LookupField = 'TINID'
      Options = [loColLines, loTitles]
      DropDownCount = 18
      MaxLength = 2
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnEnter = dblcTINEnter
      OnExit = dblcTINExit
      OnNotInList = dblcNotInList
    end
    object dbeTIN: TEdit
      Left = 274
      Top = 24
      Width = 150
      Height = 23
      Enabled = False
      TabOrder = 3
    end
    object GroupBox1: TGroupBox
      Left = 19
      Top = 53
      Width = 654
      Height = 63
      Caption = 'Ingresos y Salidas de Articulo'
      TabOrder = 4
      object lblAlm: TLabel
        Left = 20
        Top = 17
        Width = 43
        Height = 15
        Caption = 'Almac'#233'n'
      end
      object Label3: TLabel
        Left = 234
        Top = 17
        Width = 31
        Height = 15
        Caption = 'Desde'
      end
      object Label4: TLabel
        Left = 340
        Top = 17
        Width = 29
        Height = 15
        Caption = 'Hasta'
      end
      object TLabel
        Left = 458
        Top = 17
        Width = 42
        Height = 15
        Caption = 'Art'#237'culo'
        Transparent = True
      end
      object dblcTALM: TwwDBLookupCombo
        Left = 18
        Top = 32
        Width = 45
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
        MaxLength = 2
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnEnter = dblcTALMEnter
        OnExit = dblcTALMExit
        OnNotInList = dblcNotInList
      end
      object dbeALM: TEdit
        Left = 64
        Top = 32
        Width = 150
        Height = 23
        Enabled = False
        TabOrder = 1
      end
      object dtpDesde: TDateTimePicker
        Left = 234
        Top = 32
        Width = 99
        Height = 23
        Date = 36892.719144328700000000
        Time = 36892.719144328700000000
        TabOrder = 2
      end
      object dtpHasta: TDateTimePicker
        Left = 340
        Top = 32
        Width = 97
        Height = 23
        Date = 36943.719144328700000000
        Time = 36943.719144328700000000
        TabOrder = 3
      end
      object Z1sbKardex: TBitBtn
        Left = 586
        Top = 14
        Width = 47
        Height = 39
        Hint = 'Consulta de Movimientos por Art'#237'culo'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = Z1sbKardexClick
        Glyph.Data = {
          CE020000424DCE020000000000007600000028000000220000001E0000000100
          0400000000005802000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFF0078800FFFFFFFFFFFFFFFF000000FFFFFFFFF00777888800
          FFFFFFFFFFFFFF000000FFFFFFF007777800888800FFFFFFFFFFFF000000FFFF
          F0077778878800888800FFFFFFFFFF000000FFF00777788787888800888800FF
          FFFFFF000000FF07777887778788888800888800FFFFFF000000FF8778877777
          87888888880088880FFFFF000000FF888777777787888888888800880FFFFF00
          0000F8878777777787888888888888000FFFFF000000F8F7877777778F888888
          8888888800FFFF000000F8F78777777F8877888888888888800FFF000000F8F7
          87777FF777887788888888888080FF000000F8F7877FF7777777887788888888
          80780F000000F8F78FF77799778877887788888880788F000000F8FF8877AA77
          8877777088778888808FFF000000F88F778877887777700F7088778880FFFF00
          0000FFF88F77888877700FFFF077887780FFFF000000FFFFF88F7788800FFFCC
          F7087788FFFFFF000000FFFFFFF88F7788FFCCFFFF0888FFFFFFFF000000FFFF
          FFFFF88F778FFFFCCF70FFFFFFFFFF000000FFFFFFFFFFF88F8FFCCFFFF70FFF
          FFFFFF000000FFFFFFFFFFFFF888FFFFCCFF70FFFFFFFF000000FFFFFFFFFFFF
          FFF8FFCCFFFFF70FFFFFFF000000FFFFFFFFFFFFFFFF8FFFFFCCFF700FFFFF00
          0000FFFFFFFFFFFFFFFFF8FFCCFFFFF88FFFFF000000FFFFFFFFFFFFFFFFFF8F
          FFFFF88FFFFFFF000000FFFFFFFFFFFFFFFFFFF8FFF88FFFFFFFFF000000FFFF
          FFFFFFFFFFFFFFFF888FFFFFFFFFFF000000}
      end
      object dbcldArti: TwwDBLookupComboDlg
        Left = 455
        Top = 32
        Width = 90
        Height = 23
        CharCase = ecUpperCase
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Art'#237'culo'
        MaxWidth = 0
        MaxHeight = 209
        Selected.Strings = (
          'ARTID'#9'15'#9'ID'#9'F'
          'ARTDES'#9'40'#9'Descripci'#243'n'#9'F'
          'ARTABR'#9'15'#9'Abreviatura'#9'F')
        LookupTable = DMALM.cdsArti
        LookupField = 'ARTID'
        SeqSearchOptions = []
        MaxLength = 15
        TabOrder = 4
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnEnter = dbcldArtiEnter
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 736
    Top = 96
  end
  object ppdb1: TppBDEPipeline
    UserName = 'db1'
    Left = 568
    Top = 30
  end
  object ppr1: TppReport
    AutoStop = False
    DataPipeline = ppdb1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\oaEjecuta\RTMS\ALM\Dema\DetxArticulo.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 608
    Top = 30
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdb1'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataPipeline = ppdb1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 4057
        mmLeft = 68792
        mmTop = 4498
        mmWidth = 17198
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
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
    Left = 656
    Top = 30
  end
end
