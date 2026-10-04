object FrmValidador: TFrmValidador
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 219
  ClientWidth = 400
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  TextHeight = 17
  object Paneltitulo: TPanel
    Left = 0
    Top = 0
    Width = 400
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
      Width = 385
      Height = 50
      Margins.Left = 15
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      AutoSize = False
      Caption = 'Validar acesso'
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
    TabOrder = 1
    Height = 169
    Width = 400
    object Label2: TLabel
      Left = 15
      Top = 23
      Width = 118
      Height = 17
      Caption = 'Chave de seguran'#231'a'
    end
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 275
      Top = 109
      Width = 110
      Height = 40
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      BevelOuter = bvNone
      Color = 14869218
      ParentBackground = False
      TabOrder = 0
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
        ExplicitLeft = 3
      end
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 150
      Top = 109
      Width = 110
      Height = 40
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      BevelOuter = bvNone
      Color = 16475988
      ParentBackground = False
      TabOrder = 1
      object btnSalvar: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 40
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Acessar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = btnSalvarClick
        ExplicitTop = 120
      end
    end
    object edtChave: TcxTextEdit
      Left = 15
      Top = 41
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.MaxLength = 60
      TabOrder = 2
      Width = 370
    end
  end
end
