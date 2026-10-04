inherited FrmPlanoContaCons: TFrmPlanoContaCons
  Caption = 'Plano de Contas'
  OnShow = FormShow
  TextHeight = 17
  inherited PanelClient: TPanel
    inherited cxGrid: TcxGrid
      BorderStyle = cxcbsNone
      inherited Grid: TcxGridDBTableView
        FindPanel.InfoText = 'Informe sua pesquisa'
        DataController.DataSource = Ds
        OptionsView.ShowColumnFilterButtons = sfbWhenSelected
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
        object gId: TcxGridDBColumn
          DataBinding.FieldName = 'id_planoconta'
          Visible = False
        end
        object gCodigo: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'id_planoconta'
          Width = 53
        end
        object gDescricao: TcxGridDBColumn
          Caption = 'C'#243'digo/Descri'#231#227'o'
          DataBinding.FieldName = 'descricao'
          Width = 506
        end
        object gSubgrupo: TcxGridDBColumn
          Caption = 'N'#237'vel'
          DataBinding.FieldName = 'desnivel'
          Width = 123
        end
        object gGrupo: TcxGridDBColumn
          Caption = 'Aceita Lan'#231'amento'
          DataBinding.FieldName = 'aceita_lancamento'
          Width = 133
        end
        object gtipo: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'ativo'
          Width = 73
        end
      end
    end
  end
  inherited PanelFiltro: TPanel
    inherited GBFiltro: TcxGroupBox
      inherited EdtBusca: TcxTextEdit
        ExplicitHeight = 25
      end
      inherited cxAtivo: TcxComboBox
        ExplicitHeight = 25
      end
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 384
  end
  inherited Ds: TUniDataSource
    DataSet = mdPesquisa
    Left = 440
    Top = 8
  end
  inherited cxStyle: TcxStyleRepository
    Left = 487
    Top = 7
    PixelsPerInch = 96
    inherited cxStyle2: TcxStyle
      Font.Height = -13
    end
    inherited cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Font.Height = -13
    end
    inherited CxGridPedido: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    inherited GridTableDependente: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
  inherited MenuPop: TPopupMenu
    Left = 328
    Top = 4
    object BtnNovoFilho: TMenuItem [0]
      Caption = 'Novo Filho'
      OnClick = BtnNovoFilhoClick
    end
  end
  inherited cxIMGMenu: TcxImageList
    FormatVersion = 1
    Left = 288
    DesignInfo = 524576
  end
  object frxReport: TfrxReport
    Version = '2022.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45613.462229537040000000
    ReportOptions.LastChange = 45613.462229537040000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 248
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object mdPesquisa: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 192
    Top = 12
    object mdPesquisaid_planoconta: TIntegerField
      FieldName = 'id_planoconta'
    end
    object mdPesquisacodigo: TStringField
      FieldName = 'codigo'
      Size = 35
    end
    object mdPesquisadescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object mdPesquisaid_pai: TIntegerField
      FieldName = 'id_pai'
    end
    object mdPesquisanivel: TIntegerField
      FieldName = 'nivel'
    end
    object mdPesquisaaceita_lancamento: TStringField
      FieldName = 'aceita_lancamento'
      Size = 6
    end
    object mdPesquisaativo: TStringField
      FieldName = 'ativo'
      Size = 10
    end
    object mdPesquisaordem: TIntegerField
      FieldName = 'ordem'
    end
    object mdPesquisadesnivel: TStringField
      FieldName = 'desnivel'
      Size = 40
    end
    object mdPesquisatipo: TStringField
      FieldName = 'tipo'
      Size = 30
    end
  end
end
