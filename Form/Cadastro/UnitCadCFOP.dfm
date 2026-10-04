inherited FrmCadCFOP: TFrmCadCFOP
  Caption = 'CFOP'
  ClientHeight = 350
  OnShow = FormShow
  ExplicitHeight = 350
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 322
    ExplicitTop = 322
  end
  inherited PanelClient: TPanel
    Height = 279
    ExplicitHeight = 279
    inherited dxBevel1: TdxBevel
      Height = 273
      ExplicitTop = 3
      ExplicitHeight = 279
    end
    object Label1: TLabel [1]
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
    object Label2: TLabel [2]
      Left = 9
      Top = 59
      Width = 78
      Height = 17
      Caption = 'C'#243'digo CFOP'
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
    object Label3: TLabel [3]
      Left = 98
      Top = 10
      Width = 53
      Height = 17
      Caption = 'Natureza'
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
    object Label4: TLabel [4]
      Left = 255
      Top = 59
      Width = 26
      Height = 17
      Caption = 'Tipo'
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
    object Label5: TLabel [5]
      Left = 98
      Top = 59
      Width = 58
      Height = 17
      Caption = 'Opera'#231#227'o'
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
      Top = 238
      TabOrder = 6
      OnClick = btnSalvarClick
      ExplicitTop = 238
    end
    inherited BtnCancelar: TStyledBitBtn
      Top = 238
      TabOrder = 7
      OnClick = btnCancelarClick
      ExplicitTop = 238
    end
    object cxCodigo: TcxTextEdit
      Left = 9
      Top = 28
      TabStop = False
      Properties.ReadOnly = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 0
      Width = 90
    end
    object cxNatureza: TcxTextEdit
      Left = 98
      Top = 28
      Cursor = crIBeam
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 1
      Width = 543
    end
    object cxCFOP: TcxTextEdit
      Left = 9
      Top = 78
      Cursor = crIBeam
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.MaxLength = 4
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 2
      OnKeyPress = cxCFOPKeyPress
      Width = 90
    end
    object cxOperacao: TcxComboBox
      Left = 98
      Top = 78
      Cursor = crIBeam
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Estadual'
        'Interestadual'
        'Exporta'#231#227'o')
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 3
      Width = 158
    end
    object cxTipo: TcxComboBox
      Left = 255
      Top = 78
      Cursor = crIBeam
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Entrada'
        'Sa'#237'da')
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 4
      Width = 121
    end
    object cxAtivo: TcxCheckBox
      Left = 382
      Top = 82
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
      TabOrder = 5
      Transparent = True
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 576
    Top = 34
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
