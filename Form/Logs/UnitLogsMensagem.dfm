inherited FrmLogsMensagem: TFrmLogsMensagem
  Caption = 'Logs Mensagem'
  TextHeight = 15
  inherited cxGrid: TcxGrid
    ExplicitTop = 100
    ExplicitHeight = 493
  end
  inherited cxgbfiltro: TcxGroupBox
    inherited pHeader: TPanel
      inherited lTitulo: TLabel
        Caption = 'Logs'
      end
      inherited pNovo: TPanel
        ExplicitHeight = 36
      end
      inherited pBusca: TPanel
        inherited pPesquisa: TPanel
          ExplicitHeight = 36
        end
        inherited pLimpar: TPanel
          ExplicitHeight = 36
        end
      end
      inherited PPopPap: TPanel
        ExplicitHeight = 36
      end
    end
  end
end
