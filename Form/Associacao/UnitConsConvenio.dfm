inherited FrmConConveio: TFrmConConveio
  Caption = 'Conv'#234'nio'
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
          VisibleForCustomization = False
        end
        object Gridid_convenio: TcxGridDBColumn
          DataBinding.FieldName = 'id_convenio'
          Visible = False
          VisibleForCustomization = False
        end
        object Gridcodigo: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'codigo'
          Width = 53
        end
        object Gridnome: TcxGridDBColumn
          Caption = 'Nome/Raz'#227'o'
          DataBinding.FieldName = 'nome'
          Width = 280
        end
        object Gridapelido: TcxGridDBColumn
          Caption = 'Apelido/Fantasia'
          DataBinding.FieldName = 'apelido'
          Visible = False
          Width = 203
        end
        object Gridncidade: TcxGridDBColumn
          Caption = 'Cidade'
          DataBinding.FieldName = 'ncidade'
          Width = 148
        end
        object Gridcpf: TcxGridDBColumn
          Caption = 'CPF/CNPJ'
          DataBinding.FieldName = 'cpf'
          OnGetDisplayText = GridcpfGetDisplayText
          Width = 139
        end
        object Gridtelefone: TcxGridDBColumn
          Caption = 'Telefone'
          DataBinding.FieldName = 'telefone'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditMask = '!\(99\)9999-9999;1;_'
          Width = 98
        end
        object Gridcelular: TcxGridDBColumn
          Caption = 'Celular'
          DataBinding.FieldName = 'celular'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditMask = '!\(99\)99999-9999;1;_'
          Width = 103
        end
        object Gridwhatsapp: TcxGridDBColumn
          Caption = 'WhatsApp'
          DataBinding.FieldName = 'whatsapp'
          Visible = False
          Width = 60
        end
        object Gridsituacao: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'situacao'
          Width = 65
        end
      end
    end
  end
  inherited PanelFiltro: TPanel
    inherited GBFiltro: TcxGroupBox
      inherited Label2: TLabel
        Left = 513
        ExplicitLeft = 513
      end
    end
  end
  inherited Ds: TUniDataSource
    DataSet = mdPesquisa
    Left = 312
    Top = 216
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
    object N2: TMenuItem
      Caption = '-'
    end
    object BtnSincronizar: TMenuItem
      Caption = 'Sincronizar'
      ImageIndex = 5
      OnClick = BtnSincronizarClick
    end
  end
  inherited cxIMGMenu: TcxImageList
    FormatVersion = 1
  end
  object mdPesquisa: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 376
    Top = 220
    object mdPesquisaid_convenio: TIntegerField
      FieldName = 'id_convenio'
    end
    object mdPesquisacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object mdPesquisacpf: TStringField
      FieldName = 'cpf'
      Size = 25
    end
    object mdPesquisanome: TStringField
      FieldName = 'nome'
      Size = 150
    end
    object mdPesquisaapelido: TStringField
      FieldName = 'apelido'
      Size = 100
    end
    object mdPesquisancidade: TStringField
      FieldName = 'ncidade'
      Size = 60
    end
    object mdPesquisatelefone: TStringField
      FieldName = 'telefone'
    end
    object mdPesquisacelular: TStringField
      FieldName = 'celular'
    end
    object mdPesquisawhatsapp: TStringField
      FieldName = 'whatsapp'
    end
    object mdPesquisasituacao: TStringField
      FieldName = 'situacao'
      Size = 8
    end
  end
end
