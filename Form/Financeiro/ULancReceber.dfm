inherited FrmLancReceber: TFrmLancReceber
  Caption = 'Receber'
  ClientHeight = 703
  OnShow = FormShow
  ExplicitLeft = 3
  ExplicitTop = 3
  ExplicitHeight = 703
  TextHeight = 17
  inherited Label27: TLabel
    Top = 655
    ExplicitTop = 655
  end
  inherited Panel2: TPanel
    Left = 512
    Top = 656
    ExplicitLeft = 512
    ExplicitTop = 656
  end
  inherited Panel1: TPanel
    Left = 390
    Top = 656
    ExplicitLeft = 390
    ExplicitTop = 656
  end
  inherited Paneltitulo: TPanel
    inherited lblTitulo: TLabel
      Caption = 'Lan'#231'amento de T'#237'tulo'
    end
  end
  inherited cxGroupBox1: TcxGroupBox
    ExplicitHeight = 600
    Height = 600
    inherited Label1: TLabel
      Top = 2
      Width = 51
      Caption = 'Empresa'
      ExplicitTop = 2
      ExplicitWidth = 51
    end
    inherited Label4: TLabel
      Left = 8
      Top = 150
      Width = 76
      Caption = 'Documento *'
      ExplicitLeft = 8
      ExplicitTop = 150
      ExplicitWidth = 76
    end
    object Label2: TLabel [2]
      Left = 436
      Top = 52
      Width = 76
      Height = 17
      Caption = 'Vencimento *'
    end
    object Label7: TLabel [3]
      Left = 8
      Top = 101
      Width = 50
      Height = 17
      Caption = 'Pessoa *'
    end
    object Label3: TLabel [4]
      Left = 340
      Top = 52
      Width = 79
      Height = 17
      Caption = 'Data Emiss'#227'o'
    end
    object Label5: TLabel [5]
      Left = 392
      Top = 150
      Width = 48
      Height = 17
      Caption = 'N'#250'mero'
    end
    object Label6: TLabel [6]
      Left = 524
      Top = 150
      Width = 39
      Height = 17
      Caption = 'Valor *'
    end
    object Label8: TLabel [7]
      Left = 8
      Top = 199
      Width = 52
      Height = 17
      Caption = 'Hist'#243'rico'
    end
    object Label9: TLabel [8]
      Left = 8
      Top = 51
      Width = 62
      Height = 17
      Caption = 'Natureza *'
    end
    object Label10: TLabel [9]
      Left = 7
      Top = 439
      Width = 84
      Height = 17
      Caption = 'Qtde. Parcelas'
    end
    object Label11: TLabel [10]
      Left = 8
      Top = 273
      Width = 95
      Height = 17
      Caption = 'Plano de Contas'
    end
    object Label12: TLabel [11]
      Left = 258
      Top = 273
      Width = 95
      Height = 17
      Caption = 'Centro de Custo'
    end
    object Label14: TLabel [12]
      Left = 473
      Top = 273
      Width = 68
      Height = 17
      Caption = 'Valor rateio'
    end
    object Label15: TLabel [13]
      Left = 532
      Top = 51
      Width = 76
      Height = 17
      Caption = 'Compet'#234'ncia'
    end
    inherited edtcodigo: TcxTextEdit
      Left = 392
      Top = 168
      TabOrder = 7
      ExplicitLeft = 392
      ExplicitTop = 168
      ExplicitWidth = 126
      ExplicitHeight = 25
      Width = 126
    end
    inherited edtDescricao: TcxTextEdit
      Left = 225
      Top = 3
      TabOrder = 19
      Visible = False
      ExplicitLeft = 225
      ExplicitTop = 3
      ExplicitWidth = 41
      ExplicitHeight = 25
      Width = 41
    end
    inherited edtativo: TcxCheckBox
      Left = 225
      Top = -3
      Caption = '.'
      TabOrder = 20
      Visible = False
      ExplicitLeft = 225
      ExplicitTop = -3
      ExplicitWidth = 18
    end
    object edtDataemissao: TcxDateEdit
      Left = 340
      Top = 70
      EditValue = 0d
      Properties.ClearKey = 16452
      Properties.DateButtons = []
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 2
      Width = 90
    end
    object edtdatavencimento: TcxDateEdit
      Left = 436
      Top = 70
      EditValue = 0d
      Properties.ClearKey = 16452
      Properties.DateButtons = []
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 3
      Width = 90
    end
    object edtPessoa: TcxLookupComboBox
      Left = 8
      Top = 119
      Properties.CaseSensitiveSearch = True
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownWidth = 614
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
      EditValue = 0
      TabOrder = 5
      Width = 562
    end
    object BtnCliVisualizar: TcxButtonEdit
      Left = 569
      Top = 119
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
      Style.BorderStyle = ebsFlat
      Style.HotTrack = True
      Style.Shadow = False
      Style.TransparentBorder = True
      Style.ButtonStyle = btsDefault
      TabOrder = 21
      Width = 27
    end
    object BtnCliNovo: TcxButtonEdit
      Left = 595
      Top = 119
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
      Style.BorderStyle = ebsFlat
      Style.HotTrack = True
      Style.Shadow = False
      Style.TransparentBorder = True
      Style.ButtonStyle = btsDefault
      TabOrder = 22
      Width = 27
    end
    object edtEmpresa: TcxLookupComboBox
      Left = 8
      Top = 20
      Properties.CaseSensitiveSearch = True
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id_empresa'
      Properties.ListColumns = <
        item
          FieldName = 'empresa'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = dsEmpresa
      Properties.ReadOnly = False
      EditValue = 0
      TabOrder = 0
      Width = 614
    end
    object edtDoc: TcxLookupComboBox
      Left = 8
      Top = 168
      Properties.CaseSensitiveSearch = True
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownWidth = 378
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id_documento'
      Properties.ListColumns = <
        item
          FieldName = 'doc'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = dsDoc
      EditValue = 0
      TabOrder = 6
      Width = 326
    end
    object edtvalortotal: TcxCurrencyEdit
      Left = 524
      Top = 168
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
      TabOrder = 8
      Width = 98
    end
    object btnDocPesq: TcxButtonEdit
      Left = 333
      Top = 168
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
      Style.BorderStyle = ebsFlat
      Style.HotTrack = True
      Style.Shadow = False
      Style.TransparentBorder = True
      Style.ButtonStyle = btsDefault
      TabOrder = 23
      Width = 27
    end
    object btnDocIncluir: TcxButtonEdit
      Left = 359
      Top = 168
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
      Style.BorderStyle = ebsFlat
      Style.HotTrack = True
      Style.Shadow = False
      Style.TransparentBorder = True
      Style.ButtonStyle = btsDefault
      TabOrder = 24
      Width = 27
    end
    object edtNatureza: TcxLookupComboBox
      Left = 8
      Top = 70
      Properties.CaseSensitiveSearch = True
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownWidth = 614
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id_natureza'
      Properties.ListColumns = <
        item
          FieldName = 'natureza'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = dsNatureza
      EditValue = 0
      TabOrder = 1
      Width = 326
    end
    object edtHistorico: TcxMemo
      Left = 8
      Top = 217
      TabOrder = 9
      Height = 50
      Width = 614
    end
    object cxGrid: TcxGrid
      Left = 2
      Top = 489
      Width = 626
      Height = 109
      Align = alBottom
      TabOrder = 25
      ExplicitTop = 488
      object ViewParcelas: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = dsParcela
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            FieldName = 'id_eleicao'
            Column = CollVencimento
          end
          item
            Format = 'R$ #,##0.00'
            Kind = skSum
            FieldName = 'valororiginal'
            Column = collValor
            DisplayText = 'R$ #,##0.00'
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.NoDataToDisplayInfoText = 'Nenhuma pacela gerada'
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = FrmPrincipal.CxGridPedido
        object CollVencimento: TcxGridDBColumn
          Caption = 'Vencimento'
          DataBinding.FieldName = 'data_vencimento'
          Options.Editing = False
          Width = 86
        end
        object collDoc: TcxGridDBColumn
          Caption = 'N'#250'mero'
          DataBinding.FieldName = 'doc'
          Width = 117
        end
        object ViewParcelasColumn1: TcxGridDBColumn
          Caption = 'Parcela'
          DataBinding.FieldName = 'parcela'
          Options.Editing = False
          Width = 60
        end
        object collParcela: TcxGridDBColumn
          Caption = 'Documento'
          DataBinding.FieldName = 'ndoc'
          Options.Editing = False
          Width = 257
        end
        object collValor: TcxGridDBColumn
          Caption = 'Valor'
          DataBinding.FieldName = 'valororiginal'
          Options.Editing = False
          Width = 104
        end
      end
      object cxGridParcelas: TcxGridLevel
        GridView = ViewParcelas
      end
    end
    object edtParcela: TcxSpinEdit
      Left = 7
      Top = 457
      Properties.MinValue = 1.000000000000000000
      TabOrder = 15
      Value = 1
      Width = 84
    end
    object cxbuttonIncluir: TcxButton
      Left = 97
      Top = 457
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
      TabOrder = 16
      OnClick = cxbuttonIncluirClick
    end
    object cxButtonLimpar: TcxButton
      Left = 193
      Top = 457
      Width = 90
      Height = 25
      Cursor = crHandPoint
      Caption = 'Limpar'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        6100000025744558745469746C6500436C6561723B45726173653B52656D6F76
        653B426172733B526962626F6E3B878083730000027C49444154785EA5916D48
        535118C76F3ADDCC46567E308922CB4C9170A691961A4C918DA052D05E2C5748
        362DCD8C9A9A56BE52A894647EC9966D830A254CD7B4146A443170E6CB6C335F
        6A628911A4CE5B98B57FE75EBCB2B420E8811FCFE11C7EFF07CE43FD632D2138
        137804A74582FEF81EEA7DD949EA5D493A355C92460D15CBA9C1223935507882
        935D8C0A59656FDE3163B33C7E171364CA394AF52A64145B6DC9520AC04238D9
        D5909D74DB6E1B0008E6E2745A9324896642D977A6AA0B2AFE26F35F64242A7F
        4E5840EB6A09B7609FEC474F69269D1FEC17CB84B301D99A377F9205EDA97177
        7E7C36817E54836902DD5483D9D10EBC4D96E28178EBD7AC8075522E60A1ECA6
        93EDAE9B1D7B0D5B4315A61BAE13AAF07DF825068E4830785802F3C158DC08F6
        9D6003B254264779E9C3FD317767460CB0DD2B2754B07DC6F20CFD89D1E84F10
        13A2A19784E1928FB79E0D38A5ECE2647759659BAAC73A8E29551926D5656CFF
        D6D58ABEBD917344411F138ACBEBBD7AB6B8F37DB84D3A31F2A12B3AF5F3111A
        F9CDE368B9AFC5A4B210B4A111DD645AB7349CF470B44705E1C21ACF5E7F81AB
        2FB3096EF2B284E226CDD3A12956E6B07676A3531C022381E94FC20271DECBC3
        E4C7E76D725CA3605F417D6D93F9CB6FB2DAF80991795A942665A3234A849650
        7F9CF514F66D74E1F97132B9A79812C615B5DA721B3FCECBB5AFC61091FB98A0
        65C98B97E3F40AF7BE0D3CE7CDCCEE39990B1044A45C531C28D7DBCFD55B7153
        3F8A1D395AEC9C23EC4C0344C9D596D5C255018E3207F7814251C2C5B4C80CF5
        87F0740DB6CB55D8965A879014E56C60E255DDF2B541F39333DD5C28471CB7E0
        465849F0227833CC9D3D1C3F6C1100FE8B5F5E8AB24DCA40F5DB000000004945
        4E44AE426082}
      OptionsImage.Spacing = 3
      TabOrder = 17
      OnClick = cxButtonLimparClick
    end
    object edtPlano: TcxLookupComboBox
      Left = 8
      Top = 291
      Properties.CaseSensitiveSearch = True
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownWidth = 614
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id_planoconta'
      Properties.ListColumns = <
        item
          FieldName = 'plano'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = dsPlano
      EditValue = 0
      TabOrder = 10
      Width = 244
    end
    object edtCusto: TcxLookupComboBox
      Left = 258
      Top = 291
      Properties.CaseSensitiveSearch = True
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownWidth = 364
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id_custo'
      Properties.ListColumns = <
        item
          FieldName = 'custo'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = dsCusto
      EditValue = 0
      TabOrder = 11
      Width = 209
    end
    object edtvalorcaixa: TcxCurrencyEdit
      Left = 473
      Top = 291
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
      TabOrder = 12
      Width = 90
    end
    object cxGridCaixa: TcxGrid
      Left = 8
      Top = 322
      Width = 614
      Height = 111
      TabOrder = 14
      object cxGridDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = dsCaixa
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'R$ #,##0.00'
            Kind = skSum
            FieldName = 'valor'
            Column = cxGridDBColumnValor
            DisplayText = 'R$ #,##0.00'
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.NoDataToDisplayInfoText = 'Nenhum registro inserido'
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = FrmPrincipal.CxGridPedido
        object cxGridDBColumnPlano: TcxGridDBColumn
          Caption = 'Plano'
          DataBinding.FieldName = 'plano'
          Width = 316
        end
        object cxGridDBColumnCusto: TcxGridDBColumn
          Caption = 'Custo'
          DataBinding.FieldName = 'custo'
          Width = 185
        end
        object cxGridDBColumnValor: TcxGridDBColumn
          Caption = 'Valor'
          DataBinding.FieldName = 'valor'
          Width = 111
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
    object cxButtonExcluir: TcxButtonEdit
      Left = 595
      Top = 291
      Cursor = crHandPoint
      TabStop = False
      Properties.Buttons = <
        item
          Default = True
          Glyph.SourceDPI = 96
          Glyph.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            6100000023744558745469746C650043616E63656C3B53746F703B457869743B
            426172733B526962626F6E3B4C9696B20000038849444154785E1D906B4C5367
            18C7FF3DBD40CB1A2E32B55C9D598B4CA675D8D13836652E9B0359B67D589665
            3259E644A52571644474CB4CB6ECC23770C4449DD38D2885005E4683AB69C616
            8DA12384264EC8AAAC0C9149A1175ACEE9E939CFDE9EE7E477F2CBFFB924E720
            E6E943CC3B8895D12B00A0FEE3D08167A75A5BBAEEB71D9D081E6B4DA549FBDD
            A3CEEFDD1F3658016818AA98A71FD1915E202DE980A19D741E3EF6E0F8A7FC7F
            673B6979E002C5BC43B4C2581EB8480BE7BA68E6441BEF3B72F03300990C8E1D
            5016554E7B55D6C1ED9543C6C2B5BB739FDF025988838424E4240F10A0D2EAA0
            D26540AD37203CFE17C2C187A3EDBFDE7CF3DAD4748403A06EA8A8E830AC5FB3
            3B7BAB1901B717AE23DFE1CEC5EBEC90A0E0EB71A3CFD981C0B017C6F252180B
            D6BD74BCFA856E003A0CBDFD966DF250532AD4FF038DB734D18557DF21CFB08F
            2E37B5D370ED5E72D7D52BEEF9654CE9F91C1FD392EB0C4D3A0E4BE7F6ECD909
            CFDEFAD381AF4ED0A3D35FD399E272BA3F3D478F971234FD2044BDCE930AF798
            CF2FAED0DF5373CACCFCA92F2970B29DDCAFD7F56B48945E918201C41738945A
            2D581C7461ADA3192AB50AD64F9A010272730CC8D4AA313BE44289D58CF85D3F
            2411504BB28D93845489145E041F9CC1863C09A11BD7E1EFEA86240339463DB2
            B3F59025C0DFD98DD0C83594E6886C360831F408523265D208BC0021B20A35A7
            82B8BC0429C2239A10D812417988007088B14C8A8421EA75A094044A8A48F200
            17E78587629220B370E69F2884EA3750F07E23245946868E43A64EA3B8695F23
            F8EA7A046763EC780AC9640AF155FEB1269AE0BD91AC8CFDF910108E26F15A5B
            33788D1E860CF6CDE7CF225D45FB3F02A0C7CE36076E5CBD84825C3562A20E4B
            097E0CAD051B5FFCA97C9BE4ABAEA05B2FDBE9E6BE0F880F8568FCDB0E1AA9AA
            646C579C654AEF564D15FDB96333FDBCC94A8E751B6A0140DF5168B9E42A7B86
            266AB6D2ED1A1BF559CAC853B58DFCB576F2D7D9D3AE64B777D96862D716EA2F
            2BA76F4CE62B008C1A00C2F9C57F9D8DA2C99212C5E72C85323699F320A77FD2
            72040021DF9885F56BF2204457706F9EC74C4CF2F744169A012430DBF21E00A8
            2B754F98BEC82EEEED7AF2291A306FA451EBD3346633938FF13BF341969D62BD
            CF738AAF6ED6EA4B006882CE77A14ABFD255D2799903606830E4EF28E274070C
            1C67D74255041044C25C9CE43B4149F8B16735F41B8038DB9300E07F6924ECFB
            01D589CC0000000049454E44AE426082}
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
      TabOrder = 18
      Width = 27
    end
    object cxButtonInserir: TcxButtonEdit
      Left = 569
      Top = 291
      Cursor = crHandPoint
      Properties.Buttons = <
        item
          Default = True
          Glyph.SourceDPI = 96
          Glyph.Data = {
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
          Kind = bkGlyph
        end>
      Properties.CaseInsensitive = False
      Properties.IncrementalSearch = False
      Properties.ViewStyle = vsButtonsOnly
      Properties.OnButtonClick = cxButtonEdit4PropertiesButtonClick
      Style.BorderStyle = ebsFlat
      Style.HotTrack = True
      Style.Shadow = False
      Style.TransparentBorder = True
      Style.ButtonStyle = btsDefault
      TabOrder = 13
      OnEnter = cxButtonInserirEnter
      Width = 27
    end
    object edtDatacompetencia: TcxDateEdit
      Left = 532
      Top = 70
      EditValue = 0d
      Properties.ClearKey = 16452
      Properties.DateButtons = []
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 4
      Width = 90
    end
  end
  object cxCheckBox1: TcxCheckBox [5]
    Left = 8
    Top = 678
    Caption = 'Lan'#231'amento em seguencia'
    Properties.ClearKey = 16452
    Properties.DisplayChecked = 'S'
    Properties.DisplayUnchecked = 'N'
    Properties.NullStyle = nssUnchecked
    Properties.ValueChecked = 'S'
    Properties.ValueUnchecked = 'N'
    Style.TransparentBorder = False
    TabOrder = 4
    Transparent = True
    Visible = False
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 352
    Top = 65530
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
    Left = 448
  end
  object TabCusto: TClientDataSet
    PersistDataPacket.Data = {
      630000009619E0BD01000000180000000300000000000300000063000869645F
      637573746F040001000000000005637573746F01004900000001000557494454
      480200020064000964657363726963616F010049000000010005574944544802
      0002003C000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_custo'
        DataType = ftInteger
      end
      item
        Name = 'custo'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 264
    Top = 616
    object TabCustoid_custo: TIntegerField
      FieldName = 'id_custo'
    end
    object TabCustocusto: TStringField
      FieldName = 'custo'
      Size = 100
    end
    object TabCustodescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
  end
  object TabDoc: TClientDataSet
    PersistDataPacket.Data = {
      650000009619E0BD01000000180000000300000000000300000065000C69645F
      646F63756D656E746F040001000000000003646F630100490000000100055749
      4454480200020064000964657363726963616F01004900000001000557494454
      48020002003C000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_documento'
        DataType = ftInteger
      end
      item
        Name = 'doc'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 408
    Top = 514
    object TabDocid_documento: TIntegerField
      FieldName = 'id_documento'
    end
    object TabDocdoc: TStringField
      FieldName = 'doc'
      Size = 100
    end
    object TabDocdescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
  end
  object TabEmpresa: TClientDataSet
    PersistDataPacket.Data = {
      490000009619E0BD01000000180000000200000000000300000049000A69645F
      656D7072657361040001000000000007656D7072657361010049000000010005
      57494454480200020096000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 514
    object TabEmpresaid_empresa: TIntegerField
      FieldName = 'id_empresa'
    end
    object TabEmpresaempresa: TStringField
      FieldName = 'empresa'
      Size = 150
    end
  end
  object TabPlano: TClientDataSet
    PersistDataPacket.Data = {
      680000009619E0BD01000000180000000300000000000300000068000D69645F
      706C616E6F636F6E7461040001000000000005706C616E6F0100490000000100
      0557494454480200020064000964657363726963616F01004900000001000557
      49445448020002005A000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_planoconta'
        DataType = ftInteger
      end
      item
        Name = 'plano'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 90
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 64
    Top = 618
    object TabPlanoid_planoconta: TIntegerField
      FieldName = 'id_planoconta'
    end
    object TabPlanoplano: TStringField
      FieldName = 'plano'
      Size = 100
    end
    object TabPlanodescricao: TStringField
      FieldName = 'descricao'
      Size = 90
    end
  end
  object dsCusto: TUniDataSource
    DataSet = TabCusto
    Left = 264
    Top = 618
  end
  object dsDoc: TUniDataSource
    DataSet = TabDoc
    Left = 408
    Top = 514
  end
  object dsEmpresa: TUniDataSource
    DataSet = TabEmpresa
    Left = 336
    Top = 514
  end
  object dsPlano: TUniDataSource
    DataSet = TabPlano
    Left = 64
    Top = 618
  end
  object TabParcela: TClientDataSet
    PersistDataPacket.Data = {
      1E0100009619E0BD01000000180000000B0000000000030000001E010A69645F
      656D707265736104000100000000000B69645F6E61747572657A610400010000
      0000000C646174615F656D697373616F04000600000000000F646174615F7665
      6E63696D656E746F040006000000000010646174615F636F6D706574656E6369
      6104000600000000000969645F706573736F6104000100000000000C69645F64
      6F63756D656E746F040001000000000003646F63010049000000010005574944
      54480200020064000D76616C6F726F726967696E616C08000400000001000753
      5542545950450200490006004D6F6E65790009686973746F7269636F02004900
      0000010005574944544802000200F4010770617263656C610400010000000000
      0000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_empresa'
        DataType = ftInteger
      end
      item
        Name = 'id_natureza'
        DataType = ftInteger
      end
      item
        Name = 'data_emissao'
        DataType = ftDate
      end
      item
        Name = 'data_vencimento'
        DataType = ftDate
      end
      item
        Name = 'data_competencia'
        DataType = ftDate
      end
      item
        Name = 'id_pessoa'
        DataType = ftInteger
      end
      item
        Name = 'id_documento'
        DataType = ftInteger
      end
      item
        Name = 'doc'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'valororiginal'
        DataType = ftCurrency
      end
      item
        Name = 'historico'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'parcela'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterPost = TabParcelaAfterPost
    Left = 152
    Top = 576
    object TabParcelaid_empresa: TIntegerField
      FieldName = 'id_empresa'
    end
    object TabParcelaid_natureza: TIntegerField
      FieldName = 'id_natureza'
    end
    object TabParceladata_emissao: TDateField
      FieldName = 'data_emissao'
    end
    object TabParceladata_vencimento: TDateField
      FieldName = 'data_vencimento'
    end
    object TabParceladata_competencia: TDateField
      FieldName = 'data_competencia'
    end
    object TabParcelaid_pessoa: TIntegerField
      FieldName = 'id_pessoa'
    end
    object TabParcelaid_documento: TIntegerField
      FieldName = 'id_documento'
    end
    object TabParceladoc: TStringField
      FieldName = 'doc'
      Size = 100
    end
    object TabParcelavalororiginal: TCurrencyField
      FieldName = 'valororiginal'
    end
    object TabParcelahistorico: TStringField
      FieldName = 'historico'
      Size = 500
    end
    object TabParcelaparcela: TIntegerField
      FieldName = 'parcela'
    end
    object TabParcelandoc: TStringField
      FieldKind = fkLookup
      FieldName = 'ndoc'
      LookupDataSet = TabDoc
      LookupKeyFields = 'id_documento'
      LookupResultField = 'descricao'
      KeyFields = 'id_documento'
      Size = 60
      Lookup = True
    end
  end
  object TabCaixa: TClientDataSet
    PersistDataPacket.Data = {
      850000009619E0BD01000000180000000400000000000300000085000869645F
      706C616E6F04000100000000000869645F637573746F04000100000000000A70
      657263656E7475616C080004000000010007535542545950450200490006004D
      6F6E6579000576616C6F72080004000000010007535542545950450200490006
      004D6F6E6579000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_plano'
        DataType = ftInteger
      end
      item
        Name = 'id_custo'
        DataType = ftInteger
      end
      item
        Name = 'percentual'
        DataType = ftCurrency
      end
      item
        Name = 'valor'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 192
    Top = 408
    object TabCaixaid_plano: TIntegerField
      FieldName = 'id_plano'
    end
    object TabCaixaid_custo: TIntegerField
      FieldName = 'id_custo'
    end
    object TabCaixapercentual: TCurrencyField
      FieldName = 'percentual'
    end
    object TabCaixavalor: TCurrencyField
      FieldName = 'valor'
    end
    object TabCaixaplano: TStringField
      FieldKind = fkLookup
      FieldName = 'plano'
      LookupDataSet = TabPlano
      LookupKeyFields = 'id_planoconta'
      LookupResultField = 'descricao'
      KeyFields = 'id_plano'
      Size = 90
      Lookup = True
    end
    object TabCaixacusto: TStringField
      FieldKind = fkLookup
      FieldName = 'custo'
      LookupDataSet = TabCusto
      LookupKeyFields = 'id_custo'
      LookupResultField = 'descricao'
      KeyFields = 'id_custo'
      Size = 60
      Lookup = True
    end
  end
  object dsCaixa: TUniDataSource
    DataSet = TabCaixa
    Left = 216
    Top = 410
  end
  object dsParcela: TUniDataSource
    DataSet = TabParcela
    Left = 152
    Top = 592
  end
  object TabNatureza: TClientDataSet
    PersistDataPacket.Data = {
      690000009619E0BD01000000180000000300000000000300000069000B69645F
      6E61747572657A6104000100000000000964657363726963616F010049000000
      0100055749445448020002003C00086E61747572657A61010049000000010005
      57494454480200020050000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 402
    object TabNaturezaid_natureza: TIntegerField
      FieldName = 'id_natureza'
    end
    object TabNaturezadescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object TabNaturezanatureza: TStringField
      FieldName = 'natureza'
      Size = 80
    end
  end
  object dsNatureza: TUniDataSource
    DataSet = TabNatureza
    Left = 80
    Top = 402
  end
end
