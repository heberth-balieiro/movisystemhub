inherited FrmPlanoCad: TFrmPlanoCad
  Caption = 'Plano'
  ClientHeight = 350
  OnShow = FormShow
  ExplicitHeight = 350
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 322
    ExplicitTop = 322
    ExplicitWidth = 644
  end
  inherited PanelClient: TPanel
    Height = 279
    ExplicitHeight = 279
    inherited dxBevel1: TdxBevel
      Height = 273
      ExplicitHeight = 273
    end
    object Label1: TLabel [1]
      Left = 7
      Top = 6
      Width = 43
      Height = 17
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel [2]
      Left = 7
      Top = 55
      Width = 55
      Height = 17
      Caption = 'Conta Pai'
    end
    object Label3: TLabel [3]
      Left = 159
      Top = 6
      Width = 57
      Height = 17
      Caption = 'Descri'#231#227'o'
    end
    object Label4: TLabel [4]
      Left = 7
      Top = 104
      Width = 29
      Height = 17
      Caption = 'N'#237'vel'
    end
    object Label5: TLabel [5]
      Left = 176
      Top = 104
      Width = 26
      Height = 17
      Caption = 'Tipo'
    end
    object Label6: TLabel [6]
      Left = 142
      Top = 155
      Width = 299
      Height = 17
      Caption = 'Contas com filhos n'#227'o podem receber lan'#231'amento.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 9868950
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel [7]
      Left = 345
      Top = 104
      Width = 41
      Height = 17
      Caption = 'Ordem'
    end
    inherited BtnSalvar: TStyledBitBtn
      Left = 422
      Top = 239
      TabOrder = 6
      OnClick = BtnSalvarClick
      ExplicitLeft = 422
      ExplicitTop = 239
    end
    inherited BtnCancelar: TStyledBitBtn
      Left = 533
      Top = 239
      TabOrder = 7
      OnClick = BtnCancelarClick
      ExplicitLeft = 533
      ExplicitTop = 239
    end
    object edtCodigo: TcxTextEdit
      Left = 7
      Top = 24
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.ReadOnly = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 0
      Width = 153
    end
    object cxPai: TcxLookupComboBox
      Left = 7
      Top = 73
      Cursor = crIBeam
      Properties.Alignment.Horz = taLeftJustify
      Properties.CaseSensitiveSearch = True
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownRows = 10
      Properties.DropDownWidth = 400
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id_planoconta'
      Properties.ListColumns = <
        item
          FieldName = 'descricao_completa'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = Ds
      EditValue = 0
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 2
      Width = 636
    end
    object cxDescricao: TcxTextEdit
      Left = 159
      Top = 24
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.MaxLength = 150
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 1
      Width = 484
    end
    object cxnivel: TcxComboBox
      Left = 7
      Top = 122
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        ''
        '1-Grupo'
        '2-Subgrupo'
        '3-Categoria'
        '4-Subcategoria'
        '5-Item')
      Properties.ReadOnly = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 3
      Width = 170
    end
    object cxAtivo: TcxCheckBox
      Left = 7
      Top = 180
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
      TabOrder = 8
      Transparent = True
    end
    object cxaceita: TcxCheckBox
      Left = 7
      Top = 153
      Caption = 'Aceita lan'#231'amento'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 9
      Transparent = True
    end
    object cxtipo: TcxComboBox
      Left = 176
      Top = 122
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Receita'
        'Despesa')
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 4
      Width = 170
    end
    object cxordem: TcxSpinEdit
      Left = 345
      Top = 122
      Properties.MaxValue = 99999.000000000000000000
      Properties.MinValue = 1.000000000000000000
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = clSkyBlue
      TabOrder = 5
      Value = 1
      Width = 75
    end
  end
  inherited Paneltitulo: TPanel
    ExplicitWidth = 644
    inherited lblTitulo: TLabel
      Caption = 'Novo Plano de Contas'
      ExplicitWidth = 635
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 536
    Top = 2
  end
  inherited Ds: TUniDataSource
    DataSet = TabPlano
    Left = 280
    Top = 240
  end
  inherited cxStyle: TcxStyleRepository
    Left = 487
    Top = 65535
    PixelsPerInch = 96
    inherited CxGridPedido: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    inherited GridTableDependente: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
  end
  object TabPlano: TClientDataSet
    PersistDataPacket.Data = {
      800000009619E0BD01000000180000000400000000000300000080000D69645F
      706C616E6F636F6E7461040001000000000006636F6469676F01004900000001
      000557494454480200020014001264657363726963616F5F636F6D706C657461
      0100490000000100055749445448020002009600056E6976656C040001000000
      00000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 243
    object TabPlanoid_planoconta: TIntegerField
      FieldName = 'id_planoconta'
    end
    object TabPlanocodigo: TStringField
      FieldName = 'codigo'
    end
    object TabPlanodescricao_completa: TStringField
      FieldName = 'descricao_completa'
      Size = 150
    end
    object TabPlanonivel: TIntegerField
      FieldName = 'nivel'
    end
  end
end
