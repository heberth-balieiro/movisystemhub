inherited FrmCadTipoDocumento: TFrmCadTipoDocumento
  Caption = 'Tipo Documento'
  ClientHeight = 471
  ExplicitHeight = 471
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 443
    ExplicitTop = 443
  end
  inherited PanelClient: TPanel
    Height = 400
    ExplicitHeight = 400
    inherited dxBevel1: TdxBevel
      Height = 394
      ExplicitHeight = 400
    end
    object Label3: TLabel [1]
      Left = 77
      Top = 10
      Width = 36
      Height = 17
      Caption = 'Nome'
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
    object Label1: TLabel [2]
      Left = 5
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
      Left = 424
      Top = 359
      ExplicitLeft = 424
      ExplicitTop = 359
    end
    inherited BtnCancelar: TStyledBitBtn
      Left = 535
      Top = 359
      ExplicitLeft = 535
      ExplicitTop = 359
    end
    object gbAtivo: TcxGroupBox
      Left = 585
      Top = 28
      PanelStyle.Active = True
      ParentBackground = False
      ParentColor = False
      TabOrder = 2
      Transparent = True
      Height = 25
      Width = 60
      object cxAtivo: TcxCheckBox
        Left = 4
        Top = 3
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
        TabOrder = 0
        Transparent = True
      end
    end
    object cxNome: TcxTextEdit
      Left = 77
      Top = 28
      Cursor = crIBeam
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 3
      Width = 508
    end
    object cxCodigo: TcxTextEdit
      Left = 5
      Top = 28
      TabStop = False
      Properties.ReadOnly = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 4
      Width = 73
    end
  end
  inherited Paneltitulo: TPanel
    inherited lblTitulo: TLabel
      Caption = 'Novo Tipo de Documento'
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 384
    Top = 2
  end
  inherited Ds: TUniDataSource
    Left = 344
    Top = 0
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
