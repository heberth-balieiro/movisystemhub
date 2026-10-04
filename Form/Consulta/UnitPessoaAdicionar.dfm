inherited FrmPessoaAdicionar: TFrmPessoaAdicionar
  Caption = ''
  ClientHeight = 522
  ClientWidth = 902
  Color = clWhite
  OnShow = FormShow
  ExplicitWidth = 902
  ExplicitHeight = 522
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 497
    Width = 902
    TabOrder = 0
    ExplicitTop = 497
    ExplicitWidth = 902
  end
  inherited PanelClient: TPanel
    Top = 169
    Width = 902
    Height = 328
    TabOrder = 1
    ExplicitTop = 120
    ExplicitWidth = 902
    ExplicitHeight = 377
    inherited cxGrid: TcxGrid
      Width = 902
      Height = 328
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 902
      ExplicitHeight = 377
      inherited Grid: TcxGridDBTableView
        OnMouseDown = GridMouseDown
        OnFocusedRecordChanged = GridFocusedRecordChanged
        DataController.DataSource = Ds
        OptionsData.Editing = True
        OptionsView.ColumnAutoWidth = False
        Styles.StyleSheet = CxGridPedido
        object GridCheck: TcxGridDBColumn
          DataBinding.FieldName = 'chk'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.Alignment = taCenter
          Properties.ClearKey = 16452
          Properties.Glyph.SourceHeight = 16
          Properties.GlyphCount = 0
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Properties.OnChange = GridCheckPropertiesChange
          HeaderGlyph.SourceDPI = 96
          HeaderGlyph.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            610000001974455874536F6674776172650041646F626520496D616765526561
            647971C9653C00000013744558745469746C6500436865636B427574746F6E73
            3B8852EE91000001AE49444154785E75523B4E0331101D3B8988C459E869200D
            3D6C2810EC2E1F81448738028740B4900DA1CA878A8E0624DA1C068192F8C7CC
            D8DE4D36623FF67866DE9BE7B10500341E06D377D968741C38A08726E7C88ECB
            6A20B756F3CFDB8BED3DCC5934D12B4188CEF5D1D61AA05A099EE3EABE3FDDA1
            C2B42602618CE5E042D912E7960C7AFD2760A325416BCE97910010CF405B81EA
            44BC2E06AF70759E60BEF1CE4A818AFB0E807A0F04839F8A315C9E2551815822
            F069D6BA08887170985BBC4C103C823C4D7C13B55925D0CA2028281082E758BF
            4FE0DE0832049F669E40A94A81E4E685265AF4F59E279CE4504DD11FC32382D3
            937D066BF419FCB5A929B05A936EDA020286343349AF18428A95F3F4106CD923
            24A8375185E3B318CC8E0F9804C84EBB58B90B1CB550E668ED6A3D3086F2F938
            3304904C076C73136D751CACC48426D62E92637662CA0988715ED21BAA03DB12
            4CED184119EB9379103E31425C9C6559C4981A81D5BE079B6D5C86AAD68900E4
            F27C42645AB2ADE55024D0B3F9CFC7CDDDDB6EBCF31417C241F9843E88A0663E
            FBFEA2D38F32485B1BFF56B04B79FFD82E807F9D73E60F8705474B406D9F9D00
            00000049454E44AE426082}
          Options.Moving = False
          Options.ShowCaption = False
          Options.Sorting = False
          Width = 29
          IsCaptionAssigned = True
        end
        object GridRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
        end
        object Gridid_socio: TcxGridDBColumn
          DataBinding.FieldName = 'id_socio'
          Visible = False
        end
        object Gridcodigo: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'codigo'
          Options.Editing = False
          Width = 53
        end
        object Gridmatricula: TcxGridDBColumn
          Caption = 'Matr'#237'cula'
          DataBinding.FieldName = 'matricula'
          Options.Editing = False
        end
        object Gridnome: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'nome'
          Options.Editing = False
          Width = 300
        end
        object Gridcpf: TcxGridDBColumn
          Caption = 'CPF'
          DataBinding.FieldName = 'cpf'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditMask = '999\.999\.999\-99;1;_'
          Options.Editing = False
          Width = 111
        end
        object GridColumn1: TcxGridDBColumn
          Caption = 'Secretaria'
          DataBinding.FieldName = 'socio_secretaria'
          Width = 128
        end
        object Gridwhatsapp: TcxGridDBColumn
          Caption = 'Whatsapp'
          DataBinding.FieldName = 'whatsapp'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditMask = '!\(99\)99999-9999;1;_'
          Options.Editing = False
          Width = 100
        end
        object Gridemail: TcxGridDBColumn
          Caption = 'Email'
          DataBinding.FieldName = 'email'
          Visible = False
          Width = 206
        end
        object Gridsituacao: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'situacao'
          Options.Editing = False
          Width = 80
        end
        object Gridnascimento: TcxGridDBColumn
          Caption = 'Nascimento'
          DataBinding.FieldName = 'nascimento'
          Visible = False
        end
      end
    end
  end
  inherited Paneltitulo: TPanel
    Width = 902
    TabOrder = 3
    ExplicitTop = 0
    ExplicitWidth = 902
    inherited lblTitulo: TLabel
      Width = 847
      ExplicitWidth = 847
    end
    inherited BtnFechar: TSpeedButton
      Left = 862
      ExplicitLeft = 862
    end
  end
  inherited PanelFiltro: TPanel
    Width = 902
    Height = 129
    TabOrder = 2
    ExplicitWidth = 902
    ExplicitHeight = 129
    inherited GBFiltro: TcxGroupBox
      ExplicitLeft = 15
      ExplicitTop = 6
      ExplicitWidth = 902
      ExplicitHeight = 177
      Height = 129
      Width = 902
      object Label2: TLabel [1]
        Left = 3
        Top = 69
        Width = 49
        Height = 17
        Caption = 'Situa'#231#227'o'
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
        Left = 262
        Top = 20
        Width = 58
        Height = 17
        Caption = 'Secretaria'
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
        Left = 474
        Top = 19
        Width = 46
        Height = 17
        Caption = 'Lota'#231#227'o'
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
      object Label9: TLabel [4]
        Left = 686
        Top = 19
        Width = 41
        Height = 17
        Caption = 'Cidade'
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
      object Label4: TLabel [5]
        Left = 121
        Top = 69
        Width = 74
        Height = 17
        Caption = 'Ordenar por'
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
      inherited EdtBusca: TcxTextEdit
        ExplicitWidth = 260
        ExplicitHeight = 25
        Width = 260
      end
      inherited PPopPap: TPanel
        Left = 874
        Top = 87
        Enabled = False
        TabOrder = 9
        ExplicitLeft = 874
        ExplicitTop = 87
      end
      inherited BtnLimpar: TStyledBitBtn
        Left = 687
        Top = 87
        TabOrder = 7
        ExplicitLeft = 687
        ExplicitTop = 87
      end
      inherited BtnPesquisar: TStyledBitBtn
        Left = 596
        Top = 87
        TabOrder = 6
        ExplicitLeft = 596
        ExplicitTop = 87
      end
      object cxAtivo: TcxComboBox
        Left = 3
        Top = 87
        Cursor = crIBeam
        Properties.ClearKey = 16452
        Properties.DropDownListStyle = lsEditFixedList
        Properties.ImmediatePost = True
        Properties.Items.Strings = (
          'Todos'
          'Ativo'
          'Inadimplente'
          'Suspenso'
          'Inativo'
          'Cancelado'
          'Afastado')
        StyleFocused.Color = 15855596
        TabOrder = 4
        Text = 'Todos'
        Width = 119
      end
      object BtnAdicionar: TStyledBitBtn
        Left = 778
        Top = 87
        Width = 90
        Height = 25
        Caption = 'Adicionar'
        TabOrder = 8
        OnClick = BtnAdicionarClick
        StyleFamily = 'Bootstrap'
        StyleClass = 'Success'
      end
      object edtSecretaria: TcxLookupComboBox
        Left = 262
        Top = 38
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
        EditValue = 0
        StyleFocused.BorderColor = clWindowFrame
        StyleFocused.Color = 15855596
        TabOrder = 1
        Width = 213
      end
      object edtlotacao: TcxLookupComboBox
        Left = 474
        Top = 38
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
        EditValue = 0
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 2
        Width = 213
      end
      object EdtCidade: TcxLookupComboBox
        Left = 686
        Top = 38
        Cursor = crIBeam
        Properties.Alignment.Horz = taLeftJustify
        Properties.CaseSensitiveSearch = True
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.DropDownRows = 10
        Properties.DropDownWidth = 400
        Properties.ImmediatePost = True
        Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
        Properties.KeyFieldNames = 'id_cidade'
        Properties.ListColumns = <
          item
            FieldName = 'ncidade'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dsCidade
        EditValue = 0
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 3
        Width = 213
      end
      object cxOrdenar: TcxComboBox
        Left = 121
        Top = 87
        Cursor = crIBeam
        Properties.ClearKey = 16452
        Properties.DropDownListStyle = lsEditFixedList
        Properties.ImmediatePost = True
        Properties.Items.Strings = (
          'C'#243'digo'
          'Matr'#237'cula'
          'Nome'
          'Apelido'
          'Secretaria'
          'Situa'#231#227'o'
          '')
        StyleFocused.Color = 15855596
        TabOrder = 5
        Text = 'Nome'
        Width = 119
      end
      object BtnMarca: TStyledBitBtn
        Left = 262
        Top = 87
        Width = 104
        Height = 25
        Caption = 'Marcar Todos'
        TabOrder = 10
        OnClick = BtnMarcaClick
        StyleFamily = 'Bootstrap'
        StyleAppearance = 'Outline'
      end
      object Btndesmarca: TStyledBitBtn
        Left = 367
        Top = 87
        Width = 117
        Height = 25
        Caption = 'Desmarcar Todos'
        TabOrder = 11
        OnClick = BtndesmarcaClick
        StyleFamily = 'Bootstrap'
        StyleClass = 'Secondary'
        StyleAppearance = 'Outline'
      end
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 464
  end
  inherited Ds: TUniDataSource
    DataSet = mdPesquisa
    Left = 536
    Top = 408
  end
  inherited cxStyle: TcxStyleRepository
    Left = 415
    Top = 65535
    PixelsPerInch = 96
    inherited CxGridPedido: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    inherited GridTableDependente: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
  inherited cxIMGMenu: TcxImageList
    FormatVersion = 1
    Left = 312
    Top = 0
    DesignInfo = 312
  end
  inherited MenuPop: TPopupMenu
    Left = 368
    Top = 4
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
    Left = 32
    Top = 424
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
    Left = 72
    Top = 424
  end
  object mdPesquisa: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 536
    Top = 436
    object mdPesquisaid_socio: TIntegerField
      FieldName = 'id_socio'
    end
    object mdPesquisacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object mdPesquisamatricula: TIntegerField
      FieldName = 'matricula'
    end
    object mdPesquisanome: TStringField
      FieldName = 'nome'
      Size = 180
    end
    object mdPesquisacpf: TStringField
      FieldName = 'cpf'
    end
    object mdPesquisacelular: TStringField
      FieldName = 'celular'
    end
    object mdPesquisawhatsapp: TStringField
      FieldName = 'whatsapp'
    end
    object mdPesquisaemail: TStringField
      FieldName = 'email'
      Size = 180
    end
    object mdPesquisasituacao: TStringField
      FieldName = 'situacao'
    end
    object mdPesquisachk: TBooleanField
      FieldName = 'chk'
    end
    object mdPesquisanascimento: TDateField
      FieldName = 'nascimento'
    end
    object mdPesquisasocio_secretaria: TStringField
      FieldName = 'socio_secretaria'
      Size = 60
    end
    object mdPesquisasocio_deste: TDateField
      FieldName = 'socio_deste'
    end
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
    Left = 176
    Top = 428
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
    Left = 224
    Top = 428
  end
  object TabCidade: TClientDataSet
    PersistDataPacket.Data = {
      7A0000009619E0BD0100000018000000040000000000030000007A000969645F
      6369646164650400010000000000066369646164650100490000000100055749
      44544802000200A0000275660100490000000100055749445448020002000200
      076E636964616465010049000000010005574944544802000200C8000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 432
    object TabCidadeid_cidade: TIntegerField
      FieldName = 'id_cidade'
    end
    object TabCidadecidade: TStringField
      FieldName = 'cidade'
      Size = 160
    end
    object TabCidadeuf: TStringField
      FieldName = 'uf'
      Size = 2
    end
    object TabCidadencidade: TStringField
      FieldName = 'ncidade'
      Size = 200
    end
  end
  object dsCidade: TUniDataSource
    DataSet = TabCidade
    Left = 336
    Top = 432
  end
end
