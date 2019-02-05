object FMovAlmS: TFMovAlmS
  Left = 72
  Top = 135
  Width = 720
  Height = 494
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Salidas de Almacén'
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
  PixelsPerInch = 96
  TextHeight = 15
  object lblCIA: TLabel
    Left = 5
    Top = 32
    Width = 49
    Height = 15
    Caption = 'Compañía'
  end
  object Label3: TLabel
    Left = 199
    Top = 32
    Width = 49
    Height = 15
    Caption = 'Localidad'
  end
  object Label2: TLabel
    Left = 393
    Top = 32
    Width = 43
    Height = 15
    Caption = 'Almacén'
  end
  object Label7: TLabel
    Left = 586
    Top = 32
    Width = 97
    Height = 15
    Caption = 'Tipo de Documento'
  end
  object lblTransacc: TLabel
    Left = 99
    Top = 72
    Width = 63
    Height = 15
    Caption = 'Transacción'
  end
  object Label11: TLabel
    Left = 5
    Top = 115
    Width = 91
    Height = 15
    Caption = 'Localidad Destino'
  end
  object lblNumNS: TLabel
    Left = 5
    Top = 4
    Width = 93
    Height = 15
    Caption = 'Nº Nota de Salida'
  end
  object Label12: TLabel
    Left = 181
    Top = 115
    Width = 85
    Height = 15
    Caption = 'Almacén Destino'
  end
  object lblFReg: TLabel
    Left = 5
    Top = 72
    Width = 73
    Height = 15
    Caption = 'F. Nota Salida'
  end
  object lblProv: TLabel
    Left = 506
    Top = 72
    Width = 36
    Height = 15
    Caption = 'Cliente'
  end
  object lblTDocumento: TLabel
    Left = 417
    Top = 115
    Width = 132
    Height = 15
    Caption = 'Documento de Referencia'
  end
  object lblSerie: TLabel
    Left = 560
    Top = 115
    Width = 29
    Height = 15
    Caption = 'Serie'
  end
  object lblNDoc: TLabel
    Left = 614
    Top = 115
    Width = 73
    Height = 15
    Caption = 'Nº Documento'
  end
  object lblFDoc: TLabel
    Left = 5
    Top = 154
    Width = 68
    Height = 15
    Caption = 'F. Documento'
  end
  object lblSolic: TLabel
    Left = 97
    Top = 154
    Width = 57
    Height = 15
    Caption = 'Solicitante'
  end
  object Label6: TLabel
    Left = 348
    Top = 154
    Width = 26
    Height = 15
    Caption = 'Obra'
  end
  object Label8: TLabel
    Left = 437
    Top = 154
    Width = 22
    Height = 15
    Caption = 'Lote'
  end
  object Label9: TLabel
    Left = 525
    Top = 154
    Width = 70
    Height = 15
    Caption = 'Packed Order'
  end
  object Label10: TLabel
    Left = 614
    Top = 154
    Width = 92
    Height = 15
    Caption = 'Número de Pedido'
  end
  object lblObs: TLabel
    Left = 5
    Top = 193
    Width = 151
    Height = 15
    Caption = 'Observaciones / Comentarios'
  end
  object lblCC: TLabel
    Left = 273
    Top = 72
    Width = 85
    Height = 15
    Caption = 'Centro de Costos'
  end
  object dbeCIA: TwwDBEdit
    Left = 5
    Top = 48
    Width = 188
    Height = 23
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 0
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeLOC: TwwDBEdit
    Left = 199
    Top = 48
    Width = 188
    Height = 23
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 1
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeALM: TwwDBEdit
    Left = 393
    Top = 48
    Width = 188
    Height = 23
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 2
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeTDNISA: TwwDBEdit
    Left = 586
    Top = 48
    Width = 119
    Height = 23
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 3
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeTransac: TwwDBEdit
    Left = 95
    Top = 89
    Width = 174
    Height = 23
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 4
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeLOCOri: TwwDBEdit
    Left = 5
    Top = 131
    Width = 171
    Height = 23
    CharCase = ecUpperCase
    DataField = 'LOCDES'
    DataSource = DM1.dsLKLOC
    Enabled = False
    TabOrder = 5
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeNumNISA: TwwDBEdit
    Left = 105
    Top = 4
    Width = 88
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NISAID'
    DataSource = DM1.dsNIS
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MaxLength = 5
    ParentFont = False
    TabOrder = 6
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeALMOri: TwwDBEdit
    Left = 181
    Top = 131
    Width = 231
    Height = 23
    CharCase = ecUpperCase
    DataField = 'ALMDES'
    DataSource = DM1.dsLKALM
    Enabled = False
    TabOrder = 7
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeCC: TwwDBEdit
    Left = 273
    Top = 89
    Width = 227
    Height = 23
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 8
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeProv: TwwDBEdit
    Left = 506
    Top = 90
    Width = 198
    Height = 23
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 9
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeTDOC: TwwDBEdit
    Left = 417
    Top = 131
    Width = 138
    Height = 23
    CharCase = ecUpperCase
    Enabled = False
    TabOrder = 10
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeSerie: TwwDBEdit
    Left = 559
    Top = 131
    Width = 46
    Height = 23
    CharCase = ecUpperCase
    DataField = 'NISASERIE'
    DataSource = DM1.dsNIS
    Enabled = False
    TabOrder = 11
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeNDoc: TwwDBEdit
    Left = 614
    Top = 131
    Width = 88
    Height = 23
    CharCase = ecUpperCase
    DataField = 'NISANDOC'
    DataSource = DM1.dsNIS
    Enabled = False
    TabOrder = 12
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeSolic: TwwDBEdit
    Left = 97
    Top = 168
    Width = 246
    Height = 23
    CharCase = ecUpperCase
    DataField = 'NISASOLIC'
    DataSource = DM1.dsNIS
    Enabled = False
    TabOrder = 13
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object deObra: TwwDBEdit
    Left = 347
    Top = 168
    Width = 85
    Height = 23
    CharCase = ecUpperCase
    DataField = 'NISAOBRA'
    DataSource = DM1.dsNIS
    Enabled = False
    TabOrder = 14
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeLote: TwwDBEdit
    Left = 436
    Top = 168
    Width = 85
    Height = 23
    CharCase = ecUpperCase
    DataField = 'NISALOTE'
    DataSource = DM1.dsNIS
    Enabled = False
    TabOrder = 15
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbePO: TwwDBEdit
    Left = 524
    Top = 168
    Width = 85
    Height = 23
    CharCase = ecUpperCase
    DataField = 'NISPORD'
    DataSource = DM1.dsNIS
    Enabled = False
    TabOrder = 16
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeNP: TwwDBEdit
    Left = 613
    Top = 168
    Width = 91
    Height = 23
    CharCase = ecUpperCase
    DataField = 'NISNPED'
    DataSource = DM1.dsNIS
    Enabled = False
    TabOrder = 17
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbmObs: TDBMemo
    Left = 5
    Top = 207
    Width = 366
    Height = 23
    DataField = 'NISAOBS'
    DataSource = DM1.dsNIS
    Enabled = False
    TabOrder = 18
  end
  object wwDBEdit1: TwwDBEdit
    Left = 5
    Top = 89
    Width = 86
    Height = 23
    CharCase = ecUpperCase
    DataField = 'NISAFREG'
    DataSource = DM1.dsNIS
    Enabled = False
    TabOrder = 19
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit2: TwwDBEdit
    Left = 5
    Top = 169
    Width = 88
    Height = 23
    CharCase = ecUpperCase
    DataField = 'NISAFDOC'
    DataSource = DM1.dsNIS
    Enabled = False
    TabOrder = 20
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbgDReqs: TwwDBGrid
    Left = 7
    Top = 239
    Width = 698
    Height = 224
    Selected.Strings = (
      'KDXID'#9'6'#9'Nº'
      'ARTID'#9'20'#9'Código~Artículo'
      'KDXPEDIDOG'#9'10'#9'C.Pedida~U/Med G,'
      'KDXPEDIDOU'#9'10'#9'C.Pedida~U/Med U.'
      'KDXCNTG'#9'10'#9'C.Atendida~U/Med.G'
      'KDXCNTU'#9'10'#9'C.Atendida~U/Med.U')
    IniAttributes.Delimiter = ';;'
    TitleColor = 11974251
    FixedCols = 0
    ShowHorzScrollBar = True
    Color = clWhite
    DataSource = DM1.dsKDX
    KeyOptions = [dgEnterToTab]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    TabOrder = 21
    TitleAlignment = taCenter
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clNavy
    TitleFont.Height = -11
    TitleFont.Name = 'Comic Sans MS'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    IndicatorColor = icBlack
    object Z2dbgDReqsIButton: TwwIButton
      Left = 0
      Top = 0
      Width = 25
      Height = 30
      AllowAllUp = True
      Enabled = False
    end
  end
end
