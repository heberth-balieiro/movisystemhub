inherited FrmLotacaoCad: TFrmLotacaoCad
  Caption = 'Lota'#231#227'o'
  ClientHeight = 471
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitHeight = 471
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 443
    ExplicitTop = 443
    ExplicitWidth = 644
    object btnSincronizar: TSpeedButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 26
      Height = 19
      Cursor = crHandPoint
      Align = alLeft
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000B8824DFFB8824DFFB8824DFFB882
        4DFFB8824DFF0000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000B8824DFFB8824DFFB8824DFFB882
        4DFFB8824DFF0000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000B8824DFFB8824DFFB8824DFFB882
        4DFFB8824DFF0000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000B8824DFFB8824DFFB8824DFFB882
        4DFFB8824DFF0000000000000000000000000000000000000000000000003827
        174DB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
        4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFF3827174D000000000000
        00003827174DB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
        4DFFB8824DFFB8824DFFB8824DFFB8824DFF3827174D00000000000000000000
        0000000000003827174DB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB882
        4DFFB8824DFFB8824DFFB8824DFF3827174D0000000000000000000000000000
        000000000000000000003827174DB8824DFFB8824DFFB8824DFFB8824DFFB882
        4DFFB8824DFFB8824DFF3827174D000000000000000000000000000000000000
        00000000000000000000000000003827174DB8824DFFB8824DFFB8824DFFB882
        4DFFB8824DFF3827174D00000000000000000000000000000000000000000000
        0000000000000000000000000000000000003827174DB8824DFFB8824DFFB882
        4DFF3827174D0000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000003827174DB8824DFF3827
        174D000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000003827174D0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      OnClick = btnSincronizarClick
      ExplicitLeft = 11
      ExplicitTop = 6
    end
  end
  inherited PanelClient: TPanel
    Height = 400
    ExplicitHeight = 400
    inherited dxBevel1: TdxBevel
      Height = 394
      ExplicitHeight = 400
    end
    object Label3: TLabel [1]
      Left = 77
      Top = 10
      Width = 36
      Height = 17
      Caption = 'Nome'
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
    object Label1: TLabel [2]
      Left = 5
      Top = 10
      Width = 43
      Height = 17
      Caption = 'C'#243'digo'
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
      Left = 431
      Top = 59
      Width = 70
      Height = 27
      Caption = 'Incluir'
      TabOrder = 3
      OnClick = BtnSalvarClick
      ExplicitLeft = 431
      ExplicitTop = 59
      ExplicitWidth = 70
      ExplicitHeight = 27
    end
    inherited BtnCancelar: TStyledBitBtn
      Left = 573
      Top = 59
      Width = 70
      Height = 27
      Caption = 'Excluir'
      TabOrder = 4
      OnClick = BtnCancelarClick
      ExplicitLeft = 573
      ExplicitTop = 59
      ExplicitWidth = 70
      ExplicitHeight = 27
    end
    object gbAtivo: TcxGroupBox
      Left = 583
      Top = 28
      PanelStyle.Active = True
      ParentBackground = False
      ParentColor = False
      TabOrder = 2
      Transparent = True
      Height = 25
      Width = 60
      object cxAtivo: TcxCheckBox
        Left = 4
        Top = 3
        Caption = 'Ativo'
        Properties.DisplayChecked = 'S'
        Properties.DisplayUnchecked = 'N'
        Properties.DisplayGrayed = 'S'
        Properties.ImmediatePost = True
        Properties.ValueChecked = 'S'
        Properties.ValueGrayed = 'N'
        Properties.ValueUnchecked = 'N'
        State = cbsChecked
        Style.TransparentBorder = False
        StyleFocused.Color = 15855596
        TabOrder = 0
        Transparent = True
      end
    end
    object cxNome: TcxTextEdit
      Left = 77
      Top = 28
      Cursor = crIBeam
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 1
      Width = 506
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
    object Btneditar: TStyledBitBtn
      Left = 502
      Top = 59
      Width = 70
      Height = 27
      Caption = 'Editar'
      TabOrder = 5
      OnClick = BtneditarClick
      StyleFamily = 'Bootstrap'
      StyleClass = 'Secondary'
    end
    object cxGrid: TcxGrid
      Left = 5
      Top = 87
      Width = 640
      Height = 308
      TabOrder = 6
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
        OptionsData.Editing = False
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
        object Gridid_lotacao: TcxGridDBColumn
          DataBinding.FieldName = 'id_lotacao'
          Visible = False
        end
        object Gridcodigo: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'codigo'
          Width = 54
        end
        object Griddescricao: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'descricao'
          Width = 508
        end
        object Gridativo: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'ativo'
          Width = 64
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = Grid
      end
    end
  end
  inherited Paneltitulo: TPanel
    ExplicitWidth = 644
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 312
    Top = 250
  end
  inherited Ds: TUniDataSource
    DataSet = mdDados
    Left = 272
    Top = 248
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
  object mdDados: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 232
    Top = 252
    object mdDadosid_lotacao: TIntegerField
      FieldName = 'id_lotacao'
    end
    object mdDadoscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object mdDadosdescricao: TStringField
      FieldName = 'descricao'
      Size = 120
    end
    object mdDadosativo: TStringField
      FieldName = 'ativo'
      Size = 8
    end
  end
end
