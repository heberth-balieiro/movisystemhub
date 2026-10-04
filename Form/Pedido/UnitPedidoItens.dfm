inherited FrmPedidoItens: TFrmPedidoItens
  Caption = 'PedidoItens'
  ClientHeight = 350
  Color = clWhite
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitHeight = 350
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 322
    TabOrder = 0
    ExplicitTop = 322
    ExplicitWidth = 644
  end
  inherited PanelClient: TPanel
    Height = 279
    TabOrder = 1
    ExplicitHeight = 279
    inherited dxBevel1: TdxBevel
      Height = 273
      ExplicitHeight = 273
    end
    object Label26: TLabel [1]
      Left = 7
      Top = 7
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
    object Label1: TLabel [2]
      Left = 86
      Top = 7
      Width = 85
      Height = 17
      Caption = 'C'#243'digo barras'
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
    object Label31: TLabel [3]
      Left = 205
      Top = 7
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
    object dxBevel2: TdxBevel [4]
      Left = 478
      Top = 7
      Width = 165
      Height = 144
    end
    object edtFoto: TImage [5]
      Left = 479
      Top = 9
      Width = 163
      Height = 141
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
    end
    object Label38: TLabel [6]
      Left = 7
      Top = 56
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
    object Label2: TLabel [7]
      Left = 7
      Top = 105
      Width = 81
      Height = 17
      Caption = 'Qtde. Unit'#225'ria'
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
    object Label3: TLabel [8]
      Left = 100
      Top = 105
      Width = 50
      Height = 17
      Caption = 'Qtde M'#178
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
    object lbunitario: TLabel [9]
      Left = 192
      Top = 105
      Width = 71
      Height = 17
      Caption = 'Prc. Unit'#225'rio'
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
    object Label5: TLabel [10]
      Left = 284
      Top = 105
      Width = 46
      Height = 17
      Caption = 'Desc. %'
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
    object Label6: TLabel [11]
      Left = 382
      Top = 105
      Width = 66
      Height = 17
      Caption = 'Desconto $'
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
    object Label7: TLabel [12]
      Left = 7
      Top = 154
      Width = 134
      Height = 17
      Caption = 'Complemento produto'
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
    object blTotal: TLabel [13]
      Left = 7
      Top = 238
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
    object Label8: TLabel [14]
      Left = 284
      Top = 56
      Width = 52
      Height = 17
      Caption = 'Alt (mml)'
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
      Left = 382
      Top = 56
      Width = 55
      Height = 17
      Caption = 'Lar (mml)'
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
      Left = 421
      Top = 237
      TabOrder = 12
      OnClick = BtnSalvarClick
      ExplicitLeft = 421
      ExplicitTop = 237
    end
    inherited BtnCancelar: TStyledBitBtn
      Left = 532
      Top = 237
      TabOrder = 13
      OnClick = BtnCancelarClick
      ExplicitLeft = 532
      ExplicitTop = 237
    end
    object cxCodigo: TcxTextEdit
      Left = 7
      Top = 25
      TabStop = False
      Properties.ReadOnly = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 0
      Width = 80
    end
    object cxbarra: TcxTextEdit
      Left = 86
      Top = 25
      TabStop = False
      Properties.ClearKey = 16452
      Properties.ReadOnly = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 1
      Width = 120
    end
    object cxDescricao: TcxTextEdit
      Left = 205
      Top = 25
      Cursor = crIBeam
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.ReadOnly = True
      Style.Color = clWindow
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 2
      Width = 270
    end
    object cxestatual: TcxCurrencyEdit
      Left = 7
      Top = 74
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      Properties.ReadOnly = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 3
      Width = 278
    end
    object cxqtdeunitario: TcxCurrencyEdit
      Left = 7
      Top = 123
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      Properties.Nullstring = '0,00'
      Properties.UseNullString = True
      Properties.OnEditValueChanged = cxqtdeunitarioPropertiesEditValueChanged
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 6
      OnKeyPress = cxqtdeunitarioKeyPress
      Width = 93
    end
    object cxqtdequadrado: TcxCurrencyEdit
      Left = 100
      Top = 123
      EditValue = 0.000000000000000000
      Enabled = False
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      Properties.Nullstring = '0,00'
      Properties.ReadOnly = True
      Properties.UseNullString = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 7
      Width = 93
    end
    object cxPrcunitario: TcxCurrencyEdit
      Left = 192
      Top = 123
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = 'R$ 0.00;R$ -0.00'
      Properties.Nullstring = '0,00'
      Properties.UseNullString = True
      Properties.OnEditValueChanged = cxqtdeunitarioPropertiesEditValueChanged
      Style.TextStyle = [fsBold]
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 8
      Width = 93
    end
    object cxDesconto: TcxCurrencyEdit
      Left = 284
      Top = 123
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      Properties.Nullstring = '0,00'
      Properties.UseNullString = True
      Properties.OnEditValueChanged = cxDescontoPropertiesEditValueChanged
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 9
      Width = 99
    end
    object cxdescontoreais: TcxCurrencyEdit
      Left = 382
      Top = 123
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = 'R$ 0.00;R$ -0.00'
      Properties.Nullstring = '0,00'
      Properties.UseNullString = True
      Properties.OnEditValueChanged = cxdescontoreaisPropertiesEditValueChanged
      Style.Color = clInfoBk
      Style.TextStyle = [fsBold]
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 10
      Width = 93
    end
    object cxAnota: TcxMemo
      Left = 7
      Top = 172
      Properties.ClearKey = 16452
      Properties.MaxLength = 250
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 11
      Height = 64
      Width = 635
    end
    object cxAltura: TcxCurrencyEdit
      Left = 284
      Top = 74
      EditValue = 0.000000000000000000
      Enabled = False
      Properties.ClearKey = 16452
      Properties.DecimalPlaces = 3
      Properties.DisplayFormat = '0.000;-0.000'
      Properties.Nullstring = '000'
      Properties.UseNullString = True
      Properties.OnEditValueChanged = cxqtdeunitarioPropertiesEditValueChanged
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 4
      OnKeyPress = cxqtdeunitarioKeyPress
      Width = 99
    end
    object cxLargura: TcxCurrencyEdit
      Left = 382
      Top = 74
      EditValue = 0.000000000000000000
      Enabled = False
      Properties.ClearKey = 16452
      Properties.DecimalPlaces = 3
      Properties.DisplayFormat = '0.000;-0.000'
      Properties.Nullstring = '000'
      Properties.UseNullString = True
      Properties.OnEditValueChanged = cxqtdeunitarioPropertiesEditValueChanged
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 5
      OnKeyPress = cxqtdeunitarioKeyPress
      Width = 93
    end
  end
  inherited Paneltitulo: TPanel
    TabOrder = 2
    ExplicitWidth = 644
    inherited lblTitulo: TLabel
      Caption = 'Inclus'#227'o Produto/Servi'#231'o'
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 448
    Top = 10
  end
  inherited Ds: TUniDataSource
    Left = 416
    Top = 8
  end
  inherited cxStyle: TcxStyleRepository
    Left = 447
    Top = 7
    PixelsPerInch = 96
    inherited CxGridPedido: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    inherited GridTableDependente: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
end
