inherited FrmCarteiraCad: TFrmCarteiraCad
  Caption = 'Carteira'
  ClientHeight = 425
  OnShow = FormShow
  ExplicitHeight = 425
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 397
    ExplicitTop = 397
    ExplicitWidth = 644
  end
  inherited PanelClient: TPanel
    Height = 354
    ExplicitHeight = 354
    inherited dxBevel1: TdxBevel
      Height = 348
      ExplicitHeight = 353
    end
    object Label3: TLabel [1]
      Left = 6
      Top = 8
      Width = 60
      Height = 17
      Caption = 'Associado'
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
    object dxBevel2: TdxBevel [2]
      Left = 480
      Top = 7
      Width = 165
      Height = 144
    end
    object edtFoto: TImage [3]
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
      OnDblClick = edtFotoDblClick
    end
    object Label5: TLabel [4]
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
    object Label1: TLabel [5]
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
    inherited BtnSalvar: TStyledBitBtn
      Left = 423
      Top = 314
      TabOrder = 6
      OnClick = BtnSalvarClick
      ExplicitLeft = 423
      ExplicitTop = 314
    end
    inherited BtnCancelar: TStyledBitBtn
      Left = 534
      Top = 314
      TabOrder = 7
      OnClick = BtnCancelarClick
      ExplicitLeft = 534
      ExplicitTop = 314
    end
    object cxAssociado: TcxLookupComboBox
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
      Properties.KeyFieldNames = 'id_socio'
      Properties.ListColumns = <
        item
          FieldName = 'cliente'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = dsAssociado
      Properties.OnEditValueChanged = cxAssociadoPropertiesEditValueChanged
      EditValue = 0
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 0
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
      TabOrder = 1
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
      TabOrder = 2
      Width = 152
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
      TabOrder = 4
      Transparent = True
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
      TabOrder = 3
      Transparent = True
    end
    object cxImpDependente: TcxCheckBox
      Left = 6
      Top = 106
      Caption = 'Imprimir dependente'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 5
      Transparent = True
    end
    object BtnDependentes: TStyledBitBtn
      Left = 320
      Top = 124
      Width = 154
      Height = 27
      Caption = 'Carregar Dependentes'
      TabOrder = 8
      OnClick = BtnDependentesClick
      StyleFamily = 'Bootstrap'
      StyleClass = 'Secondary'
    end
    object cxgroupDependente: TcxGroupBox
      Left = 6
      Top = 153
      Caption = 'Dependentes'
      PanelStyle.Active = True
      Style.TextStyle = [fsBold]
      TabOrder = 9
      Transparent = True
      Height = 158
      Width = 638
      object cxGrid: TcxGrid
        AlignWithMargins = True
        Left = 4
        Top = 21
        Width = 630
        Height = 133
        Margins.Left = 0
        Margins.Top = 4
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alBottom
        TabOrder = 0
        object Grid: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = dsDependente
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnExpressionEditing = True
          OptionsCustomize.ColumnHiding = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsCustomize.ColumnsQuickCustomizationMaxDropDownCount = 1
          OptionsCustomize.ColumnsQuickCustomizationReordering = qcrEnabled
          OptionsCustomize.ColumnsQuickCustomizationSorted = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o>'
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 25
          OptionsView.Indicator = True
          Styles.StyleSheet = FrmPrincipalNew.CxGridPedido
          object GridRecId: TcxGridDBColumn
            DataBinding.FieldName = 'RecId'
            Visible = False
          end
          object Gridid_depedente: TcxGridDBColumn
            DataBinding.FieldName = 'id_depedente'
            Visible = False
          end
          object Gridcodigo: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'codigo'
            Options.Editing = False
            Width = 60
          end
          object Gridnome: TcxGridDBColumn
            Caption = 'Nome'
            DataBinding.FieldName = 'nome'
            Options.Editing = False
            Width = 220
          end
          object Gridcpf: TcxGridDBColumn
            Caption = 'CPF'
            DataBinding.FieldName = 'cpf'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.CharCase = ecUpperCase
            Properties.EditMask = '000\.000\.000\-00;1;_'
            Options.Editing = False
            Width = 124
          end
          object Gridparentesco: TcxGridDBColumn
            Caption = 'Parentesco'
            DataBinding.FieldName = 'parentesco'
            Options.Editing = False
            Width = 94
          end
          object Gridautorizado: TcxGridDBColumn
            Caption = 'Autorizado'
            DataBinding.FieldName = 'autorizado'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ClearKey = 16452
            Properties.DisplayChecked = 'S'
            Properties.DisplayUnchecked = 'N'
            Properties.ImmediatePost = True
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            Width = 81
          end
          object Gridid_socio: TcxGridDBColumn
            DataBinding.FieldName = 'id_socio'
            Visible = False
            Width = 63
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = Grid
        end
      end
    end
  end
  inherited Paneltitulo: TPanel
    ExplicitWidth = 644
    inherited lblTitulo: TLabel
      Left = 0
      Width = 697
      Height = 35
      Align = alNone
      Caption = ' Emiss'#227'o de carteira'
      ExplicitLeft = 0
      ExplicitWidth = 697
      ExplicitHeight = 35
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 160
    Top = 282
  end
  inherited Ds: TUniDataSource
    Left = 160
    Top = 288
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
  object dsAssociado: TUniDataSource
    DataSet = TabCliente
    Left = 312
    Top = 8
  end
  object dsDependente: TUniDataSource
    DataSet = TabDependente
    Left = 160
    Top = 280
  end
  object TabCliente: TClientDataSet
    PersistDataPacket.Data = {
      F20000009619E0BD010000001800000009000000000003000000F2000869645F
      736F63696F040001000000000006636F6469676F0400010000000000096D6174
      726963756C610400010000000000046E6F6D6501004900000001000557494454
      4802000200960003637066010049000000010005574944544802000200140007
      636C69656E7465010049000000010005574944544802000200C8000877686174
      73617070010049000000010005574944544802000200140004666F746F04004B
      0000000100075355425459504502004900070042696E6172790005617669736F
      020049000000010005574944544802000200F4010000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_socio'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'matricula'
        DataType = ftInteger
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'cpf'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'cliente'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'whatsapp'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'foto'
        DataType = ftBlob
      end
      item
        Name = 'aviso'
        DataType = ftString
        Size = 500
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 272
    Top = 8
    object TabClienteid_socio: TIntegerField
      FieldName = 'id_socio'
    end
    object TabClientecodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabClientematricula: TIntegerField
      FieldName = 'matricula'
    end
    object TabClientenome: TStringField
      FieldName = 'nome'
      Size = 150
    end
    object TabClientecpf: TStringField
      FieldName = 'cpf'
    end
    object TabClientecliente: TStringField
      FieldName = 'cliente'
      Size = 200
    end
    object TabClientewhatsapp: TStringField
      FieldName = 'whatsapp'
    end
    object TabClientefoto: TBlobField
      FieldName = 'foto'
    end
    object TabClienteaviso: TStringField
      FieldName = 'aviso'
      Size = 500
    end
  end
  object TabDependente: TClientDataSet
    PersistDataPacket.Data = {
      CB0000009619E0BD010000001800000007000000000003000000CB000D69645F
      646570656E64656E7465040001000000000006636F6469676F04000100000000
      00046E6F6D65010049000000010005574944544802000200B4000A706172656E
      746573636F0100490000000100055749445448020002003C0003637066010049
      00000001000557494454480200020014000A6175746F72697A61646F01004900
      0000010005574944544802000200010008776861747361707001004900000001
      000557494454480200020014000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_dependente'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 180
      end
      item
        Name = 'parentesco'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'cpf'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'autorizado'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'whatsapp'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 160
    Top = 280
    object TabDependenteid_dependente: TIntegerField
      FieldName = 'id_dependente'
    end
    object TabDependentecodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabDependentenome: TStringField
      FieldName = 'nome'
      Size = 180
    end
    object TabDependenteparentesco: TStringField
      FieldName = 'parentesco'
      Size = 60
    end
    object TabDependentecpf: TStringField
      FieldName = 'cpf'
    end
    object TabDependenteautorizado: TStringField
      FieldName = 'autorizado'
      Size = 1
    end
    object TabDependentewhatsapp: TStringField
      FieldName = 'whatsapp'
    end
  end
end
