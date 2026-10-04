inherited FrmEmpCad: TFrmEmpCad
  Caption = 'EMPRESA'
  ClientHeight = 471
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitHeight = 471
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 443
    ExplicitTop = 443
    ExplicitWidth = 644
  end
  inherited PanelClient: TPanel
    Height = 400
    ExplicitHeight = 400
    inherited dxBevel1: TdxBevel
      Height = 394
      ExplicitLeft = 1
      ExplicitTop = 3
      ExplicitHeight = 400
    end
    object Label1: TLabel [1]
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
    object Label3: TLabel [2]
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
    object Label2: TLabel [3]
      Left = 5
      Top = 59
      Width = 29
      Height = 17
      Caption = 'Sede'
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
      Left = 433
      Top = 75
      Width = 70
      Height = 27
      Caption = 'Incluir'
      TabOrder = 5
      OnClick = BtnSalvarClick
      ExplicitLeft = 433
      ExplicitTop = 75
      ExplicitWidth = 70
      ExplicitHeight = 27
    end
    inherited BtnCancelar: TStyledBitBtn
      Left = 575
      Top = 75
      Width = 70
      Height = 27
      Caption = 'Excluir'
      TabOrder = 6
      OnClick = BtnCancelarClick
      ExplicitLeft = 575
      ExplicitTop = 75
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
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 1
      Width = 568
    end
    object cxSede: TcxLookupComboBox
      Left = 5
      Top = 77
      Cursor = crIBeam
      Properties.Alignment.Horz = taLeftJustify
      Properties.CaseSensitiveSearch = True
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownRows = 10
      Properties.DropDownWidth = 400
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id_sede'
      Properties.ListColumns = <
        item
          Width = 300
          FieldName = 'nsede'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = dsSede
      EditValue = 0
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 2
      Width = 341
    end
    object BtnSede: TcxButtonEdit
      Left = 343
      Top = 77
      Cursor = crHandPoint
      TabStop = False
      Properties.Buttons = <
        item
          Default = True
          Glyph.SourceDPI = 96
          Glyph.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            610000002C744558745469746C65004164643B4974656D3B4164644974656D3B
            426172733B526962626F6E3B4974656D3B506C75734E32EF8100000286494441
            54785E5D915D48545B14C77FFB9C199D11CDA264A2C828B2A44891B844491924
            A441915020611045742F04D14B11D1439015193E28652541057D125CEFBDF8D0
            43D017D8BDE0EDC1BC57ED8331106AC6907072C673CEDEAB98738686D9ECBDD8
            9BCDFFBF7E6B2D05D8B7FF1C7962DB768320002020E2DF252F8880E7382F0EEE
            A9691411072004584AA986BDDB5700148A0005FC34BBD537BA09B00172064A6B
            01C0714D8E01113F0882BF15C5610BCF330056BE01DA8000264F1DE803A2E01F
            411B0D4001819BAB3B10E5F74005068288CA11A8020300C1989F225028019409
            5E0631B0A8A204C06ABBF88AD9B4830528CFD501B2600013D4EE89C7B3A1043D
            8FE3B4FF1EA7AB3F4E32AD299BBF387AE7C4068504CD7082261A14C677427B2E
            97FF7ACF6832C3968D0BF9AD75395BEA63A4EC302DC7EFFFB1B8BA3EFAE84C83
            CA1218CF030163C4CF2E86FE810954B14D63C312929922B6ED7F80A722346FAD
            64CDCA8AF5EB769E3C05D85903D71F9F2F3682D6FA077A92BADA1803EF1C1229
            8D339B617246F37ADCA5B6268656E17D40289435D006117F9C205862484CCEF0
            E1AB45C7B9BB686310ED71F8C8358CD6F474FD8AEB780B013B9882017C7CB225
            0891B0E1E3C4341DED6D84141C3A7A8587D78F90CA0883EFA648CFA43FE7C628
            3982D2888D88C218F8A56A0EFF0CC50947A3D8B6C24967F8EFB3CB976F9A91D7
            1F989EFAD20778214067BEA59E9FEE7CB9591044A0BC2CCCD2452564129FF8F7
            E9104B5757D2DD7D8CBFDF24181F1E67622C3EFC71F0DE59C005B08028500ECC
            05E60567412852BEACBAE94267CDEE1B6375AD77646D4BEFDB554DE72F1595C6
            2A8050F58E5E948850B856EFBA094AF8BFEF80058481A22091011CC0AD6ABE6A
            44E03B805C64CDB4C3E1300000000049454E44AE426082}
          Kind = bkGlyph
        end>
      Properties.CaseInsensitive = False
      Properties.IncrementalSearch = False
      Properties.ViewStyle = vsButtonsOnly
      Properties.OnButtonClick = BtnSedePropertiesButtonClick
      Style.BorderStyle = ebsFlat
      Style.HotTrack = True
      Style.Shadow = False
      Style.TransparentBorder = True
      Style.ButtonStyle = btsDefault
      TabOrder = 3
      Width = 27
    end
    object gbAtivo: TcxGroupBox
      Left = 371
      Top = 77
      PanelStyle.Active = True
      ParentBackground = False
      ParentColor = False
      TabOrder = 4
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
    object Btneditar: TStyledBitBtn
      Left = 504
      Top = 75
      Width = 70
      Height = 27
      Caption = 'Editar'
      TabOrder = 7
      OnClick = BtneditarClick
      StyleFamily = 'Bootstrap'
      StyleClass = 'Secondary'
    end
    object cxGrid: TcxGrid
      Left = 5
      Top = 103
      Width = 640
      Height = 292
      TabOrder = 8
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
        object Gridsind_id_empresa: TcxGridDBColumn
          DataBinding.FieldName = 'sind_id_empresa'
          Visible = False
          Width = 59
        end
        object Gridcodigo: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'codigo'
          Width = 55
        end
        object Griddescricao: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'descricao'
          Width = 224
        end
        object Gridrazao: TcxGridDBColumn
          Caption = 'Sede'
          DataBinding.FieldName = 'razao'
          Width = 276
        end
        object Gridativo: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'ativo'
          Width = 71
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
    Left = 232
    Top = 210
  end
  inherited Ds: TUniDataSource
    DataSet = mdEmpresa
    Left = 280
    Top = 250
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
  object dsSede: TUniDataSource
    DataSet = TabSede
    Left = 160
    Top = 200
  end
  object mdEmpresa: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 232
    Top = 252
    object mdEmpresasind_id_empresa: TIntegerField
      FieldName = 'sind_id_empresa'
    end
    object mdEmpresacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object mdEmpresadescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object mdEmpresaativo: TStringField
      FieldName = 'ativo'
      Size = 8
    end
    object mdEmpresarazao: TStringField
      FieldName = 'razao'
      Size = 120
    end
  end
  object TabSede: TClientDataSet
    PersistDataPacket.Data = {
      D20000009619E0BD010000001800000007000000000003000000D2000769645F
      7365646504000100000000000572617A616F0100490000000100055749445448
      02000200B4000866616E74617369610100490000000100055749445448020002
      00B40004636E706A01004900000001000557494454480200020014000763656C
      756C617201004900000001000557494454480200020014000D73656465707269
      6E636970616C0100490000000100055749445448020002000500056E73656465
      010049000000010005574944544802000200FA000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 195
    object TabSedeid_sede: TIntegerField
      FieldName = 'id_sede'
    end
    object TabSederazao: TStringField
      FieldName = 'razao'
      Size = 180
    end
    object TabSedefantasia: TStringField
      FieldName = 'fantasia'
      Size = 180
    end
    object TabSedecnpj: TStringField
      FieldName = 'cnpj'
    end
    object TabSedecelular: TStringField
      FieldName = 'celular'
    end
    object TabSedesedeprincipal: TStringField
      FieldName = 'sedeprincipal'
      Size = 5
    end
    object TabSedensede: TStringField
      FieldName = 'nsede'
      Size = 250
    end
  end
end
