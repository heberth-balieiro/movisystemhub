object FrmQrCodeWhatsApp: TFrmQrCodeWhatsApp
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'WhatsApp'
  ClientHeight = 421
  ClientWidth = 462
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 17
  object Paneltitulo: TPanel
    Left = 0
    Top = 0
    Width = 462
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    Color = 5781541
    ParentBackground = False
    TabOrder = 0
    StyleName = 'Windows'
    object lblTitulo: TLabel
      AlignWithMargins = True
      Left = 15
      Top = 0
      Width = 447
      Height = 50
      Margins.Left = 15
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      AutoSize = False
      Caption = 'Inst'#226'ncia WhatsApp'
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
    TabOrder = 1
    Height = 311
    Width = 462
    object ImgQrCode: TImage
      AlignWithMargins = True
      Left = 19
      Top = 19
      Width = 424
      Height = 256
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      Align = alClient
      Center = True
      Proportional = True
      ExplicitWidth = 339
      ExplicitHeight = 280
    end
    object Label1: TLabel
      AlignWithMargins = True
      Left = 9
      Top = 285
      Width = 444
      Height = 17
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alBottom
      Alignment = taCenter
      AutoSize = False
      Layout = tlCenter
      ExplicitLeft = 96
      ExplicitTop = 284
      ExplicitWidth = 345
    end
  end
  object PanelButton: TPanel
    Left = 0
    Top = 396
    Width = 462
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    Color = 13091773
    ParentBackground = False
    TabOrder = 2
    StyleName = 'Windows'
    object lbStatus: TLabel
      Left = 0
      Top = 0
      Width = 87
      Height = 25
      Align = alLeft
      Alignment = taCenter
      Caption = ' Conectando ...'
      Layout = tlCenter
      ExplicitHeight = 17
    end
  end
  object BtnCriar: TStyledBitBtn
    Left = 3
    Top = 367
    Width = 90
    Height = 25
    Caption = 'Inst'#226'ncia'
    TabOrder = 3
    OnClick = BtnCriarClick
    StyleFamily = 'Bootstrap'
    StyleClass = 'Success'
  end
  object BtnLerQrCode: TStyledBitBtn
    Left = 94
    Top = 367
    Width = 90
    Height = 25
    Caption = 'Conectar'
    TabOrder = 4
    OnClick = BtnLerQrCodeClick
    StyleFamily = 'Bootstrap'
  end
  object BtnLogoutInstancia: TStyledBitBtn
    Left = 185
    Top = 367
    Width = 90
    Height = 25
    Caption = 'Logout'
    TabOrder = 5
    OnClick = BtnLogoutInstanciaClick
    StyleFamily = 'Bootstrap'
    StyleClass = 'Warning'
  end
  object BtnDelete: TStyledBitBtn
    Left = 276
    Top = 367
    Width = 90
    Height = 25
    Caption = 'Delete'
    TabOrder = 6
    OnClick = BtnDeleteClick
    StyleFamily = 'Bootstrap'
    StyleClass = 'Danger'
  end
  object BtnFechar: TStyledBitBtn
    Left = 367
    Top = 367
    Width = 90
    Height = 25
    Caption = 'Fechar'
    TabOrder = 7
    OnClick = BtnFecharClick
    StyleFamily = 'Bootstrap'
    StyleClass = 'Secondary'
  end
  object Tempo: TTimer
    Enabled = False
    OnTimer = TempoTimer
    Left = 280
    Top = 18
  end
end
