object FrmModeloConsulta: TFrmModeloConsulta
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'xxxxxx'
  ClientHeight = 614
  ClientWidth = 1032
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object cxGrid: TcxGrid
    Left = 0
    Top = 100
    Width = 1032
    Height = 493
    Align = alClient
    TabOrder = 1
    object Grid: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      OnEditKeyDown = GridEditKeyDown
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnExpressionEditing = True
      OptionsCustomize.ColumnHiding = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsCustomize.ColumnsQuickCustomizationMaxDropDownCount = 1
      OptionsCustomize.ColumnsQuickCustomizationReordering = qcrEnabled
      OptionsCustomize.ColumnsQuickCustomizationSorted = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o>'
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
    end
    object cxGridLevel1: TcxGridLevel
      GridView = Grid
    end
  end
  object TabSituacao: TTabSet
    Left = 0
    Top = 593
    Width = 1032
    Height = 21
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    SoftTop = True
    Style = tsSoftTabs
    Tabs.Strings = (
      'Todos'
      'Ativo'
      'Inativo')
    TabIndex = 0
    OnClick = TabSituacaoClick
  end
  object cxgbfiltro: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    Caption = 'Filtro'
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    Style.Color = 16051947
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.Shadow = False
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 0
    Height = 100
    Width = 1032
    object pHeader: TPanel
      Left = 4
      Top = 20
      Width = 1024
      Height = 64
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      BevelOuter = bvNone
      Color = 16051947
      ParentBackground = False
      TabOrder = 0
      object lTitulo: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 15
        Width = 127
        Height = 34
        Margins.Left = 10
        Margins.Top = 15
        Margins.Right = 0
        Margins.Bottom = 15
        Align = alLeft
        AutoSize = False
        Caption = 'XXXXXX'
        Font.Charset = ANSI_CHARSET
        Font.Color = 8222060
        Font.Height = -29
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitTop = 12
        ExplicitHeight = 50
      end
      object pNovo: TPanel
        AlignWithMargins = True
        Left = 841
        Top = 20
        Width = 120
        Height = 24
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 15
        Margins.Bottom = 20
        Align = alRight
        BevelOuter = bvNone
        Color = 9937943
        ParentBackground = False
        TabOrder = 0
        ExplicitLeft = 845
        ExplicitHeight = 36
        object btnNovo: TSpeedButton
          Left = 0
          Top = 0
          Width = 120
          Height = 36
          Cursor = crHandPoint
          Align = alClient
          Caption = 'Novo | F2'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          OnClick = btnNovoClick
          ExplicitLeft = 3
          ExplicitWidth = 110
          ExplicitHeight = 40
        end
      end
      object pBusca: TPanel
        AlignWithMargins = True
        Left = 137
        Top = 0
        Width = 684
        Height = 64
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 20
        Margins.Bottom = 0
        Align = alClient
        BevelOuter = bvNone
        Color = 16051947
        ParentBackground = False
        TabOrder = 1
        object pPesquisa: TPanel
          AlignWithMargins = True
          Left = 441
          Top = 20
          Width = 120
          Height = 24
          Margins.Left = 0
          Margins.Top = 20
          Margins.Right = 0
          Margins.Bottom = 20
          Align = alRight
          BevelOuter = bvNone
          Color = 11292221
          ParentBackground = False
          TabOrder = 1
          ExplicitLeft = 445
          ExplicitHeight = 36
          object btnBusca: TSpeedButton
            Left = 0
            Top = 0
            Width = 120
            Height = 36
            Cursor = crHandPoint
            Align = alClient
            Caption = 'Pesquisar | F7'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            OnClick = btnBuscaClick
            ExplicitLeft = 72
            ExplicitTop = 8
            ExplicitWidth = 23
            ExplicitHeight = 22
          end
        end
        object pLimpar: TPanel
          AlignWithMargins = True
          Left = 564
          Top = 20
          Width = 120
          Height = 24
          Margins.Top = 20
          Margins.Right = 0
          Margins.Bottom = 20
          Align = alRight
          BevelOuter = bvNone
          Color = 7500402
          ParentBackground = False
          TabOrder = 2
          ExplicitLeft = 568
          ExplicitHeight = 36
          object btnLimpar: TSpeedButton
            Left = 0
            Top = 0
            Width = 120
            Height = 36
            Cursor = crHandPoint
            Align = alClient
            Caption = 'Limpar | F8'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            OnClick = btnLimparClick
            ExplicitLeft = 3
            ExplicitWidth = 110
            ExplicitHeight = 40
          end
        end
        object cxgbPesquisa: TcxGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 10
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alClient
          Caption = 'Pesquisa'
          Style.TextStyle = []
          TabOrder = 0
          Height = 44
          Width = 435
          object edtBusca: TEdit
            AlignWithMargins = True
            Left = 7
            Top = 24
            Width = 421
            Height = 0
            Margins.Top = 4
            Margins.Bottom = 4
            Align = alClient
            CharCase = ecUpperCase
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8222060
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            TextHint = 'digite para pesquisa'
            ExplicitLeft = 5
            ExplicitTop = 27
            ExplicitWidth = 429
            ExplicitHeight = 28
          end
        end
      end
      object PPopPap: TPanel
        AlignWithMargins = True
        Left = 976
        Top = 20
        Width = 33
        Height = 24
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 15
        Margins.Bottom = 20
        Align = alRight
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 2
        ExplicitLeft = 980
        ExplicitHeight = 36
        object Image1: TImage
          Left = 0
          Top = 0
          Width = 33
          Height = 36
          Cursor = crHandPoint
          Align = alClient
          Picture.Data = {
            0D546478536D617274496D61676589504E470D0A1A0A0000000D494844520000
            0200000002000806000000F478D4FA000000097048597300000EC300000EC301
            C76FA8640000001974455874536F667477617265007777772E696E6B73636170
            652E6F72679BEE3C1A00000F3749444154789CEDDD3BE8DD7719C7F177925244
            136BAF0E5E8A88F54A2D5E0611A3830EAE828385565AAAE062114717DD442D76
            71E820B8E9681741A4434B5D95A48DB6DD04C1D8A4B560C42898389C780BB64D
            FE39E73CA7E7F77AC167FE3FDF07FE3CCFEFC2EF140000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000006CCFA1E902808DBAAD3A5EBDAF
            7A4FF5AEEA96EA86EA6875B1FA4BF5A74B79AE7AA63A553D519DD97EC900C041
            7CB87AA83A595D6835E40F920BD589EA7BD587B67A0200E08A1CABBEDEEACAFD
            A003FFD572EAD2DF38B6A53301002FE3A6EA5BD58B6D6EF05F9E17AA6F56376E
            FE7800C07F3B54DD5B3DDFF606FFFF5B041EAC0E6FF8AC0040AB17F97ED9DCE0
            BF3C4F56B76FF4C400B0709F6BF5B6FEF4D0BF3C67AA4F6DEED800B04C87AB87
            9B1FF4AF94F3D5FD9B6A00002CCDF5D58F9B1FF0579A47AAEB36D209005888EB
            AB9F353FD4AF368F564736D00F00D87B87AB9F343FCC0F9A87D6DF1200D87FBB
            FECCFF4A72DFDABB02007BECF3CD0FEF75E4EFD527D7DC1B00D84BEFAC5E6A7E
            78AF2B67AA77ACB54300B0670EB55B1FF959571E5B67930060DF3CD0FCB0DE54
            3EBBC63E01C0DEB8A9D5EDF2E941BDA99CC8EF06C0CEF0CF08BBE3C1EA96E922
            36E8CEEA9EE922006097BCA13ADBFC55FAA6F3FBEAF56BEA19700DDC0180DDF0
            95EAE6E922B6E02DD597A68B00805DF1DBE6AFCEB795A7D7D43300784DFB68F3
            4379DBB96B2D9D030ECC230098F785E90206DC3D5D002C9D0500E67D66BA8001
            4B3C33EC9443D305C0C2DD569D6E79FF8B175B9DFDEC7421B054EE00C0ACE32D
            6FF8D7EACCC7A78B8025B300C0AC0F4C1730E8FDD305C092590060D61DD3050C
            5AF2D9619C0500662D7908BE7BBA0058320B00CCDAE76FFFBF9A259F1DC65900
            60D6B1E902062DF9EC30CE0200B38E4E1730C80200832C0000B040160098756E
            BA80417F9E2E0096CC0200B32C00C0080B00CC7A7EBA804167A60B8025B300C0
            ACE7A60B18F4EC7401B06416009865010046580060D6D3D3050CFACD7401B064
            4BFC1532D825B7567F6C79FF8B17AB37E73D0018E30E00CC3AD332EF029CCCF0
            8751160098F78BE90206FC7CBA000098F69156B7C497943BD7D23900788D7BAA
            F9A1BCAD2CF19107EC1C8F006037FC68BA802DFAE1740100B02B8EB67A296EFA
            EA7CD3399B5F01849DE00E00EC8673D50FA68BD88287F31B0000F03F6E6CF5DB
            00D357E99BCAE9EA86B5750B00F6C8FDCD0FEA4DE59E35F60900F6CAA1EAC9E6
            87F5BAF378CBFBDA21005C95DB5B7D1E787A68AF2BA7ABB7ADB54300B0A73E5E
            9D6F7E785F6BFE561D5F736F0060AF7DB1F9017EAD7960ED5D018005F87EF343
            FCA0F9EE06FA01008B70A47AB4F9617EB5F9E9A5DA0180033A527DBBF9A17EA5
            79A4BA6E239D008005BABBFA6BF303FEE572BEBA6F63A7078005FB58F587E687
            FDE53993B7FD0160A3DE5E3DD6FCD0FF571EAFDEBAD1130300FFF6E9EA57CD0D
            FE17AA2FE70B7F00B07587AB7BABDFB5DDDBFDDFA8DEB885F30100AFE075D557
            AB936D6EF03F557DAD3ABAA533010057E183AD3EC273A2BAD0C107FE3FAA5F57
            DFA9EEDAEA09808DF3EC0EF6DBADD527AAF75ECA1DD5CDD59BFACF95FCB9EAA5
            EAC5EAD9EA99EA54F544ABE7FC00000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000002FEBD07401C046DD561DAFDE57BDA77A57754B
            754375B4BA58FDA5FAD3A53C573D539DAA9EA8CE6CBF6400E0203E5C3D549DAC
            2EB41AF207C985EA44F5BDEA435B3D010070458E555F6F75E57ED081FF6A3975
            E96F1CDBD2990080977153F5ADEAC53637F82FCF0BD537AB1B377F3C00E0BF1D
            AAEEAD9E6F7B83FFFF2D020F5687377C5600A0D58B7CBF6C6EF05F9E27ABDB37
            7A620058B8CFB57A5B7F7AE85F9E33D5A736776C0058A6C3D5C3CD0FFA57CAF9
            EAFE4D35000096E6FAEAC7CD0FF82BCD23D5751BE904002CC4F5D5CF9A1FEA57
            9B47AB231BE80700ECBDC3D54F9A1FE607CD43EB6F0900ECBF5D7FE67F25B96F
            ED5D01803DF6F9E687F73AF2F7EA936BEE0D00ECA577562F353FBCD79533D53B
            D6DA2100D83387DAAD8FFCAC2B8FADB34900B06F1E687E586F2A9F5D639F0060
            6FDCD4EA76F9F4A0DE544EE477036067F86784DDF16075CB74111B746775CF74
            1100B04BDE509D6DFE2A7DD3F97DF5FA35F50CB806EE00C06EF84A75F374115B
            F096EA4BD34500C0AEF86DF357E7DBCAD36BEA1900BCA67DB4F9A1BCEDDCB596
            CE0107E61100CCFBC2740103EE9E2E0096CE0200F33E335DC080259E1976CAA1
            E90260E16EAB4EB7BCFFC58BADCE7E76BA10582A770060D6F19637FC6B75E6E3
            D345C092590060D607A60B18F4FEE90260C92C0030EB8EE902062DF9EC30CE02
            00B3963C04DF3D5D002C99050066EDF3B7FF5FCD92CF0EE32C0030EBD8740183
            967C76186701805947A70B186401804116000058200B00CC3A375DC0A03F4F17
            004B66018059160060840500663D3F5DC0A033D305C092590060D673D3050C7A
            76BA0058320B00CCB20000232C0030EBE9E90206FD66BA0058B225FE0A19EC92
            5BAB3FB6BCFFC58BD59BF31E008C710700669D699977014E66F8C3280B00CCFB
            C57401037E3E5D00004CFB48AB5BE24BCA9D6BE91C00BCC63DD5FC50DE5696F8
            C803768E4700B01B7E345DC016FD70BA0000D815475BBD14377D75BEE99CCDAF
            00C24E70070076C3B9EA07D3456CC1C3F90D0000F81F37B6FA6D80E9ABF44DE5
            7475C3DABA05007BE4FEE607F5A672CF1AFB04007BE550F564F3C37ADD79BCE5
            7DED1000AECAEDAD3E0F3C3DB4D795D3D5DBD6DA2100D8531FAFCE373FBCAF35
            7FAB8EAFB93700B0D7BED8FC00BFD63CB0F6AE00C0027CBFF9217ED07C7703FD
            00804538523DDAFC30BFDAFCF452ED00C0011DA9BEDDFC50BFD23C525DB7914E
            00C002DD5DFDB5F901FF72395FDDB7B1D303C0827DACFA43F3C3FEF29CC9DBFE
            00B0516FAF1E6B7EE8FF2B8F576FDDE88901807FFB74F5ABE606FF0BD597F385
            3F00D8BAC3D5BDD5EFDAEEEDFE6F546FDCC2F9008057F0BAEAABD5C93637F89F
            AABE561DDDD2990080ABF0C1561FE139515DE8E003FF1FD5AFABEF54776DF504
            C0C6797607FBEDD6EA13D57B2FE58EEAE6EA4DFDE74AFE5CF552F562F56CF54C
            75AA7AA2D5737E00000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000080977568BA0060A36EAB8E57EFABDE53BDABBAA5BAA13A5A5DAC
            FE52FDE9529EAB9EA94E554F5467B65F320070101FAE1EAA4E56175A0DF983E4
            4275A2FA5EF5A1AD9E0000B822C7AAAFB7BA723FE8C07FB59CBAF4378E6DE94C
            00C0CBB8A9FA56F5629B1BFC97E785EA9BD58D9B3F1E00F0DF0E55F756CFB7BD
            C1FFFF168107ABC31B3E2B00D0EA45BE5F3637F82FCF93D5ED1B3D31002CDCE7
            5ABDAD3F3DF42FCF99EA539B3B36002CD3E1EAE1E607FD2BE57C75FFA61A0000
            4B737DF5E3E607FC95E691EABA8D74020016E2FAEA67CD0FF5ABCDA3D5910DF4
            0300F6DEE1EA27CD0FF383E6A1F5B70400F6DFAE3FF3BF92DCB7F6AE00C01EFB
            7CF3C37B1DF97BF5C935F70600F6D23BAB979A1FDEEBCA99EA1D6BED1000EC99
            43EDD6477ED695C7D6D92400D8370F343FAC3795CFAEB14F00B0376E6A75BB7C
            7A506F2A27F2BB01B033FC33C2EE78B0BA65BA880DBAB3BA67BA0800D8256FA8
            CE367F95BEE9FCBE7AFD9A7A065C03770060377CA5BA79BA882D784BF5A5E922
            006057FCB6F9ABF36DE5E935F50C005ED33EDAFC50DE76EE5A4BE78003F30800
            E67D61BA8001774F17004B670180799F992E60C012CF0C3BE5D07401B070B755
            A75BDEFFE2C556673F3B5D082C953B0030EB78CB1BFEB53AF3F1E92260C92C00
            30EB03D3050C7AFF7401B06416009875C7740183967C7618670180594B1E82EF
            9E2E0096CC0200B3F6F9DBFFAF66C9678771160098756CBA80414B3E3B8CB300
            C0ACA3D3050CB200C0200B00002C900500669D9B2E60D09FA70B8025B300C02C
            0B0030C20200B39E9F2E60D099E90260C92C0030EBB9E902063D3B5D002C9905
            006659008011160098F5F47401837E335D002CD9127F850C76C9ADD51F5BDEFF
            E2C5EACD790F00C6B80300B3CEB4CCBB002733FC61940500E6FD62BA80013F9F
            2E0000A67DA4D52DF125E5CEB5740E005EE39E6A7E286F2B4B7CE4013BC72300
            D80D3F9A2E608B7E385D0000EC8AA3AD5E8A9BBE3ADF74CEE657006127B80300
            BBE15CF583E922B6E0E1FC060000FC8F1B5BFD36C0F455FAA672BABA616DDD02
            803D727FF3837A53B9678D7D0280BD72A87AB2F961BDEE3CDEF2BE76080057E5
            F6569F079E1EDAEBCAE9EA6D6BED1000ECA98F57E79B1FDED79ABF55C7D7DC1B
            00D86B5F6C7E805F6B1E587B57006001BEDFFC103F68BEBB817E00C0221CA91E
            6D7E985F6D7E7AA97600E0808E54DF6E7EA85F691EA9AEDB4827006081EEAEFE
            DAFC807FB99CAFEEDBD8E90160C13E56FDA1F9617F79CEE46D7F00D8A8B7578F
            353FF4FF95C7ABB76EF4C400C0BF7DBAFA557383FF85EACBF9C21F006CDDE1EA
            DEEA776DF776FF37AA376EE17C00C02B785DF5D5EA649B1BFC4F555FAB8E6EE9
            4C00C055F860AB8FF09CA82E74F081FF8FEAD7D577AABBB67A0260E33CBB83FD
            766BF589EABD9772477573F5A6FE73257FAE7AA97AB17AB67AA63A553DD1EA39
            3F00000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            5C937F0284DE6668BFE687F40000000049454E44AE426082}
          PopupMenu = Popup
          Stretch = True
          Transparent = True
          OnClick = Image1Click
          ExplicitLeft = 3
          ExplicitHeight = 40
        end
      end
    end
  end
  object ds: TDataSource
    Left = 784
    Top = 424
  end
  object frxDBListagem: TfrxDBDataset
    UserName = 'frxDBListagem'
    CloseDataSource = False
    BCDToCurrency = False
    DataSetOptions = []
    Left = 744
    Top = 424
  end
  object Popup: TPopupMenu
    Left = 824
    Top = 424
    object btneditar: TMenuItem
      Caption = 'Editar'
      ShortCut = 114
      OnClick = btneditarClick
    end
    object btnExcluir: TMenuItem
      Caption = 'Excluir'
      ShortCut = 115
      OnClick = btnExcluirClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object btnListagem: TMenuItem
      Caption = 'Listagem'
      ShortCut = 120
      OnClick = btnListagemClick
    end
    object btnrelatorio: TMenuItem
      Caption = 'Relat'#243'rio'
      ShortCut = 121
      Visible = False
    end
  end
end
