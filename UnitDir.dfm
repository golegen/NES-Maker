object Dir: TDir
  Left = 597
  Top = 194
  BorderStyle = bsSingle
  Caption = #36873#25321#24037#31243#38598#36335#24452
  ClientHeight = 366
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 305
    Height = 17
    AutoSize = False
    Caption = #36873#25321#24037#31243#38598#30340#26681#36335#24452#21363#21487#12290#19981#36873#39033#30446#36335#24452#12290
  end
  object Button1: TButton
    Left = 120
    Top = 336
    Width = 75
    Height = 25
    Caption = #30830#35748
    TabOrder = 0
    OnClick = Button1Click
  end
  object ShellTreeView1: TShellTreeView
    Left = 16
    Top = 32
    Width = 305
    Height = 297
    ObjectTypes = [otFolders]
    Root = 'rfDesktop'
    UseShellImages = True
    AutoRefresh = False
    Indent = 19
    ParentColor = False
    RightClickSelect = True
    ShowRoot = False
    TabOrder = 1
  end
end
