inherited FrmPesqCFOP: TFrmPesqCFOP
  Caption = 'CFOP'
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
        object GridRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
        end
        object Gridid_cfop: TcxGridDBColumn
          DataBinding.FieldName = 'id_cfop'
          Visible = False
        end
        object Gridcodigo: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'codigo'
          Width = 52
        end
        object Gridnatureza: TcxGridDBColumn
          Caption = 'Natureza'
          DataBinding.FieldName = 'natureza'
          Width = 472
        end
        object Gridcfop: TcxGridDBColumn
          Caption = 'CFOP'
          DataBinding.FieldName = 'cfop'
          Width = 64
        end
        object Gridoperacao: TcxGridDBColumn
          Caption = 'Operacao'
          DataBinding.FieldName = 'operacao'
          Width = 126
        end
        object Gridtipo: TcxGridDBColumn
          Caption = 'Tipo'
          DataBinding.FieldName = 'tipo'
          Width = 114
        end
        object Gridativo: TcxGridDBColumn
          Caption = 'Ativo'
          DataBinding.FieldName = 'ativo'
          Width = 58
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
    Left = 528
  end
  inherited MenuPop: TPopupMenu
    Left = 248
    Top = 4
  end
  inherited cxIMGMenu: TcxImageList
    FormatVersion = 1
    Left = 296
    Top = 0
    DesignInfo = 296
  end
  object cxButton: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 524472
  end
  object mdPesquisa: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 360
    Top = 4
    object mdPesquisaid_cfop: TIntegerField
      FieldName = 'id_cfop'
    end
    object mdPesquisacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object mdPesquisanatureza: TStringField
      FieldName = 'natureza'
      Size = 160
    end
    object mdPesquisaoperacao: TStringField
      FieldName = 'operacao'
      Size = 15
    end
    object mdPesquisatipo: TStringField
      FieldName = 'tipo'
      Size = 15
    end
    object mdPesquisaativo: TStringField
      FieldName = 'ativo'
      Size = 5
    end
    object mdPesquisacfop: TStringField
      FieldName = 'cfop'
      Size = 4
    end
  end
end
