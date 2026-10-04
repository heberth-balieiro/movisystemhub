object FrmGerador: TFrmGerador
  Left = 0
  Top = 0
  Caption = 'Gerador de Evento'
  ClientHeight = 542
  ClientWidth = 808
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 808
    Height = 89
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 804
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 806
      Height = 87
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 802
      object TabSheet1: TTabSheet
        Caption = 'Gerador Classes'
        object EditPrefixoCampo: TEdit
          Left = 62
          Top = 31
          Width = 16
          Height = 23
          TabOrder = 7
          Visible = False
        end
        object Button1: TButton
          Left = 3
          Top = 29
          Width = 75
          Height = 25
          Caption = 'Tabelas'
          TabOrder = 0
          OnClick = Button1Click
        end
        object CheckBox1: TCheckBox
          Left = 95
          Top = 14
          Width = 109
          Height = 17
          Caption = 'Gerar Property'
          TabOrder = 1
        end
        object PropertySet: TCheckBox
          Left = 261
          Top = 37
          Width = 97
          Height = 17
          Caption = 'PropertySet'
          TabOrder = 2
        end
        object procedureset: TCheckBox
          Left = 95
          Top = 37
          Width = 138
          Height = 17
          Caption = 'Gerar procedure SET'
          TabOrder = 3
        end
        object Função: TCheckBox
          Left = 261
          Top = 14
          Width = 65
          Height = 17
          Caption = 'Fun'#231#227'o'
          TabOrder = 4
        end
        object Button2: TButton
          Left = 724
          Top = 1
          Width = 75
          Height = 25
          Caption = 'Gerar'
          TabOrder = 5
          OnClick = Button2Click
        end
        object Button3: TButton
          Left = 724
          Top = 32
          Width = 75
          Height = 25
          Caption = 'Salvar'
          TabOrder = 6
        end
        object CheckBox2: TCheckBox
          Left = 396
          Top = 10
          Width = 141
          Height = 17
          Caption = 'Incluir Units Conex'#227'o'
          TabOrder = 8
        end
        object CheckBox3: TCheckBox
          Left = 396
          Top = 37
          Width = 141
          Height = 17
          Caption = 'Units fun'#231#227'o'
          TabOrder = 9
        end
        object Button4: TButton
          Left = 643
          Top = 1
          Width = 75
          Height = 25
          Caption = 'Insert'
          TabOrder = 10
          OnClick = Button4Click
        end
        object Button5: TButton
          Left = 643
          Top = 32
          Width = 75
          Height = 25
          Caption = 'Update'
          TabOrder = 11
          OnClick = Button5Click
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 1
      end
    end
  end
  object ListBox1: TListBox
    Left = 0
    Top = 89
    Width = 185
    Height = 453
    Align = alLeft
    ItemHeight = 15
    TabOrder = 1
    OnClick = ListBox1Click
    ExplicitHeight = 452
  end
  object Memo1: TMemo
    Left = 389
    Top = 90
    Width = 411
    Height = 215
    Lines.Strings = (
      'Dicas Importantes'
      'Se o Gmail bloquear a conex'#227'o, voc'#234' precisar'#225':'
      ''
      'Ativar a autentica'#231#227'o em duas etapas na conta.'
      'Criar uma senha de aplicativo (n'#227'o pode usar a senha normal).'
      'Ativar o acesso a aplicativos menos seguros (se permitido).'
      'Se o Outlook bloquear a conex'#227'o:'
      ''
      
        'Pode ser necess'#225'rio ativar a op'#231#227'o "Autentica'#231#227'o de dois fatores' +
        '" e gerar '
      'uma senha de aplicativo.'
      
        'Certifique-se de que o OpenSSL est'#225' instalado, pois o Indy usa S' +
        'SL para '
      
        'autentica'#231#227'o. Baixe os arquivos libeay32.dll e ssleay32.dll e co' +
        'loque na '
      'pasta '
      'do execut'#225'vel.')
    TabOrder = 2
  end
  object StringGrid1: TStringGrid
    Left = 185
    Top = 89
    Width = 208
    Height = 453
    Align = alLeft
    ColCount = 3
    DefaultDrawing = False
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goEditing, goFixedRowDefAlign]
    TabOrder = 3
    OnDrawCell = StringGrid1DrawCell
    OnMouseDown = StringGrid1MouseDown
    ExplicitHeight = 452
    ColWidths = (
      108
      64
      28)
  end
  object Button6: TButton
    Left = 725
    Top = 311
    Width = 75
    Height = 25
    Caption = 'Email'
    TabOrder = 4
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 725
    Top = 342
    Width = 75
    Height = 25
    Caption = 'Email Acbr'
    TabOrder = 5
    OnClick = Button7Click
  end
  object ACBrMail1: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 416
    Top = 328
  end
end
