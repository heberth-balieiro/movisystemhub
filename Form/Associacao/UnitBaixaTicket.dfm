inherited FrmBaixaTicket: TFrmBaixaTicket
  Caption = 'FrmBaixaTicket'
  OnShow = FormShow
  TextHeight = 17
  object Label32: TLabel [0]
    Left = 8
    Top = 449
    Width = 61
    Height = 17
    Caption = 'Data Baixa'
  end
  object Label1: TLabel [1]
    Left = 114
    Top = 449
    Width = 61
    Height = 17
    Caption = 'Anota'#231#245'es'
  end
  inherited Panel1: TPanel
    inherited btnSalvar: TSpeedButton
      Caption = 'Baixar | F5'
    end
  end
  inherited Paneltitulo: TPanel
    ExplicitWidth = 900
    inherited lblTitulo: TLabel
      Caption = 'Baixa de Ticket'
    end
  end
  inherited cxGroupBox1: TcxGroupBox
    Top = 130
    ExplicitTop = 130
    ExplicitHeight = 313
    Height = 313
    object cxGrid: TcxGrid
      Left = 4
      Top = 4
      Width = 892
      Height = 305
      Align = alClient
      TabOrder = 0
      object Grid: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = dsTicket
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Kind = skCount
            FieldName = 'id_ticket'
            Column = Gridemissao
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'R$ ,0.00; R$ -,0.00'
            Kind = skSum
            FieldName = 'valor_ticket'
            Column = Gridvalor
          end
          item
            Kind = skCount
            FieldName = 'id_ticket'
            Column = Gridemissao
          end>
        DataController.Summary.SummaryGroups = <
          item
            Links = <
              item
                Column = Gridsocio
              end>
            SummaryItems = <
              item
                FieldName = 'nmconvenio'
                Column = Gridsocio
                Sorted = True
              end>
          end>
        OptionsCustomize.ColumnExpressionEditing = True
        OptionsCustomize.ColumnHiding = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsCustomize.ColumnsQuickCustomizationMaxDropDownCount = 1
        OptionsCustomize.ColumnsQuickCustomizationReordering = qcrEnabled
        OptionsCustomize.ColumnsQuickCustomizationSorted = True
        OptionsData.Appending = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsSelection.ClearPersistentSelectionOnOutsideClick = True
        OptionsSelection.MultiSelectMode = msmPersistent
        OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o>'
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        Styles.StyleSheet = FrmPrincipal.CxGridPedido
        object GridSelecao: TcxGridDBColumn
          DataBinding.FieldName = 'selecao'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.Alignment = taCenter
          Properties.ClearKey = 16452
          Properties.Glyph.SourceHeight = 16
          Properties.GlyphCount = 0
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 'True'
          Properties.ValueGrayed = 'False'
          Properties.ValueUnchecked = 'False'
          Properties.OnEditValueChanged = GridSelecaoPropertiesEditValueChanged
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
          Options.Filtering = False
          Options.IncSearch = False
          Options.Moving = False
          Options.Sorting = False
          Width = 20
          IsCaptionAssigned = True
        end
        object Gridemissao: TcxGridDBColumn
          Caption = 'Emiss'#227'o'
          DataBinding.FieldName = 'data_ticket'
          Options.Editing = False
          Width = 70
        end
        object Griddesconto: TcxGridDBColumn
          Caption = 'Desconto'
          DataBinding.FieldName = 'data_desconto'
          Options.Editing = False
          Width = 77
        end
        object Gridpagamento: TcxGridDBColumn
          Caption = 'Pagamento'
          DataBinding.FieldName = 'data_pagamento'
          Options.Editing = False
          Width = 96
        end
        object Gridticket: TcxGridDBColumn
          Caption = 'Ticket'
          DataBinding.FieldName = 'codigo'
          Options.Editing = False
          Width = 87
        end
        object Gridsocio: TcxGridDBColumn
          Caption = 'Associado'
          DataBinding.FieldName = 'nmsocio'
          Visible = False
          GroupIndex = 0
          Options.Editing = False
          SortIndex = 0
          SortOrder = soAscending
          Width = 78
        end
        object Gridconvenio: TcxGridDBColumn
          Caption = 'Conv'#234'nio'
          DataBinding.FieldName = 'nmconvenio'
          Options.Editing = False
          Width = 354
        end
        object GridSituacao: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'situacao'
          Visible = False
          Options.Editing = False
        end
        object Gridvalor: TcxGridDBColumn
          Caption = 'Valor'
          DataBinding.FieldName = 'valor_ticket'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Options.Editing = False
          Width = 75
        end
        object GridVlrPago: TcxGridDBColumn
          Caption = 'Vlr. Pago'
          DataBinding.FieldName = 'vlrpago'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;- ,0.00'
          Width = 88
        end
      end
      object cxGridDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        object cxGridDBTableView1Column1: TcxGridDBColumn
        end
        object cxGridDBTableView1Column2: TcxGridDBColumn
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = Grid
      end
    end
  end
  object pHeader: TPanel [6]
    Left = 0
    Top = 50
    Width = 900
    Height = 80
    Align = alTop
    BevelOuter = bvNone
    Color = 16051947
    ParentBackground = False
    TabOrder = 4
    object pBusca: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 0
      Width = 890
      Height = 80
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 0
      Align = alClient
      BevelOuter = bvNone
      Color = 16051947
      ParentBackground = False
      TabOrder = 0
      object pPesquisa: TPanel
        AlignWithMargins = True
        Left = 647
        Top = 20
        Width = 120
        Height = 40
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 0
        Margins.Bottom = 20
        Align = alRight
        BevelOuter = bvNone
        Color = 11292221
        ParentBackground = False
        TabOrder = 4
        object btnBusca: TSpeedButton
          Left = 0
          Top = 0
          Width = 120
          Height = 40
          Cursor = crHandPoint
          Align = alClient
          Caption = 'Pesquisar | F7'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnBuscaClick
          ExplicitLeft = 72
          ExplicitTop = 8
          ExplicitWidth = 23
          ExplicitHeight = 22
        end
      end
      object edtBusca: TEdit
        AlignWithMargins = True
        Left = 332
        Top = 20
        Width = 315
        Height = 40
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 0
        Margins.Bottom = 20
        Align = alClient
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8222060
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        TextHint = 'digite para pesquisa'
        ExplicitHeight = 38
      end
      object pLimpar: TPanel
        AlignWithMargins = True
        Left = 770
        Top = 20
        Width = 120
        Height = 40
        Margins.Top = 20
        Margins.Right = 0
        Margins.Bottom = 20
        Align = alRight
        BevelOuter = bvNone
        Color = 3819511
        ParentBackground = False
        TabOrder = 5
        object btnLimpar: TSpeedButton
          Left = 0
          Top = 0
          Width = 120
          Height = 40
          Cursor = crHandPoint
          Align = alClient
          Caption = 'Limpar | F8'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnLimparClick
          ExplicitLeft = 3
          ExplicitWidth = 110
        end
      end
      object data1: TcxDateEdit
        AlignWithMargins = True
        Left = 3
        Top = 20
        Margins.Top = 20
        Margins.Bottom = 20
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
        Style.Font.Height = -16
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        Width = 110
      end
      object data2: TcxDateEdit
        AlignWithMargins = True
        Left = 119
        Top = 20
        Margins.Top = 20
        Margins.Bottom = 20
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
        Style.Font.Height = -16
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 1
        Width = 110
      end
      object EdtFiltro: TcxComboBox
        AlignWithMargins = True
        Left = 235
        Top = 20
        Margins.Top = 20
        Margins.Bottom = 20
        Align = alLeft
        ParentFont = False
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          'Emiss'#227'o'
          'Desconto'
          'Pagamento')
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 2
        Text = 'Emiss'#227'o'
        Width = 94
      end
    end
  end
  object edtpagamento: TcxDateEdit [7]
    Left = 8
    Top = 468
    Properties.ClearKey = 16452
    Properties.DateButtons = []
    Properties.ImmediatePost = True
    Properties.SaveTime = False
    Properties.ShowTime = False
    TabOrder = 5
    Width = 100
  end
  object edtobs: TcxBlobEdit [8]
    Left = 114
    Top = 468
    Properties.BlobEditKind = bekMemo
    Properties.ClearKey = 16452
    Properties.ImmediatePost = True
    Properties.MemoCharCase = ecUpperCase
    Properties.MemoMaxLength = 250
    Properties.PopupHeight = 180
    Properties.PopupWidth = 351
    TabOrder = 6
    Width = 351
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 856
  end
  object dsTicket: TUniDataSource
    DataSet = DM.TabConsTicketBaixa
    Left = 616
    Top = 458
  end
end
