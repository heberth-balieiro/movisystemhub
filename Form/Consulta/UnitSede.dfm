inherited FrmSede: TFrmSede
  Caption = 'SEDE'
  Color = clWhite
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 17
  inherited PanelButton: TPanel
    TabOrder = 0
  end
  inherited PanelClient: TPanel
    TabOrder = 1
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
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'RecId'
          Visible = False
        end
        object Gridid_sede: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'id_sede'
          Width = 51
        end
        object Gridrazao: TcxGridDBColumn
          Caption = 'Raz'#227'o'
          DataBinding.FieldName = 'razao'
          Width = 222
        end
        object Gridfantasia: TcxGridDBColumn
          Caption = 'Fantasia'
          DataBinding.FieldName = 'fantasia'
          Width = 175
        end
        object Gridcidade: TcxGridDBColumn
          Caption = 'Cidade'
          DataBinding.FieldName = 'cidade'
          Width = 143
        end
        object Gridcnpj: TcxGridDBColumn
          Caption = 'CNPJ'
          DataBinding.FieldName = 'cnpj'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditMask = '999\.999\.999\-99;1;_'
          Width = 104
        end
        object Gridtelefone: TcxGridDBColumn
          Caption = 'Telefone'
          DataBinding.FieldName = 'telefone'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditMask = '!\(99\)9999-9999;1;_'
          Width = 94
        end
        object Gridcelular: TcxGridDBColumn
          Caption = 'Celular'
          DataBinding.FieldName = 'celular'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditMask = '!\(99\)99999-9999;1;_'
          Width = 97
        end
      end
    end
  end
  inherited Paneltitulo: TPanel
    TabOrder = 3
  end
  inherited PanelFiltro: TPanel
    TabOrder = 2
    inherited GBFiltro: TcxGroupBox
      inherited Label2: TLabel
        Visible = False
      end
      inherited EdtBusca: TcxTextEdit
        ExplicitWidth = 588
        ExplicitHeight = 25
        Width = 588
      end
      inherited cxAtivo: TcxComboBox
        Visible = False
        ExplicitHeight = 25
      end
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 416
  end
  inherited Ds: TUniDataSource
    DataSet = mdPesquisa
    Left = 472
  end
  inherited MenuPop: TPopupMenu
    Left = 368
  end
  inherited cxIMGMenu: TcxImageList
    FormatVersion = 1
    Left = 304
    Top = 0
    DesignInfo = 304
  end
  object mdPesquisa: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 240
    Top = 4
    object mdPesquisaid_sede: TIntegerField
      FieldName = 'id_sede'
    end
    object mdPesquisarazao: TStringField
      FieldName = 'razao'
      Size = 120
    end
    object mdPesquisafantasia: TStringField
      FieldName = 'fantasia'
      Size = 120
    end
    object mdPesquisacnpj: TStringField
      FieldName = 'cnpj'
    end
    object mdPesquisatelefone: TStringField
      FieldName = 'telefone'
    end
    object mdPesquisacelular: TStringField
      FieldName = 'celular'
    end
    object mdPesquisacidade: TStringField
      FieldName = 'cidade'
      Size = 60
    end
    object mdPesquisasedeprincipal: TStringField
      FieldName = 'sedeprincipal'
      Size = 1
    end
  end
end
