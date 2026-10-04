inherited FrmPesCidade: TFrmPesCidade
  Caption = 'Cidade'
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
        object Gridid_cidade: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'id_cidade'
          Width = 56
        end
        object Gridcidade: TcxGridDBColumn
          Caption = 'Cidade'
          DataBinding.FieldName = 'cidade'
          Width = 665
        end
        object Griduf: TcxGridDBColumn
          Caption = 'Estado'
          DataBinding.FieldName = 'uf'
          Width = 88
        end
        object GridSituacao: TcxGridDBColumn
          Caption = 'Ativo'
          DataBinding.FieldName = 'inativo'
          Width = 77
        end
      end
    end
  end
  inherited Paneltitulo: TPanel
    inherited lblTitulo: TLabel
      ExplicitLeft = 12
      ExplicitWidth = 795
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
      inherited BtnNovo: TStyledBitBtn
        Top = 37
        ExplicitTop = 37
      end
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 424
  end
  inherited Ds: TUniDataSource
    DataSet = mdPesquisa
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
  inherited MenuPop: TPopupMenu
    Left = 280
    Top = 4
  end
  inherited cxIMGMenu: TcxImageList
    FormatVersion = 1
    Left = 328
    Top = 0
    DesignInfo = 328
  end
  object mdPesquisa: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 568
    Top = 8
    object mdPesquisaid_cidade: TIntegerField
      FieldName = 'id_cidade'
    end
    object mdPesquisacidade: TStringField
      FieldName = 'cidade'
      Size = 160
    end
    object mdPesquisauf: TStringField
      FieldName = 'uf'
      Size = 2
    end
    object mdPesquisainativo: TStringField
      FieldName = 'inativo'
      Size = 5
    end
    object mdPesquisacid_ibge: TIntegerField
      FieldName = 'cid_ibge'
    end
  end
end
