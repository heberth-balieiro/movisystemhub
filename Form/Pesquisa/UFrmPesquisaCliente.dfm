inherited FrmPesquisaCliente: TFrmPesquisaCliente
  Caption = 'Pesquisa Cliente'
  TextHeight = 17
  inherited cxGrid: TcxGrid
    ExplicitTop = 100
    ExplicitHeight = 341
    inherited Grid: TcxGridDBTableView
      OnCellDblClick = GridCellDblClick
      DataController.DataSource = ds
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'id_socio'
          Column = GridCodigo
        end>
      Styles.StyleSheet = FrmPrincipal.CxGridPedido
      object GridCodigo: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'codigo'
        Width = 52
      end
      object GridNome: TcxGridDBColumn
        Caption = 'Nome'
        DataBinding.FieldName = 'nome'
        Width = 263
      end
      object GridApelido: TcxGridDBColumn
        Caption = 'Apelido'
        DataBinding.FieldName = 'apelido'
        Width = 108
      end
      object GridCPF: TcxGridDBColumn
        Caption = 'CPF'
        DataBinding.FieldName = 'cpf'
        Width = 127
      end
      object GridTelefone: TcxGridDBColumn
        Caption = 'Telefone'
        DataBinding.FieldName = 'telefone'
        Width = 102
      end
      object Gridcelular: TcxGridDBColumn
        Caption = 'Celular'
        DataBinding.FieldName = 'celular'
        Width = 102
      end
      object Gridwhatsapp: TcxGridDBColumn
        Caption = 'WhatsApp'
        DataBinding.FieldName = 'whatsapp'
        Width = 102
      end
    end
  end
  inherited cxgbfiltro: TcxGroupBox
    inherited pHeader: TPanel
      inherited lTitulo: TLabel
        Caption = 'Cliente'
      end
      inherited pBusca: TPanel
        inherited pPesquisa: TPanel
          ExplicitLeft = 410
          ExplicitHeight = 33
        end
        inherited pLimpar: TPanel
          ExplicitLeft = 533
          ExplicitHeight = 33
        end
        inherited cxgbPesquisa: TcxGroupBox
          inherited edtBusca: TEdit
            Font.Height = -13
            OnChange = edtBuscaChange
            ExplicitLeft = 2
            ExplicitTop = 22
            ExplicitWidth = 400
            ExplicitHeight = 25
          end
        end
      end
      inherited PPopPap: TPanel
        ExplicitLeft = 818
        ExplicitHeight = 33
        inherited Image1: TImage
          Height = 33
          Visible = False
          ExplicitHeight = 33
        end
      end
    end
  end
  inherited ds: TDataSource
    DataSet = TabCliente
    Left = 504
  end
  object TabCliente: TClientDataSet
    PersistDataPacket.Data = {
      110200009619E0BD01000000180000001300000000000300000011020869645F
      736F63696F040001000000000006636F6469676F040001000000000008736974
      756163616F0100490000000100055749445448020002000A00046E6F6D650100
      49000000010005574944544802000200A000076170656C69646F010049000000
      0100055749445448020002006400036365700100490000000100055749445448
      02000200140008656E64657265636F0100490000000100055749445448020002
      006400066E756D65726F01004900000001000557494454480200020014000662
      616972726F0100490000000100055749445448020002003C000B636F6D706C65
      6D656E746F0100490000000100055749445448020002003C000874656C65666F
      6E6501004900000001000557494454480200020014000763656C756C61720100
      4900000001000557494454480200020014000877686174736170700100490000
      0001000557494454480200020014000363706601004900000001000557494454
      4802000200140005656D61696C01004900000001000557494454480200020096
      00036F627304004B000000010007535542545950450200490005005465787400
      05617669736F04004B0000000100075355425459504502004900050054657874
      0006636964616465010049000000010005574944544802000200500002756601
      004900000001000557494454480200020002000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 432
    Top = 448
    object TabClienteid_socio: TIntegerField
      FieldName = 'id_socio'
    end
    object TabClientecodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabClientesituacao: TStringField
      FieldName = 'situacao'
      Size = 10
    end
    object TabClientenome: TStringField
      FieldName = 'nome'
      Size = 160
    end
    object TabClienteapelido: TStringField
      FieldName = 'apelido'
      Size = 100
    end
    object TabClientecep: TStringField
      FieldName = 'cep'
    end
    object TabClienteendereco: TStringField
      FieldName = 'endereco'
      Size = 100
    end
    object TabClientenumero: TStringField
      FieldName = 'numero'
    end
    object TabClientebairro: TStringField
      FieldName = 'bairro'
      Size = 60
    end
    object TabClientecomplemento: TStringField
      FieldName = 'complemento'
      Size = 60
    end
    object TabClientetelefone: TStringField
      FieldName = 'telefone'
    end
    object TabClientecelular: TStringField
      FieldName = 'celular'
    end
    object TabClientewhatsapp: TStringField
      FieldName = 'whatsapp'
    end
    object TabClientecpf: TStringField
      FieldName = 'cpf'
    end
    object TabClienteemail: TStringField
      FieldName = 'email'
      Size = 150
    end
    object TabClienteobs: TMemoField
      FieldName = 'obs'
      BlobType = ftMemo
    end
    object TabClienteaviso: TMemoField
      FieldName = 'aviso'
      BlobType = ftMemo
    end
    object TabClientecidade: TStringField
      FieldName = 'cidade'
      Size = 80
    end
    object TabClienteuf: TStringField
      FieldName = 'uf'
      Size = 2
    end
  end
end
