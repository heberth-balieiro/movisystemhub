object FrmEntradaVeiculoSelecionar: TFrmEntradaVeiculoSelecionar
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Entrada Ve'#237'culo'
  ClientHeight = 384
  ClientWidth = 577
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  ShowHint = True
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
      Caption = 'Inclus'#227'o de Ve'#237'culo'
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
    Height = 334
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
      Width = 30
      Height = 17
      Caption = 'Placa'
    end
    object Label4: TLabel
      Left = 8
      Top = 60
      Width = 68
      Height = 17
      Caption = 'Quantidade'
    end
    object Label5: TLabel
      Left = 111
      Top = 60
      Width = 24
      Height = 17
      Caption = 'Fipe'
    end
    object Label6: TLabel
      Left = 364
      Top = 60
      Width = 66
      Height = 17
      Caption = 'Desconto $'
    end
    object Label7: TLabel
      Left = 311
      Top = 60
      Width = 46
      Height = 17
      Caption = 'Desc. %'
    end
    object Label8: TLabel
      Left = 440
      Top = 60
      Width = 62
      Height = 17
      Caption = 'Valor Total'
    end
    object label_unitario: TLabel
      Left = 214
      Top = 60
      Width = 71
      Height = 17
      Caption = 'Prc. Unit'#225'rio'
    end
    object LabelObs: TLabel
      Left = 8
      Top = 186
      Width = 179
      Height = 17
      Caption = 'Observa'#231#227'o Contrato - Ve'#237'culo'
    end
    object Label11: TLabel
      Left = 214
      Top = 11
      Width = 57
      Height = 17
      Caption = 'Descri'#231#227'o'
    end
    object btnvalores: TSpeedButton
      Left = 544
      Top = 78
      Width = 25
      Height = 25
      Cursor = crHandPoint
      Hint = 'Detalhes Consignado'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000B8824DFFB8824DFF0000000000000000000000000000
        0000848484FF848484FF00000000000000000000000000000000000000000000
        00000000000000000000B8824DFFB8824DFF0000000000000000000000008484
        84FF848484FF848484FF848484FF000000000000000000000000000000000000
        00000000000000000000B8824DFFB8824DFF0000000000000000848484FF8484
        84FF848484FF848484FF848484FF848484FF0000000000000000000000000000
        00000000000000000000B8824DFFB8824DFF0000000000000000848484FF0000
        0000848484FF848484FF00000000848484FF0000000000000000000000000000
        00000000000000000000B8824DFFB8824DFF0000000000000000000000000000
        0000848484FF848484FF00000000000000000000000000000000000000000000
        00000000000000000000B8824DFFB8824DFF0000000000000000000000000000
        0000848484FF848484FF00000000000000000000000000000000000000000000
        0000B8824DFF00000000B8824DFFB8824DFF00000000B8824DFF000000000000
        0000848484FF848484FF00000000000000000000000000000000000000000000
        0000B8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFF000000000000
        0000848484FF848484FF00000000000000000000000000000000000000000000
        000000000000B8824DFFB8824DFFB8824DFFB8824DFF00000000000000000000
        0000848484FF848484FF00000000000000000000000000000000000000000000
        00000000000000000000B8824DFFB8824DFF0000000000000000000000000000
        0000848484FF848484FF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      OnClick = btnvaloresClick
    end
    object edtCodigo: TcxTextEdit
      Left = 8
      Top = 29
      Properties.ReadOnly = True
      TabOrder = 0
      Width = 97
    end
    object edtdescricao: TcxTextEdit
      Left = 214
      Top = 29
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.ReadOnly = True
      TabOrder = 1
      Width = 355
    end
    object edtQtde: TcxCurrencyEdit
      Left = 8
      Top = 78
      EditValue = 1.000000000000000000
      ParentFont = False
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      Properties.MaxLength = 1
      Properties.MaxValue = 1.000000000000000000
      Properties.MinValue = 1.000000000000000000
      Properties.ReadOnly = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 2
      OnExit = edtQtdeExit
      Width = 97
    end
    object edtdescpercentual: TcxCurrencyEdit
      Left = 311
      Top = 78
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.ClearKey = 16452
      Properties.DisplayFormat = '0.00;-0.00'
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 5
      OnExit = edtdescpercentualExit
      Width = 47
    end
    object edtvalortotal: TcxCurrencyEdit
      Left = 440
      Top = 78
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.ClearKey = 16452
      Properties.DisplayFormat = 'R$ #,##0.00'
      Properties.EditFormat = 'R$ #,##0.00'
      Properties.ReadOnly = True
      Properties.UseDisplayFormatWhenEditing = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 7
      OnExit = edtvalortotalExit
      OnKeyPress = edtvalortotalKeyPress
      Width = 98
    end
    object edtunitario: TcxCurrencyEdit
      Left = 214
      Top = 78
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = 'R$ #,##0.00'
      Properties.EditFormat = 'R$ #,##0.00'
      Properties.UseDisplayFormatWhenEditing = True
      TabOrder = 4
      OnExit = edtunitarioExit
      Width = 91
    end
    object edtFipe: TcxCurrencyEdit
      Left = 111
      Top = 78
      EditValue = 0.000000000000000000
      Properties.ClearKey = 16452
      Properties.DisplayFormat = 'R$ #,##0.00'
      Properties.EditFormat = 'R$ #,##0.00'
      Properties.UseDisplayFormatWhenEditing = True
      TabOrder = 3
      Width = 97
    end
    object edtdescontoreais: TcxCurrencyEdit
      Left = 364
      Top = 78
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.ClearKey = 16452
      Properties.DisplayFormat = 'R$ #,##0.00'
      Properties.EditFormat = 'R$ #,##0.00'
      Properties.UseDisplayFormatWhenEditing = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 6
      OnExit = edtdescontoreaisExit
      Width = 70
    end
    object edtcomplemento: TcxMemo
      Left = 8
      Top = 205
      TabOrder = 8
      OnExit = edtcomplementoExit
      OnKeyPress = edtcomplementoKeyPress
      Height = 67
      Width = 561
    end
    object Panelcancelar: TPanel
      AlignWithMargins = True
      Left = 459
      Top = 286
      Width = 110
      Height = 40
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      BevelOuter = bvNone
      Color = 14869218
      ParentBackground = False
      TabOrder = 10
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
        ExplicitTop = 380
      end
    end
    object PanelIncluir: TPanel
      AlignWithMargins = True
      Left = 331
      Top = 286
      Width = 110
      Height = 40
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      BevelOuter = bvNone
      Color = 16475988
      ParentBackground = False
      TabOrder = 9
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
        ExplicitTop = -8
      end
    end
    object edtPlaca: TcxTextEdit
      Left = 111
      Top = 29
      Properties.ReadOnly = True
      TabOrder = 11
      Width = 97
    end
    object edtTroca: TcxCheckBox
      Left = 115
      Top = 278
      Caption = 'Troca'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      TabOrder = 12
      Transparent = True
    end
    object edtatualizarficha: TcxCheckBox
      Left = 8
      Top = 278
      Caption = 'Atualizar Ficha'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      TabOrder = 13
      Transparent = True
    end
    object cxValores: TcxGroupBox
      Left = 8
      Top = 109
      Caption = 'Consignado'
      Style.TextStyle = [fsBold]
      TabOrder = 14
      Height = 71
      Width = 561
      object Label3: TLabel
        Left = 7
        Top = 18
        Width = 100
        Height = 17
        Caption = 'Taxa Consignado'
      end
      object Label9: TLabel
        Left = 118
        Top = 18
        Width = 86
        Height = 17
        Caption = 'Prazo Retirada'
      end
      object edttaxaconsignado: TcxCurrencyEdit
        Left = 7
        Top = 37
        EditValue = 0.000000000000000000
        Properties.ClearKey = 16452
        Properties.DisplayFormat = 'R$ #,##0.00'
        Properties.EditFormat = 'R$ #,##0.00'
        Properties.UseDisplayFormatWhenEditing = True
        TabOrder = 0
        Width = 105
      end
      object edtDataRetirada: TcxDateEdit
        Left = 118
        Top = 37
        Properties.ClearKey = 16452
        Properties.DateButtons = []
        Properties.ImmediatePost = True
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 1
        Width = 101
      end
    end
  end
  object ACBrEnter: TACBrEnterTab
    EnterAsTab = True
    Left = 544
  end
end
