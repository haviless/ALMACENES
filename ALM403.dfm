object FSaldosInic: TFSaldosInic
  Left = 280
  Top = 169
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Actualizaci'#243'n de Saldos Iniciales'
  ClientHeight = 211
  ClientWidth = 426
  Color = 14869218
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object pnlPrincipal: TPanel
    Left = 9
    Top = 4
    Width = 408
    Height = 202
    BevelWidth = 2
    BorderStyle = bsSingle
    Color = 14869218
    TabOrder = 0
    object lblArticulo: TLabel
      Left = 16
      Top = 9
      Width = 34
      Height = 16
      Caption = 'C'#243'digo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 254
      Top = 9
      Width = 42
      Height = 16
      Caption = 'U/Med.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 318
      Top = 9
      Width = 29
      Height = 16
      Caption = 'Cont.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 54
      Width = 42
      Height = 16
      Caption = 'Articulo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbeDescripcion: TwwDBEdit
      Left = 16
      Top = 25
      Width = 81
      Height = 23
      DataField = 'ARTID'
      DataSource = DMALM.dsSaldos
      Enabled = False
      ReadOnly = True
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit1: TwwDBEdit
      Left = 254
      Top = 25
      Width = 58
      Height = 23
      DataField = 'UNMIDG'
      DataSource = DMALM.dsSaldos
      Enabled = False
      ReadOnly = True
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit2: TwwDBEdit
      Left = 318
      Top = 25
      Width = 58
      Height = 23
      DataField = 'ARTCONT'
      DataSource = DMALM.dsSaldos
      Enabled = False
      ReadOnly = True
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object bbtnOk: TBitBtn
      Left = 244
      Top = 159
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 3
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
      Left = 325
      Top = 159
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cerrar'
      ModalResult = 2
      TabOrder = 4
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
    object pnlIngreso: TPanel
      Left = -2
      Top = 106
      Width = 241
      Height = 94
      BevelInner = bvRaised
      BevelOuter = bvLowered
      BevelWidth = 2
      Color = 14869218
      TabOrder = 5
      object lblSGen: TLabel
        Left = 20
        Top = 8
        Width = 86
        Height = 16
        Caption = 'Stock Inicial G.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSUni: TLabel
        Left = 131
        Top = 8
        Width = 34
        Height = 16
        Caption = 'Monto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 20
        Top = 48
        Width = 87
        Height = 16
        Caption = 'Stock Inicial U.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 131
        Top = 48
        Width = 34
        Height = 16
        Caption = 'Monto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbeStkInicG: TwwDBEdit
        Left = 20
        Top = 24
        Width = 81
        Height = 23
        DataField = 'STKSANTG'
        DataSource = DMALM.dsSaldos
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeStkInicUExit
      end
      object dbeMontoG: TwwDBEdit
        Left = 131
        Top = 24
        Width = 81
        Height = 23
        DataField = 'STKMANTG'
        DataSource = DMALM.dsSaldos
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeMontoGExit
      end
      object dbeMontoU: TwwDBEdit
        Left = 131
        Top = 64
        Width = 81
        Height = 23
        DataField = 'STKMANTU'
        DataSource = DMALM.dsSaldos
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeMontoGExit
      end
      object dbeStkInicU: TwwDBEdit
        Left = 20
        Top = 64
        Width = 81
        Height = 23
        DataField = 'STKSANTU'
        DataSource = DMALM.dsSaldos
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeStkInicUExit
      end
    end
    object wwDBEdit3: TwwDBEdit
      Left = 16
      Top = 70
      Width = 361
      Height = 23
      DataField = 'ARTDES'
      DataSource = DMALM.dsSaldos
      Enabled = False
      ReadOnly = True
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
end
