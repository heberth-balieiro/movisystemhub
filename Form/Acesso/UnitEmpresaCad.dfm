object FrmEmpresaCad: TFrmEmpresaCad
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Empresa'
  ClientHeight = 561
  ClientWidth = 723
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  TextHeight = 17
  object Label1: TLabel
    Left = 15
    Top = 62
    Width = 43
    Height = 17
    Caption = 'C'#243'digo'
  end
  object Label3: TLabel
    Left = 101
    Top = 62
    Width = 38
    Height = 17
    Caption = 'CNPJ *'
  end
  object Label4: TLabel
    Left = 15
    Top = 110
    Width = 45
    Height = 17
    Caption = 'Raz'#227'o *'
  end
  object Label6: TLabel
    Left = 311
    Top = 111
    Width = 47
    Height = 17
    Caption = 'Fantasia'
  end
  object Label7: TLabel
    Left = 248
    Top = 62
    Width = 10
    Height = 17
    Caption = 'IE'
  end
  object Label8: TLabel
    Left = 15
    Top = 355
    Width = 104
    Height = 17
    Caption = 'Regime Tribut'#225'rio'
    Visible = False
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
    Top = 157
    Width = 55
    Height = 17
    Caption = 'Endere'#231'o'
  end
  object Label11: TLabel
    Left = 535
    Top = 157
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
  object Label22: TLabel
    Left = 375
    Top = 257
    Width = 36
    Height = 17
    Caption = 'E-mail'
  end
  object Label27: TLabel
    Left = 15
    Top = 463
    Width = 232
    Height = 17
    Caption = 'Campo com * s'#227'o campos obrigat'#243'rios'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 378
    Top = 62
    Width = 15
    Height = 17
    Caption = 'IM'
  end
  object Label5: TLabel
    Left = 496
    Top = 62
    Width = 33
    Height = 17
    Caption = 'CNAE'
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 502
    Top = 471
    Width = 110
    Height = 40
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 15
    Margins.Bottom = 20
    BevelOuter = bvNone
    Color = 14869218
    ParentBackground = False
    TabOrder = 20
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
      ExplicitLeft = 80
      ExplicitTop = 16
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 380
    Top = 471
    Width = 110
    Height = 40
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 15
    Margins.Bottom = 20
    BevelOuter = bvNone
    Color = 16475988
    ParentBackground = False
    TabOrder = 21
    object btnSalvar: TSpeedButton
      Left = 0
      Top = 0
      Width = 110
      Height = 40
      Cursor = crHandPoint
      Align = alClient
      Caption = 'Salvar | F10'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnSalvarClick
      ExplicitLeft = 6
    end
  end
  object edtcodigo: TcxTextEdit
    Left = 15
    Top = 80
    Properties.ReadOnly = True
    TabOrder = 0
    Width = 80
  end
  object edtrazao: TcxTextEdit
    Left = 15
    Top = 128
    TabOrder = 5
    Width = 290
  end
  object edtfantasia: TcxTextEdit
    Left = 311
    Top = 128
    TabOrder = 6
    Width = 301
  end
  object edtie: TcxTextEdit
    Left = 248
    Top = 80
    TabOrder = 2
    Width = 124
  end
  object edtregime: TcxComboBox
    Left = 15
    Top = 373
    TabOrder = 19
    Visible = False
    Width = 396
  end
  object edtendereco: TcxTextEdit
    Left = 131
    Top = 177
    TabOrder = 8
    Width = 398
  end
  object edtnumero: TcxTextEdit
    Left = 535
    Top = 177
    TabOrder = 9
    Width = 77
  end
  object edtcomplemento: TcxTextEdit
    Left = 15
    Top = 226
    TabOrder = 10
    Width = 207
  end
  object edtbairro: TcxTextEdit
    Left = 228
    Top = 226
    TabOrder = 11
    Width = 384
  end
  object edtcidade: TcxLookupComboBox
    Left = 15
    Top = 275
    Properties.CharCase = ecUpperCase
    Properties.ClearKey = 16452
    Properties.KeyFieldNames = 'id_cidade'
    Properties.ListColumns = <
      item
        Caption = 'Cidade'
        Width = 150
        FieldName = 'cidade'
      end
      item
        Caption = 'UF'
        Width = 70
        FieldName = 'uf'
      end>
    Properties.ListSource = dsCidade
    EditValue = 0
    TabOrder = 12
    Width = 354
  end
  object edtfone1: TcxMaskEdit
    Left = 15
    Top = 324
    Properties.EditMask = '!\(99\)9999-9999;1;_'
    TabOrder = 14
    Text = '(  )    -    '
    Width = 110
  end
  object edtfone2: TcxMaskEdit
    Left = 131
    Top = 324
    Properties.EditMask = '!\(99\)9999-9999;1;_'
    TabOrder = 15
    Text = '(  )    -    '
    Width = 110
  end
  object edtcelular1: TcxMaskEdit
    Left = 247
    Top = 324
    Properties.EditMask = '!\(99\)99999-9999;1;_'
    TabOrder = 16
    Text = '(  )     -    '
    Width = 110
  end
  object edtcelular2: TcxMaskEdit
    Left = 363
    Top = 324
    Properties.EditMask = '!\(99\)99999-9999;1;_'
    TabOrder = 17
    Text = '(  )     -    '
    Width = 110
  end
  object edtwhats: TcxMaskEdit
    Left = 479
    Top = 324
    Properties.EditMask = '!\(99\)99999-9999;1;_'
    TabOrder = 18
    Text = '(  )     -    '
    Width = 133
  end
  object Paneltitulo: TPanel
    Left = 0
    Top = 0
    Width = 723
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    Color = 16744448
    ParentBackground = False
    TabOrder = 22
    object lblTitulo: TLabel
      AlignWithMargins = True
      Left = 15
      Top = 0
      Width = 708
      Height = 50
      Margins.Left = 15
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      AutoSize = False
      Caption = 'Novo Empresa'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitTop = 9
      ExplicitWidth = 615
    end
  end
  object edtemail: TcxTextEdit
    Left = 375
    Top = 275
    TabOrder = 13
    Width = 237
  end
  object edtim: TcxTextEdit
    Left = 378
    Top = 80
    TabOrder = 3
    Width = 112
  end
  object edtcnae: TcxTextEdit
    Left = 496
    Top = 80
    TabOrder = 4
    Width = 116
  end
  object cxGroupBox4: TcxGroupBox
    AlignWithMargins = True
    Left = 418
    Top = 353
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
    PanelStyle.Active = True
    TabOrder = 23
    Height = 113
    Width = 194
    object edtlogo: TImage
      Left = 4
      Top = 4
      Width = 186
      Height = 105
      Align = alClient
      Center = True
      ParentShowHint = False
      Proportional = True
      ShowHint = False
      Transparent = True
      ExplicitLeft = 64
      ExplicitTop = 24
      ExplicitWidth = 105
    end
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
    TabOrder = 7
    Text = '  .   -   '
    Width = 110
  end
  object edtcnpj: TcxButtonEdit
    Left = 101
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
    Properties.EditMask = '99.999.999/9999-99'
    Properties.MaxLength = 0
    TabOrder = 1
    Text = '  .   .   /    -  '
    Width = 141
  end
  object ACBrEnterTab1: TACBrEnterTab
    EnterAsTab = True
    Left = 304
    Top = 480
  end
  object dsCidade: TUniDataSource
    DataSet = DM.TabCidade
    Left = 248
    Top = 480
  end
  object ACBrValidadorCNpj: TACBrValidador
    IgnorarChar = './-'
    PermiteVazio = True
    Left = 160
    Top = 479
  end
end
