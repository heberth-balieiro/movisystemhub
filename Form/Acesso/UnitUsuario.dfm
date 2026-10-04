inherited FrmUsuario: TFrmUsuario
  Caption = 'Usuario'
  Color = clWhite
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
        object Gridid_usuario: TcxGridDBColumn
          DataBinding.FieldName = 'id_usuario'
          Visible = False
        end
        object Gridnome: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'nome'
          Width = 285
        end
        object Gridlogin: TcxGridDBColumn
          Caption = 'Login'
          DataBinding.FieldName = 'login'
          Width = 113
        end
        object Gridemail: TcxGridDBColumn
          Caption = 'E-mail'
          DataBinding.FieldName = 'email'
          Width = 230
        end
        object Griddescricao: TcxGridDBColumn
          Caption = 'Perfil'
          DataBinding.FieldName = 'descricao'
          Width = 178
        end
        object Gridativo: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'ativo'
          Width = 80
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
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 416
    Top = 18
  end
  inherited Ds: TUniDataSource
    DataSet = mdPesquisa
    Left = 240
    Top = 24
  end
  inherited MenuPop: TPopupMenu
    Left = 360
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
    Left = 296
    Top = 16
    DesignInfo = 1048872
  end
  object mdPesquisa: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 192
    Top = 20
    object mdPesquisaid_usuario: TIntegerField
      FieldName = 'id_usuario'
    end
    object mdPesquisanome: TStringField
      FieldName = 'nome'
      Size = 165
    end
    object mdPesquisalogin: TStringField
      FieldName = 'login'
      Size = 45
    end
    object mdPesquisaemail: TStringField
      FieldName = 'email'
      Size = 180
    end
    object mdPesquisadescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object mdPesquisaativo: TStringField
      FieldName = 'ativo'
      Size = 8
    end
  end
end
