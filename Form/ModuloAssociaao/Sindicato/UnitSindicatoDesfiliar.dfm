inherited FrmSindicatoDesfiliar: TFrmSindicatoDesfiliar
  Caption = 'Desfiliar'
  ClientHeight = 620
  ClientWidth = 684
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 684
  ExplicitHeight = 620
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 595
    Width = 684
    ExplicitTop = 595
    ExplicitWidth = 684
  end
  inherited PanelClient: TPanel
    Width = 684
    Height = 555
    ExplicitWidth = 684
    ExplicitHeight = 555
    object cxResumo: TcxGroupBox
      Left = 0
      Top = 233
      Align = alTop
      Caption = 'Dados da desfilia'#231#227'o'
      ParentBackground = False
      Style.TextStyle = []
      TabOrder = 0
      Height = 214
      Width = 684
      object Label1: TLabel
        Left = 3
        Top = 22
        Width = 112
        Height = 17
        Caption = 'Data da desfilia'#231#227'o'
      end
      object Label36: TLabel
        Left = 126
        Top = 22
        Width = 49
        Height = 17
        Caption = 'Situa'#231#227'o'
      end
      object Label34: TLabel
        Left = 3
        Top = 71
        Width = 70
        Height = 17
        Caption = 'Observa'#231#227'o'
      end
      object Label3: TLabel
        Left = 225
        Top = 22
        Width = 126
        Height = 17
        Caption = 'Motivo da desfilia'#231#227'o'
      end
      object Label10: TLabel
        Left = 3
        Top = 152
        Width = 161
        Height = 17
        Caption = 'Respons'#225'vel pelo processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 225
        Top = 152
        Width = 137
        Height = 17
        Caption = 'Documento / Protocolo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object cxDatadesfiliar: TcxDateEdit
        Left = 3
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
        Properties.SaveTime = False
        Properties.ShowTime = False
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 0
        Width = 124
      end
      object edtsituacao: TcxComboBox
        Left = 126
        Top = 40
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.DropDownListStyle = lsEditFixedList
        Properties.ImmediatePost = True
        Properties.Items.Strings = (
          'Afastado'
          'Atestado'
          'Cedido'
          'Demitido'
          'Falecido'
          'Inativo'
          'N'#227'o Filiado')
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 1
        Width = 100
      end
      object cxresponsavel: TcxLookupComboBox
        Left = 3
        Top = 170
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ImmediatePost = True
        Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
        Properties.KeyFieldNames = 'id_usuario'
        Properties.ListColumns = <
          item
            Caption = 'Usu'#225'rio'
            FieldName = 'nome'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dsresponsavel
        Properties.ReadOnly = False
        EditValue = 0
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 4
        Width = 223
      end
      object cxobs: TcxMemo
        Left = 3
        Top = 89
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 3
        Height = 57
        Width = 678
      end
      object cxdocumento: TcxTextEdit
        Left = 225
        Top = 170
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.MaxLength = 150
        Properties.ReadOnly = False
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 5
        Width = 456
      end
      object cxmotivo: TcxLookupComboBox
        Left = 225
        Top = 40
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ImmediatePost = True
        Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
        Properties.KeyFieldNames = 'id_motivo'
        Properties.ListColumns = <
          item
            Caption = 'Motivo'
            FieldName = 'npesquisa'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dsMotivo
        Properties.ReadOnly = False
        EditValue = 0
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 2
        Width = 456
      end
    end
    object cxGroupBox1: TcxGroupBox
      Left = 0
      Top = 0
      Align = alTop
      Caption = 'Dados do associado'
      ParentBackground = False
      Style.TextStyle = []
      TabOrder = 1
      Height = 233
      Width = 684
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
      object dxBevel1: TdxBevel
        Left = 516
        Top = 21
        Width = 164
        Height = 191
      end
      object cxfoto: TImage
        Left = 518
        Top = 23
        Width = 161
        Height = 187
        Center = True
        Picture.Data = {
          0D546478536D617274496D6167653C3F786D6C2076657273696F6E3D22312E30
          2220656E636F64696E673D225554462D38223F3E0D0A3C737667207665727369
          6F6E3D22312E31222069643D22D0A1D0BBD0BED0B95F312220786D6C6E733D22
          687474703A2F2F7777772E77332E6F72672F323030302F7376672220786D6C6E
          733A786C696E6B3D22687474703A2F2F7777772E77332E6F72672F313939392F
          786C696E6B2220783D223070782220793D22307078222076696577426F783D22
          30203020333220333222207374796C653D22656E61626C652D6261636B67726F
          756E643A6E6577203020302033322033323B2220786D6C3A73706163653D2270
          72657365727665223E262331333B262331303B3C7374796C6520747970653D22
          746578742F6373732220786D6C3A73706163653D227072657365727665223E2E
          426C61636B7B66696C6C3A233732373237323B7D262331333B262331303B2623
          393B2E7374307B6F7061636974793A302E363B7D3C2F7374796C653E0D0A3C67
          2069643D22D0A1D0BBD0BED0B95F322220636C6173733D22737430223E0D0A09
          093C7061746820636C6173733D22426C61636B2220643D224D32362C3139632D
          322E362D302E372D332D322E332D332D3363312E362D312E362C332D342E372C
          332D3863302D302E322C302D302E352C302D3163302D322E352D322E382D352D
          352E392D3563302C302D302E312C302D302E312C3020202623393B2623393B63
          302C302D302E312C302D302E312C304331362E382C322C31342C342E352C3134
          2C3763302C302E352C302C302E382C302C3163302C332E332C312E342C362E34
          2C332C3863302C302E372D302E342C322E332D332C33632D352C312E342D362C
          312E312D362C3768313268313220202623393B2623393B4333322C32302E312C
          33312C32302E342C32362C31397A222F3E0D0A093C2F673E0D0A3C7061746820
          636C6173733D22426C61636B2220643D224D31382C3233632D322E362D302E37
          2D332D322E332D332D3363312E362D312E362C332D342E372C332D3863302D30
          2E322C302D302E352C302D3163302D322E352D322E382D352D352E392D356330
          2C302D302E312C302D302E312C3020202623393B63302C302D302E312C302D30
          2E312C3043382E382C362C362C382E352C362C313163302C302E352C302C302E
          382C302C3163302C332E332C312E342C362E342C332C3863302C302E372D302E
          342C322E332D332C33632D352C312E342D362C312E312D362C37683132683132
          20202623393B4332342C32342E312C32332C32342E342C31382C32337A222F3E
          0D0A3C2F7376673E0D0A}
        Proportional = True
        Transparent = True
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
        Left = 255
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
        Left = 3
        Top = 169
        Width = 104
        Height = 17
        Caption = 'Local de Trabalho'
      end
      object Label11: TLabel
        Left = 255
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
      object Label41: TLabel
        Left = 3
        Top = 71
        Width = 51
        Height = 17
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
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
        Width = 290
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
        Width = 253
      end
      object cxlotacao: TcxLookupComboBox
        Left = 255
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
        Width = 255
      end
      object cxlocaltrabalho: TcxLookupComboBox
        Left = 3
        Top = 187
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
        Width = 507
      end
      object cxsecretaria: TcxLookupComboBox
        Left = 255
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
        Width = 255
      end
      object cxEmpresa: TcxLookupComboBox
        Left = 3
        Top = 89
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ImmediatePost = True
        Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
        Properties.KeyFieldNames = 'sind_id_empresa'
        Properties.ListColumns = <
          item
            FieldName = 'nempresa'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dsEmpresa
        Properties.ReadOnly = True
        EditValue = 0
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 8
        Width = 253
      end
    end
    object BtnSalvar: TStyledBitBtn
      Left = 459
      Top = 515
      Width = 110
      Height = 35
      Caption = 'Salvar | F5'
      TabOrder = 2
      OnClick = BtnSalvarClick
      StyleFamily = 'Bootstrap'
      StyleClass = 'Success'
    end
    object BtnCancelar: TStyledBitBtn
      Left = 570
      Top = 515
      Width = 110
      Height = 35
      Caption = 'Cancelar | ESC'
      TabOrder = 3
      TabStop = False
      OnClick = BtnCancelarClick
      StyleFamily = 'Bootstrap'
      StyleClass = 'Danger'
    end
    object cxGroupBox2: TcxGroupBox
      Left = 0
      Top = 447
      Align = alTop
      Caption = 'Op'#231#245'es / processo'
      ParentBackground = False
      Style.TextStyle = []
      TabOrder = 4
      Height = 62
      Width = 684
      object edtbloqueado: TcxCheckBox
        Left = 3
        Top = 24
        Caption = 'Bloqueado descontos futuros'
        Properties.ClearKey = 16452
        Properties.DisplayChecked = 'S'
        Properties.DisplayUnchecked = 'N'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        Style.TransparentBorder = False
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 0
        Transparent = True
        Visible = False
      end
      object cxinativarcadastro: TcxCheckBox
        Left = 220
        Top = 24
        Caption = 'Inativar cadastro do associado'
        Properties.ClearKey = 16452
        Properties.DisplayChecked = 'S'
        Properties.DisplayUnchecked = 'N'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        Style.TransparentBorder = False
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 1
        Transparent = True
        Visible = False
      end
      object cxinativarcarteira: TcxCheckBox
        Left = 3
        Top = 24
        Caption = 'Inativar Carteira'
        Properties.ClearKey = 16452
        Properties.DisplayChecked = 'S'
        Properties.DisplayUnchecked = 'N'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        Style.TransparentBorder = False
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 2
        Transparent = True
      end
    end
  end
  inherited Paneltitulo: TPanel
    Width = 684
    ExplicitWidth = 684
    inherited lblTitulo: TLabel
      Width = 629
      ExplicitWidth = 629
    end
    inherited BtnFechar: TSpeedButton
      Left = 644
      ExplicitLeft = 644
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 464
    Top = 2
  end
  inherited Ds: TUniDataSource
    Left = 424
    Top = 0
  end
  inherited cxStyle: TcxStyleRepository
    Left = 375
    Top = 65535
    PixelsPerInch = 96
    inherited CxGridPedido: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    inherited GridTableDependente: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
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
    Top = 10
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
    Left = 602
    Top = 10
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
    Left = 232
    Top = 546
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
    Left = 272
    Top = 546
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
    Left = 80
    Top = 554
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
    Left = 120
    Top = 554
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
    Left = 248
    Top = 10
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
    Left = 296
    Top = 10
  end
  object TabSindEmpresa: TClientDataSet
    PersistDataPacket.Data = {
      A60000009619E0BD010000001800000006000000000003000000A6000F73696E
      645F69645F656D7072657361040001000000000006636F6469676F0400010000
      0000000964657363726963616F010049000000010005574944544802000200BE
      000769645F73656465040001000000000005617469766F010049000000010005
      5749445448020002000500086E656D7072657361010049000000010005574944
      544802000200BE000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'sind_id_empresa'
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
        Name = 'id_sede'
        DataType = ftInteger
      end
      item
        Name = 'ativo'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'nempresa'
        DataType = ftString
        Size = 190
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 336
    Top = 544
    object TabSindEmpresasind_id_empresa: TIntegerField
      FieldName = 'sind_id_empresa'
    end
    object TabSindEmpresacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabSindEmpresadescricao: TStringField
      FieldName = 'descricao'
      Size = 190
    end
    object TabSindEmpresaid_sede: TIntegerField
      FieldName = 'id_sede'
    end
    object TabSindEmpresaativo: TStringField
      FieldName = 'ativo'
      Size = 5
    end
    object TabSindEmpresanempresa: TStringField
      FieldName = 'nempresa'
      Size = 190
    end
  end
  object dsEmpresa: TUniDataSource
    DataSet = TabSindEmpresa
    Left = 376
    Top = 544
  end
  object TabResponsavel: TClientDataSet
    PersistDataPacket.Data = {
      5D0000009619E0BD0100000018000000030000000000030000005D000A69645F
      7573756172696F0400010000000000046E6F6D65010049000000010005574944
      5448020002003C000E69645F66756E63696F6E6172696F040001000000000000
      00}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_usuario'
        DataType = ftInteger
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'id_funcionario'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 136
    Top = 394
    object TabResponsavelid_usuario: TIntegerField
      FieldName = 'id_usuario'
    end
    object TabResponsavelnome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object TabResponsavelid_funcionario: TIntegerField
      FieldName = 'id_funcionario'
    end
  end
  object dsresponsavel: TUniDataSource
    DataSet = TabResponsavel
    Left = 216
    Top = 393
  end
  object dsMotivo: TUniDataSource
    DataSet = TabMotivo
    Left = 512
    Top = 369
  end
  object TabMotivo: TClientDataSet
    PersistDataPacket.Data = {
      680000009619E0BD01000000180000000300000000000300000068000969645F
      6D6F7469766F04000100000000000964657363726963616F0100490000000100
      055749445448020002005000096E706573717569736101004900000001000557
      494454480200020064000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_motivo'
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
    Left = 456
    Top = 370
    object TabMotivoid_motivo: TIntegerField
      FieldName = 'id_motivo'
    end
    object TabMotivodescricao: TStringField
      FieldName = 'descricao'
      Size = 80
    end
    object TabMotivonpesquisa: TStringField
      FieldName = 'npesquisa'
      Size = 100
    end
  end
  object frxEspelho: TfrxReport
    Tag = 1
    Version = '2022.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43201.435697800900000000
    ReportOptions.LastChange = 46227.918635196760000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 456
    Top = 440
    Datasets = <
      item
        DataSet = frxDbEspelho
        DataSetName = 'frxDbEspelho'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'fnome'
        Value = Null
      end
      item
        Name = 'fcivil'
        Value = Null
      end
      item
        Name = 'frg'
        Value = Null
      end
      item
        Name = 'fcpf'
        Value = Null
      end
      item
        Name = 'fprofissao'
        Value = Null
      end
      item
        Name = 'fmatricula'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 925.984850000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        DataSet = frxDbEspelho
        DataSetName = 'frxDbEspelho'
        RowCount = 0
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 0.559035590000000000
          Top = 204.196970000000000000
          Width = 215.432795040000000000
          Height = 22.677160470000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial Unicode MS'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'PEDIDO DE DESFILIA'#199#195'O')
          ParentFont = False
        end
        object Rich1: TfrxRichView
          AllowVectorExport = True
          Left = 0.559035590000000000
          Top = 264.307205000000000000
          Width = 718.110285040000000000
          Height = 355.275624720000000000
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C6663686172736574302040417269616C20556E69636F646520
            4D533B7D7B5C66315C666E696C5C66636861727365743020417269616C2D426F
            6C644D543B7D7B5C66325C666E696C2040417269616C20556E69636F6465204D
            533B7D7B5C66335C6673776973735C6663686172736574302043616C69627269
            3B7D7B5C66345C6673776973735C66707271325C666368617273657430204361
            6C696272693B7D7B5C66355C666E696C5C666368617273657430205461686F6D
            613B7D7D0D0A7B5C636F6C6F7274626C203B5C726564305C677265656E305C62
            6C7565303B7D0D0A7B5C2A5C67656E657261746F722052696368656432302031
            302E302E31393034317D5C766965776B696E64345C756331200D0A5C70617264
            5C716A5C625C66305C66733234204E6F6D653A205B6672784462457370656C68
            6F2E226E6F6D65225D2C5C663120205C6230204E6163696F6E616C6964616465
            3A205C625C66302062726173696C6569726F2861295C6230202C204573746164
            6F20435C27656476696C3A205C62205B6672784462457370656C686F2E226369
            76696C225D5C6230202C2050726F666973735C2765336F3A205C62205B667278
            4462457370656C686F2E2270726F66697373616F225D5C6230202C204D617472
            5C27656463756C613A205C62205B6672784462457370656C686F2E226D617472
            6963756C61225D2C205C6230204C6F74615C2765375C2765336F3A205C62205B
            6672784462457370656C686F2E226C6F746163616F225D2C205C62302052473A
            205C62205B6672784462457370656C686F2E227267225D5C6230202C20435046
            3A205C62205B6672784462457370656C686F2E22637066225D5C6230202C2045
            6E646572655C2765376F3A205C62205B6672784462457370656C686F2E22656E
            64657265636F225D5C6230202C20466F6E653A205C62205B6672784462457370
            656C686F2E22666F6E65225D5C6230202C2057686174736170703A2053696D20
            2820294E5C2765336F20282029456D61696C3A205C62205B6672784462457370
            656C686F2E22656D61696C225D5C6230202E5C7061720D0A5C7061720D0A5369
            72766F2D6D65206465737465207072696D656972616D656E7465207061726120
            63756D7072696D656E745C2765312D6C6F2065206D65736D61206F706F727475
            6E6964616465205245515545524552206D696E68612044455346494C49415C27
            63375C2763334F206A756E746F20616F2053696E64696361746F20646F732053
            65727669646F726573204D756E6963697061697320646F20436F6E652053756C
            20646520526F6E645C2766346E6961205C66325C656E6461736820205C663320
            585858585858585858585858585C6632202C2073656E646F206465766964616D
            656E7465206573636C6172656369646F28612920652061647665727469646F28
            61292064617320636F6E736571755C66305C2765616E63696173206465207265
            6665726964612064656369735C2765336F2E5C7061720D0A5C7061720D0A436F
            6E666F726D65207465726D6F7320646F20457374617475746F20646F2053696E
            6473756C2C2061727469676F3132372C205C276137315C2762612C205C6C6462
            6C71756F7465206E61206869705C2766337465736520646F207365727669646F
            722066696C6961646F2074657220736575206E6F6D6520656D20756D6120615C
            2765375C2765336F206A7564696369616C206520646573656A61722073652064
            657366696C6961722C20706F6465725C276531206F2066617A65722061726361
            6E646F20636F6D20746F646173206173206465737065736173206F7269756E64
            617320646520726566657269646F2061746F5C7264626C71756F7465202C206F
            20717565206F636F727265725C2765312061705C276633732061207665726966
            6963615C2765375C2765336F2070656C6F2073696E64696361746F2064612065
            786973745C2765616E63696120646520616C67756D6120615C2765375C276533
            6F2065206E6F7469666963615C2765375C2765336F2064657374652072657175
            6572656E7465206163696D61206964656E746966696361646F2C206E6F207072
            617A6F2064652035202863696E636F292064696173205C276661746569732064
            6F2070726F746F636F6C6F2064657374652E5C7061720D0A5C7061720D0A5365
            6E646F206F207175652074696E686120707261206F206D6F6D656E746F2C2072
            656E6F766F20766F746F7320646520656C657661646120657374696D61206520
            636F6E7369646572615C2765375C2765336F2C205C66345C667332325C706172
            0D0A0D0A5C706172645C6366315C66355C667331365C7061720D0A7D0D0A00}
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 257.567075590000000000
          Top = 165.141775000000000000
          Width = 461.102245040000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial Unicode MS'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Vilhena-RO, [FormatDateTime('#39'dd "de" mmmm "de" yyyy'#39',<Date>)].')
          ParentFont = False
          Formats = <
            item
              FormatStr = 'd "de" mmmm "de" yyyy'
              Kind = fkDateTime
            end
            item
            end>
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 446.543600000000000000
          Top = 619.299475000000000000
          Width = 279.684805040000000000
          Height = 34.015721180000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial Unicode MS'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '_____________________________________'
            'Assinatura Requerente Acima Identificado')
          ParentFont = False
          VAlign = vaBottom
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 429.669450000000000000
          Top = 850.212585000000000000
          Width = 283.464505910000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 430.669450000000000000
          Top = 853.275975000000000000
          Width = 285.952755910000000000
          Height = 18.897630470000000000
          DataSetName = 'frxTblTempReg'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial Unicode MS'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDbEspelho."NOME"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Top = 905.126005000000000000
          Width = 364.322885910000000000
          Height = 22.677160470000000000
          DataSetName = 'frxTblTempReg'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial Unicode MS'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Ciente em ____________; _____________________________')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Width = 604.724385040000000000
          Height = 52.913400470000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial Unicode MS'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 468.661720000000000000
          Top = 56.692950000000000000
          Width = 143.621725040000000000
          Height = 30.236220470000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial Unicode MS'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Filiado '#224' CUT')
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 604.724800000000000000
          Width = 113.385900000000000000
          Height = 128.504020000000000000
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Top = 139.842610000000000000
          Width = 718.110285040000000000
          Height = 30.236220470000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial Unicode MS'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'ILMO. Presidente do XXXXXXXXXXXXXXXXXXXXXX - XXXXX')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Top = 234.330860000000000000
          Width = 136.062665040000000000
          Height = 22.677160470000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial Unicode MS'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Ilustr'#237'ssimo Sr.')
          ParentFont = False
        end
        object Rich2: TfrxRichView
          AllowVectorExport = True
          Left = 0.559035590000000000
          Top = 681.638220000000000000
          Width = 718.110285040000000000
          Height = 158.740064720000000000
          Frame.Typ = []
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C6673776973735C66707271325C6663686172736574302043656E74757279
            20476F746869633B7D7B5C66315C666E696C5C66636861727365743020546168
            6F6D613B7D7D0D0A7B5C2A5C67656E657261746F722052696368656432302031
            302E302E31393034317D5C766965776B696E64345C756331200D0A5C70617264
            5C77696463746C7061725C716A5C756C775C625C66305C667332342044454349
            535C2763334F5C756C6E6F6E655C66733230203A5C7061720D0A0D0A5C706172
            645C77696463746C7061725C736C3238385C736C6D756C74315C716A20585858
            585858205C656E64617368202058585858585858585858585858585858585858
            585858585858585858585C6230202C20706F72206D65696F20646F2073657520
            726570726573656E74616E7465206C6567616C2061626169786F20617373696E
            61646F2C2076656D2C2064656E74726F20646F207072617A6F20657374616265
            6C656369646F2C20696E666F726D617220646F2061636174616D656E746F2064
            6F2050656469646F2064652044657366696C69615C2765375C2765336F206163
            696D612C20696E666F726D616E646F207175653A5C7061720D0A0D0A5C706172
            64200D0A7B5C706E746578745C66302041295C7461627D7B5C2A5C706E5C706E
            6C766C626F64795C706E66305C706E696E64656E74305C706E7374617274315C
            706E75636C74727B5C706E74787461297D7D0D0A5C736C3238385C736C6D756C
            74315C716A5C747832383420466F69204F6669636961646F20616F20456D7072
            656761646F7220646F207365727669646F72206465207375612064657366696C
            69615C2765375C2765336F20284F665C27656463696F205F5F5F5F5F2F5F5F5F
            5F5F2C20456D205F5F5F5F5F5F5F5F5F5C2D3B5C7061720D0A7B5C706E746578
            745C66302042295C7461627D517565206E5C2765336F20666F6920656E636F6E
            747261646F206E656E68756D6120615C2765375C2765336F206A756469636961
            6C207472616D6974616E646F20656D20736575206661766F7220285F5F5F5F29
            3B5C7061720D0A7B5C706E746578745C66302043295C7461627D517565206578
            6973746520615C2765375C2765336F206A7564696369616C207472616D697461
            6E646F20656D20736575206661766F722C2073656E646F20696E666F726D6164
            6F206F2873292070726F636573736F287329206578697374656E7465732C2069
            6E64696361646F206F206164766F6761646F20726573706F6E735C2765317665
            6C2065206F732076616C6F7265732064657669646F7320616F20585858585858
            585820286361736F206578697374616D292E5C7061720D0A0D0A5C706172645C
            66315C667331365C7061720D0A7D0D0A00}
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 37.795292680000000000
        Top = 1005.354980000000000000
        Width = 718.110700000000000000
        object Memo11: TfrxMemoView
          Align = baClient
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 37.795292680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              'Rua Deof'#233' Ant'#244'nio Geremias, n'#186' 359 '#8211' Jardim Am'#233'rica '#8211' 76.980-002' +
              ' '#8211' Vilhena /RO'
            
              'sindsul_2009@outlook.com / www.sindsul.com.br    Fone (69) 3322-' +
              '4696 '#8211' Cel/WhatsApp 984726889 ')
          ParentFont = False
        end
      end
    end
  end
  object frxDbEspelho: TfrxDBDataset
    UserName = 'frxDbEspelho'
    CloseDataSource = False
    FieldAliases.Strings = (
      'RecId=RecId'
      'nome=nome'
      'civil=civil'
      'profissao=profissao'
      'matricula=matricula'
      'lotacao=lotacao'
      'rg=rg'
      'cpf=cpf'
      'endereco=endereco'
      'fone=fone'
      'whatsapp=whatsapp'
      'email=email'
      'data_desfiliacao=data_desfiliacao'
      'motivodesfiliacao=motivodesfiliacao'
      'obs=obs'
      'protocolo=protocolo')
    DataSet = mdEspelho
    BCDToCurrency = False
    DataSetOptions = []
    Left = 512
    Top = 441
  end
  object mdEspelho: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 576
    Top = 444
    object mdEspelhonome: TStringField
      FieldName = 'nome'
      Size = 100
    end
    object mdEspelhocivil: TStringField
      FieldName = 'civil'
      Size = 60
    end
    object mdEspelhoprofissao: TStringField
      FieldName = 'profissao'
      Size = 60
    end
    object mdEspelhomatricula: TIntegerField
      FieldName = 'matricula'
    end
    object mdEspelholotacao: TStringField
      FieldName = 'lotacao'
      Size = 60
    end
    object mdEspelhorg: TStringField
      FieldName = 'rg'
    end
    object mdEspelhocpf: TStringField
      FieldName = 'cpf'
    end
    object mdEspelhoendereco: TStringField
      FieldName = 'endereco'
      Size = 180
    end
    object mdEspelhofone: TStringField
      FieldName = 'fone'
    end
    object mdEspelhowhatsapp: TStringField
      FieldName = 'whatsapp'
    end
    object mdEspelhoemail: TStringField
      FieldName = 'email'
      Size = 150
    end
    object mdEspelhodata_desfiliacao: TDateField
      FieldName = 'data_desfiliacao'
    end
    object mdEspelhomotivodesfiliacao: TStringField
      FieldName = 'motivodesfiliacao'
      Size = 60
    end
    object mdEspelhoobs: TStringField
      FieldName = 'obs'
      Size = 500
    end
    object mdEspelhoprotocolo: TStringField
      FieldName = 'protocolo'
      Size = 60
    end
  end
  object frxRichObject1: TfrxRichObject
    Left = 448
    Top = 488
  end
end
