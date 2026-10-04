inherited FrmBuscarSefaz: TFrmBuscarSefaz
  Caption = 'Buscar na Sefaz'
  ClientHeight = 366
  ClientWidth = 650
  OnShow = FormShow
  ExplicitWidth = 650
  ExplicitHeight = 366
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 341
    Width = 650
  end
  inherited PanelClient: TPanel
    Width = 650
    Height = 301
    object Label5: TLabel
      Left = 4
      Top = 114
      Width = 15
      Height = 17
      Caption = 'UF'
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
    object Label6: TLabel
      Left = 64
      Top = 114
      Width = 55
      Height = 17
      Caption = 'CNPJ/CPF'
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
    object Label7: TLabel
      Left = 4
      Top = 163
      Width = 164
      Height = 17
      Caption = 'Buscar por chave de Acesso'
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
    object Label8: TLabel
      Left = 206
      Top = 114
      Width = 36
      Height = 17
      Caption = 'Raz'#227'o'
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
    object Label9: TLabel
      Left = 4
      Top = 213
      Width = 53
      Height = 17
      Caption = 'NSU NFe'
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
    object Label10: TLabel
      Left = 151
      Top = 213
      Width = 51
      Height = 17
      Caption = 'NSU CTe'
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
    object Label11: TLabel
      Left = 305
      Top = 234
      Width = 171
      Height = 17
      Caption = 'Data/Hora da '#250'ltima consulta'
      Color = 8679796
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5325111
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
      Visible = False
      StyleName = 'Windows'
    end
    object BtnBuscar: TStyledBitBtn
      Left = 425
      Top = 262
      Width = 110
      Height = 35
      Caption = 'Buscar | F5'
      TabOrder = 6
      OnClick = BtnBuscarClick
      StyleFamily = 'Bootstrap'
      StyleClass = 'Success'
    end
    object BtnCancelar: TStyledBitBtn
      Left = 536
      Top = 262
      Width = 110
      Height = 35
      Caption = 'Cancelar | ESC'
      TabOrder = 7
      OnClick = BtnCancelarClick
      StyleFamily = 'Bootstrap'
      StyleClass = 'Danger'
    end
    object cxGroupBox1: TcxGroupBox
      Left = 4
      Top = 3
      PanelStyle.Active = True
      TabOrder = 8
      Height = 105
      Width = 642
      object Label2: TLabel
        Left = 62
        Top = 7
        Width = 578
        Height = 17
        Caption = 
          'Esta opera'#231#227'o ir'#225' consultar a SEFAZ e baixar os DF-e emitidos/de' +
          'stinados ao CNPJ/CPF informado.'
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
      object Label1: TLabel
        Left = 77
        Top = 30
        Width = 352
        Height = 17
        Caption = '* As notas ser'#227'o gravadas para uso no m'#243'dulo de compras'
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
      object Label3: TLabel
        Left = 77
        Top = 53
        Width = 378
        Height = 17
        Caption = '* Voc'#234' poder'#225' manifestar (confirmar/desconhecer) ap'#243's a busca'
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
      object Label4: TLabel
        Left = 77
        Top = 76
        Width = 197
        Height = 17
        Caption = '* As buscas possuem limite di'#225'rio'
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
      object cxImg: TcxImage
        Left = 3
        Top = 3
        Enabled = False
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
          742F637373223E2E426C75657B66696C6C3A233131373744373B7D3C2F737479
          6C653E0D0A3C7061746820636C6173733D22426C75652220643D224D31362C32
          43382E332C322C322C382E332C322C313673362E332C31342C31342C31347331
          342D362E332C31342D31345332332E372C322C31362C327A204D31362C366331
          2E312C302C322C302E392C322C32732D302E392C322D322C32732D322D302E39
          2D322D3220202623393B5331342E392C362C31362C367A204D32302C3234682D
          38762D326832762D38682D32762D326832683476313068325632347A222F3E0D
          0A3C2F7376673E0D0A}
        Properties.ReadOnly = True
        Style.BorderStyle = ebsNone
        TabOrder = 0
        Transparent = True
        Height = 102
        Width = 68
      end
    end
    object cxcnpj: TcxButtonEdit
      Left = 64
      Top = 132
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
      Properties.ReadOnly = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 1
      Text = '  .   .   /    -  '
      Width = 143
    end
    object cxrazao: TcxTextEdit
      Left = 206
      Top = 132
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.MaxLength = 200
      Properties.ReadOnly = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 2
      Width = 440
    end
    object cxchave: TcxTextEdit
      Left = 4
      Top = 182
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.MaxLength = 44
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 3
      OnKeyPress = cxnsunfeKeyPress
      Width = 642
    end
    object cxnsunfe: TcxTextEdit
      Left = 4
      Top = 231
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.MaxLength = 44
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 4
      OnKeyPress = cxnsunfeKeyPress
      Width = 148
    end
    object cxnsucte: TcxTextEdit
      Left = 151
      Top = 231
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.MaxLength = 44
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 5
      OnKeyPress = cxnsunfeKeyPress
      Width = 148
    end
    object cxuf: TcxTextEdit
      Left = 4
      Top = 132
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.MaxLength = 44
      Properties.ReadOnly = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 0
      OnKeyPress = cxnsunfeKeyPress
      Width = 61
    end
  end
  inherited Paneltitulo: TPanel
    Width = 650
    inherited lblTitulo: TLabel
      Width = 595
      Caption = 'Distribui'#231#227'o de DF-e - Consulta na SEFAZ'
    end
    inherited BtnFechar: TSpeedButton
      Left = 610
    end
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
