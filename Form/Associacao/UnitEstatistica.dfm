inherited FrmEstatisticas: TFrmEstatisticas
  Caption = 'FrmEstatisticas'
  ClientHeight = 692
  Color = clBtnFace
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitHeight = 692
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 667
    ExplicitTop = 667
  end
  inherited PanelClient: TPanel
    Height = 627
    ExplicitHeight = 627
    object cxGrid: TcxGrid
      Left = 4
      Top = 230
      Width = 597
      Height = 195
      TabOrder = 0
      object Grid: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = Ds
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0'
            Kind = skSum
            FieldName = 'homens'
            Column = GridHomens
          end
          item
            Format = '0'
            Kind = skSum
            FieldName = 'mulheres'
            Column = GridMulheres
          end
          item
            Format = '0'
            Kind = skSum
            FieldName = 'total'
            Column = GridTotais
          end>
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
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 25
        OptionsView.Indicator = True
        Styles.StyleSheet = FrmPrincipalNew.CxGridPedido
        object GridCategoria: TcxGridDBColumn
          Caption = 'Situacao'
          DataBinding.FieldName = 'situacao'
          Width = 79
        end
        object GridHomens: TcxGridDBColumn
          Caption = 'Homens'
          DataBinding.FieldName = 'homens'
          Width = 59
        end
        object GridMulheres: TcxGridDBColumn
          Caption = 'Mulheres'
          DataBinding.FieldName = 'mulheres'
          Width = 67
        end
        object Gridcisgenero: TcxGridDBColumn
          Caption = 'Cisg'#234'nero'
          DataBinding.FieldName = 'cisgenero'
          Width = 72
        end
        object Gridtrans: TcxGridDBColumn
          Caption = 'Transg'#234'nero'
          DataBinding.FieldName = 'transgenero'
          Width = 87
        end
        object Gridbinario: TcxGridDBColumn
          Caption = 'N'#227'o Binario'
          DataBinding.FieldName = 'binario'
          Width = 81
        end
        object Gridoutros: TcxGridDBColumn
          Caption = 'Outros'
          DataBinding.FieldName = 'outros'
          Width = 56
        end
        object GridTotais: TcxGridDBColumn
          Caption = 'Total'
          DataBinding.FieldName = 'total'
          Width = 80
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = Grid
      end
    end
    object DBChartPizza: TDBChart
      Left = 4
      Top = 12
      Width = 430
      Height = 212
      Border.Color = clDefault
      Title.Text.Strings = (
        'Gr'#225'fico Distribui'#231#227'o por Situa'#231#227'o')
      Legend.Frame.Visible = False
      Legend.Inverted = True
      Legend.Symbol.Shadow.Visible = False
      View3D = False
      TabOrder = 1
      DefaultCanvas = 'TGDIPlusCanvas'
      PrintMargins = (
        15
        25
        15
        25)
      ColorPaletteIndex = 7
      object Series1: THorizBarSeries
        HoverElement = []
        BarBrush.Gradient.Direction = gdLeftRight
        BarPen.Visible = False
        ColorEachPoint = True
        ConePercent = 13
        Marks.Transparent = True
        Marks.Visible = False
        Marks.Angle = 9
        DataSource = mdPesquisa
        Title = 'Situacao'
        XLabelsSource = 'situacao'
        BarWidthPercent = 45
        Gradient.Direction = gdLeftRight
        Sides = 31
        XValues.Name = 'Bar'
        XValues.Order = loNone
        XValues.ValueSource = 'total'
        YValues.Name = 'Y'
        YValues.Order = loAscending
      end
    end
    object DBChart: TDBChart
      Left = 467
      Top = 12
      Width = 430
      Height = 212
      Title.Text.Strings = (
        'Gr'#225'fico Distribui'#231#227'o por G'#234'nero')
      View3DOptions.Elevation = 315
      View3DOptions.Orthogonal = False
      View3DOptions.Perspective = 0
      View3DOptions.Rotation = 360
      TabOrder = 2
      DefaultCanvas = 'TGDIPlusCanvas'
      PrintMargins = (
        27
        15
        27
        15)
      ColorPaletteIndex = 7
      object Series2: TPieSeries
        HoverElement = []
        Marks.Tail.Margin = 2
        DataSource = mdPesquisa
        Title = 'Pessoa'
        XValues.Order = loAscending
        YValues.Name = 'Pie'
        YValues.Order = loNone
        YValues.ValueSource = 'total'
        Frame.InnerBrush.BackColor = clRed
        Frame.InnerBrush.Gradient.EndColor = clGray
        Frame.InnerBrush.Gradient.MidColor = clWhite
        Frame.InnerBrush.Gradient.StartColor = 4210752
        Frame.InnerBrush.Gradient.Visible = True
        Frame.MiddleBrush.BackColor = clYellow
        Frame.MiddleBrush.Gradient.EndColor = 8553090
        Frame.MiddleBrush.Gradient.MidColor = clWhite
        Frame.MiddleBrush.Gradient.StartColor = clGray
        Frame.MiddleBrush.Gradient.Visible = True
        Frame.OuterBrush.BackColor = clGreen
        Frame.OuterBrush.Gradient.EndColor = 4210752
        Frame.OuterBrush.Gradient.MidColor = clWhite
        Frame.OuterBrush.Gradient.StartColor = clSilver
        Frame.OuterBrush.Gradient.Visible = True
        Frame.Width = 4
        OtherSlice.Legend.Visible = False
        PieMarks.InsideSlice = True
        PieMarks.Rotated = True
        PieMarks.RotateStyle = rsTangencial
        PieMarks.VertCenter = True
        PiePen.Visible = False
        RotationAngle = 28
      end
    end
    object DBChartsecretaria: TDBChart
      Left = 607
      Top = 230
      Width = 290
      Height = 391
      Border.Color = clDefault
      Title.Text.Strings = (
        'Gr'#225'fico Distribui'#231#227'o por Secretaria e Situa'#231#227'o')
      Legend.Frame.Visible = False
      Legend.Inverted = True
      Legend.Symbol.Shadow.Visible = False
      View3D = False
      TabOrder = 3
      DefaultCanvas = 'TGDIPlusCanvas'
      PrintMargins = (
        15
        25
        15
        25)
      ColorPaletteIndex = 7
      object HorizBarSeries1: THorizBarSeries
        HoverElement = []
        BarBrush.Gradient.Direction = gdLeftRight
        BarPen.Visible = False
        ColorEachPoint = True
        ConePercent = 13
        Marks.Transparent = True
        Marks.Visible = False
        Marks.Angle = 9
        DataSource = mdPesquisaSecretaria
        Title = 'Secretaria'
        XLabelsSource = 'secretaria'
        BarWidthPercent = 45
        Gradient.Direction = gdLeftRight
        Sides = 31
        XValues.Name = 'Bar'
        XValues.Order = loNone
        XValues.ValueSource = 'total'
        YValues.Name = 'Y'
        YValues.Order = loAscending
      end
    end
    object cxGrid1: TcxGrid
      Left = 4
      Top = 431
      Width = 597
      Height = 190
      TabOrder = 4
      object cxGridDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = dssecretaria
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
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 25
        OptionsView.Indicator = True
        Styles.StyleSheet = FrmPrincipalNew.CxGridPedido
        object cxGridDBTableView1secretaria: TcxGridDBColumn
          Caption = 'Secretaria'
          DataBinding.FieldName = 'secretaria'
          Width = 111
        end
        object cxGridDBTableView1RecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
        end
        object cxGridDBTableView1ativo: TcxGridDBColumn
          Caption = 'Ativo'
          DataBinding.FieldName = 'ativo'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 1
          Properties.DisplayFormat = '0'
          Width = 51
        end
        object cxGridDBTableView1inativo: TcxGridDBColumn
          Caption = 'Inativo'
          DataBinding.FieldName = 'inativo'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 1
          Properties.DisplayFormat = '0'
          Width = 60
        end
        object cxGridDBTableView1inadimplente: TcxGridDBColumn
          Caption = 'Inadimplente'
          DataBinding.FieldName = 'inadimplente'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 1
          Properties.DisplayFormat = '0'
          Width = 90
        end
        object cxGridDBTableView1suspenso: TcxGridDBColumn
          Caption = 'Suspenso'
          DataBinding.FieldName = 'suspenso'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 1
          Properties.DisplayFormat = '0'
        end
        object cxGridDBTableView1afastado: TcxGridDBColumn
          Caption = 'Afastado'
          DataBinding.FieldName = 'afastado'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 1
          Properties.DisplayFormat = '0'
        end
        object cxGridDBTableView1cancelado: TcxGridDBColumn
          Caption = 'Cancelado'
          DataBinding.FieldName = 'cancelado'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 1
          Properties.DisplayFormat = '0'
        end
        object cxGridDBTableView1Column1: TcxGridDBColumn
          Caption = 'Total'
          DataBinding.FieldName = 'total'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DecimalPlaces = 1
          Properties.DisplayFormat = '0'
          Width = 47
        end
      end
      object cxGridLevel2: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
  end
  inherited Paneltitulo: TPanel
    inherited lblTitulo: TLabel
      Caption = 'Estatisticas da Associa'#231#227'o'
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 520
    Top = 10
  end
  inherited Ds: TUniDataSource
    DataSet = mdPesquisa
    Left = 488
    Top = 8
  end
  object WebCharts1: TWebCharts
    Left = 440
  end
  object mdPesquisa: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 368
    Top = 65532
    object mdPesquisasituacao: TStringField
      FieldName = 'situacao'
      Size = 60
    end
    object mdPesquisahomens: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'homens'
      Calculated = True
    end
    object mdPesquisamulheres: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'mulheres'
      Calculated = True
    end
    object mdPesquisacisgenero: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'cisgenero'
      Calculated = True
    end
    object mdPesquisatransgenero: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'transgenero'
      Calculated = True
    end
    object mdPesquisabinario: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'binario'
      Calculated = True
    end
    object mdPesquisaoutros: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'outros'
      Calculated = True
    end
    object mdPesquisatotal: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'total'
      Calculated = True
    end
  end
  object mdPesquisaSecretaria: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 688
    Top = 4
    object mdPesquisaSecretariaativo: TCurrencyField
      FieldName = 'ativo'
    end
    object mdPesquisaSecretariainadimplente: TCurrencyField
      FieldName = 'inadimplente'
    end
    object mdPesquisaSecretariasuspenso: TCurrencyField
      FieldName = 'suspenso'
    end
    object mdPesquisaSecretariaafastado: TCurrencyField
      FieldName = 'afastado'
    end
    object mdPesquisaSecretariainativo: TCurrencyField
      FieldName = 'inativo'
    end
    object mdPesquisaSecretariacancelado: TCurrencyField
      FieldName = 'cancelado'
    end
    object mdPesquisaSecretariasecretaria: TStringField
      FieldName = 'secretaria'
      Size = 120
    end
    object mdPesquisaSecretariatotal: TIntegerField
      FieldName = 'total'
    end
  end
  object dssecretaria: TUniDataSource
    DataSet = mdPesquisaSecretaria
    Left = 744
    Top = 8
  end
end
