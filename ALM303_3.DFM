object FMovAlmE: TFMovAlmE
  Left = 17
  Top = 93
  Width = 696
  Height = 457
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Ingresos a Almacén'
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
    Left = 3
    Top = 32
    Width = 49
    Height = 15
    Caption = 'Compañía'
  end
  object Label6: TLabel
    Left = 195
    Top = 32
    Width = 49
    Height = 15
    Caption = 'Localidad'
  end
  object Label2: TLabel
    Left = 387
    Top = 32
    Width = 43
    Height = 15
    Caption = 'Almacén'
  end
  object Label7: TLabel
    Left = 579
    Top = 32
    Width = 97
    Height = 15
    Caption = 'Tipo de Documento'
  end
  object lblFReg: TLabel
    Left = 3
    Top = 74
    Width = 80
    Height = 15
    Caption = 'F. Nota Ingreso'
  end
  object lblTransacc: TLabel
    Left = 95
    Top = 74
    Width = 63
    Height = 15
    Caption = 'Transacción'
  end
  object lblNumNS: TLabel
    Left = 6
    Top = 3
    Width = 81
    Height = 15
    Caption = 'Nº Nota de Ing.'
  end
  object lblCC: TLabel
    Left = 272
    Top = 74
    Width = 85
    Height = 15
    Caption = 'Centro de Costos'
  end
  object lblProv: TLabel
    Left = 511
    Top = 74
    Width = 52
    Height = 15
    Caption = 'Proveedor'
  end
  object lblNOC: TLabel
    Left = 581
    Top = 74
    Width = 105
    Height = 15
    Caption = 'Nº Orden de Compra'
  end
  object lblTDocumento: TLabel
    Left = 3
    Top = 116
    Width = 132
    Height = 15
    Caption = 'Documento de Referencia'
  end
  object lblNDoc: TLabel
    Left = 132
    Top = 116
    Width = 73
    Height = 15
    Caption = 'Nº Documento'
  end
  object lblFDoc: TLabel
    Left = 222
    Top = 116
    Width = 68
    Height = 15
    Caption = 'F. Documento'
  end
  object Label8: TLabel
    Left = 311
    Top = 115
    Width = 22
    Height = 15
    Caption = 'Lote'
  end
  object Label11: TLabel
    Left = 385
    Top = 115
    Width = 70
    Height = 15
    Caption = 'Packed Order'
  end
  object Label12: TLabel
    Left = 459
    Top = 115
    Width = 92
    Height = 15
    Caption = 'Numero de Pedido'
  end
  object lblObs: TLabel
    Left = 4
    Top = 155
    Width = 151
    Height = 15
    Caption = 'Observaciones / Comentarios'
  end
  object dbeCIA: TwwDBEdit
    Left = 3
    Top = 49
    Width = 188
    Height = 23
    Enabled = False
    TabOrder = 0
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeLoca: TwwDBEdit
    Left = 195
    Top = 49
    Width = 188
    Height = 23
    Enabled = False
    TabOrder = 1
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeAlma: TwwDBEdit
    Left = 387
    Top = 49
    Width = 188
    Height = 23
    Enabled = False
    TabOrder = 2
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeTipDoc: TwwDBEdit
    Left = 579
    Top = 49
    Width = 103
    Height = 23
    Enabled = False
    TabOrder = 3
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeFNI: TwwDBEdit
    Left = 3
    Top = 91
    Width = 86
    Height = 23
    DataField = 'NISAFREG'
    DataSource = DM1.dsNIA
    Enabled = False
    TabOrder = 4
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeTans: TwwDBEdit
    Left = 93
    Top = 91
    Width = 174
    Height = 23
    Enabled = False
    TabOrder = 5
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit6: TwwDBEdit
    Left = 91
    Top = 3
    Width = 46
    Height = 23
    CharCase = ecUpperCase
    Color = clInfoBk
    DataField = 'NISAID'
    DataSource = DM1.dsNIA
    Enabled = False
    TabOrder = 6
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeCCos: TwwDBEdit
    Left = 272
    Top = 91
    Width = 227
    Height = 23
    Enabled = False
    TabOrder = 7
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeProv: TwwDBEdit
    Left = 511
    Top = 91
    Width = 60
    Height = 23
    DataField = 'PROV'
    DataSource = DM1.dsNIA
    Enabled = False
    TabOrder = 8
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeOrdComp: TwwDBEdit
    Left = 581
    Top = 91
    Width = 98
    Height = 23
    DataField = 'DOCID'
    DataSource = DM1.dsNIA
    Enabled = False
    TabOrder = 9
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeDocRef: TwwDBEdit
    Left = 3
    Top = 132
    Width = 125
    Height = 23
    Enabled = False
    TabOrder = 10
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeNumDoc: TwwDBEdit
    Left = 132
    Top = 132
    Width = 86
    Height = 23
    DataField = 'NISANDOC'
    DataSource = DM1.dsNIA
    Enabled = False
    TabOrder = 11
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeFDoc: TwwDBEdit
    Left = 222
    Top = 132
    Width = 86
    Height = 23
    DataField = 'NISAFDOC'
    DataSource = DM1.dsNIA
    Enabled = False
    TabOrder = 12
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeLote: TwwDBEdit
    Left = 311
    Top = 132
    Width = 69
    Height = 23
    DataField = 'NISALOTE'
    DataSource = DM1.dsNIA
    Enabled = False
    TabOrder = 13
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbePack: TwwDBEdit
    Left = 385
    Top = 132
    Width = 69
    Height = 23
    DataField = 'NISPORD'
    DataSource = DM1.dsNIA
    Enabled = False
    TabOrder = 14
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeNumPed: TwwDBEdit
    Left = 459
    Top = 131
    Width = 69
    Height = 23
    DataField = 'NISNPED'
    DataSource = DM1.dsNIA
    Enabled = False
    TabOrder = 15
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeObser: TwwDBEdit
    Left = 4
    Top = 171
    Width = 401
    Height = 23
    DataField = 'NISAOBS'
    DataSource = DM1.dsNIA
    Enabled = False
    TabOrder = 16
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object pnlDetalleG: TPanel
    Left = 2
    Top = 197
    Width = 682
    Height = 230
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'pnlDetalleG'
    Color = 10207162
    TabOrder = 17
    object dbgDReqs: TwwDBGrid
      Left = 6
      Top = 24
      Width = 671
      Height = 193
      Selected.Strings = (
        'ARTID'#9'20'#9'Código~Artículo'#9'F'
        'KDXID'#9'6'#9'Nº'#9'F'
        'ODCID'#9'15'#9'ODCID'#9'F'
        'ARTPCG'#9'10'#9'Precio G'#9'F'
        'ARTPCU'#9'10'#9'Precio U'#9'F'
        'KDXCNTG'#9'10'#9'Cantidad G'#9'F'
        'KDXCNTU'#9'10'#9'Cantidad U'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = 11974251
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DM1.dsKDX
      KeyOptions = [dgEnterToTab]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      UseTFields = False
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
    object stxTitulo1: TPanel
      Left = 2
      Top = 2
      Width = 678
      Height = 20
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'Detalle de Ingreso'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
end
