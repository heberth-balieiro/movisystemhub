object FrmEnviarEmail: TFrmEnviarEmail
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Email'
  ClientHeight = 450
  ClientWidth = 630
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
    Width = 630
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
      Width = 615
      Height = 50
      Margins.Left = 15
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      AutoSize = False
      Caption = 'Enviar Email'
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
    Height = 400
    Width = 630
    object Label1: TLabel
      Left = 8
      Top = 9
      Width = 26
      Height = 17
      Caption = 'Para'
    end
    object Label2: TLabel
      Left = 8
      Top = 58
      Width = 46
      Height = 17
      Caption = 'Assunto'
    end
    object Label3: TLabel
      Left = 8
      Top = 107
      Width = 65
      Height = 17
      Caption = 'Mensagem'
    end
    object Label4: TLabel
      Left = 8
      Top = 156
      Width = 36
      Height = 17
      Caption = 'Anexo'
    end
    object Label5: TLabel
      Left = 311
      Top = 9
      Width = 16
      Height = 17
      Caption = 'CC'
    end
    object _BtnPanelCancelar: TPanel
      AlignWithMargins = True
      Left = 505
      Top = 340
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
    object _PanelEnviar: TPanel
      AlignWithMargins = True
      Left = 380
      Top = 340
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
      object btnSalvar: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 40
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Enviar | F5'
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
    object edtemail: TcxTextEdit
      Left = 8
      Top = 27
      Properties.ClearKey = 16452
      TabOrder = 0
      Width = 297
    end
    object edtAssunto: TcxTextEdit
      Left = 8
      Top = 76
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      TabOrder = 2
      Width = 614
    end
    object edtMensagem: TcxTextEdit
      Left = 8
      Top = 125
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      TabOrder = 3
      Width = 614
    end
    object EdtAnexo: TcxListBox
      Left = 8
      Top = 174
      Width = 614
      Height = 97
      ItemHeight = 17
      TabOrder = 4
    end
    object _add: TPanel
      AlignWithMargins = True
      Left = 8
      Top = 279
      Width = 180
      Height = 36
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      BevelOuter = bvNone
      Color = 16475988
      Enabled = False
      ParentBackground = False
      TabOrder = 5
      object SpeedButton1: TSpeedButton
        Left = 0
        Top = 0
        Width = 180
        Height = 36
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Adicionar Anexo'
        Enabled = False
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 6
        ExplicitWidth = 110
        ExplicitHeight = 40
      end
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 203
      Top = 279
      Width = 180
      Height = 36
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      BevelOuter = bvNone
      Color = clRed
      Enabled = False
      ParentBackground = False
      TabOrder = 6
      object SpeedButton2: TSpeedButton
        Left = 0
        Top = 0
        Width = 180
        Height = 36
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Excluir Anexo'
        Enabled = False
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 6
        ExplicitWidth = 110
        ExplicitHeight = 40
      end
    end
    object edtcopia: TcxTextEdit
      Left = 311
      Top = 27
      Properties.ClearKey = 16452
      TabOrder = 1
      Width = 311
    end
  end
  object ACBrMail1: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 564
    Top = 7
  end
  object ACBrEnter: TACBrEnterTab
    EnterAsTab = True
    Left = 408
    Top = 10
  end
end
