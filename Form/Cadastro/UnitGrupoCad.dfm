inherited FrmGrupoCad: TFrmGrupoCad
  Caption = 'Grupo'
  ClientHeight = 350
  Color = clWhite
  OnShow = FormShow
  ExplicitHeight = 350
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 322
    TabOrder = 2
    ExplicitTop = 322
    ExplicitWidth = 644
  end
  inherited PanelClient: TPanel
    Height = 279
    TabOrder = 0
    ExplicitHeight = 279
    inherited dxBevel1: TdxBevel
      Height = 273
      ExplicitHeight = 279
    end
    object Label1: TLabel [1]
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
    object Label3: TLabel [2]
      Left = 98
      Top = 10
      Width = 37
      Height = 17
      Caption = 'Grupo'
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
      Top = 236
      TabOrder = 3
      OnClick = BtnSalvarClick
      ExplicitTop = 236
    end
    inherited BtnCancelar: TStyledBitBtn
      Top = 236
      TabOrder = 4
      OnClick = BtnCancelarClick
      ExplicitTop = 236
    end
    object cxCodigo: TcxTextEdit
      Left = 9
      Top = 28
      TabStop = False
      Properties.ReadOnly = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 0
      OnKeyPress = cxCodigoKeyPress
      Width = 90
    end
    object cxGrupo: TcxTextEdit
      Left = 98
      Top = 28
      Cursor = crIBeam
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 1
      Width = 543
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
      TabOrder = 2
      Transparent = True
    end
  end
  inherited Paneltitulo: TPanel
    TabOrder = 1
    ExplicitWidth = 644
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 592
    Top = 226
  end
  inherited Ds: TUniDataSource
    Left = 592
    Top = 192
  end
  inherited cxStyle: TcxStyleRepository
    PixelsPerInch = 96
    inherited CxGridPedido: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    inherited GridTableDependente: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
end
