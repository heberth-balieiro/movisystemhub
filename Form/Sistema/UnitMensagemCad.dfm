inherited FrmMensagemCad: TFrmMensagemCad
  Caption = 'Mensagem'
  ClientHeight = 350
  OnShow = FormShow
  ExplicitHeight = 350
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 322
    ExplicitTop = 322
    object btnParams: TSpeedButton
      AlignWithMargins = True
      Left = 5
      Top = 0
      Width = 26
      Height = 25
      Cursor = crHandPoint
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000848484FF848484FF00000000B8824DFFB8824DFFB8824DFFB8824DFFB882
        4DFFB8824DFFB8824DFFB8824DFFB8824DFF0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000848484FF848484FF00000000B8824DFFB8824DFFB8824DFFB8824DFFB882
        4DFFB8824DFFB8824DFFB8824DFFB8824DFF0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000848484FF848484FF00000000B8824DFFB8824DFFB8824DFFB8824DFFB882
        4DFFB8824DFFB8824DFFB8824DFFB8824DFF0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000848484FF848484FF00000000B8824DFFB8824DFFB8824DFFB8824DFFB882
        4DFFB8824DFFB8824DFFB8824DFFB8824DFF0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      OnClick = btnParamsClick
    end
  end
  inherited PanelClient: TPanel
    Height = 279
    ExplicitHeight = 279
    inherited dxBevel1: TdxBevel
      Height = 273
      ExplicitHeight = 273
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 6
      Width = 43
      Height = 17
      Caption = 'C'#243'digo'
    end
    object Label22: TLabel [2]
      Left = 67
      Top = 6
      Width = 57
      Height = 17
      Caption = 'Descri'#231#227'o'
    end
    object Label2: TLabel [3]
      Left = 8
      Top = 55
      Width = 62
      Height = 17
      Caption = 'Utilizar em'
    end
    object Label3: TLabel [4]
      Left = 184
      Top = 55
      Width = 117
      Height = 17
      Caption = 'Assunto para E-mail'
    end
    object Label4: TLabel [5]
      Left = 8
      Top = 104
      Width = 65
      Height = 17
      Caption = 'Mensagem'
    end
    inherited BtnSalvar: TStyledBitBtn
      Left = 421
      Top = 238
      TabOrder = 6
      OnClick = BtnSalvarClick
      ExplicitLeft = 421
      ExplicitTop = 238
    end
    inherited BtnCancelar: TStyledBitBtn
      Left = 532
      Top = 238
      TabOrder = 7
      OnClick = BtnCancelarClick
      ExplicitLeft = 532
      ExplicitTop = 238
    end
    object cxcodigo: TcxTextEdit
      Left = 8
      Top = 24
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.ReadOnly = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 0
      Width = 60
    end
    object cxdescricao: TcxTextEdit
      Left = 67
      Top = 24
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.MaxLength = 150
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 1
      Width = 575
    end
    object cxutilizar: TcxComboBox
      Left = 8
      Top = 73
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Envio WhatsApp'
        'Envio E-mail'
        'Envio SMS')
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 2
      Width = 177
    end
    object cxassunto: TcxTextEdit
      Left = 184
      Top = 73
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.MaxLength = 150
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 3
      Width = 458
    end
    object cxmensagem: TcxMemo
      Left = 8
      Top = 122
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 4
      Height = 110
      Width = 634
    end
    object cxAtivo: TcxCheckBox
      Left = 8
      Top = 238
      Caption = 'Ativo'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      State = cbsChecked
      Style.TransparentBorder = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 5
      Transparent = True
    end
  end
  inherited Paneltitulo: TPanel
    inherited lblTitulo: TLabel
      Caption = 'Nova Mensagem'
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 456
    Top = 2
  end
  inherited Ds: TUniDataSource
    Left = 416
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
