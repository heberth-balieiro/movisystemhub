inherited FrmRelacaoniverConsulta: TFrmRelacaoniverConsulta
  Align = alNone
  Caption = 'Rela'#231#227'o Aniversariantes'
  ClientHeight = 520
  ClientWidth = 900
  Font.Height = -13
  Position = poScreenCenter
  WindowState = wsNormal
  ExplicitWidth = 900
  ExplicitHeight = 520
  TextHeight = 17
  inherited cxGrid: TcxGrid
    Width = 900
    Height = 399
    inherited Grid: TcxGridDBTableView
      DataController.DataSource = ds
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'id_socio'
          Column = gCodigo
        end>
      object gidsocio: TcxGridDBColumn
        DataBinding.FieldName = 'id_socio'
        Visible = False
      end
      object gCodigo: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'codigo'
        Width = 56
      end
      object gNome: TcxGridDBColumn
        Caption = 'Nome'
        DataBinding.FieldName = 'nome'
        Width = 394
      end
      object gApelido: TcxGridDBColumn
        Caption = 'Apelido'
        DataBinding.FieldName = 'apelido'
        Width = 223
      end
      object gCelular: TcxGridDBColumn
        Caption = 'Celular'
        DataBinding.FieldName = 'celular'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.EditMask = '!\(99\)99999-9999;1;_'
        Width = 113
      end
      object gWhatsapp: TcxGridDBColumn
        Caption = 'WhatsApp'
        DataBinding.FieldName = 'whatsapp'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.EditMask = '!\(99\)99999-9999;1;_'
        Width = 119
      end
      object gNascimento: TcxGridDBColumn
        Caption = 'Dt. Nascimento'
        DataBinding.FieldName = 'nascimento'
        Width = 113
      end
    end
  end
  inherited TabSituacao: TTabSet
    Top = 499
    Width = 900
    Visible = False
  end
  inherited cxgbfiltro: TcxGroupBox
    Width = 900
    inherited pHeader: TPanel
      Width = 892
      inherited lTitulo: TLabel
        Width = 215
        Caption = 'Aniversariantes'
        ExplicitWidth = 215
      end
      inherited pNovo: TPanel
        Left = 709
        Visible = False
        ExplicitLeft = 841
        ExplicitHeight = 24
        inherited btnNovo: TSpeedButton
          Height = 24
        end
      end
      inherited pBusca: TPanel
        Left = 225
        Width = 464
        ExplicitLeft = 225
        ExplicitWidth = 596
        inherited pPesquisa: TPanel
          Left = 221
          TabOrder = 4
          ExplicitLeft = 353
          ExplicitHeight = 24
          inherited btnBusca: TSpeedButton
            Height = 24
          end
        end
        inherited pLimpar: TPanel
          Left = 344
          TabOrder = 5
          ExplicitLeft = 476
          ExplicitHeight = 24
          inherited btnLimpar: TSpeedButton
            Height = 24
          end
        end
        inherited cxgbPesquisa: TcxGroupBox
          Left = 335
          TabOrder = 3
          ExplicitLeft = 335
          ExplicitWidth = 15
          Width = 15
          inherited edtBusca: TEdit
            Width = 1
            Visible = False
            ExplicitLeft = 7
            ExplicitTop = 24
            ExplicitWidth = 1
          end
        end
        object data1: TcxDateEdit
          AlignWithMargins = True
          Left = 3
          Top = 20
          Margins.Top = 20
          Margins.Bottom = 20
          Align = alLeft
          ParentFont = False
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
          Properties.ClearKey = 16452
          Properties.DateButtons = []
          Properties.ImmediatePost = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -16
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 0
          OnKeyPress = data1KeyPress
          Width = 110
        end
        object data2: TcxDateEdit
          AlignWithMargins = True
          Left = 119
          Top = 20
          Margins.Top = 20
          Margins.Bottom = 20
          Align = alLeft
          ParentFont = False
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
          Properties.ClearKey = 16452
          Properties.DateButtons = []
          Properties.ImmediatePost = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -16
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 1
          OnKeyPress = data2KeyPress
          Width = 110
        end
        object edtOrdem: TcxComboBox
          AlignWithMargins = True
          Left = 235
          Top = 20
          Margins.Top = 20
          Margins.Bottom = 20
          Align = alLeft
          Properties.DropDownListStyle = lsEditFixedList
          Properties.Items.Strings = (
            'C'#243'digo'
            'Dt. Nascimento'
            'Nome')
          TabOrder = 2
          Text = 'Nome'
          OnKeyPress = edtOrdemKeyPress
          Width = 94
        end
        object edtPeriodo: TcxCheckBox
          Left = 3
          Top = 0
          Caption = 'Por per'#237'odo'
          Properties.ClearKey = 16452
          Properties.DisplayChecked = 'S'
          Properties.DisplayUnchecked = 'N'
          Properties.ImmediatePost = True
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 'S'
          Properties.ValueUnchecked = 'N'
          State = cbsGrayed
          Style.TransparentBorder = False
          TabOrder = 6
          Transparent = True
        end
      end
      inherited PPopPap: TPanel
        Left = 844
        ExplicitLeft = 976
        ExplicitHeight = 24
        inherited Image1: TImage
          Height = 24
        end
      end
    end
  end
  inherited ds: TDataSource
    DataSet = DM.TabRelacaoAniversariante
  end
  inherited frxDBListagem: TfrxDBDataset
    FieldAliases.Strings = (
      'id_socio=id_socio'
      'codigo=codigo'
      'nome=nome'
      'apelido=apelido'
      'celular=celular'
      'whatsapp=whatsapp'
      'nascimento=nascimento')
    DataSet = DM.TabRelacaoAniversariante
  end
  inherited Popup: TPopupMenu
    inherited btneditar: TMenuItem
      Visible = False
    end
    inherited btnExcluir: TMenuItem
      Visible = False
    end
    object Fechar1: TMenuItem [2]
      Caption = 'Fechar'
      OnClick = Fechar1Click
    end
    inherited N1: TMenuItem
      Visible = False
    end
    inherited btnListagem: TMenuItem
      Caption = 'Imprimir'
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object WhatsApp1: TMenuItem
      Caption = 'WhatsApp'
      OnClick = WhatsApp1Click
    end
  end
  object frxReport: TfrxReport
    Version = '2022.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45613.462229537040000000
    ReportOptions.LastChange = 45613.462229537040000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 688
    Top = 272
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
