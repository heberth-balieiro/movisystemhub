inherited FrmLocalizacao: TFrmLocalizacao
  Caption = 'Localiza'#231#227'o'
  Color = clWhite
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 17
  inherited PanelClient: TPanel
    inherited cxGrid: TcxGrid
      Font.Height = -12
      ParentFont = False
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
        object Gridid_localizacao: TcxGridDBColumn
          DataBinding.FieldName = 'id_localizacao'
          Visible = False
        end
        object Gridcodigo: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'codigo'
          Width = 62
        end
        object Gridlocalizacao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'localizacao'
          Width = 743
        end
        object Gridativo: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'ativo'
          Width = 81
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
      inherited BtnLimpar: TStyledBitBtn [5]
      end
      inherited BtnNovo: TStyledBitBtn [6]
      end
      inherited BtnPesquisar: TStyledBitBtn [7]
      end
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Top = 10
  end
  inherited Ds: TUniDataSource
    DataSet = mdPesquisa
    Left = 552
    Top = 8
  end
  inherited MenuPop: TPopupMenu
    Left = 424
    Top = 12
  end
  inherited cxIMGMenu: TcxImageList
    FormatVersion = 1
  end
  object mdPesquisa: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 288
    Top = 4
    object mdPesquisaid_localizacao: TIntegerField
      FieldName = 'id_localizacao'
    end
    object mdPesquisacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object mdPesquisalocalizacao: TStringField
      FieldName = 'localizacao'
      Size = 60
    end
    object mdPesquisaativo: TStringField
      FieldName = 'ativo'
      Size = 10
    end
  end
end
