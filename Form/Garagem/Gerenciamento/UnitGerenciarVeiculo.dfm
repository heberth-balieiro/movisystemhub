inherited FrmGerenciarVeiculo: TFrmGerenciarVeiculo
  Caption = 'FrmGerenciarVeiculo'
  TextHeight = 15
  inherited cxGrid: TcxGrid
    Top = 121
    Height = 472
    ExplicitTop = 121
    ExplicitHeight = 472
    inherited Grid: TcxGridDBTableView
      DataController.DataSource = ds
      Styles.StyleSheet = FrmPrincipal.CxGridPedido
      object GridAnexo: TcxGridDBColumn
        DataBinding.FieldName = 'temanexo'
        HeaderGlyph.SourceDPI = 96
        HeaderGlyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001D744558745469746C65004578706F72743B5064663B4578706F7274
          546F5064663BEE390774000001EF49444154785E8D933D6B545110869F7335C6
          DA46482322821FD1C244831F6113B4B2D49FA0A5959FB0A831C48082B58DFF21
          B522BA2B1B171504A362136D54B45410DD6473675EC9700E2CB1B1983BEF5C98
          6786993909D86814BF411713504B12C06620DD7DF0E26995AA068010521070C5
          1729811C91A8EB95CECD0B532781B502A8506A5C3A7FB8F029E2DF10E6EF7727
          814D838054CB41B0DA3704284394854808D8BA2561B51345010AC0FA06804950
          92F348829D94C189DA0C200D02B0DA00A10C504AA145308A0E58636207F31B26
          3CDCBCD75A99BBD8E0EBCC2CBDE71DE48EB9A1DA30B3D06EEBE6B8D5983BA1DD
          166206D101B0D2EDB0F3E123E489EFB7AEF3ABDD66777B1D085F9A57F9D97AC2
          DEEE6B8470176F0E8D9EA980D45F3324401EC9CBA7A6D83E3387CB71870FC78F
          3072FB4E5495C4BBF183BC1D3B10BA0258CB1DB813F45D8F5B7CBBD18C5685A0
          CC4011B3EFE5122E21296FC10C092241F071FA04EE8ECC41C21495E39F0B96C6
          474B4C550004D1C3BB2BD61510873D8BAFF87CED32E4582EE40E281F928380A1
          89632C4F4F121B702189F747C7504CDD30A9540F2DB150EE000123B3F3E52D94
          BD67EDD943A7FB89B3A7F76F93F4A31C52DDEFFD7976EECA42C305553E1C17A4
          24E469E03A457FF5F722D01F3CA40A180686FEE3492B3FA29E2403F80BF7A584
          590387B74F0000000049454E44AE426082}
        Width = 20
        IsCaptionAssigned = True
      end
      object GridFoto: TcxGridDBColumn
        DataBinding.FieldName = 'temfoto'
        HeaderGlyph.SourceDPI = 96
        HeaderGlyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000011744558745469746C650050696374757265426F783B81
          33AF130000022A49444154785EA593CD6A15411085BF9EE9993B99C9DC9FFCDC
          680C8A900809BE8020C95A5CEA0BB8C80B88AFA04F20E823881B71250444CDCA
          5D405DB871231A82989B1BEEDC9F99E9EE729C41241B215870FAF4A9A20E558B
          D2800FA81AE70FA79FBFFAF8DAF7FD1D00691E046958A051AA61A909D714B0C6
          EEEB61E67676EF5E3F632B7F3FFF8C27CF0EB6B57382001F1EDF0314CA5378BE
          C6530A3C0F44900AD8125396D87C86C9276CDD7F81B58ECAC081C0B7B72FE95D
          59A7B5B04490A47851820E23501EAE2C71CEA0EC04990E991C1D0282710E6DAC
          AB05D6900FBF23E50837DFC1256D5C1CA35B2D940E50D6E04989A71561957775
          8B435B2B0810C4615D68B5DB15BA849D2E516F91204DF1B48F33967234623618
          D0AC05C63AB43116043E9FC27A4FB3962644DD0E717F8568A54FD89E47051A29
          0CC528C50F7F9BCD1004639A151060EFCB8C37873F994B265CBD9CB1B109D788
          D9B87493858B3790E927FCA3F7600AF2930122D24C60ADABC5EDED2E411213C6
          094BFD84FEAA627915A2608CCA0FC06504D129A43F606D8C1370F6CF04025BAB
          11CB173AF41653F4DC3CAD4E40907A682F43CC026E768C1967945956F1145D4F
          20686B1C82B0126BFCC2920F735CAEC1F8889F21EA2B7E32C64D8E298619C5E0
          B781C517B0D6A28D15446069F70000410085422850159A2CA982BEC026847515
          9C13F4C9F1E0DD83877B3B2202156A026A7DE62E0480869A7C994FF7F5D34777
          6E011A5000E7B84A014A2D2253FE237E01CE97366B11CA7E430000000049454E
          44AE426082}
        Width = 21
        IsCaptionAssigned = True
      end
      object GridColumn2: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'codigo'
        Width = 70
      end
      object GridPlaca: TcxGridDBColumn
        Caption = 'Placa'
        DataBinding.FieldName = 'placa'
        Width = 50
      end
      object GridVeiculo: TcxGridDBColumn
        Caption = 'Ve'#237'culo'
        DataBinding.FieldName = 'descricao_fiscal'
        Width = 141
      end
      object GridModelo: TcxGridDBColumn
        Caption = 'Ano/Modelo'
        DataBinding.FieldName = 'anomodelo'
        Width = 93
      end
      object GridLocalEstoque: TcxGridDBColumn
        Caption = 'Local Estoque'
        DataBinding.FieldName = 'local'
        Width = 107
      end
      object GridDias: TcxGridDBColumn
        Caption = 'Dias'
        Width = 54
      end
      object GridEstoque: TcxGridDBColumn
        Caption = 'Estoque'
        DataBinding.FieldName = 'estoque'
        Width = 65
      end
      object GridColumn1: TcxGridDBColumn
        Caption = 'Vlr. Fipe'
        DataBinding.FieldName = 'veiculo_fipe'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Width = 95
      end
      object GridDespesas: TcxGridDBColumn
        Caption = 'Vlr. Despesas'
        DataBinding.FieldName = 'veiculo_custototal'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Width = 95
      end
      object GridLucro: TcxGridDBColumn
        Caption = 'Vlr. Lucro'
        DataBinding.FieldName = 'veiculo_lucro'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Width = 95
      end
      object GridVenda: TcxGridDBColumn
        Caption = 'Vlr. Venda'
        DataBinding.FieldName = 'prc_venda'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Width = 95
      end
    end
  end
  inherited TabSituacao: TTabSet
    Left = 392
    Width = 265
    Align = alNone
    Tabs.Strings = (
      '11')
    TabIndex = -1
    Visible = False
    ExplicitLeft = 392
    ExplicitWidth = 265
  end
  object TabFiltroOperacao: TTabSet [2]
    Left = 0
    Top = 100
    Width = 1032
    Height = 21
    Align = alTop
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
      'Refinanciamento'
      'Repasse'
      'Zero')
    TabIndex = 0
    OnClick = TabSituacaoClick
  end
  object pButoon: TPanel [3]
    Left = 0
    Top = 593
    Width = 1032
    Height = 21
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Total'
    TabOrder = 3
    object TabFiltroSituacao: TTabSet
      Left = 839
      Top = 0
      Width = 193
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
        'Ativo'
        'Inativo')
      TabIndex = 1
      OnClick = TabSituacaoClick
    end
    object TabFiltroDisponivel: TTabSet
      Left = 0
      Top = 0
      Width = 321
      Height = 21
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      SoftTop = True
      Style = tsSoftTabs
      Tabs.Strings = (
        'Todos'
        'Dispon'#237'vel'
        'Vendido/Baixado')
      TabIndex = 1
      OnClick = TabSituacaoClick
    end
  end
  inherited cxgbfiltro: TcxGroupBox
    inherited pHeader: TPanel
      inherited lTitulo: TLabel
        Caption = 'Ve'#237'culo'
      end
    end
  end
  inherited ds: TDataSource
    DataSet = DM.TabConsultaVeiculo
  end
  inherited Popup: TPopupMenu
    object Visualizar1: TMenuItem [2]
      Caption = 'Visualizar'
      OnClick = Visualizar1Click
    end
    object RetiradaConsignado1: TMenuItem [4]
      Caption = 'Retirada Consignado'
    end
    object Fotos1: TMenuItem [5]
      Caption = 'Fotos'
      OnClick = Fotos1Click
    end
    object Anexos1: TMenuItem [6]
      Caption = 'Anexos'
      OnClick = Anexos1Click
    end
    object ClienteInteresse1: TMenuItem [7]
      Caption = 'Cliente Interesse'
    end
    object N2: TMenuItem [8]
      Caption = '-'
    end
    object DespesaAvulsa1: TMenuItem [9]
      Caption = 'Despesa'
    end
    object N3: TMenuItem [10]
      Caption = '-'
    end
    object EnviarFicha1: TMenuItem [11]
      Caption = 'Enviar Ficha'
    end
    object MensagemMassa1: TMenuItem [12]
      Caption = 'Mensagem Massa'
    end
    object btnSincronizar: TMenuItem [13]
      Caption = 'Sincronizar API'
      OnClick = btnSincronizarClick
    end
    object N4: TMenuItem [14]
      Caption = '-'
    end
  end
end
