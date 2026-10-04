inherited FrmHistoricoBancario: TFrmHistoricoBancario
  Caption = 'Cadastro de Hist'#243'rico Banc'#225'rio'
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
    inherited dxBevel1: TdxBevel
      Height = 394
      ExplicitHeight = 394
    end
    object Label1: TLabel [1]
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
    object Label3: TLabel [2]
      Left = 77
      Top = 10
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
    object Label2: TLabel [3]
      Left = 504
      Top = 10
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
    object Label13: TLabel [4]
      Left = 5
      Top = 59
      Width = 95
      Height = 17
      Caption = 'Plano de Contas'
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
    object Label14: TLabel [5]
      Left = 336
      Top = 59
      Width = 95
      Height = 17
      Caption = 'Centro de Custo'
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
      Left = 433
      Top = 108
      Width = 70
      Height = 27
      Caption = 'Incluir'
      TabOrder = 6
      OnClick = BtnSalvarClick
      ExplicitLeft = 433
      ExplicitTop = 108
      ExplicitWidth = 70
      ExplicitHeight = 27
    end
    inherited BtnCancelar: TStyledBitBtn
      Left = 575
      Top = 108
      Width = 70
      Height = 27
      Caption = 'Excluir'
      TabOrder = 8
      OnClick = BtnCancelarClick
      ExplicitLeft = 575
      ExplicitTop = 108
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
      OnKeyPress = cxCodigoKeyPress
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
      Width = 428
    end
    object Btneditar: TStyledBitBtn
      Left = 504
      Top = 108
      Width = 70
      Height = 27
      Caption = 'Editar'
      TabOrder = 7
      OnClick = BtneditarClick
      StyleFamily = 'Bootstrap'
      StyleClass = 'Secondary'
    end
    object cxGrid: TcxGrid
      Left = 5
      Top = 141
      Width = 640
      Height = 254
      TabOrder = 9
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
        object Gridid_secretaria: TcxGridDBColumn
          DataBinding.FieldName = 'id_secretaria'
          Visible = False
          Width = 47
        end
        object Gridcodigo: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'id_historico'
          Width = 54
        end
        object Gridrazao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'descricao'
          Width = 375
        end
        object GridColumn1: TcxGridDBColumn
          Caption = 'Tipo'
          DataBinding.FieldName = 'tipo'
          Width = 117
        end
        object Gridativo: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'ativo'
          Width = 80
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = Grid
      end
    end
    object cxTipo: TcxComboBox
      Left = 504
      Top = 28
      Cursor = crIBeam
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Cr'#233'dito - (Receita)'
        'D'#233'bito - (Despesa)'
        'Ambos - (Receita/Despesa)')
      Properties.OnChange = cxTipoPropertiesChange
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 2
      Width = 141
    end
    object cxplano: TcxLookupComboBox
      Left = 5
      Top = 77
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id_planoconta'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRICAO_COMPLETA'
        end>
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = dsPlano
      Properties.ReadOnly = False
      EditValue = 0
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 3
      Width = 332
    end
    object cxcusto: TcxLookupComboBox
      Left = 336
      Top = 77
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id_custo'
      Properties.ListColumns = <
        item
          Caption = 'Centro de Custo'
          FieldName = 'custo'
        end>
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = dsCusto
      Properties.ReadOnly = False
      EditValue = 0
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 4
      Width = 251
    end
    object cxAtivo: TcxCheckBox
      Left = 593
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
      StyleFocused.Color = 15855596
      TabOrder = 5
      Transparent = True
    end
  end
  inherited Paneltitulo: TPanel
    inherited lblTitulo: TLabel
      Caption = 'Hist'#243'rico Banc'#225'rio'
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 456
    Top = 402
  end
  inherited Ds: TUniDataSource
    DataSet = mdSituacao
    Left = 416
    Top = 400
  end
  inherited cxStyle: TcxStyleRepository
    Left = 383
    Top = 399
    PixelsPerInch = 96
    inherited CxGridPedido: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    inherited GridTableDependente: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
  object mdSituacao: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 352
    Top = 396
    object mdSituacaoid_historico: TIntegerField
      FieldName = 'id_historico'
    end
    object mdSituacaodescricao: TStringField
      FieldName = 'descricao'
      Size = 80
    end
    object mdSituacaotipo: TStringField
      FieldName = 'tipo'
      Size = 15
    end
    object mdSituacaoativo: TStringField
      FieldName = 'ativo'
      Size = 8
    end
  end
  object TabPlano: TClientDataSet
    PersistDataPacket.Data = {
      800000009619E0BD01000000180000000400000000000300000080000D69645F
      706C616E6F636F6E7461040001000000000006636F6469676F01004900000001
      00055749445448020002003200056E6976656C04000100000000001244455343
      524943414F5F434F4D504C455441010049000000010005574944544802000200
      78000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 315
    object TabPlanoid_planoconta: TIntegerField
      FieldName = 'id_planoconta'
    end
    object TabPlanocodigo: TStringField
      FieldName = 'codigo'
      Size = 50
    end
    object TabPlanonivel: TIntegerField
      FieldName = 'nivel'
    end
    object TabPlanoDESCRICAO_COMPLETA: TStringField
      FieldName = 'DESCRICAO_COMPLETA'
      Size = 120
    end
  end
  object TabCusto: TClientDataSet
    PersistDataPacket.Data = {
      630000009619E0BD01000000180000000300000000000300000063000869645F
      637573746F04000100000000000964657363726963616F010049000000010005
      5749445448020002003C0005637573746F010049000000010005574944544802
      00020050000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 347
    object TabCustoid_custo: TIntegerField
      FieldName = 'id_custo'
    end
    object TabCustodescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object TabCustocusto: TStringField
      FieldName = 'custo'
      Size = 80
    end
  end
  object dsPlano: TUniDataSource
    DataSet = TabPlano
    Left = 336
    Top = 283
  end
  object dsCusto: TUniDataSource
    DataSet = TabCusto
    Left = 336
    Top = 347
  end
end
