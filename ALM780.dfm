object FToolArticulo: TFToolArticulo
  Left = 131
  Top = 250
  Width = 691
  Height = 106
  Caption = 'FToolArticulo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblCia: TLabel
    Left = 16
    Top = 7
    Width = 49
    Height = 13
    Caption = 'Compa'#241#237'a'
  end
  object pnl: TPanel
    Left = 0
    Top = 0
    Width = 683
    Height = 72
    Align = alClient
    Color = 12904163
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Z1bbtnArt: TBitBtn
      Left = 544
      Top = 18
      Width = 51
      Height = 44
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Z1bbtnArtClick
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
    end
    object gbPeriodo: TGroupBox
      Left = 7
      Top = 3
      Width = 425
      Height = 62
      Caption = 'Articulos sin Stock'
      TabOrder = 0
      object Label3: TLabel
        Left = 318
        Top = 18
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object lblMes: TLabel
        Left = 358
        Top = 36
        Width = 37
        Height = 13
        Caption = '(Meses)'
      end
      object Label2: TLabel
        Left = 12
        Top = 15
        Width = 49
        Height = 13
        Caption = 'Compa'#241#237'a'
      end
      object Label4: TLabel
        Left = 162
        Top = 15
        Width = 60
        Height = 13
        Caption = 'T. Inventario'
      end
      object lblFecha: TLabel
        Left = 362
        Top = 16
        Width = 3
        Height = 13
      end
      object dbeMes: TwwDBEdit
        Left = 310
        Top = 32
        Width = 42
        Height = 21
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblcCIA: TwwDBLookupCombo
        Left = 12
        Top = 32
        Width = 49
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CIAID'#9'2'#9'ID'#9'F'
          'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
          'CIAABR'#9'15'#9'Abreviatura'#9'F')
        LookupTable = DMALM.cdsCIA
        LookupField = 'CIAID'
        Options = [loColLines, loTitles]
        MaxLength = 2
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcCIAExit
      end
      object dbeCIA: TEdit
        Left = 62
        Top = 32
        Width = 95
        Height = 21
        Enabled = False
        TabOrder = 1
      end
      object dblcTIN: TwwDBLookupCombo
        Left = 162
        Top = 32
        Width = 49
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TINID'#9'3'#9'Tipo Inventario'#9'F'
          'TINDES'#9'40'#9'Descripci'#243'n'#9'F')
        LookupTable = DMALM.cdsTINID
        LookupField = 'TINID'
        Options = [loColLines, loTitles]
        DropDownCount = 18
        MaxLength = 2
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcTINExit
      end
      object dbeTIN: TEdit
        Left = 212
        Top = 32
        Width = 95
        Height = 21
        Enabled = False
        TabOrder = 3
      end
    end
  end
end
