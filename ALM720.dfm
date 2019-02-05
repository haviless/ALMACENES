object FToolMantParRepos: TFToolMantParRepos
  Left = 260
  Top = 576
  Width = 786
  Height = 70
  BorderIcons = [biSystemMenu]
  Caption = 'FToolMantParRepos'
  Color = 14869218
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object cb1: TControlBar
    Left = 0
    Top = 0
    Width = 753
    Height = 38
    Align = alTop
    TabOrder = 0
    object spbAct: TSpeedButton
      Left = 552
      Top = 2
      Width = 110
      Height = 22
      GroupIndex = 1
      Caption = 'Actualizac.General'
      OnClick = spbActClick
    end
    object spbNor: TSpeedButton
      Left = 429
      Top = 2
      Width = 110
      Height = 22
      GroupIndex = 1
      Caption = 'Normal'
    end
    object ToolBar2: TToolBar
      Left = 11
      Top = 2
      Width = 405
      Height = 48
      Align = alClient
      TabOrder = 0
      object spb1: TSpeedButton
        Left = 0
        Top = 2
        Width = 145
        Height = 22
        GroupIndex = 1
        Caption = 'Par'#225'metros de Reposici'#243'n'
        Visible = False
      end
      object spb2: TSpeedButton
        Left = 145
        Top = 2
        Width = 145
        Height = 22
        GroupIndex = 1
        Caption = 'Actualizaci'#243'n de Ubicaci'#243'n'
      end
      object spb3: TSpeedButton
        Left = 290
        Top = 2
        Width = 110
        Height = 22
        GroupIndex = 1
        Caption = 'Saldos Iniciales'
        Visible = False
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 680
    Top = 8
  end
end
