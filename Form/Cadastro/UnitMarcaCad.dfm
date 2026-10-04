inherited FrmMarcaCad: TFrmMarcaCad
  Caption = 'Marca'
  ClientHeight = 471
  Color = clWhite
  OnShow = FormShow
  ExplicitHeight = 471
  TextHeight = 17
  object Label27: TLabel [0]
    Left = 8
    Top = 328
    Width = 232
    Height = 17
    Caption = 'Campo com * s'#227'o campos obrigat'#243'rios'
    WordWrap = True
  end
  inherited PanelButton: TPanel
    Top = 443
    TabOrder = 2
    ExplicitTop = 443
    ExplicitWidth = 644
  end
  inherited PanelClient: TPanel
    Height = 400
    TabOrder = 0
    ExplicitHeight = 400
    inherited dxBevel1: TdxBevel
      Height = 394
      ExplicitHeight = 279
    end
    object Label2: TLabel [1]
      Left = 97
      Top = 10
      Width = 37
      Height = 17
      Caption = 'Marca'
      Color = 8679796
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5325111
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      StyleName = 'Windows'
    end
    object Label3: TLabel [2]
      Left = 9
      Top = 10
      Width = 43
      Height = 17
      Caption = 'C'#243'digo'
      Color = 8679796
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5325111
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      StyleName = 'Windows'
    end
    inherited BtnSalvar: TStyledBitBtn
      Top = 358
      TabOrder = 3
      OnClick = BtnSalvarClick
      ExplicitTop = 358
    end
    inherited BtnCancelar: TStyledBitBtn
      Top = 358
      TabOrder = 4
      OnClick = BtnCancelarClick
      ExplicitTop = 358
    end
    object cxCodigo: TcxTextEdit
      Left = 9
      Top = 28
      TabStop = False
      Properties.ReadOnly = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 0
      OnKeyPress = cxCodigoKeyPress
      Width = 89
    end
    object cxMarca: TcxTextEdit
      Left = 97
      Top = 28
      Cursor = crIBeam
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Style.Color = clWindow
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 1
      Width = 544
    end
    object cxAtivo: TcxCheckBox
      Left = 9
      Top = 59
      Caption = 'Ativo'
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.DisplayGrayed = 'S'
      Properties.ImmediatePost = True
      Properties.ValueChecked = 'S'
      Properties.ValueGrayed = 'N'
      Properties.ValueUnchecked = 'N'
      State = cbsChecked
      Style.TransparentBorder = False
      StyleFocused.Color = 15855596
      TabOrder = 2
      Transparent = True
    end
  end
  inherited Paneltitulo: TPanel
    TabOrder = 1
    ExplicitWidth = 644
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 424
    Top = 178
  end
  inherited Ds: TUniDataSource
    Left = 392
    Top = 176
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
