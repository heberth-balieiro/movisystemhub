inherited FrmConfiguracaoTerminal: TFrmConfiguracaoTerminal
  Caption = 'Configura'#231#227'o'
  ClientHeight = 625
  ClientWidth = 650
  Color = clWhite
  OnShow = FormShow
  ExplicitWidth = 650
  ExplicitHeight = 625
  TextHeight = 17
  inherited PanelButton: TPanel
    Top = 600
    Width = 650
    TabOrder = 0
    ExplicitTop = 600
    ExplicitWidth = 650
  end
  inherited PanelClient: TPanel
    Width = 650
    Height = 560
    TabOrder = 1
    ExplicitWidth = 650
    ExplicitHeight = 560
    object Label4: TLabel
      Left = 3
      Top = 3
      Width = 41
      Height = 17
      Caption = 'Pessoa'
      Color = 8679796
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5325111
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      StyleName = 'Windows'
    end
    object Label6: TLabel
      Left = 3
      Top = 52
      Width = 57
      Height = 17
      Caption = 'Vendedor'
      Color = 8679796
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5325111
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      StyleName = 'Windows'
    end
    object Label8: TLabel
      Left = 3
      Top = 101
      Width = 33
      Height = 17
      Caption = 'Prazo'
      Color = 8679796
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5325111
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      StyleName = 'Windows'
    end
    object Label9: TLabel
      Left = 3
      Top = 150
      Width = 100
      Height = 17
      Caption = 'Impressora ticket'
      Color = 8679796
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5325111
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      StyleName = 'Windows'
    end
    object Label10: TLabel
      Left = 3
      Top = 199
      Width = 86
      Height = 17
      Caption = 'Situa'#231#227'o Ticket'
      Color = 8679796
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5325111
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      StyleName = 'Windows'
    end
    object Label1: TLabel
      Left = 264
      Top = 199
      Width = 80
      Height = 17
      Caption = 'Intervalo data'
      Color = 8679796
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5325111
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      StyleName = 'Windows'
    end
    object cxCliente: TcxLookupComboBox
      Left = 3
      Top = 21
      Cursor = crIBeam
      Properties.Alignment.Horz = taLeftJustify
      Properties.CaseSensitiveSearch = True
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownRows = 20
      Properties.DropDownWidth = 639
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id_socio'
      Properties.ListColumns = <
        item
          FieldName = 'cliente'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = Ds
      EditValue = 0
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 0
      Width = 643
    end
    object cxVendedor: TcxLookupComboBox
      Left = 3
      Top = 70
      Cursor = crIBeam
      Properties.Alignment.Horz = taLeftJustify
      Properties.CaseSensitiveSearch = True
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownRows = 20
      Properties.DropDownWidth = 639
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id_funcionario'
      Properties.ListColumns = <
        item
          Caption = 'Vendedor'
          FieldName = 'func'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = dsVendedor
      EditValue = 0
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 1
      Width = 643
    end
    object cxPrazo: TcxLookupComboBox
      Left = 3
      Top = 119
      Cursor = crIBeam
      Properties.Alignment.Horz = taLeftJustify
      Properties.CaseSensitiveSearch = True
      Properties.CharCase = ecUpperCase
      Properties.ClearKey = 16452
      Properties.DropDownRows = 20
      Properties.DropDownWidth = 639
      Properties.ImmediatePost = True
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'id_prazo'
      Properties.ListColumns = <
        item
          Caption = 'Prazo Pagamento'
          FieldName = 'nprazopag'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = dsPrazo
      EditValue = 0
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 2
      Width = 643
    end
    object cxImpressora: TcxComboBox
      Left = 3
      Top = 168
      Properties.DropDownListStyle = lsEditFixedList
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 3
      Width = 522
    end
    object cxvisualizarticket: TcxCheckBox
      Left = 531
      Top = 172
      Caption = 'Visualizar ticket'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 4
      Transparent = True
    end
    object cxSituacaoticket: TcxComboBox
      Left = 3
      Top = 217
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        'Todos'
        'Aberto'
        'Cancelado'
        'Fechado'
        'Solicita'#231#227'o Cancelamento')
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 5
      Width = 262
    end
    object cxsalvaraberto: TcxCheckBox
      Left = 3
      Top = 248
      Caption = 'Salvar pedido em aberto'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 7
      Transparent = True
    end
    object cxorcamento: TcxCheckBox
      Left = 3
      Top = 275
      Caption = 'In'#237'ciar opera'#231#227'o com or'#231'amento'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 8
      Transparent = True
    end
    object cxtelaimpressao: TcxCheckBox
      Left = 3
      Top = 302
      Caption = 'Tela de Impress'#227'o'
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
    object BtnCancelar: TStyledBitBtn
      Left = 536
      Top = 523
      Width = 110
      Height = 35
      Caption = 'Cancelar | ESC'
      TabOrder = 10
      OnClick = BtnCancelarClick
      StyleFamily = 'Bootstrap'
      StyleClass = 'Danger'
    end
    object BtnSalvar: TStyledBitBtn
      Left = 425
      Top = 523
      Width = 110
      Height = 35
      Caption = 'Salvar | F5'
      TabOrder = 11
      OnClick = BtnSalvarClick
      StyleFamily = 'Bootstrap'
      StyleClass = 'Success'
    end
    object cxavisodependente: TcxCheckBox
      Left = 3
      Top = 329
      Caption = 'Aviso dependente maior 18 anos ao in'#237'ciar o sistema'
      Properties.ClearKey = 16452
      Properties.DisplayChecked = 'S'
      Properties.DisplayUnchecked = 'N'
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'S'
      Properties.ValueUnchecked = 'N'
      Style.TransparentBorder = False
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 12
      Transparent = True
    end
    object cxintervado: TcxSpinEdit
      Left = 264
      Top = 217
      StyleFocused.BorderColor = clNavy
      StyleFocused.Color = 15855596
      TabOrder = 6
      Value = 30
      Width = 97
    end
  end
  inherited Paneltitulo: TPanel
    Width = 650
    TabOrder = 2
    ExplicitWidth = 650
    inherited lblTitulo: TLabel
      Width = 595
      ExplicitWidth = 595
    end
    inherited BtnFechar: TSpeedButton
      Left = 610
      ExplicitLeft = 610
    end
  end
  inherited ACBrEnterTab1: TACBrEnterTab
    Left = 248
    Top = 10
  end
  inherited Ds: TUniDataSource
    DataSet = TabCliente
    Left = 376
    Top = 400
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
  object OpenDialog: TOpenDialog
    Title = 'Local'
    Left = 400
    Top = 728
  end
  object ACBrECF1: TACBrECF
    QuebraLinhaRodape = False
    Porta = 'COM1'
    MsgAguarde = 'Aguardando a resposta da Impressora: %d segundos'
    MsgTrabalhando = 'Impressora est'#225' trabalhando'
    MsgRelatorio = 'Imprimindo %s  %d'#170' Via '
    MsgPausaRelatorio = 'Destaque a %d'#170' via, <ENTER> proxima, %d seg.'
    PaginaDeCodigo = 0
    MemoParams.Strings = (
      '[Cabecalho]'
      'LIN000=<center><b>Nome da Empresa</b></center>'
      'LIN001=<center>Nome da Rua , 1234  -  Bairro</center>'
      'LIN002=<center>Cidade  -  UF  -  99999-999</center>'
      
        'LIN003=<center>CNPJ: 01.234.567/0001-22    IE: 012.345.678.90</c' +
        'enter>'
      
        'LIN004=<table width=100%><tr><td align=left><code>Data</code> <c' +
        'ode>Hora</code></td><td align=right>COO: <b><code>NumCupom</code' +
        '></b></td></tr></table>'
      'LIN005=<hr>'
      ' '
      '[Cabecalho_Item]'
      'LIN000=ITEM   CODIGO      DESCRICAO'
      'LIN001=QTD         x UNITARIO       Aliq     VALOR (R$)'
      'LIN002=<hr>'
      
        'MascaraItem=III CCCCCCCCCCCCCC DDDDDDDDDDDDDDDDDDDDDDDDDDDDDQQQQ' +
        'QQQQ UU x VVVVVVVVVVVVV AAAAAA TTTTTTTTTTTTT'
      ' '
      '[Rodape]'
      'LIN000=<hr>'
      
        'LIN001=<table width=100%><tr><td align=left><code>Data</code> <c' +
        'ode>Hora</code></td><td align=right>Projeto ACBr: <b><code>ACBR<' +
        '/code></b></td></tr></table>'
      'LIN002=<center>Obrigado Volte Sempre</center>'
      'LIN003=<hr>'
      ' '
      '[Formato]'
      'Colunas=48'
      'HTML=1'
      'HTML_Title_Size=2'
      'HTML_Font=<font size="2" face="Lucida Console">')
    ConfigBarras.MostrarCodigo = True
    ConfigBarras.LarguraLinha = 0
    ConfigBarras.Altura = 0
    ConfigBarras.Margem = 0
    InfoRodapeCupom.Imposto.ModoCompacto = False
    Left = 368
    Top = 728
  end
  object TabCliente: TClientDataSet
    PersistDataPacket.Data = {
      960000009619E0BD01000000180000000500000000000300000096000869645F
      736F63696F040001000000000007636C69656E74650100490000000100055749
      44544802000200B4000363706601004900000001000557494454480200020014
      0008776861747361707001004900000001000557494454480200020014000561
      7669736F020049000000010005574944544802000200F4010000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 400
    object TabClienteid_socio: TIntegerField
      FieldName = 'id_socio'
    end
    object TabClientecliente: TStringField
      FieldName = 'cliente'
      Size = 180
    end
    object TabClientecpf: TStringField
      FieldName = 'cpf'
    end
    object TabClientewhatsapp: TStringField
      FieldName = 'whatsapp'
    end
    object TabClienteaviso: TStringField
      FieldName = 'aviso'
      Size = 500
    end
  end
  object TabVendedor: TClientDataSet
    PersistDataPacket.Data = {
      620000009619E0BD01000000180000000300000000000300000062000E69645F
      66756E63696F6E6172696F04000100000000000466756E630100490000000100
      05574944544802000200B4000363706601004900000001000557494454480200
      020014000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 456
    object TabVendedorid_funcionario: TIntegerField
      FieldName = 'id_funcionario'
    end
    object TabVendedorfunc: TStringField
      FieldName = 'func'
      Size = 180
    end
    object TabVendedorcpf: TStringField
      FieldName = 'cpf'
    end
  end
  object TabPrazo: TClientDataSet
    PersistDataPacket.Data = {
      8F0000009619E0BD0100000018000000050000000000030000008F000869645F
      7072617A6F040001000000000006636F6469676F040001000000000004746970
      6F0100490000000100055749445448020002000A000964657363726963616F01
      00490000000100055749445448020002003C00096E7072617A6F706167010049
      000000010005574944544802000200B4000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 512
    object TabPrazoid_prazo: TIntegerField
      FieldName = 'id_prazo'
    end
    object TabPrazocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object TabPrazotipo: TStringField
      FieldName = 'tipo'
      Size = 10
    end
    object TabPrazodescricao: TStringField
      FieldName = 'descricao'
      Size = 60
    end
    object TabPrazonprazopag: TStringField
      FieldName = 'nprazopag'
      Size = 180
    end
  end
  object dsVendedor: TUniDataSource
    DataSet = TabVendedor
    Left = 376
    Top = 456
  end
  object dsPrazo: TUniDataSource
    DataSet = TabPrazo
    Left = 376
    Top = 512
  end
end
