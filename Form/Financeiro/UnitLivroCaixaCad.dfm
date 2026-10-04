inherited FrmLivroCaixaCad: TFrmLivroCaixaCad
  Caption = 'Livro Caixa'
  OnShow = FormShow
  TextHeight = 17
  inherited Paneltitulo: TPanel
    inherited lblTitulo: TLabel
      Caption = 'Novo Lan'#231'amento'
    end
  end
  inherited cxGroupBox1: TcxGroupBox
    inherited Label1: TLabel
      Width = 48
      Caption = 'N'#250'mero'
      ExplicitWidth = 48
    end
    inherited Label4: TLabel
      Left = 375
      Width = 76
      Caption = 'Documento *'
      ExplicitLeft = 375
      ExplicitWidth = 76
    end
    object Label2: TLabel [2]
      Left = 511
      Top = 6
      Width = 39
      Height = 17
      Caption = 'Valor *'
    end
    object Label3: TLabel [3]
      Left = 211
      Top = 6
      Width = 67
      Height = 17
      Caption = 'Opera'#231#227'o *'
    end
    object Label5: TLabel [4]
      Left = 94
      Top = 6
      Width = 36
      Height = 17
      Caption = 'Data *'
    end
    object Label6: TLabel [5]
      Left = 8
      Top = 55
      Width = 104
      Height = 17
      Caption = 'Centro de Custo *'
    end
    object Label7: TLabel [6]
      Left = 8
      Top = 105
      Width = 104
      Height = 17
      Caption = 'Plano de Contas *'
    end
    object Label8: TLabel [7]
      Left = 8
      Top = 155
      Width = 61
      Height = 17
      Caption = 'Hist'#243'rico *'
    end
    inherited edtcodigo: TcxTextEdit
      ExplicitHeight = 25
    end
    inherited edtDescricao: TcxTextEdit
      Left = 375
      TabOrder = 3
      ExplicitLeft = 375
      ExplicitWidth = 130
      ExplicitHeight = 25
      Width = 130
    end
    object edtData: TcxDateEdit [10]
      Left = 94
      Top = 24
      Properties.ClearKey = 16452
      Properties.DateButtons = []
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 111
    end
    object edtOperacao: TcxComboBox [11]
      Left = 211
      Top = 24
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Entrada'
        'Sa'#237'da')
      Properties.OnChange = edtOperacaoPropertiesChange
      TabOrder = 2
      OnExit = edtOperacaoPropertiesChange
      Width = 158
    end
    object edtvalor: TcxCurrencyEdit [12]
      Left = 511
      Top = 24
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      TabOrder = 4
      Width = 111
    end
    object edtCusto: TcxLookupComboBox [13]
      Left = 8
      Top = 74
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = 'C'#243'digo'
          Width = 65
          FieldName = 'codigo'
        end
        item
          Caption = 'Centro de Custo'
          Width = 250
          FieldName = 'descricao'
        end>
      Properties.ListFieldIndex = 1
      Properties.ListSource = dsCusto
      EditValue = 0
      TabOrder = 5
      Width = 614
    end
    object edtConta: TcxLookupComboBox [14]
      Left = 8
      Top = 124
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = 'C'#243'digo'
          Width = 64
          FieldName = 'codigo'
        end
        item
          Caption = 'Plano'
          Width = 100
          FieldName = 'descricao'
        end
        item
          Caption = 'SubPlano'
          Width = 100
          FieldName = 'nsubplano'
        end
        item
          Caption = 'Grupo Plano'
          Width = 100
          FieldName = 'ngrupoplano'
        end
        item
          Caption = 'Tipo Plano'
          Width = 50
          FieldName = 'ntipoplano'
        end>
      Properties.ListFieldIndex = 1
      Properties.ListSource = dsPlano
      EditValue = 0
      TabOrder = 6
      Width = 614
    end
    inherited edtativo: TcxCheckBox
      Left = 450
      Top = 248
      TabOrder = 8
      Visible = False
      ExplicitLeft = 450
      ExplicitTop = 248
      ExplicitWidth = 47
    end
    object edtHistorico: TcxMemo
      Left = 8
      Top = 174
      Properties.CharCase = ecUpperCase
      Properties.MaxLength = 250
      TabOrder = 7
      Height = 90
      Width = 614
    end
  end
  object edtlancamento: TcxCheckBox [5]
    Left = 8
    Top = 351
    Caption = 'Lan'#231'amento em seguencia'
    Style.TransparentBorder = False
    TabOrder = 4
    Transparent = True
    Visible = False
  end
  object dsCusto: TDataSource
    DataSet = DM.TabCusto
    Left = 280
    Top = 320
  end
  object dsPlano: TDataSource
    DataSet = DM.TabPlanoConta
    Left = 328
    Top = 320
  end
end
