inherited FrmLancamentoBancario: TFrmLancamentoBancario
  Caption = 'Lan'#231'amento banc'#225'rio'
  ClientHeight = 585
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitHeight = 585
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 557
    ExplicitTop = 557
  end
  inherited PanelClient: TPanel
    Height = 514
    ExplicitHeight = 514
    inherited dxBevel1: TdxBevel
      Height = 508
      ExplicitHeight = 434
    end
    object Label7: TLabel [1]
      Left = 9
      Top = 10
      Width = 34
      Height = 17
      Caption = 'Conta'
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
    object Label1: TLabel [2]
      Left = 313
      Top = 10
      Width = 79
      Height = 17
      Caption = 'Data Emiss'#227'o'
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
    object Label2: TLabel [3]
      Left = 422
      Top = 10
      Width = 76
      Height = 17
      Caption = 'Compet'#234'ncia'
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
    object Label3: TLabel [4]
      Left = 531
      Top = 10
      Width = 67
      Height = 17
      Caption = 'Vencimento'
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
    object Label4: TLabel [5]
      Left = 9
      Top = 59
      Width = 48
      Height = 17
      Caption = 'N'#250'mero'
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
    object Label5: TLabel [6]
      Left = 98
      Top = 59
      Width = 30
      Height = 17
      Caption = 'Valor'
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
    object Label6: TLabel [7]
      Left = 184
      Top = 59
      Width = 26
      Height = 17
      Caption = 'Tipo'
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
    object Label8: TLabel [8]
      Left = 313
      Top = 59
      Width = 49
      Height = 17
      Caption = 'Situa'#231#227'o'
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
    object Label9: TLabel [9]
      Left = 9
      Top = 108
      Width = 52
      Height = 17
      Caption = 'Hist'#243'rico'
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
    object Label10: TLabel [10]
      Left = 9
      Top = 157
      Width = 70
      Height = 17
      Caption = 'Observa'#231#227'o'
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
    object Label11: TLabel [11]
      Left = 313
      Top = 108
      Width = 196
      Height = 17
      Caption = 'Forma Pagamento / Recebimento'
      Color = 8679796
      DragCursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5325111
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      StyleName = 'Windows'
    end
    object Label12: TLabel [12]
      Left = 422
      Top = 59
      Width = 44
      Height = 17
      Caption = 'Cheque'
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
    object Label17: TLabel [13]
      Left = 531
      Top = 59
      Width = 49
      Height = 17
      Caption = 'Previs'#227'o'
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
    inherited BtnSalvar: TStyledBitBtn
      Top = 471
      TabOrder = 15
      OnClick = BtnSalvarClick
      ExplicitTop = 471
    end
    inherited BtnCancelar: TStyledBitBtn
      Top = 471
      TabOrder = 16
      OnClick = BtnCancelarClick
      ExplicitTop = 471
    end
    object cxconta: TcxLookupComboBox
      Left = 9
      Top = 28
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownWidth = 305
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id_conta'
      Properties.ListColumns = <
        item
          Caption = 'Categoria'
          FieldName = 'npesquisa'
        end>
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = Ds
      Properties.ReadOnly = False
      EditValue = 0
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 0
      Width = 281
    end
    object BtnSede: TcxButtonEdit
      Left = 287
      Top = 28
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
      TabOrder = 17
      Width = 27
    end
    object cxemissao: TcxDateEdit
      Left = 313
      Top = 28
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
      Properties.ReadOnly = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 1
      Width = 110
    end
    object cxcompetencia: TcxDateEdit
      Left = 422
      Top = 28
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
      Properties.ReadOnly = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 2
      Width = 110
    end
    object cxvencimento: TcxDateEdit
      Left = 531
      Top = 28
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
      Properties.ReadOnly = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 3
      Width = 110
    end
    object cxnumero: TcxTextEdit
      Left = 9
      Top = 77
      Cursor = crIBeam
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 4
      Width = 90
    end
    object cxvalor: TcxCurrencyEdit
      Left = 98
      Top = 77
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 5
      Width = 87
    end
    object cxtipo: TcxComboBox
      Left = 184
      Top = 77
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Cr'#233'dito (Receita)'
        'D'#233'bito (Despesa)')
      Properties.OnChange = cxtipoPropertiesChange
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 6
      Width = 130
    end
    object cxsituacao: TcxComboBox
      Left = 313
      Top = 77
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Pendente'
        'Concluido')
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 7
      Text = 'PENDENTE'
      Width = 110
    end
    object cxhistorico: TcxLookupComboBox
      Left = 9
      Top = 126
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownWidth = 303
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id_historico'
      Properties.ListColumns = <
        item
          FieldName = 'npesquisa'
        end>
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = dsHistorico
      Properties.ReadOnly = False
      EditValue = 0
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 10
      Width = 281
    end
    object btnHistorico: TcxButtonEdit
      Left = 287
      Top = 126
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
      Properties.OnButtonClick = btnHistoricoPropertiesButtonClick
      Style.BorderStyle = ebsFlat
      Style.HotTrack = True
      Style.Shadow = False
      Style.TransparentBorder = True
      Style.ButtonStyle = btsDefault
      TabOrder = 18
      Width = 27
    end
    object cxobs: TcxMemo
      Left = 9
      Top = 175
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 12
      Height = 89
      Width = 632
    end
    object cxprazo: TcxLookupComboBox
      Left = 313
      Top = 126
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownWidth = 328
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id_prazo'
      Properties.ListColumns = <
        item
          FieldName = 'nprazopag'
        end>
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = dsprazo
      Properties.ReadOnly = False
      EditValue = 0
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 11
      Width = 304
    end
    object btnprazo: TcxButtonEdit
      Left = 614
      Top = 126
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
      Properties.OnButtonClick = btnprazoPropertiesButtonClick
      Style.BorderStyle = ebsFlat
      Style.HotTrack = True
      Style.Shadow = False
      Style.TransparentBorder = True
      Style.ButtonStyle = btsDefault
      TabOrder = 19
      Width = 27
    end
    object cxcheque: TcxComboBox
      Left = 422
      Top = 77
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'SIM'
        'N'#195'O')
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 8
      Text = 'N'#195'O'
      Width = 110
    end
    object cxGroupBox1: TcxGroupBox
      Left = 9
      Top = 270
      Caption = 'Classifica'#231#227'o'
      PanelStyle.Active = True
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 13
      Transparent = True
      Height = 119
      Width = 632
      object Label13: TLabel
        Left = 3
        Top = 20
        Width = 95
        Height = 17
        Caption = 'Plano de Contas'
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
      object Label14: TLabel
        Left = 304
        Top = 20
        Width = 95
        Height = 17
        Caption = 'Centro de Custo'
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
      object Label15: TLabel
        Left = 3
        Top = 69
        Width = 144
        Height = 17
        Caption = 'Favorecido / Fornecedor'
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
      object Label16: TLabel
        Left = 304
        Top = 69
        Width = 84
        Height = 17
        Caption = 'Departamento'
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
      object cxplano: TcxLookupComboBox
        Left = 3
        Top = 38
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.DropDownWidth = 301
        Properties.ImmediatePost = True
        Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
        Properties.KeyFieldNames = 'id_planoconta'
        Properties.ListColumns = <
          item
            FieldName = 'DESCRICAO_COMPLETA'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dsPlano
        Properties.ReadOnly = False
        Style.TextStyle = []
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 0
        Width = 278
      end
      object btnplano: TcxButtonEdit
        Left = 278
        Top = 38
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
        Properties.OnButtonClick = btnplanoPropertiesButtonClick
        Style.BorderStyle = ebsFlat
        Style.HotTrack = True
        Style.Shadow = False
        Style.TransparentBorder = True
        Style.ButtonStyle = btsDefault
        TabOrder = 4
        Width = 27
      end
      object cxcusto: TcxLookupComboBox
        Left = 304
        Top = 38
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.DropDownWidth = 325
        Properties.ImmediatePost = True
        Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
        Properties.KeyFieldNames = 'id_custo'
        Properties.ListColumns = <
          item
            FieldName = 'custo'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dsCusto
        Properties.ReadOnly = False
        EditValue = 0
        Style.TextStyle = []
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 1
        Width = 325
      end
      object btncusto: TcxButtonEdit
        Left = 602
        Top = 38
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
        Properties.OnButtonClick = btncustoPropertiesButtonClick
        Style.BorderStyle = ebsFlat
        Style.HotTrack = True
        Style.Shadow = False
        Style.TransparentBorder = True
        Style.ButtonStyle = btsDefault
        TabOrder = 5
        Visible = False
        Width = 27
      end
      object cxfavorecido: TcxLookupComboBox
        Left = 3
        Top = 87
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.DropDownWidth = 301
        Properties.ImmediatePost = True
        Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
        Properties.KeyFieldNames = 'id_socio'
        Properties.ListColumns = <
          item
            FieldName = 'cliente'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dspessoa
        Properties.ReadOnly = False
        EditValue = 0
        Style.TextStyle = []
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 2
        Width = 278
      end
      object btnfavorecido: TcxButtonEdit
        Left = 278
        Top = 87
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
        Properties.OnButtonClick = btnfavorecidoPropertiesButtonClick
        Style.BorderStyle = ebsFlat
        Style.HotTrack = True
        Style.Shadow = False
        Style.TransparentBorder = True
        Style.ButtonStyle = btsDefault
        TabOrder = 6
        Width = 27
      end
      object cxdepartamento: TcxLookupComboBox
        Left = 304
        Top = 87
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.DropDownWidth = 325
        Properties.ImmediatePost = True
        Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
        Properties.KeyFieldNames = 'id_departamento'
        Properties.ListColumns = <
          item
            FieldName = 'npesquisa'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dsdepartamento
        Properties.ReadOnly = False
        EditValue = 0
        Style.TextStyle = []
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 3
        Width = 301
      end
      object btndepartamento: TcxButtonEdit
        Left = 602
        Top = 87
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
        Properties.OnButtonClick = btndepartamentoPropertiesButtonClick
        Style.BorderStyle = ebsFlat
        Style.HotTrack = True
        Style.Shadow = False
        Style.TransparentBorder = True
        Style.ButtonStyle = btsDefault
        TabOrder = 7
        Width = 27
      end
    end
    object cxprevisao: TcxComboBox
      Left = 531
      Top = 77
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'SIM'
        'N'#195'O')
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 9
      Text = 'N'#195'O'
      Width = 110
    end
    object cxGrupConciliacao: TcxGroupBox
      Left = 9
      Top = 395
      Caption = 'Concilia'#231#227'o'
      PanelStyle.Active = True
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 14
      Transparent = True
      Visible = False
      Height = 70
      Width = 632
      object Label18: TLabel
        Left = 3
        Top = 20
        Width = 95
        Height = 17
        Caption = 'Data concilia'#231#227'o'
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
      object cxDataConciliacao: TcxDateEdit
        Left = 3
        Top = 36
        ParentFont = False
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
        Properties.ReadOnly = False
        Properties.SaveTime = False
        Properties.ShowTime = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 0
        Width = 110
      end
      object cxConciliacao: TcxCheckBox
        Left = 119
        Top = 38
        Caption = 'Conciliado'
        ParentFont = False
        Properties.DisplayChecked = 'S'
        Properties.DisplayUnchecked = 'N'
        Properties.DisplayGrayed = 'S'
        Properties.ImmediatePost = True
        Properties.ValueChecked = 'S'
        Properties.ValueGrayed = 'N'
        Properties.ValueUnchecked = 'N'
        State = cbsChecked
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        TabOrder = 1
        Transparent = True
      end
    end
  end
  inherited Paneltitulo: TPanel
    inherited lblTitulo: TLabel
      Caption = 'Lan'#231'amento'
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 552
    Top = 10
  end
  inherited Ds: TUniDataSource
    DataSet = TabConta
    Left = 8
    Top = 432
  end
  inherited cxStyle: TcxStyleRepository
    Left = 479
    Top = 65535
    PixelsPerInch = 96
    inherited CxGridPedido: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    inherited GridTableDependente: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
  object TabConta: TClientDataSet
    PersistDataPacket.Data = {
      C80000009619E0BD010000001800000007000000000003000000C8000869645F
      636F6E7461040001000000000006636F6469676F040001000000000007616765
      6E6369610100490000000100055749445448020002000A0005636F6E74610100
      490000000100055749445448020002000A000B636F7272656E74697374610100
      4900000001000557494454480200020050000562616E636F0100490000000100
      055749445448020002003C00096E706573717569736101004900000001000557
      4944544802000200C8000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 8
    Top = 459
    object TabContaid_conta: TIntegerField
      FieldName = 'id_conta'
    end
    object TabContacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabContaagencia: TStringField
      FieldName = 'agencia'
      Size = 10
    end
    object TabContaconta: TStringField
      FieldName = 'conta'
      Size = 10
    end
    object TabContacorrentista: TStringField
      FieldName = 'correntista'
      Size = 80
    end
    object TabContabanco: TStringField
      FieldName = 'banco'
      Size = 60
    end
    object TabContanpesquisa: TStringField
      FieldName = 'npesquisa'
      Size = 200
    end
  end
  object dsPlano: TUniDataSource
    DataSet = TabPlano
    Left = 48
    Top = 432
  end
  object TabPlano: TClientDataSet
    PersistDataPacket.Data = {
      800000009619E0BD01000000180000000400000000000300000080000D69645F
      706C616E6F636F6E7461040001000000000006636F6469676F01004900000001
      00055749445448020002003200056E6976656C04000100000000001244455343
      524943414F5F434F4D504C455441010049000000010005574944544802000200
      78000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 459
    object TabPlanoid_planoconta: TIntegerField
      FieldName = 'id_planoconta'
    end
    object TabPlanocodigo: TStringField
      FieldName = 'codigo'
      Size = 50
    end
    object TabPlanonivel: TIntegerField
      FieldName = 'nivel'
    end
    object TabPlanoDESCRICAO_COMPLETA: TStringField
      FieldName = 'DESCRICAO_COMPLETA'
      Size = 120
    end
  end
  object TabCusto: TClientDataSet
    PersistDataPacket.Data = {
      630000009619E0BD01000000180000000300000000000300000063000869645F
      637573746F04000100000000000964657363726963616F010049000000010005
      5749445448020002003C0005637573746F010049000000010005574944544802
      00020050000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 96
    Top = 459
    object TabCustoid_custo: TIntegerField
      FieldName = 'id_custo'
    end
    object TabCustodescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object TabCustocusto: TStringField
      FieldName = 'custo'
      Size = 80
    end
  end
  object dsCusto: TUniDataSource
    DataSet = TabCusto
    Left = 96
    Top = 432
  end
  object TabHistorico: TClientDataSet
    PersistDataPacket.Data = {
      6B0000009619E0BD0100000018000000030000000000030000006B000C69645F
      686973746F7269636F04000100000000000964657363726963616F0100490000
      000100055749445448020002003C00096E706573717569736101004900000001
      000557494454480200020064000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_historico'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'npesquisa'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 144
    Top = 459
    object TabHistoricoid_historico: TIntegerField
      FieldName = 'id_historico'
    end
    object TabHistoricodescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object TabHistoriconpesquisa: TStringField
      FieldName = 'npesquisa'
      Size = 100
    end
  end
  object dsHistorico: TUniDataSource
    DataSet = TabHistorico
    Left = 144
    Top = 432
  end
  object dsprazo: TUniDataSource
    DataSet = TabPrazo
    Left = 192
    Top = 432
  end
  object dspessoa: TUniDataSource
    DataSet = TabPessoa
    Left = 240
    Top = 432
  end
  object dsdepartamento: TUniDataSource
    DataSet = TabDepartamento
    Left = 280
    Top = 432
  end
  object TabPrazo: TClientDataSet
    PersistDataPacket.Data = {
      580000009619E0BD01000000180000000300000000000300000058000869645F
      7072617A6F040001000000000006636F6469676F0400010000000000096E7072
      617A6F70616701004900000001000557494454480200020096000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 459
    object TabPrazoid_prazo: TIntegerField
      FieldName = 'id_prazo'
    end
    object TabPrazocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabPrazonprazopag: TStringField
      FieldName = 'nprazopag'
      Size = 150
    end
  end
  object TabPessoa: TClientDataSet
    PersistDataPacket.Data = {
      AF0000009619E0BD010000001800000006000000000003000000AF000869645F
      736F63696F0400010000000000046E6F6D650100490000000100055749445448
      0200020078000363706601004900000001000557494454480200020014000763
      6C69656E7465010049000000010005574944544802000200C800087768617473
      6170700100490000000100055749445448020002000A0005617669736F020049
      000000010005574944544802000200FF000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 459
    object TabPessoaid_socio: TIntegerField
      FieldName = 'id_socio'
    end
    object TabPessoanome: TStringField
      FieldName = 'nome'
      Size = 120
    end
    object TabPessoacpf: TStringField
      FieldName = 'cpf'
    end
    object TabPessoacliente: TStringField
      FieldName = 'cliente'
      Size = 200
    end
    object TabPessoawhatsapp: TStringField
      FieldName = 'whatsapp'
      Size = 10
    end
    object TabPessoaaviso: TStringField
      FieldName = 'aviso'
      Size = 255
    end
  end
  object TabDepartamento: TClientDataSet
    PersistDataPacket.Data = {
      6E0000009619E0BD0100000018000000030000000000030000006E000F69645F
      646570617274616D656E746F04000100000000000964657363726963616F0100
      490000000100055749445448020002003C00096E706573717569736101004900
      000001000557494454480200020078000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 281
    Top = 457
    object TabDepartamentoid_departamento: TIntegerField
      FieldName = 'id_departamento'
    end
    object TabDepartamentodescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object TabDepartamentonpesquisa: TStringField
      FieldName = 'npesquisa'
      Size = 120
    end
  end
end
