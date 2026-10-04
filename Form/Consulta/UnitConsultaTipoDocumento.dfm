inherited FrmConsultaTipoDocumento: TFrmConsultaTipoDocumento
  Caption = 'Consulta Tipo Documento'
  TextHeight = 15
  inherited cxGrid: TcxGrid
    inherited Grid: TcxGridDBTableView
      DataController.DataSource = ds
      Styles.StyleSheet = FrmPrincipal.CxGridPedido
      object GridColumn1: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'codigo'
        Width = 56
      end
      object GridColumn2: TcxGridDBColumn
        Caption = 'Tipo Documento'
        DataBinding.FieldName = 'descricao'
        Width = 962
      end
    end
  end
  inherited TabSituacao: TTabSet
    TabIndex = 1
  end
  inherited cxgbfiltro: TcxGroupBox
    inherited pHeader: TPanel
      inherited lTitulo: TLabel
        Width = 159
        Caption = 'Documento'
        ExplicitTop = 15
        ExplicitWidth = 159
      end
      inherited pBusca: TPanel
        Left = 169
        Width = 652
        ExplicitLeft = 169
        ExplicitWidth = 652
        inherited pPesquisa: TPanel
          Left = 409
          ExplicitLeft = 413
        end
        inherited pLimpar: TPanel
          Left = 532
          ExplicitLeft = 536
        end
        inherited cxgbPesquisa: TcxGroupBox
          ExplicitWidth = 403
          Width = 403
          inherited edtBusca: TEdit
            Width = 389
            ExplicitWidth = 397
          end
        end
      end
    end
  end
  inherited ds: TDataSource
    DataSet = DM.TabConTipoDoc
  end
end
