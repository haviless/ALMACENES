object FRptActivosSinSalida: TFRptActivosSinSalida
  Left = 311
  Top = 229
  Width = 325
  Height = 265
  Caption = 'Reporte de Activos Por N'#186' de Salida'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblFechaTras: TLabel
    Left = 27
    Top = 10
    Width = 108
    Height = 13
    Caption = 'Fecha de Ingreso :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 36
    Top = 36
    Width = 37
    Height = 13
    Caption = 'Desde :'
  end
  object Label2: TLabel
    Left = 163
    Top = 36
    Width = 34
    Height = 13
    Caption = 'Hasta :'
  end
  object Label3: TLabel
    Left = 27
    Top = 58
    Width = 44
    Height = 13
    Caption = 'Salida :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 19
    Top = 140
    Width = 265
    Height = 73
    Caption = 'Ordenado por :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object RadioButton_PorCodigoBarra: TRadioButton
      Left = 56
      Top = 16
      Width = 113
      Height = 17
      Caption = 'Por C'#243'digo de Barras'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
    end
    object RadioButton_PorCodigoArticulo: TRadioButton
      Left = 56
      Top = 32
      Width = 129
      Height = 17
      Caption = 'Por C'#243'dgo de Art'#237'culo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object RadioButton_PorDescripcion: TRadioButton
      Left = 56
      Top = 48
      Width = 113
      Height = 17
      Caption = 'Por Descripci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object wwDBDateTimePicker_Desde: TwwDBDateTimePicker
    Left = 75
    Top = 31
    Width = 81
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    Epoch = 1950
    ShowButton = True
    TabOrder = 0
  end
  object wwDBDateTimePicker_Hasta: TwwDBDateTimePicker
    Left = 203
    Top = 31
    Width = 81
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    Epoch = 1950
    ShowButton = True
    TabOrder = 1
  end
  object RadioButton_SinSalida: TRadioButton
    Left = 75
    Top = 96
    Width = 113
    Height = 15
    Caption = 'Activos Sin Salida'
    TabOrder = 2
  end
  object RadioButton_SalidaInicial: TRadioButton
    Left = 75
    Top = 72
    Width = 169
    Height = 17
    Caption = 'Salida en Estado INICIAL'
    Checked = True
    TabOrder = 3
    TabStop = True
  end
  object Z2bbtnImprime: TBitBtn
    Left = 248
    Top = 161
    Width = 30
    Height = 30
    Hint = 'Activos Fijos Comprados Recientemente'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = Z2bbtnImprimeClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
      8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
      8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
      8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
  end
  object RadioButton_SalidaAceptado: TRadioButton
    Left = 75
    Top = 120
    Width = 209
    Height = 15
    Caption = 'Salida en Estado ACEPTADO'
    TabOrder = 6
  end
  object ppDBPipeline_ActivosSinSalida: TppDBPipeline
    UserName = 'DBPipeline_ActivosSinSalida'
    Left = 219
  end
  object ppReport_ActivosSinSalida: TppReport
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
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 251
    Version = '7.02'
    mmColumnWidth = 0
  end
  object ppDesigner_ActivosSinSalida: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    IniStorageType = 'IniFile'
    IniStorageName = 'C:\DemaExes\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 283
  end
end
