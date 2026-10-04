inherited FrmCarteiraCadDependente: TFrmCarteiraCadDependente
  Caption = 'Carteira dependente'
  ClientHeight = 350
  Color = clBtnFace
  Font.Height = -12
  OnShow = FormShow
  ExplicitHeight = 350
  TextHeight = 15
  object QrCodeImagen: TImage [0]
    Left = 514
    Top = 555
    Width = 28
    Height = 17
    Visible = False
  end
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
    object Label3: TLabel [1]
      Left = 6
      Top = 8
      Width = 71
      Height = 17
      Caption = 'Dependente'
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
    object Label5: TLabel [2]
      Left = 6
      Top = 57
      Width = 50
      Height = 17
      Caption = 'Val'#237'dade'
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
      Left = 100
      Top = 57
      Width = 35
      Height = 17
      Caption = 'Senha'
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
    object dxBevel2: TdxBevel [4]
      Left = 480
      Top = 7
      Width = 165
      Height = 144
    end
    object edtFoto: TImage [5]
      Left = 481
      Top = 8
      Width = 163
      Height = 142
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
    inherited BtnSalvar: TStyledBitBtn
      Left = 424
      Top = 238
      OnClick = BtnSalvarClick
      ExplicitLeft = 424
      ExplicitTop = 238
    end
    inherited BtnCancelar: TStyledBitBtn
      Left = 535
      Top = 238
      OnClick = BtnCancelarClick
      ExplicitLeft = 535
      ExplicitTop = 238
    end
    object cxDependente: TcxLookupComboBox
      Left = 6
      Top = 26
      Cursor = crIBeam
      Properties.Alignment.Horz = taLeftJustify
      Properties.CaseSensitiveSearch = True
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownRows = 20
      Properties.DropDownWidth = 639
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id_dependente'
      Properties.ListColumns = <
        item
          FieldName = 'dependente'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = Ds
      Properties.OnChange = cxDependentePropertiesChange
      EditValue = 0
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 2
      Width = 474
    end
    object edtdata: TcxDateEdit
      Left = 6
      Top = 75
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
      TabOrder = 3
      Width = 95
    end
    object cxSenha: TcxTextEdit
      Left = 100
      Top = 75
      Cursor = crIBeam
      Properties.ClearKey = 16452
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '*'
      Properties.ShowPasswordRevealButton = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 4
      Width = 152
    end
    object cxAtivo: TcxCheckBox
      Left = 260
      Top = 79
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
      TabOrder = 5
      Transparent = True
    end
    object cxDigital: TcxCheckBox
      Left = 320
      Top = 79
      Caption = 'Digital'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 6
      Transparent = True
    end
  end
  inherited Paneltitulo: TPanel
    ExplicitWidth = 644
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 352
    Top = 2
  end
  inherited Ds: TUniDataSource
    DataSet = TabDependente
    Left = 232
    Top = 256
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
  object TabDependente: TClientDataSet
    PersistDataPacket.Data = {
      ED0000009619E0BD010000001800000009000000000003000000ED000D69645F
      646570656E64656E746504000100000000000869645F736F63696F0400010000
      00000006636F6469676F0400010000000000046E6F6D65010049000000010005
      574944544802000200A000036370660100490000000100055749445448020002
      00140004666F6E65010049000000010005574944544802000200140004666F74
      6F04004B0000000100075355425459504502004900070042696E617279000A64
      6570656E64656E7465010049000000010005574944544802000200C800096D61
      74726963756C6104000100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_dependente'
        DataType = ftInteger
      end
      item
        Name = 'id_socio'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 160
      end
      item
        Name = 'cpf'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'fone'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'foto'
        DataType = ftBlob
      end
      item
        Name = 'dependente'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'matricula'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 304
    Top = 224
    object TabDependenteid_dependente: TIntegerField
      FieldName = 'id_dependente'
    end
    object TabDependenteid_socio: TIntegerField
      FieldName = 'id_socio'
    end
    object TabDependentecodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabDependentenome: TStringField
      FieldName = 'nome'
      Size = 160
    end
    object TabDependentecpf: TStringField
      FieldName = 'cpf'
    end
    object TabDependentefone: TStringField
      FieldName = 'fone'
    end
    object TabDependentefoto: TBlobField
      FieldName = 'foto'
    end
    object TabDependentedependente: TStringField
      FieldName = 'dependente'
      Size = 200
    end
    object TabDependentematricula: TIntegerField
      FieldName = 'matricula'
    end
  end
end
