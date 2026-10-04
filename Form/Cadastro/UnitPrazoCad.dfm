inherited FrmPrazoCad: TFrmPrazoCad
  Caption = 'Prazo'
  ClientHeight = 350
  Color = clWhite
  OnShow = FormShow
  ExplicitHeight = 350
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 322
    TabOrder = 2
    ExplicitTop = 322
  end
  inherited PanelClient: TPanel
    Height = 279
    TabOrder = 0
    ExplicitHeight = 279
    inherited dxBevel1: TdxBevel
      Height = 273
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitHeight = 510
    end
    object Label3: TLabel [1]
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
    object Label5: TLabel [2]
      Left = 98
      Top = 10
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
    object Label6: TLabel [3]
      Left = 177
      Top = 10
      Width = 57
      Height = 17
      Caption = 'Descri'#231#227'o'
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
      Top = 237
      TabOrder = 6
      OnClick = BtnSalvarClick
      ExplicitTop = 237
    end
    inherited BtnCancelar: TStyledBitBtn
      Top = 237
      TabOrder = 7
      OnClick = BtnCancelarClick
      ExplicitTop = 237
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
    object cxTipo: TcxComboBox
      Left = 98
      Top = 28
      Cursor = crIBeam
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'C'
        'D')
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 1
      Text = 'C'
      Width = 80
    end
    object cxDescricao: TcxTextEdit
      Left = 177
      Top = 28
      Cursor = crIBeam
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 2
      Width = 464
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
      TabOrder = 3
      Transparent = True
    end
    object cxPedido: TcxCheckBox
      Left = 9
      Top = 86
      Caption = 'Exibir Pedido'
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.DisplayGrayed = 'S'
      Properties.ImmediatePost = True
      Properties.ValueChecked = 'S'
      Properties.ValueGrayed = 'N'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      TabOrder = 4
      Transparent = True
    end
    object cxAPP: TcxCheckBox
      Left = 9
      Top = 113
      Caption = 'Enviar APP'
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.DisplayGrayed = 'S'
      Properties.ImmediatePost = True
      Properties.ValueChecked = 'S'
      Properties.ValueGrayed = 'N'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      TabOrder = 5
      Transparent = True
    end
  end
  inherited Paneltitulo: TPanel
    TabOrder = 1
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 544
    Top = 2
  end
  inherited Ds: TUniDataSource
    Left = 512
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
