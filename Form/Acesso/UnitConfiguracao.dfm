inherited FrmConfiguracao: TFrmConfiguracao
  Caption = 'Configura'#231#227'o'
  ClientHeight = 625
  Color = clWhite
  OnShow = FormShow
  ExplicitHeight = 625
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 597
    TabOrder = 0
    ExplicitTop = 597
  end
  inherited PanelClient: TPanel
    Height = 554
    TabOrder = 1
    ExplicitHeight = 554
    inherited dxBevel1: TdxBevel
      Height = 548
      ExplicitLeft = 3
      ExplicitTop = 4
      ExplicitHeight = 549
    end
    inherited BtnSalvar: TStyledBitBtn
      Left = 419
      Top = 512
      OnClick = BtnSalvarClick
      ExplicitLeft = 419
      ExplicitTop = 512
    end
    inherited BtnCancelar: TStyledBitBtn
      Left = 530
      Top = 512
      OnClick = BtnCancelarClick
      ExplicitLeft = 530
      ExplicitTop = 512
    end
    object cxPage: TcxPageControl
      Left = 7
      Top = 6
      Width = 636
      Height = 500
      TabOrder = 2
      Properties.ActivePage = TabEmpresa
      Properties.CustomButtons.Buttons = <>
      Properties.Style = 9
      Properties.TabSlants.Kind = skCutCorner
      ClientRectBottom = 500
      ClientRectRight = 636
      ClientRectTop = 24
      object TabNFe: TcxTabSheet
        Caption = 'NFE'
        ImageIndex = 0
        object cxGroupBox1: TcxGroupBox
          Left = 0
          Top = 0
          Align = alClient
          PanelStyle.Active = True
          TabOrder = 0
          Height = 476
          Width = 636
          object Label1: TLabel
            Left = 3
            Top = 5
            Width = 55
            Height = 17
            Caption = 'Ambiente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5325111
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label2: TLabel
            Left = 456
            Top = 54
            Width = 35
            Height = 17
            Caption = 'Senha'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5325111
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label3: TLabel
            Left = 94
            Top = 103
            Width = 29
            Height = 17
            Caption = 'S'#233'rie'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5325111
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label4: TLabel
            Left = 3
            Top = 103
            Width = 48
            Height = 17
            Caption = 'N'#250'mero'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5325111
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label5: TLabel
            Left = 139
            Top = 5
            Width = 91
            Height = 17
            Caption = 'Tipo de Emis'#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5325111
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label7: TLabel
            Left = 373
            Top = 5
            Width = 40
            Height = 17
            Caption = 'Vers'#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5325111
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label8: TLabel
            Left = 456
            Top = 5
            Width = 108
            Height = 17
            Caption = 'Forma de Emiss'#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5325111
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label9: TLabel
            Left = 3
            Top = 54
            Width = 63
            Height = 17
            Caption = 'Certificado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5325111
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label10: TLabel
            Left = 139
            Top = 103
            Width = 68
            Height = 17
            Caption = #218'ltimo NSU'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5325111
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label11: TLabel
            Left = 222
            Top = 103
            Width = 48
            Height = 17
            Caption = 'CryptLib'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5325111
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label12: TLabel
            Left = 373
            Top = 103
            Width = 42
            Height = 17
            Caption = 'HttpLib'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5325111
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label13: TLabel
            Left = 498
            Top = 103
            Width = 68
            Height = 17
            Caption = 'XMLSignLib'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5325111
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label14: TLabel
            Left = 3
            Top = 152
            Width = 51
            Height = 17
            Caption = 'SSL Type'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5325111
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label15: TLabel
            Left = 139
            Top = 152
            Width = 126
            Height = 17
            Caption = 'Path envio e resposta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5325111
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Label16: TLabel
            Left = 3
            Top = 201
            Width = 116
            Height = 17
            Caption = 'Path XSD (Schemas)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5325111
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Label17: TLabel
            Left = 315
            Top = 201
            Width = 80
            Height = 17
            Caption = 'Path enviadas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5325111
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Label18: TLabel
            Left = 3
            Top = 250
            Width = 111
            Height = 17
            Caption = 'Path Cancelamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5325111
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Label19: TLabel
            Left = 315
            Top = 250
            Width = 57
            Height = 17
            Caption = 'Path CC-e'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5325111
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Label20: TLabel
            Left = 3
            Top = 299
            Width = 93
            Height = 17
            Caption = 'Path Inutiliza'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5325111
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Label21: TLabel
            Left = 315
            Top = 299
            Width = 60
            Height = 17
            Caption = 'Path DPEC'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5325111
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Label22: TLabel
            Left = 3
            Top = 348
            Width = 68
            Height = 17
            Caption = 'Path Evento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5325111
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Label23: TLabel
            Left = 315
            Top = 348
            Width = 51
            Height = 17
            Caption = 'Path PDF'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5325111
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object edtNumero: TcxTextEdit
            Left = 3
            Top = 121
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.MaxLength = 99999999
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 6
            Width = 92
          end
          object edtsenha: TcxTextEdit
            Left = 456
            Top = 72
            Properties.ClearKey = 16452
            Properties.EchoMode = eemPassword
            Properties.PasswordChar = '*'
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 5
            Width = 177
          end
          object edtAmbiente: TcxComboBox
            Left = 3
            Top = 23
            Properties.DropDownListStyle = lsEditFixedList
            Properties.Items.Strings = (
              'Produ'#231#227'o'
              'Homologa'#231#227'o')
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 0
            Width = 137
          end
          object edtTipoEmissao: TcxComboBox
            Left = 139
            Top = 23
            Properties.DropDownListStyle = lsEditFixedList
            Properties.Items.Strings = (
              'libNone'
              'libOpenSSL'
              'libCapicom'
              'libCapicomDelphiSoap'
              'libWinCrypt'
              'libCustom')
            Properties.OnChange = edtTipoEmissaoPropertiesChange
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 1
            Width = 235
          end
          object edtVersao: TcxComboBox
            Left = 373
            Top = 23
            Properties.DropDownListStyle = lsEditFixedList
            Properties.Items.Strings = (
              've200'
              've300'
              've310'
              've400')
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 2
            Width = 84
          end
          object edtFormaEmissao: TcxComboBox
            Left = 456
            Top = 23
            Properties.DropDownListStyle = lsEditFixedList
            Properties.Items.Strings = (
              'Normal'
              'Conting'#234'ncia'
              'SCAN'
              'DPEC'
              'FSDA'
              'SVCAN'
              'SVCRS'
              'SVCSP'
              'OffLine')
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 3
            Width = 177
          end
          object edtCertificado: TcxButtonEdit
            Left = 3
            Top = 72
            Properties.Buttons = <
              item
                Default = True
                Glyph.SourceDPI = 96
                Glyph.Data = {
                  89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
                  610000002B744558745469746C65004F70656E3B466F6C6465723B426172733B
                  526962626F6E3B5374616E646172643B4C6F6164F1C3C4630000022249444154
                  785EA593BD6B545110C57F6FF3242AA9B412144B3FB1500CA20663FC032C6C44
                  B0B010041194147616366295805A88A058898D8D106C444D6C44123426120959
                  36B8316FD9F8F2B15F6FDFBD7746B9EFAD82019B1CB81C6698397366E006AACA
                  461000859CC959F327FC079DC1E1C4C381D785807EB21815A827E642DF8DB1E7
                  E30F4E8BA2A0CA1F12A5F7FA281D8488F61FBAFC940C8A6DD5987A76F3DE9D4B
                  FB468F5C7D53653D0470B94B426704DC2AA4DF517184380E9EBBB6DD99E1F2A9
                  03DB4072BB0AA2608C1B1BB8F5E10C6032012BA00E5C422016D4D2250D0E5F1C
                  24E8DE0104A00208AA8ED1BB57FA80AEBF02A9CB046C82DA26625BE00CD4CBA8
                  CF1B54F21A1556AB75809E20080A800BDEDD3EA67D8343C8CA272AD3E3C40B15
                  54404510C92EA7A28888E7A5F92AEAD38A38AD862675B4E28864A1C872D460FF
                  F961BC786E1B71A85A108B3A8B8A0149894BDF78FB6868DEAFB05A2E11CFCCD2
                  B3AB174D221AB32F51DF90DD47457C8C737E1D114769B2CCCA9A19094DDBB154
                  9A632D5A66E7F1BDB42BD3D85ADC29CC9A54C04F17C40B0951B1C29772FD4598
                  B62D4B73737477F7B0796B487D6602DB58F6D63B2E347391E71CB59536F1CFC6
                  D7FBEFA362D86AA4B018B1E7C44992C529926AD14F50BF7BA749BD082A5EA8BA
                  9010D7CD0860C24633FD88AB1D9D1C79C5647E5D72560001505401554421B55A
                  FEFCA3F9184803600BB00928B01EC13FB10206489E9CDDED0036FC9D7F01FAB6
                  A14B22EE620A0000000049454E44AE426082}
                Kind = bkGlyph
              end>
            Properties.OnButtonClick = edtCertificadoPropertiesButtonClick
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 4
            Width = 454
          end
          object edtSerie: TcxTextEdit
            Left = 94
            Top = 121
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.MaxLength = 3
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = clSkyBlue
            TabOrder = 7
            Width = 46
          end
          object edtUltNsu: TcxTextEdit
            Left = 139
            Top = 121
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.MaxLength = 100
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 8
            Width = 84
          end
          object edtCryptLib: TcxComboBox
            Left = 222
            Top = 121
            Properties.Items.Strings = (
              'cryNone'
              'cryOpenSSL'
              'cryCapicom'
              'cryWinCrypt')
            Properties.OnChange = edtCryptLibPropertiesChange
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 9
            Width = 152
          end
          object Edtnfehttplib: TcxComboBox
            Left = 373
            Top = 121
            Properties.Items.Strings = (
              'httpNone'
              'httpWinINet'
              'httpWinHttp'
              'httpOpenSSL'
              'httpIndy')
            Properties.OnChange = EdtnfehttplibPropertiesChange
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 10
            Width = 126
          end
          object Edtnfexmlsignlib: TcxComboBox
            Left = 498
            Top = 121
            Properties.Items.Strings = (
              'xsNone'
              'xsXmlSec'
              'xsMsXml'
              'xsMsXmlCapicom'
              'xsLibXml2')
            Properties.OnChange = EdtnfexmlsignlibPropertiesChange
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 11
            Width = 135
          end
          object Edtnfessl: TcxComboBox
            Left = 3
            Top = 170
            Properties.Items.Strings = (
              'LT_all'
              'LT_SSLv2'
              'LT_SSLv3'
              'LT_TLSv1'
              'LT_TLSv1_1'
              'LT_TLSv1_2'
              'LT_SSHv2')
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 12
            Width = 137
          end
          object edtnfepathresposta: TcxButtonEdit
            Left = 139
            Top = 170
            Properties.Buttons = <
              item
                Default = True
                Glyph.SourceDPI = 96
                Glyph.Data = {
                  89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
                  610000002B744558745469746C65004F70656E3B466F6C6465723B426172733B
                  526962626F6E3B5374616E646172643B4C6F6164F1C3C4630000022249444154
                  785EA593BD6B545110C57F6FF3242AA9B412144B3FB1500CA20663FC032C6C44
                  B0B010041194147616366295805A88A058898D8D106C444D6C44123426120959
                  36B8316FD9F8F2B15F6FDFBD7746B9EFAD82019B1CB81C6698397366E006AACA
                  461000859CC959F327FC079DC1E1C4C381D785807EB21815A827E642DF8DB1E7
                  E30F4E8BA2A0CA1F12A5F7FA281D8488F61FBAFC940C8A6DD5987A76F3DE9D4B
                  FB468F5C7D53653D0470B94B426704DC2AA4DF517184380E9EBBB6DD99E1F2A9
                  03DB4072BB0AA2608C1B1BB8F5E10C6032012BA00E5C422016D4D2250D0E5F1C
                  24E8DE0104A00208AA8ED1BB57FA80AEBF02A9CB046C82DA26625BE00CD4CBA8
                  CF1B54F21A1556AB75809E20080A800BDEDD3EA67D8343C8CA272AD3E3C40B15
                  54404510C92EA7A28888E7A5F92AEAD38A38AD862675B4E28864A1C872D460FF
                  F961BC786E1B71A85A108B3A8B8A0149894BDF78FB6868DEAFB05A2E11CFCCD2
                  B3AB174D221AB32F51DF90DD47457C8C737E1D114769B2CCCA9A19094DDBB154
                  9A632D5A66E7F1BDB42BD3D85ADC29CC9A54C04F17C40B0951B1C29772FD4598
                  B62D4B73737477F7B0796B487D6602DB58F6D63B2E347391E71CB59536F1CFC6
                  D7FBEFA362D86AA4B018B1E7C44992C529926AD14F50BF7BA749BD082A5EA8BA
                  9010D7CD0860C24633FD88AB1D9D1C79C5647E5D72560001505401554421B55A
                  FEFCA3F9184803600BB00928B01EC13FB10206489E9CDDED0036FC9D7F01FAB6
                  A14B22EE620A0000000049454E44AE426082}
                Kind = bkGlyph
              end>
            Properties.OnButtonClick = edtnfepathrespostaPropertiesButtonClick
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 13
            Visible = False
            Width = 494
          end
          object Edtnfepathxsd: TcxButtonEdit
            Left = 3
            Top = 219
            Properties.Buttons = <
              item
                Default = True
                Glyph.SourceDPI = 96
                Glyph.Data = {
                  89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
                  610000002B744558745469746C65004F70656E3B466F6C6465723B426172733B
                  526962626F6E3B5374616E646172643B4C6F6164F1C3C4630000022249444154
                  785EA593BD6B545110C57F6FF3242AA9B412144B3FB1500CA20663FC032C6C44
                  B0B010041194147616366295805A88A058898D8D106C444D6C44123426120959
                  36B8316FD9F8F2B15F6FDFBD7746B9EFAD82019B1CB81C6698397366E006AACA
                  461000859CC959F327FC079DC1E1C4C381D785807EB21815A827E642DF8DB1E7
                  E30F4E8BA2A0CA1F12A5F7FA281D8488F61FBAFC940C8A6DD5987A76F3DE9D4B
                  FB468F5C7D53653D0470B94B426704DC2AA4DF517184380E9EBBB6DD99E1F2A9
                  03DB4072BB0AA2608C1B1BB8F5E10C6032012BA00E5C422016D4D2250D0E5F1C
                  24E8DE0104A00208AA8ED1BB57FA80AEBF02A9CB046C82DA26625BE00CD4CBA8
                  CF1B54F21A1556AB75809E20080A800BDEDD3EA67D8343C8CA272AD3E3C40B15
                  54404510C92EA7A28888E7A5F92AEAD38A38AD862675B4E28864A1C872D460FF
                  F961BC786E1B71A85A108B3A8B8A0149894BDF78FB6868DEAFB05A2E11CFCCD2
                  B3AB174D221AB32F51DF90DD47457C8C737E1D114769B2CCCA9A19094DDBB154
                  9A632D5A66E7F1BDB42BD3D85ADC29CC9A54C04F17C40B0951B1C29772FD4598
                  B62D4B73737477F7B0796B487D6602DB58F6D63B2E347391E71CB59536F1CFC6
                  D7FBEFA362D86AA4B018B1E7C44992C529926AD14F50BF7BA749BD082A5EA8BA
                  9010D7CD0860C24633FD88AB1D9D1C79C5647E5D72560001505401554421B55A
                  FEFCA3F9184803600BB00928B01EC13FB10206489E9CDDED0036FC9D7F01FAB6
                  A14B22EE620A0000000049454E44AE426082}
                Kind = bkGlyph
              end>
            Properties.OnButtonClick = EdtnfepathxsdPropertiesButtonClick
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 14
            Visible = False
            Width = 313
          end
          object Edtnfepathenviadas: TcxButtonEdit
            Left = 315
            Top = 219
            Properties.Buttons = <
              item
                Default = True
                Glyph.SourceDPI = 96
                Glyph.Data = {
                  89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
                  610000002B744558745469746C65004F70656E3B466F6C6465723B426172733B
                  526962626F6E3B5374616E646172643B4C6F6164F1C3C4630000022249444154
                  785EA593BD6B545110C57F6FF3242AA9B412144B3FB1500CA20663FC032C6C44
                  B0B010041194147616366295805A88A058898D8D106C444D6C44123426120959
                  36B8316FD9F8F2B15F6FDFBD7746B9EFAD82019B1CB81C6698397366E006AACA
                  461000859CC959F327FC079DC1E1C4C381D785807EB21815A827E642DF8DB1E7
                  E30F4E8BA2A0CA1F12A5F7FA281D8488F61FBAFC940C8A6DD5987A76F3DE9D4B
                  FB468F5C7D53653D0470B94B426704DC2AA4DF517184380E9EBBB6DD99E1F2A9
                  03DB4072BB0AA2608C1B1BB8F5E10C6032012BA00E5C422016D4D2250D0E5F1C
                  24E8DE0104A00208AA8ED1BB57FA80AEBF02A9CB046C82DA26625BE00CD4CBA8
                  CF1B54F21A1556AB75809E20080A800BDEDD3EA67D8343C8CA272AD3E3C40B15
                  54404510C92EA7A28888E7A5F92AEAD38A38AD862675B4E28864A1C872D460FF
                  F961BC786E1B71A85A108B3A8B8A0149894BDF78FB6868DEAFB05A2E11CFCCD2
                  B3AB174D221AB32F51DF90DD47457C8C737E1D114769B2CCCA9A19094DDBB154
                  9A632D5A66E7F1BDB42BD3D85ADC29CC9A54C04F17C40B0951B1C29772FD4598
                  B62D4B73737477F7B0796B487D6602DB58F6D63B2E347391E71CB59536F1CFC6
                  D7FBEFA362D86AA4B018B1E7C44992C529926AD14F50BF7BA749BD082A5EA8BA
                  9010D7CD0860C24633FD88AB1D9D1C79C5647E5D72560001505401554421B55A
                  FEFCA3F9184803600BB00928B01EC13FB10206489E9CDDED0036FC9D7F01FAB6
                  A14B22EE620A0000000049454E44AE426082}
                Kind = bkGlyph
              end>
            Properties.OnButtonClick = EdtnfepathenviadasPropertiesButtonClick
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 15
            Visible = False
            Width = 318
          end
          object EdtNfePathCancelada: TcxButtonEdit
            Left = 3
            Top = 268
            Properties.Buttons = <
              item
                Default = True
                Glyph.SourceDPI = 96
                Glyph.Data = {
                  89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
                  610000002B744558745469746C65004F70656E3B466F6C6465723B426172733B
                  526962626F6E3B5374616E646172643B4C6F6164F1C3C4630000022249444154
                  785EA593BD6B545110C57F6FF3242AA9B412144B3FB1500CA20663FC032C6C44
                  B0B010041194147616366295805A88A058898D8D106C444D6C44123426120959
                  36B8316FD9F8F2B15F6FDFBD7746B9EFAD82019B1CB81C6698397366E006AACA
                  461000859CC959F327FC079DC1E1C4C381D785807EB21815A827E642DF8DB1E7
                  E30F4E8BA2A0CA1F12A5F7FA281D8488F61FBAFC940C8A6DD5987A76F3DE9D4B
                  FB468F5C7D53653D0470B94B426704DC2AA4DF517184380E9EBBB6DD99E1F2A9
                  03DB4072BB0AA2608C1B1BB8F5E10C6032012BA00E5C422016D4D2250D0E5F1C
                  24E8DE0104A00208AA8ED1BB57FA80AEBF02A9CB046C82DA26625BE00CD4CBA8
                  CF1B54F21A1556AB75809E20080A800BDEDD3EA67D8343C8CA272AD3E3C40B15
                  54404510C92EA7A28888E7A5F92AEAD38A38AD862675B4E28864A1C872D460FF
                  F961BC786E1B71A85A108B3A8B8A0149894BDF78FB6868DEAFB05A2E11CFCCD2
                  B3AB174D221AB32F51DF90DD47457C8C737E1D114769B2CCCA9A19094DDBB154
                  9A632D5A66E7F1BDB42BD3D85ADC29CC9A54C04F17C40B0951B1C29772FD4598
                  B62D4B73737477F7B0796B487D6602DB58F6D63B2E347391E71CB59536F1CFC6
                  D7FBEFA362D86AA4B018B1E7C44992C529926AD14F50BF7BA749BD082A5EA8BA
                  9010D7CD0860C24633FD88AB1D9D1C79C5647E5D72560001505401554421B55A
                  FEFCA3F9184803600BB00928B01EC13FB10206489E9CDDED0036FC9D7F01FAB6
                  A14B22EE620A0000000049454E44AE426082}
                Kind = bkGlyph
              end>
            Properties.OnButtonClick = EdtNfePathCanceladaPropertiesButtonClick
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 16
            Visible = False
            Width = 313
          end
          object Edtnfepathcce: TcxButtonEdit
            Left = 315
            Top = 268
            Properties.Buttons = <
              item
                Default = True
                Glyph.SourceDPI = 96
                Glyph.Data = {
                  89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
                  610000002B744558745469746C65004F70656E3B466F6C6465723B426172733B
                  526962626F6E3B5374616E646172643B4C6F6164F1C3C4630000022249444154
                  785EA593BD6B545110C57F6FF3242AA9B412144B3FB1500CA20663FC032C6C44
                  B0B010041194147616366295805A88A058898D8D106C444D6C44123426120959
                  36B8316FD9F8F2B15F6FDFBD7746B9EFAD82019B1CB81C6698397366E006AACA
                  461000859CC959F327FC079DC1E1C4C381D785807EB21815A827E642DF8DB1E7
                  E30F4E8BA2A0CA1F12A5F7FA281D8488F61FBAFC940C8A6DD5987A76F3DE9D4B
                  FB468F5C7D53653D0470B94B426704DC2AA4DF517184380E9EBBB6DD99E1F2A9
                  03DB4072BB0AA2608C1B1BB8F5E10C6032012BA00E5C422016D4D2250D0E5F1C
                  24E8DE0104A00208AA8ED1BB57FA80AEBF02A9CB046C82DA26625BE00CD4CBA8
                  CF1B54F21A1556AB75809E20080A800BDEDD3EA67D8343C8CA272AD3E3C40B15
                  54404510C92EA7A28888E7A5F92AEAD38A38AD862675B4E28864A1C872D460FF
                  F961BC786E1B71A85A108B3A8B8A0149894BDF78FB6868DEAFB05A2E11CFCCD2
                  B3AB174D221AB32F51DF90DD47457C8C737E1D114769B2CCCA9A19094DDBB154
                  9A632D5A66E7F1BDB42BD3D85ADC29CC9A54C04F17C40B0951B1C29772FD4598
                  B62D4B73737477F7B0796B487D6602DB58F6D63B2E347391E71CB59536F1CFC6
                  D7FBEFA362D86AA4B018B1E7C44992C529926AD14F50BF7BA749BD082A5EA8BA
                  9010D7CD0860C24633FD88AB1D9D1C79C5647E5D72560001505401554421B55A
                  FEFCA3F9184803600BB00928B01EC13FB10206489E9CDDED0036FC9D7F01FAB6
                  A14B22EE620A0000000049454E44AE426082}
                Kind = bkGlyph
              end>
            Properties.OnButtonClick = EdtnfepathccePropertiesButtonClick
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 17
            Visible = False
            Width = 318
          end
          object Edtnfepathinutilizacao: TcxButtonEdit
            Left = 3
            Top = 317
            Properties.Buttons = <
              item
                Default = True
                Glyph.SourceDPI = 96
                Glyph.Data = {
                  89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
                  610000002B744558745469746C65004F70656E3B466F6C6465723B426172733B
                  526962626F6E3B5374616E646172643B4C6F6164F1C3C4630000022249444154
                  785EA593BD6B545110C57F6FF3242AA9B412144B3FB1500CA20663FC032C6C44
                  B0B010041194147616366295805A88A058898D8D106C444D6C44123426120959
                  36B8316FD9F8F2B15F6FDFBD7746B9EFAD82019B1CB81C6698397366E006AACA
                  461000859CC959F327FC079DC1E1C4C381D785807EB21815A827E642DF8DB1E7
                  E30F4E8BA2A0CA1F12A5F7FA281D8488F61FBAFC940C8A6DD5987A76F3DE9D4B
                  FB468F5C7D53653D0470B94B426704DC2AA4DF517184380E9EBBB6DD99E1F2A9
                  03DB4072BB0AA2608C1B1BB8F5E10C6032012BA00E5C422016D4D2250D0E5F1C
                  24E8DE0104A00208AA8ED1BB57FA80AEBF02A9CB046C82DA26625BE00CD4CBA8
                  CF1B54F21A1556AB75809E20080A800BDEDD3EA67D8343C8CA272AD3E3C40B15
                  54404510C92EA7A28888E7A5F92AEAD38A38AD862675B4E28864A1C872D460FF
                  F961BC786E1B71A85A108B3A8B8A0149894BDF78FB6868DEAFB05A2E11CFCCD2
                  B3AB174D221AB32F51DF90DD47457C8C737E1D114769B2CCCA9A19094DDBB154
                  9A632D5A66E7F1BDB42BD3D85ADC29CC9A54C04F17C40B0951B1C29772FD4598
                  B62D4B73737477F7B0796B487D6602DB58F6D63B2E347391E71CB59536F1CFC6
                  D7FBEFA362D86AA4B018B1E7C44992C529926AD14F50BF7BA749BD082A5EA8BA
                  9010D7CD0860C24633FD88AB1D9D1C79C5647E5D72560001505401554421B55A
                  FEFCA3F9184803600BB00928B01EC13FB10206489E9CDDED0036FC9D7F01FAB6
                  A14B22EE620A0000000049454E44AE426082}
                Kind = bkGlyph
              end>
            Properties.OnButtonClick = EdtnfepathinutilizacaoPropertiesButtonClick
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 18
            Visible = False
            Width = 313
          end
          object Edtnfepathdpec: TcxButtonEdit
            Left = 315
            Top = 317
            Properties.Buttons = <
              item
                Default = True
                Glyph.SourceDPI = 96
                Glyph.Data = {
                  89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
                  610000002B744558745469746C65004F70656E3B466F6C6465723B426172733B
                  526962626F6E3B5374616E646172643B4C6F6164F1C3C4630000022249444154
                  785EA593BD6B545110C57F6FF3242AA9B412144B3FB1500CA20663FC032C6C44
                  B0B010041194147616366295805A88A058898D8D106C444D6C44123426120959
                  36B8316FD9F8F2B15F6FDFBD7746B9EFAD82019B1CB81C6698397366E006AACA
                  461000859CC959F327FC079DC1E1C4C381D785807EB21815A827E642DF8DB1E7
                  E30F4E8BA2A0CA1F12A5F7FA281D8488F61FBAFC940C8A6DD5987A76F3DE9D4B
                  FB468F5C7D53653D0470B94B426704DC2AA4DF517184380E9EBBB6DD99E1F2A9
                  03DB4072BB0AA2608C1B1BB8F5E10C6032012BA00E5C422016D4D2250D0E5F1C
                  24E8DE0104A00208AA8ED1BB57FA80AEBF02A9CB046C82DA26625BE00CD4CBA8
                  CF1B54F21A1556AB75809E20080A800BDEDD3EA67D8343C8CA272AD3E3C40B15
                  54404510C92EA7A28888E7A5F92AEAD38A38AD862675B4E28864A1C872D460FF
                  F961BC786E1B71A85A108B3A8B8A0149894BDF78FB6868DEAFB05A2E11CFCCD2
                  B3AB174D221AB32F51DF90DD47457C8C737E1D114769B2CCCA9A19094DDBB154
                  9A632D5A66E7F1BDB42BD3D85ADC29CC9A54C04F17C40B0951B1C29772FD4598
                  B62D4B73737477F7B0796B487D6602DB58F6D63B2E347391E71CB59536F1CFC6
                  D7FBEFA362D86AA4B018B1E7C44992C529926AD14F50BF7BA749BD082A5EA8BA
                  9010D7CD0860C24633FD88AB1D9D1C79C5647E5D72560001505401554421B55A
                  FEFCA3F9184803600BB00928B01EC13FB10206489E9CDDED0036FC9D7F01FAB6
                  A14B22EE620A0000000049454E44AE426082}
                Kind = bkGlyph
              end>
            Properties.OnButtonClick = EdtnfepathdpecPropertiesButtonClick
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 19
            Visible = False
            Width = 318
          end
          object edtnfepathevento: TcxButtonEdit
            Left = 3
            Top = 366
            Properties.Buttons = <
              item
                Default = True
                Glyph.SourceDPI = 96
                Glyph.Data = {
                  89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
                  610000002B744558745469746C65004F70656E3B466F6C6465723B426172733B
                  526962626F6E3B5374616E646172643B4C6F6164F1C3C4630000022249444154
                  785EA593BD6B545110C57F6FF3242AA9B412144B3FB1500CA20663FC032C6C44
                  B0B010041194147616366295805A88A058898D8D106C444D6C44123426120959
                  36B8316FD9F8F2B15F6FDFBD7746B9EFAD82019B1CB81C6698397366E006AACA
                  461000859CC959F327FC079DC1E1C4C381D785807EB21815A827E642DF8DB1E7
                  E30F4E8BA2A0CA1F12A5F7FA281D8488F61FBAFC940C8A6DD5987A76F3DE9D4B
                  FB468F5C7D53653D0470B94B426704DC2AA4DF517184380E9EBBB6DD99E1F2A9
                  03DB4072BB0AA2608C1B1BB8F5E10C6032012BA00E5C422016D4D2250D0E5F1C
                  24E8DE0104A00208AA8ED1BB57FA80AEBF02A9CB046C82DA26625BE00CD4CBA8
                  CF1B54F21A1556AB75809E20080A800BDEDD3EA67D8343C8CA272AD3E3C40B15
                  54404510C92EA7A28888E7A5F92AEAD38A38AD862675B4E28864A1C872D460FF
                  F961BC786E1B71A85A108B3A8B8A0149894BDF78FB6868DEAFB05A2E11CFCCD2
                  B3AB174D221AB32F51DF90DD47457C8C737E1D114769B2CCCA9A19094DDBB154
                  9A632D5A66E7F1BDB42BD3D85ADC29CC9A54C04F17C40B0951B1C29772FD4598
                  B62D4B73737477F7B0796B487D6602DB58F6D63B2E347391E71CB59536F1CFC6
                  D7FBEFA362D86AA4B018B1E7C44992C529926AD14F50BF7BA749BD082A5EA8BA
                  9010D7CD0860C24633FD88AB1D9D1C79C5647E5D72560001505401554421B55A
                  FEFCA3F9184803600BB00928B01EC13FB10206489E9CDDED0036FC9D7F01FAB6
                  A14B22EE620A0000000049454E44AE426082}
                Kind = bkGlyph
              end>
            Properties.OnButtonClick = edtnfepatheventoPropertiesButtonClick
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 20
            Visible = False
            Width = 313
          end
          object Edtnfepathpdf: TcxButtonEdit
            Left = 315
            Top = 366
            Properties.Buttons = <
              item
                Default = True
                Glyph.SourceDPI = 96
                Glyph.Data = {
                  89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
                  610000002B744558745469746C65004F70656E3B466F6C6465723B426172733B
                  526962626F6E3B5374616E646172643B4C6F6164F1C3C4630000022249444154
                  785EA593BD6B545110C57F6FF3242AA9B412144B3FB1500CA20663FC032C6C44
                  B0B010041194147616366295805A88A058898D8D106C444D6C44123426120959
                  36B8316FD9F8F2B15F6FDFBD7746B9EFAD82019B1CB81C6698397366E006AACA
                  461000859CC959F327FC079DC1E1C4C381D785807EB21815A827E642DF8DB1E7
                  E30F4E8BA2A0CA1F12A5F7FA281D8488F61FBAFC940C8A6DD5987A76F3DE9D4B
                  FB468F5C7D53653D0470B94B426704DC2AA4DF517184380E9EBBB6DD99E1F2A9
                  03DB4072BB0AA2608C1B1BB8F5E10C6032012BA00E5C422016D4D2250D0E5F1C
                  24E8DE0104A00208AA8ED1BB57FA80AEBF02A9CB046C82DA26625BE00CD4CBA8
                  CF1B54F21A1556AB75809E20080A800BDEDD3EA67D8343C8CA272AD3E3C40B15
                  54404510C92EA7A28888E7A5F92AEAD38A38AD862675B4E28864A1C872D460FF
                  F961BC786E1B71A85A108B3A8B8A0149894BDF78FB6868DEAFB05A2E11CFCCD2
                  B3AB174D221AB32F51DF90DD47457C8C737E1D114769B2CCCA9A19094DDBB154
                  9A632D5A66E7F1BDB42BD3D85ADC29CC9A54C04F17C40B0951B1C29772FD4598
                  B62D4B73737477F7B0796B487D6602DB58F6D63B2E347391E71CB59536F1CFC6
                  D7FBEFA362D86AA4B018B1E7C44992C529926AD14F50BF7BA749BD082A5EA8BA
                  9010D7CD0860C24633FD88AB1D9D1C79C5647E5D72560001505401554421B55A
                  FEFCA3F9184803600BB00928B01EC13FB10206489E9CDDED0036FC9D7F01FAB6
                  A14B22EE620A0000000049454E44AE426082}
                Kind = bkGlyph
              end>
            Properties.OnButtonClick = EdtnfepathpdfPropertiesButtonClick
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 21
            Visible = False
            Width = 318
          end
        end
      end
      object cxTabParametro: TcxTabSheet
        Caption = 'Par'#226'metros'
        ImageIndex = 1
        object cxGroupBox2: TcxGroupBox
          Left = 0
          Top = 0
          Align = alClient
          PanelStyle.Active = True
          TabOrder = 0
          Height = 476
          Width = 636
          object edt_multempresa: TcxCheckBox
            Left = 8
            Top = 5
            Caption = 'Sistema multiEmpresa'
            ParentFont = False
            Properties.ClearKey = 16452
            Properties.DisplayChecked = 'S'
            Properties.DisplayUnchecked = 'N'
            Properties.ImmediatePost = True
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            State = cbsGrayed
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = 5325111
            Style.Font.Height = -13
            Style.Font.Name = 'Segoe UI'
            Style.Font.Style = []
            Style.TransparentBorder = False
            Style.IsFontAssigned = True
            TabOrder = 0
            Transparent = True
          end
        end
      end
      object TabEmpresa: TcxTabSheet
        Caption = 'Empresa'
        ImageIndex = 3
        object cxVerticalGrid: TcxVerticalGrid
          Left = 0
          Top = 0
          Width = 636
          Height = 476
          BorderStyle = cxcbsNone
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          OptionsView.ShowEditButtons = ecsbFocused
          OptionsView.RowHeaderWidth = 321
          OptionsBehavior.AlwaysShowEditor = False
          ParentFont = False
          Styles.StyleSheet = VerticalGrid
          TabOrder = 0
          Version = 1
          object cxEmpresa: TcxCategoryRow
            Properties.Caption = 'Configura'#231#227'o da Empresa'
            ID = 0
            ParentID = -1
            Index = 0
            Version = 1
          end
          object sistema_associacao: TcxEditorRow
            Expanded = False
            Properties.Caption = 'Sistema para Associa'#231#227'o'
            Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.Items.Strings = (
              'Sim'
              'N'#227'o')
            Properties.EditProperties.MaxLength = 3
            Properties.Value = 'N'#227'o'
            ID = 1
            ParentID = -1
            Index = 1
            Version = 1
          end
          object utilizar_ticket: TcxEditorRow
            Expanded = False
            Properties.Caption = 'Utilizar Ticket'
            Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.Items.Strings = (
              'Sim'
              'N'#227'o')
            Properties.EditProperties.MaxLength = 3
            Properties.Value = 'N'#227'o'
            ID = 2
            ParentID = 1
            Index = 0
            Version = 1
          end
          object ticket_seguencia: TcxEditorRow
            Properties.Caption = 'Gerar Ticket em Seguencia'
            Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.Items.Strings = (
              'Sim'
              'N'#227'o')
            Properties.Value = 'N'#227'o'
            ID = 3
            ParentID = 2
            Index = 0
            Version = 1
          end
          object ticket_mespag_mesdesconto: TcxEditorRow
            Properties.Caption = 'M'#234's de pagamento mesmo m'#234's de Desconto'
            Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.Items.Strings = (
              'Sim'
              'N'#227'o')
            Properties.EditProperties.MaxLength = 3
            Properties.Value = 'N'#227'o'
            ID = 4
            ParentID = 2
            Index = 1
            Version = 1
          end
          object utilizar_sindicato: TcxEditorRow
            Properties.Caption = 'Utilizar Sindicato'
            Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.Items.Strings = (
              'Sim'
              'N'#227'o')
            Properties.EditProperties.MaxLength = 4
            Properties.Value = 'N'#227'o'
            ID = 5
            ParentID = 1
            Index = 1
            Version = 1
          end
          object utilizaappcarteira: TcxEditorRow
            Expanded = False
            Properties.Caption = 'Utilizar Carteirinha Web'
            Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.Items.Strings = (
              'Sim'
              'N'#227'o')
            Properties.EditProperties.MaxLength = 3
            Properties.Value = 'N'#227'o'
            ID = 6
            ParentID = 1
            Index = 2
            Version = 1
          end
          object carteira_api: TcxEditorRow
            Properties.Caption = 'URL API Carteira'
            Properties.EditPropertiesClassName = 'TcxBlobEditProperties'
            Properties.EditProperties.BlobEditKind = bekMemo
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.PopupHeight = 180
            Properties.EditProperties.PopupWidth = 300
            Properties.Value = ''
            ID = 7
            ParentID = 6
            Index = 0
            Version = 1
          end
          object carteira_usuario: TcxEditorRow
            Properties.Caption = 'Usu'#225'rio'
            Properties.EditPropertiesClassName = 'TcxTextEditProperties'
            Properties.Value = ''
            ID = 8
            ParentID = 6
            Index = 1
            Version = 1
          end
          object carteira_senha: TcxEditorRow
            Properties.Caption = 'Senha'
            Properties.EditPropertiesClassName = 'TcxTextEditProperties'
            Properties.EditProperties.EchoMode = eemPassword
            Properties.EditProperties.PasswordChar = '*'
            Properties.EditProperties.ShowPasswordRevealButton = True
            Properties.Value = ''
            ID = 9
            ParentID = 6
            Index = 2
            Version = 1
          end
          object carteira_token: TcxEditorRow
            Properties.Caption = 'Token'
            Properties.EditPropertiesClassName = 'TcxBlobEditProperties'
            Properties.EditProperties.BlobEditKind = bekMemo
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.PopupHeight = 180
            Properties.EditProperties.PopupWidth = 300
            Properties.Value = ''
            ID = 10
            ParentID = 6
            Index = 3
            Version = 1
          end
          object utilizar_votacao_web: TcxEditorRow
            Properties.Caption = 'Utilizar Vota'#231#227'o Web'
            Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.Items.Strings = (
              'Sim'
              'N'#227'o')
            Properties.EditProperties.MaxLength = 3
            Properties.Value = 'N'#227'o'
            ID = 11
            ParentID = 1
            Index = 3
            Version = 1
          end
          object sistema_garagem: TcxEditorRow
            Expanded = False
            Properties.Caption = 'Sistema para Garagem de Ve'#237'culo'
            Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.Items.Strings = (
              'Sim'
              'N'#227'o')
            Properties.Value = 'N'#227'o'
            ID = 12
            ParentID = -1
            Index = 2
            Version = 1
          end
          object tabveiculo_app: TcxEditorRow
            Expanded = False
            Properties.Caption = 'Utilizar APP'
            Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.Items.Strings = (
              'Sim'
              'N'#227'o')
            Properties.EditProperties.MaxLength = 3
            Properties.Value = 'N'#227'o'
            ID = 13
            ParentID = 12
            Index = 0
            Version = 1
          end
          object tabveiculourlapi: TcxEditorRow
            Properties.Caption = 'URL API Ve'#237'culo'
            Properties.EditPropertiesClassName = 'TcxBlobEditProperties'
            Properties.EditProperties.BlobEditKind = bekMemo
            Properties.EditProperties.PopupHeight = 180
            Properties.EditProperties.PopupWidth = 300
            Properties.Value = Null
            ID = 14
            ParentID = 13
            Index = 0
            Version = 1
          end
          object TabVeiculoUsuario: TcxEditorRow
            Properties.Caption = 'Usu'#225'rio'
            Properties.EditPropertiesClassName = 'TcxTextEditProperties'
            Properties.Value = Null
            ID = 15
            ParentID = 13
            Index = 1
            Version = 1
          end
          object tabveiculosenha: TcxEditorRow
            Properties.Caption = 'Senha'
            Properties.EditPropertiesClassName = 'TcxTextEditProperties'
            Properties.EditProperties.EchoMode = eemPassword
            Properties.EditProperties.PasswordChar = '*'
            Properties.EditProperties.ShowPasswordRevealButton = True
            Properties.Value = Null
            ID = 16
            ParentID = 13
            Index = 2
            Version = 1
          end
          object tabveiculoToken: TcxEditorRow
            Properties.Caption = 'Guid Empresa'
            Properties.EditPropertiesClassName = 'TcxBlobEditProperties'
            Properties.EditProperties.BlobEditKind = bekMemo
            Properties.EditProperties.PopupHeight = 180
            Properties.EditProperties.PopupWidth = 300
            Properties.Value = Null
            ID = 17
            ParentID = 13
            Index = 3
            Version = 1
          end
          object Garagem_Comissaovendedor: TcxEditorRow
            Properties.Caption = 'N'#227'o gerar comiss'#227'o vendedor sobre ve'#237'culo troca'
            Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
            Properties.EditProperties.DropDownListStyle = lsEditFixedList
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.Items.Strings = (
              'Sim'
              'N'#227'o')
            Properties.Value = 'N'#227'o'
            ID = 18
            ParentID = 12
            Index = 1
            Version = 1
          end
          object Garagem_taxaPatio: TcxEditorRow
            Properties.Caption = 'Taxa P'#225'tio'
            Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.EditProperties.ClearKey = 16452
            Properties.EditProperties.DisplayFormat = '% ,0.00;-% ,0.00'
            Properties.Value = '0'
            ID = 19
            ParentID = 12
            Index = 2
            Version = 1
          end
          object Garagem_taxaConsignado: TcxEditorRow
            Properties.Caption = 'Taxa Consignado'
            Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.EditProperties.ClearKey = 16452
            Properties.Value = '0'
            ID = 20
            ParentID = 12
            Index = 3
            Version = 1
          end
          object Ordem_servico: TcxEditorRow
            Expanded = False
            Properties.Caption = 'Sistema para Ordem de servi'#231'o'
            Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
            Properties.EditProperties.ClearKey = 16452
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.ImmediateUpdateText = True
            Properties.EditProperties.Items.Strings = (
              'Sim'
              'N'#227'o')
            Properties.EditProperties.MaxLength = 3
            Properties.EditProperties.Nullstring = 'N'#227'o'
            Properties.Value = 'N'#227'o'
            ID = 21
            ParentID = -1
            Index = 3
            Version = 1
          end
          object ordem_servico_tipo: TcxEditorRow
            Properties.Caption = 'Tipo de Ordem de Servi'#231'o'
            Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
            Properties.EditProperties.ClearKey = 16452
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.ImmediateUpdateText = True
            Properties.EditProperties.Items.Strings = (
              'Nenhum'
              'Equipamento'
              'Ve'#237'culo')
            Properties.EditProperties.MaxLength = 10
            Properties.EditProperties.Nullstring = 'N'#227'o'
            Properties.Value = 'Nenhum'
            ID = 22
            ParentID = 21
            Index = 0
            Version = 1
          end
          object OrdemMensagemPadraoWhatsapp: TcxEditorRow
            Properties.Caption = 'Mensagem padr'#227'o whatsapp, (O.S nova)'
            Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.EditProperties.ClearKey = 16452
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.KeyFieldNames = 'id_mensagem'
            Properties.EditProperties.ListColumns = <
              item
                FieldName = 'descricao'
              end>
            Properties.EditProperties.ListSource = dsmensagem
            Properties.Value = '0'
            ID = 23
            ParentID = 21
            Index = 1
            Version = 1
          end
          object ordemmsgorcamento: TcxEditorRow
            Properties.Caption = 'Mensagem padr'#227'o whatsapp, (O.S or'#231'amento)'
            Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.EditProperties.ClearKey = 16452
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.KeyFieldNames = 'id_mensagem'
            Properties.EditProperties.ListColumns = <
              item
                Caption = 'Mensagem'
                FieldName = 'descricao'
              end>
            Properties.EditProperties.ListSource = dsmensagem
            Properties.Value = '0'
            ID = 24
            ParentID = 21
            Index = 2
            Version = 1
          end
          object ordemmsgpecas: TcxEditorRow
            Properties.Caption = 'Mensagem padr'#227'o whatsapp, (O.S aguardo pe'#231'as)'
            Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.EditProperties.ClearKey = 16452
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.KeyFieldNames = 'id_mensagem'
            Properties.EditProperties.ListColumns = <
              item
                Caption = 'Mensagem'
                FieldName = 'descricao'
              end>
            Properties.EditProperties.ListSource = dsmensagem
            Properties.Value = '0'
            ID = 25
            ParentID = 21
            Index = 3
            Version = 1
          end
          object ordemmsgexecucao: TcxEditorRow
            Properties.Caption = 'Mensagem padr'#227'o whatsapp, (O.S execu'#231#227'o)'
            Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.EditProperties.ClearKey = 16452
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.KeyFieldNames = 'id_mensagem'
            Properties.EditProperties.ListColumns = <
              item
                Caption = 'Mensagem'
                FieldName = 'descricao'
              end>
            Properties.EditProperties.ListSource = dsmensagem
            Properties.Value = '0'
            ID = 26
            ParentID = 21
            Index = 4
            Version = 1
          end
          object ordemmsgfinalizada: TcxEditorRow
            Properties.Caption = 'Mensagem padr'#227'o whatsapp, (O.S finalizada)'
            Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.EditProperties.ClearKey = 16452
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.KeyFieldNames = 'id_mensagem'
            Properties.EditProperties.ListColumns = <
              item
                Caption = 'Mensagem'
                FieldName = 'descricao'
              end>
            Properties.EditProperties.ListSource = dsmensagem
            Properties.Value = '0'
            ID = 27
            ParentID = 21
            Index = 5
            Version = 1
          end
          object sistema_pedido: TcxEditorRow
            Expanded = False
            Properties.Caption = 'Sistema para Pedido de Venda'
            Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.Items.Strings = (
              'Sim'
              'N'#227'o')
            Properties.Value = 'N'#227'o'
            ID = 28
            ParentID = -1
            Index = 4
            Version = 1
          end
          object vidracaria_calculo: TcxEditorRow
            Properties.Caption = 'C'#225'lculo Alt x Lar metro'#178
            Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
            Properties.EditProperties.ClearKey = 16452
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.Items.Strings = (
              'Sim'
              'N'#227'o')
            Properties.Value = 'N'#227'o'
            ID = 29
            ParentID = 28
            Index = 0
            Version = 1
          end
          object pedido_altPrecoUnitario: TcxEditorRow
            Properties.Caption = 'Permitir alterar pre'#231'o unit'#225'rio'
            Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
            Properties.EditProperties.ClearKey = 16452
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.Items.Strings = (
              'Sim'
              'N'#227'o')
            Properties.Value = 'N'#227'o'
            ID = 30
            ParentID = 28
            Index = 1
            Version = 1
          end
          object sistema_locacao: TcxEditorRow
            Properties.Caption = 'Sistema para Loca'#231#227'o de Equipamentos'
            Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.Items.Strings = (
              'Sim'
              'N'#227'o')
            Properties.Value = 'N'#227'o'
            ID = 31
            ParentID = -1
            Index = 5
            Version = 1
          end
          object cxGerais: TcxCategoryRow
            Properties.Caption = 'Configura'#231#227'o Integra'#231#227'o'
            ID = 32
            ParentID = -1
            Index = 6
            Version = 1
          end
          object utilizawhatsapp: TcxEditorRow
            Expanded = False
            Properties.Caption = 'Utilizar WhatsApp'
            Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.Items.Strings = (
              'Sim'
              'N'#227'o')
            Properties.Value = 'N'#227'o'
            ID = 33
            ParentID = -1
            Index = 7
            Version = 1
          end
          object urlapiwhatsapp: TcxEditorRow
            Properties.Caption = 'URL API WhatsApp'
            Properties.EditPropertiesClassName = 'TcxBlobEditProperties'
            Properties.EditProperties.BlobEditKind = bekMemo
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.PopupHeight = 180
            Properties.EditProperties.PopupWidth = 300
            Properties.Value = ''
            ID = 34
            ParentID = 33
            Index = 0
            Version = 1
          end
          object instanciawhatsappfunc: TcxEditorRow
            Properties.Caption = 'Inst'#226'ncia whatsApp por funcion'#225'rio'
            Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.Items.Strings = (
              'Sim'
              'N'#227'o')
            Properties.Value = 'N'#227'o'
            ID = 35
            ParentID = 33
            Index = 1
            Version = 1
          end
          object id_mensagempadraowhatsapp: TcxEditorRow
            Properties.Caption = 'Mensagem padr'#227'o envio WhatsApp'
            Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.EditProperties.CharCase = ecUpperCase
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.KeyFieldNames = 'id_mensagem'
            Properties.EditProperties.ListColumns = <
              item
                Caption = 'Mensagem'
                FieldName = 'npesquisa'
              end>
            Properties.EditProperties.ListSource = dsmensagem
            Properties.DataBinding.ValueType = 'Integer'
            Properties.Value = 0
            ID = 36
            ParentID = 33
            Index = 2
            Version = 1
          end
          object zap_versao: TcxEditorRow
            Properties.Caption = 'Vers'#227'o WhatsApp'
            Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
            Properties.EditProperties.CharCase = ecUpperCase
            Properties.EditProperties.ClearKey = 16452
            Properties.EditProperties.DropDownListStyle = lsEditFixedList
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.Items.Strings = (
              'V0'
              'V1')
            Properties.Value = 'V1'
            ID = 37
            ParentID = 33
            Index = 3
            Version = 1
          end
          object zap_apikey: TcxEditorRow
            Properties.Caption = 'Whatsapp ApiKey'
            Properties.EditPropertiesClassName = 'TcxBlobEditProperties'
            Properties.EditProperties.BlobEditKind = bekMemo
            Properties.EditProperties.ClearKey = 16452
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.PopupHeight = 180
            Properties.EditProperties.PopupWidth = 300
            Properties.Value = ''
            ID = 38
            ParentID = 33
            Index = 4
            Version = 1
          end
          object SMSUtilizar: TcxEditorRow
            Expanded = False
            Properties.Caption = 'Utilizar SMS'
            Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.Items.Strings = (
              'Sim'
              'N'#227'o')
            Properties.Value = 'N'#227'o'
            ID = 39
            ParentID = -1
            Index = 8
            Version = 1
          end
          object SMSToken: TcxEditorRow
            Properties.Caption = 'Token da API'
            Properties.Value = Null
            ID = 40
            ParentID = 39
            Index = 0
            Version = 1
          end
          object SMSURL: TcxEditorRow
            Properties.Caption = 'URL API'
            Properties.Value = Null
            ID = 41
            ParentID = 39
            Index = 1
            Version = 1
          end
          object SMSIdentificador: TcxEditorRow
            Properties.Caption = 'Identificador do remetente'
            Properties.Value = Null
            ID = 42
            ParentID = 39
            Index = 2
            Version = 1
          end
          object SMSProvedor: TcxEditorRow
            Properties.Caption = 'Provedor'
            Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.Items.Strings = (
              'Zenvia')
            Properties.Value = Null
            ID = 43
            ParentID = 39
            Index = 3
            Version = 1
          end
          object utilizaapp: TcxEditorRow
            Expanded = False
            Properties.Caption = 'Utilizar APP de Venda'
            Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.Items.Strings = (
              'Sim'
              'N'#227'o')
            Properties.Value = 'N'#227'o'
            ID = 44
            ParentID = -1
            Index = 9
            Version = 1
          end
          object urlapiapp: TcxEditorRow
            Properties.Caption = 'URL API APP Venda'
            Properties.EditPropertiesClassName = 'TcxBlobEditProperties'
            Properties.EditProperties.BlobEditKind = bekMemo
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.PopupHeight = 180
            Properties.EditProperties.PopupWidth = 300
            Properties.Value = ''
            ID = 45
            ParentID = 44
            Index = 0
            Version = 1
          end
          object cxFinanceiro: TcxCategoryRow
            Properties.Caption = 'Configura'#231#227'o Financeiro'
            ID = 46
            ParentID = -1
            Index = 10
            Version = 1
          end
          object vendagerarlivrocaixa: TcxEditorRow
            Properties.Caption = 'Gerar livro caixa na venda'
            Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.Items.Strings = (
              'Sim'
              'N'#227'o')
            Properties.Value = 'N'#227'o'
            ID = 47
            ParentID = -1
            Index = 11
            Version = 1
          end
          object cxEstoque: TcxCategoryRow
            Properties.Caption = 'Configura'#231#227'o Estoque'
            ID = 48
            ParentID = -1
            Index = 12
            Version = 1
          end
          object moduloestoque: TcxEditorRow
            Properties.Caption = 'Utilizar Estoque'
            Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
            Properties.EditProperties.DropDownListStyle = lsFixedList
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.Items.Strings = (
              'Sim'
              'N'#227'o')
            Properties.Value = 'N'#227'o'
            ID = 49
            ParentID = -1
            Index = 13
            Version = 1
          end
        end
        object Memo1: TMemo
          Left = 322
          Top = 346
          Width = 300
          Height = 49
          Lines.Strings = (
            'Leia')
          TabOrder = 1
          Visible = False
        end
      end
      object TablivroCaixa: TcxTabSheet
        Caption = 'Livro Caixa'
        ImageIndex = 2
        object cxGroupBox3: TcxGroupBox
          Left = 0
          Top = 0
          Align = alClient
          PanelStyle.Active = True
          TabOrder = 0
          Height = 476
          Width = 636
          object Label25: TLabel
            Left = 3
            Top = 5
            Width = 141
            Height = 17
            Caption = 'Plano de Contas Vendas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5325111
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label26: TLabel
            Left = 3
            Top = 54
            Width = 152
            Height = 17
            Caption = 'Plano de Contas Compras'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5325111
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label27: TLabel
            Left = 3
            Top = 103
            Width = 258
            Height = 17
            Caption = 'Plano de Contas Lan'#231'amento Avulso Cr'#233'dito'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5325111
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label29: TLabel
            Left = 3
            Top = 152
            Width = 254
            Height = 17
            Caption = 'Plano de Contas Lan'#231'amento Avulso D'#233'bito'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5325111
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label30: TLabel
            Left = 3
            Top = 201
            Width = 211
            Height = 17
            Caption = 'Lan'#231'amento Avulso Centro de Custo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 5325111
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object edtPlanoVenda: TcxLookupComboBox
            Left = 3
            Top = 23
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.KeyFieldNames = 'id'
            Properties.ListColumns = <
              item
                Caption = 'C'#243'digo'
                Width = 64
                FieldName = 'codigo'
              end
              item
                Caption = 'Plano'
                Width = 100
                FieldName = 'descricao'
              end
              item
                Caption = 'SubPlano'
                Width = 100
                FieldName = 'nsubplano'
              end
              item
                Caption = 'Grupo Plano'
                Width = 100
                FieldName = 'ngrupoplano'
              end
              item
                Caption = 'Tipo Plano'
                Width = 50
                FieldName = 'ntipoplano'
              end>
            Properties.ListFieldIndex = 1
            Properties.ListSource = dsPlano
            EditValue = 0
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 0
            Width = 630
          end
          object edtPlanoCompra: TcxLookupComboBox
            Left = 3
            Top = 72
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.KeyFieldNames = 'id'
            Properties.ListColumns = <
              item
                Caption = 'C'#243'digo'
                Width = 64
                FieldName = 'codigo'
              end
              item
                Caption = 'Plano'
                Width = 100
                FieldName = 'descricao'
              end
              item
                Caption = 'SubPlano'
                Width = 100
                FieldName = 'nsubplano'
              end
              item
                Caption = 'Grupo Plano'
                Width = 100
                FieldName = 'ngrupoplano'
              end
              item
                Caption = 'Tipo Plano'
                Width = 50
                FieldName = 'ntipoplano'
              end>
            Properties.ListFieldIndex = 1
            Properties.ListSource = dsPlano
            EditValue = 0
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 1
            Width = 630
          end
          object edtPlanoAvulsoCredito: TcxLookupComboBox
            Left = 3
            Top = 121
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.KeyFieldNames = 'id'
            Properties.ListColumns = <
              item
                Caption = 'C'#243'digo'
                Width = 64
                FieldName = 'codigo'
              end
              item
                Caption = 'Plano'
                Width = 100
                FieldName = 'descricao'
              end
              item
                Caption = 'SubPlano'
                Width = 100
                FieldName = 'nsubplano'
              end
              item
                Caption = 'Grupo Plano'
                Width = 100
                FieldName = 'ngrupoplano'
              end
              item
                Caption = 'Tipo Plano'
                Width = 50
                FieldName = 'ntipoplano'
              end>
            Properties.ListFieldIndex = 1
            Properties.ListSource = dsPlano
            EditValue = 0
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 2
            Width = 630
          end
          object edtPlanoAvulsoDebito: TcxLookupComboBox
            Left = 3
            Top = 170
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.KeyFieldNames = 'id'
            Properties.ListColumns = <
              item
                Caption = 'C'#243'digo'
                Width = 64
                FieldName = 'codigo'
              end
              item
                Caption = 'Plano'
                Width = 100
                FieldName = 'descricao'
              end
              item
                Caption = 'SubPlano'
                Width = 100
                FieldName = 'nsubplano'
              end
              item
                Caption = 'Grupo Plano'
                Width = 100
                FieldName = 'ngrupoplano'
              end
              item
                Caption = 'Tipo Plano'
                Width = 50
                FieldName = 'ntipoplano'
              end>
            Properties.ListFieldIndex = 1
            Properties.ListSource = dsPlano
            EditValue = 0
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 3
            Width = 630
          end
          object edtCusto: TcxLookupComboBox
            Left = 3
            Top = 219
            Properties.CharCase = ecUpperCase
            Properties.ClearKey = 16452
            Properties.KeyFieldNames = 'id'
            Properties.ListColumns = <
              item
                Caption = 'C'#243'digo'
                Width = 65
                FieldName = 'codigo'
              end
              item
                Caption = 'Centro de Custo'
                Width = 250
                FieldName = 'descricao'
              end>
            Properties.ListFieldIndex = 1
            Properties.ListSource = dsCusto
            EditValue = 0
            StyleFocused.BorderColor = clNavy
            StyleFocused.Color = 15855596
            TabOrder = 4
            Width = 630
          end
        end
      end
    end
  end
  inherited Paneltitulo: TPanel
    TabOrder = 2
  end
  inherited Ds: TUniDataSource
    Left = 560
  end
  inherited cxStyle: TcxStyleRepository
    Left = 359
    Top = 519
    PixelsPerInch = 96
    object cxStyle7: TcxStyle [29]
      AssignedValues = [svColor]
      Color = 15395562
    end
    object cxStyle23: TcxStyle [30]
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13002291
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle24: TcxStyle [31]
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      TextColor = clMaroon
    end
    object cxStyle25: TcxStyle [32]
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15395562
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle26: TcxStyle [33]
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12171705
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle27: TcxStyle [34]
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 185
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    inherited CxGridPedido: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    inherited GridTableDependente: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    object VerticalGrid: TcxVerticalGridStyleSheet
      Caption = 'Red, White, and Blue (VGA)'
      Styles.Background = cxStyle7
      Styles.Content = cxStyle24
      Styles.Inactive = cxStyle26
      Styles.Selection = cxStyle27
      Styles.Category = cxStyle23
      Styles.Header = cxStyle25
      BuiltIn = True
    end
  end
  object OpenDialog: TOpenDialog
    Title = 'Local'
    Left = 480
  end
  object ACBrNFe1: TACBrNFe
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormaEmissao = teContingencia
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.VersaoDF = ve200
    Configuracoes.Geral.AtualizarXMLCancelado = True
    Configuracoes.Geral.VersaoQRCode = veqr000
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 15000
    Configuracoes.WebServices.AjustaAguardaConsultaRet = True
    Configuracoes.WebServices.TimeOut = 20000
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    Left = 442
    Top = 65535
  end
  object dsCusto: TDataSource
    DataSet = DM.TabCusto
    Left = 272
    Top = 488
  end
  object dsPlano: TDataSource
    DataSet = DM.TabPlanoConta
    Left = 272
    Top = 536
  end
  object dsmensagem: TUniDataSource
    DataSet = TabMensagem
    Left = 160
    Top = 480
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
    Left = 104
    Top = 480
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
end
