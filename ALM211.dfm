object FPProy: TFPProy
  Left = 172
  Top = 63
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Parametros Proyectados'
  ClientHeight = 453
  ClientWidth = 557
  Color = 12904163
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
  object pnlBoton: TPanel
    Left = 0
    Top = 396
    Width = 557
    Height = 57
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 10207162
    TabOrder = 0
    object Z2bbtnRegOk: TBitBtn
      Left = 151
      Top = 15
      Width = 116
      Height = 28
      Hint = 'Confirma Actualizaci'#243'n'
      Caption = 'Aceptar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = Z2bbtnRegOkClick
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
    object Z2bbtnRegCanc: TBitBtn
      Left = 286
      Top = 15
      Width = 120
      Height = 28
      Hint = 'Cancela Actualizaci'#243'n'
      Caption = '&Salir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Z2bbtnRegCancClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
    end
  end
  object dbgProy: TwwDBGrid
    Left = 10
    Top = 16
    Width = 537
    Height = 353
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = 10207162
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DMALM.dsTMP
    KeyOptions = [dgAllowDelete]
    TabOrder = 1
    TitleAlignment = taCenter
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clNavy
    TitleFont.Height = -11
    TitleFont.Name = 'Comic Sans MS'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
  end
  object Z1Imprimir: TBitBtn
    Left = 491
    Top = 404
    Width = 48
    Height = 44
    Hint = 'Imprimir Parametros de Reposici'#243'n'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = Z1ImprimirClick
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
    Layout = blGlyphTop
  end
  object ppRParamRep: TppReport
    AutoStop = False
    DataPipeline = ppDBParamRep
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
    Template.FileName = 'C:\SOLExes\SolFormatos\Alm\Incoresa\ParametroProyectadoMov.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 40
    Top = 96
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBParamRep'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 37306
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'PARAMETROS PROYECTADOS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 74877
        mmTop = 5292
        mmWidth = 46567
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'C'#243'digo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 3175
        mmTop = 31221
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Articulo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 27517
        mmTop = 31221
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Stock'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 93398
        mmTop = 25135
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Sumatoria'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 123561
        mmTop = 31221
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Pedir'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 183621
        mmTop = 31221
        mmWidth = 10583
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 156634
        mmTop = 3175
        mmWidth = 21167
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 156634
        mmTop = 9525
        mmWidth = 23283
        BandType = 0
      end
      object pplblUser: TppLabel
        UserName = 'lblUser'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 157163
        mmTop = 15346
        mmWidth = 2381
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 794
        mmTop = 36513
        mmWidth = 197909
        BandType = 0
      end
      object pplblCia: TppLabel
        UserName = 'lblCia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 2646
        mmTop = 4233
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'M'#225'ximo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 80698
        mmTop = 31221
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'M'#237'nimo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 102394
        mmTop = 31221
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Punto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 153194
        mmTop = 25135
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Cantidad'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 180182
        mmTop = 25135
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Reposici'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 149225
        mmTop = 31221
        mmWidth = 21167
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'ARTID'
        DataPipeline = ppDBParamRep
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBParamRep'
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'ARTDES'
        DataPipeline = ppDBParamRep
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBParamRep'
        mmHeight = 3969
        mmLeft = 21431
        mmTop = 0
        mmWidth = 53975
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'STKSMAX'
        DataPipeline = ppDBParamRep
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBParamRep'
        mmHeight = 3969
        mmLeft = 77258
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'STKSMIN'
        DataPipeline = ppDBParamRep
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBParamRep'
        mmHeight = 3969
        mmLeft = 100542
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'ARTPCU'
        DataPipeline = ppDBParamRep
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBParamRep'
        mmHeight = 3969
        mmLeft = 125148
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'STKSPRE'
        DataPipeline = ppDBParamRep
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBParamRep'
        mmHeight = 3969
        mmLeft = 151077
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'STKSCPE'
        DataPipeline = ppDBParamRep
        DisplayFormat = '###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBParamRep'
        mmHeight = 3969
        mmLeft = 180975
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 2646
      mmPrintPosition = 0
    end
  end
  object ppDBParamRep: TppDBPipeline
    UserName = 'DBParamRep'
    Left = 72
    Top = 96
  end
end
