object FContInve: TFContInve
  Left = 134
  Top = 218
  Width = 716
  Height = 88
  BorderIcons = []
  Caption = 'Contabilidad de Inventarios'
  Color = 12904163
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PgStock: TPageControl
    Left = 0
    Top = 0
    Width = 688
    Height = 58
    ActivePage = TabSheet2
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    HotTrack = True
    ParentFont = False
    TabOrder = 0
    object pgtsStock: TTabSheet
      Caption = 'Valorizaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      object bbValoriza: TSpeedButton
        Left = 2
        Top = 0
        Width = 130
        Height = 22
        Caption = 'Procesar'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        OnClick = bbValorizaClick
      end
    end
    object pgts2: TTabSheet
      Caption = 'Consultas'
      ImageIndex = 1
      object bbKardex: TSpeedButton
        Left = 417
        Top = 0
        Width = 130
        Height = 22
        Caption = 'Kardex'
        Flat = True
        Visible = False
        OnClick = bbKardexClick
      end
      object BitBtn1: TSpeedButton
        Left = 1
        Top = 0
        Width = 130
        Height = 22
        Caption = 'Movimientos'
        Flat = True
        OnClick = BitBtn1Click
      end
      object bbVerNumI: TSpeedButton
        Left = 133
        Top = 0
        Width = 130
        Height = 22
        Caption = 'Verifica Numeraci'#243'n'
        Flat = True
        OnClick = bbVerNumIClick
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Consultas por Filtro'
      ImageIndex = 2
      object bbIngreso: TSpeedButton
        Left = 1
        Top = 0
        Width = 130
        Height = 22
        Caption = 'Mov. Ingresos'
        Flat = True
        OnClick = bbIngresoClick
      end
      object bbSalida: TSpeedButton
        Left = 134
        Top = 0
        Width = 130
        Height = 22
        Caption = 'Mov. Salidas'
        Flat = True
        OnClick = bbSalidaClick
      end
      object bbDetMov: TSpeedButton
        Left = 266
        Top = 0
        Width = 130
        Height = 22
        Caption = 'Detalle de Mov.'
        Flat = True
        OnClick = bbDetMovClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Ajuste'
      ImageIndex = 3
      object bbAjuste: TSpeedButton
        Left = 1
        Top = 0
        Width = 130
        Height = 22
        Caption = 'por Ingreso'
        Flat = True
        OnClick = bbAjusteClick
      end
      object BitBtn2: TSpeedButton
        Left = 133
        Top = 0
        Width = 130
        Height = 22
        Caption = 'por Salida'
        Flat = True
        OnClick = BitBtn2Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Asientos de Inventarios'
      ImageIndex = 4
      object BitBtn3: TSpeedButton
        Left = 1
        Top = 0
        Width = 130
        Height = 22
        Caption = 'Generaci'#243'n'
        Flat = True
        OnClick = BitBtn3Click
      end
      object BitBtn5: TSpeedButton
        Left = 131
        Top = 0
        Width = 130
        Height = 22
        Caption = 'Transferencia'
        Flat = True
        OnClick = BitBtn5Click
      end
      object SpeedButton1: TSpeedButton
        Left = 601
        Top = 0
        Width = 130
        Height = 22
        Flat = True
        OnClick = SpeedButton1Click
      end
      object sbtnAsiAlm: TSpeedButton
        Left = 263
        Top = 0
        Width = 130
        Height = 22
        Caption = 'Almac'#233'n'
        Flat = True
        OnClick = sbtnAsiAlmClick
      end
      object sbtnAsiAju: TSpeedButton
        Left = 397
        Top = 0
        Width = 130
        Height = 22
        Caption = 'Por Ajuste'
        Flat = True
        OnClick = sbtnAsiAjuClick
      end
    end
  end
  object ppDBPVerifica: TppDBPipeline
    DataSource = DMALM.dsVeriResul
    UserName = 'DBPVerifica'
    Left = 564
    Top = 8
    object ppField1: TppField
      FieldAlias = 'CIADES'
      FieldName = 'CIADES'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'ALMDES'
      FieldName = 'ALMDES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'LOCDES'
      FieldName = 'LOCDES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'TDAID'
      FieldName = 'TDAID'
      FieldLength = 11
      DisplayWidth = 11
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'NISATIP'
      FieldName = 'NISATIP'
      FieldLength = 11
      DisplayWidth = 11
      Position = 4
    end
    object ppField6: TppField
      FieldAlias = 'NISAID'
      FieldName = 'NISAID'
      FieldLength = 11
      DisplayWidth = 11
      Position = 5
    end
  end
  object ppRpVerifica: TppReport
    AutoStop = False
    DataPipeline = ppDBPVerifica
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 211000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\Sol\SOLAlmacen\SOLFormatos\RelacionNotas.rtm'
    Units = utMillimeters
    BeforePrint = ppRpVerificaBeforePrint
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppRpVerificaPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 476
    Top = 8
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPVerifica'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 15875
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Compa'#241'ia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2381
        mmTop = 11642
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Almac'#233'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 38629
        mmTop = 11642
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Localidad'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 72761
        mmTop = 11642
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 108215
        mmTop = 11642
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'I/S'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 140494
        mmTop = 11642
        mmWidth = 3440
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'N'#250'mero'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 174890
        mmTop = 11642
        mmWidth = 11642
        BandType = 0
      end
      object pplblTit1: TppLabel
        UserName = 'lblTit1'
        Caption = 'Relaci'#243'n de Notas Faltantes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 61913
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object ppLblAl: TppLabel
        UserName = 'LblAl'
        Caption = 'Al - '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 93398
        mmTop = 5556
        mmWidth = 5556
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 100277
        mmTop = 5556
        mmWidth = 14288
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageSetDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 174890
        mmTop = 794
        mmWidth = 18785
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CIADES'
        DataPipeline = ppDBPVerifica
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPVerifica'
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 529
        mmWidth = 33602
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'ALMDES'
        DataPipeline = ppDBPVerifica
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPVerifica'
        mmHeight = 3704
        mmLeft = 37571
        mmTop = 529
        mmWidth = 33602
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'LOCDES'
        DataPipeline = ppDBPVerifica
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPVerifica'
        mmHeight = 3704
        mmLeft = 72761
        mmTop = 529
        mmWidth = 33602
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'TDAID'
        DataPipeline = ppDBPVerifica
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPVerifica'
        mmHeight = 3704
        mmLeft = 108215
        mmTop = 529
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'NISATIP'
        DataPipeline = ppDBPVerifica
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPVerifica'
        mmHeight = 3704
        mmLeft = 140494
        mmTop = 529
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'NISAID'
        DataPipeline = ppDBPVerifica
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPVerifica'
        mmHeight = 3704
        mmLeft = 177007
        mmTop = 529
        mmWidth = 8731
        BandType = 4
      end
    end
  end
end
