inherited FrmLogs: TFrmLogs
  Caption = 'Logs'
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 17
  inherited PanelClient: TPanel
    object cxGrid: TcxGrid
      Left = 0
      Top = 0
      Width = 900
      Height = 455
      Align = alClient
      TabOrder = 0
      object Grid: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
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
        object Gridid_sincronizar: TcxGridDBColumn
          DataBinding.FieldName = 'id_sincronizar'
          Visible = False
        end
        object Gridtabela: TcxGridDBColumn
          Caption = 'Tabela'
          DataBinding.FieldName = 'tabela'
          Width = 173
        end
        object Griddescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'descricao'
          Width = 441
        end
        object Gridcod_tabela: TcxGridDBColumn
          Caption = 'Cod. Tabela'
          DataBinding.FieldName = 'cod_tabela'
          Width = 99
        end
        object Gridid_registro: TcxGridDBColumn
          DataBinding.FieldName = 'id_registro'
          Visible = False
          Width = 180
        end
        object Gridsituacao: TcxGridDBColumn
          Caption = 'Status'
          DataBinding.FieldName = 'situacao'
          Width = 173
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = Grid
      end
    end
  end
  inherited Paneltitulo: TPanel
    inherited lblTitulo: TLabel
      Caption = 'Painel de Logs'
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 544
    Top = 354
  end
  inherited Ds: TUniDataSource
    DataSet = mdPesquisa
    Left = 512
    Top = 352
  end
  object mdPesquisa: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 472
    Top = 348
    object mdPesquisaid_sincronizar: TIntegerField
      FieldName = 'id_sincronizar'
    end
    object mdPesquisacod_tabela: TIntegerField
      FieldName = 'cod_tabela'
    end
    object mdPesquisaid_registro: TIntegerField
      FieldName = 'id_registro'
    end
    object mdPesquisasituacao: TStringField
      FieldName = 'situacao'
    end
    object mdPesquisatabela: TStringField
      FieldName = 'tabela'
      Size = 45
    end
    object mdPesquisadescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
  end
  object TimerSinc: TTimer
    Interval = 50000
    OnTimer = TimerSincTimer
    Left = 16
    Top = 448
  end
end
