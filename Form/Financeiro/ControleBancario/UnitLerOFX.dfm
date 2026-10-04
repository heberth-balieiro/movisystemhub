inherited FrmOFX: TFrmOFX
  Caption = 'Ler OFX - Concilia'#231#227'o Banc'#225'ria'
  ClientHeight = 653
  ClientWidth = 900
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 900
  ExplicitHeight = 653
  TextHeight = 17
  inherited PanelButton: TPanel
    AlignWithMargins = False
    Left = 0
    Top = 628
    Width = 900
    ExplicitLeft = 0
    ExplicitTop = 628
    ExplicitWidth = 900
  end
  inherited PanelClient: TPanel
    Top = 40
    Width = 900
    Height = 588
    ExplicitTop = 40
    ExplicitWidth = 900
    ExplicitHeight = 588
    inherited dxBevel1: TdxBevel
      AlignWithMargins = False
      Left = 0
      Top = 289
      Width = 900
      Height = 299
      ExplicitLeft = 0
      ExplicitTop = 331
      ExplicitWidth = 900
      ExplicitHeight = 356
    end
    inherited BtnSalvar: TStyledBitBtn
      Left = 673
      Top = 547
      OnClick = BtnSalvarClick
      ExplicitLeft = 673
      ExplicitTop = 547
    end
    inherited BtnCancelar: TStyledBitBtn
      Left = 784
      Top = 547
      OnClick = BtnCancelarClick
      ExplicitLeft = 784
      ExplicitTop = 547
    end
    object GBFiltro: TcxGroupBox
      Left = 0
      Top = 0
      Cursor = crSizeAll
      Align = alTop
      Caption = 'Filtro e Importa'#231#227'o'
      ParentBackground = False
      ParentShowHint = False
      ShowHint = False
      Style.BorderStyle = ebsSingle
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.ScrollbarMode = sbmHybrid
      Style.LookAndFeel.ScrollMode = scmDefault
      Style.LookAndFeel.SkinName = 'Office2019Colorful'
      Style.Shadow = False
      Style.TransparentBorder = True
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.ScrollbarMode = sbmHybrid
      StyleDisabled.LookAndFeel.ScrollMode = scmDefault
      StyleDisabled.LookAndFeel.SkinName = 'Office2019Colorful'
      TabOrder = 2
      OnMouseDown = lblTituloMouseDown
      Height = 81
      Width = 900
      object Label1: TLabel
        Left = 3
        Top = 20
        Width = 63
        Height = 17
        Caption = 'Data In'#237'cial'
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
      object Label5: TLabel
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
      object Label4: TLabel
        Left = 201
        Top = 20
        Width = 26
        Height = 17
        Caption = 'Tipo'
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
      object Label7: TLabel
        Left = 272
        Top = 20
        Width = 34
        Height = 17
        Caption = 'Conta'
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
      object Label2: TLabel
        Left = 496
        Top = 20
        Width = 73
        Height = 17
        Caption = 'Arquivo OFX'
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
      object BtnPesquisar: TStyledBitBtn
        Left = 716
        Top = 38
        Width = 90
        Height = 25
        Caption = 'Carregar | F7'
        TabOrder = 5
        StyleElements = [seFont, seBorder]
        OnClick = BtnPesquisarClick
        StyleClass = 'Aqua Graphite'
        ButtonStyleNormal.BorderColor = 12283904
        ButtonStylePressed.BorderColor = 13208883
        ButtonStyleSelected.BorderColor = 13734188
        ButtonStyleHot.BorderColor = 13403413
        ButtonStyleDisabled.FontColor = clWhite
      end
      object BtnLimpar: TStyledBitBtn
        Left = 807
        Top = 38
        Width = 90
        Height = 25
        Caption = 'Limpar | F8'
        TabOrder = 6
        OnClick = BtnLimparClick
        StyleFamily = 'Bootstrap'
        StyleClass = 'Secondary'
        ButtonStyleNormal.BorderDrawStyle = brdSolid
        ButtonStylePressed.BorderColor = 6577750
        ButtonStyleSelected.BorderColor = 6577750
      end
      object cxConta: TcxLookupComboBox
        Left = 272
        Top = 38
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.DropDownWidth = 443
        Properties.ImmediatePost = True
        Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
        Properties.KeyFieldNames = 'id_conta'
        Properties.ListColumns = <
          item
            Caption = 'Categoria'
            FieldName = 'npesquisa'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dsconta
        Properties.ReadOnly = False
        EditValue = 0
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 3
        Width = 225
      end
      object EdtDataInicial: TcxDateEdit
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
      object edtDataFinal: TcxDateEdit
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
      object cxtipo: TcxComboBox
        AlignWithMargins = True
        Left = 201
        Top = 38
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.ClearKey = 16452
        Properties.DropDownListStyle = lsEditFixedList
        Properties.ImmediatePost = True
        Properties.Items.Strings = (
          'Todos'
          'Cr'#233'dito'
          'D'#233'bito')
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = 8222060
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        StyleFocused.Color = 15855596
        TabOrder = 2
        Text = 'Todos'
        Width = 72
      end
      object cxarquivo: TcxButtonEdit
        Left = 496
        Top = 38
        Properties.Buttons = <
          item
            Default = True
            Glyph.SourceDPI = 96
            Glyph.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              610000002B744558745469746C65004F70656E3B466F6C6465723B426172733B
              526962626F6E3B5374616E646172643B4C6F6164F1C3C4630000022249444154
              785EA593BD6B545110C57F6FF3242AA9B412144B3FB1500CA20663FC032C6C44
              B0B010041194147616366295805A88A058898D8D106C444D6C44123426120959
              36B8316FD9F8F2B15F6FDFBD7746B9EFAD82019B1CB81C6698397366E006AACA
              461000859CC959F327FC079DC1E1C4C381D785807EB21815A827E642DF8DB1E7
              E30F4E8BA2A0CA1F12A5F7FA281D8488F61FBAFC940C8A6DD5987A76F3DE9D4B
              FB468F5C7D53653D0470B94B426704DC2AA4DF517184380E9EBBB6DD99E1F2A9
              03DB4072BB0AA2608C1B1BB8F5E10C6032012BA00E5C422016D4D2250D0E5F1C
              24E8DE0104A00208AA8ED1BB57FA80AEBF02A9CB046C82DA26625BE00CD4CBA8
              CF1B54F21A1556AB75809E20080A800BDEDD3EA67D8343C8CA272AD3E3C40B15
              54404510C92EA7A28888E7A5F92AEAD38A38AD862675B4E28864A1C872D460FF
              F961BC786E1B71A85A108B3A8B8A0149894BDF78FB6868DEAFB05A2E11CFCCD2
              B3AB174D221AB32F51DF90DD47457C8C737E1D114769B2CCCA9A19094DDBB154
              9A632D5A66E7F1BDB42BD3D85ADC29CC9A54C04F17C40B0951B1C29772FD4598
              B62D4B73737477F7B0796B487D6602DB58F6D63B2E347391E71CB59536F1CFC6
              D7FBEFA362D86AA4B018B1E7C44992C529926AD14F50BF7BA749BD082A5EA8BA
              9010D7CD0860C24633FD88AB1D9D1C79C5647E5D72560001505401554421B55A
              FEFCA3F9184803600BB00928B01EC13FB10206489E9CDDED0036FC9D7F01FAB6
              A14B22EE620A0000000049454E44AE426082}
            Kind = bkGlyph
          end>
        Properties.OnButtonClick = cxarquivoPropertiesButtonClick
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 4
        Width = 219
      end
    end
    object cxGrid: TcxGrid
      Left = 0
      Top = 81
      Width = 900
      Height = 208
      Align = alTop
      TabOrder = 3
      object Grid: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        OnCustomDrawCell = GridCustomDrawCell
        DataController.DataSource = Ds
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Kind = skCount
            FieldName = 'id_ticket'
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            FieldName = 'id_lancamento_bancario'
            Column = GridEmissao
          end
          item
            Format = ',0.00; -,0.00'
            Kind = skSum
            FieldName = 'credito'
            Column = GridValorcredito
          end
          item
            Format = ',0.00; -,0.00'
            Kind = skSum
            FieldName = 'debito'
            Column = Gridvalordebito
          end>
        DataController.Summary.SummaryGroups = <
          item
            Links = <
              item
              end>
            SummaryItems = <
              item
                FieldName = 'nmconvenio'
                Sorted = True
              end>
          end>
        OptionsCustomize.ColumnExpressionEditing = True
        OptionsCustomize.ColumnHiding = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsCustomize.ColumnsQuickCustomizationMaxDropDownCount = 1
        OptionsCustomize.ColumnsQuickCustomizationReordering = qcrEnabled
        OptionsCustomize.ColumnsQuickCustomizationSorted = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.InvertSelect = False
        OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o>'
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 25
        OptionsView.Indicator = True
        Styles.Navigator = cxStyle11
        Styles.OnGetContentStyle = GridStylesGetContentStyle
        Styles.Header = cxGridHeader
        Styles.Selection = cxStyle4
        object GridRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
        end
        object Gridid_ticket: TcxGridDBColumn
          DataBinding.FieldName = 'id_ticket'
          Visible = False
          Width = 51
        end
        object GridAnexo: TcxGridDBColumn
          DataBinding.FieldName = 'selecionado'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Properties.ValueGrayed = 'False'
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
          Options.Editing = False
          Options.Filtering = False
          Options.IncSearch = False
          Options.Moving = False
          Options.ShowCaption = False
          Width = 28
          IsCaptionAssigned = True
        end
        object GridTipo: TcxGridDBColumn
          DataBinding.FieldName = 'tipo_movimento'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Images = cxIMGMenu
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              ImageIndex = 18
              Value = 'C'
            end
            item
              ImageIndex = 19
              Tag = 1
              Value = 'D'
            end>
          Properties.PopupAlignment = taCenter
          HeaderGlyph.SourceDPI = 96
          HeaderGlyph.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            6100000016744558745469746C6500457870616E643B436F6C6C617073653B1B
            ED71700000006049444154785ECD93C109C0200C45BB606F2ED28CE04AB9B84C
            67F952D0E241F22341F0F02010783F987801086136450416BFE0CEA5838F56D3
            F46581AA62641460064BA70232C1FE37706D61EB1DF8B7F03E0933A8940BF804
            67FC8508714105448CCA13644A58980000000049454E44AE426082}
          HeaderGlyphAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Options.IncSearch = False
          Options.Moving = False
          Options.ShowCaption = False
          Width = 27
          IsCaptionAssigned = True
        end
        object GridConciliado: TcxGridDBColumn
          DataBinding.FieldName = 'conciliado'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Images = cxIMGMenu
          Properties.Items = <
            item
              ImageIndex = 20
              Value = True
            end
            item
              ImageIndex = 21
              Tag = 1
              Value = False
            end>
          HeaderGlyph.SourceDPI = 96
          HeaderGlyph.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            610000001A744558745469746C650050726F647563743B53686F7750726F6475
            63743B091751AF0000003B49444154785EED91310A00200C03FDA73FE99B843C
            F14A570729549D3ADC140847328012F582698B9D082491E15490E191C1DF0DFA
            C61B067DA303138FD579FF303EE10000000049454E44AE426082}
          HeaderGlyphAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Options.IncSearch = False
          Options.Moving = False
          Options.ShowCaption = False
          Width = 28
        end
        object GridEmissao: TcxGridDBColumn
          Caption = 'Data'
          DataBinding.FieldName = 'data_movimento'
          Options.Editing = False
          Width = 80
        end
        object GridNumero: TcxGridDBColumn
          Caption = 'Documento'
          DataBinding.FieldName = 'documento'
          Options.Editing = False
          Width = 137
        end
        object GridHistorico: TcxGridDBColumn
          Caption = 'Hist'#243'rico'
          DataBinding.FieldName = 'historico'
          Options.Editing = False
          Width = 391
        end
        object Gridobs: TcxGridDBColumn
          Caption = 'Observa'#231#227'o'
          DataBinding.FieldName = 'historico'
          Visible = False
          Width = 115
        end
        object Gridsituacao: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'situacao'
          Visible = False
          Options.Editing = False
          Styles.Content = cxStyle1
          Width = 100
        end
        object GridValorcredito: TcxGridDBColumn
          Caption = 'Cr'#233'dito'
          DataBinding.FieldName = 'credito'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;- ,0.00'
          Options.Editing = False
          Width = 90
        end
        object Gridmotivo: TcxGridDBColumn
          DataBinding.FieldName = 'motivo'
          Visible = False
        end
        object Gridobs_cancelamento: TcxGridDBColumn
          DataBinding.FieldName = 'obs_cancelamento'
          Visible = False
        end
        object Gridvalordebito: TcxGridDBColumn
          Caption = 'D'#233'bito'
          DataBinding.FieldName = 'debito'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ' ,0.00;- ,0.00'
          Options.Editing = False
          Width = 90
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
    object cxGrupConciliacao: TcxGroupBox
      Left = 0
      Top = 289
      Caption = 'Concilia'#231#227'o do Registro Selecionado'
      PanelStyle.Active = True
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 4
      Transparent = True
      Height = 168
      Width = 900
      object Label3: TLabel
        Left = 3
        Top = 20
        Width = 27
        Height = 17
        Caption = 'Data'
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
      object Label6: TLabel
        Left = 112
        Top = 20
        Width = 76
        Height = 17
        Caption = 'Compet'#234'ncia'
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
      object Label8: TLabel
        Left = 221
        Top = 20
        Width = 48
        Height = 17
        Caption = 'N'#250'mero'
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
      object Label9: TLabel
        Left = 384
        Top = 20
        Width = 52
        Height = 17
        Caption = 'Hist'#243'rico'
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
      object Label11: TLabel
        Left = 619
        Top = 20
        Width = 196
        Height = 17
        Caption = 'Forma Pagamento / Recebimento'
        Color = 8679796
        DragCursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5325111
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        StyleName = 'Windows'
      end
      object Label12: TLabel
        Left = 310
        Top = 20
        Width = 44
        Height = 17
        Caption = 'Cheque'
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
      object Label10: TLabel
        Left = 3
        Top = 69
        Width = 70
        Height = 17
        Caption = 'Observa'#231#227'o'
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
      object Label13: TLabel
        Left = 221
        Top = 69
        Width = 95
        Height = 17
        Caption = 'Plano de Contas'
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
      object Label14: TLabel
        Left = 619
        Top = 69
        Width = 95
        Height = 17
        Caption = 'Centro de Custo'
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
      object Label15: TLabel
        Left = 3
        Top = 118
        Width = 144
        Height = 17
        Caption = 'Favorecido / Fornecedor'
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
      object Label16: TLabel
        Left = 384
        Top = 118
        Width = 84
        Height = 17
        Caption = 'Departamento'
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
      object cxemissao: TcxDateEdit
        Left = 3
        Top = 38
        Properties.ButtonGlyph.SourceDPI = 96
        Properties.ButtonGlyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000014744558745469746C6500446174653B43616C656E6461
          723BDF38D8A6000001D149444154785E8553316E5341107D9B7C5120C325C046
          5434544E1C51240484284002F9021C818A2E4A68728470015A44811134360810
          4D2863B80305C2B2FEDFDDC9BC99FD76EC26238FDF9BD99DB733BBFA1580A0BE
          A9BE81A505ACDA7A5ED4B37AAC583C7EF6F8B32AECE49C91B38028EA89313D39
          1762F23D758C93E1F79FBB265005ECDC7EF210102FD60A20298F1192C8135254
          54CF91EB11DFDE7D1AB0D646C822B671FEE7CC05929FCA9C903B2EF866E71ACF
          A2858A206CBBAE917862B4F61553C1568CF9926B14252F04C2AFA787E80FEFE0
          6A9DFD9AD89112515C31F17969EFDF9E023FEEBA40E4A95E4737A384FF4A24C1
          30247F8BA621412B10EDB4AC3EFAFADBAAF6B6BAF8A89CF9FDED2E3E8CA7B6FE
          E85E0FB42280CA83B603E17D14CED98DF9D3724DC8DB0E2EDC41533AE0FEDD7E
          17C222F2AD1BB63B59473729AC5C108402F182409D7CFE2CF8FBEA858D70FDF5
          0946638E23B83FE861349982B6AF3C6CAC0930A0401984291FC554513ACA248A
          BCC8B07A07B5065C4819E81C9C9402C1DE36C76111B48B5B2EA04108405CDE81
          07FE8462B834293D052E4281CCC49BB8EC20CE66FF262F8F46038817F85F21C2
          9265BEE5F5FCFF170205E66F8E9F3F50BCB2F619874B3EE79AB5E71DE48B3460
          34A2F10000000049454E44AE426082}
        Properties.ClearKey = 16452
        Properties.DateButtons = []
        Properties.ImmediatePost = True
        Properties.ReadOnly = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        Style.TextStyle = []
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 0
        Width = 110
      end
      object cxcompetencia: TcxDateEdit
        Left = 112
        Top = 38
        Properties.ButtonGlyph.SourceDPI = 96
        Properties.ButtonGlyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000014744558745469746C6500446174653B43616C656E6461
          723BDF38D8A6000001D149444154785E8553316E5341107D9B7C5120C325C046
          5434544E1C51240484284002F9021C818A2E4A68728470015A44811134360810
          4D2863B80305C2B2FEDFDDC9BC99FD76EC26238FDF9BD99DB733BBFA1580A0BE
          A9BE81A505ACDA7A5ED4B37AAC583C7EF6F8B32AECE49C91B38028EA89313D39
          1762F23D758C93E1F79FBB265005ECDC7EF210102FD60A20298F1192C8135254
          54CF91EB11DFDE7D1AB0D646C822B671FEE7CC05929FCA9C903B2EF866E71ACF
          A2858A206CBBAE917862B4F61553C1568CF9926B14252F04C2AFA787E80FEFE0
          6A9DFD9AD89112515C31F17969EFDF9E023FEEBA40E4A95E4737A384FF4A24C1
          30247F8BA621412B10EDB4AC3EFAFADBAAF6B6BAF8A89CF9FDED2E3E8CA7B6FE
          E85E0FB42280CA83B603E17D14CED98DF9D3724DC8DB0E2EDC41533AE0FEDD7E
          17C222F2AD1BB63B59473729AC5C108402F182409D7CFE2CF8FBEA858D70FDF5
          0946638E23B83FE861349982B6AF3C6CAC0930A0401984291FC554513ACA248A
          BCC8B07A07B5065C4819E81C9C9402C1DE36C76111B48B5B2EA04108405CDE81
          07FE8462B834293D052E4281CCC49BB8EC20CE66FF262F8F46038817F85F21C2
          9265BEE5F5FCFF170205E66F8E9F3F50BCB2F619874B3EE79AB5E71DE48B3460
          34A2F10000000049454E44AE426082}
        Properties.ClearKey = 16452
        Properties.DateButtons = []
        Properties.ImmediatePost = True
        Properties.ReadOnly = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        Style.TextStyle = []
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 1
        Width = 110
      end
      object cxnumero: TcxTextEdit
        Left = 221
        Top = 38
        Cursor = crIBeam
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Style.TextStyle = []
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 2
        Width = 90
      end
      object cxhistorico: TcxLookupComboBox
        Left = 384
        Top = 38
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.DropDownWidth = 236
        Properties.ImmediatePost = True
        Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
        Properties.KeyFieldNames = 'id_historico'
        Properties.ListColumns = <
          item
            FieldName = 'npesquisa'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dsHistorico
        Properties.ReadOnly = False
        Properties.OnChange = cxhistoricoPropertiesChange
        EditValue = 0
        Style.TextStyle = []
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 4
        Width = 212
      end
      object btnHistorico: TcxButtonEdit
        Left = 593
        Top = 38
        Cursor = crHandPoint
        TabStop = False
        Properties.Buttons = <
          item
            Default = True
            Glyph.SourceDPI = 96
            Glyph.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              610000002C744558745469746C65004164643B4974656D3B4164644974656D3B
              426172733B526962626F6E3B4974656D3B506C75734E32EF8100000286494441
              54785E5D915D48545B14C77FFB9C199D11CDA264A2C828B2A44891B844491924
              A441915020611045742F04D14B11D1439015193E28652541057D125CEFBDF8D0
              43D017D8BDE0EDC1BC57ED8331106AC6907072C673CEDEAB98738686D9ECBDD8
              9BCDFFBF7E6B2D05D8B7FF1C7962DB768320002020E2DF252F8880E7382F0EEE
              A9691411072004584AA986BDDB5700148A0005FC34BBD537BA09B00172064A6B
              01C0714D8E01113F0882BF15C5610BCF330056BE01DA8000264F1DE803A2E01F
              411B0D4001819BAB3B10E5F74005068288CA11A8020300C1989F225028019409
              5E0631B0A8A204C06ABBF88AD9B4830528CFD501B2600013D4EE89C7B3A1043D
              8FE3B4FF1EA7AB3F4E32AD299BBF387AE7C4068504CD7082261A14C677427B2E
              97FF7ACF6832C3968D0BF9AD75395BEA63A4EC302DC7EFFFB1B8BA3EFAE84C83
              CA1218CF030163C4CF2E86FE810954B14D63C312929922B6ED7F80A722346FAD
              64CDCA8AF5EB769E3C05D85903D71F9F2F3682D6FA077A92BADA1803EF1C1229
              8D339B617246F37ADCA5B6268656E17D40289435D006117F9C205862484CCEF0
              E1AB45C7B9BB686310ED71F8C8358CD6F474FD8AEB780B013B9882017C7CB225
              0891B0E1E3C4341DED6D84141C3A7A8587D78F90CA0883EFA648CFA43FE7C628
              3982D2888D88C218F8A56A0EFF0CC50947A3D8B6C24967F8EFB3CB976F9A91D7
              1F989EFAD20778214067BEA59E9FEE7CB9591044A0BC2CCCD2452564129FF8F7
              E9104B5757D2DD7D8CBFDF24181F1E67622C3EFC71F0DE59C005B08028500ECC
              05E60567412852BEACBAE94267CDEE1B6375AD77646D4BEFDB554DE72F1595C6
              2A8050F58E5E948850B856EFBA094AF8BFEF80058481A22091011CC0AD6ABE6A
              44E03B805C64CDB4C3E1300000000049454E44AE426082}
            Kind = bkGlyph
          end>
        Properties.CaseInsensitive = False
        Properties.IncrementalSearch = False
        Properties.ViewStyle = vsButtonsOnly
        Properties.OnButtonClick = btnHistoricoPropertiesButtonClick
        Style.BorderStyle = ebsFlat
        Style.HotTrack = True
        Style.Shadow = False
        Style.TransparentBorder = True
        Style.ButtonStyle = btsDefault
        TabOrder = 13
        Width = 27
      end
      object cxprazo: TcxLookupComboBox
        Left = 619
        Top = 38
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.DropDownWidth = 278
        Properties.ImmediatePost = True
        Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
        Properties.KeyFieldNames = 'id_prazo'
        Properties.ListColumns = <
          item
            FieldName = 'nprazopag'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dsprazo
        Properties.ReadOnly = False
        EditValue = 0
        Style.TextStyle = []
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 5
        Width = 254
      end
      object btnprazo: TcxButtonEdit
        Left = 870
        Top = 38
        Cursor = crHandPoint
        TabStop = False
        Properties.Buttons = <
          item
            Default = True
            Glyph.SourceDPI = 96
            Glyph.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              610000002C744558745469746C65004164643B4974656D3B4164644974656D3B
              426172733B526962626F6E3B4974656D3B506C75734E32EF8100000286494441
              54785E5D915D48545B14C77FFB9C199D11CDA264A2C828B2A44891B844491924
              A441915020611045742F04D14B11D1439015193E28652541057D125CEFBDF8D0
              43D017D8BDE0EDC1BC57ED8331106AC6907072C673CEDEAB98738686D9ECBDD8
              9BCDFFBF7E6B2D05D8B7FF1C7962DB768320002020E2DF252F8880E7382F0EEE
              A9691411072004584AA986BDDB5700148A0005FC34BBD537BA09B00172064A6B
              01C0714D8E01113F0882BF15C5610BCF330056BE01DA8000264F1DE803A2E01F
              411B0D4001819BAB3B10E5F74005068288CA11A8020300C1989F225028019409
              5E0631B0A8A204C06ABBF88AD9B4830528CFD501B2600013D4EE89C7B3A1043D
              8FE3B4FF1EA7AB3F4E32AD299BBF387AE7C4068504CD7082261A14C677427B2E
              97FF7ACF6832C3968D0BF9AD75395BEA63A4EC302DC7EFFFB1B8BA3EFAE84C83
              CA1218CF030163C4CF2E86FE810954B14D63C312929922B6ED7F80A722346FAD
              64CDCA8AF5EB769E3C05D85903D71F9F2F3682D6FA077A92BADA1803EF1C1229
              8D339B617246F37ADCA5B6268656E17D40289435D006117F9C205862484CCEF0
              E1AB45C7B9BB686310ED71F8C8358CD6F474FD8AEB780B013B9882017C7CB225
              0891B0E1E3C4341DED6D84141C3A7A8587D78F90CA0883EFA648CFA43FE7C628
              3982D2888D88C218F8A56A0EFF0CC50947A3D8B6C24967F8EFB3CB976F9A91D7
              1F989EFAD20778214067BEA59E9FEE7CB9591044A0BC2CCCD2452564129FF8F7
              E9104B5757D2DD7D8CBFDF24181F1E67622C3EFC71F0DE59C005B08028500ECC
              05E60567412852BEACBAE94267CDEE1B6375AD77646D4BEFDB554DE72F1595C6
              2A8050F58E5E948850B856EFBA094AF8BFEF80058481A22091011CC0AD6ABE6A
              44E03B805C64CDB4C3E1300000000049454E44AE426082}
            Kind = bkGlyph
          end>
        Properties.CaseInsensitive = False
        Properties.IncrementalSearch = False
        Properties.ViewStyle = vsButtonsOnly
        Properties.OnButtonClick = btnprazoPropertiesButtonClick
        Style.BorderStyle = ebsFlat
        Style.HotTrack = True
        Style.Shadow = False
        Style.TransparentBorder = True
        Style.ButtonStyle = btsDefault
        TabOrder = 14
        Width = 27
      end
      object cxcheque: TcxComboBox
        Left = 310
        Top = 38
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.DropDownListStyle = lsEditFixedList
        Properties.ImmediatePost = True
        Properties.Items.Strings = (
          'SIM'
          'N'#195'O')
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 3
        Text = 'N'#195'O'
        Width = 75
      end
      object cxConciliacao: TcxCheckBox
        Left = 626
        Top = 138
        ParentCustomHint = False
        Caption = 'Conciliar este registro'
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        Properties.DisplayGrayed = 'True'
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueGrayed = 'False'
        ShowHint = False
        Style.Color = clBtnFace
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = 5539609
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.TextStyle = []
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        TabOrder = 11
        Transparent = True
      end
      object cxobs: TcxBlobEdit
        Left = 3
        Top = 87
        ParentFont = False
        Properties.BlobEditKind = bekMemo
        Properties.ClearKey = 16452
        Properties.MemoCharCase = ecUpperCase
        Properties.MemoMaxLength = 250
        Properties.PopupHeight = 185
        Properties.PopupWidth = 382
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 6
        Width = 219
      end
      object cxplano: TcxLookupComboBox
        Left = 221
        Top = 87
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.DropDownWidth = 399
        Properties.ImmediatePost = True
        Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
        Properties.KeyFieldNames = 'id_planoconta'
        Properties.ListColumns = <
          item
            FieldName = 'DESCRICAO_COMPLETA'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dsPlano
        Properties.ReadOnly = False
        Style.TextStyle = []
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 7
        Width = 375
      end
      object btnplano: TcxButtonEdit
        Left = 593
        Top = 87
        Cursor = crHandPoint
        TabStop = False
        Properties.Buttons = <
          item
            Default = True
            Glyph.SourceDPI = 96
            Glyph.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              610000002C744558745469746C65004164643B4974656D3B4164644974656D3B
              426172733B526962626F6E3B4974656D3B506C75734E32EF8100000286494441
              54785E5D915D48545B14C77FFB9C199D11CDA264A2C828B2A44891B844491924
              A441915020611045742F04D14B11D1439015193E28652541057D125CEFBDF8D0
              43D017D8BDE0EDC1BC57ED8331106AC6907072C673CEDEAB98738686D9ECBDD8
              9BCDFFBF7E6B2D05D8B7FF1C7962DB768320002020E2DF252F8880E7382F0EEE
              A9691411072004584AA986BDDB5700148A0005FC34BBD537BA09B00172064A6B
              01C0714D8E01113F0882BF15C5610BCF330056BE01DA8000264F1DE803A2E01F
              411B0D4001819BAB3B10E5F74005068288CA11A8020300C1989F225028019409
              5E0631B0A8A204C06ABBF88AD9B4830528CFD501B2600013D4EE89C7B3A1043D
              8FE3B4FF1EA7AB3F4E32AD299BBF387AE7C4068504CD7082261A14C677427B2E
              97FF7ACF6832C3968D0BF9AD75395BEA63A4EC302DC7EFFFB1B8BA3EFAE84C83
              CA1218CF030163C4CF2E86FE810954B14D63C312929922B6ED7F80A722346FAD
              64CDCA8AF5EB769E3C05D85903D71F9F2F3682D6FA077A92BADA1803EF1C1229
              8D339B617246F37ADCA5B6268656E17D40289435D006117F9C205862484CCEF0
              E1AB45C7B9BB686310ED71F8C8358CD6F474FD8AEB780B013B9882017C7CB225
              0891B0E1E3C4341DED6D84141C3A7A8587D78F90CA0883EFA648CFA43FE7C628
              3982D2888D88C218F8A56A0EFF0CC50947A3D8B6C24967F8EFB3CB976F9A91D7
              1F989EFAD20778214067BEA59E9FEE7CB9591044A0BC2CCCD2452564129FF8F7
              E9104B5757D2DD7D8CBFDF24181F1E67622C3EFC71F0DE59C005B08028500ECC
              05E60567412852BEACBAE94267CDEE1B6375AD77646D4BEFDB554DE72F1595C6
              2A8050F58E5E948850B856EFBA094AF8BFEF80058481A22091011CC0AD6ABE6A
              44E03B805C64CDB4C3E1300000000049454E44AE426082}
            Kind = bkGlyph
          end>
        Properties.CaseInsensitive = False
        Properties.IncrementalSearch = False
        Properties.ViewStyle = vsButtonsOnly
        Properties.OnButtonClick = btnplanoPropertiesButtonClick
        Style.BorderStyle = ebsFlat
        Style.HotTrack = True
        Style.Shadow = False
        Style.TransparentBorder = True
        Style.ButtonStyle = btsDefault
        TabOrder = 15
        Width = 27
      end
      object cxcusto: TcxLookupComboBox
        Left = 619
        Top = 87
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.DropDownWidth = 278
        Properties.ImmediatePost = True
        Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
        Properties.KeyFieldNames = 'id_custo'
        Properties.ListColumns = <
          item
            FieldName = 'custo'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dsCusto
        Properties.ReadOnly = False
        EditValue = 0
        Style.TextStyle = []
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 8
        Width = 278
      end
      object btncusto: TcxButtonEdit
        Left = 870
        Top = 87
        Cursor = crHandPoint
        TabStop = False
        Properties.Buttons = <
          item
            Default = True
            Glyph.SourceDPI = 96
            Glyph.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              610000002C744558745469746C65004164643B4974656D3B4164644974656D3B
              426172733B526962626F6E3B4974656D3B506C75734E32EF8100000286494441
              54785E5D915D48545B14C77FFB9C199D11CDA264A2C828B2A44891B844491924
              A441915020611045742F04D14B11D1439015193E28652541057D125CEFBDF8D0
              43D017D8BDE0EDC1BC57ED8331106AC6907072C673CEDEAB98738686D9ECBDD8
              9BCDFFBF7E6B2D05D8B7FF1C7962DB768320002020E2DF252F8880E7382F0EEE
              A9691411072004584AA986BDDB5700148A0005FC34BBD537BA09B00172064A6B
              01C0714D8E01113F0882BF15C5610BCF330056BE01DA8000264F1DE803A2E01F
              411B0D4001819BAB3B10E5F74005068288CA11A8020300C1989F225028019409
              5E0631B0A8A204C06ABBF88AD9B4830528CFD501B2600013D4EE89C7B3A1043D
              8FE3B4FF1EA7AB3F4E32AD299BBF387AE7C4068504CD7082261A14C677427B2E
              97FF7ACF6832C3968D0BF9AD75395BEA63A4EC302DC7EFFFB1B8BA3EFAE84C83
              CA1218CF030163C4CF2E86FE810954B14D63C312929922B6ED7F80A722346FAD
              64CDCA8AF5EB769E3C05D85903D71F9F2F3682D6FA077A92BADA1803EF1C1229
              8D339B617246F37ADCA5B6268656E17D40289435D006117F9C205862484CCEF0
              E1AB45C7B9BB686310ED71F8C8358CD6F474FD8AEB780B013B9882017C7CB225
              0891B0E1E3C4341DED6D84141C3A7A8587D78F90CA0883EFA648CFA43FE7C628
              3982D2888D88C218F8A56A0EFF0CC50947A3D8B6C24967F8EFB3CB976F9A91D7
              1F989EFAD20778214067BEA59E9FEE7CB9591044A0BC2CCCD2452564129FF8F7
              E9104B5757D2DD7D8CBFDF24181F1E67622C3EFC71F0DE59C005B08028500ECC
              05E60567412852BEACBAE94267CDEE1B6375AD77646D4BEFDB554DE72F1595C6
              2A8050F58E5E948850B856EFBA094AF8BFEF80058481A22091011CC0AD6ABE6A
              44E03B805C64CDB4C3E1300000000049454E44AE426082}
            Kind = bkGlyph
          end>
        Properties.CaseInsensitive = False
        Properties.IncrementalSearch = False
        Properties.ViewStyle = vsButtonsOnly
        Properties.OnButtonClick = btncustoPropertiesButtonClick
        Style.BorderStyle = ebsFlat
        Style.HotTrack = True
        Style.Shadow = False
        Style.TransparentBorder = True
        Style.ButtonStyle = btsDefault
        TabOrder = 16
        Visible = False
        Width = 27
      end
      object cxfavorecido: TcxLookupComboBox
        Left = 3
        Top = 136
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.DropDownWidth = 382
        Properties.ImmediatePost = True
        Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
        Properties.KeyFieldNames = 'id_socio'
        Properties.ListColumns = <
          item
            FieldName = 'cliente'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dspessoa
        Properties.ReadOnly = False
        EditValue = 0
        Style.TextStyle = []
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 9
        Width = 358
      end
      object btnfavorecido: TcxButtonEdit
        Left = 358
        Top = 136
        Cursor = crHandPoint
        TabStop = False
        Properties.Buttons = <
          item
            Default = True
            Glyph.SourceDPI = 96
            Glyph.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              610000002C744558745469746C65004164643B4974656D3B4164644974656D3B
              426172733B526962626F6E3B4974656D3B506C75734E32EF8100000286494441
              54785E5D915D48545B14C77FFB9C199D11CDA264A2C828B2A44891B844491924
              A441915020611045742F04D14B11D1439015193E28652541057D125CEFBDF8D0
              43D017D8BDE0EDC1BC57ED8331106AC6907072C673CEDEAB98738686D9ECBDD8
              9BCDFFBF7E6B2D05D8B7FF1C7962DB768320002020E2DF252F8880E7382F0EEE
              A9691411072004584AA986BDDB5700148A0005FC34BBD537BA09B00172064A6B
              01C0714D8E01113F0882BF15C5610BCF330056BE01DA8000264F1DE803A2E01F
              411B0D4001819BAB3B10E5F74005068288CA11A8020300C1989F225028019409
              5E0631B0A8A204C06ABBF88AD9B4830528CFD501B2600013D4EE89C7B3A1043D
              8FE3B4FF1EA7AB3F4E32AD299BBF387AE7C4068504CD7082261A14C677427B2E
              97FF7ACF6832C3968D0BF9AD75395BEA63A4EC302DC7EFFFB1B8BA3EFAE84C83
              CA1218CF030163C4CF2E86FE810954B14D63C312929922B6ED7F80A722346FAD
              64CDCA8AF5EB769E3C05D85903D71F9F2F3682D6FA077A92BADA1803EF1C1229
              8D339B617246F37ADCA5B6268656E17D40289435D006117F9C205862484CCEF0
              E1AB45C7B9BB686310ED71F8C8358CD6F474FD8AEB780B013B9882017C7CB225
              0891B0E1E3C4341DED6D84141C3A7A8587D78F90CA0883EFA648CFA43FE7C628
              3982D2888D88C218F8A56A0EFF0CC50947A3D8B6C24967F8EFB3CB976F9A91D7
              1F989EFAD20778214067BEA59E9FEE7CB9591044A0BC2CCCD2452564129FF8F7
              E9104B5757D2DD7D8CBFDF24181F1E67622C3EFC71F0DE59C005B08028500ECC
              05E60567412852BEACBAE94267CDEE1B6375AD77646D4BEFDB554DE72F1595C6
              2A8050F58E5E948850B856EFBA094AF8BFEF80058481A22091011CC0AD6ABE6A
              44E03B805C64CDB4C3E1300000000049454E44AE426082}
            Kind = bkGlyph
          end>
        Properties.CaseInsensitive = False
        Properties.IncrementalSearch = False
        Properties.ViewStyle = vsButtonsOnly
        Properties.OnButtonClick = btnfavorecidoPropertiesButtonClick
        Style.BorderStyle = ebsFlat
        Style.HotTrack = True
        Style.Shadow = False
        Style.TransparentBorder = True
        Style.ButtonStyle = btsDefault
        TabOrder = 17
        Width = 27
      end
      object cxdepartamento: TcxLookupComboBox
        Left = 384
        Top = 136
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.DropDownWidth = 236
        Properties.ImmediatePost = True
        Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
        Properties.KeyFieldNames = 'id_departamento'
        Properties.ListColumns = <
          item
            FieldName = 'npesquisa'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dsdepartamento
        Properties.ReadOnly = False
        EditValue = 0
        Style.TextStyle = []
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 10
        Width = 212
      end
      object btndepartamento: TcxButtonEdit
        Left = 593
        Top = 136
        Cursor = crHandPoint
        TabStop = False
        Properties.Buttons = <
          item
            Default = True
            Glyph.SourceDPI = 96
            Glyph.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              610000002C744558745469746C65004164643B4974656D3B4164644974656D3B
              426172733B526962626F6E3B4974656D3B506C75734E32EF8100000286494441
              54785E5D915D48545B14C77FFB9C199D11CDA264A2C828B2A44891B844491924
              A441915020611045742F04D14B11D1439015193E28652541057D125CEFBDF8D0
              43D017D8BDE0EDC1BC57ED8331106AC6907072C673CEDEAB98738686D9ECBDD8
              9BCDFFBF7E6B2D05D8B7FF1C7962DB768320002020E2DF252F8880E7382F0EEE
              A9691411072004584AA986BDDB5700148A0005FC34BBD537BA09B00172064A6B
              01C0714D8E01113F0882BF15C5610BCF330056BE01DA8000264F1DE803A2E01F
              411B0D4001819BAB3B10E5F74005068288CA11A8020300C1989F225028019409
              5E0631B0A8A204C06ABBF88AD9B4830528CFD501B2600013D4EE89C7B3A1043D
              8FE3B4FF1EA7AB3F4E32AD299BBF387AE7C4068504CD7082261A14C677427B2E
              97FF7ACF6832C3968D0BF9AD75395BEA63A4EC302DC7EFFFB1B8BA3EFAE84C83
              CA1218CF030163C4CF2E86FE810954B14D63C312929922B6ED7F80A722346FAD
              64CDCA8AF5EB769E3C05D85903D71F9F2F3682D6FA077A92BADA1803EF1C1229
              8D339B617246F37ADCA5B6268656E17D40289435D006117F9C205862484CCEF0
              E1AB45C7B9BB686310ED71F8C8358CD6F474FD8AEB780B013B9882017C7CB225
              0891B0E1E3C4341DED6D84141C3A7A8587D78F90CA0883EFA648CFA43FE7C628
              3982D2888D88C218F8A56A0EFF0CC50947A3D8B6C24967F8EFB3CB976F9A91D7
              1F989EFAD20778214067BEA59E9FEE7CB9591044A0BC2CCCD2452564129FF8F7
              E9104B5757D2DD7D8CBFDF24181F1E67622C3EFC71F0DE59C005B08028500ECC
              05E60567412852BEACBAE94267CDEE1B6375AD77646D4BEFDB554DE72F1595C6
              2A8050F58E5E948850B856EFBA094AF8BFEF80058481A22091011CC0AD6ABE6A
              44E03B805C64CDB4C3E1300000000049454E44AE426082}
            Kind = bkGlyph
          end>
        Properties.CaseInsensitive = False
        Properties.IncrementalSearch = False
        Properties.ViewStyle = vsButtonsOnly
        Properties.OnButtonClick = btndepartamentoPropertiesButtonClick
        Style.BorderStyle = ebsFlat
        Style.HotTrack = True
        Style.Shadow = False
        Style.TransparentBorder = True
        Style.ButtonStyle = btsDefault
        TabOrder = 18
        Width = 27
      end
      object btnaplicar: TStyledBitBtn
        Left = 783
        Top = 136
        Width = 90
        Height = 25
        Caption = 'Aplicar'
        TabOrder = 12
        OnClick = btnaplicarClick
        StyleFamily = 'Bootstrap'
        StyleClass = 'Success'
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 0
      Top = 463
      Caption = 'Resumo da Importa'#231#227'o'
      PanelStyle.Active = True
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 5
      Transparent = True
      Height = 78
      Width = 900
      object cxGroupBox3: TcxGroupBox
        Left = 14
        Top = 24
        Caption = 'Registro importados'
        PanelStyle.Active = True
        Style.TextStyle = []
        TabOrder = 0
        Transparent = True
        Height = 49
        Width = 140
        object lblRegistrosImportados: TLabel
          Left = 4
          Top = 24
          Width = 132
          Height = 21
          Align = alBottom
          Alignment = taCenter
          Caption = '0'
          Color = clBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          StyleName = 'Windows'
          ExplicitWidth = 9
        end
      end
      object cxGroupBox4: TcxGroupBox
        Left = 160
        Top = 24
        Caption = 'Selecionado'
        PanelStyle.Active = True
        Style.TextStyle = []
        TabOrder = 1
        Transparent = True
        Height = 49
        Width = 140
        object lblSelecionados: TLabel
          Left = 4
          Top = 24
          Width = 132
          Height = 21
          Align = alBottom
          Alignment = taCenter
          Caption = '0'
          Color = clBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          StyleName = 'Windows'
          ExplicitWidth = 9
        end
      end
      object cxGroupBox5: TcxGroupBox
        Left = 306
        Top = 24
        Caption = 'Conciliados'
        PanelStyle.Active = True
        Style.TextStyle = []
        TabOrder = 2
        Transparent = True
        Height = 49
        Width = 140
        object lblConciliados: TLabel
          Left = 4
          Top = 24
          Width = 132
          Height = 21
          Align = alBottom
          Alignment = taCenter
          Caption = '0'
          Color = clBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5539609
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          StyleName = 'Windows'
          ExplicitWidth = 9
        end
      end
      object cxGroupBox6: TcxGroupBox
        Left = 452
        Top = 24
        Caption = 'Pendentes'
        PanelStyle.Active = True
        Style.TextStyle = []
        TabOrder = 3
        Transparent = True
        Height = 49
        Width = 140
        object lblPendentes: TLabel
          Left = 4
          Top = 24
          Width = 132
          Height = 21
          Align = alBottom
          Alignment = taCenter
          Caption = '0'
          Color = clBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4535772
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          StyleName = 'Windows'
          ExplicitWidth = 9
        end
      end
      object cxGroupBox7: TcxGroupBox
        Left = 598
        Top = 24
        Caption = 'Total Cr'#233'dito'
        PanelStyle.Active = True
        Style.TextStyle = []
        TabOrder = 4
        Transparent = True
        Height = 49
        Width = 140
        object lblTotalCredito: TLabel
          Left = 4
          Top = 24
          Width = 132
          Height = 21
          Align = alBottom
          Alignment = taCenter
          Caption = '0'
          Color = clBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5539609
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          StyleName = 'Windows'
          ExplicitWidth = 9
        end
      end
      object cxGroupBox8: TcxGroupBox
        Left = 744
        Top = 24
        Caption = 'Total D'#233'bito'
        PanelStyle.Active = True
        Style.TextStyle = []
        TabOrder = 5
        Transparent = True
        Height = 49
        Width = 140
        object lblTotalDebito: TLabel
          Left = 4
          Top = 24
          Width = 132
          Height = 21
          Align = alBottom
          Alignment = taCenter
          Caption = '0'
          Color = clBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 4535772
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          StyleName = 'Windows'
          ExplicitWidth = 9
        end
      end
    end
    object BtnAnterior: TStyledBitBtn
      Left = 3
      Top = 547
      Width = 110
      Height = 35
      Caption = 'Anterior | F2'
      TabOrder = 6
      OnClick = BtnAnteriorClick
      StyleFamily = 'Bootstrap'
      StyleClass = 'Secondary'
      StyleAppearance = 'Outline'
      ButtonStyleDisabled.FontColor = clSilver
    end
    object btnProximo: TStyledBitBtn
      Left = 114
      Top = 547
      Width = 110
      Height = 35
      Caption = 'Pr'#243'ximo | F3'
      TabOrder = 7
      OnClick = btnProximoClick
      StyleFamily = 'Bootstrap'
      StyleAppearance = 'Outline'
      ButtonStyleDisabled.FontColor = clSilver
    end
  end
  inherited Paneltitulo: TPanel
    AlignWithMargins = False
    Left = 0
    Top = 0
    Width = 900
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 900
    inherited lblTitulo: TLabel
      Width = 845
      Caption = 'Leitura OFX / Concilia'#231#227'o Banc'#225'ria'
      ExplicitWidth = 845
    end
    inherited BtnFechar: TSpeedButton
      Left = 860
      ExplicitLeft = 860
    end
  end
  inherited Ds: TUniDataSource
    DataSet = mdPesquisa
    Left = 424
    Top = 168
  end
  inherited cxStyle: TcxStyleRepository
    PixelsPerInch = 96
    inherited cxStyle4: TcxStyle
      Font.Height = -13
    end
    object stConciliado: TcxStyle [29]
      AssignedValues = [svTextColor]
      TextColor = clGreen
    end
    object stIgnorado: TcxStyle [30]
      AssignedValues = [svTextColor]
      TextColor = clSilver
    end
    object stErro: TcxStyle [31]
      AssignedValues = [svTextColor]
      TextColor = 7697919
    end
    inherited CxGridPedido: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    inherited GridTableDependente: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
  object mdPesquisa: TdxMemData
    Indexes = <>
    SortOptions = []
    AfterScroll = mdPesquisaAfterScroll
    Left = 424
    Top = 204
    object mdPesquisaselecionado: TBooleanField
      FieldName = 'selecionado'
    end
    object mdPesquisadata_movimento: TDateField
      FieldName = 'data_movimento'
    end
    object mdPesquisadocumento: TStringField
      FieldName = 'documento'
      Size = 45
    end
    object mdPesquisahistorico: TStringField
      FieldName = 'historico'
      Size = 500
    end
    object mdPesquisatipo_movimento: TStringField
      FieldName = 'tipo_movimento'
    end
    object mdPesquisatipo_descricao: TStringField
      FieldName = 'tipo_descricao'
      Size = 60
    end
    object mdPesquisacredito: TCurrencyField
      FieldName = 'credito'
    end
    object mdPesquisasituacao: TStringField
      FieldName = 'situacao'
      Size = 45
    end
    object mdPesquisaconciliado: TBooleanField
      FieldName = 'conciliado'
    end
    object mdPesquisafitid: TStringField
      FieldName = 'fitid'
      Size = 15
    end
    object mdPesquisatipo_ofx: TStringField
      FieldName = 'tipo_ofx'
      Size = 45
    end
    object mdPesquisanome: TStringField
      FieldName = 'nome'
      Size = 100
    end
    object mdPesquisamemo: TStringField
      FieldName = 'memo'
      Size = 100
    end
    object mdPesquisacompetencia: TDateField
      FieldName = 'competencia'
    end
    object mdPesquisacheque: TStringField
      FieldName = 'cheque'
      Size = 6
    end
    object mdPesquisaobservacao: TStringField
      FieldName = 'observacao'
      Size = 500
    end
    object mdPesquisaid_historico: TIntegerField
      FieldName = 'id_historico'
    end
    object mdPesquisaid_prazo: TIntegerField
      FieldName = 'id_prazo'
    end
    object mdPesquisaid_planoconta: TIntegerField
      FieldName = 'id_planoconta'
    end
    object mdPesquisaid_custo: TIntegerField
      FieldName = 'id_custo'
    end
    object mdPesquisaid_pessoa: TIntegerField
      FieldName = 'id_pessoa'
    end
    object mdPesquisaid_departamento: TIntegerField
      FieldName = 'id_departamento'
    end
    object mdPesquisadebito: TCurrencyField
      FieldName = 'debito'
    end
  end
  object TabHistorico: TClientDataSet
    PersistDataPacket.Data = {
      6B0000009619E0BD0100000018000000030000000000030000006B000C69645F
      686973746F7269636F04000100000000000964657363726963616F0100490000
      000100055749445448020002003C00096E706573717569736101004900000001
      000557494454480200020064000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_historico'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'npesquisa'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 296
    Top = 339
    object TabHistoricoid_historico: TIntegerField
      FieldName = 'id_historico'
    end
    object TabHistoricodescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object TabHistoriconpesquisa: TStringField
      FieldName = 'npesquisa'
      Size = 100
    end
  end
  object dsHistorico: TUniDataSource
    DataSet = TabHistorico
    Left = 296
    Top = 312
  end
  object TabCusto: TClientDataSet
    PersistDataPacket.Data = {
      630000009619E0BD01000000180000000300000000000300000063000869645F
      637573746F04000100000000000964657363726963616F010049000000010005
      5749445448020002003C0005637573746F010049000000010005574944544802
      00020050000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 339
    object TabCustoid_custo: TIntegerField
      FieldName = 'id_custo'
    end
    object TabCustodescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object TabCustocusto: TStringField
      FieldName = 'custo'
      Size = 80
    end
  end
  object dsCusto: TUniDataSource
    DataSet = TabCusto
    Left = 240
    Top = 312
  end
  object TabConta: TClientDataSet
    PersistDataPacket.Data = {
      C80000009619E0BD010000001800000007000000000003000000C8000869645F
      636F6E7461040001000000000006636F6469676F040001000000000007616765
      6E6369610100490000000100055749445448020002000A0005636F6E74610100
      490000000100055749445448020002000A000B636F7272656E74697374610100
      4900000001000557494454480200020050000562616E636F0100490000000100
      055749445448020002003C00096E706573717569736101004900000001000557
      4944544802000200C8000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 339
    object TabContaid_conta: TIntegerField
      FieldName = 'id_conta'
    end
    object TabContacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabContaagencia: TStringField
      FieldName = 'agencia'
      Size = 10
    end
    object TabContaconta: TStringField
      FieldName = 'conta'
      Size = 10
    end
    object TabContacorrentista: TStringField
      FieldName = 'correntista'
      Size = 80
    end
    object TabContabanco: TStringField
      FieldName = 'banco'
      Size = 60
    end
    object TabContanpesquisa: TStringField
      FieldName = 'npesquisa'
      Size = 200
    end
  end
  object dsconta: TUniDataSource
    DataSet = TabConta
    Left = 184
    Top = 312
  end
  object dsdepartamento: TUniDataSource
    DataSet = TabDepartamento
    Left = 344
    Top = 312
  end
  object TabDepartamento: TClientDataSet
    PersistDataPacket.Data = {
      6E0000009619E0BD0100000018000000030000000000030000006E000F69645F
      646570617274616D656E746F04000100000000000964657363726963616F0100
      490000000100055749445448020002003C00096E706573717569736101004900
      000001000557494454480200020078000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 345
    Top = 337
    object TabDepartamentoid_departamento: TIntegerField
      FieldName = 'id_departamento'
    end
    object TabDepartamentodescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object TabDepartamentonpesquisa: TStringField
      FieldName = 'npesquisa'
      Size = 120
    end
  end
  object TabPlano: TClientDataSet
    PersistDataPacket.Data = {
      800000009619E0BD01000000180000000400000000000300000080000D69645F
      706C616E6F636F6E7461040001000000000006636F6469676F01004900000001
      00055749445448020002003200056E6976656C04000100000000001244455343
      524943414F5F434F4D504C455441010049000000010005574944544802000200
      78000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 339
    object TabPlanoid_planoconta: TIntegerField
      FieldName = 'id_planoconta'
    end
    object TabPlanocodigo: TStringField
      FieldName = 'codigo'
      Size = 50
    end
    object TabPlanonivel: TIntegerField
      FieldName = 'nivel'
    end
    object TabPlanoDESCRICAO_COMPLETA: TStringField
      FieldName = 'DESCRICAO_COMPLETA'
      Size = 120
    end
  end
  object dsPlano: TUniDataSource
    DataSet = TabPlano
    Left = 384
    Top = 312
  end
  object TabPessoa: TClientDataSet
    PersistDataPacket.Data = {
      AF0000009619E0BD010000001800000006000000000003000000AF000869645F
      736F63696F0400010000000000046E6F6D650100490000000100055749445448
      0200020078000363706601004900000001000557494454480200020014000763
      6C69656E7465010049000000010005574944544802000200C800087768617473
      6170700100490000000100055749445448020002000A0005617669736F020049
      000000010005574944544802000200FF000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 339
    object TabPessoaid_socio: TIntegerField
      FieldName = 'id_socio'
    end
    object TabPessoanome: TStringField
      FieldName = 'nome'
      Size = 120
    end
    object TabPessoacpf: TStringField
      FieldName = 'cpf'
    end
    object TabPessoacliente: TStringField
      FieldName = 'cliente'
      Size = 200
    end
    object TabPessoawhatsapp: TStringField
      FieldName = 'whatsapp'
      Size = 10
    end
    object TabPessoaaviso: TStringField
      FieldName = 'aviso'
      Size = 255
    end
  end
  object dspessoa: TUniDataSource
    DataSet = TabPessoa
    Left = 424
    Top = 312
  end
  object TabPrazo: TClientDataSet
    PersistDataPacket.Data = {
      580000009619E0BD01000000180000000300000000000300000058000869645F
      7072617A6F040001000000000006636F6469676F0400010000000000096E7072
      617A6F70616701004900000001000557494454480200020096000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 339
    object TabPrazoid_prazo: TIntegerField
      FieldName = 'id_prazo'
    end
    object TabPrazocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabPrazonprazopag: TStringField
      FieldName = 'nprazopag'
      Size = 150
    end
  end
  object dsprazo: TUniDataSource
    DataSet = TabPrazo
    Left = 464
    Top = 312
  end
  object cxIMGMenu: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 2621896
    ImageInfo = <
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000029744558745469746C650052656D6F76653B44656C6574653B426172
          733B526962626F6E3B5374616E646172643B635648300000026449444154785E
          A551494C5351146568194A2B583746627F458902118892AAB811369246043462
          8556D032A82D831664486D8C3FB40B8128E3C68998A289625720314469022591
          26566BC484681C22C6012B5A1556C7F73EBF507FDCF193F3DFBBE7DC7BDE7BF7
          86005811B820E80B2310F16B6880E4F7E10462AAF3F1B2014F889E961FBB307D
          AAE2EBC8FEDC137C72280FB1AB546BA0DAE4F11296C491940F36089F2CD5593F
          DFE8C682771453E71B31909D6D207C044D76166B8C339D1789E6C4A76B5D18D7
          15D9A869B04184A744E7FBED72C03FD08EF9B13BF09CADC1F50C55CDE08182DA
          B7ED562CB807E1BFDB06FF701F3C47753E52131D6C20B2EFCA343C31EAF1D3D1
          89B93E167F1EF5E37155255ED92C989F70E0C74D96E3C734F9B89498749A1E2A
          EC41644F4A6AF5B8F6107C7D2D98ED6D847FE80A7EDDBF8A6FBD4D98ED69C088
          3A0BD678A589E44A843D089844DB141B4D0FF3D5F8D251878FAC9EA08C5B87F6
          EC44B37C6D23C991F2530AF99F81E472BAAA7E42AFC307B612EFEA0E2FC1A52D
          446B5A4633C991090D968A5B93D24D4EAD06336DF5982E5363BA9C07D9BF674F
          62B4F020AC9B53976EF1CF145A36249B1EE4E5E28DA5022F8AB23045706B1383
          DB498974CFE1F599620CAB736061B63409A720ED5624CFBD341E81B760379EE5
          65A23F410183487ACE208EB1F42728E1CDCFE4F0BC641FBA9894395213176C10
          655EA3EC706CDF06778E0A76C57A5447C8E87B63298C91B166BB92817BEF0EDC
          4BDB8A0639D34DF8986083309A58278BEFB0C631BEAAC5E255940F6886A8D566
          A27DAF95ADEB22B15CD883808984208E209A8F859A9C6F6078F0145684BF98E8
          BFC080A205F60000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000020744558745469746C6500456469743B426172733B526962626F6E3B
          5374616E646172643B3013C3DB0000028449444154785E5D515D48145114FEEE
          CE9AA662FE942B1499246108D94B106588D24B461914843DD443500FF590D81F
          F550D443692F86A1A084AB581AD90F124260A4596AB14A96B556AC6192FDA045
          AEB3BBCE9DB9B77BE732BBEA99F9CEB9C39CEF3BDF9C219C731042B496CEB167
          9AA6157170C89045BE53C758A286D177F4C0A69D826700801B2A5C42A4E85069
          2E9CE08B12711EE07DFC6907004DD16202C4B254834119B823C2559297BA092C
          66D9FD4B05603135832D602BBEE348C134B923B0D40175BE3B4A8AED80280191
          2D93D9FDAF6E6C4744A70B05542B63311224513A23CA8D26EAE6BC3400482C3C
          DB6F00A02E47C0A41694650E0680896AC933E1F699886ACCCF636EB419DD97B6
          FC6A3ABEB10A4092E300865A22989CCA17FF46108648288C89170DC84D1B41CE
          E17BF0B7579CBAFE3DE88E3A60A6691319531305D462B920EB3AC69FD7211583
          C8D9530DFAB5067F3E04A045CC93D11D50CA94804CB610E0727184F520023DF5
          58A5F9B07E5F0DC21FABF1A6B907C8F4E0CBCFC9A69880A5044489EE7D6EF61F
          C67BEA904986B0E1602D667D573174A70FD64A0FDA6E0FB77AC782179C25C2B2
          991CC9091A92E25D6086B47D0B19F435F2CA6B31DD7BD19E1C4E4E87D7FBB65D
          90CF0198761C987A48EFBD7CB3BF880358E34900D7032808FA905F598FA9AE4A
          8C3E194638291D775BDFDFEF98089F01F0BBDCB3CC74362D9D2C1748115821B0
          2E6FEB91879D0DD7B83E39C8BB8E65F3F613F9BC6C75FC0300D902EE40DB2EEC
          CF888314588497D5DB00606D4149C58F77034F794BD5797EA538979766C53F02
          902310E76F2C81BFB1187B5335B8B12422212A0BF9F67924ABB0AC6F8646FE0E
          249A531D33A1F96E697B778A464F57F6AA8100FE037C7D7091F11B3976000000
          0049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
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
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000C744558745469746C65005072696E743BC83632EA00000267494441
          54785E7D93CB6B135114C6BF99C434A60F05698B1B5716752582E84AAD2822B6
          88B8101F50B45441210BEBC285150591A250A326462AA218F20FB810178A482C
          AD165AD0958216051F68D1966426F3B82FCFDCCC0C71512F7C73EE3DDCEF77EE
          DC87A19442D40C6AB74A332F4CD3EC05745E7FA33982F1CAF0E0D65D34E69127
          897F9B49EA3D7374A376AA901041F2E5D9ED0012A4A5019C0B28092C5A5E58D9
          808244476B0B38135111C4005AB55E7D587D191712928C147579052308908272
          5C03D2E4610064A0C0648E8E5776DF2EBF7D33385CB0BF7C7E0F2915494288C0
          28C0833E69EEE33B1C3E35FA67ECE1CCF4C5DCD33D0012C9E0B33CD3513EB477
          6DD744E54930D4D5852008240CD55807A3B1EB3AB0EC1A8EF4ADDF547A2C4B00
          D66880E0AAAB7B550675CB42329186904A5754A119000125015C38561DAB3B33
          604C75462B303D5F5042229D4AE0E78FEF3878EC4274046150210C686F4BE8B9
          9EC7D00460700832347000378B252C2C542145E0931AA1A4D23BBC72453B4E0F
          1D87C3380138026F03E032D409D2B3A107C5FC95C6A1C8F0084D8A8D0C744602
          B6CB41459B003E47CDE1A8D7194E666FE07FED5EFE2C7C9102F385E60600C3F7
          04AA1643D576B0BFBF0FD981CD284CCDEBCD6402641038BFA31BC5F22C7E2FDA
          A03F81CF1A0013009BFFF5753277E719EE8E3F070FCFDD63244E002E29070DE3
          D4B976BD8C91CB0FF0E9C3E46B10C708EF762BA985D43632F6722E7B628BDE79
          4087F846161E4DE3EAB99DEB0054490EC94E2AA54490085FA3655BD6ABDCFDA9
          6DF1B6A9F8ADC2756B1300BE91C75EEA31F9B94BFDFB00A44866EC44FCB23D92
          DB6CF80BF54A6944F3A08E160000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C0000000E744558745469746C65004C697374426F783B0357E96A
          0000018E49444154785E7D52BD4A0341109E4DA258F82242109B44B03168A388
          58042120162156561AD427B0129F40D1222068A18520D828DA5AA8A04F72C118
          DDDB19776677E3925C32DCCECF31F3CDB7335B2022504AE54EAFDE1E544E5580
          85F8634B6CE50445A00075FABCBD595A24225300272AF9D29566BD14EAC13B99
          727CF632CF35EC07003086B821202BF9A8D799E8DF1F1FCBDB5C847E00658C81
          20E737EF805C6815A2834A920EEC36E604CCE020001894DB4A516DA518B1573D
          468C4A79080CA08F0102F9C4CBBBCF4C063BF559C93169160383D215D1C0FA52
          314C9CAD67C160E8AF3082015A7B71FB110D94844DD2FE8666BD0C04A3181009
          83DAEAB4BB772000CA6D85527B86CC0019C00FB365B7E09A93585649BB037B8D
          B26F92C98037E066B0B13613BA7BE502A25F4092DC0100952202FA35B6AE5FC3
          E3E1586CDB32D8DF2A010E1922A01BA248A33A05CA0D5E6C2C8490FD901049D0
          C726265D224545F12AF9643040FDD37D3C38BC5F90C218A16F131C68DD7DB24E
          1A03E893A3EAB28F150C4AFC8F7CB1E6E00F942D47B1285CD8E9000000004945
          4E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000023744558745469746C6500436F6E766572743B5265706561743B4172
          726F773B45786368616E6765762368D20000032A49444154785E6D53694C5467
          147D8330B21697B20D90B24C0483ED4075001FCB94B1044424D646238B457170
          196618360B3874405B96010B418AD461699125085202DABA0C830BAB92F00344
          88C4000D0442F901F8C78926A7EF23F32824BDC9C9FBBE77EE39F7BE7BF32812
          3FFE194A5DBB1F4A5DEDFA9ACAEB3A44E512741E2294C90F1D21C8BA237A109F
          EFE345EE0C38D9ADA2751D006A3D541D21D49A7E902224032306C68664CBCC3B
          C17831A3414167D4FBA45B7E6A9F309E8D81E76C1864B5065344187B55C093D7
          F84B537EA7DBD36ED3D3A90D011F526FD39859A9C3FCEA7D34F427435E1B301B
          7DED8B185260C38088132B842149D57E5D37B5E7F078AC18AF175AB0F0EE3146
          E71A31BEA4C6C06C26746F2FA37B220FDFE47B10A5396BC0892B1408641AFA69
          EBD0153C99284141CB499C2EDC8FD0741748AB6868DF48F1DBD011486F7AC337
          DE767EEFD19DF18C8ECB1A6CFBEEBAA0A8FCAF5834F7CA1197BF7F29F0A253B9
          30D6216CB78B99D3D1DC3DC86A3A80C0447BFD9E48EBF21D2E5C7B22DE3C0393
          98A2CF47EAFA629150EA8D83124715439A1263D26684920FF7C3564FEC7CCC0E
          327732C09D0CAC08CF1A708FE4F0F5114A77445CE1635FB88D1B439A19C02526
          0C2CE863E73D14B7FA91FC6B1FA273BBF4C48435303254B460601D79E1A72F65
          15DDDA14CD20612D0D2BB38CCE6928286C1F45AD6E12AE5FA58F93DC8D219224
          6FF1091B89BAF37A76FD90BE7D6401D28A67B073F5E2472695469D5236693234
          BDCBE50F277052D50647BFC4AACD5B308E5135464B6FF4FC5DA59D826EFA1D9A
          5FAD20A3660009255AA4302DABFF1843F5F3199C297E007771C6F02ECFC860A2
          630D4C253FEB70EFD532EE4EAEA2F2E53F281B5842E3F0021E4DADA1AE771619
          B5FD0853D4C33940DEF3A9D7B7C78966CB16C40965F1C7BE6F9B97D70C43FD74
          11EA678B0857B44070BCF8E3DEC3B9732EA2B4473CE159E5279F057A3082ED44
          4C849B67C0E579063988CEDCF8252AAB439FD23C0EF1A526C2BAB16B6357DB31
          B14AD909655B7FA6505933BB0D734F9124803E5DD91B24A927EC0E57B1927216
          65523C3A9DB2F75750B6BE72CA76AB018B8D6E4C0C15AD0DE7FF0DD6E05FDF42
          745F4BE48E490000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000024744558745469746C6500436F6D6D656E743B546F6F6C7469703B48
          696E743B5469703B436C6F7564D3C1DBC90000021C49444154785E7D934D6B13
          4118C7FFB3BB89ADD412DB4A23DA521B501B0AE620F5A5871CF4E2D99BA8B417
          F52078D00F103CF8155A44053D081E0A42F1AE17452952B4F4E041140B8A62B4
          79D99D9D571F7606F32275E137FB9B679FE73F9B8430008187C15DACDF7778A6
          08C16E3F597F1E844115D6D7615C8FB5AE6433C8ADBBBB05298F5FDD59983F1B
          4965ABE7CF1D718DBEDFDFFB6BDE090A5F597D7F8A341771A1A0B5C5A73AEFED
          665D13ACB73EBA3B07CE250004513B4E218541C24DCF44F6C6AC93C868637D91
          471AED58B880468B23E61A712AF1667D0B6B1B5F707C760200BADC926F653E77
          EC201A01B0DD8CB3DC40088D464BA0FE4B60F3C357ACDE3A898F9F7FF4F9B7BF
          FEFD2747FDB7804875161049A99050483356383439860B4B6F313DB10FC698CC
          4BE45A3B9F3A3086980693BC8610CA059020E606A9D4284D8EA35CDA4FEEBE8F
          99E922B8F7A325E70905C45C41481F202515522A089D81C00286F5FD00DEFC9A
          840C52767D8416A50EE443C0008C020C05A44A432977BAB140C02C7234988FC2
          EC2DA4CA026CC4E3F68B674F5F5661DD39B4C0900D0C06385CA940C20044C418
          36D736903465162A93EDD724298141629828107B8911A2383CBBB87CE6E68A5D
          BCFFCE2E10A7AF3DB27BCA971E0098228ABE3F42AD56FB07FFE72A8C9FB87177
          FEFA633B77E5A11D9AB9780FC02811F6F492FC2F64A450B9BA3454BEBCDC3BDC
          819160A78B1A42925D7E9BD25EF7F7FC014356435A0816D96C0000000049454E
          44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C0000000D744558745469746C6500506572736F6E3B5F31C58F00
          0002B449444154785E85925B48545B18C7FFDBD9337B7B9DB149D254BC0D92E3
          0D26332D3A921619521678A0E946171F248A6CAC1EE4D0F541831EA49708A287
          CE7938170E1DD0430F3E9C0376F450525896E13483974C6D1C47479BD97BAFBD
          F76A0D884E42CCB7F8C1B73EBEF55BDF82C5514A111D2E9B0049A78D44858BE8
          D44134FA29A4E2FA5F73DA6F747D33236E7D41D6B025C56AFDB5FE74D30F4ED7
          A9A486930D850949E22F8DF9E28D7D39A69498028DD273F98E1291E739BC1F1C
          42DFD301E41515C419387A4D3070ED3105AA8E2CA389C7BFDDFD30E754E0FCDD
          5BA86BDCC30946E39CA6D392980249A3AF9FFDDD476FF63CC3F1B6D3C8DE4C21
          0A216459E24D44D3FD3105CF17F447E68D1662E07990A007CB8179688A045551
          E109EAF7620ADC217D293D7FF39B8FC3FF23140860D13F8769EF247CCBE48337
          4867BE2B68ED7C0C8EE37800C99324C93DD2D783D191597887DD8C31F80CA991
          C316D623FC78F6CA9A21EA1F0899B985A5C72EDEEEEFB8FF07EDB8DC42BB9C5B
          69C7C1627A62FF1EFA53E7035ADFD43C644E4DAB0190C888FCA1D509785B7185
          BDE98CEB9FD63347AADB9A0F41B05561BBF328722B2B114E2FC591C37B71A1E5
          54D9EE03CEEED4B48C2A00C6E827249657D7B96A773AAC6545B9F0079650682B
          C0935740AF2F0B3BAA1C189B9AC617454179993D3933CF7E09402A03FC8A20D9
          BC216D97BD201BE353F3F0CD07919D99819A9A5A842519A2A8636A2684B02CC3
          2898601493B701B030665726603DF189E99BAC29181AFD8C116F0092ACE09D77
          116F3DCB90C232DC1361782608C47813C0C56D0090103D014029224B960824A2
          415214288AC66E5521310861B9A2B31A0151550A408D162CB8DFBEFCF9EA1DBD
          5925042A3BFC5FBF0C459620CB320607C29023B924E105DBFBA7C77F07E0FB46
          D0FBE7C376005D0C71A5C64558CDD74261CC30FC0C7C05925732FB69F156C100
          00000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C0000000E744558745469746C6500436F6E746163743B11C76901
          000001DB49444154785EA5933168536110C77FDF6BA84B0511173BB9B8080A45
          2B8A8304BA3928E224888B3A64D0A5932ED28AA20515112A14315A8418AB5890
          826D2C8A58A2580451A882880E4A11DB0443A136DFFDC523E445272177FCBFFB
          F31D77EF7FEFDD0B9268C712DAB4D06C9422FC27FF05D4FCF2E4F0D43424BBCD
          4494615144331445DD0C3323D61BD1448CC6D2CFCAEBB1CB47FB3240C79FE281
          635900D4384C420E30D1C2E5C89DB9DF03742540874900CC7FFE40E1F44106F7
          6D60F25A3F5240ADC57804055709647CA618CD1373E5492A0B0BAC5ED7CDECE3
          71E40E371EBE6264FC25C3F7CA5CB9F31C93F98840E223C884B7EB5C457DE907
          BD3D1B59E9DC85C50821E1F09E6DC88421CC4088E835244D05003BF61E61FF89
          0B2CB396EE2D7D9E96C4D5E20C170BCF181A7DCAB97C0909AC5581BF718999F2
          5B3E7D81CDD953BC7833C7D795776CEFDD44EEC04ECF470919B89ABF14B83C28
          144BE46F4DF0E8C947F2A31314C7FC699CBF39CDE0F5120323530830C04CA902
          8BAE0001D5CA22776FE771633D12F41FCA7ADE1C20473A428851A0C0A5A1E3CD
          6FEDD1F04277E168DD0D401960B956FD3E9B3BFB606B3423C6C6262AE56686C9
          63A3B1A82D7E7B0F54039001D6005DCED39D0FFFF214185005E6DBFE9D7F03AA
          9655B0E2294B9E0000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D22D0
          A1D0BBD0BED0B95F312220786D6C6E733D22687474703A2F2F7777772E77332E
          6F72672F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A
          2F2F7777772E77332E6F72672F313939392F786C696E6B2220783D2230707822
          20793D22307078222076696577426F783D223020302033322033322220737479
          6C653D22656E61626C652D6261636B67726F756E643A6E657720302030203332
          2033323B2220786D6C3A73706163653D227072657365727665223E262331333B
          262331303B3C7374796C6520747970653D22746578742F6373732220786D6C3A
          73706163653D227072657365727665223E2E57686974657B66696C6C3A234646
          464646463B7D262331333B262331303B2623393B2E426C75657B66696C6C3A23
          3131373744373B7D3C2F7374796C653E0D0A3C672069643D22D0A1D0BBD0BED0
          B95F32223E0D0A09093C7061746820636C6173733D22426C75652220643D224D
          302C31344C33322C326C2D362C32386C2D392D356C2D352C354C382C31384C30
          2C31347A222F3E0D0A09093C7061746820636C6173733D225768697465222064
          3D224D31302C31386C322C386C322D364C32382C364C31302C31387A222F3E0D
          0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D224C
          617965725F312220786D6C6E733D22687474703A2F2F7777772E77332E6F7267
          2F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F77
          77772E77332E6F72672F313939392F786C696E6B2220783D223070782220793D
          22307078222076696577426F783D2230203020333220333222207374796C653D
          22656E61626C652D6261636B67726F756E643A6E657720302030203332203332
          3B2220786D6C3A73706163653D227072657365727665223E262331333B262331
          303B3C7374796C6520747970653D22746578742F6373732220786D6C3A737061
          63653D227072657365727665223E2E59656C6C6F777B66696C6C3A2346464231
          31353B7D262331333B262331303B2623393B2E5265647B66696C6C3A23443131
          4331433B7D262331333B262331303B2623393B2E426C61636B7B66696C6C3A23
          3732373237323B7D262331333B262331303B2623393B2E426C75657B66696C6C
          3A233131373744373B7D262331333B262331303B2623393B2E57686974657B66
          696C6C3A234646464646463B7D262331333B262331303B2623393B2E47726565
          6E7B66696C6C3A233033394332333B7D262331333B262331303B2623393B2E73
          74307B6F7061636974793A302E37353B7D262331333B262331303B2623393B2E
          7374317B6F7061636974793A302E353B7D262331333B262331303B2623393B2E
          7374327B6F7061636974793A302E32353B7D262331333B262331303B2623393B
          2E7374337B66696C6C3A234646423131353B7D3C2F7374796C653E0D0A3C672F
          3E0D0A3C672069643D224175746F6D6174696355706461746573223E0D0A0909
          3C7061746820636C6173733D22477265656E2220643D224D31352E362C32352E
          314C31342E362C3235632D312D302E322D312E362D312D312E362D32762D312E
          31632D302E332C302D302E372C302E312D312C302E31632D342E342C302D382D
          332E362D382D3863302D342E342C332E362D382C382D3820202623393B262339
          3B63322E322C302C342E322C302E392C352E362C322E344C31342C313268352E
          3748323268312E3848323456326C2D332E352C332E354331382E332C332E332C
          31352E332C322C31322C3243352E342C322C302C372E342C302C313463302C36
          2E362C352E342C31322C31322C313220202623393B2623393B63312E312C302C
          322E322D302E322C332E332D302E354C31352E362C32352E317A222F3E0D0A09
          093C7061746820636C6173733D22426C75652220643D224D33312C3233762D32
          6C2D322E322D302E34632D302E322D302E362D302E342D312E332D302E382D31
          2E386C312E332D312E386C2D312E342D312E346C2D312E382C312E33632D302E
          352D302E332D312E322D302E362D312E382D302E374C32342C3134682D322020
          2623393B2623393B6C2D302E342C322E32632D302E362C302E322D312E332C30
          2E342D312E382C302E374C31382C31352E364C31362E362C31376C312E332C31
          2E38632D302E332C302E352D302E362C312E322D302E382C312E384C31352C32
          3176326C322E322C302E3463302E322C302E362C302E342C312E332C302E382C
          312E3820202623393B2623393B4C31362E372C32376C312E342C312E346C312E
          382D312E3363302E352C302E332C312E322C302E362C312E382C302E374C3232
          2C333068326C302E342D322E3263302E362D302E322C312E332D302E342C312E
          382D302E376C312E382C312E336C312E342D312E346C2D312E332D312E382020
          2623393B2623393B63302E332D302E352C302E362D312E322C302E382D312E38
          4C33312C32337A204D32332C3234632D312E312C302D322D302E392D322D3273
          302E392D322C322D3273322C302E392C322C325332342E312C32342C32332C32
          347A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D224C
          617965725F312220786D6C6E733D22687474703A2F2F7777772E77332E6F7267
          2F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F77
          77772E77332E6F72672F313939392F786C696E6B2220783D223070782220793D
          22307078222076696577426F783D2230203020333220333222207374796C653D
          22656E61626C652D6261636B67726F756E643A6E657720302030203332203332
          3B2220786D6C3A73706163653D227072657365727665223E262331333B262331
          303B3C7374796C6520747970653D22746578742F6373732220786D6C3A737061
          63653D227072657365727665223E2E426C75657B66696C6C3A23313137374437
          3B7D262331333B262331303B2623393B2E59656C6C6F777B66696C6C3A234646
          423131353B7D262331333B262331303B2623393B2E426C61636B7B66696C6C3A
          233732373237323B7D262331333B262331303B2623393B2E477265656E7B6669
          6C6C3A233033394332333B7D262331333B262331303B2623393B2E5265647B66
          696C6C3A234431314331433B7D262331333B262331303B2623393B2E7374307B
          6F7061636974793A302E37353B7D262331333B262331303B2623393B2E737431
          7B6F7061636974793A302E353B7D3C2F7374796C653E0D0A3C672069643D2241
          7474616368223E0D0A09093C7061746820636C6173733D22426C61636B222064
          3D224D32302C313076313363302C322E382D322E322C352D352C35732D352D32
          2E322D352D35563763302D312E372C312E332D332C332D3373332C312E332C33
          2C3376313663302C302E362D302E342C312D312C31732D312D302E342D312D31
          563130682D3276313320202623393B2623393B63302C312E372C312E332C332C
          332C3373332D312E332C332D33563763302D322E382D322E322D352D352D3553
          382C342E322C382C3776313663302C332E392C332E312C372C372C3773372D33
          2E312C372D375631304832307A222F3E0D0A093C2F673E0D0A3C2F7376673E0D
          0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D224C
          617965725F312220786D6C6E733D22687474703A2F2F7777772E77332E6F7267
          2F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F77
          77772E77332E6F72672F313939392F786C696E6B2220783D223070782220793D
          22307078222076696577426F783D2230203020333220333222207374796C653D
          22656E61626C652D6261636B67726F756E643A6E657720302030203332203332
          3B2220786D6C3A73706163653D227072657365727665223E262331333B262331
          303B3C7374796C6520747970653D22746578742F6373732220786D6C3A737061
          63653D227072657365727665223E2E426C75657B66696C6C3A23313137374437
          3B7D262331333B262331303B2623393B2E59656C6C6F777B66696C6C3A234646
          423131353B7D262331333B262331303B2623393B2E426C61636B7B66696C6C3A
          233732373237323B7D262331333B262331303B2623393B2E477265656E7B6669
          6C6C3A233033394332333B7D262331333B262331303B2623393B2E5265647B66
          696C6C3A234431314331433B7D262331333B262331303B2623393B2E7374307B
          6F7061636974793A302E37353B7D262331333B262331303B2623393B2E737431
          7B6F7061636974793A302E353B7D3C2F7374796C653E0D0A3C672069643D2255
          6E646F223E0D0A09093C7061746820636C6173733D22426C75652220643D224D
          31342C313256392E3656364C342C31366C31302C3130762D3663372E372C302C
          31342C322E372C31342C364332382C31382E332C32312E372C31322C31342C31
          327A222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D22D0
          A1D0BBD0BED0B95F312220786D6C6E733D22687474703A2F2F7777772E77332E
          6F72672F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A
          2F2F7777772E77332E6F72672F313939392F786C696E6B2220783D2230707822
          20793D22307078222076696577426F783D223020302033322033322220737479
          6C653D22656E61626C652D6261636B67726F756E643A6E657720302030203332
          2033323B2220786D6C3A73706163653D227072657365727665223E262331333B
          262331303B3C7374796C6520747970653D22746578742F6373732220786D6C3A
          73706163653D227072657365727665223E2E426C61636B7B66696C6C3A233732
          373237323B7D262331333B262331303B2623393B2E426C75657B66696C6C3A23
          3131373744373B7D262331333B262331303B2623393B2E57686974657B66696C
          6C3A234646464646463B7D262331333B262331303B2623393B2E7374307B6F70
          61636974793A302E33353B7D3C2F7374796C653E0D0A3C672069643D22507269
          6E7476696577223E0D0A09093C7061746820636C6173733D22426C61636B2220
          643D224D31382C313463302D332E332C322E372D362C362D3656324832763236
          683232762D384332302E372C32302C31382C31372E332C31382C31347A222F3E
          0D0A09093C7061746820636C6173733D2257686974652220643D224D31382C31
          3463302D322E362C312E372D342E382C342D352E375634483476323268313876
          2D362E334331392E372C31382E382C31382C31362E362C31382C31347A222F3E
          0D0A09093C7061746820636C6173733D22426C61636B2220643D224D32302C32
          304C382C33326C2D322D326C31322D31324331382C31382C32302E322C32302C
          32302C32307A222F3E0D0A09093C7061746820636C6173733D22426C75652220
          643D224D32342C36632D342E342C302D382C332E362D382C3873332E362C382C
          382C3873382D332E362C382D385332382E342C362C32342C367A204D32342C32
          30632D332E332C302D362D322E372D362D3673322E372D362C362D3673362C32
          2E372C362C3620202623393B2623393B5332372E332C32302C32342C32307A22
          2F3E0D0A09093C6720636C6173733D22737430223E0D0A0909093C7061746820
          636C6173733D22426C61636B2220643D224D32362C382E334332352E342C382E
          312C32342E372C382C32342C38632D332E332C302D362C322E372D362C367332
          2E372C362C362C3663302E372C302C312E342D302E312C322D302E3356382E33
          7A222F3E0D0A0909093C7061746820636C6173733D2257686974652220643D22
          4D31382C313463302C332E332C322E372C362C362C3656384332302E372C382C
          31382C31302E372C31382C31347A222F3E0D0A09093C2F673E0D0A093C2F673E
          0D0A3C672069643D22D0A1D0BBD0BED0B95F32222F3E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D224C
          617965725F312220786D6C6E733D22687474703A2F2F7777772E77332E6F7267
          2F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F77
          77772E77332E6F72672F313939392F786C696E6B2220783D223070782220793D
          22307078222076696577426F783D2230203020333220333222207374796C653D
          22656E61626C652D6261636B67726F756E643A6E657720302030203332203332
          3B2220786D6C3A73706163653D227072657365727665223E262331333B262331
          303B3C7374796C6520747970653D22746578742F6373732220786D6C3A737061
          63653D227072657365727665223E2E426C75657B66696C6C3A23313137374437
          3B7D262331333B262331303B2623393B2E59656C6C6F777B66696C6C3A234646
          423131353B7D262331333B262331303B2623393B2E426C61636B7B66696C6C3A
          233732373237323B7D262331333B262331303B2623393B2E477265656E7B6669
          6C6C3A233033394332333B7D262331333B262331303B2623393B2E5265647B66
          696C6C3A234431314331433B7D262331333B262331303B2623393B2E7374307B
          6F7061636974793A302E37353B7D262331333B262331303B2623393B2E737431
          7B6F7061636974793A302E353B7D3C2F7374796C653E0D0A3C672069643D2241
          6464223E0D0A09093C7061746820636C6173733D22477265656E2220643D224D
          32372C3134682D39563563302D302E352D302E352D312D312D31682D32632D30
          2E352C302D312C302E352D312C3176394835632D302E352C302D312C302E352D
          312C31763263302C302E352C302E352C312C312C316839763920202623393B26
          23393B63302C302E352C302E352C312C312C31683263302E352C302C312D302E
          352C312D31762D39683963302E352C302C312D302E352C312D31762D32433238
          2C31342E352C32372E352C31342C32372C31347A222F3E0D0A093C2F673E0D0A
          3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D224C
          617965725F312220786D6C6E733D22687474703A2F2F7777772E77332E6F7267
          2F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F77
          77772E77332E6F72672F313939392F786C696E6B2220783D223070782220793D
          22307078222076696577426F783D2230203020333220333222207374796C653D
          22656E61626C652D6261636B67726F756E643A6E657720302030203332203332
          3B2220786D6C3A73706163653D227072657365727665223E262331333B262331
          303B3C7374796C6520747970653D22746578742F637373223E2E5265647B6669
          6C6C3A234431314331433B7D3C2F7374796C653E0D0A3C7061746820636C6173
          733D225265642220643D224D31362C3243382E332C322C322C382E332C322C31
          3673362E332C31342C31342C31347331342D362E332C31342D31345332332E37
          2C322C31362C327A204D32332C32306C2D332C336C2D342D346C2D342C346C2D
          332D336C342D346C2D342D346C332D336C342C3420202623393B6C342D346C33
          2C336C2D342C344C32332C32307A222F3E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000044744558745469746C6500436F6E646974696F6E616C466F726D6174
          74696E7349636F6E536574526564546F426C61636B343B436F6E646974696F6E
          616C466F726D617474696E673B98A0D4C8000002D249444154785E4D904D685C
          5518869F7373D330C9CC346D8DC224216A37D5858A228822940856A9687ECD4C
          4B25585D68144A8A15244A37AE224840574550680B75E1602A81800846D4855D
          B8C8A2D4D8665A4D9BA449E6CE4C66EEBD73EEF99CCB3D48CFE1E17DCFE17BBF
          8F73902F67620014D076757C64E8467EECDCCD63AF5F593B3E11940AE357AE4F
          8C9E5B1E191A065C40C9DC19626E4D8CF17F78FEC5177A57F363F3EB6F9D90FA
          D9F7447FF681C8DC872D3D2DF54FA6E4F664415646872E5F3AFC7C1FE0C8EC34
          ABA3C300A85F8EBEF468293FBA519E3E2966F694C8C79322670A22D3E322A7F3
          221F9D10F3E9946CBF3F292BC3AFAE5F7CEED9070167E5B5575047FB7A53734F
          3FF57BCFC1FB1FCFA6814A192203825D0262C000D92C5E0D56AF6D2C3CB1B838
          0284EA8F2347DECCF564BFCA0D7442C54B02912401654004B0670C7465289502
          AEAF974F0EFEBAF48DDB81E4D3FBDA61671B8C80DC8B4930582FE06FB237DB4D
          E71D8E01175C9AD19329F1210C40489A609267401232366C7D574795B6307A0C
          687325D007DCDD2A441AB0C546126F9B8808AA8518137B5C1DA1B5E9069413F8
          CD6D5D6B40D08430408216CDB0A521E8F82E44B520C6FA60D727F49B1E805B0B
          FD3FBD5AC7E0FE94C651A0A2640A765A0CB11A00414542B9EE50F5F53220EE46
          3D28AEADABC103398D510206C4181050242A221069C4FA7FB6DAB9DDF0BF059A
          EECCADBFCF7FA11F9ADABFC73994DB2B104560042199AEAC62042258AB4069CB
          FCF8F6E68DF380765742BFF65BD57BC3D1E985A06EEE1BD86750F6D789C56EA3
          E1A6A7B876D7D95AAC7BA780C60FDD03D206C8CF8DEA467B24C554C37DA4E2F1
          B0AB22DA89708D21080D772BB07C07AEEEF053B1E18D7FED97FF02A2BC9B8166
          E1190005B840E6F3AE07DEB998EE5B2A667A77E6D3FDF25D3AB773A133B7349B
          EA7917C8DA3A15BE7C90622A87FA3EDD0F806018AAFDAB803D16D73616400361
          4C2B24DCB3FE03F304B94D918F11270000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000047744558745469746C6500436F6E646974696F6E616C466F726D6174
          74696E7349636F6E536574547261666669634C6967687473333B436F6E646974
          696F6E616C466F726D617474696E673B4DFCA3D9000002EB49444154785E5D53
          6F48536F143EEF7627685991058549C36CA985454490CD597D8A82FC4384F8A1
          A2B0D035B5BEE497FA90066626044260189893A00F15094EC2922611A39A12A6
          3FB7F99BD3253A3767B9393777DFB7F3BE779A74EECECE3D7F9EE73CEFBD5C70
          F95F084723E86AE3FDFCE2EA26FDD3DAE682AFB75A0C511E795E557FAC04FB12
          3A71F8CCE09833C3CD47060067025C663A945ED3A47FDBF0AC9859BE36B0414F
          1B73CC75F188F93D56DF5EC46E341EEF3E5F99B70B01AA315F27E03C08F0E5BA
          23B9B75A4EF83ADFD5B021EF13F6D155C72CA3D758F7F025D63352C1FA9DB7D9
          E0542B7BDE6B62D50FF4B3A5D70F683989A9311FC8DEBC6DC9A7CB759F0BF30B
          0EA667A44220E402CA647120C6008D89480881B48D5930ED5984BE81819EB6BB
          B6526CC6C8D53B47AFECC9CC68371872617E6902C11484AD81C5BF5242D2B464
          2D58ADA3E0189BBC6A7E68EF90240D29D36569613E3C053295D7865759283220
          4E446E81B0077459BBC1EDF69663DA250190C31B360344681498185206293A41
          350817A4D81391E295B2990251B13CFED624949C4649586C17A66C52404281C8
          84AFF2534D0864C6B6F01D523C2ECF8796425B89860F5001123F854C5145D6D5
          0881700417AED05F3C55C596E9907F6E09C1042895D119B2D3C43D15A4A24645
          4DA8F0FB22105D8E0FF315526831FA7ADC1138B57DE70E04F235CA51D8BFC761
          4CBC4A3510187706617121FA125B2B2AEB2BB7D9EB0DFC3731BE006A2209CC9A
          028C3246BE5D51AF8109D76FF0FC1FE8EBED709AB11457057D91D04FE7E2C541
          DBB4DF311204822404545C8120E1A6226A017662DF6E9B0DB87F046BB11C29AD
          DECF54D8973F757B86866D3EFDB7CFD3EFFB2D1E98F546418E4990A44981F88A
          0433DE08F45B26C1FE69E6C388CD57F0DD3AE3E038CA95D9A71E0B75892F2DF5
          645966E5D98A7DD622634EB0C494C3CE19B383672A74D6C20BDA2AEC6F4ACC91
          2F9E66283266032936E502614C487ED33ACA8992122E29C4A215478F71471083
          75F6070B79B97E3856EEF50000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C0000001B744558745469746C65004164643B506C75733B426172
          733B526962626F6E3B9506332F0000004749444154785EE592C90900200C046D
          D0A6ACCAEE4604E32B8AB8011F3E0602590672244062DBCCA532E8F5D7024017
          AC98C11B4205C6D10896F50486B744235CA09FF1FD274A34995FABF9E946D7E8
          0000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000029744558745469746C650052656D6F76653B44656C6574
          653B426172733B526962626F6E3B5374616E646172643B635648300000002B49
          444154785EEDD03111000008C340C4E104D3B8091EE8C2711DB2FE9000A4CE00
          06BA924D32F066A281015E5FEF3B94FC8DC40000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000021744558745469746C65004170706C793B4F4B3B436865
          636B3B426172733B526962626F6E3B6463C8680000009449444154785EC59341
          0A83400C4547BAEAB6E0097A912E2DB8D2BBB8F1201EC19BD82B74E3294AC159
          C52F2464182498B6D0C5239B798F309040445FF1FB40370E4728787E14A8C004
          2EBE80CA0B20F0008523A032CF3B08B97CF2C81BA97C054F703B220B229FC1CC
          8FDE1AB1E57C8316C424D2677295CB7B7FD0680498B206AC4894B53D0189BC40
          0D823720943C4DFE7F8D2B585260AAC36B7FD80000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D22D0
          A1D0BBD0BED0B95F312220786D6C6E733D22687474703A2F2F7777772E77332E
          6F72672F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A
          2F2F7777772E77332E6F72672F313939392F786C696E6B2220783D2230707822
          20793D22307078222076696577426F783D223020302033322033322220737479
          6C653D22656E61626C652D6261636B67726F756E643A6E657720302030203332
          2033323B2220786D6C3A73706163653D227072657365727665223E262331333B
          262331303B3C7374796C6520747970653D22746578742F637373223E2E526564
          7B66696C6C3A234431314331433B7D3C2F7374796C653E0D0A3C706F6C79676F
          6E2069643D2244656C6574652220636C6173733D225265642220706F696E7473
          3D2232382C362032362C342031362C313420362C3420342C362031342C313620
          342C323620362C32382031362C31382032362C32382032382C32362031382C31
          3620222F3E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000011744558745469746C650052657365743B556E646F3B13
          8116FF0000009249444154785EC5D3B10D84201C467116210E61E50E37073513
          5C7113D961C71857DABB047E26AF30FE2984BBC4E217029A9708E84A293FF94F
          E0F559DEE2E0254A920D8935CF3B2650884C32333778365503F8326609322048
          3E457C358055467117E329124D00604FAC402099C0CDC84060BB06AA5A03897A
          10D7FA09874820F76CE2C1CBDC7B8CE8BF4868BFCACFFF8D3BB5DA60B784058A
          2D0000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000011744558745469746C6500446F776E3B4172726F773BBD
          FC82580000021E49444154785E6591316814411885BF99DDBD530435510B0BC3
          555E95144A8C46F48AEBA2A43016F65A182CB4104CAF9D8D6550B4B2B4508895
          0A625288A26050E4AC0425C110C9C588DEEDEECCEFF90FC31679ECEE3FF398FF
          EDFBE799B987CB2F8DB52D2F20FA0A4E40BCE009A4F75AF08272225016F9E2FD
          2B13EDF47F73FBD821D0C328C4104E0736D05E79A50B272C2C7E3D0524A90079
          E1F8F0FD37C1016050886EA23691A4797057DC9B543C7CFAB2C6FAAF1C412058
          0551ABCA89AE4DA840BFBB151549F76EAC327BAEC5DFBE0BA43188F794AED406
          630C6992626CB405F52CE1F6FCB3E0C0791F6C63102318449BEF2C7488B83AD5
          24AB6720AA1FEEC27B6DB2DEABADF0B79884F3ACAC6C70E6EC513A9D55BC4477
          5552DE4910709A110A2F425114F4F2FEA03ADEAD09CE09BD5E9FBC9F23311901
          ED03AC739A2C106C3D78FA911BF7DE52964ED3C952CBF5F937DC7DB23CE04A84
          00EF258EE0ABAC314C4F8ED0FDB1CEE1F649F24268B627D95AFFC9F956036B6D
          8CB7BA03E784A860AC65FFF01E2E4D8FF2FAF10B7AA51FD4E7CCCE8C313CB41B
          6393102FA61A411D082132046B138E1F69307AC0F079E93DE32375C6C71A2469
          169A0540AA1182928041950D50ABD5B97CE10443DD6F5C9C99A056DF01860815
          F11204527141354BACE61B3E967D83516E5D9B22491275054284203111493737
          375FCDDD7C745A88EA02FA5491C5855021EFFF59020A03EC0432C0B21DC1F876
          085000BD7F8CA0608FE53C7C9B0000000049454E44AE426082}
      end>
  end
end
