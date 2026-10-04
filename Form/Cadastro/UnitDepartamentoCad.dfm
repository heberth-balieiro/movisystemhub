inherited FrmdepartamentoCad: TFrmdepartamentoCad
  Caption = 'Cadastro de Departamento'
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
    inherited BtnSalvar: TStyledBitBtn
      Left = 430
      Top = 59
      Width = 70
      Height = 27
      Caption = 'Incluir'
      TabOrder = 3
      OnClick = BtnSalvarClick
      ExplicitLeft = 430
      ExplicitTop = 59
      ExplicitWidth = 70
      ExplicitHeight = 27
    end
    inherited BtnCancelar: TStyledBitBtn
      Left = 572
      Top = 59
      Width = 70
      Height = 27
      Caption = 'Excluir'
      TabOrder = 5
      OnClick = BtnCancelarClick
      ExplicitLeft = 572
      ExplicitTop = 59
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
      Width = 504
    end
    object gbAtivo: TcxGroupBox
      Left = 582
      Top = 28
      PanelStyle.Active = True
      ParentBackground = False
      ParentColor = False
      TabOrder = 2
      Transparent = True
      Height = 25
      Width = 60
      object cxAtivo: TcxCheckBox
        Left = 4
        Top = 3
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
        TabOrder = 0
        Transparent = True
      end
    end
    object Btneditar: TStyledBitBtn
      Left = 501
      Top = 59
      Width = 70
      Height = 27
      Caption = 'Editar'
      TabOrder = 4
      OnClick = BtneditarClick
      StyleFamily = 'Bootstrap'
      StyleClass = 'Secondary'
    end
    object cxGrid: TcxGrid
      Left = 5
      Top = 87
      Width = 640
      Height = 308
      TabOrder = 6
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
          DataBinding.FieldName = 'id_departamento'
          Width = 53
        end
        object Gridrazao: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'descricao'
          Width = 503
        end
        object Gridativo: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'ativo'
          Width = 70
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = Grid
      end
    end
  end
  inherited Paneltitulo: TPanel
    inherited lblTitulo: TLabel
      Caption = 'Cadastro de Departamento'
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
    Left = 216
    Top = 228
    object mdSituacaoid_departamento: TIntegerField
      FieldName = 'id_departamento'
    end
    object mdSituacaodescricao: TStringField
      FieldName = 'descricao'
      Size = 80
    end
    object mdSituacaoativo: TStringField
      FieldName = 'ativo'
      Size = 10
    end
  end
end
