inherited FrmUsuarioCad: TFrmUsuarioCad
  Caption = 'Usu'#225'rio'
  ClientHeight = 350
  Color = clWhite
  OnShow = FormShow
  ExplicitHeight = 350
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 322
    TabOrder = 0
    ExplicitTop = 322
  end
  inherited PanelClient: TPanel
    Height = 279
    TabOrder = 1
    ExplicitHeight = 279
    inherited dxBevel1: TdxBevel
      Height = 273
      ExplicitHeight = 273
    end
    object Label5: TLabel [1]
      Left = 6
      Top = 6
      Width = 43
      Height = 17
      Caption = 'C'#243'digo'
    end
    object Label22: TLabel [2]
      Left = 65
      Top = 6
      Width = 36
      Height = 17
      Caption = 'Nome'
    end
    object Label9: TLabel [3]
      Left = 505
      Top = 6
      Width = 32
      Height = 17
      Caption = 'Login'
    end
    object Label12: TLabel [4]
      Left = 6
      Top = 55
      Width = 35
      Height = 17
      Caption = 'Senha'
    end
    object Label13: TLabel [5]
      Left = 157
      Top = 55
      Width = 96
      Height = 17
      Caption = 'Confirmar senha'
    end
    object Label14: TLabel [6]
      Left = 308
      Top = 55
      Width = 29
      Height = 17
      Caption = 'Sede'
    end
    object Label15: TLabel [7]
      Left = 308
      Top = 104
      Width = 29
      Height = 17
      Caption = 'Perfil'
    end
    object Label1: TLabel [8]
      Left = 6
      Top = 153
      Width = 67
      Height = 17
      Caption = 'Funcion'#225'rio'
    end
    object Label8: TLabel [9]
      Left = 6
      Top = 104
      Width = 36
      Height = 17
      Caption = 'E-mail'
    end
    inherited BtnSalvar: TStyledBitBtn
      Left = 418
      Top = 238
      TabOrder = 10
      OnClick = BtnSalvarClick
      ExplicitLeft = 418
      ExplicitTop = 238
    end
    inherited BtnCancelar: TStyledBitBtn
      Left = 534
      Top = 238
      TabOrder = 11
      OnClick = BtnCancelarClick
      ExplicitLeft = 534
      ExplicitTop = 238
    end
    object cxcodigo: TcxTextEdit
      Left = 6
      Top = 24
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.ReadOnly = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 0
      Width = 60
    end
    object cxnome: TcxTextEdit
      Left = 65
      Top = 24
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.MaxLength = 60
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 1
      Width = 441
    end
    object cxlogin: TcxTextEdit
      Left = 505
      Top = 24
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.MaxLength = 45
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 2
      Width = 139
    end
    object cxsede: TcxLookupComboBox
      Left = 308
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
      Properties.KeyFieldNames = 'id_sede'
      Properties.ListColumns = <
        item
          Caption = 'Empresa/Sede'
          Width = 336
          FieldName = 'nsede'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = Ds
      EditValue = 0
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 5
      Width = 336
    end
    object cxsenha1: TcxTextEdit
      Left = 157
      Top = 73
      Cursor = crIBeam
      Properties.ClearKey = 16452
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '*'
      Properties.ShowPasswordRevealButton = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 4
      Width = 152
    end
    object cxperfil: TcxLookupComboBox
      Left = 308
      Top = 122
      Cursor = crIBeam
      Properties.Alignment.Horz = taLeftJustify
      Properties.CaseSensitiveSearch = True
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownRows = 10
      Properties.DropDownWidth = 400
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id_perfil'
      Properties.ListColumns = <
        item
          Caption = 'Perfil'
          Width = 336
          FieldName = 'nperfil'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = dsPerfil
      EditValue = 0
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 7
      Width = 336
    end
    object cxfuncionario: TcxLookupComboBox
      Left = 6
      Top = 171
      Cursor = crIBeam
      Properties.Alignment.Horz = taLeftJustify
      Properties.CaseSensitiveSearch = True
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownRows = 10
      Properties.DropDownWidth = 400
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id_funcionario'
      Properties.ListColumns = <
        item
          Caption = 'Funcion'#225'rio'
          Width = 303
          FieldName = 'func'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = dsfuncionario
      EditValue = 0
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 8
      Width = 303
    end
    object cxativo: TcxCheckBox
      Left = 6
      Top = 202
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
      TabOrder = 9
      Transparent = True
    end
    object cxSenha: TcxTextEdit
      Left = 6
      Top = 73
      Cursor = crIBeam
      Properties.ClearKey = 16452
      Properties.EchoMode = eemPassword
      Properties.MaxLength = 250
      Properties.PasswordChar = '*'
      Properties.ShowPasswordRevealButton = True
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 3
      Width = 152
    end
    object cxemail: TcxTextEdit
      Left = 6
      Top = 122
      Properties.ClearKey = 16452
      Properties.MaxLength = 180
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 6
      Width = 303
    end
  end
  inherited Paneltitulo: TPanel
    TabOrder = 2
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 168
    Top = 250
  end
  inherited Ds: TUniDataSource
    DataSet = TabSede
    Left = 240
    Top = 248
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
  object dsPerfil: TUniDataSource
    DataSet = TabPerfil
    Left = 352
    Top = 248
  end
  object dsfuncionario: TUniDataSource
    DataSet = TabFuncionario
    Left = 496
    Top = 192
  end
  object TabSede: TClientDataSet
    PersistDataPacket.Data = {
      D20000009619E0BD010000001800000007000000000003000000D2000769645F
      7365646504000100000000000572617A616F0100490000000100055749445448
      02000200B4000866616E74617369610100490000000100055749445448020002
      00B40004636E706A01004900000001000557494454480200020014000763656C
      756C617201004900000001000557494454480200020014000D73656465707269
      6E636970616C0100490000000100055749445448020002000500056E73656465
      010049000000010005574944544802000200FA000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 250
    object TabSedeid_sede: TIntegerField
      FieldName = 'id_sede'
    end
    object TabSederazao: TStringField
      FieldName = 'razao'
      Size = 180
    end
    object TabSedefantasia: TStringField
      FieldName = 'fantasia'
      Size = 180
    end
    object TabSedecnpj: TStringField
      FieldName = 'cnpj'
    end
    object TabSedecelular: TStringField
      FieldName = 'celular'
    end
    object TabSedesedeprincipal: TStringField
      FieldName = 'sedeprincipal'
      Size = 5
    end
    object TabSedensede: TStringField
      FieldName = 'nsede'
      Size = 250
    end
  end
  object TabPerfil: TClientDataSet
    PersistDataPacket.Data = {
      750000009619E0BD01000000180000000400000000000300000075000969645F
      70657266696C040001000000000006636F6469676F0400010000000000096465
      7363726963616F0100490000000100055749445448020002003C00076E706572
      66696C0100490000000100055749445448020002003C000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_perfil'
        DataType = ftInteger
      end
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'nperfil'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 312
    Top = 248
    object TabPerfilid_perfil: TIntegerField
      FieldName = 'id_perfil'
    end
    object TabPerfilcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabPerfildescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object TabPerfilnperfil: TStringField
      FieldName = 'nperfil'
      Size = 60
    end
  end
  object TabFuncionario: TClientDataSet
    PersistDataPacket.Data = {
      620000009619E0BD01000000180000000300000000000300000062000E69645F
      66756E63696F6E6172696F04000100000000000466756E630100490000000100
      05574944544802000200BE000363706601004900000001000557494454480200
      020012000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id_funcionario'
        DataType = ftInteger
      end
      item
        Name = 'func'
        DataType = ftString
        Size = 190
      end
      item
        Name = 'cpf'
        DataType = ftString
        Size = 18
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 456
    Top = 192
    object TabFuncionarioid_funcionario: TIntegerField
      FieldName = 'id_funcionario'
    end
    object TabFuncionariofunc: TStringField
      FieldName = 'func'
      Size = 190
    end
    object TabFuncionariocpf: TStringField
      FieldName = 'cpf'
      Size = 18
    end
  end
end
