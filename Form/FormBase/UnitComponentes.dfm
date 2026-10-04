inherited FrmComponents: TFrmComponents
  Caption = 'Componentes'
  ClientHeight = 648
  ExplicitHeight = 648
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 620
    ExplicitTop = 620
  end
  inherited PanelClient: TPanel
    Height = 552
    ExplicitHeight = 552
    inherited dxBevel1: TdxBevel
      Height = 546
      ExplicitTop = 3
      ExplicitHeight = 504
    end
    object Label1: TLabel [1]
      Left = 9
      Top = 10
      Width = 60
      Height = 17
      Caption = 'Associado'
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
    object Label3: TLabel [2]
      Left = 105
      Top = 10
      Width = 53
      Height = 17
      Caption = 'Natureza'
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
    object Label5: TLabel [3]
      Left = 9
      Top = 59
      Width = 58
      Height = 17
      Caption = 'Opera'#231#227'o'
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
    object Label2: TLabel [4]
      Left = 263
      Top = 10
      Width = 35
      Height = 17
      Caption = 'Senha'
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
    object cxCodigo: TcxTextEdit [5]
      Left = 9
      Top = 28
      TabStop = False
      Properties.ReadOnly = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 0
      Width = 90
    end
    object cxNatureza: TcxTextEdit [6]
      Left = 105
      Top = 28
      Cursor = crIBeam
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 1
      Width = 152
    end
    object cxOperacao: TcxComboBox [7]
      Left = 9
      Top = 78
      Cursor = crIBeam
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Estadual'
        'Interestadual'
        'Exporta'#231#227'o')
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 2
      Width = 58
    end
    object cxAtivo: TcxCheckBox [8]
      Left = 159
      Top = 78
      Caption = 'Ativo'
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.DisplayGrayed = 'S'
      Properties.ImmediatePost = True
      Properties.ValueChecked = 'S'
      Properties.ValueGrayed = 'N'
      Properties.ValueUnchecked = 'N'
      State = cbsChecked
      Style.TransparentBorder = False
      TabOrder = 3
      Transparent = True
    end
    object cxcnpj: TcxButtonEdit [9]
      Left = 15
      Top = 164
      Cursor = crIBeam
      Properties.Buttons = <
        item
          Default = True
          Glyph.SourceDPI = 96
          Glyph.Data = {
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
          Kind = bkGlyph
        end>
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.EditMask = '99.999.999/9999-99'
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 4
      Text = '  .   .   /    -  '
      Width = 130
    end
    object cxcpf: TcxButtonEdit [10]
      Left = 15
      Top = 195
      Cursor = crIBeam
      Properties.Buttons = <
        item
          Default = True
          Glyph.SourceDPI = 96
          Glyph.Data = {
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
          Kind = bkGlyph
        end>
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.EditMask = '999\.999\.999\-99;1;_'
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 5
      Text = '   .   .   -  '
      Width = 130
    end
    object cxFone: TcxMaskEdit [11]
      Left = 151
      Top = 226
      Properties.EditMask = '!\(99\)9999-9999'
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 6
      Text = '(  )    -    '
      Width = 121
    end
    object cxCep: TcxButtonEdit [12]
      Left = 15
      Top = 226
      Cursor = crIBeam
      Properties.Buttons = <
        item
          Default = True
          Glyph.SourceDPI = 96
          Glyph.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            610000001974455874536F6674776172650041646F626520496D616765526561
            647971C9653C0000001F744558745469746C65004C6F63616C697A6174696F6E
            3B576F726C643B45617274683B3213439F0000032949444154785E4D934B685C
            650085BFFBCFBD7327F3B8794C26994C226921A11903D3C4504D1A8BE8A60F1F
            8806D28DAD15842E6C445D14A55DD8A6B88D8B20E82ADD88421521B88C0BA550
            A3681B5A68D39048D3CE23C9DC793EEEDCC76F0B59CC81B339F09DDDA7482951
            14859668C4E940F177830C6223B16D932245A00A34E5D3B01FD1022A7413894D
            9E997DF5E4A51B5F5D5D5ABD7665E9CFC5C51BAB2F9D98FFA36FEAE277DDC933
            A781A8A228EAD3B61EA0D089111F999B3FFADAE0B7B3A7478FA991666878A847
            94714457CA4D88D1C63BA181B185DE17E6AE0171400550008050DFCB9FCEF74F
            E5E6C6A762222A3B8888286DFE5E6EE562E4F31637F7AEA2E57BE9DA3CEE94D3
            B79776EE2C5E06B23EC0177FF1FC9BFA81E21577785D2FAB269EE1A0E892AD9D
            3881CE713CB707657B90ACFF377C56A7F03B03438AAA6F5BE6FD7B02D085DE31
            53EFDC08979C22DBB5C7FC7B679B4CFA08FEE8144D278863E968E220C742D31C
            1972310CCDF085126F03860A0484169EA8BB5582992E6AD532A9C40718B1A334
            AD00958247ADE062955DF2BE2CEFCED8E8AA45361D4A01610104347F7722E00E
            7120789694719970649A92A963663D4A1987F29E43AD68B12336B99BDB41840A
            481188024115F0292240A73CC5FA93650E718147E626D20DE2B91DD8F536EA45
            857A017239877F9E9824EC0EA4E7022000CFAD57D35E799848FD751EDEFD915B
            1BE7F8EBF17BACAF2FB0BBB541395BC52AFAF1FD37C5D6CD380F570EE359D53C
            D0108065D7326B546C1C3349A5B88D541D9C781A33799D4CDB454AB9551A853D
            2299930C3CF81CA7DA8753DFBD075404506D141EFC6AD7368BC26A202A132855
            1DEA1A2812FBD01AE557E6688ECE6384041E0D2A95F58A5379F40B50148095BF
            FFC3722DFFF7CFAA9271A3DA1881AD1388DD30582A48A0AD492CFD16F84CCCDA
            9A572FDD5EB672BFFF04D4D8F742050E768D7E78BD7F72A13430F9B5548F3F2F
            957371A9CFA464CFF467B26FE21BD99EFCA2AC27DEF81E1802B4672C2D626940
            7F64F0D485F6E4FB2B46EAEC6EFBE18FECF6B14FECD0C8F94CDBE0EC8A3F36FD
            31F01CA019A92F693D68B5330CF40349601C180346F6B730209E31FBE57FDF9B
            69B57B8C41DD0000000049454E44AE426082}
          Kind = bkGlyph
        end>
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.EditMask = '99\.999\-999;1;_'
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 7
      Text = '  .   -   '
      Width = 130
    end
    object cxMemo1: TcxMemo [13]
      Left = 447
      Top = 6
      Lines.Strings = (
        'cxMemo1')
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 8
      Height = 89
      Width = 185
    end
    object cxData: TcxDateEdit [14]
      Left = 151
      Top = 164
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
      Properties.SaveTime = False
      Properties.ShowTime = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 9
      Width = 121
    end
    object cxSpinEdit1: TcxSpinEdit [15]
      Left = 278
      Top = 164
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = clSkyBlue
      TabOrder = 10
      Width = 75
    end
    object cxHora: TcxTimeEdit [16]
      Left = 359
      Top = 164
      Properties.ClearKey = 16452
      Properties.ImmediatePost = True
      Properties.TimeFormat = tfHourMin
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 11
      Width = 82
    end
    object cxValor: TcxCurrencyEdit [17]
      Left = 151
      Top = 195
      Cursor = crIBeam
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 12
      Width = 121
    end
    object cxMeno: TcxBlobEdit [18]
      Left = 278
      Top = 195
      Cursor = crIBeam
      Properties.BlobEditKind = bekMemo
      Properties.ClearKey = 16452
      Properties.ImmediatePost = True
      Properties.PopupWidth = 180
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 13
      Width = 235
    end
    object cxLookup: TcxLookupComboBox [19]
      Left = 241
      Top = 133
      Cursor = crIBeam
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.ImmediatePost = True
      Properties.ListColumns = <>
      EditValue = 0
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 14
      Width = 235
    end
    object edtLooccad: TcxLookupComboBox [20]
      Left = 241
      Top = 109
      Cursor = crIBeam
      Properties.CaseSensitiveSearch = True
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownRows = 10
      Properties.DropDownWidth = 400
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
      EditValue = 0
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 15
      Width = 271
    end
    object BtnCliVisualizar: TcxButtonEdit [21]
      Left = 509
      Top = 109
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
      TabOrder = 16
      Width = 27
    end
    object BtnCliNovo: TcxButtonEdit [22]
      Left = 533
      Top = 109
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
      TabOrder = 17
      Width = 27
    end
    object cxSenha: TcxTextEdit [23]
      Left = 263
      Top = 28
      Cursor = crIBeam
      Properties.ClearKey = 16452
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '*'
      Properties.ShowPasswordRevealButton = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 18
      Text = '123'
      Width = 152
    end
    object cxMaskEdit1: TcxMaskEdit [24]
      Left = 278
      Top = 226
      Properties.EditMask = '!\(99\)99999-9999'
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 19
      Text = '(  )     -    '
      Width = 121
    end
    object Panel1: TPanel [25]
      Left = 15
      Top = 257
      Width = 130
      Height = 41
      BevelOuter = bvNone
      Color = 6576709
      ParentBackground = False
      TabOrder = 20
    end
    object Panel2: TPanel [26]
      Left = 15
      Top = 352
      Width = 130
      Height = 41
      BevelOuter = bvNone
      Color = 15855596
      ParentBackground = False
      TabOrder = 21
    end
    object Panel3: TPanel [27]
      Left = 160
      Top = 257
      Width = 97
      Height = 41
      BevelOuter = bvNone
      Color = 12608789
      ParentBackground = False
      TabOrder = 22
    end
    object Panel4: TPanel [28]
      Left = 160
      Top = 352
      Width = 97
      Height = 41
      BevelOuter = bvNone
      Color = 16119285
      ParentBackground = False
      TabOrder = 23
    end
    object Panel5: TPanel [29]
      Left = 278
      Top = 257
      Width = 121
      Height = 41
      BevelOuter = bvNone
      Color = 4013373
      ParentBackground = False
      TabOrder = 24
    end
    object Panel6: TPanel [30]
      Left = 278
      Top = 352
      Width = 121
      Height = 41
      BevelOuter = bvNone
      Color = 16053492
      ParentBackground = False
      TabOrder = 25
    end
    object Panel7: TPanel [31]
      Left = 415
      Top = 257
      Width = 97
      Height = 41
      BevelOuter = bvNone
      Color = 16671247
      ParentBackground = False
      TabOrder = 26
    end
    object Panel8: TPanel [32]
      Left = 415
      Top = 352
      Width = 97
      Height = 41
      BevelOuter = bvNone
      Color = 16053492
      ParentBackground = False
      TabOrder = 27
    end
    object Panel9: TPanel [33]
      Left = 15
      Top = 409
      Width = 121
      Height = 41
      BevelOuter = bvNone
      Color = 5781541
      ParentBackground = False
      TabOrder = 28
    end
    object Panel10: TPanel [34]
      Left = 15
      Top = 456
      Width = 121
      Height = 41
      BevelOuter = bvNone
      Color = 16250356
      ParentBackground = False
      TabOrder = 29
    end
    object Panel11: TPanel [35]
      Left = 160
      Top = 409
      Width = 97
      Height = 41
      BevelOuter = bvNone
      Color = 13390336
      ParentBackground = False
      TabOrder = 30
    end
    object Panel12: TPanel [36]
      Left = 159
      Top = 456
      Width = 97
      Height = 41
      BevelOuter = bvNone
      Color = 16250356
      ParentBackground = False
      TabOrder = 31
    end
    object Panel13: TPanel [37]
      Left = 533
      Top = 140
      Width = 97
      Height = 41
      BevelOuter = bvNone
      Color = 8303414
      ParentBackground = False
      TabOrder = 32
    end
    object Panel14: TPanel [38]
      Left = 535
      Top = 187
      Width = 97
      Height = 41
      BevelOuter = bvNone
      Color = 3167999
      ParentBackground = False
      TabOrder = 33
    end
    object Panel15: TPanel [39]
      Left = 533
      Top = 244
      Width = 97
      Height = 41
      BevelOuter = bvNone
      Color = 16671247
      ParentBackground = False
      TabOrder = 34
    end
    object Panel16: TPanel [40]
      Left = 535
      Top = 291
      Width = 97
      Height = 41
      BevelOuter = bvNone
      Color = 2629338
      ParentBackground = False
      TabOrder = 35
    end
    object Panel17: TPanel [41]
      Left = 533
      Top = 340
      Width = 97
      Height = 41
      BevelOuter = bvNone
      Color = 13792793
      ParentBackground = False
      TabOrder = 36
    end
    object Panel18: TPanel [42]
      Left = 535
      Top = 387
      Width = 97
      Height = 41
      BevelOuter = bvNone
      Color = 2631878
      ParentBackground = False
      TabOrder = 37
    end
    inherited BtnSalvar: TStyledBitBtn
      TabOrder = 38
      ButtonStyleNormal.BorderColor = 9265439
      ButtonStyleNormal.ButtonColor = 9265439
      ButtonStylePressed.BorderColor = 11105317
      ButtonStylePressed.ButtonColor = 11105317
      ButtonStyleSelected.BorderColor = 11105317
      ButtonStyleSelected.ButtonColor = 11105317
      ButtonStyleHot.BorderColor = 11105317
      ButtonStyleHot.ButtonColor = 11105317
    end
    inherited BtnCancelar: TStyledBitBtn
      TabOrder = 39
    end
  end
  object dxStatusBar1: TdxStatusBar [3]
    Left = 0
    Top = 595
    Width = 650
    Height = 25
    Panels = <>
    PaintStyle = stpsFlat
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Color = 6576709
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 576
    Top = 10
  end
  inherited Ds: TUniDataSource
    Top = 8
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
end
