inherited FrmGerenciarCompraVeiculo: TFrmGerenciarCompraVeiculo
  Caption = 'FrmGerenciarCompraVeiculo'
  TextHeight = 15
  inherited cxGrid: TcxGrid
    Top = 121
    Height = 370
    Align = alTop
    ExplicitTop = 121
    ExplicitHeight = 370
    inherited Grid: TcxGridDBTableView
      DataController.DataSource = ds
      Styles.StyleSheet = FrmPrincipal.CxGridPedido
      object GridData: TcxGridDBColumn
        Caption = 'Data'
        DataBinding.FieldName = 'data'
        Width = 70
      end
      object GridHora: TcxGridDBColumn
        Caption = 'Hora'
        DataBinding.FieldName = 'hora'
        Width = 53
      end
      object GridContrato: TcxGridDBColumn
        Caption = 'Contrato'
        DataBinding.FieldName = 'numero'
        Width = 65
      end
      object GridPessoa: TcxGridDBColumn
        Caption = 'Pessoa'
        DataBinding.FieldName = 'nmpessoa'
        Width = 503
      end
      object GridResponsavel: TcxGridDBColumn
        Caption = 'Respons'#225'vel'
        DataBinding.FieldName = 'nmresponsavel'
        Width = 207
      end
      object GridTota: TcxGridDBColumn
        Caption = 'Total'
        DataBinding.FieldName = 'total'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Width = 120
      end
    end
  end
  inherited TabSituacao: TTabSet
    Visible = False
  end
  inherited cxgbfiltro: TcxGroupBox
    inherited pHeader: TPanel
      inherited lTitulo: TLabel
        Caption = 'Entrada'
      end
      inherited pNovo: TPanel
        inherited btnNovo: TSpeedButton
          Height = 24
        end
      end
      inherited pBusca: TPanel
        inherited pPesquisa: TPanel
          inherited btnBusca: TSpeedButton
            Height = 24
          end
        end
        inherited pLimpar: TPanel
          inherited btnLimpar: TSpeedButton
            Height = 24
          end
        end
      end
      inherited PPopPap: TPanel
        inherited Image1: TImage
          Height = 24
        end
      end
    end
  end
  object pButoon: TPanel [3]
    Left = 0
    Top = 100
    Width = 1032
    Height = 21
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object TabFiltroStatus: TTabSet
      Left = 768
      Top = 0
      Width = 264
      Height = 21
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      SoftTop = True
      Style = tsSoftTabs
      Tabs.Strings = (
        'Todos'
        'Aberto'
        'Fechado'
        'Cancelado')
      TabIndex = 0
      OnClick = TabSituacaoClick
    end
    object TabFiltroTipo: TTabSet
      Left = 0
      Top = 0
      Width = 768
      Height = 21
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      SoftTop = True
      Style = tsSoftTabs
      Tabs.Strings = (
        'Todos'
        'Consignado'
        'Consignado Loja'
        'Pr'#243'prio'
        'Zero')
      TabIndex = 0
      OnClick = TabSituacaoClick
    end
  end
  object TabSetDetalhes: TTabSet [4]
    Left = 0
    Top = 491
    Width = 1032
    Height = 21
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    SoftTop = True
    Style = tsModernTabs
    Tabs.Strings = (
      'Ve'#237'culo'
      'Troca'
      'Financeiro')
    TabIndex = 0
    OnClick = TabSetDetalhesClick
  end
  object cxGridDetalhes: TcxGrid [5]
    Left = 0
    Top = 512
    Width = 1032
    Height = 81
    Align = alClient
    TabOrder = 5
    object Vw_Veiculo: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = dsVeiculosItens
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'id_compra_itens'
          Column = Vw_VeiculoCodigo
        end
        item
          Format = 'R$ #,##0.00'
          Kind = skSum
          FieldName = 'total'
          Column = Vw_VeiculoValorTota
          DisplayText = 'R$ #,##0.00'
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o>'
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = FrmPrincipal.CxGridPedido
      object Vw_VeiculoCodigo: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'codigo'
        Width = 51
      end
      object Vw_VeiculoPlaca: TcxGridDBColumn
        Caption = 'Placa'
        DataBinding.FieldName = 'nmplaca'
        Width = 77
      end
      object Vw_VeiculoMarcaModelo: TcxGridDBColumn
        Caption = 'Marca/Modelo'
        DataBinding.FieldName = 'descricao'
        Width = 576
      end
      object Vw_VeiculoCor: TcxGridDBColumn
        Caption = 'Cor'
        DataBinding.FieldName = 'cor'
        Width = 117
      end
      object Vw_VeiculoAnoModelo: TcxGridDBColumn
        Caption = 'Ano/Modelo'
        DataBinding.FieldName = 'anomodelo'
        Width = 104
      end
      object Vw_VeiculoValorTota: TcxGridDBColumn
        Caption = 'Valor'
        DataBinding.FieldName = 'total'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Width = 105
      end
    end
    object Vw_Troca: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = dsTroca
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'id_produto_veiculo'
          Column = Vw_TrocaCodigo
        end
        item
          Format = 'R$ #,##0.00'
          Kind = skSum
          FieldName = 'total'
          Column = Vw_TrocaValor
          DisplayText = 'R$ #,##0.00'
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o>'
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = FrmPrincipal.CxGridPedido
      object Vw_TrocaCodigo: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'codigo'
        Width = 52
      end
      object Vw_TrocaPlaca: TcxGridDBColumn
        Caption = 'Placa'
        DataBinding.FieldName = 'nmplaca'
        Width = 72
      end
      object Vw_TrocaMarcaModelo: TcxGridDBColumn
        Caption = 'Marca/Modelo'
        DataBinding.FieldName = 'descricao'
        Width = 540
      end
      object Vw_TrocaCor: TcxGridDBColumn
        Caption = 'Cor'
        DataBinding.FieldName = 'cor'
        Width = 127
      end
      object Vw_TrocaAnoModelo: TcxGridDBColumn
        Caption = 'Ano/Modelo'
        DataBinding.FieldName = 'anomodelo'
        Width = 111
      end
      object Vw_TrocaValor: TcxGridDBColumn
        Caption = 'Valor'
        DataBinding.FieldName = 'total'
        Width = 128
      end
    end
    object Vw_Financeiro: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = dsFinanceiro
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'id_pagamento'
          Column = Vw_FinanceiroData
        end
        item
          Kind = skSum
          FieldName = 'valor'
          Column = Vw_Financeirovalor
          DisplayText = 'R$ #,##0.00'
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o>'
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = FrmPrincipal.CxGridPedido
      object Vw_FinanceiroData: TcxGridDBColumn
        Caption = 'Data'
        DataBinding.FieldName = 'data_pagamento'
        Width = 43
      end
      object Vw_FinanceiroPrazo: TcxGridDBColumn
        Caption = 'Prazo'
        DataBinding.FieldName = 'forma_pagamento'
        Width = 228
      end
      object Vw_FinanceiroObs: TcxGridDBColumn
        Caption = 'Observa'#231#227'o'
        DataBinding.FieldName = 'observacao'
        Width = 341
      end
      object Vw_Financeirovalor: TcxGridDBColumn
        Caption = 'Valor'
        DataBinding.FieldName = 'valor'
        Width = 54
      end
    end
    object cxGridDetalhesLevel: TcxGridLevel
      GridView = Vw_Veiculo
    end
  end
  inherited ds: TDataSource
    DataSet = TabConsEntrada
    Left = 368
    Top = 552
  end
  inherited frxDBListagem: TfrxDBDataset
    Left = 776
  end
  inherited Popup: TPopupMenu
    object Btncancelar: TMenuItem [2]
      Caption = 'Cancelar'
      OnClick = BtncancelarClick
    end
    object N3: TMenuItem [3]
      Caption = '-'
    end
    object btnReabrir: TMenuItem [4]
      Caption = 'Reabrir opera'#231#227'o'
      OnClick = btnReabrirClick
    end
    object Reabriroperao2: TMenuItem [5]
      Caption = 'Gerar Financeiro'
    end
    object GerarEstoque1: TMenuItem [6]
      Caption = 'Gerar Estoque'
    end
    object N4: TMenuItem [7]
      Caption = '-'
    end
    object Envio2: TMenuItem [8]
      Caption = 'Envio'
      object WhatsApp1: TMenuItem
        Caption = 'WhatsApp'
      end
      object Email1: TMenuItem
        Caption = 'E-mail'
      end
    end
    object Envio1: TMenuItem [9]
      Caption = 'Assinatura Digital'
      object EnviarContrato1: TMenuItem
        Caption = 'Enviar Contrato'
      end
      object ReceberContrato1: TMenuItem
        Caption = 'Receber Contrato'
      end
      object ReceberContrato2: TMenuItem
        Caption = 'Imprimir Contrato'
      end
      object PginaWeb1: TMenuItem
        Caption = 'P'#225'gina Web'
      end
    end
    object Impresso1: TMenuItem
      Caption = 'Impress'#227'o'
      object Contrato1: TMenuItem
        Caption = 'Contrato'
      end
      object CheckList1: TMenuItem
        Caption = 'Check-List'
      end
    end
    object N2: TMenuItem
      Caption = '-'
    end
  end
  object TabConsEntrada: TClientDataSet
    PersistDataPacket.Data = {
      AE0100009619E0BD010000001800000011000000000003000000AE010969645F
      636F6D70726104000100000000000A69645F656D707265736104000100000000
      000A69645F7573756172696F0400010000000000066E756D65726F0400010000
      0000000464617461040006000000000004686F72610400070000000000047469
      706F0100490000000100055749445448020002002D000969645F706573736F61
      04000100000000000E69645F726573706F6E736176656C040001000000000003
      6F6273020049000000010005574944544802000200F40108736974756163616F
      01004900000001000557494454480200020001001067657261725F66696E616E
      636569726F01004900000001000557494454480200020001000D67657261725F
      6573746F71756501004900000001000557494454480200020001000B64617461
      5F63726961646F0800080000000000086E6D706573736F610100490000000100
      0557494454480200020078000D6E6D726573706F6E736176656C010049000000
      0100055749445448020002005A0005746F74616C080004000000010007535542
      545950450200490006004D6F6E6579000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_compra'
        DataType = ftInteger
      end
      item
        Name = 'id_empresa'
        DataType = ftInteger
      end
      item
        Name = 'id_usuario'
        DataType = ftInteger
      end
      item
        Name = 'numero'
        DataType = ftInteger
      end
      item
        Name = 'data'
        DataType = ftDate
      end
      item
        Name = 'hora'
        DataType = ftTime
      end
      item
        Name = 'tipo'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'id_pessoa'
        DataType = ftInteger
      end
      item
        Name = 'id_responsavel'
        DataType = ftInteger
      end
      item
        Name = 'obs'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'situacao'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'gerar_financeiro'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'gerar_estoque'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'data_criado'
        DataType = ftDateTime
      end
      item
        Name = 'nmpessoa'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'nmresponsavel'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'total'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 440
    Top = 528
    object TabConsEntradaid_compra: TIntegerField
      FieldName = 'id_compra'
    end
    object TabConsEntradaid_empresa: TIntegerField
      FieldName = 'id_empresa'
    end
    object TabConsEntradaid_usuario: TIntegerField
      FieldName = 'id_usuario'
    end
    object TabConsEntradanumero: TIntegerField
      FieldName = 'numero'
    end
    object TabConsEntradadata: TDateField
      FieldName = 'data'
    end
    object TabConsEntradahora: TTimeField
      FieldName = 'hora'
    end
    object TabConsEntradatipo: TStringField
      FieldName = 'tipo'
      Size = 45
    end
    object TabConsEntradaid_pessoa: TIntegerField
      FieldName = 'id_pessoa'
    end
    object TabConsEntradaid_responsavel: TIntegerField
      FieldName = 'id_responsavel'
    end
    object TabConsEntradaobs: TStringField
      FieldName = 'obs'
      Size = 500
    end
    object TabConsEntradasituacao: TStringField
      FieldName = 'situacao'
      Size = 1
    end
    object TabConsEntradagerar_financeiro: TStringField
      FieldName = 'gerar_financeiro'
      Size = 1
    end
    object TabConsEntradagerar_estoque: TStringField
      FieldName = 'gerar_estoque'
      Size = 1
    end
    object TabConsEntradadata_criado: TDateTimeField
      FieldName = 'data_criado'
    end
    object TabConsEntradanmpessoa: TStringField
      FieldName = 'nmpessoa'
      Size = 120
    end
    object TabConsEntradanmresponsavel: TStringField
      FieldName = 'nmresponsavel'
      Size = 90
    end
    object TabConsEntradatotal: TCurrencyField
      FieldName = 'total'
    end
  end
  object TabConsVeiculosEntrada: TClientDataSet
    PersistDataPacket.Data = {
      950300009619E0BD01000000180000002600000000000300000095030F69645F
      636F6D7072615F6974656E7304000100000000000969645F636F6D7072610400
      0100000000001269645F70726F6475746F5F76656963756C6F04000100000000
      00047174646508000400000000000C7072635F756E69746172696F0800040000
      0000000F646573635F70657263656E7475616C08000400000000000A64657363
      5F726561697308000400000000000964657363726963616F0100490000000100
      05574944544802000200B4000B636F6D706C656D656E746F0200490000000100
      05574944544802000200F40108737562746F74616C080004000000000005746F
      74616C08000400000000000D76656963756C6F5F74726F636101004900000001
      000557494454480200020001000F76656963756C6F5F70726366697065080004
      00000000001076656963756C6F5F70726376656E646108000400000000000464
      61746104000600000000000B646174615F63726961646F08000800000000000A
      69645F656D707265736104000100000000000A69645F7573756172696F040001
      00000000001076656963756C6F706572636C7563726F08000400000000000E61
      7475616C697A6172666963686101004900000001000557494454480200020001
      0007746178616D65730800040000000000077461786164696108000400000000
      000A746F74616C706174696F080004000000000010636F6D697373616F6C6F6A
      6170657263080004000000000011636F6D697373616F6C6F6A6176616C6F7208
      0004000000000010636F6D697373616F76656E64706572630800040000000000
      11636F6D697373616F76656E6476616C6F7208000400000000000E7461786163
      6F6E7369676E61646F080004000000000011646174617265746972616461636F
      6E736904000600000000001176656963756C6F6C7563726F76616C6F72080004
      00000000001676656963756C6F5F76616C6F7270726174696361646F08000400
      00000000097072635F637573746F08000400000000001276656963756C6F5F76
      616C6F7274726F6361080004000000000006636F6469676F0400010000000000
      1064657363726963616F5F66697363616C010049000000010005574944544802
      000200BE00076E6D706C61636101004900000001000557494454480200020007
      0009616E6F6D6F64656C6F0100490000000100055749445448020002000C0003
      636F7201004900000001000557494454480200020032000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_compra_itens'
        DataType = ftInteger
      end
      item
        Name = 'id_compra'
        DataType = ftInteger
      end
      item
        Name = 'id_produto_veiculo'
        DataType = ftInteger
      end
      item
        Name = 'qtde'
        DataType = ftFloat
      end
      item
        Name = 'prc_unitario'
        DataType = ftFloat
      end
      item
        Name = 'desc_percentual'
        DataType = ftFloat
      end
      item
        Name = 'desc_reais'
        DataType = ftFloat
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 180
      end
      item
        Name = 'complemento'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'subtotal'
        DataType = ftFloat
      end
      item
        Name = 'total'
        DataType = ftFloat
      end
      item
        Name = 'veiculo_troca'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'veiculo_prcfipe'
        DataType = ftFloat
      end
      item
        Name = 'veiculo_prcvenda'
        DataType = ftFloat
      end
      item
        Name = 'data'
        DataType = ftDate
      end
      item
        Name = 'data_criado'
        DataType = ftDateTime
      end
      item
        Name = 'id_empresa'
        DataType = ftInteger
      end
      item
        Name = 'id_usuario'
        DataType = ftInteger
      end
      item
        Name = 'veiculoperclucro'
        DataType = ftFloat
      end
      item
        Name = 'atualizarficha'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'taxames'
        DataType = ftFloat
      end
      item
        Name = 'taxadia'
        DataType = ftFloat
      end
      item
        Name = 'totalpatio'
        DataType = ftFloat
      end
      item
        Name = 'comissaolojaperc'
        DataType = ftFloat
      end
      item
        Name = 'comissaolojavalor'
        DataType = ftFloat
      end
      item
        Name = 'comissaovendperc'
        DataType = ftFloat
      end
      item
        Name = 'comissaovendvalor'
        DataType = ftFloat
      end
      item
        Name = 'taxaconsignado'
        DataType = ftFloat
      end
      item
        Name = 'dataretiradaconsi'
        DataType = ftDate
      end
      item
        Name = 'veiculolucrovalor'
        DataType = ftFloat
      end
      item
        Name = 'veiculo_valorpraticado'
        DataType = ftFloat
      end
      item
        Name = 'prc_custo'
        DataType = ftFloat
      end
      item
        Name = 'veiculo_valortroca'
        DataType = ftFloat
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'descricao_fiscal'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'nmplaca'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'anomodelo'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'cor'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    IndexFieldNames = 'id_compra'
    MasterFields = 'id_compra'
    MasterSource = ds
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 584
    Top = 528
    object TabConsVeiculosEntradaid_compra_itens: TIntegerField
      FieldName = 'id_compra_itens'
    end
    object TabConsVeiculosEntradaid_compra: TIntegerField
      FieldName = 'id_compra'
    end
    object TabConsVeiculosEntradaid_produto_veiculo: TIntegerField
      FieldName = 'id_produto_veiculo'
    end
    object TabConsVeiculosEntradaqtde: TFloatField
      FieldName = 'qtde'
    end
    object TabConsVeiculosEntradaprc_unitario: TFloatField
      FieldName = 'prc_unitario'
    end
    object TabConsVeiculosEntradadesc_percentual: TFloatField
      FieldName = 'desc_percentual'
    end
    object TabConsVeiculosEntradadesc_reais: TFloatField
      FieldName = 'desc_reais'
    end
    object TabConsVeiculosEntradadescricao: TStringField
      FieldName = 'descricao'
      Size = 180
    end
    object TabConsVeiculosEntradacomplemento: TStringField
      FieldName = 'complemento'
      Size = 500
    end
    object TabConsVeiculosEntradasubtotal: TFloatField
      FieldName = 'subtotal'
    end
    object TabConsVeiculosEntradatotal: TFloatField
      FieldName = 'total'
    end
    object TabConsVeiculosEntradaveiculo_troca: TStringField
      FieldName = 'veiculo_troca'
      Size = 1
    end
    object TabConsVeiculosEntradaveiculo_prcfipe: TFloatField
      FieldName = 'veiculo_prcfipe'
    end
    object TabConsVeiculosEntradaveiculo_prcvenda: TFloatField
      FieldName = 'veiculo_prcvenda'
    end
    object TabConsVeiculosEntradadata: TDateField
      FieldName = 'data'
    end
    object TabConsVeiculosEntradadata_criado: TDateTimeField
      FieldName = 'data_criado'
    end
    object TabConsVeiculosEntradaid_empresa: TIntegerField
      FieldName = 'id_empresa'
    end
    object TabConsVeiculosEntradaid_usuario: TIntegerField
      FieldName = 'id_usuario'
    end
    object TabConsVeiculosEntradaveiculoperclucro: TFloatField
      FieldName = 'veiculoperclucro'
    end
    object TabConsVeiculosEntradaatualizarficha: TStringField
      FieldName = 'atualizarficha'
      Size = 1
    end
    object TabConsVeiculosEntradataxames: TFloatField
      FieldName = 'taxames'
    end
    object TabConsVeiculosEntradataxadia: TFloatField
      FieldName = 'taxadia'
    end
    object TabConsVeiculosEntradatotalpatio: TFloatField
      FieldName = 'totalpatio'
    end
    object TabConsVeiculosEntradacomissaolojaperc: TFloatField
      FieldName = 'comissaolojaperc'
    end
    object TabConsVeiculosEntradacomissaolojavalor: TFloatField
      FieldName = 'comissaolojavalor'
    end
    object TabConsVeiculosEntradacomissaovendperc: TFloatField
      FieldName = 'comissaovendperc'
    end
    object TabConsVeiculosEntradacomissaovendvalor: TFloatField
      FieldName = 'comissaovendvalor'
    end
    object TabConsVeiculosEntradataxaconsignado: TFloatField
      FieldName = 'taxaconsignado'
    end
    object TabConsVeiculosEntradadataretiradaconsi: TDateField
      FieldName = 'dataretiradaconsi'
    end
    object TabConsVeiculosEntradaveiculolucrovalor: TFloatField
      FieldName = 'veiculolucrovalor'
    end
    object TabConsVeiculosEntradaveiculo_valorpraticado: TFloatField
      FieldName = 'veiculo_valorpraticado'
    end
    object TabConsVeiculosEntradaprc_custo: TFloatField
      FieldName = 'prc_custo'
    end
    object TabConsVeiculosEntradaveiculo_valortroca: TFloatField
      FieldName = 'veiculo_valortroca'
    end
    object TabConsVeiculosEntradacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabConsVeiculosEntradadescricao_fiscal: TStringField
      FieldName = 'descricao_fiscal'
      Size = 190
    end
    object TabConsVeiculosEntradanmplaca: TStringField
      FieldName = 'nmplaca'
      Size = 7
    end
    object TabConsVeiculosEntradaanomodelo: TStringField
      FieldName = 'anomodelo'
      Size = 12
    end
    object TabConsVeiculosEntradacor: TStringField
      FieldName = 'cor'
      Size = 50
    end
  end
  object dsVeiculosItens: TDataSource
    DataSet = TabConsVeiculosEntrada
    Left = 648
    Top = 528
  end
  object TabConsVeiculoTroca: TClientDataSet
    PersistDataPacket.Data = {
      950300009619E0BD01000000180000002600000000000300000095030F69645F
      636F6D7072615F6974656E7304000100000000000969645F636F6D7072610400
      0100000000001269645F70726F6475746F5F76656963756C6F04000100000000
      00047174646508000400000000000C7072635F756E69746172696F0800040000
      0000000F646573635F70657263656E7475616C08000400000000000A64657363
      5F726561697308000400000000000964657363726963616F0100490000000100
      05574944544802000200B4000B636F6D706C656D656E746F0200490000000100
      05574944544802000200F40108737562746F74616C080004000000000005746F
      74616C08000400000000000D76656963756C6F5F74726F636101004900000001
      000557494454480200020001000F76656963756C6F5F70726366697065080004
      00000000001076656963756C6F5F70726376656E646108000400000000000464
      61746104000600000000000B646174615F63726961646F08000800000000000A
      69645F656D707265736104000100000000000A69645F7573756172696F040001
      00000000001076656963756C6F706572636C7563726F08000400000000000E61
      7475616C697A6172666963686101004900000001000557494454480200020001
      0007746178616D65730800040000000000077461786164696108000400000000
      000A746F74616C706174696F080004000000000010636F6D697373616F6C6F6A
      6170657263080004000000000011636F6D697373616F6C6F6A6176616C6F7208
      0004000000000010636F6D697373616F76656E64706572630800040000000000
      11636F6D697373616F76656E6476616C6F7208000400000000000E7461786163
      6F6E7369676E61646F080004000000000011646174617265746972616461636F
      6E736904000600000000001176656963756C6F6C7563726F76616C6F72080004
      00000000001676656963756C6F5F76616C6F7270726174696361646F08000400
      00000000097072635F637573746F08000400000000001276656963756C6F5F76
      616C6F7274726F6361080004000000000006636F6469676F0400010000000000
      1064657363726963616F5F66697363616C010049000000010005574944544802
      000200BE00076E6D706C61636101004900000001000557494454480200020007
      0009616E6F6D6F64656C6F0100490000000100055749445448020002000C0003
      636F7201004900000001000557494454480200020032000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_compra_itens'
        DataType = ftInteger
      end
      item
        Name = 'id_compra'
        DataType = ftInteger
      end
      item
        Name = 'id_produto_veiculo'
        DataType = ftInteger
      end
      item
        Name = 'qtde'
        DataType = ftFloat
      end
      item
        Name = 'prc_unitario'
        DataType = ftFloat
      end
      item
        Name = 'desc_percentual'
        DataType = ftFloat
      end
      item
        Name = 'desc_reais'
        DataType = ftFloat
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 180
      end
      item
        Name = 'complemento'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'subtotal'
        DataType = ftFloat
      end
      item
        Name = 'total'
        DataType = ftFloat
      end
      item
        Name = 'veiculo_troca'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'veiculo_prcfipe'
        DataType = ftFloat
      end
      item
        Name = 'veiculo_prcvenda'
        DataType = ftFloat
      end
      item
        Name = 'data'
        DataType = ftDate
      end
      item
        Name = 'data_criado'
        DataType = ftDateTime
      end
      item
        Name = 'id_empresa'
        DataType = ftInteger
      end
      item
        Name = 'id_usuario'
        DataType = ftInteger
      end
      item
        Name = 'veiculoperclucro'
        DataType = ftFloat
      end
      item
        Name = 'atualizarficha'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'taxames'
        DataType = ftFloat
      end
      item
        Name = 'taxadia'
        DataType = ftFloat
      end
      item
        Name = 'totalpatio'
        DataType = ftFloat
      end
      item
        Name = 'comissaolojaperc'
        DataType = ftFloat
      end
      item
        Name = 'comissaolojavalor'
        DataType = ftFloat
      end
      item
        Name = 'comissaovendperc'
        DataType = ftFloat
      end
      item
        Name = 'comissaovendvalor'
        DataType = ftFloat
      end
      item
        Name = 'taxaconsignado'
        DataType = ftFloat
      end
      item
        Name = 'dataretiradaconsi'
        DataType = ftDate
      end
      item
        Name = 'veiculolucrovalor'
        DataType = ftFloat
      end
      item
        Name = 'veiculo_valorpraticado'
        DataType = ftFloat
      end
      item
        Name = 'prc_custo'
        DataType = ftFloat
      end
      item
        Name = 'veiculo_valortroca'
        DataType = ftFloat
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'descricao_fiscal'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'nmplaca'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'anomodelo'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'cor'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    IndexFieldNames = 'id_compra'
    MasterFields = 'id_compra'
    MasterSource = ds
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 520
    Top = 424
    object TabConsVeiculoTrocaid_compra_itens: TIntegerField
      FieldName = 'id_compra_itens'
    end
    object TabConsVeiculoTrocaid_compra: TIntegerField
      FieldName = 'id_compra'
    end
    object TabConsVeiculoTrocaid_produto_veiculo: TIntegerField
      FieldName = 'id_produto_veiculo'
    end
    object TabConsVeiculoTrocaqtde: TFloatField
      FieldName = 'qtde'
    end
    object TabConsVeiculoTrocaprc_unitario: TFloatField
      FieldName = 'prc_unitario'
    end
    object TabConsVeiculoTrocadesc_percentual: TFloatField
      FieldName = 'desc_percentual'
    end
    object TabConsVeiculoTrocadesc_reais: TFloatField
      FieldName = 'desc_reais'
    end
    object TabConsVeiculoTrocadescricao: TStringField
      FieldName = 'descricao'
      Size = 180
    end
    object TabConsVeiculoTrocacomplemento: TStringField
      FieldName = 'complemento'
      Size = 500
    end
    object TabConsVeiculoTrocasubtotal: TFloatField
      FieldName = 'subtotal'
    end
    object TabConsVeiculoTrocatotal: TFloatField
      FieldName = 'total'
    end
    object TabConsVeiculoTrocaveiculo_troca: TStringField
      FieldName = 'veiculo_troca'
      Size = 1
    end
    object TabConsVeiculoTrocaveiculo_prcfipe: TFloatField
      FieldName = 'veiculo_prcfipe'
    end
    object TabConsVeiculoTrocaveiculo_prcvenda: TFloatField
      FieldName = 'veiculo_prcvenda'
    end
    object TabConsVeiculoTrocadata: TDateField
      FieldName = 'data'
    end
    object TabConsVeiculoTrocadata_criado: TDateTimeField
      FieldName = 'data_criado'
    end
    object TabConsVeiculoTrocaid_empresa: TIntegerField
      FieldName = 'id_empresa'
    end
    object TabConsVeiculoTrocaid_usuario: TIntegerField
      FieldName = 'id_usuario'
    end
    object TabConsVeiculoTrocaveiculoperclucro: TFloatField
      FieldName = 'veiculoperclucro'
    end
    object TabConsVeiculoTrocaatualizarficha: TStringField
      FieldName = 'atualizarficha'
      Size = 1
    end
    object TabConsVeiculoTrocataxames: TFloatField
      FieldName = 'taxames'
    end
    object TabConsVeiculoTrocataxadia: TFloatField
      FieldName = 'taxadia'
    end
    object TabConsVeiculoTrocatotalpatio: TFloatField
      FieldName = 'totalpatio'
    end
    object TabConsVeiculoTrocacomissaolojaperc: TFloatField
      FieldName = 'comissaolojaperc'
    end
    object TabConsVeiculoTrocacomissaolojavalor: TFloatField
      FieldName = 'comissaolojavalor'
    end
    object TabConsVeiculoTrocacomissaovendperc: TFloatField
      FieldName = 'comissaovendperc'
    end
    object TabConsVeiculoTrocacomissaovendvalor: TFloatField
      FieldName = 'comissaovendvalor'
    end
    object TabConsVeiculoTrocataxaconsignado: TFloatField
      FieldName = 'taxaconsignado'
    end
    object TabConsVeiculoTrocadataretiradaconsi: TDateField
      FieldName = 'dataretiradaconsi'
    end
    object TabConsVeiculoTrocaveiculolucrovalor: TFloatField
      FieldName = 'veiculolucrovalor'
    end
    object TabConsVeiculoTrocaveiculo_valorpraticado: TFloatField
      FieldName = 'veiculo_valorpraticado'
    end
    object TabConsVeiculoTrocaprc_custo: TFloatField
      FieldName = 'prc_custo'
    end
    object TabConsVeiculoTrocaveiculo_valortroca: TFloatField
      FieldName = 'veiculo_valortroca'
    end
    object TabConsVeiculoTrocacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabConsVeiculoTrocadescricao_fiscal: TStringField
      FieldName = 'descricao_fiscal'
      Size = 190
    end
    object TabConsVeiculoTrocanmplaca: TStringField
      FieldName = 'nmplaca'
      Size = 7
    end
    object TabConsVeiculoTrocaanomodelo: TStringField
      FieldName = 'anomodelo'
      Size = 12
    end
    object TabConsVeiculoTrocacor: TStringField
      FieldName = 'cor'
      Size = 50
    end
  end
  object dsTroca: TDataSource
    DataSet = TabConsVeiculoTroca
    Left = 536
    Top = 424
  end
  object TabFinanceiroEntrada: TClientDataSet
    PersistDataPacket.Data = {
      F30000009619E0BD010000001800000008000000000003000000F3000C69645F
      706167616D656E746F04000100000000000969645F636F6D7072610400010000
      0000000F666F726D615F706167616D656E746F01004900000001000557494454
      48020002005A000970617263656C61646F010049000000010005574944544802
      00020005000F6E756D65726F5F70617263656C617304000100000000000A6F62
      736572766163616F020049000000010005574944544802000200F4010576616C
      6F72080004000000010007535542545950450200490006004D6F6E6579000E64
      6174615F706167616D656E746F04000600000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_pagamento'
        DataType = ftInteger
      end
      item
        Name = 'id_compra'
        DataType = ftInteger
      end
      item
        Name = 'forma_pagamento'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'parcelado'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'numero_parcelas'
        DataType = ftInteger
      end
      item
        Name = 'observacao'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'valor'
        DataType = ftCurrency
      end
      item
        Name = 'data_pagamento'
        DataType = ftDate
      end>
    IndexDefs = <>
    IndexFieldNames = 'id_compra'
    MasterFields = 'id_compra'
    MasterSource = ds
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 296
    Top = 464
    object TabFinanceiroEntradaid_pagamento: TIntegerField
      FieldName = 'id_pagamento'
    end
    object TabFinanceiroEntradaid_compra: TIntegerField
      FieldName = 'id_compra'
    end
    object TabFinanceiroEntradaforma_pagamento: TStringField
      FieldName = 'forma_pagamento'
      Size = 90
    end
    object TabFinanceiroEntradaparcelado: TStringField
      FieldName = 'parcelado'
      Size = 5
    end
    object TabFinanceiroEntradanumero_parcelas: TIntegerField
      FieldName = 'numero_parcelas'
    end
    object TabFinanceiroEntradaobservacao: TStringField
      FieldName = 'observacao'
      Size = 500
    end
    object TabFinanceiroEntradavalor: TCurrencyField
      FieldName = 'valor'
    end
    object TabFinanceiroEntradadata_pagamento: TDateField
      FieldName = 'data_pagamento'
    end
  end
  object dsFinanceiro: TDataSource
    DataSet = TabFinanceiroEntrada
    Left = 280
    Top = 464
  end
end
