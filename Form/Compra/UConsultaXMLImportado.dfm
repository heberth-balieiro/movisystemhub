inherited FrmConsultaXMLImportado: TFrmConsultaXMLImportado
  Caption = 'XML Importadas'
  OnShow = FormShow
  TextHeight = 17
  inherited PanelClient: TPanel
    inherited cxGrid: TcxGrid
      inherited Grid: TcxGridDBTableView
        DataController.DataSource = Ds
        OptionsView.ColumnAutoWidth = False
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
        object Gridid_doc: TcxGridDBColumn
          DataBinding.FieldName = 'id_doc'
          Visible = False
        end
        object Griddh_emissao: TcxGridDBColumn
          Caption = 'Emiss'#227'o'
          DataBinding.FieldName = 'dh_emissao'
          Width = 123
        end
        object Gridnumero_nfe: TcxGridDBColumn
          Caption = 'N'#250'mero'
          DataBinding.FieldName = 'numero_nfe'
          Width = 73
        end
        object Gridx_nome_emitente: TcxGridDBColumn
          Caption = 'Emitente'
          DataBinding.FieldName = 'x_nome_emitente'
          Width = 265
        end
        object Gridcnpj_emitente: TcxGridDBColumn
          Caption = 'CNPJ/CPF'
          DataBinding.FieldName = 'cnpj_emitente'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditMask = '00\.000\.000\/0000\-00;1;_'
          Width = 124
        end
        object Gridtipo_documento: TcxGridDBColumn
          DataBinding.FieldName = 'tipo_documento'
          Visible = False
          Width = 72
        end
        object Gridchave_acesso: TcxGridDBColumn
          Caption = 'Chave de Acesso'
          DataBinding.FieldName = 'chave_acesso'
          PropertiesClassName = 'TcxMemoProperties'
          Width = 119
        end
        object Gridsituacao_manifesto: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'situacao_manifesto'
          Width = 88
        end
        object Gridvalor_nfe: TcxGridDBColumn
          Caption = 'Valor'
          DataBinding.FieldName = 'valor_nfe'
          Width = 94
        end
        object Griddata_cadastro: TcxGridDBColumn
          DataBinding.FieldName = 'data_cadastro'
          Visible = False
          Width = 20
        end
        object Gridnsu: TcxGridDBColumn
          DataBinding.FieldName = 'nsu'
          Visible = False
          Width = 74
        end
      end
    end
  end
  inherited PanelFiltro: TPanel
    inherited GBFiltro: TcxGroupBox
      inherited Label1: TLabel
        Left = 201
        ExplicitLeft = 201
      end
      object Label6: TLabel [2]
        Left = 102
        Top = 20
        Width = 57
        Height = 17
        Caption = 'Data Final'
        Color = 8679796
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5325111
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        StyleName = 'Windows'
      end
      object Label4: TLabel [3]
        Left = 3
        Top = 20
        Width = 63
        Height = 17
        Caption = 'Data Inicial'
        Color = 8679796
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5325111
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        StyleName = 'Windows'
      end
      inherited EdtBusca: TcxTextEdit
        Left = 201
        TabOrder = 2
        ExplicitLeft = 201
        ExplicitWidth = 306
        Width = 306
      end
      inherited PPopPap: TPanel
        TabOrder = 7
      end
      inherited cxAtivo: TcxComboBox
        TabOrder = 3
      end
      inherited BtnPesquisar: TStyledBitBtn
        TabOrder = 4
      end
      inherited BtnLimpar: TStyledBitBtn
        TabOrder = 5
      end
      inherited BtnNovo: TStyledBitBtn
        Caption = 'Importar | F2'
        TabOrder = 6
      end
      object cxdata2: TcxDateEdit
        AlignWithMargins = True
        Left = 102
        Top = 38
        EditValue = 0d
        ParentFont = False
        Properties.ButtonGlyph.SourceDPI = 96
        Properties.ButtonGlyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001D744558745469746C650043616C656E6461723B5363686564756C65
          723B5669657785A932520000022749444154785E8D93CF4B545114C7BF6FE651
          1839D8F457B46AE3C640712144508B82A85DBB681515495308868C8454630B2B
          A2DAB4CA36516AA33625E314D3508B468BB0EC07445612D5A84DFAEE8FD3BDE7
          CE7B031AD181CBE79C7BCE3BE77B2FF779007C0031D4CDC36A5B9B23036D28BD
          C9BDBBF271A04D6B0DAD0996649632B4C6FBCAC564A95C5D206561FF93A71DBE
          EFA16DCBEE1D00B98FA115A08C2FA51BA56CACA0A4A1595ADA1A89E2DD5C2B80
          B8AF89B8687976C635503C91F7AC11C78A19FAF18D8D207247F2C9CA0E022829
          4192E51B2AA6359261439B73FB240C49BB06E53D69B4ECDB8A4645088DBCDA35
          19921B554F782E1E1E7C0E949ABD98946ED2ADD169CCCD2F60303B85CF5F1770
          F35E8DC3657C995F44A5FF0496BE7FC3CFF39D7C89422856E09DBB5EA223079A
          F161AE827F59C20F581511D0904C62E0C6339C3AB42D1113424313902FBD0369
          60A238CB7CF0F80D737CF235535CED85B6BCD2E328B453D03350A0D4C116BCFF
          54098FFD5726E22BD10B6A68DA8CCCB522D2C7DA9B622250BC79BF30C34AC6F2
          AF9823132F9943B9174C71B1DB9DFD421714190AE914A4FA7274FA683BDE7EFC
          51BFE5B564055493B0DE28E8BB9447A66BFBA6582014771E31932C87C6A79977
          46A798B7B365669049812CCF76421341867770B83B4B674E7660A95A7B793C11
          915114460E23DDFF10977B7726FD6A75B1703C3DD60AA248625416BDAA2817F9
          C1F2AF471636BB01C0BA55BFB1F71FBF7360F8FB0FFBFD934CCFEEFED0000000
          0049454E44AE426082}
        Properties.ClearKey = 16452
        Properties.DateButtons = []
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = 8222060
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        StyleFocused.Color = 15855596
        TabOrder = 1
        Width = 100
      end
      object cxdata1: TcxDateEdit
        AlignWithMargins = True
        Left = 3
        Top = 38
        EditValue = 0d
        ParentFont = False
        Properties.ButtonGlyph.SourceDPI = 96
        Properties.ButtonGlyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001D744558745469746C650043616C656E6461723B5363686564756C65
          723B5669657785A932520000022749444154785E8D93CF4B545114C7BF6FE651
          1839D8F457B46AE3C640712144508B82A85DBB681515495308868C8454630B2B
          A2DAB4CA36516AA33625E314D3508B468BB0EC07445612D5A84DFAEE8FD3BDE7
          CE7B031AD181CBE79C7BCE3BE77B2FF779007C0031D4CDC36A5B9B23036D28BD
          C9BDBBF271A04D6B0DAD0996649632B4C6FBCAC564A95C5D206561FF93A71DBE
          EFA16DCBEE1D00B98FA115A08C2FA51BA56CACA0A4A1595ADA1A89E2DD5C2B80
          B8AF89B8687976C635503C91F7AC11C78A19FAF18D8D207247F2C9CA0E022829
          4192E51B2AA6359261439B73FB240C49BB06E53D69B4ECDB8A4645088DBCDA35
          19921B554F782E1E1E7C0E949ABD98946ED2ADD169CCCD2F60303B85CF5F1770
          F35E8DC3657C995F44A5FF0496BE7FC3CFF39D7C89422856E09DBB5EA223079A
          F161AE827F59C20F581511D0904C62E0C6339C3AB42D1113424313902FBD0369
          60A238CB7CF0F80D737CF235535CED85B6BCD2E328B453D03350A0D4C116BCFF
          54098FFD5726E22BD10B6A68DA8CCCB522D2C7DA9B622250BC79BF30C34AC6F2
          AF9823132F9943B9174C71B1DB9DFD421714190AE914A4FA7274FA683BDE7EFC
          51BFE5B564055493B0DE28E8BB9447A66BFBA6582014771E31932C87C6A79977
          46A798B7B365669049812CCF76421341867770B83B4B674E7660A95A7B793C11
          915114460E23DDFF10977B7726FD6A75B1703C3DD60AA248625416BDAA2817F9
          C1F2AF471636BB01C0BA55BFB1F71FBF7360F8FB0FFBFD934CCFEEFED0000000
          0049454E44AE426082}
        Properties.ClearKey = 16452
        Properties.DateButtons = []
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = 8222060
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        StyleFocused.BorderColor = clWindowFrame
        StyleFocused.Color = 15855596
        TabOrder = 0
        Width = 100
      end
    end
  end
  inherited Ds: TUniDataSource
    DataSet = mdPesquisa
    Left = 400
    Top = 320
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
    object Manifestar1: TMenuItem [3]
      Caption = 'Manifestar'
    end
    object ImprimirNFe1: TMenuItem [4]
      Caption = 'Imprimir NFe'
    end
    object VisualizarXML1: TMenuItem [5]
      Caption = 'Visualizar XML'
      OnClick = VisualizarXML1Click
    end
    object N2: TMenuItem [6]
      Caption = '-'
    end
  end
  inherited cxIMGMenu: TcxImageList
    FormatVersion = 1
  end
  object mdPesquisa: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 400
    Top = 356
    object mdPesquisaid_doc: TIntegerField
      FieldName = 'id_doc'
    end
    object mdPesquisansu: TIntegerField
      FieldName = 'nsu'
    end
    object mdPesquisatipo_documento: TStringField
      FieldName = 'tipo_documento'
      Size = 40
    end
    object mdPesquisachave_acesso: TStringField
      FieldName = 'chave_acesso'
      Size = 44
    end
    object mdPesquisacnpj_emitente: TStringField
      FieldName = 'cnpj_emitente'
    end
    object mdPesquisax_nome_emitente: TStringField
      FieldName = 'x_nome_emitente'
      Size = 200
    end
    object mdPesquisanumero_nfe: TStringField
      FieldName = 'numero_nfe'
    end
    object mdPesquisavalor_nfe: TCurrencyField
      FieldName = 'valor_nfe'
    end
    object mdPesquisasituacao_manifesto: TStringField
      FieldName = 'situacao_manifesto'
      Size = 40
    end
    object mdPesquisadt_cadastro: TDateField
      FieldName = 'dt_cadastro'
    end
    object mdPesquisadh_emissao: TDateTimeField
      FieldName = 'dh_emissao'
    end
    object mdPesquisaschema_name: TStringField
      FieldName = 'schema_name'
      Size = 60
    end
    object mdPesquisaserie_nfe: TStringField
      FieldName = 'serie_nfe'
      Size = 10
    end
    object mdPesquisacaminho_arquivo: TStringField
      FieldName = 'caminho_arquivo'
      Size = 255
    end
  end
end
