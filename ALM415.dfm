object FToolConAnno: TFToolConAnno
  Left = 168
  Top = 475
  Width = 812
  Height = 99
  Caption = 'FToolConAnno'
  Color = 14869218
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 15
  object pnlTool: TPanel
    Left = 0
    Top = 0
    Width = 796
    Height = 61
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BorderStyle = bsSingle
    Color = 12904163
    TabOrder = 0
    object pnlCabecera: TPanel
      Left = 4
      Top = 4
      Width = 889
      Height = 61
      Color = 14869218
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 12
        Width = 49
        Height = 15
        Caption = 'Compa'#241#237'a'
      end
      object Label2: TLabel
        Left = 221
        Top = 12
        Width = 91
        Height = 15
        Caption = 'L'#237'nea de Producto'
      end
      object Label3: TLabel
        Left = 70
        Top = 12
        Width = 49
        Height = 15
        Caption = 'Localidad'
      end
      object Label4: TLabel
        Left = 134
        Top = 12
        Width = 68
        Height = 15
        Caption = 'T. Inventario'
      end
      object bbtOk: TBitBtn
        Left = 506
        Top = 16
        Width = 36
        Height = 35
        TabOrder = 5
        OnClick = bbtOkClick
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
      object dblcCia: TwwDBLookupCombo
        Left = 8
        Top = 30
        Width = 53
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CIAID'#9'2'#9'Compa'#241#237'a'#9'F'
          'CIADES'#9'40'#9'Descripci'#243'n'#9'F')
        LookupTable = DMALM.cdsCIA
        LookupField = 'CIAID'
        Options = [loTitles]
        DropDownCount = 15
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        SearchDelay = 2
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcCiaExit
      end
      object dblcGrpArti: TwwDBLookupCombo
        Left = 221
        Top = 30
        Width = 68
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'GRARID'#9'2'#9'Grupo'#9'F'
          'GRARDES'#9'40'#9'Descripcion'#9'F'
          'GRARABR'#9'15'#9'Abreviatura'#9'F')
        LookupTable = DMALM.cdsGArti
        LookupField = 'GRARID'
        Options = [loTitles]
        TabOrder = 3
        AutoDropDown = False
        ShowButton = True
        SearchDelay = 2
        PreciseEditRegion = False
        AllowClearKey = False
      end
      object rgPeriodo: TRadioGroup
        Left = 338
        Top = 11
        Width = 151
        Height = 41
        Caption = 'Periodo'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Anual'
          'Mensual')
        TabOrder = 4
      end
      object dblcLocalidad: TwwDBLookupCombo
        Left = 70
        Top = 30
        Width = 49
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'LOCID'#9'2'#9'Localidad'#9'F'
          'LOCDES'#9'30'#9'Descripci'#243'n'#9'F'
          'LOCABR'#9'10'#9'Abreviatura'#9'F')
        LookupTable = DMALM.cdsLOC
        LookupField = 'LOCID'
        Options = [loTitles]
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        SearchDelay = 2
        PreciseEditRegion = False
        AllowClearKey = False
      end
      object dblcTipInv: TwwDBLookupCombo
        Left = 134
        Top = 30
        Width = 67
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TINID'#9'2'#9'Inventario'#9'F'
          'TINDES'#9'40'#9'Descripci'#243'n'#9'F'
          'TINABR'#9'15'#9'Abreviatura'#9'F')
        LookupTable = DMALM.cdsTINID
        LookupField = 'TINID'
        Options = [loTitles]
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        SearchDelay = 2
        UseTFields = False
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcTipInvExit
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 588
    Top = 20
  end
end
