object FCierreAnual: TFCierreAnual
  Left = 254
  Top = 109
  Width = 689
  Height = 606
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  Caption = 'Apertura Anual'
  Color = 12904163
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object pnlBoton: TPanel
    Left = 0
    Top = 510
    Width = 673
    Height = 58
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 14869218
    TabOrder = 2
    object Label1: TLabel
      Left = 54
      Top = 17
      Width = 319
      Height = 21
      Caption = 'Marcar los almacenes que se quieren Cerrar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Z2bbtnRegOk: TBitBtn
      Left = 410
      Top = 16
      Width = 116
      Height = 28
      Hint = 'Confirma Actualizaci'#243'n'
      Caption = 'Procesar'
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
      Left = 545
      Top = 16
      Width = 120
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
    object chkInser: TCheckBox
      Left = 16
      Top = 36
      Width = 169
      Height = 17
      Caption = 'Solo Inserci'#243'n de Articulos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
  end
  object dbgCierreAno: TwwDBGrid
    Left = 0
    Top = 41
    Width = 673
    Height = 469
    DisableThemesInTitle = False
    Selected.Strings = (
      'CIAID'#9'4'#9'Cia'#9'T'
      'LOCID'#9'4'#9'Loc'#9'T'
      'TINID'#9'4'#9'T. Inv.'#9'T'
      'ALMID'#9'4'#9'Alm.'#9'T'
      'STKANO'#9'6'#9'A'#241'o'#9'T'
      'FCIERRE'#9'18'#9'Fecha~Cierre'#9'T'
      'HCIERRE'#9'18'#9'Hora~Cierre'#9'T'
      'USUARIO'#9'20'#9'Usuario'#9'T'
      'VBUENO'#9'5'#9'Check'#9'F')
    IniAttributes.Delimiter = ';;'
    TitleColor = 7566265
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alClient
    Color = clWhite
    KeyOptions = [dgAllowDelete]
    TabOrder = 1
    TitleAlignment = taCenter
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clNavy
    TitleFont.Height = -11
    TitleFont.Name = 'Comic Sans MS'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    UseTFields = False
  end
  object pnlCab: TPanel
    Left = 0
    Top = 0
    Width = 673
    Height = 41
    Align = alTop
    TabOrder = 0
    object lblCia: TLabel
      Left = 28
      Top = 13
      Width = 49
      Height = 15
      Caption = 'Compa'#241#237'a'
    end
    object dblcCIA: TwwDBLookupCombo
      Left = 84
      Top = 9
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'ID'#9'F'
        'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
        'CIAABR'#9'15'#9'Abreviatura'#9'F')
      DataField = ' '
      LookupTable = DMALM.cdsCIA
      LookupField = 'CIAID'
      Options = [loColLines, loTitles]
      DropDownCount = 15
      MaxLength = 2
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcCIAExit
      OnNotInList = dblcCIANotInList
    end
    object dbeCIA: TEdit
      Left = 135
      Top = 9
      Width = 269
      Height = 23
      Enabled = False
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 424
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Seleccionar'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
  end
end
