inherited FrmImpressao: TFrmImpressao
  Caption = 'Impressao'
  ClientHeight = 299
  ClientWidth = 335
  Color = clWhite
  OnShow = FormShow
  ExplicitWidth = 335
  ExplicitHeight = 299
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 274
    Width = 335
    TabOrder = 0
    ExplicitTop = 274
    ExplicitWidth = 335
    object lbrodape: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 3
      Width = 327
      Height = 19
      Margins.Left = 5
      Align = alClient
      ExplicitWidth = 4
      ExplicitHeight = 17
    end
  end
  inherited PanelClient: TPanel
    Width = 335
    Height = 234
    TabOrder = 1
    ExplicitWidth = 335
    ExplicitHeight = 234
    object btnwhatsapp: TStyledBitBtn
      Left = 17
      Top = 134
      Width = 298
      Height = 35
      Caption = 'WhatsApp'
      TabOrder = 3
      OnClick = btnWhatsappClick
      OnMouseEnter = btnwhatsappMouseEnter
      OnMouseLeave = btnwhatsappMouseLeave
      StyleFamily = 'Basic-Colors'
      StyleClass = 'clHotLight'
    end
    object BtnCancelar: TStyledBitBtn
      Left = 17
      Top = 194
      Width = 298
      Height = 35
      Caption = 'Cancelar | ESC'
      TabOrder = 4
      OnClick = BtnCancelarClick
      OnMouseEnter = BtnCancelarMouseEnter
      OnMouseLeave = BtnCancelarMouseLeave
      StyleFamily = 'Bootstrap'
      StyleClass = 'Danger'
    end
    object BtnImprimir: TStyledBitBtn
      Left = 17
      Top = 11
      Width = 298
      Height = 35
      Caption = 'Imprimir'
      Spacing = 5
      TabOrder = 0
      OnClick = btnImprimirClick
      OnMouseEnter = BtnImprimirMouseEnter
      OnMouseLeave = BtnImprimirMouseLeave
      StyleFamily = 'Basic-Colors'
      StyleClass = 'clHotLight'
    end
    object btnPDF: TStyledBitBtn
      Left = 17
      Top = 52
      Width = 298
      Height = 35
      Caption = 'PDF'
      Spacing = 5
      TabOrder = 1
      OnClick = btnPDFClick
      OnMouseEnter = btnPDFMouseEnter
      OnMouseLeave = btnPDFMouseLeave
      StyleFamily = 'Basic-Colors'
      StyleClass = 'clHotLight'
    end
    object btnEmail: TStyledBitBtn
      Left = 17
      Top = 93
      Width = 298
      Height = 35
      Caption = 'E-mail'
      TabOrder = 2
      OnClick = btnEmailClick
      OnMouseEnter = btnEmailMouseEnter
      OnMouseLeave = btnEmailMouseLeave
      StyleFamily = 'Basic-Colors'
      StyleClass = 'clHotLight'
    end
  end
  inherited Paneltitulo: TPanel
    Width = 335
    TabOrder = 2
    ExplicitWidth = 335
    inherited lblTitulo: TLabel
      Width = 280
      ExplicitWidth = 279
    end
    inherited BtnFechar: TSpeedButton
      Left = 295
      ExplicitLeft = 294
    end
  end
  inherited cxStyle: TcxStyleRepository
    Top = 65535
    PixelsPerInch = 96
    inherited CxGridPedido: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    inherited GridTableDependente: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
  object frxRelatorio: TfrxReport
    Tag = 1
    Version = '2022.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.AllowEdit = False
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbTools, pbNavigator, pbExportQuick, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44664.966058206000000000
    ReportOptions.LastChange = 45606.490670983800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 400
    Datasets = <
      item
        DataSet = FrxPedido
        DataSetName = 'FrxPedido'
      end
      item
        DataSet = FrxPedidoItens
        DataSetName = 'FrxPedidoItens'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      HGuides.Strings = (
        '294,80334'
        '415,7483'
        '434,64595'
        '480,00031'
        '521,57514')
      VGuides.Strings = (
        '540,47279'
        '559,37044'
        '1103,62276'
        '1099,84323')
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 3.500000000000000000
      RightMargin = 2.500000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object Header_logo: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 415.748300000000000000
        Top = 18.897650000000000000
        Width = 1099.843230000000000000
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Width = 540.252320000000000000
          Height = 260.008040000000000000
          Center = True
          Frame.Typ = []
          KeepAspectRatio = False
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000470000
            0047080600000055B05A1F000000097048597300000B1300000B1301009A9C18
            000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000011
            F34944415478DAED9C097854D5DDC6DF7BEF2C99EC0BFB9A001A4088012A4AA1
            421E1410C4950AE2028A606B410195A256082D568B500557840FA58A54818A15
            8BE2C256E1AB7E4A10103E4508425812924C32934C32CBBDDF7BCE4C20219949
            2699887C8F7F9ECB9DB93339F79CDFFD2FEF39776614FC6C414D39DF1DF829DB
            CF7042D88F0A27333333D1EBF566AAAA7AA96118993C94AA284A2AF7897C9E78
            A6538A62E7CECE63B9DCE7F2798EAEEBBBF7EEDDBBE5FF151C0184039BC081DE
            C041665687D048DBC2765E23E0AD393939B917249C5EBD7A0DE120E6F2E19066
            ECFF166E8BF7ECD9B3BE391A8F389C1F094ACD41284A2E77D95F7FFDF5CA88B6
            7B2143A935184262B865452ADC9A0C279053B2994B1E385F50EAB067196A339A
            DA4893E0104C2AC16C2698D4F34DA3D6C022E0458D86D3BB77EF89ECC03311A8
            3E352C252505E93D7AA05B972E888B8B87C7E3C691233F60FF81FDF8E1C89170
            9B1392E0AEC626EC46C1C9C8C81061343752405AB76983AB870EC5B8F1E3D1A9
            4307D92D83FF085FBE6EC8233A8E9FC8C7B265AF60DDDAB5E10D5251E6315967
            373B9C488269DBB62DA6DCFB1B0C19321885A74FE3B31D3B9077EC188A8BEDF4
            188FF4A20E1D3BE08ACBAF408F1EDDC13091D05E7DF5352C59BC180CE9660514
            169C488111839C306122AE1935121BDFFF17B66FDF8683070F9E79DD64D2106D
            35C3CBC13BCA5CD275DAB64F45F6DCC730E89703E4F169D3EEC767FFDE1ED679
            C305D46038CC313770F74E53A088F0484BEB8271E36EC5D6AD5BF0D5575FA2B2
            A2A2D6FB2C6613BAB64FC6ADA32E418F811DF1554E3E9E59B209B9478B30F7F1
            C770DF6FA760EBB6EDB87FDAD4B0FB4040131BAA871A04275095763525F9F26F
            D12DBD27E263A3B18B501AF84798745D06A6FE6138CA2A144CBAF76D6CFB6C1F
            56AF5A814B7AF6C0D5575DDD98AED8354DEBD3902AD620380CA7C34D2DD7664B
            144C9A0A97AB3C4CAAC01B4BC6A2F7AFBAA2A4D4C098B14B1115DD0ACB962EC1
            F061C31AD59740991780EC4D824330CF4652E0699A899BCA84EBA563D49F507D
            BA819B0776C5BC176E656F75BCB27C0F9EF8CB7ABCFCC242CCFEFDECA674A55E
            A118128E08279FCF77B8B1675709A26FDFBEB86EF4B5C8ECD307AD5BB7465454
            943CA9C83FAEF27214DBEDD4314770E8FB43387CF8100E1D3E8CBCBC3C9C2E28
            80D7EB95E1D83E3E0A1B373F0CC5A4E0E83105578DF823468F1E8D4D1BDF6BD2
            8562DB59A1964142C2696C38896A74699F7E78F4D1D948BFA8AB38D2D0EE0634
            8D428FD171EAE4491C3B9687BF3CFE28D66E984238A29D04FCE2B2D92236E0AE
            AC6C121CDA167A4F56D8708402E6EED570CFA61B0AB5CB64DC7BCF9DB04659E0
            17746AB55371E84640DC292AAACBBCBAACA0E034A68C1D837F7C743F6392ED18
            71D445F3A4168A8485F29EA0701AE535AA85DE320BE37E7D1DFCDEA2E34C0C89
            078A214129860FBE0AEA17D50C8D899A2E11A42B063EF8F013AC5FB1002FFDFD
            BE405B09E8DFFF615456BA23020721BCA74E388DD134951E1D33A73F80C9936F
            97B25F91700C0904C6D9C7D28B740F74A7532A5CD5AC41B5254051AD75A03130
            6FFE0274B5FD80DB1FF497ED8253CC39573F1E2930FEF304F19E607036238C75
            199D15A54BB79EF8FBAAA5888E893AEB291288D829F250696929BEDAB51B15E5
            4EA874AAB8D858B46DD50A1DBA7485392A46265FFF7CCAF003A7770CCE1A8E95
            8BAFC7C5977591C7367F720CD3672C8D281C04F19E5A701A53A1DC5E038B9E7E
            0A2347669D69D23F4851AA559C38710AAB56ADC1EAD5ABE59CE95C13152C2D2D
            0D2D05A8F61D90D22205F17171C867BED9B4EE4DBCFBFE4C20DA42C733B070E1
            76BCFEFA8791864379A1259DAB7B6AC1694C224E48698B0FDE5B4DAFB19D6D58
            C0A103943ACA70F7DDF7E2DB6FBF0DBBC302FA2393AFC41D3386FB1D50B760CC
            98E7390FFB21E270E8B5D3195A8BEB83135648099136246B189E5FF2A71ACD09
            38BCD098FDC85C6CFCD7C64675B82543F4DD7F4C454CDB44B180816FF61662FC
            F8BF461C4CC06A85565D708C705A1489F8C199D331F99EDB6A1C1770F28E9FC2
            A891D787B5B450651EAF8E87EF1C8089B3AF95624024F527E66FC1DB6B3E6E2E
            3862CE95563DB46AC0092C926F0EA7C5F24A2F163FB31023AFA95D0D37BCBF09
            8F3D1A7E65F1FA745C446F797BCD6F604D8A965E5352AC62D888F9A8703559F8
            05B573ABD6B9701E209C67C369D0E9F260E94B4B70D5D041B55E5BBE7C259E7B
            EEC5B03AE8F1FA5056EEC1BAA59371D9B04B08C623BBB960C15626F58F9A0D4C
            004E8DBC53030E434A24E289E134585A5689A717FC19636EBAC6DF9C2195BDFC
            6FD3475BF0D083B31ADC96983214D85D98F6EBFEF8C3C24950349B6CF3E44907
            468C9825254333DB6BCC3B770583D3E0645CA5491CCE4ADC31E176CC9BF390BF
            41E3ACCC110979D4B537CBA5CFFA4CE79B8BECE5B8B4730ADE7A6332E23BB6A7
            0AA0F6412C66CC58864F3FDDD1DC60C498B6D073CEE48773E1087D935A6F23FC
            B3C4B80494BB9C721933AD5B3A36AC7F432E6F5637E1413BFF7B17EE9FF60005
            5DF05C2140173BDD48B29AF0CE9337A15B662780D30A2336061FEDCCC743B3C2
            0BCD26582E3D272D189C62EE42AEF6F90C0D0E978E015D5B62FF897C79CCE1F2
            61CDEA15E8D73783D300A596D23D9C7B0C4B96BC88EDDBFE0DB7BB36A4527A9F
            C0FAE6CCE1B87C4037185633A75B5614549871FBAC5771E2E469B44888A3404D
            474C62121CA56ED84B1C282C2C64C89D0C093E4CB3134E523038F50435C3C8AD
            A1B5C9834B2FEE809D07F3FCC0982BFA5F3108FFB5F4AF50E5CC591CAD36B792
            8F54381C4E1CFCEE20ECA7F351525282D345762CFFDB5B387EF4389EBF6D00AE
            1BD65B2C1942E1E6B3C563FEEA9DA8CC2FC44DC32F47DFBEE950126239E76801
            C5DA8A2D32E414B3884742CAE79C2B8F6D96A28C39B0D8EEC0A9FC029C3A5540
            757E924ADB7F3E87A3F4CC1A5130231CE5EC68C380E3532CCC0B0EDCD3BB2572
            78558FB0E355E672FB30FF4FD9B8E5E651F49A407829D59BF3276BCA5C7839B7
            3238A8C79F5A8C3756BD8D2747F6C6EDC333A4B7C06C15F30978CD51C83BED44
            C7F66DA0D8AC4CCE0451F5BA8D893AB6058CA8149E4B246DCD7F2138DB87EEE3
            4EE7A955B1DAC6D3FA974B2ADC6EE49DC8C3A44977A3A8A828F2705C3E133CCE
            12FC73FCE598F8C17EEA115F4DBFD2AC58B4E0090C1D3AD8DF27546B4EAEE130
            E4E865AED2624CFDFD1FF1C9871F62CE906EB8A1470744336C2C098950A36365
            BE9110AC163EB6D153C473E620E155029089C73501299A732E66016B3C41F897
            3DE4CA90F00C9EC73054B97026CC4B70BF9BF63BECDC113AB187821334E7181C
            5C519907E9361FDEBD631006BDF905EA22E963871E6027EEBA6B3CCC66ADC63A
            96686377CE1EDC77FF6C38F28F61F6C054FC32B505740ED4A732CF681658A36C
            888D8B474C7C022CD1D10C312BA1D8A4B728368692C5EAF72001881015938DC7
            6C129462360774847FB9433EA238F7516DCF7FEACF58B7760DEAB190392768B5
            F2E80AF28B9C98DC3D01D959DD317CE3215698BAEF2488F956BF7EBFC07DBF9D
            CC7D26CCAC62623AF0D22B2BF0D2D21568AF79F0F0A02E484D892318E10D0C23
            5E799F628297212240691C7C6C4C2C12E213111F1B078D5014869B61898189C7
            55825204140B15B4F0328B89707931C405D19440482B72117FE5EB6FE099458B
            42E69A8085AC5641758ECBADA3B0D881255776C4986E2978E2B809EFEEFAAE9E
            732948BFF822F4E993898FB7EEC4F7FF7B0077F649C5D85E6DE42AA09739C120
            1C95033714AB7CEE93704C72EF85593E16B7750CCEF817AD7E0B85F652C4C544
            534AC421862118435036824A484C4462720A92B925262723A945125AB64AC1EE
            DDBB913D774E7D50029E1D5AE70455C842EC953A9D786764775CD6268609D984
            993B8EA2AC22947EF14F079C4E1706766E89C706F740728C05F9951E78E82562
            E01A43AA1856ACDCB95B5E6C8DFFC6FE6A00076C639E5009494053F0C9D739D8
            FCF9CE060DB209165C21879A5B9570802E6E1BAFEF891EC9369970579DF2E2E5
            9CE3707B6B2666E1BE151E0F4C0CC5411D53303EA313FAB64BA627A82862552B
            201C2F1BF0A9046558B1ECD3FF20DF6E0F9CC78DECDB6E41BB566D982E14C261
            1120B0BC523B366CFD18258E12948B6A577F88846D21E756A166E5A554C24EE6
            98F747F7C4258423C25B5CE5FD6E051B8E9422AFCC8D52869ECFE3431B8AB8CC
            B609B832AD355258867D2CED1ECD844A7A4281DB037B25CB2D73CA17278AB0F6
            3F5F13AEF7CC79CA2A748C193218833332FDA1A50838FE7CE4E1DF8BC76E1F67
            E91515709697CB2A1E1F6B43059F3BCA9C2CD9E5707B2A50E62CC2E103BBE028
            290E87CF107ACED63AE1888FB00596486B55AC0A5EEDFCD376BC3EA23BB2DAC7
            CA7B53A24C2A147D0A072E5CC9472DE2250843860CF70C1B3138375FF332C708
            1D5C50E1E15EC59B5F1EC0FF7C9F5BAB775E9F8184D814CC183F81D5D92293B3
            F0385D31CB64ED611E7213925B5751E955D1B24D2B74494D6308F27C4CFC3E93
            025D4C63341D959E52E47CB2069BDE5A01577959BD64AA97F15A7084854ACA79
            A70A3135A30D66F6690755401080D869D1199D1074CD24C3454011F94457C495
            2714552457135C7C6D5F4109567EF6250A4B1D413B29D673DAB5EE8A71A3C720
            8A4A5940D105681162C20B758D7034547815744CED8C6E69ED50E6A1D7B23F20
            1C4333282221AB9662D1712267335E9C1DFA2382E726E33AE184CA3BF42AC4EA
            6EBC3EAC3B92AD567658006245D184DBAB128E0022AEB6784D00F3D09BDCEC74
            19AFF4BABDDF6173CEBE06F9B7C829168ABB7E7D06A253A774D8A88845C90735
            8F4FB5A292F94C784ED7F42E484B4B82D3C5FC24662E7462DD449573060E272E
            ACF4EB1F99862FB76F0B7A3E5DD727EEDBB7AFC64753EABAFB20422B68A056BA
            BD18CA6AF550FFAEF25EB82E13ABC91F4E5A95C798E55514905CECD93BBBF7E1
            F34347E1280FF31316D54C7C00419CCF4401A899CC14D031D0082AA9451B2425
            330B109CC96A8335361E170DCC42EB8BD2242858088D70BE5AFE1C3E5CBE2C68
            FB1E8F27EDC08103B921E108AB6F5D4728CE5E49D1B82323159D12E3E9315A00
            861F4C3973C4777627BE389C875D3FE4B19C7BF1635AE7BEC330F6C985F41A7A
            4494DF93F62D7F191F2C7DA9CEF7D7155241E134742D595C984E4971D42ED154
            C1F41E56D70256B5426E0E97AB89433CBBE411AEF51E3505C3664E95A145A540
            AF33F0F9D34F61DB5BABEB7C3F23E5866FBEF9E6DD06C1912708F3164DA44C4C
            3D4CD1ED70CB6D3319228972DAE2DF18D2AC64724F0DE5227CB154D2A1A399C5
            A11C95ACA66E9F47E6A4B42B07239A53135144552B7317E1BC336512BEADFB13
            6535A60C0D82D3983B114D35373592CF94849BC73F88E4569D65F9D761618512
            09DE2CA713B2FAE9D44C1E436AA5BEFD6D888E2330562EAFB80D2FE69E0C2313
            AB961A58E5508E1FC1B337DDC874503BBCEB4AC4F5C211F6637A8F28DF6EC4E1
            96098FA065BB8BE560DDCC5D1208AAF48E59EAA64A9671EA48E6140DFD2E338B
            550D1E6308B13A19663F183141174B4016B38EEDD973B0F3BD7FD675DAA05E53
            2F9C1FCB7B44D9F6A8D198337F1106640D84BDDC404129A719453E9C2EF6A1C8
            A1A3DCAB496042210B1042E368512AE1506B9921F39D2681189C98F335967001
            68FFDF9663E30BCFD579DEBA2A5483E108A3F73CC3DDF4E60223728C8BF13075
            D653B8F1D61132342876A566F12A0A5CBAB8372616E081224EBF0A8A09CE6EA0
            B0844A98EFEB9DA1C2442062D14FAC77A90CA928B382B21387F0F9CB4BB0776B
            D06BDBB4CF040A0BE89E5D68C05D89C698B8532CA61FDDD27BC11C65658EB032
            4CA278E52D1C3467ED16333DC422D77354EA1B5D2A64EA27AF052EB709B1312A
            8FABF4189384E3B1E723EFCB1DC8DBBFA7CE1C13B090E1D46038C2BA77EF9E6A
            369B05A0887E09E43C999DE1D42754385559389F609F88467C46F0A7665EAFF7
            C6FDFBF737E85B34617DF781097A2E1374F6F91E60638D893F9B4A785E43DF1F
            F6B7662E5440E18211D6A8EF5B5D68801A03465853BEA9273E712A72D04F3949
            DBA980A70753C0F55993BEE319A8624248A49E6F0A75582EAB525643AA52308B
            C857A79B5B2836C29E75381CF37273739BF431F7887DAFFCA7E045625D46E4C2
            EA8BE43F093855D6B367CF899AA689AF3AA65EA8509A0D4E9531D4AE17F781D8
            E921171A946687536522DC54551DC26D420440899F8DC9E17EBDD3E95CD9D49C
            72DEE19C6BF4A8C1E2B773C4267E3BA7EAF7735053129CF9FD1CB189DFCF111B
            93ECEEE606725EE15C48F6339C10F6339C10F67FFF5EF2B14FACE8D600000000
            49454E44AE426082}
          Stretched = False
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Top = 276.685220000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#250'mero Pedido:')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Top = 295.582870000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Cliente:')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 314.700990000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Endere'#231'o:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Top = 333.378170000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Bairro:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Top = 352.275820000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Cep:')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Top = 371.393940000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'CPF/CNPJ:')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 364.787570000000000000
          Top = 276.685220000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Data/Hora:')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 411.512060000000000000
          Top = 314.700990000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#250'mero:')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 284.126160000000000000
          Top = 333.378170000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Cidade:')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 169.637910000000000000
          Top = 352.275820000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Telefone:')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 219.551330000000000000
          Top = 371.393940000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'E-mail:')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 386.173470000000000000
          Top = 352.275820000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'RG/IE:')
          ParentFont = False
        end
        object frxDBPedidoid_pedido: TfrxMemoView
          AllowVectorExport = True
          Left = 98.267780000000000000
          Top = 276.685220000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[FrxPedido."numPedido"]')
          ParentFont = False
        end
        object frxDBPedidodata: TfrxMemoView
          AllowVectorExport = True
          Left = 436.425480000000000000
          Top = 276.685220000000000000
          Width = 104.047310000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxPedido."data"] [frxPedido."hora"]')
          ParentFont = False
          Formats = <
            item
              FormatStr = 'dd/mm/yyyy'
              Kind = fkDateTime
            end
            item
              FormatStr = 'hh:mm'
              Kind = fkDateTime
            end>
        end
        object frxDBPedidonome: TfrxMemoView
          AllowVectorExport = True
          Left = 98.267780000000000000
          Top = 295.582870000000000000
          Width = 442.205010000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxPedido."nome"]')
          ParentFont = False
        end
        object frxDBPedidoendereco: TfrxMemoView
          AllowVectorExport = True
          Left = 98.267780000000000000
          Top = 314.700990000000000000
          Width = 313.700990000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxPedido."endereco"]')
          ParentFont = False
        end
        object frxDBPedidonumero: TfrxMemoView
          AllowVectorExport = True
          Left = 468.441250000000000000
          Top = 314.700990000000000000
          Width = 72.031540000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxPedido."numero"]')
          ParentFont = False
        end
        object frxDBPedidobairro: TfrxMemoView
          AllowVectorExport = True
          Left = 98.267780000000000000
          Top = 333.378170000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxPedido."bairro"]')
          ParentFont = False
        end
        object frxDBPedidonom_cidade: TfrxMemoView
          AllowVectorExport = True
          Left = 333.598640000000000000
          Top = 333.378170000000000000
          Width = 206.874150000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxPedido."cidade"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object frxDBPedidocep: TfrxMemoView
          AllowVectorExport = True
          Left = 98.267780000000000000
          Top = 352.275820000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxPedido."cep"]')
          ParentFont = False
        end
        object frxDBPedidotelefone: TfrxMemoView
          AllowVectorExport = True
          Left = 226.771800000000000000
          Top = 352.275820000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxPedido."telefone"] - [frxPedido."whatsapp"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object frxDBPedidorg: TfrxMemoView
          AllowVectorExport = True
          Left = 431.425480000000000000
          Top = 352.275820000000000000
          Width = 109.047310000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxPedido."rg"]')
          ParentFont = False
        end
        object frxDBPedidoemail: TfrxMemoView
          AllowVectorExport = True
          Left = 268.126160000000000000
          Top = 371.393940000000000000
          Width = 272.346630000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxPedido."email"]')
          ParentFont = False
        end
        object frxDBPedidocpf: TfrxMemoView
          AllowVectorExport = True
          Left = 98.267780000000000000
          Top = 371.393940000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          GroupIndex = 1
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxPedido."cpf"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Top = 396.850650000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          GroupIndex = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Qtde.')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 41.574830000000000000
          Top = 396.850650000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          GroupIndex = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 343.937230000000000000
          Top = 396.850650000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          GroupIndex = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Und')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 374.173470000000000000
          Top = 396.850650000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          GroupIndex = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Uni.')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 434.645950000000000000
          Top = 396.850650000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          GroupIndex = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Desc.')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 476.220780000000000000
          Top = 396.850650000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          GroupIndex = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Total')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 396.850650000000000000
          Width = 540.252320000000000000
          GroupIndex = 2
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 0.220470000000000000
          Top = 415.748300000000000000
          Width = 540.252320000000000000
          GroupIndex = 2
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Picture2: TfrxPictureView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 559.590910000000000000
          Width = 540.252320000000000000
          Height = 260.008040000000000000
          Center = True
          Frame.Typ = []
          KeepAspectRatio = False
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000470000
            0047080600000055B05A1F000000097048597300000B1300000B1301009A9C18
            000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000011
            F34944415478DAED9C097854D5DDC6DF7BEF2C99EC0BFB9A001A4088012A4AA1
            421E1410C4950AE2028A606B410195A256082D568B500557840FA58A54818A15
            8BE2C256E1AB7E4A10103E4508425812924C32934C32CBBDDF7BCE4C20219949
            2699887C8F7F9ECB9DB93339F79CDFFD2FEF39776614FC6C414D39DF1DF829DB
            CF7042D88F0A27333333D1EBF566AAAA7AA96118993C94AA284A2AF7897C9E78
            A6538A62E7CECE63B9DCE7F2798EAEEBBBF7EEDDBBE5FF151C0184039BC081DE
            C041665687D048DBC2765E23E0AD393939B917249C5EBD7A0DE120E6F2E19066
            ECFF166E8BF7ECD9B3BE391A8F389C1F094ACD41284A2E77D95F7FFDF5CA88B6
            7B2143A935184262B865452ADC9A0C279053B2994B1E385F50EAB067196A339A
            DA4893E0104C2AC16C2698D4F34DA3D6C022E0458D86D3BB77EF89ECC03311A8
            3E352C252505E93D7AA05B972E888B8B87C7E3C691233F60FF81FDF8E1C89170
            9B1392E0AEC626EC46C1C9C8C81061343752405AB76983AB870EC5B8F1E3D1A9
            4307D92D83FF085FBE6EC8233A8E9FC8C7B265AF60DDDAB5E10D5251E6315967
            373B9C488269DBB62DA6DCFB1B0C19321885A74FE3B31D3B9077EC188A8BEDF4
            188FF4A20E1D3BE08ACBAF408F1EDDC13091D05E7DF5352C59BC180CE9660514
            169C488111839C306122AE1935121BDFFF17B66FDF8683070F9E79DD64D2106D
            35C3CBC13BCA5CD275DAB64F45F6DCC730E89703E4F169D3EEC767FFDE1ED679
            C305D46038CC313770F74E53A088F0484BEB8271E36EC5D6AD5BF0D5575FA2B2
            A2A2D6FB2C6613BAB64FC6ADA32E418F811DF1554E3E9E59B209B9478B30F7F1
            C770DF6FA760EBB6EDB87FDAD4B0FB4040131BAA871A04275095763525F9F26F
            D12DBD27E263A3B18B501AF84798745D06A6FE6138CA2A144CBAF76D6CFB6C1F
            56AF5A814B7AF6C0D5575DDD98AED8354DEBD3902AD620380CA7C34D2DD7664B
            144C9A0A97AB3C4CAAC01B4BC6A2F7AFBAA2A4D4C098B14B1115DD0ACB962EC1
            F061C31AD59740991780EC4D824330CF4652E0699A899BCA84EBA563D49F507D
            BA819B0776C5BC176E656F75BCB27C0F9EF8CB7ABCFCC242CCFEFDECA674A55E
            A118128E08279FCF77B8B1675709A26FDFBEB86EF4B5C8ECD307AD5BB7465454
            943CA9C83FAEF27214DBEDD4314770E8FB43387CF8100E1D3E8CBCBC3C9C2E28
            80D7EB95E1D83E3E0A1B373F0CC5A4E0E83105578DF823468F1E8D4D1BDF6BD2
            8562DB59A1964142C2696C38896A74699F7E78F4D1D948BFA8AB38D2D0EE0634
            8D428FD171EAE4491C3B9687BF3CFE28D66E984238A29D04FCE2B2D92236E0AE
            AC6C121CDA167A4F56D8708402E6EED570CFA61B0AB5CB64DC7BCF9DB04659E0
            17746AB55371E84640DC292AAACBBCBAACA0E034A68C1D837F7C743F6392ED18
            71D445F3A4168A8485F29EA0701AE535AA85DE320BE37E7D1DFCDEA2E34C0C89
            078A214129860FBE0AEA17D50C8D899A2E11A42B063EF8F013AC5FB1002FFDFD
            BE405B09E8DFFF615456BA23020721BCA74E388DD134951E1D33A73F80C9936F
            97B25F91700C0904C6D9C7D28B740F74A7532A5CD5AC41B5254051AD75A03130
            6FFE0274B5FD80DB1FF497ED8253CC39573F1E2930FEF304F19E607036238C75
            199D15A54BB79EF8FBAAA5888E893AEB291288D829F250696929BEDAB51B15E5
            4EA874AAB8D858B46DD50A1DBA7485392A46265FFF7CCAF003A7770CCE1A8E95
            8BAFC7C5977591C7367F720CD3672C8D281C04F19E5A701A53A1DC5E038B9E7E
            0A2347669D69D23F4851AA559C38710AAB56ADC1EAD5ABE59CE95C13152C2D2D
            0D2D05A8F61D90D22205F17171C867BED9B4EE4DBCFBFE4C20DA42C733B070E1
            76BCFEFA8791864379A1259DAB7B6AC1694C224E48698B0FDE5B4DAFB19D6D58
            C0A103943ACA70F7DDF7E2DB6FBF0DBBC302FA2393AFC41D3386FB1D50B760CC
            98E7390FFB21E270E8B5D3195A8BEB83135648099136246B189E5FF2A71ACD09
            38BCD098FDC85C6CFCD7C64675B82543F4DD7F4C454CDB44B180816FF61662FC
            F8BF461C4CC06A85565D708C705A1489F8C199D331F99EDB6A1C1770F28E9FC2
            A891D787B5B450651EAF8E87EF1C8089B3AF95624024F527E66FC1DB6B3E6E2E
            3862CE95563DB46AC0092C926F0EA7C5F24A2F163FB31023AFA95D0D37BCBF09
            8F3D1A7E65F1FA745C446F797BCD6F604D8A965E5352AC62D888F9A8703559F8
            05B573ABD6B9701E209C67C369D0E9F260E94B4B70D5D041B55E5BBE7C259E7B
            EEC5B03AE8F1FA5056EEC1BAA59371D9B04B08C623BBB960C15626F58F9A0D4C
            004E8DBC53030E434A24E289E134585A5689A717FC19636EBAC6DF9C2195BDFC
            6FD3475BF0D083B31ADC96983214D85D98F6EBFEF8C3C24950349B6CF3E44907
            468C9825254333DB6BCC3B770583D3E0645CA5491CCE4ADC31E176CC9BF390BF
            41E3ACCC110979D4B537CBA5CFFA4CE79B8BECE5B8B4730ADE7A6332E23BB6A7
            0AA0F6412C66CC58864F3FDDD1DC60C498B6D073CEE48773E1087D935A6F23FC
            B3C4B80494BB9C721933AD5B3A36AC7F432E6F5637E1413BFF7B17EE9FF60005
            5DF05C2140173BDD48B29AF0CE9337A15B662780D30A2336061FEDCCC743B3C2
            0BCD26582E3D272D189C62EE42AEF6F90C0D0E978E015D5B62FF897C79CCE1F2
            61CDEA15E8D73783D300A596D23D9C7B0C4B96BC88EDDBFE0DB7BB36A4527A9F
            C0FAE6CCE1B87C4037185633A75B5614549871FBAC5771E2E469B44888A3404D
            474C62121CA56ED84B1C282C2C64C89D0C093E4CB3134E523038F50435C3C8AD
            A1B5C9834B2FEE809D07F3FCC0982BFA5F3108FFB5F4AF50E5CC591CAD36B792
            8F54381C4E1CFCEE20ECA7F351525282D345762CFFDB5B387EF4389EBF6D00AE
            1BD65B2C1942E1E6B3C563FEEA9DA8CC2FC44DC32F47DFBEE950126239E76801
            C5DA8A2D32E414B3884742CAE79C2B8F6D96A28C39B0D8EEC0A9FC029C3A5540
            757E924ADB7F3E87A3F4CC1A5130231CE5EC68C380E3532CCC0B0EDCD3BB2572
            78558FB0E355E672FB30FF4FD9B8E5E651F49A407829D59BF3276BCA5C7839B7
            3238A8C79F5A8C3756BD8D2747F6C6EDC333A4B7C06C15F30978CD51C83BED44
            C7F66DA0D8AC4CCE0451F5BA8D893AB6058CA8149E4B246DCD7F2138DB87EEE3
            4EE7A955B1DAC6D3FA974B2ADC6EE49DC8C3A44977A3A8A828F2705C3E133CCE
            12FC73FCE598F8C17EEA115F4DBFD2AC58B4E0090C1D3AD8DF27546B4EAEE130
            E4E865AED2624CFDFD1FF1C9871F62CE906EB8A1470744336C2C098950A36365
            BE9110AC163EB6D153C473E620E155029089C73501299A732E66016B3C41F897
            3DE4CA90F00C9EC73054B97026CC4B70BF9BF63BECDC113AB187821334E7181C
            5C519907E9361FDEBD631006BDF905EA22E963871E6027EEBA6B3CCC66ADC63A
            96686377CE1EDC77FF6C38F28F61F6C054FC32B505740ED4A732CF681658A36C
            888D8B474C7C022CD1D10C312BA1D8A4B728368692C5EAF72001881015938DC7
            6C129462360774847FB9433EA238F7516DCF7FEACF58B7760DEAB190392768B5
            F2E80AF28B9C98DC3D01D959DD317CE3215698BAEF2488F956BF7EBFC07DBF9D
            CC7D26CCAC62623AF0D22B2BF0D2D21568AF79F0F0A02E484D892318E10D0C23
            5E799F628297212240691C7C6C4C2C12E213111F1B078D5014869B61898189C7
            55825204140B15B4F0328B89707931C405D19440482B72117FE5EB6FE099458B
            42E69A8085AC5641758ECBADA3B0D881255776C4986E2978E2B809EFEEFAAE9E
            732948BFF822F4E993898FB7EEC4F7FF7B0077F649C5D85E6DE42AA09739C120
            1C95033714AB7CEE93704C72EF85593E16B7750CCEF817AD7E0B85F652C4C544
            534AC421862118435036824A484C4462720A92B925262723A945125AB64AC1EE
            DDBB913D774E7D50029E1D5AE70455C842EC953A9D786764775CD6268609D984
            993B8EA2AC22947EF14F079C4E1706766E89C706F740728C05F9951E78E82562
            E01A43AA1856ACDCB95B5E6C8DFFC6FE6A00076C639E5009494053F0C9D739D8
            FCF9CE060DB209165C21879A5B9570802E6E1BAFEF891EC9369970579DF2E2E5
            9CE3707B6B2666E1BE151E0F4C0CC5411D53303EA313FAB64BA627A82862552B
            201C2F1BF0A9046558B1ECD3FF20DF6E0F9CC78DECDB6E41BB566D982E14C261
            1120B0BC523B366CFD18258E12948B6A577F88846D21E756A166E5A554C24EE6
            98F747F7C4258423C25B5CE5FD6E051B8E9422AFCC8D52869ECFE3431B8AB8CC
            B609B832AD355258867D2CED1ECD844A7A4281DB037B25CB2D73CA17278AB0F6
            3F5F13AEF7CC79CA2A748C193218833332FDA1A50838FE7CE4E1DF8BC76E1F67
            E91515709697CB2A1E1F6B43059F3BCA9C2CD9E5707B2A50E62CC2E103BBE028
            290E87CF107ACED63AE1888FB00596486B55AC0A5EEDFCD376BC3EA23BB2DAC7
            CA7B53A24C2A147D0A072E5CC9472DE2250843860CF70C1B3138375FF332C708
            1D5C50E1E15EC59B5F1EC0FF7C9F5BAB775E9F8184D814CC183F81D5D92293B3
            F0385D31CB64ED611E7213925B5751E955D1B24D2B74494D6308F27C4CFC3E93
            025D4C63341D959E52E47CB2069BDE5A01577959BD64AA97F15A7084854ACA79
            A70A3135A30D66F6690755401080D869D1199D1074CD24C3454011F94457C495
            2714552457135C7C6D5F4109567EF6250A4B1D413B29D673DAB5EE8A71A3C720
            8A4A5940D105681162C20B758D7034547815744CED8C6E69ED50E6A1D7B23F20
            1C4333282221AB9662D1712267335E9C1DFA2382E726E33AE184CA3BF42AC4EA
            6EBC3EAC3B92AD567658006245D184DBAB128E0022AEB6784D00F3D09BDCEC74
            19AFF4BABDDF6173CEBE06F9B7C829168ABB7E7D06A253A774D8A88845C90735
            8F4FB5A292F94C784ED7F42E484B4B82D3C5FC24662E7462DD449573060E272E
            ACF4EB1F99862FB76F0B7A3E5DD727EEDBB7AFC64753EABAFB20422B68A056BA
            BD18CA6AF550FFAEF25EB82E13ABC91F4E5A95C798E55514905CECD93BBBF7E1
            F34347E1280FF31316D54C7C00419CCF4401A899CC14D031D0082AA9451B2425
            330B109CC96A8335361E170DCC42EB8BD2242858088D70BE5AFE1C3E5CBE2C68
            FB1E8F27EDC08103B921E108AB6F5D4728CE5E49D1B82323159D12E3E9315A00
            861F4C3973C4777627BE389C875D3FE4B19C7BF1635AE7BEC330F6C985F41A7A
            4494DF93F62D7F191F2C7DA9CEF7D7155241E134742D595C984E4971D42ED154
            C1F41E56D70256B5426E0E97AB89433CBBE411AEF51E3505C3664E95A145A540
            AF33F0F9D34F61DB5BABEB7C3F23E5866FBEF9E6DD06C1912708F3164DA44C4C
            3D4CD1ED70CB6D3319228972DAE2DF18D2AC64724F0DE5227CB154D2A1A399C5
            A11C95ACA66E9F47E6A4B42B07239A53135144552B7317E1BC336512BEADFB13
            6535A60C0D82D3983B114D35373592CF94849BC73F88E4569D65F9D761618512
            09DE2CA713B2FAE9D44C1E436AA5BEFD6D888E2330562EAFB80D2FE69E0C2313
            AB961A58E5508E1FC1B337DDC874503BBCEB4AC4F5C211F6637A8F28DF6EC4E1
            96098FA065BB8BE560DDCC5D1208AAF48E59EAA64A9671EA48E6140DFD2E338B
            550D1E6308B13A19663F183141174B4016B38EEDD973B0F3BD7FD675DAA05E53
            2F9C1FCB7B44D9F6A8D198337F1106640D84BDDC404129A719453E9C2EF6A1C8
            A1A3DCAB496042210B1042E368512AE1506B9921F39D2681189C98F335967001
            68FFDF9663E30BCFD579DEBA2A5483E108A3F73CC3DDF4E60223728C8BF13075
            D653B8F1D61132342876A566F12A0A5CBAB8372616E081224EBF0A8A09CE6EA0
            B0844A98EFEB9DA1C2442062D14FAC77A90CA928B382B21387F0F9CB4BB0776B
            D06BDBB4CF040A0BE89E5D68C05D89C698B8532CA61FDDD27BC11C65658EB032
            4CA278E52D1C3467ED16333DC422D77354EA1B5D2A64EA27AF052EB709B1312A
            8FABF4189384E3B1E723EFCB1DC8DBBFA7CE1C13B090E1D46038C2BA77EF9E6A
            369B05A0887E09E43C999DE1D42754385559389F609F88467C46F0A7665EAFF7
            C6FDFBF737E85B34617DF781097A2E1374F6F91E60638D893F9B4A785E43DF1F
            F6B7662E5440E18211D6A8EF5B5D68801A03465853BEA9273E712A72D04F3949
            DBA980A70753C0F55993BEE319A8624248A49E6F0A75582EAB525643AA52308B
            C857A79B5B2836C29E75381CF37273739BF431F7887DAFFCA7E045625D46E4C2
            EA8BE43F093855D6B367CF899AA689AF3AA65EA8509A0D4E9531D4AE17F781D8
            E921171A946687536522DC54551DC26D420440899F8DC9E17EBDD3E95CD9D49C
            72DEE19C6BF4A8C1E2B773C4267E3BA7EAF7735053129CF9FD1CB189DFCF111B
            93ECEEE606725EE15C48F6339C10F6339C10F67FFF5EF2B14FACE8D600000000
            49454E44AE426082}
          Stretched = False
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 559.149970000000000000
          Top = 396.850650000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Qtde.')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 600.724800000000000000
          Top = 396.850650000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Left = 903.087200000000000000
          Top = 396.850650000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Und')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 933.323440000000000000
          Top = 396.850650000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Uni.')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Left = 993.795920000000000000
          Top = 396.850650000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Desc.')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          AllowVectorExport = True
          Left = 1035.370750000000000000
          Top = 396.850650000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Vlr. Total')
          ParentFont = False
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 559.149970000000000000
          Top = 396.850650000000000000
          Width = 540.252320000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 559.370440000000000000
          Top = 415.748300000000000000
          Width = 540.252320000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 559.149970000000000000
          Top = 275.905690000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#250'mero Pedido:')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 559.149970000000000000
          Top = 294.803340000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Cliente:')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 559.149970000000000000
          Top = 313.921460000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Endere'#231'o:')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 559.149970000000000000
          Top = 332.598640000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Bairro:')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 559.149970000000000000
          Top = 351.496290000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Cep:')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          AllowVectorExport = True
          Left = 559.149970000000000000
          Top = 370.614410000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'CPF/CNPJ:')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          AllowVectorExport = True
          Left = 923.937540000000000000
          Top = 275.905690000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Data/Hora:')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          AllowVectorExport = True
          Left = 970.662030000000000000
          Top = 313.921460000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#250'mero:')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          AllowVectorExport = True
          Left = 843.276130000000000000
          Top = 332.598640000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Cidade:')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          AllowVectorExport = True
          Left = 728.787880000000000000
          Top = 351.496290000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Telefone:')
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          AllowVectorExport = True
          Left = 778.701300000000000000
          Top = 370.614410000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'E-mail:')
          ParentFont = False
        end
        object Memo67: TfrxMemoView
          AllowVectorExport = True
          Left = 945.323440000000000000
          Top = 351.496290000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'RG/IE:')
          ParentFont = False
        end
        object Memo68: TfrxMemoView
          AllowVectorExport = True
          Left = 657.417750000000000000
          Top = 275.905690000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[FrxPedido."numPedido"]')
          ParentFont = False
        end
        object Memo69: TfrxMemoView
          AllowVectorExport = True
          Left = 995.575450000000000000
          Top = 275.905690000000000000
          Width = 104.047310000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxPedido."data"] [frxPedido."hora"]')
          ParentFont = False
          Formats = <
            item
              FormatStr = 'dd/mm/yyyy'
              Kind = fkDateTime
            end
            item
              FormatStr = 'hh:mm'
              Kind = fkDateTime
            end>
        end
        object Memo70: TfrxMemoView
          AllowVectorExport = True
          Left = 657.417750000000000000
          Top = 294.803340000000000000
          Width = 442.205010000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxPedido."nome"]')
          ParentFont = False
        end
        object Memo71: TfrxMemoView
          AllowVectorExport = True
          Left = 657.417750000000000000
          Top = 313.921460000000000000
          Width = 313.700990000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxPedido."endereco"]')
          ParentFont = False
        end
        object Memo72: TfrxMemoView
          AllowVectorExport = True
          Left = 1027.591220000000000000
          Top = 313.921460000000000000
          Width = 72.031540000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxPedido."numero"]')
          ParentFont = False
        end
        object Memo73: TfrxMemoView
          AllowVectorExport = True
          Left = 657.417750000000000000
          Top = 332.598640000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxPedido."bairro"]')
          ParentFont = False
        end
        object Memo74: TfrxMemoView
          AllowVectorExport = True
          Left = 892.748610000000000000
          Top = 332.598640000000000000
          Width = 206.874150000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxPedido."cidade"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo75: TfrxMemoView
          AllowVectorExport = True
          Left = 657.417750000000000000
          Top = 351.496290000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxPedido."cep"]')
          ParentFont = False
        end
        object Memo76: TfrxMemoView
          AllowVectorExport = True
          Left = 785.921770000000000000
          Top = 351.496290000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxPedido."telefone"] - [frxPedido."whatsapp"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo77: TfrxMemoView
          AllowVectorExport = True
          Left = 990.575450000000000000
          Top = 351.496290000000000000
          Width = 109.047310000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxPedido."rg"]')
          ParentFont = False
        end
        object Memo78: TfrxMemoView
          AllowVectorExport = True
          Left = 827.276130000000000000
          Top = 370.614410000000000000
          Width = 272.346630000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxPedido."email"]')
          ParentFont = False
        end
        object Memo79: TfrxMemoView
          AllowVectorExport = True
          Left = 657.417750000000000000
          Top = 370.614410000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxPedido."cpf"]')
          ParentFont = False
        end
      end
      object MasterData_item: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 15.118120000000000000
        Top = 457.323130000000000000
        Width = 1099.843230000000000000
        DataSet = FrxPedidoItens
        DataSetName = 'FrxPedidoItens'
        RowCount = 0
        Stretched = True
        object frxDBitemPedidoquantidade: TfrxMemoView
          AllowVectorExport = True
          Width = 41.574830000000000000
          Height = 13.228346460000000000
          DataSetName = 'frxDBitemPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FrxPedidoItens."qtde"]')
          ParentFont = False
        end
        object frxDBitemPedidodescricao: TfrxMemoView
          AllowVectorExport = True
          Left = 41.574830000000000000
          Width = 302.362400000000000000
          Height = 13.228346460000000000
          StretchMode = smActualHeight
          DataSetName = 'frxDBitemPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[FrxPedidoItens."proddescalterada"] [FrxPedidoItens."complemento' +
              '"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object frxDBitemPedidounidade: TfrxMemoView
          AllowVectorExport = True
          Left = 343.937230000000000000
          Width = 30.236240000000000000
          Height = 13.228346460000000000
          DataSetName = 'frxDBitemPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[FrxPedidoItens."uni"]')
          ParentFont = False
        end
        object frxDBitemPedidopreco: TfrxMemoView
          AllowVectorExport = True
          Left = 374.173470000000000000
          Width = 60.472480000000000000
          Height = 13.228346460000000000
          DataSetName = 'frxDBitemPedido'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FrxPedidoItens."prcunitario"]')
          ParentFont = False
        end
        object frxDBitemPedidodesconto: TfrxMemoView
          AllowVectorExport = True
          Left = 434.645950000000000000
          Width = 41.574830000000000000
          Height = 13.228346460000000000
          DataSetName = 'frxDBitemPedido'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FrxPedidoItens."descontoreais"]')
          ParentFont = False
        end
        object frxDBitemPedidototal: TfrxMemoView
          AllowVectorExport = True
          Left = 476.220780000000000000
          Width = 64.252010000000000000
          Height = 13.228346460000000000
          DataSetName = 'frxDBitemPedido'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FrxPedidoItens."prctotal"]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Left = 559.149970000000000000
          Width = 41.574830000000000000
          Height = 13.228346460000000000
          DataSetName = 'frxDBitemPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[FrxPedidoItens."qtde"]')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          AllowVectorExport = True
          Left = 600.724800000000000000
          Width = 302.362400000000000000
          Height = 13.228346460000000000
          StretchMode = smActualHeight
          DataSetName = 'frxDBitemPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[FrxPedidoItens."proddescalterada"] [FrxPedidoItens."complemento' +
              '"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo51: TfrxMemoView
          AllowVectorExport = True
          Left = 903.087200000000000000
          Width = 30.236240000000000000
          Height = 13.228346460000000000
          DataSetName = 'frxDBitemPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[FrxPedidoItens."uni"]')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          AllowVectorExport = True
          Left = 933.323440000000000000
          Width = 60.472480000000000000
          Height = 13.228346460000000000
          DataSetName = 'frxDBitemPedido'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FrxPedidoItens."prcunitario"]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          AllowVectorExport = True
          Left = 993.795920000000000000
          Width = 41.574830000000000000
          Height = 13.228346460000000000
          DataSetName = 'frxDBitemPedido'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FrxPedidoItens."descontoreais"]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          AllowVectorExport = True
          Left = 1035.370750000000000000
          Width = 64.252010000000000000
          Height = 13.228346460000000000
          DataSetName = 'frxDBitemPedido'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FrxPedidoItens."prctotal"]')
          ParentFont = False
        end
      end
      object FooterItem: TfrxFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 41.574830000000000000
        Top = 495.118430000000000000
        Width = 1099.843230000000000000
        Child = frxRelatorio.Child1
        Stretched = True
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Qtde.: [COUNT(MasterData_item)]')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 389.291590000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              'Total Pedido: R$ [SUM(<frxPedidoItens."prctotal">, MasterData_it' +
              'em, 2) - <frxPedido."descontoreais">]')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          AllowVectorExport = True
          Left = 245.669450000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              'Desconto Uni.: R$ [SUM(<frxPedidoItens."descontoreais">,MasterDa' +
              'ta_item)]')
          ParentFont = False
        end
        object frxDBPedidodesconto_reais: TfrxMemoView
          AllowVectorExport = True
          Left = 75.590600000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBPedido'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Desconto Geral: R$ [frxPedido."descontoreais"]')
          ParentFont = False
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 0.220470000000000000
          Width = 540.252320000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object frxDBPedidoobservacao: TfrxMemoView
          AllowVectorExport = True
          Top = 22.677180000000000000
          Width = 540.252320000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            '[frxPedido."observacao"]')
          ParentFont = False
        end
        object SysMemo4: TfrxSysMemoView
          AllowVectorExport = True
          Left = 560.370440000000000000
          Top = 0.220470000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Qtde.: [COUNT(MasterData_item)]')
          ParentFont = False
        end
        object SysMemo5: TfrxSysMemoView
          AllowVectorExport = True
          Left = 949.662030000000000000
          Top = 0.220470000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              'Total Pedido: R$ [SUM(<frxPedidoItens."prctotal">, MasterData_it' +
              'em, 2) - <frxPedido."descontoreais">]')
          ParentFont = False
        end
        object SysMemo6: TfrxSysMemoView
          AllowVectorExport = True
          Left = 806.039890000000000000
          Top = 0.220470000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              'Desconto Uni.: R$ [SUM(<frxPedidoItens."descontoreais">,MasterDa' +
              'ta_item)]')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          AllowVectorExport = True
          Left = 635.961040000000000000
          Top = 0.220470000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxDBPedido'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Desconto Geral: R$ [frxPedido."descontoreais"]')
          ParentFont = False
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 560.590910000000000000
          Top = 0.220470000000000000
          Width = 540.252320000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo56: TfrxMemoView
          AllowVectorExport = True
          Left = 560.370440000000000000
          Top = 22.897650000000000000
          Width = 540.252320000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            '[frxPedido."observacao"]')
          ParentFont = False
        end
      end
      object Child1: TfrxChild
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 60.472480000000000000
        Top = 559.370440000000000000
        Width = 1099.843230000000000000
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo95: TfrxMemoView
          AllowVectorExport = True
          Left = 98.901670000000000000
          Top = 45.354360000000000000
          Width = 59.881880000000000000
          Height = 14.897650000000000000
          GroupIndex = 5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Memo96: TfrxMemoView
          AllowVectorExport = True
          Left = 349.901825000000000000
          Top = 45.354360000000000000
          Width = 109.015770000000000000
          Height = 14.897650000000000000
          GroupIndex = 5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Vendedor/T'#233'cnico')
          ParentFont = False
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = 15.456710000000000000
          Top = 45.354360000000000000
          Width = 226.771800000000000000
          GroupIndex = 5
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Left = 291.023810000000000000
          Top = 45.354360000000000000
          Width = 226.771800000000000000
          GroupIndex = 5
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo57: TfrxMemoView
          AllowVectorExport = True
          Left = 654.153990000000000000
          Top = 45.354360000000000000
          Width = 59.881880000000000000
          Height = 14.897650000000000000
          GroupIndex = 5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          AllowVectorExport = True
          Left = 905.154145000000000000
          Top = 45.354360000000000000
          Width = 109.015770000000000000
          Height = 14.897650000000000000
          GroupIndex = 5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Vendedor/T'#233'cnico')
          ParentFont = False
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = 570.709030000000000000
          Top = 45.354360000000000000
          Width = 226.771800000000000000
          GroupIndex = 5
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 846.276130000000000000
          Top = 45.354360000000000000
          Width = 226.771800000000000000
          GroupIndex = 5
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo59: TfrxMemoView
          AllowVectorExport = True
          Left = 514.016080000000000000
          Top = 45.354360000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          GroupIndex = 5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '1')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          AllowVectorExport = True
          Left = 1073.386520000000000000
          Top = 45.354360000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          GroupIndex = 5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Times New Roman'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '2')
          ParentFont = False
        end
      end
    end
  end
  object frxPDF: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
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
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
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
    Left = 208
    Top = 10
  end
  object frxCSV: TfrxCSVExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Separator = ';'
    OEMCodepage = False
    UTF8 = False
    OpenAfterExport = False
    NoSysSymbols = True
    ForcedQuotes = False
    Left = 360
    Top = 65530
  end
  object FrxPedido: TfrxDBDataset
    UserName = 'FrxPedido'
    CloseDataSource = False
    DataSet = DMRelatorio.ClientPedido
    BCDToCurrency = False
    DataSetOptions = []
    Left = 432
  end
  object FrxPedidoItens: TfrxDBDataset
    UserName = 'FrxPedidoItens'
    CloseDataSource = False
    DataSet = DMRelatorio.ClientPedidoItens
    BCDToCurrency = False
    DataSetOptions = []
    Left = 464
  end
end
