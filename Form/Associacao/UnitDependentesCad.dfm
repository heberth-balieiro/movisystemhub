inherited FrmDependentesCad: TFrmDependentesCad
  Caption = 'Associados/Dependentes'
  ClientHeight = 471
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitHeight = 471
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 443
    ExplicitTop = 443
  end
  inherited PanelClient: TPanel
    Height = 400
    ExplicitHeight = 400
    object dxBevel2: TdxBevel [0]
      Left = 480
      Top = 10
      Width = 165
      Height = 144
    end
    inherited dxBevel1: TdxBevel
      Height = 394
      ExplicitLeft = -3
      ExplicitTop = 126
      ExplicitHeight = 400
    end
    object edtFoto: TImage [2]
      Left = 481
      Top = 11
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
    object Label1: TLabel [3]
      Left = 5
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
    object Label3: TLabel [4]
      Left = 77
      Top = 10
      Width = 36
      Height = 17
      Caption = 'Nome'
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
    object Label8: TLabel [5]
      Left = 378
      Top = 10
      Width = 69
      Height = 17
      Caption = 'Nascimento'
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
    object Label2: TLabel [6]
      Left = 5
      Top = 59
      Width = 21
      Height = 17
      Caption = 'CPF'
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
    object Label4: TLabel [7]
      Left = 134
      Top = 59
      Width = 17
      Height = 17
      Caption = 'RG'
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
    object Label5: TLabel [8]
      Left = 248
      Top = 59
      Width = 97
      Height = 17
      Caption = 'Grau parentesco'
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
    object Label6: TLabel [9]
      Left = 377
      Top = 59
      Width = 28
      Height = 17
      Caption = 'Sexo'
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
    object Label7: TLabel [10]
      Left = 5
      Top = 108
      Width = 60
      Height = 17
      Caption = 'WhatsApp'
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
      Left = 266
      Top = 124
      Width = 70
      Height = 27
      Caption = 'Incluir'
      TabOrder = 10
      OnClick = BtnSalvarClick
      ExplicitLeft = 266
      ExplicitTop = 124
      ExplicitWidth = 70
      ExplicitHeight = 27
    end
    inherited BtnCancelar: TStyledBitBtn
      Left = 408
      Top = 124
      Width = 70
      Height = 27
      Caption = 'Excluir'
      TabOrder = 12
      OnClick = BtnCancelarClick
      ExplicitLeft = 408
      ExplicitTop = 124
      ExplicitWidth = 70
      ExplicitHeight = 27
    end
    object cxCodigo: TcxTextEdit
      Left = 5
      Top = 28
      TabStop = False
      Properties.ReadOnly = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 0
      Width = 73
    end
    object cxNome: TcxTextEdit
      Left = 77
      Top = 28
      Cursor = crIBeam
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 1
      Width = 302
    end
    object cxNascimento: TcxDateEdit
      Left = 378
      Top = 28
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
      TabOrder = 2
      Width = 100
    end
    object cxcpf: TcxButtonEdit
      Left = 5
      Top = 77
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
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 3
      Text = '   .   .   -  '
      Width = 130
    end
    object cxRg: TcxTextEdit
      Left = 134
      Top = 77
      Cursor = crIBeam
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 4
      OnKeyPress = cxRgKeyPress
      Width = 115
    end
    object cxParentesco: TcxComboBox
      Left = 248
      Top = 77
      Cursor = crIBeam
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Companheiro(a)'
        'C'#244'njuge'
        'Enteado(a)'
        'Filho(a)'
        'Irm'#227'o(a)'
        'M'#227'e'
        'Neto(a)'
        'Pai'
        'Outros')
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 5
      Width = 131
    end
    object cxSexo: TcxComboBox
      Left = 378
      Top = 77
      Cursor = crIBeam
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'MASCULINO'
        'FEMININO'
        'CISG'#202'NERO'
        'TRANSG'#202'NERO'
        'N'#195'O BINARIO'
        'OUTROS')
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 6
      Width = 100
    end
    object cxTelefone: TcxMaskEdit
      Left = 5
      Top = 126
      Properties.EditMask = '!\(99\)99999-9999'
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 7
      Text = '(  )     -    '
      Width = 107
    end
    object cxAtivo: TcxCheckBox
      Left = 114
      Top = 128
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
      StyleFocused.Color = 15855596
      TabOrder = 8
      Transparent = True
    end
    object cxAutorizado: TcxCheckBox
      Left = 172
      Top = 128
      Caption = 'Autorizado'
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.DisplayGrayed = 'S'
      Properties.ImmediatePost = True
      Properties.ValueChecked = 'S'
      Properties.ValueGrayed = 'N'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      StyleFocused.Color = 15855596
      TabOrder = 9
      Transparent = True
    end
    object cxGrid: TcxGrid
      Left = 5
      Top = 155
      Width = 640
      Height = 239
      TabOrder = 13
      object Grid: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        OnCellClick = GridCellClick
        DataController.DataSource = Ds
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
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o>'
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
          Width = 54
        end
        object Gridnome: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'nome'
          Width = 224
        end
        object Gridcpf: TcxGridDBColumn
          Caption = 'CPF'
          DataBinding.FieldName = 'cpf'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditMask = '999\.999\.999\-99;1;_'
          Width = 114
        end
        object Gridparentesco: TcxGridDBColumn
          Caption = 'Parentesco'
          DataBinding.FieldName = 'parentesco'
          Width = 100
        end
        object Gridativo: TcxGridDBColumn
          Caption = 'Ativo'
          DataBinding.FieldName = 'ativo'
          Width = 48
        end
        object Gridautorizado: TcxGridDBColumn
          Caption = 'Autorizado'
          DataBinding.FieldName = 'autorizado'
          Width = 86
        end
        object Gridid_socio: TcxGridDBColumn
          DataBinding.FieldName = 'id_socio'
          Visible = False
          Width = 63
        end
        object GridColumn1: TcxGridDBColumn
          Caption = 'Data cadastro'
          DataBinding.FieldName = 'datacadastro'
          Width = 99
        end
        object GridColumn2: TcxGridDBColumn
          Caption = 'Usu'#225'rio'
          DataBinding.FieldName = 'nmusuaro'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = Grid
      end
    end
    object Btneditar: TStyledBitBtn
      Left = 337
      Top = 124
      Width = 70
      Height = 27
      Caption = 'Editar'
      TabOrder = 11
      OnClick = BtneditarClick
      StyleFamily = 'Bootstrap'
      StyleClass = 'Secondary'
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 544
    Top = 2
  end
  inherited Ds: TUniDataSource
    DataSet = mdDependente
    Left = 440
    Top = 392
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
  object mdDependente: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 400
    Top = 388
    object mdDependenteid_depedente: TIntegerField
      FieldName = 'id_depedente'
    end
    object mdDependentenome: TStringField
      FieldName = 'nome'
      Size = 180
    end
    object mdDependentecpf: TStringField
      FieldName = 'cpf'
    end
    object mdDependenteparentesco: TStringField
      FieldName = 'parentesco'
      Size = 60
    end
    object mdDependenteativo: TStringField
      FieldName = 'ativo'
      Size = 5
    end
    object mdDependenteautorizado: TStringField
      FieldName = 'autorizado'
      Size = 5
    end
    object mdDependenteid_socio: TIntegerField
      FieldName = 'id_socio'
    end
    object mdDependentecodigo: TIntegerField
      FieldName = 'codigo'
    end
    object mdDependentedatacadastro: TDateField
      FieldName = 'datacadastro'
    end
    object mdDependentenmusuaro: TStringField
      FieldName = 'nmusuaro'
      Size = 30
    end
  end
  object ACBrValidador1: TACBrValidador
    IgnorarChar = './-'
    PermiteVazio = True
    Left = 336
    Top = 384
  end
end
