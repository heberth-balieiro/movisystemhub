inherited FrmAjusteestoque: TFrmAjusteestoque
  Caption = 'Estoque'
  TextHeight = 17
  inherited Paneltitulo: TPanel
    inherited lblTitulo: TLabel
      Caption = 'Ajuste de Estoque'
    end
  end
  inherited cxGroupBox1: TcxGroupBox
    ExplicitLeft = 32
    ExplicitTop = 56
    inherited Label1: TLabel
      Width = 27
      Caption = 'Data'
      ExplicitWidth = 27
    end
    inherited Label4: TLabel
      Left = 135
      Top = 55
      Width = 56
      Caption = 'Produto *'
      ExplicitLeft = 135
      ExplicitTop = 55
      ExplicitWidth = 56
    end
    object Label2: TLabel [2]
      Left = 135
      Top = 6
      Width = 35
      Height = 17
      Caption = 'Tipo *'
    end
    object Label3: TLabel [3]
      Left = 8
      Top = 55
      Width = 43
      Height = 17
      Caption = 'C'#243'digo'
    end
    object Label5: TLabel [4]
      Left = 456
      Top = 55
      Width = 65
      Height = 17
      Caption = 'Qtde. Atual'
    end
    object Label6: TLabel [5]
      Left = 542
      Top = 55
      Width = 72
      Height = 17
      Caption = 'Qtde. Nova*'
    end
    object Label7: TLabel [6]
      Left = 267
      Top = 6
      Width = 55
      Height = 17
      Caption = 'Anota'#231#227'o'
    end
    inherited edtcodigo: TcxTextEdit
      Top = 74
      TabOrder = 3
      ExplicitTop = 74
      ExplicitWidth = 121
      ExplicitHeight = 25
      Width = 121
    end
    inherited edtDescricao: TcxTextEdit
      Left = 267
      TabOrder = 2
      ExplicitLeft = 267
      ExplicitWidth = 355
      ExplicitHeight = 25
      Width = 355
    end
    inherited edtativo: TcxCheckBox
      Left = 3
      Top = 251
      TabOrder = 7
      Visible = False
      ExplicitLeft = 3
      ExplicitTop = 251
      ExplicitWidth = 47
    end
    object edtqtdemt: TcxCurrencyEdit
      Left = 456
      Top = 74
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      Properties.ReadOnly = True
      TabOrder = 5
      Width = 80
    end
    object edtData: TcxDateEdit
      Left = 8
      Top = 24
      EditValue = 0d
      Properties.ClearKey = 16452
      Properties.DateButtons = []
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 0
      Width = 121
    end
    object edtTipo: TcxComboBox
      Left = 135
      Top = 24
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'ENTRADA'
        'SA'#205'DA'
        'AJUSTE')
      TabOrder = 1
      Width = 126
    end
    object edtcidade: TcxLookupComboBox
      Left = 135
      Top = 74
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.KeyFieldNames = 'id_cidade'
      Properties.ListColumns = <
        item
          FieldName = 'cidade'
        end
        item
          FieldName = 'uf'
        end>
      EditValue = 0
      TabOrder = 4
      Width = 315
    end
    object cxCurrencyEdit1: TcxCurrencyEdit
      Left = 542
      Top = 74
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      TabOrder = 6
      Width = 80
    end
  end
end
