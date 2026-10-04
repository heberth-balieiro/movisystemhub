object FrmFuncionarioCad: TFrmFuncionarioCad
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Funcion'#225'rio'
  ClientHeight = 522
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
  object Label1: TLabel
    Left = 15
    Top = 62
    Width = 43
    Height = 17
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 101
    Top = 62
    Width = 36
    Height = 17
    Caption = 'Cargo'
  end
  object Label3: TLabel
    Left = 228
    Top = 62
    Width = 21
    Height = 17
    Caption = 'CPF'
  end
  object Label4: TLabel
    Left = 15
    Top = 111
    Width = 36
    Height = 17
    Caption = 'Nome'
  end
  object Label5: TLabel
    Left = 505
    Top = 62
    Width = 38
    Height = 17
    Caption = 'Org'#227'o'
  end
  object Label6: TLabel
    Left = 311
    Top = 111
    Width = 45
    Height = 17
    Caption = 'Apelido'
  end
  object Label7: TLabel
    Left = 375
    Top = 62
    Width = 17
    Height = 17
    Caption = 'RG'
  end
  object Label8: TLabel
    Left = 531
    Top = 355
    Width = 29
    Height = 17
    Caption = 'Ativo'
  end
  object Label9: TLabel
    Left = 15
    Top = 159
    Width = 22
    Height = 17
    Caption = 'CEP'
  end
  object Label10: TLabel
    Left = 101
    Top = 157
    Width = 55
    Height = 17
    Caption = 'Endere'#231'o'
  end
  object Label11: TLabel
    Left = 535
    Top = 157
    Width = 48
    Height = 17
    Caption = 'N'#250'mero'
  end
  object Label12: TLabel
    Left = 15
    Top = 257
    Width = 41
    Height = 17
    Caption = 'Cidade'
  end
  object Label13: TLabel
    Left = 15
    Top = 208
    Width = 82
    Height = 17
    Caption = 'Complemento'
  end
  object Label14: TLabel
    Left = 228
    Top = 208
    Width = 35
    Height = 17
    Caption = 'Bairro'
  end
  object Label15: TLabel
    Left = 15
    Top = 306
    Width = 39
    Height = 17
    Caption = 'Fone 1'
  end
  object Label16: TLabel
    Left = 131
    Top = 306
    Width = 39
    Height = 17
    Caption = 'Fone 2'
  end
  object Label17: TLabel
    Left = 247
    Top = 306
    Width = 51
    Height = 17
    Caption = 'Celular 1'
  end
  object Label18: TLabel
    Left = 363
    Top = 306
    Width = 51
    Height = 17
    Caption = 'Celular 2'
  end
  object Label19: TLabel
    Left = 479
    Top = 306
    Width = 60
    Height = 17
    Caption = 'WhatsApp'
  end
  object Label20: TLabel
    Left = 15
    Top = 355
    Width = 70
    Height = 17
    Caption = 'Observa'#231#227'o'
  end
  object Label21: TLabel
    Left = 247
    Top = 355
    Width = 37
    Height = 17
    Caption = 'Avisos'
  end
  object Label22: TLabel
    Left = 375
    Top = 257
    Width = 36
    Height = 17
    Caption = 'E-mail'
  end
  object Label27: TLabel
    Left = 15
    Top = 463
    Width = 232
    Height = 17
    Caption = 'Campo com * s'#227'o campos obrigat'#243'rios'
    WordWrap = True
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 502
    Top = 471
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
    Left = 380
    Top = 471
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
      Caption = 'Salvar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 6
    end
  end
  object cxTextEdit1: TcxTextEdit
    Left = 15
    Top = 80
    TabOrder = 2
    Text = 'cxTextEdit1'
    Width = 80
  end
  object cxTextEdit2: TcxTextEdit
    Left = 15
    Top = 128
    TabOrder = 3
    Text = 'cxTextEdit1'
    Width = 290
  end
  object cxComboBox1: TcxComboBox
    Left = 101
    Top = 80
    TabOrder = 4
    Text = 'cxComboBox1'
    Width = 121
  end
  object cxButtonEdit1: TcxButtonEdit
    Left = 228
    Top = 80
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 5
    Text = 'cxButtonEdit1'
    Width = 141
  end
  object cxTextEdit3: TcxTextEdit
    Left = 311
    Top = 128
    TabOrder = 6
    Text = 'cxTextEdit1'
    Width = 301
  end
  object cxTextEdit4: TcxTextEdit
    Left = 375
    Top = 80
    TabOrder = 7
    Text = 'cxTextEdit1'
    Width = 124
  end
  object cxTextEdit5: TcxTextEdit
    Left = 505
    Top = 80
    TabOrder = 8
    Text = 'cxTextEdit1'
    Width = 107
  end
  object cxComboBox2: TcxComboBox
    Left = 531
    Top = 373
    TabOrder = 9
    Text = 'cxComboBox1'
    Width = 81
  end
  object cxButtonEdit2: TcxButtonEdit
    Left = 15
    Top = 177
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 10
    Text = 'cxButtonEdit1'
    Width = 80
  end
  object cxTextEdit6: TcxTextEdit
    Left = 101
    Top = 177
    TabOrder = 11
    Text = 'cxTextEdit1'
    Width = 428
  end
  object cxTextEdit7: TcxTextEdit
    Left = 535
    Top = 177
    TabOrder = 12
    Text = 'cxTextEdit1'
    Width = 77
  end
  object cxTextEdit8: TcxTextEdit
    Left = 15
    Top = 226
    TabOrder = 13
    Text = 'cxTextEdit1'
    Width = 207
  end
  object cxTextEdit9: TcxTextEdit
    Left = 228
    Top = 226
    TabOrder = 14
    Text = 'cxTextEdit1'
    Width = 384
  end
  object cxLookupComboBox1: TcxLookupComboBox
    Left = 15
    Top = 275
    Properties.ListColumns = <>
    TabOrder = 15
    Width = 354
  end
  object cxMaskEdit1: TcxMaskEdit
    Left = 15
    Top = 324
    TabOrder = 16
    Text = 'cxMaskEdit1'
    Width = 110
  end
  object cxMaskEdit2: TcxMaskEdit
    Left = 131
    Top = 324
    TabOrder = 17
    Text = 'cxMaskEdit1'
    Width = 110
  end
  object cxMaskEdit3: TcxMaskEdit
    Left = 247
    Top = 324
    TabOrder = 18
    Text = 'cxMaskEdit1'
    Width = 110
  end
  object cxMaskEdit4: TcxMaskEdit
    Left = 363
    Top = 324
    TabOrder = 19
    Text = 'cxMaskEdit1'
    Width = 110
  end
  object cxMaskEdit5: TcxMaskEdit
    Left = 479
    Top = 324
    TabOrder = 20
    Text = 'cxMaskEdit1'
    Width = 133
  end
  object cxBlobEdit1: TcxBlobEdit
    Left = 15
    Top = 373
    Properties.BlobEditKind = bekBlob
    TabOrder = 21
    Width = 226
  end
  object cxBlobEdit2: TcxBlobEdit
    Left = 247
    Top = 373
    Properties.BlobEditKind = bekBlob
    TabOrder = 22
    Width = 278
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
    TabOrder = 23
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
      Caption = 'Novo Funcion'#225'rio'
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
  object cxTextEdit10: TcxTextEdit
    Left = 375
    Top = 275
    TabOrder = 24
    Text = 'cxTextEdit1'
    Width = 237
  end
  object cxGroupBox1: TcxGroupBox
    Left = 15
    Top = 404
    TabOrder = 25
    Height = 53
    Width = 597
    object Label23: TLabel
      Left = 12
      Top = 13
      Width = 53
      Height = 17
      Caption = 'Cadastro'
    end
    object Label24: TLabel
      Left = 147
      Top = 13
      Width = 86
      Height = 17
      Caption = 'Data Altera'#231#227'o'
    end
    object Label25: TLabel
      Left = 331
      Top = 13
      Width = 75
      Height = 17
      Caption = 'Usu'#225'rio Cad.'
    end
    object Label26: TLabel
      Left = 485
      Top = 13
      Width = 67
      Height = 17
      Caption = 'Usu'#225'rio Alt.'
    end
  end
end
