inherited FrmImportacaoxml: TFrmImportacaoxml
  Caption = 'Importa'#231#227'o XML'
  ClientWidth = 818
  ExplicitWidth = 818
  TextHeight = 17
  inherited PanelButton: TPanel
    Width = 812
    ExplicitTop = 572
    ExplicitWidth = 812
  end
  inherited PanelClient: TPanel
    Width = 818
    ExplicitWidth = 818
    ExplicitHeight = 529
    inherited dxBevel1: TdxBevel
      Width = 812
      ExplicitLeft = 43
      ExplicitTop = -13
      ExplicitWidth = 812
      ExplicitHeight = 523
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 8
      Width = 75
      Height = 17
      Caption = 'Arquivo XML'
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
    object Label2: TLabel [2]
      Left = 208
      Top = 200
      Width = 67
      Height = 17
      Caption = 'Fornecedor'
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
    object Label3: TLabel [3]
      Left = 392
      Top = 200
      Width = 29
      Height = 17
      Caption = 'CNPJ'
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
      Left = 392
      Top = 280
      Width = 104
      Height = 17
      Caption = 'Inscri'#231#227'o Estadual'
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
    object Label5: TLabel [5]
      Left = 392
      Top = 328
      Width = 15
      Height = 17
      Caption = 'UF'
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
    object Label6: TLabel [6]
      Left = 376
      Top = 368
      Width = 134
      Height = 17
      Caption = 'Natureza da Opera'#231#227'o'
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
    object Label7: TLabel [7]
      Left = 564
      Top = 368
      Width = 95
      Height = 17
      Caption = 'Situa'#231#227'o da NFe'
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
    object Label8: TLabel [8]
      Left = 401
      Top = 400
      Width = 57
      Height = 17
      Caption = 'Protocolo'
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
    object Label9: TLabel [9]
      Left = 521
      Top = 400
      Width = 99
      Height = 17
      Caption = 'Chave de Acesso'
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
    object Label10: TLabel [10]
      Left = 397
      Top = 423
      Width = 98
      Height = 17
      Caption = 'Data de Emiss'#227'o'
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
    object Label11: TLabel [11]
      Left = 521
      Top = 423
      Width = 95
      Height = 17
      Caption = 'Data de Entrada'
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
    object Label12: TLabel [12]
      Left = 525
      Top = 446
      Width = 126
      Height = 17
      Caption = 'Forma de Pagamento'
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
    object Label13: TLabel [13]
      Left = 453
      Top = 469
      Width = 76
      Height = 17
      Caption = 'Observa'#231#245'es'
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
    inherited BtnSalvar: TStyledBitBtn
      Left = 588
      Top = 483
      ExplicitLeft = 588
      ExplicitTop = 483
    end
    inherited BtnCancelar: TStyledBitBtn
      Left = 699
      Top = 483
      ExplicitLeft = 699
      ExplicitTop = 483
    end
    object edtnfepathresposta: TcxButtonEdit
      Left = 8
      Top = 26
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
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 2
      Visible = False
      Width = 369
    end
  end
  inherited Paneltitulo: TPanel
    Width = 812
    ExplicitWidth = 812
    inherited lblTitulo: TLabel
      Width = 757
      ExplicitWidth = 757
    end
    inherited BtnFechar: TSpeedButton
      Left = 772
      ExplicitLeft = 772
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 616
    Top = 2
  end
  inherited Ds: TUniDataSource
    Left = 584
    Top = 0
  end
  inherited cxStyle: TcxStyleRepository
    Left = 551
    Top = 65535
    PixelsPerInch = 96
    inherited CxGridPedido: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    inherited GridTableDependente: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
end
