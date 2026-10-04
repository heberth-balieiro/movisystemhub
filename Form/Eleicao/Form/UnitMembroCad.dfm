inherited FrmMembroCad: TFrmMembroCad
  Caption = 'Membro'
  ClientHeight = 471
  Color = clWhite
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
    inherited dxBevel1: TdxBevel
      Height = 394
      ExplicitHeight = 400
    end
    object Label1: TLabel [1]
      Left = 7
      Top = 60
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
    object Label3: TLabel [2]
      Left = 79
      Top = 60
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
    object Label8: TLabel [3]
      Left = 113
      Top = 109
      Width = 36
      Height = 17
      Caption = 'E-mail'
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
      Left = 350
      Top = 60
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
    object Label7: TLabel [5]
      Left = 7
      Top = 109
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
    object dxFoto: TdxBevel [6]
      Left = 477
      Top = 9
      Width = 165
      Height = 144
    end
    object cxFoto: TImage [7]
      Left = 478
      Top = 10
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
      OnDblClick = cxFotoDblClick
    end
    object Label5: TLabel [8]
      Left = 7
      Top = 10
      Width = 37
      Height = 17
      Caption = 'Chapa'
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
      Left = 7
      Top = 158
      Width = 36
      Height = 17
      Caption = 'Cargo'
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
      Left = 113
      Top = 158
      Width = 26
      Height = 17
      Caption = 'Tipo'
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
      Left = 219
      Top = 158
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
    inherited BtnSalvar: TStyledBitBtn
      Left = 430
      Top = 175
      Width = 70
      Height = 27
      Caption = 'Incluir'
      TabOrder = 10
      OnClick = BtnSalvarClick
      ExplicitLeft = 430
      ExplicitTop = 175
      ExplicitWidth = 70
      ExplicitHeight = 27
    end
    inherited BtnCancelar: TStyledBitBtn
      Left = 572
      Top = 175
      Width = 70
      Height = 27
      Caption = 'Excluir'
      TabOrder = 11
      OnClick = BtnCancelarClick
      ExplicitLeft = 572
      ExplicitTop = 175
      ExplicitWidth = 70
      ExplicitHeight = 27
    end
    object cxCodigo: TcxTextEdit
      Left = 7
      Top = 78
      TabStop = False
      Properties.ReadOnly = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 1
      Width = 73
    end
    object cxNome: TcxTextEdit
      Left = 79
      Top = 78
      Cursor = crIBeam
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 2
      Width = 272
    end
    object cxcpf: TcxButtonEdit
      Left = 350
      Top = 78
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
      Width = 124
    end
    object cxTelefone: TcxMaskEdit
      Left = 7
      Top = 127
      Properties.EditMask = '!\(99\)99999-9999'
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 4
      Text = '(  )     -    '
      Width = 107
    end
    object Btneditar: TStyledBitBtn
      Left = 501
      Top = 175
      Width = 70
      Height = 27
      Caption = 'Editar'
      TabOrder = 12
      OnClick = BtneditarClick
      StyleFamily = 'Bootstrap'
      StyleClass = 'Secondary'
    end
    object cxGrid: TcxGrid
      Left = 5
      Top = 208
      Width = 640
      Height = 187
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
          Width = 54
        end
        object Gridnome: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'nome'
          Width = 214
        end
        object Gridcpf: TcxGridDBColumn
          Caption = 'CPF'
          DataBinding.FieldName = 'cpf'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditMask = '999\.999\.999\-99;1;_'
          Width = 103
        end
        object Gridparentesco: TcxGridDBColumn
          Caption = 'Cargo'
          DataBinding.FieldName = 'cargo'
          Width = 120
        end
        object Gridautorizado: TcxGridDBColumn
          Caption = 'Tipo'
          DataBinding.FieldName = 'tipo'
          Width = 88
        end
        object Gridid_socio: TcxGridDBColumn
          DataBinding.FieldName = 'id_socio'
          Visible = False
          Width = 63
        end
        object Gridativo: TcxGridDBColumn
          Caption = 'Ativo'
          DataBinding.FieldName = 'ativo'
          Width = 47
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = Grid
      end
    end
    object cxemail: TcxTextEdit
      Left = 113
      Top = 127
      Cursor = crIBeam
      Properties.ClearKey = 16452
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 5
      Width = 311
    end
    object cxEleicao: TcxLookupComboBox
      Left = 7
      Top = 29
      Cursor = crIBeam
      Properties.Alignment.Horz = taLeftJustify
      Properties.CaseSensitiveSearch = True
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownRows = 10
      Properties.DropDownWidth = 400
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id_eleicao'
      Properties.ListColumns = <
        item
          FieldName = 'npesquisa'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = dsEleicao
      Properties.ReadOnly = True
      EditValue = 0
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 0
      Width = 467
    end
    object cxCargo: TcxComboBox
      Left = 7
      Top = 177
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Presidente'
        'Vice-presidente'
        'Tesoureiro'
        'Secret'#225'rio'
        'Conselheiro Fiscal')
      Properties.ReadOnly = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 7
      Text = 'PRESIDENTE'
      Width = 107
    end
    object cxTipo: TcxComboBox
      Left = 113
      Top = 177
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Titular'
        'Suplente')
      Properties.ReadOnly = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 8
      Text = 'TITULAR'
      Width = 107
    end
    object cxAtivo: TcxCheckBox
      Left = 425
      Top = 129
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
      TabOrder = 6
      Transparent = True
    end
    object cxobservacao: TcxBlobEdit
      Left = 219
      Top = 177
      Properties.BlobEditKind = bekMemo
      Properties.ClearKey = 16452
      Properties.MemoCharCase = ecUpperCase
      Properties.MemoMaxLength = 250
      Properties.PopupHeight = 185
      Properties.PopupWidth = 328
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 9
      Width = 205
    end
  end
  inherited Paneltitulo: TPanel
    inherited lblTitulo: TLabel
      Caption = 'Composi'#231#227'o da Chapa'
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 352
    Top = 34
  end
  inherited Ds: TUniDataSource
    DataSet = mdPesquisa
    Left = 272
    Top = 384
  end
  inherited cxStyle: TcxStyleRepository
    Left = 375
    Top = 15
    PixelsPerInch = 96
    inherited CxGridPedido: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    inherited GridTableDependente: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
  object ACBrValidador1: TACBrValidador
    IgnorarChar = './-'
    PermiteVazio = True
    Left = 352
    Top = 24
  end
  object mdPesquisa: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 312
    Top = 380
    object mdPesquisaid: TIntegerField
      FieldName = 'id'
    end
    object mdPesquisacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object mdPesquisanome: TStringField
      FieldName = 'nome'
      Size = 160
    end
    object mdPesquisacpf: TStringField
      FieldName = 'cpf'
    end
    object mdPesquisatelefone: TStringField
      FieldName = 'telefone'
    end
    object mdPesquisaativo: TStringField
      FieldName = 'ativo'
      Size = 8
    end
    object mdPesquisaid_eleicao: TIntegerField
      FieldName = 'id_eleicao'
    end
    object mdPesquisaid_chapa: TIntegerField
      FieldName = 'id_chapa'
    end
    object mdPesquisacargo: TStringField
      FieldName = 'cargo'
      Size = 45
    end
    object mdPesquisatipo: TStringField
      FieldName = 'tipo'
      Size = 45
    end
  end
  object TabEleicao: TClientDataSet
    PersistDataPacket.Data = {
      730000009619E0BD01000000180000000400000000000300000073000A69645F
      656C656963616F040001000000000006636F6469676F0400010000000000046E
      6F6D650100490000000100055749445448020002009600096E70657371756973
      61010049000000010005574944544802000200FA000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 72
    Top = 315
    object TabEleicaoid_eleicao: TIntegerField
      FieldName = 'id_eleicao'
    end
    object TabEleicaocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabEleicaonome: TStringField
      FieldName = 'nome'
      Size = 150
    end
    object TabEleicaonpesquisa: TStringField
      FieldName = 'npesquisa'
      Size = 250
    end
  end
  object dsEleicao: TUniDataSource
    DataSet = TabEleicao
    Left = 128
    Top = 315
  end
end
