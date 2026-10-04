inherited FrmAlterarSenha: TFrmAlterarSenha
  Caption = 'Alterar Senha'
  ClientHeight = 251
  ClientWidth = 372
  OnShow = FormShow
  ExplicitWidth = 372
  ExplicitHeight = 251
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 226
    Width = 372
    ExplicitTop = 226
    ExplicitWidth = 372
  end
  inherited PanelClient: TPanel
    Width = 372
    Height = 186
    ExplicitWidth = 372
    ExplicitHeight = 186
    object Label12: TLabel
      Left = 2
      Top = 2
      Width = 67
      Height = 17
      Caption = 'Senha atual'
    end
    object Label1: TLabel
      Left = 2
      Top = 51
      Width = 69
      Height = 17
      Caption = 'Nova senha'
    end
    object Label2: TLabel
      Left = 2
      Top = 100
      Width = 96
      Height = 17
      Caption = 'Confirmar senha'
    end
    object cxSenha: TcxTextEdit
      Left = 2
      Top = 20
      Cursor = crIBeam
      Properties.ClearKey = 16452
      Properties.EchoMode = eemPassword
      Properties.MaxLength = 250
      Properties.PasswordChar = '*'
      Properties.ShowPasswordRevealButton = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 0
      Width = 369
    end
    object cxNova: TcxTextEdit
      Left = 2
      Top = 69
      Cursor = crIBeam
      Properties.ClearKey = 16452
      Properties.EchoMode = eemPassword
      Properties.MaxLength = 250
      Properties.PasswordChar = '*'
      Properties.ShowPasswordRevealButton = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 1
      Width = 369
    end
    object cxconfirma: TcxTextEdit
      Left = 2
      Top = 118
      Cursor = crIBeam
      Properties.ClearKey = 16452
      Properties.EchoMode = eemPassword
      Properties.MaxLength = 250
      Properties.PasswordChar = '*'
      Properties.ShowPasswordRevealButton = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 2
      Width = 369
    end
    object BtnSalvar: TStyledBitBtn
      Left = 150
      Top = 149
      Width = 110
      Height = 35
      Caption = 'Salvar | F5'
      TabOrder = 3
      OnClick = BtnSalvarClick
      StyleFamily = 'Bootstrap'
      StyleClass = 'Success'
    end
    object BtnCancelar: TStyledBitBtn
      Left = 261
      Top = 149
      Width = 110
      Height = 35
      Caption = 'Cancelar | ESC'
      TabOrder = 4
      OnClick = BtnCancelarClick
      StyleFamily = 'Bootstrap'
      StyleClass = 'Danger'
    end
  end
  inherited Paneltitulo: TPanel
    Width = 372
    ExplicitWidth = 372
    inherited lblTitulo: TLabel
      Width = 317
      Caption = 'Alterar Senha'
      ExplicitWidth = 232
    end
    inherited BtnFechar: TSpeedButton
      Left = 332
      ExplicitLeft = 332
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 264
    Top = 65530
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
