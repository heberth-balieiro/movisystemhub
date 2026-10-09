inherited FrmAssociadoAtualizacao: TFrmAssociadoAtualizacao
  Caption = 'Atualiza'#231#227'o Cadastrais (API)'
  Color = clWhite
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 17
  inherited PanelButton: TPanel
    TabOrder = 3
  end
  inherited PanelClient: TPanel
    TabOrder = 0
    inherited cxGrid: TcxGrid
      inherited Grid: TcxGridDBTableView
        OnCellDblClick = GridCellDblClick
        DataController.DataSource = Ds
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
        object GridRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
        end
        object Gridid_socio: TcxGridDBColumn
          DataBinding.FieldName = 'id_socio'
          Visible = False
        end
        object GridColumn5: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'id_solicitacao_api'
          Width = 36
        end
        object Gridcodigo: TcxGridDBColumn
          Caption = 'ID API'
          DataBinding.FieldName = 'pessoa_id_api'
          Width = 49
        end
        object Gridmatricula: TcxGridDBColumn
          Caption = 'Matr'#237'cula'
          DataBinding.FieldName = 'matricula'
          Width = 66
        end
        object Gridnome: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'nome'
          Width = 193
        end
        object Gridcpf: TcxGridDBColumn
          Caption = 'CPF'
          DataBinding.FieldName = 'cpf'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.CharCase = ecUpperCase
          Properties.EditMask = '000\.000\.000\-00;1;_'
          Width = 101
        end
        object Gridcelular: TcxGridDBColumn
          Caption = 'Celular Novo'
          DataBinding.FieldName = 'telefone_novo'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.CharCase = ecUpperCase
          Properties.EditMask = '!\(99\)99999-9999;1;_'
          Width = 98
        end
        object Gridwhatsapp: TcxGridDBColumn
          Caption = 'WhatsApp Novo'
          DataBinding.FieldName = 'whatsapp_novo'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditMask = '!\(99\)99999-9999;1;_'
          Width = 106
        end
        object Gridemail: TcxGridDBColumn
          Caption = 'E-mail Novo'
          DataBinding.FieldName = 'email_novo'
          Width = 155
        end
        object Gridsituacao: TcxGridDBColumn
          Caption = 'Situa'#231#227'o'
          DataBinding.FieldName = 'situacao'
          Width = 81
        end
        object GridColumn1: TcxGridDBColumn
          Caption = 'Recebido em'
          DataBinding.FieldName = 'recebido_em'
          Width = 129
        end
        object GridColumn2: TcxGridDBColumn
          Caption = 'Processado em'
          DataBinding.FieldName = 'processado_em'
          Width = 135
        end
        object GridColumn3: TcxGridDBColumn
          Caption = 'Erro'
          DataBinding.FieldName = 'erro'
          Width = 500
        end
      end
    end
  end
  inherited Paneltitulo: TPanel
    TabOrder = 2
  end
  inherited PanelFiltro: TPanel
    TabOrder = 1
    inherited GBFiltro: TcxGroupBox
      inherited Label2: TLabel
        Left = 422
        ExplicitLeft = 422
      end
      object Label3: TLabel [2]
        Left = 506
        Top = 20
        Width = 54
        Height = 17
        Caption = 'Ordernar'
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
      inherited cxAtivo: TcxComboBox
        Left = 422
        Properties.Items.Strings = (
          'Todos'
          'Pendente'
          'Processado'
          'Erro'
          'Rejeitado')
        ExplicitLeft = 422
        ExplicitHeight = 25
      end
      inherited BtnNovo: TStyledBitBtn
        Caption = 'Processar'
      end
      object cxordenar: TcxComboBox
        Left = 506
        Top = 38
        Cursor = crIBeam
        Properties.ClearKey = 16452
        Properties.DropDownListStyle = lsEditFixedList
        Properties.ImmediatePost = True
        Properties.Items.Strings = (
          'CPF'
          'Matr'#237'cula'
          'Nome'
          'Situa'#231#227'o')
        StyleFocused.Color = 15855596
        TabOrder = 6
        Text = 'Nome'
        Width = 85
      end
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 504
  end
  inherited Ds: TUniDataSource
    DataSet = mdPesquisa
    Left = 272
    Top = 32
  end
  inherited cxStyle: TcxStyleRepository
    Left = 567
    Top = 7
    PixelsPerInch = 96
    inherited CxGridPedido: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    inherited GridTableDependente: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
  object frxRelatorio: TfrxReport [7]
    Tag = 1
    Version = '2022.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43201.435697800900000000
    ReportOptions.LastChange = 44133.448928449100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 656
    Top = 336
    Datasets = <
      item
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'fnome'
        Value = Null
      end>
  end
end
