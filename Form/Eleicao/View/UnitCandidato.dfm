inherited FrmCandidato: TFrmCandidato
  Caption = 'Candidato'
  Color = clWhite
  TextHeight = 17
  inherited PanelClient: TPanel
    inherited cxGrid: TcxGrid
      inherited Grid: TcxGridDBTableView
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
      end
    end
  end
  inherited cxIMGMenu: TcxImageList
    FormatVersion = 1
  end
end
