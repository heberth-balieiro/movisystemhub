inherited FrmPessoaCad: TFrmPessoaCad
  Caption = 'Cliente'
  ClientHeight = 623
  Color = clWhite
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitHeight = 623
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 595
    TabOrder = 0
    ExplicitTop = 595
  end
  inherited PanelClient: TPanel
    Height = 552
    TabOrder = 1
    ExplicitHeight = 552
    inherited dxBevel1: TdxBevel
      Left = 389
      Top = 528
      Width = 31
      Height = 28
      Align = alNone
      Visible = False
      ExplicitLeft = 389
      ExplicitTop = 528
      ExplicitWidth = 31
      ExplicitHeight = 28
    end
    inherited BtnSalvar: TStyledBitBtn
      Left = 426
      Top = 514
      OnClick = BtnSalvarClick
      ExplicitLeft = 426
      ExplicitTop = 514
    end
    inherited BtnCancelar: TStyledBitBtn
      Left = 537
      Top = 514
      OnClick = BtnCancelarClick
      ExplicitLeft = 537
      ExplicitTop = 514
    end
    object cxPage: TcxPageControl
      Left = 0
      Top = 0
      Width = 650
      Height = 512
      Align = alTop
      TabOrder = 2
      Properties.ActivePage = TabDados
      Properties.CustomButtons.Buttons = <>
      Properties.TabSlants.Kind = skCutCorner
      ClientRectBottom = 510
      ClientRectLeft = 2
      ClientRectRight = 648
      ClientRectTop = 35
      object TabDados: TcxTabSheet
        Caption = 'Dados B'#225'sicos'
        ImageIndex = 0
        object Label2: TLabel
          Left = 82
          Top = 6
          Width = 41
          Height = 17
          Caption = 'Pessoa'
        end
        object Label3: TLabel
          Left = 161
          Top = 6
          Width = 55
          Height = 17
          Caption = 'CPF/CNPJ'
        end
        object Label4: TLabel
          Left = 3
          Top = 55
          Width = 77
          Height = 17
          Caption = 'Nome/Raz'#227'o'
        end
        object labelOrgao: TLabel
          Left = 413
          Top = 6
          Width = 38
          Height = 17
          Caption = 'Org'#227'o'
        end
        object Label6: TLabel
          Left = 301
          Top = 55
          Width = 97
          Height = 17
          Caption = 'Apelido/Fantasia'
        end
        object Label7: TLabel
          Left = 301
          Top = 6
          Width = 31
          Height = 17
          Caption = 'Rg/IE'
        end
        object Label9: TLabel
          Left = 3
          Top = 104
          Width = 22
          Height = 17
          Caption = 'CEP'
        end
        object Label10: TLabel
          Left = 102
          Top = 105
          Width = 55
          Height = 17
          Caption = 'Endere'#231'o'
        end
        object Label11: TLabel
          Left = 400
          Top = 104
          Width = 48
          Height = 17
          Caption = 'N'#250'mero'
        end
        object Label12: TLabel
          Left = 354
          Top = 153
          Width = 41
          Height = 17
          Caption = 'Cidade'
        end
        object Label13: TLabel
          Left = 195
          Top = 153
          Width = 82
          Height = 17
          Caption = 'Complemento'
        end
        object Label14: TLabel
          Left = 3
          Top = 153
          Width = 35
          Height = 17
          Caption = 'Bairro'
        end
        object Label15: TLabel
          Left = 3
          Top = 252
          Width = 39
          Height = 17
          Caption = 'Fone 1'
        end
        object Label16: TLabel
          Left = 112
          Top = 252
          Width = 39
          Height = 17
          Caption = 'Fone 2'
        end
        object Label17: TLabel
          Left = 221
          Top = 252
          Width = 51
          Height = 17
          Caption = 'Celular 1'
        end
        object Label18: TLabel
          Left = 330
          Top = 252
          Width = 51
          Height = 17
          Caption = 'Celular 2'
        end
        object Label19: TLabel
          Left = 439
          Top = 252
          Width = 60
          Height = 17
          Caption = 'WhatsApp'
        end
        object Label20: TLabel
          Left = 3
          Top = 301
          Width = 70
          Height = 17
          Caption = 'Observa'#231#227'o'
        end
        object Label21: TLabel
          Left = 330
          Top = 301
          Width = 37
          Height = 17
          Caption = 'Avisos'
        end
        object Label22: TLabel
          Left = 3
          Top = 203
          Width = 36
          Height = 17
          Caption = 'E-mail'
        end
        object Label8: TLabel
          Left = 354
          Top = 203
          Width = 73
          Height = 17
          Caption = 'Respons'#225'vel'
        end
        object Label1: TLabel
          Left = 3
          Top = 6
          Width = 43
          Height = 17
          Caption = 'C'#243'digo'
        end
        object dxBevel2: TdxBevel
          Left = 480
          Top = 3
          Width = 165
          Height = 144
        end
        object edtFoto: TImage
          Left = 481
          Top = 4
          Width = 163
          Height = 142
          Cursor = crHandPoint
          Center = True
          Picture.Data = {
            0D546478536D617274496D6167653C3F786D6C2076657273696F6E3D22312E30
            2220656E636F64696E673D225554462D38223F3E0D0A3C737667207665727369
            6F6E3D22312E31222069643D22D0A1D0BBD0BED0B95F312220786D6C6E733D22
            687474703A2F2F7777772E77332E6F72672F323030302F7376672220786D6C6E
            733A786C696E6B3D22687474703A2F2F7777772E77332E6F72672F313939392F
            786C696E6B2220783D223070782220793D22307078222076696577426F783D22
            30203020333220333222207374796C653D22656E61626C652D6261636B67726F
            756E643A6E6577203020302033322033323B2220786D6C3A73706163653D2270
            72657365727665223E262331333B262331303B3C7374796C6520747970653D22
            746578742F6373732220786D6C3A73706163653D227072657365727665223E2E
            426C61636B7B66696C6C3A233732373237323B7D262331333B262331303B2623
            393B2E7374307B6F7061636974793A302E363B7D3C2F7374796C653E0D0A3C67
            2069643D22D0A1D0BBD0BED0B95F322220636C6173733D22737430223E0D0A09
            093C7061746820636C6173733D22426C61636B2220643D224D32362C3139632D
            322E362D302E372D332D322E332D332D3363312E362D312E362C332D342E372C
            332D3863302D302E322C302D302E352C302D3163302D322E352D322E382D352D
            352E392D3563302C302D302E312C302D302E312C3020202623393B2623393B63
            302C302D302E312C302D302E312C304331362E382C322C31342C342E352C3134
            2C3763302C302E352C302C302E382C302C3163302C332E332C312E342C362E34
            2C332C3863302C302E372D302E342C322E332D332C33632D352C312E342D362C
            312E312D362C3768313268313220202623393B2623393B4333322C32302E312C
            33312C32302E342C32362C31397A222F3E0D0A093C2F673E0D0A3C7061746820
            636C6173733D22426C61636B2220643D224D31382C3233632D322E362D302E37
            2D332D322E332D332D3363312E362D312E362C332D342E372C332D3863302D30
            2E322C302D302E352C302D3163302D322E352D322E382D352D352E392D356330
            2C302D302E312C302D302E312C3020202623393B63302C302D302E312C302D30
            2E312C3043382E382C362C362C382E352C362C313163302C302E352C302C302E
            382C302C3163302C332E332C312E342C362E342C332C3863302C302E372D302E
            342C322E332D332C33632D352C312E342D362C312E312D362C37683132683132
            20202623393B4332342C32342E312C32332C32342E342C31382C32337A222F3E
            0D0A3C2F7376673E0D0A}
          Proportional = True
          Transparent = True
          OnDblClick = edtFotoDblClick
        end
        object Label27: TLabel
          Left = 548
          Top = 252
          Width = 49
          Height = 17
          Caption = 'Situa'#231#227'o'
        end
        object edtcodigo: TcxTextEdit
          Left = 3
          Top = 24
          TabOrder = 0
          Width = 80
        end
        object cxNome: TcxTextEdit
          Left = 3
          Top = 73
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 150
          TabOrder = 5
          Width = 299
        end
        object cxpessoa: TcxComboBox
          Left = 82
          Top = 24
          Properties.DropDownListStyle = lsEditFixedList
          Properties.Items.Strings = (
            'F'#205'SICA'
            'JUR'#205'DICA')
          Properties.OnEditValueChanged = cxpessoaPropertiesEditValueChanged
          TabOrder = 1
          Text = 'F'#205'SICA'
          Width = 80
        end
        object cxCPF: TcxButtonEdit
          Left = 161
          Top = 24
          Properties.Buttons = <
            item
              Default = True
              Glyph.SourceDPI = 96
              Glyph.Data = {
                89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
                6100000010744558745469746C65004D61703B4D617049743B4934CEBF000001
                3149444154785E8593CD4A856010863B750AA21B88D64157D305B469D12237D1
                45849BB6EDA28B1011FF76A544CA21BA8056FE606E937E5091E99D8382DF3973
                72E00117BE8FDFCC376E119182AEEB7BE01A2CC00FF8062F4003F3D5F757C347
                E0CDF77D2A8A82DAB6A5A66928CF73721C8720780587A200C15DB008C390B8DE
                8B4F3ABDF198E5335710042C89C05C1268FC95A11054E86B38892609C2344D27
                055996B1E0591254755DF771B905C03361C19724F8C5D094705F8AA4EB3A1634
                92E0294992212031D9C28565599302CFF358702509F64186FB1FF7AFCCA12C4B
                0E7F800345209C42C4B66D165CFEB78933F01845D15A388EE365EF605B102892
                63508D77825799AF0E9C48FF822439330C83782FF8DA4CD364C1390764812CB9
                755D7798FA9D109E14CCC003B8073B9B047F0096F97D1549C998000000004945
                4E44AE426082}
              Kind = bkGlyph
            end>
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 18
          TabOrder = 2
          Width = 141
        end
        object cxApelido: TcxTextEdit
          Left = 301
          Top = 73
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 6
          Width = 177
        end
        object cxRG: TcxTextEdit
          Left = 301
          Top = 24
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 20
          TabOrder = 3
          Width = 113
        end
        object cxorgao: TcxTextEdit
          Left = 413
          Top = 24
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 15
          TabOrder = 4
          Width = 65
        end
        object cxCep: TcxButtonEdit
          Left = 3
          Top = 122
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
            end>
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.EditMask = '99\.999\-999;1;_'
          Properties.MaxLength = 0
          Properties.OnButtonClick = cxCepPropertiesButtonClick
          TabOrder = 7
          Text = '  .   -   '
          Width = 100
        end
        object cxEndereco: TcxTextEdit
          Left = 102
          Top = 122
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 90
          TabOrder = 8
          Width = 299
        end
        object cxNumero: TcxTextEdit
          Left = 400
          Top = 122
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 15
          TabOrder = 9
          Width = 78
        end
        object cxComplemento: TcxTextEdit
          Left = 195
          Top = 172
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 45
          TabOrder = 11
          Width = 160
        end
        object cxBairro: TcxTextEdit
          Left = 3
          Top = 172
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 10
          Width = 193
        end
        object cxCidade: TcxLookupComboBox
          Left = 354
          Top = 172
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.KeyFieldNames = 'id_cidade'
          Properties.ListColumns = <
            item
              FieldName = 'ncidade'
            end>
          Properties.ListSource = dsCidade
          EditValue = 0
          TabOrder = 12
          Width = 267
        end
        object cxFone1: TcxMaskEdit
          Left = 3
          Top = 270
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.EditMask = '!\(99\)9999-9999;1;_'
          TabOrder = 15
          Text = '(  )    -    '
          Width = 110
        end
        object cxfone2: TcxMaskEdit
          Left = 112
          Top = 270
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.EditMask = '!\(99\)9999-9999;1;_'
          TabOrder = 16
          Text = '(  )    -    '
          Width = 110
        end
        object cxcelular1: TcxMaskEdit
          Left = 221
          Top = 270
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.EditMask = '!\(99\)99999-9999;1;_'
          TabOrder = 17
          Text = '(  )     -    '
          Width = 110
        end
        object cxcelular2: TcxMaskEdit
          Left = 330
          Top = 270
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.EditMask = '!\(99\)99999-9999;1;_'
          TabOrder = 18
          Text = '(  )     -    '
          Width = 110
        end
        object cxWhatsapp: TcxMaskEdit
          Left = 439
          Top = 270
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.EditMask = '!\(99\)99999-9999;1;_'
          TabOrder = 19
          Text = '(  )     -    '
          Width = 110
        end
        object cxObs: TcxBlobEdit
          Left = 3
          Top = 319
          Properties.BlobEditKind = bekMemo
          Properties.MemoMaxLength = 250
          Properties.PopupHeight = 180
          Properties.PopupWidth = 328
          TabOrder = 21
          Width = 328
        end
        object cxAviso: TcxBlobEdit
          Left = 330
          Top = 319
          Properties.BlobEditKind = bekMemo
          Properties.MemoMaxLength = 500
          Properties.PopupHeight = 180
          Properties.PopupWidth = 315
          TabOrder = 22
          Width = 315
        end
        object cxEmail: TcxTextEdit
          Left = 3
          Top = 221
          Properties.ClearKey = 16452
          Properties.MaxLength = 180
          TabOrder = 13
          Width = 352
        end
        object cxResp: TcxTextEdit
          Left = 354
          Top = 221
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 45
          TabOrder = 14
          Width = 291
        end
        object btncacidade: TcxButtonEdit
          Left = 618
          Top = 172
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
          Properties.OnButtonClick = btncacidadePropertiesButtonClick
          Style.BorderStyle = ebsFlat
          Style.HotTrack = True
          Style.Shadow = False
          Style.TransparentBorder = True
          Style.ButtonStyle = btsDefault
          TabOrder = 28
          Width = 27
        end
        object cxsituacao: TcxComboBox
          Left = 548
          Top = 270
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.DropDownListStyle = lsEditFixedList
          Properties.ImmediatePost = True
          Properties.Items.Strings = (
            'Ativo'
            'Inadimplente'
            'Inativo'
            'Cancelado')
          Properties.MaxLength = 45
          StyleFocused.BorderColor = clNavy
          StyleFocused.Color = 15855596
          TabOrder = 20
          Text = 'ATIVO'
          Width = 97
        end
        object cxcliente: TcxCheckBox
          Left = 3
          Top = 350
          Caption = 'Cliente'
          Properties.ClearKey = 16452
          Properties.DisplayChecked = 'S'
          Properties.DisplayUnchecked = 'N'
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 'S'
          Properties.ValueUnchecked = 'N'
          State = cbsChecked
          Style.TransparentBorder = False
          TabOrder = 23
          Transparent = True
        end
        object cxFornecedor: TcxCheckBox
          Left = 3
          Top = 376
          Caption = 'Fornecedor'
          Properties.ClearKey = 16452
          Properties.DisplayChecked = 'S'
          Properties.DisplayUnchecked = 'N'
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 'S'
          Properties.ValueUnchecked = 'N'
          Style.TransparentBorder = False
          TabOrder = 24
          Transparent = True
        end
        object cxEnvemail: TcxCheckBox
          Left = 3
          Top = 402
          Caption = 'Enviar E-mail'
          Properties.ClearKey = 16452
          Properties.DisplayChecked = 'S'
          Properties.DisplayUnchecked = 'N'
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 'S'
          Properties.ValueUnchecked = 'N'
          Style.TransparentBorder = False
          TabOrder = 25
          Transparent = True
        end
        object cxenvwhatsapp: TcxCheckBox
          Left = 3
          Top = 428
          Caption = 'Enviar WhatsApp'
          Properties.ClearKey = 16452
          Properties.DisplayChecked = 'S'
          Properties.DisplayUnchecked = 'N'
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 'S'
          Properties.ValueUnchecked = 'N'
          Style.TransparentBorder = False
          TabOrder = 26
          Transparent = True
        end
        object cxExibirapp: TcxCheckBox
          Left = 3
          Top = 454
          Caption = 'Mostrar no APP'
          Properties.ClearKey = 16452
          Properties.DisplayChecked = 'S'
          Properties.DisplayUnchecked = 'N'
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 'S'
          Properties.ValueUnchecked = 'N'
          Style.TransparentBorder = False
          TabOrder = 27
          Transparent = True
        end
      end
      object TabAdicionais: TcxTabSheet
        Caption = 'Adicionais'
        ImageIndex = 1
        object Label5: TLabel
          Left = 3
          Top = 6
          Width = 28
          Height = 17
          Caption = 'Sexo'
        end
        object Label28: TLabel
          Left = 102
          Top = 6
          Width = 65
          Height = 17
          Caption = 'Estado civil'
        end
        object Label29: TLabel
          Left = 227
          Top = 6
          Width = 69
          Height = 17
          Caption = 'Nascimento'
        end
        object Label54: TLabel
          Left = 337
          Top = 6
          Width = 62
          Height = 17
          Caption = 'Natural de'
        end
        object Label55: TLabel
          Left = 3
          Top = 55
          Width = 17
          Height = 17
          Caption = 'Pai'
        end
        object Label56: TLabel
          Left = 337
          Top = 55
          Width = 26
          Height = 17
          Caption = 'M'#227'e'
        end
        object Label57: TLabel
          Left = 3
          Top = 104
          Width = 27
          Height = 17
          Caption = 'CNH'
        end
        object Label58: TLabel
          Left = 102
          Top = 104
          Width = 108
          Height = 17
          Caption = 'Tipo de resid'#234'ncia'
        end
        object Label59: TLabel
          Left = 337
          Top = 104
          Width = 122
          Height = 17
          Caption = 'Tempo de resid'#234'ncia'
        end
        object Label60: TLabel
          Left = 3
          Top = 153
          Width = 69
          Height = 17
          Caption = 'Emiss'#227'o RG'
        end
        object Label61: TLabel
          Left = 102
          Top = 153
          Width = 84
          Height = 17
          Caption = 'Nacionalidade'
        end
        object cxSexo: TcxComboBox
          Left = 3
          Top = 24
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.DropDownListStyle = lsEditFixedList
          Properties.ImmediatePost = True
          Properties.Items.Strings = (
            'MASCULINO'
            'FEMININO'
            'CISG'#202'NERO'
            'TRANSG'#202'NERO'
            'N'#195'O BINARIO'
            'OUTROS')
          TabOrder = 0
          Width = 100
        end
        object cxcivel: TcxComboBox
          Left = 102
          Top = 24
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.DropDownListStyle = lsEditFixedList
          Properties.ImmediatePost = True
          Properties.Items.Strings = (
            'SOLTEIRO(A)'
            'CASADO(A)'
            'UNI'#195'O EST'#193'VEL'
            'DIVORCIADO(A)'
            'VI'#218'VO(A)'
            'OUTROS')
          TabOrder = 1
          Text = 'OUTROS'
          Width = 126
        end
        object cxNascimento: TcxDateEdit
          Left = 227
          Top = 24
          Properties.ClearKey = 16452
          Properties.DateButtons = []
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 2
          Width = 111
        end
        object cxNatural: TcxLookupComboBox
          Left = 337
          Top = 24
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.KeyFieldNames = 'id_cidade'
          Properties.ListColumns = <
            item
              FieldName = 'ncidade'
            end>
          Properties.ListSource = dsCidade
          EditValue = 0
          TabOrder = 3
          Width = 282
        end
        object cxPai: TcxTextEdit
          Left = 3
          Top = 73
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 90
          TabOrder = 4
          Width = 335
        end
        object cxMae: TcxTextEdit
          Left = 337
          Top = 73
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 90
          TabOrder = 5
          Width = 306
        end
        object cxCNH: TcxComboBox
          Left = 3
          Top = 122
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.DropDownListStyle = lsEditFixedList
          Properties.ImmediatePost = True
          Properties.Items.Strings = (
            'SIM'
            'N'#195'O')
          TabOrder = 6
          Text = 'N'#195'O'
          Width = 100
        end
        object cxtpresidencia: TcxComboBox
          Left = 102
          Top = 122
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.DropDownListStyle = lsEditFixedList
          Properties.ImmediatePost = True
          Properties.Items.Strings = (
            'PR'#211'PRIA'
            'ALUGADA'
            'MORA C/PAIS'
            'FINANCIADA'
            'CEDIDA'
            'FUNCIONAL')
          TabOrder = 7
          Width = 236
        end
        object cxTempo: TcxTextEdit
          Left = 337
          Top = 122
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 90
          TabOrder = 8
          Width = 306
        end
        object cxemissaorg: TcxDateEdit
          Left = 3
          Top = 171
          Properties.ClearKey = 16452
          Properties.DateButtons = []
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 9
          Width = 100
        end
        object cxNacionalidade: TcxTextEdit
          Left = 102
          Top = 171
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 90
          TabOrder = 10
          Width = 236
        end
        object btnCidadenatural: TcxButtonEdit
          Left = 616
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
          Properties.OnButtonClick = btncacidadePropertiesButtonClick
          Style.BorderStyle = ebsFlat
          Style.HotTrack = True
          Style.Shadow = False
          Style.TransparentBorder = True
          Style.ButtonStyle = btsDefault
          TabOrder = 11
          Width = 27
        end
      end
      object TabProfissional: TcxTabSheet
        Caption = 'Profissionais'
        ImageIndex = 2
        TabVisible = False
        object Label23: TLabel
          Left = 142
          Top = 6
          Width = 51
          Height = 17
          Caption = 'Empresa'
        end
        object Label24: TLabel
          Left = 533
          Top = 6
          Width = 49
          Height = 17
          Caption = 'Telefone'
        end
        object Label25: TLabel
          Left = 3
          Top = 153
          Width = 88
          Height = 17
          Caption = 'Data Admiss'#227'o'
        end
        object Label26: TLabel
          Left = 125
          Top = 153
          Width = 37
          Height = 17
          Caption = 'Renda'
        end
        object Label30: TLabel
          Left = 241
          Top = 153
          Width = 92
          Height = 17
          Caption = 'Cargo e Fun'#231#227'o'
        end
        object Label31: TLabel
          Left = 431
          Top = 153
          Width = 104
          Height = 17
          Caption = 'Tempo de servi'#231'o'
        end
        object Label32: TLabel
          Left = 3
          Top = 6
          Width = 29
          Height = 17
          Caption = 'CNPJ'
        end
        object Label33: TLabel
          Left = 3
          Top = 55
          Width = 22
          Height = 17
          Caption = 'CEP'
        end
        object Label34: TLabel
          Left = 142
          Top = 55
          Width = 55
          Height = 17
          Caption = 'Endere'#231'o'
        end
        object Label35: TLabel
          Left = 533
          Top = 55
          Width = 48
          Height = 17
          Caption = 'N'#250'mero'
        end
        object Label36: TLabel
          Left = 192
          Top = 104
          Width = 82
          Height = 17
          Caption = 'Complemento'
        end
        object Label37: TLabel
          Left = 3
          Top = 104
          Width = 35
          Height = 17
          Caption = 'Bairro'
        end
        object Label38: TLabel
          Left = 323
          Top = 104
          Width = 41
          Height = 17
          Caption = 'Cidade'
        end
        object prof_cnpj: TcxButtonEdit
          Left = 3
          Top = 24
          Properties.Buttons = <
            item
              Default = True
              Glyph.SourceDPI = 96
              Glyph.Data = {
                89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
                6100000010744558745469746C65004D61703B4D617049743B4934CEBF000001
                3149444154785E8593CD4A856010863B750AA21B88D64157D305B469D12237D1
                45849BB6EDA28B1011FF76A544CA21BA8056FE606E937E5091E99D8382DF3973
                72E00117BE8FDFCC376E119182AEEB7BE01A2CC00FF8062F4003F3D5F757C347
                E0CDF77D2A8A82DAB6A5A66928CF73721C8720780587A200C15DB008C390B8DE
                8B4F3ABDF198E5335710042C89C05C1268FC95A11054E86B38892609C2344D27
                055996B1E0591254755DF771B905C03361C19724F8C5D094705F8AA4EB3A1634
                92E0294992212031D9C28565599302CFF358702509F64186FB1FF7AFCCA12C4B
                0E7F800345209C42C4B66D165CFEB78933F01845D15A388EE365EF605B102892
                63508D77825799AF0E9C48FF822439330C83782FF8DA4CD364C1390764812CB9
                755D7798FA9D109E14CCC003B8073B9B047F0096F97D1549C998000000004945
                4E44AE426082}
              Kind = bkGlyph
            end>
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.EditMask = '##.###.###/####-##'
          Properties.MaxLength = 0
          TabOrder = 0
          Text = '  .   .   /    -  '
          Width = 140
        end
        object prof_cep: TcxButtonEdit
          Left = 3
          Top = 73
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
            end>
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.EditMask = '99\.999\-999;1;_'
          Properties.MaxLength = 0
          TabOrder = 3
          Text = '  .   -   '
          Width = 140
        end
        object prof_endereco: TcxTextEdit
          Left = 142
          Top = 73
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 90
          TabOrder = 4
          Width = 391
        end
        object prof_numero: TcxTextEdit
          Left = 533
          Top = 73
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 15
          TabOrder = 5
          Width = 110
        end
        object prof_complemento: TcxTextEdit
          Left = 192
          Top = 122
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 45
          TabOrder = 6
          Width = 132
        end
        object prof_bairro: TcxTextEdit
          Left = 3
          Top = 122
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 7
          Width = 190
        end
        object prof_cidade: TcxLookupComboBox
          Left = 323
          Top = 122
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.KeyFieldNames = 'id_cidade'
          Properties.ListColumns = <
            item
              Caption = 'Cidade'
              Width = 290
              FieldName = 'cidade'
            end
            item
              Caption = 'UF'
              Width = 60
              FieldName = 'uf'
            end>
          Properties.ListSource = dsCidade
          EditValue = 0
          TabOrder = 8
          Width = 296
        end
        object prof_razao: TcxTextEdit
          Left = 142
          Top = 24
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 45
          TabOrder = 1
          Width = 391
        end
        object prof_telefone: TcxMaskEdit
          Left = 533
          Top = 24
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.EditMask = '!\(99\)9999-9999;1;_'
          TabOrder = 2
          Text = '(  )    -    '
          Width = 110
        end
        object prof_admissao: TcxDateEdit
          Left = 3
          Top = 171
          Properties.ClearKey = 16452
          Properties.DateButtons = []
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 9
          Width = 111
        end
        object Prof_renda: TcxCurrencyEdit
          Left = 113
          Top = 171
          EditValue = 0.000000000000000000
          Properties.ClearKey = 16452
          Properties.DisplayFormat = '0.00;-0.00'
          TabOrder = 10
          Width = 110
        end
        object prof_profissao: TcxTextEdit
          Left = 222
          Top = 171
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 11
          Width = 210
        end
        object prof_temposervico: TcxTextEdit
          Left = 431
          Top = 171
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 12
          Width = 212
        end
        object cxButtonEdit2: TcxButtonEdit
          Left = 616
          Top = 122
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
          TabOrder = 13
          Width = 27
        end
      end
      object TabReferencia: TcxTabSheet
        AlignWithMargins = True
        Caption = 'Refer'#234'ncias'
        ImageIndex = 3
        TabVisible = False
        object Label39: TLabel
          Left = 3
          Top = 6
          Width = 35
          Height = 17
          Caption = 'Banco'
        end
        object Label40: TLabel
          Left = 287
          Top = 5
          Width = 46
          Height = 17
          Caption = 'Ag'#234'ncia'
        end
        object Label41: TLabel
          Left = 367
          Top = 5
          Width = 34
          Height = 17
          Caption = 'Conta'
        end
        object Label42: TLabel
          Left = 447
          Top = 5
          Width = 49
          Height = 17
          Caption = 'Telefone'
        end
        object Label43: TLabel
          Left = 556
          Top = 5
          Width = 76
          Height = 17
          Caption = 'Tempo conta'
        end
        object Label44: TLabel
          Left = 3
          Top = 86
          Width = 110
          Height = 17
          Caption = 'Refer'#234'ncia pessoal'
        end
        object Label45: TLabel
          Left = 338
          Top = 86
          Width = 49
          Height = 17
          Caption = 'Telefone'
        end
        object Label46: TLabel
          Left = 447
          Top = 86
          Width = 55
          Height = 17
          Caption = 'Afinidade'
        end
        object Label47: TLabel
          Left = 3
          Top = 166
          Width = 121
          Height = 17
          Caption = 'Refer'#234'ncia comercial'
        end
        object Label48: TLabel
          Left = 338
          Top = 166
          Width = 49
          Height = 17
          Caption = 'Telefone'
        end
        object ref_banco1: TcxTextEdit
          Left = 3
          Top = 24
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 0
          Width = 285
        end
        object ref_agencia1: TcxTextEdit
          Left = 287
          Top = 24
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 1
          Width = 81
        end
        object ref_conta1: TcxTextEdit
          Left = 367
          Top = 24
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 2
          Width = 81
        end
        object ref_telefone1: TcxMaskEdit
          Left = 447
          Top = 24
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.EditMask = '!\(99\)9999-9999;1;_'
          TabOrder = 3
          Text = '(  )    -    '
          Width = 110
        end
        object ref_tempo1: TcxTextEdit
          Left = 556
          Top = 24
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 4
          Width = 81
        end
        object ref_banco2: TcxTextEdit
          Left = 3
          Top = 55
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 5
          Width = 285
        end
        object ref_agencia2: TcxTextEdit
          Left = 287
          Top = 55
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 6
          Width = 81
        end
        object ref_conta2: TcxTextEdit
          Left = 367
          Top = 55
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 7
          Width = 81
        end
        object ref_telefone2: TcxMaskEdit
          Left = 447
          Top = 55
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.EditMask = '!\(99\)9999-9999;1;_'
          TabOrder = 8
          Text = '(  )    -    '
          Width = 110
        end
        object ref_tempo2: TcxTextEdit
          Left = 556
          Top = 55
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 9
          Width = 81
        end
        object ref_pessoal1: TcxTextEdit
          Left = 3
          Top = 104
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 10
          Width = 336
        end
        object ref_telefone3: TcxMaskEdit
          Left = 338
          Top = 104
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.EditMask = '!\(99\)9999-9999;1;_'
          TabOrder = 11
          Text = '(  )    -    '
          Width = 110
        end
        object ref_afinidade1: TcxTextEdit
          Left = 447
          Top = 104
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 12
          Width = 190
        end
        object ref_pessoal2: TcxTextEdit
          Left = 3
          Top = 135
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 13
          Width = 336
        end
        object ref_telefone4: TcxMaskEdit
          Left = 338
          Top = 135
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.EditMask = '!\(99\)9999-9999;1;_'
          TabOrder = 14
          Text = '(  )    -    '
          Width = 110
        end
        object ref_afinidade2: TcxTextEdit
          Left = 447
          Top = 135
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 15
          Width = 190
        end
        object ref_comercial1: TcxTextEdit
          Left = 3
          Top = 184
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 16
          Width = 336
        end
        object ref_telefone5: TcxMaskEdit
          Left = 338
          Top = 184
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.EditMask = '!\(99\)9999-9999;1;_'
          TabOrder = 17
          Text = '(  )    -    '
          Width = 110
        end
        object ref_comercial2: TcxTextEdit
          Left = 3
          Top = 215
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 18
          Width = 336
        end
        object ref_telefone6: TcxMaskEdit
          Left = 338
          Top = 215
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.EditMask = '!\(99\)9999-9999;1;_'
          TabOrder = 19
          Text = '(  )    -    '
          Width = 110
        end
      end
      object TabFinanciamento: TcxTabSheet
        Caption = 'Financiamento'
        ImageIndex = 4
        TabVisible = False
        object Label49: TLabel
          Left = 3
          Top = 6
          Width = 89
          Height = 17
          Caption = 'Financiamentos'
        end
        object Label50: TLabel
          Left = 404
          Top = 5
          Width = 23
          Height = 17
          Caption = 'Ano'
        end
        object Label51: TLabel
          Left = 484
          Top = 5
          Width = 54
          Height = 17
          Caption = 'Financiou'
        end
        object Label52: TLabel
          Left = 553
          Top = 5
          Width = 62
          Height = 17
          Caption = 'Vlr Parcela'
        end
        object Label53: TLabel
          Left = 3
          Top = 148
          Width = 123
          Height = 17
          Caption = 'Outras propriedades'
        end
        object fin_veiculo1: TcxTextEdit
          Left = 3
          Top = 24
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 0
          Width = 402
        end
        object fin_ano1: TcxTextEdit
          Left = 404
          Top = 24
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 1
          Width = 81
        end
        object fin_financio1: TcxComboBox
          Left = 484
          Top = 24
          Properties.DropDownListStyle = lsEditFixedList
          Properties.Items.Strings = (
            'SIM'
            'N'#195'O')
          TabOrder = 2
          Text = 'N'#195'O'
          Width = 70
        end
        object fin_parcela1: TcxCurrencyEdit
          Left = 553
          Top = 24
          EditValue = 0.000000000000000000
          Properties.ClearKey = 16452
          Properties.DisplayFormat = '0.00;-0.00'
          TabOrder = 3
          Width = 90
        end
        object fin_veiculo2: TcxTextEdit
          Left = 3
          Top = 55
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 4
          Width = 402
        end
        object fin_ano2: TcxTextEdit
          Left = 404
          Top = 55
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 5
          Width = 81
        end
        object fin_financio2: TcxComboBox
          Left = 484
          Top = 55
          Properties.DropDownListStyle = lsEditFixedList
          Properties.Items.Strings = (
            'SIM'
            'N'#195'O')
          TabOrder = 6
          Text = 'N'#195'O'
          Width = 70
        end
        object fin_parcela2: TcxCurrencyEdit
          Left = 553
          Top = 55
          EditValue = 0.000000000000000000
          Properties.ClearKey = 16452
          Properties.DisplayFormat = '0.00;-0.00'
          TabOrder = 7
          Width = 90
        end
        object fin_veiculo3: TcxTextEdit
          Left = 3
          Top = 86
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 8
          Width = 402
        end
        object fin_ano3: TcxTextEdit
          Left = 404
          Top = 86
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 9
          Width = 81
        end
        object fin_financio3: TcxComboBox
          Left = 484
          Top = 86
          Properties.DropDownListStyle = lsEditFixedList
          Properties.Items.Strings = (
            'SIM'
            'N'#195'O')
          TabOrder = 10
          Text = 'N'#195'O'
          Width = 70
        end
        object fin_parcela3: TcxCurrencyEdit
          Left = 553
          Top = 86
          EditValue = 0.000000000000000000
          Properties.ClearKey = 16452
          Properties.DisplayFormat = '0.00;-0.00'
          TabOrder = 11
          Width = 90
        end
        object fin_veiculo4: TcxTextEdit
          Left = 3
          Top = 117
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 12
          Width = 402
        end
        object fin_ano4: TcxTextEdit
          Left = 404
          Top = 117
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 13
          Width = 81
        end
        object fin_financio4: TcxComboBox
          Left = 484
          Top = 117
          Properties.DropDownListStyle = lsEditFixedList
          Properties.Items.Strings = (
            'SIM'
            'N'#195'O')
          TabOrder = 14
          Text = 'N'#195'O'
          Width = 70
        end
        object fin_parcela4: TcxCurrencyEdit
          Left = 553
          Top = 117
          EditValue = 0.000000000000000000
          Properties.ClearKey = 16452
          Properties.DisplayFormat = '0.00;-0.00'
          TabOrder = 15
          Width = 90
        end
        object fin_outros: TcxTextEdit
          Left = 3
          Top = 166
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.MaxLength = 60
          TabOrder = 16
          Width = 640
        end
      end
      object TabOperacoes: TcxTabSheet
        Caption = 'Opera'#231#245'es'
        ImageIndex = 5
        TabVisible = False
        object cxGrid: TcxGrid
          Left = 0
          Top = 0
          Width = 646
          Height = 475
          Align = alClient
          TabOrder = 0
          object Grid: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            ScrollbarAnnotations.CustomAnnotations = <>
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsCustomize.ColumnExpressionEditing = True
            OptionsCustomize.ColumnHiding = True
            OptionsCustomize.ColumnsQuickCustomization = True
            OptionsCustomize.ColumnsQuickCustomizationMaxDropDownCount = 1
            OptionsCustomize.ColumnsQuickCustomizationReordering = qcrEnabled
            OptionsCustomize.ColumnsQuickCustomizationSorted = True
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o>'
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
          end
          object cxGridLevel1: TcxGridLevel
            GridView = Grid
          end
        end
      end
    end
  end
  inherited Paneltitulo: TPanel
    TabOrder = 2
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 504
    Top = 2
  end
  inherited Ds: TUniDataSource
    Left = 464
    Top = 0
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
  object dsCidade: TUniDataSource
    DataSet = TabCidade
    Left = 288
    Top = 65535
  end
  object TabCidade: TClientDataSet
    PersistDataPacket.Data = {
      7A0000009619E0BD0100000018000000040000000000030000007A000969645F
      6369646164650400010000000000066369646164650100490000000100055749
      44544802000200A0000275660100490000000100055749445448020002000200
      076E636964616465010049000000010005574944544802000200C8000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 248
    object TabCidadeid_cidade: TIntegerField
      FieldName = 'id_cidade'
    end
    object TabCidadecidade: TStringField
      FieldName = 'cidade'
      Size = 160
    end
    object TabCidadeuf: TStringField
      FieldName = 'uf'
      Size = 2
    end
    object TabCidadencidade: TStringField
      FieldName = 'ncidade'
      Size = 200
    end
  end
  object ACBrValidador1: TACBrValidador
    IgnorarChar = './-'
    PermiteVazio = True
    Left = 400
    Top = 16
  end
end
