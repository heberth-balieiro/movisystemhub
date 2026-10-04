inherited FormNovoBaseDiversos: TFormNovoBaseDiversos
  Caption = 'FormNovoBaseDiversos'
  ClientHeight = 520
  ClientWidth = 900
  ExplicitWidth = 900
  ExplicitHeight = 520
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 495
    Width = 900
    ExplicitTop = 495
    ExplicitWidth = 900
  end
  inherited PanelClient: TPanel
    Width = 900
    Height = 455
    ExplicitWidth = 900
    ExplicitHeight = 455
  end
  inherited Paneltitulo: TPanel
    Width = 900
    ExplicitWidth = 900
    inherited lblTitulo: TLabel
      Width = 845
      ExplicitWidth = 845
    end
    inherited BtnFechar: TSpeedButton
      Left = 860
      ExplicitLeft = 860
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 832
    Top = 426
  end
  inherited Ds: TUniDataSource
    Left = 800
    Top = 424
  end
  inherited cxStyle: TcxStyleRepository
    PixelsPerInch = 96
    inherited CxGridPedido: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    inherited GridTableDependente: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
end
