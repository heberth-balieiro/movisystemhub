inherited FrmRecpOrdemServico: TFrmRecpOrdemServico
  Caption = 'O.S'
  ClientHeight = 590
  ClientWidth = 630
  OnShow = FormShow
  ExplicitWidth = 630
  ExplicitHeight = 590
  TextHeight = 17
  object lbrascunho: TLabel [0]
    Left = 8
    Top = 566
    Width = 56
    Height = 17
    Caption = 'Rascunho'
    Visible = False
  end
  object Label14: TLabel [1]
    Left = 141
    Top = 544
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
  object Label18: TLabel [2]
    Left = 141
    Top = 566
    Width = 127
    Height = 17
    Caption = 'F3 - Cadastro pessoa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Panel2: TPanel
    Left = 512
    Top = 542
    ExplicitLeft = 512
    ExplicitTop = 542
  end
  inherited Panel1: TPanel
    Left = 390
    Top = 542
    ExplicitLeft = 390
    ExplicitTop = 542
  end
  inherited Paneltitulo: TPanel
    Width = 630
    inherited lblTitulo: TLabel
      Width = 615
      Caption = 'Abertura de Ordem de Servi'#231'o'
      ExplicitWidth = 615
    end
  end
  inherited cxGroupBox1: TcxGroupBox
    Style.BorderStyle = ebsUltraFlat
    ExplicitWidth = 630
    ExplicitHeight = 486
    Height = 486
    Width = 630
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 48
      Height = 17
      Caption = 'N'#250'mero'
    end
    object Label2: TLabel
      Left = 94
      Top = 6
      Width = 27
      Height = 17
      Caption = 'Data'
    end
    object Label3: TLabel
      Left = 192
      Top = 6
      Width = 29
      Height = 17
      Caption = 'Hora'
    end
    object Label4: TLabel
      Left = 255
      Top = 6
      Width = 35
      Height = 17
      Caption = 'Status'
    end
    object Label5: TLabel
      Left = 388
      Top = 6
      Width = 61
      Height = 17
      Caption = 'Prioridade'
    end
    object Label6: TLabel
      Left = 461
      Top = 6
      Width = 49
      Height = 17
      Caption = 'Garantia'
    end
    object Label7: TLabel
      Left = 8
      Top = 55
      Width = 50
      Height = 17
      Caption = 'Pessoa *'
    end
    object Label8: TLabel
      Left = 529
      Top = 6
      Width = 50
      Height = 17
      Caption = 'Tipo O.S'
    end
    object Label12: TLabel
      Left = 8
      Top = 333
      Width = 70
      Height = 17
      Caption = 'Observa'#231#227'o'
    end
    object Label19: TLabel
      Left = 513
      Top = 56
      Width = 49
      Height = 17
      Caption = 'Telefone'
    end
    object edtNumero: TcxTextEdit
      Left = 8
      Top = 24
      Properties.CharCase = ecUpperCase
      TabOrder = 0
      Width = 80
    end
    object edtData: TcxDateEdit
      Left = 94
      Top = 24
      EditValue = 0d
      Properties.ClearKey = 16452
      Properties.DateButtons = []
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 92
    end
    object edtHora: TcxTimeEdit
      Left = 192
      Top = 24
      Properties.ClearKey = 16452
      Properties.ImmediatePost = True
      Properties.TimeFormat = tfHourMin
      TabOrder = 2
      Width = 57
    end
    object EdtStatus: TcxComboBox
      Left = 255
      Top = 24
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Aberta'
        'Aguardando Aprova'#231#227'o'
        'Aprovada'
        'Em Execu'#231#227'o'
        'Finalizada'
        'Cancelada')
      Properties.ReadOnly = True
      TabOrder = 3
      Text = 'Aberta'
      Width = 127
    end
    object EdtPrioridade: TcxComboBox
      Left = 388
      Top = 24
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Alta'
        'M'#233'dia'
        'Baixa')
      TabOrder = 4
      Text = 'M'#233'dia'
      Width = 67
    end
    object EdtGarantia: TcxComboBox
      Left = 461
      Top = 24
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Sim'
        'N'#227'o')
      TabOrder = 5
      Text = 'N'#227'o'
      Width = 62
    end
    object edtCliente: TcxLookupComboBox
      Left = 8
      Top = 74
      Properties.CaseSensitiveSearch = True
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id_socio'
      Properties.ListColumns = <
        item
          Caption = 'Cliente'
          FieldName = 'cliente'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = dsPessoa
      Properties.OnEditValueChanged = edtClientePropertiesEditValueChanged
      EditValue = 0
      TabOrder = 7
      OnExit = edtClienteExit
      Width = 447
    end
    object BtnCliNovo: TcxButtonEdit
      Left = 480
      Top = 74
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
      Properties.OnButtonClick = BtnCliNovoPropertiesButtonClick
      Style.BorderStyle = ebsFlat
      Style.HotTrack = True
      Style.Shadow = False
      Style.TransparentBorder = True
      Style.ButtonStyle = btsDefault
      TabOrder = 9
      Width = 27
    end
    object EdtTipoOS: TcxComboBox
      Left = 529
      Top = 24
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Or'#231'amento'
        'Execu'#231#227'o direta'
        'Retorno'
        'Garantia'
        'Instala'#231#227'o'
        'Laudo t'#233'cnico')
      TabOrder = 6
      Text = 'Or'#231'amento'
      Width = 93
    end
    object cxGroupBox2: TcxGroupBox
      Left = 8
      Top = 105
      Caption = 'Equipamento'
      Style.TextStyle = [fsBold]
      TabOrder = 11
      Height = 222
      Width = 614
      object Label10: TLabel
        Left = 453
        Top = 67
        Width = 74
        Height = 17
        Caption = 'Estado geral'
      end
      object Label15: TLabel
        Left = 7
        Top = 19
        Width = 147
        Height = 17
        Caption = 'Descri'#231#227'o equipamento *'
      end
      object Label16: TLabel
        Left = 7
        Top = 67
        Width = 108
        Height = 17
        Caption = 'Defeito reclamado'
      end
      object Label17: TLabel
        Left = 7
        Top = 115
        Width = 28
        Height = 17
        Caption = 'Foto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdtEstado: TcxComboBox
        Left = 453
        Top = 84
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
        TabOrder = 3
        Text = 'Regular'
        Width = 153
      end
      object Edt_DescEquipamento: TcxLookupComboBox
        Left = 7
        Top = 36
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ImmediatePost = True
        Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
        Properties.KeyFieldNames = 'id_produto'
        Properties.ListColumns = <
          item
            FieldName = 'nmcompleto'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = Dsequipamento
        EditValue = 0
        TabOrder = 0
        Width = 573
      end
      object edtDefeito: TcxBlobEdit
        Left = 7
        Top = 84
        Properties.BlobEditKind = bekMemo
        Properties.ClearKey = 16452
        Properties.PopupHeight = 180
        Properties.PopupWidth = 440
        TabOrder = 2
        Width = 440
      end
      object BtnEquipNovo: TcxButtonEdit
        Left = 579
        Top = 36
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
        Properties.OnButtonClick = BtnEquipNovoPropertiesButtonClick
        Style.BorderStyle = ebsFlat
        Style.HotTrack = True
        Style.Shadow = False
        Style.TransparentBorder = True
        Style.ButtonStyle = btsDefault
        TabOrder = 1
        Width = 27
      end
      object btnAnexoNovo: TcxButtonEdit
        Left = 579
        Top = 132
        Cursor = crHandPoint
        Properties.Buttons = <
          item
            Default = True
            Glyph.SourceDPI = 96
            Glyph.Data = {
              89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
              610000001974455874536F6674776172650041646F626520496D616765526561
              647971C9653C0000002A744558745469746C6500496D706F72743B496D616765
              3B496D706F7274496D6167653B6578706F72743B73617665A6111864000000BA
              49444154785E95903D0A02311046F74E9EC353081EC1C2620BED0C08CA82B595
              959D88A56E2122820AE96CB4591BFF41B6FCCC0E4C331093F9E091EA3D862400
              D4D43B0B386A8E245660BA8EA5031CD104760E484830C6C047B56C6649686639
              212FA0C0BF35062BB4C75BE4B6C0ED53927C2ADEA8DCA8406F7A806771017B79
              E07B9EA3BCAEC123273240F27D93E2B9EFEB03CCEB380C5E401FD39A8CE8F5CF
              1F2099E188362023F232558025190D04C278032A64005A38F0031CEA346BA31D
              4E690000000049454E44AE426082}
            Kind = bkGlyph
          end>
        Properties.CaseInsensitive = False
        Properties.IncrementalSearch = False
        Properties.ViewStyle = vsButtonsOnly
        Properties.OnButtonClick = BtnEquipNovoPropertiesButtonClick
        Style.BorderStyle = ebsFlat
        Style.HotTrack = True
        Style.Shadow = False
        Style.TransparentBorder = True
        Style.ButtonStyle = btsDefault
        TabOrder = 4
        OnClick = btnAnexoNovoClick
        Width = 27
      end
      object btnAnexoExcluir: TcxButtonEdit
        Left = 579
        Top = 163
        Cursor = crHandPoint
        Properties.Buttons = <
          item
            Default = True
            Glyph.SourceDPI = 96
            Glyph.Data = {
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
            Kind = bkGlyph
          end>
        Properties.CaseInsensitive = False
        Properties.IncrementalSearch = False
        Properties.ViewStyle = vsButtonsOnly
        Properties.OnButtonClick = btnAnexoExcluirPropertiesButtonClick
        Style.BorderStyle = ebsFlat
        Style.HotTrack = True
        Style.Shadow = False
        Style.TransparentBorder = True
        Style.ButtonStyle = btsDefault
        TabOrder = 5
        Width = 27
      end
      object FlowPanel1: TFlowPanel
        Left = 7
        Top = 135
        Width = 566
        Height = 84
        Alignment = taLeftJustify
        BevelOuter = bvNone
        TabOrder = 6
      end
    end
    object cxGroupBox3: TcxGroupBox
      AlignWithMargins = True
      Left = 10
      Top = 409
      Margins.Left = 6
      Margins.Right = 6
      Align = alBottom
      TabOrder = 12
      Height = 70
      Width = 610
      object Label13: TLabel
        Left = 7
        Top = 15
        Width = 98
        Height = 17
        Caption = 'Previs'#227'o entrega'
      end
      object Label11: TLabel
        Left = 113
        Top = 15
        Width = 77
        Height = 17
        Caption = 'Garantia final'
      end
      object Label9: TLabel
        Left = 226
        Top = 15
        Width = 52
        Height = 17
        Caption = 'T'#233'cnico *'
      end
      object EdtPrevisao: TcxDateEdit
        Left = 7
        Top = 33
        Properties.ClearKey = 16452
        Properties.DateButtons = []
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 0
        Width = 100
      end
      object EdtGarantiaFinal: TcxDateEdit
        Left = 113
        Top = 33
        Properties.ClearKey = 16452
        Properties.DateButtons = []
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 1
        Width = 107
      end
      object EdtTecnico: TcxLookupComboBox
        Left = 226
        Top = 33
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ImmediatePost = True
        Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
        Properties.KeyFieldNames = 'id_funcionario'
        Properties.ListColumns = <
          item
            FieldName = 'func'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dsResponsavel
        EditValue = 0
        TabOrder = 2
        Width = 226
      end
      object BtnTecNovo: TcxButtonEdit
        Left = 451
        Top = 33
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
        Properties.OnButtonClick = BtnTecNovoPropertiesButtonClick
        Style.BorderStyle = ebsFlat
        Style.HotTrack = True
        Style.Shadow = False
        Style.TransparentBorder = True
        Style.ButtonStyle = btsDefault
        TabOrder = 3
        Width = 27
      end
    end
    object edtObs: TcxMemo
      Left = 8
      Top = 350
      Properties.ClearKey = 16452
      TabOrder = 13
      Height = 61
      Width = 614
    end
    object BtnCliVisualizar: TcxButtonEdit
      Left = 454
      Top = 74
      Cursor = crHandPoint
      TabStop = False
      Properties.Buttons = <
        item
          Default = True
          Glyph.SourceDPI = 96
          Glyph.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            6100000013744558745469746C6500507265766965773B5072696E749891A1F3
            0000028649444154785E6D915D48D45918C67FE73FA3A649F481F6A1F831D137
            A34562D85E440EA8A0D48D15425DB4D2D645D04D52BB4B73951521E145484448
            A44412151951BB62178991659F1F7AA146C85C2CACB84BECEC7CFCCF396FC330
            CC20CE73F13EE7C0737E3C2FC72B220074F58E0F23520F200822A0002BC98988
            02B1080A30CF7E3DBE3B00E025256B6C7DC7B15A001052926C573A7B5ED4032C
            0068B1E9802099736A480687D19645001337E9C791A8414430364511050EE4E7
            7900D0C66401680308D60A7FCF7FE7CED30F4CCDCE6145F095ACE4606335656B
            57E02887989BA5816B6C321CFAEB5F823D43F8FC1BD9DBBA030798FA3243F0EA
            1382C70394971663B4CEDE4044E87F344EA57F03B575DBD8BE3A87E97943D4BF
            152596BEC1D79C39D6905C61F8FC1EAC910C20EE1A8CB1BC9D0CD1FA4B1DFE62
            2F112DE4E740382ED4D46CA2FBD218AE4EE6926E139E5921D5C0755D1C84AFFF
            180A721413733A0151E42A857135565BB4B1C45DBDB0813106506CA928E2F3F8
            04E19DDB89C42D4B721D5617787833F68192C2309158145FD972DC2F6631C051
            8AB6961ACE5E19C4EB51EC4CD4CE4DF8FBB149869E3CE7544D88A9A11B94AF69
            A2F5C4B8D3FF73954D03B405E538097A315D1DFBB93E3042F7D00B442CABD43C
            ED953334057E62E2E53B66DFDD06283CDCFBF1BF85BF00388E97D275459C3BB9
            0FAD355A1B62B138A3372FF3FCC19F045A7661A39FB8D0BCBEF3B7C73367D200
            ABCD1FED1DF71BAD80A34044B0024A099B7D455456B531F2B80773EF190DCDD5
            BC1A7E7F12389706DCEA3ED04446F41DAD6274641A0166510467FE778065872A
            965E7C78F7ED8998C7B906B85EB20B3766D0A270E306048E94E6D9BE50ECFBC0
            B7F069E077200E447F00A25E564DD5AF61520000000049454E44AE426082}
          Kind = bkGlyph
        end>
      Properties.CaseInsensitive = False
      Properties.IncrementalSearch = False
      Properties.ViewStyle = vsButtonsOnly
      Properties.OnButtonClick = BtnCliVisualizarPropertiesButtonClick
      Style.BorderStyle = ebsFlat
      Style.HotTrack = True
      Style.Shadow = False
      Style.TransparentBorder = True
      Style.ButtonStyle = btsDefault
      TabOrder = 8
      Width = 27
    end
    object edtwhats: TcxMaskEdit
      Left = 513
      Top = 74
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.EditMask = '!\(99\)99999-9999;1;_'
      TabOrder = 10
      Text = '(  )     -    '
      Width = 109
    end
  end
  object EdtSeguenciaEquip: TcxCheckBox [7]
    Left = 8
    Top = 542
    Caption = 'Mais equipamento'
    Properties.ClearKey = 16452
    Properties.DisplayChecked = 'A'
    Properties.DisplayUnchecked = 'F'
    Properties.ImmediatePost = True
    Properties.NullStyle = nssUnchecked
    Properties.ValueChecked = 'A'
    Properties.ValueUnchecked = 'F'
    Style.TransparentBorder = False
    TabOrder = 4
    Transparent = True
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 0
    Top = 554
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
    Left = 448
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
  object dsPessoa: TUniDataSource
    DataSet = TabCliente
    Left = 520
    Top = 8
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
    Left = 368
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
  object dsResponsavel: TUniDataSource
    DataSet = TabVendedor
    Left = 368
  end
  object TabEquipamento: TClientDataSet
    PersistDataPacket.Data = {
      D80000009619E0BD010000001800000007000000000003000000D8000A69645F
      70726F6475746F040001000000000006636F6469676F04000100000000000C6E
      756D65726F5F73657269650100490000000100055749445448020002002D000E
      6E756D5F70617472696D6F6E696F010049000000010005574944544802000200
      2D00076E6D6D617263610100490000000100055749445448020002003C00086E
      6D6D6F64656C6F0100490000000100055749445448020002003C000A6E6D636F
      6D706C65746F01004900000001000557494454480200020096000000}
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
        Name = 'numero_serie'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'num_patrimonio'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'nmmarca'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'nmmodelo'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'nmcompleto'
        DataType = ftString
        Size = 150
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 368
    Top = 560
    object TabEquipamentoid_produto: TIntegerField
      FieldName = 'id_produto'
    end
    object TabEquipamentocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabEquipamentonumero_serie: TStringField
      FieldName = 'numero_serie'
      Size = 45
    end
    object TabEquipamentonum_patrimonio: TStringField
      FieldName = 'num_patrimonio'
      Size = 45
    end
    object TabEquipamentomarca: TStringField
      FieldName = 'nmmarca'
      Size = 60
    end
    object TabEquipamentonmmodelo: TStringField
      FieldName = 'nmmodelo'
      Size = 60
    end
    object TabEquipamentonmcompleto: TStringField
      FieldName = 'nmcompleto'
      Size = 150
    end
  end
  object Dsequipamento: TUniDataSource
    DataSet = TabEquipamento
    Left = 368
    Top = 560
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 368
    Top = 568
  end
end
