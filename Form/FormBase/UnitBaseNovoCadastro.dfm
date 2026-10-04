inherited FormNovoBaseCadastro: TFormNovoBaseCadastro
  Caption = 'FormNovoBaseCadastro'
  ClientHeight = 600
  ClientWidth = 650
  ExplicitWidth = 650
  ExplicitHeight = 600
  TextHeight = 17
  inherited PanelButton: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 572
    Width = 644
    Margins.Top = 0
    Color = 6576709
    ExplicitLeft = 3
    ExplicitTop = 572
    ExplicitWidth = 644
  end
  inherited PanelClient: TPanel
    Top = 43
    Width = 650
    Height = 529
    Margins.Top = 0
    Margins.Bottom = 0
    ExplicitTop = 43
    ExplicitWidth = 650
    ExplicitHeight = 529
    object dxBevel1: TdxBevel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 644
      Height = 523
      Align = alClient
      ExplicitLeft = 6
      ExplicitTop = 0
      ExplicitHeight = 529
    end
    object BtnSalvar: TStyledBitBtn
      Left = 420
      Top = 491
      Width = 110
      Height = 35
      Caption = 'Salvar | F5'
      TabOrder = 0
      StyleFamily = 'Bootstrap'
      StyleClass = 'Success'
    end
    object BtnCancelar: TStyledBitBtn
      Left = 531
      Top = 491
      Width = 110
      Height = 35
      Caption = 'Cancelar | ESC'
      TabOrder = 1
      TabStop = False
      StyleFamily = 'Bootstrap'
      StyleClass = 'Danger'
    end
  end
  inherited Paneltitulo: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 644
    Margins.Bottom = 0
    Color = 5781541
    ExplicitLeft = 3
    ExplicitTop = 3
    ExplicitWidth = 644
    inherited lblTitulo: TLabel
      Width = 589
      ExplicitWidth = 595
    end
    inherited BtnFechar: TSpeedButton
      Left = 604
      ExplicitLeft = 610
    end
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
