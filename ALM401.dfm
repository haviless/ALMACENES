object FParRepos: TFParRepos
  Left = 328
  Top = 164
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Par'#225'metros de Reposici'#243'n'
  ClientHeight = 314
  ClientWidth = 434
  Color = 14869218
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object pnlPrincipal: TPanel
    Left = 7
    Top = 4
    Width = 419
    Height = 306
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
      Left = 95
      Top = 9
      Width = 68
      Height = 16
      Caption = 'U/Med. Gnrl'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 328
      Top = 9
      Width = 51
      Height = 16
      Caption = 'Contenido'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 16
      Top = 57
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
    object lblSAG: TLabel
      Left = 257
      Top = 130
      Width = 52
      Height = 21
      AutoSize = False
      Caption = 'General'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object lblSAU: TLabel
      Left = 257
      Top = 169
      Width = 46
      Height = 21
      AutoSize = False
      Caption = 'Unitario'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object lblSOCKACT: TLabel
      Left = 308
      Top = 109
      Width = 70
      Height = 16
      Caption = 'Stock Actual'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbeArti: TwwDBEdit
      Left = 16
      Top = 25
      Width = 73
      Height = 23
      DataField = 'ARTID'
      DataSource = DMALM.dsArti
      Enabled = False
      ReadOnly = True
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtUMedG: TwwDBEdit
      Left = 95
      Top = 25
      Width = 58
      Height = 23
      DataField = 'UNMIDG'
      DataSource = DMALM.dsArti
      Enabled = False
      ReadOnly = True
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = edtUMedGExit
    end
    object wwDBEdit2: TwwDBEdit
      Left = 328
      Top = 25
      Width = 58
      Height = 23
      DataField = 'ARTCONT'
      DataSource = DMALM.dsArti
      Enabled = False
      ReadOnly = True
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object bbtnOk: TBitBtn
      Left = 249
      Top = 248
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
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
      Left = 334
      Top = 248
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cerrar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      TabOrder = 5
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
    object wwDBEdit3: TwwDBEdit
      Left = 16
      Top = 73
      Width = 370
      Height = 23
      DataField = 'ARTDES'
      DataSource = DMALM.dsArti
      Enabled = False
      ReadOnly = True
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtUMed: TEdit
      Left = 157
      Top = 25
      Width = 166
      Height = 23
      Enabled = False
      TabOrder = 7
    end
    object dbeSAG: TwwDBEdit
      Left = 308
      Top = 130
      Width = 94
      Height = 23
      TabStop = False
      AutoSize = False
      DataField = 'ARTCNTG'
      DataSource = DMALM.dsArti
      Enabled = False
      ReadOnly = True
      TabOrder = 8
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeSAU: TwwDBEdit
      Left = 308
      Top = 169
      Width = 94
      Height = 23
      TabStop = False
      DataField = 'ARTCNTU'
      DataSource = DMALM.dsArti
      Enabled = False
      ReadOnly = True
      TabOrder = 9
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object pnlIngreso: TPanel
      Left = -2
      Top = 115
      Width = 225
      Height = 189
      BevelInner = bvRaised
      BevelOuter = bvLowered
      BevelWidth = 2
      Color = 14869218
      TabOrder = 3
      object lblSGen: TLabel
        Left = 18
        Top = 8
        Width = 78
        Height = 16
        Caption = 'Stock M'#225'ximo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSUni: TLabel
        Left = 129
        Top = 8
        Width = 74
        Height = 16
        Caption = 'Stock M'#237'nimo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 16
        Top = 68
        Width = 88
        Height = 16
        Caption = 'Punto Reposici'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 16
        Top = 111
        Width = 103
        Height = 16
        Caption = 'Cantidad a Reponer'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 16
        Top = 148
        Width = 101
        Height = 16
        Caption = 'Ciclo de Existencia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 49
        Top = 164
        Width = 30
        Height = 16
        Caption = '(Dias)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbeStkMaxG: TwwDBEdit
        Left = 18
        Top = 24
        Width = 81
        Height = 23
        DataField = 'STKSMAX'
        DataSource = DMALM.dsArti
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeStkMaxGExit
        OnKeyPress = ValidaNumeros
      end
      object dbeStkMinG: TwwDBEdit
        Left = 129
        Top = 24
        Width = 81
        Height = 23
        DataField = 'STKSMIN'
        DataSource = DMALM.dsArti
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeStkMinGExit
        OnKeyPress = ValidaNumeros
      end
      object dbeStkPuped: TwwDBEdit
        Left = 129
        Top = 64
        Width = 81
        Height = 23
        DataField = 'STKSPRE'
        DataSource = DMALM.dsArti
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeStkPupedExit
        OnKeyPress = ValidaNumeros
      end
      object dbeStkLotec: TwwDBEdit
        Left = 129
        Top = 107
        Width = 81
        Height = 23
        DataField = 'STKSCPE'
        DataSource = DMALM.dsArti
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeStkLotecExit
        OnKeyPress = ValidaNumeros
      end
      object dbeCVida: TwwDBEdit
        Left = 129
        Top = 148
        Width = 81
        Height = 23
        DataField = 'ARTCVIDA'
        DataSource = DMALM.dsArti
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeCVidaExit
      end
    end
  end
end
