inherited FrmVeiculoAnexoDoc: TFrmVeiculoAnexoDoc
  Caption = 'Ve'#237'culo Anexo'
  TextHeight = 17
  inherited Paneltitulo: TPanel
    inherited lblTitulo: TLabel
      Caption = 'Ve'#237'culo Anexar Documento'
    end
  end
  inherited cxGroupBox1: TcxGroupBox
    inherited cxGroupBox2: TcxGroupBox
      inherited edtDescricao: TcxTextEdit
        ExplicitHeight = 25
      end
      inherited EdtCaminho: TcxButtonEdit
        ExplicitHeight = 25
      end
    end
    inherited cxGrid: TcxGrid
      inherited Grid: TcxGridDBTableView
        DataController.DataSource = dsAnexo
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            FieldName = 'id_anexo'
            Column = GridColumn1
          end>
        Styles.StyleSheet = FrmPrincipal.CxGridPedido
        object GridColumn1: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'id_anexo'
          Width = 40
        end
        object GridDescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'descricao'
          Width = 592
        end
        object GridExtensao: TcxGridDBColumn
          Caption = 'Tipo'
          DataBinding.FieldName = 'extensao'
          Width = 110
        end
      end
    end
  end
  inherited OpenAnexo: TOpenTextFileDialog
    Left = 64
    Top = 448
  end
  object dsAnexo: TUniDataSource
    DataSet = DM.TabAnexo
    Left = 136
    Top = 448
  end
end
