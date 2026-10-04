inherited FrmProdutoEntrada: TFrmProdutoEntrada
  Caption = 'Entrada de Produtos'
  ClientHeight = 481
  ClientWidth = 850
  KeyPreview = True
  OnShow = FormShow
  ExplicitWidth = 850
  ExplicitHeight = 481
  TextHeight = 17
  inherited Label27: TLabel
    Visible = False
  end
  object Label7: TLabel [1]
    Left = 8
    Top = 433
    Width = 135
    Height = 17
    Caption = 'F2 - Pesquisa produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel [2]
    Left = 8
    Top = 456
    Width = 122
    Height = 17
    Caption = 'F4 - Excluir produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel [3]
    Left = 168
    Top = 433
    Width = 135
    Height = 17
    Caption = 'F6 - Cadastro produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [4]
    Left = 168
    Top = 456
    Width = 127
    Height = 17
    Caption = 'Ctrl+D - Limpar lista'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Panel2: TPanel
    Left = 731
    Top = 433
    ExplicitLeft = 731
    ExplicitTop = 433
  end
  inherited Panel1: TPanel
    Left = 609
    Top = 433
    ExplicitLeft = 609
    ExplicitTop = 433
  end
  inherited Paneltitulo: TPanel
    Width = 850
    ExplicitWidth = 850
    inherited lblTitulo: TLabel
      Width = 835
      Caption = 'Entrada de produtos'
      ExplicitWidth = 835
    end
  end
  inherited cxGroupBox1: TcxGroupBox
    ExplicitWidth = 850
    ExplicitHeight = 377
    Height = 377
    Width = 850
    inherited Label1: TLabel
      Visible = False
    end
    inherited Label4: TLabel
      Left = 3
      Top = 29
      Width = 57
      Caption = 'Descri'#231#227'o'
      Visible = False
      ExplicitLeft = 3
      ExplicitTop = 29
      ExplicitWidth = 57
    end
    inherited edtcodigo: TcxTextEdit
      Visible = False
      ExplicitHeight = 25
    end
    inherited edtDescricao: TcxTextEdit
      Left = 15
      Visible = False
      ExplicitLeft = 15
      ExplicitWidth = 66
      ExplicitHeight = 25
      Width = 66
    end
    inherited edtativo: TcxCheckBox
      Left = 15
      Top = 29
      Visible = False
      ExplicitLeft = 15
      ExplicitTop = 29
      ExplicitWidth = 52
    end
    object cxGrid: TcxGrid
      Left = 4
      Top = 249
      Width = 842
      Height = 124
      Align = alBottom
      TabOrder = 3
      object cxGridDB: TcxGridDBTableView
        PopupMenu = Pop
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = dsEntrada
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            FieldName = 'id_produto'
            Column = coll1
          end
          item
            Kind = skSum
            FieldName = 'qtde_nova'
            Column = coll3
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.NoDataToDisplayInfoText = 'Lista vazia'
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = GridProduto
        object ordem: TcxGridDBColumn
          DataBinding.FieldName = 'ordemprod'
          Visible = False
          SortIndex = 0
          SortOrder = soDescending
        end
        object coll1: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'codigo'
          Width = 51
        end
        object coll2: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'descricao'
          Width = 356
        end
        object coll5: TcxGridDBColumn
          Caption = 'Prc. Compra'
          DataBinding.FieldName = 'prc_compra'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Width = 88
        end
        object cxGridDBColumn3: TcxGridDBColumn
          Caption = 'Prc. Venda'
          DataBinding.FieldName = 'prc_venda'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Width = 80
        end
        object coll3: TcxGridDBColumn
          Caption = 'Qtde Nova'
          DataBinding.FieldName = 'qtde_nova'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '0.00;-0.00'
          Width = 77
        end
        object cxGridDBColumn4: TcxGridDBColumn
          Caption = 'Estoque Atual'
          DataBinding.FieldName = 'qtde_anterior'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '0.00;-0.00'
          Width = 102
        end
        object cxGridDBColumn5: TcxGridDBColumn
          Caption = 'Estoque Final'
          DataBinding.FieldName = 'qtdefinal'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '0.00;-0.00'
          Width = 90
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDB
      end
    end
    object Panel3: TPanel
      Left = 4
      Top = 4
      Width = 842
      Height = 60
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 4
      object cxGroupBox11: TcxGroupBox
        Left = 0
        Top = 0
        Align = alClient
        Caption = 'Pesquisa Produto - //C'#243'digo, **Barra, --Referencia'
        PanelStyle.OfficeBackgroundKind = pobkStyleColor
        Style.BorderColor = clNone
        Style.BorderStyle = ebsNone
        Style.TextStyle = [fsBold]
        Style.TransparentBorder = False
        TabOrder = 0
        Transparent = True
        Height = 60
        Width = 842
        object edtPesquisa: TcxTextEdit
          Left = 0
          Top = 17
          Align = alClient
          AutoSize = False
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 16452
          Properties.OnChange = edtPesquisaPropertiesChange
          Style.BorderStyle = ebsNone
          Style.Color = 16771279
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = 4144959
          Style.Font.Height = -24
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = [fsBold]
          Style.TransparentBorder = False
          Style.IsFontAssigned = True
          TabOrder = 0
          OnKeyPress = edtPesquisaKeyPress
          Height = 31
          Width = 842
        end
      end
    end
    object cxGridLista: TcxGrid
      Left = 4
      Top = 64
      Width = 842
      Height = 185
      Align = alClient
      BorderStyle = cxcbsNone
      TabOrder = 5
      object cxGridDBTableView1: TcxGridDBTableView
        OnKeyDown = cxGridDBTableView1KeyDown
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        OnCellDblClick = cxGridDBTableView1CellDblClick
        DataController.DataSource = dsListaProduto
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            FieldName = 'id_produto'
            Column = cxGridDBColumn1
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.NoDataToDisplayInfoText = 'Nenhum registro encontrado'
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = FrmPrincipal.CxGridPedido
        object idproduto: TcxGridDBColumn
          DataBinding.FieldName = 'id_produto'
          Visible = False
        end
        object cxGridDBColumn1: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'codigo'
          Width = 51
        end
        object cxGridDBColumn2: TcxGridDBColumn
          Caption = 'C'#243'd. Barra'
          DataBinding.FieldName = 'cod_barras'
          Width = 78
        end
        object cxGridDBTableView1Column1: TcxGridDBColumn
          Caption = 'Refer'#234'ncia'
          DataBinding.FieldName = 'referencia'
          Width = 88
        end
        object cxGridDBTableView1Column2: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'descricao'
          Width = 225
        end
        object cxGridDBTableView1Column3: TcxGridDBColumn
          Caption = 'Marca'
          DataBinding.FieldName = 'marca'
          Width = 118
        end
        object cxGridDBTableView1Column4: TcxGridDBColumn
          Caption = 'Grupo'
          DataBinding.FieldName = 'grupo'
          Width = 98
        end
        object cxGridDBTableView1Column5: TcxGridDBColumn
          Caption = 'Estoque'
          DataBinding.FieldName = 'estoque_atual'
          Styles.Content = FrmPrincipal.cxColunaPedido
          Width = 62
        end
        object cxGridDBTableView1Column6: TcxGridDBColumn
          Caption = 'Uni'
          DataBinding.FieldName = 'uni'
          Width = 32
        end
        object cxGridDBTableView1Column8: TcxGridDBColumn
          Caption = 'Prc. Venda'
          DataBinding.FieldName = 'prc_venda'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Styles.Content = FrmPrincipal.cxColunaPedido
          Width = 94
        end
      end
      object cxGridLevel2: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
  end
  object edtObs: TcxMemo [9]
    Left = 312
    Top = 431
    Properties.CharCase = ecUpperCase
    Properties.ClearKey = 16452
    Properties.MaxLength = 250
    TabOrder = 4
    Height = 42
    Width = 291
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 808
    Top = 10
  end
  object Pop: TPopupMenu
    Left = 656
    Top = 10
    object btnexcluir: TMenuItem
      Caption = 'Excluir'
      ShortCut = 115
      OnClick = btnexcluirClick
    end
    object btnLimpar: TMenuItem
      Caption = 'Limpar Lista'
      ShortCut = 16452
      OnClick = btnLimparClick
    end
  end
  object dsListaProduto: TUniDataSource
    DataSet = DM.TabProdutoPedido
    Left = 692
    Top = 11
  end
  object dsEntrada: TDataSource
    DataSet = DM.EntradaProduto
    Left = 544
  end
  object cxStyleGridProd: TcxStyleRepository
    Left = 768
    Top = 8
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15136253
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7346457
      Font.Height = -12
      Font.Name = 'Arial Narrow'
      Font.Style = []
      TextColor = 7346457
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16436871
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 8036607
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8894686
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12180223
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 1262987
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8894686
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8894686
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object GridProduto: TcxGridTableViewStyleSheet
      Caption = 'UserFormat1'
      Styles.Content = cxStyle1
      Styles.ContentEven = cxStyle2
      Styles.ContentOdd = cxStyle3
      Styles.Footer = cxStyle4
      Styles.Group = cxStyle5
      Styles.GroupByBox = cxStyle6
      Styles.Header = cxStyle7
      Styles.Inactive = cxStyle8
      Styles.Indicator = cxStyle9
      Styles.Preview = cxStyle10
      Styles.Selection = cxStyle11
      BuiltIn = True
    end
  end
  object frxDBEstoqueEntrada: TfrxDBDataset
    UserName = 'frxDBEstoqueEntrada'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id_produto=id_produto'
      'qtde_anterior=qtde_anterior'
      'prc_compra=prc_compra'
      'prc_venda=prc_venda'
      'qtde_nova=qtde_nova'
      'codigo=codigo'
      'descricao=descricao'
      'und=und'
      'qtdefinal=qtdefinal'
      'ordemprod=ordemprod')
    DataSet = DM.EntradaProduto
    BCDToCurrency = False
    DataSetOptions = []
    Left = 568
    Top = 330
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
    ReportOptions.CreateDate = 44209.307053020800000000
    ReportOptions.LastChange = 45619.435603125000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'var'
      'PNG:String;'
      'begin'
      '        PNG:=<wLogo>; //receber foto da carteirinha'
      '         if PNG <> '#39#39' then //verifica se e diferente de vazio'
      '         nlogo.Picture.LoadFromFile(PNG);//carrega na tela'
      ''
      '  nrazao.Text          := <nfantasia>+'#39' | '#39'+<ncnpj>;'
      '  ncontatos.Text       := <nemail>+'#39' - '#39'+ <ntelefone>;'
      
        '  nendereco.Text       := <nendereco>+'#39', '#39'+<nnumero>+'#39' - '#39'+<nbai' +
        'rro>+'#39' | '#39'+<ncep>+'#39' - '#39'+<ncidade>;'
      ''
      ''
      ''
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 448
    Top = 328
    Datasets = <
      item
        DataSet = frxDBEstoqueEntrada
        DataSetName = 'frxDBEstoqueEntrada'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'nrazao'
        Value = Null
      end
      item
        Name = 'nfantasia'
        Value = Null
      end
      item
        Name = 'nendereco'
        Value = Null
      end
      item
        Name = 'nnumero'
        Value = Null
      end
      item
        Name = 'nbairro'
        Value = Null
      end
      item
        Name = 'ncep'
        Value = Null
      end
      item
        Name = 'ntelefone'
        Value = Null
      end
      item
        Name = 'nfone1'
        Value = Null
      end
      item
        Name = 'nfone2'
        Value = Null
      end
      item
        Name = 'nemail'
        Value = Null
      end
      item
        Name = 'ncnpj'
        Value = Null
      end
      item
        Name = 'nie'
        Value = Null
      end
      item
        Name = 'wlogo'
        Value = Null
      end
      item
        Name = 'ncidade'
        Value = Null
      end
      item
        Name = 'filtro'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      OnBeforePrint = 'Page1OnBeforePrint'
      object Heade: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 181.417440000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object nlogo: TfrxPictureView
          AllowVectorExport = True
          ShiftMode = smDontShift
          Left = 1.779530000000000000
          Width = 221.267780000000000000
          Height = 131.338590000000000000
          Center = True
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Top = 135.992270000000000000
          Width = 755.905536220000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Picture3: TfrxPictureView
          AllowVectorExport = True
          Left = 721.890230000000000000
          Width = 32.000000000000000000
          Height = 32.000000000000000000
          AutoSize = True
          Frame.Typ = []
          Picture.Data = {
            07544269746D617036100000424D361000000000000036000000280000002000
            0000200000000100200000000000001000000000000000000000000000000000
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFF3F1F0FFC8BFBAFFA4958CFF89766AFF776254FF735D
            4FFF735D4FFF776254FF89766AFFA4958CFFC8BFBAFFF3F2F0FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFE5E0DEFFA2938AFF755F51FF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF755F51FFA2938AFFE5E0
            DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6F5FFAA9D
            94FF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFFAA9D94FFF7F6F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E2DFFF857266FF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF857266FFE6E2DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED9D6FF7A6658FF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF918075FFBAAFA8FFD8D2CEFFEDEAE9FFF6F5
            F4FFF6F5F4FFEEEBE9FFD8D2CEFFBBB0A9FF928176FF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF7A6658FFDFD9D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E2DFFF7A6658FF735D4FFF735D4FFF735D
            4FFF776254FFAFA39BFFECE9E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE9E7FFAFA39BFF7762
            54FF735D4FFF735D4FFF735D4FFF7A6658FFE6E2DFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFF7F6F5FF857266FF735D4FFF735D4FFF735D4FFF9584
            7AFFECE9E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE9
            E7FF95847AFF735D4FFF735D4FFF735D4FFF857266FFF7F6F5FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFAA9D94FF735D4FFF735D4FFF735D4FFFA89A91FFFDFD
            FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFDFDFCFFA89A91FF735D4FFF735D4FFF735D4FFFAA9D94FFFFFFFFFFFFFF
            FFFFFFFFFFFFE5E0DEFF735D4FFF735D4FFF735D4FFF735D4FFF7A6558FFA597
            8EFFCFC7C3FFF6F5F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F5F4FFCFC7
            C3FFA5978EFF7A6558FF735D4FFF735D4FFF735D4FFF735D4FFFE5E0DEFFFFFF
            FFFFFFFFFFFFA2938AFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF776254FFAC9F97FFF5F3F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F3F2FFAC9F97FF776254FF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFFA2938AFFFFFF
            FFFFF3F1F0FF755F51FF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF877468FFF4F2F1FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F2F1FF877468FF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF755F51FFF3F2
            F0FFC8BFBAFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFFAC9F97FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFAC9F97FF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFFC8BF
            BAFFA4958CFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF8B796DFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF99897FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFFA495
            8CFF89766AFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF7C675AFFE9E5E3FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F5F4FF8B786DFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF8976
            6AFF786256FF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFFCEC7C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E5E2FF766153FF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF7762
            54FF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF928176FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A39CFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFFD3CCC8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFECEBFF745E50FF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF786256FF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFFA09288FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2948AFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF7762
            54FF89766AFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF745E51FFEEECEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEECEAFF745E
            51FF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF8976
            6AFFA4958CFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF837064FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8370
            64FF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFFA495
            8CFFC8BFBAFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF745E50FFDAD5D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E1DFFF745E
            50FF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFFC8BF
            BAFFF3F1F0FF756152FF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFFA99C93FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7BEB8FF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF755F51FFF3F1
            F0FFFFFFFFFFA2938AFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF8E7D72FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADA097FF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFFA2938AFFFFFF
            FFFFFFFFFFFFE5E0DEFF755F50FF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF745E50FFECEAE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFF826E62FF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFFE5E0DEFFFFFF
            FFFFFFFFFFFFFFFFFFFFAA9D94FF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFFAA9D95FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8C0BAFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFFAA9D94FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFF7F6F5FF857266FF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF745E50FFD7D0CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEAE8FF7C685BFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF857266FFF7F6F5FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E2DFFF7A6658FF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF786355FFD4CECAFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E3E1FF857266FF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF7A6658FFE6E2DFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED9D6FF7A6658FF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFFA19289FFD8D2CEFFF3F1
            F0FFF5F3F2FFDFDAD7FFAFA29AFF766153FF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF7A6658FFDED9D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E2DFFF857266FF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF857266FFE6E2DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6F5FFAA9D
            94FF755F50FF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFFAA9D94FFF7F6F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFE5E0DEFFA2938AFF756152FF735D4FFF735D4FFF735D4FFF735D4FFF735D
            4FFF735D4FFF735D4FFF735D4FFF735D4FFF735D4FFF755F51FFA2938AFFE5E0
            DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFF3F1F0FFC8BFBAFFA4958CFF89766AFF786256FF735D
            4FFF735D4FFF786256FF89766AFFA4958CFFC8BFBAFFF3F1F0FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Picture4: TfrxPictureView
          AllowVectorExport = True
          Left = 721.890230000000000000
          Top = 37.795300000000000000
          Width = 32.000000000000000000
          Height = 32.000000000000000000
          AutoSize = True
          Frame.Typ = []
          Picture.Data = {
            07544269746D617036100000424D361000000000000036000000280000002000
            0000200000000100200000000000001000000000000000000000000000000000
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFCF9F4FFEEE1C9FFE2CDA6FFDBBE8DFFD5B57BFFD4B3
            77FFD4B377FFD5B57BFFDBBE8DFFE2CDA6FFEEE1C9FFFCF9F4FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFF7F1E5FFE2CCA5FFD4B479FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B479FFE2CCA5FFF7F1
            E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBF7FFE4D0
            ADFFD3B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD3B3
            77FFE4D0ADFFFDFBF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F1E6FFD9BC88FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD9BC88FFF7F1E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EDDFFFD6B77FFFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD6B77FFFF5EEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F1E6FFD6B77FFFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD6B77FFFF7F1E6FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFDFBF7FFD9BC88FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD9BC88FFFDFBF8FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFE4D0ADFFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD0B075FFC4A56FFFB99C6AFFB09566FFC1A36EFFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFE4D0ADFFFFFFFFFFFFFF
            FFFFFFFFFFFFF7F1E5FFD3B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD0AF75FFBEA16CFFB79E73FFD2C3A9FFEBE4D8FFFCFCFAFFD7CAB3FFC8A9
            71FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD3B377FFF7F1E5FFFFFF
            FFFFFFFFFFFFE2CCA4FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD3B276FFC4A5
            6FFFBAA177FFDED3C0FFFDFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1BD
            9BFFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFE2CCA5FFFFFF
            FFFFFCF9F4FFD4B479FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD2B176FFBB9F6CFFD2C2
            A8FFFBFAF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE9
            DFFFD3B276FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B479FFFCF9
            F4FFEEE1C9FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD2B176FFBB9F6FFFE5DDCEFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFD
            FCFFD4B378FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFEEE1
            C9FFE2CDA6FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD3B276FFBDA271FFEDE7DCFFFFFFFFFFFFFF
            FFFFFFFFFFFFF7F1E7FFFCFAF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9D9
            BBFFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFE2CD
            A6FFDBBE8BFFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFC1A470FFE9E2D5FFFFFFFFFFFFFFFFFFFDFC
            FAFFE6D3B0FFD4B378FFD7B881FFF0E6D2FFFFFFFFFFFAF7F1FFE4D0ABFFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFDBBE
            8DFFD6B67BFFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFCBAB72FFDACEB9FFFFFFFFFFFFFFFFFFFCFAF7FFDDC4
            95FFD4B377FFD4B377FFD4B377FFD4B377FFDCC191FFD4B479FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD5B5
            7BFFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD3B276FFC9B48EFFFEFEFEFFFFFFFFFFFEFDFBFFDEC496FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFC6A872FFF2EDE5FFFFFFFFFFFFFFFFFFE8D6B6FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD6B67BFFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD3B276FFD4C3A5FFFFFFFFFFFFFFFFFFFBF9F7FFCAAC75FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD5B5
            7BFFDBBE8BFFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFC9AA73FFF4F0EAFFFFFFFFFFFFFFFFFFFFFFFFFFCAB794FFCFAF74FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFDBBE
            8DFFE2CDA6FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD3BF9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F6F2FFCCB282FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFE2CD
            A6FFEEE1C9FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD3B2
            76FFE7DFD0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8D6B7FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFEEE1
            C9FFFCF9F4FFD4B579FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            78FFFDFCFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCC293FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B479FFFCF9
            F4FFFFFFFFFFE2CCA4FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFEEE0C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDDFC6FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFE2CCA5FFFFFF
            FFFFFFFFFFFFF7F1E5FFD5B479FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B378FFE6D3B0FFF7F2E8FFFDFCFBFFE8D8B9FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD3B377FFF7F1E5FFFFFF
            FFFFFFFFFFFFFFFFFFFFE4D0ADFFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFE4D0ADFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFDFBF7FFD9BC88FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD9BC88FFFDFBF7FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F1E6FFD6B77FFFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD6B77FFFF7F1E6FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EDDFFFD6B77FFFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD6B77FFFF5EDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F1E6FFD9BC88FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD9BC88FFF7F1E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBF7FFE4D0
            ADFFD5B479FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD3B3
            77FFE4D0ADFFFDFBF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFF7F1E5FFE2CCA4FFD4B579FFD4B377FFD4B377FFD4B377FFD4B377FFD4B3
            77FFD4B377FFD4B377FFD4B377FFD4B377FFD4B377FFD4B479FFE2CCA4FFF7F1
            E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFCF9F4FFEEE1C9FFE2CDA6FFDBBE8BFFD6B67BFFD4B3
            77FFD4B377FFD6B67BFFDBBE8BFFE2CDA6FFEEE1C9FFFCF9F4FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Picture2: TfrxPictureView
          AllowVectorExport = True
          Left = 721.890230000000000000
          Top = 76.590600000000000000
          Width = 32.000000000000000000
          Height = 32.000000000000000000
          AutoSize = True
          Frame.Typ = []
          Picture.Data = {
            07544269746D617036100000424D361000000000000036000000280000002000
            0000200000000100200000000000001000000000000000000000000000000000
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFF9FAF4FFE0E7C9FFCBD7A6FFBCCB8BFFB1C37AFFAFC2
            76FFAFC276FFB1C37AFFBCCB8BFFCBD7A6FFE0E7C9FFF9FAF4FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFF0F4E5FFCAD6A4FFB0C278FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFB0C278FFCAD6A4FFF0F4
            E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFCF7FFCFDA
            ACFFAFC176FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC1
            76FFCFDAACFFFBFCF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F4E6FFB9C987FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFB9C987FFF1F4E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDF1DFFFB3C57DFFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFACBF74FF9AAA
            69FF9AAA69FFACBE74FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFB3C57DFFEDF1DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F4E6FFB3C57DFFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFA9BB72FF9EAC73FFDFE4
            D3FFE0E4D4FF9FAD76FFA8BA72FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFB3C57DFFF1F4E6FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFBFCF7FFB9C987FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFA6B870FFA9B585FFF3F5EEFFFFFF
            FFFFFFFFFFFFF4F6F0FFABB788FFA5B770FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFB9C987FFFBFCF7FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFCDDAACFFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFA6B870FFB2BD92FFFAFBF9FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFCFCFAFFB5BF97FFA5B770FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFCFDAACFFFFFFFFFFFFFF
            FFFFFFFFFFFFF0F4E5FFAFC176FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFA9BB72FFB3BD92FFFCFCFBFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFB6C097FFA8BA72FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC176FFF0F4E5FFFFFF
            FFFFFFFFFFFFCAD6A4FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFADBF74FFABB786FFFAFBF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFBFFADB98AFFACBF74FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFCAD6A4FFFFFF
            FFFFF9FAF4FFB0C278FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFA4B375FFF2F4ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F6F0FFA4B377FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFB0C278FFF9FA
            F4FFE0E7C9FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFA9BB72FFD6DBC5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9DFCAFFA8BA
            72FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFE0E7
            C9FFCBD7A5FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFB2BF8AFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2BF
            8BFFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFCBD7
            A6FFBACB8BFFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFADBF
            74FFDBE0CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDE2
            CFFFACBF74FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFBCCB
            8BFFB1C47AFFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFADBE
            7AFFFCFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F7EDFFCAD6A5FFB5C7
            81FFB5C781FFCAD6A5FFF4F7EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFD
            FCFFADBE7BFFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFB1C3
            7AFFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFC2CE
            9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F7EDFFB5C681FFAFC276FFAFC2
            76FFAFC276FFAFC276FFB5C681FFF4F7EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFC2CF9DFFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFD3DD
            B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAD7A5FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFCAD6A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFD4DDB6FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFB1C47AFFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFD6E0
            BAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5C681FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFB5C681FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFD7E1BCFFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFB1C3
            7AFFBACB8BFFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFD5DF
            B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEBE7DFFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAEBE7DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFD5DFB7FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFBCCB
            8BFFCBD7A5FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFC7D4
            A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBC59CFFACBF74FFAFC276FFAFC2
            76FFAFC276FFAFC276FFACBF74FFBBC59CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFC8D5A0FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFCBD7
            A6FFE0E7C9FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFB3C5
            7EFFFBFCF9FFFFFFFFFFFFFFFFFFFFFFFFFFF1F3EBFF9EAC73FFA4B670FFACBF
            74FFACBF74FFA4B670FF9EAC73FFF1F3EBFFFFFFFFFFFFFFFFFFFFFFFFFFFBFC
            F9FFB3C57EFFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFE0E7
            C9FFF9FAF4FFB1C378FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFDCE5C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F3EBFFB7C199FF9BA9
            72FF9BA972FFB7C199FFF1F3EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCE5
            C4FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFB0C278FFF9FA
            F4FFFFFFFFFFCAD6A4FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFB3C57EFFF5F7EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F7EEFFB3C5
            7EFFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFCAD6A4FFFFFF
            FFFFFFFFFFFFF0F4E5FFB0C378FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFBDCC8EFFF8FAF3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FAF3FFBDCC8EFFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC176FFF0F4E5FFFFFF
            FFFFFFFFFFFFFFFFFFFFCDDAACFFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFB9CA88FFECF1DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECF1DFFFB9CA88FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFCFDAACFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFBFCF7FFB9C987FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFC6D49EFFE4EAD1FFF6F8F1FFFFFF
            FFFFFFFFFFFFF6F8F1FFE4EAD1FFC6D49EFFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFB9C987FFFBFCF7FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F4E6FFB3C57DFFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFB3C57DFFF1F4E6FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDF1DFFFB3C57DFFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFB3C57DFFEDF1DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F4E6FFB9C987FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFB9C987FFF1F4E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFCF7FFCDDA
            ACFFB0C378FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFAFC1
            76FFCDDAACFFFBFCF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFF0F4E5FFCAD6A4FFB1C378FFAFC276FFAFC276FFAFC276FFAFC276FFAFC2
            76FFAFC276FFAFC276FFAFC276FFAFC276FFAFC276FFB0C278FFCAD6A4FFF0F4
            E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFF9FAF4FFE0E7C9FFCBD7A5FFBACB8BFFB1C47AFFAFC2
            76FFAFC276FFB1C47AFFBACB8BFFCBD7A5FFE0E7C9FFF9FAF4FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object nrazao: TfrxMemoView
          AllowVectorExport = True
          Left = 222.992270000000000000
          Width = 495.118002830000000000
          Height = 34.015770000000000000
          DataSetName = 'db_pessoas'
          Font.Charset = ANSI_CHARSET
          Font.Color = 11498759
          Font.Height = -21
          Font.Name = 'Yu Gothic UI Semibold'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            'Nome da Razao | CNPJ')
          ParentFont = False
          WordBreak = True
          WordWrap = False
        end
        object ncontatos: TfrxMemoView
          AllowVectorExport = True
          Left = 222.992270000000000000
          Top = 37.795300000000000000
          Width = 495.118002830000000000
          Height = 34.015770000000000000
          DataSetName = 'db_pessoas'
          Font.Charset = ANSI_CHARSET
          Font.Color = 15440906
          Font.Height = -19
          Font.Name = 'Yu Gothic UI Semibold'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            'Email | Telefone')
          ParentFont = False
          WordBreak = True
          WordWrap = False
          Formats = <
            item
            end
            item
            end>
        end
        object nendereco: TfrxMemoView
          AllowVectorExport = True
          Left = 222.992270000000000000
          Top = 75.590600000000000000
          Width = 495.118002830000000000
          Height = 56.692950000000000000
          DataSetName = 'db_pessoas'
          Font.Charset = ANSI_CHARSET
          Font.Color = 15440906
          Font.Height = -19
          Font.Name = 'Yu Gothic UI Semibold'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8W = (
            'Endere'#231'o')
          ParentFont = False
          WordBreak = True
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end>
        end
        object filtro: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Top = 139.842610000000000000
          Width = 755.906000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[filtro]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Top = 162.740260000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 64.252010000000000000
          Top = 162.519790000000000000
          Width = 309.921460000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 374.173470000000000000
          Top = 162.519790000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'UND')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 423.307360000000000000
          Top = 162.519790000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Prc. Compra')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 510.236550000000000000
          Top = 162.519790000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Prc. Venda')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 597.165740000000000000
          Top = 162.519790000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Qtde. Ent.')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 676.535870000000000000
          Top = 162.519790000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Qtde. Saldo')
          ParentFont = False
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Top = 181.417440000000000000
          Width = 755.905536220000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
      object PageFooter: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 343.937230000000000000
        Width = 755.906000000000000000
        object Line2: TfrxLineView
          AllowVectorExport = True
          Top = 0.220470000000000000
          Width = 755.905536220000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 2.779530000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[DATE] [TIME]')
        end
        object lb_email: TfrxMemoView
          AllowVectorExport = True
          Left = 566.929500000000000000
          Top = 2.779530000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'EasyOne Systems - Entrada de Mercadoria')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 222.992270000000000000
        Width = 755.906000000000000000
        DataSet = frxDBEstoqueEntrada
        DataSetName = 'frxDBEstoqueEntrada'
        RowCount = 0
        object frxDBEstoqueEntradacodigo: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = 'codigo'
          DataSet = frxDBEstoqueEntrada
          DataSetName = 'frxDBEstoqueEntrada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBEstoqueEntrada."codigo"]')
          ParentFont = False
        end
        object frxDBEstoqueEntradadescricao: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 64.252010000000000000
          Width = 309.921460000000000000
          Height = 18.897650000000000000
          DataField = 'descricao'
          DataSet = frxDBEstoqueEntrada
          DataSetName = 'frxDBEstoqueEntrada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBEstoqueEntrada."descricao"]')
          ParentFont = False
        end
        object frxDBEstoqueEntradaund: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 374.173470000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataField = 'und'
          DataSet = frxDBEstoqueEntrada
          DataSetName = 'frxDBEstoqueEntrada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBEstoqueEntrada."und"]')
          ParentFont = False
        end
        object frxDBEstoqueEntradaprc_compra: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 423.307360000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'prc_compra'
          DataSet = frxDBEstoqueEntrada
          DataSetName = 'frxDBEstoqueEntrada'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBEstoqueEntrada."prc_compra"]')
          ParentFont = False
        end
        object frxDBEstoqueEntradaprc_venda: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 510.236550000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'prc_venda'
          DataSet = frxDBEstoqueEntrada
          DataSetName = 'frxDBEstoqueEntrada'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBEstoqueEntrada."prc_venda"]')
          ParentFont = False
        end
        object frxDBEstoqueEntradaqtde_nova: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 597.165740000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'qtde_nova'
          DataSet = frxDBEstoqueEntrada
          DataSetName = 'frxDBEstoqueEntrada'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBEstoqueEntrada."qtde_nova"]')
          ParentFont = False
        end
        object frxDBEstoqueEntradaqtdefinal: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 676.535870000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'qtdefinal'
          DataSet = frxDBEstoqueEntrada
          DataSetName = 'frxDBEstoqueEntrada'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBEstoqueEntrada."qtdefinal"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 302.362400000000000000
        Width = 755.906000000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Qtde.: [COUNT(MasterData1)]')
          ParentFont = False
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Width = 755.905536220000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
    end
  end
end
