object FrmEntradaVeiculoPagamento: TFrmEntradaVeiculoPagamento
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Entrada Ve'#237'culo Pagamento'
  ClientHeight = 440
  ClientWidth = 577
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 17
  object Paneltitulo: TPanel
    Left = 0
    Top = 0
    Width = 577
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    Color = 16744448
    ParentBackground = False
    TabOrder = 0
    object lblTitulo: TLabel
      AlignWithMargins = True
      Left = 15
      Top = 0
      Width = 562
      Height = 50
      Margins.Left = 15
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      AutoSize = False
      Caption = 'Inclus'#227'o de Pagamento - Contas a Pagar'
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
    Align = alClient
    PanelStyle.Active = True
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlack
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 1
    Height = 390
    Width = 577
    object Label10: TLabel
      Left = 10
      Top = 343
      Width = 189
      Height = 17
      Caption = 'F2 - Cadastro Tipo Documento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Panelcancelar: TPanel
      AlignWithMargins = True
      Left = 459
      Top = 339
      Width = 110
      Height = 40
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      BevelOuter = bvNone
      Color = 14869218
      ParentBackground = False
      TabOrder = 1
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
        ExplicitTop = 380
      end
    end
    object PanelIncluir: TPanel
      AlignWithMargins = True
      Left = 331
      Top = 339
      Width = 110
      Height = 40
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      BevelOuter = bvNone
      Color = 16475988
      ParentBackground = False
      TabOrder = 0
      object btnIncluir: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 40
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Salvar | F5'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = btnIncluirClick
        ExplicitTop = -8
      end
    end
    object cxGrid: TcxGrid
      Left = 2
      Top = 113
      Width = 573
      Height = 220
      Align = alTop
      TabOrder = 2
      object cxGridDB: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = dsPrazo
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            FieldName = 'idcompra'
            Column = cxGridDBData
          end
          item
            Kind = skSum
            FieldName = 'valor'
            Column = cxgriVlrParcela
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
        object cxGridDBData: TcxGridDBColumn
          Caption = 'Data'
          DataBinding.FieldName = 'datapagamento'
          Width = 71
        end
        object cxGridDBNumero: TcxGridDBColumn
          Caption = 'N'#250'mero Doc'
          DataBinding.FieldName = 'numero_doc'
          Width = 89
        end
        object cxGridDocumento: TcxGridDBColumn
          Caption = 'Documento'
          DataBinding.FieldName = 'prazo'
          Width = 224
        end
        object cxgridVencimento: TcxGridDBColumn
          Caption = 'Vencimento'
          DataBinding.FieldName = 'data_vencimento'
          Width = 90
        end
        object cxgriVlrParcela: TcxGridDBColumn
          Caption = 'Valor'
          DataBinding.FieldName = 'valor'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Width = 97
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDB
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 2
      Top = 2
      Align = alTop
      PanelStyle.Active = True
      TabOrder = 3
      Height = 111
      Width = 573
      object Label1: TLabel
        Left = 104
        Top = 4
        Width = 50
        Height = 17
        Caption = 'SubTotal'
      end
      object Label2: TLabel
        Left = 322
        Top = 4
        Width = 28
        Height = 17
        Caption = 'Total'
      end
      object Label3: TLabel
        Left = 428
        Top = 4
        Width = 67
        Height = 17
        Caption = 'Documento'
      end
      object Label4: TLabel
        Left = 8
        Top = 54
        Width = 48
        Height = 17
        Caption = 'Parcelas'
      end
      object Label5: TLabel
        Left = 184
        Top = 54
        Width = 70
        Height = 17
        Caption = 'Observa'#231#227'o'
      end
      object Label6: TLabel
        Left = 8
        Top = 4
        Width = 27
        Height = 17
        Caption = 'Data'
      end
      object Label7: TLabel
        Left = 210
        Top = 4
        Width = 102
        Height = 17
        Caption = 'Entrada(Dinheiro)'
      end
      object Label8: TLabel
        Left = 104
        Top = 54
        Width = 50
        Height = 17
        Caption = 'Intervalo'
      end
      object btnInserirDados: TcxButton
        Left = 397
        Top = 73
        Width = 82
        Height = 25
        Cursor = crHandPoint
        Caption = 'Gerar'
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001B744558745469746C65004164643B506C75733B426172733B526962
          626F6E3B9506332F0000036349444154785E35927D6C535518C69F73EE6DEB64
          63A3AEFB60A3A36E33B8C56581E0D8707E21CC1A43A2A22304FE3001512A86C4
          E900132451FF503367420043B244364C483031465C248B4441C0980C45B4D065
          CDBA4ECAE82AAC5DBBDE8FF3E1BD27F1397973DE9C3CBFF7233964226FC2D543
          A53E0280443E3FD752525AB14323FA06685A3381E492F329C6ADF39954E2F8C9
          C3DBA6018858DE940A9C2C5870C1D51BB6FAF61DBB327860F81A1BFE25297FB8
          3127C7EFE4E5D5745E9EBB9991239766E481937FE4DE1818DB0DC0EB322EABBA
          B63FD5EB7D6CCBBE6F1B83FE9E67BA82E084C0E4123697CAE0D109BC94805B0C
          E7AFCC606A66EEECF75FBCBB753AFAEB2201A0BD3E7861B02914D8DBF34408A9
          AC0D2181D3672E23319D81AB950D016CEBED824E809A722FC62E4CE17A343130
          D4DF73507FB9FFAB551E9F6FCF93EB82B879BB088D52504A14FCC9CE4E95F79D
          B80CD396284A8179C7D3DD1144F29FEC5BE1D73E1BA6BEB2C09BEDCD955A7CCE
          44D1744C1687C9045C05EBFC686F0DAADCB08413D2098E89B4E1BC5779965687
          5ED585D03ACBFDA548E7197EFA711C776EDFC5FF12200A7075F4E85975D7D4FA
          F1F4A635A82C5F02A2956CD46D2EEB1D160B455BC19FEE5E0F4A885A45828071
          81137D1B61DB0C1E5D43E4C8CF5858E4D0A1810BBA5CB76DEEBDB768C1E604AE
          EA6B1F40D9121F0A265385BC0E5457530109404A8010E27805EEE60598CDA15B
          8699C8E7CD4784EEC3F2BA00767C340A4AA9327E79300CE1505BDEFF0E9AA681
          5082150DD5604CA26858282E1693D428E42F6666B3909068EF68C5E6171FC7E6
          17BA611A260C93A9029C713CF7FC3A3C1BEE404B5B2398E0989FCBA190FD774C
          CFA46243B11B4B77ADADF67BB236478E10500AA5D2121D5C48354D3A674108A1
          56114C201E4BB1D9F86FA70880FB1EDD3E34B0A229B4E7E1350FC2E22E2011BF
          16C3FCBD050557562DC3CA964608B8B4C4E49F4924A27F1F193F1DD9AF03B0FE
          1AFDE03D113EDC6431B1A96575089212B4AD6D555F581280D902398343308EC9
          EB49DC9A981A75E043000CA46D09005A49457059DB4BC78E77EDFCDAEAFDF892
          DC3B1295EF7C13977D4E444E45E52BCE5BE7AE338555E10FDF0650EE32B30E4B
          D24C0212A8F210EAAED3D01969BB3FD0BCDDE32BEB06D56AD5D09CCDDA66EE62
          EED6EF43A9AB2331008603ABCEFF019D3AAD15CCD8D2E00000000049454E44AE
          426082}
        TabOrder = 8
        OnClick = btnInserirDadosClick
      end
      object btnExcluir: TcxButton
        Left = 485
        Top = 73
        Width = 82
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
        TabOrder = 9
        OnClick = btnExcluirClick
      end
      object edtsubtotal: TcxCurrencyEdit
        Left = 104
        Top = 23
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
        TabOrder = 1
        Width = 100
      end
      object EdtTotal: TcxCurrencyEdit
        Left = 322
        Top = 23
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
        TabOrder = 3
        Width = 100
      end
      object edtpagamento: TcxLookupComboBox
        Left = 428
        Top = 23
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ImmediatePost = True
        Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
        Properties.KeyFieldNames = 'id_documento'
        Properties.ListColumns = <
          item
            Caption = 'Documento'
            FieldName = 'ncompleto'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dsDoc
        EditValue = 0
        TabOrder = 4
        Width = 139
      end
      object edtqtde: TcxCurrencyEdit
        Left = 8
        Top = 73
        EditValue = 1.000000000000000000
        ParentFont = False
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.ClearKey = 16452
        Properties.MinValue = 1.000000000000000000
        Properties.ReadOnly = False
        Properties.UseDisplayFormatWhenEditing = True
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = [fsBold]
        Style.TextStyle = []
        Style.IsFontAssigned = True
        TabOrder = 5
        Width = 90
      end
      object edtObs: TcxBlobEdit
        Left = 184
        Top = 73
        Properties.BlobEditKind = bekMemo
        Properties.ClearKey = 16452
        Properties.PopupHeight = 180
        Properties.PopupWidth = 207
        TabOrder = 7
        Width = 207
      end
      object edtData: TcxDateEdit
        Left = 8
        Top = 23
        EditValue = 0d
        Properties.ClearKey = 16452
        Properties.DateButtons = []
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 0
        Width = 90
      end
      object edtCadPrazo: TcxButtonEdit
        Left = 540
        Top = 23
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
        Style.BorderStyle = ebsFlat
        Style.HotTrack = True
        Style.Shadow = False
        Style.TransparentBorder = True
        Style.ButtonStyle = btsDefault
        TabOrder = 10
        Visible = False
        Width = 27
      end
      object edtentrada: TcxCurrencyEdit
        Left = 210
        Top = 23
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.ClearKey = 16452
        Properties.DisplayFormat = 'R$ #,##0.00'
        Properties.EditFormat = 'R$ #,##0.00'
        Properties.ReadOnly = False
        Properties.UseDisplayFormatWhenEditing = True
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 2
        OnExit = edtentradaExit
        Width = 106
      end
      object edtIntervalo: TcxSpinEdit
        Left = 104
        Top = 73
        Properties.MinValue = 1.000000000000000000
        TabOrder = 6
        Value = 1
        Width = 74
      end
    end
  end
  object ACBrEnter: TACBrEnterTab
    EnterAsTab = True
    Left = 536
  end
  object dsDoc: TUniDataSource
    DataSet = TabDocumento
    Left = 37
    Top = 264
  end
  object dsPrazo: TUniDataSource
    DataSet = TabPagamento
    Left = 152
    Top = 314
  end
  object TabPagamento: TClientDataSet
    PersistDataPacket.Data = {
      540100009619E0BD01000000180000000C000000000003000000540108696463
      6F6D70726104000100000000000869645F7072617A6F04000100000000000570
      72617A6F0100490000000100055749445448020002003C000576616C6F720800
      04000000010007535542545950450200490006004D6F6E6579000D6461746170
      6167616D656E746F04000600000000000970617263656C61646F010049000000
      01000557494454480200020004000E6E756D65726F70617263656C6173040001
      00000000000F676572617266696E616E636569726F0100490000000100055749
      445448020002000100036F6273020049000000010005574944544802000200F4
      010973746174757366696E01004900000001000557494454480200020001000F
      646174615F76656E63696D656E746F04000600000000000A6E756D65726F5F64
      6F6301004900000001000557494454480200020014000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'idcompra'
        DataType = ftInteger
      end
      item
        Name = 'id_prazo'
        DataType = ftInteger
      end
      item
        Name = 'prazo'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'valor'
        DataType = ftCurrency
      end
      item
        Name = 'datapagamento'
        DataType = ftDate
      end
      item
        Name = 'parcelado'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'numeroparcelas'
        DataType = ftInteger
      end
      item
        Name = 'gerarfinanceiro'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'obs'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'statusfin'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'data_vencimento'
        DataType = ftDate
      end
      item
        Name = 'numero_doc'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 160
    Top = 266
    object TabPagamentoidcompra: TIntegerField
      FieldName = 'idcompra'
    end
    object TabPagamentoid_prazo: TIntegerField
      FieldName = 'id_prazo'
    end
    object TabPagamentoprazo: TStringField
      FieldName = 'prazo'
      Size = 60
    end
    object TabPagamentovalor: TCurrencyField
      FieldName = 'valor'
    end
    object TabPagamentodatapagamento: TDateField
      FieldName = 'datapagamento'
    end
    object TabPagamentoparcelado: TStringField
      FieldName = 'parcelado'
      Size = 4
    end
    object TabPagamentonumeroparcelas: TIntegerField
      FieldName = 'numeroparcelas'
    end
    object TabPagamentogerarfinanceiro: TStringField
      FieldName = 'gerarfinanceiro'
      Size = 1
    end
    object TabPagamentoobs: TStringField
      FieldName = 'obs'
      Size = 500
    end
    object TabPagamentostatusfin: TStringField
      FieldName = 'statusfin'
      Size = 1
    end
    object TabPagamentodata_vencimento: TDateField
      FieldName = 'data_vencimento'
    end
    object TabPagamentonumero_doc: TStringField
      FieldName = 'numero_doc'
    end
  end
  object TabDocumento: TClientDataSet
    PersistDataPacket.Data = {
      7A0000009619E0BD0100000018000000040000000000030000007A000C69645F
      646F63756D656E746F040001000000000006636F6469676F0400010000000000
      0964657363726963616F0100490000000100055749445448020002003200096E
      636F6D706C65746F01004900000001000557494454480200020032000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 210
    object TabDocumentoid_documento: TIntegerField
      FieldName = 'id_documento'
    end
    object TabDocumentocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabDocumentodescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
    object TabDocumentoncompleto: TStringField
      FieldName = 'ncompleto'
      Size = 50
    end
  end
end
