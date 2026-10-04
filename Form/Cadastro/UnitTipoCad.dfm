object FrmTipoCad: TFrmTipoCad
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Tipo'
  ClientHeight = 380
  ClientWidth = 630
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
  object Label27: TLabel
    Left = 8
    Top = 328
    Width = 232
    Height = 17
    Caption = 'Campo com * s'#227'o campos obrigat'#243'rios'
    WordWrap = True
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 500
    Top = 328
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
      ExplicitLeft = 80
      ExplicitTop = 16
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 378
    Top = 328
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
      Caption = 'Salvar | F5'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnSalvarClick
      ExplicitLeft = 6
    end
  end
  object Paneltitulo: TPanel
    Left = 0
    Top = 0
    Width = 630
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    Color = 16744448
    ParentBackground = False
    TabOrder = 2
    object lblTitulo: TLabel
      AlignWithMargins = True
      Left = 15
      Top = 0
      Width = 615
      Height = 50
      Margins.Left = 15
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      AutoSize = False
      Caption = 'Novo Tipo de Plano'
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
    Align = alTop
    PanelStyle.Active = True
    TabOrder = 3
    Height = 272
    Width = 630
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 43
      Height = 17
      Caption = 'C'#243'digo'
    end
    object Label4: TLabel
      Left = 94
      Top = 6
      Width = 66
      Height = 17
      Caption = 'Descri'#231#227'o *'
    end
    object Label2: TLabel
      Left = 511
      Top = 6
      Width = 35
      Height = 17
      Caption = 'Tipo *'
    end
    object edtcodigo: TcxTextEdit
      Left = 8
      Top = 24
      Properties.CharCase = ecUpperCase
      TabOrder = 0
      Width = 80
    end
    object edtperfil: TcxTextEdit
      Left = 94
      Top = 24
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      TabOrder = 1
      Width = 411
    end
    object edtativo: TcxCheckBox
      Left = 8
      Top = 55
      Caption = 'Ativo'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      State = cbsChecked
      Style.TransparentBorder = False
      TabOrder = 3
      Transparent = True
    end
    object edttipo: TcxComboBox
      Left = 511
      Top = 24
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        'RECEITAS'
        'DESPESAS')
      TabOrder = 2
      Text = 'RECEITAS'
      Width = 111
    end
  end
  object ACBrEnterTab1: TACBrEnterTab
    EnterAsTab = True
    Left = 576
    Top = 2
  end
end
