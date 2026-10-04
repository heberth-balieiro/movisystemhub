inherited FrmEleicaoCad: TFrmEleicaoCad
  Caption = 'Eleicao'
  ClientHeight = 350
  Color = clWhite
  OnShow = FormShow
  ExplicitHeight = 350
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 322
    ExplicitTop = 322
  end
  inherited PanelClient: TPanel
    Height = 279
    ExplicitHeight = 279
    inherited dxBevel1: TdxBevel
      Height = 273
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitHeight = 273
    end
    object Label20: TLabel [1]
      Left = 5
      Top = 8
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
    object Label22: TLabel [2]
      Left = 183
      Top = 8
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
    object Label1: TLabel [3]
      Left = 396
      Top = 106
      Width = 71
      Height = 17
      Caption = 'Modalidade'
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
    object Label2: TLabel [4]
      Left = 5
      Top = 57
      Width = 51
      Height = 17
      Caption = 'Entidade'
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
    object Label3: TLabel [5]
      Left = 496
      Top = 57
      Width = 57
      Height = 17
      Caption = 'Ano Inicio'
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
    object Label5: TLabel [6]
      Left = 5
      Top = 106
      Width = 66
      Height = 17
      Caption = 'Respos'#225'vel'
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
    object Label6: TLabel [7]
      Left = 5
      Top = 155
      Width = 70
      Height = 17
      Caption = 'Observa'#231#227'o'
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
    object Label7: TLabel [8]
      Left = 520
      Top = 106
      Width = 35
      Height = 17
      Caption = 'Status'
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
    object Label8: TLabel [9]
      Left = 570
      Top = 57
      Width = 43
      Height = 17
      Caption = 'AnoFim'
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
    object Label9: TLabel [10]
      Left = 84
      Top = 8
      Width = 81
      Height = 17
      Caption = 'Data abertura'
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
    object Label4: TLabel [11]
      Left = 299
      Top = 106
      Width = 86
      Height = 17
      Caption = 'Tipo opera'#231#227'o'
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
      Left = 424
      Top = 239
      TabOrder = 11
      OnClick = BtnSalvarClick
      ExplicitLeft = 424
      ExplicitTop = 239
    end
    inherited BtnCancelar: TStyledBitBtn
      Left = 535
      Top = 239
      TabOrder = 12
      OnClick = BtnCancelarClick
      ExplicitLeft = 535
      ExplicitTop = 239
    end
    object cxCodigo: TcxTextEdit
      Left = 5
      Top = 26
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.ReadOnly = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 0
      Width = 80
    end
    object cxdescricao: TcxTextEdit
      Left = 183
      Top = 26
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.MaxLength = 90
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 2
      Width = 462
    end
    object cxtipo: TcxComboBox
      Left = 396
      Top = 124
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Nenhum'
        'Chapa'
        'Presidente'
        'Comiss'#227'o'
        'Conselho'
        'Mista')
      Properties.ReadOnly = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 8
      Text = 'NENHUM'
      Width = 125
    end
    object cxempresa: TcxLookupComboBox
      Left = 5
      Top = 75
      Cursor = crIBeam
      Properties.Alignment.Horz = taLeftJustify
      Properties.CaseSensitiveSearch = True
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownRows = 10
      Properties.DropDownWidth = 468
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id_sede'
      Properties.ListColumns = <
        item
          Caption = 'Entidade'
          Width = 300
          FieldName = 'nsede'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = Ds
      EditValue = 0
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 3
      Width = 468
    end
    object BtnSede: TcxButtonEdit
      Left = 470
      Top = 75
      Cursor = crHandPoint
      TabStop = False
      Properties.Buttons = <
        item
          Default = True
          Glyph.SourceDPI = 96
          Glyph.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            610000002C744558745469746C65004164643B4974656D3B4164644974656D3B
            426172733B526962626F6E3B4974656D3B506C75734E32EF8100000286494441
            54785E5D915D48545B14C77FFB9C199D11CDA264A2C828B2A44891B844491924
            A441915020611045742F04D14B11D1439015193E28652541057D125CEFBDF8D0
            43D017D8BDE0EDC1BC57ED8331106AC6907072C673CEDEAB98738686D9ECBDD8
            9BCDFFBF7E6B2D05D8B7FF1C7962DB768320002020E2DF252F8880E7382F0EEE
            A9691411072004584AA986BDDB5700148A0005FC34BBD537BA09B00172064A6B
            01C0714D8E01113F0882BF15C5610BCF330056BE01DA8000264F1DE803A2E01F
            411B0D4001819BAB3B10E5F74005068288CA11A8020300C1989F225028019409
            5E0631B0A8A204C06ABBF88AD9B4830528CFD501B2600013D4EE89C7B3A1043D
            8FE3B4FF1EA7AB3F4E32AD299BBF387AE7C4068504CD7082261A14C677427B2E
            97FF7ACF6832C3968D0BF9AD75395BEA63A4EC302DC7EFFFB1B8BA3EFAE84C83
            CA1218CF030163C4CF2E86FE810954B14D63C312929922B6ED7F80A722346FAD
            64CDCA8AF5EB769E3C05D85903D71F9F2F3682D6FA077A92BADA1803EF1C1229
            8D339B617246F37ADCA5B6268656E17D40289435D006117F9C205862484CCEF0
            E1AB45C7B9BB686310ED71F8C8358CD6F474FD8AEB780B013B9882017C7CB225
            0891B0E1E3C4341DED6D84141C3A7A8587D78F90CA0883EFA648CFA43FE7C628
            3982D2888D88C218F8A56A0EFF0CC50947A3D8B6C24967F8EFB3CB976F9A91D7
            1F989EFAD20778214067BEA59E9FEE7CB9591044A0BC2CCCD2452564129FF8F7
            E9104B5757D2DD7D8CBFDF24181F1E67622C3EFC71F0DE59C005B08028500ECC
            05E60567412852BEACBAE94267CDEE1B6375AD77646D4BEFDB554DE72F1595C6
            2A8050F58E5E948850B856EFBA094AF8BFEF80058481A22091011CC0AD6ABE6A
            44E03B805C64CDB4C3E1300000000049454E44AE426082}
          Kind = bkGlyph
        end>
      Properties.CaseInsensitive = False
      Properties.IncrementalSearch = False
      Properties.ViewStyle = vsButtonsOnly
      Style.BorderStyle = ebsFlat
      Style.HotTrack = True
      Style.Shadow = False
      Style.TransparentBorder = True
      Style.ButtonStyle = btsDefault
      TabOrder = 13
      Width = 27
    end
    object cxstatus: TcxComboBox
      Left = 520
      Top = 124
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'RASCUNHO'
        'AGENDADA'
        'ABERTA'
        'ENCERRADA'
        'EM_APURACAO'
        'APURADA'
        'PUBLICADA')
      Properties.ReadOnly = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 9
      Text = 'RASCUNHO'
      Width = 125
    end
    object cxobs: TcxBlobEdit
      Left = 5
      Top = 173
      Properties.BlobEditKind = bekMemo
      Properties.ClearKey = 16452
      Properties.MemoCharCase = ecUpperCase
      Properties.MemoMaxLength = 500
      Properties.PopupHeight = 185
      Properties.PopupWidth = 640
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 10
      Width = 640
    end
    object cxresponsavel: TcxLookupComboBox
      Left = 5
      Top = 124
      Cursor = crIBeam
      Properties.Alignment.Horz = taLeftJustify
      Properties.CaseSensitiveSearch = True
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownRows = 10
      Properties.DropDownWidth = 417
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id_usuario'
      Properties.ListColumns = <
        item
          Caption = 'Respons'#225'vel'
          FieldName = 'nome'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = dsUsuario
      EditValue = 0
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 6
      Width = 295
    end
    object cxanoinicial: TcxSpinEdit
      Left = 496
      Top = 75
      Properties.MaxValue = 2900.000000000000000000
      Properties.MinValue = 2000.000000000000000000
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 4
      Value = 2000
      Width = 75
    end
    object cxanofinal: TcxSpinEdit
      Left = 570
      Top = 75
      Properties.MaxValue = 2900.000000000000000000
      Properties.MinValue = 2000.000000000000000000
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 5
      Value = 2000
      Width = 75
    end
    object cxAtivo: TcxCheckBox
      Left = 5
      Top = 204
      Caption = 'Ativo'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      State = cbsChecked
      Style.TextColor = 5325111
      Style.TransparentBorder = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 14
      Transparent = True
    end
    object cxDateEleicao: TcxDateEdit
      Left = 84
      Top = 26
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
      Properties.ReadOnly = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 1
      Width = 100
    end
    object cxoperacao: TcxComboBox
      Left = 299
      Top = 124
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Elei'#231#227'o'
        'Assembleia')
      Properties.ReadOnly = False
      Properties.OnChange = cxoperacaoPropertiesChange
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 7
      Text = 'ELEI'#199#195'O'
      Width = 98
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 232
    Top = 2
  end
  inherited Ds: TUniDataSource
    DataSet = TabSede
    Left = 160
    Top = 272
  end
  inherited cxStyle: TcxStyleRepository
    Left = 271
    Top = 65535
    PixelsPerInch = 96
    inherited CxGridPedido: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    inherited GridTableDependente: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
  object dsUsuario: TUniDataSource
    DataSet = TabUsuario
    Left = 312
    Top = 272
  end
  object TabUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 262
    Top = 272
    object TabUsuarioid_usuario: TIntegerField
      FieldName = 'id_usuario'
    end
    object TabUsuarionome: TStringField
      FieldName = 'nome'
      Size = 180
    end
    object TabUsuariologin: TStringField
      FieldName = 'login'
      Size = 80
    end
    object TabUsuariosenha: TStringField
      FieldName = 'senha'
      Size = 120
    end
    object TabUsuarioid_funcionario: TIntegerField
      FieldName = 'id_funcionario'
    end
  end
  object TabSede: TClientDataSet
    PersistDataPacket.Data = {
      D20000009619E0BD010000001800000007000000000003000000D2000769645F
      7365646504000100000000000572617A616F0100490000000100055749445448
      02000200B4000866616E74617369610100490000000100055749445448020002
      00B40004636E706A01004900000001000557494454480200020014000763656C
      756C617201004900000001000557494454480200020014000D73656465707269
      6E636970616C0100490000000100055749445448020002000500056E73656465
      010049000000010005574944544802000200FA000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 274
    object TabSedeid_sede: TIntegerField
      FieldName = 'id_sede'
    end
    object TabSederazao: TStringField
      FieldName = 'razao'
      Size = 180
    end
    object TabSedefantasia: TStringField
      FieldName = 'fantasia'
      Size = 180
    end
    object TabSedecnpj: TStringField
      FieldName = 'cnpj'
    end
    object TabSedecelular: TStringField
      FieldName = 'celular'
    end
    object TabSedesedeprincipal: TStringField
      FieldName = 'sedeprincipal'
      Size = 5
    end
    object TabSedensede: TStringField
      FieldName = 'nsede'
      Size = 250
    end
  end
end
