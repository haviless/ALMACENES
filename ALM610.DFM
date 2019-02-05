object fraGrpFamSubfam: TfraGrpFamSubfam
  Left = 0
  Top = 0
  Width = 269
  Height = 174
  Color = 12904163
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  ParentColor = False
  ParentFont = False
  TabOrder = 0
  object Label1: TLabel
    Left = 0
    Top = 40
    Width = 71
    Height = 15
    Caption = '&Linea o Grupo'
    FocusControl = dblcGArti
  end
  object Label2: TLabel
    Left = 0
    Top = 80
    Width = 37
    Height = 15
    Caption = '&Familia'
    FocusControl = dblcFAM
  end
  object Label3: TLabel
    Left = 0
    Top = 120
    Width = 63
    Height = 15
    Caption = '&Sub  Familia'
    FocusControl = dblcSUBFAM
  end
  object Label4: TLabel
    Left = 0
    Top = 0
    Width = 96
    Height = 15
    Caption = 'Tipo de Inventario'
  end
  object dblcGArti: TwwDBLookupCombo
    Left = 0
    Top = 56
    Width = 49
    Height = 23
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'GRARID'#9'15'#9'ID'#9'F'
      'GRARDES'#9'40'#9'Linea o Grupo de Articulos'#9'F')
    LookupTable = DM1.cdsGArti
    LookupField = 'GRARID'
    Options = [loColLines, loTitles]
    Enabled = False
    TabOrder = 1
    AutoDropDown = False
    ShowButton = True
    AllowClearKey = False
    OnChange = dblcGArtiChange
    OnExit = dblcGArtiExit
  end
  object dblcFAM: TwwDBLookupCombo
    Left = 0
    Top = 96
    Width = 49
    Height = 23
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'FAMID'#9'3'#9'ID'#9'F'
      'FAMDES'#9'40'#9'Familia'#9'F')
    LookupTable = DM1.cdsFAM
    LookupField = 'FAMID'
    Options = [loColLines, loTitles]
    Enabled = False
    TabOrder = 3
    AutoDropDown = False
    ShowButton = True
    AllowClearKey = False
    OnChange = dblcFAMChange
    OnExit = dblcFAMExit
  end
  object dblcSUBFAM: TwwDBLookupCombo
    Left = 0
    Top = 136
    Width = 49
    Height = 23
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'SFAMID'#9'3'#9'ID'#9'F'
      'SFAMDES'#9'40'#9'Sub Familia'#9'F')
    LookupTable = DM1.cdsSUBFAM
    LookupField = 'SFAMID'
    Options = [loColLines, loTitles]
    Enabled = False
    TabOrder = 5
    AutoDropDown = False
    ShowButton = True
    AllowClearKey = False
    OnExit = dblcSUBFAMExit
  end
  object edtGArti: TEdit
    Left = 51
    Top = 56
    Width = 200
    Height = 23
    Enabled = False
    TabOrder = 2
  end
  object edtFAM: TEdit
    Left = 51
    Top = 96
    Width = 200
    Height = 23
    Enabled = False
    TabOrder = 4
  end
  object edtSUBFAM: TEdit
    Left = 51
    Top = 136
    Width = 200
    Height = 23
    Enabled = False
    TabOrder = 6
  end
  object edtTINID: TEdit
    Left = 51
    Top = 16
    Width = 200
    Height = 23
    Enabled = False
    TabOrder = 0
  end
  object dblcTINID: TwwDBLookupCombo
    Left = 0
    Top = 16
    Width = 49
    Height = 23
    DropDownAlignment = taLeftJustify
    LookupTable = DM1.cdsTINID
    LookupField = 'TINID'
    Options = [loColLines, loTitles]
    Enabled = False
    TabOrder = 7
    AutoDropDown = False
    ShowButton = True
    AllowClearKey = False
    OnChange = dblcTINIDChange
    OnExit = dblcTINIDExit
  end
end
