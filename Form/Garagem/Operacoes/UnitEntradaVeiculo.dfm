inherited FrmEntradaVeiculo: TFrmEntradaVeiculo
  ClientHeight = 594
  ClientWidth = 800
  OnShow = FormShow
  ExplicitWidth = 800
  ExplicitHeight = 594
  TextHeight = 17
  object lbrascunho: TLabel [0]
    Left = 8
    Top = 545
    Width = 130
    Height = 17
    Caption = 'Entrada em rascunho'
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object Label12: TLabel [1]
    Left = 167
    Top = 569
    Width = 167
    Height = 17
    Caption = 'F2 - Cadastro equipamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel [2]
    Left = 319
    Top = 545
    Width = 127
    Height = 17
    Caption = 'F3 - Cadastro Pessoa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel [3]
    Left = 319
    Top = 569
    Width = 161
    Height = 17
    Caption = 'F4 - Cadastro Respons'#225'vel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label15: TLabel [4]
    Left = 167
    Top = 545
    Width = 133
    Height = 17
    Caption = 'F1 - Salvar em Aberto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Panel2: TPanel
    Left = 679
    Top = 545
    ExplicitLeft = 679
    ExplicitTop = 545
  end
  inherited Panel1: TPanel
    Left = 554
    Top = 545
    ExplicitLeft = 554
    ExplicitTop = 545
    inherited btnSalvar: TSpeedButton
      ExplicitLeft = -8
      ExplicitTop = 8
    end
  end
  inherited Paneltitulo: TPanel
    Width = 800
    ExplicitWidth = 800
    inherited lblTitulo: TLabel
      Width = 785
      Caption = 'Entrada de Ve'#237'culo'
      ExplicitWidth = 785
    end
  end
  inherited cxGroupBox1: TcxGroupBox
    Style.BorderStyle = ebsFlat
    ExplicitWidth = 800
    ExplicitHeight = 489
    Height = 489
    Width = 800
    object Label10: TLabel
      Left = 206
      Top = 454
      Width = 32
      Height = 17
      Caption = 'Troca'
    end
    object Label11: TLabel
      Left = 665
      Top = 454
      Width = 28
      Height = 17
      Caption = 'Total'
    end
    object Label13: TLabel
      Left = 341
      Top = 454
      Width = 55
      Height = 17
      Caption = 'Sub-Total'
    end
    object Label14: TLabel
      Left = 503
      Top = 454
      Width = 55
      Height = 17
      Caption = 'Desconto'
    end
    object cxGroupBox2: TcxGroupBox
      Left = 4
      Top = 4
      Align = alTop
      PanelStyle.Active = True
      TabOrder = 0
      Height = 135
      Width = 792
      object Label1: TLabel
        Left = 8
        Top = 9
        Width = 71
        Height = 17
        Caption = 'N'#186' Contrato'
      end
      object Label2: TLabel
        Left = 227
        Top = 9
        Width = 27
        Height = 17
        Caption = 'Data'
      end
      object Label3: TLabel
        Left = 389
        Top = 9
        Width = 29
        Height = 17
        Caption = 'Hora'
      end
      object Label4: TLabel
        Left = 8
        Top = 71
        Width = 73
        Height = 17
        Caption = 'Respons'#225'vel'
      end
      object Label5: TLabel
        Left = 8
        Top = 40
        Width = 41
        Height = 17
        Caption = 'Pessoa'
      end
      object Label8: TLabel
        Left = 8
        Top = 102
        Width = 70
        Height = 17
        Caption = 'Observa'#231#227'o'
      end
      object Label6: TLabel
        Left = 522
        Top = 9
        Width = 88
        Height = 17
        Caption = 'Tipo Opera'#231#227'o'
      end
      object edtPedido: TcxTextEdit
        Left = 88
        Top = 6
        AutoSize = False
        ParentFont = False
        Properties.ClearKey = 16452
        Properties.ReadOnly = True
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 0
        Height = 25
        Width = 133
      end
      object edtData: TcxDateEdit
        Left = 262
        Top = 6
        EditValue = 0d
        Properties.ClearKey = 16452
        Properties.DateButtons = []
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 1
        Width = 121
      end
      object edtHora: TcxTimeEdit
        Left = 424
        Top = 6
        Properties.ClearKey = 16452
        Properties.ImmediatePost = True
        Properties.TimeFormat = tfHourMin
        TabOrder = 2
        Width = 92
      end
      object edtCliente: TcxLookupComboBox
        Left = 88
        Top = 37
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ImmediatePost = True
        Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
        Properties.KeyFieldNames = 'id_socio'
        Properties.ListColumns = <
          item
            Caption = 'Pessoa/Raz'#227'o'
            Width = 365
            FieldName = 'cliente'
          end
          item
            Caption = 'CPF/CNPJ'
            MinWidth = 120
            Width = 125
            FieldName = 'cpf'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dsPessoa
        EditValue = 0
        TabOrder = 4
        Width = 490
      end
      object edtObs: TcxBlobEdit
        Left = 88
        Top = 99
        Properties.BlobEditKind = bekMemo
        Properties.ClearKey = 16452
        Properties.PopupHeight = 180
        Properties.PopupWidth = 515
        TabOrder = 6
        Width = 515
      end
      object edtVendedor: TcxLookupComboBox
        Left = 88
        Top = 68
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ImmediatePost = True
        Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
        Properties.KeyFieldNames = 'id_funcionario'
        Properties.ListColumns = <
          item
            Width = 422
            FieldName = 'func'
          end
          item
            Width = 100
            FieldName = 'cpf'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dsResponsavel
        EditValue = 0
        TabOrder = 5
        Width = 490
      end
      object edtStatus: TcxCheckBox
        Left = 609
        Top = 41
        Caption = 'Aberto'
        Properties.ClearKey = 16452
        Properties.DisplayChecked = 'A'
        Properties.DisplayUnchecked = 'F'
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'A'
        Properties.ValueUnchecked = 'F'
        Style.TransparentBorder = False
        TabOrder = 7
        Transparent = True
      end
      object edttipo: TcxComboBox
        Left = 616
        Top = 6
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.DropDownListStyle = lsEditFixedList
        Properties.ImmediatePost = True
        Properties.Items.Strings = (
          'Consignado'
          'Consignado Loja'
          'Pr'#243'prio'
          'Zero')
        TabOrder = 3
        Width = 171
      end
      object edtGerarEstoque: TcxCheckBox
        Left = 609
        Top = 72
        Caption = 'Movimentar Estoque'
        Properties.ClearKey = 16452
        Properties.DisplayChecked = 'S'
        Properties.DisplayUnchecked = 'N'
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        State = cbsGrayed
        Style.TransparentBorder = False
        TabOrder = 8
        Transparent = True
      end
      object edtGerarFinanceiro: TcxCheckBox
        Left = 673
        Top = 41
        Caption = 'Gerar Financeiro'
        Properties.ClearKey = 16452
        Properties.DisplayChecked = 'S'
        Properties.DisplayUnchecked = 'N'
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        State = cbsGrayed
        Style.TransparentBorder = False
        TabOrder = 9
        Transparent = True
      end
      object btncarrinho: TcxButton
        Left = 609
        Top = 99
        Width = 82
        Height = 25
        Cursor = crHandPoint
        Caption = 'Lista'
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000031B49444154785E65927F6894751CC75FDFBBE7B679B23BB70ACE9D37
          8A39B431D6209BB3D24BDA741A45141454921022916B7F28A5CD0DD236EDA698
          A2E5708595C4C88A76735BCB26CED69ACC6683C5D53466B09C5371536F7A77CF
          8F4F0F4F1E24BDE1CDF7E181EF8BD71BBE4A4400F8E0E37E2C04441060D3BAA5
          2EC02E0A903BB5761CE811CB126AAB2B7022224E771D3A4553732F805AB4A42A
          EBDD3D9D9B1BF71F3FBBF3C089E4F6BDDDBFD445DAB614972E9B0528D31280BB
          01EF7F7412403D5C5E95F5DEBEEEBED6E859199F9816CBB264FCE294B4468764
          6BA4FDA7C207CBBC806A5FB798A8DD348086FD3D00EEBAC8B7DB8E7C7346AE4C
          DD96C8E1217965EB0FD2F4D9904C5EBB2587BF1C9037DEFE641BA089089D1BC2
          68CA0E90AE07B457C34BE6D37C7484DCDC1C36BD56C29E8EF334B7C7585BB980
          8133BFAF051AF9ADD1B0EDD000F5CECEB6134AB9C38F3F92CFA9D317C8F57B39
          3F7E9DF5CB4AB080EC6090B1D1417C3E2F89642A00B848A5304D71002ED3225C
          5BB302C4A07F708CC9AB372908CDE160CF057CC110E6CD4B3C90E7E78AFD7F26
          1E9F0448035C80D2532600228A7973B3E9383ECC4BAB0A29F4C5998AFD4CC813
          E785270AF82ADACF9C1BB151C0ADCA77281B800232AA6B5B93CF3E550608FED9
          6E8E4607ECFD7E2AC2C5CC0DE43071699ACEEF07894F8CF0DC3D43F4F59DABDB
          786C643790F8D74037585412A4B42848CA546C7C7D1581DC4C0EB674B0BEE643
          FB6C637A7490D5DED3942DBD9F47CB42DB1B2A176E066669804AE9BAA36F89F0
          D7DFD759383FC033ABCB292A2A203FCF87E676D1D533CCB15D9F37E88999DA27
          2B0B301289FA486686A980AC351B5A6EBFFCE272AE5E9B01483F67270AB83767
          363FF60FD3B0E5F9FBDE2CCDABAE782CBF7E654588235F8CC51D03DD3059FCD0
          3C74C3A2BB779495E10580F05DEF1FACB0BF333417873EED0648ECFBF562E456
          D2D0FF3C77A3DEF2685F6B0086610020E0CC10242DE23465830DD300B080444B
          EC7213B1CB7B016742E6D36B7677B95C9EE5DC7551507007A630F4D4C9AED6B7
          AA6A8A0349CB14F2033964FBBD28C0057800670EFF4F5ACE007411B1F84FFE01
          50F17D7A33A576B70000000049454E44AE426082}
        TabOrder = 10
        OnClick = btncarrinhoClick
      end
      object btncadveiculo: TcxButton
        Left = 697
        Top = 99
        Width = 90
        Height = 25
        Cursor = crHandPoint
        Caption = 'Ve'#237'culo | F2'
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C0000001B744558745469746C65004164643B506C75733B426172
          733B526962626F6E3B9506332F0000004749444154785EE592C90900200C046D
          D0A6ACCAEE4604E32B8AB8011F3E0602590672244062DBCCA532E8F5D7024017
          AC98C11B4205C6D10896F50486B744235CA09FF1FD274A34995FABF9E946D7E8
          0000000049454E44AE426082}
        OptionsImage.Spacing = 3
        TabOrder = 11
        OnClick = btncadveiculoClick
      end
      object edtCadPessoa: TcxButtonEdit
        Left = 576
        Top = 37
        Cursor = crHandPoint
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
        Properties.OnButtonClick = edtCadPessoaPropertiesButtonClick
        Style.BorderStyle = ebsFlat
        Style.HotTrack = True
        Style.Shadow = False
        Style.TransparentBorder = True
        Style.ButtonStyle = btsDefault
        TabOrder = 12
        Width = 27
      end
      object edtCadResposavel: TcxButtonEdit
        Left = 576
        Top = 68
        Cursor = crHandPoint
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
        Properties.OnButtonClick = edtCadResposavelPropertiesButtonClick
        Style.BorderStyle = ebsFlat
        Style.HotTrack = True
        Style.Shadow = False
        Style.TransparentBorder = True
        Style.ButtonStyle = btsDefault
        TabOrder = 13
        Width = 27
      end
    end
    object PageControl1: TPageControl
      Left = 2
      Top = 137
      Width = 796
      Height = 300
      ActivePage = TabLista
      TabOrder = 1
      OnChange = PageControl1Change
      object TabCarrinho: TTabSheet
        Caption = 'Ve'#237'culo'
        object cxGrid1: TcxGrid
          Left = 0
          Top = 0
          Width = 788
          Height = 268
          Align = alClient
          BorderStyle = cxcbsNone
          TabOrder = 0
          object cxGridDBTableView2: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            ScrollbarAnnotations.CustomAnnotations = <>
            OnCellDblClick = cxGridDBTableView2CellDblClick
            DataController.DataSource = dsCarrinho
            DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded, dcoImmediatePost]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                FieldName = 'id_produto'
                Column = cxGridDBColumn1
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.NoDataToDisplayInfoText = '<Sem ve'#237'culo na lista>'
            OptionsView.GroupByBox = False
            Styles.StyleSheet = FrmPrincipal.CxGridPedido
            object cxGridDBColumn1: TcxGridDBColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'codigo'
              Width = 37
            end
            object cxGridDBColumn3: TcxGridDBColumn
              Caption = 'Marca/Modelo'
              DataBinding.FieldName = 'descricao'
              Width = 318
            end
            object cxGridDBColumn2: TcxGridDBColumn
              Caption = 'Placa'
              DataBinding.FieldName = 'placa'
              Width = 70
            end
            object cxGridDBColumn4: TcxGridDBColumn
              Caption = 'Cor'
              DataBinding.FieldName = 'cor'
              Width = 79
            end
            object cxGridDBColumn8: TcxGridDBColumn
              Caption = 'Ano/Modelo'
              DataBinding.FieldName = 'anomodelo'
              Width = 89
            end
            object cxGridDBColumn10: TcxGridDBColumn
              Caption = 'Pre'#231'o'
              DataBinding.FieldName = 'vlrunitario'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 90
            end
            object cxGridDBTableView2Column2: TcxGridDBColumn
              Caption = 'Total'
              DataBinding.FieldName = 'total'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 90
            end
            object cxGridDBTableView2Column1: TcxGridDBColumn
              DataBinding.FieldName = 'idveiculo'
              Visible = False
              Width = 74
            end
            object veictroca: TcxGridDBColumn
              Caption = 'Ve'#237'culo Troca'
              DataBinding.FieldName = 'veiculotroca'
              Visible = False
              GroupIndex = 0
              Options.Editing = False
              SortIndex = 0
              SortOrder = soAscending
              Width = 32
            end
          end
          object cxGridLevel2: TcxGridLevel
            GridView = cxGridDBTableView2
          end
        end
      end
      object TabLista: TTabSheet
        Caption = 'TabListaPesquisa'
        ImageIndex = 1
        TabVisible = False
        object Panel3: TPanel
          Left = 0
          Top = 208
          Width = 788
          Height = 60
          Align = alBottom
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object cxGroupBox11: TcxGroupBox
            Left = 0
            Top = 0
            Align = alClient
            Caption = 
              'Pesquisa Ve'#237'culo - C'#243'digo: [//], Placa, Marca/Modelo: [**], Ano/' +
              'Modelo:  [--]'
            PanelStyle.OfficeBackgroundKind = pobkStyleColor
            Style.BorderColor = clNone
            Style.BorderStyle = ebsNone
            Style.TextStyle = [fsBold]
            Style.TransparentBorder = False
            TabOrder = 0
            Transparent = True
            Height = 60
            Width = 788
            object edtPesquisa: TcxTextEdit
              Left = 0
              Top = 17
              Align = alClient
              AutoSize = False
              ParentFont = False
              Properties.CharCase = ecUpperCase
              Properties.ClearKey = 16452
              Properties.OnChange = edtPesquisaPropertiesChange
              Style.BorderStyle = ebsNone
              Style.Color = 16771279
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = 4144959
              Style.Font.Height = -24
              Style.Font.Name = 'Segoe UI'
              Style.Font.Style = [fsBold]
              Style.TransparentBorder = False
              Style.IsFontAssigned = True
              TabOrder = 0
              Height = 31
              Width = 788
            end
          end
        end
        object cxGrid: TcxGrid
          Left = 0
          Top = 0
          Width = 788
          Height = 208
          Align = alClient
          BorderStyle = cxcbsNone
          TabOrder = 1
          object cxGridDBTableView1: TcxGridDBTableView
            OnKeyDown = cxGridDBTableView1KeyDown
            Navigator.Buttons.CustomButtons = <>
            ScrollbarAnnotations.CustomAnnotations = <>
            OnCellDblClick = cxGridDBTableView1CellDblClick
            DataController.DataSource = dsVeiculoLista
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                FieldName = 'id_produto'
                Column = coll1
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o>'
            OptionsView.GroupByBox = False
            Styles.StyleSheet = FrmPrincipal.CxGridPedido
            object idproduto: TcxGridDBColumn
              DataBinding.FieldName = 'id_produto'
              Visible = False
            end
            object coll1: TcxGridDBColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'codigo'
              Width = 52
            end
            object coll3: TcxGridDBColumn
              Caption = 'Placa'
              DataBinding.FieldName = 'placa'
              Width = 72
            end
            object cxGridDBTableView1Column2: TcxGridDBColumn
              Caption = 'Marca/Modelo'
              DataBinding.FieldName = 'descricao_fiscal'
              Width = 381
            end
            object cxGridDBTableView1Column3: TcxGridDBColumn
              Caption = 'Ano/Modelo'
              DataBinding.FieldName = 'anomodelo'
              Width = 87
            end
            object cxGridDBTableView1Column4: TcxGridDBColumn
              Caption = 'Fipe'
              DataBinding.FieldName = 'veiculo_fipe'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 95
            end
            object cxGridDBTableView1Column8: TcxGridDBColumn
              Caption = 'Prc. Venda'
              DataBinding.FieldName = 'prc_venda'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Styles.Content = FrmPrincipal.cxColunaPedido
              Width = 95
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = cxGridDBTableView1
          end
        end
      end
    end
    object btnexcluir: TcxButton
      Left = 96
      Top = 450
      Width = 80
      Height = 25
      Cursor = crHandPoint
      Caption = 'Excluir'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000001974455874536F6674776172650041646F626520496D616765526561
        647971C9653C00000029744558745469746C650052656D6F76653B44656C6574
        653B426172733B526962626F6E3B5374616E646172643B635648300000002B49
        444154785EEDD03111000008C340C4E104D3B8091EE8C2711DB2FE9000A4CE00
        06BA924D32F066A281015E5FEF3B94FC8DC40000000049454E44AE426082}
      TabOrder = 2
      Visible = False
      OnClick = btnexcluirClick
    end
    object btnEditar: TcxButton
      Left = 10
      Top = 450
      Width = 80
      Height = 25
      Cursor = crHandPoint
      Caption = 'Editar'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000001974455874536F6674776172650041646F626520496D616765526561
        647971C9653C00000018744558745469746C650052656E616D653B4461746153
        6F757263653B1BE72EC3000002DE49444154785E6D907F68955518C73FE7BCEF
        DDDAEE9D2DD4356D95306317B11F3390FAC38B7609B219AB49904CE80744B458
        8D590C77E71294FA236CB5DAD4BBC18522576D529A4941D99A3561E42AE6885D
        5334D8ACC8FEB0EDCEF7C739C797039631BFF0E17978799EEFF93EAF782B37FC
        AD946ECA18034054313A82084384AD80B1BDEF07C73B9A1F4A477D00E02A45EA
        F9ADF7E348D05A23A5044029058014126504C66800DED8FFF53AC001AC81F4BD
        008CE6879F4EB3A13EC3D8781ECFF359FF58C632F6631E8166DE531422EC3C08
        AC407A7E685F7B31936577FB165A7664AD4118840CF56DA3A5234B1886687B0E
        F87EF87F03DFF36D741586D4542F271A8E080855C0A6ADBB79B6318D3606C711
        14C704A9B5D500AE88F449531219395A8330F4D9F844272AF00995B2F5E36C2B
        3DB9CF1108308AE9EFB3C4BF7B8A034DC91D80DBB0774A44270480B0098E7CD0
        691338525AD386675EA3BFEB25C03033DA4FF1FC3152AF0E52BB6EE5CBEF3E5A
        B50B70DC2801D27139F165B77D69F48BB771A4C3C8913D0821901167BEE92511
        8C705B7D17FADC9BFC3DF12BDE3F5E1BB0D39D2F14869BDB07D6630C06008390
        926475252BAACA29F9FD30C9C53FB3627337FE2FAF33961B869B2BB97071BA0B
        D002B8017001C17FB2DF87DAEEEE587DD7B2E63BB6F43077722727DF3F8E5A5A
        C9A18F4E75BF736A763B701963CCB5FCBB7C3853BB673297364A9F317F0D3F6E
        BE6ABAD51CCDDC6B9EAB29ED0612807C7A590CC942C9C647D26B97942F694D3E
        99E58FA32D8C0F8C32577213073F9CECD93F55C80085C60A576B032E0B159B98
        BB67F3C51B17E34DFFC9C4A1712E1595F1D9E054EF7BBF79EDC0DCB98107F52B
        2F1C231E97D737908E5B77FB9D6B3878E053CE9F2E66327F76EFC08CDF0ECCE6
        FB52DA9FBD4CA034F1588CEBFD8345E5B7A44D59C57DE74BCA57EDAB5A9478E0
        EACD9B128208EAE2F070023A579722ECD2351242B8401C90800F7880DA586AFD
        3140CC11ACAC286269598C2BDA9E72D92950F32D0000000049454E44AE426082}
      TabOrder = 3
      Visible = False
      OnClick = btnEditarClick
    end
    object EdtTotal: TcxCurrencyEdit
      Left = 699
      Top = 450
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.ClearKey = 16452
      Properties.DisplayFormat = 'R$ #,##0.00'
      Properties.EditFormat = 'R$ #,##0.00'
      Properties.ReadOnly = True
      Properties.UseDisplayFormatWhenEditing = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 4
      Width = 90
    end
    object edttroca: TcxCurrencyEdit
      Left = 245
      Top = 450
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.ClearKey = 16452
      Properties.DisplayFormat = 'R$ #,##0.00'
      Properties.EditFormat = 'R$ #,##0.00'
      Properties.ReadOnly = True
      Properties.UseDisplayFormatWhenEditing = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 5
      Width = 90
    end
    object edtsubtotal: TcxCurrencyEdit
      Left = 402
      Top = 450
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.ClearKey = 16452
      Properties.DisplayFormat = 'R$ #,##0.00'
      Properties.EditFormat = 'R$ #,##0.00'
      Properties.ReadOnly = True
      Properties.UseDisplayFormatWhenEditing = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 6
      Width = 90
    end
    object edtDesconto: TcxCurrencyEdit
      Left = 564
      Top = 450
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.ClearKey = 16452
      Properties.DisplayFormat = 'R$ #,##0.00'
      Properties.EditFormat = 'R$ #,##0.00'
      Properties.ReadOnly = True
      Properties.UseDisplayFormatWhenEditing = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 7
      Width = 90
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 680
  end
  object dsPessoa: TUniDataSource
    DataSet = TabCliente
    Left = 496
    Top = 440
  end
  object dsResponsavel: TUniDataSource
    DataSet = TabVendedor
    Left = 496
    Top = 408
  end
  object dsVeiculoLista: TUniDataSource
    DataSet = TabEntradaVeiculoLista
    Left = 496
    Top = 360
  end
  object dsCarrinho: TUniDataSource
    DataSet = TabVeiculoCompraLista
    Left = 496
    Top = 304
  end
  object TabCliente: TClientDataSet
    PersistDataPacket.Data = {
      5F0000009619E0BD0100000018000000030000000000030000005F000869645F
      736F63696F040001000000000007636C69656E74650100490000000100055749
      44544802000200BE000363706601004900000001000557494454480200020014
      000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 552
    Top = 440
    object TabClienteid_socio: TIntegerField
      FieldName = 'id_socio'
    end
    object TabClientecliente: TStringField
      FieldName = 'cliente'
      Size = 190
    end
    object TabClientecpf: TStringField
      FieldName = 'cpf'
    end
  end
  object TabVendedor: TClientDataSet
    PersistDataPacket.Data = {
      620000009619E0BD01000000180000000300000000000300000062000E69645F
      66756E63696F6E6172696F04000100000000000466756E630100490000000100
      05574944544802000200BE000363706601004900000001000557494454480200
      020014000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 552
    Top = 408
    object TabVendedorid_funcionario: TIntegerField
      FieldName = 'id_funcionario'
    end
    object TabVendedorfunc: TStringField
      FieldName = 'func'
      Size = 190
    end
    object TabVendedorcpf: TStringField
      FieldName = 'cpf'
    end
  end
  object TabEntradaVeiculoLista: TClientDataSet
    PersistDataPacket.Data = {
      4D0100009619E0BD01000000180000000C0000000000030000004D0105706C61
      63610100490000000100055749445448020002000A000964657363726963616F
      01004900000001000557494454480200020096001064657363726963616F5F66
      697363616C0100490000000100055749445448020002009600097072635F7665
      6E646108000400000000000C76656963756C6F5F666970650800040000000000
      076573746F7175650100490000000100055749445448020002000500086E6D6D
      6F64656C6F0100490000000100055749445448020002003C00056C6F63616C01
      00490000000100055749445448020002003C000A69645F76656963756C6F0400
      01000000000009616E6F6D6F64656C6F01004900000001000557494454480200
      0200140006636F6469676F04000100000000000774656D666F746F0100490000
      0001000557494454480200020005000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 548
    Top = 360
    object TabEntradaVeiculoListaplaca: TStringField
      FieldName = 'placa'
      Size = 10
    end
    object TabEntradaVeiculoListadescricao: TStringField
      FieldName = 'descricao'
      Size = 150
    end
    object TabEntradaVeiculoListadescricao_fiscal: TStringField
      FieldName = 'descricao_fiscal'
      Size = 150
    end
    object TabEntradaVeiculoListaprc_venda: TFloatField
      FieldName = 'prc_venda'
    end
    object TabEntradaVeiculoListaveiculo_fipe: TFloatField
      FieldName = 'veiculo_fipe'
    end
    object TabEntradaVeiculoListaestoque: TStringField
      FieldName = 'estoque'
      Size = 5
    end
    object TabEntradaVeiculoListanmmodelo: TStringField
      FieldName = 'nmmodelo'
      Size = 60
    end
    object TabEntradaVeiculoListalocal: TStringField
      FieldName = 'local'
      Size = 60
    end
    object TabEntradaVeiculoListaid_veiculo: TIntegerField
      FieldName = 'id_veiculo'
    end
    object TabEntradaVeiculoListaanomodelo: TStringField
      FieldName = 'anomodelo'
    end
    object TabEntradaVeiculoListacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabEntradaVeiculoListatemfoto: TStringField
      FieldName = 'temfoto'
      Size = 5
    end
  end
  object TabVeiculoCompraLista: TClientDataSet
    PersistDataPacket.Data = {
      080300009619E0BD01000000180000001E000000000003000000080302696404
      0001000000000006636F6469676F04000100000000000964657363726963616F
      010049000000010005574944544802000200A00005706C616361010049000000
      010005574944544802000200070003636F720100490000000100055749445448
      02000200140009616E6F6D6F64656C6F01004900000001000557494454480200
      02000F000471746465080004000000010007535542545950450200490006004D
      6F6E65790008737562746F74616C080004000000010007535542545950450200
      490006004D6F6E65790005746F74616C08000400000001000753554254595045
      0200490006004D6F6E6579000C76656963756C6F74726F636101004900000001
      000557494454480200020004000B766C72756E69746172696F08000400000001
      0007535542545950450200490006004D6F6E65790009696476656963756C6F04
      0001000000000008646573636F6E746F08000400000001000753554254595045
      0200490006004D6F6E65790007766C7266697065080004000000000008766C72
      76656E646108000400000000000C766C72706572636C7563726F080004000000
      00000E617475616C697A61726669636861010049000000010005574944544802
      00020001000A766C72746178616D657308000400000000000A766C7274617861
      64696108000400000000000D766C72746F74616C706174696F08000400000000
      0013766C72636F6D697373616F6C6F6A617065726308000400000000000F766C
      72636F6D697373616F6C6F6A61080004000000000013766C72636F6D69737361
      6F76656E647065726308000400000000000F766C72636F6D697373616F76656E
      64080004000000000011766C7274617861636F6E7369676E61646F0800040000
      00000016646174617265746972616461636F6E7369676E61646F040006000000
      000008766C726C7563726F08000400000000000C766C7270726174696361646F
      080004000000000008766C72637573746F080004000000000008766C7274726F
      636108000400000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 160
      end
      item
        Name = 'placa'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'cor'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'anomodelo'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'qtde'
        DataType = ftCurrency
      end
      item
        Name = 'subtotal'
        DataType = ftCurrency
      end
      item
        Name = 'total'
        DataType = ftCurrency
      end
      item
        Name = 'veiculotroca'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'vlrunitario'
        DataType = ftCurrency
      end
      item
        Name = 'idveiculo'
        DataType = ftInteger
      end
      item
        Name = 'desconto'
        DataType = ftCurrency
      end
      item
        Name = 'vlrfipe'
        DataType = ftFloat
      end
      item
        Name = 'vlrvenda'
        DataType = ftFloat
      end
      item
        Name = 'vlrperclucro'
        DataType = ftFloat
      end
      item
        Name = 'atualizarficha'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'vlrtaxames'
        DataType = ftFloat
      end
      item
        Name = 'vlrtaxadia'
        DataType = ftFloat
      end
      item
        Name = 'vlrtotalpatio'
        DataType = ftFloat
      end
      item
        Name = 'vlrcomissaolojaperc'
        DataType = ftFloat
      end
      item
        Name = 'vlrcomissaoloja'
        DataType = ftFloat
      end
      item
        Name = 'vlrcomissaovendperc'
        DataType = ftFloat
      end
      item
        Name = 'vlrcomissaovend'
        DataType = ftFloat
      end
      item
        Name = 'vlrtaxaconsignado'
        DataType = ftFloat
      end
      item
        Name = 'dataretiradaconsignado'
        DataType = ftDate
      end
      item
        Name = 'vlrlucro'
        DataType = ftFloat
      end
      item
        Name = 'vlrpraticado'
        DataType = ftFloat
      end
      item
        Name = 'vlrcusto'
        DataType = ftFloat
      end
      item
        Name = 'vlrtroca'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 548
    Top = 310
    object TabVeiculoCompraListaid: TIntegerField
      FieldName = 'id'
    end
    object TabVeiculoCompraListacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabVeiculoCompraListadescricao: TStringField
      FieldName = 'descricao'
      Size = 160
    end
    object TabVeiculoCompraListaplaca: TStringField
      FieldName = 'placa'
      Size = 7
    end
    object TabVeiculoCompraListacor: TStringField
      FieldName = 'cor'
    end
    object TabVeiculoCompraListaanomodelo: TStringField
      FieldName = 'anomodelo'
      Size = 15
    end
    object TabVeiculoCompraListaqtde: TCurrencyField
      FieldName = 'qtde'
    end
    object TabVeiculoCompraListasubtotal: TCurrencyField
      FieldName = 'subtotal'
    end
    object TabVeiculoCompraListatotal: TCurrencyField
      FieldName = 'total'
    end
    object TabVeiculoCompraListaveiculotroca: TStringField
      FieldName = 'veiculotroca'
      Size = 4
    end
    object TabVeiculoCompraListavlrunitario: TCurrencyField
      FieldName = 'vlrunitario'
    end
    object TabVeiculoCompraListaidveiculo: TIntegerField
      FieldName = 'idveiculo'
    end
    object TabVeiculoCompraListadesconto: TCurrencyField
      FieldName = 'desconto'
    end
    object TabVeiculoCompraListavlrfipe: TFloatField
      FieldName = 'vlrfipe'
    end
    object TabVeiculoCompraListavlrvenda: TFloatField
      FieldName = 'vlrvenda'
    end
    object TabVeiculoCompraListavlrperclucro: TFloatField
      FieldName = 'vlrperclucro'
    end
    object TabVeiculoCompraListaatualizarficha: TStringField
      FieldName = 'atualizarficha'
      Size = 1
    end
    object TabVeiculoCompraListavlrtaxames: TFloatField
      FieldName = 'vlrtaxames'
    end
    object TabVeiculoCompraListavlrtaxadia: TFloatField
      FieldName = 'vlrtaxadia'
    end
    object TabVeiculoCompraListavlrtotalpatio: TFloatField
      FieldName = 'vlrtotalpatio'
    end
    object TabVeiculoCompraListavlrcomissaolojaperc: TFloatField
      FieldName = 'vlrcomissaolojaperc'
    end
    object TabVeiculoCompraListavlrcomissaoloja: TFloatField
      FieldName = 'vlrcomissaoloja'
    end
    object TabVeiculoCompraListavlrcomissaovendperc: TFloatField
      FieldName = 'vlrcomissaovendperc'
    end
    object TabVeiculoCompraListavlrcomissaovend: TFloatField
      FieldName = 'vlrcomissaovend'
    end
    object TabVeiculoCompraListavlrtaxaconsignado: TFloatField
      FieldName = 'vlrtaxaconsignado'
    end
    object TabVeiculoCompraListadataretiradaconsignado: TDateField
      FieldName = 'dataretiradaconsignado'
    end
    object TabVeiculoCompraListavlrlucro: TFloatField
      FieldName = 'vlrlucro'
    end
    object TabVeiculoCompraListavlrpraticado: TFloatField
      FieldName = 'vlrpraticado'
    end
    object TabVeiculoCompraListavlrcusto: TFloatField
      FieldName = 'vlrcusto'
    end
    object TabVeiculoCompraListavlrtroca: TFloatField
      FieldName = 'vlrtroca'
    end
  end
  object Tab_RelEntrada: TClientDataSet
    PersistDataPacket.Data = {
      AB0300009619E0BD01000000180000001E000000000003000000AB030969645F
      636F6D7072610400010000000000096E636F6E747261746F0400010000000000
      0464617461040006000000000004686F72610100490000000100055749445448
      020002001400047469706F010049000000010005574944544802000200140003
      6F6273020049000000010005574944544802000200F40108766C7254726F6361
      080004000000010007535542545950450200490006004D6F6E6579000B766C72
      737562746F74616C080004000000010007535542545950450200490006004D6F
      6E65790008766C72746F74616C08000400000001000753554254595045020049
      0006004D6F6E6579000B766C72646573636F6E746F0800040000000100075355
      42545950450200490006004D6F6E6579000C706573736F61636F6469676F0400
      0100000000000A706573736F616E6F6D65010049000000010005574944544802
      00020096000D706573736F616170656C69646F01004900000001000557494454
      48020002005A0009706573736F61636570010049000000010005574944544802
      00020014000E706573736F61656E64657265636F010049000000010005574944
      5448020002005A000C706573736F616E756D65726F0100490000000100055749
      4454480200020014000C706573736F6162616972726F01004900000001000557
      49445448020002003C000A706573736F61636F6D700100490000000100055749
      445448020002005A000E706573736F6174656C65666F6E650100490000000100
      0557494454480200020014000D706573736F6163656C756C6172010049000000
      01000557494454480200020014000E706573736F617768617473617070010049
      000000010005574944544802000200140009706573736F616370660100490000
      00010005574944544802000200140008706573736F6172670100490000000100
      0557494454480200020014000B706573736F616F7267616F0100490000000100
      0557494454480200020014000A706573736F617365786F010049000000010005
      57494454480200020014000B706573736F61636976696C010049000000010005
      574944544802000200140010706573736F616E617363696D656E746F04000600
      000000000B706573736F61656D61696C01004900000001000557494454480200
      0200960013706573736F616E6163696F6E616C69646164650100490000000100
      0557494454480200020014000C706573736F6163696461646501004900000001
      000557494454480200020064000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_compra'
        DataType = ftInteger
      end
      item
        Name = 'ncontrato'
        DataType = ftInteger
      end
      item
        Name = 'data'
        DataType = ftDate
      end
      item
        Name = 'hora'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'tipo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'obs'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'vlrTroca'
        DataType = ftCurrency
      end
      item
        Name = 'vlrsubtotal'
        DataType = ftCurrency
      end
      item
        Name = 'vlrtotal'
        DataType = ftCurrency
      end
      item
        Name = 'vlrdesconto'
        DataType = ftCurrency
      end
      item
        Name = 'pessoacodigo'
        DataType = ftInteger
      end
      item
        Name = 'pessoanome'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'pessoaapelido'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'pessoacep'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'pessoaendereco'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'pessoanumero'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'pessoabairro'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'pessoacomp'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'pessoatelefone'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'pessoacelular'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'pessoawhatsapp'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'pessoacpf'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'pessoarg'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'pessoaorgao'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'pessoasexo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'pessoacivil'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'pessoanascimento'
        DataType = ftDate
      end
      item
        Name = 'pessoaemail'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'pessoanacionalidade'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'pessoacidade'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 86
    Top = 295
    object Tab_RelEntradaid_compra: TIntegerField
      FieldName = 'id_compra'
    end
    object Tab_RelEntradancontrato: TIntegerField
      FieldName = 'ncontrato'
    end
    object Tab_RelEntradadata: TDateField
      FieldName = 'data'
    end
    object Tab_RelEntradahora: TStringField
      FieldName = 'hora'
    end
    object Tab_RelEntradatipo: TStringField
      FieldName = 'tipo'
    end
    object Tab_RelEntradaobs: TStringField
      FieldName = 'obs'
      Size = 500
    end
    object Tab_RelEntradavlrTroca: TCurrencyField
      FieldName = 'vlrTroca'
    end
    object Tab_RelEntradavlrsubtotal: TCurrencyField
      FieldName = 'vlrsubtotal'
    end
    object Tab_RelEntradavlrtotal: TCurrencyField
      FieldName = 'vlrtotal'
    end
    object Tab_RelEntradavlrdesconto: TCurrencyField
      FieldName = 'vlrdesconto'
    end
    object Tab_RelEntradapessoacodigo: TIntegerField
      FieldName = 'pessoacodigo'
    end
    object Tab_RelEntradapessoanome: TStringField
      FieldName = 'pessoanome'
      Size = 150
    end
    object Tab_RelEntradapessoaapelido: TStringField
      FieldName = 'pessoaapelido'
      Size = 90
    end
    object Tab_RelEntradapessoacep: TStringField
      FieldName = 'pessoacep'
    end
    object Tab_RelEntradapessoaendereco: TStringField
      FieldName = 'pessoaendereco'
      Size = 90
    end
    object Tab_RelEntradapessoanumero: TStringField
      FieldName = 'pessoanumero'
    end
    object Tab_RelEntradapessoabairro: TStringField
      FieldName = 'pessoabairro'
      Size = 60
    end
    object Tab_RelEntradapessoacomp: TStringField
      FieldName = 'pessoacomp'
      Size = 90
    end
    object Tab_RelEntradapessoatelefone: TStringField
      FieldName = 'pessoatelefone'
    end
    object Tab_RelEntradapessoacelular: TStringField
      FieldName = 'pessoacelular'
    end
    object Tab_RelEntradapessoawhatsapp: TStringField
      FieldName = 'pessoawhatsapp'
    end
    object Tab_RelEntradapessoacpf: TStringField
      FieldName = 'pessoacpf'
    end
    object Tab_RelEntradapessoarg: TStringField
      FieldName = 'pessoarg'
    end
    object Tab_RelEntradapessoaorgao: TStringField
      FieldName = 'pessoaorgao'
    end
    object Tab_RelEntradapessoasexo: TStringField
      FieldName = 'pessoasexo'
    end
    object Tab_RelEntradapessoacivil: TStringField
      FieldName = 'pessoacivil'
    end
    object Tab_RelEntradapessoanascimento: TDateField
      FieldName = 'pessoanascimento'
    end
    object Tab_RelEntradapessoaemail: TStringField
      FieldName = 'pessoaemail'
      Size = 150
    end
    object Tab_RelEntradapessoanacionalidade: TStringField
      FieldName = 'pessoanacionalidade'
    end
    object Tab_RelEntradapessoacidade: TStringField
      FieldName = 'pessoacidade'
      Size = 100
    end
  end
  object Tab_RelEntradaVeiculos: TClientDataSet
    PersistDataPacket.Data = {
      D60300009619E0BD01000000180000001D000000000003000000D60304717464
      6508000400000000000B766C72756E69746172696F0800040000000100075355
      42545950450200490006004D6F6E6579000F766C72646573636F6E746F706572
      63080004000000010007535542545950450200490006004D6F6E6579000B766C
      72646573636F6E746F080004000000010007535542545950450200490006004D
      6F6E6579000B636F6D706C656D656E746F020049000000010005574944544802
      000200F4010B766C72737562746F74616C080004000000010007535542545950
      450200490006004D6F6E65790008766C72746F74616C08000400000001000753
      5542545950450200490006004D6F6E6579000574726F63610100490000000100
      0557494454480200020001000A76656963636F6469676F04000100000000000D
      7665696364657363726963616F01004900000001000557494454480200020096
      000A7665696366697363616C0100490000000100055749445448020002009600
      0E76656963756C6F5F6F726967656D0100490000000100055749445448020002
      0032000B76656963756C6F5F616E6F0100490000000100055749445448020002
      0005001276656963756C6F5F616E6F5F6D6F64656C6F01004900000001000557
      49445448020002000A001376656963756C6F5F636F6D627573746976656C0100
      4900000001000557494454480200020019000E76656963756C6F5F63616D6269
      6F01004900000001000557494454480200020014000B76656963756C6F5F636F
      720100490000000100055749445448020002000F000D76656963756C6F5F706F
      72746104000100000000000A76656963756C6F5F6B6D08000400000001000753
      5542545950450200490006004D6F6E6579000D76656963756C6F5F706C616361
      01004900000001000557494454480200020007000A76656963756C6F5F756601
      004900000001000557494454480200020002000F76656963756C6F5F72656E61
      76616E01004900000001000557494454480200020014000E76656963756C6F5F
      63686173736901004900000001000557494454480200020019000B7665696375
      6C6F5F6372760100490000000100055749445448020002001400107665696375
      6C6F5F7469706F5F637276010049000000010005574944544802000200140005
      6D617263610100490000000100055749445448020002003C0005677275706F01
      00490000000100055749445448020002003C000E76656963756C6F6573706563
      69650100490000000100055749445448020002003C000D76656963756C6F6D6F
      64656C6F0100490000000100055749445448020002003C000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 86
    Top = 351
    object Tab_RelEntradaVeiculosqtde: TFloatField
      FieldName = 'qtde'
    end
    object Tab_RelEntradaVeiculosvlrunitario: TCurrencyField
      FieldName = 'vlrunitario'
    end
    object Tab_RelEntradaVeiculosvlrdescontoperc: TCurrencyField
      FieldName = 'vlrdescontoperc'
    end
    object Tab_RelEntradaVeiculosvlrdesconto: TCurrencyField
      FieldName = 'vlrdesconto'
    end
    object Tab_RelEntradaVeiculoscomplemento: TStringField
      FieldName = 'complemento'
      Size = 500
    end
    object Tab_RelEntradaVeiculosvlrsubtotal: TCurrencyField
      FieldName = 'vlrsubtotal'
    end
    object Tab_RelEntradaVeiculosvlrtotal: TCurrencyField
      FieldName = 'vlrtotal'
    end
    object Tab_RelEntradaVeiculostroca: TStringField
      FieldName = 'troca'
      Size = 1
    end
    object Tab_RelEntradaVeiculosveiccodigo: TIntegerField
      FieldName = 'veiccodigo'
    end
    object Tab_RelEntradaVeiculosveicdescricao: TStringField
      FieldName = 'veicdescricao'
      Size = 150
    end
    object Tab_RelEntradaVeiculosveicfiscal: TStringField
      FieldName = 'veicfiscal'
      Size = 150
    end
    object Tab_RelEntradaVeiculosveiculo_origem: TStringField
      FieldName = 'veiculo_origem'
      Size = 50
    end
    object Tab_RelEntradaVeiculosveiculo_ano: TStringField
      FieldName = 'veiculo_ano'
      Size = 5
    end
    object Tab_RelEntradaVeiculosveiculo_ano_modelo: TStringField
      FieldName = 'veiculo_ano_modelo'
      Size = 10
    end
    object Tab_RelEntradaVeiculosveiculo_combustivel: TStringField
      FieldName = 'veiculo_combustivel'
      Size = 25
    end
    object Tab_RelEntradaVeiculosveiculo_cambio: TStringField
      FieldName = 'veiculo_cambio'
    end
    object Tab_RelEntradaVeiculosveiculo_cor: TStringField
      FieldName = 'veiculo_cor'
      Size = 15
    end
    object Tab_RelEntradaVeiculosveiculo_porta: TIntegerField
      FieldName = 'veiculo_porta'
    end
    object Tab_RelEntradaVeiculosveiculo_km: TCurrencyField
      FieldName = 'veiculo_km'
    end
    object Tab_RelEntradaVeiculosveiculo_placa: TStringField
      FieldName = 'veiculo_placa'
      Size = 7
    end
    object Tab_RelEntradaVeiculosveiculo_uf: TStringField
      FieldName = 'veiculo_uf'
      Size = 2
    end
    object Tab_RelEntradaVeiculosveiculo_renavan: TStringField
      FieldName = 'veiculo_renavan'
    end
    object Tab_RelEntradaVeiculosveiculo_chassi: TStringField
      FieldName = 'veiculo_chassi'
      Size = 25
    end
    object Tab_RelEntradaVeiculosveiculo_crv: TStringField
      FieldName = 'veiculo_crv'
    end
    object Tab_RelEntradaVeiculosveiculo_tipo_crv: TStringField
      FieldName = 'veiculo_tipo_crv'
    end
    object Tab_RelEntradaVeiculosmarca: TStringField
      FieldName = 'marca'
      Size = 60
    end
    object Tab_RelEntradaVeiculosgrupo: TStringField
      FieldName = 'grupo'
      Size = 60
    end
    object Tab_RelEntradaVeiculosveiculoespecie: TStringField
      FieldName = 'veiculoespecie'
      Size = 60
    end
    object Tab_RelEntradaVeiculosveiculomodelo: TStringField
      FieldName = 'veiculomodelo'
      Size = 60
    end
  end
  object frxRelatorio: TfrxReport
    Tag = 1
    Version = '2022.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.AllowEdit = False
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbTools, pbNavigator, pbExportQuick, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44209.307053020800000000
    ReportOptions.LastChange = 45855.504953576390000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      #39'var'
      #39'PNG:String;'
      'begin'
      '  '#39'      PNG:=<wLogo>; //receber foto da carteirinha'
      '  '#39'       if PNG <> '#39#39' then //verifica se e diferente de vazio'
      '  '#39'       nlogo.Picture.LoadFromFile(PNG);//carrega na tela'
      ''
      '  '#39'nrazao.Text          := <nfantasia>+'#39' | '#39'+<ncnpj>;'
      '  '#39'ncontatos.Text       := <nemail>+'#39' - '#39'+ <ntelefone>;'
      
        '  '#39'nendereco.Text       := <nendereco>+'#39', '#39'+<nnumero>+'#39' - '#39'+<nba' +
        'irro>+'#39' | '#39'+<ncep>+'#39' - '#39'+<ncidade>;'
      ''
      ''
      ''
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 160
    Top = 296
    Datasets = <
      item
        DataSet = frxDBDadosEntrada
        DataSetName = 'frxDBDadosEntrada'
      end
      item
        DataSet = frxDBDadosVeiculo
        DataSetName = 'frxDBDadosVeiculo'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'nrazao'
        Value = Null
      end
      item
        Name = 'nfantasia'
        Value = Null
      end
      item
        Name = 'nendereco'
        Value = Null
      end
      item
        Name = 'nnumero'
        Value = Null
      end
      item
        Name = 'nbairro'
        Value = Null
      end
      item
        Name = 'ncep'
        Value = Null
      end
      item
        Name = 'ntelefone'
        Value = Null
      end
      item
        Name = 'nfone1'
        Value = Null
      end
      item
        Name = 'nfone2'
        Value = Null
      end
      item
        Name = 'nemail'
        Value = Null
      end
      item
        Name = 'ncnpj'
        Value = Null
      end
      item
        Name = 'nie'
        Value = Null
      end
      item
        Name = 'wlogo'
        Value = Null
      end
      item
        Name = 'ncidade'
        Value = Null
      end
      item
        Name = 'filtro'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      OnBeforePrint = 'Page1OnBeforePrint'
      object Heade: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 139.842610000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object nlogo: TfrxPictureView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 1.779530000000000000
          Width = 221.267780000000000000
          Height = 131.338590000000000000
          Center = True
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Top = 135.992270000000000000
          Width = 755.905536220000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Picture3: TfrxPictureView
          AllowVectorExport = True
          Left = 721.890230000000000000
          Width = 32.000000000000000000
          Height = 32.000000000000000000
          AutoSize = True
          Frame.Typ = []
          Picture.Data = {
            07544269746D617036100000424D361000000000000036000000280000002000
            0000200000000100200000000000001000000000000000000000000000000000
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFF3F1F0FFC8BFBAFFA4958CFF89766AFF776254FF735D
            4FFF735D4FFF776254FF89766AFFA4958CFFC8BFBAFFF3F2F0FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFE5E0DEFFA2938AFF755F51FF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF755F51FFA2938AFFE5E0
            DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6F5FFAA9D
            94FF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFFAA9D94FFF7F6F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E2DFFF857266FF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF857266FFE6E2DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED9D6FF7A6658FF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF918075FFBAAFA8FFD8D2CEFFEDEAE9FFF6F5
            F4FFF6F5F4FFEEEBE9FFD8D2CEFFBBB0A9FF928176FF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF7A6658FFDFD9D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E2DFFF7A6658FF735D4FFF735D4FFF735D
            4FFF776254FFAFA39BFFECE9E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE9E7FFAFA39BFF7762
            54FF735D4FFF735D4FFF735D4FFF7A6658FFE6E2DFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFF7F6F5FF857266FF735D4FFF735D4FFF735D4FFF9584
            7AFFECE9E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE9
            E7FF95847AFF735D4FFF735D4FFF735D4FFF857266FFF7F6F5FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFAA9D94FF735D4FFF735D4FFF735D4FFFA89A91FFFDFD
            FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFDFDFCFFA89A91FF735D4FFF735D4FFF735D4FFFAA9D94FFFFFFFFFFFFFF
            FFFFFFFFFFFFE5E0DEFF735D4FFF735D4FFF735D4FFF735D4FFF7A6558FFA597
            8EFFCFC7C3FFF6F5F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F5F4FFCFC7
            C3FFA5978EFF7A6558FF735D4FFF735D4FFF735D4FFF735D4FFFE5E0DEFFFFFF
            FFFFFFFFFFFFA2938AFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF776254FFAC9F97FFF5F3F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F3F2FFAC9F97FF776254FF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFFA2938AFFFFFF
            FFFFF3F1F0FF755F51FF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF877468FFF4F2F1FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F2F1FF877468FF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF755F51FFF3F2
            F0FFC8BFBAFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFFAC9F97FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFAC9F97FF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFFC8BF
            BAFFA4958CFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF8B796DFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF99897FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFFA495
            8CFF89766AFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF7C675AFFE9E5E3FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F5F4FF8B786DFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF8976
            6AFF786256FF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFFCEC7C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E5E2FF766153FF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF7762
            54FF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF928176FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A39CFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFFD3CCC8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFECEBFF745E50FF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF786256FF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFFA09288FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2948AFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF7762
            54FF89766AFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF745E51FFEEECEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEECEAFF745E
            51FF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF8976
            6AFFA4958CFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF837064FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8370
            64FF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFFA495
            8CFFC8BFBAFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF745E50FFDAD5D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E1DFFF745E
            50FF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFFC8BF
            BAFFF3F1F0FF756152FF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFFA99C93FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7BEB8FF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF755F51FFF3F1
            F0FFFFFFFFFFA2938AFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF8E7D72FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADA097FF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFFA2938AFFFFFF
            FFFFFFFFFFFFE5E0DEFF755F50FF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF745E50FFECEAE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFF826E62FF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFFE5E0DEFFFFFF
            FFFFFFFFFFFFFFFFFFFFAA9D94FF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFFAA9D95FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8C0BAFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFFAA9D94FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFF7F6F5FF857266FF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF745E50FFD7D0CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEAE8FF7C685BFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF857266FFF7F6F5FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E2DFFF7A6658FF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF786355FFD4CECAFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E3E1FF857266FF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF7A6658FFE6E2DFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED9D6FF7A6658FF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFFA19289FFD8D2CEFFF3F1
            F0FFF5F3F2FFDFDAD7FFAFA29AFF766153FF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF7A6658FFDED9D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E2DFFF857266FF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF857266FFE6E2DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6F5FFAA9D
            94FF755F50FF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFFAA9D94FFF7F6F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFE5E0DEFFA2938AFF756152FF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF755F51FFA2938AFFE5E0
            DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFF3F1F0FFC8BFBAFFA4958CFF89766AFF786256FF735D
            4FFF735D4FFF786256FF89766AFFA4958CFFC8BFBAFFF3F1F0FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Picture4: TfrxPictureView
          AllowVectorExport = True
          Left = 721.890230000000000000
          Top = 37.795300000000000000
          Width = 32.000000000000000000
          Height = 32.000000000000000000
          AutoSize = True
          Frame.Typ = []
          Picture.Data = {
            07544269746D617036100000424D361000000000000036000000280000002000
            0000200000000100200000000000001000000000000000000000000000000000
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFCF9F4FFEEE1C9FFE2CDA6FFDBBE8DFFD5B57BFFD4B3
            77FFD4B377FFD5B57BFFDBBE8DFFE2CDA6FFEEE1C9FFFCF9F4FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFF7F1E5FFE2CCA5FFD4B479FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B479FFE2CCA5FFF7F1
            E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBF7FFE4D0
            ADFFD3B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD3B3
            77FFE4D0ADFFFDFBF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F1E6FFD9BC88FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD9BC88FFF7F1E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EDDFFFD6B77FFFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD6B77FFFF5EEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F1E6FFD6B77FFFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD6B77FFFF7F1E6FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFDFBF7FFD9BC88FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD9BC88FFFDFBF8FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFE4D0ADFFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD0B075FFC4A56FFFB99C6AFFB09566FFC1A36EFFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFE4D0ADFFFFFFFFFFFFFF
            FFFFFFFFFFFFF7F1E5FFD3B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD0AF75FFBEA16CFFB79E73FFD2C3A9FFEBE4D8FFFCFCFAFFD7CAB3FFC8A9
            71FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD3B377FFF7F1E5FFFFFF
            FFFFFFFFFFFFE2CCA4FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD3B276FFC4A5
            6FFFBAA177FFDED3C0FFFDFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1BD
            9BFFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFE2CCA5FFFFFF
            FFFFFCF9F4FFD4B479FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD2B176FFBB9F6CFFD2C2
            A8FFFBFAF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE9
            DFFFD3B276FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B479FFFCF9
            F4FFEEE1C9FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD2B176FFBB9F6FFFE5DDCEFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFD
            FCFFD4B378FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFEEE1
            C9FFE2CDA6FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD3B276FFBDA271FFEDE7DCFFFFFFFFFFFFFF
            FFFFFFFFFFFFF7F1E7FFFCFAF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9D9
            BBFFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFE2CD
            A6FFDBBE8BFFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFC1A470FFE9E2D5FFFFFFFFFFFFFFFFFFFDFC
            FAFFE6D3B0FFD4B378FFD7B881FFF0E6D2FFFFFFFFFFFAF7F1FFE4D0ABFFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFDBBE
            8DFFD6B67BFFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFCBAB72FFDACEB9FFFFFFFFFFFFFFFFFFFCFAF7FFDDC4
            95FFD4B377FFD4B377FFD4B377FFD4B377FFDCC191FFD4B479FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD5B5
            7BFFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD3B276FFC9B48EFFFEFEFEFFFFFFFFFFFEFDFBFFDEC496FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFC6A872FFF2EDE5FFFFFFFFFFFFFFFFFFE8D6B6FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD6B67BFFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD3B276FFD4C3A5FFFFFFFFFFFFFFFFFFFBF9F7FFCAAC75FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD5B5
            7BFFDBBE8BFFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFC9AA73FFF4F0EAFFFFFFFFFFFFFFFFFFFFFFFFFFCAB794FFCFAF74FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFDBBE
            8DFFE2CDA6FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD3BF9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F6F2FFCCB282FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFE2CD
            A6FFEEE1C9FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD3B2
            76FFE7DFD0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8D6B7FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFEEE1
            C9FFFCF9F4FFD4B579FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            78FFFDFCFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC293FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B479FFFCF9
            F4FFFFFFFFFFE2CCA4FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFEEE0C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDDFC6FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFE2CCA5FFFFFF
            FFFFFFFFFFFFF7F1E5FFD5B479FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B378FFE6D3B0FFF7F2E8FFFDFCFBFFE8D8B9FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD3B377FFF7F1E5FFFFFF
            FFFFFFFFFFFFFFFFFFFFE4D0ADFFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFE4D0ADFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFDFBF7FFD9BC88FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD9BC88FFFDFBF7FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F1E6FFD6B77FFFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD6B77FFFF7F1E6FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EDDFFFD6B77FFFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD6B77FFFF5EDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F1E6FFD9BC88FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD9BC88FFF7F1E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBF7FFE4D0
            ADFFD5B479FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD3B3
            77FFE4D0ADFFFDFBF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFF7F1E5FFE2CCA4FFD4B579FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B479FFE2CCA4FFF7F1
            E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFCF9F4FFEEE1C9FFE2CDA6FFDBBE8BFFD6B67BFFD4B3
            77FFD4B377FFD6B67BFFDBBE8BFFE2CDA6FFEEE1C9FFFCF9F4FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Picture2: TfrxPictureView
          AllowVectorExport = True
          Left = 721.890230000000000000
          Top = 76.590600000000000000
          Width = 32.000000000000000000
          Height = 32.000000000000000000
          AutoSize = True
          Frame.Typ = []
          Picture.Data = {
            07544269746D617036100000424D361000000000000036000000280000002000
            0000200000000100200000000000001000000000000000000000000000000000
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFF9FAF4FFE0E7C9FFCBD7A6FFBCCB8BFFB1C37AFFAFC2
            76FFAFC276FFB1C37AFFBCCB8BFFCBD7A6FFE0E7C9FFF9FAF4FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFF0F4E5FFCAD6A4FFB0C278FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFB0C278FFCAD6A4FFF0F4
            E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFCF7FFCFDA
            ACFFAFC176FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC1
            76FFCFDAACFFFBFCF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F4E6FFB9C987FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFB9C987FFF1F4E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDF1DFFFB3C57DFFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFACBF74FF9AAA
            69FF9AAA69FFACBE74FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFB3C57DFFEDF1DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F4E6FFB3C57DFFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFA9BB72FF9EAC73FFDFE4
            D3FFE0E4D4FF9FAD76FFA8BA72FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFB3C57DFFF1F4E6FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFBFCF7FFB9C987FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFA6B870FFA9B585FFF3F5EEFFFFFF
            FFFFFFFFFFFFF4F6F0FFABB788FFA5B770FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFB9C987FFFBFCF7FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFCDDAACFFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFA6B870FFB2BD92FFFAFBF9FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFCFCFAFFB5BF97FFA5B770FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFCFDAACFFFFFFFFFFFFFF
            FFFFFFFFFFFFF0F4E5FFAFC176FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFA9BB72FFB3BD92FFFCFCFBFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFB6C097FFA8BA72FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC176FFF0F4E5FFFFFF
            FFFFFFFFFFFFCAD6A4FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFADBF74FFABB786FFFAFBF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFBFFADB98AFFACBF74FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFCAD6A4FFFFFF
            FFFFF9FAF4FFB0C278FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFA4B375FFF2F4ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F6F0FFA4B377FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFB0C278FFF9FA
            F4FFE0E7C9FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFA9BB72FFD6DBC5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9DFCAFFA8BA
            72FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFE0E7
            C9FFCBD7A5FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFB2BF8AFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2BF
            8BFFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFCBD7
            A6FFBACB8BFFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFADBF
            74FFDBE0CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDE2
            CFFFACBF74FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFBCCB
            8BFFB1C47AFFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFADBE
            7AFFFCFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F7EDFFCAD6A5FFB5C7
            81FFB5C781FFCAD6A5FFF4F7EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFD
            FCFFADBE7BFFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFB1C3
            7AFFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFC2CE
            9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F7EDFFB5C681FFAFC276FFAFC2
            76FFAFC276FFAFC276FFB5C681FFF4F7EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFC2CF9DFFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFD3DD
            B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAD7A5FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFCAD6A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFD4DDB6FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFB1C47AFFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFD6E0
            BAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5C681FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFB5C681FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFD7E1BCFFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFB1C3
            7AFFBACB8BFFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFD5DF
            B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEBE7DFFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAEBE7DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFD5DFB7FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFBCCB
            8BFFCBD7A5FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFC7D4
            A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBC59CFFACBF74FFAFC276FFAFC2
            76FFAFC276FFAFC276FFACBF74FFBBC59CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFC8D5A0FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFCBD7
            A6FFE0E7C9FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFB3C5
            7EFFFBFCF9FFFFFFFFFFFFFFFFFFFFFFFFFFF1F3EBFF9EAC73FFA4B670FFACBF
            74FFACBF74FFA4B670FF9EAC73FFF1F3EBFFFFFFFFFFFFFFFFFFFFFFFFFFFBFC
            F9FFB3C57EFFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFE0E7
            C9FFF9FAF4FFB1C378FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFDCE5C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F3EBFFB7C199FF9BA9
            72FF9BA972FFB7C199FFF1F3EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCE5
            C4FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFB0C278FFF9FA
            F4FFFFFFFFFFCAD6A4FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFB3C57EFFF5F7EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F7EEFFB3C5
            7EFFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFCAD6A4FFFFFF
            FFFFFFFFFFFFF0F4E5FFB0C378FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFBDCC8EFFF8FAF3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FAF3FFBDCC8EFFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC176FFF0F4E5FFFFFF
            FFFFFFFFFFFFFFFFFFFFCDDAACFFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFB9CA88FFECF1DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECF1DFFFB9CA88FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFCFDAACFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFBFCF7FFB9C987FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFC6D49EFFE4EAD1FFF6F8F1FFFFFF
            FFFFFFFFFFFFF6F8F1FFE4EAD1FFC6D49EFFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFB9C987FFFBFCF7FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F4E6FFB3C57DFFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFB3C57DFFF1F4E6FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDF1DFFFB3C57DFFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFB3C57DFFEDF1DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F4E6FFB9C987FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFB9C987FFF1F4E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFCF7FFCDDA
            ACFFB0C378FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC1
            76FFCDDAACFFFBFCF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFF0F4E5FFCAD6A4FFB1C378FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFB0C278FFCAD6A4FFF0F4
            E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFF9FAF4FFE0E7C9FFCBD7A5FFBACB8BFFB1C47AFFAFC2
            76FFAFC276FFB1C47AFFBACB8BFFCBD7A5FFE0E7C9FFF9FAF4FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object nrazao: TfrxMemoView
          AllowVectorExport = True
          Left = 222.992270000000000000
          Width = 495.118002830000000000
          Height = 34.015770000000000000
          DataSetName = 'db_pessoas'
          Font.Charset = ANSI_CHARSET
          Font.Color = 11498759
          Font.Height = -21
          Font.Name = 'Yu Gothic UI Semibold'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            'Nome da Razao | CNPJ')
          ParentFont = False
          WordBreak = True
          WordWrap = False
        end
        object ncontatos: TfrxMemoView
          AllowVectorExport = True
          Left = 222.992270000000000000
          Top = 37.795300000000000000
          Width = 495.118002830000000000
          Height = 34.015770000000000000
          DataSetName = 'db_pessoas'
          Font.Charset = ANSI_CHARSET
          Font.Color = 15440906
          Font.Height = -19
          Font.Name = 'Yu Gothic UI Semibold'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            'Email | Telefone')
          ParentFont = False
          WordBreak = True
          WordWrap = False
          Formats = <
            item
            end
            item
            end>
        end
        object nendereco: TfrxMemoView
          AllowVectorExport = True
          Left = 222.992270000000000000
          Top = 75.590600000000000000
          Width = 495.118002830000000000
          Height = 56.692950000000000000
          DataSetName = 'db_pessoas'
          Font.Charset = ANSI_CHARSET
          Font.Color = 15440906
          Font.Height = -19
          Font.Name = 'Yu Gothic UI Semibold'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            'Endere'#231'o')
          ParentFont = False
          WordBreak = True
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end>
        end
      end
      object PageFooter: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 219.212740000000000000
        Width = 755.906000000000000000
        object Line2: TfrxLineView
          AllowVectorExport = True
          Top = 0.220470000000000000
          Width = 755.905536220000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 2.779530000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[DATE] [TIME]')
        end
        object lb_email: TfrxMemoView
          AllowVectorExport = True
          Left = 593.386210000000000000
          Top = 2.779530000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'EasyOne Systems - Contrato ompra')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDadosEntrada: TfrxDBDataset
    UserName = 'frxDBDadosEntrada'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id_compra=id_compra'
      'ncontrato=ncontrato'
      'data=data'
      'hora=hora'
      'tipo=tipo'
      'obs=obs'
      'vlrTroca=vlrTroca'
      'vlrsubtotal=vlrsubtotal'
      'vlrtotal=vlrtotal'
      'vlrdesconto=vlrdesconto'
      'pessoacodigo=pessoacodigo'
      'pessoanome=pessoanome'
      'pessoaapelido=pessoaapelido'
      'pessoacep=pessoacep'
      'pessoaendereco=pessoaendereco'
      'pessoanumero=pessoanumero'
      'pessoabairro=pessoabairro'
      'pessoacomp=pessoacomp'
      'pessoatelefone=pessoatelefone'
      'pessoacelular=pessoacelular'
      'pessoawhatsapp=pessoawhatsapp'
      'pessoacpf=pessoacpf'
      'pessoarg=pessoarg'
      'pessoaorgao=pessoaorgao'
      'pessoasexo=pessoasexo'
      'pessoacivil=pessoacivil'
      'pessoanascimento=pessoanascimento'
      'pessoaemail=pessoaemail'
      'pessoanacionalidade=pessoanacionalidade'
      'pessoacidade=pessoacidade')
    DataSet = Tab_RelEntrada
    BCDToCurrency = False
    DataSetOptions = []
    Left = 22
    Top = 295
  end
  object frxDBDadosVeiculo: TfrxDBDataset
    UserName = 'frxDBDadosVeiculo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'qtde=qtde'
      'vlrunitario=vlrunitario'
      'vlrdescontoperc=vlrdescontoperc'
      'vlrdesconto=vlrdesconto'
      'complemento=complemento'
      'vlrsubtotal=vlrsubtotal'
      'vlrtotal=vlrtotal'
      'troca=troca'
      'veiccodigo=veiccodigo'
      'veicdescricao=veicdescricao'
      'veicfiscal=veicfiscal'
      'veiculo_origem=veiculo_origem'
      'veiculo_ano=veiculo_ano'
      'veiculo_ano_modelo=veiculo_ano_modelo'
      'veiculo_combustivel=veiculo_combustivel'
      'veiculo_cambio=veiculo_cambio'
      'veiculo_cor=veiculo_cor'
      'veiculo_porta=veiculo_porta'
      'veiculo_km=veiculo_km'
      'veiculo_placa=veiculo_placa'
      'veiculo_uf=veiculo_uf'
      'veiculo_renavan=veiculo_renavan'
      'veiculo_chassi=veiculo_chassi'
      'veiculo_crv=veiculo_crv'
      'veiculo_tipo_crv=veiculo_tipo_crv'
      'marca=marca'
      'grupo=grupo'
      'veiculoespecie=veiculoespecie'
      'veiculomodelo=veiculomodelo')
    DataSet = Tab_RelEntradaVeiculos
    BCDToCurrency = False
    DataSetOptions = []
    Left = 22
    Top = 351
  end
end
