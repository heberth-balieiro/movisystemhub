inherited FrmMensagem: TFrmMensagem
  Caption = 'Mensagem'
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 17
  inherited PanelClient: TPanel
    inherited cxGrid: TcxGrid
      inherited Grid: TcxGridDBTableView
        DataController.DataSource = Ds
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            FieldName = 'id_mensagem'
            Column = gCodigo
          end>
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
        object gCodigo: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'codigo'
          Width = 67
        end
        object gUso: TcxGridDBColumn
          Caption = 'Utilizar em'
          DataBinding.FieldName = 'uso'
          Width = 232
        end
        object gDescricao: TcxGridDBColumn
          Caption = 'Descri'#231#227'o'
          DataBinding.FieldName = 'descricao'
          Width = 490
        end
        object gMensagem: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'ativo'
          Width = 97
        end
        object gid: TcxGridDBColumn
          DataBinding.FieldName = 'id_mensagem'
          Visible = False
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
    Left = 440
  end
  inherited Ds: TUniDataSource
    DataSet = mdPesquisa
    Left = 184
  end
  inherited MenuPop: TPopupMenu
    Left = 368
    Top = 4
  end
  inherited cxIMGMenu: TcxImageList
    FormatVersion = 1
    Left = 296
    DesignInfo = 524584
  end
  object frxRelatorio: TfrxReport
    Version = '2022.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45613.680652453700000000
    ReportOptions.LastChange = 45613.680652453700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 568
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object mdPesquisa: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 216
    Top = 4
    object mdPesquisaid_mensagem: TIntegerField
      FieldName = 'id_mensagem'
    end
    object mdPesquisacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object mdPesquisadescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object mdPesquisaativo: TStringField
      FieldName = 'ativo'
      Size = 10
    end
    object mdPesquisauso: TStringField
      FieldName = 'uso'
      Size = 60
    end
  end
end
