object FrmBaixaReceber: TFrmBaixaReceber
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 575
  ClientWidth = 900
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 17
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 779
    Top = 522
    Width = 110
    Height = 40
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 15
    Margins.Bottom = 20
    BevelOuter = bvNone
    Color = 14869218
    ParentBackground = False
    TabOrder = 0
    object btnCancelar: TSpeedButton
      Left = 0
      Top = 0
      Width = 110
      Height = 40
      Cursor = crHandPoint
      Align = alClient
      Caption = 'Cancelar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5585461
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnCancelarClick
      ExplicitLeft = 80
      ExplicitTop = 16
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 657
    Top = 522
    Width = 110
    Height = 40
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 15
    Margins.Bottom = 20
    BevelOuter = bvNone
    Color = 16475988
    ParentBackground = False
    TabOrder = 1
    object btnSalvar: TSpeedButton
      Left = 0
      Top = 0
      Width = 110
      Height = 40
      Cursor = crHandPoint
      Align = alClient
      Caption = 'Baixar | F5'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnSalvarClick
      ExplicitLeft = 6
    end
  end
  object Paneltitulo: TPanel
    Left = 0
    Top = 0
    Width = 900
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    Color = 16744448
    ParentBackground = False
    TabOrder = 2
    object lblTitulo: TLabel
      AlignWithMargins = True
      Left = 15
      Top = 0
      Width = 885
      Height = 50
      Margins.Left = 15
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      AutoSize = False
      Caption = 'Baixa - Contas a Receber'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 0
      ExplicitWidth = 697
      ExplicitHeight = 35
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 50
    Align = alTop
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 3
    Height = 466
    Width = 900
    object cxGridTitulos: TcxGrid
      Left = 2
      Top = 2
      Width = 896
      Height = 200
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object cxGridDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = DsTitulo
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'R$ #,##0.00'
            Kind = skSum
            FieldName = 'valor'
            DisplayText = 'R$ #,##0.00'
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o>'
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        Styles.StyleSheet = FrmPrincipal.CxGridPedido
        object cxGridDBTableView1id_receber: TcxGridDBColumn
          DataBinding.FieldName = 'id_receber'
          Visible = False
          Width = 73
        end
        object cxGridDBTableView1data_lancamento: TcxGridDBColumn
          Caption = 'Dt. Lan'
          DataBinding.FieldName = 'data_lancamento'
          Width = 75
        end
        object cxGridDBTableView1data_vencimento: TcxGridDBColumn
          Caption = 'Dt. Venc'
          DataBinding.FieldName = 'data_vencimento'
          Width = 76
        end
        object cxGridDBTableView1nmdocumento: TcxGridDBColumn
          Caption = 'Documento'
          DataBinding.FieldName = 'nmdocumento'
          Width = 87
        end
        object cxGridDBTableView1numero_titulo: TcxGridDBColumn
          Caption = 'N'#250'mero'
          DataBinding.FieldName = 'numero_titulo'
          Width = 68
        end
        object cxGridDBTableView1nmpessoa: TcxGridDBColumn
          Caption = 'Pessoa'
          DataBinding.FieldName = 'nmpessoa'
          Width = 192
        end
        object cxGridDBTableView1historico: TcxGridDBColumn
          Caption = 'Hist'#243'rico'
          DataBinding.FieldName = 'historico'
          Visible = False
          Width = 97
        end
        object cxGridDBTableView1atraso: TcxGridDBColumn
          Caption = 'Atraso'
          DataBinding.FieldName = 'atraso'
          Width = 53
        end
        object cxGridDBTableView1valor_original: TcxGridDBColumn
          Caption = 'Vlr. T'#237'tulo'
          DataBinding.FieldName = 'valor_original'
          Width = 75
        end
        object cxGridDBTableView1id_pessoa: TcxGridDBColumn
          DataBinding.FieldName = 'id_pessoa'
          Visible = False
          Width = 31
        end
        object cxGridDBTableView1vlrjuros: TcxGridDBColumn
          Caption = 'Juros'
          DataBinding.FieldName = 'vlrjuros'
          Width = 50
        end
        object cxGridDBTableView1vlrmulta: TcxGridDBColumn
          Caption = 'Multa'
          DataBinding.FieldName = 'vlrmulta'
          Width = 48
        end
        object cxGridDBTableView1Parcial: TcxGridDBColumn
          Caption = 'Vlr. Parcial'
          Width = 79
        end
        object cxGridDBTableView1totalrecebido: TcxGridDBColumn
          Caption = 'Recebido'
          Width = 79
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 2
      Top = 202
      Align = alTop
      TabOrder = 1
      Height = 50
      Width = 896
      object cxbuttonIncluir: TcxButton
        Left = 8
        Top = 16
        Width = 90
        Height = 25
        Cursor = crHandPoint
        Caption = 'Editar'
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000013744558745469746C65005461626C653B466F726D6174
          3BEEACCAE3000002B349444154785E85926F48956718C67FCFFBE784D88C73F4
          38CE6665C64116B83F6D945F1483881284091BA34F456BEB43CC0FD22008FCB0
          8D82DA87C6289B6EB2898233C336D8C436B5E9B4DA87ADD188A58343E599A566
          9D3F74F49CF77DEE69EFCB8164633FB8B878E0E6BAEE1B1E059880C17FA3C883
          F872651900EBDDD323C3CA306B119027124F5A10BC7745C001D18880E3E6463F
          38D2B013C801585AABDA37EBABF0C6E1D6D43C95D112BF58B83939C7C1BA4DF9
          3D4E9EB9540B98F9805CD64510E6D2391021762F492852849FC7ED99248EE322
          286CCBA0BC2C08602AA54C40D4DE0F07E5D5AA8DDCB99F4294E09DE23B1E2FAF
          D3084255E5733C7898A4B8FB78FBDA80FDC68DC189435636EBB0E58552C2EBD7
          8128AE5E8B515D5D8E1285208C5F89D158FF0AB669A0D0FC76EA2BC2E1E03B25
          353BB8F5FD4FADC6CA0988207E9DE37AD55E276857639906AE9BE37AEB092289
          694AEB7632D6F60503F1E96F557DF305D9BE2DFAE4D63C7881026CAD08B13562
          91BAD446E9749CE89ED719FDBC839E81E1DE1F5CE76D0EBDDF258F924B32B790
          91D9659DF9726CC597B5280B894519BDFAA7F4B475C8D8C72725D1D329FDBB76
          48A3615E0C4111601839C7F556C5438BA00C85650AB9A50CB15F4678E6F92815
          079A681FF895F61F2F5F18D1EEBE0548EF016D6532E9B1A663DD35080842D1DA
          0206872CF4EC4D8CEB9DD80B9354BD35C9479F8ED277C5EC4F611F5C249B1211
          5DA714008540100801C5C0B3FB5F2A6C38BF7FF3E3A9EFDE9389967239B73B24
          25154D5D66201C040CFFB7F21A8088E40598B51BD66CF8AC21FC777CE2A824A6
          BAE46C4D8134BF1898F5C38D55F3583C8DBD7BA3FD4974DB9648E26E9ABE96C3
          CC241DE2297D02488B886615AB03F4EFD399BEBF3AC76D839FCB965CFE985F92
          DE81B81E02B24A29FE2F20F775CC3D0F7C0318800B647D17FE857F00273C6EB6
          B34173A40000000049454E44AE426082}
        OptionsImage.Spacing = 3
        TabOrder = 0
      end
      object cxButtonLimpar: TcxButton
        Left = 104
        Top = 16
        Width = 90
        Height = 25
        Cursor = crHandPoint
        Caption = 'Excluir'
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000025744558745469746C6500477269643B53707265616473
          686565743B526F773B44656C657465526F773B4EBB582B0000027D4944415478
          5E7D935B4854611485D73FE7CCE4152C7AB126A1322A8D4AC6A2640C32CA7AA8
          DEA2B408C1C8A217A10729821E92D004B54C2AB2A80421430AA1D4D4A834B3B4
          C62904BB984985383A7919EDCC9CCBEE3FBF33A4A87DB0D87B7160B358FC8701
          90B92C5C0CF313FA465C0697461C70E48AFBAE66D96A4B05F7842073ED04989B
          AAFA5B723236A50150615276E7354DA7B6B967A66F9AE94B6EBD2200E1DCC094
          CC2550FCBAC8E619F66152D144020AFAF13F9A4862952C300C98581084E5DD73
          891B5317C59CBD1B0463DA2C3FB9358A8826440703032338B0773D4234B57C45
          9A730540FFFC8ED4950851F9A0737AA990754D8766103C3E55C434F8FEF37700
          31E132ECD13252131623C6C630E0D344EEDDC976540136C69804C06019179E12
          85DA161B13735F4A1CA27A3F60E99B7A78E293E0756C17A962DA1BB0A8ABD53B
          E8F3E5ECAFAFAB417ED90B32191E53686854A1AB77DBC833A290777482DA3333
          29D0DE48FD2585D455564EAEE252EA2BBA48FE963A7AB66BCF10009BACE9064C
          AC922412444785C12A5B2031C0BF3A01EEC24BD890EE84A7AB4794B8649D1D9D
          058578EBEEB9018058EEF987CF655BD8B6D0438161982B96C72D445C6C24062B
          AF2371A81B493BB78074C2BB869778DCF1E572BE77300F80C200447059673F65
          E1C36E263A0A5292E38F2C8B54C174C2F731096D1D9FAE657F769F06302962CF
          258EEDF6AA8D57DCC7B268E2DC09AA4E4EA06AC75A1A3F9B4DEF0F1FA272FB9A
          62D101E6475A10D08FC646106A1E35A2EAE3B75233D1A4A21C4F776E46B8AA67
          0138F3BF035A9F6FFC546D556B51B5A7B7E209E9F90098DEDDAF047ED1C11F7A
          201780C644DC39601C0072B01F3DF4F705BDC4A571A97F0101EC933AFEF847C5
          0000000049454E44AE426082}
        OptionsImage.Spacing = 3
        TabOrder = 1
      end
      object edtvalortotal: TcxCurrencyEdit
        Left = 790
        Top = 16
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.AssignedValues.EditFormat = True
        Properties.ClearKey = 16452
        Properties.DisplayFormat = 'R$ #,##0.00'
        Properties.ReadOnly = False
        Properties.UseDisplayFormatWhenEditing = True
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = [fsBold]
        Style.TextStyle = []
        Style.IsFontAssigned = True
        TabOrder = 2
        Width = 98
      end
      object cxCurrencyEdit1: TcxCurrencyEdit
        Left = 583
        Top = 16
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.AssignedValues.EditFormat = True
        Properties.ClearKey = 16452
        Properties.DisplayFormat = 'R$ #,##0.00'
        Properties.ReadOnly = False
        Properties.UseDisplayFormatWhenEditing = True
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = [fsBold]
        Style.TextStyle = []
        Style.IsFontAssigned = True
        TabOrder = 3
        Width = 98
      end
      object cxCurrencyEdit2: TcxCurrencyEdit
        Left = 687
        Top = 16
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.AssignedValues.EditFormat = True
        Properties.ClearKey = 16452
        Properties.DisplayFormat = 'R$ #,##0.00'
        Properties.ReadOnly = False
        Properties.UseDisplayFormatWhenEditing = True
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = [fsBold]
        Style.TextStyle = []
        Style.IsFontAssigned = True
        TabOrder = 4
        Width = 98
      end
    end
    object cxGroupBox3: TcxGroupBox
      Left = 2
      Top = 252
      Align = alTop
      Caption = 'Recebimento'
      TabOrder = 2
      Height = 69
      Width = 896
      object EdtEstado: TcxComboBox
        Left = 8
        Top = 32
        Properties.ClearKey = 16452
        Properties.DropDownListStyle = lsEditFixedList
        Properties.ImmediatePost = True
        Properties.Items.Strings = (
          'Novo'
          'Seminovo'
          'Excelente'
          'Muito Bom'
          'Bom'
          'Regular'
          'Com Marcas de Uso'
          'Desgastado'
          'Com Defeitos Visuais'
          'Com Defeitos Funcionais'
          'Danificado'
          'Quebrado / Inutiliz'#225'vel'
          'Em Reforma'
          'Sucata / Para descarte')
        TabOrder = 0
        Text = 'Regular'
        Width = 233
      end
      object edtDataemissao: TcxDateEdit
        Left = 798
        Top = 32
        EditValue = 0d
        Properties.ClearKey = 16452
        Properties.DateButtons = []
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 1
        Width = 90
      end
      object cxButton1: TcxButton
        Left = 247
        Top = 32
        Width = 90
        Height = 25
        Cursor = crHandPoint
        Caption = 'Incluir'
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
        TabOrder = 2
      end
      object cxButton2: TcxButton
        Left = 343
        Top = 32
        Width = 90
        Height = 25
        Cursor = crHandPoint
        Caption = 'Excluir'
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
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
        OptionsImage.Spacing = 3
        TabOrder = 3
      end
    end
    object cxGrid1: TcxGrid
      Left = 2
      Top = 321
      Width = 896
      Height = 143
      Align = alClient
      TabOrder = 3
      object cxGridDBTableView2: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'R$ #,##0.00'
            Kind = skSum
            FieldName = 'valor'
            Column = cxGridDBColumn3
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
        OptionsView.GroupByBox = False
        Styles.StyleSheet = FrmPrincipal.CxGridPedido
        object cxGridDBColumn1: TcxGridDBColumn
          Caption = 'Plano'
          DataBinding.FieldName = 'plano'
          Width = 316
        end
        object cxGridDBColumn2: TcxGridDBColumn
          Caption = 'Custo'
          DataBinding.FieldName = 'custo'
          Width = 185
        end
        object cxGridDBColumn3: TcxGridDBColumn
          Caption = 'Valor'
          DataBinding.FieldName = 'valor'
          Width = 111
        end
      end
      object cxGridLevel2: TcxGridLevel
        GridView = cxGridDBTableView2
      end
    end
  end
  object ACBrEnterTab1: TACBrEnterTab
    EnterAsTab = True
    Left = 864
    Top = 2
  end
  object TabTitulos: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 352
    Top = 146
    object TabTitulosid_receber: TIntegerField
      FieldName = 'id_receber'
    end
    object TabTitulosdata_lancamento: TDateField
      FieldName = 'data_lancamento'
    end
    object TabTitulosdata_vencimento: TDateField
      FieldName = 'data_vencimento'
    end
    object TabTitulosnumero_titulo: TStringField
      FieldName = 'numero_titulo'
      Size = 100
    end
    object TabTitulosnumparcela: TStringField
      FieldName = 'numparcela'
      Size = 100
    end
    object TabTitulosvalor_original: TCurrencyField
      FieldName = 'valor_original'
    end
    object TabTituloshistorico: TStringField
      FieldName = 'historico'
      Size = 500
    end
    object TabTitulosnmpessoa: TStringField
      FieldName = 'nmpessoa'
      Size = 150
    end
    object TabTitulosid_pessoa: TIntegerField
      FieldName = 'id_pessoa'
    end
    object TabTitulosnmdocumento: TStringField
      FieldName = 'nmdocumento'
      Size = 60
    end
    object TabTitulosatraso: TIntegerField
      FieldName = 'atraso'
    end
    object TabTitulosvlrjuros: TCurrencyField
      FieldName = 'vlrjuros'
    end
    object TabTitulosvlrmulta: TCurrencyField
      FieldName = 'vlrmulta'
    end
  end
  object DsTitulo: TUniDataSource
    DataSet = TabTitulos
    Left = 408
    Top = 146
  end
end
