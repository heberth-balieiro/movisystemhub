inherited FrmHistoricoFiliado: TFrmHistoricoFiliado
  Caption = 'Hist'#243'rico Filiado'
  ClientWidth = 650
  OnShow = FormShow
  ExplicitWidth = 650
  TextHeight = 17
  inherited PanelButton: TPanel
    Width = 650
    ExplicitWidth = 650
  end
  inherited PanelClient: TPanel
    Width = 650
    ExplicitWidth = 650
    object cxGroupBox1: TcxGroupBox
      Left = 0
      Top = 0
      Align = alTop
      Caption = 'Dados do associado'
      ParentBackground = False
      Style.TextStyle = []
      TabOrder = 0
      Height = 181
      Width = 650
      object lbsituacao: TLabel
        Left = 3
        Top = 22
        Width = 43
        Height = 17
        Caption = 'C'#243'digo'
      end
      object Label4: TLabel
        Left = 62
        Top = 22
        Width = 54
        Height = 17
        Caption = 'Matr'#237'cula'
      end
      object Label5: TLabel
        Left = 126
        Top = 22
        Width = 68
        Height = 17
        Caption = 'S'#243'cio deste'
      end
      object Label6: TLabel
        Left = 220
        Top = 22
        Width = 36
        Height = 17
        Caption = 'Nome'
      end
      object Label7: TLabel
        Left = 3
        Top = 120
        Width = 54
        Height = 17
        Caption = 'Profiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 201
        Top = 120
        Width = 46
        Height = 17
        Caption = 'Lota'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 470
        Top = 120
        Width = 104
        Height = 17
        Caption = 'Local de Trabalho'
      end
      object Label11: TLabel
        Left = 470
        Top = 71
        Width = 58
        Height = 17
        Caption = 'Secretaria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label23: TLabel
        Left = 530
        Top = 22
        Width = 21
        Height = 17
        Caption = 'CPF'
      end
      object Label29: TLabel
        Left = 3
        Top = 71
        Width = 69
        Height = 17
        Caption = 'Nascimento'
      end
      object Label1: TLabel
        Left = 102
        Top = 71
        Width = 49
        Height = 17
        Caption = 'Telefone'
      end
      object Label13: TLabel
        Left = 201
        Top = 71
        Width = 60
        Height = 17
        Caption = 'WhatsApp'
      end
      object Label2: TLabel
        Left = 300
        Top = 71
        Width = 36
        Height = 17
        Caption = 'E-mail'
      end
      object cxcodigo: TcxTextEdit
        Left = 3
        Top = 40
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 0
        Width = 60
      end
      object cxmatricula: TcxTextEdit
        Left = 62
        Top = 40
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 1
        Width = 65
      end
      object cxfiliado: TcxDateEdit
        Left = 126
        Top = 40
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
        Properties.ReadOnly = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 2
        Width = 95
      end
      object cxnome: TcxTextEdit
        Left = 220
        Top = 40
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.MaxLength = 150
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 3
        Width = 311
      end
      object cxprofissao: TcxLookupComboBox
        Left = 3
        Top = 138
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ImmediatePost = True
        Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
        Properties.KeyFieldNames = 'id_profissao'
        Properties.ListColumns = <
          item
            FieldName = 'nprofissao'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dsProfissao
        Properties.ReadOnly = True
        EditValue = 0
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 4
        Width = 199
      end
      object cxlotacao: TcxLookupComboBox
        Left = 201
        Top = 138
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ImmediatePost = True
        Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
        Properties.KeyFieldNames = 'id_lotacao'
        Properties.ListColumns = <
          item
            FieldName = 'nlotacao'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dsLotacao
        Properties.ReadOnly = True
        EditValue = 0
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 5
        Width = 270
      end
      object cxlocaltrabalho: TcxLookupComboBox
        Left = 470
        Top = 138
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ImmediatePost = True
        Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
        Properties.KeyFieldNames = 'id_local'
        Properties.ListColumns = <
          item
            Caption = 'Local Trabalho'
            FieldName = 'npesquisa'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dsLocalTrabalho
        Properties.ReadOnly = True
        EditValue = 0
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 6
        Width = 177
      end
      object cxsecretaria: TcxLookupComboBox
        Left = 470
        Top = 89
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ImmediatePost = True
        Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
        Properties.KeyFieldNames = 'id_secretaria'
        Properties.ListColumns = <
          item
            FieldName = 'nsecretaria'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dsSecretaria
        Properties.ReadOnly = True
        EditValue = 0
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 7
        Width = 177
      end
      object cxcpf: TcxButtonEdit
        Left = 530
        Top = 40
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
        TabOrder = 8
        Text = '   .   .   -  '
        Width = 117
      end
      object cxnascimento: TcxDateEdit
        Left = 3
        Top = 89
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
        Properties.ReadOnly = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 9
        Width = 100
      end
      object cxtelefone: TcxMaskEdit
        Left = 102
        Top = 89
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.EditMask = '!\(99\)9999-9999;1;_'
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 10
        Text = '(  )    -    '
        Width = 100
      end
      object cxzap: TcxMaskEdit
        Left = 201
        Top = 89
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.EditMask = '!\(99\)99999-9999;1;_'
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 11
        Text = '(  )     -    '
        Width = 100
      end
      object cxemail: TcxTextEdit
        Left = 300
        Top = 89
        Properties.ClearKey = 16452
        Properties.MaxLength = 180
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 12
        Width = 171
      end
    end
    object scrLinhaTempo: TScrollBox
      Left = 0
      Top = 181
      Width = 650
      Height = 274
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      TabOrder = 1
    end
  end
  inherited Paneltitulo: TPanel
    Width = 650
    ExplicitWidth = 650
    inherited lblTitulo: TLabel
      Width = 595
      Caption = 'Hist'#243'rico Associado'
      ExplicitWidth = 595
    end
    inherited BtnFechar: TSpeedButton
      Left = 610
      ExplicitLeft = 610
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 584
    Top = 2
  end
  inherited Ds: TUniDataSource
    Left = 576
    Top = 0
  end
  inherited cxStyle: TcxStyleRepository
    Left = 551
    Top = 65535
    PixelsPerInch = 96
    inherited CxGridPedido: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    inherited GridTableDependente: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
  object TabSecretaria: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD01000000180000000400000000000300000079000D69645F
      73656372657461726961040001000000000006636F6469676F04000100000000
      000572617A616F01004900000001000557494454480200020078000B6E736563
      7265746172696101004900000001000557494454480200020078000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_secretaria'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'razao'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'nsecretaria'
        DataType = ftString
        Size = 120
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 536
    Top = 244
    object TabSecretariaid_secretaria: TIntegerField
      FieldName = 'id_secretaria'
    end
    object TabSecretariacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabSecretariarazao: TStringField
      FieldName = 'razao'
      Size = 120
    end
    object TabSecretariansecretaria: TStringField
      FieldName = 'nsecretaria'
      Size = 120
    end
  end
  object dsSecretaria: TUniDataSource
    DataSet = TabSecretaria
    Left = 576
    Top = 244
  end
  object TabSindProfissao: TClientDataSet
    PersistDataPacket.Data = {
      950000009619E0BD01000000180000000500000000000300000095000C69645F
      70726F66697373616F040001000000000006636F6469676F0400010000000000
      0964657363726963616F010049000000010005574944544802000200BE000561
      7469766F01004900000001000557494454480200020005000A6E70726F666973
      73616F010049000000010005574944544802000200BE000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_profissao'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'ativo'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'nprofissao'
        DataType = ftString
        Size = 190
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 536
    Top = 306
    object TabSindProfissaoid_profissao: TIntegerField
      FieldName = 'id_profissao'
    end
    object TabSindProfissaocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabSindProfissaodescricao: TStringField
      FieldName = 'descricao'
      Size = 190
    end
    object TabSindProfissaoativo: TStringField
      FieldName = 'ativo'
      Size = 5
    end
    object TabSindProfissaonprofissao: TStringField
      FieldName = 'nprofissao'
      Size = 190
    end
  end
  object dsProfissao: TUniDataSource
    DataSet = TabSindProfissao
    Left = 584
    Top = 306
  end
  object TabSindLotacao: TClientDataSet
    PersistDataPacket.Data = {
      910000009619E0BD01000000180000000500000000000300000091000A69645F
      6C6F746163616F040001000000000006636F6469676F04000100000000000964
      657363726963616F010049000000010005574944544802000200BE0005617469
      766F0100490000000100055749445448020002000500086E6C6F746163616F01
      0049000000010005574944544802000200BE000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_lotacao'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'ativo'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'nlotacao'
        DataType = ftString
        Size = 190
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 536
    Top = 364
    object TabSindLotacaoid_lotacao: TIntegerField
      FieldName = 'id_lotacao'
    end
    object TabSindLotacaocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabSindLotacaodescricao: TStringField
      FieldName = 'descricao'
      Size = 190
    end
    object TabSindLotacaoativo: TStringField
      FieldName = 'ativo'
      Size = 5
    end
    object TabSindLotacaonlotacao: TStringField
      FieldName = 'nlotacao'
      Size = 190
    end
  end
  object dsLotacao: TUniDataSource
    DataSet = TabSindLotacao
    Left = 576
    Top = 364
  end
  object TabLocalTrabalho: TClientDataSet
    PersistDataPacket.Data = {
      670000009619E0BD01000000180000000300000000000300000067000869645F
      6C6F63616C04000100000000000964657363726963616F010049000000010005
      5749445448020002005000096E70657371756973610100490000000100055749
      4454480200020064000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_local'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'npesquisa'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 528
    Top = 426
    object TabLocalTrabalhoid_local: TIntegerField
      FieldName = 'id_local'
    end
    object TabLocalTrabalhodescricao: TStringField
      FieldName = 'descricao'
      Size = 80
    end
    object TabLocalTrabalhonpesquisa: TStringField
      FieldName = 'npesquisa'
      Size = 100
    end
  end
  object dsLocalTrabalho: TUniDataSource
    DataSet = TabLocalTrabalho
    Left = 578
    Top = 426
  end
end
