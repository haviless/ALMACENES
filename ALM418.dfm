object FToolTomaInventario: TFToolTomaInventario
  Left = 130
  Top = 214
  Width = 780
  Height = 138
  Caption = 'FToolTomaInventario'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Z1sbImpotaInv: TSpeedButton
    Left = 474
    Top = 79
    Width = 127
    Height = 30
    Caption = 'Importar Toma Inv.'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
    OnClick = Z1sbImpotaInvClick
  end
  object pnl: TPanel
    Left = 0
    Top = 0
    Width = 764
    Height = 75
    Align = alTop
    Color = 14869218
    TabOrder = 0
    object Z1sbTomaInv: TSpeedButton
      Left = 91
      Top = 4
      Width = 94
      Height = 30
      Caption = 'Toma Inv.1'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      Margin = 5
      NumGlyphs = 2
      ParentFont = False
      OnClick = Z1sbTomaInvClick
    end
    object Z1sbResulInv: TSpeedButton
      Left = 297
      Top = 4
      Width = 153
      Height = 30
      Caption = 'Sistemas vs Fisico'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      Margin = 5
      NumGlyphs = 2
      ParentFont = False
      OnClick = Z1sbResulInvClick
    end
    object Z1sbInicializaArticulos: TSpeedButton
      Left = 5
      Top = 4
      Width = 80
      Height = 30
      Hint = 'Toma art'#237'culos del archivo de Saldos'
      Caption = 'Inicializa'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
        000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
        99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
        0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
        FFFF3333337F337F333333333307B70FFFFF33333373FF733F333333333000FF
        0FFF3333333777337FF3333333333FF000FF33FFFFF3333777FF300000333300
        000F377777F33377777F30EEE0333000000037F337F33777777730EEE0333330
        00FF37F337F3333777F330EEE033333000FF37FFF7F3333777F3300000333330
        00FF3777773333F77733333333333000033F3333333337777333}
      Margin = 4
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = Z1sbInicializaArticulosClick
    end
    object Z1sbRepCarga: TSpeedButton
      Left = 673
      Top = 38
      Width = 82
      Height = 30
      Caption = 'Digitado'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      ParentFont = False
      OnClick = Z1sbRepCargaClick
    end
    object Z1sbResulInvVal: TSpeedButton
      Left = 297
      Top = 38
      Width = 153
      Height = 30
      Caption = 'Resultado Valorizado'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      Margin = 5
      NumGlyphs = 2
      ParentFont = False
      OnClick = Z1sbResulInvValClick
    end
    object Z1sbCierre: TSpeedButton
      Left = 457
      Top = 38
      Width = 107
      Height = 30
      Hint = 'Toma art'#237'culos del archivo de Saldos'
      Caption = 'Ajuste Stock'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
        000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
        99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
        0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
        FFFF3333337F337F333333333307B70FFFFF33333373FF733F333333333000FF
        0FFF3333333777337FF3333333333FF000FF33FFFFF3333777FF300000333300
        000F377777F33377777F30EEE0333000000037F337F33777777730EEE0333330
        00FF37F337F3333777F330EEE033333000FF37FFF7F3333777F3300000333330
        00FF3777773333F77733333333333000033F3333333337777333}
      Margin = 5
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = Z1sbCierreClick
    end
    object Z1sbDiferencias: TSpeedButton
      Left = 457
      Top = 4
      Width = 107
      Height = 30
      Caption = 'Diferencias'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      Margin = 5
      NumGlyphs = 2
      ParentFont = False
      OnClick = Z1sbDiferenciasClick
    end
    object Z1sbStockSis: TSpeedButton
      Left = 156
      Top = 38
      Width = 135
      Height = 30
      Caption = 'Stock en Sistemas'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      Margin = 5
      NumGlyphs = 2
      ParentFont = False
      OnClick = Z1sbStockSisClick
    end
    object Z1sbReal: TSpeedButton
      Left = 572
      Top = 38
      Width = 95
      Height = 30
      Caption = 'Stock Real'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      Margin = 5
      NumGlyphs = 2
      ParentFont = False
      OnClick = Z1sbRealClick
    end
    object Z1sbTomaInv2: TSpeedButton
      Left = 193
      Top = 4
      Width = 94
      Height = 30
      Caption = 'Toma Inv.2'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
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
      Margin = 5
      NumGlyphs = 2
      ParentFont = False
      OnClick = Z1sbTomaInv2Click
    end
    object sbDisenoRep: TSpeedButton
      Left = 5
      Top = 48
      Width = 7
      Height = 22
      Flat = True
      OnClick = sbDisenoRepClick
    end
    object cbDisenoRep: TCheckBox
      Left = 20
      Top = 34
      Width = 97
      Height = 17
      Caption = 'Dise'#241'o Rep'
      TabOrder = 3
      Visible = False
    end
    object dblcdArt: TwwDBLookupComboDlg
      Left = 579
      Top = 7
      Width = 85
      Height = 25
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'ARTID'#9'10'#9'Art'#237'culo'#9'F'
        'ARTDES'#9'40'#9'Descripci'#243'n'#9'F')
      LookupField = 'ARTID'
      ParentFont = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnEnter = dblcdArtEnter
    end
    object bbtnBuscar: TBitBtn
      Left = 669
      Top = 4
      Width = 80
      Height = 30
      Caption = 'Buscar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = bbtnBuscarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
        300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
        330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
        333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
        339977FF777777773377000BFB03333333337773FF733333333F333000333333
        3300333777333333337733333333333333003333333333333377333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
    end
    object cbMayor: TCheckBox
      Left = 21
      Top = 46
      Width = 73
      Height = 17
      Caption = 'Stock > 0'
      TabOrder = 2
    end
  end
  object ppdbTomInv: TppDBPipeline
    UserName = 'dbMant'
    Left = 176
    Top = 80
  end
  object pprTomaInv: TppReport
    AutoStop = False
    DataPipeline = ppdbTomInv
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 20000
    PrinterSetup.mmMarginLeft = 15000
    PrinterSetup.mmMarginRight = 10000
    PrinterSetup.mmMarginTop = 10000
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\oaEjecuta\RTMS\ALM\Dema\TOMAINV.RTM'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprTomaInvPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 216
    Top = 80
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbTomInv'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 35983
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Descripci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 59002
        mmTop = 27517
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Unidad'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 4233
        mmLeft = 151342
        mmTop = 27517
        mmWidth = 8890
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Stock Fisico'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 173038
        mmTop = 27517
        mmWidth = 17780
        BandType = 0
      end
      object ppsyvPag: TppSystemVariable
        UserName = 'syvPag'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 163513
        mmTop = 9260
        mmWidth = 1482
        BandType = 0
      end
      object ppsyvfecha: TppSystemVariable
        UserName = 'syvfecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 163513
        mmTop = 265
        mmWidth = 14817
        BandType = 0
      end
      object ppsyvHora: TppSystemVariable
        UserName = 'syvfecha1'
        AutoSize = False
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 163513
        mmTop = 4763
        mmWidth = 21960
        BandType = 0
      end
      object pplblTitulo: TppLabel
        UserName = 'lblTitulo'
        Caption = 'Reporte para Toma de Inventario'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 74930
        mmTop = 4763
        mmWidth = 45932
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'P'#225'gina:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 148961
        mmTop = 9260
        mmWidth = 10372
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Fecha :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 148961
        mmTop = 265
        mmWidth = 10372
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Hora  :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 148961
        mmTop = 4763
        mmWidth = 10372
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Compa'#241#237'a       :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 13758
        mmWidth = 23707
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Tipo Inventario:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 18785
        mmWidth = 23707
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'Localidad :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 96309
        mmTop = 13758
        mmWidth = 16298
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'Almac'#233'n   :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 96309
        mmTop = 18785
        mmWidth = 16298
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'lblArtId1'
        Caption = 'Articulo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 41010
        mmTop = 27517
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'DERRAMA MAGISTERIAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 265
        mmWidth = 28152
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 31750
        mmWidth = 190500
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 23283
        mmWidth = 190500
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Tipo de Articulo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 27517
        mmWidth = 23707
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'CIADES'
        DataPipeline = ppdbTomInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbTomInv'
        mmHeight = 4233
        mmLeft = 33338
        mmTop = 13758
        mmWidth = 35454
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText14'
        DataField = 'TINDES'
        DataPipeline = ppdbTomInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbTomInv'
        mmHeight = 4233
        mmLeft = 33338
        mmTop = 18785
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        AutoSize = True
        DataField = 'LOCDES'
        DataPipeline = ppdbTomInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbTomInv'
        mmHeight = 4233
        mmLeft = 121444
        mmTop = 13758
        mmWidth = 16404
        BandType = 0
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        AutoSize = True
        DataField = 'ALMDES'
        DataPipeline = ppdbTomInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbTomInv'
        mmHeight = 4233
        mmLeft = 121444
        mmTop = 18785
        mmWidth = 17727
        BandType = 0
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        AutoSize = True
        DataField = 'ALMID'
        DataPipeline = ppdbTomInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbTomInv'
        mmHeight = 4233
        mmLeft = 115888
        mmTop = 18785
        mmWidth = 2910
        BandType = 0
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        AutoSize = True
        DataField = 'LOCID'
        DataPipeline = ppdbTomInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbTomInv'
        mmHeight = 4233
        mmLeft = 115888
        mmTop = 13758
        mmWidth = 2910
        BandType = 0
      end
      object ppDBText29: TppDBText
        UserName = 'DBText101'
        AutoSize = True
        DataField = 'CIAID'
        DataPipeline = ppdbTomInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbTomInv'
        mmHeight = 4233
        mmLeft = 27517
        mmTop = 13758
        mmWidth = 2910
        BandType = 0
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        AutoSize = True
        DataField = 'TINID'
        DataPipeline = ppdbTomInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbTomInv'
        mmHeight = 4233
        mmLeft = 27517
        mmTop = 18785
        mmWidth = 2910
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object ppdbtArtId: TppDBText
        UserName = 'dbtArtId'
        AutoSize = True
        DataField = 'ARTID'
        DataPipeline = ppdbTomInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbTomInv'
        mmHeight = 4233
        mmLeft = 41010
        mmTop = 5027
        mmWidth = 11853
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText1'
        DataField = 'ARTDES'
        DataPipeline = ppdbTomInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbTomInv'
        mmHeight = 4233
        mmLeft = 55827
        mmTop = 5027
        mmWidth = 94456
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'UNMABR'
        DataPipeline = ppdbTomInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbTomInv'
        mmHeight = 4233
        mmLeft = 153988
        mmTop = 5027
        mmWidth = 4445
        BandType = 4
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        AutoSize = False
        Caption = '_______________________'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 161661
        mmTop = 5027
        mmWidth = 29104
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = 'TIPART'
        DataPipeline = ppdbTomInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        ReprintOnSubsequent = True
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppdbTomInv'
        mmHeight = 4233
        mmLeft = 265
        mmTop = 5027
        mmWidth = 5927
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'TIPARTDES'
        DataPipeline = ppdbTomInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        ReprintOnSubsequent = True
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppdbTomInv'
        mmHeight = 4233
        mmLeft = 7673
        mmTop = 5027
        mmWidth = 17780
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'LINCOM'
      DataPipeline = ppdbTomInv
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdbTomInv'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppDBText31: TppDBText
          UserName = 'DBText7'
          AutoSize = True
          DataField = 'LINCOMDES'
          DataPipeline = ppdbTomInv
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbTomInv'
          mmHeight = 4233
          mmLeft = 34925
          mmTop = 1588
          mmWidth = 17780
          BandType = 3
          GroupNo = 0
        end
        object pplblArtId: TppLabel
          UserName = 'lblArtId'
          Caption = 'LINEA COMERCIAL:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 265
          mmTop = 1588
          mmWidth = 23707
          BandType = 3
          GroupNo = 0
        end
        object ppDBText32: TppDBText
          UserName = 'DBText11'
          AutoSize = True
          DataField = 'LINCOM'
          DataPipeline = ppdbTomInv
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbTomInv'
          mmHeight = 4233
          mmLeft = 28310
          mmTop = 1588
          mmWidth = 2963
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'TIPART'
      DataPipeline = ppdbTomInv
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdbTomInv'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
  object ppdbResulInv: TppDBPipeline
    UserName = 'ppdbResulInv'
    Left = 376
    Top = 81
  end
  object pprResulInv: TppReport
    AutoStop = False
    DataPipeline = ppdbResulInv
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 20000
    PrinterSetup.mmMarginLeft = 15000
    PrinterSetup.mmMarginRight = 10000
    PrinterSetup.mmMarginTop = 10000
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\oaEjecuta\RTMS\ALM\Dema\RESULINV.RTM'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprResulInvPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 416
    Top = 81
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbResulInv'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 35983
      mmPrintPosition = 0
      object ppLabel7: TppLabel
        UserName = 'Label2'
        Caption = 'Descripci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 59531
        mmTop = 27781
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label4'
        Caption = 'Unidad'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 4233
        mmLeft = 133350
        mmTop = 27781
        mmWidth = 8996
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'syvPag'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 163513
        mmTop = 9260
        mmWidth = 1482
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'syvfecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 163513
        mmTop = 265
        mmWidth = 14817
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'syvfecha1'
        AutoSize = False
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 163513
        mmTop = 4763
        mmWidth = 21960
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'lblTitulo'
        Caption = 'Resultados de Toma de Inventario'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 74192
        mmTop = 265
        mmWidth = 47413
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label22'
        Caption = 'P'#225'gina:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 148961
        mmTop = 9260
        mmWidth = 10372
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label23'
        Caption = 'Fecha :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 148961
        mmTop = 265
        mmWidth = 10372
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label24'
        Caption = 'Hora  :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 148961
        mmTop = 4763
        mmWidth = 10372
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label25'
        Caption = 'Compa'#241#237'a       :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 9260
        mmWidth = 23813
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label26'
        Caption = 'Tipo Inventario:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 13758
        mmWidth = 23707
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label27'
        Caption = 'Localidad :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 89165
        mmTop = 9260
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label28'
        Caption = 'Almac'#233'n   :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 89165
        mmTop = 13758
        mmWidth = 16298
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'lblArtId1'
        Caption = 'Articulo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 38629
        mmTop = 27781
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label1'
        Caption = 'DERRAMA MAGISTERIAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 265
        mmWidth = 28152
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 31750
        mmWidth = 190500
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 19844
        mmWidth = 190500
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label6'
        Caption = 'Tipo de Articulo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 27781
        mmWidth = 23707
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Sistemas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 146315
        mmTop = 27781
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        Caption = 'Fisico'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 165629
        mmTop = 27781
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label45'
        Caption = 'Dife-'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 183357
        mmTop = 23813
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label101'
        Caption = 'Stock'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 149754
        mmTop = 23813
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        Caption = 'Stock'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 166159
        mmTop = 23813
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        Caption = 'rencia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 182034
        mmTop = 27781
        mmWidth = 8996
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'CIADES'
        DataPipeline = ppdbResulInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbResulInv'
        mmHeight = 4233
        mmLeft = 33073
        mmTop = 9260
        mmWidth = 35560
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'TINDES'
        DataPipeline = ppdbResulInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbResulInv'
        mmHeight = 4233
        mmLeft = 33073
        mmTop = 13758
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'LOCDES'
        DataPipeline = ppdbResulInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbResulInv'
        mmHeight = 4233
        mmLeft = 114565
        mmTop = 9260
        mmWidth = 16298
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'ALMDES'
        DataPipeline = ppdbResulInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbResulInv'
        mmHeight = 4233
        mmLeft = 114565
        mmTop = 13758
        mmWidth = 17780
        BandType = 0
      end
      object ppDBText21: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'ALMID'
        DataPipeline = ppdbResulInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbResulInv'
        mmHeight = 4233
        mmLeft = 109009
        mmTop = 13758
        mmWidth = 2963
        BandType = 0
      end
      object ppDBText22: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'LOCID'
        DataPipeline = ppdbResulInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbResulInv'
        mmHeight = 4233
        mmLeft = 109009
        mmTop = 9260
        mmWidth = 2963
        BandType = 0
      end
      object ppDBText23: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'CIAID'
        DataPipeline = ppdbResulInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbResulInv'
        mmHeight = 4233
        mmLeft = 27252
        mmTop = 9260
        mmWidth = 2963
        BandType = 0
      end
      object ppDBText24: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'TINID'
        DataPipeline = ppdbResulInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbResulInv'
        mmHeight = 4233
        mmLeft = 27252
        mmTop = 13758
        mmWidth = 2963
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object ppDBText5: TppDBText
        UserName = 'dbtArtId'
        AutoSize = True
        DataField = 'ARTID'
        DataPipeline = ppdbResulInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbResulInv'
        mmHeight = 4233
        mmLeft = 38629
        mmTop = 5027
        mmWidth = 11853
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText1'
        DataField = 'ARTDES'
        DataPipeline = ppdbResulInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbResulInv'
        mmHeight = 4233
        mmLeft = 53975
        mmTop = 5027
        mmWidth = 79375
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'UNMABR'
        DataPipeline = ppdbResulInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResulInv'
        mmHeight = 4233
        mmLeft = 137848
        mmTop = 5027
        mmWidth = 4445
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = 'TIPART'
        DataPipeline = ppdbResulInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        ReprintOnSubsequent = True
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppdbResulInv'
        mmHeight = 4233
        mmLeft = 265
        mmTop = 5027
        mmWidth = 5927
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText13'
        DataField = 'TIPARTDES'
        DataPipeline = ppdbResulInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        ReprintOnSubsequent = True
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppdbResulInv'
        mmHeight = 4233
        mmLeft = 7673
        mmTop = 5027
        mmWidth = 25929
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'STKSACTG'
        DataPipeline = ppdbResulInv
        DisplayFormat = '#,0;-#,0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResulInv'
        mmHeight = 4233
        mmLeft = 148167
        mmTop = 5027
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'STKSFISG'
        DataPipeline = ppdbResulInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResulInv'
        mmHeight = 4233
        mmLeft = 164571
        mmTop = 5027
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'DIFERENCIA'
        DataPipeline = ppdbResulInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResulInv'
        mmHeight = 4233
        mmLeft = 180975
        mmTop = 5027
        mmWidth = 10054
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup4: TppGroup
      BreakName = 'LINCOM'
      DataPipeline = ppdbResulInv
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdbResulInv'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppDBText12: TppDBText
          UserName = 'DBText7'
          AutoSize = True
          DataField = 'LINCOMDES'
          DataPipeline = ppdbResulInv
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbResulInv'
          mmHeight = 4233
          mmLeft = 34925
          mmTop = 1588
          mmWidth = 17780
          BandType = 3
          GroupNo = 0
        end
        object ppLabel44: TppLabel
          UserName = 'lblArtId'
          Caption = 'LINEA COMERCIAL:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 265
          mmTop = 1588
          mmWidth = 23707
          BandType = 3
          GroupNo = 0
        end
        object ppDBText14: TppDBText
          UserName = 'DBText11'
          AutoSize = True
          DataField = 'LINCOM'
          DataPipeline = ppdbResulInv
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbResulInv'
          mmHeight = 4233
          mmLeft = 28310
          mmTop = 1588
          mmWidth = 2963
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'TIPART'
      DataPipeline = ppdbResulInv
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdbResulInv'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 616
    Top = 80
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
    IniStorageType = 'IniFile'
    IniStorageName = 'C:\DemaExes\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 256
    Top = 80
  end
end
