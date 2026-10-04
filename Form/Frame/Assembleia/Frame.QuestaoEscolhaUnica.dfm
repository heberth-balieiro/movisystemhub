object FrameQuestaoEscolhaUnica: TFrameQuestaoEscolhaUnica
  Left = 0
  Top = 0
  Width = 636
  Height = 150
  TabOrder = 0
  object pnlRodape: TPanel
    Left = 0
    Top = 110
    Width = 636
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentShowHint = False
    ShowCaption = False
    ShowHint = False
    TabOrder = 0
    object btnAdicionarOpcao: TStyledBitBtn
      Left = 9
      Top = 6
      Width = 130
      Height = 27
      Caption = '+ Adicionar op'#231#227'o'
      TabOrder = 0
      OnClick = btnAdicionarOpcaoClick
      StyleFamily = 'Angular-Light'
      StyleClass = 'Indigo'
    end
  end
  object ScrollOpcoes: TScrollBox
    Left = 0
    Top = 0
    Width = 636
    Height = 110
    Align = alClient
    BorderStyle = bsNone
    ParentBackground = True
    TabOrder = 1
    object FlowOpcoes: TFlowPanel
      Left = 0
      Top = 0
      Width = 636
      Height = 1
      Align = alTop
      BevelOuter = bvNone
      FlowStyle = fsTopBottomLeftRight
      TabOrder = 0
    end
  end
end
