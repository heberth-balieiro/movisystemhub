object FrameHistoricoTimelineItem: TFrameHistoricoTimelineItem
  Left = 0
  Top = 0
  Width = 650
  Height = 118
  Color = clWhite
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object shpLinha: TShape
    Left = 38
    Top = 0
    Width = 2
    Height = 118
    Brush.Color = clSilver
    Pen.Style = psClear
  end
  object shpCirculo: TShape
    Left = 22
    Top = 22
    Width = 34
    Height = 34
    Brush.Color = clGreen
    Pen.Color = clGreen
    Shape = stCircle
  end
  object pnlCard: TPanel
    Left = 76
    Top = 8
    Width = 571
    Height = 98
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 16
      Top = 12
      Width = 168
      Height = 17
      Caption = 'CADASTRO DE ASSOCIADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDescricao: TLabel
      Left = 16
      Top = 38
      Width = 200
      Height = 17
      Caption = 'Associado cadastrado no sistema.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblDataUsuario: TLabel
      Left = 16
      Top = 70
      Width = 276
      Height = 15
      Caption = 'Data: 10/01/2022 09:15:23   |   Usu'#225'rio: Administrador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblSituacao: TLabel
      Left = 452
      Top = 10
      Width = 110
      Height = 24
      Alignment = taCenter
      AutoSize = False
      Caption = 'ATIVO'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object btnVisualizar: TSpeedButton
      Left = 452
      Top = 36
      Width = 110
      Height = 28
      Caption = 'Visualizar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnVisualizarClick
    end
    object lblDataAssociado: TLabel
      Left = 466
      Top = 70
      Width = 93
      Height = 15
      Caption = 'In'#237'cio: 10/01/2022'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
end
