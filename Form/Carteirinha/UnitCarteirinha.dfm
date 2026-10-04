inherited FrmCarteira: TFrmCarteira
  Caption = 'FrmCarteira'
  OnShow = FormShow
  TextHeight = 17
  inherited PanelClient: TPanel
    TabOrder = 3
    inherited cxGrid: TcxGrid
      ParentFont = False
      LevelTabs.Style = 6
      inherited Grid: TcxGridDBTableView
        OnCellClick = GridCellClick
        DataController.DataSource = Ds
        DataController.MultiThreadedOptions.Filtering = bFalse
        DataController.MultiThreadedOptions.Sorting = bFalse
        DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded, dcoImmediatePost]
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            FieldName = 'id_carteira'
            Column = digital
          end>
        OptionsView.ColumnAutoWidth = False
        OptionsView.HeaderEndEllipsis = True
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
        object GridID: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'id_carteira'
          Visible = False
          Width = 37
        end
        object GridColumn1: TcxGridDBColumn
          MinWidth = 15
          Width = 15
        end
        object digital: TcxGridDBColumn
          Caption = 'Digital'
          DataBinding.FieldName = 'digital'
          Width = 51
        end
        object validade: TcxGridDBColumn
          Caption = 'Validade'
          DataBinding.FieldName = 'validade'
          Width = 71
        end
        object Gmatricula: TcxGridDBColumn
          Caption = 'Matr'#237'cula'
          DataBinding.FieldName = 'vmatricula'
          Width = 66
        end
        object gcodigo: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'vcodigo'
          Width = 53
        end
        object Associado: TcxGridDBColumn
          Caption = 'Associado'
          DataBinding.FieldName = 'vnome'
          Width = 240
        end
        object cpf: TcxGridDBColumn
          Caption = 'CPF'
          DataBinding.FieldName = 'vcpf'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditMask = '999\.999\.999\-99;1;_'
          Width = 105
        end
        object Secretaria: TcxGridDBColumn
          Caption = 'Secretaria'
          DataBinding.FieldName = 'vrazaosecretaria'
          Width = 117
        end
        object Gridwhatsapp: TcxGridDBColumn
          Caption = 'Whatsapp'
          DataBinding.FieldName = 'vwhatsapp'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditMask = '!\(99\)99999-9999;1;_'
          Width = 100
        end
        object Grididsocio: TcxGridDBColumn
          DataBinding.FieldName = 'id_socio'
          Visible = False
          Width = 74
        end
        object Gridativo: TcxGridDBColumn
          Caption = 'Ativo'
          DataBinding.FieldName = 'ativo'
          Width = 52
        end
        object GridColumn2: TcxGridDBColumn
          Caption = 'Data cadastro'
          DataBinding.FieldName = 'dataemissao'
          Width = 96
        end
        object GridColumn3: TcxGridDBColumn
          Caption = 'Usu'#225'rio'
          DataBinding.FieldName = 'nmusuario'
          Width = 155
        end
      end
      object GridDependente: TcxGridDBTableView [1]
        PopupMenu = PopupDependente
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = dsDependente
        DataController.DetailKeyFieldNames = 'id_socio'
        DataController.KeyFieldNames = 'id_carteira'
        DataController.MasterKeyFieldNames = 'id_socio'
        DataController.MultiThreadedOptions.Filtering = bFalse
        DataController.MultiThreadedOptions.Sorting = bFalse
        DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded, dcoImmediatePost, dcoMultiSelectionSyncGroupWithChildren]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o>'
        OptionsView.GroupByBox = False
        OptionsView.HeaderEndEllipsis = True
        OptionsView.Indicator = True
        Preview.MaxLineCount = 10
        Styles.StyleSheet = FrmPrincipalNew.GridTableDependente
        object GridDependenteSituacao: TcxGridDBColumn
          Caption = 'Ativo'
          DataBinding.FieldName = 'ativo'
          Width = 42
        end
        object GridDependenteDigital: TcxGridDBColumn
          Caption = 'Digital'
          DataBinding.FieldName = 'digital'
          Width = 54
        end
        object GridDependenteNascimento: TcxGridDBColumn
          Caption = 'Nascimento'
          DataBinding.FieldName = 'vNascimento'
          Width = 81
        end
        object GridDependenteCodigo: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'vcodigo'
          Width = 55
        end
        object GridDependentedependente: TcxGridDBColumn
          Caption = 'Dependente'
          DataBinding.FieldName = 'vnome'
          Width = 277
        end
        object GridDependentecpf: TcxGridDBColumn
          Caption = 'CPF'
          DataBinding.FieldName = 'vcpf'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditMask = '999\.999\.999\-99;1;_'
          Width = 99
        end
        object GridDependenteParentesco: TcxGridDBColumn
          Caption = 'Parentesco'
          DataBinding.FieldName = 'vparentesco'
          Width = 141
        end
        object GridDependentewhatsapp: TcxGridDBColumn
          Caption = 'Whatsapp'
          DataBinding.FieldName = 'vwhatsapp'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditMask = '!\(99\)99999-9999;1;_'
          Width = 107
        end
        object GridDependenteIDSocio: TcxGridDBColumn
          DataBinding.FieldName = 'id_socio'
          Visible = False
          Width = 74
        end
        object GridDependenteiddependente: TcxGridDBColumn
          DataBinding.FieldName = 'id_dependente'
          Visible = False
        end
        object GridDependenteColumn1: TcxGridDBColumn
          Caption = 'Data cadastro'
          DataBinding.FieldName = 'dataemissao'
          Width = 96
        end
        object GridDependenteColumn2: TcxGridDBColumn
          Caption = 'Usu'#225'rio'
          DataBinding.FieldName = 'nmusuario'
          Width = 80
        end
      end
      inherited cxGridLevel1: TcxGridLevel
        Caption = 'Associado'
        Options.DetailTabsPosition = dtpTop
        object cxGridLevel2: TcxGridLevel
          Caption = 'Dependente'
          GridView = GridDependente
        end
      end
    end
  end
  inherited PanelFiltro: TPanel
    TabOrder = 2
    inherited GBFiltro: TcxGroupBox
      object Label3: TLabel [2]
        Left = 422
        Top = 20
        Width = 37
        Height = 17
        Caption = 'Digital'
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
        ExplicitWidth = 420
        ExplicitHeight = 25
        Width = 420
      end
      inherited PPopPap: TPanel
        TabOrder = 6
      end
      inherited cxAtivo: TcxComboBox
        TabOrder = 2
        ExplicitHeight = 25
      end
      inherited BtnPesquisar: TStyledBitBtn
        TabOrder = 3
      end
      inherited BtnLimpar: TStyledBitBtn
        TabOrder = 4
      end
      inherited BtnNovo: TStyledBitBtn
        TabOrder = 5
      end
      object cxDigital: TcxComboBox
        Left = 422
        Top = 38
        Cursor = crIBeam
        Properties.ClearKey = 16452
        Properties.DropDownListStyle = lsEditFixedList
        Properties.ImmediatePost = True
        Properties.Items.Strings = (
          'Todos'
          'Sim'
          'N'#227'o')
        StyleFocused.Color = 15855596
        TabOrder = 1
        Text = 'Todos'
        Width = 85
      end
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 416
    Top = 4
  end
  inherited Ds: TUniDataSource
    DataSet = mdPesquisa
    Left = 240
    Top = 4
  end
  inherited cxStyle: TcxStyleRepository
    PixelsPerInch = 96
    inherited CxGridPedido: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    inherited GridTableDependente: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
  object frxDBListagem: TfrxDBDataset [7]
    UserName = 'frxDBListagem'
    CloseDataSource = False
    BCDToCurrency = False
    DataSetOptions = []
    Left = 416
    Top = 424
  end
  object frxDBCateira: TfrxDBDataset [8]
    UserName = 'frxDBCarteira'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id_carteira=id_carteira'
      'id_socio=id_socio'
      'validade=validade'
      'ativo=ativo'
      'digital=digital'
      'matricula=matricula'
      'codigo=codigo'
      'nome=nome'
      'cpf=cpf'
      'rg=rg'
      'pis=pis'
      'serie=serie'
      'nascimento=nascimento'
      'admissao=admissao'
      'profissao=profissao'
      'naturalidade=naturalidade'
      'mae=mae'
      'pai=pai'
      'socio_deste=socio_deste'
      'ctps=ctps'
      'depnome1=depnome1'
      'depnascimento1=depnascimento1'
      'depparentesco1=depparentesco1'
      'depcpf1=depcpf1'
      'depnome2=depnome2'
      'depnascimento2=depnascimento2'
      'depparentesco2=depparentesco2'
      'depcpf2=depcpf2'
      'depnome3=depnome3'
      'depnascimento3=depnascimento3'
      'depparentesco3=depparentesco3'
      'depcpf3=depcpf3'
      'depnome4=depnome4'
      'depnascimento4=depnascimento4'
      'depparentesco4=depparentesco4'
      'depcpf4=depcpf4'
      'depnome5=depnome5'
      'depnascimento5=depnascimento5'
      'depparentesco5=depparentesco5'
      'depcpf5=depcpf5'
      'depnome6=depnome6'
      'depnascimento6=depnascimento6'
      'depparentesco6=depparentesco6'
      'depcpf6=depcpf6'
      'foto=foto')
    DataSet = DM.TabCarteirinhaImpresso
    BCDToCurrency = False
    DataSetOptions = []
    Left = 384
    Top = 432
  end
  object frxRelatorio: TfrxReport [9]
    Tag = 1
    Version = '2022.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43202.744543275500000000
    ReportOptions.LastChange = 45627.487404629630000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'var'
      'PNG,PNG1:String;'
      'begin'
      '  PNG   :=<wLogo>; //receber foto da carteirinha'
      
        '  PNG1  :=<nfoto>; //recbe a foto do associado                  ' +
        '                                                                ' +
        '  '
      '  '
      '  if PNG <> '#39#39' then //verifica se e diferente de vazio'
      '  begin            '
      '    Picture3.Picture.LoadFromFile(PNG);//carrega na tela'
      '    Picture2.Picture.LoadFromFile(PNG);    '
      '  end;'
      ''
      
        '  if PNG1 <> '#39#39' then                                            ' +
        '   '
      '  begin'
      '    Picture1.Picture.LoadFromFile(PNG1);              '
      '  end;            '
      '  '
      
        '  Memo36.Text   := <nendereco>+'#39', '#39'+<nnumero>+'#39', '#39'+<nbairro>+'#39', ' +
        #39'+<ncidade>+'#39', '#39'+<ncep>+'#39', '#39'+<ntelefone>+'#39', '#39'+<nfone1>;'
      '  Memo35.Text   := <nrazao>;'
      ''
      ''
      
        '  frxTblCarteirasDepNome1.Visible := (<frxDBCarteira."depnome1">' +
        ' <> '#39#39');                                      '
      
        '  frxTblCarteirasDepPar1.Visible  := (<frxDBCarteira."depparente' +
        'sco1"> <> '#39#39');'
      
        '  frxTblCarteirasDepNasc1.Visible := (<frxDBCarteira."depnascime' +
        'nto1"> <> '#39'30/12/1899'#39');                                      '
      ''
      
        '  frxTblCarteirasDepNome2.Visible := (<frxDBCarteira."depnome2">' +
        ' <> '#39#39');                                      '
      
        '  frxTblCarteirasDepPar2.Visible  := (<frxDBCarteira."depparente' +
        'sco2"> <> '#39#39');'
      
        '  frxTblCarteirasDepNasc2.Visible := (<frxDBCarteira."depnascime' +
        'nto2"> <> '#39'30/12/1899'#39');'
      ''
      
        '  frxTblCarteirasDepNome3.Visible := (<frxDBCarteira."depnome3">' +
        ' <> '#39#39');                                      '
      
        '  frxTblCarteirasDepPar3.Visible  := (<frxDBCarteira."depparente' +
        'sco3"> <> '#39#39');'
      
        '  frxTblCarteirasDepNasc3.Visible := (<frxDBCarteira."depnascime' +
        'nto3"> <> '#39'30/12/1899'#39');'
      ''
      
        '  frxTblCarteirasDepNome4.Visible := (<frxDBCarteira."depnome4">' +
        ' <> '#39#39');                                      '
      
        '  frxTblCarteirasDepPar4.Visible  := (<frxDBCarteira."depparente' +
        'sco4"> <> '#39#39');'
      
        '  frxTblCarteirasDepNasc4.Visible := (<frxDBCarteira."depnascime' +
        'nto4"> <> '#39'30/12/1899'#39');'
      ''
      
        '  frxTblCarteirasDepNome5.Visible := (<frxDBCarteira."depnome5">' +
        ' <> '#39#39');                                      '
      
        '  frxTblCarteirasDepPar5.Visible  := (<frxDBCarteira."depparente' +
        'sco5"> <> '#39#39');'
      
        '  frxTblCarteirasDepNasc5.Visible := (<frxDBCarteira."depnascime' +
        'nto5"> <> '#39'30/12/1899'#39');'
      '        '
      '    '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 440
    Top = 376
    Datasets = <
      item
        DataSet = frxDBCateira
        DataSetName = 'frxDBCarteira'
      end>
    Variables = <
      item
        Name = ' vempresa'
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
      end
      item
        Name = 'nfoto'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 14.000000000000000000
      RightMargin = 14.000000000000000000
      TopMargin = 8.000000000000000000
      BottomMargin = 8.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 264.566929130000000000
        Top = 18.897650000000000000
        Width = 687.874460000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxDBCateira
        DataSetName = 'frxDBCarteira'
        RowCount = 0
        object Picture5: TfrxPictureView
          AllowVectorExport = True
          Left = 347.716535430000000000
          Width = 340.157480310000000000
          Height = 230.551181100000000000
          Center = True
          DataField = 'MARCADAGUA'
          DataSetName = 'frxDBTblConfig'
          Frame.Typ = []
          Stretched = False
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Shape2: TfrxShapeView
          AllowVectorExport = True
          Left = 347.716760000000000000
          Width = 340.157480310000000000
          Height = 230.551181100000000000
          Frame.Style = fsDot
          Frame.Typ = []
        end
        object Picture4: TfrxPictureView
          AllowVectorExport = True
          Width = 340.157480310000000000
          Height = 230.551181100000000000
          Center = True
          DataField = 'MARCADAGUA'
          DataSetName = 'frxDBTblConfig'
          Frame.Typ = []
          Stretched = False
          HightQuality = False
          Transparent = True
          TransparentColor = clWhite
        end
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Width = 340.157480310000000000
          Height = 230.551181100000000000
          Frame.Style = fsDot
          Frame.Typ = []
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 18.897650000000000000
          Top = 60.251961180000000000
          Width = 124.724416770000000000
          Height = 151.181102360000000000
          Center = True
          DataSetName = 'frxTblCarteiras'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338582680000000000
          Top = 7.559055120000000000
          Width = 317.480314960000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Identifica'#231#227'o ASMUV')
          ParentFont = False
        end
        object MmTblCarteirasNome: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338582680000000000
          Top = 27.212598425196900000
          Width = 56.692913390000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Dependente:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338436220000000000
          Top = 42.354340470000000000
          Width = 56.692915830000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Data Nasc.:')
          ParentFont = False
        end
        object MmTblCarteirasAdmissao: TfrxMemoView
          AllowVectorExport = True
          Left = 143.622140000000000000
          Top = 59.251961180000000000
          Width = 52.913385830000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Admiss'#227'o:')
          ParentFont = False
        end
        object MmTblCarteirasFuncao: TfrxMemoView
          AllowVectorExport = True
          Left = 143.622140000000000000
          Top = 74.370071420000000000
          Width = 52.913385830000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Fun'#231#227'o:')
          ParentFont = False
        end
        object MmTblCarteirasNatural: TfrxMemoView
          AllowVectorExport = True
          Left = 143.622140000000000000
          Top = 89.488181650000000000
          Width = 52.913385830000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Natural de:')
          ParentFont = False
        end
        object MmTblCarteirasCTPSN: TfrxMemoView
          AllowVectorExport = True
          Left = 143.622140000000000000
          Top = 104.606291890000000000
          Width = 52.913385830000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CTPS:')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 143.622140000000000000
          Top = 119.724402130000000000
          Width = 52.913385830000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'RG:')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 143.622140000000000000
          Top = 134.842512360000000000
          Width = 52.913385830000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CPF:')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 143.622140000000000000
          Top = 149.960622600000000000
          Width = 90.708685830000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#186'. de Matr'#237'cula:')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779527560000000000
          Top = 116.165430000000000000
          Width = 13.606299210000000000
          Height = 96.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Data da Associa'#231#227'o')
          ParentFont = False
          Rotation = 90
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779527560000000000
          Top = 60.251961180000000000
          Width = 13.606299210000000000
          Height = 62.740162360000000000
          DataField = 'socio_deste'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."socio_deste"]')
          ParentFont = False
          Rotation = 90
          WordWrap = False
        end
        object frxTblCarteirasNome: TfrxMemoView
          AllowVectorExport = True
          Left = 68.031496060000000000
          Top = 27.236220470000000000
          Width = 260.787452830000000000
          Height = 15.118110240000000000
          DataField = 'nome'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."nome"]')
          ParentFont = False
          WordWrap = False
        end
        object frxTblCarteirasRg: TfrxMemoView
          AllowVectorExport = True
          Left = 196.535433070000000000
          Top = 119.724402130000000000
          Width = 132.283464570000000000
          Height = 13.606299210000000000
          DataField = 'rg'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."rg"]')
          ParentFont = False
          WordWrap = False
        end
        object frxTblCarteirasCpf: TfrxMemoView
          AllowVectorExport = True
          Left = 196.535433070000000000
          Top = 134.842512360000000000
          Width = 132.283464570000000000
          Height = 15.118110240000000000
          DataField = 'cpf'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."cpf"]')
          ParentFont = False
          WordWrap = False
        end
        object frxTblCarteirasNatural: TfrxMemoView
          AllowVectorExport = True
          Left = 196.535433070000000000
          Top = 89.488181650000000000
          Width = 132.283464570000000000
          Height = 13.606299210000000000
          DataField = 'naturalidade'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."naturalidade"]')
          ParentFont = False
          WordWrap = False
        end
        object frxTblCarteirasFuncao: TfrxMemoView
          AllowVectorExport = True
          Left = 196.535433070000000000
          Top = 74.370071420000000000
          Width = 132.283464570000000000
          Height = 15.118110240000000000
          DataField = 'profissao'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."profissao"]')
          ParentFont = False
          WordWrap = False
        end
        object frxTblCarteirasAdmissao: TfrxMemoView
          AllowVectorExport = True
          Left = 196.535433070000000000
          Top = 59.251961180000000000
          Width = 132.283464570000000000
          Height = 13.606299210000000000
          DataField = 'admissao'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."admissao"]')
          ParentFont = False
          WordWrap = False
        end
        object frxTblCarteirasCTPSN: TfrxMemoView
          AllowVectorExport = True
          Left = 196.535433070000000000
          Top = 104.606291890000000000
          Width = 71.810996770000000000
          Height = 15.118110240000000000
          DataField = 'ctps'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."ctps"]')
          ParentFont = False
          WordWrap = False
        end
        object frxTblCarteirasMatricula: TfrxMemoView
          AllowVectorExport = True
          Left = 234.330708660000000000
          Top = 149.960622600000000000
          Width = 94.488250000000000000
          Height = 15.118110240000000000
          DataField = 'matricula'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."matricula"]')
          ParentFont = False
          WordWrap = False
        end
        object frxTblCarteirasNascimento: TfrxMemoView
          AllowVectorExport = True
          Left = 68.031352050000000000
          Top = 42.354340470000000000
          Width = 260.787530940000000000
          Height = 15.118110240000000000
          DataField = 'nascimento'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."nascimento"]')
          ParentFont = False
        end
        object MmTblCarteirasPai: TfrxMemoView
          AllowVectorExport = True
          Left = 359.055118110000000000
          Top = 27.212598430000000000
          Width = 55.181102360000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Filia'#231#227'o Pai:')
          ParentFont = False
        end
        object MmTblCarteirasMae: TfrxMemoView
          AllowVectorExport = True
          Left = 359.055118110000000000
          Top = 42.330708660000000000
          Width = 55.181102360000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'M'#227'e:')
          ParentFont = False
        end
        object frxTblCarteirasPai: TfrxMemoView
          AllowVectorExport = True
          Left = 414.236220470000000000
          Top = 27.212598430000000000
          Width = 185.196804020000000000
          Height = 15.118110240000000000
          DataField = 'pai'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."pai"]')
          ParentFont = False
          WordWrap = False
        end
        object frxTblCarteirasMae: TfrxMemoView
          AllowVectorExport = True
          Left = 414.236220470000000000
          Top = 42.330708660000000000
          Width = 185.196804020000000000
          Height = 15.118110240000000000
          DataField = 'mae'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."mae"]')
          ParentFont = False
          WordWrap = False
        end
        object frxMvDependente: TfrxMemoView
          AllowVectorExport = True
          Left = 359.055118110236000000
          Top = 75.590600000000000000
          Width = 186.708661420000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Dependente')
          ParentFont = False
        end
        object frxMvParentesco: TfrxMemoView
          AllowVectorExport = True
          Left = 545.763779527559000000
          Top = 75.590600000000000000
          Width = 68.031496060000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Parentesco')
          ParentFont = False
        end
        object frxMvDataNasc: TfrxMemoView
          AllowVectorExport = True
          Left = 613.795275590551000000
          Top = 75.590600000000000000
          Width = 60.472440940000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Data Nasc.')
          ParentFont = False
        end
        object frxTblCarteirasDepNome1: TfrxMemoView
          AllowVectorExport = True
          Left = 359.055118110000000000
          Top = 90.708661420000000000
          Width = 186.708661420000000000
          Height = 15.118110240000000000
          DataField = 'depnome1'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."depnome1"]')
          ParentFont = False
          WordWrap = False
        end
        object frxTblCarteirasDepPar1: TfrxMemoView
          AllowVectorExport = True
          Left = 545.763779530000000000
          Top = 90.708661420000000000
          Width = 68.031496060000000000
          Height = 15.118110240000000000
          DataField = 'depparentesco1'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."depparentesco1"]')
          ParentFont = False
          WordWrap = False
        end
        object frxTblCarteirasDepNasc1: TfrxMemoView
          AllowVectorExport = True
          Left = 613.795275590000000000
          Top = 90.708661420000000000
          Width = 60.472440940000000000
          Height = 15.118110240000000000
          DataField = 'depnascimento1'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."depnascimento1"]')
          ParentFont = False
          WordWrap = False
        end
        object frxTblCarteirasDepNome2: TfrxMemoView
          AllowVectorExport = True
          Left = 359.055118110000000000
          Top = 105.826840000000000000
          Width = 186.708661420000000000
          Height = 15.118110240000000000
          DataField = 'depnome2'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."depnome2"]')
          ParentFont = False
          WordWrap = False
        end
        object frxTblCarteirasDepPar2: TfrxMemoView
          AllowVectorExport = True
          Left = 545.763779530000000000
          Top = 105.826840000000000000
          Width = 68.031496060000000000
          Height = 15.118110240000000000
          DataField = 'depparentesco2'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."depparentesco2"]')
          ParentFont = False
          WordWrap = False
        end
        object frxTblCarteirasDepNasc2: TfrxMemoView
          AllowVectorExport = True
          Left = 613.795275590000000000
          Top = 105.826840000000000000
          Width = 60.472440940000000000
          Height = 15.118110240000000000
          DataField = 'depnascimento2'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."depnascimento2"]')
          ParentFont = False
          WordWrap = False
        end
        object frxTblCarteirasDepNome3: TfrxMemoView
          AllowVectorExport = True
          Left = 359.055118110000000000
          Top = 120.944960000000000000
          Width = 186.708661420000000000
          Height = 15.118110240000000000
          DataField = 'depnome3'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."depnome3"]')
          ParentFont = False
          WordWrap = False
        end
        object frxTblCarteirasDepPar3: TfrxMemoView
          AllowVectorExport = True
          Left = 545.763779530000000000
          Top = 120.944960000000000000
          Width = 68.031496060000000000
          Height = 15.118110240000000000
          DataField = 'depparentesco3'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."depparentesco3"]')
          ParentFont = False
          WordWrap = False
        end
        object frxTblCarteirasDepNasc3: TfrxMemoView
          AllowVectorExport = True
          Left = 613.795275590000000000
          Top = 120.944960000000000000
          Width = 60.472440940000000000
          Height = 15.118110240000000000
          DataField = 'depnascimento3'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."depnascimento3"]')
          ParentFont = False
          WordWrap = False
        end
        object frxTblCarteirasDepNome4: TfrxMemoView
          AllowVectorExport = True
          Left = 359.055118110000000000
          Top = 136.063080000000000000
          Width = 186.708661420000000000
          Height = 15.118110240000000000
          DataField = 'depnome4'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."depnome4"]')
          ParentFont = False
          WordWrap = False
        end
        object frxTblCarteirasDepPar4: TfrxMemoView
          AllowVectorExport = True
          Left = 545.763779530000000000
          Top = 136.063080000000000000
          Width = 68.031496060000000000
          Height = 15.118110240000000000
          DataField = 'depparentesco4'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."depparentesco4"]')
          ParentFont = False
          WordWrap = False
        end
        object frxTblCarteirasDepNasc4: TfrxMemoView
          AllowVectorExport = True
          Left = 613.795275590000000000
          Top = 136.063080000000000000
          Width = 60.472440940000000000
          Height = 15.118110240000000000
          DataField = 'depnascimento4'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."depnascimento4"]')
          ParentFont = False
          WordWrap = False
        end
        object frxTblCarteirasDepNome5: TfrxMemoView
          AllowVectorExport = True
          Left = 359.055118110000000000
          Top = 151.181200000000000000
          Width = 186.708661420000000000
          Height = 15.118110240000000000
          DataField = 'depnome5'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."depnome5"]')
          ParentFont = False
          WordWrap = False
        end
        object frxTblCarteirasDepPar5: TfrxMemoView
          AllowVectorExport = True
          Left = 545.763779530000000000
          Top = 151.181200000000000000
          Width = 68.031496060000000000
          Height = 15.118110240000000000
          DataField = 'depparentesco5'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."depparentesco5"]')
          ParentFont = False
          WordWrap = False
        end
        object frxTblCarteirasDepNasc5: TfrxMemoView
          AllowVectorExport = True
          Left = 613.795275590000000000
          Top = 151.181200000000000000
          Width = 60.472440940000000000
          Height = 15.118110240000000000
          DataField = 'depnascimento5'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."depnascimento5"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 359.055118110000000000
          Top = 173.858380000000000000
          Width = 209.385826770000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Comunique a ASMUV quando:')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 359.055118110000000000
          Top = 192.756030000000000000
          Width = 209.385826770000000000
          Height = 34.015748030000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            
              'Mudar de endere'#231'o, for demitido da empresa, houver transfer'#234'ncia' +
              ' de empresa, entrar no INSS, entrar no seguro ou se aposentar.')
          ParentFont = False
        end
        object Picture2: TfrxPictureView
          AllowVectorExport = True
          Left = 598.677184880000000000
          Top = 7.558947720000000000
          Width = 75.590531650000000000
          Height = 56.692915830000000000
          DataSetName = 'frxDBTblConfig'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Picture3: TfrxPictureView
          AllowVectorExport = True
          Left = 143.622140000000000000
          Top = 165.078850000000000000
          Width = 68.031496060000000000
          Height = 45.354316060000000000
          DataSetName = 'frxDBTblConfig'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 208.653680000000000000
          Top = 165.078850000000000000
          Width = 120.944884330000000000
          Height = 45.354330710000000000
          DataSetName = 'frxTblTempReg'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haBlock
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338582680000000000
          Top = 211.433063540000000000
          Width = 317.480314960000000000
          Height = 17.385826770000000000
          DataSetName = 'frxTblCarteiras'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '')
          ParentFont = False
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
            end
            item
            end
            item
            end>
        end
        object MmTblCarteirasCTPSS: TfrxMemoView
          AllowVectorExport = True
          Left = 270.905511810000000000
          Top = 104.606370000000000000
          Width = 30.236220470000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'S'#233'rie:')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 359.055350000000000000
          Top = 11.338590000000000000
          Width = 55.181102360000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'PIS/PASEP:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 414.236220470000000000
          Top = 9.338590000000000000
          Width = 185.196804020000000000
          Height = 15.118110240000000000
          DataField = 'pis'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."pis"]')
          ParentFont = False
          WordWrap = False
        end
        object frxTblCarteirasCTPSS: TfrxMemoView
          AllowVectorExport = True
          Left = 299.362400000000000000
          Top = 104.606370000000000000
          Width = 30.236225350000000000
          Height = 15.118110240000000000
          DataField = 'serie'
          DataSet = frxDBCateira
          DataSetName = 'frxDBCarteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBCarteira."serie"]')
          ParentFont = False
          WordWrap = False
        end
        object Barcode2D1: TfrxBarcode2DView
          AllowVectorExport = True
          Left = 604.724800000000000000
          Top = 173.858380000000000000
          Width = 49.984230000000000000
          Height = 49.984230000000000000
          StretchMode = smActualHeight
          AutoSize = False
          BarType = bcCodeQR
          BarProperties.Encoding = qrAuto
          BarProperties.QuietZone = 0
          BarProperties.ErrorLevels = ecL
          BarProperties.PixelSize = 4
          BarProperties.CodePage = 0
          Frame.Typ = []
          Rotation = 0
          ShowText = False
          HexData = '31003200330034003500360037003800'
          Zoom = 0.595050357142857100
          FontScaled = True
          QuietZone = 0
          ColorBar = clBlack
        end
      end
    end
  end
  object dscarteirinha: TUniDataSource [10]
    DataSet = DM.TabCarteirinhaImpresso
    Left = 384
    Top = 376
  end
  object dsDependente: TUniDataSource [11]
    DataSet = mdPesquisaDependente
    Left = 228
    Top = 340
  end
  object PopupDependente: TPopupMenu [12]
    Images = cxIMGMenu
    Left = 292
    Top = 28
    object Dependente1: TMenuItem
      Caption = 'Dependente'
      Default = True
      Enabled = False
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object btnnovodependente: TMenuItem
      Caption = 'Novo'
      ImageIndex = 14
      OnClick = btnnovodependenteClick
    end
    object btneditardepen: TMenuItem
      Caption = 'Editar'
      ImageIndex = 1
      OnClick = btneditardepenClick
    end
    object btnexcluirdepen: TMenuItem
      Caption = 'Cancelar'
      ImageIndex = 15
      OnClick = btnexcluirdepenClick
    end
    object btnreativarDependente: TMenuItem
      Caption = 'Reativar'
      ImageIndex = 12
      OnClick = btnreativarDependenteClick
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object EnviarWhatsAppDependente: TMenuItem
      Caption = 'Enviar WhatsApp'
      ImageIndex = 9
      OnClick = EnviarWhatsAppDependenteClick
    end
  end
  object mdPesquisa: TdxMemData [13]
    Indexes = <>
    SortOptions = []
    AfterScroll = mdPesquisaAfterScroll
    Left = 168
    Top = 4
    object mdPesquisaid_carteira: TIntegerField
      FieldName = 'id_carteira'
    end
    object mdPesquisaid_socio: TIntegerField
      FieldName = 'id_socio'
    end
    object mdPesquisavalidade: TDateField
      FieldName = 'validade'
    end
    object mdPesquisadigital: TStringField
      FieldName = 'digital'
      Size = 5
    end
    object mdPesquisavmatricula: TIntegerField
      FieldName = 'vmatricula'
    end
    object mdPesquisavcodigo: TIntegerField
      FieldName = 'vcodigo'
    end
    object mdPesquisavnome: TStringField
      FieldName = 'vnome'
      Size = 180
    end
    object mdPesquisavcpf: TStringField
      FieldName = 'vcpf'
    end
    object mdPesquisavrazaosecretaria: TStringField
      FieldName = 'vrazaosecretaria'
      Size = 60
    end
    object mdPesquisaapi: TStringField
      FieldName = 'api'
      Size = 5
    end
    object mdPesquisaexcluido: TIntegerField
      FieldName = 'excluido'
    end
    object mdPesquisavwhatsapp: TStringField
      FieldName = 'vwhatsapp'
    end
    object mdPesquisaativo: TStringField
      FieldName = 'ativo'
      Size = 5
    end
    object mdPesquisadataemissao: TDateField
      FieldName = 'dataemissao'
    end
    object mdPesquisanmusuario: TStringField
      FieldName = 'nmusuario'
      Size = 50
    end
  end
  object mdPesquisaDependente: TdxMemData [14]
    Indexes = <>
    SortOptions = []
    Left = 144
    Top = 324
    object mdPesquisaDependenteid_carteira: TIntegerField
      FieldName = 'id_carteira'
    end
    object mdPesquisaDependentedigital: TStringField
      FieldName = 'digital'
      Size = 5
    end
    object mdPesquisaDependenteid_dependente: TIntegerField
      FieldName = 'id_dependente'
    end
    object mdPesquisaDependentevcodigo: TIntegerField
      FieldName = 'vcodigo'
    end
    object mdPesquisaDependentevnome: TStringField
      FieldName = 'vnome'
      Size = 180
    end
    object mdPesquisaDependentevcpf: TStringField
      FieldName = 'vcpf'
    end
    object mdPesquisaDependentevparentesco: TStringField
      FieldName = 'vparentesco'
    end
    object mdPesquisaDependenteapi: TStringField
      FieldName = 'api'
      Size = 5
    end
    object mdPesquisaDependenteid_socio: TIntegerField
      FieldName = 'id_socio'
    end
    object mdPesquisaDependentevnascimento: TDateField
      FieldName = 'vnascimento'
    end
    object mdPesquisaDependenteativo: TStringField
      FieldName = 'ativo'
      Size = 5
    end
    object mdPesquisaDependenteexcluido: TIntegerField
      FieldName = 'excluido'
    end
    object mdPesquisaDependentevwhatsapp: TStringField
      FieldName = 'vwhatsapp'
    end
    object mdPesquisaDependentedataemissao: TDateField
      FieldName = 'dataemissao'
    end
    object mdPesquisaDependentenmusuario: TStringField
      FieldName = 'nmusuario'
      Size = 50
    end
  end
  inherited MenuPop: TPopupMenu
    Left = 352
    Top = 4
    inherited btnExcluir: TMenuItem
      Caption = 'Cancelar'
    end
    object Btnreativar: TMenuItem [2]
      Caption = 'Reativar'
      ImageIndex = 12
      OnClick = BtnreativarClick
    end
    inherited N1: TMenuItem
      Visible = False
    end
    object BtnImprimirCart: TMenuItem [4]
      Caption = 'Imprimir'
      ImageIndex = 13
    end
    inherited btnListagem: TMenuItem
      Visible = False
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object BtnEnviarMensagem: TMenuItem
      Caption = 'Enviar carteira'
      ImageIndex = 6
      OnClick = BtnEnviarMensagemClick
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object BtnSincronizarCarteira: TMenuItem
      Caption = 'Sincronizar'
      ImageIndex = 5
      Visible = False
      OnClick = BtnSincronizarCarteiraClick
    end
  end
  inherited cxIMGMenu: TcxImageList
    FormatVersion = 1
    Left = 552
    DesignInfo = 524840
  end
end
