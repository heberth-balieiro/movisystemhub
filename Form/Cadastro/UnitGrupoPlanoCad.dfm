inherited FrmGrupoPlanoCad: TFrmGrupoPlanoCad
  Caption = 'GrupoPlano'
  OnShow = FormShow
  TextHeight = 17
  inherited Paneltitulo: TPanel
    inherited lblTitulo: TLabel
      Caption = 'Novo Grupo de Plano'
    end
  end
  inherited cxGroupBox1: TcxGroupBox
    object Label2: TLabel [2]
      Left = 8
      Top = 55
      Width = 26
      Height = 17
      Caption = 'Tipo'
    end
    inherited edtativo: TcxCheckBox
      Left = 327
      Top = 74
      TabOrder = 3
      ExplicitLeft = 327
      ExplicitTop = 74
    end
    object EdtTipo: TcxLookupComboBox
      Left = 8
      Top = 73
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.KeyFieldNames = 'id_tipo'
      Properties.ListColumns = <
        item
          Caption = 'Descri'#231#227'o'
          Width = 200
          FieldName = 'descricao'
        end
        item
          Caption = 'Tipo'
          Width = 100
          FieldName = 'tipo'
        end>
      Properties.ListSource = dstipo
      EditValue = 0
      TabOrder = 2
      Width = 313
    end
  end
  object dstipo: TDataSource
    DataSet = DM.TabTipoPlano
    Left = 464
    Top = 250
  end
end
