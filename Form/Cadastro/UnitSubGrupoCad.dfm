inherited FrmSubgrupoCad: TFrmSubgrupoCad
  Caption = 'Sub-Grupo'
  OnShow = FormShow
  TextHeight = 17
  inherited Paneltitulo: TPanel
    inherited lblTitulo: TLabel
      Caption = 'Novo Sub-Grupo'
    end
  end
  inherited cxGroupBox1: TcxGroupBox
    object Label2: TLabel [2]
      Left = 8
      Top = 55
      Width = 37
      Height = 17
      Caption = 'Grupo'
    end
    inherited edtativo: TcxCheckBox
      Left = 575
      Top = 75
      TabOrder = 3
      ExplicitLeft = 575
      ExplicitTop = 75
    end
    object EdtTipo: TcxLookupComboBox
      Left = 8
      Top = 73
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.KeyFieldNames = 'id_grupoplano'
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
      Properties.ListSource = dsGrupo
      EditValue = 0
      TabOrder = 2
      Width = 561
    end
  end
  object dsGrupo: TDataSource
    DataSet = DM.TabGrupoPlano
    Left = 528
    Top = 234
  end
end
