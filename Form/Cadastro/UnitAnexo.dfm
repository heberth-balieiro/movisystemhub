inherited FrmAnexo: TFrmAnexo
  Caption = 'Anexo'
  ClientHeight = 471
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitHeight = 471
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 443
    ExplicitTop = 443
  end
  inherited PanelClient: TPanel
    Height = 400
    ExplicitHeight = 400
    inherited dxBevel1: TdxBevel
      Height = 394
      ExplicitHeight = 394
    end
    object Label1: TLabel [1]
      Left = 5
      Top = 10
      Width = 49
      Height = 17
      Caption = 'Registro'
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
    object Label3: TLabel [2]
      Left = 77
      Top = 10
      Width = 44
      Height = 17
      Caption = 'Origem'
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
    object Label2: TLabel [3]
      Left = 5
      Top = 59
      Width = 45
      Height = 17
      Caption = 'Arquivo'
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
    object Label59: TLabel [4]
      Left = 5
      Top = 108
      Width = 55
      Height = 17
      Caption = 'Anota'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    inherited BtnSalvar: TStyledBitBtn
      Left = 430
      Top = 157
      Width = 70
      Height = 27
      Caption = 'Incluir'
      TabOrder = 2
      OnClick = BtnSalvarClick
      ExplicitLeft = 430
      ExplicitTop = 157
      ExplicitWidth = 70
      ExplicitHeight = 27
    end
    inherited BtnCancelar: TStyledBitBtn
      Left = 572
      Top = 157
      Width = 70
      Height = 27
      Caption = 'Excluir'
      TabOrder = 4
      OnClick = BtnCancelarClick
      ExplicitLeft = 572
      ExplicitTop = 157
      ExplicitWidth = 70
      ExplicitHeight = 27
    end
    object cxCodigo: TcxTextEdit
      Left = 5
      Top = 28
      TabStop = False
      Properties.ReadOnly = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 0
      OnKeyPress = cxCodigoKeyPress
      Width = 73
    end
    object cxNome: TcxTextEdit
      Left = 77
      Top = 28
      Cursor = crIBeam
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.ReadOnly = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 1
      Width = 565
    end
    object Btneditar: TStyledBitBtn
      Left = 501
      Top = 157
      Width = 70
      Height = 27
      Caption = 'Visualizar'
      TabOrder = 3
      OnClick = BtneditarClick
      StyleFamily = 'Bootstrap'
      StyleClass = 'Secondary'
    end
    object cxGrid: TcxGrid
      Left = 5
      Top = 190
      Width = 640
      Height = 205
      TabOrder = 5
      object Grid: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        OnCellClick = GridCellClick
        DataController.DataSource = Ds
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
        OptionsData.Inserting = False
        OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o>'
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 25
        OptionsView.Indicator = True
        Styles.StyleSheet = FrmPrincipalNew.CxGridPedido
        object GridRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
        end
        object Gridid_secretaria: TcxGridDBColumn
          DataBinding.FieldName = 'id_secretaria'
          Visible = False
          Width = 47
        end
        object Gridcodigo: TcxGridDBColumn
          Caption = 'Nome do Arquivo'
          DataBinding.FieldName = 'nome_original'
          Options.Editing = False
          Width = 147
        end
        object Gridrazao: TcxGridDBColumn
          Caption = 'Tipo'
          DataBinding.FieldName = 'tipo_arquivo'
          Options.Editing = False
          Width = 102
        end
        object GridColumn1: TcxGridDBColumn
          Caption = 'Ext'
          DataBinding.FieldName = 'extensao'
          Options.Editing = False
          Width = 47
        end
        object Gridativo: TcxGridDBColumn
          Caption = 'Data'
          DataBinding.FieldName = 'datainclusao'
          Options.Editing = False
          Width = 112
        end
        object GridColumn2: TcxGridDBColumn
          Caption = 'Usu'#225'rio'
          DataBinding.FieldName = 'nome'
          Options.Editing = False
          Width = 108
        end
        object GridColumn3: TcxGridDBColumn
          Caption = 'Observa'#231#227'o'
          DataBinding.FieldName = 'observacao'
          PropertiesClassName = 'TcxBlobEditProperties'
          Properties.BlobEditKind = bekMemo
          Properties.MemoScrollBars = ssVertical
          Properties.PopupHeight = 150
          Properties.PopupWidth = 160
          Properties.ReadOnly = True
          Options.ShowEditButtons = isebAlways
          Width = 110
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = Grid
      end
    end
    object cxarquivo: TcxButtonEdit
      Left = 5
      Top = 77
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
      Properties.OnButtonClick = cxarquivoPropertiesButtonClick
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 6
      Width = 637
    end
    object cxobs: TcxBlobEdit
      Left = 5
      Top = 126
      Properties.BlobEditKind = bekMemo
      Properties.ClearKey = 16452
      Properties.MemoCharCase = ecUpperCase
      Properties.MemoMaxLength = 250
      Properties.PopupHeight = 185
      Properties.PopupWidth = 632
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 7
      Width = 637
    end
  end
  inherited Paneltitulo: TPanel
    inherited lblTitulo: TLabel
      Caption = 'Anexo'
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 432
    Top = 418
  end
  inherited Ds: TUniDataSource
    DataSet = mdSituacao
    Left = 400
    Top = 416
  end
  inherited cxStyle: TcxStyleRepository
    Left = 367
    Top = 415
    PixelsPerInch = 96
    inherited CxGridPedido: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    inherited GridTableDependente: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
  object mdSituacao: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 8
    Top = 196
    object mdSituacaoid_anexo: TIntegerField
      FieldName = 'id_anexo'
    end
    object mdSituacaonome_original: TStringField
      FieldName = 'nome_original'
      Size = 60
    end
    object mdSituacaoextensao: TStringField
      FieldName = 'extensao'
      Size = 10
    end
    object mdSituacaotipo_arquivo: TStringField
      FieldName = 'tipo_arquivo'
      Size = 10
    end
    object mdSituacaoobservacao: TStringField
      FieldName = 'observacao'
      Size = 255
    end
    object mdSituacaodatainclusao: TDateField
      FieldName = 'datainclusao'
    end
    object mdSituacaonome: TStringField
      FieldName = 'nome'
      Size = 60
    end
  end
end
