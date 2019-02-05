object fraCiaAlmLoc: TfraCiaAlmLoc
  Left = 0
  Top = 0
  Width = 287
  Height = 191
  Color = 12904163
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  ParentColor = False
  ParentFont = False
  TabOrder = 0
  object lblCIA: TLabel
    Left = 6
    Top = 5
    Width = 49
    Height = 15
    Caption = '&Compañía'
    FocusControl = dblcCIA
  end
  object Label2: TLabel
    Left = 6
    Top = 121
    Width = 43
    Height = 15
    Caption = '&Almacén'
    FocusControl = dblcALM
  end
  object Label6: TLabel
    Left = 6
    Top = 46
    Width = 49
    Height = 15
    Caption = '&Localidad'
  end
  object Label1: TLabel
    Left = 6
    Top = 84
    Width = 94
    Height = 15
    Caption = '&Tipo de inventario'
    FocusControl = dblcTIN
  end
  object dblcCIA: TwwDBLookupCombo
    Left = 6
    Top = 22
    Width = 49
    Height = 23
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'CIAID'#9'2'#9'ID'#9'F'
      'CIADES'#9'40'#9'Compañia'#9'F')
    LookupTable = DM1.cdsCIA
    LookupField = 'CIAID'
    Options = [loColLines, loTitles]
    MaxLength = 2
    TabOrder = 0
    AutoDropDown = False
    ShowButton = True
    AllowClearKey = False
    OnChange = dblcCIAChange
    OnExit = dblcCIAExit
  end
  object dblcALM: TwwDBLookupCombo
    Left = 6
    Top = 135
    Width = 49
    Height = 23
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'ALMID'#9'2'#9'ID'#9'F'
      'ALMDES'#9'40'#9'Almacen'#9'F')
    LookupTable = DM1.cdsALM
    LookupField = 'ALMID'
    Options = [loColLines, loTitles]
    MaxLength = 2
    TabOrder = 6
    AutoDropDown = False
    ShowButton = True
    AllowClearKey = False
    OnExit = dblcALMExit
  end
  object edtCia: TEdit
    Left = 56
    Top = 22
    Width = 200
    Height = 23
    Enabled = False
    ReadOnly = True
    TabOrder = 1
  end
  object edtLOC: TEdit
    Left = 56
    Top = 60
    Width = 200
    Height = 23
    Enabled = False
    ReadOnly = True
    TabOrder = 3
  end
  object edtALM: TEdit
    Left = 56
    Top = 135
    Width = 200
    Height = 23
    Enabled = False
    ReadOnly = True
    TabOrder = 7
  end
  object dblcLOC: TwwDBLookupCombo
    Left = 6
    Top = 60
    Width = 49
    Height = 23
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'LOCID'#9'2'#9'ID'#9'F'
      'LOCDES'#9'30'#9'Localidad'#9'F')
    LookupTable = DM1.cdsLOC
    LookupField = 'LOCID'
    Options = [loTitles]
    TabOrder = 2
    AutoDropDown = False
    ShowButton = True
    AllowClearKey = False
    OnExit = dblcLOCExit
  end
  object dblcTIN: TwwDBLookupCombo
    Left = 6
    Top = 98
    Width = 49
    Height = 23
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'TINID'#9'2'#9'Codigo'#9'F'
      'TINDES'#9'28'#9'Descripcion'#9'F')
    LookupTable = DM1.cdsTINID
    LookupField = 'TINID'
    Options = [loColLines, loTitles]
    MaxLength = 2
    TabOrder = 4
    AutoDropDown = False
    ShowButton = True
    AllowClearKey = False
    OnExit = dblcTINExit
  end
  object edtTin: TEdit
    Left = 56
    Top = 98
    Width = 200
    Height = 23
    Enabled = False
    ReadOnly = True
    TabOrder = 5
  end
end
