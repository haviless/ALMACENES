object FRevisaPrecios: TFRevisaPrecios
  Left = 131
  Top = 160
  Width = 696
  Height = 535
  Caption = 'FRevisaPrecios'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblCia: TLabel
    Left = 224
    Top = 16
    Width = 49
    Height = 13
    Caption = 'Compa'#241#237'a'
  end
  object lblNroRegistros: TLabel
    Left = 336
    Top = 64
    Width = 53
    Height = 13
    Caption = '0 Registros'
  end
  object lblMonto: TLabel
    Left = 480
    Top = 40
    Width = 81
    Height = 13
    Caption = 'Monto Constante'
  end
  object pcRevisaPrecios: TPageControl
    Left = 16
    Top = 96
    Width = 657
    Height = 385
    ActivePage = tsArreglaMovs
    TabOrder = 0
    object tsListaArticulos: TTabSheet
      Caption = 'Lista Articulos'
      object dbgListaArticulos: TwwDBGrid
        Left = 8
        Top = 16
        Width = 633
        Height = 329
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        OnDblClick = dbgListaArticulosDblClick
      end
    end
    object tsConsultaMovs: TTabSheet
      Caption = 'Consulta Movs'
      ImageIndex = 1
      object dbgConsultaMovs: TwwDBGrid
        Left = 8
        Top = 16
        Width = 633
        Height = 211
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
      end
      object dbgOCompra: TwwDBGrid
        Left = 8
        Top = 240
        Width = 633
        Height = 100
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
      end
    end
    object tsArreglaMovs: TTabSheet
      Caption = 'Arregla Movs'
      ImageIndex = 2
      object dbgArreglaMovs: TwwDBGrid
        Left = 8
        Top = 16
        Width = 633
        Height = 304
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        OnDblClick = dbgArreglaMovsDblClick
      end
      object Z2bbtnGraba: TBitBtn
        Left = 600
        Top = 320
        Width = 32
        Height = 31
        Hint = 'Grabar Registro'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TabStop = False
        OnClick = Z2bbtnGrabaClick
        Glyph.Data = {
          8A010000424D8A01000000000000760000002800000017000000170000000100
          0400000000001401000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333303000077777777777770003300000078888888888880000300000
          0780088888888800003000000780088888888800003000000780088888888800
          0030000007888888888888000030000000000000000000000030000000000000
          0000000000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
          FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF00
          00300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFF
          FFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
          FFFFFFFFFFFFFF07703000009999999999999907703000009999999999999900
          0030300099999999999999000330}
      end
    end
  end
  object BitBtn2: TBitBtn
    Left = 32
    Top = 24
    Width = 48
    Height = 44
    Hint = 'Ciclo de Existencia'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = BitBtn2Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550FF0559
      1950555FF75F7557F7F757000FF055591903557775F75557F77570FFFF055559
      1933575FF57F5557F7FF0F00FF05555919337F775F7F5557F7F700550F055559
      193577557F7F55F7577F07550F0555999995755575755F7FFF7F5570F0755011
      11155557F755F777777555000755033305555577755F75F77F55555555503335
      0555555FF5F75F757F5555005503335505555577FF75F7557F55505050333555
      05555757F75F75557F5505000333555505557F777FF755557F55000000355557
      07557777777F55557F5555000005555707555577777FF5557F55553000075557
      0755557F7777FFF5755555335000005555555577577777555555}
    Layout = blGlyphTop
    NumGlyphs = 2
  end
  object dblcCIA: TwwDBLookupCombo
    Left = 224
    Top = 32
    Width = 49
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'CIAID'#9'2'#9'ID'#9'F'
      'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
      'CIAABR'#9'15'#9'Abreviatura'#9'F')
    DataField = 'CIAID'
    LookupField = 'CIAID'
    Options = [loColLines, loTitles]
    MaxLength = 2
    TabOrder = 2
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcCIAExit
  end
  object dbeCIA: TEdit
    Left = 274
    Top = 31
    Width = 135
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object edtMonto: TEdit
    Left = 480
    Top = 56
    Width = 57
    Height = 21
    TabOrder = 4
  end
  object BitBtn1: TBitBtn
    Left = 552
    Top = 56
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 5
    OnClick = BitBtn1Click
  end
end
