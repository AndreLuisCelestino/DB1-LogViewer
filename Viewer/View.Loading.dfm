object fLoading: TfLoading
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Carregando...'
  ClientHeight = 60
  ClientWidth = 270
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PanelLoading: TPanel
    Left = 0
    Top = 0
    Width = 270
    Height = 60
    Align = alClient
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 0
    object LabelMessage: TLabel
      Left = 2
      Top = 11
      Width = 260
      Height = 32
      Align = alCustom
      Alignment = taCenter
      AutoSize = False
      Caption = 'Carregando...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
end
