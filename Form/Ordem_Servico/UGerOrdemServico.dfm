inherited FrmGerOrdemServico: TFrmGerOrdemServico
  BorderStyle = bsToolWindow
  Caption = 'Ordem Servi'#231'o'
  ClientHeight = 587
  ClientWidth = 1024
  TextHeight = 15
  inherited cxGrid: TcxGrid
    Top = 121
    Width = 1024
    Height = 445
    ExplicitTop = 121
    ExplicitHeight = 472
  end
  inherited TabSituacao: TTabSet
    Top = 566
    Width = 1024
    Tabs.Strings = (
      'Todos'
      'Or'#231'amento'
      'Execu'#231#227'o direta'
      'Retorno'
      'Garantia'
      'Instala'#231#227'o'
      'Laudo t'#233'cnico')
    TabIndex = -1
  end
  inherited cxgbfiltro: TcxGroupBox
    Width = 1024
    inherited pHeader: TPanel
      Width = 1016
      inherited lTitulo: TLabel
        Width = 63
        Caption = 'O.S'
        ExplicitTop = 15
        ExplicitWidth = 63
      end
      inherited pNovo: TPanel
        Left = 833
        ExplicitLeft = 841
        ExplicitHeight = 24
        inherited btnNovo: TSpeedButton
          Height = 24
        end
      end
      inherited pBusca: TPanel
        Left = 73
        Width = 740
        ExplicitLeft = 73
        ExplicitWidth = 748
        inherited pPesquisa: TPanel
          Left = 497
          ExplicitLeft = 505
          ExplicitHeight = 24
          inherited btnBusca: TSpeedButton
            Height = 24
          end
        end
        inherited pLimpar: TPanel
          Left = 620
          ExplicitLeft = 628
          ExplicitHeight = 24
          inherited btnLimpar: TSpeedButton
            Height = 24
          end
        end
        inherited cxgbPesquisa: TcxGroupBox
          Left = 235
          ExplicitLeft = 235
          ExplicitWidth = 267
          Width = 259
          inherited edtBusca: TEdit
            Width = 245
            ExplicitLeft = 7
            ExplicitTop = 24
            ExplicitWidth = 253
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
          TabOrder = 3
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
          TabOrder = 4
          Width = 110
        end
      end
      inherited PPopPap: TPanel
        Left = 968
        ExplicitLeft = 976
        ExplicitHeight = 24
        inherited Image1: TImage
          Height = 24
        end
      end
    end
  end
  object TabStatus: TTabSet [3]
    Left = 0
    Top = 100
    Width = 1024
    Height = 21
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    SoftTop = True
    Style = tsSoftTabs
    Tabs.Strings = (
      'Todos'
      'Aberta'
      'Aguardando Aprova'#231#227'o'
      'Aprovada'
      'Em Execu'#231#227'o'
      'Finalizada'
      'Cancelada')
    TabIndex = 0
    OnClick = TabSituacaoClick
    ExplicitWidth = 1032
  end
  inherited ds: TDataSource
    Left = 648
  end
  object TabOrdem: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 600
    Top = 424
  end
  object TabEquipamento: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 600
    Top = 488
  end
end
