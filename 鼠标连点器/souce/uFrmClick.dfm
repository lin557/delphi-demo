object FrmClick: TFrmClick
  Left = 756
  Top = 353
  Caption = #40736#26631#36830#28857#22120' v0.1'
  ClientHeight = 120
  ClientWidth = 292
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object PnlMain: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 286
    Height = 114
    Align = alClient
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = -2
    object LblSpeed: TLabel
      Left = 10
      Top = 10
      Width = 93
      Height = 15
      Caption = #36895#24230': 10.00 '#27425'/'#31186
    end
    object Label2: TLabel
      Left = 182
      Top = 10
      Width = 88
      Height = 15
      Caption = #25353'F11'#24320#21551'/'#20851#38381
    end
    object TrackSpeed: TTrackBar
      Left = 10
      Top = 30
      Width = 260
      Height = 41
      Max = 1000
      Min = 10
      Position = 100
      PositionToolTip = ptLeft
      ShowSelRange = False
      TabOrder = 0
      TickMarks = tmBoth
      TickStyle = tsManual
      OnChange = TrackSpeedChange
    end
    object RadioOne: TRadioButton
      Left = 10
      Top = 80
      Width = 50
      Height = 17
      Caption = #21333#20987
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object RadioDouble: TRadioButton
      Left = 80
      Top = 80
      Width = 50
      Height = 17
      Caption = #21452#20987
      TabOrder = 2
    end
  end
end
