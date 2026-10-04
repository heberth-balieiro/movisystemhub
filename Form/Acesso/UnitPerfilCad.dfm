inherited FrmPerfilCad: TFrmPerfilCad
  Caption = 'Perfil'
  ClientHeight = 350
  Color = clWhite
  OnShow = FormShow
  ExplicitHeight = 350
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 322
    ExplicitTop = 322
    ExplicitWidth = 644
  end
  inherited PanelClient: TPanel
    Height = 279
    ExplicitHeight = 279
    inherited dxBevel1: TdxBevel
      Height = 273
    end
    object Label5: TLabel [1]
      Left = 6
      Top = 6
      Width = 43
      Height = 17
      Caption = 'C'#243'digo'
    end
    object Label22: TLabel [2]
      Left = 65
      Top = 6
      Width = 57
      Height = 17
      Caption = 'Descri'#231#227'o'
    end
    inherited BtnSalvar: TStyledBitBtn
      Left = 423
      Top = 237
      TabOrder = 3
      OnClick = BtnSalvarClick
      ExplicitLeft = 423
      ExplicitTop = 237
    end
    inherited BtnCancelar: TStyledBitBtn
      Left = 534
      Top = 237
      TabOrder = 4
      OnClick = BtnCancelarClick
      ExplicitLeft = 534
      ExplicitTop = 237
    end
    object cxcodigo: TcxTextEdit
      Left = 6
      Top = 24
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.ReadOnly = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 0
      Width = 60
    end
    object cxnome: TcxTextEdit
      Left = 65
      Top = 24
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.MaxLength = 60
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 1
      Width = 579
    end
    object cxativo: TcxCheckBox
      Left = 6
      Top = 55
      Caption = 'Ativo'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      State = cbsChecked
      Style.TransparentBorder = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 2
      Transparent = True
    end
  end
  inherited Paneltitulo: TPanel
    ExplicitWidth = 644
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 360
    Top = 10
  end
  inherited Ds: TUniDataSource
    Left = 328
    Top = 8
  end
end
