object FCierrexMes: TFCierrexMes
  Left = 100
  Top = 141
  Width = 681
  Height = 262
  Caption = 'Cierre Contable'
  Color = 12904163
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object bbtnOk: TBitBtn
    Left = 472
    Top = 181
    Width = 75
    Height = 25
    Caption = 'Aceptar'
    TabOrder = 2
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
    Left = 561
    Top = 181
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cerrar'
    ModalResult = 2
    TabOrder = 3
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
  object gbPeriodo: TGroupBox
    Left = 448
    Top = 24
    Width = 195
    Height = 137
    Caption = '&Periodo'
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 42
      Height = 15
      Caption = 'P&eriodo:'
    end
    object Label3: TLabel
      Left = 97
      Top = 16
      Width = 69
      Height = 15
      Caption = 'Fecha &Actual:'
    end
    object dblcPerALM: TwwDBLookupCombo
      Left = 16
      Top = 32
      Width = 73
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PERID'#9'6'#9'Periodo'#9'F')
      LookupTable = DMALM.cdsPerALM
      LookupField = 'PERID'
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
    end
    object dtpFecha: TDateTimePicker
      Left = 96
      Top = 32
      Width = 93
      Height = 23
      Date = 36766.637718634300000000
      Time = 36766.637718634300000000
      Enabled = False
      TabOrder = 1
    end
    object gbAccion: TGroupBox
      Left = 16
      Top = 56
      Width = 162
      Height = 61
      Caption = 'Acc&ion'
      TabOrder = 2
      object chkSaldos: TCheckBox
        Left = 16
        Top = 40
        Width = 139
        Height = 17
        Caption = 'Generar Saldos de Stock'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object chkCerrar: TCheckBox
        Left = 16
        Top = 16
        Width = 111
        Height = 17
        Caption = 'Cerrar Mes actual'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
    end
  end
  object gbCLA: TGroupBox
    Left = 8
    Top = 16
    Width = 425
    Height = 201
    Caption = 'Lugares Fisicos'
    TabOrder = 0
    object dblcALM: TwwDBLookupCombo
      Left = 9
      Top = 160
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'ALMID'#9'2'#9'ID'#9'F'
        'ALMDES'#9'40'#9'Almacen'#9'F')
      LookupTable = DMALM.cdsALM
      LookupField = 'ALMID'
      Options = [loColLines, loTitles]
      MaxLength = 2
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
    end
    object edtALM: TEdit
      Left = 60
      Top = 158
      Width = 342
      Height = 23
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
  end
end
