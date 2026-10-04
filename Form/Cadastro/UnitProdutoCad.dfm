inherited FrmProdutoCad: TFrmProdutoCad
  Caption = 'Produto'
  ClientHeight = 616
  Color = clWhite
  OnShow = FormShow
  ExplicitHeight = 616
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 588
    ExplicitTop = 588
  end
  inherited PanelClient: TPanel
    Height = 545
    ExplicitHeight = 545
    inherited dxBevel1: TdxBevel
      Height = 539
      ExplicitHeight = 545
    end
    object Label26: TLabel [1]
      Left = 9
      Top = 10
      Width = 43
      Height = 17
      Caption = 'C'#243'digo'
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
    object Label27: TLabel [2]
      Left = 78
      Top = 10
      Width = 84
      Height = 17
      Caption = 'C'#243'digo Barras'
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
    object Label30: TLabel [3]
      Left = 177
      Top = 10
      Width = 76
      Height = 17
      Caption = 'C'#243'digo GTIN'
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
    object dxBevel2: TdxBevel [4]
      Left = 480
      Top = 7
      Width = 165
      Height = 144
    end
    object edtFoto: TImage [5]
      Left = 481
      Top = 7
      Width = 163
      Height = 142
      Center = True
      Picture.Data = {
        0D546478536D617274496D6167653C3F786D6C2076657273696F6E3D22312E30
        2220656E636F64696E673D225554462D38223F3E0D0A3C737667207665727369
        6F6E3D22312E31222069643D224C617965725F312220786D6C6E733D22687474
        703A2F2F7777772E77332E6F72672F323030302F7376672220786D6C6E733A78
        6C696E6B3D22687474703A2F2F7777772E77332E6F72672F313939392F786C69
        6E6B2220783D223070782220793D22307078222076696577426F783D22302030
        20333220333222207374796C653D22656E61626C652D6261636B67726F756E64
        3A6E6577203020302033322033323B2220786D6C3A73706163653D2270726573
        65727665223E262331333B262331303B3C7374796C6520747970653D22746578
        742F6373732220786D6C3A73706163653D227072657365727665223E2E59656C
        6C6F777B66696C6C3A234646423131353B7D262331333B262331303B2623393B
        2E5265647B66696C6C3A234431314331433B7D262331333B262331303B262339
        3B2E426C61636B7B66696C6C3A233732373237323B7D262331333B262331303B
        2623393B2E477265656E7B66696C6C3A233033394332333B7D262331333B2623
        31303B2623393B2E426C75657B66696C6C3A233131373744373B7D3C2F737479
        6C653E0D0A3C672069643D22426F78223E0D0A09093C706F6C79676F6E20636C
        6173733D22426C61636B2220706F696E74733D2231382C342031302C3420322C
        31322031302C3132202623393B222F3E0D0A09093C7265637420783D22322220
        793D2231342220636C6173733D22426C61636B222077696474683D2232302220
        6865696768743D223134222F3E0D0A09093C706F6C79676F6E20636C6173733D
        22426C61636B2220706F696E74733D2232342C32382033302C32322033302C36
        2E382032342C31322E38202623393B222F3E0D0A09093C706F6C79676F6E2063
        6C6173733D22426C61636B2220706F696E74733D2232312C342031332C313220
        32312E392C31322032392E392C34202623393B222F3E0D0A093C2F673E0D0A3C
        2F7376673E0D0A}
      Proportional = True
      Transparent = True
      OnDblClick = edtFotoDblClick
    end
    object Label31: TLabel [6]
      Left = 9
      Top = 59
      Width = 57
      Height = 17
      Caption = 'Descri'#231#227'o'
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
    object Label32: TLabel [7]
      Left = 276
      Top = 10
      Width = 61
      Height = 17
      Caption = 'Refer'#234'ncia'
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
    object Label1: TLabel [8]
      Left = 9
      Top = 108
      Width = 90
      Height = 17
      Caption = 'Descri'#231#227'o fiscal'
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
    object Label2: TLabel [9]
      Left = 9
      Top = 157
      Width = 37
      Height = 17
      Caption = 'Grupo'
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
    object Label3: TLabel [10]
      Left = 322
      Top = 157
      Width = 37
      Height = 17
      Caption = 'Marca'
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
    object Label4: TLabel [11]
      Left = 9
      Top = 206
      Width = 67
      Height = 17
      Caption = 'Localiza'#231#227'o'
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
    object Label33: TLabel [12]
      Left = 203
      Top = 206
      Width = 97
      Height = 17
      Caption = 'Tipo de produto'
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
    object Label5: TLabel [13]
      Left = 487
      Top = 206
      Width = 49
      Height = 17
      Caption = 'Unidade'
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
    object Label7: TLabel [14]
      Left = 9
      Top = 255
      Width = 72
      Height = 17
      Caption = 'Prc. Compra'
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
    object Label9: TLabel [15]
      Left = 100
      Top = 255
      Width = 48
      Height = 17
      Caption = '% Custo'
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
    object Label10: TLabel [16]
      Left = 191
      Top = 255
      Width = 58
      Height = 17
      Caption = 'Prc. Custo'
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
    object Label12: TLabel [17]
      Left = 282
      Top = 255
      Width = 47
      Height = 17
      Caption = '% Lucro'
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
    object Label22: TLabel [18]
      Left = 373
      Top = 255
      Width = 61
      Height = 17
      Caption = 'Prc. Venda'
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
    object Label34: TLabel [19]
      Left = 465
      Top = 255
      Width = 85
      Height = 17
      Caption = 'Prc. Promo'#231#227'o'
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
    object Label35: TLabel [20]
      Left = 556
      Top = 256
      Width = 72
      Height = 17
      Caption = '% Comiss'#227'o'
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
    object Label36: TLabel [21]
      Left = 9
      Top = 304
      Width = 68
      Height = 17
      Caption = 'Est. M'#237'nimo'
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
    object Label37: TLabel [22]
      Left = 100
      Top = 304
      Width = 71
      Height = 17
      Caption = 'Est. M'#225'ximo'
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
    object lbEstoque: TLabel [23]
      Left = 556
      Top = 304
      Width = 80
      Height = 17
      Caption = 'Estoque Atual'
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
    object Label39: TLabel [24]
      Left = 9
      Top = 353
      Width = 56
      Height = 17
      Caption = 'Peso (KG)'
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
    object Label40: TLabel [25]
      Left = 101
      Top = 353
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
    object Label41: TLabel [26]
      Left = 373
      Top = 353
      Width = 37
      Height = 17
      Caption = 'Avisos'
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
    object Label6: TLabel [27]
      Left = 191
      Top = 304
      Width = 45
      Height = 17
      Caption = 'Largura'
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
    object Label8: TLabel [28]
      Left = 282
      Top = 304
      Width = 34
      Height = 17
      Caption = 'Altura'
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
    object Label11: TLabel [29]
      Left = 373
      Top = 304
      Width = 27
      Height = 17
      Caption = 'Area'
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
    object Label13: TLabel [30]
      Left = 465
      Top = 304
      Width = 29
      Height = 17
      Caption = 'Qtde'
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
      Left = 424
      Top = 504
      TabOrder = 35
      OnClick = BtnSalvarClick
      ExplicitLeft = 424
      ExplicitTop = 504
    end
    inherited BtnCancelar: TStyledBitBtn
      Left = 535
      Top = 504
      TabOrder = 36
      OnClick = BtnCancelarClick
      ExplicitLeft = 535
      ExplicitTop = 504
    end
    object cxCodigo: TcxTextEdit
      Left = 9
      Top = 28
      TabStop = False
      Properties.ReadOnly = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 0
      Width = 70
    end
    object cxBarra: TcxTextEdit
      Left = 78
      Top = 28
      Cursor = crIBeam
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Style.Color = clWindow
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 1
      OnKeyPress = cxBarraKeyPress
      Width = 100
    end
    object cxGTIN: TcxTextEdit
      Left = 177
      Top = 28
      Cursor = crIBeam
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Style.Color = clWindow
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 2
      OnKeyPress = cxGTINKeyPress
      Width = 100
    end
    object cxRef: TcxTextEdit
      Left = 276
      Top = 28
      Cursor = crIBeam
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Style.Color = clWindow
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 3
      Width = 204
    end
    object cxDescricao: TcxTextEdit
      Left = 9
      Top = 77
      Cursor = crIBeam
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Style.Color = clWindow
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 4
      Width = 471
    end
    object cxFiscal: TcxTextEdit
      Left = 9
      Top = 126
      Cursor = crIBeam
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Style.Color = clWindow
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 5
      Width = 471
    end
    object cxGrupo: TcxLookupComboBox
      Left = 9
      Top = 175
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.KeyFieldNames = 'id_grupo'
      Properties.ListColumns = <
        item
          Caption = 'Grupo'
          FieldName = 'nmgrupo'
        end>
      Properties.ListSource = dsGrupo
      EditValue = 0
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 6
      Width = 290
    end
    object BtnGrupo: TcxButtonEdit
      Left = 296
      Top = 175
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
      Properties.OnButtonClick = BtnGrupoPropertiesButtonClick
      Style.BorderStyle = ebsFlat
      Style.HotTrack = True
      Style.Shadow = False
      Style.TransparentBorder = True
      Style.ButtonStyle = btsDefault
      TabOrder = 37
      Width = 27
    end
    object cxLocalizacao: TcxLookupComboBox
      Left = 9
      Top = 224
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.KeyFieldNames = 'id_localizacao'
      Properties.ListColumns = <
        item
          Caption = 'Localiza'#231#227'o'
          FieldName = 'nmlocalizacao'
        end>
      Properties.ListSource = dsLocalizacao
      EditValue = 0
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 8
      Width = 171
    end
    object BtnLocalizacao: TcxButtonEdit
      Left = 177
      Top = 224
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
      Properties.OnButtonClick = BtnLocalizacaoPropertiesButtonClick
      Style.BorderStyle = ebsFlat
      Style.HotTrack = True
      Style.Shadow = False
      Style.TransparentBorder = True
      Style.ButtonStyle = btsDefault
      TabOrder = 38
      Width = 27
    end
    object cxTipo: TcxComboBox
      Left = 203
      Top = 224
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        '00-MERCADORIA PARA REVENDA'
        '01-MAT'#201'RIA PRIMA '
        '02-EMBALAGEM'
        '03-PRODUTO EM PROCESSO'
        '04-PRODUTO ACABADO'
        '05-SUBPRODUTO'
        '06-PRODUTO INTERMEDI'#193'RIO'
        '07-MATERIAL DE USO/CONSUMO'
        '08-ATIVO IMOBILIZADO'
        '09-SERVI'#199'OS'
        '10-OUTROS INSUMOS'
        '99-OUTROS')
      Properties.MaxLength = 45
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 9
      Text = '00-MERCADORIA PARA REVENDA'
      Width = 285
    end
    object cxUnidade: TcxLookupComboBox
      Left = 487
      Top = 224
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.KeyFieldNames = 'id_unidade'
      Properties.ListColumns = <
        item
          Caption = 'Unidade'
          Width = 150
          FieldName = 'nmunidade'
        end>
      Properties.ListSource = dsUnidade
      EditValue = 0
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 10
      Width = 134
    end
    object btnUnidade: TcxButtonEdit
      Left = 618
      Top = 224
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
      Properties.OnButtonClick = btnUnidadePropertiesButtonClick
      Style.BorderStyle = ebsFlat
      Style.HotTrack = True
      Style.Shadow = False
      Style.TransparentBorder = True
      Style.ButtonStyle = btsDefault
      TabOrder = 39
      Width = 27
    end
    object cxprccompra: TcxCurrencyEdit
      Left = 9
      Top = 273
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 11
      Width = 92
    end
    object cxperccusto: TcxCurrencyEdit
      Left = 100
      Top = 273
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 12
      Width = 92
    end
    object cxprccusto: TcxCurrencyEdit
      Left = 191
      Top = 273
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 13
      Width = 92
    end
    object cxperclucro: TcxCurrencyEdit
      Left = 282
      Top = 273
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 14
      Width = 92
    end
    object cxprcvenda: TcxCurrencyEdit
      Left = 373
      Top = 273
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 15
      Width = 93
    end
    object cxprcpromocao: TcxCurrencyEdit
      Left = 465
      Top = 273
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 16
      Width = 92
    end
    object cxperccomissao: TcxCurrencyEdit
      Left = 556
      Top = 273
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 17
      Width = 89
    end
    object cxestminimo: TcxCurrencyEdit
      Left = 9
      Top = 322
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 18
      Width = 92
    end
    object cxestmaximo: TcxCurrencyEdit
      Left = 100
      Top = 322
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 19
      Width = 92
    end
    object cxestatual: TcxCurrencyEdit
      Left = 556
      Top = 322
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DecimalPlaces = 3
      Properties.DisplayFormat = '0.000;-0.000'
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 20
      Width = 89
    end
    object cxpeso: TcxCurrencyEdit
      Left = 9
      Top = 371
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 21
      Width = 92
    end
    object cxobs: TcxBlobEdit
      Left = 100
      Top = 371
      Properties.BlobEditKind = bekMemo
      Properties.ClearKey = 16452
      Properties.MemoCharCase = ecUpperCase
      Properties.MemoMaxLength = 250
      Properties.PopupHeight = 185
      Properties.PopupWidth = 274
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 22
      Width = 274
    end
    object cxaviso: TcxBlobEdit
      Left = 373
      Top = 371
      Properties.BlobEditKind = bekMemo
      Properties.ClearKey = 16452
      Properties.MemoCharCase = ecUpperCase
      Properties.MemoMaxLength = 250
      Properties.PopupHeight = 185
      Properties.PopupWidth = 271
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 23
      Width = 272
    end
    object cxativo: TcxCheckBox
      Left = 9
      Top = 402
      Caption = 'Ativo'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      State = cbsChecked
      Style.TransparentBorder = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 24
      Transparent = True
    end
    object cxaltdescricao: TcxCheckBox
      Left = 152
      Top = 402
      Caption = 'Alt. descri'#231#227'o (venda)'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 28
      Transparent = True
    end
    object cxexibirapp: TcxCheckBox
      Left = 152
      Top = 429
      Caption = 'Exibir WebApp'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 29
      Transparent = True
    end
    object cxservico: TcxCheckBox
      Left = 9
      Top = 429
      Caption = 'Servi'#231'o'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 25
      Transparent = True
    end
    object cxfracionado: TcxCheckBox
      Left = 9
      Top = 456
      Caption = 'Fracionado'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 26
      Transparent = True
    end
    object cxcontrolaestoque: TcxCheckBox
      Left = 152
      Top = 456
      Caption = 'Controla estoque'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      State = cbsChecked
      Style.TransparentBorder = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 30
      Transparent = True
    end
    object cxequipamento: TcxCheckBox
      Left = 9
      Top = 483
      Caption = 'Equipamento'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 27
      Transparent = True
    end
    object cxestoquenegativo: TcxCheckBox
      Left = 152
      Top = 483
      Caption = 'Permite estoque negativo'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 31
      Transparent = True
    end
    object cxmateriaprima: TcxCheckBox
      Left = 359
      Top = 402
      Caption = 'Mat'#233'ria-prima'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 32
      Transparent = True
    end
    object cxMarca: TcxLookupComboBox
      Left = 322
      Top = 175
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.KeyFieldNames = 'id_marca'
      Properties.ListColumns = <
        item
          Caption = 'Marca'
          FieldName = 'nmmarca'
        end>
      Properties.ListSource = dsMarca
      EditValue = 0
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 7
      Width = 299
    end
    object cxPrecom2: TcxCheckBox
      Left = 359
      Top = 429
      Caption = 'Pre'#231'o em M'#178
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
    object cxusachapa: TcxCheckBox
      Left = 359
      Top = 456
      Caption = 'Usa chapa'
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
      OnClick = cxusachapaClick
    end
    object cxlargura: TcxCurrencyEdit
      Left = 191
      Top = 322
      EditValue = 0.000000000000000000
      Enabled = False
      Properties.ClearKey = 16452
      Properties.DecimalPlaces = 3
      Properties.DisplayFormat = '0.000;-0.000'
      Properties.OnEditValueChanged = cxlarguraPropertiesEditValueChanged
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 40
      Width = 92
    end
    object cxaltura: TcxCurrencyEdit
      Left = 282
      Top = 322
      EditValue = 0.000000000000000000
      Enabled = False
      Properties.ClearKey = 16452
      Properties.DecimalPlaces = 3
      Properties.DisplayFormat = '0.000;-0.000'
      Properties.OnEditValueChanged = cxlarguraPropertiesEditValueChanged
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 41
      Width = 92
    end
    object cxarea: TcxCurrencyEdit
      Left = 373
      Top = 322
      EditValue = 0.000000000000000000
      Enabled = False
      Properties.ClearKey = 16452
      Properties.DecimalPlaces = 3
      Properties.DisplayFormat = '0.000;-0.000'
      Properties.OnEditValueChanged = cxlarguraPropertiesEditValueChanged
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 42
      Width = 93
    end
    object cxqtde: TcxCurrencyEdit
      Left = 465
      Top = 322
      EditValue = 0.000000000000000000
      Enabled = False
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      Properties.OnEditValueChanged = cxlarguraPropertiesEditValueChanged
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 43
      Width = 92
    end
  end
  object BtnMarca: TcxButtonEdit [3]
    Left = 618
    Top = 218
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
    Properties.OnButtonClick = BtnMarcaPropertiesButtonClick
    Style.BorderStyle = ebsFlat
    Style.HotTrack = True
    Style.Shadow = False
    Style.TransparentBorder = True
    Style.ButtonStyle = btsDefault
    TabOrder = 3
    Width = 27
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
  object dsMarca: TUniDataSource
    DataSet = TabMarca
    Left = 456
    Top = 8
  end
  object dsGrupo: TUniDataSource
    DataSet = TabGrupo
    Left = 264
    Top = 8
  end
  object dsLocalizacao: TUniDataSource
    DataSet = TabLocalizacao
    Left = 352
    Top = 8
  end
  object dsUnidade: TUniDataSource
    DataSet = TabUnidade
    Left = 504
  end
  object TabUnidade: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_unidade'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'nmunidade'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'unidade'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 552
    object TabUnidadeid_unidade: TIntegerField
      FieldName = 'id_unidade'
    end
    object TabUnidadecodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabUnidadeuni: TStringField
      FieldName = 'nmunidade'
      Size = 150
    end
    object TabUnidadeunidade: TStringField
      FieldName = 'unidade'
      Size = 60
    end
  end
  object TabMarca: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_marca'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'nmmarca'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 424
    Top = 8
    object TabMarcaid_marca: TIntegerField
      FieldName = 'id_marca'
    end
    object TabMarcacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabMarcamarca: TStringField
      FieldName = 'nmmarca'
      Size = 150
    end
  end
  object TabGrupo: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_grupo'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'nmgrupo'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 264
    Top = 8
    object TabGrupoid_grupo: TIntegerField
      FieldName = 'id_grupo'
    end
    object TabGrupocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabGrupogrupo: TStringField
      FieldName = 'nmgrupo'
      Size = 150
    end
  end
  object TabLocalizacao: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_localizacao'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'nmlocalizacao'
        DataType = ftString
        Size = 90
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 352
    Top = 8
    object TabLocalizacaoid_localizacao: TIntegerField
      FieldName = 'id_localizacao'
    end
    object TabLocalizacaocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabLocalizacaolocalizacao: TStringField
      FieldName = 'nmlocalizacao'
      Size = 150
    end
  end
end
