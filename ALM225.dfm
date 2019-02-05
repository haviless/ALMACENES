object FGuiaNumAnula: TFGuiaNumAnula
  Left = 437
  Top = 226
  Width = 370
  Height = 282
  BorderIcons = [biSystemMenu]
  Caption = 'Guia de Remisi'#243'n'
  Color = 12904163
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Z2bbtnGraba: TBitBtn
    Left = 263
    Top = 203
    Width = 35
    Height = 32
    Hint = 'Grabar Registro'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
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
  object Z2bbtnSalir: TBitBtn
    Left = 303
    Top = 203
    Width = 35
    Height = 32
    Hint = 'Salir'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Garamond'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    TabStop = False
    OnClick = Z2bbtnSalirClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
  end
  object Panel1: TPanel
    Left = 6
    Top = 33
    Width = 341
    Height = 70
    BevelInner = bvLowered
    BevelWidth = 2
    Color = 10207162
    TabOrder = 4
    object lblTit1: TLabel
      Left = 19
      Top = 6
      Width = 301
      Height = 23
      Caption = 'Verifique el N'#250'mero de Gu'#237'a de Remisi'#243'n '
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblTit2: TLabel
      Left = 34
      Top = 36
      Width = 268
      Height = 23
      Caption = 'que continua en Impresora y Digitelo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 6
    Top = 151
    Width = 341
    Height = 49
    BevelInner = bvLowered
    BevelWidth = 2
    Color = 10207162
    TabOrder = 1
    object lblTit3: TLabel
      Left = 43
      Top = 12
      Width = 128
      Height = 26
      Caption = 'N'#250'mero Inicial'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object dbeNumGuia: TwwDBEdit
      Left = 192
      Top = 8
      Width = 99
      Height = 31
      AutoFillDate = False
      AutoSelect = False
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      MaxLength = 7
      ParentFont = False
      Picture.PictureMask = '#[#][#][#][#][#][#]'
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeNumGuiaExit
    end
  end
  object dblcompania: TwwDBLookupCombo
    Left = 8
    Top = 8
    Width = 45
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'CIAID'#9'2'#9'C'#243'digo'#9'F'
      'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
      'CIAABR'#9'15'#9'Abreviatura'#9'F')
    LookupField = 'CIAID'
    Options = [loColLines, loTitles]
    DropDownCount = 15
    MaxLength = 2
    TabOrder = 0
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcompaniaExit
    OnKeyPress = FormKeyPress
  end
  object edtCompania: TEdit
    Left = 53
    Top = 8
    Width = 292
    Height = 21
    Color = clInfoBk
    Enabled = False
    TabOrder = 5
  end
  object Panel3: TPanel
    Left = 6
    Top = 102
    Width = 341
    Height = 49
    BevelInner = bvLowered
    BevelWidth = 2
    Color = 10207162
    TabOrder = 6
    object Label1: TLabel
      Left = 43
      Top = 12
      Width = 46
      Height = 26
      Caption = 'Serie'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object edtSerie: TwwDBEdit
      Left = 192
      Top = 8
      Width = 99
      Height = 31
      AutoFillDate = False
      AutoSelect = False
      CharCase = ecUpperCase
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      MaxLength = 7
      ParentFont = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnExit = dbeNumGuiaExit
    end
  end
end
