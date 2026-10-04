inherited FrmBaseRelatorio: TFrmBaseRelatorio
  ClientHeight = 400
  ClientWidth = 450
  Color = clWhite
  ExplicitWidth = 450
  ExplicitHeight = 400
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 375
    Width = 450
    TabOrder = 3
    ExplicitTop = 375
    ExplicitWidth = 450
  end
  inherited PanelClient: TPanel
    Width = 450
    Height = 335
    TabOrder = 0
    ExplicitWidth = 450
    ExplicitHeight = 335
  end
  inherited Paneltitulo: TPanel
    Width = 450
    TabOrder = 2
    ExplicitWidth = 450
    inherited lblTitulo: TLabel
      Width = 395
      ExplicitWidth = 395
    end
    inherited BtnFechar: TSpeedButton
      Left = 410
      ExplicitLeft = 410
    end
  end
  object cxGroupBox1: TcxGroupBox [3]
    Left = 0
    Top = 40
    Align = alClient
    PanelStyle.Active = True
    TabOrder = 1
    Height = 335
    Width = 450
    object BtnImprimir: TStyledBitBtn
      Left = 225
      Top = 294
      Width = 110
      Height = 37
      Caption = 'Imprimir | F5'
      TabOrder = 0
      OnClick = BtnImprimirClick
      StyleFamily = 'Bootstrap'
      StyleClass = 'Secondary'
    end
    object BtnCancelar: TStyledBitBtn
      Left = 336
      Top = 294
      Width = 110
      Height = 37
      Caption = 'Cancelar | ESC'
      TabOrder = 1
      TabStop = False
      StyleFamily = 'Bootstrap'
      StyleClass = 'Danger'
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 296
    Top = 2
  end
  inherited Ds: TUniDataSource
    Left = 208
    Top = 96
  end
  inherited cxStyle: TcxStyleRepository
    Left = 231
    Top = 65535
    PixelsPerInch = 96
    inherited CxGridPedido: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    inherited GridTableDependente: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
  object frxDB: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSource = Ds
    BCDToCurrency = False
    DataSetOptions = []
    Left = 165
    Top = 96
  end
  object frxPDFExport: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 336
    Top = 64
  end
  object frxSVGExport: TfrxSVGExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    MultiPage = False
    Formatted = False
    PictureFormat = pfPNG
    UnifiedPictures = True
    Navigation = False
    EmbeddedPictures = True
    EmbeddedCSS = True
    Outline = False
    Left = 336
    Top = 120
  end
end
