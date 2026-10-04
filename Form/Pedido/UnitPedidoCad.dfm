inherited FrmPedidoCad: TFrmPedidoCad
  Caption = 'Pedido'
  ClientHeight = 707
  ClientWidth = 965
  Color = clWhite
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 965
  ExplicitHeight = 707
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 679
    Width = 959
    ExplicitTop = 679
    ExplicitWidth = 959
    object Label7: TLabel
      Left = 5
      Top = 5
      Width = 837
      Height = 15
      Caption = 
        'F2 - Pesquisa   |   F3 - Acessar itens lan'#231'ados   |   F4 - Acess' +
        'ar pesquisa de produto   |   F8 - Cadastro cliente   |   F6 - Ca' +
        'dastro Produto   |   Del - Excluir item'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited PanelClient: TPanel
    Width = 965
    Height = 636
    ExplicitWidth = 965
    ExplicitHeight = 636
    inherited dxBevel1: TdxBevel
      Width = 959
      Height = 161
      Align = alTop
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 1253
      ExplicitHeight = 161
    end
    object Label15: TLabel [1]
      Left = 8
      Top = 12
      Width = 61
      Height = 17
      Caption = 'N'#186' Pedido'
    end
    object Label17: TLabel [2]
      Left = 8
      Top = 43
      Width = 39
      Height = 17
      Caption = 'Cliente'
    end
    object Label18: TLabel [3]
      Left = 8
      Top = 74
      Width = 57
      Height = 17
      Caption = 'Vendedor'
    end
    object Label19: TLabel [4]
      Left = 8
      Top = 105
      Width = 66
      Height = 17
      Caption = 'Pagamento'
    end
    object Label20: TLabel [5]
      Left = 8
      Top = 136
      Width = 70
      Height = 17
      Caption = 'Observa'#231#227'o'
    end
    object dxBevel1Foto: TdxBevel [6]
      Left = 793
      Top = 9
      Width = 165
      Height = 149
    end
    object edtFoto: TImage [7]
      Left = 795
      Top = 10
      Width = 160
      Height = 145
      Center = True
      Picture.Data = {
        0D546478536D617274496D61676589504E470D0A1A0A0000000D494844520000
        0024000000240806000000E100989800000006624B474400FF00FF00FFA0BDA7
        93000002D8494441545809ED575D48145114FEEECCECBAFEECFA0B6B69B65281
        5606854150A24241F51085F82211F4B2A6AF11113DA4F4561045902468E04384
        112105810812F82888A8A14110D4E626522AE6A4B333B773379169676866FDA1
        84B9DC33F79CF39D73EE996FEE2C3BC0761EAF3E6975D8E2C1DCD6EF8B69A724
        B07E70BC912147CF96B2CFE6DCDBA36AB9A1482DC5AAFF667335D3CC583ABAE4
        36989A694FC6329CD1257DFCF5173D2AEC36CEA5F671EDBAA1C813E0EC5A3C90
        78DEDBCB65819D1BE2C1E830F709DDAD3037816BECA4041B1C83530B5C510D5E
        6386B8812723F3C60CC05BC9FFB4AF26F30AADAEE65F1BEABA845B213FEA335A
        470EB37055C8AEA2CE8198CA31BB4C8A2960FA27C7B46A243D47866F4CED9FB8
        1F17C6E20A062FF7A05DE87692A4D60EB87B1E17194343B0F264AD72FC6A865D
        8CF0490CC8F531642B0C8B09403428FC41B2C9C4125D66C2278A4A62FD914C35
        1E9953C16AF7411B98C498884B15DB3374AF11259CE1A10856EADBE066847C40
        6588A128833A5C4D28CD9490E767D0E500DED63DC372A0208950C4833B8D284E
        1A2917DB86123A3A282E2FEB5043BEB4EB18A9EEA64C3B956531ECCD91E027EA
        C84479B6842031F823A70C43353D74EE893AA0103A3AEDAA8A9C3FFC2F5B105D
        D1F058384B9A1E2DC9857BB2849EAED081C7EC0AC702894EC9E29C2DD3F3DCF9
        E1C5D7FC91EE30B9E0F7A1F942C79F8D2902304B45184D15C5AB9EF7ADEB6A66
        35DB7E911146F56F68328E26D23A49D6A6ED235B43FF816261C86D0F097AA3E3
        F3F456D16ACE91E91677E4026235FBDDEAEB6E68E01D3016B3DFA6AA14387DC0
        1E73F2D2FD3885D8E3853900FD4E5940E12BCAB6B85D3B2C0C057CF8EE26FB68
        0410820D0CBBBD2C0C450A30BA813DD24AB5DBCBD2505A15B720D86BC889548F
        218F2127069C70EF0C790C3931E0846F83332461CEE92E360D97F02DB596E5EF
        07147441C341FA86DF9D1ABCC9F647FAF2E8DEE49A5E398F81FF8F815F1918B7
        CAB2429D820000000049454E44AE426082}
      Proportional = True
      Transparent = True
    end
    object Label21: TLabel [8]
      Left = 190
      Top = 12
      Width = 27
      Height = 17
      Caption = 'Data'
    end
    object lbvalidade: TLabel [9]
      Left = 631
      Top = 12
      Width = 50
      Height = 17
      Caption = 'Val'#237'dade'
      Visible = False
    end
    object Label23: TLabel [10]
      Left = 329
      Top = 12
      Width = 29
      Height = 17
      Caption = 'Hora'
    end
    object Label11: TLabel [11]
      Left = 452
      Top = 12
      Width = 26
      Height = 17
      Caption = 'Tipo'
    end
    object Label12: TLabel [12]
      Left = 503
      Top = 136
      Width = 35
      Height = 17
      Caption = 'Status'
    end
    inherited BtnSalvar: TStyledBitBtn
      Left = 741
      Top = 598
      TabOrder = 12
      OnClick = BtnSalvarClick
      ExplicitLeft = 741
      ExplicitTop = 598
    end
    inherited BtnCancelar: TStyledBitBtn
      Left = 852
      Top = 598
      TabOrder = 13
      OnClick = BtnCancelarClick
      ExplicitLeft = 852
      ExplicitTop = 598
    end
    object cxcodigo: TcxTextEdit
      Left = 84
      Top = 9
      Properties.ClearKey = 16452
      Properties.ReadOnly = True
      TabOrder = 0
      Width = 100
    end
    object cxPessoa: TcxLookupComboBox
      Left = 84
      Top = 40
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.KeyFieldNames = 'id_socio'
      Properties.ListColumns = <
        item
          Caption = 'Cliente'
          Width = 679
          FieldName = 'cliente'
        end>
      Properties.ListSource = dsCliente
      EditValue = 0
      TabOrder = 5
      Width = 679
    end
    object cxVendedor: TcxLookupComboBox
      Left = 84
      Top = 71
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.KeyFieldNames = 'id_funcionario'
      Properties.ListColumns = <
        item
          Caption = 'Vendedor'
          FieldName = 'func'
        end>
      Properties.ListSource = dsVendedor
      EditValue = 0
      TabOrder = 6
      Width = 679
    end
    object cxPagamento: TcxLookupComboBox
      Left = 84
      Top = 102
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.KeyFieldNames = 'id_prazo'
      Properties.ListColumns = <
        item
          FieldName = 'nprazopag'
        end>
      Properties.ListSource = dsPagamento
      EditValue = 0
      TabOrder = 7
      Width = 389
    end
    object cxLookupComboBox3: TcxLookupComboBox
      Left = 496
      Top = 102
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.KeyFieldNames = 'id_cidade'
      Properties.ListColumns = <
        item
          FieldName = 'ncidade'
        end>
      EditValue = 0
      TabOrder = 8
      Width = 267
    end
    object cxObs: TcxBlobEdit
      Left = 84
      Top = 133
      Properties.BlobEditKind = bekMemo
      Properties.MemoMaxLength = 250
      Properties.PopupHeight = 180
      Properties.PopupWidth = 413
      TabOrder = 9
      Width = 413
    end
    object edtCadPessoa: TcxButtonEdit
      Left = 760
      Top = 40
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
      TabOrder = 14
      Width = 27
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 760
      Top = 71
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
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.BorderStyle = ebsFlat
      Style.HotTrack = True
      Style.Shadow = False
      Style.TransparentBorder = True
      Style.ButtonStyle = btsDefault
      TabOrder = 15
      Width = 27
    end
    object cxButtonEdit2: TcxButtonEdit
      Left = 470
      Top = 102
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
      Properties.OnButtonClick = cxButtonEdit2PropertiesButtonClick
      Style.BorderStyle = ebsFlat
      Style.HotTrack = True
      Style.Shadow = False
      Style.TransparentBorder = True
      Style.ButtonStyle = btsDefault
      TabOrder = 16
      Width = 27
    end
    object cxData: TcxDateEdit
      AlignWithMargins = True
      Left = 223
      Top = 9
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
      TabOrder = 1
      Width = 100
    end
    object cxvalidade: TcxDateEdit
      AlignWithMargins = True
      Left = 687
      Top = 9
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
      TabOrder = 4
      Visible = False
      Width = 100
    end
    object cxHora: TcxTimeEdit
      Left = 364
      Top = 9
      Properties.ClearKey = 16452
      Properties.ImmediatePost = True
      Properties.TimeFormat = tfHourMin
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 2
      Width = 82
    end
    object cxButtonEdit3: TcxButtonEdit
      Left = 760
      Top = 102
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
      TabOrder = 17
      Width = 27
    end
    object PageControlgrid: TPageControl
      AlignWithMargins = True
      Left = 3
      Top = 167
      Width = 959
      Height = 290
      Margins.Top = 0
      Margins.Bottom = 0
      ActivePage = TabLista
      Align = alTop
      TabOrder = 18
      object TabCarrinho: TTabSheet
        Caption = 'TabCarrinho'
        TabVisible = False
        object cxGrid1: TcxGrid
          Left = 0
          Top = 0
          Width = 951
          Height = 280
          Align = alClient
          BorderStyle = cxcbsNone
          TabOrder = 0
          object cxGridDBTableView2: TcxGridDBTableView
            OnKeyDown = cxGridDBTableView2KeyDown
            Navigator.Buttons.CustomButtons = <>
            ScrollbarAnnotations.CustomAnnotations = <>
            OnCellDblClick = cxGridDBTableView2CellDblClick
            DataController.DataSource = ProdutoPedido
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                FieldName = 'id_produto'
                Column = cxgridcodigo
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.NoDataToDisplayInfoText = 'Pedido vazio'
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            Styles.StyleSheet = CxGridPedido
            object cxgriditem: TcxGridDBColumn
              Caption = 'Item'
              DataBinding.FieldName = 'seqitem'
              Width = 43
            end
            object cxgridcodigo: TcxGridDBColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'codigo'
              Width = 52
            end
            object cxGridbarra: TcxGridDBColumn
              Caption = 'C'#243'd. Barra'
              DataBinding.FieldName = 'cod_barras'
              Width = 97
            end
            object cxGridreferencia: TcxGridDBColumn
              Caption = 'Refer'#234'ncia'
              DataBinding.FieldName = 'referencia'
              Width = 94
            end
            object cxGriddescricao: TcxGridDBColumn
              Caption = 'Descri'#231#227'o'
              DataBinding.FieldName = 'proddescalterada'
              Width = 239
            end
            object cxGridunidade: TcxGridDBColumn
              Caption = 'Und'
              DataBinding.FieldName = 'uni'
              Width = 39
            end
            object cxGridmarca: TcxGridDBColumn
              Caption = 'Marca'
              DataBinding.FieldName = 'marca'
              Width = 113
            end
            object cxGridaltura: TcxGridDBColumn
              Caption = 'Altura'
              Visible = False
            end
            object cxGridlargura: TcxGridDBColumn
              Caption = 'Largura'
              Visible = False
            end
            object cxGridDBqtde: TcxGridDBColumn
              Caption = 'Qtde.'
              DataBinding.FieldName = 'qtde'
              Width = 43
            end
            object cxGridDBprcunitario: TcxGridDBColumn
              Caption = 'Prc. Unit'#225'rio'
              DataBinding.FieldName = 'prc_unitario'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 84
            end
            object cxGridm2: TcxGridDBColumn
              Caption = 'Metro m'#178
              Visible = False
            end
            object cxGriddesconto: TcxGridDBColumn
              Caption = 'Desc.'
              DataBinding.FieldName = 'desconto_reais'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 58
            end
            object cxGridtotal: TcxGridDBColumn
              Caption = 'Total'
              DataBinding.FieldName = 'prc_total'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 89
            end
          end
          object cxGridLevel2: TcxGridLevel
            GridView = cxGridDBTableView2
          end
        end
      end
      object TabLista: TTabSheet
        Caption = 'TabLista'
        ImageIndex = 1
        TabVisible = False
        object Panel3_: TPanel
          Left = 0
          Top = 220
          Width = 951
          Height = 60
          Align = alBottom
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object cxGroupBox11: TcxGroupBox
            Left = 0
            Top = 0
            Align = alClient
            Caption = 'Pesquisa Produto - //C'#243'digo, **Barra, --Referencia'
            PanelStyle.OfficeBackgroundKind = pobkStyleColor
            Style.BorderColor = clNone
            Style.BorderStyle = ebsNone
            Style.TextStyle = [fsBold]
            Style.TransparentBorder = False
            TabOrder = 0
            Transparent = True
            Height = 60
            Width = 951
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
              OnKeyPress = edtPesquisaKeyPress
              Height = 31
              Width = 951
            end
          end
        end
        object cxGrid: TcxGrid
          Left = 0
          Top = 0
          Width = 951
          Height = 220
          Align = alClient
          BorderStyle = cxcbsNone
          TabOrder = 1
          object cxGridDBTableView1: TcxGridDBTableView
            OnKeyDown = cxGridDBTableView1KeyDown
            Navigator.Buttons.CustomButtons = <>
            ScrollbarAnnotations.CustomAnnotations = <>
            OnCellDblClick = cxGridDBTableView1CellDblClick
            OnFocusedRecordChanged = cxGridDBTableView1FocusedRecordChanged
            DataController.DataSource = dsListaProduto
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skCount
                FieldName = 'id_produto'
                Column = coll1Codigo
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
            Styles.StyleSheet = CxGridPedido
            object idproduto: TcxGridDBColumn
              DataBinding.FieldName = 'id_produto'
              Visible = False
            end
            object coll1Codigo: TcxGridDBColumn
              Caption = 'C'#243'digo'
              DataBinding.FieldName = 'codigo'
              Width = 53
            end
            object coll3barra: TcxGridDBColumn
              Caption = 'C'#243'd. Barra'
              DataBinding.FieldName = 'cod_barras'
              Width = 89
            end
            object collreferencia: TcxGridDBColumn
              Caption = 'Refer'#234'ncia'
              DataBinding.FieldName = 'referencia'
              Width = 101
            end
            object colldescricao: TcxGridDBColumn
              Caption = 'Descri'#231#227'o'
              DataBinding.FieldName = 'descricao'
              Width = 256
            end
            object collmarca: TcxGridDBColumn
              Caption = 'Marca'
              DataBinding.FieldName = 'marca'
              Width = 135
            end
            object collgrupo: TcxGridDBColumn
              Caption = 'Grupo'
              DataBinding.FieldName = 'grupo'
              Width = 111
            end
            object collestoque: TcxGridDBColumn
              Caption = 'Estoque'
              DataBinding.FieldName = 'estoque_atual'
              Styles.Content = FrmPrincipal.cxColunaPedido
              Width = 61
            end
            object collunidade: TcxGridDBColumn
              Caption = 'Uni'
              DataBinding.FieldName = 'uni'
              Width = 38
            end
            object collprcvenda: TcxGridDBColumn
              Caption = 'Prc. Venda'
              DataBinding.FieldName = 'prc_venda'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Styles.Content = FrmPrincipal.cxColunaPedido
              Width = 116
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = cxGridDBTableView1
          end
        end
      end
    end
    object cxResumo: TcxGroupBox
      Left = 3
      Top = 460
      Caption = 'RESUMO'
      ParentBackground = False
      Style.TextStyle = []
      TabOrder = 19
      Height = 132
      Width = 310
      object Label1: TLabel
        Left = 10
        Top = 25
        Width = 27
        Height = 17
        Caption = 'Itens'
      end
      object Label2: TLabel
        Left = 10
        Top = 56
        Width = 28
        Height = 17
        Caption = 'Peso'
      end
      object Label3: TLabel
        Left = 10
        Top = 87
        Width = 49
        Height = 17
        Caption = 'Volumes'
      end
      object cxResumoItens: TcxCurrencyEdit
        Left = 151
        Top = 21
        Cursor = crIBeam
        EditValue = 0.000000000000000000
        Properties.ClearKey = 16452
        Properties.DecimalPlaces = 1
        Properties.DisplayFormat = '000'
        Properties.EditFormat = '000'
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 0
        Width = 149
      end
      object cxResumoPeso: TcxCurrencyEdit
        Left = 151
        Top = 52
        Cursor = crIBeam
        EditValue = 0.000000000000000000
        Properties.ClearKey = 16452
        Properties.DecimalPlaces = 3
        Properties.DisplayFormat = 'KG ,0.000;-KG ,0.000'
        Properties.EditFormat = '0.000'
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 1
        Width = 149
      end
      object cxResumoVolumes: TcxCurrencyEdit
        Left = 151
        Top = 83
        Cursor = crIBeam
        EditValue = 0.000000000000000000
        Properties.ClearKey = 16452
        Properties.DecimalPlaces = 1
        Properties.DisplayFormat = '000'
        Properties.EditFormat = '000'
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 2
        Width = 149
      end
    end
    object cxGroupBox1: TcxGroupBox
      Left = 328
      Top = 460
      Caption = 'AJUSTES DO PEDIDO'
      Style.TextStyle = [fsBold]
      TabOrder = 20
      Height = 132
      Width = 310
      object Label4: TLabel
        Left = 12
        Top = 25
        Width = 55
        Height = 17
        Caption = 'Desconto'
      end
      object Label5: TLabel
        Left = 12
        Top = 56
        Width = 75
        Height = 17
        Caption = 'Acr'#233'sc./Frete'
      end
      object Label6: TLabel
        Left = 12
        Top = 87
        Width = 81
        Height = 17
        Caption = 'Adiantamento'
      end
      object cxAjustePercentual: TcxCurrencyEdit
        Left = 151
        Top = 21
        Cursor = crIBeam
        EditValue = 0.000000000000000000
        Properties.ClearKey = 16452
        Properties.DisplayFormat = '% ,0.00;-% ,0.00'
        Properties.OnEditValueChanged = cxAjustePercentualPropertiesEditValueChanged
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 0
        Width = 64
      end
      object cxAjustesFrete: TcxCurrencyEdit
        Left = 151
        Top = 52
        Cursor = crIBeam
        EditValue = 0.000000000000000000
        Properties.ClearKey = 16452
        Properties.OnEditValueChanged = cxAjustePercentualPropertiesEditValueChanged
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 1
        Width = 149
      end
      object cxAjustesAdiantamento: TcxCurrencyEdit
        Left = 151
        Top = 83
        Cursor = crIBeam
        EditValue = 0.000000000000000000
        Properties.ClearKey = 16452
        Properties.OnEditValueChanged = cxAjustePercentualPropertiesEditValueChanged
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 2
        Width = 149
      end
      object cxAjustesReais: TcxCurrencyEdit
        Left = 214
        Top = 21
        Cursor = crIBeam
        EditValue = 0.000000000000000000
        Properties.ClearKey = 16452
        Properties.ReadOnly = True
        Properties.OnEditValueChanged = cxAjustesReaisPropertiesEditValueChanged
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 3
        Width = 86
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 652
      Top = 460
      Caption = 'TOTAL FINAL'
      Style.TextStyle = [fsBold]
      TabOrder = 21
      Height = 132
      Width = 310
      object Label8: TLabel
        Left = 14
        Top = 56
        Width = 43
        Height = 25
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 14
        Top = 25
        Width = 48
        Height = 17
        Caption = 'Subtotal'
      end
      object Label10: TLabel
        Left = 14
        Top = 95
        Width = 46
        Height = 17
        Caption = 'A Pagar'
      end
      object cxTotalSubtotal: TcxCurrencyEdit
        Left = 152
        Top = 21
        Cursor = crIBeam
        EditValue = 0.000000000000000000
        Properties.ClearKey = 16452
        Properties.ReadOnly = True
        Style.TextStyle = [fsBold]
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 0
        Width = 149
      end
      object cxTotalGeral: TcxCurrencyEdit
        Left = 152
        Top = 52
        Cursor = crIBeam
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.ClearKey = 16452
        Properties.ReadOnly = True
        Style.Color = 12058623
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -19
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 1
        Width = 149
      end
      object cxTotalPagar: TcxCurrencyEdit
        Left = 152
        Top = 91
        Cursor = crIBeam
        EditValue = 0.000000000000000000
        Properties.ClearKey = 16452
        Properties.ReadOnly = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 2
        Width = 149
      end
    end
    object cxTipo: TcxComboBox
      Left = 484
      Top = 9
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        'Or'#231'amento'
        'Pedido')
      Properties.OnEditValueChanged = cxTipoPropertiesEditValueChanged
      TabOrder = 3
      Text = 'Pedido'
      Width = 141
    end
    object cxStatus: TcxComboBox
      Left = 544
      Top = 133
      Enabled = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        'Aberto'
        'Finalizado'
        'Cancelado')
      StyleDisabled.Color = clMedGray
      StyleDisabled.TextColor = clBlack
      StyleFocused.Color = clBtnShadow
      TabOrder = 10
      Text = 'Aberto'
      Width = 104
    end
    object cxAberto: TcxCheckBox
      Left = 649
      Top = 135
      Caption = 'Salvar como aberto'
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.DisplayGrayed = 'S'
      Properties.ImmediatePost = True
      Properties.ValueChecked = 'S'
      Properties.ValueGrayed = 'N'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      TabOrder = 11
      Transparent = True
    end
    object BtnItens: TStyledBitBtn
      Left = 3
      Top = 598
      Width = 110
      Height = 35
      Caption = 'Itens | F3'
      TabOrder = 22
      OnClick = BtnItensClick
      StyleFamily = 'Bootstrap'
    end
  end
  inherited Paneltitulo: TPanel
    Width = 959
    ExplicitWidth = 959
    inherited lblTitulo: TLabel
      Width = 904
      ExplicitWidth = 904
    end
    inherited BtnFechar: TSpeedButton
      Left = 919
      ExplicitLeft = 919
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 416
    Top = 2
  end
  inherited Ds: TUniDataSource
    Left = 152
    Top = 344
  end
  inherited cxStyle: TcxStyleRepository
    Left = 455
    Top = 7
    PixelsPerInch = 96
    inherited CxGridPedido: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    inherited GridTableDependente: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
  object dsCliente: TUniDataSource
    DataSet = TabCliente
    Left = 408
    Top = 432
  end
  object dsVendedor: TUniDataSource
    DataSet = TabVendedor
    Left = 472
    Top = 432
  end
  object dsPagamento: TUniDataSource
    DataSet = TabPrazo
    Left = 536
    Top = 432
  end
  object dsListaProduto: TUniDataSource
    DataSet = TabProdutoPedido
    Left = 404
    Top = 331
  end
  object ProdutoPedido: TUniDataSource
    DataSet = TabItensPedido
    Left = 96
    Top = 344
  end
  object TabCliente: TClientDataSet
    PersistDataPacket.Data = {
      7C0000009619E0BD0100000018000000040000000000030000007C000869645F
      736F63696F040001000000000007636C69656E74650100490000000100055749
      44544802000200BE000363706601004900000001000557494454480200020014
      0008776861747361707001004900000001000557494454480200020014000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_socio'
        DataType = ftInteger
      end
      item
        Name = 'cliente'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'cpf'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'whatsapp'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 408
    Top = 472
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
    object TabClientetelefone: TStringField
      FieldName = 'whatsapp'
    end
  end
  object TabVendedor: TClientDataSet
    PersistDataPacket.Data = {
      620000009619E0BD01000000180000000300000000000300000062000E69645F
      66756E63696F6E6172696F04000100000000000466756E630100490000000100
      05574944544802000200B4000363706601004900000001000557494454480200
      020014000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 472
    Top = 472
    object TabVendedorid_funcionario: TIntegerField
      FieldName = 'id_funcionario'
    end
    object TabVendedorfunc: TStringField
      FieldName = 'func'
      Size = 180
    end
    object TabVendedorcpf: TStringField
      FieldName = 'cpf'
    end
  end
  object TabPrazo: TClientDataSet
    PersistDataPacket.Data = {
      8F0000009619E0BD0100000018000000050000000000030000008F000869645F
      7072617A6F040001000000000006636F6469676F040001000000000004746970
      6F0100490000000100055749445448020002000A000964657363726963616F01
      00490000000100055749445448020002003C00096E7072617A6F706167010049
      000000010005574944544802000200B4000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 472
    object TabPrazoid_prazo: TIntegerField
      FieldName = 'id_prazo'
    end
    object TabPrazocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabPrazotipo: TStringField
      FieldName = 'tipo'
      Size = 10
    end
    object TabPrazodescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object TabPrazonprazopag: TStringField
      FieldName = 'nprazopag'
      Size = 180
    end
  end
  object TabProdutoPedido: TClientDataSet
    PersistDataPacket.Data = {
      390100009619E0BD01000000180000000C00000000000300000039010A69645F
      70726F6475746F040001000000000006636F6469676F04000100000000000A72
      65666572656E6369610100490000000100055749445448020002005A00096465
      7363726963616F010049000000010005574944544802000200B4000A7072635F
      636F6D7072610800040000000000097072635F76656E64610800040000000000
      0D6573746F7175655F617475616C0800040000000000056D6172636101004900
      00000100055749445448020002003C0005677275706F01004900000001000557
      49445448020002003C0003756E69010049000000010005574944544802000200
      0A00056C6F63616C0100490000000100055749445448020002003C000A636F64
      5F62617272617301004900000001000557494454480200020018000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_produto'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'referencia'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 180
      end
      item
        Name = 'prc_compra'
        DataType = ftFloat
      end
      item
        Name = 'prc_venda'
        DataType = ftFloat
      end
      item
        Name = 'estoque_atual'
        DataType = ftFloat
      end
      item
        Name = 'marca'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'grupo'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'uni'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'local'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'cod_barras'
        DataType = ftString
        Size = 24
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 408
    Top = 376
    object TabProdutoPedidoid_produto: TIntegerField
      FieldName = 'id_produto'
    end
    object TabProdutoPedidocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabProdutoPedidoreferencia: TStringField
      FieldName = 'referencia'
      Size = 90
    end
    object TabProdutoPedidodescricao: TStringField
      FieldName = 'descricao'
      Size = 180
    end
    object TabProdutoPedidoprc_compra: TFloatField
      FieldName = 'prc_compra'
    end
    object TabProdutoPedidoprc_venda: TFloatField
      FieldName = 'prc_venda'
    end
    object TabProdutoPedidoestoque_atual: TFloatField
      FieldName = 'estoque_atual'
    end
    object TabProdutoPedidomarca: TStringField
      FieldName = 'marca'
      Size = 60
    end
    object TabProdutoPedidogrupo: TStringField
      FieldName = 'grupo'
      Size = 60
    end
    object TabProdutoPedidouni: TStringField
      FieldName = 'uni'
      Size = 10
    end
    object TabProdutoPedidolocal: TStringField
      FieldName = 'local'
      Size = 60
    end
    object TabProdutoPedidocod_barras: TStringField
      FieldName = 'cod_barras'
      Size = 24
    end
  end
  object TabItensPedido: TClientDataSet
    PersistDataPacket.Data = {
      890200009619E0BD01000000180000001A00000000000300000089020A69645F
      70726F6475746F04000100000000000F69645F70656469646F5F6974656E7304
      000100000000000471746465080004000000000006717464655F320800040000
      0000000C7072635F756E69746172696F08000400000000000D646573636F6E74
      6F5F7065726308000400000000000E646573636F6E746F5F7265616973080004
      0000000000097072635F746F74616C080004000000000006636F6469676F0400
      0100000000000A636F645F626172726173010049000000010005574944544802
      00020014000964657363726963616F0100490000000100055749445448020002
      00B4000A7265666572656E636961010049000000010005574944544802000200
      3C00077365727669636F0100490000000100055749445448020002000500056D
      617263610100490000000100055749445448020002003C00056C6F63616C0100
      490000000100055749445448020002003C0003756E6901004900000001000557
      494454480200020006001070726F6464657363616C7465726164610100490000
      00010005574944544802000200B4000B636F6D706C656D656E746F0100490000
      00010005574944544802000200B400077365716974656D04000100000000000C
      7072635F737562746F74616C0800040000000000047065736F08000400000001
      0007535542545950450200490006004D6F6E65790006766F6C756D6504000100
      000000000A7072635F636F6D7072610800040000000000097072635F63757374
      6F08000400000000000F636F6E74726F6C616573746F71756501004900000001
      00055749445448020002000500097573615F6368617061010049000000010005
      57494454480200020005000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_produto'
        DataType = ftInteger
      end
      item
        Name = 'id_pedido_itens'
        DataType = ftInteger
      end
      item
        Name = 'qtde'
        DataType = ftFloat
      end
      item
        Name = 'qtde_2'
        DataType = ftFloat
      end
      item
        Name = 'prc_unitario'
        DataType = ftFloat
      end
      item
        Name = 'desconto_perc'
        DataType = ftFloat
      end
      item
        Name = 'desconto_reais'
        DataType = ftFloat
      end
      item
        Name = 'prc_total'
        DataType = ftFloat
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'cod_barras'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 180
      end
      item
        Name = 'referencia'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'servico'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'marca'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'local'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'uni'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'proddescalterada'
        DataType = ftString
        Size = 180
      end
      item
        Name = 'complemento'
        DataType = ftString
        Size = 180
      end
      item
        Name = 'seqitem'
        DataType = ftInteger
      end
      item
        Name = 'prc_subtotal'
        DataType = ftFloat
      end
      item
        Name = 'peso'
        DataType = ftCurrency
      end
      item
        Name = 'volume'
        DataType = ftInteger
      end
      item
        Name = 'prc_compra'
        DataType = ftFloat
      end
      item
        Name = 'prc_custo'
        DataType = ftFloat
      end
      item
        Name = 'controlaestoque'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'usa_chapa'
        DataType = ftString
        Size = 5
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 96
    Top = 392
    object TabItensPedidoid_produto: TIntegerField
      FieldName = 'id_produto'
    end
    object TabItensPedidoid_pedido_itens: TIntegerField
      FieldName = 'id_pedido_itens'
    end
    object TabItensPedidoqtde: TFloatField
      FieldName = 'qtde'
    end
    object TabItensPedidoqtde_2: TFloatField
      FieldName = 'qtde_2'
    end
    object TabItensPedidoprc_unitario: TFloatField
      FieldName = 'prc_unitario'
    end
    object TabItensPedidodesconto_perc: TFloatField
      FieldName = 'desconto_perc'
    end
    object TabItensPedidodesconto_reais: TFloatField
      FieldName = 'desconto_reais'
    end
    object TabItensPedidoprc_total: TFloatField
      FieldName = 'prc_total'
    end
    object TabItensPedidocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabItensPedidocod_barras: TStringField
      FieldName = 'cod_barras'
    end
    object TabItensPedidodescricao: TStringField
      FieldName = 'descricao'
      Size = 180
    end
    object TabItensPedidoreferencia: TStringField
      FieldName = 'referencia'
      Size = 60
    end
    object TabItensPedidoservico: TStringField
      FieldName = 'servico'
      Size = 5
    end
    object TabItensPedidomarca: TStringField
      FieldName = 'marca'
      Size = 60
    end
    object TabItensPedidolocal: TStringField
      FieldName = 'local'
      Size = 60
    end
    object TabItensPedidouni: TStringField
      FieldName = 'uni'
      Size = 6
    end
    object TabItensPedidoproddescalterada: TStringField
      FieldName = 'proddescalterada'
      Size = 180
    end
    object TabItensPedidocomplemento: TStringField
      FieldName = 'complemento'
      Size = 180
    end
    object TabItensPedidoseqitem: TIntegerField
      FieldName = 'seqitem'
    end
    object TabItensPedidoprc_subtotal: TFloatField
      FieldName = 'prc_subtotal'
    end
    object TabItensPedidopeso: TCurrencyField
      FieldName = 'peso'
    end
    object TabItensPedidovolume: TIntegerField
      FieldName = 'volume'
    end
    object TabItensPedidoprc_compra: TFloatField
      FieldName = 'prc_compra'
    end
    object TabItensPedidoprc_custo: TFloatField
      FieldName = 'prc_custo'
    end
    object TabItensPedidocontrolaestoque: TStringField
      FieldName = 'controlaestoque'
      Size = 5
    end
    object TabItensPedidousa_chapa: TStringField
      FieldName = 'usa_chapa'
      Size = 5
    end
  end
end
