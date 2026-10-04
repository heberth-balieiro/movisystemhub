object FrmProdutoEstoque: TFrmProdutoEstoque
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Produto'
  ClientHeight = 309
  ClientWidth = 577
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 17
  object Paneltitulo: TPanel
    Left = 0
    Top = 0
    Width = 577
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    Color = 16744448
    ParentBackground = False
    TabOrder = 0
    object lblTitulo: TLabel
      AlignWithMargins = True
      Left = 15
      Top = 0
      Width = 562
      Height = 50
      Margins.Left = 15
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      AutoSize = False
      Caption = 'Entrada de produto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 0
      ExplicitWidth = 697
      ExplicitHeight = 35
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 50
    Align = alClient
    PanelStyle.Active = True
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlack
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 1
    Height = 259
    Width = 577
    object Label1: TLabel
      Left = 8
      Top = 11
      Width = 43
      Height = 17
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 111
      Top = 11
      Width = 57
      Height = 17
      Caption = 'Descri'#231#227'o'
    end
    object Label3: TLabel
      Left = 111
      Top = 60
      Width = 65
      Height = 17
      Caption = 'Qtde. Atual'
    end
    object Label4: TLabel
      Left = 8
      Top = 60
      Width = 68
      Height = 17
      Caption = 'Quantidade'
    end
    object Label9: TLabel
      Left = 212
      Top = 60
      Width = 72
      Height = 17
      Caption = 'Prc. Compra'
    end
    object Label5: TLabel
      Left = 459
      Top = 11
      Width = 49
      Height = 17
      Caption = 'Unidade'
    end
    object Label6: TLabel
      Left = 308
      Top = 60
      Width = 61
      Height = 17
      Caption = 'Prc. Venda'
    end
    object dxBevel1: TdxBevel
      Left = 404
      Top = 58
      Width = 165
      Height = 141
    end
    object edtFoto: TImage
      Left = 406
      Top = 60
      Width = 160
      Height = 137
      Center = True
      Proportional = True
      Transparent = True
    end
    object edtCodigo: TcxTextEdit
      Left = 8
      Top = 29
      Properties.ReadOnly = True
      TabOrder = 0
      Width = 97
    end
    object edtdescricao: TcxTextEdit
      Left = 111
      Top = 29
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.ReadOnly = True
      TabOrder = 1
      Width = 342
    end
    object edtestoqueatual: TcxCurrencyEdit
      Left = 111
      Top = 78
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      Properties.ReadOnly = True
      TabOrder = 4
      Width = 95
    end
    object edtQtde: TcxCurrencyEdit
      Left = 8
      Top = 78
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 3
      OnExit = edtQtdeExit
      OnKeyPress = edtQtdeKeyPress
      Width = 97
    end
    object edtprccompra: TcxCurrencyEdit
      Left = 212
      Top = 78
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      TabOrder = 5
      OnExit = edtprccompraExit
      Width = 90
    end
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 459
      Top = 205
      Width = 110
      Height = 40
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      BevelOuter = bvNone
      Color = 14869218
      ParentBackground = False
      TabOrder = 8
      object btnCancelar: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 40
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Cancelar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5585461
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = btnCancelarClick
        ExplicitLeft = 80
        ExplicitTop = 16
      end
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 334
      Top = 205
      Width = 110
      Height = 40
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      BevelOuter = bvNone
      Color = 16475988
      ParentBackground = False
      TabOrder = 7
      object btnIncluir: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 40
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Incluir | F5'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = btnIncluirClick
        ExplicitLeft = 6
      end
    end
    object edtunidade: TcxTextEdit
      Left = 459
      Top = 29
      Properties.ReadOnly = True
      TabOrder = 2
      Width = 110
    end
    object edtprcvenda: TcxCurrencyEdit
      Left = 308
      Top = 78
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      TabOrder = 6
      OnExit = edtprccompraExit
      OnKeyPress = edtprcvendaKeyPress
      Width = 90
    end
    object cxGroupBox2: TcxGroupBox
      Left = 8
      Top = 105
      TabOrder = 9
      Height = 94
      Width = 390
    end
  end
  object ACBrEnter: TACBrEnterTab
    EnterAsTab = True
    Left = 216
    Top = 256
  end
end
