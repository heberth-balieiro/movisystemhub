inherited FrmCadVeiculo: TFrmCadVeiculo
  Caption = 'FrmCadVeiculo'
  ClientHeight = 594
  ClientWidth = 800
  OnShow = FormShow
  ExplicitWidth = 800
  ExplicitHeight = 594
  TextHeight = 17
  object lb_estoque: TLabel [0]
    Left = 263
    Top = 552
    Width = 135
    Height = 21
    Caption = 'Ve'#237'culo em Estoque'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  inherited Label27: TLabel
    Top = 552
    ExplicitTop = 552
  end
  inherited Panel2: TPanel
    Left = 682
    Top = 545
    TabOrder = 1
    ExplicitLeft = 682
    ExplicitTop = 545
  end
  inherited Panel1: TPanel
    Left = 554
    Top = 545
    TabOrder = 2
    ExplicitLeft = 554
    ExplicitTop = 545
  end
  inherited Paneltitulo: TPanel
    Width = 800
    TabOrder = 3
    ExplicitWidth = 800
    inherited lblTitulo: TLabel
      Width = 785
      Caption = 'Novo Ve'#237'culo'
      ExplicitWidth = 777
    end
  end
  inherited cxGroupBox1: TcxGroupBox
    TabOrder = 4
    ExplicitWidth = 800
    ExplicitHeight = 489
    Height = 489
    Width = 800
    inherited Label4: TLabel
      Left = 465
      Top = 205
      Width = 20
      Caption = 'KM'
      ExplicitLeft = 465
      ExplicitTop = 205
      ExplicitWidth = 20
    end
    object Label2: TLabel [2]
      Left = 94
      Top = 6
      Width = 97
      Height = 17
      Caption = 'Tipo Opera'#231#227'o *'
    end
    object dxBevel1: TdxBevel [3]
      Left = 627
      Top = 6
      Width = 165
      Height = 141
    end
    object edtFoto: TImage [4]
      Left = 629
      Top = 7
      Width = 160
      Height = 137
      Cursor = crHandPoint
      Center = True
      Proportional = True
      Transparent = True
    end
    object Label3: TLabel [5]
      Left = 422
      Top = 6
      Width = 39
      Height = 17
      Caption = 'Placa *'
    end
    object Label5: TLabel [6]
      Left = 8
      Top = 105
      Width = 53
      Height = 17
      Caption = 'Esp'#233'cie *'
    end
    object Label6: TLabel [7]
      Left = 327
      Top = 105
      Width = 46
      Height = 17
      Caption = 'Marca *'
    end
    object Label7: TLabel [8]
      Left = 8
      Top = 155
      Width = 55
      Height = 17
      Caption = 'Modelo *'
    end
    object Label8: TLabel [9]
      Left = 542
      Top = 6
      Width = 24
      Height = 17
      Caption = 'UF *'
    end
    object Label9: TLabel [10]
      Left = 207
      Top = 6
      Width = 35
      Height = 17
      Caption = 'Tipo *'
    end
    object Label10: TLabel [11]
      Left = 327
      Top = 155
      Width = 53
      Height = 17
      Caption = 'Origem *'
    end
    object Label11: TLabel [12]
      Left = 461
      Top = 155
      Width = 32
      Height = 17
      Caption = 'Ano *'
    end
    object Label12: TLabel [13]
      Left = 541
      Top = 155
      Width = 65
      Height = 17
      Caption = 'Ano/Mod *'
    end
    object Label13: TLabel [14]
      Left = 8
      Top = 205
      Width = 80
      Height = 17
      Caption = 'Combust'#237'vel *'
    end
    object Label14: TLabel [15]
      Left = 164
      Top = 205
      Width = 54
      Height = 17
      Caption = 'C'#226'mbio *'
    end
    object Label15: TLabel [16]
      Left = 298
      Top = 205
      Width = 30
      Height = 17
      Caption = 'Cor *'
    end
    object Label16: TLabel [17]
      Left = 392
      Top = 205
      Width = 37
      Height = 17
      Caption = 'Portas'
    end
    object Label17: TLabel [18]
      Left = 567
      Top = 205
      Width = 16
      Height = 17
      Caption = 'CV'
    end
    object Label31: TLabel [19]
      Left = 8
      Top = 255
      Width = 62
      Height = 17
      Caption = 'Renavam *'
    end
    object Label32: TLabel [20]
      Left = 187
      Top = 255
      Width = 46
      Height = 17
      Caption = 'Chassi *'
    end
    object Label33: TLabel [21]
      Left = 410
      Top = 255
      Width = 76
      Height = 17
      Caption = 'N'#250'mero CRV'
    end
    object Label45: TLabel [22]
      Left = 8
      Top = 55
      Width = 66
      Height = 17
      Caption = 'Descri'#231#227'o *'
    end
    object Label19: TLabel [23]
      Left = 404
      Top = 55
      Width = 76
      Height = 17
      Caption = 'Localiza'#231#227'o *'
    end
    inherited edtcodigo: TcxTextEdit
      Properties.ReadOnly = True
      TabOrder = 24
      ExplicitHeight = 25
    end
    inherited edtDescricao: TcxTextEdit
      Left = 542
      Properties.MaxLength = 2
      TabOrder = 3
      ExplicitLeft = 542
      ExplicitWidth = 79
      ExplicitHeight = 25
      Width = 79
    end
    inherited edtativo: TcxCheckBox
      Left = 94
      Top = 29
      TabOrder = 23
      Visible = False
      ExplicitLeft = 94
      ExplicitTop = 29
      ExplicitWidth = 47
    end
    object edttipo: TcxComboBox
      Left = 94
      Top = 24
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Consignado'
        'Consignado Loja'
        'Pr'#243'prio'
        'Refinanciamento'
        'Repasse'
        'Zero')
      Properties.OnChange = edttipoPropertiesChange
      Properties.OnEditValueChanged = edttipoPropertiesChange
      TabOrder = 0
      Width = 107
    end
    object edtgrupo: TcxLookupComboBox
      Left = 207
      Top = 24
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = 'Tipo ve'#237'culo'
          FieldName = 'ncompleto'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsTipo
      Properties.OnEditValueChanged = edtgrupoPropertiesEditValueChanged
      EditValue = 0
      TabOrder = 1
      Width = 183
    end
    object edtplaca: TcxButtonEdit
      Left = 422
      Top = 24
      Properties.Buttons = <
        item
          Default = True
          Glyph.SourceDPI = 96
          Glyph.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            610000001974455874536F6674776172650041646F626520496D616765526561
            647971C9653C00000016744558745469746C650047656F506F696E744D61703B
            4D61703B7DD144080000028849444154785E75937B4853511CC7CDE7CC7F220A
            653E1ABB82815081A1181215849158A84992339936C5A90846143AD77C403273
            EAEC617319D7225D64D3CA9A1AA5888F7C3B7C652E449D66440F0C64FB63DFCE
            B9C208BAFBC18FCB173EDF0FF7C0396E009C4BA743CEB835A486F8B4E73057DB
            E5CC38C930E630E36D59E2A2B278A1A02D9BA198B3F39FA03639D8CF98173661
            6633F073B21ED834E2C78416D36C265A33432715B1017B08B6CB95C0FDA9545C
            39D72A27C5E7C01722985302E64260B60453FA14DC490CAA229C872B81D76389
            68796BF63EF0598D89FA38B01784986AB8C8897EBF93A23A2E708D7002B2BC02
            9FC6E4E03F764B1330550043BA18CAD3FBAE186562C052075B7F3ACA4FF86F9B
            E7D728ECCE2BD09C150EACF614031F3330AB4FC0CBAC03F8C4A6008B6A58D833
            5025C6C0D43B43610FDE23C88FEE4D6A914701A3D9C0581EB05001CC97939C03
            6DA2089D8616184DD314F6E41378F6F4CDA0B5341F83B5E7810FE780F7F1DC76
            171D81527A098BCB1BD03EEAA7B017AFE089710C5F37D65191108D154312D01D
            8B25DD31C8A2C351F3AC0FAB9BBF505ED745616FDE2354D4F7C06EB7E355EF30
            CAE22360BE7B1CD248060595CDD0764E63FDFB164A6B39810F9FC0BB8CD81D0E
            07FA1737F1C2D48BF498285CBE7E0F379AFAA0308C730295E62D85057C0281AA
            A60B749A47ADB0D96C300C2CA16D6405EC8815FA612BE828AB39812F9FC0F7A6
            C6441927B860F986D28E05E886AC681C5A039DB4BC872EFF60B7F2F69B1D285F
            8F4311A76E95904C25BAC19DB224578FFD01E26BAEEE811F2DA4E5EA10107450
            4672A428F4B04C51D5093AA9B90F48992924DC495757D95742CAC290700909DC
            ABA35F262C4252AC7E0DFFC0B02C9245FFBE85BFD95D5B55FFD0C0AD00000000
            49454E44AE426082}
          Kind = bkGlyph
          Visible = False
        end>
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.MaxLength = 7
      Properties.OnEditValueChanged = edttipoPropertiesChange
      Style.Color = clWindow
      TabOrder = 2
      OnExit = edtplacaExit
      Width = 114
    end
    object edtespecie: TcxLookupComboBox
      Left = 8
      Top = 124
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = 'Esp'#233'cie Ve'#237'culo'
          FieldName = 'ncompleto'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsespecie
      EditValue = 0
      TabOrder = 6
      Width = 287
    end
    object edtmarca: TcxLookupComboBox
      Left = 327
      Top = 124
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = 'Marca Ve'#237'culo'
          FieldName = 'ncompleto'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsMarca
      Properties.OnEditValueChanged = edtmarcaPropertiesEditValueChanged
      EditValue = 0
      TabOrder = 7
      Width = 268
    end
    object edtmodelo: TcxLookupComboBox
      Left = 8
      Top = 174
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = 'Modelo Ve'#237'culo'
          FieldName = 'ncompleto'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsmodelo
      EditValue = 0
      TabOrder = 8
      Width = 287
    end
    object edtorigem: TcxComboBox
      Left = 327
      Top = 174
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Nacional'
        'Importado')
      TabOrder = 9
      Width = 128
    end
    object edtano: TcxButtonEdit
      Left = 461
      Top = 174
      Properties.Buttons = <>
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.MaxLength = 4
      TabOrder = 10
      OnKeyPress = edtrenavamKeyPress
      Width = 73
    end
    object edtanomodelo: TcxButtonEdit
      Left = 540
      Top = 174
      Properties.Buttons = <>
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.MaxLength = 4
      TabOrder = 11
      OnKeyPress = edtrenavamKeyPress
      Width = 81
    end
    object edtcombustivel: TcxComboBox
      Left = 8
      Top = 224
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Alcool'
        'Alcool/Gasolina'
        'Alcool/Gasolina/G'#225's natural'
        'Alcool/G'#225's natural'
        'Diesel'
        'Diesel/G'#225's natural'
        'El'#233'trico/Fonte externa'
        'El'#233'trico/Fonte interna'
        'Gasog'#234'nio'
        'Gasolina'
        'Gasolina/Alcool/El'#233'trico'
        'Gasolina/Alcool/G'#225's Natural/Benzina'
        'Gasolina/El'#233'trico'
        'Gasolina/G'#225's natural'
        'G'#225's metano'
        'G'#225's natural'
        'Sem Combust'#237'vel')
      TabOrder = 12
      Width = 150
    end
    object edtcambio: TcxComboBox
      Left = 164
      Top = 224
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Autom'#225'tico'
        'Autom'#225'tico Sequencial'
        'CVT'
        'Manual'
        'Semi-Autom'#225'tico'
        '----------')
      TabOrder = 13
      Width = 128
    end
    object edtcor: TcxComboBox
      Left = 298
      Top = 224
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'AMARELO'
        'AZUL'
        'BEGE'
        'BRANCA'
        'CINZA'
        'DOURADA'
        'GREN'#193
        'LARANJA'
        'MARROM'
        'PRATA'
        'PRETA'
        'ROSA'
        'ROXA'
        'VERDE'
        'VERMELHA'
        'FANTASIA'
        'SEM COR')
      TabOrder = 14
      Width = 88
    end
    object edtporta: TcxComboBox
      Left = 392
      Top = 224
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Sem Porta'
        '1'
        '2'
        '3'
        '4'
        '5')
      TabOrder = 15
      Width = 67
    end
    object edtcv: TcxButtonEdit
      Left = 567
      Top = 224
      Properties.Buttons = <>
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.MaxLength = 2
      TabOrder = 17
      Width = 54
    end
    object edtkm: TcxCurrencyEdit
      Left = 465
      Top = 224
      EditValue = 0.000000000000000000
      Properties.AssignedValues.DisplayFormat = True
      Properties.ClearKey = 16452
      Properties.DecimalPlaces = 0
      Properties.MaxLength = 7
      TabOrder = 16
      Width = 96
    end
    object edtrenavam: TcxButtonEdit
      Left = 8
      Top = 274
      Properties.Buttons = <>
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.MaxLength = 11
      TabOrder = 18
      OnKeyPress = edtrenavamKeyPress
      Width = 173
    end
    object edtchassi: TcxButtonEdit
      Left = 187
      Top = 274
      Properties.Buttons = <>
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.MaxLength = 17
      TabOrder = 19
      Width = 217
    end
    object edtcrv: TcxButtonEdit
      Left = 410
      Top = 274
      Properties.Buttons = <>
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.MaxLength = 11
      TabOrder = 20
      OnKeyPress = edtrenavamKeyPress
      Width = 211
    end
    object btnFoto: TcxButton
      Left = 627
      Top = 150
      Width = 165
      Height = 25
      Cursor = crHandPoint
      Caption = 'Carregar'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000002F744558745469746C6500496E73657274466C6F6174696E674F626A
        656374496D6167653B466C6F6174696E674F626A6563743B8B1388C400000220
        49444154785EA5934D4B546114C77F8FA3E514312E34214D050D571158462DA2
        26A14D9BE82BB80AA245B8AA5D9BA27511116D4312A245416E4C1149C309844C
        94D0D2AC2C1947E7CE9D3BF7798B0E7A61825EA0C3E5BCFC9F7B7F9CE7B9E751
        80029058657FD53CE0D49D4733234AA9AC285EFCCE03A2F9ED2879B2668D191B
        E8EFEDAB0DC3383BD07F2C61FEABDDBC3F751A48D558E304399B37CC6E18DE6E
        68A696F32C3EBB85FF364434F710B5F914FDFE1E2A3FC8FCE3EB783CC6380055
        6BAD2414632B6D5AABD18B394C5822F8B04231BFC4EAD01B5A7A0FD3D0D246BC
        B5B9FD9E4500C63A21AE950C1ED09588EE9941DACEF5906E6E2277FB094D07D2
        2C8CCD90BDD444E791B4009CDDE9C0581176F92B00A49465A93DC0BC18A1A5AB
        95C6EE0EE646673974A29DCF931F595EF8CAD11ED009C03A0154E20A0AF0CA53
        68B434E48A64BA4E62831217AFF5B1FA6A85868E34F3B950FE86353ED9820851
        25402905C0FA7A81FD3664E2EE20DA39F61D3CC5BBDC027612C2DD16F713E06C
        75075BA542321FC520C05D38CEEB4FD3144637493D1866BCD9B3D15987D686F3
        72882E0108B11C9511C5C39E8CE2F9C44BC2C0D0DABB97B19A1ABE2C4764D229
        8AC508E77C154084A852C1E141A6033ABAEBA54E79F8BEA641411C5BF26BB100
        5C02700EE7E1F2D9E96494138FAA1A6DE7A5C43A0402501B95C3D1AB3786CF24
        1F0905AA535F5D033A2E8D035A01F540DD1F6EA5FACD4DD440A4BCF7FC8FFD00
        8E0F555D42FE2EE90000000049454E44AE426082}
      TabOrder = 21
      OnClick = btnFotoClick
    end
    object btnexcluirfoto: TcxButton
      Left = 627
      Top = 181
      Width = 165
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
      TabOrder = 22
      OnClick = btnexcluirfotoClick
    end
    object edtDescricaoveiculo: TcxButtonEdit
      Left = 8
      Top = 74
      Properties.Buttons = <>
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      TabOrder = 4
      Width = 390
    end
    object edtlocalizacao: TcxLookupComboBox
      Left = 404
      Top = 74
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = 'Localiza'#231#227'o'
          FieldName = 'ncompleto'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsLocalizacao
      EditValue = 0
      TabOrder = 5
      Width = 191
    end
    object edtCadPessoa: TcxButtonEdit
      Left = 389
      Top = 24
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
      TabOrder = 25
      Width = 27
    end
    object cxButtonEdit1: TcxButtonEdit
      Left = 594
      Top = 74
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
      TabOrder = 26
      Width = 27
    end
    object btnespecie: TcxButtonEdit
      Left = 294
      Top = 124
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
      Properties.OnButtonClick = btnespeciePropertiesButtonClick
      Style.BorderStyle = ebsFlat
      Style.HotTrack = True
      Style.Shadow = False
      Style.TransparentBorder = True
      Style.ButtonStyle = btsDefault
      TabOrder = 27
      Width = 27
    end
    object cxButtonEdit3: TcxButtonEdit
      Left = 594
      Top = 124
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
      Properties.OnButtonClick = cxButtonEdit3PropertiesButtonClick
      Style.BorderStyle = ebsFlat
      Style.HotTrack = True
      Style.Shadow = False
      Style.TransparentBorder = True
      Style.ButtonStyle = btsDefault
      TabOrder = 28
      Width = 27
    end
    object btnModelo: TcxButtonEdit
      Left = 294
      Top = 174
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
      Properties.OnButtonClick = btnModeloPropertiesButtonClick
      Style.BorderStyle = ebsFlat
      Style.HotTrack = True
      Style.Shadow = False
      Style.TransparentBorder = True
      Style.ButtonStyle = btsDefault
      TabOrder = 29
      Width = 27
    end
  end
  object cxGroupBox5: TcxGroupBox [6]
    Left = 627
    Top = 262
    TabOrder = 5
    Height = 272
    Width = 165
    object edtIPVAPago: TcxCheckBox
      Left = 14
      Top = 15
      Caption = 'IPVA Pago'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      TabOrder = 0
      Transparent = True
    end
    object cxedtativo: TcxCheckBox
      Left = 14
      Top = 42
      Caption = 'Ativo'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      State = cbsChecked
      Style.TransparentBorder = False
      TabOrder = 1
      Transparent = True
    end
    object edtmostrarapp: TcxCheckBox
      Left = 14
      Top = 69
      Caption = 'Mostrar no APP'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      TabOrder = 2
      Transparent = True
    end
    object edtIntencaovenda: TcxCheckBox
      Left = 14
      Top = 96
      Caption = 'Inten'#231#227'o de Venda'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      TabOrder = 3
      Transparent = True
    end
    object edtEstoque: TcxCheckBox
      Left = 14
      Top = 123
      Caption = 'Controla estoque'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      State = cbsChecked
      Style.TransparentBorder = False
      TabOrder = 4
      Transparent = True
    end
    object edtPlavamercosul: TcxCheckBox
      Left = 14
      Top = 150
      Caption = 'Placa Mercosul'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      TabOrder = 5
      Transparent = True
    end
    object edtLicPago: TcxCheckBox
      Left = 14
      Top = 177
      Caption = 'Lic. Pago'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      TabOrder = 6
      Transparent = True
    end
    object edtTaxabombeiro: TcxCheckBox
      Left = 14
      Top = 204
      Caption = 'Taxa Bombeiro Pago'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      TabOrder = 7
      Transparent = True
    end
    object edtFinanciamentoAtivo: TcxCheckBox
      Left = 14
      Top = 231
      Caption = 'Financiamento Ativo'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      TabOrder = 8
      Transparent = True
    end
  end
  object PageValores: TPageControl [7]
    Left = 8
    Top = 355
    Width = 613
    Height = 179
    ActivePage = TabValores
    TabOrder = 0
    object TabValores: TTabSheet
      Caption = 'Valores'
      object lb_compra: TLabel
        Left = 105
        Top = 2
        Width = 47
        Height = 17
        Caption = 'Compra'
      end
      object Label21: TLabel
        Left = 105
        Top = 52
        Width = 32
        Height = 17
        Caption = 'Lucro'
      end
      object Label22: TLabel
        Left = 408
        Top = 2
        Width = 45
        Height = 17
        Caption = 'Venda *'
      end
      object Label23: TLabel
        Left = 4
        Top = 2
        Width = 66
        Height = 17
        Caption = 'Tabela Fipe'
      end
      object Label29: TLabel
        Left = 509
        Top = 2
        Width = 32
        Height = 17
        Caption = 'Troca'
      end
      object Label25: TLabel
        Left = 206
        Top = 52
        Width = 55
        Height = 17
        Caption = 'Praticado'
      end
      object Label34: TLabel
        Left = 307
        Top = 52
        Width = 89
        Height = 17
        Caption = 'Taxa % ao M'#234's'
      end
      object Label35: TLabel
        Left = 307
        Top = 2
        Width = 65
        Height = 17
        Caption = 'Custo Total'
      end
      object Label36: TLabel
        Left = 4
        Top = 102
        Width = 88
        Height = 17
        Caption = 'Comiss'#227'o LJ %'
      end
      object Label37: TLabel
        Left = 105
        Top = 102
        Width = 30
        Height = 17
        Caption = 'Valor'
      end
      object Label38: TLabel
        Left = 307
        Top = 102
        Width = 30
        Height = 17
        Caption = 'Valor'
      end
      object Label39: TLabel
        Left = 206
        Top = 102
        Width = 97
        Height = 17
        Caption = 'Comiss'#227'o Ven %'
      end
      object Label20: TLabel
        Left = 206
        Top = 2
        Width = 74
        Height = 17
        Caption = 'Custo Gerais'
      end
      object Label24: TLabel
        Left = 4
        Top = 52
        Width = 66
        Height = 17
        Caption = '% de Lucro'
      end
      object Label28: TLabel
        Left = 408
        Top = 52
        Width = 64
        Height = 17
        Caption = 'Taxa % Dia'
      end
      object Label44: TLabel
        Left = 509
        Top = 52
        Width = 61
        Height = 17
        Caption = 'Total P'#225'tio'
      end
      object edtcompra: TcxCurrencyEdit
        Left = 105
        Top = 21
        EditValue = 0.000000000000000000
        Properties.ClearKey = 16452
        Properties.DisplayFormat = '0.00;-0.00'
        TabOrder = 1
        Width = 95
      end
      object edtperlucro: TcxCurrencyEdit
        Left = 4
        Top = 71
        EditValue = 0.000000000000000000
        Properties.ClearKey = 16452
        Properties.DisplayFormat = '0.00;-0.00'
        TabOrder = 6
        Width = 95
      end
      object edtprcvenda: TcxCurrencyEdit
        Left = 408
        Top = 21
        EditValue = 0.000000000000000000
        Properties.ClearKey = 16452
        Properties.DisplayFormat = '0.00;-0.00'
        TabOrder = 4
        Width = 95
      end
      object vlrFipe: TcxCurrencyEdit
        Left = 4
        Top = 21
        EditValue = 0.000000000000000000
        Properties.ClearKey = 16452
        Properties.DisplayFormat = '0.00;-0.00'
        TabOrder = 0
        Width = 95
      end
      object edtValorTroca: TcxCurrencyEdit
        Left = 509
        Top = 21
        EditValue = 0.000000000000000000
        Properties.ClearKey = 16452
        Properties.DisplayFormat = '0.00;-0.00'
        TabOrder = 5
        Width = 89
      end
      object edtValorPraticado: TcxCurrencyEdit
        Left = 206
        Top = 71
        EditValue = 0.000000000000000000
        Properties.ClearKey = 16452
        Properties.DisplayFormat = '0.00;-0.00'
        TabOrder = 8
        Width = 95
      end
      object edttaxames: TcxCurrencyEdit
        Left = 307
        Top = 71
        EditValue = 0.000000000000000000
        Properties.ClearKey = 16452
        Properties.DisplayFormat = '0.00;-0.00'
        TabOrder = 9
        Width = 95
      end
      object edtCustototal: TcxCurrencyEdit
        Left = 307
        Top = 21
        EditValue = 0.000000000000000000
        Properties.ClearKey = 16452
        Properties.DisplayFormat = '0.00;-0.00'
        TabOrder = 3
        Width = 95
      end
      object edtljpercentual: TcxCurrencyEdit
        Left = 4
        Top = 121
        EditValue = 0.000000000000000000
        Properties.ClearKey = 16452
        Properties.DisplayFormat = '0.00;-0.00'
        TabOrder = 12
        Width = 95
      end
      object edtljtotal: TcxCurrencyEdit
        Left = 105
        Top = 121
        EditValue = 0.000000000000000000
        Properties.ClearKey = 16452
        Properties.DisplayFormat = '0.00;-0.00'
        TabOrder = 13
        Width = 95
      end
      object edtvendpercentual: TcxCurrencyEdit
        Left = 206
        Top = 121
        EditValue = 0.000000000000000000
        Properties.ClearKey = 16452
        Properties.DisplayFormat = '0.00;-0.00'
        TabOrder = 14
        Width = 95
      end
      object edtvendtotal: TcxCurrencyEdit
        Left = 307
        Top = 121
        EditValue = 0.000000000000000000
        Properties.ClearKey = 16452
        Properties.DisplayFormat = '0.00;-0.00'
        TabOrder = 15
        Width = 95
      end
      object vlrCustogerais: TcxCurrencyEdit
        Left = 206
        Top = 21
        EditValue = 0.000000000000000000
        Properties.ClearKey = 16452
        Properties.DisplayFormat = '0.00;-0.00'
        TabOrder = 2
        Width = 95
      end
      object edtValorLucro: TcxCurrencyEdit
        Left = 105
        Top = 71
        EditValue = 0.000000000000000000
        Properties.ClearKey = 16452
        Properties.DisplayFormat = '0.00;-0.00'
        TabOrder = 7
        Width = 95
      end
      object edttaxadia: TcxCurrencyEdit
        Left = 408
        Top = 71
        EditValue = 0.000000000000000000
        Properties.ClearKey = 16452
        Properties.DisplayFormat = '0.00;-0.00'
        TabOrder = 10
        Width = 95
      end
      object edtpatiototal: TcxCurrencyEdit
        Left = 509
        Top = 71
        EditValue = 0.000000000000000000
        Properties.ClearKey = 16452
        Properties.DisplayFormat = '0.00;-0.00'
        TabOrder = 11
        Width = 89
      end
      object edtPatioGerar: TcxCheckBox
        Left = 408
        Top = 122
        Caption = 'P'#225'tio a partir de 30 dias'
        Properties.ClearKey = 16452
        Properties.DisplayChecked = 'S'
        Properties.DisplayUnchecked = 'N'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        Style.TransparentBorder = False
        TabOrder = 16
        Transparent = True
      end
    end
    object TabAdicionais: TTabSheet
      Caption = 'Adicionais'
      ImageIndex = 1
      object Label40: TLabel
        Left = 4
        Top = 2
        Width = 88
        Height = 17
        Caption = 'Dt. Hod'#244'metro'
      end
      object Label41: TLabel
        Left = 110
        Top = 2
        Width = 89
        Height = 17
        Caption = 'N'#250'mero Motor'
      end
      object Label42: TLabel
        Left = 469
        Top = 2
        Width = 82
        Height = 17
        Caption = 'Tipo de CRV *'
      end
      object Label43: TLabel
        Left = 319
        Top = 2
        Width = 107
        Height = 17
        Caption = 'C'#243'digo seguran'#231'a'
      end
      object Label46: TLabel
        Left = 3
        Top = 52
        Width = 66
        Height = 17
        Caption = 'Procura'#231#227'o'
      end
      object Label47: TLabel
        Left = 110
        Top = 52
        Width = 67
        Height = 17
        Caption = 'Vencimento'
      end
      object Label26: TLabel
        Left = 216
        Top = 52
        Width = 70
        Height = 17
        Caption = 'Observa'#231#227'o'
      end
      object Label30: TLabel
        Left = 3
        Top = 102
        Width = 37
        Height = 17
        Caption = 'Avisos'
      end
      object edtdatahodometro: TcxDateEdit
        Left = 4
        Top = 21
        Properties.ClearKey = 16452
        Properties.DateButtons = []
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 0
        Width = 100
      end
      object edtNumeromotor: TcxButtonEdit
        Left = 110
        Top = 21
        Properties.Buttons = <>
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        TabOrder = 1
        Width = 203
      end
      object edtTipoCRV: TcxComboBox
        Left = 469
        Top = 21
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.DropDownListStyle = lsEditFixedList
        Properties.ImmediatePost = True
        Properties.Items.Strings = (
          'Azul'
          'Verde'
          'Branco'
          'Digital')
        TabOrder = 3
        Width = 129
      end
      object edtCodigoseguranca: TcxButtonEdit
        Left = 319
        Top = 21
        Properties.Buttons = <>
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.MaxLength = 11
        TabOrder = 2
        OnKeyPress = edtrenavamKeyPress
        Width = 144
      end
      object edtProcuracao: TcxComboBox
        Left = 3
        Top = 71
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.DropDownListStyle = lsEditFixedList
        Properties.ImmediatePost = True
        Properties.Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 4
        Text = 'N'#195'O'
        Width = 101
      end
      object edtdtVencimento: TcxDateEdit
        Left = 110
        Top = 71
        Properties.ClearKey = 16452
        Properties.DateButtons = []
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 5
        Width = 100
      end
      object edtobs: TcxBlobEdit
        Left = 216
        Top = 71
        Properties.BlobEditKind = bekMemo
        Properties.ImmediatePost = True
        Properties.PopupHeight = 180
        Properties.PopupWidth = 378
        TabOrder = 6
        Width = 382
      end
      object edtaviso: TcxBlobEdit
        Left = 3
        Top = 121
        Properties.BlobEditKind = bekMemo
        Properties.ClearKey = 16452
        Properties.ImmediatePost = True
        Properties.PopupHeight = 180
        Properties.PopupWidth = 593
        TabOrder = 7
        Width = 595
      end
    end
    object TabDespesas: TTabSheet
      Caption = 'Despesas'
      ImageIndex = 4
    end
    object TabFotos: TTabSheet
      Caption = 'Fotos'
      ImageIndex = 2
    end
    object TabHistorico: TTabSheet
      Caption = 'Hist'#243'rico'
      ImageIndex = 3
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 416
  end
  object dsTipo: TUniDataSource
    DataSet = Tab_TipoVeiculo
    Left = 512
    Top = 544
  end
  object dsespecie: TUniDataSource
    DataSet = Tab_Especie
    Left = 424
    Top = 544
  end
  object dsMarca: TUniDataSource
    DataSet = Tab_Marca
    Left = 368
    Top = 544
  end
  object dsmodelo: TUniDataSource
    DataSet = Tab_Modelo
    Left = 296
    Top = 544
  end
  object dsLocalizacao: TUniDataSource
    DataSet = Tab_Localizacao
    Left = 472
    Top = 544
  end
  object Tab_TipoVeiculo: TClientDataSet
    PersistDataPacket.Data = {
      960000009619E0BD010000001800000005000000000003000000960002696404
      0001000000000006636F6469676F04000100000000000964657363726963616F
      0100490000000100055749445448020002006400096E636F6D706C65746F0100
      49000000010005574944544802000200640011706C6163615F6F627269676174
      6F72696101004900000001000557494454480200020001000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 512
    Top = 544
    object Tab_TipoVeiculoid: TIntegerField
      FieldName = 'id'
    end
    object Tab_TipoVeiculocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object Tab_TipoVeiculodescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object Tab_TipoVeiculoncompleto: TStringField
      FieldName = 'ncompleto'
      Size = 100
    end
    object Tab_TipoVeiculoplaca_obrigatoria: TStringField
      FieldName = 'placa_obrigatoria'
      Size = 1
    end
  end
  object Tab_Localizacao: TClientDataSet
    PersistDataPacket.Data = {
      700000009619E0BD010000001800000004000000000003000000700002696404
      0001000000000006636F6469676F04000100000000000964657363726963616F
      0100490000000100055749445448020002006400096E636F6D706C65746F0100
      4900000001000557494454480200020064000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 472
    Top = 544
    object Tab_Localizacaoid: TIntegerField
      FieldName = 'id'
    end
    object Tab_Localizacaocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object Tab_Localizacaodescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object Tab_Localizacaoncompleto: TStringField
      FieldName = 'ncompleto'
      Size = 100
    end
  end
  object Tab_Especie: TClientDataSet
    PersistDataPacket.Data = {
      700000009619E0BD010000001800000004000000000003000000700002696404
      0001000000000006636F6469676F04000100000000000964657363726963616F
      0100490000000100055749445448020002006400096E636F6D706C65746F0100
      4900000001000557494454480200020064000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 544
    object Tab_Especieid: TIntegerField
      FieldName = 'id'
    end
    object Tab_Especiecodigo: TIntegerField
      FieldName = 'codigo'
    end
    object Tab_Especiedescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object Tab_Especiencompleto: TStringField
      FieldName = 'ncompleto'
      Size = 100
    end
  end
  object Tab_Marca: TClientDataSet
    PersistDataPacket.Data = {
      700000009619E0BD010000001800000004000000000003000000700002696404
      0001000000000006636F6469676F04000100000000000964657363726963616F
      0100490000000100055749445448020002006400096E636F6D706C65746F0100
      4900000001000557494454480200020064000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 544
    object Tab_Marcaid: TIntegerField
      FieldName = 'id'
    end
    object Tab_Marcacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object Tab_Marcadescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object Tab_Marcancompleto: TStringField
      FieldName = 'ncompleto'
      Size = 100
    end
  end
  object Tab_Modelo: TClientDataSet
    PersistDataPacket.Data = {
      700000009619E0BD010000001800000004000000000003000000700002696404
      0001000000000006636F6469676F04000100000000000964657363726963616F
      0100490000000100055749445448020002006400096E636F6D706C65746F0100
      4900000001000557494454480200020064000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 296
    Top = 544
    object Tab_Modeloid: TIntegerField
      FieldName = 'id'
    end
    object Tab_Modelocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object Tab_Modelodescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object Tab_Modeloncompleto: TStringField
      FieldName = 'ncompleto'
      Size = 100
    end
  end
end
