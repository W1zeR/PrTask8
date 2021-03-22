object FOut: TFOut
  Left = 769
  Top = 484
  BorderStyle = bsDialog
  Caption = #1054#1090#1074#1077#1090
  ClientHeight = 355
  ClientWidth = 684
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    684
    355)
  PixelsPerInch = 96
  TextHeight = 19
  object Output: TStringGrid
    Left = 17
    Top = 28
    Width = 64
    Height = 24
    Anchors = []
    BorderStyle = bsNone
    ColCount = 1
    Enabled = False
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    ScrollBars = ssNone
    TabOrder = 0
  end
  object OK: TButton
    Left = 297
    Top = 304
    Width = 89
    Height = 33
    Caption = 'OK'
    TabOrder = 1
    OnClick = OKClick
  end
  object SaveRes: TSaveDialog
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099'|*.txt'
    Left = 8
    Top = 320
  end
end
