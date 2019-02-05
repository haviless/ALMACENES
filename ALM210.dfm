object FParRepAuto: TFParRepAuto
  Left = 276
  Top = 251
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Parametro de Reposici'#243'n Automatico'
  ClientHeight = 325
  ClientWidth = 338
  Color = 12904163
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object pnlOpciones: TPanel
    Left = 0
    Top = 0
    Width = 338
    Height = 268
    Align = alClient
    Color = 10207162
    TabOrder = 0
    object lblDias: TLabel
      Left = 276
      Top = 13
      Width = 23
      Height = 15
      Caption = 'Dias'
      Visible = False
    end
    object Label1: TLabel
      Left = 268
      Top = 8
      Width = 93
      Height = 15
      Caption = 'Factor Proyecci'#243'n'
      Visible = False
    end
    object Label2: TLabel
      Left = 340
      Top = 88
      Width = 9
      Height = 15
      Caption = '%'
      Visible = False
    end
    object gbPeriodo: TGroupBox
      Left = 18
      Top = 8
      Width = 232
      Height = 9
      Caption = 'Periodo'
      TabOrder = 3
      Visible = False
      object Label3: TLabel
        Left = 13
        Top = 12
        Width = 31
        Height = 15
        Caption = 'Desde'
      end
      object Label4: TLabel
        Left = 124
        Top = 12
        Width = 29
        Height = 15
        Caption = 'Hasta'
      end
      object dtpDesde: TDateTimePicker
        Left = 13
        Top = 27
        Width = 99
        Height = 23
        Date = 36892.719144328700000000
        Time = 36892.719144328700000000
        TabOrder = 0
      end
      object dtpHasta: TDateTimePicker
        Left = 124
        Top = 27
        Width = 97
        Height = 23
        Date = 36943.719144328700000000
        Time = 36943.719144328700000000
        TabOrder = 1
      end
    end
    object edtDias: TEdit
      Left = 276
      Top = 30
      Width = 57
      Height = 23
      TabOrder = 4
      Text = '0'
      Visible = False
    end
    object edtFactor: TEdit
      Left = 276
      Top = 28
      Width = 57
      Height = 23
      TabOrder = 5
      Text = '1'
      Visible = False
    end
    object pbProceso: TProgressBar
      Left = 9
      Top = 237
      Width = 319
      Height = 16
      Max = 0
      TabOrder = 6
      Visible = False
    end
    object gbPorcentaje: TGroupBox
      Left = 24
      Top = 163
      Width = 289
      Height = 67
      Caption = 'Porcentaje Proyecci'#243'n'
      TabOrder = 2
      object Label5: TLabel
        Left = 14
        Top = 19
        Width = 74
        Height = 15
        Caption = 'Stock M'#225'ximo'
      end
      object Label6: TLabel
        Left = 201
        Top = 19
        Width = 71
        Height = 15
        Caption = 'Stock M'#237'nimo'
      end
      object Label7: TLabel
        Left = 107
        Top = 19
        Width = 78
        Height = 15
        Caption = 'Pto. Reposici'#243'n'
      end
      object dbeStkMax: TwwDBEdit
        Left = 15
        Top = 34
        Width = 74
        Height = 23
        Picture.PictureMask = '#*#'
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeStkMaxExit
      end
      object dbePtoRep: TwwDBEdit
        Left = 107
        Top = 34
        Width = 74
        Height = 23
        Picture.PictureMask = '#*#'
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbePtoRepExit
      end
      object dbeStkMin: TwwDBEdit
        Left = 202
        Top = 34
        Width = 74
        Height = 23
        Picture.PictureMask = '#*#'
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeStkMinExit
      end
    end
    object gbMes: TGroupBox
      Left = 53
      Top = 92
      Width = 232
      Height = 60
      Caption = 'Final'
      TabOrder = 1
      object Label8: TLabel
        Left = 42
        Top = 14
        Width = 21
        Height = 15
        Caption = 'Mes'
      end
      object Label10: TLabel
        Left = 147
        Top = 12
        Width = 20
        Height = 15
        Caption = 'A'#241'o'
      end
      object dblcMesFin: TwwDBLookupCombo
        Left = 30
        Top = 31
        Width = 60
        Height = 23
        DropDownAlignment = taLeftJustify
        DropDownCount = 15
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcMesFinExit
        OnNotInList = dblcMesFinNotInList
      end
      object spnAnoFin: TSpinEdit
        Left = 134
        Top = 31
        Width = 60
        Height = 24
        MaxLength = 4
        MaxValue = 2050
        MinValue = 2000
        TabOrder = 1
        Value = 2000
      end
    end
    object gbAno: TGroupBox
      Left = 53
      Top = 20
      Width = 232
      Height = 60
      Caption = 'Inicial'
      TabOrder = 0
      object Label9: TLabel
        Left = 147
        Top = 12
        Width = 20
        Height = 15
        Caption = 'A'#241'o'
      end
      object lblInicial: TLabel
        Left = 42
        Top = 14
        Width = 21
        Height = 15
        Caption = 'Mes'
      end
      object spnAnoIni: TSpinEdit
        Left = 134
        Top = 31
        Width = 60
        Height = 24
        MaxLength = 4
        MaxValue = 2050
        MinValue = 2000
        TabOrder = 1
        Value = 2000
      end
      object dblcMesIni: TwwDBLookupCombo
        Left = 30
        Top = 31
        Width = 60
        Height = 23
        DropDownAlignment = taLeftJustify
        DropDownCount = 15
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnNotInList = dblcMesIniNotInList
      end
    end
  end
  object pnlBoton: TPanel
    Left = 0
    Top = 268
    Width = 338
    Height = 57
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 10207162
    TabOrder = 1
    object Z2bbtnRegOk: TBitBtn
      Left = 54
      Top = 15
      Width = 84
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
      Left = 189
      Top = 15
      Width = 88
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
end
