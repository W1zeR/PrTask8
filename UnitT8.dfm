object MainForm: TMainForm
  Left = 398
  Top = 248
  Width = 800
  Height = 600
  ActiveControl = StrE
  Caption = 'PrTask8'
  Color = clActiveBorder
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = Menu
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnActivate = FormActivate
  DesignSize = (
    784
    542)
  PixelsPerInch = 96
  TextHeight = 13
  object Str: TLabel
    Left = 63
    Top = 55
    Width = 103
    Height = 23
    Alignment = taCenter
    Caption = #1050#1086#1083'-'#1074#1086' '#1089#1090#1088#1086#1082
    Color = clWhite
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Stb: TLabel
    Left = 415
    Top = 55
    Width = 133
    Height = 23
    Caption = #1050#1086#1083'-'#1074#1086' '#1089#1090#1086#1083#1073#1094#1086#1074
    Color = clWhite
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object StrE: TSpinEdit
    Left = 239
    Top = 52
    Width = 50
    Height = 29
    EditorEnabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    MaxValue = 10
    MinValue = 1
    ParentFont = False
    TabOrder = 0
    Value = 1
    OnChange = StrEChange
  end
  object StbE: TSpinEdit
    Left = 592
    Top = 52
    Width = 50
    Height = 29
    EditorEnabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    MaxValue = 10
    MinValue = 1
    ParentFont = False
    TabOrder = 1
    Value = 1
    OnChange = StbEChange
  end
  object Grid: TStringGrid
    Left = 67
    Top = 146
    Width = 64
    Height = 24
    Anchors = []
    BorderStyle = bsNone
    ColCount = 1
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 2
    Visible = False
    OnKeyPress = GridKeyPress
  end
  object Open: TOpenDialog
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099'|*.txt|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Left = 16
    Top = 504
  end
  object Save: TSaveDialog
    FileName = 'C:\Users\Tolik\Desktop\PrTask17\gg'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099'|*.txt'
    Left = 56
    Top = 504
  end
  object Menu: TMainMenu
    Left = 96
    Top = 504
    object Fail: TMenuItem
      Caption = #1060#1072#1081#1083
      object Openn: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100'...'
        OnClick = OpennClick
      end
      object Savee: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1086#1090#1074#1077#1090' '#1074' '#1086#1090#1082#1088#1090#1099#1081' '#1092#1072#1081#1083
        OnClick = SaveeClick
      end
      object SaveAs: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082'...'
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1092#1072#1081#1083' '#1076#1083#1103' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' '#1086#1090#1074#1077#1090#1072
        OnClick = SaveAsClick
      end
      object Exitt: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = ExittClick
      end
    end
    object Prog: TMenuItem
      Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072
      object Comp: TMenuItem
        Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
        OnClick = CompClick
      end
      object ClearWin: TMenuItem
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1086#1082#1085#1086' '#1074#1074#1086#1076#1072
        OnClick = ClearWinClick
      end
    end
    object HelpMe: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      OnClick = HelpMeClick
    end
  end
end
