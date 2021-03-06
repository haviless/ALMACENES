object FToolArtCCosto: TFToolArtCCosto
  Left = 195
  Top = 416
  Width = 922
  Height = 103
  Caption = 'FToolArtCCosto'
  Color = 14869218
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object pnlTool: TPanel
    Left = 0
    Top = 0
    Width = 906
    Height = 65
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    Color = 14869218
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object gbPeriodo: TGroupBox
      Left = 6
      Top = 5
      Width = 269
      Height = 58
      Caption = 'Rango de Fecha'
      TabOrder = 0
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
    object Z1sbActFiltro: TBitBtn
      Left = 240
      Top = 32
      Width = 31
      Height = 27
      TabOrder = 1
      Visible = False
      OnClick = Z1sbActFiltroClick
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
    object Z1sbCCosto: TBitBtn
      Left = 454
      Top = 16
      Width = 47
      Height = 39
      Hint = 'Centro de Costo por Cuenta'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Visible = False
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
    object Z2bbtnResKdxVal: TBitBtn
      Left = 526
      Top = 39
      Width = 230
      Height = 25
      Caption = 'Resumen de Salida x C. Costo - Cta Ctbl'
      TabOrder = 3
      Visible = False
    end
    object Z2bbtnResSalCCosto: TBitBtn
      Left = 526
      Top = 72
      Width = 230
      Height = 25
      Caption = 'Resumen de Salida x C. Costo                  '
      TabOrder = 4
      Visible = False
    end
    object Z2bbtnResCtaCCosto: TBitBtn
      Left = 526
      Top = 14
      Width = 230
      Height = 25
      Caption = 'Resumen de Salida x Cta Contable          '
      TabOrder = 5
      Visible = False
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 376
    Top = 32
  end
end
