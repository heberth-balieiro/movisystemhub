inherited FrmGerenciarCompra: TFrmGerenciarCompra
  Caption = 'Compra'
  TextHeight = 17
  inherited PanelClient: TPanel
    inherited cxGrid: TcxGrid
      inherited Grid: TcxGridDBTableView
        Styles.Content = nil
        Styles.ContentEven = nil
        Styles.ContentOdd = nil
        Styles.Footer = nil
        Styles.Group = nil
        Styles.GroupByBox = nil
        Styles.Header = nil
        Styles.Inactive = nil
        Styles.Indicator = nil
        Styles.Preview = nil
        Styles.Selection = nil
      end
    end
  end
  inherited PanelFiltro: TPanel
    inherited GBFiltro: TcxGroupBox
      inherited Label1: TLabel
        Left = 284
        ExplicitLeft = 284
      end
      inherited Label2: TLabel
        Left = 415
        ExplicitLeft = 415
      end
      object Label5: TLabel [2]
        Left = 201
        Top = 20
        Width = 35
        Height = 17
        Caption = 'Status'
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
      object Label6: TLabel [3]
        Left = 102
        Top = 20
        Width = 57
        Height = 17
        Caption = 'Data Final'
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
      object Label4: TLabel [4]
        Left = 3
        Top = 20
        Width = 63
        Height = 17
        Caption = 'Data Inicial'
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
      inherited EdtBusca: TcxTextEdit
        Left = 284
        ExplicitLeft = 284
        ExplicitWidth = 132
        Width = 132
      end
      inherited cxAtivo: TcxComboBox
        Left = 415
        ExplicitLeft = 415
      end
      inherited BtnPesquisar: TStyledBitBtn
        Left = 501
        ExplicitLeft = 501
      end
      inherited BtnLimpar: TStyledBitBtn
        Left = 592
        ExplicitLeft = 592
      end
      inherited BtnNovo: TStyledBitBtn
        Left = 683
        ExplicitLeft = 683
      end
      object EdtDataInicial: TcxDateEdit
        AlignWithMargins = True
        Left = 3
        Top = 38
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
        Style.Font.Color = 8222060
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        StyleFocused.BorderColor = clWindowFrame
        StyleFocused.Color = 15855596
        TabOrder = 6
        Width = 100
      end
      object edtDataFinal: TcxDateEdit
        AlignWithMargins = True
        Left = 102
        Top = 38
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
        Style.Font.Color = 8222060
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        StyleFocused.Color = 15855596
        TabOrder = 7
        Width = 100
      end
      object EdtFiltropor: TcxComboBox
        AlignWithMargins = True
        Left = 201
        Top = 38
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.ClearKey = 16452
        Properties.DropDownListStyle = lsEditFixedList
        Properties.ImmediatePost = True
        Properties.Items.Strings = (
          'Todos'
          'Aberto'
          'Fechado'
          'Cancelado')
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = 8222060
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        StyleFocused.Color = 15855596
        TabOrder = 8
        Text = 'Todos'
        Width = 84
      end
      object BtnSefaz: TStyledBitBtn
        Left = 774
        Top = 38
        Width = 90
        Height = 25
        Caption = 'Buscar Sefaz'
        TabOrder = 9
        OnClick = BtnSefazClick
        StyleFamily = 'Angular-Light'
        StyleClass = 'DeepPurple'
      end
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 472
    Top = 65530
  end
  inherited cxStyle: TcxStyleRepository
    Left = 343
    Top = 65535
    PixelsPerInch = 96
    inherited CxGridPedido: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    inherited GridTableDependente: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
  inherited MenuPop: TPopupMenu
    Top = 65532
    object N2: TMenuItem
      Caption = '-'
    end
    object BtnXmlImportado: TMenuItem
      Caption = 'XMLs Importados'
      OnClick = BtnXmlImportadoClick
    end
    object ImportarXML1: TMenuItem
      Caption = 'Importar XML'
    end
    object notion1: TMenuItem
      Caption = 'notion - tarefa'
    end
  end
  inherited cxIMGMenu: TcxImageList
    FormatVersion = 1
    Left = 384
    Top = 0
    DesignInfo = 384
  end
end
