inherited FrmContas: TFrmContas
  Caption = 'Contas'
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 17
  inherited PanelClient: TPanel
    inherited cxGrid: TcxGrid
      inherited Grid: TcxGridDBTableView
        DataController.DataSource = Ds
        Styles.Content = nil
        Styles.ContentEven = nil
        Styles.ContentOdd = nil
        Styles.Footer = nil
        Styles.Group = nil
        Styles.GroupByBox = nil
        Styles.Header = nil
        Styles.Inactive = nil
        Styles.Indicator = nil
        Styles.Preview = nil
        Styles.Selection = nil
        object Gridid: TcxGridDBColumn
          DataBinding.FieldName = 'id_conta'
          Visible = False
        end
        object Gridcodigo: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'codigo'
          Width = 65
        end
        object GridBanco: TcxGridDBColumn
          Caption = 'Banco'
          DataBinding.FieldName = 'banco'
          Width = 174
        end
        object Gridagencia: TcxGridDBColumn
          Caption = 'Ag'#234'ncia'
          DataBinding.FieldName = 'agencia'
          Width = 77
        end
        object Gridconta: TcxGridDBColumn
          Caption = 'Conta'
          DataBinding.FieldName = 'conta'
          Width = 98
        end
        object Gridcorrentista: TcxGridDBColumn
          Caption = 'Correntista'
          DataBinding.FieldName = 'correntista'
          Width = 390
        end
        object GridAtivo: TcxGridDBColumn
          Caption = 'Ativo'
          DataBinding.FieldName = 'ativo'
          Width = 82
        end
      end
    end
  end
  inherited PanelFiltro: TPanel
    inherited GBFiltro: TcxGroupBox
      inherited EdtBusca: TcxTextEdit
        ExplicitHeight = 25
      end
      inherited cxAtivo: TcxComboBox
        ExplicitHeight = 25
      end
    end
  end
  inherited Ds: TUniDataSource
    DataSet = mdPesquisa
  end
  inherited MenuPop: TPopupMenu
    Left = 368
    Top = 4
  end
  inherited cxIMGMenu: TcxImageList
    FormatVersion = 1
    Left = 408
    DesignInfo = 524696
  end
  object mdPesquisa: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 296
    Top = 12
    object mdPesquisaid_conta: TIntegerField
      FieldName = 'id_conta'
    end
    object mdPesquisacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object mdPesquisabanco: TStringField
      FieldName = 'banco'
      Size = 60
    end
    object mdPesquisaagencia: TStringField
      FieldName = 'agencia'
      Size = 10
    end
    object mdPesquisaconta: TStringField
      FieldName = 'conta'
      Size = 15
    end
    object mdPesquisacorrentista: TStringField
      FieldName = 'correntista'
      Size = 160
    end
    object mdPesquisaativo: TStringField
      FieldName = 'ativo'
      Size = 5
    end
  end
end
