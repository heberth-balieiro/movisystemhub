inherited FrmContasCad: TFrmContasCad
  Caption = 'Contas'
  ClientHeight = 350
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
      ExplicitHeight = 279
    end
    object Label7: TLabel [1]
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
    object Label8: TLabel [2]
      Left = 98
      Top = 10
      Width = 35
      Height = 17
      Caption = 'Banco'
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
    object Label9: TLabel [3]
      Left = 9
      Top = 59
      Width = 33
      Height = 17
      Caption = 'Saldo'
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
    object Label10: TLabel [4]
      Left = 257
      Top = 10
      Width = 46
      Height = 17
      Caption = 'Ag'#234'ncia'
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
    object Label11: TLabel [5]
      Left = 336
      Top = 10
      Width = 34
      Height = 17
      Caption = 'Conta'
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
    object Label12: TLabel [6]
      Left = 415
      Top = 10
      Width = 64
      Height = 17
      Caption = 'Correntista'
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
    object Label13: TLabel [7]
      Left = 98
      Top = 59
      Width = 84
      Height = 17
      Caption = 'Data do Saldo'
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
      TabOrder = 8
      OnClick = BtnSalvarClick
      ExplicitTop = 237
    end
    inherited BtnCancelar: TStyledBitBtn
      Top = 237
      TabOrder = 9
      OnClick = BtnCancelarClick
      ExplicitTop = 237
    end
    object cxCodigo: TcxTextEdit
      Left = 9
      Top = 28
      TabStop = False
      Properties.ReadOnly = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 0
      Width = 90
    end
    object cxCorrentista: TcxTextEdit
      Left = 415
      Top = 28
      Cursor = crIBeam
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 4
      Width = 226
    end
    object cxBanco: TcxTextEdit
      Left = 98
      Top = 28
      Cursor = crIBeam
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 1
      Width = 160
    end
    object cxAgencia: TcxTextEdit
      Left = 257
      Top = 28
      Cursor = crIBeam
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 2
      OnKeyPress = cxAgenciaKeyPress
      Width = 80
    end
    object cxConta: TcxTextEdit
      Left = 336
      Top = 28
      Cursor = crIBeam
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 3
      OnKeyPress = cxContaKeyPress
      Width = 80
    end
    object cxdatasaldo: TcxDateEdit
      Left = 98
      Top = 77
      Cursor = crIBeam
      Properties.ButtonGlyph.SourceDPI = 96
      Properties.ButtonGlyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000001974455874536F6674776172650041646F626520496D616765526561
        647971C9653C00000014744558745469746C6500446174653B43616C656E6461
        723BDF38D8A6000001D149444154785E8553316E5341107D9B7C5120C325C046
        5434544E1C51240484284002F9021C818A2E4A68728470015A44811134360810
        4D2863B80305C2B2FEDFDDC9BC99FD76EC26238FDF9BD99DB733BBFA1580A0BE
        A9BE81A505ACDA7A5ED4B37AAC583C7EF6F8B32AECE49C91B38028EA89313D39
        1762F23D758C93E1F79FBB265005ECDC7EF210102FD60A20298F1192C8135254
        54CF91EB11DFDE7D1AB0D646C822B671FEE7CC05929FCA9C903B2EF866E71ACF
        A2858A206CBBAE917862B4F61553C1568CF9926B14252F04C2AFA787E80FEFE0
        6A9DFD9AD89112515C31F17969EFDF9E023FEEBA40E4A95E4737A384FF4A24C1
        30247F8BA621412B10EDB4AC3EFAFADBAAF6B6BAF8A89CF9FDED2E3E8CA7B6FE
        E85E0FB42280CA83B603E17D14CED98DF9D3724DC8DB0E2EDC41533AE0FEDD7E
        17C222F2AD1BB63B59473729AC5C108402F182409D7CFE2CF8FBEA858D70FDF5
        0946638E23B83FE861349982B6AF3C6CAC0930A0401984291FC554513ACA248A
        BCC8B07A07B5065C4819E81C9C9402C1DE36C76111B48B5B2EA04108405CDE81
        07FE8462B834293D052E4281CCC49BB8EC20CE66FF262F8F46038817F85F21C2
        9265BEE5F5FCFF170205E66F8E9F3F50BCB2F619874B3EE79AB5E71DE48B3460
        34A2F10000000049454E44AE426082}
      Properties.ClearKey = 16452
      Properties.DateButtons = []
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 6
      Width = 127
    end
    object cxSaldo: TcxCurrencyEdit
      Left = 9
      Top = 77
      Cursor = crIBeam
      Properties.ClearKey = 16452
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 5
      Width = 90
    end
    object cxAtivo: TcxCheckBox
      Left = 231
      Top = 81
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
      TabOrder = 7
      Transparent = True
    end
  end
  inherited Paneltitulo: TPanel
    ExplicitWidth = 644
    inherited lblTitulo: TLabel
      Caption = 'Nova Conta'
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 584
    Top = 2
  end
  inherited Ds: TUniDataSource
    Left = 512
    Top = 0
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
