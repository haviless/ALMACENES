object FCierreO: TFCierreO
  Left = 27
  Top = 222
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Cierre Operativo de Almac'#233'n'
  ClientHeight = 495
  ClientWidth = 436
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 15
  object pcCierre: TPageControl
    Left = 0
    Top = 145
    Width = 436
    Height = 309
    ActivePage = tsCierre
    Align = alBottom
    HotTrack = True
    TabOrder = 0
    object tsCierre: TTabSheet
      Caption = 'Cierre'
      object Bevel1: TBevel
        Left = 0
        Top = 0
        Width = 428
        Height = 279
        Align = alClient
        Shape = bsFrame
      end
      object Label1: TLabel
        Left = 33
        Top = 222
        Width = 57
        Height = 15
        Caption = 'Frecuencia'
      end
      object Label3: TLabel
        Left = 122
        Top = 222
        Width = 119
        Height = 15
        Caption = 'Fecha Inicial de Cierre'
      end
      object Label4: TLabel
        Left = 267
        Top = 222
        Width = 109
        Height = 15
        Caption = 'Fecha Final de Cierre'
      end
      object pnlDA: TPanel
        Left = 8
        Top = 6
        Width = 414
        Height = 210
        BevelInner = bvLowered
        BevelWidth = 2
        Color = 12904163
        TabOrder = 0
        object lblCIA: TLabel
          Left = 12
          Top = 10
          Width = 49
          Height = 15
          Caption = 'Compa'#241#237'a'
        end
        object Label2: TLabel
          Left = 12
          Top = 155
          Width = 43
          Height = 15
          Caption = 'Almac'#233'n'
        end
        object Label6: TLabel
          Left = 12
          Top = 55
          Width = 49
          Height = 15
          Caption = 'Localidad'
        end
        object Label5: TLabel
          Left = 12
          Top = 105
          Width = 68
          Height = 15
          Caption = 'T. Inventario'
        end
        object dbeALM: TwwDBEdit
          Left = 72
          Top = 175
          Width = 330
          Height = 23
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 7
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeCIA: TwwDBEdit
          Left = 72
          Top = 30
          Width = 330
          Height = 23
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeLOC: TwwDBEdit
          Left = 72
          Top = 75
          Width = 330
          Height = 23
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dblcCIA: TwwDBLookupCombo
          Left = 12
          Top = 30
          Width = 55
          Height = 23
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'CIAID'#9'2'#9'C'#243'digo'#9'F'
            'CIAABR'#9'15'#9'Abreviatura'#9'F')
          DataField = 'CIAID'
          LookupTable = DMALM.cdsCIA
          LookupField = 'CIAID'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
          OnExit = dblcCIAExit
          OnNotInList = dblcNotInList
        end
        object dblcLOC: TwwDBLookupCombo
          Left = 12
          Top = 75
          Width = 55
          Height = 23
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'LOCID'#9'2'#9'C'#243'digo'#9'F'
            'LOCABR'#9'10'#9'Abreviatura'#9'F')
          DataField = 'LOCID'
          LookupTable = DMALM.cdsLOC
          LookupField = 'LOCID'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
          OnEnter = dblcLOCEnter
          OnExit = dblcLOCExit
          OnNotInList = dblcNotInList
        end
        object dblcALM: TwwDBLookupCombo
          Left = 12
          Top = 175
          Width = 55
          Height = 23
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'ALMID'#9'2'#9'C'#243'digo'#9'F'
            'ALMABR'#9'15'#9'Abreviatura'#9'F')
          DataField = 'ALMID'
          LookupTable = DMALM.cdsALM
          LookupField = 'ALMID'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 6
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
          OnEnter = dblcALMEnter
          OnExit = dblcALMExit
          OnNotInList = dblcNotInList
        end
        object dblcTIN: TwwDBLookupCombo
          Left = 12
          Top = 125
          Width = 55
          Height = 23
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TINID'#9'3'#9'Tipo Inventario'#9'F'
            'TINDES'#9'40'#9'Descripci'#243'n'#9'F')
          DataField = 'TINID'
          LookupTable = DMALM.cdsTINID
          LookupField = 'TINID'
          Options = [loColLines, loTitles]
          DropDownCount = 18
          MaxLength = 2
          TabOrder = 4
          AutoDropDown = False
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
          OnEnter = dblcTINEnter
          OnExit = dblcTINExit
          OnNotInList = dblcNotInList
        end
        object dbeTIN: TEdit
          Left = 72
          Top = 125
          Width = 330
          Height = 23
          Enabled = False
          TabOrder = 5
        end
      end
      object dbeFrecu: TwwDBEdit
        Left = 33
        Top = 242
        Width = 56
        Height = 23
        DataField = 'CNSFRECU'
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeFrecuExit
      end
      object dbeUltFec: TwwDBEdit
        Left = 122
        Top = 242
        Width = 105
        Height = 23
        DataField = 'CNSULTCIE'
        Enabled = False
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeActFec: TwwDBEdit
        Left = 267
        Top = 242
        Width = 105
        Height = 23
        Enabled = False
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 454
    Width = 436
    Height = 41
    Align = alBottom
    Color = 10207162
    TabOrder = 1
    object Z2bbtnRegOk: TBitBtn
      Left = 282
      Top = 7
      Width = 30
      Height = 28
      Hint = 'Confirma Actualizaci'#243'n'
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
      Left = 326
      Top = 7
      Width = 30
      Height = 28
      Hint = 'Cancela Actualizaci'#243'n'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Z2bbtnRegCancClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
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
    object Z2bbtnSalir: TBitBtn
      Left = 368
      Top = 7
      Width = 30
      Height = 28
      Hint = 'Salir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'Garamond'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
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
  end
  object wwDBGrid1: TwwDBGrid
    Left = 0
    Top = 0
    Width = 436
    Height = 145
    DisableThemesInTitle = False
    Selected.Strings = (
      'CIAID'#9'3'#9'Cia'
      'LOCID'#9'3'#9'Loc'
      'TINID'#9'4'#9'Tipo~Inv.'
      'ALMID'#9'3'#9'Alm'
      'CNSFRECU'#9'10'#9'Frecuencia'
      'CNSPRICIE'#9'13'#9'Primer Cierre'
      'CNSULTCIE'#9'14'#9'Ultimo Cierre')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alClient
    DataSource = DMALM.dsCierre
    KeyOptions = []
    ReadOnly = True
    TabOrder = 2
    TitleAlignment = taCenter
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clNavy
    TitleFont.Height = -11
    TitleFont.Name = 'Comic Sans MS'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    UseTFields = False
    OnCalcCellColors = wwDBGrid1CalcCellColors
  end
end
