inherited FrmConsultaNFe: TFrmConsultaNFe
  Caption = 'NFe'
  ExplicitLeft = 2
  TextHeight = 15
  inherited cxgbfiltro: TcxGroupBox
    inherited pHeader: TPanel
      inherited lTitulo: TLabel
        Width = 71
        Caption = 'NFe'
        ExplicitTop = 15
        ExplicitWidth = 71
      end
      inherited pBusca: TPanel
        Left = 81
        Width = 744
        ExplicitLeft = 81
        ExplicitWidth = 744
        inherited pPesquisa: TPanel
          Left = 501
          ExplicitLeft = 501
        end
        inherited pLimpar: TPanel
          Left = 624
          ExplicitLeft = 624
        end
        inherited cxgbPesquisa: TcxGroupBox
          ExplicitWidth = 495
          Width = 495
          inherited edtBusca: TEdit
            Width = 485
            ExplicitWidth = 485
          end
        end
      end
    end
  end
end
