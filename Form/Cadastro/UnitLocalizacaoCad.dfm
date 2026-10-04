inherited FrmLocalizacaoCad: TFrmLocalizacaoCad
  Caption = 'Localiza'#231#227'o'
  ClientHeight = 471
  Color = clWhite
  OnShow = FormShow
  ExplicitHeight = 471
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 443
    TabOrder = 2
    ExplicitTop = 443
    ExplicitWidth = 644
  end
  inherited PanelClient: TPanel
    Height = 400
    TabOrder = 0
    ExplicitHeight = 400
    inherited dxBevel1: TdxBevel
      Height = 394
      ExplicitHeight = 400
    end
    object Label3: TLabel [1]
      Left = 81
      Top = 10
      Width = 57
      Height = 17
      Caption = 'Descri'#231#227'o'
      Color = 8679796
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5325111
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      StyleName = 'Windows'
    end
    object Label2: TLabel [2]
      Left = 9
      Top = 10
      Width = 43
      Height = 17
      Caption = 'C'#243'digo'
      Color = 8679796
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5325111
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      StyleName = 'Windows'
    end
    inherited BtnSalvar: TStyledBitBtn
      Top = 358
      OnClick = BtnSalvarClick
      ExplicitTop = 358
    end
    inherited BtnCancelar: TStyledBitBtn
      Top = 358
      OnClick = BtnCancelarClick
      ExplicitTop = 358
    end
    object cxDescricao: TcxTextEdit
      Left = 81
      Top = 28
      Cursor = crIBeam
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 2
      Width = 560
    end
    object cxCodigo: TcxTextEdit
      Left = 9
      Top = 28
      TabStop = False
      Properties.ReadOnly = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 3
      Width = 73
    end
    object cxAtivo: TcxCheckBox
      Left = 9
      Top = 59
      Caption = 'Ativo'
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.DisplayGrayed = 'S'
      Properties.ImmediatePost = True
      Properties.ValueChecked = 'S'
      Properties.ValueGrayed = 'N'
      Properties.ValueUnchecked = 'N'
      State = cbsChecked
      Style.TransparentBorder = False
      StyleFocused.Color = 15855596
      TabOrder = 4
      Transparent = True
    end
  end
  inherited Paneltitulo: TPanel
    TabOrder = 1
    ExplicitWidth = 644
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 408
    Top = 178
  end
  inherited Ds: TUniDataSource
    Left = 376
    Top = 176
  end
end
