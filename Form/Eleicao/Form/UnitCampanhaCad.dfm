object FrmCampanhaCad: TFrmCampanhaCad
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Campanha'
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
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
      Caption = 'Nova Campanha'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitTop = -5
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 50
    Align = alClient
    PanelStyle.Active = True
    TabOrder = 1
    Height = 472
    Width = 630
    object Label2: TLabel
      Left = 94
      Top = 6
      Width = 70
      Height = 17
      Caption = 'Data in'#237'cio *'
    end
    object Label3: TLabel
      Left = 197
      Top = 6
      Width = 72
      Height = 17
      Caption = 'Hora in'#237'cio *'
    end
    object Label4: TLabel
      Left = 283
      Top = 6
      Width = 85
      Height = 17
      Caption = 'Data t'#233'rmino *'
    end
    object Label5: TLabel
      Left = 386
      Top = 6
      Width = 87
      Height = 17
      Caption = 'Hora t'#233'rmino *'
    end
    object Label6: TLabel
      Left = 8
      Top = 55
      Width = 50
      Height = 17
      Caption = 'Elei'#231#227'o *'
    end
    object Label7: TLabel
      Left = 8
      Top = 104
      Width = 50
      Height = 17
      Caption = 'Detalhes'
    end
    object Label8: TLabel
      Left = 472
      Top = 6
      Width = 53
      Height = 17
      Caption = 'Auditoria'
    end
    object Label9: TLabel
      Left = 8
      Top = 6
      Width = 43
      Height = 17
      Caption = 'C'#243'digo'
    end
    object Label27: TLabel
      Left = 8
      Top = 439
      Width = 232
      Height = 17
      Caption = 'Campo com * s'#227'o campos obrigat'#243'rios'
      WordWrap = True
    end
    object edtPublicada: TLabel
      Left = 271
      Top = 439
      Width = 60
      Height = 17
      Caption = 'Publicada'
      Color = 16744448
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16744448
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object edtCodigo: TcxTextEdit
      Left = 8
      Top = 24
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.ReadOnly = True
      TabOrder = 0
      Width = 80
    end
    object edtdata1: TcxDateEdit
      Left = 94
      Top = 24
      Properties.ClearKey = 16452
      Properties.DateButtons = []
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 97
    end
    object edtdata2: TcxDateEdit
      Left = 283
      Top = 24
      Properties.ClearKey = 16452
      Properties.DateButtons = []
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 3
      Width = 97
    end
    object edthora1: TcxTimeEdit
      Left = 197
      Top = 24
      Properties.ClearKey = 16452
      Properties.TimeFormat = tfHourMin
      TabOrder = 2
      Width = 80
    end
    object edthora2: TcxTimeEdit
      Left = 386
      Top = 24
      Properties.ClearKey = 16452
      Properties.TimeFormat = tfHourMin
      TabOrder = 4
      Width = 80
    end
    object edteleicao: TcxLookupComboBox
      Left = 8
      Top = 73
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.KeyFieldNames = 'id_eleicao'
      Properties.ListColumns = <
        item
          Caption = 'C'#243'digo'
          Width = 60
          FieldName = 'codigo'
        end
        item
          Caption = 'Elei'#231#227'o'
          Width = 554
          FieldName = 'nome'
        end>
      Properties.ListFieldIndex = 1
      Properties.ListSource = ds
      EditValue = 0
      TabOrder = 6
      Width = 614
    end
    object edtdetalhe: TcxMemo
      Left = 8
      Top = 122
      TabOrder = 7
      Height = 284
      Width = 614
    end
    object edtauditoria: TcxComboBox
      Left = 472
      Top = 24
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        'SIM'
        'N'#195'O')
      TabOrder = 5
      Text = 'SIM'
      Width = 150
    end
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 505
      Top = 417
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
        ExplicitLeft = 1
      end
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 380
      Top = 417
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
      object btnSalvar: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 40
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Salvar | F10'
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
    object edtApi: TcxCheckBox
      Left = 8
      Top = 412
      Caption = 'Fechamento API'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      State = cbsChecked
      Style.TransparentBorder = False
      TabOrder = 10
      Transparent = True
    end
  end
  object ds: TUniDataSource
    DataSet = DM.TabEleicao
    Left = 272
    Top = 2
  end
  object ACBrEnterTab1: TACBrEnterTab
    EnterAsTab = True
    Left = 304
    Top = 8
  end
end
