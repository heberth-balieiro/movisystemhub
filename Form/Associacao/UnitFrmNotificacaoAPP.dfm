inherited FrmEnviarNotificacao: TFrmEnviarNotificacao
  Left = 200
  Top = 200
  Caption = 'Notifica'#231#227'o'
  ClientHeight = 350
  Color = clWhite
  OnShow = FormShow
  ExplicitHeight = 350
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 322
    TabOrder = 2
    ExplicitTop = 322
    ExplicitWidth = 644
  end
  inherited PanelClient: TPanel
    Height = 279
    TabOrder = 1
    ExplicitHeight = 279
    inherited dxBevel1: TdxBevel
      Height = 273
      ExplicitHeight = 279
    end
    object Label20: TLabel [1]
      Left = 6
      Top = 8
      Width = 32
      Height = 17
      Caption = 'T'#237'tulo'
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
    object Label4: TLabel [2]
      Left = 6
      Top = 57
      Width = 65
      Height = 17
      Caption = 'Mensagem'
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
      Left = 6
      Top = 106
      Width = 47
      Height = 17
      Caption = 'Imagem'
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
    object cxFoto: TImage [4]
      Left = 6
      Top = 124
      Width = 637
      Height = 114
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
        57686974657B66696C6C3A234646464646463B7D262331333B262331303B2623
        393B2E59656C6C6F777B66696C6C3A234646423131353B7D262331333B262331
        303B2623393B2E477265656E7B66696C6C3A233033394332333B7D3C2F737479
        6C653E0D0A3C672069643D2250696374757265223E0D0A09093C726563742078
        3D22322220793D22322220636C6173733D2259656C6C6F77222077696474683D
        22323822206865696768743D223238222F3E0D0A09093C7265637420783D2234
        2220793D22342220636C6173733D225768697465222077696474683D22323422
        206865696768743D223234222F3E0D0A09093C706F6C79676F6E20636C617373
        3D22477265656E2220706F696E74733D22322C32302031302C31322032322C32
        322033302C31342033302C333020322C3330202623393B222F3E0D0A09093C63
        6972636C6520636C6173733D2259656C6C6F77222063783D223231222063793D
        2231312220723D2233222F3E0D0A093C2F673E0D0A3C2F7376673E0D0A}
      Proportional = True
      Transparent = True
      OnDblClick = cxFotoDblClick
    end
    inherited BtnSalvar: TStyledBitBtn
      Left = 422
      Top = 239
      TabOrder = 2
      OnClick = BtnSalvarClick
      ExplicitLeft = 422
      ExplicitTop = 239
    end
    inherited BtnCancelar: TStyledBitBtn
      Left = 533
      Top = 239
      TabOrder = 3
      OnClick = BtnCancelarClick
      ExplicitLeft = 533
      ExplicitTop = 239
    end
    object cxTitulo: TcxTextEdit
      Left = 6
      Top = 26
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.MaxLength = 150
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 0
      Width = 637
    end
    object cxPublico: TcxCheckBox
      Left = 6
      Top = 244
      Caption = 'Publico'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.DisplayGrayed = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueGrayed = 'N'
      Properties.ValueUnchecked = 'N'
      Style.TextColor = 5325111
      Style.TransparentBorder = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 4
      Transparent = True
    end
    object cxMensagem: TcxBlobEdit
      Left = 6
      Top = 75
      Properties.BlobEditKind = bekMemo
      Properties.ClearKey = 16452
      Properties.MemoCharCase = ecUpperCase
      Properties.MemoMaxLength = 250
      Properties.PopupHeight = 185
      Properties.PopupWidth = 635
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 1
      Width = 637
    end
  end
  inherited Paneltitulo: TPanel
    ExplicitWidth = 644
    inherited lblTitulo: TLabel
      Left = 10
      Width = 594
      Margins.Left = 10
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 488
    Top = 2
  end
  inherited Ds: TUniDataSource
    Left = 424
    Top = 8
  end
end
