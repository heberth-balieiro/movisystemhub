inherited FrmHistoricoProduto: TFrmHistoricoProduto
  Caption = 'Hist'#243'rico Produto'
  TextHeight = 17
  inherited cxGroupBox1: TcxGroupBox
    Left = 197
    Top = 76
    ExplicitLeft = 197
    ExplicitTop = 76
    inherited Label1: TLabel
      Width = 47
      Caption = 'Produto'
      ExplicitWidth = 47
    end
    inherited Label4: TLabel
      Left = 450
      Width = 49
      Caption = 'Unidade'
      ExplicitLeft = 450
      ExplicitWidth = 49
    end
    object Label2: TLabel [2]
      Left = 536
      Top = 6
      Width = 47
      Height = 17
      Caption = 'Estoque'
    end
    object Label3: TLabel [3]
      Left = 5
      Top = 55
      Width = 63
      Height = 17
      Caption = 'Data In'#237'cial'
    end
    object Label5: TLabel [4]
      Left = 107
      Top = 55
      Width = 57
      Height = 17
      Caption = 'Data Final'
    end
    object Label6: TLabel [5]
      Left = 209
      Top = 55
      Width = 26
      Height = 17
      Caption = 'Tipo'
    end
    inherited edtcodigo: TcxTextEdit
      Left = 450
      TabOrder = 1
      ExplicitLeft = 450
      ExplicitHeight = 25
    end
    inherited edtDescricao: TcxTextEdit
      Left = 552
      Top = 74
      TabOrder = 3
      Visible = False
      ExplicitLeft = 552
      ExplicitTop = 74
      ExplicitWidth = 89
      ExplicitHeight = 25
      Width = 89
    end
    inherited edtativo: TcxCheckBox
      Left = 69
      Top = 3
      TabOrder = 8
      Visible = False
      ExplicitLeft = 69
      ExplicitTop = 3
      ExplicitWidth = 52
    end
    inherited cxGrid: TcxGrid
      Top = 103
      Height = 231
      TabOrder = 9
      ExplicitLeft = 7
      ExplicitTop = 103
      ExplicitWidth = 616
      ExplicitHeight = 231
      inherited cxGridDB: TcxGridDBTableView
        DataController.DataSource = ds
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            FieldName = 'codigo'
            Column = coll1
          end
          item
            Kind = skSum
            FieldName = 'qtde'
            Column = coll5
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
        inherited coll1: TcxGridDBColumn
          Caption = 'Data'
          DataBinding.FieldName = 'data'
          Width = 74
        end
        inherited coll2: TcxGridDBColumn
          Caption = 'Tipo'
          DataBinding.FieldName = 'tipo'
          Width = 81
        end
        inherited coll3: TcxGridDBColumn
          Caption = 'Observa'#231#227'o'
          DataBinding.FieldName = 'obs'
          Width = 379
        end
        inherited coll5: TcxGridDBColumn
          Caption = 'Quantidade'
          DataBinding.FieldName = 'qtde'
          Width = 84
        end
      end
    end
    object data1: TcxDateEdit
      Left = 5
      Top = 74
      Properties.ClearKey = 16452
      Properties.DateButtons = []
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 4
      Width = 96
    end
    object data2: TcxDateEdit
      Left = 107
      Top = 74
      Properties.ClearKey = 16452
      Properties.DateButtons = []
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 5
      Width = 96
    end
    object edttipo: TcxComboBox
      Left = 209
      Top = 74
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Entrada'
        'Sa'#237'da'
        'Ajuste')
      TabOrder = 6
      Text = 'Entrada'
      Width = 111
    end
    object btnIncluir: TcxButton
      Left = 326
      Top = 74
      Width = 83
      Height = 25
      Cursor = crHandPoint
      Caption = 'Pesquisar'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000001974455874536F6674776172650041646F626520496D616765526561
        647971C9653C00000026744558745469746C650046696E643B426172733B5269
        62626F6E3B5374616E646172643B536561726368BB659C080000009549444154
        785EA592C10DC3200C459B7598815118A21324ED0E6C81D299B8C01AAE5DFD5C
        ACDA4AE2C3932CFDAF27C03C8828C46FC8390B0B5398C64C017341660B507831
        6420D9E2090A8A83D99824601EC88A2768286DBA201264CD134C94D21F414236
        C382F015EE3E22811DEB3E30D6E8B31A02F7237DB4440B5C507E6BC9158125A9
        6705D649BA21B04F012AD399E72108F1057CFE2C0C2A4306D60000000049454E
        44AE426082}
      TabOrder = 7
      OnClick = btnIncluirClick
    end
    object edtproduto: TcxLookupComboBox
      Left = 5
      Top = 24
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'idproduto'
      Properties.ListColumns = <
        item
          FieldName = 'npesquisa'
        end>
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = dsProduto
      EditValue = 0
      TabOrder = 0
      OnExit = edtprodutoExit
      Width = 439
    end
    object edtestoque: TcxCurrencyEdit
      Left = 536
      Top = 24
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      Properties.ReadOnly = True
      TabOrder = 2
      Width = 89
    end
  end
  object PSalvar: TPanel [1]
    Left = 0
    Top = 0
    Width = 185
    Height = 41
    TabOrder = 1
    Visible = False
  end
  object Paneltitulo: TPanel [2]
    Left = 0
    Top = 0
    Width = 185
    Height = 41
    TabOrder = 2
    object lblTitulo: TLabel
      Left = 0
      Top = 0
      Width = 104
      Height = 17
      Caption = 'Hist'#243'rico produto'
    end
  end
  object pNovo: TPanel [3]
    Left = 0
    Top = 0
    Width = 185
    Height = 41
    TabOrder = 3
    Visible = False
  end
  object peditar: TPanel [4]
    Left = 0
    Top = 0
    Width = 185
    Height = 41
    TabOrder = 4
    Visible = False
  end
  object PExcluir: TPanel [5]
    Left = 0
    Top = 0
    Width = 185
    Height = 41
    TabOrder = 5
    Visible = False
  end
  inherited ds: TUniDataSource
    DataSet = DM.TabHistoricoProduto
    Left = 384
  end
  object dsProduto: TUniDataSource
    DataSet = DM.TabProduto
    Left = 96
    Top = 218
  end
end
