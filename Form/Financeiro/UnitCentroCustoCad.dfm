inherited FrmCustoCad: TFrmCustoCad
  Caption = 'Centro de Custo'
  OnShow = FormShow
  TextHeight = 17
  inherited Paneltitulo: TPanel
    inherited lblTitulo: TLabel
      Caption = 'Novo Centro de Custo'
    end
  end
  inherited cxGroupBox1: TcxGroupBox
    inherited edtcodigo: TcxTextEdit
      ExplicitHeight = 25
    end
    inherited edtDescricao: TcxTextEdit
      ExplicitHeight = 25
    end
    inherited edtativo: TcxCheckBox
      ExplicitWidth = 47
    end
  end
end
