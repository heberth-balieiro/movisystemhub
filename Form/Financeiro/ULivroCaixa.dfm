inherited FrmLivroCaixa: TFrmLivroCaixa
  Caption = 'Livro caixa'
  TextHeight = 15
  inherited cxGrid: TcxGrid
    inherited Grid: TcxGridDBTableView
      OnKeyDown = GridKeyDown
      OnCellDblClick = GridCellDblClick
      DataController.DataSource = ds
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'id'
          Column = nTipo
        end
        item
          Format = 'R$ ,0.00;-R$ ,0.00'
          Kind = skSum
          FieldName = 'vlre'
          Column = nentrada
        end
        item
          Format = 'R$ ,0.00;-R$ ,0.00'
          Kind = skSum
          FieldName = 'vlrs'
          Column = nSaida
        end>
      Styles.StyleSheet = FrmPrincipal.CxGridPedido
      object nTipo: TcxGridDBColumn
        Caption = 'Tipo'
        DataBinding.FieldName = 'operacao'
        Width = 35
      end
      object ndata: TcxGridDBColumn
        Caption = 'Data'
        DataBinding.FieldName = 'data'
        SortIndex = 0
        SortOrder = soAscending
        Width = 69
      end
      object nDoc: TcxGridDBColumn
        Caption = 'Documento'
        DataBinding.FieldName = 'doc'
        Width = 95
      end
      object nHistorico: TcxGridDBColumn
        Caption = 'Hist'#243'rico'
        DataBinding.FieldName = 'historico'
        Width = 490
      end
      object nentrada: TcxGridDBColumn
        Caption = 'Entrada'
        DataBinding.FieldName = 'vlre'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Styles.Content = cxStyleEntrada
        Width = 109
      end
      object nSaida: TcxGridDBColumn
        Caption = 'Sa'#237'da'
        DataBinding.FieldName = 'vlrs'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Styles.Content = cxStyleSaida
        Width = 111
      end
      object nSaldo: TcxGridDBColumn
        Caption = 'Saldo'
        DataBinding.FieldName = 'saldo'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Width = 109
      end
      object nvalor: TcxGridDBColumn
        DataBinding.FieldName = 'valor'
        Visible = False
      end
    end
  end
  inherited TabSituacao: TTabSet
    Tabs.Strings = (
      'Todos'
      'Receitas'
      'Despesas')
    TabIndex = -1
  end
  inherited cxgbfiltro: TcxGroupBox
    inherited pHeader: TPanel
      inherited lTitulo: TLabel
        Width = 151
        Caption = 'Livro Caixa'
        ExplicitWidth = 151
      end
      inherited pBusca: TPanel
        Left = 161
        Width = 660
        ExplicitLeft = 161
        ExplicitWidth = 660
        inherited pPesquisa: TPanel
          Left = 417
          TabOrder = 3
          ExplicitLeft = 421
        end
        inherited pLimpar: TPanel
          Left = 540
          TabOrder = 4
          ExplicitLeft = 544
        end
        inherited cxgbPesquisa: TcxGroupBox
          Left = 235
          TabOrder = 2
          ExplicitLeft = 235
          ExplicitWidth = 179
          Width = 179
          inherited edtBusca: TEdit
            Width = 165
            OnKeyPress = edtBuscaKeyPress
            ExplicitWidth = 173
          end
        end
        object data1: TcxDateEdit
          AlignWithMargins = True
          Left = 3
          Top = 20
          Margins.Top = 20
          Margins.Bottom = 20
          Align = alLeft
          EditValue = 0d
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
          ExplicitHeight = 21
          Width = 110
        end
        object data2: TcxDateEdit
          AlignWithMargins = True
          Left = 119
          Top = 20
          Margins.Top = 20
          Margins.Bottom = 20
          Align = alLeft
          EditValue = 0d
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
          ExplicitHeight = 21
          Width = 110
        end
      end
    end
  end
  inherited ds: TDataSource
    DataSet = DM.TabConsLivroCaixa
    Left = 704
  end
  inherited frxDBListagem: TfrxDBDataset
    FieldAliases.Strings = (
      'id=id'
      'codigo=codigo'
      'data=data'
      'operacao=operacao'
      'doc=doc'
      'vlre=vlre'
      'vlrs=vlrs'
      'saldo=saldo'
      'historico=historico'
      'valor=valor'
      'nsaldo=nsaldo')
    DataSet = DM.TabConsLivroCaixa
    Left = 664
  end
  inherited Popup: TPopupMenu
    inherited btnrelatorio: TMenuItem
      Visible = True
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object BtnCusto: TMenuItem
      Caption = 'Cadastro Centro de Custo'
      OnClick = BtnCustoClick
    end
  end
  object cxStyleGridColl: TcxStyleRepository
    Left = 664
    Top = 496
    PixelsPerInch = 96
    object cxStyleEntrada: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      TextColor = clHighlight
    end
    object cxStyleSaida: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      TextColor = clRed
    end
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = False
    OverwritePrompt = False
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Title = 'Salvar em PDF'
    Author = 'FastReport'
    Subject = 'Salvar em PDF'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 704
    Top = 368
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
    Left = 640
    Top = 344
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
