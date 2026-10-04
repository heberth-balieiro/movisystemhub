object FrameQuestaoTextoLongo: TFrameQuestaoTextoLongo
  Left = 0
  Top = 0
  Width = 636
  Height = 150
  TabOrder = 0
  object lblPreview: TLabel
    Left = 8
    Top = 3
    Width = 130
    Height = 15
    Caption = 'Resposta do participante'
  end
  object memPreview: TcxMemo
    Left = 8
    Top = 19
    Lines.Strings = (
      'Texto de resposta')
    StyleFocused.BorderColor = clNavy
    StyleFocused.Color = 15855596
    TabOrder = 0
    Height = 128
    Width = 625
  end
end
