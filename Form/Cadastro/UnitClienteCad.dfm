object FrmClienteCad: TFrmClienteCad
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Cliente'
  ClientHeight = 507
  ClientWidth = 792
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 17
  object Label1: TLabel
    Left = 15
    Top = 62
    Width = 43
    Height = 17
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 101
    Top = 62
    Width = 50
    Height = 17
    Caption = 'Pessoa *'
  end
  object Label3: TLabel
    Left = 228
    Top = 62
    Width = 64
    Height = 17
    Caption = 'CPF/CNPJ *'
  end
  object Label4: TLabel
    Left = 15
    Top = 110
    Width = 77
    Height = 17
    Caption = 'Nome/Raz'#227'o'
  end
  object labelOrgao: TLabel
    Left = 505
    Top = 62
    Width = 38
    Height = 17
    Caption = 'Org'#227'o'
  end
  object Label6: TLabel
    Left = 311
    Top = 111
    Width = 97
    Height = 17
    Caption = 'Apelido/Fantasia'
  end
  object Label7: TLabel
    Left = 375
    Top = 62
    Width = 31
    Height = 17
    Caption = 'Rg/IE'
  end
  object Label9: TLabel
    Left = 15
    Top = 159
    Width = 22
    Height = 17
    Caption = 'CEP'
  end
  object Label10: TLabel
    Left = 131
    Top = 159
    Width = 55
    Height = 17
    Caption = 'Endere'#231'o'
  end
  object Label11: TLabel
    Left = 535
    Top = 159
    Width = 48
    Height = 17
    Caption = 'N'#250'mero'
  end
  object Label12: TLabel
    Left = 15
    Top = 257
    Width = 50
    Height = 17
    Caption = 'Cidade *'
  end
  object Label13: TLabel
    Left = 15
    Top = 208
    Width = 82
    Height = 17
    Caption = 'Complemento'
  end
  object Label14: TLabel
    Left = 228
    Top = 208
    Width = 35
    Height = 17
    Caption = 'Bairro'
  end
  object Label15: TLabel
    Left = 15
    Top = 306
    Width = 39
    Height = 17
    Caption = 'Fone 1'
  end
  object Label16: TLabel
    Left = 131
    Top = 306
    Width = 39
    Height = 17
    Caption = 'Fone 2'
  end
  object Label17: TLabel
    Left = 247
    Top = 306
    Width = 51
    Height = 17
    Caption = 'Celular 1'
  end
  object Label18: TLabel
    Left = 363
    Top = 306
    Width = 51
    Height = 17
    Caption = 'Celular 2'
  end
  object Label19: TLabel
    Left = 479
    Top = 306
    Width = 60
    Height = 17
    Caption = 'WhatsApp'
  end
  object Label20: TLabel
    Left = 247
    Top = 355
    Width = 70
    Height = 17
    Caption = 'Observa'#231#227'o'
  end
  object Label21: TLabel
    Left = 15
    Top = 404
    Width = 37
    Height = 17
    Caption = 'Avisos'
  end
  object Label22: TLabel
    Left = 375
    Top = 257
    Width = 36
    Height = 17
    Caption = 'E-mail'
  end
  object Label27: TLabel
    Left = 15
    Top = 453
    Width = 232
    Height = 17
    Caption = 'Campo com * s'#227'o campos obrigat'#243'rios'
    WordWrap = True
  end
  object dxBevel1: TdxBevel
    Left = 618
    Top = 62
    Width = 165
    Height = 141
  end
  object edtFoto: TImage
    Left = 620
    Top = 63
    Width = 160
    Height = 137
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
      2623393B2E426C75657B66696C6C3A233131373744373B7D262331333B262331
      303B2623393B2E57686974657B66696C6C3A234646464646463B7D262331333B
      262331303B2623393B2E477265656E7B66696C6C3A233033394332333B7D2623
      31333B262331303B2623393B2E7374307B6F7061636974793A302E37353B7D26
      2331333B262331303B2623393B2E7374317B6F7061636974793A302E353B7D26
      2331333B262331303B2623393B2E7374327B6F7061636974793A302E32353B7D
      262331333B262331303B2623393B2E7374337B66696C6C3A234646423131353B
      7D3C2F7374796C653E0D0A3C672069643D22496D61676573223E0D0A09093C70
      61746820636C6173733D22426C61636B2220643D224D32392C34483343322E35
      2C342C322C342E352C322C3576323263302C302E352C302E352C312C312C3168
      323663302E352C302C312D302E352C312D3156354333302C342E352C32392E35
      2C342C32392C347A204D32382C3236483456366832345632367A222F3E0D0A09
      093C636972636C6520636C6173733D2259656C6C6F77222063783D2232312220
      63793D2231312220723D2233222F3E0D0A09093C706F6C79676F6E20636C6173
      733D22477265656E2220706F696E74733D2232302C32342031302C313420362C
      313820362C3234202623393B222F3E0D0A09093C6720636C6173733D22737431
      223E0D0A0909093C706F6C79676F6E20636C6173733D22477265656E2220706F
      696E74733D2232322C32342031382C32302032302C31382032362C3234202623
      393B2623393B222F3E0D0A09093C2F673E0D0A093C2F673E0D0A3C2F7376673E
      0D0A}
    Proportional = True
    Transparent = True
    OnDblClick = edtFotoDblClick
  end
  object Label8: TLabel
    Left = 15
    Top = 355
    Width = 73
    Height = 17
    Caption = 'Respons'#225'vel'
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 662
    Top = 456
    Width = 110
    Height = 40
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 15
    Margins.Bottom = 20
    BevelOuter = bvNone
    Color = 14869218
    ParentBackground = False
    TabOrder = 22
    object btnCancelar: TSpeedButton
      Left = 0
      Top = 0
      Width = 110
      Height = 40
      Cursor = crHandPoint
      Align = alClient
      Caption = 'Cancelar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5585461
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnCancelarClick
      ExplicitLeft = 64
      ExplicitTop = -3
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 540
    Top = 456
    Width = 110
    Height = 40
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 15
    Margins.Bottom = 20
    BevelOuter = bvNone
    Color = 16475988
    ParentBackground = False
    TabOrder = 23
    object btnSalvar: TSpeedButton
      Left = 0
      Top = 0
      Width = 110
      Height = 40
      Cursor = crHandPoint
      Align = alClient
      Caption = 'Salvar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnSalvarClick
      ExplicitLeft = 6
      ExplicitTop = -3
    end
  end
  object edtcodigo: TcxTextEdit
    Left = 15
    Top = 80
    TabOrder = 0
    Width = 80
  end
  object edtrazao: TcxTextEdit
    Left = 15
    Top = 128
    Properties.CharCase = ecUpperCase
    Properties.ClearKey = 16452
    Properties.MaxLength = 150
    TabOrder = 5
    Width = 290
  end
  object edtpessoa: TcxComboBox
    Left = 101
    Top = 80
    Properties.DropDownListStyle = lsEditFixedList
    Properties.Items.Strings = (
      'F'#205'SICA'
      'JUR'#205'DICA')
    Properties.OnEditValueChanged = edtpessoaPropertiesEditValueChanged
    TabOrder = 1
    Text = 'F'#205'SICA'
    Width = 121
  end
  object edtcpf: TcxButtonEdit
    Left = 228
    Top = 80
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
  object edtfantasia: TcxTextEdit
    Left = 311
    Top = 128
    Properties.CharCase = ecUpperCase
    Properties.ClearKey = 16452
    Properties.MaxLength = 60
    TabOrder = 6
    Width = 301
  end
  object edtie: TcxTextEdit
    Left = 375
    Top = 80
    Properties.CharCase = ecUpperCase
    Properties.ClearKey = 16452
    Properties.MaxLength = 20
    TabOrder = 3
    Width = 124
  end
  object edtorgao: TcxTextEdit
    Left = 505
    Top = 80
    Properties.CharCase = ecUpperCase
    Properties.ClearKey = 16452
    Properties.MaxLength = 15
    TabOrder = 4
    Width = 107
  end
  object edtcep: TcxButtonEdit
    Left = 15
    Top = 177
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
    Properties.OnButtonClick = edtcepPropertiesButtonClick
    TabOrder = 7
    Text = '  .   -   '
    Width = 110
  end
  object edtendereco: TcxTextEdit
    Left = 131
    Top = 177
    Properties.CharCase = ecUpperCase
    Properties.ClearKey = 16452
    Properties.MaxLength = 90
    TabOrder = 8
    Width = 398
  end
  object edtnumero: TcxTextEdit
    Left = 535
    Top = 177
    Properties.CharCase = ecUpperCase
    Properties.ClearKey = 16452
    Properties.MaxLength = 15
    TabOrder = 9
    Width = 77
  end
  object edtcomplemento: TcxTextEdit
    Left = 15
    Top = 226
    Properties.CharCase = ecUpperCase
    Properties.ClearKey = 16452
    Properties.MaxLength = 45
    TabOrder = 10
    Width = 207
  end
  object edtbairro: TcxTextEdit
    Left = 228
    Top = 226
    Properties.CharCase = ecUpperCase
    Properties.ClearKey = 16452
    Properties.MaxLength = 60
    TabOrder = 11
    Width = 384
  end
  object edtcidade: TcxLookupComboBox
    Left = 15
    Top = 275
    Properties.CharCase = ecUpperCase
    Properties.ClearKey = 16452
    Properties.ListColumns = <>
    EditValue = 0
    TabOrder = 12
    Width = 354
  end
  object edtfone1: TcxMaskEdit
    Left = 15
    Top = 324
    Properties.CharCase = ecUpperCase
    Properties.ClearKey = 16452
    Properties.EditMask = '!\(99\)9999-9999;1;_'
    TabOrder = 13
    Text = '(  )    -    '
    Width = 110
  end
  object edtfone2: TcxMaskEdit
    Left = 131
    Top = 324
    Properties.CharCase = ecUpperCase
    Properties.ClearKey = 16452
    Properties.EditMask = '!\(99\)9999-9999;1;_'
    TabOrder = 14
    Text = '(  )    -    '
    Width = 110
  end
  object edtcelular1: TcxMaskEdit
    Left = 247
    Top = 324
    Properties.CharCase = ecUpperCase
    Properties.ClearKey = 16452
    Properties.EditMask = '!\(99\)99999-9999;1;_'
    TabOrder = 15
    Text = '(  )     -    '
    Width = 110
  end
  object edtcelular2: TcxMaskEdit
    Left = 363
    Top = 324
    Properties.CharCase = ecUpperCase
    Properties.ClearKey = 16452
    Properties.EditMask = '!\(99\)99999-9999;1;_'
    TabOrder = 16
    Text = '(  )     -    '
    Width = 110
  end
  object edtwhats: TcxMaskEdit
    Left = 479
    Top = 324
    Properties.CharCase = ecUpperCase
    Properties.ClearKey = 16452
    Properties.EditMask = '!\(99\)99999-9999;1;_'
    TabOrder = 17
    Text = '(  )     -    '
    Width = 133
  end
  object edtobs: TcxBlobEdit
    Left = 247
    Top = 373
    Properties.BlobEditKind = bekMemo
    Properties.MemoMaxLength = 500
    Properties.PopupHeight = 180
    Properties.PopupWidth = 365
    TabOrder = 19
    Width = 365
  end
  object edtaviso: TcxBlobEdit
    Left = 15
    Top = 422
    Properties.BlobEditKind = bekMemo
    Properties.MemoMaxLength = 500
    Properties.PopupHeight = 180
    Properties.PopupWidth = 597
    TabOrder = 20
    Width = 597
  end
  object Paneltitulo: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    Color = 16744448
    ParentBackground = False
    TabOrder = 24
    ExplicitWidth = 630
    object lblTitulo: TLabel
      AlignWithMargins = True
      Left = 15
      Top = 0
      Width = 777
      Height = 50
      Margins.Left = 15
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      AutoSize = False
      Caption = 'Nova Pessoa'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 0
      ExplicitWidth = 697
      ExplicitHeight = 35
    end
  end
  object edtemail: TcxTextEdit
    Left = 375
    Top = 275
    Properties.ClearKey = 16452
    Properties.MaxLength = 180
    TabOrder = 21
    Width = 237
  end
  object cxGroupBox2: TcxGroupBox
    Left = 618
    Top = 206
    TabOrder = 25
    Height = 241
    Width = 165
    object edtcliente: TcxCheckBox
      Left = 16
      Top = 20
      Caption = 'Cliente'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      TabOrder = 0
      Transparent = True
    end
    object edtfornecedor: TcxCheckBox
      Left = 16
      Top = 47
      Caption = 'Fornecedor'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      TabOrder = 1
      Transparent = True
    end
    object edtativo: TcxCheckBox
      Left = 16
      Top = 74
      Caption = 'Ativo'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      TabOrder = 2
      Transparent = True
    end
    object edtenviaremail: TcxCheckBox
      Left = 16
      Top = 101
      Caption = 'Enviar E-mail'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      TabOrder = 3
      Transparent = True
    end
    object edtenviarwhats: TcxCheckBox
      Left = 16
      Top = 128
      Caption = 'Enviar WhatsApp'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      TabOrder = 4
      Transparent = True
    end
  end
  object edtresponsavel: TcxTextEdit
    Left = 15
    Top = 373
    Properties.CharCase = ecUpperCase
    Properties.ClearKey = 16452
    Properties.MaxLength = 45
    TabOrder = 18
    Width = 226
  end
  object ACBrEnterTab1: TACBrEnterTab
    EnterAsTab = True
    Left = 272
    Top = 456
  end
  object ACBrValidador1: TACBrValidador
    IgnorarChar = './-'
    PermiteVazio = True
    Left = 344
    Top = 447
  end
  object dsCidade: TUniDataSource
    DataSet = DM.TabCidade
    Left = 424
    Top = 455
  end
end
