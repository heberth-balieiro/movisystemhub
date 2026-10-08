inherited FrmAssociadoProcessarAtualizacao: TFrmAssociadoProcessarAtualizacao
  Caption = 'Processar Atualiza'#231#227'o Cadastral'
  ClientHeight = 665
  ClientWidth = 684
  OnShow = FormShow
  ExplicitWidth = 684
  ExplicitHeight = 665
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 637
    Width = 678
    ExplicitWidth = 678
  end
  inherited PanelClient: TPanel
    Width = 684
    Height = 594
    ExplicitWidth = 684
    inherited dxBevel1: TdxBevel
      Left = 14
      Top = 404
      Width = 97
      Height = 46
      Align = alNone
      Visible = False
      ExplicitLeft = 14
      ExplicitTop = 404
      ExplicitWidth = 97
      ExplicitHeight = 46
    end
    inherited BtnSalvar: TStyledBitBtn
      Left = 460
      Top = 556
      ExplicitLeft = 460
      ExplicitTop = 556
    end
    inherited BtnCancelar: TStyledBitBtn
      Left = 571
      Top = 556
      ExplicitLeft = 571
      ExplicitTop = 556
    end
    object cxGroupBox1: TcxGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Align = alTop
      Caption = 'Dados da solicita'#231#227'o'
      ParentBackground = False
      Style.TextStyle = []
      TabOrder = 2
      Height = 128
      Width = 678
      object lbsituacao: TLabel
        Left = 5
        Top = 19
        Width = 12
        Height = 17
        Caption = 'ID'
      end
      object Label8: TLabel
        Left = 141
        Top = 19
        Width = 54
        Height = 17
        Caption = 'Matr'#237'cula'
      end
      object Label10: TLabel
        Left = 220
        Top = 19
        Width = 36
        Height = 17
        Caption = 'Nome'
      end
      object Label23: TLabel
        Left = 556
        Top = 19
        Width = 21
        Height = 17
        Caption = 'CPF'
      end
      object Label15: TLabel
        Left = 5
        Top = 68
        Width = 40
        Height = 17
        Caption = 'Celular'
      end
      object Label16: TLabel
        Left = 102
        Top = 68
        Width = 60
        Height = 17
        Caption = 'WhatsApp'
      end
      object Label17: TLabel
        Left = 201
        Top = 68
        Width = 36
        Height = 17
        Caption = 'E-mail'
      end
      object Label9: TLabel
        Left = 72
        Top = 19
        Width = 34
        Height = 17
        Caption = 'ID API'
      end
      object Label1: TLabel
        Left = 556
        Top = 68
        Width = 49
        Height = 17
        Caption = 'Situa'#231#227'o'
      end
      object cxid: TcxTextEdit
        Left = 5
        Top = 37
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 0
        Width = 68
      end
      object cxmatricula: TcxTextEdit
        Left = 141
        Top = 37
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 1
        Width = 80
      end
      object cxnome: TcxTextEdit
        Left = 220
        Top = 37
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.MaxLength = 150
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 2
        Width = 337
      end
      object cxcpf: TcxButtonEdit
        Left = 556
        Top = 37
        Cursor = crIBeam
        Properties.Buttons = <
          item
            Default = True
            Glyph.SourceDPI = 96
            Glyph.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              610000001974455874536F6674776172650041646F626520496D616765526561
              647971C9653C00000011744558745469746C6500446F776E3B4172726F773BBD
              FC82580000021E49444154785E6591316814411885BF99DDBD530435510B0BC3
              555E95144A8C46F48AEBA2A43016F65A182CB4104CAF9D8D6550B4B2B4508895
              0A625288A26050E4AC0425C110C9C588DEEDEECCEFF90FC31679ECEE3FF398FF
              EDFBE799B987CB2F8DB52D2F20FA0A4E40BCE009A4F75AF08272225016F9E2FD
              2B13EDF47F73FBD821D0C328C4104E0736D05E79A50B272C2C7E3D0524A90079
              E1F8F0FD37C1016050886EA23691A4797057DC9B543C7CFAB2C6FAAF1C412058
              0551ABCA89AE4DA840BFBB151549F76EAC327BAEC5DFBE0BA43188F794AED406
              630C6992626CB405F52CE1F6FCB3E0C0791F6C63102318449BEF2C7488B83AD5
              24AB6720AA1FEEC27B6DB2DEABADF0B79884F3ACAC6C70E6EC513A9D55BC4477
              5552DE4910709A110A2F425114F4F2FEA03ADEAD09CE09BD5E9FBC9F23311901
              ED03AC739A2C106C3D78FA911BF7DE52964ED3C952CBF5F937DC7DB23CE04A84
              00EF258EE0ABAC314C4F8ED0FDB1CEE1F649F24268B627D95AFFC9F956036B6D
              8CB7BA03E784A860AC65FFF01E2E4D8FF2FAF10B7AA51FD4E7CCCE8C313CB41B
              6393102FA61A411D082132046B138E1F69307AC0F079E93DE32375C6C71A2469
              169A0540AA1182928041950D50ABD5B97CE10443DD6F5C9C99A056DF01860815
              F11204527141354BACE61B3E967D83516E5D9B22491275054284203111493737
              375FCDDD7C745A88EA02FA5491C5855021EFFF59020A03EC0432C0B21DC1F876
              085000BD7F8CA0608FE53C7C9B0000000049454E44AE426082}
            Kind = bkGlyph
            Visible = False
          end>
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.EditMask = '999\.999\.999\-99;1;_'
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 3
        Text = '   .   .   -  '
        Width = 117
      end
      object cxtelefone: TcxMaskEdit
        Left = 5
        Top = 86
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.EditMask = '!\(99\)9999-9999;1;_'
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 4
        Text = '(  )    -    '
        Width = 98
      end
      object cxwhatsapp: TcxMaskEdit
        Left = 102
        Top = 86
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.EditMask = '!\(99\)99999-9999;1;_'
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 5
        Text = '(  )     -    '
        Width = 100
      end
      object cxemail: TcxTextEdit
        Left = 201
        Top = 86
        Properties.ClearKey = 16452
        Properties.MaxLength = 180
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 6
        Width = 356
      end
      object cxidapi: TcxTextEdit
        Left = 72
        Top = 37
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 7
        Width = 70
      end
      object cxsituacao: TcxTextEdit
        Left = 556
        Top = 86
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 8
        Width = 117
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 3
      Top = 134
      Caption = 'Dados atuais do associado'
      ParentBackground = False
      Style.TextStyle = []
      TabOrder = 3
      Height = 317
      Width = 338
      object Label2: TLabel
        Left = 15
        Top = 29
        Width = 36
        Height = 17
        Caption = 'E-mail'
      end
      object Label3: TLabel
        Left = 15
        Top = 60
        Width = 40
        Height = 17
        Caption = 'Celular'
      end
      object Label4: TLabel
        Left = 15
        Top = 91
        Width = 60
        Height = 17
        Caption = 'WhatsApp'
      end
      object Label5: TLabel
        Left = 15
        Top = 122
        Width = 22
        Height = 17
        Caption = 'CEP'
      end
      object Label6: TLabel
        Left = 15
        Top = 153
        Width = 55
        Height = 17
        Caption = 'Endere'#231'o'
      end
      object Label7: TLabel
        Left = 15
        Top = 184
        Width = 48
        Height = 17
        Caption = 'N'#250'mero'
      end
      object Label11: TLabel
        Left = 15
        Top = 215
        Width = 35
        Height = 17
        Caption = 'Bairro'
      end
      object Label12: TLabel
        Left = 15
        Top = 246
        Width = 82
        Height = 17
        Caption = 'Complemento'
      end
      object Label13: TLabel
        Left = 15
        Top = 277
        Width = 41
        Height = 17
        Caption = 'Cidade'
      end
      object cxTextEdit3: TcxTextEdit
        Left = 114
        Top = 25
        Properties.ClearKey = 16452
        Properties.MaxLength = 180
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 0
        Width = 220
      end
      object cxTextEdit4: TcxTextEdit
        Left = 114
        Top = 56
        Properties.ClearKey = 16452
        Properties.MaxLength = 180
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 1
        Width = 220
      end
      object cxTextEdit5: TcxTextEdit
        Left = 114
        Top = 87
        Properties.ClearKey = 16452
        Properties.MaxLength = 180
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 2
        Width = 220
      end
      object cxTextEdit6: TcxTextEdit
        Left = 114
        Top = 118
        Properties.ClearKey = 16452
        Properties.MaxLength = 180
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 3
        Width = 220
      end
      object cxTextEdit7: TcxTextEdit
        Left = 114
        Top = 149
        Properties.ClearKey = 16452
        Properties.MaxLength = 180
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 4
        Width = 220
      end
      object cxTextEdit8: TcxTextEdit
        Left = 114
        Top = 180
        Properties.ClearKey = 16452
        Properties.MaxLength = 180
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 5
        Width = 220
      end
      object cxTextEdit9: TcxTextEdit
        Left = 114
        Top = 211
        Properties.ClearKey = 16452
        Properties.MaxLength = 180
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 6
        Width = 220
      end
      object cxTextEdit10: TcxTextEdit
        Left = 114
        Top = 242
        Properties.ClearKey = 16452
        Properties.MaxLength = 180
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 7
        Width = 220
      end
      object cxTextEdit11: TcxTextEdit
        Left = 114
        Top = 273
        Properties.ClearKey = 16452
        Properties.MaxLength = 180
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 8
        Width = 220
      end
    end
    object cxGroupBox4: TcxGroupBox
      Left = 343
      Top = 134
      Caption = 'Novos dados (Solicitados via Web)'
      ParentBackground = False
      Style.TextStyle = []
      TabOrder = 4
      Height = 317
      Width = 338
      object Label14: TLabel
        Left = 15
        Top = 29
        Width = 36
        Height = 17
        Caption = 'E-mail'
      end
      object Label18: TLabel
        Left = 15
        Top = 60
        Width = 40
        Height = 17
        Caption = 'Celular'
      end
      object Label19: TLabel
        Left = 15
        Top = 91
        Width = 60
        Height = 17
        Caption = 'WhatsApp'
      end
      object Label20: TLabel
        Left = 15
        Top = 122
        Width = 22
        Height = 17
        Caption = 'CEP'
      end
      object Label21: TLabel
        Left = 15
        Top = 153
        Width = 55
        Height = 17
        Caption = 'Endere'#231'o'
      end
      object Label22: TLabel
        Left = 15
        Top = 184
        Width = 48
        Height = 17
        Caption = 'N'#250'mero'
      end
      object Label24: TLabel
        Left = 15
        Top = 215
        Width = 35
        Height = 17
        Caption = 'Bairro'
      end
      object Label25: TLabel
        Left = 15
        Top = 246
        Width = 82
        Height = 17
        Caption = 'Complemento'
      end
      object Label26: TLabel
        Left = 15
        Top = 277
        Width = 41
        Height = 17
        Caption = 'Cidade'
      end
      object cxemailnovo: TcxTextEdit
        Left = 114
        Top = 25
        Properties.ClearKey = 16452
        Properties.MaxLength = 180
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 0
        Width = 220
      end
      object cxCelularnovo: TcxTextEdit
        Left = 114
        Top = 56
        Properties.ClearKey = 16452
        Properties.MaxLength = 180
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 1
        Width = 220
      end
      object cxwhatsapp_novo: TcxTextEdit
        Left = 114
        Top = 87
        Properties.ClearKey = 16452
        Properties.MaxLength = 180
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 2
        Width = 220
      end
      object cxcepnovo: TcxTextEdit
        Left = 114
        Top = 118
        Properties.ClearKey = 16452
        Properties.MaxLength = 180
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 3
        Width = 220
      end
      object cxendereconovo: TcxTextEdit
        Left = 114
        Top = 149
        Properties.ClearKey = 16452
        Properties.MaxLength = 180
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 4
        Width = 220
      end
      object cxnumeronovo: TcxTextEdit
        Left = 114
        Top = 180
        Properties.ClearKey = 16452
        Properties.MaxLength = 180
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 5
        Width = 220
      end
      object cxBairroNovo: TcxTextEdit
        Left = 114
        Top = 211
        Properties.ClearKey = 16452
        Properties.MaxLength = 180
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 6
        Width = 220
      end
      object cxcomplementonovo: TcxTextEdit
        Left = 114
        Top = 242
        Properties.ClearKey = 16452
        Properties.MaxLength = 180
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 7
        Width = 220
      end
      object cxcidadenovo: TcxTextEdit
        Left = 114
        Top = 273
        Properties.ClearKey = 16452
        Properties.MaxLength = 180
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 8
        Width = 220
      end
    end
    object cxGroupBox3: TcxGroupBox
      Left = 3
      Top = 454
      Caption = 'observa'#231#245'es / Erro'
      ParentBackground = False
      Style.TextStyle = []
      TabOrder = 5
      Height = 96
      Width = 678
      object cxobs: TcxMemo
        Left = 4
        Top = 21
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 0
        Height = 57
        Width = 670
      end
    end
    object BtnRejeitar: TStyledBitBtn
      Left = 3
      Top = 556
      Width = 110
      Height = 35
      Caption = 'Rejeitar | F6'
      TabOrder = 6
      StyleFamily = 'Bootstrap'
      StyleClass = 'Secondary'
    end
    object BtnErro: TStyledBitBtn
      Left = 114
      Top = 556
      Width = 110
      Height = 35
      Caption = 'Erro | F10'
      TabOrder = 7
      StyleFamily = 'Bootstrap'
      StyleClass = 'Warning'
    end
    object BtnPesquisarAssociado: TStyledBitBtn
      Left = 225
      Top = 556
      Width = 110
      Height = 35
      Caption = 'Pesquisar | F7'
      TabOrder = 8
      StyleFamily = 'Bootstrap'
    end
  end
  inherited Paneltitulo: TPanel
    Width = 678
    ExplicitWidth = 678
    inherited lblTitulo: TLabel
      Width = 623
      ExplicitWidth = 623
    end
    inherited BtnFechar: TSpeedButton
      Left = 638
      ExplicitLeft = 638
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 360
    Top = 65530
  end
  inherited Ds: TUniDataSource
    Left = 328
    Top = 65528
  end
  inherited cxStyle: TcxStyleRepository
    Left = 255
    Top = 65527
    PixelsPerInch = 96
    inherited CxGridPedido: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    inherited GridTableDependente: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
end
