inherited FrmEmailCad: TFrmEmailCad
  Caption = 'email'
  ClientHeight = 350
  Color = clWhite
  OnShow = FormShow
  ExplicitHeight = 350
  TextHeight = 17
  object Label27: TLabel [0]
    Left = 8
    Top = 328
    Width = 159
    Height = 34
    Caption = 'Campo com * s'#227'o campos obrigat'#243'rios'
    WordWrap = True
  end
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
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 778
      ExplicitHeight = 358
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 9
      Width = 90
      Height = 17
      Caption = 'Servidor SMTP '
      Color = 5325111
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5325111
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel [2]
      Left = 523
      Top = 9
      Width = 31
      Height = 17
      Caption = 'Porta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5325111
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel [3]
      Left = 8
      Top = 58
      Width = 36
      Height = 17
      Caption = 'E-mail'
      Color = 5325111
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5325111
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label4: TLabel [4]
      Left = 523
      Top = 58
      Width = 35
      Height = 17
      Caption = 'Senha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5325111
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel [5]
      Left = 8
      Top = 107
      Width = 114
      Height = 17
      Caption = 'Mensagem prontas'
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
      Top = 237
      OnClick = BtnSalvarClick
      ExplicitTop = 237
    end
    inherited BtnCancelar: TStyledBitBtn
      Top = 237
      OnClick = BtnCancelarClick
      ExplicitTop = 237
    end
    object edtssl: TcxCheckBox
      Left = 535
      Top = 129
      Caption = 'SSL'
      ParentFont = False
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'F'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'F'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = 5325111
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      StyleFocused.Color = 15855596
      TabOrder = 2
    end
    object edttls: TcxCheckBox
      Left = 584
      Top = 129
      Caption = 'TLS'
      ParentFont = False
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'F'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'F'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = 5325111
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      StyleFocused.Color = 15855596
      TabOrder = 3
    end
    object MemoResult: TMemo
      Left = 12
      Top = 216
      Width = 71
      Height = 25
      Lines.Strings = (
        'MemoRes'
        'ult')
      TabOrder = 4
      Visible = False
    end
    object Button1: TButton
      Left = 12
      Top = 216
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 5
      Visible = False
      OnClick = Button1Click
    end
    object btnIncluir: TcxButton
      Left = 8
      Top = 156
      Width = 80
      Height = 25
      Cursor = crHandPoint
      Hint = 'Enviar email de teste.'
      Caption = 'Teste'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000001974455874536F6674776172650041646F626520496D616765526561
        647971C9653C0000000B744558745469746C650053656E643B7DA4ADD7000000
        8749444154785EA592C10980300C45B3A0EB780CC4251CC111F4D2D96223B644
        3F81D01E1E21D0F70AA5A4AA53CC0796ED2A151DA0B4802D362529CA7B5E7D80
        5B2429F3270091840C018CC43204E208CA71000F13EE1DC100DEC4FF7D3D76AA
        D87C223609647C13933CDA222EE064E495006E8113250C0470EABF07B254281B
        E8787934207EBF012F526C54A11F477D0000000049454E44AE426082}
      TabOrder = 6
      OnClick = btnIncluirClick
    end
    object cxsmtp: TcxTextEdit
      Left = 8
      Top = 27
      Cursor = crIBeam
      Properties.ClearKey = 16452
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 7
      Width = 515
    end
    object cxPorta: TcxTextEdit
      Left = 523
      Top = 27
      Cursor = crIBeam
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 8
      OnKeyPress = cxPortaKeyPress
      Width = 118
    end
    object cxEmail: TcxTextEdit
      Left = 8
      Top = 76
      Cursor = crIBeam
      Properties.ClearKey = 16452
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 9
      Width = 515
    end
    object cxSenha: TcxTextEdit
      Left = 523
      Top = 76
      Cursor = crIBeam
      Properties.ClearKey = 16452
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '*'
      Properties.ShowPasswordRevealButton = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 10
      Width = 118
    end
    object cxMsgpronta: TcxLookupComboBox
      Left = 8
      Top = 125
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.KeyFieldNames = 'id_mensagem'
      Properties.ListColumns = <
        item
          Caption = 'Mensagem'
          Width = 590
          FieldName = 'npesquisa'
        end>
      Properties.ListSource = Ds
      EditValue = 0
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 11
      Width = 515
    end
  end
  inherited Paneltitulo: TPanel
    TabOrder = 1
    ExplicitWidth = 644
    inherited lblTitulo: TLabel
      ExplicitWidth = 729
    end
    inherited BtnFechar: TSpeedButton
      ExplicitLeft = 744
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 456
    Top = 10
  end
  inherited Ds: TUniDataSource
    DataSet = TabMensagem
    Left = 184
    Top = 224
  end
  inherited cxStyle: TcxStyleRepository
    Left = 487
    Top = 7
    PixelsPerInch = 96
    inherited CxGridPedido: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    inherited GridTableDependente: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
  object ACBrMail1: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 388
    Top = 7
  end
  object TabMensagem: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD01000000180000000400000000000300000079000B69645F
      6D656E736167656D040001000000000006636F6469676F040001000000000009
      64657363726963616F010049000000010005574944544802000200B400096E70
      65737175697361010049000000010005574944544802000200C8000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 226
    object TabMensagemid_mensagem: TIntegerField
      FieldName = 'id_mensagem'
    end
    object TabMensagemcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabMensagemdescricao: TStringField
      FieldName = 'descricao'
      Size = 180
    end
    object TabMensagemnpesquisa: TStringField
      FieldName = 'npesquisa'
      Size = 200
    end
  end
end
