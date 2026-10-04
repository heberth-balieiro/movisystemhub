inherited FrmTransportadoraConsulta: TFrmTransportadoraConsulta
  Caption = 'Transportadora'
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 17
  inherited PanelClient: TPanel
    inherited cxGrid: TcxGrid
      inherited Grid: TcxGridDBTableView
        DataController.DataSource = Ds
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
        object gcodigo: TcxGridDBColumn
          Caption = 'C'#243'digo'
          DataBinding.FieldName = 'codigo'
          Width = 57
        end
        object grazao: TcxGridDBColumn
          Caption = 'Raz'#227'o'
          DataBinding.FieldName = 'razao'
          Width = 313
        end
        object gCnpj: TcxGridDBColumn
          Caption = 'CNPJ'
          DataBinding.FieldName = 'cnpj'
          Width = 118
        end
        object GridColumn1: TcxGridDBColumn
          Caption = 'Telefone'
          DataBinding.FieldName = 'telefone'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditMask = '!\(99\)99999-9999;1;_'
          Width = 105
        end
        object gCidade: TcxGridDBColumn
          Caption = 'Cidade'
          DataBinding.FieldName = 'nmcidade'
          Width = 200
        end
        object GridColumn2: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'ativo'
          Width = 93
        end
      end
    end
  end
  inherited Ds: TUniDataSource
    DataSet = mdPesquisa
    Left = 416
    Top = 216
  end
  inherited cxStyle: TcxStyleRepository
    Left = 287
    Top = 7
    PixelsPerInch = 96
    inherited CxGridPedido: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    inherited GridTableDependente: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
  inherited cxIMGMenu: TcxImageList
    FormatVersion = 1
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
    Left = 560
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object mdPesquisa: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 376
    Top = 220
    object mdPesquisaid_transportadora: TIntegerField
      FieldName = 'id_transportadora'
    end
    object mdPesquisacodigo: TIntegerField
      FieldName = 'codigo'
    end
    object mdPesquisacnpj: TStringField
      FieldName = 'cnpj'
      Size = 18
    end
    object mdPesquisarazao: TStringField
      FieldName = 'razao'
      Size = 180
    end
    object mdPesquisafantasia: TStringField
      FieldName = 'fantasia'
      Size = 90
    end
    object mdPesquisaie: TStringField
      FieldName = 'ie'
    end
    object mdPesquisaantt: TStringField
      FieldName = 'antt'
    end
    object mdPesquisaemail: TStringField
      FieldName = 'email'
      Size = 180
    end
    object mdPesquisatelefone: TStringField
      FieldName = 'telefone'
    end
    object mdPesquisaativo: TStringField
      FieldName = 'ativo'
      Size = 10
    end
    object mdPesquisanmcidade: TStringField
      FieldName = 'nmcidade'
      Size = 80
    end
  end
end
