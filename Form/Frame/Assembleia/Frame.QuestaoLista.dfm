object FrameQuestaoLista: TFrameQuestaoLista
  Left = 0
  Top = 0
  Width = 640
  Height = 150
  Color = clWhite
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object pnlRodape: TPanel
    Left = 0
    Top = 110
    Width = 640
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
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
    Width = 640
    Height = 110
    Align = alClient
    BorderStyle = bsNone
    TabOrder = 1
    object FlowOpcoes: TFlowPanel
      Left = 0
      Top = 0
      Width = 640
      Height = 1
      Align = alTop
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 0
    end
  end
end
