object frmCadNFe: TfrmCadNFe
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Emissao de NFe'
  ClientHeight = 710
  ClientWidth = 1020
  Color = 5723991
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 16
  object Panel3: TPanel
    AlignWithMargins = True
    Left = 7
    Top = 7
    Width = 1006
    Height = 146
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 990
    object cxGroupBox1: TcxGroupBox
      Left = 0
      Top = 0
      Align = alTop
      Caption = 'Dados da Nota'
      Style.TextStyle = [fsBold]
      TabOrder = 0
      ExplicitWidth = 990
      Height = 153
      Width = 1006
      object Label1: TLabel
        Left = 174
        Top = 15
        Width = 44
        Height = 15
        Caption = 'N'#250'mero'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label36: TLabel
        Left = 250
        Top = 15
        Width = 95
        Height = 15
        Caption = 'Empresa Emitente'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label53: TLabel
        Left = 756
        Top = 15
        Width = 70
        Height = 15
        Caption = 'Data Emiss'#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label54: TLabel
        Left = 872
        Top = 15
        Width = 55
        Height = 15
        Caption = 'Data Sa'#237'da'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label55: TLabel
        Left = 590
        Top = 15
        Width = 54
        Height = 15
        Caption = 'Finalidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label57: TLabel
        Left = 8
        Top = 59
        Width = 36
        Height = 15
        Caption = 'Pessoa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label58: TLabel
        Left = 590
        Top = 59
        Width = 49
        Height = 15
        Caption = 'Endere'#231'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label59: TLabel
        Left = 872
        Top = 59
        Width = 44
        Height = 15
        Caption = 'N'#250'mero'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label60: TLabel
        Left = 8
        Top = 104
        Width = 31
        Height = 15
        Caption = 'Bairro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label61: TLabel
        Left = 124
        Top = 104
        Width = 37
        Height = 15
        Caption = 'Cidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label62: TLabel
        Left = 387
        Top = 104
        Width = 21
        Height = 15
        Caption = 'Cep'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label63: TLabel
        Left = 415
        Top = 59
        Width = 21
        Height = 15
        Caption = 'CPF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label64: TLabel
        Left = 488
        Top = 104
        Width = 44
        Height = 15
        Caption = 'Telefone'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label65: TLabel
        Left = 590
        Top = 104
        Width = 117
        Height = 15
        Caption = 'Natureza da Opera'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 344
        Top = 104
        Width = 14
        Height = 15
        Caption = 'UF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edt_numero: TcxDBTextEdit
        Left = 174
        Top = 30
        AutoSize = False
        DataBinding.DataField = 'NUMERO'
        DataBinding.DataSource = dsVenda
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ReadOnly = True
        Style.TextStyle = [fsBold]
        TabOrder = 1
        Height = 23
        Width = 70
      end
      object edt_emitente: TcxDBTextEdit
        Left = 250
        Top = 30
        AutoSize = False
        DataBinding.DataField = 'VIRTUAL_EMPRESA'
        DataBinding.DataSource = dsVenda
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ReadOnly = True
        TabOrder = 2
        Height = 23
        Width = 334
      end
      object edt_emissao: TcxDBDateEdit
        Left = 756
        Top = 30
        AutoSize = False
        DataBinding.DataField = 'DATA_EMISSAO'
        DataBinding.DataSource = dsVenda
        Properties.ButtonGlyph.SourceDPI = 96
        Properties.ButtonGlyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001D744558745469746C650043616C656E6461723B5363686564756C65
          723B5669657785A932520000022749444154785E8D93CF4B545114C7BF6FE651
          1839D8F457B46AE3C640712144508B82A85DBB681515495308868C8454630B2B
          A2DAB4CA36516AA33625E314D3508B468BB0EC07445612D5A84DFAEE8FD3BDE7
          CE7B031AD181CBE79C7BCE3BE77B2FF779007C0031D4CDC36A5B9B23036D28BD
          C9BDBBF271A04D6B0DAD0996649632B4C6FBCAC564A95C5D206561FF93A71DBE
          EFA16DCBEE1D00B98FA115A08C2FA51BA56CACA0A4A1595ADA1A89E2DD5C2B80
          B8AF89B8687976C635503C91F7AC11C78A19FAF18D8D207247F2C9CA0E022829
          4192E51B2AA6359261439B73FB240C49BB06E53D69B4ECDB8A4645088DBCDA35
          19921B554F782E1E1E7C0E949ABD98946ED2ADD169CCCD2F60303B85CF5F1770
          F35E8DC3657C995F44A5FF0496BE7FC3CFF39D7C89422856E09DBB5EA223079A
          F161AE827F59C20F581511D0904C62E0C6339C3AB42D1113424313902FBD0369
          60A238CB7CF0F80D737CF235535CED85B6BCD2E328B453D03350A0D4C116BCFF
          54098FFD5726E22BD10B6A68DA8CCCB522D2C7DA9B622250BC79BF30C34AC6F2
          AF9823132F9943B9174C71B1DB9DFD421714190AE914A4FA7274FA683BDE7EFC
          51BFE5B564055493B0DE28E8BB9447A66BFBA6582014771E31932C87C6A79977
          46A798B7B365669049812CCF76421341867770B83B4B674E7660A95A7B793C11
          915114460E23DDFF10977B7726FD6A75B1703C3DD60AA248625416BDAA2817F9
          C1F2AF471636BB01C0BA55BFB1F71FBF7360F8FB0FFBFD934CCFEEFED0000000
          0049454E44AE426082}
        TabOrder = 4
        Height = 23
        Width = 110
      end
      object edt_saida: TcxDBDateEdit
        Left = 872
        Top = 30
        AutoSize = False
        DataBinding.DataField = 'DATA_SAIDA'
        DataBinding.DataSource = dsVenda
        Properties.ButtonGlyph.SourceDPI = 96
        Properties.ButtonGlyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001D744558745469746C650043616C656E6461723B5363686564756C65
          723B5669657785A932520000022749444154785E8D93CF4B545114C7BF6FE651
          1839D8F457B46AE3C640712144508B82A85DBB681515495308868C8454630B2B
          A2DAB4CA36516AA33625E314D3508B468BB0EC07445612D5A84DFAEE8FD3BDE7
          CE7B031AD181CBE79C7BCE3BE77B2FF779007C0031D4CDC36A5B9B23036D28BD
          C9BDBBF271A04D6B0DAD0996649632B4C6FBCAC564A95C5D206561FF93A71DBE
          EFA16DCBEE1D00B98FA115A08C2FA51BA56CACA0A4A1595ADA1A89E2DD5C2B80
          B8AF89B8687976C635503C91F7AC11C78A19FAF18D8D207247F2C9CA0E022829
          4192E51B2AA6359261439B73FB240C49BB06E53D69B4ECDB8A4645088DBCDA35
          19921B554F782E1E1E7C0E949ABD98946ED2ADD169CCCD2F60303B85CF5F1770
          F35E8DC3657C995F44A5FF0496BE7FC3CFF39D7C89422856E09DBB5EA223079A
          F161AE827F59C20F581511D0904C62E0C6339C3AB42D1113424313902FBD0369
          60A238CB7CF0F80D737CF235535CED85B6BCD2E328B453D03350A0D4C116BCFF
          54098FFD5726E22BD10B6A68DA8CCCB522D2C7DA9B622250BC79BF30C34AC6F2
          AF9823132F9943B9174C71B1DB9DFD421714190AE914A4FA7274FA683BDE7EFC
          51BFE5B564055493B0DE28E8BB9447A66BFBA6582014771E31932C87C6A79977
          46A798B7B365669049812CCF76421341867770B83B4B674E7660A95A7B793C11
          915114460E23DDFF10977B7726FD6A75B1703C3DD60AA248625416BDAA2817F9
          C1F2AF471636BB01C0BA55BFB1F71FBF7360F8FB0FFBFD934CCFEEFED0000000
          0049454E44AE426082}
        TabOrder = 5
        Height = 23
        Width = 110
      end
      object edt_pessoa: TcxDBLookupComboBox
        Left = 8
        Top = 75
        AutoSize = False
        DataBinding.DataField = 'ID_CLIENTE'
        DataBinding.DataSource = dsVenda
        Properties.CaseSensitiveSearch = True
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ImmediatePost = True
        Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
        Properties.KeyFieldNames = 'CODIGO'
        Properties.ListColumns = <
          item
            FieldName = 'CODIGO'
          end
          item
            FieldName = 'razao'
          end
          item
            FieldName = 'cnpj'
          end>
        Properties.ListFieldIndex = 1
        Properties.ListOptions.AnsiSort = True
        Properties.ListOptions.CaseInsensitive = True
        Properties.ListOptions.GridLines = glNone
        Properties.ListSource = dsPessoa
        TabOrder = 6
        OnEnter = edt_pessoaEnter
        OnExit = edt_pessoaExit
        OnKeyDown = edt_pessoaKeyDown
        Height = 23
        Width = 401
      end
      object edt_endereco: TcxDBTextEdit
        Left = 590
        Top = 75
        AutoSize = False
        DataBinding.DataField = 'VIRTUAL_ENDERECO'
        DataBinding.DataSource = dsVenda
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ReadOnly = True
        TabOrder = 8
        Height = 23
        Width = 276
      end
      object edt_numeroend: TcxDBTextEdit
        Left = 872
        Top = 75
        AutoSize = False
        DataBinding.DataField = 'VIRTUAL_NUMEND'
        DataBinding.DataSource = dsVenda
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ReadOnly = True
        TabOrder = 9
        Height = 23
        Width = 110
      end
      object edt_bairro: TcxDBTextEdit
        Left = 8
        Top = 120
        AutoSize = False
        DataBinding.DataField = 'VIRTUAL_BAIRRO'
        DataBinding.DataSource = dsVenda
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ReadOnly = True
        TabOrder = 10
        Height = 23
        Width = 110
      end
      object edt_cep: TcxDBTextEdit
        Left = 387
        Top = 120
        AutoSize = False
        DataBinding.DataField = 'VIRTUAL_CEP'
        DataBinding.DataSource = dsVenda
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ReadOnly = True
        TabOrder = 13
        Height = 23
        Width = 95
      end
      object edt_cpf: TcxDBTextEdit
        Left = 415
        Top = 75
        AutoSize = False
        DataBinding.DataField = 'VIRTUAL_CNPF_CLIENTE'
        DataBinding.DataSource = dsVenda
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ReadOnly = True
        TabOrder = 7
        Height = 23
        Width = 169
      end
      object edt_telefone: TcxDBTextEdit
        Left = 488
        Top = 120
        AutoSize = False
        DataBinding.DataField = 'VIRTUAL_TELEFONE'
        DataBinding.DataSource = dsVenda
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ReadOnly = True
        TabOrder = 14
        Height = 23
        Width = 96
      end
      object edt_natureza: TcxDBLookupComboBox
        Left = 590
        Top = 120
        AutoSize = False
        DataBinding.DataField = 'CFOP'
        DataBinding.DataSource = dsVenda
        Properties.CaseSensitiveSearch = True
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ImmediatePost = True
        Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
        Properties.KeyFieldNames = 'CODIGO'
        Properties.ListColumns = <
          item
            FieldName = 'CFOP'
          end>
        Properties.ListOptions.AnsiSort = True
        Properties.ListOptions.CaseInsensitive = True
        Properties.ListOptions.GridLines = glNone
        Properties.ListSource = dsCFOP
        Properties.MaxLength = 180
        TabOrder = 15
        OnEnter = edt_naturezaEnter
        OnExit = edt_naturezaExit
        OnKeyPress = edt_naturezaKeyPress
        Height = 23
        Width = 392
      end
      object edt_tiponfe: TcxDBRadioGroup
        Left = 7
        Top = 16
        BiDiMode = bdLeftToRight
        Caption = 'Tipo da Nota'
        DataBinding.DataField = 'MOVIMENTO'
        DataBinding.DataSource = dsVenda
        ParentBiDiMode = False
        Properties.ClearKey = 16452
        Properties.Columns = 2
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = 'Sa'#237'da'
            Value = 'S'
          end
          item
            Caption = 'Entrada'
            Value = 'E'
          end>
        Style.TextStyle = [fsBold]
        TabOrder = 0
        Transparent = True
        OnEnter = edt_tiponfeEnter
        OnExit = edt_tiponfeExit
        Height = 37
        Width = 161
      end
      object edt_cidade: TcxDBTextEdit
        Left = 124
        Top = 120
        AutoSize = False
        DataBinding.DataField = 'VIRTUAL_CIDADE'
        DataBinding.DataSource = dsVenda
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ReadOnly = True
        TabOrder = 11
        Height = 23
        Width = 214
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 344
        Top = 120
        AutoSize = False
        DataBinding.DataField = 'VIRTUAL_UF_CLIENTE'
        DataBinding.DataSource = dsVenda
        Properties.CharCase = ecUpperCase
        Properties.ClearKey = 16452
        Properties.ReadOnly = True
        TabOrder = 12
        Height = 23
        Width = 37
      end
      object edt_finalidade: TDBComboBoxEh
        Left = 590
        Top = 30
        Width = 160
        Height = 21
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'FINALIDADE'
        DataSource = dsVenda
        DynProps = <>
        EditButtons = <>
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Items.Strings = (
          '1 - NORMAL'
          '2 - COMPLEMENTAR'
          '3 - AJUSTE'
          '4 - DEVOLU'#199#195'O')
        KeyItems.Strings = (
          '0'
          '1'
          '2'
          '3')
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        Visible = True
        OnEnter = edt_finalidadeEnter
        OnExit = edt_finalidadeExit
        OnKeyPress = edt_finalidadeKeyPress
      end
    end
  end
  object PageControl1: TPageControl
    AlignWithMargins = True
    Left = 7
    Top = 490
    Width = 1006
    Height = 117
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    Margins.Bottom = 0
    ActivePage = TabSheet1
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 451
    ExplicitWidth = 990
    object TabSheet1: TTabSheet
      Caption = 'Totais'
      object Label11: TLabel
        Left = 4
        Top = 1
        Width = 45
        Height = 15
        Caption = 'SubTotal'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 379
        Top = 1
        Width = 43
        Height = 15
        Caption = 'Base PIS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 500
        Top = 1
        Width = 45
        Height = 15
        Caption = 'Valor PIS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 379
        Top = 44
        Width = 71
        Height = 15
        Caption = 'Base de ICMS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 500
        Top = 44
        Width = 73
        Height = 15
        Caption = 'Valor de ICMS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 863
        Top = 1
        Width = 26
        Height = 15
        Caption = 'Frete'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 4
        Top = 44
        Width = 37
        Height = 15
        Caption = 'Seguro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label23: TLabel
        Left = 258
        Top = 1
        Width = 63
        Height = 15
        Caption = 'Valor Cofins'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label20: TLabel
        Left = 100
        Top = 44
        Width = 35
        Height = 15
        Caption = 'Outras'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label22: TLabel
        Left = 197
        Top = 44
        Width = 50
        Height = 15
        Caption = 'Desconto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label24: TLabel
        Left = 863
        Top = 44
        Width = 25
        Height = 15
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label21: TLabel
        Left = 137
        Top = 1
        Width = 61
        Height = 15
        Caption = 'Base Cofins'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 621
        Top = 1
        Width = 56
        Height = 15
        Caption = 'Base de IPI'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 742
        Top = 1
        Width = 58
        Height = 15
        Caption = 'Valor de IPI'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label39: TLabel
        Left = 621
        Top = 44
        Width = 86
        Height = 15
        Caption = 'Base de ICMS ST'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label40: TLabel
        Left = 742
        Top = 44
        Width = 88
        Height = 15
        Caption = 'Valor de ICMS ST'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 294
        Top = 44
        Width = 68
        Height = 15
        Caption = 'Desonera'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object DBEdit11: TDBEdit
        Left = 3
        Top = 17
        Width = 128
        Height = 21
        TabStop = False
        Color = 16053492
        Ctl3D = False
        DataField = 'SUBTOTAL'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit16: TDBEdit
        Left = 379
        Top = 17
        Width = 115
        Height = 21
        TabStop = False
        Color = 16053492
        Ctl3D = False
        DataField = 'BASEICMSPIS'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit17: TDBEdit
        Left = 500
        Top = 17
        Width = 115
        Height = 21
        TabStop = False
        Color = 16053492
        Ctl3D = False
        DataField = 'TOTALICMSPIS'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit12: TDBEdit
        Left = 379
        Top = 60
        Width = 115
        Height = 21
        TabStop = False
        Color = 16053492
        Ctl3D = False
        DataField = 'BASEICMS'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit14: TDBEdit
        Left = 500
        Top = 60
        Width = 115
        Height = 21
        TabStop = False
        Color = 16053492
        Ctl3D = False
        DataField = 'TOTALICMS'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit13: TDBEdit
        Left = 621
        Top = 17
        Width = 115
        Height = 21
        TabStop = False
        Color = 16053492
        Ctl3D = False
        DataField = 'BASE_IPI'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object DBEdit15: TDBEdit
        Left = 742
        Top = 17
        Width = 115
        Height = 21
        TabStop = False
        Color = 16053492
        Ctl3D = False
        DataField = 'TOTAL_IPI'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object DBEdit18: TDBEdit
        Left = 863
        Top = 17
        Width = 115
        Height = 21
        Ctl3D = False
        DataField = 'FRETE'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
      end
      object DBEdit19: TDBEdit
        Left = 4
        Top = 60
        Width = 90
        Height = 21
        Ctl3D = False
        DataField = 'SEGURO'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 8
      end
      object DBEdit23: TDBEdit
        Left = 258
        Top = 17
        Width = 115
        Height = 21
        TabStop = False
        Color = 16053492
        Ctl3D = False
        DataField = 'TOTALICMSCOFINS'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
      end
      object DBEdit20: TDBEdit
        Left = 100
        Top = 60
        Width = 91
        Height = 21
        Ctl3D = False
        DataField = 'OUTROS'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 10
      end
      object DBEdit22: TDBEdit
        Left = 197
        Top = 60
        Width = 91
        Height = 21
        Ctl3D = False
        DataField = 'DESCONTO'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 11
      end
      object DBEdit24: TDBEdit
        Left = 863
        Top = 60
        Width = 115
        Height = 21
        TabStop = False
        Color = 16053492
        Ctl3D = False
        DataField = 'TOTAL'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 13
      end
      object DBEdit21: TDBEdit
        Left = 137
        Top = 17
        Width = 115
        Height = 21
        TabStop = False
        Color = 16053492
        Ctl3D = False
        DataField = 'BASEICMSCOF'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 14
      end
      object DBEdit33: TDBEdit
        Left = 621
        Top = 60
        Width = 115
        Height = 21
        TabStop = False
        Color = 16053492
        Ctl3D = False
        DataField = 'BASE_ICMS_ST'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 15
      end
      object DBEdit34: TDBEdit
        Left = 742
        Top = 60
        Width = 115
        Height = 21
        TabStop = False
        Color = 16053492
        Ctl3D = False
        DataField = 'VALOR_ICMS_ST'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 16
      end
      object DBEdit26: TDBEdit
        Left = 294
        Top = 60
        Width = 79
        Height = 21
        Color = clWhite
        Ctl3D = False
        DataField = 'TOTAL_DESONERACAO'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Volumes'
      ImageIndex = 1
      object Label27: TLabel
        Left = 3
        Top = 4
        Width = 39
        Height = 15
        Caption = 'Esp'#233'cie'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label32: TLabel
        Left = 197
        Top = 4
        Width = 33
        Height = 15
        Caption = 'Marca'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label33: TLabel
        Left = 406
        Top = 4
        Width = 62
        Height = 15
        Caption = 'Quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label34: TLabel
        Left = 527
        Top = 4
        Width = 68
        Height = 15
        Caption = 'Peso L'#237'quido'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label35: TLabel
        Left = 607
        Top = 4
        Width = 57
        Height = 15
        Caption = 'Peso Bruto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object DBEdit28: TDBEdit
        Left = 3
        Top = 20
        Width = 188
        Height = 22
        Ctl3D = False
        DataField = 'ESPECIE'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit29: TDBEdit
        Left = 197
        Top = 20
        Width = 203
        Height = 22
        Ctl3D = False
        DataField = 'MARCA'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
      end
      object DBEdit30: TDBEdit
        Left = 406
        Top = 20
        Width = 115
        Height = 22
        Ctl3D = False
        DataField = 'QVOL'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
      object DBEdit31: TDBEdit
        Left = 527
        Top = 20
        Width = 74
        Height = 22
        Ctl3D = False
        DataField = 'PESOL'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
      end
      object DBEdit32: TDBEdit
        Left = 607
        Top = 20
        Width = 75
        Height = 22
        Ctl3D = False
        DataField = 'PESOB'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Informa'#231#245'es do Fisco'
      ImageIndex = 2
      object DBMemoEh1: TDBMemoEh
        Left = 0
        Top = 0
        Width = 982
        Height = 86
        Align = alClient
        AutoSize = False
        Ctl3D = False
        DataField = 'OBSFISCO'
        DataSource = dsVenda
        DynProps = <>
        EditButtons = <>
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Flat = True
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        Visible = True
        WantReturns = True
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Informa'#231#245'es de Contribuinte'
      ImageIndex = 3
      object DBMemoEh2: TDBMemoEh
        Left = 0
        Top = 0
        Width = 982
        Height = 86
        Align = alClient
        AutoSize = False
        Ctl3D = False
        DataField = 'OBSCONTRIBUINTE'
        DataSource = dsVenda
        DynProps = <>
        EditButtons = <>
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Flat = True
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        Visible = True
        WantReturns = True
      end
    end
    object TabSheet9: TTabSheet
      Caption = 'Transportadora'
      ImageIndex = 5
      object Label5: TLabel
        Left = 243
        Top = 9
        Width = 73
        Height = 15
        Caption = 'Transportador'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 711
        Top = 3
        Width = 28
        Height = 15
        Caption = 'Placa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 793
        Top = 8
        Width = 14
        Height = 15
        Caption = 'UF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 3
        Top = 8
        Width = 82
        Height = 15
        Caption = 'Frete por Conta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object DBEdit5: TDBEdit
        Left = 243
        Top = 24
        Width = 52
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'ID_TRANSPORTADOR'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnExit = DBEdit5Exit
      end
      object DBLookupComboboxEh2: TDBLookupComboboxEh
        Left = 301
        Top = 24
        Width = 404
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        DynProps = <>
        DataField = 'VIRTUAL_TRANSP'
        DataSource = dsVenda
        DropDownBox.AutoDrop = True
        DropDownBox.ShowTitles = True
        EditButtons = <>
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = True
      end
      object DBEdit6: TDBEdit
        Left = 711
        Top = 24
        Width = 76
        Height = 22
        CharCase = ecUpperCase
        Color = clWhite
        Ctl3D = False
        DataField = 'PLACA'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
      object DBEdit7: TDBEdit
        Left = 793
        Top = 24
        Width = 34
        Height = 22
        CharCase = ecUpperCase
        Color = clWhite
        Ctl3D = False
        DataField = 'UFPLACA'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
      end
      object DBComboBoxEh1: TDBComboBoxEh
        Left = 3
        Top = 24
        Width = 234
        Height = 22
        Ctl3D = False
        DataField = 'TIPO_FRETE'
        DataSource = dsVenda
        DynProps = <>
        EditButtons = <>
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Items.Strings = (
          'EMITENTE'
          'DESTIN'#193'RIO'
          'TERCEIRO'
          'REMETENTE'
          'SEM FRETE')
        KeyItems.Strings = (
          '0'
          '1'
          '2'
          '3'
          '5')
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        Visible = True
      end
    end
    object TabSheet10: TTabSheet
      Caption = 'Refer'#234'ncia'
      ImageIndex = 6
      object Label41: TLabel
        Left = 3
        Top = 5
        Width = 114
        Height = 16
        Caption = 'Chave Referenciada'
      end
      object DBEdit39: TDBEdit
        Left = 3
        Top = 22
        Width = 670
        Height = 22
        Color = clWhite
        Ctl3D = False
        DataField = 'REFERENCIA'
        DataSource = dsReferencia
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Conting'#234'ncia'
      ImageIndex = 4
      object Label42: TLabel
        Left = 3
        Top = 5
        Width = 195
        Height = 16
        Caption = 'Motivo de Entrada em Contig'#234'ncia'
      end
      object DBEdit35: TDBEdit
        Left = 3
        Top = 22
        Width = 670
        Height = 22
        Color = clWhite
        Ctl3D = False
        DataField = 'MOTIVO_CONTIGENCIA'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object PageControl2: TPageControl
    AlignWithMargins = True
    Left = 7
    Top = 160
    Width = 1006
    Height = 323
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    Margins.Bottom = 0
    ActivePage = TabSheet5
    Align = alClient
    TabOrder = 1
    TabStop = False
    OnChange = PageControl2Change
    ExplicitWidth = 990
    ExplicitHeight = 284
    object TabSheet5: TTabSheet
      Caption = 'Itens'
      object Label37: TLabel
        Left = 0
        Top = 0
        Width = 998
        Height = 13
        Align = alTop
        AutoSize = False
        Caption = '     Clique nas teclas [CTRL + Delete] para excluir ITEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 262
      end
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 13
        Width = 998
        Height = 279
        Hint = 'D'#234' Duplo Click para Alterar os Dados Produto'
        Align = alClient
        DataSource = dsItem
        DynProps = <>
        EvenRowColor = clInfoBk
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TitleParams.Font.Charset = ANSI_CHARSET
        TitleParams.Font.Color = clBlack
        TitleParams.Font.Height = -13
        TitleParams.Font.Name = 'Segoe UI'
        TitleParams.Font.Style = []
        TitleParams.ParentFont = False
        OnDblClick = DBGridEh1DblClick
        OnEnter = DBGridEh1Enter
        OnExit = DBGridEh1Exit
        OnKeyDown = DBGridEh1KeyDown
        OnKeyPress = DBGridEh1KeyPress
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ITEM'
            Footers = <>
            ReadOnly = True
            Title.Caption = 'Item'
            Width = 31
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ID_PRODUTO'
            Footers = <>
            Title.Caption = 'Cod.'
            Width = 48
          end
          item
            AutoDropDown = True
            CellButtons = <>
            DropDownBox.ColumnDefValues.AutoDropDown = True
            DynProps = <>
            EditButtons = <>
            FieldName = 'VIRTUAL_PRODUTO'
            Footers = <>
            Title.Caption = 'Produto'
            Width = 410
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CFOP'
            Footers = <>
            Width = 40
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CST'
            Footers = <>
            Width = 34
          end
          item
            CellButtons = <>
            CellDataIsLink = True
            DynProps = <>
            EditButtons = <>
            FieldName = 'CSOSN'
            Footers = <>
            Width = 48
          end
          item
            Alignment = taCenter
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'PRECO'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'Pre'#231'o'
            Width = 92
          end
          item
            Alignment = taCenter
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'QTD'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'Qtd.'
            Width = 60
          end
          item
            Alignment = taCenter
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'UNIDADE'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Und.'
            Width = 30
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'TOTAL'
            Footers = <>
            Title.Alignment = taRightJustify
            Title.Caption = 'Total'
            Width = 85
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NPEDIDO'
            Footers = <>
            Title.Alignment = taRightJustify
            Title.Caption = 'Pedido'
            Width = 66
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object pnlCFOPComb: TPanel
        Left = 373
        Top = 63
        Width = 242
        Height = 137
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        Visible = False
        object Shape2: TShape
          Left = 0
          Top = 0
          Width = 242
          Height = 1
          Align = alTop
          ExplicitWidth = 217
        end
        object Shape3: TShape
          Left = 0
          Top = 136
          Width = 242
          Height = 1
          Align = alBottom
          ExplicitTop = 8
          ExplicitWidth = 217
        end
        object Shape4: TShape
          Left = 0
          Top = 1
          Width = 1
          Height = 135
          Align = alLeft
          ExplicitHeight = 217
        end
        object Shape5: TShape
          Left = 241
          Top = 1
          Width = 1
          Height = 135
          Align = alRight
          ExplicitLeft = 0
          ExplicitHeight = 217
        end
        object Label49: TLabel
          Left = 83
          Top = 7
          Width = 76
          Height = 13
          Caption = 'Combustiveis'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label50: TLabel
          Left = 7
          Top = 23
          Width = 98
          Height = 15
          Caption = 'C'#243'd. Produto ANP'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label51: TLabel
          Left = 7
          Top = 63
          Width = 124
          Height = 15
          Caption = 'Descri'#231#227'o Produto ANP'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label52: TLabel
          Left = 113
          Top = 23
          Width = 14
          Height = 15
          Caption = 'UF'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object DBEdit40: TDBEdit
          Left = 7
          Top = 38
          Width = 100
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          Ctl3D = False
          DataField = 'COD_PROD_ANP_COMB'
          DataSource = dsItem
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          MaxLength = 15
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnKeyPress = DBEdit40KeyPress
        end
        object DBEdit41: TDBEdit
          Left = 7
          Top = 77
          Width = 228
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          Ctl3D = False
          DataField = 'DESC_ANP_COMB'
          DataSource = dsItem
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          MaxLength = 15
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
        object DBComboBoxEh8: TDBComboBoxEh
          Left = 113
          Top = 38
          Width = 88
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'UF_CON_COMB'
          DataSource = dsItem
          DynProps = <>
          EditButtons = <>
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Items.Strings = (
            'AC'
            'AL'
            'AP'
            'AM'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MT'
            'MS'
            'MG'
            'PA'
            'PB'
            'PR'
            'PE'
            'PI'
            'RJ'
            'RN'
            'RS'
            'RO'
            'RR'
            'SC'
            'SP'
            'SE'
            'TO')
          KeyItems.Strings = (
            'AC'
            'AL'
            'AP'
            'AM'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MT'
            'MS'
            'MG'
            'PA'
            'PB'
            'PR'
            'PE'
            'PI'
            'RJ'
            'RN'
            'RS'
            'RO'
            'RR'
            'SC'
            'SP'
            'SE'
            'TO')
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          Visible = True
          OnKeyPress = DBComboBoxEh4KeyPress
        end
        object btnSairComb: TButton
          Left = 83
          Top = 104
          Width = 75
          Height = 25
          Caption = 'OK'
          TabOrder = 3
          OnClick = btnSairCombClick
          OnEnter = btnSairCombEnter
          OnExit = btnSairCombExit
        end
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'Impostos  / Outros'
      ImageIndex = 2
      object DBText2: TDBText
        Left = 0
        Top = 0
        Width = 982
        Height = 17
        Align = alTop
        DataField = 'VIRTUAL_PRODUTO'
        DataSource = dsItem
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 464
        ExplicitTop = 120
        ExplicitWidth = 65
      end
      object DBGridEh3: TDBGridEh
        Left = 0
        Top = 17
        Width = 982
        Height = 236
        Align = alClient
        DataSource = dsItem
        DynProps = <>
        EvenRowColor = clInfoBk
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TitleParams.Font.Charset = ANSI_CHARSET
        TitleParams.Font.Color = clBlack
        TitleParams.Font.Height = -12
        TitleParams.Font.Name = 'Segoe UI'
        TitleParams.Font.Style = []
        TitleParams.ParentFont = False
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ID_PRODUTO'
            Footers = <>
            ReadOnly = True
            Title.Caption = 'Cod.'
            Width = 48
          end
          item
            AutoDropDown = True
            CellButtons = <>
            DropDownBox.ColumnDefValues.AutoDropDown = True
            DynProps = <>
            EditButtons = <>
            FieldName = 'INFO_ADICIONAIS'
            Footers = <>
            Title.Caption = 'Informa'#231#245'es Adicionais do Produto'
            Width = 424
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'TOTAL'
            Footers = <>
            Title.Caption = 'Total'
            Width = 95
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'SEGURO'
            Footers = <>
            Title.Alignment = taRightJustify
            Title.Caption = 'Seguro'
            Width = 53
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'FRETE'
            Footers = <>
            Title.Alignment = taRightJustify
            Title.Caption = 'Frete'
            Width = 58
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'OUTROS'
            Footers = <>
            Title.Alignment = taRightJustify
            Title.Caption = 'Outros'
            Width = 70
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DESCONTO'
            Footers = <>
            Title.Alignment = taRightJustify
            Title.Caption = 'Desconto'
            Width = 70
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ALIQ_IPI'
            Footers = <>
            Title.Alignment = taRightJustify
            Title.Caption = 'Aliq.IPI'
            Width = 67
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'VALOR_IPI'
            Footers = <>
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor IPI'
            Width = 68
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'BASE_ICMS'
            Footers = <>
            Title.Alignment = taRightJustify
            Title.Caption = 'Base ICMS'
            Width = 70
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ALIQ_ICMS'
            Footers = <>
            Title.Alignment = taRightJustify
            Title.Caption = 'Aliq.ICMS'
            Width = 59
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'VALOR_ICMS'
            Footers = <>
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor ICMS'
            Width = 69
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ALIQ_PIS_ICMS'
            Footers = <>
            Title.Alignment = taRightJustify
            Title.Caption = 'Aliq.PIS'
            Width = 51
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'VALOR_PIS_ICMS'
            Footers = <>
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor PIS'
            Width = 63
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ALIQ_COFINS_ICMS'
            Footers = <>
            Title.Caption = 'Aliq.COF'
            Width = 61
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'VALOR_COFINS_ICMS'
            Footers = <>
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor COFINS'
            Width = 80
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'VIRTUAL_MOTIVO'
            Footers = <>
            Title.Caption = 'Motivo da Desonera'#231#227'o'
            Width = 208
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'BASE_DESONERACAO'
            Footers = <>
            Title.Caption = 'Base Deson'
            Width = 88
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ALIQ_DESONERACAO'
            Footers = <>
            Title.Caption = 'Desc. Deson'
            Width = 79
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'VICMSDESON'
            Footers = <>
            ReadOnly = True
            Title.Caption = 'Valor Deson'
            Width = 87
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Pagamento'
      ImageIndex = 1
      object Label25: TLabel
        Left = 127
        Top = 9
        Width = 50
        Height = 17
        Caption = 'Parcelas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label26: TLabel
        Left = 7
        Top = 9
        Width = 84
        Height = 17
        Caption = 'Total da Nota'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 472
        Top = 11
        Width = 89
        Height = 15
        Caption = 'Pedido/Contrato'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 578
        Top = 11
        Width = 98
        Height = 15
        Caption = 'Forma Pagamento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 775
        Top = 11
        Width = 87
        Height = 15
        Caption = 'Tipo Pagamento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object DBGridEh2: TDBGridEh
        Left = 7
        Top = 56
        Width = 459
        Height = 156
        DataSource = dsFatura
        DynProps = <>
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        IndicatorOptions = []
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        PopupMenu = PopupMenu
        TabOrder = 0
        TitleParams.Font.Charset = ANSI_CHARSET
        TitleParams.Font.Color = clWindowText
        TitleParams.Font.Height = -13
        TitleParams.Font.Name = 'Segoe UI'
        TitleParams.Font.Style = [fsBold]
        TitleParams.ParentFont = False
        OnEnter = DBGridEh2Enter
        OnExit = DBGridEh2Exit
        OnKeyPress = DBGridEh2KeyPress
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NUMERO'
            Footers = <>
            Title.Caption = 'N'#250'mero'
            Width = 83
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DATA_VENCIMENTO'
            Footers = <>
            Title.Caption = 'Vencimento'
            Width = 143
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'VALOR'
            Footers = <>
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor'
            Width = 118
          end
          item
            Alignment = taCenter
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'BOLETO_GERADO'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'Boleto'
            Width = 85
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object BtnGerar: TBitBtn
        Left = 214
        Top = 5
        Width = 106
        Height = 45
        Caption = 'Gerar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Glyph.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C0000130B0000130B00000000000000000000FFFFFFF4E7DB
          D7A97DC48241C48241C48241C48241C48241C48241C48241C48241C48241C482
          41C48241C48241C48241C48241D7A97DFFFFFFE2F2E071C06667BC5C8DCD85F5
          FBF5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4D
          C48241C48241C48241C48241C48241C48241C48241C48241C48241C48241C482
          41C48241C48241C48241C48241E9D0B7FFFFFF7AC47067BC5C67BC5C67BC5CBC
          E2B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7A97DC48241
          C48241DEB994F0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0
          CFF0E0CFF0E0CFF0E0CFF0E0CFFBF7F3FFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          DEB994FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2F2E0B3DD
          ADB3DDADB3DDADB3DDADB3DDADB3DDADB3DDAD67BC5C67BC5C67BC5C67BC5C8D
          CD85B3DDADB3DDADB3DDADB3DDADB3DDADB3DDADBCE2B7F5FBF5C48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECF7EB71C06667BC
          5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67
          BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C8DCD85C48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3DDAD67BC5C67BC
          5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67
          BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5CC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEACC67BC5C67BC
          5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67
          BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C71C066C48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAD9A471C0
          6667BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67
          BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C7AC470E2F2E0C48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF71C06667BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAD9A467BC5C67BC5C71C066E2
          F2E0FFFFFFE5C8ACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          CF9A65D3A171D3A171D3A171D3A171D3A171D3A171DEB994FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEACCB3DDADECF7EBFF
          FFFFF0E0CFD3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC88A4DC48241
          C48241C48241C48241C48241C48241C48241C48241C48241E1C0A0FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEC
          D8C3C88A4DD3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4D
          C48241C48241C48241C48241C48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DB
          C88A4DC48241C48241C48241C48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F4E7DBC88A4DC48241C48241C48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF4E7DBC88A4DC48241C48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF4E7DBC88A4DC48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF4E7DBC88A4DC48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF7F3CB
          9259C48241DAB189FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4DC48241C48241CF9A65F0E0CFF0E0
          CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFECD8C3CF9A65C4
          8241C48241E9D0B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4DC48241C48241C48241C482
          41C48241C48241C48241C48241C48241C48241C48241C48241C48241C48241C4
          8241D7A97DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4DC48241C48241C482
          41C48241C48241C48241C48241C48241C48241C48241C48241C48241C88A4DE1
          C0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentFont = False
        TabOrder = 1
        OnClick = BtnGerarClick
      end
      object edtParcela: TEdit
        Left = 127
        Top = 27
        Width = 64
        Height = 22
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        NumbersOnly = True
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        Text = '1'
      end
      object DBEdit25: TDBEdit
        Left = 7
        Top = 27
        Width = 115
        Height = 22
        TabStop = False
        Color = 16053492
        Ctl3D = False
        DataField = 'TOTAL'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
      end
      object GroupBox1: TGroupBox
        Left = 472
        Top = 49
        Width = 488
        Height = 163
        Caption = 'Cart'#227'o de Cr'#233'dito'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object Label44: TLabel
          Left = 10
          Top = 21
          Width = 188
          Height = 15
          Caption = 'Tipo de Integra'#231#227'o para pagamento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label45: TLabel
          Left = 10
          Top = 68
          Width = 175
          Height = 15
          Caption = 'CNPJ da Credenciadora de cart'#227'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label46: TLabel
          Left = 10
          Top = 108
          Width = 171
          Height = 15
          Caption = 'Bandeira da operadora de cart'#227'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label47: TLabel
          Left = 226
          Top = 68
          Width = 126
          Height = 15
          Caption = 'N'#250'mero de Autoriza'#231#227'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object DBComboBoxEh6: TDBComboBoxEh
          Left = 10
          Top = 39
          Width = 469
          Height = 21
          Ctl3D = False
          DataField = 'TPINTEGRA'
          DataSource = dsVenda
          DynProps = <>
          EditButtons = <>
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Items.Strings = (
            'Pagamento integrado com o sistema de automa'#231#227'o da empresa '
            'Pagamento n'#227'o integrado com o sistema de automa'#231#227'o da empresa')
          KeyItems.Strings = (
            '0'
            '1')
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          Visible = True
          OnKeyPress = DBComboBoxEh4KeyPress
        end
        object DBEdit8: TDBEdit
          Left = 10
          Top = 83
          Width = 210
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          Ctl3D = False
          DataField = 'CNPJ_CARTAO'
          DataSource = dsVenda
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object DBComboBoxEh7: TDBComboBoxEh
          Left = 10
          Top = 126
          Width = 221
          Height = 21
          Ctl3D = False
          DataField = 'TPBANDEIRA'
          DataSource = dsVenda
          DynProps = <>
          EditButtons = <>
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Items.Strings = (
            'Visa'
            'Mastercard'
            'American Express'
            'Sorocred'
            'Diners Club'
            'Elo'
            'Hipercard'
            'Aura'
            'Cabal'
            'Outros')
          KeyItems.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7'
            '8'
            '9')
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
          Visible = True
          OnKeyPress = DBComboBoxEh4KeyPress
        end
        object DBEdit37: TDBEdit
          Left = 226
          Top = 83
          Width = 247
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          Ctl3D = False
          DataField = 'NUMERO_AUTORIZACAO'
          DataSource = dsVenda
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
      end
      object DBEdit9: TDBEdit
        Left = 351
        Top = 218
        Width = 115
        Height = 22
        TabStop = False
        Color = 16053492
        Ctl3D = False
        DataField = 'TTOTAL'
        DataSource = dsFatura
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
      end
      object btnGerarBoleto: TBitBtn
        Left = 328
        Top = 5
        Width = 138
        Height = 45
        Caption = 'Gerar Boletos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Glyph.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C0000130B0000130B00000000000000000000FFFFFFF4E7DB
          D7A97DC48241C48241C48241C48241C48241C48241C48241C48241C48241C482
          41C48241C48241C48241C48241D7A97DFFFFFFE2F2E071C06667BC5C8DCD85F5
          FBF5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4D
          C48241C48241C48241C48241C48241C48241C48241C48241C48241C48241C482
          41C48241C48241C48241C48241E9D0B7FFFFFF7AC47067BC5C67BC5C67BC5CBC
          E2B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7A97DC48241
          C48241DEB994F0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0
          CFF0E0CFF0E0CFF0E0CFF0E0CFFBF7F3FFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          DEB994FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2F2E0B3DD
          ADB3DDADB3DDADB3DDADB3DDADB3DDADB3DDAD67BC5C67BC5C67BC5C67BC5C8D
          CD85B3DDADB3DDADB3DDADB3DDADB3DDADB3DDADBCE2B7F5FBF5C48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECF7EB71C06667BC
          5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67
          BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C8DCD85C48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3DDAD67BC5C67BC
          5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67
          BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5CC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEACC67BC5C67BC
          5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67
          BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C71C066C48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAD9A471C0
          6667BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67
          BC5C67BC5C67BC5C67BC5C67BC5C67BC5C67BC5C7AC470E2F2E0C48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF67BC5C67BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF71C06667BC5C67BC5C67BC5CB3
          DDADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          F0E0CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAD9A467BC5C67BC5C71C066E2
          F2E0FFFFFFE5C8ACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC48241C48241
          CF9A65D3A171D3A171D3A171D3A171D3A171D3A171DEB994FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEACCB3DDADECF7EBFF
          FFFFF0E0CFD3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC88A4DC48241
          C48241C48241C48241C48241C48241C48241C48241C48241E1C0A0FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEC
          D8C3C88A4DD3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4D
          C48241C48241C48241C48241C48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DB
          C88A4DC48241C48241C48241C48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F4E7DBC88A4DC48241C48241C48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF4E7DBC88A4DC48241C48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF4E7DBC88A4DC48241C48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
          A171C48241D3A171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF4E7DBC88A4DC48241C48241C48241D3A171FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF7F3CB
          9259C48241DAB189FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4DC48241C48241CF9A65F0E0CFF0E0
          CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFECD8C3CF9A65C4
          8241C48241E9D0B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4DC48241C48241C48241C482
          41C48241C48241C48241C48241C48241C48241C48241C48241C48241C48241C4
          8241D7A97DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DBC88A4DC48241C48241C482
          41C48241C48241C48241C48241C48241C48241C48241C48241C48241C88A4DE1
          C0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentFont = False
        TabOrder = 6
        OnClick = btnGerarBoletoClick
      end
      object DBEdit2: TDBEdit
        Left = 472
        Top = 27
        Width = 100
        Height = 22
        CharCase = ecUpperCase
        Color = clWhite
        Ctl3D = False
        DataField = 'NPEDIDO'
        DataSource = dsVenda
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 15
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
      end
      object DBComboBoxEh2: TDBComboBoxEh
        Left = 578
        Top = 27
        Width = 191
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'INDPAG'
        DataSource = dsVenda
        DynProps = <>
        EditButtons = <>
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Items.Strings = (
          #192' VISTA'
          #192' PRAZO'
          'OUTRAS'
          'NENHUM')
        KeyItems.Strings = (
          '0'
          '1'
          '2'
          '3')
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 8
        Visible = True
        OnKeyPress = DBComboBoxEh4KeyPress
      end
      object DBComboBoxEh3: TDBComboBoxEh
        Left = 775
        Top = 27
        Width = 185
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        DataField = 'TPPAG'
        DataSource = dsVenda
        DynProps = <>
        EditButtons = <>
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Items.Strings = (
          'DINHEIRO'
          'CHEQUE'
          'CART'#195'O CREDITO'
          'CART'#195'O DEBITO'
          'CREDITO LOJA'
          'VALE ALIMENTA'#199#195'O'
          'VALE REFEI'#199#195'O'
          'VALE PRESENTE'
          'VALE COMBUST'#205'VEL'
          'DUPLICATA MERCANTIL'
          'BOLETO BANC'#193'RIO'
          'DEPOSITO BANC'#193'RIO'
          'PIX'
          'TRANSF. BANC'#193'RIO'
          'PROGRAMA FIDELIDADE'
          'SEM PAGAMENTO'
          'REGIME ESPECIAL'
          'OUTRO')
        KeyItems.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15'
          '16'
          '17')
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 9
        Visible = True
        OnKeyPress = DBComboBoxEh4KeyPress
      end
      object DBCheckBox1: TDBCheckBox
        Left = 780
        Top = 218
        Width = 180
        Height = 23
        TabStop = False
        Caption = 'Cliente '#233' Consumidor Final'
        DataField = 'CONSUMIDOR_FINAL'
        DataSource = dsVenda
        TabOrder = 10
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        WordWrap = True
      end
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 7
    Top = 614
    Width = 1006
    Height = 89
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    Margins.Bottom = 7
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    ExplicitTop = 575
    ExplicitWidth = 990
    object cxTransmitir: TcxButton
      AlignWithMargins = True
      Left = 114
      Top = 7
      Width = 100
      Height = 75
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 0
      Margins.Bottom = 7
      Align = alLeft
      Caption = 'F3 | Transmitir'
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'DevExpressDarkStyle'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D4948445200000024000000240806000000E10098
        9800000006624B474400FF00FF00FFA0BDA79300000291494441545809ED97BD
        6B144118C6DF3DA3222888958518D12658A5512CFC2A4545ACD4341205C53F21
        A0E00ADA0B56C642D4466C12154524CA3516A268C4528C778220D808A91225E3
        EF39EE96BBCD7EE5766F0471787EFBCE3B37F3CEC3DCEC9198FD6F254FC03977
        A46489EA9663E6382C5657B144258CB4CC105D89322B5E1A24ADC0C405C66FC0
        104867F41800B34110CC66D6C5CC1E58001F0A2DD63A27D03DFC8EE403EC828E
        9A9D4E45713375D6423171346B600A5A2AB6AAF82C8AD6410A2DD66AB1BC95F2
        BDEACD3A49320D5E9568480EDAA64ED09F026F4A35240798FA451C036F0ABCED
        D4B51197E710A92EF6B2D73ED3100B57B3F032E86DBCC9897D71CE9D23DF012F
        E0339C07E93A8F1F30011B6086F933CCDF6666E346230FAD6CA3E02D90EEF118
        81DFA0DFA9ADC483D0D14B3AD7A0A3D06824D11CD2F2A2E0B0734E0664E4117D
        695295E9449BD18F2B341A83D11CD25C655E6AADE6989BC4BBB00A8EC2225C85
        81A856B0AA0C2C3137808798FC4A8CEB2D033FE113F4AD5AC195EB982733041B
        D22301FD909E66FC1BF4ADA2862EB1830C2D118F712F46883DE2D4E6E071CF60
        1F49AEA1F6E6A7A8ADBBF380A8BB7491B86251ABDE66346D71AE2116EA7464E2
        0EFD0990B1310A2F3B253ECBD30126888DC444A5DD87D664369591F7241FE13E
        5F4993B1B3F4B7C02698039924449AA4F70C5E81D430B32BD0AD86A5B4203ECE
        86A38C89EF185061D2BF280C8520D5ADE246D1DC3FCA6A15EF9957EE39A6D667
        4DF26D683F669E6499F26D083F26534FD34C65BD65FAEFA3618369FB28FB0653
        BB7971E6E947CA32A40B381CCDACBEB39D923BE135444A3234CDA70D1B4CBBDD
        2EBB401CE7747ACC30E6577C45D23C8FBD7E774ED90D2332A3FB9332C3F33086
        0E7BDEF21FDCEE0F02DFC0DF68707F680000000049454E44AE426082}
      OptionsImage.Layout = blGlyphTop
      TabOrder = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = cxTransmitirClick
    end
    object cxImportar: TcxButton
      AlignWithMargins = True
      Left = 328
      Top = 7
      Width = 100
      Height = 75
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 0
      Margins.Bottom = 7
      Align = alLeft
      Caption = 'F6 | Importar'
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'DevExpressDarkStyle'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D4948445200000024000000240806000000E10098
        9800000006624B474400FF00FF00FFA0BDA79300000262494441545809ED97BF
        6B154110C7E7C283FC09A611432060E7034D27E459586BA1B111D24508626D11
        306225A4782049C0EA42B079AD6D2027A4B430754208C1D222D61A369FD9DC9D
        97E3EE7637EF0E2CDE30DFFD313B33FBDDB9BDE33D91894C2A305E05A2BA7063
        CC1C6B2B605C3D89A2E8B32621E7BA5C498CED544284E0016843F7B37D0BC906
        5223BD1A7BD9BC573604CC0F037CC58B10E57D1C92741CDFA97182BB889D1072
        55F5BFAB90D7A5E6751DB94E96AEEFF3026CEB989879FA0FA0EAD0EF8C31ABAC
        65BA4BDCD76C52D91370D3EFD05A96901C4BE00F68D24F2CE61F68AF0AB181FD
        D2D2FBE86D3698E7C44760C45863BED054EDB589FD0D7E86BE59499457A8D9D3
        BD4AAE17E02F28EA2693BC32CE2C38B746483723DFB231E602A86ED15492A92A
        A3C6B70E1ECB4E4A6281E4AF99BB1F138EB912DC6A85F2C48E41D52BE908F15F
        E650CFC02938284761DB00BAB6515CEB15276D8CD964489E3E509DA1B90366B0
        27725DEE32BD055EB2F680DEAA17210246D6BBA1E14E2CA5CB4A66311D67DD34
        83B20D935525A5B0132F42783E07A1FA8D8073F004FC064350D4A74CEE8143F0
        032C03BFDF4338867C1871B79A88C81E3807BFA8E0BA1484AAFF64FA101C8063
        E04F8864AF0808D559117BE05810080CE4BA2809855AFBDA287ADA74043DB122
        287DA7AF7D1093D4B94B42EF234F81CB2360B54B427683D0C6EB0E7121BFBB12
        538CFCE3E6F225DF109F3ED03F8CB114C48B10FEF7419BAA6416499848499A08
        9DE0FB1674A1B188247205BA7F5A4B88477086DB47D0BA923B961AA92554E31F
        629EE5AE0CC44FF411FA79867A41220137D6A9D00DBBF6BF04DED1C41C40BDED
        EE0000000049454E44AE426082}
      OptionsImage.Layout = blGlyphTop
      TabOrder = 0
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = cxImportarClick
    end
    object cxSair: TcxButton
      AlignWithMargins = True
      Left = 756
      Top = 7
      Width = 100
      Height = 75
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 0
      Margins.Bottom = 7
      Align = alLeft
      Caption = 'ESC | Sair'
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'DevExpressDarkStyle'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D4948445200000024000000240806000000E10098
        9800000006624B474400FF00FF00FFA0BDA793000001B8494441545809ED9731
        4BC3401886EFB4E2225A070767712D1D4404057152D05FE0A28B8320A27F405A
        70757071101DDC0427C5A2E81270D0A5D05110574510A9ED52979ECF958B2458
        C8196D53F08EF7C977977CBDEFEB9B845221DC700E38075AEB80F4B7574A6599
        A7210995A594A550611AF2202979C28C2E133B26346B282FDB3470210F21356B
        2894D0EE856B28CAF15454827F9DD7AF9FF92804F5C0E356099EF8EDDCBA210A
        8DC3350435CBE20AFE4C719EA103AA8F19EE880DE1E00084F6632D6110BA1B49
        1687D00616F93AE589DB5434542836AD947AE44219AACC47A017F658EB736FC4
        0258294E435B14F33544956D18860CCC816E6283B80A97B0004760A594555638
        A9C0F20CB4AA1C4A3005E7B00BB7A09BF8202EE1648D68AD380DE9DBB5EF57C0
        AA75E637A0E30EB10C7ADF1E621FB4BCA1159A98A790967624C3E419EE61126A
        700813A07FB02F88299CDA24464A7F93C82493F0423C81A0DECD6291F80A6B70
        4CF13A4DD7992F0B2166E0147E2636D0DF86A072A24D836239D0F2841971DE32
        F3D1D604D75094AF1DE7D057C33C591E24254F98D1710E49D398C09A2CF33424
        A1EF7F8392E8C2D5740EFC0B073E019BA489A7F76494CD0000000049454E44AE
        426082}
      OptionsImage.Layout = blGlyphTop
      TabOrder = 1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = cxSairClick
    end
    object cxGravar: TcxButton
      AlignWithMargins = True
      Left = 7
      Top = 7
      Width = 100
      Height = 75
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 0
      Margins.Bottom = 7
      Align = alLeft
      Caption = 'F2 | Gravar'
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'DevExpressDarkStyle'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D4948445200000024000000240806000000E10098
        9800000006624B474400FF00FF00FFA0BDA7930000015A494441545809ED97C1
        4A03311086274510C422052F82C8FA1E457C08117AF3A57AF1057C0E4F5E7B15
        948A072FA222F5E4C1F5FBB1420FDD24932A4AC9307F329B994CFE4CD25D6A56
        A55660CD2A1072F7D3B6ED88D83E58552F4208B3AE241E42539234B6BA1C8610
        EEAC43363AC663C38F383B77886F996A9D83658EE2318E6CDA7EC9993985690D
        F8D6C622D28BF8FEC4554C88ED8EC033988839BD6C61883D06B2C7F279A0B3F5
        C42FC66EF23000AF403A500394738B5ECFEA31F3B5B842F94BF822FF1D219537
        B905EEC3B199ED8145BDE6E11C3C01A96CF50F3497E01D5C819F55C81C813720
        BDA1D9F7AEC09CEC9F7D34378976C10C486F698A5E6ECCCB2694BA43DB3016E8
        EC8457FEBD8CDF44CF91FCC5115B1CEA2154BC8867622594AA56AD50AD50AA02
        297FBD43A90A657DEDE749267C933EE6B6B7CB3E090FA11D2F8B92F81421FDE5
        392D491C99A39C117775D50AAC59053E01A4C49B7FA08942B80000000049454E
        44AE426082}
      OptionsImage.Layout = blGlyphTop
      TabOrder = 3
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = cxGravarClick
    end
    object cxImprimir: TcxButton
      AlignWithMargins = True
      Left = 221
      Top = 7
      Width = 100
      Height = 75
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 0
      Margins.Bottom = 7
      Align = alLeft
      Caption = 'F4 | Imprimir'
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'DevExpressDarkStyle'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D4948445200000024000000240806000000E10098
        9800000006624B474400FF00FF00FFA0BDA793000001C9494441545809ED9431
        4BC36010862FD2A120623B59B4A08B082E75B1B80A22E2E2EA989FA093FE0541
        C19FE0E8A88B501C5C051D04A58B432388080A3AE8A04B7C0EDB2AB1A9D7AF69
        E990E37DF25D92BBEB7D973422A9A513E86E029E353D0CC32D62F3E0A217CFF3
        765C12637368A816BA5B2DB670E44626726E39AD12F400168D13340BC98BE1D4
        C26FF3C56884FBA0324F68C858BB6F616943FF8D7AE02614FB1DE24D5C6137CB
        5004D52A8761B880406C362522F3F00E27A0BAE750E1BB5461B58966F6A0D7DA
        6DD5CD9F09D14599C073D07B67ACB790A4A629B608219499D4256BBC68681354
        D71A8533A1A89F04D4F2E006541BD19A99E805CE4741F54CC6084E1570C322BB
        79C3EF4AD4D05A4FF522B9FADA5C5A35D4BC89F3018188E878D5C7EDADDA36C4
        6E3EF9F912F44D03F71D6A3BA1DF63E1C11F725E00173D32ED754BA2B9218A2D
        C024B8E8CE9AD449438D9AC7385760D11C416B60964B43478CFF400CC663F645
        24B186F2145CA26043D986E3B06623B5F27135327137B85E82534842631431D5
        1AB8BF3D8DDBC4C80350F96234827D500562B4819B50BB77286E4FDB6CD9179B
        156C613F512E0DCD90AEB024AF4E1ADAE7E773E0A25797A434279D80CB04BE00
        86063B53632587430000000049454E44AE426082}
      OptionsImage.Layout = blGlyphTop
      TabOrder = 4
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = cxImprimirClick
    end
    object cxProdutos: TcxButton
      AlignWithMargins = True
      Left = 435
      Top = 7
      Width = 100
      Height = 75
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 0
      Margins.Bottom = 7
      Align = alLeft
      Caption = 'F8 | Produtos'
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'DevExpressDarkStyle'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D4948445200000024000000240806000000E10098
        9800000006624B474400FF00FF00FFA0BDA793000002DE494441545809ED974D
        6B134118C76783AD0926B037DF2E5EFA7232A78817A5062D68557CA9370F7E03
        C14FD0BBDF43BC545AAAD0E69288474F1EABE0CD102D9220829112C7DF7FBBD3
        A6696D27EB6E28E2F2FC9FB79DD9E79F6766278931FFAF213A60AD2D80A921A6
        6437142245F00674C085EC2A793E191213E00B906CA0CE7B4ECD6E182426C127
        2039329DEA27D586D948972F70FDA6F019FC8D200836F127F11BC698D3E01B78
        648C79079CB41927B205121A63883FE21BE6EA3979F931BADC6BCAE7DE39B375
        B5C87589434241635AF83BC2CDBAB576118C298B9D013DB09F2C182E6E680CC6
        5AC24808EA76F7558F6EA0FAD233868B7801481A26BE72B175E61ECE63A04FDC
        30C628FE851D990C1252E1A294405B97B173A0074622FB118A0AD3C753200FA9
        5512F7417FA7CE1267227F2444B5695083D40948A95337885DA71E92AF10A72E
        071152B14BA8258A1720B586EF962F8F5F03D32055398C908A5D452D0F90EA90
        0BC15390AAF81052C16BA8E7901A8F3B75915867CBF60B409C8AF81252B1DBA8
        154869A3AFE35F015F4124E453D953C31052E159D4338A8FD1A9F7F80F807BFB
        F4025488FF4A8625A4627751EEF0D4297C8758A4426C0D944062494248C5B6F7
        0E9D5A21A1E56C6245AA8C4D2C49094505593A7778BE22510522750C9B587289
        676E4DD439F40262C7E994367A95F44F9058728967EE4CBC8EBB08F485BC8E9D
        07DA5398484A91F654691052A93929814EBDC4F67FCD94E960859C97A4456857
        3148AD91B8097A407BCAFB48489D10DD780274A2AF42661E7481DE3E1D09B807
        4BEA8428770BB88DBE847F19E8ED0BB1874A168454547B4ACB5464F9DE92A802
        91C244A2B733720655E012B4B984AFF5D60FEE1FC4F29523BD47F68CA1705BA3
        98A7399AABF03BF94D39E4F58FF835FE49D001B3E00308819ED7C28E56440AB8
        FF7D6D7CEFB72F33A69098024D203932A4CAB0D1DF758CFD8C9AC8AC03BE0F86
        84EB947E228FFBCECB745C4CAA9069917FEEE1BF0121EBA3022313747A000000
        0049454E44AE426082}
      OptionsImage.Layout = blGlyphTop
      TabOrder = 5
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = cxProdutosClick
    end
    object cxPessoas: TcxButton
      AlignWithMargins = True
      Left = 542
      Top = 7
      Width = 100
      Height = 75
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 0
      Margins.Bottom = 7
      Align = alLeft
      Caption = 'F9 | Pessoas'
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'DevExpressDarkStyle'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D4948445200000024000000240806000000E10098
        9800000006624B474400FF00FF00FFA0BDA793000002F2494441545809ED944D
        48545114C7DF3863500E9A4D06D1A2C5445414D4B2CF65109650B40C09535A04
        6D13A9AD15B8E86B61B418CA3E288C01C145350542A4410841840B5D485F3342
        6DAC0974F4F6FBBFF7EEEBA93331A08B164FFEBF73CE3DE7DC737DF7CD8CE344
        7FD10D443710DD4074032B7303C69838B4C308FCF019C69F81F8CA9C52E5140E
        4CC24BA8A41714EAAA1CB7FC360EBB0FD23C26638C69F6C9186394C399BBCB3F
        89094C6A840EB80197E000E940AC77833DF45C50F0036AE74152CF2E3FED3A92
        874033AFE375C65AB750C9D0B41F3E4158F32C7AC1FD5CE02F82F411135B3C4B
        391803A94B758204DC81C59A24B1573D4BA0D0047990BE63B2F001ACECF0DB7E
        E2E192217E82FA23907A9522D0ADE05C8D6007611AA4AF9894FA1640B20BA402
        66B38AF818F480F41313872B200DA9A71C145F83D48D494011A4ABB69F451AA6
        40BA60F38127DB0FD2CD204940A209AC76101C01690EB38F9605227710F49A71
        E630662758A5C2CD246F81F4C4E66B6C80FF0552BD4C8886505C247E06A3A0BD
        034C6B8714AC830EF25988C13BC8819D4BE8D4CB8468F0E3708F97D230906631
        C795C537C22B902695132CB6C214545281C216BF57AFFD336B298771BF59F893
        A0B370A64DBD0B209B80B760354D5002AB666D60A13E7D8E66882B49B5CB1413
        FE9E16622BCDD46CBB1E2670FBD41B042C36400D58256D802FC12636EAAB9F25
        3E0AD2382603EF41DA8339ED384E1A3A613B7B4EE037C21CC47D92782BE5D6B3
        C8832736D5C228487A827B0467A113C6419AC73C07AB6E825A6FC25F4B6E15E8
        0671AE06B1DA8B339AA5999ADD47620EA43718FD63DE20166D2095302D5ED6B3
        ACEB6008C2EAF1AA952DCDD7202C3D4C5D7807C563300B526B5063A5A7C099BE
        20190A286C03AB2F04AB43E5B2213D6BE01B48BAA174B9468A0F401A50DD7E66
        F4FE722482DF03E240B1586C8C4501A47ED6BF15FC0B7A8AD49F8294673DA1A0
        0C8FC9E9EC02BE7AF1087A6D13F853D5EEA2B715B467A8DA3D515F7403D10D44
        3710DDC0FF7E037F009D2D0617AED547B00000000049454E44AE426082}
      OptionsImage.Layout = blGlyphTop
      TabOrder = 6
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = cxPessoasClick
    end
    object cxTransp: TcxButton
      AlignWithMargins = True
      Left = 649
      Top = 7
      Width = 100
      Height = 75
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 0
      Margins.Bottom = 7
      Align = alLeft
      Caption = 'F10 | Transp.'
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = 'DevExpressDarkStyle'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D4948445200000024000000240806000000E10098
        9800000006624B474400FF00FF00FFA0BDA793000002A6494441545809ED954D
        68134114C7B375A568A10ACDA988E24541A9229E8A05450BA2908BF5A0203D0A
        5EBC7850C18337A5944A291E84225204EB41043F0ABDF420C183872254239462
        A528A815A1F8016D63D6DF3F6464BA8CD998CD060F1BFEBFD9F7DEBC796F3299
        24994CFA4A4F203D81269E40100487E115F483DFC4D6EE566C62128C5E639C74
        676632CCB5C02138F8B79CD8718AEF85FBF00B8C06EDC204F7C120BC07E9993D
        9F884D979D300E5291E1285C8102845522B02D918DD84569E2C11B706986E045
        F800D2257B6D62369D2E83B4CA300BDAC49FD3C01F00A990D826ECC274DA0A25
        907AED39D904F78351976282C03AD82EBBE150380FD26D5771266640D269F562
        8CC157588016D79A58318A9E0369896143B818B12190BE6B0871209C1FDBA741
        165640EA53418C0ED046F33CCD478A59D61CA3B9EC3795DF7068F004A4170C8F
        60196C7DC219816ED0B753971F33F8CCB03E890D9DA670588B0486A107D6DC15
        FC4E2882944B62431BA9FC0DA4E70C3968ADD688F92990EE55CBAB7B8ECA7741
        9AAAA508896741D21B69AB65CD3FE550F91848FA9FDB12B598C476F809D21957
        3E139B21EB9A8B8CB1D0878F205D885C4002890F409AC02D0B471BD5E9E5B175
        CF06CA13F50C14180169BA96F5249E00497F3DA730EEC012D82AD452CB994395
        6E30DAED4CAA0449F2A10F5620AC1F04C62007AD9525F53D28300BD22D8676BB
        0ABE7E837A780E83F971C42C4BA7F418AB1F36D9EB62D9149B04235DF01B38BB
        E03ACC076B5F25DC3CE8CE74C46AEC5A4CE1E3E0921ADBF17738D7A0CB55A761
        311A8C8334C1908521307A8B7115AADEADA8CDF85109A1F9B68ABFE079DE179A
        CF55FC459E3B881579364F6CE03C18BDC4580669B479BBB03AD1D98787606B1A
        A76117D6B3FAD56CB2812324EF817978CA47B5CA33557A02FFC509FC060EC1E1
        6D6CC690420000000049454E44AE426082}
      OptionsImage.Layout = blGlyphTop
      TabOrder = 7
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = cxTranspClick
    end
  end
  object ACBrEnterTab1: TACBrEnterTab
    EnterAsTab = True
    Left = 736
    Top = 320
  end
  object qryVenda: TFDQuery
    AfterOpen = qryVendaAfterOpen
    AfterInsert = qryVendaAfterInsert
    AfterEdit = qryVendaAfterEdit
    BeforePost = qryVendaBeforePost
    AfterPost = qryVendaAfterPost
    AfterDelete = qryVendaAfterDelete
    OnCalcFields = qryVendaCalcFields
    OnNewRecord = qryVendaNewRecord
    AggregatesActive = True
    Connection = Dados.conexao
    UpdateTransaction = Dados.Transacao
    SQL.Strings = (
      'select * from NFE_MASTER'
      'where'
      'codigo=:cod')
    Left = 69
    Top = 336
    ParamData = <
      item
        Name = 'COD'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryVendaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryVendaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      OnValidate = qryVendaNUMEROValidate
    end
    object qryVendaCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 50
    end
    object qryVendaMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      Size = 10
    end
    object qryVendaSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 10
    end
    object qryVendaDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
      EditMask = '!99/99/0000;1;_'
    end
    object qryVendaHORA_EMISSAO: TTimeField
      FieldName = 'HORA_EMISSAO'
      Origin = 'HORA_EMISSAO'
    end
    object qryVendaHORA_SAIDA: TTimeField
      FieldName = 'HORA_SAIDA'
      Origin = 'HORA_SAIDA'
    end
    object qryVendaID_EMITENTE: TIntegerField
      FieldName = 'ID_EMITENTE'
      Origin = 'ID_EMITENTE'
    end
    object qryVendaID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
    end
    object qryVendaID_TRANSPORTADOR: TIntegerField
      FieldName = 'ID_TRANSPORTADOR'
      Origin = 'ID_TRANSPORTADOR'
    end
    object qryVendaFK_USUARIO: TIntegerField
      FieldName = 'FK_USUARIO'
      Origin = 'FK_USUARIO'
    end
    object qryVendaFK_CAIXA: TIntegerField
      FieldName = 'FK_CAIXA'
      Origin = 'FK_CAIXA'
    end
    object qryVendaFK_VENDEDOR: TIntegerField
      FieldName = 'FK_VENDEDOR'
      Origin = 'FK_VENDEDOR'
    end
    object qryVendaTIPO_FRETE: TStringField
      FieldName = 'TIPO_FRETE'
      Origin = 'TIPO_FRETE'
      Size = 30
    end
    object qryVendaOBSFISCO: TMemoField
      FieldName = 'OBSFISCO'
      Origin = 'OBSFISCO'
      BlobType = ftMemo
    end
    object qryVendaOBSCONTRIBUINTE: TMemoField
      FieldName = 'OBSCONTRIBUINTE'
      Origin = 'OBSCONTRIBUINTE'
      BlobType = ftMemo
    end
    object qryVendaEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 70
    end
    object qryVendaXML: TMemoField
      FieldName = 'XML'
      Origin = 'XML'
      BlobType = ftMemo
    end
    object qryVendaPROTOCOLO: TStringField
      FieldName = 'PROTOCOLO'
      Origin = 'PROTOCOLO'
    end
    object qryVendaFLAG: TStringField
      FieldName = 'FLAG'
      Origin = 'FLAG'
      Size = 1
    end
    object qryVendaFKORCAMENTO: TIntegerField
      FieldName = 'FKORCAMENTO'
      Origin = 'FKORCAMENTO'
    end
    object qryVendaFKVENDA: TIntegerField
      FieldName = 'FKVENDA'
      Origin = 'FKVENDA'
    end
    object qryVendaFKNOTA: TIntegerField
      FieldName = 'FKNOTA'
      Origin = 'FKNOTA'
    end
    object qryVendaESPECIE: TStringField
      FieldName = 'ESPECIE'
      Origin = 'ESPECIE'
      Size = 40
    end
    object qryVendaMARCA: TStringField
      FieldName = 'MARCA'
      Origin = 'MARCA'
      Size = 40
    end
    object qryVendaNVOL: TStringField
      FieldName = 'NVOL'
      Origin = 'NVOL'
      Size = 40
    end
    object qryVendaQVOL: TIntegerField
      FieldName = 'QVOL'
      Origin = 'QVOL'
    end
    object qryVendaPLACA: TStringField
      FieldName = 'PLACA'
      Origin = 'PLACA'
      Size = 7
    end
    object qryVendaUFPLACA: TStringField
      FieldName = 'UFPLACA'
      Origin = 'UFPLACA'
      Size = 2
    end
    object qryVendaRNTC: TStringField
      FieldName = 'RNTC'
      Origin = 'RNTC'
      Size = 8
    end
    object qryVendaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Required = True
      Size = 1
    end
    object qryVendaFKEMPRESA: TIntegerField
      FieldName = 'FKEMPRESA'
      Origin = 'FKEMPRESA'
    end
    object qryVendaVIRTUAL_SITUACAO: TStringField
      FieldKind = fkCalculated
      FieldName = 'VIRTUAL_SITUACAO'
      Size = 50
      Calculated = True
    end
    object qryVendaTIPO_EMISSAO: TStringField
      FieldName = 'TIPO_EMISSAO'
      Origin = 'TIPO_EMISSAO'
      Size = 1
    end
    object qryVendaFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Origin = 'FINALIDADE'
      Size = 1
    end
    object qryVendaMOVIMENTO: TStringField
      FieldName = 'MOVIMENTO'
      Origin = 'MOVIMENTO'
      Size = 1
    end
    object qryVendaCFOP: TIntegerField
      FieldName = 'CFOP'
      Origin = 'CFOP'
    end
    object qryVendaVIRTUAL_CFOP: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_CFOP'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CFOP'
      Size = 100
      Lookup = True
    end
    object qryVendaVIRTUAL_CLIENTE: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_CLIENTE'
      LookupDataSet = qryClientes
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'RAZAO'
      KeyFields = 'ID_CLIENTE'
      Size = 60
      Lookup = True
    end
    object qryVendaVIRTUAL_UF_CLIENTE: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_UF_CLIENTE'
      LookupDataSet = qryClientes
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'UF'
      KeyFields = 'ID_CLIENTE'
      Size = 2
      Lookup = True
    end
    object qryVendaVIRTUAL_CNPF_CLIENTE: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_CNPF_CLIENTE'
      LookupDataSet = qryClientes
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'CNPJ'
      KeyFields = 'ID_CLIENTE'
      Lookup = True
    end
    object qryVendaVIRTUAL_TRANSP: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_TRANSP'
      LookupDataSet = qryTransp
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NOME'
      KeyFields = 'ID_TRANSPORTADOR'
      Size = 60
      Lookup = True
    end
    object qryVendaVIRTUAL_PLACA: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_PLACA'
      LookupDataSet = qryTransp
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'PLACA'
      KeyFields = 'ID_TRANSPORTADOR'
      Size = 7
      Lookup = True
    end
    object qryVendaVIRTUAL_RNTC: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_RNTC'
      LookupDataSet = qryTransp
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'RNTC'
      KeyFields = 'ID_TRANSPORTADOR'
      Size = 10
      Lookup = True
    end
    object qryVendaVIRTUAL_UFPLACA: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_UFPLACA'
      LookupDataSet = qryTransp
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'UFPLACA'
      KeyFields = 'ID_TRANSPORTADOR'
      Size = 2
      Lookup = True
    end
    object qryVendaVIRTUAL_EMPRESA: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_EMPRESA'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'FANTASIA'
      KeyFields = 'FKEMPRESA'
      Size = 60
      Lookup = True
    end
    object qryVendaVIRTUAL_EMAIL: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_EMAIL'
      LookupDataSet = qryClientes
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'EMAIL1'
      KeyFields = 'ID_CLIENTE'
      Size = 100
      Lookup = True
    end
    object qryVendaCHAVE_NFE_REFERENCIADA: TStringField
      FieldName = 'CHAVE_NFE_REFERENCIADA'
      Origin = 'CHAVE_NFE_REFERENCIADA'
      Size = 44
    end
    object qryVendaNPEDIDO: TStringField
      FieldName = 'NPEDIDO'
      Origin = 'NPEDIDO'
    end
    object qryVendaCONSUMIDOR_FINAL: TStringField
      FieldName = 'CONSUMIDOR_FINAL'
      Origin = 'CONSUMIDOR_FINAL'
      Size = 1
    end
    object qryVendaVIRTUAL_ISENTO: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_ISENTO'
      LookupDataSet = qryClientes
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'ISENTO'
      KeyFields = 'ID_CLIENTE'
      Size = 1
      Lookup = True
    end
    object qryVendaMOTIVO_CONTIGENCIA: TStringField
      FieldName = 'MOTIVO_CONTIGENCIA'
      Origin = 'MOTIVO_CONTIGENCIA'
      Size = 100
    end
    object qryVendaTIPO_DESCONTO: TStringField
      FieldName = 'TIPO_DESCONTO'
      Origin = 'TIPO_DESCONTO'
      Size = 15
    end
    object qryVendaSUBTOTAL: TFMTBCDField
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaDESPESAS: TFMTBCDField
      FieldName = 'DESPESAS'
      Origin = 'DESPESAS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaSEGURO: TFMTBCDField
      FieldName = 'SEGURO'
      Origin = 'SEGURO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaFRETE: TFMTBCDField
      FieldName = 'FRETE'
      Origin = 'FRETE'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaTROCO: TFMTBCDField
      FieldName = 'TROCO'
      Origin = 'TROCO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaDINHEIRO: TFMTBCDField
      FieldName = 'DINHEIRO'
      Origin = 'DINHEIRO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaBASE_ST: TFMTBCDField
      FieldName = 'BASE_ST'
      Origin = 'BASE_ST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaTOTAL_ST: TFMTBCDField
      FieldName = 'TOTAL_ST'
      Origin = 'TOTAL_ST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaBASE_IPI: TFMTBCDField
      FieldName = 'BASE_IPI'
      Origin = 'BASE_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaTOTAL_IPI: TFMTBCDField
      FieldName = 'TOTAL_IPI'
      Origin = 'TOTAL_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaBASEICMS: TFMTBCDField
      FieldName = 'BASEICMS'
      Origin = 'BASEICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaTOTALICMS: TFMTBCDField
      FieldName = 'TOTALICMS'
      Origin = 'TOTALICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaBASEICMSPIS: TFMTBCDField
      FieldName = 'BASEICMSPIS'
      Origin = 'BASEICMSPIS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaTOTALICMSPIS: TFMTBCDField
      FieldName = 'TOTALICMSPIS'
      Origin = 'TOTALICMSPIS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaBASEICMSCOF: TFMTBCDField
      FieldName = 'BASEICMSCOF'
      Origin = 'BASEICMSCOF'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaTOTALICMSCOFINS: TFMTBCDField
      FieldName = 'TOTALICMSCOFINS'
      Origin = 'TOTALICMSCOFINS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaBASEISS: TFMTBCDField
      FieldName = 'BASEISS'
      Origin = 'BASEISS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaTOTALISS: TFMTBCDField
      FieldName = 'TOTALISS'
      Origin = 'TOTALISS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaBASE_ICMS_ST: TFMTBCDField
      FieldName = 'BASE_ICMS_ST'
      Origin = 'BASE_ICMS_ST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaVALOR_ICMS_ST: TFMTBCDField
      FieldName = 'VALOR_ICMS_ST'
      Origin = 'VALOR_ICMS_ST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaVFCPUFDEST: TFMTBCDField
      FieldName = 'VFCPUFDEST'
      Origin = 'VFCPUFDEST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaVICMSUFDEST: TFMTBCDField
      FieldName = 'VICMSUFDEST'
      Origin = 'VICMSUFDEST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaVICMSUFREMET: TFMTBCDField
      FieldName = 'VICMSUFREMET'
      Origin = 'VICMSUFREMET'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaOUTROS: TFMTBCDField
      FieldName = 'OUTROS'
      Origin = 'OUTROS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaPESOB: TFMTBCDField
      FieldName = 'PESOB'
      Origin = 'PESOB'
      Precision = 18
      Size = 3
    end
    object qryVendaPESOL: TFMTBCDField
      FieldName = 'PESOL'
      Origin = 'PESOL'
      Precision = 18
      Size = 3
    end
    object qryVendaTRIB_MUN: TFMTBCDField
      FieldName = 'TRIB_MUN'
      Origin = 'TRIB_MUN'
      Precision = 18
      Size = 2
    end
    object qryVendaTRIB_EST: TFMTBCDField
      FieldName = 'TRIB_EST'
      Origin = 'TRIB_EST'
      Precision = 18
      Size = 2
    end
    object qryVendaTRIB_FED: TFMTBCDField
      FieldName = 'TRIB_FED'
      Origin = 'TRIB_FED'
      Precision = 18
      Size = 2
    end
    object qryVendaTRIB_IMP: TFMTBCDField
      FieldName = 'TRIB_IMP'
      Origin = 'TRIB_IMP'
      Precision = 18
      Size = 2
    end
    object qryVendaVFCP: TFMTBCDField
      FieldName = 'VFCP'
      Origin = 'VFCP'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaINDPAG: TSmallintField
      FieldName = 'INDPAG'
      Origin = 'INDPAG'
      DisplayFormat = '0'
    end
    object qryVendaDATA_SAIDA: TDateField
      FieldName = 'DATA_SAIDA'
      Origin = 'DATA_SAIDA'
      EditMask = '!99/99/0000;1;_'
    end
    object qryVendaTPINTEGRA: TSmallintField
      FieldName = 'TPINTEGRA'
      Origin = 'TPINTEGRA'
      DisplayFormat = '0'
    end
    object qryVendaCNPJ_CARTAO: TStringField
      FieldName = 'CNPJ_CARTAO'
      Origin = 'CNPJ_CARTAO'
    end
    object qryVendaNUMERO_AUTORIZACAO: TStringField
      FieldName = 'NUMERO_AUTORIZACAO'
      Origin = 'NUMERO_AUTORIZACAO'
      Size = 50
    end
    object qryVendaTPBANDEIRA: TSmallintField
      FieldName = 'TPBANDEIRA'
      Origin = 'TPBANDEIRA'
      DisplayFormat = '0'
    end
    object qryVendaTPPAG: TSmallintField
      FieldName = 'TPPAG'
      Origin = 'TPPAG'
      DisplayFormat = '0'
    end
    object qryVendaTOTAL_DESONERACAO: TFMTBCDField
      FieldName = 'TOTAL_DESONERACAO'
      Origin = 'TOTAL_DESONERACAO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryVendaCNF: TStringField
      FieldName = 'CNF'
      Origin = 'CNF'
    end
    object qryVendaVIRTUAL_ENDERECO: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_ENDERECO'
      LookupDataSet = qryClientes
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'ENDERECO'
      KeyFields = 'ID_CLIENTE'
      Size = 90
      Lookup = True
    end
    object qryVendaVIRTUAL_NUMEND: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_NUMEND'
      LookupDataSet = qryClientes
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NUMERO'
      KeyFields = 'ID_CLIENTE'
      Lookup = True
    end
    object qryVendaVIRTUAL_BAIRRO: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_BAIRRO'
      LookupDataSet = qryClientes
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'BAIRRO'
      KeyFields = 'ID_CLIENTE'
      Size = 50
      Lookup = True
    end
    object qryVendaVIRTUAL_CEP: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_CEP'
      LookupDataSet = qryClientes
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'CEP'
      KeyFields = 'ID_CLIENTE'
      Size = 14
      Lookup = True
    end
    object qryVendaVIRTUAL_TELEFONE: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_TELEFONE'
      LookupDataSet = qryClientes
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'FONE1'
      KeyFields = 'CODIGO'
      Lookup = True
    end
    object qryVendaVIRTUAL_CIDADE: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_CIDADE'
      LookupDataSet = qryClientes
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'MUNICIPIO'
      KeyFields = 'CODIGO'
      Size = 60
      Lookup = True
    end
    object qryVendaTTOTAL: TAggregateField
      FieldName = 'TTOTAL'
      Visible = True
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'SUM(TOTAL)'
    end
  end
  object dsVenda: TDataSource
    DataSet = qryVenda
    OnDataChange = dsVendaDataChange
    Left = 64
    Top = 392
  end
  object dsItem: TDataSource
    DataSet = qryItem
    Left = 120
    Top = 392
  end
  object qryItem: TFDQuery
    BeforeInsert = qryItemBeforeInsert
    AfterInsert = qryItemAfterInsert
    BeforeEdit = qryItemBeforeEdit
    AfterEdit = qryItemAfterEdit
    BeforePost = qryItemBeforePost
    AfterPost = qryItemAfterPost
    BeforeDelete = qryItemBeforeDelete
    AfterDelete = qryItemAfterDelete
    OnNewRecord = qryItemNewRecord
    AggregatesActive = True
    MasterSource = dsVenda
    MasterFields = 'CODIGO'
    DetailFields = 'CODIGO'
    Connection = Dados.conexao
    UpdateTransaction = Dados.Transacao
    FetchOptions.AssignedValues = [evMode, evCache, evRecordCountMode]
    FetchOptions.Mode = fmAll
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'select * FROM NFE_DETALHE VD'
      'where'
      'FKNFE=:CODIGO'
      'ORDER BY ITEM;')
    Left = 123
    Top = 336
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object qryItemCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItemFKNFE: TIntegerField
      FieldName = 'FKNFE'
      Origin = 'FKNFE'
      Required = True
    end
    object qryItemID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Required = True
      OnChange = qryItemID_PRODUTOChange
    end
    object qryItemITEM: TSmallintField
      FieldName = 'ITEM'
      Origin = 'ITEM'
    end
    object qryItemCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Origin = 'COD_BARRA'
      Size = 14
    end
    object qryItemNCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Size = 10
    end
    object qryItemCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      OnChange = qryItemCFOPChange
      Size = 4
    end
    object qryItemCST: TStringField
      FieldName = 'CST'
      Origin = 'CST'
      Size = 3
    end
    object qryItemCSOSN: TStringField
      FieldName = 'CSOSN'
      Origin = 'CSOSN'
      Size = 4
    end
    object qryItemTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
    object qryItemQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QTD'
      OnValidate = qryItemQTDValidate
      MaxValue = '999999'
      MinValue = '0'
      Precision = 18
      Size = 3
    end
    object qryItemE_MEDIO: TFMTBCDField
      FieldName = 'E_MEDIO'
      Origin = 'E_MEDIO'
      Precision = 18
      Size = 3
    end
    object qryItemPRECO: TFMTBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      OnValidate = qryItemQTDValidate
      DisplayFormat = ',0.000'
      MaxValue = '9999999'
      MinValue = '0'
      Precision = 18
      Size = 3
    end
    object qryItemTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      DisplayFormat = ',0.000'
      MaxValue = '9999999'
      MinValue = '0'
      Precision = 18
      Size = 3
    end
    object qryItemBASE_ICMS: TFMTBCDField
      FieldName = 'BASE_ICMS'
      Origin = 'BASE_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemALIQ_ICMS: TFMTBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'ALIQ_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemVALOR_ICMS: TFMTBCDField
      FieldName = 'VALOR_ICMS'
      Origin = 'VALOR_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Origin = 'CST_COFINS'
      Size = 2
    end
    object qryItemBASE_COFINS_ICMS: TFMTBCDField
      FieldName = 'BASE_COFINS_ICMS'
      Origin = 'BASE_COFINS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemALIQ_COFINS_ICMS: TFMTBCDField
      FieldName = 'ALIQ_COFINS_ICMS'
      Origin = 'ALIQ_COFINS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemVALOR_COFINS_ICMS: TFMTBCDField
      FieldName = 'VALOR_COFINS_ICMS'
      Origin = 'VALOR_COFINS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
      Size = 2
    end
    object qryItemBASE_PIS_ICMS: TFMTBCDField
      FieldName = 'BASE_PIS_ICMS'
      Origin = 'BASE_PIS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemALIQ_PIS_ICMS: TFMTBCDField
      FieldName = 'ALIQ_PIS_ICMS'
      Origin = 'ALIQ_PIS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemVALOR_PIS_ICMS: TFMTBCDField
      FieldName = 'VALOR_PIS_ICMS'
      Origin = 'VALOR_PIS_ICMS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemTRIB_MUN: TFMTBCDField
      FieldName = 'TRIB_MUN'
      Origin = 'TRIB_MUN'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemTRIB_EST: TFMTBCDField
      FieldName = 'TRIB_EST'
      Origin = 'TRIB_EST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemTRIB_FED: TFMTBCDField
      FieldName = 'TRIB_FED'
      Origin = 'TRIB_FED'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemTRIB_IMP: TFMTBCDField
      FieldName = 'TRIB_IMP'
      Origin = 'TRIB_IMP'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 1
    end
    object qryItemFLAG: TStringField
      FieldName = 'FLAG'
      Origin = 'FLAG'
      Size = 1
    end
    object qryItemUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 3
    end
    object qryItemFRETE: TFMTBCDField
      FieldName = 'FRETE'
      Origin = 'FRETE'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemDESPESAS: TFMTBCDField
      FieldName = 'DESPESAS'
      Origin = 'DESPESAS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemSEGURO: TFMTBCDField
      FieldName = 'SEGURO'
      Origin = 'SEGURO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemBASE_IPI: TFMTBCDField
      FieldName = 'BASE_IPI'
      Origin = 'BASE_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemALIQ_IPI: TFMTBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'ALIQ_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemVALOR_IPI: TFMTBCDField
      FieldName = 'VALOR_IPI'
      Origin = 'VALOR_IPI'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemBASE_ICMS_ST: TFMTBCDField
      FieldName = 'BASE_ICMS_ST'
      Origin = 'BASE_ICMS_ST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemVALOR_ICMS_ST: TFMTBCDField
      FieldName = 'VALOR_ICMS_ST'
      Origin = 'VALOR_ICMS_ST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemVBCUFDEST: TFMTBCDField
      FieldName = 'VBCUFDEST'
      Origin = 'VBCUFDEST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemVFCP: TFMTBCDField
      FieldName = 'VFCP'
      Origin = 'VFCP'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemPICMSUFDEST: TFMTBCDField
      FieldName = 'PICMSUFDEST'
      Origin = 'PICMSUFDEST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemPICMSINTER: TFMTBCDField
      FieldName = 'PICMSINTER'
      Origin = 'PICMSINTER'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemPICMSINTERPART: TFMTBCDField
      FieldName = 'PICMSINTERPART'
      Origin = 'PICMSINTERPART'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemVFCPUFDEST: TFMTBCDField
      FieldName = 'VFCPUFDEST'
      Origin = 'VFCPUFDEST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemVICMSUFDEST: TFMTBCDField
      FieldName = 'VICMSUFDEST'
      Origin = 'VICMSUFDEST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemVICMSUFREMET: TFMTBCDField
      FieldName = 'VICMSUFREMET'
      Origin = 'VICMSUFREMET'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Origin = 'CST_IPI'
      Size = 2
    end
    object qryItemOUTROS: TFMTBCDField
      FieldName = 'OUTROS'
      Origin = 'OUTROS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemALIQ_ICMS_ST: TFMTBCDField
      FieldName = 'ALIQ_ICMS_ST'
      Origin = 'ALIQ_ICMS_ST'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemVITUAL_CODBARRA: TStringField
      FieldKind = fkLookup
      FieldName = 'VITUAL_CODBARRA'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'CODBARRA'
      KeyFields = 'ID_PRODUTO'
      Lookup = True
    end
    object qryItemVIRTUAL_ALIQ_COF: TExtendedField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_ALIQ_COF'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'ALIQ_COF'
      KeyFields = 'ID_PRODUTO'
      Precision = 19
      Lookup = True
    end
    object qryItemVIRTUAL_ALIQ_PIS: TExtendedField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_ALIQ_PIS'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'ALIQ_PIS'
      KeyFields = 'ID_PRODUTO'
      Precision = 19
      Lookup = True
    end
    object qryItemVIRTUAL_CST_S: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_CST_S'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'CSTS'
      KeyFields = 'ID_PRODUTO'
      Size = 3
      Lookup = True
    end
    object qryItemVIRTUAL_ALIQ_ICMS: TExtendedField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_ALIQ_ICMS'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'ALIQ_ICM'
      KeyFields = 'ID_PRODUTO'
      Precision = 19
      Lookup = True
    end
    object qryItemVIRTUAL_CSOSN: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_CSOSN'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'CSOSN'
      KeyFields = 'ID_PRODUTO'
      Size = 4
      Lookup = True
    end
    object qryItemVIRTUAL_CST: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_CST'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'CSTICMS'
      KeyFields = 'ID_PRODUTO'
      Size = 3
      Lookup = True
    end
    object qryItemVIRTUAL_UN: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_UN'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'UNIDADE'
      KeyFields = 'ID_PRODUTO'
      Size = 3
      Lookup = True
    end
    object qryItemVIRTUAL_PRECO: TExtendedField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_PRECO'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'PR_VENDA'
      KeyFields = 'ID_PRODUTO'
      Precision = 19
      Lookup = True
    end
    object qryItemVIRTUAL_PRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_PRODUTO'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'ID_PRODUTO'
      Size = 50
      Lookup = True
    end
    object qryItemVIRTUAL_FCP: TExtendedField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_FCP'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'FCP'
      KeyFields = 'ID_PRODUTO'
      Precision = 19
      Lookup = True
    end
    object qryItemVIRTUAL_MVA: TExtendedField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_MVA'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'MVA'
      KeyFields = 'ID_PRODUTO'
      Precision = 19
      Lookup = True
    end
    object qryItemVIRTUAL_REDUCAO: TExtendedField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_REDUCAO'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'REDUCAO_BASE'
      KeyFields = 'ID_PRODUTO'
      Precision = 19
      Lookup = True
    end
    object qryItemGERA_ES: TStringField
      FieldName = 'GERA_ES'
      Origin = 'GERA_ES'
      Size = 1
    end
    object qryItemVIRTUAL_CFOPI: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_CFOPI'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'CFOP'
      KeyFields = 'ID_PRODUTO'
      Size = 10
      Lookup = True
    end
    object qryItemVIRTUAL_CFOPE: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_CFOPE'
      LookupDataSet = qryProd
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'CFOP_EXTERNO'
      KeyFields = 'ID_PRODUTO'
      Size = 10
      Lookup = True
    end
    object qryItemINFO_ADICIONAIS: TStringField
      FieldName = 'INFO_ADICIONAIS'
      Origin = 'INFO_ADICIONAIS'
      Size = 100
    end
    object qryItemVICMSDESON: TFMTBCDField
      FieldName = 'VICMSDESON'
      Origin = 'VICMSDESON'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemMOTDESICMS: TSmallintField
      FieldName = 'MOTDESICMS'
      Origin = 'MOTDESICMS'
      DisplayFormat = ',0.00'
    end
    object qryItemVIRTUAL_MOTIVO: TStringField
      FieldKind = fkLookup
      FieldName = 'VIRTUAL_MOTIVO'
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'MOTDESICMS'
      Size = 30
      Lookup = True
    end
    object qryItemALIQ_DESONERACAO: TFMTBCDField
      FieldName = 'ALIQ_DESONERACAO'
      Origin = 'ALIQ_DESONERACAO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryItemNPEDIDO: TIntegerField
      FieldName = 'NPEDIDO'
      Origin = 'NPEDIDO'
      DisplayFormat = ',0.00'
    end
    object qryItemEVENDA: TStringField
      FieldName = 'EVENDA'
      Origin = 'EVENDA'
      Size = 1
    end
    object qryItemCOD_PROD_ANP_COMB: TStringField
      FieldName = 'COD_PROD_ANP_COMB'
      Origin = 'COD_PROD_ANP_COMB'
      Size = 9
    end
    object qryItemDESC_ANP_COMB: TStringField
      FieldName = 'DESC_ANP_COMB'
      Origin = 'DESC_ANP_COMB'
      Size = 95
    end
    object qryItemUF_CON_COMB: TStringField
      FieldName = 'UF_CON_COMB'
      Origin = 'UF_CON_COMB'
      Size = 2
    end
    object qryItemBASE_DESONERACAO: TBCDField
      FieldName = 'BASE_DESONERACAO'
      Origin = 'BASE_DESONERACAO'
      Precision = 18
    end
  end
  object qrySoma: TFDQuery
    MasterFields = 'ID'
    Connection = Dados.conexao
    SQL.Strings = (
      'SELECT '
      'sum(nfe.total) SUBTOTAL, '
      'SUM(nfe.base_ipi) BIPI, '
      'SUM(nfe.base_icms)BICMS, '
      'SUM(nfe.base_pis_icms) BPIS, '
      'SUM(nfe.base_cofins_icms)BCOFINS,'
      'SUM(nfe.valor_ipi) VLIPI, '
      'SUM(nfe.valor_icms) VLICMS,  '
      'SUM(nfe.valor_pis_icms) VLPIS, '
      'SUM(nfe.valor_cofins_icms) VLCOF,'
      'SUM(NFE.desconto) DESCONTO, '
      'SUM(NFE.despesas) DESPESAS, '
      'SUM(NFE.frete) frete, '
      'SUM(NFE.VICMSDESON) DESONERACAO,'
      'SUM(NFE.seguro) SEGURO,'
      'SUM(NFE.trib_mun) TMUN, '
      'SUM(NFE.trib_est) TEST, '
      'SUM(NFE.trib_fed) TFED, '
      'SUM(NFE.trib_imp)TIMP,'
      'SUM(NFE.vFCPUFDest)vFCPUFDest,'
      'SUM(NFE.vICMSUFDest)vICMSUFDest,'
      'SUM(NFE.vICMSUFRemet)vICMSUFRemet,'
      'SUM(NFE.BASE_ICMS_ST)BASE_ICMS_ST,'
      'SUM(NFE.VALOR_ICMS_ST)VALOR_ICMS_ST'
      'FROM nfe_detalhe nfe'
      'WHERE'
      'NFE.fknfe=:ID')
    Left = 184
    Top = 344
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qrySomaSUBTOTAL: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'SUBTOTAL'
      Origin = 'SUBTOTAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaBIPI: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'BIPI'
      Origin = 'BIPI'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaBICMS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'BICMS'
      Origin = 'BICMS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaBPIS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'BPIS'
      Origin = 'BPIS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaBCOFINS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'BCOFINS'
      Origin = 'BCOFINS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaVLIPI: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VLIPI'
      Origin = 'VLIPI'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaVLICMS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VLICMS'
      Origin = 'VLICMS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaVLPIS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VLPIS'
      Origin = 'VLPIS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaVLCOF: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VLCOF'
      Origin = 'VLCOF'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaDESCONTO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaDESPESAS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'DESPESAS'
      Origin = 'DESPESAS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaFRETE: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FRETE'
      Origin = 'FRETE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaSEGURO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'SEGURO'
      Origin = 'SEGURO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaTMUN: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TMUN'
      Origin = 'TMUN'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaTEST: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TEST'
      Origin = 'TEST'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaTFED: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TFED'
      Origin = 'TFED'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaTIMP: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TIMP'
      Origin = 'TIMP'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaVFCPUFDEST: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VFCPUFDEST'
      Origin = 'VFCPUFDEST'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaVICMSUFDEST: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VICMSUFDEST'
      Origin = 'VICMSUFDEST'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaVICMSUFREMET: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VICMSUFREMET'
      Origin = 'VICMSUFREMET'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaBASE_ICMS_ST: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'BASE_ICMS_ST'
      Origin = 'BASE_ICMS_ST'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaVALOR_ICMS_ST: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_ICMS_ST'
      Origin = 'VALOR_ICMS_ST'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qrySomaDESONERACAO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'DESONERACAO'
      Origin = 'DESONERACAO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object QryFatura: TFDQuery
    AfterInsert = QryFaturaAfterInsert
    BeforeEdit = QryFaturaBeforeEdit
    AfterPost = QryFaturaAfterPost
    AfterDelete = QryFaturaAfterDelete
    OnCalcFields = QryFaturaCalcFields
    OnNewRecord = QryFaturaNewRecord
    AggregatesActive = True
    Connection = Dados.conexao
    SQL.Strings = (
      'select * from NFE_FATURA'
      'where'
      'FKNFE=:NFE'
      'ORDER BY CODIGO')
    Left = 184
    Top = 400
    ParamData = <
      item
        Name = 'NFE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QryFaturaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryFaturaNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object QryFaturaDATA_VENCIMENTO: TDateField
      FieldName = 'DATA_VENCIMENTO'
      Origin = 'DATA_VENCIMENTO'
      EditMask = '!99/99/0000;1;_'
    end
    object QryFaturaVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object QryFaturaFKNFE: TIntegerField
      FieldName = 'FKNFE'
      Origin = 'FKNFE'
    end
    object QryFaturaFKEMPRESA: TIntegerField
      FieldName = 'FKEMPRESA'
      Origin = 'FKEMPRESA'
    end
    object QryFaturaPATH_PDF_BOLETO: TStringField
      FieldName = 'PATH_PDF_BOLETO'
      Origin = 'PATH_PDF_BOLETO'
      Size = 500
    end
    object QryFaturaBOLETO_GERADO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'BOLETO_GERADO'
      Size = 10
    end
    object QryFaturaTTOTAL: TAggregateField
      FieldName = 'TTOTAL'
      Visible = True
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'SUM(VALOR)'
    end
  end
  object dsFatura: TDataSource
    DataSet = QryFatura
    Left = 256
    Top = 376
  end
  object qryProduto: TFDQuery
    Connection = Dados.conexao
    SQL.Strings = (
      'SELECT'
      'PRO.codigo,'
      'pro.descricao,'
      'pro.unidade,'
      'pro.pr_venda,'
      'pro.tipo,'
      'pro.csticms,'
      'pro.cst_externo,'
      'pro.cfop cfop,'
      'pro.cfop_externo cfop_externo,'
      'pro.csosn,'
      'pro.csosn_externo,'
      'pro.CEST,'
      'pro.aliq_icm,'
      'pro.aliq_icms_externo,'
      'pro.aliq_ipi,'
      'pro.CSTIPI,'
      'pro.cste,'
      'pro.csts,'
      'pro.aliq_pis,'
      'pro.aliq_cof,'
      'pro.fcp,'
      'pro.ncm,'
      'ibpt.nacionalfederal,'
      'ibpt.importadosfederal,'
      'ibpt.estadual,'
      'ibpt.municipal,'
      'pro.codbarra,'
      'pro.APLICACAO'
      'FROM PRODUTO pro'
      'LEFT JOIN ibpt on pro.ncm = ibpt.codigo'
      'where'
      'pro.codigo=:ID')
    Left = 254
    Top = 336
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
        Value = Null
      end>
    object qryProdutoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object qryProdutoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Required = True
      Size = 3
    end
    object qryProdutoPR_VENDA: TFMTBCDField
      FieldName = 'PR_VENDA'
      Origin = 'PR_VENDA'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryProdutoTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
      Size = 30
    end
    object qryProdutoCSTICMS: TStringField
      FieldName = 'CSTICMS'
      Origin = 'CSTICMS'
      Size = 5
    end
    object qryProdutoCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'CFOP'
      Size = 4
    end
    object qryProdutoCSOSN: TStringField
      FieldName = 'CSOSN'
      Origin = 'CSOSN'
      Size = 5
    end
    object qryProdutoCEST: TStringField
      FieldName = 'CEST'
      Origin = 'CEST'
      Size = 10
    end
    object qryProdutoALIQ_ICM: TCurrencyField
      FieldName = 'ALIQ_ICM'
      Origin = 'ALIQ_ICM'
      Required = True
    end
    object qryProdutoALIQ_IPI: TFMTBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'ALIQ_IPI'
      Precision = 18
      Size = 2
    end
    object qryProdutoCSTIPI: TStringField
      FieldName = 'CSTIPI'
      Origin = 'CSTIPI'
      Size = 5
    end
    object qryProdutoCSTE: TStringField
      FieldName = 'CSTE'
      Origin = 'CSTE'
      Size = 5
    end
    object qryProdutoCSTS: TStringField
      FieldName = 'CSTS'
      Origin = 'CSTS'
      Size = 5
    end
    object qryProdutoALIQ_PIS: TCurrencyField
      FieldName = 'ALIQ_PIS'
      Origin = 'ALIQ_PIS'
      Required = True
    end
    object qryProdutoALIQ_COF: TCurrencyField
      FieldName = 'ALIQ_COF'
      Origin = 'ALIQ_COF'
      Required = True
    end
    object qryProdutoFCP: TFMTBCDField
      FieldName = 'FCP'
      Origin = 'FCP'
      Precision = 18
      Size = 2
    end
    object qryProdutoNCM: TStringField
      FieldName = 'NCM'
      Origin = 'NCM'
      Required = True
      Size = 10
    end
    object qryProdutoNACIONALFEDERAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NACIONALFEDERAL'
      Origin = 'NACIONALFEDERAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 18
    end
    object qryProdutoIMPORTADOSFEDERAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'IMPORTADOSFEDERAL'
      Origin = 'IMPORTADOSFEDERAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 19
    end
    object qryProdutoESTADUAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ESTADUAL'
      Origin = 'ESTADUAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 11
    end
    object qryProdutoMUNICIPAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MUNICIPAL'
      Origin = 'MUNICIPAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 12
    end
    object qryProdutoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Origin = 'CODBARRA'
    end
    object qryProdutoCFOP_EXTERNO: TIntegerField
      FieldName = 'CFOP_EXTERNO'
      Origin = 'CFOP_EXTERNO'
      DisplayFormat = ',0.00'
    end
    object qryProdutoCST_EXTERNO: TStringField
      FieldName = 'CST_EXTERNO'
      Origin = 'CST_EXTERNO'
      Size = 3
    end
    object qryProdutoCSOSN_EXTERNO: TStringField
      FieldName = 'CSOSN_EXTERNO'
      Origin = 'CSOSN_EXTERNO'
      Size = 3
    end
    object qryProdutoALIQ_ICMS_EXTERNO: TFMTBCDField
      FieldName = 'ALIQ_ICMS_EXTERNO'
      Origin = 'ALIQ_ICMS_EXTERNO'
      Precision = 18
      Size = 2
    end
    object qryProdutoAPLICACAO: TStringField
      FieldName = 'APLICACAO'
      Origin = 'APLICACAO'
      Size = 160
    end
  end
  object qryClientes: TFDQuery
    Connection = Dados.conexao
    SQL.Strings = (
      
        'SELECT codigo, (codigo||'#39' | '#39'|| razao||'#39' | '#39'|| CNPJ) AS RAZAO, c' +
        'npj, endereco, numero, bairro, municipio, uf, cep, fone1, celula' +
        'r1, email1, isento  FROM pessoa'
      'where'
      'cli='#39'S'#39' or forn='#39'S'#39
      'order by razao')
    Left = 320
    Top = 340
    object qryClientesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryClientesRAZAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RAZAO'
      Origin = 'RAZAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 103
    end
    object qryClientesCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
    end
    object qryClientesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 50
    end
    object qryClientesNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
      Size = 10
    end
    object qryClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Required = True
      Size = 35
    end
    object qryClientesMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
      Origin = 'MUNICIPIO'
      Required = True
      Size = 35
    end
    object qryClientesUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      Size = 2
    end
    object qryClientesCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Required = True
      Size = 8
    end
    object qryClientesFONE1: TStringField
      FieldName = 'FONE1'
      Origin = 'FONE1'
      Size = 14
    end
    object qryClientesCELULAR1: TStringField
      FieldName = 'CELULAR1'
      Origin = 'CELULAR1'
      Size = 14
    end
    object qryClientesEMAIL1: TStringField
      FieldName = 'EMAIL1'
      Origin = 'EMAIL1'
      Size = 60
    end
    object qryClientesISENTO: TStringField
      FieldName = 'ISENTO'
      Origin = 'ISENTO'
      Size = 1
    end
  end
  object qryTransp: TFDQuery
    Connection = Dados.conexao
    SQL.Strings = (
      'select * from TRANSPORTADORA'
      'order by nome')
    Left = 320
    Top = 392
    object qryTranspCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryTranspPESSOA: TStringField
      FieldName = 'PESSOA'
      Origin = 'PESSOA'
      Size = 10
    end
    object qryTranspCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
    end
    object qryTranspIE: TStringField
      FieldName = 'IE'
      Origin = 'IE'
    end
    object qryTranspNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 50
    end
    object qryTranspAPELIDO: TStringField
      FieldName = 'APELIDO'
      Origin = 'APELIDO'
      Size = 40
    end
    object qryTranspENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 50
    end
    object qryTranspNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object qryTranspBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 35
    end
    object qryTranspCOD_CIDADE: TIntegerField
      FieldName = 'COD_CIDADE'
      Origin = 'COD_CIDADE'
    end
    object qryTranspCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 45
    end
    object qryTranspUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object qryTranspCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 8
    end
    object qryTranspPLACA: TStringField
      FieldName = 'PLACA'
      Origin = 'PLACA'
      Size = 7
    end
    object qryTranspUFPLACA: TStringField
      FieldName = 'UFPLACA'
      Origin = 'UFPLACA'
      Size = 2
    end
    object qryTranspRNTC: TStringField
      FieldName = 'RNTC'
      Origin = 'RNTC'
      Size = 10
    end
    object qryTranspATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Size = 1
    end
    object qryTranspEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
    end
    object qryTranspRENAVAM: TStringField
      FieldName = 'RENAVAM'
      Origin = 'RENAVAM'
    end
    object qryTranspMOTORISTA: TStringField
      FieldName = 'MOTORISTA'
      Origin = 'MOTORISTA'
      Size = 50
    end
    object qryTranspCPF_MOTORISTA: TStringField
      FieldName = 'CPF_MOTORISTA'
      Origin = 'CPF_MOTORISTA'
    end
  end
  object qryCFOP: TFDQuery
    Connection = Dados.conexao
    SQL.Strings = (
      
        'select codigo, codigo||'#39' | '#39'||descricao as cfop, tipo, mov_es, o' +
        'peracao from cfop'
      ' WHERE'
      ' tipo= :tipo'
      ' and ATIVO='#39'S'#39
      ' ORDER BY CODIGO')
    Left = 376
    Top = 336
    ParamData = <
      item
        Name = 'TIPO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end>
    object qryCFOPCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCFOPCFOP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CFOP'
      Origin = 'CFOP'
      ProviderFlags = []
      ReadOnly = True
      Size = 164
    end
    object qryCFOPTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 1
    end
    object qryCFOPMOV_ES: TStringField
      FieldName = 'MOV_ES'
      Origin = 'MOV_ES'
      Size = 1
    end
    object qryCFOPOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Origin = 'OPERACAO'
      Size = 1
    end
  end
  object dsCFOP: TDataSource
    DataSet = qryCFOP
    Left = 376
    Top = 392
  end
  object ACBrMail1: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 744
    Top = 272
  end
  object qryPesquisaNFe: TFDQuery
    Connection = Dados.conexao
    SQL.Strings = (
      'select codigo from nfe_master'
      'where'
      'numero=:numero and'
      'codigo<>:codigo and'
      'fkempresa=:empresa and'
      'serie=:serie')
    Left = 440
    Top = 336
    ParamData = <
      item
        Name = 'NUMERO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'SERIE'
        ParamType = ptInput
      end>
    object qryPesquisaNFeCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object qryIBPT: TFDQuery
    Connection = Dados.conexao
    SQL.Strings = (
      
        'select ibpt.codigo,ibpt.nacionalfederal, ibpt.importadosfederal,' +
        ' ibpt.estadual, ibpt.municipal from ibpt'
      'where '
      'codigo=:cod')
    Left = 424
    Top = 400
    ParamData = <
      item
        Name = 'COD'
        DataType = ftString
        ParamType = ptInput
        Size = 30
        Value = Null
      end>
    object qryIBPTCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
      Size = 30
    end
    object qryIBPTNACIONALFEDERAL: TStringField
      FieldName = 'NACIONALFEDERAL'
      Origin = 'NACIONALFEDERAL'
      Size = 18
    end
    object qryIBPTIMPORTADOSFEDERAL: TStringField
      FieldName = 'IMPORTADOSFEDERAL'
      Origin = 'IMPORTADOSFEDERAL'
      Size = 19
    end
    object qryIBPTESTADUAL: TStringField
      FieldName = 'ESTADUAL'
      Origin = 'ESTADUAL'
      Size = 11
    end
    object qryIBPTMUNICIPAL: TStringField
      FieldName = 'MUNICIPAL'
      Origin = 'MUNICIPAL'
      Size = 12
    end
  end
  object ACBrNFe: TACBrNFe
    MAIL = ACBrMail1
    OnStatusChange = ACBrNFeStatusChange
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.VersaoQRCode = veqr000
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    DANFE = ACBrNFeDANFeRL1
    Left = 504
    Top = 12
  end
  object ACBrNFeDANFeRL1: TACBrNFeDANFeRL
    MostraStatus = False
    UsaSeparadorPathPDF = True
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    MargemInferior = 5.000000000000000000
    MargemSuperior = 5.000000000000000000
    MargemEsquerda = 5.000000000000000000
    MargemDireita = 5.000000000000000000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    CasasDecimais.Aliquota = 2
    CasasDecimais.MaskAliquota = ',0.00'
    ACBrNFe = ACBrNFe
    ImprimeCodigoEan = True
    ExibeCampoFatura = False
    Left = 819
    Top = 244
  end
  object qryProd: TFDQuery
    Connection = Dados.conexao
    SQL.Strings = (
      
        'select PRO.*, (PRO.QTD_ATUAL * PRO.PR_CUSTO) TOTAL_COMPRA, (PRO.' +
        'QTD_ATUAL * PRO.PR_VENDA) TOTAL_VENDA, gr.descricao grupo_sl, pe' +
        's.razao fornecedor_sl  from Produto PRO'
      '     left join grupo gr on gr.codigo=pro.grupo'
      '     left join pessoa pes on pes.codigo=pro.ultforn'
      'where'
      'pro.empresa=:ID'
      ''
      'order by pro.descricao')
    Left = 256
    Top = 432
    ParamData = <
      item
        Name = 'ID'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end>
    object qryProdCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object qryProdTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 30
    end
    object qryProdCODBARRA: TStringField
      FieldName = 'CODBARRA'
    end
    object qryProdREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object qryProdGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Required = True
    end
    object qryProdUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Required = True
      Size = 3
    end
    object qryProdULTFORN: TIntegerField
      FieldName = 'ULTFORN'
    end
    object qryProdLOCALIZACAO: TStringField
      FieldName = 'LOCALIZACAO'
      Size = 40
    end
    object qryProdALIQ_ICM: TCurrencyField
      FieldName = 'ALIQ_ICM'
      Required = True
    end
    object qryProdALIQ_PIS: TCurrencyField
      FieldName = 'ALIQ_PIS'
      Required = True
    end
    object qryProdALIQ_COF: TCurrencyField
      FieldName = 'ALIQ_COF'
      Required = True
    end
    object qryProdPR_CUSTO: TFMTBCDField
      FieldName = 'PR_CUSTO'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryProdMARGEM: TCurrencyField
      FieldName = 'MARGEM'
      Required = True
    end
    object qryProdPR_VENDA: TFMTBCDField
      FieldName = 'PR_VENDA'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryProdQTD_ATUAL: TFMTBCDField
      FieldName = 'QTD_ATUAL'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryProdQTD_MIN: TFMTBCDField
      FieldName = 'QTD_MIN'
      Required = True
      Precision = 18
      Size = 6
    end
    object qryProdE_MEDIO: TFMTBCDField
      FieldName = 'E_MEDIO'
      Precision = 18
      Size = 3
    end
    object qryProdCSTICMS: TStringField
      FieldName = 'CSTICMS'
      Size = 5
    end
    object qryProdCSTE: TStringField
      FieldName = 'CSTE'
      Size = 5
    end
    object qryProdCSTS: TStringField
      FieldName = 'CSTS'
      Size = 5
    end
    object qryProdCSTIPI: TStringField
      FieldName = 'CSTIPI'
      Size = 5
    end
    object qryProdCSOSN: TStringField
      FieldName = 'CSOSN'
      Size = 5
    end
    object qryProdNCM: TStringField
      FieldName = 'NCM'
      Required = True
      Size = 10
    end
    object qryProdCOMISSAO: TCurrencyField
      FieldName = 'COMISSAO'
    end
    object qryProdDESCONTO: TCurrencyField
      FieldName = 'DESCONTO'
    end
    object qryProdFOTO: TBlobField
      FieldName = 'FOTO'
    end
    object qryProdATIVO: TStringField
      FieldName = 'ATIVO'
      Required = True
      Size = 1
    end
    object qryProdCFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object qryProdPR_CUSTO_ANTERIOR: TFMTBCDField
      FieldName = 'PR_CUSTO_ANTERIOR'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryProdPR_VENDA_ANTERIOR: TFMTBCDField
      FieldName = 'PR_VENDA_ANTERIOR'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryProdULT_COMPRA: TIntegerField
      FieldName = 'ULT_COMPRA'
      Required = True
    end
    object qryProdULT_COMPRA_ANTERIOR: TIntegerField
      FieldName = 'ULT_COMPRA_ANTERIOR'
      Required = True
    end
    object qryProdPRECO_ATACADO: TFMTBCDField
      FieldName = 'PRECO_ATACADO'
      Precision = 18
      Size = 2
    end
    object qryProdQTD_ATACADO: TFMTBCDField
      FieldName = 'QTD_ATACADO'
      Precision = 18
      Size = 3
    end
    object qryProdCOD_BARRA_ATACADO: TStringField
      FieldName = 'COD_BARRA_ATACADO'
    end
    object qryProdALIQ_IPI: TFMTBCDField
      FieldName = 'ALIQ_IPI'
      Precision = 18
      Size = 2
    end
    object qryProdEMPRESA: TSmallintField
      FieldName = 'EMPRESA'
      Required = True
    end
    object qryProdCEST: TStringField
      FieldName = 'CEST'
      Size = 10
    end
    object qryProdGRADE: TStringField
      FieldName = 'GRADE'
      Size = 1
    end
    object qryProdEFISCAL: TStringField
      FieldName = 'EFISCAL'
      Size = 1
    end
    object qryProdPAGA_COMISSAO: TStringField
      FieldName = 'PAGA_COMISSAO'
      Size = 1
    end
    object qryProdPESO: TFMTBCDField
      FieldName = 'PESO'
      Precision = 18
      Size = 2
    end
    object qryProdCOMPOSICAO: TStringField
      FieldName = 'COMPOSICAO'
      Size = 1
    end
    object qryProdPRECO_PROMO_ATACADO: TFMTBCDField
      FieldName = 'PRECO_PROMO_ATACADO'
      Precision = 18
      Size = 2
    end
    object qryProdPRECO_PROMO_VAREJO: TFMTBCDField
      FieldName = 'PRECO_PROMO_VAREJO'
      Precision = 18
      Size = 2
    end
    object qryProdINICIO_PROMOCAO: TDateField
      FieldName = 'INICIO_PROMOCAO'
    end
    object qryProdFIM_PROMOCAO: TDateField
      FieldName = 'FIM_PROMOCAO'
    end
    object qryProdESTOQUE_INICIAL: TFMTBCDField
      FieldName = 'ESTOQUE_INICIAL'
      Precision = 18
      Size = 3
    end
    object qryProdPR_VENDA_PRAZO: TFMTBCDField
      FieldName = 'PR_VENDA_PRAZO'
      Precision = 18
      Size = 2
    end
    object qryProdPRECO_VARIAVEL: TStringField
      FieldName = 'PRECO_VARIAVEL'
      Size = 1
    end
    object qryProdAPLICACAO: TStringField
      FieldName = 'APLICACAO'
      Size = 50
    end
    object qryProdREDUCAO_BASE: TFMTBCDField
      FieldName = 'REDUCAO_BASE'
      Precision = 18
      Size = 2
    end
    object qryProdMVA: TFMTBCDField
      FieldName = 'MVA'
      Precision = 18
      Size = 2
    end
    object qryProdFCP: TFMTBCDField
      FieldName = 'FCP'
      Precision = 18
      Size = 2
    end
    object qryProdPRODUTO_PESADO: TStringField
      FieldName = 'PRODUTO_PESADO'
      Size = 1
    end
    object qryProdSERVICO: TStringField
      FieldName = 'SERVICO'
      Size = 1
    end
    object qryProdDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object qryProdDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
      Required = True
    end
    object qryProdPR_CUSTO2: TFMTBCDField
      FieldName = 'PR_CUSTO2'
      Precision = 18
      Size = 2
    end
    object qryProdPERC_CUSTO: TFMTBCDField
      FieldName = 'PERC_CUSTO'
      Precision = 18
      Size = 2
    end
    object qryProdTOTAL_COMPRA: TFMTBCDField
      FieldName = 'TOTAL_COMPRA'
      ReadOnly = True
      Precision = 18
    end
    object qryProdTOTAL_VENDA: TFMTBCDField
      FieldName = 'TOTAL_VENDA'
      ReadOnly = True
      Precision = 18
    end
    object qryProdGRUPO_SL: TStringField
      FieldName = 'GRUPO_SL'
      ReadOnly = True
      Size = 35
    end
    object qryProdFORNECEDOR_SL: TStringField
      FieldName = 'FORNECEDOR_SL'
      ReadOnly = True
      Size = 50
    end
    object qryProdCFOP_EXTERNO: TIntegerField
      FieldName = 'CFOP_EXTERNO'
      Origin = 'CFOP_EXTERNO'
      DisplayFormat = ',0.00'
    end
    object qryProdCSOSN_EXTERNO: TStringField
      FieldName = 'CSOSN_EXTERNO'
      Origin = 'CSOSN_EXTERNO'
      Size = 3
    end
    object qryProdCST_EXTERNO: TStringField
      FieldName = 'CST_EXTERNO'
      Origin = 'CST_EXTERNO'
      Size = 3
    end
    object qryProdALIQ_ICMS_EXTERNO: TFMTBCDField
      FieldName = 'ALIQ_ICMS_EXTERNO'
      Origin = 'ALIQ_ICMS_EXTERNO'
      Precision = 18
      Size = 2
    end
  end
  object qryNatureza: TFDQuery
    Connection = Dados.conexao
    SQL.Strings = (
      
        'select first 1 nfd.cfop, cfop.descricao, count(nfd.codigo) qtd f' +
        'rom nfe_detalhe nfd'
      'left join cfop on  cfop.codigo=nfd.cfop'
      'where'
      'nfd.fknfe=:id'
      'group by 1,2'
      'order by 3 desc')
    Left = 608
    Top = 336
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryReferencia: TFDQuery
    AfterPost = qryReferenciaAfterPost
    OnNewRecord = qryReferenciaNewRecord
    MasterSource = dsVenda
    MasterFields = 'CODIGO'
    Connection = Dados.conexao
    SQL.Strings = (
      'select * from nfe_referencia'
      'where'
      'fk_nfe=:codigo'
      'order by codigo')
    Left = 520
    Top = 336
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryReferenciaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryReferenciaFK_NFE: TIntegerField
      FieldName = 'FK_NFE'
      Origin = 'FK_NFE'
    end
    object qryReferenciaREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
      Size = 50
    end
  end
  object dsReferencia: TDataSource
    DataSet = qryReferencia
    Left = 512
    Top = 392
  end
  object PopupMenu: TPopupMenu
    Left = 20
    Top = 388
    object miGerarBoleto: TMenuItem
      Caption = 'Gerar Boleto'
      OnClick = miGerarBoletoClick
    end
    object miImprimirBoleto: TMenuItem
      Caption = 'Imprimir Boleto'
      OnClick = miImprimirBoletoClick
    end
  end
  object dsPessoa: TDataSource
    DataSet = qryClientes
    Left = 203
    Top = 275
  end
end
