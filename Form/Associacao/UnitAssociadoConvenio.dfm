inherited FrmAssociadoConvenio: TFrmAssociadoConvenio
  Caption = 'Lista de Conv'#234'nio'
  TextHeight = 17
  inherited Paneltitulo: TPanel
    inherited lblTitulo: TLabel
      Caption = 'Conv'#234'nio vinculado'
    end
  end
  inherited cxGroupBox1: TcxGroupBox
    inherited Label1: TLabel
      Top = 55
      Width = 27
      Caption = 'Data'
      ExplicitTop = 55
      ExplicitWidth = 27
    end
    inherited Label4: TLabel
      Left = 121
      Top = 55
      Width = 89
      Caption = 'Valor Desconto'
      ExplicitLeft = 121
      ExplicitTop = 55
      ExplicitWidth = 89
    end
    object Label13: TLabel [2]
      Left = 5
      Top = 5
      Width = 63
      Height = 17
      Caption = 'Conv'#234'nio *'
    end
    object Label2: TLabel [3]
      Left = 235
      Top = 55
      Width = 61
      Height = 17
      Caption = 'Anota'#231#245'es'
    end
    object Label3: TLabel [4]
      Left = 5
      Top = 105
      Width = 86
      Height = 17
      Caption = 'Data Desconto'
    end
    inherited edtcodigo: TcxTextEdit
      Left = 121
      TabOrder = 5
      Visible = False
      ExplicitLeft = 121
      ExplicitHeight = 25
    end
    inherited edtDescricao: TcxTextEdit
      Left = 132
      TabOrder = 6
      Visible = False
      ExplicitLeft = 132
      ExplicitWidth = 78
      ExplicitHeight = 25
      Width = 78
    end
    inherited edtativo: TcxCheckBox
      Left = 225
      Top = 126
      TabOrder = 4
      ExplicitLeft = 225
      ExplicitTop = 126
      ExplicitWidth = 47
    end
    inherited cxGrid: TcxGrid
      Top = 155
      Height = 181
      TabOrder = 7
      ExplicitTop = 155
      ExplicitHeight = 181
      inherited cxGridDB: TcxGridDBTableView
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
          IsCaptionAssigned = True
        end
        inherited coll2: TcxGridDBColumn
          IsCaptionAssigned = True
        end
        inherited coll3: TcxGridDBColumn
          IsCaptionAssigned = True
        end
        inherited coll5: TcxGridDBColumn
          IsCaptionAssigned = True
        end
      end
    end
    object edtconvenio: TcxLookupComboBox
      Left = 5
      Top = 24
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id_convenio'
      Properties.ListColumns = <
        item
          Caption = 'Conv'#234'nio'
          FieldName = 'npesquisa'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      EditValue = 0
      TabOrder = 0
      Width = 614
    end
    object edtadmissao: TcxDateEdit
      Left = 5
      Top = 74
      Properties.ClearKey = 16452
      Properties.DateButtons = []
      Properties.ImmediatePost = True
      Properties.ReadOnly = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = clWindow
      TabOrder = 1
      Width = 110
    end
    object edtvalor: TcxCurrencyEdit
      Left = 121
      Top = 74
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
      TabOrder = 2
      Width = 108
    end
    object edtobs: TcxBlobEdit
      Left = 235
      Top = 74
      Properties.BlobEditKind = bekMemo
      Properties.ClearKey = 16452
      Properties.ImmediatePost = True
      Properties.MemoCharCase = ecUpperCase
      Properties.MemoMaxLength = 250
      Properties.PopupWidth = 614
      TabOrder = 3
      Width = 384
    end
    object edtGerarTicket: TcxCheckBox
      Left = 121
      Top = 126
      Caption = 'GerarTicket'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      TabOrder = 8
      Transparent = True
    end
    object cxDateEdit1: TcxDateEdit
      Left = 5
      Top = 124
      Properties.ClearKey = 16452
      Properties.DateButtons = []
      Properties.ImmediatePost = True
      Properties.ReadOnly = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.Color = clWindow
      TabOrder = 9
      Width = 110
    end
  end
end
