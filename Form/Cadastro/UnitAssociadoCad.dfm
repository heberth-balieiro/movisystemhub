inherited FrmAssociadoCad: TFrmAssociadoCad
  Caption = 'Associado'
  ClientHeight = 647
  Color = clWhite
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitHeight = 647
  TextHeight = 17
  object Label27: TLabel [0]
    Left = 12
    Top = 535
    Width = 232
    Height = 17
    Caption = 'Campo com * s'#227'o campos obrigat'#243'rios'
    WordWrap = True
  end
  inherited PanelButton: TPanel
    Top = 619
    TabOrder = 2
    ExplicitTop = 619
  end
  inherited PanelClient: TPanel
    Height = 576
    TabOrder = 0
    ExplicitHeight = 576
    inherited dxBevel1: TdxBevel
      Left = 14
      Top = 566
      Width = 130
      Height = 29
      Align = alNone
      Visible = False
      ExplicitLeft = 14
      ExplicitTop = 566
      ExplicitWidth = 130
      ExplicitHeight = 29
    end
    inherited BtnSalvar: TStyledBitBtn
      Left = 426
      Top = 539
      OnClick = BtnSalvarClick
      ExplicitLeft = 426
      ExplicitTop = 539
    end
    inherited BtnCancelar: TStyledBitBtn
      Left = 537
      Top = 539
      OnClick = BtnCancelarClick
      ExplicitLeft = 537
      ExplicitTop = 539
    end
    object cxPageControl: TcxPageControl
      Left = 0
      Top = 0
      Width = 650
      Height = 537
      Align = alTop
      TabOrder = 2
      Properties.ActivePage = TabDados
      Properties.CustomButtons.Buttons = <>
      ClientRectBottom = 535
      ClientRectLeft = 2
      ClientRectRight = 648
      ClientRectTop = 35
      object TabDados: TcxTabSheet
        Caption = 'Dados b'#225'sicos'
        ImageIndex = 0
        object cxGroupBox1: TcxGroupBox
          Left = 0
          Top = 0
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          PanelStyle.Active = True
          PanelStyle.OfficeBackgroundKind = pobkStyleColor
          Style.BorderStyle = ebsNone
          Style.TextStyle = [fsBold]
          TabOrder = 0
          Transparent = True
          Height = 500
          Width = 646
          object Label1: TLabel
            Left = 3
            Top = 6
            Width = 43
            Height = 17
            Caption = 'C'#243'digo'
          end
          object Label2: TLabel
            Left = 292
            Top = 55
            Width = 45
            Height = 17
            Caption = 'Apelido'
          end
          object Label3: TLabel
            Left = 62
            Top = 6
            Width = 54
            Height = 17
            Caption = 'Matr'#237'cula'
          end
          object Label4: TLabel
            Left = 3
            Top = 104
            Width = 23
            Height = 17
            Caption = 'Cep'
          end
          object Label5: TLabel
            Left = 141
            Top = 153
            Width = 82
            Height = 17
            Caption = 'Complemento'
          end
          object Label6: TLabel
            Left = 416
            Top = 202
            Width = 17
            Height = 17
            Caption = 'RG'
          end
          object Label7: TLabel
            Left = 240
            Top = 300
            Width = 17
            Height = 17
            Caption = 'Pai'
          end
          object Label8: TLabel
            Left = 3
            Top = 300
            Width = 36
            Height = 17
            Caption = 'E-mail'
          end
          object Label9: TLabel
            Left = 451
            Top = 300
            Width = 26
            Height = 17
            Caption = 'M'#227'e'
          end
          object Label10: TLabel
            Left = 126
            Top = 6
            Width = 68
            Height = 17
            Caption = 'S'#243'cio deste'
          end
          object Label11: TLabel
            Left = 3
            Top = 202
            Width = 49
            Height = 17
            Caption = 'Telefone'
          end
          object Label12: TLabel
            Left = 102
            Top = 202
            Width = 40
            Height = 17
            Caption = 'Celular'
          end
          object Label13: TLabel
            Left = 201
            Top = 202
            Width = 60
            Height = 17
            Caption = 'WhatsApp'
          end
          object Label14: TLabel
            Left = 92
            Top = 104
            Width = 55
            Height = 17
            Caption = 'Endere'#231'o'
          end
          object Label15: TLabel
            Left = 397
            Top = 104
            Width = 48
            Height = 17
            Caption = 'N'#250'mero'
          end
          object Label16: TLabel
            Left = 3
            Top = 153
            Width = 35
            Height = 17
            Caption = 'Bairro'
          end
          object Label17: TLabel
            Left = 292
            Top = 153
            Width = 41
            Height = 17
            Caption = 'Cidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            PopupMenu = PopCadastro
          end
          object Label18: TLabel
            Left = 581
            Top = 202
            Width = 49
            Height = 17
            Caption = 'N'#186' CTPS'
          end
          object Label19: TLabel
            Left = 141
            Top = 251
            Width = 28
            Height = 17
            Caption = 'Sexo'
          end
          object Label20: TLabel
            Left = 220
            Top = 6
            Width = 90
            Height = 17
            Caption = 'Sede/Sub-Sede'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            PopupMenu = PopCadastro
          end
          object Label22: TLabel
            Left = 3
            Top = 55
            Width = 36
            Height = 17
            Caption = 'Nome'
          end
          object Label23: TLabel
            Left = 300
            Top = 202
            Width = 21
            Height = 17
            Caption = 'CPF'
          end
          object Label24: TLabel
            Left = 505
            Top = 202
            Width = 38
            Height = 17
            Caption = 'Org'#227'o'
          end
          object Label25: TLabel
            Left = 3
            Top = 251
            Width = 29
            Height = 17
            Caption = 'S'#233'rie'
          end
          object Label26: TLabel
            Left = 62
            Top = 251
            Width = 37
            Height = 17
            Caption = 'N'#186' PIS'
          end
          object Label28: TLabel
            Left = 240
            Top = 251
            Width = 71
            Height = 17
            Caption = 'Estado Civil '
          end
          object Label29: TLabel
            Left = 352
            Top = 251
            Width = 69
            Height = 17
            Caption = 'Nascimento'
          end
          object Label31: TLabel
            Left = 451
            Top = 251
            Width = 62
            Height = 17
            Caption = 'Natural de'
          end
          object Label34: TLabel
            Left = 102
            Top = 349
            Width = 70
            Height = 17
            Caption = 'Observa'#231#227'o'
          end
          object Label36: TLabel
            Left = 3
            Top = 349
            Width = 49
            Height = 17
            Caption = 'Situa'#231#227'o'
          end
          object Label42: TLabel
            Left = 397
            Top = 349
            Width = 31
            Height = 17
            Caption = 'Aviso'
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
          object edtCodigo: TcxTextEdit
            Left = 3
            Top = 24
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.ReadOnly = True
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 0
            Width = 60
          end
          object edtnome: TcxTextEdit
            Left = 3
            Top = 73
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.MaxLength = 150
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 5
            Width = 290
          end
          object edtapelido: TcxTextEdit
            Left = 292
            Top = 73
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.MaxLength = 60
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 6
            Width = 186
          end
          object edttelefone: TcxMaskEdit
            Left = 3
            Top = 220
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.EditMask = '!\(99\)9999-9999;1;_'
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 14
            Text = '(  )    -    '
            Width = 100
          end
          object edtCelular: TcxMaskEdit
            Left = 102
            Top = 220
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.EditMask = '!\(99\)99999-9999;1;_'
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 15
            Text = '(  )     -    '
            Width = 100
          end
          object edtzap: TcxMaskEdit
            Left = 201
            Top = 220
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.EditMask = '!\(99\)99999-9999;1;_'
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 16
            Text = '(  )     -    '
            Width = 100
          end
          object edtendereco: TcxTextEdit
            Left = 92
            Top = 122
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.MaxLength = 90
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 8
            Width = 306
          end
          object edtNumero: TcxTextEdit
            Left = 397
            Top = 122
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.MaxLength = 15
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 9
            Width = 81
          end
          object edtBairro: TcxTextEdit
            Left = 3
            Top = 171
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.MaxLength = 60
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 10
            Width = 139
          end
          object edtcomplemento: TcxTextEdit
            Left = 141
            Top = 171
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.MaxLength = 45
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 11
            Width = 152
          end
          object edtrg: TcxTextEdit
            Left = 416
            Top = 220
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 18
            OnKeyPress = edtmatriculaKeyPress
            Width = 90
          end
          object edtctps: TcxTextEdit
            Left = 581
            Top = 220
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 20
            OnKeyPress = edtmatriculaKeyPress
            OnKeyUp = FormKeyDown
            Width = 64
          end
          object edtpai: TcxTextEdit
            Left = 240
            Top = 318
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.MaxLength = 90
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 28
            Width = 212
          end
          object edtemail: TcxTextEdit
            Left = 3
            Top = 318
            Properties.ClearKey = 16452
            Properties.MaxLength = 180
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 27
            Width = 238
          end
          object edtmae: TcxTextEdit
            Left = 451
            Top = 318
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.MaxLength = 90
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 29
            Width = 194
          end
          object edtmatricula: TcxTextEdit
            Left = 62
            Top = 24
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.ReadOnly = False
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 1
            OnKeyPress = edtmatriculaKeyPress
            Width = 65
          end
          object edtorgao: TcxTextEdit
            Left = 505
            Top = 220
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 19
            OnKeyUp = FormKeyDown
            Width = 77
          end
          object edtserie: TcxTextEdit
            Left = 3
            Top = 269
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 21
            OnKeyPress = edtmatriculaKeyPress
            Width = 60
          end
          object edtpis: TcxTextEdit
            Left = 62
            Top = 269
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 22
            OnKeyPress = edtmatriculaKeyPress
            Width = 80
          end
          object edtsexo: TcxComboBox
            Left = 141
            Top = 269
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
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 23
            Text = 'MASCULINO'
            Width = 100
          end
          object edtcivil: TcxComboBox
            Left = 240
            Top = 269
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
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 24
            Text = 'OUTROS'
            Width = 113
          end
          object edtobs: TcxBlobEdit
            Left = 102
            Top = 367
            Properties.BlobEditKind = bekMemo
            Properties.ClearKey = 16452
            Properties.MemoCharCase = ecUpperCase
            Properties.MemoMaxLength = 250
            Properties.PopupHeight = 185
            Properties.PopupWidth = 296
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 31
            Width = 296
          end
          object edtsituacao: TcxComboBox
            Left = 3
            Top = 367
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.DropDownListStyle = lsEditFixedList
            Properties.ImmediatePost = True
            Properties.Items.Strings = (
              'Ativo'
              'Inadimplente'
              'Suspenso'
              'Inativo'
              'Cancelado'
              'Afastado')
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 30
            Text = 'ATIVO'
            Width = 100
          end
          object edtdata: TcxDateEdit
            Left = 126
            Top = 24
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
            TabOrder = 2
            Width = 95
          end
          object BtnSede: TcxButtonEdit
            Left = 451
            Top = 24
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
            Properties.OnButtonClick = BtnSedePropertiesButtonClick
            Style.BorderStyle = ebsFlat
            Style.HotTrack = True
            Style.Shadow = False
            Style.TransparentBorder = True
            Style.ButtonStyle = btsDefault
            TabOrder = 4
            Width = 27
          end
          object edtcep: TcxButtonEdit
            Left = 3
            Top = 122
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
            Properties.OnButtonClick = edtcepPropertiesButtonClick
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 7
            Text = '  .   -   '
            Width = 90
          end
          object BtnCidade: TcxButtonEdit
            Left = 618
            Top = 171
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
            Properties.OnButtonClick = BtnCidadePropertiesButtonClick
            Style.BorderStyle = ebsFlat
            Style.HotTrack = True
            Style.Shadow = False
            Style.TransparentBorder = True
            Style.ButtonStyle = btsDefault
            TabOrder = 13
            Width = 27
          end
          object edtcpf: TcxButtonEdit
            Left = 300
            Top = 220
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
                Visible = False
              end>
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.EditMask = '999\.999\.999\-99;1;_'
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 17
            Text = '   .   .   -  '
            Width = 117
          end
          object edtnascimento: TcxDateEdit
            Left = 352
            Top = 269
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
            TabOrder = 25
            Width = 100
          end
          object edtAviso: TcxBlobEdit
            Left = 397
            Top = 367
            Properties.BlobEditKind = bekMemo
            Properties.ClearKey = 16452
            Properties.ImmediatePost = True
            Properties.MemoCharCase = ecUpperCase
            Properties.MemoMaxLength = 250
            Properties.PopupHeight = 185
            Properties.PopupWidth = 248
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 32
            Width = 248
          end
          object edtbloqueado: TcxCheckBox
            Left = 3
            Top = 398
            Caption = 'Bloqueado'
            Properties.ClearKey = 16452
            Properties.DisplayChecked = 'S'
            Properties.DisplayUnchecked = 'N'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            Style.TransparentBorder = False
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 33
            Transparent = True
          end
          object edtenviaremail: TcxCheckBox
            Left = 3
            Top = 425
            Caption = 'Receber E-mail'
            Properties.ClearKey = 16452
            Properties.DisplayChecked = 'S'
            Properties.DisplayUnchecked = 'N'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            Style.TransparentBorder = False
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 34
            Transparent = True
          end
          object edtenviarwhats: TcxCheckBox
            Left = 3
            Top = 452
            Caption = 'Receber WhatsApp'
            Properties.ClearKey = 16452
            Properties.DisplayChecked = 'S'
            Properties.DisplayUnchecked = 'N'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            Style.TransparentBorder = False
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 35
            Transparent = True
          end
          object edtSede: TcxLookupComboBox
            Left = 220
            Top = 24
            Cursor = crIBeam
            Properties.Alignment.Horz = taLeftJustify
            Properties.CaseSensitiveSearch = True
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.DropDownRows = 10
            Properties.DropDownWidth = 400
            Properties.ImmediatePost = True
            Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
            Properties.KeyFieldNames = 'id_sede'
            Properties.ListColumns = <
              item
                Width = 300
                FieldName = 'nsede'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListOptions.SyncMode = True
            Properties.ListSource = dsSede
            EditValue = 0
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 3
            Width = 234
          end
          object EdtCidade: TcxLookupComboBox
            Left = 292
            Top = 171
            Cursor = crIBeam
            Properties.Alignment.Horz = taLeftJustify
            Properties.CaseSensitiveSearch = True
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.DropDownRows = 10
            Properties.DropDownWidth = 400
            Properties.ImmediatePost = True
            Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
            Properties.KeyFieldNames = 'id_cidade'
            Properties.ListColumns = <
              item
                FieldName = 'ncidade'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListOptions.SyncMode = True
            Properties.ListSource = dsCidade
            EditValue = 0
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 12
            Width = 329
          end
          object edtnatural: TcxLookupComboBox
            Left = 451
            Top = 269
            Cursor = crIBeam
            Properties.Alignment.Horz = taLeftJustify
            Properties.CaseSensitiveSearch = True
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.DropDownRows = 10
            Properties.DropDownWidth = 400
            Properties.ImmediatePost = True
            Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
            Properties.KeyFieldNames = 'id_cidade'
            Properties.ListColumns = <
              item
                FieldName = 'ncidade'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListOptions.SyncMode = True
            Properties.ListSource = dsCidade
            EditValue = 0
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 26
            Width = 194
          end
          object GrupoRefiliacao: TcxGroupBox
            Left = 144
            Top = 398
            TabOrder = 36
            Visible = False
            Height = 99
            Width = 500
            object Label55: TLabel
              Left = 3
              Top = 3
              Width = 103
              Height = 17
              Caption = 'Data da refilia'#231#227'o'
            end
            object Label56: TLabel
              Left = 126
              Top = 3
              Width = 117
              Height = 17
              Caption = 'Motivo da refilia'#231#227'o'
            end
            object Label57: TLabel
              Left = 3
              Top = 52
              Width = 161
              Height = 17
              Caption = 'Respons'#225'vel pelo processo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label58: TLabel
              Left = 176
              Top = 52
              Width = 137
              Height = 17
              Caption = 'Documento / Protocolo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label59: TLabel
              Left = 333
              Top = 52
              Width = 55
              Height = 17
              Caption = 'Anota'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object cxDatadesfiliar: TcxDateEdit
              Left = 3
              Top = 21
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
              TabOrder = 0
              Width = 124
            end
            object cxmotivo: TcxLookupComboBox
              Left = 126
              Top = 21
              Properties.CharCase = ecUpperCase
              Properties.ClearKey = 16452
              Properties.ImmediatePost = True
              Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
              Properties.KeyFieldNames = 'id_motivo'
              Properties.ListColumns = <
                item
                  Caption = 'Motivo'
                  FieldName = 'npesquisa'
                end>
              Properties.ListOptions.GridLines = glNone
              Properties.ListOptions.ShowHeader = False
              Properties.ListOptions.SyncMode = True
              Properties.ListSource = dsmotivo
              Properties.ReadOnly = False
              EditValue = 0
              StyleFocused.BorderColor = clNavy
              StyleFocused.Color = 15855596
              TabOrder = 1
              Width = 371
            end
            object cxresponsavel: TcxLookupComboBox
              Left = 3
              Top = 70
              Properties.CharCase = ecUpperCase
              Properties.ClearKey = 16452
              Properties.ImmediatePost = True
              Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
              Properties.KeyFieldNames = 'id_usuario'
              Properties.ListColumns = <
                item
                  Caption = 'Usu'#225'rio'
                  FieldName = 'nome'
                end>
              Properties.ListOptions.GridLines = glNone
              Properties.ListOptions.ShowHeader = False
              Properties.ListOptions.SyncMode = True
              Properties.ListSource = dsresponsavel
              Properties.ReadOnly = False
              EditValue = 0
              StyleFocused.BorderColor = clNavy
              StyleFocused.Color = 15855596
              TabOrder = 2
              Width = 174
            end
            object cxdocumento: TcxTextEdit
              Left = 176
              Top = 70
              Properties.CharCase = ecUpperCase
              Properties.ClearKey = 16452
              Properties.MaxLength = 150
              Properties.ReadOnly = False
              StyleFocused.BorderColor = clNavy
              StyleFocused.Color = 15855596
              TabOrder = 3
              Width = 158
            end
            object cxobsrefiliacao: TcxBlobEdit
              Left = 333
              Top = 70
              Properties.BlobEditKind = bekMemo
              Properties.ClearKey = 16452
              Properties.MemoCharCase = ecUpperCase
              Properties.MemoMaxLength = 250
              Properties.PopupHeight = 185
              Properties.PopupWidth = 296
              StyleFocused.BorderColor = clNavy
              StyleFocused.Color = 15855596
              TabOrder = 4
              Width = 164
            end
          end
        end
      end
      object TabAdicionais: TcxTabSheet
        Caption = 'Adicionais'
        ImageIndex = 1
        object cxGroupBox2: TcxGroupBox
          Left = 0
          Top = 0
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          PanelStyle.Active = True
          Style.BorderStyle = ebsNone
          TabOrder = 0
          Height = 500
          Width = 646
          object Label32: TLabel
            Left = 545
            Top = 104
            Width = 57
            Height = 17
            Caption = 'Admiss'#227'o'
          end
          object Label33: TLabel
            Left = 675
            Top = 109
            Width = 100
            Height = 17
            Caption = 'Data desativa'#231#227'o'
          end
          object Label37: TLabel
            Left = 102
            Top = 104
            Width = 40
            Height = 17
            Caption = 'Sal'#225'rio'
          end
          object Label38: TLabel
            Left = 320
            Top = 104
            Width = 104
            Height = 17
            Caption = 'Tipo mensalidade'
          end
          object Label40: TLabel
            Left = 346
            Top = 55
            Width = 46
            Height = 17
            Caption = 'Lota'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            PopupMenu = PopCadastro
          end
          object Label41: TLabel
            Left = 3
            Top = 6
            Width = 51
            Height = 17
            Caption = 'Empresa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            PopupMenu = PopCadastro
          end
          object Label21: TLabel
            Left = 346
            Top = 5
            Width = 58
            Height = 17
            Caption = 'Secretaria'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            PopupMenu = PopCadastro
          end
          object Label30: TLabel
            Left = 3
            Top = 55
            Width = 54
            Height = 17
            Caption = 'Profiss'#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            PopupMenu = PopCadastro
          end
          object Label35: TLabel
            Left = 3
            Top = 104
            Width = 70
            Height = 17
            Caption = '% Desconto'
          end
          object Label39: TLabel
            Left = 211
            Top = 104
            Width = 34
            Height = 17
            Caption = 'Limite'
          end
          object Label43: TLabel
            Left = 3
            Top = 153
            Width = 41
            Height = 17
            Caption = 'Fun'#231#227'o'
          end
          object Label44: TLabel
            Left = 320
            Top = 153
            Width = 79
            Height = 17
            Caption = 'Tipo Situa'#231#227'o'
          end
          object Label45: TLabel
            Left = 3
            Top = 202
            Width = 104
            Height = 17
            Caption = 'Local de Trabalho'
          end
          object Label46: TLabel
            Left = 346
            Top = 202
            Width = 23
            Height = 17
            Caption = 'Cep'
          end
          object Label47: TLabel
            Left = 435
            Top = 202
            Width = 55
            Height = 17
            Caption = 'Endere'#231'o'
          end
          object Label48: TLabel
            Left = 3
            Top = 251
            Width = 48
            Height = 17
            Caption = 'N'#250'mero'
          end
          object Label49: TLabel
            Left = 83
            Top = 251
            Width = 35
            Height = 17
            Caption = 'Bairro'
          end
          object Label50: TLabel
            Left = 221
            Top = 251
            Width = 82
            Height = 17
            Caption = 'Complemento'
          end
          object Label51: TLabel
            Left = 346
            Top = 251
            Width = 41
            Height = 17
            Caption = 'Cidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            PopupMenu = PopCadastro
          end
          object Label52: TLabel
            Left = 3
            Top = 300
            Width = 49
            Height = 17
            Caption = 'Telefone'
          end
          object Label53: TLabel
            Left = 102
            Top = 300
            Width = 40
            Height = 17
            Caption = 'Celular'
          end
          object Label54: TLabel
            Left = 3
            Top = 455
            Width = 187
            Height = 17
            Caption = '* Endere'#231'o referente a empresa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clSilver
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object edtdesativacao: TcxDateEdit
            Left = 675
            Top = 127
            Properties.ClearKey = 16452
            Properties.DateButtons = []
            Properties.ImmediatePost = True
            Properties.SaveTime = False
            Properties.ShowTime = False
            TabOrder = 24
            Width = 101
          end
          object edtpercdesconto: TcxCurrencyEdit
            Left = 3
            Top = 122
            EditValue = 0.000000000000000000
            Properties.ClearKey = 16452
            Properties.DisplayFormat = '0.00;-0.00'
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 8
            Width = 100
          end
          object edtsalario: TcxCurrencyEdit
            Left = 102
            Top = 122
            EditValue = 0.000000000000000000
            Properties.ClearKey = 16452
            Properties.DisplayFormat = '0.00;-0.00'
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 9
            Width = 110
          end
          object edtmensalidade: TcxComboBox
            Left = 320
            Top = 122
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.DropDownListStyle = lsEditFixedList
            Properties.ImmediatePost = True
            Properties.Items.Strings = (
              'Mensalidade Padr'#227'o'
              'Mensalidade com Desconto'
              'Mensalidade Familiar'
              'Mensalidade Estudantil'
              'Mensalidade S'#234'nior'
              'Mensalidade Corporativa'
              'Mensalidade Anual/Trimestral'
              '')
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 11
            Text = 'MENSALIDADE PADR'#195'O'
            Width = 226
          end
          object edtSecretaria: TcxLookupComboBox
            Left = 346
            Top = 24
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.ImmediatePost = True
            Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
            Properties.KeyFieldNames = 'id_secretaria'
            Properties.ListColumns = <
              item
                FieldName = 'nsecretaria'
              end>
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.ShowHeader = False
            Properties.ListOptions.SyncMode = True
            Properties.ListSource = dsSecretaria
            EditValue = 0
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 2
            Width = 275
          end
          object edtProfissao: TcxLookupComboBox
            Left = 3
            Top = 73
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.ImmediatePost = True
            Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
            Properties.KeyFieldNames = 'id_profissao'
            Properties.ListColumns = <
              item
                FieldName = 'nprofissao'
              end>
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.ShowHeader = False
            Properties.ListOptions.SyncMode = True
            Properties.ListSource = dsProfissao
            EditValue = 0
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 4
            Width = 320
          end
          object edtEmpresa: TcxLookupComboBox
            Left = 3
            Top = 24
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.ImmediatePost = True
            Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
            Properties.KeyFieldNames = 'sind_id_empresa'
            Properties.ListColumns = <
              item
                FieldName = 'nempresa'
              end>
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.ShowHeader = False
            Properties.ListOptions.SyncMode = True
            Properties.ListSource = dsEmpresa
            EditValue = 0
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 0
            Width = 320
          end
          object edtlotacao: TcxLookupComboBox
            Left = 346
            Top = 73
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.ImmediatePost = True
            Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
            Properties.KeyFieldNames = 'id_lotacao'
            Properties.ListColumns = <
              item
                FieldName = 'nlotacao'
              end>
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.ShowHeader = False
            Properties.ListOptions.SyncMode = True
            Properties.ListSource = dsLotacao
            EditValue = 0
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 6
            Width = 275
          end
          object edtLimite: TcxCurrencyEdit
            Left = 211
            Top = 122
            EditValue = 0.000000000000000000
            Properties.ClearKey = 16452
            Properties.DisplayFormat = '0.00;-0.00'
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 10
            Width = 110
          end
          object edtFuncao: TcxTextEdit
            Left = 3
            Top = 171
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.MaxLength = 180
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 13
            Width = 318
          end
          object BtnSecretaria: TcxButtonEdit
            Left = 618
            Top = 24
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
            Properties.OnButtonClick = BtnSecretariaPropertiesButtonClick
            Style.BorderStyle = ebsFlat
            Style.HotTrack = True
            Style.Shadow = False
            Style.TransparentBorder = True
            Style.ButtonStyle = btsDefault
            TabOrder = 3
            Width = 27
          end
          object BtnEmpresaSind: TcxButtonEdit
            Left = 320
            Top = 24
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
            Properties.OnButtonClick = BtnEmpresaSindPropertiesButtonClick
            Style.BorderStyle = ebsFlat
            Style.HotTrack = True
            Style.Shadow = False
            Style.TransparentBorder = True
            Style.ButtonStyle = btsDefault
            TabOrder = 1
            Width = 27
          end
          object BtnProfissao: TcxButtonEdit
            Left = 320
            Top = 73
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
            Properties.OnButtonClick = BtnProfissaoPropertiesButtonClick
            Style.BorderStyle = ebsFlat
            Style.HotTrack = True
            Style.Shadow = False
            Style.TransparentBorder = True
            Style.ButtonStyle = btsDefault
            TabOrder = 5
            Width = 27
          end
          object BtnLotacao: TcxButtonEdit
            Left = 618
            Top = 73
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
            Properties.OnButtonClick = BtnLotacaoPropertiesButtonClick
            Style.BorderStyle = ebsFlat
            Style.HotTrack = True
            Style.Shadow = False
            Style.TransparentBorder = True
            Style.ButtonStyle = btsDefault
            TabOrder = 7
            Width = 27
          end
          object edtadmissao: TcxDateEdit
            Left = 545
            Top = 122
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
            TabOrder = 12
            Width = 100
          end
          object cxTipoSituacao: TcxLookupComboBox
            Left = 320
            Top = 171
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.ImmediatePost = True
            Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
            Properties.KeyFieldNames = 'id_situacao'
            Properties.ListColumns = <
              item
                Caption = 'Tipo de Situa'#231#227'o'
                FieldName = 'npesquisa'
              end>
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.ShowHeader = False
            Properties.ListOptions.SyncMode = True
            Properties.ListSource = dsTipoSituacao
            EditValue = 0
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 14
            Width = 301
          end
          object BtnTiposituacao: TcxButtonEdit
            Left = 618
            Top = 171
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
            Properties.OnButtonClick = BtnTiposituacaoPropertiesButtonClick
            Style.BorderStyle = ebsFlat
            Style.HotTrack = True
            Style.Shadow = False
            Style.TransparentBorder = True
            Style.ButtonStyle = btsDefault
            TabOrder = 25
            Width = 27
          end
          object cxLocalTrabalho: TcxLookupComboBox
            Left = 3
            Top = 220
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.ImmediatePost = True
            Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
            Properties.KeyFieldNames = 'id_local'
            Properties.ListColumns = <
              item
                Caption = 'Local Trabalho'
                FieldName = 'npesquisa'
              end>
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.ShowHeader = False
            Properties.ListOptions.SyncMode = True
            Properties.ListSource = dsLocalTrabalho
            EditValue = 0
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 15
            Width = 320
          end
          object btnLocalTrabalho: TcxButtonEdit
            Left = 320
            Top = 220
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
            Properties.OnButtonClick = btnLocalTrabalhoPropertiesButtonClick
            Style.BorderStyle = ebsFlat
            Style.HotTrack = True
            Style.Shadow = False
            Style.TransparentBorder = True
            Style.ButtonStyle = btsDefault
            TabOrder = 26
            Width = 27
          end
          object cxCepProf: TcxButtonEdit
            Left = 346
            Top = 220
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
            Properties.OnButtonClick = cxCepProfPropertiesButtonClick
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 16
            Text = '  .   -   '
            Width = 90
          end
          object cxEnderecoProf: TcxTextEdit
            Left = 435
            Top = 220
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.MaxLength = 90
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 17
            Width = 210
          end
          object cxNumeroProf: TcxTextEdit
            Left = 3
            Top = 269
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.MaxLength = 15
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 18
            Width = 81
          end
          object cxBairroProf: TcxTextEdit
            Left = 83
            Top = 269
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.MaxLength = 60
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 19
            Width = 139
          end
          object cxComplementoProf: TcxTextEdit
            Left = 221
            Top = 269
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.MaxLength = 45
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 20
            Width = 126
          end
          object cxCidadeProf: TcxLookupComboBox
            Left = 346
            Top = 269
            Cursor = crIBeam
            Properties.Alignment.Horz = taLeftJustify
            Properties.CaseSensitiveSearch = True
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.DropDownRows = 10
            Properties.DropDownWidth = 400
            Properties.ImmediatePost = True
            Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
            Properties.KeyFieldNames = 'id_cidade'
            Properties.ListColumns = <
              item
                FieldName = 'ncidade'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListOptions.SyncMode = True
            Properties.ListSource = dsCidade
            EditValue = 0
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 21
            Width = 299
          end
          object cxTelefoneProf: TcxMaskEdit
            Left = 3
            Top = 318
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.EditMask = '!\(99\)9999-9999;1;_'
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 22
            Text = '(  )    -    '
            Width = 100
          end
          object cxCelularProf: TcxMaskEdit
            Left = 102
            Top = 318
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.EditMask = '!\(99\)99999-9999;1;_'
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 23
            Text = '(  )     -    '
            Width = 100
          end
        end
      end
    end
  end
  inherited Paneltitulo: TPanel
    TabOrder = 1
    inherited lblTitulo: TLabel
      ExplicitWidth = 737
    end
    inherited BtnFechar: TSpeedButton
      ExplicitLeft = 752
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 480
    Top = 65530
  end
  inherited Ds: TUniDataSource
    Left = 416
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
    Left = 320
    Top = 480
  end
  object dsSede: TUniDataSource
    DataSet = TabSede
    Left = 344
    Top = 504
  end
  object ACBrValidador1: TACBrValidador
    IgnorarChar = './-'
    PermiteVazio = True
    Left = 80
    Top = 552
  end
  object dsLotacao: TUniDataSource
    DataSet = TabSindLotacao
    Left = 216
    Top = 504
  end
  object dsSecretaria: TUniDataSource
    DataSet = TabSecretaria
    Left = 312
    Top = 392
  end
  object dsEmpresa: TUniDataSource
    DataSet = TabSindEmpresa
    Left = 312
    Top = 432
  end
  object dsProfissao: TUniDataSource
    DataSet = TabSindProfissao
    Left = 320
    Top = 352
  end
  object PopCadastro: TPopupMenu
    Left = 532
    Top = 6
    object Sede1: TMenuItem
      Caption = 'Sede'
    end
    object Cidade1: TMenuItem
      Caption = 'Cidade'
    end
    object Empresa1: TMenuItem
      Caption = 'Empresa'
    end
    object Secretria1: TMenuItem
      Caption = 'Secretaria'
    end
    object Profisso1: TMenuItem
      Caption = 'Profiss'#227'o'
    end
    object Lotao1: TMenuItem
      Caption = 'Lota'#231#227'o'
    end
  end
  object TabSede: TClientDataSet
    PersistDataPacket.Data = {
      D20000009619E0BD010000001800000007000000000003000000D2000769645F
      7365646504000100000000000572617A616F0100490000000100055749445448
      02000200B4000866616E74617369610100490000000100055749445448020002
      00B40004636E706A01004900000001000557494454480200020014000763656C
      756C617201004900000001000557494454480200020014000D73656465707269
      6E636970616C0100490000000100055749445448020002000500056E73656465
      010049000000010005574944544802000200FA000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 520
    object TabSedeid_sede: TIntegerField
      FieldName = 'id_sede'
    end
    object TabSederazao: TStringField
      FieldName = 'razao'
      Size = 180
    end
    object TabSedefantasia: TStringField
      FieldName = 'fantasia'
      Size = 180
    end
    object TabSedecnpj: TStringField
      FieldName = 'cnpj'
    end
    object TabSedecelular: TStringField
      FieldName = 'celular'
    end
    object TabSedesedeprincipal: TStringField
      FieldName = 'sedeprincipal'
      Size = 5
    end
    object TabSedensede: TStringField
      FieldName = 'nsede'
      Size = 250
    end
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
    Left = 272
    Top = 480
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
  object TabSindEmpresa: TClientDataSet
    PersistDataPacket.Data = {
      A60000009619E0BD010000001800000006000000000003000000A6000F73696E
      645F69645F656D7072657361040001000000000006636F6469676F0400010000
      0000000964657363726963616F010049000000010005574944544802000200BE
      000769645F73656465040001000000000005617469766F010049000000010005
      5749445448020002000500086E656D7072657361010049000000010005574944
      544802000200BE000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'sind_id_empresa'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'id_sede'
        DataType = ftInteger
      end
      item
        Name = 'ativo'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'nempresa'
        DataType = ftString
        Size = 190
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 272
    Top = 432
    object TabSindEmpresasind_id_empresa: TIntegerField
      FieldName = 'sind_id_empresa'
    end
    object TabSindEmpresacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabSindEmpresadescricao: TStringField
      FieldName = 'descricao'
      Size = 190
    end
    object TabSindEmpresaid_sede: TIntegerField
      FieldName = 'id_sede'
    end
    object TabSindEmpresaativo: TStringField
      FieldName = 'ativo'
      Size = 5
    end
    object TabSindEmpresanempresa: TStringField
      FieldName = 'nempresa'
      Size = 190
    end
  end
  object TabSecretaria: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD01000000180000000400000000000300000079000D69645F
      73656372657461726961040001000000000006636F6469676F04000100000000
      000572617A616F01004900000001000557494454480200020078000B6E736563
      7265746172696101004900000001000557494454480200020078000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_secretaria'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'razao'
        DataType = ftString
        Size = 120
      end
      item
        Name = 'nsecretaria'
        DataType = ftString
        Size = 120
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 272
    Top = 392
    object TabSecretariaid_secretaria: TIntegerField
      FieldName = 'id_secretaria'
    end
    object TabSecretariacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabSecretariarazao: TStringField
      FieldName = 'razao'
      Size = 120
    end
    object TabSecretariansecretaria: TStringField
      FieldName = 'nsecretaria'
      Size = 120
    end
  end
  object TabSindProfissao: TClientDataSet
    PersistDataPacket.Data = {
      950000009619E0BD01000000180000000500000000000300000095000C69645F
      70726F66697373616F040001000000000006636F6469676F0400010000000000
      0964657363726963616F010049000000010005574944544802000200BE000561
      7469766F01004900000001000557494454480200020005000A6E70726F666973
      73616F010049000000010005574944544802000200BE000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_profissao'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'ativo'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'nprofissao'
        DataType = ftString
        Size = 190
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 272
    Top = 352
    object TabSindProfissaoid_profissao: TIntegerField
      FieldName = 'id_profissao'
    end
    object TabSindProfissaocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabSindProfissaodescricao: TStringField
      FieldName = 'descricao'
      Size = 190
    end
    object TabSindProfissaoativo: TStringField
      FieldName = 'ativo'
      Size = 5
    end
    object TabSindProfissaonprofissao: TStringField
      FieldName = 'nprofissao'
      Size = 190
    end
  end
  object TabSindLotacao: TClientDataSet
    PersistDataPacket.Data = {
      910000009619E0BD01000000180000000500000000000300000091000A69645F
      6C6F746163616F040001000000000006636F6469676F04000100000000000964
      657363726963616F010049000000010005574944544802000200BE0005617469
      766F0100490000000100055749445448020002000500086E6C6F746163616F01
      0049000000010005574944544802000200BE000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_lotacao'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'ativo'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'nlotacao'
        DataType = ftString
        Size = 190
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 168
    Top = 504
    object TabSindLotacaoid_lotacao: TIntegerField
      FieldName = 'id_lotacao'
    end
    object TabSindLotacaocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabSindLotacaodescricao: TStringField
      FieldName = 'descricao'
      Size = 190
    end
    object TabSindLotacaoativo: TStringField
      FieldName = 'ativo'
      Size = 5
    end
    object TabSindLotacaonlotacao: TStringField
      FieldName = 'nlotacao'
      Size = 190
    end
  end
  object TabTipoSituacao: TClientDataSet
    PersistDataPacket.Data = {
      6A0000009619E0BD0100000018000000030000000000030000006A000B69645F
      736974756163616F04000100000000000964657363726963616F010049000000
      0100055749445448020002005000096E70657371756973610100490000000100
      0557494454480200020064000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_situacao'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'npesquisa'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 432
    Top = 400
    object TabTipoSituacaoid_situacao: TIntegerField
      FieldName = 'id_situacao'
    end
    object TabTipoSituacaodescricao: TStringField
      FieldName = 'descricao'
      Size = 80
    end
    object TabTipoSituacaonpesquisa: TStringField
      FieldName = 'npesquisa'
      Size = 100
    end
  end
  object TabLocalTrabalho: TClientDataSet
    PersistDataPacket.Data = {
      670000009619E0BD01000000180000000300000000000300000067000869645F
      6C6F63616C04000100000000000964657363726963616F010049000000010005
      5749445448020002005000096E70657371756973610100490000000100055749
      4454480200020064000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_local'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'npesquisa'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 432
    Top = 456
    object TabLocalTrabalhoid_local: TIntegerField
      FieldName = 'id_local'
    end
    object TabLocalTrabalhodescricao: TStringField
      FieldName = 'descricao'
      Size = 80
    end
    object TabLocalTrabalhonpesquisa: TStringField
      FieldName = 'npesquisa'
      Size = 100
    end
  end
  object dsTipoSituacao: TUniDataSource
    DataSet = TabTipoSituacao
    Left = 506
    Top = 398
  end
  object dsLocalTrabalho: TUniDataSource
    DataSet = TabLocalTrabalho
    Left = 506
    Top = 462
  end
  object TabMotivo: TClientDataSet
    PersistDataPacket.Data = {
      680000009619E0BD01000000180000000300000000000300000068000969645F
      6D6F7469766F04000100000000000964657363726963616F0100490000000100
      055749445448020002005000096E706573717569736101004900000001000557
      494454480200020064000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_motivo'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'npesquisa'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 104
    Top = 530
    object TabMotivoid_motivo: TIntegerField
      FieldName = 'id_motivo'
    end
    object TabMotivodescricao: TStringField
      FieldName = 'descricao'
      Size = 80
    end
    object TabMotivonpesquisa: TStringField
      FieldName = 'npesquisa'
      Size = 100
    end
  end
  object TabResponsavel: TClientDataSet
    PersistDataPacket.Data = {
      5D0000009619E0BD0100000018000000030000000000030000005D000A69645F
      7573756172696F0400010000000000046E6F6D65010049000000010005574944
      5448020002003C000E69645F66756E63696F6E6172696F040001000000000000
      00}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_usuario'
        DataType = ftInteger
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'id_funcionario'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 104
    Top = 482
    object TabResponsavelid_usuario: TIntegerField
      FieldName = 'id_usuario'
    end
    object TabResponsavelnome: TStringField
      FieldName = 'nome'
      Size = 60
    end
    object TabResponsavelid_funcionario: TIntegerField
      FieldName = 'id_funcionario'
    end
  end
  object dsresponsavel: TUniDataSource
    DataSet = TabResponsavel
    Left = 200
    Top = 571
  end
  object dsmotivo: TUniDataSource
    DataSet = TabMotivo
    Left = 256
    Top = 587
  end
end
