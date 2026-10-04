inherited FrmEnviarWhatsAppMassa: TFrmEnviarWhatsAppMassa
  Caption = 'WhatsApp'
  ClientHeight = 671
  ClientWidth = 600
  Color = clWhite
  OnShow = FormShow
  ExplicitTop = -144
  ExplicitWidth = 600
  ExplicitHeight = 671
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 646
    Width = 600
    ExplicitTop = 646
    ExplicitWidth = 600
    object btnParams: TSpeedButton
      AlignWithMargins = True
      Left = 5
      Top = 0
      Width = 26
      Height = 25
      Cursor = crHandPoint
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000848484FF848484FF00000000B8824DFFB8824DFFB8824DFFB8824DFFB882
        4DFFB8824DFFB8824DFFB8824DFFB8824DFF0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000848484FF848484FF00000000B8824DFFB8824DFFB8824DFFB8824DFFB882
        4DFFB8824DFFB8824DFFB8824DFFB8824DFF0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000848484FF848484FF00000000B8824DFFB8824DFFB8824DFFB8824DFFB882
        4DFFB8824DFFB8824DFFB8824DFFB8824DFF0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000848484FF848484FF00000000B8824DFFB8824DFFB8824DFFB8824DFFB882
        4DFFB8824DFFB8824DFFB8824DFFB8824DFF0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      OnClick = btnParamsClick
    end
  end
  inherited PanelClient: TPanel
    Top = 267
    Width = 600
    Height = 379
    ExplicitTop = 267
    ExplicitWidth = 600
    ExplicitHeight = 379
    object cxGroupDestinatario: TcxGroupBox
      Left = 0
      Top = 0
      Align = alClient
      Caption = 'Destinat'#225'rios'
      TabOrder = 0
      Height = 233
      Width = 600
      object cxGrid: TcxGrid
        Left = 7
        Top = 53
        Width = 587
        Height = 164
        TabOrder = 0
        object cxGridDBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = dsLista
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              FieldName = 'id_candidato'
              Column = coll1
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o>'
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.StyleSheet = FrmPrincipalNew.CxGridPedido
          object ncodigo: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'codigo'
            Visible = False
          end
          object coll1: TcxGridDBColumn
            Caption = 'Matr'#237'cula'
            DataBinding.FieldName = 'matricula'
            Width = 72
          end
          object coll2: TcxGridDBColumn
            Caption = 'Nome'
            DataBinding.FieldName = 'nome'
            Width = 291
          end
          object nenviado: TcxGridDBColumn
            Caption = 'CPF'
            DataBinding.FieldName = 'cpf'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.EditMask = '999\.999\.999\-99;1;_'
            Width = 108
          end
          object coll5: TcxGridDBColumn
            Caption = 'Celular'
            DataBinding.FieldName = 'whatsapp'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.EditMask = '!\(99\)99999-9999;1;_'
            Width = 106
          end
          object cxGridDBTableView1Column1: TcxGridDBColumn
            DataBinding.FieldName = 'id_socio'
            Visible = False
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
      object BtnIndividual: TStyledBitBtn
        Left = 7
        Top = 22
        Width = 106
        Height = 25
        Caption = 'Selecionar'
        TabOrder = 1
        StyleElements = [seFont, seBorder]
        OnClick = BtnIndividualClick
        StyleClass = 'Aqua Graphite'
        ButtonStyleNormal.BorderColor = 12283904
        ButtonStylePressed.BorderColor = 13208883
        ButtonStyleSelected.BorderColor = 13734188
        ButtonStyleHot.BorderColor = 13403413
      end
      object BtnAdicionarTodos: TStyledBitBtn
        Left = 119
        Top = 22
        Width = 106
        Height = 25
        Caption = 'Todos'
        TabOrder = 2
        StyleElements = [seFont, seBorder]
        OnClick = BtnAdicionarTodosClick
        StyleClass = 'Aqua Graphite'
        ButtonStyleNormal.BorderColor = 12283904
        ButtonStylePressed.BorderColor = 13208883
        ButtonStyleSelected.BorderColor = 13734188
        ButtonStyleHot.BorderColor = 13403413
      end
      object BtnExcluir: TStyledBitBtn
        Left = 231
        Top = 22
        Width = 106
        Height = 25
        Caption = 'Excluir'
        TabOrder = 3
        StyleElements = [seFont, seBorder]
        OnClick = BtnExcluirClick
        StyleClass = 'Aqua Graphite'
        ButtonStyleNormal.BorderColor = 12283904
        ButtonStylePressed.BorderColor = 13208883
        ButtonStyleSelected.BorderColor = 13734188
        ButtonStyleHot.BorderColor = 13403413
      end
      object BtnLimparLista: TStyledBitBtn
        Left = 343
        Top = 22
        Width = 106
        Height = 25
        Caption = 'Limpar lista'
        TabOrder = 4
        StyleElements = [seFont, seBorder]
        OnClick = BtnLimparListaClick
        StyleClass = 'Aqua Graphite'
        ButtonStyleNormal.BorderColor = 12283904
        ButtonStylePressed.BorderColor = 13208883
        ButtonStyleSelected.BorderColor = 13734188
        ButtonStyleHot.BorderColor = 13403413
      end
      object btnmanual: TStyledBitBtn
        Left = 455
        Top = 22
        Width = 106
        Height = 25
        Caption = 'Individual'
        TabOrder = 5
        StyleElements = [seFont, seBorder]
        OnClick = btnmanualClick
        StyleClass = 'Aqua Graphite'
        ButtonStyleNormal.BorderColor = 12283904
        ButtonStylePressed.BorderColor = 13208883
        ButtonStyleSelected.BorderColor = 13734188
        ButtonStyleHot.BorderColor = 13403413
      end
    end
    object cxGroupBox1: TcxGroupBox
      Left = 0
      Top = 233
      Align = alBottom
      Caption = 'Anexos'
      TabOrder = 1
      Height = 146
      Width = 600
      object Panel3: TPanel
        AlignWithMargins = True
        Left = 15
        Top = 586
        Width = 110
        Height = 35
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 15
        Margins.Bottom = 20
        BevelOuter = bvNone
        Color = clTeal
        ParentBackground = False
        TabOrder = 0
      end
      object cxListAnexo: TcxListBox
        Left = 7
        Top = 21
        Width = 496
        Height = 68
        ItemHeight = 17
        TabOrder = 1
      end
      object BtnAdicionarAnexo: TStyledBitBtn
        Left = 504
        Top = 21
        Width = 90
        Height = 25
        Caption = 'Adicionar'
        TabOrder = 2
        StyleElements = [seFont, seBorder]
        OnClick = BtnAdicionarAnexoClick
        StyleClass = 'Aqua Graphite'
        ButtonStyleNormal.BorderColor = 12283904
        ButtonStylePressed.BorderColor = 13208883
        ButtonStyleSelected.BorderColor = 13734188
        ButtonStyleHot.BorderColor = 13403413
      end
      object BtnRemoverAnexo: TStyledBitBtn
        Left = 504
        Top = 52
        Width = 90
        Height = 25
        Caption = 'Remover'
        TabOrder = 3
        StyleElements = [seFont, seBorder]
        OnClick = BtnRemoverAnexoClick
        StyleClass = 'Aqua Graphite'
        ButtonStyleNormal.BorderColor = 12283904
        ButtonStylePressed.BorderColor = 13208883
        ButtonStyleSelected.BorderColor = 13734188
        ButtonStyleHot.BorderColor = 13403413
      end
      object BtnSalvar: TStyledBitBtn
        Left = 373
        Top = 95
        Width = 110
        Height = 35
        Caption = 'Salvar/Enviar'
        TabOrder = 4
        OnClick = BtnSalvarClick
        StyleFamily = 'Bootstrap'
        StyleClass = 'Success'
      end
      object BtnCancelar1: TStyledBitBtn
        Left = 484
        Top = 95
        Width = 110
        Height = 35
        Caption = 'Cancelar | ESC'
        TabOrder = 5
        OnClick = BtnCancelar1Click
        StyleFamily = 'Bootstrap'
        StyleClass = 'Danger'
      end
      object cxWhatsApp: TcxCheckBox
        Left = 7
        Top = 95
        Caption = 'WhatsApp'
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
        TabOrder = 6
        Transparent = True
      end
      object cxSMS: TcxCheckBox
        Left = 117
        Top = 95
        Caption = 'SMS'
        Properties.ClearKey = 16452
        Properties.DisplayChecked = 'S'
        Properties.DisplayUnchecked = 'N'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        Style.TransparentBorder = False
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 7
        Transparent = True
      end
      object cxEmail: TcxCheckBox
        Left = 184
        Top = 95
        Caption = 'E-Mail'
        Properties.ClearKey = 16452
        Properties.DisplayChecked = 'S'
        Properties.DisplayUnchecked = 'N'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'S'
        Properties.ValueUnchecked = 'N'
        Style.TransparentBorder = False
        StyleFocused.BorderColor = clNavy
        StyleFocused.Color = 15855596
        TabOrder = 8
        Transparent = True
      end
    end
  end
  inherited Paneltitulo: TPanel
    Width = 600
    TabOrder = 3
    ExplicitWidth = 600
    inherited lblTitulo: TLabel
      Width = 545
      ExplicitWidth = 545
    end
    inherited BtnFechar: TSpeedButton
      Left = 560
      ExplicitLeft = 560
    end
  end
  object cxGroupBox111: TcxGroupBox [3]
    Left = 0
    Top = 40
    Align = alTop
    Caption = 'Mensagem'
    TabOrder = 0
    Height = 227
    Width = 600
    object Label6: TLabel
      Left = 7
      Top = 17
      Width = 159
      Height = 17
      Caption = 'Mensagem pr'#233'-cadastrada'
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
    object Label2: TLabel
      Left = 7
      Top = 169
      Width = 87
      Height = 17
      Caption = 'URL (Opcional)'
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
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 15
      Top = 586
      Width = 110
      Height = 35
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      BevelOuter = bvNone
      Color = clTeal
      ParentBackground = False
      TabOrder = 0
    end
    object cxMsgpronta: TcxLookupComboBox
      Left = 7
      Top = 35
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.KeyFieldNames = 'id_mensagem'
      Properties.ListColumns = <
        item
          Caption = 'Mensagem'
          Width = 590
          FieldName = 'npesquisa'
        end>
      Properties.ListSource = Ds
      EditValue = 0
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 1
      Width = 563
    end
    object BtnMensagem: TcxButtonEdit
      Left = 567
      Top = 35
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
      Properties.OnButtonClick = BtnMensagemPropertiesButtonClick
      Style.BorderStyle = ebsFlat
      Style.HotTrack = True
      Style.Shadow = False
      Style.TransparentBorder = True
      Style.ButtonStyle = btsDefault
      TabOrder = 2
      Width = 27
    end
    object cxMensagem: TcxMemo
      Left = 7
      Top = 66
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 3
      Height = 97
      Width = 496
    end
    object cxUrl: TcxTextEdit
      Left = 7
      Top = 187
      Cursor = crIBeam
      Properties.ClearKey = 16452
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 4
      Width = 587
    end
    object BtnAplicar: TStyledBitBtn
      Left = 504
      Top = 66
      Width = 90
      Height = 25
      Caption = 'Aplicar'
      TabOrder = 5
      StyleElements = [seFont, seBorder]
      OnClick = BtnAplicarClick
      StyleClass = 'Aqua Graphite'
      ButtonStyleNormal.BorderColor = 12283904
      ButtonStylePressed.BorderColor = 13208883
      ButtonStyleSelected.BorderColor = 13734188
      ButtonStyleHot.BorderColor = 13403413
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 240
    Top = 2
  end
  inherited Ds: TUniDataSource
    DataSet = TabMensagem
    Left = 376
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
  object OpenDialog: TOpenDialog
    Left = 296
    Top = 65530
  end
  object TabMensagem: TClientDataSet
    PersistDataPacket.Data = {
      790000009619E0BD01000000180000000400000000000300000079000B69645F
      6D656E736167656D040001000000000006636F6469676F040001000000000009
      64657363726963616F010049000000010005574944544802000200B400096E70
      65737175697361010049000000010005574944544802000200C8000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 416
    object TabMensagemid_mensagem: TIntegerField
      FieldName = 'id_mensagem'
    end
    object TabMensagemcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabMensagemdescricao: TStringField
      FieldName = 'descricao'
      Size = 180
    end
    object TabMensagemnpesquisa: TStringField
      FieldName = 'npesquisa'
      Size = 200
    end
  end
  object mdListaPessoa: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 240
    Top = 428
    object mdListaPessoaid_socio: TIntegerField
      FieldName = 'id_socio'
    end
    object mdListaPessoacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object mdListaPessoamatricula: TIntegerField
      FieldName = 'matricula'
    end
    object mdListaPessoanome: TStringField
      FieldName = 'nome'
      Size = 180
    end
    object mdListaPessoacpf: TStringField
      FieldName = 'cpf'
    end
    object mdListaPessoacelular: TStringField
      FieldName = 'celular'
    end
    object mdListaPessoawhatsapp: TStringField
      FieldName = 'whatsapp'
    end
    object mdListaPessoaemail: TStringField
      FieldName = 'email'
      Size = 180
    end
    object mdListaPessoanascimento: TDateField
      FieldName = 'nascimento'
    end
    object mdListaPessoasituacao: TStringField
      FieldName = 'situacao'
      Size = 60
    end
  end
  object dsLista: TUniDataSource
    DataSet = mdListaPessoa
    Left = 296
    Top = 424
  end
end
