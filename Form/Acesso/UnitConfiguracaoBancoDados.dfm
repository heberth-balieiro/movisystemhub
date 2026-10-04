inherited FrmConfiguracaoBancodados: TFrmConfiguracaoBancodados
  Caption = 'Configura'#231#227'o'
  ClientHeight = 344
  ClientWidth = 334
  Color = clWhite
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 334
  ExplicitHeight = 344
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 319
    Width = 334
    TabOrder = 0
    ExplicitTop = 493
    ExplicitWidth = 673
  end
  inherited PanelClient: TPanel
    Width = 334
    Height = 279
    TabOrder = 1
    ExplicitTop = 43
    ExplicitWidth = 673
    ExplicitHeight = 453
    object Label7: TLabel
      Left = 4
      Top = 6
      Width = 47
      Height = 17
      Caption = 'DriverID'
    end
    object Label8: TLabel
      Left = 4
      Top = 55
      Width = 37
      Height = 17
      Caption = 'Server'
    end
    object Label9: TLabel
      Left = 4
      Top = 151
      Width = 45
      Height = 17
      Caption = 'Usu'#225'rio'
    end
    object Label10: TLabel
      Left = 4
      Top = 104
      Width = 96
      Height = 17
      Caption = 'Banco de Dados'
    end
    object Label11: TLabel
      Left = 4
      Top = 196
      Width = 35
      Height = 17
      Caption = 'Senha'
    end
    object edtDriver: TcxTextEdit
      Left = 4
      Top = 24
      Properties.ClearKey = 16452
      Properties.ReadOnly = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 0
      Width = 325
    end
    object edtserver: TcxTextEdit
      Left = 4
      Top = 73
      Properties.ClearKey = 16452
      Properties.ReadOnly = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 1
      Width = 325
    end
    object edtbanco: TcxTextEdit
      Left = 4
      Top = 122
      Properties.ClearKey = 16452
      Properties.ReadOnly = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 2
      Width = 325
    end
    object edtUsuario: TcxTextEdit
      Left = 4
      Top = 169
      Properties.ClearKey = 16452
      Properties.ReadOnly = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 3
      Width = 325
    end
    object edtsenha: TcxTextEdit
      Left = 4
      Top = 214
      Properties.ClearKey = 16452
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '*'
      Properties.ReadOnly = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 4
      Width = 325
    end
    object BtnSalvar: TStyledBitBtn
      Left = 108
      Top = 241
      Width = 110
      Height = 35
      Caption = 'Salvar | F5'
      TabOrder = 5
      OnClick = BtnSalvarClick
      StyleFamily = 'Bootstrap'
      StyleClass = 'Success'
    end
    object BtnCancelar: TStyledBitBtn
      Left = 219
      Top = 241
      Width = 110
      Height = 35
      Caption = 'Cancelar | ESC'
      TabOrder = 6
      OnClick = BtnCancelarClick
      StyleFamily = 'Bootstrap'
      StyleClass = 'Danger'
    end
  end
  inherited Paneltitulo: TPanel
    Width = 334
    TabOrder = 2
    ExplicitWidth = 673
    inherited lblTitulo: TLabel
      Width = 279
      ExplicitLeft = 31
      ExplicitTop = 8
      ExplicitWidth = 618
    end
    inherited BtnFechar: TSpeedButton
      Left = 294
    end
  end
  inherited cxStyle: TcxStyleRepository
    Left = 239
    Top = 7
    PixelsPerInch = 96
    inherited CxGridPedido: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    inherited GridTableDependente: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
  object cxLookAndFeelController1: TcxLookAndFeelController
    NativeStyle = False
    ScrollbarMode = sbmHybrid
    SkinName = 'Office2019Colorful'
    Left = 194
    Top = 136
  end
end
