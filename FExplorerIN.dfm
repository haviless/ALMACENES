object FExplorer: TFExplorer
  Left = 228
  Top = 229
  Width = 696
  Height = 480
  Caption = 'FExplorer'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTextoSQL: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 73
    Align = alTop
    TabOrder = 0
    object reTextoSQL: TwwDBRichEdit
      Left = 1
      Top = 1
      Width = 632
      Height = 71
      Align = alClient
      AutoURLDetect = False
      PrintJobName = 'Delphi 5'
      TabOrder = 0
      EditorCaption = 'Edit Rich Text'
      EditorPosition.Left = 0
      EditorPosition.Top = 0
      EditorPosition.Width = 0
      EditorPosition.Height = 0
      MeasurementUnits = muInches
      PrintMargins.Top = 1.000000000000000000
      PrintMargins.Bottom = 1.000000000000000000
      PrintMargins.Left = 1.000000000000000000
      PrintMargins.Right = 1.000000000000000000
      PrintHeader.VertMargin = 0.500000000000000000
      PrintHeader.Font.Charset = DEFAULT_CHARSET
      PrintHeader.Font.Color = clWindowText
      PrintHeader.Font.Height = -11
      PrintHeader.Font.Name = 'MS Sans Serif'
      PrintHeader.Font.Style = []
      PrintFooter.VertMargin = 0.500000000000000000
      PrintFooter.Font.Charset = DEFAULT_CHARSET
      PrintFooter.Font.Color = clWindowText
      PrintFooter.Font.Height = -11
      PrintFooter.Font.Name = 'MS Sans Serif'
      PrintFooter.Font.Style = []
      RichEditVersion = 2
      Data = {
        7F0000007B5C727466315C616E73695C616E7369637067313235325C64656666
        305C6465666C616E6731303235307B5C666F6E7474626C7B5C66305C666E696C
        204D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C7563
        315C706172645C66305C66733136207265546578746F53514C5C7061720D0A7D
        0D0A00}
    end
    object pnlBotones: TPanel
      Left = 633
      Top = 1
      Width = 54
      Height = 71
      Align = alRight
      TabOrder = 1
      object sbEjecuta: TSpeedButton
        Left = 13
        Top = 8
        Width = 28
        Height = 28
        Hint = 'Ejecuta SQL'
        Glyph.Data = {
          06020000424D0602000000000000760000002800000019000000190000000100
          04000000000090010000C40E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888880000000F7777777777777777777777780000000F77777777777
          77777777777780000000F7777777777777777777777780000000F77777777708
          77777777777780000000F7777777778087777777777780000000F77777777770
          08777777777780000000F77777777770B0877777777780000000F77777777000
          0B087777777780000000F777777770BBFBB08777777780000000F7777777770F
          B0000777777780000000F7777777770BFB087777777780000000F77777700000
          BFB08777777780000000F7777770FBFBFBFB0877777780000000F77777770FBF
          B0000777777780000000F77777770BFBFB087777777780000000F777777770BF
          BFB08777777780000000F777777770FFFBFF0877777780000000F7777777770F
          BFFBF087777780000000F7777777770000000007777780000000F77777777777
          77777777777780000000F7777777777777777777777780000000F77777777777
          77777777777780000000F7777777777777777777777780000000FFFFFFFFFFFF
          FFFFFFFFFFFF80000000}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbEjecutaClick
      end
    end
  end
  object pnlResultados: TPanel
    Left = 0
    Top = 73
    Width = 688
    Height = 373
    Align = alClient
    TabOrder = 1
    object dbgSQL: TwwDBGrid
      Left = 8
      Top = 24
      Width = 409
      Height = 260
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
    object pnlControles: TPanel
      Left = 1
      Top = 331
      Width = 686
      Height = 41
      Align = alBottom
      TabOrder = 1
      object bbtnGridAlign: TBitBtn
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Alinea Grid'
        TabOrder = 0
        OnClick = bbtnGridAlignClick
      end
      object dbnSQL: TwwDBNavigator
        Left = 272
        Top = 8
        Width = 350
        Height = 25
        RepeatInterval.InitialDelay = 500
        RepeatInterval.Interval = 100
        object dbnSQLFirst: TwwNavButton
          Left = 0
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Move to first record'
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'dbnSQLFirst'
          Enabled = False
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 0
          Style = nbsFirst
        end
        object dbnSQLPriorPage: TwwNavButton
          Left = 25
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Move backward 10 records'
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'dbnSQLPriorPage'
          Enabled = False
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 1
          Style = nbsPriorPage
        end
        object dbnSQLPrior: TwwNavButton
          Left = 50
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Move to prior record'
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'dbnSQLPrior'
          Enabled = False
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 2
          Style = nbsPrior
        end
        object dbnSQLNext: TwwNavButton
          Left = 75
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Move to next record'
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'dbnSQLNext'
          Enabled = False
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 3
          Style = nbsNext
        end
        object dbnSQLNextPage: TwwNavButton
          Left = 100
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Move forward 10 records'
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'dbnSQLNextPage'
          Enabled = False
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 4
          Style = nbsNextPage
        end
        object dbnSQLLast: TwwNavButton
          Left = 125
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Move to last record'
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'dbnSQLLast'
          Enabled = False
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 5
          Style = nbsLast
        end
        object dbnSQLInsert: TwwNavButton
          Left = 150
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Insert new record'
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'dbnSQLInsert'
          Enabled = False
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 6
          Style = nbsInsert
        end
        object dbnSQLDelete: TwwNavButton
          Left = 175
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Delete current record'
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'dbnSQLDelete'
          Enabled = False
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 7
          Style = nbsDelete
        end
        object dbnSQLEdit: TwwNavButton
          Left = 200
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Edit current record'
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'dbnSQLEdit'
          Enabled = False
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 8
          Style = nbsEdit
        end
        object dbnSQLPost: TwwNavButton
          Left = 225
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Post changes of current record'
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'dbnSQLPost'
          Enabled = False
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 9
          Style = nbsPost
        end
        object dbnSQLCancel: TwwNavButton
          Left = 250
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Cancel changes made to current record'
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'dbnSQLCancel'
          Enabled = False
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 10
          Style = nbsCancel
        end
        object dbnSQLRefresh: TwwNavButton
          Left = 275
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Refresh the contents of the dataset'
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'dbnSQLRefresh'
          Enabled = False
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 11
          Style = nbsRefresh
        end
        object dbnSQLSaveBookmark: TwwNavButton
          Left = 300
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Bookmark current record'
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'dbnSQLSaveBookmark'
          Enabled = False
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 12
          Style = nbsSaveBookmark
        end
        object dbnSQLRestoreBookmark: TwwNavButton
          Left = 325
          Top = 0
          Width = 25
          Height = 25
          Hint = 'Go back to saved bookmark'
          ImageIndex = -1
          NumGlyphs = 2
          Spacing = 4
          Transparent = False
          Caption = 'dbnSQLRestoreBookmark'
          Enabled = False
          DisabledTextColors.ShadeColor = clGray
          DisabledTextColors.HighlightColor = clBtnHighlight
          Index = 13
          Style = nbsRestoreBookmark
        end
      end
    end
  end
end
