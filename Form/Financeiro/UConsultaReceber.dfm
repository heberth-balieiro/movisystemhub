inherited FrmConsReceber: TFrmConsReceber
  Caption = 'Contas a Receber'
  TextHeight = 15
  inherited cxGrid: TcxGrid
    Top = 121
    PopupMenu = Popup
    ExplicitTop = 121
    inherited Grid: TcxGridDBTableView
      DataController.DataSource = ds
      DataController.Summary.DefaultGroupSummaryItems = <
        item
        end>
      DataController.Summary.FooterSummaryItems = <
        item
        end>
      Styles.StyleSheet = FrmPrincipal.CxGridPedido
      object GridColumnid_receber: TcxGridDBColumn
        DataBinding.FieldName = 'id_receber'
        Visible = False
        Width = 85
      end
      object GridColumndata_emissao: TcxGridDBColumn
        Caption = 'Data Emiss'#227'o'
        DataBinding.FieldName = 'data_lancamento'
        Width = 109
      end
      object GridColumnVencimento: TcxGridDBColumn
        Caption = 'Data Vencimento'
        DataBinding.FieldName = 'data_vencimento'
        Width = 137
      end
      object GridColumnRecebimento: TcxGridDBColumn
        Caption = 'Data Recebimento'
        DataBinding.FieldName = 'data_recebimento'
        Width = 143
      end
      object GridColumnndoc: TcxGridDBColumn
        Caption = 'Documento'
        DataBinding.FieldName = 'nmdocumento'
        Width = 203
      end
      object GridColumnnumparcela: TcxGridDBColumn
        Caption = 'N'#250'mero'
        DataBinding.FieldName = 'numparcela'
        Width = 76
      end
      object GridColumnHstorico: TcxGridDBColumn
        Caption = 'Hist'#243'rico'
        DataBinding.FieldName = 'historico'
        Width = 246
      end
      object GridColumn9: TcxGridDBColumn
        Caption = 'Valor'
        DataBinding.FieldName = 'valor_original'
        Width = 104
      end
      object GridColumnPessoa: TcxGridDBColumn
        Caption = 'Pessoa'
        DataBinding.FieldName = 'nmpessoacompleto'
        Visible = False
        Width = 110
      end
    end
    object GridAberta: TcxGridDBTableView [1]
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      OnCellDblClick = GridAbertaCellDblClick
      DataController.DataSource = ds
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skCount
          Position = spFooter
          FieldName = 'id_receber'
          Column = GridAbertadataemissao
        end
        item
          Format = 'R$ #,##0.00'
          Kind = skSum
          Position = spFooter
          FieldName = 'valor_original'
          Column = GridAbertavalor
          DisplayText = 'R$ #,##0.00'
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'id_receber'
          Column = GridAbertadataemissao
        end
        item
          Format = 'R$ #,##0.00'
          Kind = skSum
          FieldName = 'valor_original'
          Column = GridAbertavalor
          DisplayText = 'R$ #,##0.00'
        end>
      DataController.Summary.SummaryGroups = <
        item
          Links = <
            item
              Column = GridAbertaidreceber
            end>
          SummaryItems = <
            item
              Kind = skCount
              FieldName = 'id_receber'
              Column = GridAbertadataemissao
            end>
        end>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.ShowCheckBoxesDynamically = True
      OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o>'
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      OptionsView.Indicator = True
      Styles.OnGetContentStyle = GridAbertaStylesGetContentStyle
      Styles.StyleSheet = FrmPrincipal.CxGridPedido
      object Box: TcxGridDBColumn
        DataBinding.FieldName = 'box'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ClearKey = 16452
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        HeaderGlyph.SourceDPI = 96
        HeaderGlyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000013744558745469746C6500436865636B427574746F6E73
          3B8852EE91000001AE49444154785E75523B4E0331101D3B8988C459E869200D
          3D6C2810EC2E1F81448738028740B4900DA1CA878A8E0624DA1C068192F8C7CC
          D8DE4D36623FF67866DE9BE7B10500341E06D377D968741C38A08726E7C88ECB
          6A20B756F3CFDB8BED3DCC5934D12B4188CEF5D1D61AA05A099EE3EABE3FDDA1
          C2B42602618CE5E042D912E7960C7AFD2760A325416BCE97910010CF405B81EA
          44BC2E06AF70759E60BEF1CE4A818AFB0E807A0F04839F8A315C9E2551815822
          F069D6BA08887170985BBC4C103C823C4D7C13B55925D0CA2028281082E758BF
          4FE0DE0832049F669E40A94A81E4E685265AF4F59E279CE4504DD11FC32382D3
          937D066BF419FCB5A929B05A936EDA020286343349AF18428A95F3F4106CD923
          24A8375185E3B318CC8E0F9804C84EBB58B90B1CB550E668ED6A3D3086F2F938
          3304904C076C73136D751CACC48426D62E92637662CA0988715ED21BAA03DB12
          4CED184119EB9379103E31425C9C6559C4981A81D5BE079B6D5C86AAD68900E4
          F27C42645AB2ADE55024D0B3F9CFC7CDDDDB6EBCF31417C241F9843E88A0663E
          FBFEA2D38F32485B1BFF56B04B79FFD82E807F9D73E60F8705474B406D9F9D00
          00000049454E44AE426082}
        HeaderGlyphAlignmentHorz = taCenter
        Width = 20
        IsCaptionAssigned = True
      end
      object GridAbertaidreceber: TcxGridDBColumn
        DataBinding.FieldName = 'id_receber'
        Visible = False
        MinWidth = 31
        Options.Editing = False
        Width = 100
      end
      object GridAbertadataemissao: TcxGridDBColumn
        Caption = 'Data Emiss'#227'o'
        DataBinding.FieldName = 'data_lancamento'
        MinWidth = 31
        Options.Editing = False
        Width = 81
      end
      object GridAbertadatavencimento: TcxGridDBColumn
        Caption = 'Data Vencimento'
        DataBinding.FieldName = 'data_vencimento'
        MinWidth = 31
        Options.Editing = False
        Width = 116
      end
      object GridAbertapessoa: TcxGridDBColumn
        Caption = 'Pessoa'
        DataBinding.FieldName = 'nmpessoacompleto'
        Visible = False
        GroupIndex = 0
        MinWidth = 31
        Options.Editing = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 173
      end
      object GridAbertadocumento: TcxGridDBColumn
        Caption = 'Dcumento'
        DataBinding.FieldName = 'nmdocumento'
        MinWidth = 31
        Options.Editing = False
        Width = 132
      end
      object GridAbertanumero: TcxGridDBColumn
        Caption = 'N'#250'mero'
        DataBinding.FieldName = 'numparcela'
        MinWidth = 31
        Options.Editing = False
        Width = 49
      end
      object GridAbertahistorico: TcxGridDBColumn
        Caption = 'Hist'#243'rico'
        DataBinding.FieldName = 'historico'
        MinWidth = 31
        Options.Editing = False
        Width = 295
      end
      object GridAbertaatraso: TcxGridDBColumn
        Caption = 'Atraso'
        DataBinding.FieldName = 'atraso'
        Options.Editing = False
        Width = 55
      end
      object GridAbertajuros: TcxGridDBColumn
        Caption = 'Vlr. Juros'
        DataBinding.FieldName = 'vlrjuros'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Options.Editing = False
        Width = 68
      end
      object GridAbertaMulta: TcxGridDBColumn
        Caption = 'Vlr. Multa'
        DataBinding.FieldName = 'vlrmulta'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Options.Editing = False
        Width = 73
      end
      object GridAbertavalor: TcxGridDBColumn
        Caption = 'Valor'
        DataBinding.FieldName = 'valor_original'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        MinWidth = 31
        Options.Editing = False
        Width = 114
      end
      object GridAbertadesconto: TcxGridDBColumn
        Caption = 'Vlr. Desconto'
        DataBinding.FieldName = 'vlrdesconto'
        Visible = False
        Options.Editing = False
      end
    end
    object GridRecebido: TcxGridDBTableView [2]
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object GridFaturado: TcxGridDBTableView [3]
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object GridCancelado: TcxGridDBTableView [4]
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    inherited cxGridLevel1: TcxGridLevel
      GridView = GridAberta
    end
  end
  inherited TabSituacao: TTabSet
    Top = 100
    Align = alTop
    Tabs.Strings = (
      'Todos'
      'Aberto'
      'Recebido'
      'Faturado'
      'Cancelado')
    TabIndex = -1
    ExplicitTop = 100
  end
  inherited cxgbfiltro: TcxGroupBox
    inherited pHeader: TPanel
      inherited lTitulo: TLabel
        Width = 111
        Caption = 'Receber'
        ExplicitTop = 15
        ExplicitWidth = 111
      end
      inherited pNovo: TPanel
        TabOrder = 1
      end
      inherited pBusca: TPanel
        Left = 121
        Width = 700
        TabOrder = 0
        ExplicitLeft = 121
        ExplicitWidth = 700
        inherited pPesquisa: TPanel
          Left = 457
          TabOrder = 2
          ExplicitLeft = 461
        end
        inherited pLimpar: TPanel
          Left = 580
          TabOrder = 3
          ExplicitLeft = 584
        end
        inherited cxgbPesquisa: TcxGroupBox
          Left = 391
          TabOrder = 1
          ExplicitLeft = 391
          ExplicitWidth = 63
          Width = 63
          inherited edtBusca: TEdit
            Width = 49
            OnChange = edtBuscaChange
            OnKeyPress = edtBuscaKeyPress
            ExplicitTop = 26
            ExplicitWidth = 57
          end
        end
        object cxPeriodo: TcxGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 10
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alLeft
          Caption = 'Filtrar por - Per'#237'do'
          Style.TextStyle = []
          TabOrder = 0
          ExplicitHeight = 56
          Height = 44
          Width = 382
          object data1: TcxDateEdit
            AlignWithMargins = True
            Left = 7
            Top = 24
            Margins.Top = 4
            Margins.Bottom = 4
            Align = alLeft
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
            Style.Font.Color = clWindowText
            Style.Font.Height = -15
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 0
            OnKeyPress = data1KeyPress
            ExplicitLeft = 5
            ExplicitTop = 26
            ExplicitHeight = 21
            Width = 110
          end
          object data2: TcxDateEdit
            AlignWithMargins = True
            Left = 123
            Top = 24
            Margins.Top = 4
            Margins.Bottom = 4
            Align = alLeft
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
            Style.Font.Color = clWindowText
            Style.Font.Height = -15
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 1
            OnKeyPress = data2KeyPress
            ExplicitLeft = 121
            ExplicitTop = 26
            ExplicitHeight = 21
            Width = 110
          end
          object EdtFiltropor: TcxComboBox
            AlignWithMargins = True
            Left = 239
            Top = 24
            Margins.Top = 4
            Margins.Bottom = 4
            Align = alClient
            ParentFont = False
            Properties.Alignment.Horz = taLeftJustify
            Properties.DropDownListStyle = lsEditFixedList
            Properties.Items.Strings = (
              'Data Lan'#231'amento'
              'Data Vencimento'
              'Data Compet'#234'ncia'
              'Data Recebimento')
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -15
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 2
            Text = 'Data Lan'#231'amento'
            OnKeyPress = EdtFiltroporKeyPress
            ExplicitLeft = 237
            ExplicitTop = 26
            ExplicitWidth = 140
            ExplicitHeight = 21
            Width = 136
          end
        end
      end
    end
  end
  inherited ds: TDataSource
    DataSet = TabReceber
    Left = 416
    Top = 392
  end
  inherited frxDBListagem: TfrxDBDataset
    Left = 576
    Top = 392
  end
  inherited Popup: TPopupMenu
    Left = 472
    Top = 392
    object N3: TMenuItem
      Caption = '-'
    end
    object BtnBaixar: TMenuItem
      Caption = 'Baixar'
      OnClick = BtnBaixarClick
    end
    object Baixar1: TMenuItem
      Caption = 'Recebimento'
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Anexo1: TMenuItem
      Caption = 'Anexo'
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object Cobrana1: TMenuItem
      Caption = 'Cobran'#231'a'
      object EnviarporEmail1: TMenuItem
        Caption = 'Enviar por E-mail'
      end
      object EnviarporWhatsapp1: TMenuItem
        Caption = 'Enviar por Whatsapp'
      end
    end
    object EnviarporWhatsapp2: TMenuItem
      Caption = 'Enviar por Whatsapp'
    end
  end
  object TabReceber: TClientDataSet
    PersistDataPacket.Data = {
      AD0200009619E0BD010000001800000017000000000003000000AD020A69645F
      7265636562657204000100000000000F646174615F6C616E63616D656E746F04
      000600000000000F646174615F76656E63696D656E746F040006000000000010
      646174615F7265636562696D656E746F040006000000000010646174615F636F
      6D706574656E63696104000600000000000D6E756D65726F5F746974756C6F01
      004900000001000557494454480200020064000A6E756D70617263656C610100
      4900000001000557494454480200020064000E76616C6F725F6F726967696E61
      6C080004000000010007535542545950450200490006004D6F6E6579000E7661
      6C6F725F726563656269646F0800040000000100075355425459504502004900
      06004D6F6E65790009686973746F7269636F0200490000000100055749445448
      02000200F40108726563656269646F0100490000000100055749445448020002
      000F000770617263656C610400010000000000086E6D706573736F6101004900
      00000100055749445448020002009600096E6D6170656C69646F010049000000
      0100055749445448020002009600106E6D706573736F61636F6D706C65746F01
      0049000000010005574944544802000200A00008776861747361707001004900
      000001000557494454480200020014000969645F706573736F61040001000000
      00000B6E6D646F63756D656E746F010049000000010005574944544802000200
      3C000661747261736F040001000000000008766C726A75726F73080004000000
      010007535542545950450200490006004D6F6E6579000B766C72646573636F6E
      746F080004000000010007535542545950450200490006004D6F6E6579000876
      6C726D756C7461080004000000010007535542545950450200490006004D6F6E
      65790003626F7802000300000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_receber'
        DataType = ftInteger
      end
      item
        Name = 'data_lancamento'
        DataType = ftDate
      end
      item
        Name = 'data_vencimento'
        DataType = ftDate
      end
      item
        Name = 'data_recebimento'
        DataType = ftDate
      end
      item
        Name = 'data_competencia'
        DataType = ftDate
      end
      item
        Name = 'numero_titulo'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'numparcela'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'valor_original'
        DataType = ftCurrency
      end
      item
        Name = 'valor_recebido'
        DataType = ftCurrency
      end
      item
        Name = 'historico'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'recebido'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'parcela'
        DataType = ftInteger
      end
      item
        Name = 'nmpessoa'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'nmapelido'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'nmpessoacompleto'
        DataType = ftString
        Size = 160
      end
      item
        Name = 'whatsapp'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'id_pessoa'
        DataType = ftInteger
      end
      item
        Name = 'nmdocumento'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'atraso'
        DataType = ftInteger
      end
      item
        Name = 'vlrjuros'
        DataType = ftCurrency
      end
      item
        Name = 'vlrdesconto'
        DataType = ftCurrency
      end
      item
        Name = 'vlrmulta'
        DataType = ftCurrency
      end
      item
        Name = 'box'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 368
    Top = 392
    object TabReceberid_receber: TIntegerField
      FieldName = 'id_receber'
    end
    object TabReceberdata_lancamento: TDateField
      FieldName = 'data_lancamento'
    end
    object TabReceberdata_vencimento: TDateField
      FieldName = 'data_vencimento'
    end
    object TabReceberdata_recebimento: TDateField
      FieldName = 'data_recebimento'
    end
    object TabReceberdata_competencia: TDateField
      FieldName = 'data_competencia'
    end
    object TabRecebernumero_titulo: TStringField
      FieldName = 'numero_titulo'
      Size = 100
    end
    object TabRecebernumparcela: TStringField
      FieldName = 'numparcela'
      Size = 100
    end
    object TabRecebervalor_original: TCurrencyField
      FieldName = 'valor_original'
    end
    object TabRecebervalor_recebido: TCurrencyField
      FieldName = 'valor_recebido'
    end
    object TabReceberhistorico: TStringField
      FieldName = 'historico'
      Size = 500
    end
    object TabReceberrecebido: TStringField
      FieldName = 'recebido'
      Size = 15
    end
    object TabReceberparcela: TIntegerField
      FieldName = 'parcela'
    end
    object TabRecebernmpessoa: TStringField
      FieldName = 'nmpessoa'
      Size = 150
    end
    object TabRecebernmapelido: TStringField
      FieldName = 'nmapelido'
      Size = 150
    end
    object TabRecebernmpessoacompleto: TStringField
      FieldName = 'nmpessoacompleto'
      Size = 160
    end
    object TabReceberwhatsapp: TStringField
      FieldName = 'whatsapp'
    end
    object TabReceberid_pessoa: TIntegerField
      FieldName = 'id_pessoa'
    end
    object TabRecebernmdocumento: TStringField
      FieldName = 'nmdocumento'
      Size = 60
    end
    object TabReceberatraso: TIntegerField
      FieldName = 'atraso'
    end
    object TabRecebervlrjuros: TCurrencyField
      FieldName = 'vlrjuros'
    end
    object TabRecebervlrdesconto: TCurrencyField
      FieldName = 'vlrdesconto'
    end
    object TabRecebervlrmulta: TCurrencyField
      FieldName = 'vlrmulta'
    end
    object TabReceberbox: TBooleanField
      FieldName = 'box'
    end
  end
end
