unit UnitPedidoCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Navigation, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBasic,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Black, dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxButtonEdit, cxMaskEdit, cxDropDownEdit, cxTextEdit,
  cxBlobEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxGroupBox,
  Vcl.ComCtrls, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, dxCore, cxDateUtils,
  cxRadioGroup, cxSpinEdit, cxTimeEdit, cxCalendar, dxGDIPlusClasses, dxBevel,
  DBAccess, Uni, cxCheckBox, ACBrBase, ACBrEnterTab, Vcl.Grids, Vcl.DBGrids,
  UnitBaseNovoCadastro, Vcl.ButtonStylesAttributes, Vcl.StyledButton,
  Controller.LookupHelper, UnitGlobal, Datasnap.DBClient, UnitPessoaCad,
  UnitFuncionarioCad, UnitPrazoCad,
  Controller.Pedido, Model.Pedido, dxmdaset, UnitProdutoCad,
  Controller.PedidoItens, Model.PedidoItens, uConfiguracaoService,
  Controller.Estoque;

type
  TFrmPedidoCad = class(TFormNovoBaseCadastro)
    dsCliente: TUniDataSource;
    dsVendedor: TUniDataSource;
    dsPagamento: TUniDataSource;
    dsListaProduto: TUniDataSource;
    ProdutoPedido: TUniDataSource;
    Label15: TLabel;
    cxcodigo: TcxTextEdit;
    cxPessoa: TcxLookupComboBox;
    cxVendedor: TcxLookupComboBox;
    cxPagamento: TcxLookupComboBox;
    cxLookupComboBox3: TcxLookupComboBox;
    cxObs: TcxBlobEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    edtCadPessoa: TcxButtonEdit;
    cxButtonEdit1: TcxButtonEdit;
    cxButtonEdit2: TcxButtonEdit;
    dxBevel1Foto: TdxBevel;
    edtFoto: TImage;
    cxData: TcxDateEdit;
    cxvalidade: TcxDateEdit;
    Label21: TLabel;
    lbvalidade: TLabel;
    cxHora: TcxTimeEdit;
    Label23: TLabel;
    cxButtonEdit3: TcxButtonEdit;
    PageControlgrid: TPageControl;
    TabCarrinho: TTabSheet;
    cxGrid1: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxgridcodigo: TcxGridDBColumn;
    cxGridbarra: TcxGridDBColumn;
    cxGridreferencia: TcxGridDBColumn;
    cxGriddescricao: TcxGridDBColumn;
    cxGridunidade: TcxGridDBColumn;
    cxGridmarca: TcxGridDBColumn;
    cxGridDBqtde: TcxGridDBColumn;
    cxGridDBprcunitario: TcxGridDBColumn;
    cxGriddesconto: TcxGridDBColumn;
    cxGridtotal: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    TabLista: TTabSheet;
    Panel3_: TPanel;
    cxGroupBox11: TcxGroupBox;
    edtPesquisa: TcxTextEdit;
    cxGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    idproduto: TcxGridDBColumn;
    coll1Codigo: TcxGridDBColumn;
    coll3barra: TcxGridDBColumn;
    collreferencia: TcxGridDBColumn;
    colldescricao: TcxGridDBColumn;
    collmarca: TcxGridDBColumn;
    collgrupo: TcxGridDBColumn;
    collestoque: TcxGridDBColumn;
    collunidade: TcxGridDBColumn;
    collprcvenda: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Label7: TLabel;
    cxResumo: TcxGroupBox;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cxAjustePercentual: TcxCurrencyEdit;
    cxAjustesFrete: TcxCurrencyEdit;
    cxAjustesAdiantamento: TcxCurrencyEdit;
    cxAjustesReais: TcxCurrencyEdit;
    cxResumoItens: TcxCurrencyEdit;
    cxResumoPeso: TcxCurrencyEdit;
    cxResumoVolumes: TcxCurrencyEdit;
    cxTotalSubtotal: TcxCurrencyEdit;
    cxTotalGeral: TcxCurrencyEdit;
    cxTotalPagar: TcxCurrencyEdit;
    cxTipo: TcxComboBox;
    Label11: TLabel;
    Label12: TLabel;
    cxStatus: TcxComboBox;
    TabCliente: TClientDataSet;
    TabClienteid_socio: TIntegerField;
    TabClientecliente: TStringField;
    TabClientecpf: TStringField;
    TabClientetelefone: TStringField;
    TabVendedor: TClientDataSet;
    TabVendedorid_funcionario: TIntegerField;
    TabVendedorfunc: TStringField;
    TabVendedorcpf: TStringField;
    TabPrazo: TClientDataSet;
    TabPrazoid_prazo: TIntegerField;
    TabPrazocodigo: TIntegerField;
    TabPrazotipo: TStringField;
    TabPrazodescricao: TStringField;
    TabPrazonprazopag: TStringField;
    TabProdutoPedido: TClientDataSet;
    TabProdutoPedidoid_produto: TIntegerField;
    TabProdutoPedidocodigo: TIntegerField;
    TabProdutoPedidoreferencia: TStringField;
    TabProdutoPedidodescricao: TStringField;
    TabProdutoPedidoprc_compra: TFloatField;
    TabProdutoPedidoprc_venda: TFloatField;
    TabProdutoPedidoestoque_atual: TFloatField;
    TabProdutoPedidomarca: TStringField;
    TabProdutoPedidogrupo: TStringField;
    TabProdutoPedidouni: TStringField;
    TabProdutoPedidolocal: TStringField;
    TabProdutoPedidocod_barras: TStringField;
    TabItensPedido: TClientDataSet;
    TabItensPedidoid_produto: TIntegerField;
    TabItensPedidoid_pedido_itens: TIntegerField;
    TabItensPedidoqtde: TFloatField;
    TabItensPedidoqtde_2: TFloatField;
    TabItensPedidoprc_unitario: TFloatField;
    TabItensPedidodesconto_perc: TFloatField;
    TabItensPedidodesconto_reais: TFloatField;
    TabItensPedidoprc_total: TFloatField;
    TabItensPedidocodigo: TIntegerField;
    TabItensPedidocod_barras: TStringField;
    TabItensPedidodescricao: TStringField;
    TabItensPedidoreferencia: TStringField;
    TabItensPedidoservico: TStringField;
    TabItensPedidomarca: TStringField;
    TabItensPedidolocal: TStringField;
    TabItensPedidouni: TStringField;
    TabItensPedidoproddescalterada: TStringField;
    TabItensPedidocomplemento: TStringField;
    TabItensPedidoseqitem: TIntegerField;
    cxgriditem: TcxGridDBColumn;
    TabItensPedidoprc_subtotal: TFloatField;
    TabItensPedidopeso: TCurrencyField;
    TabItensPedidovolume: TIntegerField;
    cxAberto: TcxCheckBox;
    cxGridaltura: TcxGridDBColumn;
    cxGridlargura: TcxGridDBColumn;
    cxGridm2: TcxGridDBColumn;
    TabItensPedidoprc_compra: TFloatField;
    TabItensPedidoprc_custo: TFloatField;
    TabItensPedidocontrolaestoque: TStringField;
    BtnItens: TStyledBitBtn;
    TabItensPedidousa_chapa: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtCadPessoaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure edtPesquisaPropertiesChange(Sender: TObject);
    procedure cxTipoPropertiesEditValueChanged(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxAjustePercentualPropertiesEditValueChanged(Sender: TObject);
    procedure cxAjustesReaisPropertiesEditValueChanged(Sender: TObject);
    procedure cxGridDBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridDBTableView2CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridDBTableView2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure cxGridDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure BtnItensClick(Sender: TObject);
  private
    FPedidoSalvo: Boolean;
    AIDPedido   : Integer;
    FAtualizandoTotaisPedido  :Boolean;
    Procedure Localizar;
    Procedure TipoOrcamento(I:integer);
    Function ValidarPedido:boolean;
    procedure CalcularTotaisPedido(Origem: string);
    function ObterSubtotalItens: Currency;
    function ObtertotalItens: Currency;
    procedure AtualizarResumo;
    Procedure ExcluirProdutoCarrinho;
    Procedure ChamarProdutoIncluir;
    Procedure ChamarProdutoAlterar;
    procedure ConfigurarColunasGrid(AGridView: TcxGridDBTableView);
    Function BaixarEstoque:Boolean;
    { Private declarations }
  public
    { Public declarations }

    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;
  end;
var
  FrmPedidoCad: TFrmPedidoCad;
  ContPedido  : TPedidoController;
  ObjPedido   : TModelPedido;

  ContItens   : TPedidoItensController;
  ObjItens    : TModelPedidoItens;

  ContEstoque : TEstoqueController;


implementation

{$R *.dfm}

Uses UConeSul, uJKDialog, Vcl.Loading, Vcl.Session, UnitPedidoItens, UnitPrincipalNew, UnitImpressao, Vcl.Validacoes;

procedure TFrmPedidoCad.cxAjustePercentualPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalcularTotaisPedido('PERC');
end;

procedure TFrmPedidoCad.cxAjustesReaisPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalcularTotaisPedido('REAL');
end;

procedure TFrmPedidoCad.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  try
    try
      if not Assigned(FrmFuncionarioCad) then
      FrmFuncionarioCad            := TFrmFuncionarioCad.Create(Application);
      FrmFuncionarioCad.ParamsStr  := 'N';
      FrmFuncionarioCad.ShowModal;
    finally
      TLookupHelper.CarregarLookup(
                  TabVendedor,LookupVendedorSql);
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

Function TFrmPedidoCad.BaixarEstoque:Boolean;
var
I:integer;
begin
  Result  := True;
  ContEstoque   := Nil;

  Try
    ContEstoque := TEstoqueController.Create;
    Try
      TabItensPedido.First;
      TabItensPedido.DisableControls;

      for I := 0 to TabItensPedido.RecordCount -1 do
      begin
        if (TabItensPedidocontrolaestoque.AsString = 'S') and (TabItensPedidoservico.AsString = 'N') then
        begin
          if TabItensPedidousa_chapa.AsString='S' then  //baixa o estoque em m2
          begin
            if not ContEstoque.BaixarEstoquePedido(TabItensPedidoid_produto.AsInteger,
                                  TabItensPedidoqtde_2.AsFloat,
                                  TSession.IDEMPRESA,
                                  TSession.ID_USUARIO,
                                  AIDPedido,
                                  TabItensPedidoprc_compra.AsFloat,
                                  TabItensPedidoprc_unitario.AsFloat
                                  ) then
            begin
              Result  := False;
            end;

          end
          else
          begin
            if not ContEstoque.BaixarEstoquePedido(TabItensPedidoid_produto.AsInteger,
                                  TabItensPedidoqtde.AsFloat,
                                  TSession.IDEMPRESA,
                                  TSession.ID_USUARIO,
                                  AIDPedido,
                                  TabItensPedidoprc_compra.AsFloat,
                                  TabItensPedidoprc_unitario.AsFloat
                                  ) then
            begin
              Result  := False;
            end;
          end;

        end;
        TabItensPedido.Next;
      end;

      TabItensPedido.EnableControls;


    Finally
      FreeandNil(ContEstoque);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;

end;

procedure TFrmPedidoCad.BtnCancelarClick(Sender: TObject);
begin
  FPedidoSalvo := False;
  Close;
end;

procedure TFrmPedidoCad.BtnItensClick(Sender: TObject);
begin
  if pagecontrolgrid.ActivePage = TabLista then
  begin
    pagecontrolgrid.ActivePage  := TabCarrinho;
    cxGrid1.SetFocus;
    btnitens.Caption  := 'Lista | F4';
  end
  else
  begin
    pagecontrolgrid.ActivePage  := TabLista;
    cxGrid.SetFocus;
    btnitens.Caption  := 'Itens | F3';
  end;

end;

procedure TFrmPedidoCad.cxButtonEdit2PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  try
    try
      if not Assigned(FrmPrazoCad) then
      FrmPrazoCad            := TFrmPrazoCad.Create(Application);
      FrmPrazoCad.ParamsStr  := 'N';
      FrmPrazoCad.ShowModal;
    finally
      TLookupHelper.CarregarLookup(
                  TabPrazo,LookupPrazoPagSql);
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmPedidoCad.cxGridDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  ChamarProdutoIncluir;
end;

procedure TFrmPedidoCad.cxGridDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
IMG:String;
begin
  inherited;
  //Exibir imagem
  if TConfiguracaoService.RetornoImagemProduto(IMG,TabProdutoPedidoid_produto.AsInteger) then
  begin
    if IMG <> '' then
    begin
      TConesul.ConvBase64Img(IMG);
      edtFoto.Picture := TConeSul.nfoto;
      TConeSul.nfoto.Free;
    end
    else
    edtFoto.Picture := nil;
  end
  else
  begin
    edtFoto.Picture := nil;
  end;

end;

procedure TFrmPedidoCad.cxGridDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    ChamarProdutoIncluir;
  end;
end;

procedure TFrmPedidoCad.cxGridDBTableView2CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  ChamarProdutoAlterar;
end;

procedure TFrmPedidoCad.cxGridDBTableView2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    ChamarProdutoAlterar;
  end;
end;

Procedure TFrmPedidoCad.ChamarProdutoIncluir;
begin
  try
      if not TabProdutoPedido.Eof then
      begin
        if not Assigned(FrmPedidoItens) then
        FrmPedidoItens                := TFrmPedidoItens.Create(Application);
        FrmPedidoItens.ParamsStr      := 'N';
        FrmPedidoItens.IDPedidoItens  := 0;
        FrmPedidoItens.IDProduto      := TabProdutoPedidoid_produto.AsInteger;
        FrmPedidoItens.AIDPedido      := AIDPedido;
        if TabProdutoPedidoid_produto.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;
        Try
          FrmPedidoItens.ShowModal;
        Finally
          ParamsStr       := 'E';
          ParamsMsgTela   := 'S';
          TLookupHelper.CarregarLookup(
                  TabItensPedido,GetGridProdutoCarrinhoPedidoSql(AIDPedido));
          CalcularTotaisPedido('');
          AtualizarResumo;
        End;
      end
      else
      begin
        JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
      end;
    except on E: Exception do
      begin
        JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
      end;
    end;
end;

Procedure TFrmPedidoCad.ChamarProdutoAlterar;
begin
  //editar produto carrinho
  try
    if TabItensPedido.IsEmpty then
    begin
      JKDialog('Aviso','Nenhum item selecionado!', tdAlerta);
      Exit;
    end;

    if not Assigned(FrmPedidoItens) then
    FrmPedidoItens                := TFrmPedidoItens.Create(Application);
    FrmPedidoItens.ParamsStr      := 'E';
    FrmPedidoItens.IDPedidoItens  := TabItensPedidoid_pedido_itens.AsInteger;
    FrmPedidoItens.IDProduto      := TabProdutoPedidoid_produto.AsInteger;
    FrmPedidoItens.AIDPedido      := AIDPedido;

    if TabItensPedidoid_pedido_itens.AsInteger = 0 then
    begin
      JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
      exit;
    end;

    Try
      FrmPedidoItens.ShowModal;
    Finally
      ParamsStr       := 'E';
      ParamsMsgTela   := 'S';
      TLookupHelper.CarregarLookup(
                  TabItensPedido,GetGridProdutoCarrinhoPedidoSql(AIDPedido));
      CalcularTotaisPedido('');
      AtualizarResumo;
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmPedidoCad.cxTipoPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if cxTipo.Text<>'' then
  TipoOrcamento(cxtipo.ItemIndex);
end;

Procedure TFrmPedidoCad.edtCadPessoaPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  try
    try
      if not Assigned(FrmPessoaCad) then
      FrmPessoaCad            := TFrmPessoaCad.Create(Application);
      FrmPessoaCad.ParamsStr  := 'N';
      FrmPessoaCad.ShowModal;
    finally
      TLookupHelper.CarregarLookup(
                  TabCliente,LookupAssociadoSql);
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmPedidoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if FPedidoSalvo then
  begin
    FrmPedidoCad  := nil;
    Exit;
  end;
  if not ValidarPedido then
  begin
    Action := caNone;
    Exit;
  end;
  AIDPedido :=0;
  FrmPedidoCad := nil;
end;

procedure TFrmPedidoCad.FormCreate(Sender: TObject);
begin
  inherited;
  ConfigurarColunasGrid(cxGridDBTableView1);
  ConfigurarColunasGrid(cxGridDBTableView2);
end;

Procedure TFrmPedidoCad.ConfigurarColunasGrid(AGridView: TcxGridDBTableView);
var
  I: Integer;
  Coluna: TcxGridDBColumn;
begin
  for I := 0 to AGridView.ColumnCount - 1 do
  begin
    Coluna := AGridView.Columns[I];
    if Coluna.Name <> '' then
      Coluna.Visible :=
        TConfiguracaoService.CampoVisivelGrid(Coluna.Name);//Coluna.DataBinding.FieldName
  end;

end;

procedure TFrmPedidoCad.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if Key = VK_F2 then
  begin
    pagecontrolgrid.ActivePage  := TabLista;
    edtPesquisa.SetFocus;
    Key := 0;
  end;

  if Key = VK_F3 then
  begin
    pagecontrolgrid.ActivePage  := TabCarrinho;
    cxGrid1.SetFocus;
    Key := 0;
  end;

  if Key = VK_F4 then
  begin
    pagecontrolgrid.ActivePage  := TabLista;
    cxGrid.SetFocus;
    Key := 0;
  end;

  if Key = VK_F6 then
  begin
    try
      try
        if not Assigned(FrmProdutoCad) then
        FrmProdutoCad            := TFrmProdutoCad.Create(Application);
        FrmProdutoCad.ParamsStr  := 'N';
        FrmProdutoCad.ShowModal;
      finally
        TLookupHelper.CarregarLookup(
                  TabProdutoPedido,GridProdutoPedidoSql);
      end;
    except on E: Exception do
      begin
        JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
      end;
    end;
    Key       := 0;
    ParamsStr := 'E';
  end;

  if Key = VK_F8 then
  begin
    try
      try
        if not Assigned(FrmPessoaCad) then
        FrmPessoaCad            := TFrmPessoaCad.Create(Application);
        FrmPessoaCad.ParamsStr  := 'N';
        FrmPessoaCad.ShowModal;
      finally
        TLookupHelper.CarregarLookup(
                    TabCliente,LookupAssociadoSql);
      end;
    except on E: Exception do
      begin
        JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
      end;
    end;
    Key       := 0;
    ParamsStr := 'E';
  end;

  if Key = VK_DELETE then
  begin
    if pagecontrolgrid.ActivePage <> TabCarrinho then
    begin
      JKDialog('Aviso','Função válida somente para lista do carrinho!', tdAlerta);
      Exit;
    end;
    if TabItensPedido.IsEmpty then
    begin
      JKDialog('Aviso','Nenhum item selecionado para exclusão!', tdAlerta);
      Exit;
    end;
    ExcluirProdutoCarrinho;
    Key := 0;
  end;


end;

procedure TFrmPedidoCad.FormShow(Sender: TObject);
begin
  inherited;
  Try
    TLookupHelper.CarregarLookup(
                  TabCliente,LookupAssociadoSql);
                  TabCliente.First;
    TLookupHelper.CarregarLookup(
                  TabVendedor,LookupVendedorSql);
                  TabVendedor.First;
    TLookupHelper.CarregarLookup(
                  TabPrazo,LookupPrazoPagSql);
                  TabPrazo.First;
    TLookupHelper.CarregarLookup(
                  TabProdutoPedido,GridProdutoPedidoSql);
                  TabProdutoPedido.First;

    if ParamsStr = 'N' then
    begin
      TitleText   := 'Novo Pedido/Orçamento';
      ContPedido  := nil;
      Try
        ContPedido  := TPedidoController.Create;
        if ContPedido.IniciarPedido(AIDPedido) then
        begin
          PopularCampos;
          ParamsStr     := 'E';
          FPedidoSalvo  := False;
        end
        else
        begin
          JKDialog('Erro', 'Não foi possível criar o pedido.', tdErro);
          close;
        end;
      Finally
        FreeAndNil(ContPedido);
      End;
    end
    else
    begin
      TitleText     := 'Editar Pedido/Orçamento';
      AIDPedido     := ParamsInt;
      PopularCampos;
      TLookupHelper.CarregarLookup(
                  TabItensPedido,GetGridProdutoCarrinhoPedidoSql(AIDPedido));
      CalcularTotaisPedido('');
      AtualizarResumo;
      pagecontrolgrid.ActivePage  := TabCarrinho;
      cxGrid1.SetFocus;

      ParamsStr     := 'E';
      FPedidoSalvo  := True;
    end;
  except on E: Exception do
    Begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
      Close;
    End;
  End;
end;

procedure TFrmPedidoCad.PopularCampos;
begin
  inherited;
  ContPedido  := Nil;
  ObjPedido   := Nil;
  try
    ContPedido    := TPedidoController.Create;
    ObjPedido     := TModelPedido.Create;
    Try
      if (AIDPedido=0) or (InttoStr(AIDPedido) = '') then
      raise Exception.Create('Nenhum ID passado no parâmetro.');
      ObjPedido    := ContPedido.BuscarPorID(AIDPedido);
      if Assigned(ObjPedido) then
      begin
        cxcodigo.EditValue              := ObjPedido.numPedido;
        cxData.EditValue                := ObjPedido.data;
        cxHora.EditValue                := ObjPedido.hora;
        if ObjPedido.Status='A' then
        cxstatus.ItemIndex              := 0;
        if ObjPedido.Pedido = 'P' then
        cxTipo.ItemIndex                := 1
        else
        cxTipo.ItemIndex                := 0;
        cxPessoa.EditValue              := ObjPedido.id_Cliente;
        cxVendedor.EditValue            := ObjPedido.id_Vendedor;
        cxPagamento.EditValue           := ObjPedido.id_Prazo;
        cxObs.EditValue                 := ObjPedido.observacao;
        cxResumoItens.EditValue         := ObjPedido.resumoitem;
        cxResumoPeso.EditValue          := ObjPedido.resumopeso;
        cxResumoVolumes.EditValue       := ObjPedido.resumovolume;
        cxAjustePercentual.EditValue    := ObjPedido.descontoperc;
        cxAjustesReais.EditValue        := ObjPedido.descontoreais;
        cxAjustesFrete.EditValue        := ObjPedido.acrescimo;
        cxAjustesAdiantamento.EditValue := ObjPedido.adiantamento;
        cxTotalSubtotal.EditValue       := ObjPedido.subtotal;
        cxTotalGeral.EditValue          := ObjPedido.total;
        cxTotalPagar.EditValue          := ObjPedido.totalapagar;


        if ObjPedido.Pedido = 'O' then
        begin
          TipoOrcamento(0);
          cxvalidade.EditValue          := ObjPedido.dataentrega;
        end;
      end;
    Finally
      FreeAndNil(ContPedido);
      FreeAndNil(ObjPedido);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function LimparPeso(const Valor: string): Double;
var
  S: string;
begin
  S := UpperCase(Valor);
  S := StringReplace(S, 'KG', '', [rfReplaceAll]);
  S := Trim(S);
  Result := StrToFloatDef(S, 0);
end;

function TFrmPedidoCad.Salvar(out msg: string): Boolean;
var
AId:Integer;
begin
  try
    Result        := False;
    ContPedido    := nil;
    ObjPedido     := nil;
    ContPedido    := TPedidoController.create;
    ObjPedido     := TModelPedido.create;

    Try
      if ParamsStr='N' then
      ObjPedido.id_pedido     := 0
      else
      ObjPedido.id_pedido     := AIDPedido;
      ObjPedido.id_Cliente    := cxpessoa.EditValue;
      ObjPedido.id_Prazo      := cxpagamento.EditValue;
      ObjPedido.data          := cxdata.EditValue;
      ObjPedido.hora          := cxhora.EditValue;
      ObjPedido.observacao    := Trim(cxobs.Text);
      ObjPedido.id_Vendedor   := cxvendedor.EditValue;
      ObjPedido.Pedido        := Copy(cxtipo.Text, 1, 1);
      ObjPedido.PagComplemento:= '';
      ObjPedido.adiantamento  := cxAjustesAdiantamento.EditValue;
      ObjPedido.acrescimo     := cxAjustesFrete.EditValue;
      ObjPedido.descontoperc  := cxAjustePercentual.EditValue;
      ObjPedido.descontoreais := cxAjustesReais.EditValue;
      ObjPedido.subtotal      := cxTotalSubtotal.EditValue;
      ObjPedido.total         := cxTotalGeral.EditValue;
      if VarIsNull(cxvalidade.EditValue) then
      ObjPedido.dataentrega   := nullDate
      else
      ObjPedido.dataentrega   := cxvalidade.EditValue;

      if cxaberto.Checked then
      begin
        cxstatus.ItemIndex  := 0;
      end
      else
      begin
        cxstatus.ItemIndex  := 1;
      end;

      ObjPedido.Status        := Copy(cxstatus.Text, 1, 1);

      ObjPedido.resumoitem    := cxResumoItens.EditValue;
      ObjPedido.resumopeso    := LimparPeso(cxResumoPeso.Text);
      ObjPedido.resumovolume  := cxResumoVolumes.EditValue;
      ObjPedido.totalapagar   := cxTotalPagar.EditValue;

      if ParamsStr='E' then
      ObjPedido.id_usuario_alt:= TSession.ID_USUARIO;

      if ContPedido.Salvar(ObjPedido, AId) then
      begin
        if AID = 0 then
        AID             := AIDPedido;

        if cxAberto.Checked = false then
        begin
        //Baixar estoque se o sistema trabalha com controle de estoque.
          if TConfiguracaoService.ValidarControleEstoque(TSession.IDEMPRESA) then
          begin
            if not BaixarEstoque then
            begin
              exit;
            end;
          end;
        end;

        //Tela de fechamando Impresso
        Try
          if not Assigned(FrmImpressao) then
          FrmImpressao                := TFrmImpressao.Create(Application);
          FrmImpressao.varParamsStr  := 'F';
          FrmImpressao.IDPedido      := AID;
          FrmImpressao.ShowModal;
        Finally
          ParamsMsgTela   := 'N';
          msg             := 'Registro salvo com sucesso, ID: '+IntToStr(AID);
          Result          := true;
          FPedidoSalvo    := True;
          ParamsCloseTela := 'S';
        End;

      end;
    Finally
      FreeAndNil(ContPedido);
      FreeAndNil(ObjPedido);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmPedidoCad.TipoOrcamento(I: integer);
begin
  case I of
    0:
    begin
      cxvalidade.Visible  := True;
      lbvalidade.Visible  := True;
      if VarIsNull(cxValidade.EditValue) or (cxValidade.EditValue = 0) then
          cxValidade.Date := Date + 7;

      cxaberto.Checked  := True;
      cxaberto.Enabled  := False;
    end;
    1:
    begin
      cxValidade.Clear;
      cxvalidade.Visible  := False;
      lbvalidade.Visible  := False;
    end;
  end;
end;

function TFrmPedidoCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;
  msg     := '';
  // Cliente
  if VarIsNull(cxPessoa.EditValue) or (Trim(cxpessoa.Text) = '') then
  begin
    msg := 'Informe o cliente.';
    cxPessoa.SetFocus;
    Result := False;
    Exit;
  end;
  // Vendedor
  if VarIsNull(cxVendedor.EditValue) or (Trim(cxVendedor.Text) = '') then
  begin
    msg := 'Informe o vendedor.';
    cxVendedor.SetFocus;
    Result := False;
    Exit;
  end;
  // Pagamento / prazo
  if VarIsNull(cxPagamento.EditValue) or (Trim(cxPagamento.Text) = '') then
  begin
    msg := 'Informe a condição de pagamento.';
    cxPagamento.SetFocus;
    Result := False;
    Exit;
  end;
  // Data
  if VarIsNull(cxData.EditValue) or (Trim(cxData.Text) = '') then
  begin
    msg := 'Informe a data do pedido.';
    cxData.SetFocus;
    Result := False;
    Exit;
  end;
  // Hora
  if VarIsNull(cxHora.EditValue) or (Trim(cxHora.Text) = '') then
  begin
    msg := 'Informe a hora do pedido.';
    cxHora.SetFocus;
    Result := False;
    Exit;
  end;
  // Tipo
  if Trim(cxTipo.Text) = '' then
  begin
    msg := 'Informe o tipo do lançamento.';
    cxTipo.SetFocus;
    Result := False;
    Exit;
  end;
  // Se for orçamento, validade é obrigatória
  // Pela sua regra: index 0 = orçamento / index 1 = pedido
  if (cxTipo.ItemIndex = 0) then
  begin
    if VarIsNull(cxValidade.EditValue) or (Trim(cxValidade.Text) = '') then
    begin
      msg := 'Informe a validade do orçamento.';
      cxValidade.SetFocus;
      Result := False;
      Exit;
    end;
    if cxValidade.Date < cxData.Date then
    begin
      msg := 'A validade do orçamento não pode ser menor que a data do pedido.';
      cxValidade.SetFocus;
      Result := False;
      Exit;
    end;
  end;
  // Ajustes negativos
  if cxAjustePercentual.Value < 0 then
  begin
    msg := 'O desconto percentual não pode ser negativo.';
    cxAjustePercentual.SetFocus;
    Result := False;
    Exit;
  end;
  if cxAjustesReais.Value < 0 then
  begin
    msg := 'O desconto em reais não pode ser negativo.';
    cxAjustesReais.SetFocus;
    Result := False;
    Exit;
  end;
  if cxAjustesFrete.Value < 0 then
  begin
    msg := 'O acréscimo/frete não pode ser negativo.';
    cxAjustesFrete.SetFocus;
    Result := False;
    Exit;
  end;
  if cxAjustesAdiantamento.Value < 0 then
  begin
    msg := 'O adiantamento não pode ser negativo.';
    cxAjustesAdiantamento.SetFocus;
    Result := False;
    Exit;
  end;
  // Desconto percentual limite
  if cxAjustePercentual.Value > 100 then
  begin
    msg := 'O desconto percentual não pode ser maior que 100%.';
    cxAjustePercentual.SetFocus;
    Result := False;
    Exit;
  end;
end;

function TFrmPedidoCad.ValidarPedido:Boolean;
begin
  Result  := False;
  ContPedido  := nil;
  Try
    Try
      ContPedido  := TPedidoController.Create;
      if AIDPedido <= 0 then
      begin
        Result := True;
        Exit;
      end;
      if ContPedido.ExisteItensNoPedido(AIDPedido) then
      begin
        Result  := JKDialog('Cancelar pedido', 'Este pedido já possui itens adicionados.' + sLineBreak +
                      'Ao cancelar, todos os produtos inseridos serão perdidos.' + sLineBreak + sLineBreak +
                      'Deseja realmente cancelar o pedido em andamento?', tdMensagem);
        if Result then
        ContPedido.ExcluirPedidoVazio(AIDPedido);
      end
      else
      begin
        Result  := JKDialog('Cancelar pedido','Este pedido ainda não possui itens.' + sLineBreak +
                  'Deseja cancelar e excluir o pedido?',tdMensagem);
        if Result then
        ContPedido.ExcluirPedidoVazio(AIDPedido);
      end;
    Finally
      FreeAndNil(ContPedido);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmPedidoCad.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if PageControlgrid.ActivePage = TabLista then
  begin
    if Key = #13 then
    begin
      cxGrid.SetFocus;
      Key := #0;
    end;
  end;
end;

procedure TFrmPedidoCad.edtPesquisaPropertiesChange(Sender: TObject);
begin
  inherited;
  Localizar;
end;

procedure TFrmPedidoCad.ExcluirProdutoCarrinho;
begin
    if TabItensPedido.IsEmpty then
    begin
      JKDialog('Aviso','Nenhum item selecionado!', tdAlerta);
      Exit;
    end;

    if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
    begin
      Try
        ContItens    := Nil;
        ContItens    := TPedidoItensController.Create;

        Try
          if ContItens.Excluir(TabItensPedidoid_pedido_itens.AsInteger) then
          begin
            TLookupHelper.CarregarLookup(
                  TabItensPedido,GetGridProdutoCarrinhoPedidoSql(AIDPedido));
            CalcularTotaisPedido('');
            AtualizarResumo;
            //JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
          end;
        Finally
          FreeAndNil(ContItens);
        End;

      except on e:exception do
        begin
          JKDialog('Erro','Erro ao editar o registro.'+#13+e.Message, tdErro);
          exit;
        end;
      end;

    end;

end;

Procedure TFrmPedidoCad.Localizar;
var
  Texto: string;
  Codigo: string;
  Filtro: string;
begin
  Texto := edtpesquisa.Text;
  // Verifica se o texto começa com um dos filtros
  if Texto.StartsWith('//') then
    Filtro := '//'
  else if Texto.StartsWith('**') then
    Filtro := '**'
  else if Texto.StartsWith('--') then
    Filtro := '--'
  else
    Filtro := ''; // Se não começa com nenhum filtro, não faz nada
  // Extrai o código (ou termo de pesquisa) após o filtro
  Codigo := Copy(Texto, Length(Filtro) + 1, MaxInt);
  try
    TabProdutoPedido.Filtered := False;
    if Filtro = '//' then
    begin
      if codigo <> '' then
        TabProdutoPedido.Filter := 'codigo = ' + IntToStr(StrToInt(Codigo))
      else
        TabProdutoPedido.Filter := '';
    end
    else if Filtro = '**' then
    begin
      if codigo <> '' then
        TabProdutoPedido.Filter := 'barra like ' + QuotedStr('%' + Codigo + '%')
      else
        TabProdutoPedido.Filter := '';
    end
    else if Filtro = '--' then
    begin
      TabProdutoPedido.Filter := 'referencia like ' + QuotedStr('%' + Codigo + '%');
    end
    else if Filtro = '' then
    begin
      TabProdutoPedido.Filter := 'descricao like ' + QuotedStr('%' + Codigo + '%');
    end;
    TabProdutoPedido.Filtered := True;
  except
    on E: Exception do
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
  end;
end;

procedure TFrmPedidoCad.CalcularTotaisPedido(Origem: string);
var
  VSubTotal: Currency;
  VTotalItens: Currency;
  VDescPerc: Currency;
  VDescReais: Currency;
  VAcrescimo: Currency;
  VAdiantamento: Currency;
  VTotal: Currency;
  VTotalPagar: Currency;
begin
  if FAtualizandoTotaisPedido then
    Exit;

  FAtualizandoTotaisPedido := True;
  try
    // valores base dos itens
    VSubTotal   := ObterSubtotalItens;
    VTotalItens := ObtertotalItens;

    // ajustes
    VDescPerc     := cxAjustePercentual.Value;
    VDescReais    := cxAjustesReais.Value;
    VAcrescimo    := cxAjustesFrete.Value;
    VAdiantamento := cxAjustesAdiantamento.Value;

    // validações
    if VSubTotal < 0 then
      VSubTotal := 0;

    if VTotalItens < 0 then
      VTotalItens := 0;

    if VDescPerc < 0 then
      VDescPerc := 0;

    if VDescPerc > 100 then
      VDescPerc := 100;

    if VDescReais < 0 then
      VDescReais := 0;

    if VAcrescimo < 0 then
      VAcrescimo := 0;

    if VAdiantamento < 0 then
      VAdiantamento := 0;

    // sincroniza desconto percentual x reais
    if Origem = 'PERC' then
    begin
      VDescReais := (VTotalItens * VDescPerc) / 100;
      cxAjustesReais.EditValue := VDescReais;
    end
    else if Origem = 'REAL' then
    begin
      if VDescReais > VTotalItens then
        VDescReais := VTotalItens;

      cxAjustesReais.EditValue := VDescReais;

      if VTotalItens > 0 then
        VDescPerc := (VDescReais / VTotalItens) * 100
      else
        VDescPerc := 0;

      cxAjustePercentual.EditValue := VDescPerc;
    end
    else
    begin
      if VDescReais > VTotalItens then
      begin
        VDescReais := VTotalItens;
        cxAjustesReais.EditValue := VDescReais;
      end;
    end;

    // total geral
    VTotal := VTotalItens
            + VAcrescimo
            - VDescReais;

    if VTotal < 0 then
      VTotal := 0;

    // total a pagar
    VTotalPagar := VTotal - VAdiantamento;

    if VTotalPagar < 0 then
      VTotalPagar := 0;

    // tela
    cxTotalSubtotal.EditValue := VSubTotal;
    cxTotalGeral.EditValue    := VTotal;
    cxTotalPagar.EditValue    := VTotalPagar;

  finally
    FAtualizandoTotaisPedido := False;
  end;
end;

function TFrmPedidoCad.ObterSubtotalItens: Currency;
var
  SubTotal: Currency;
begin
  SubTotal := 0;

  TabItensPedido.First;
  while not TabItensPedido.Eof do
  begin
    SubTotal := SubTotal + TabItensPedidoprc_subtotal.AsFloat;
    TabItensPedido.Next;
  end;

  Result := SubTotal;
end;

function TFrmPedidoCad.ObtertotalItens: Currency;
var
  Total: Currency;
begin
  Total := 0;

  TabItensPedido.First;
  while not TabItensPedido.Eof do
  begin
    Total := Total + TabItensPedidoprc_total.AsFloat;
    TabItensPedido.Next;
  end;

  Result := Total;
end;

procedure TFrmPedidoCad.AtualizarResumo;
var
  QtdItens: Integer;
  PesoTotal: Currency;
  Volumes: Integer;
begin
  QtdItens    := 0;
  PesoTotal   := 0;
  Volumes     := 0;

  if not Assigned(TabItensPedido) then
    Exit;

  TabItensPedido.DisableControls;
  try
    TabItensPedido.First;

    while not TabItensPedido.Eof do
    begin
      Inc(QtdItens);

      // se existir campo peso no dataset
      if TabItensPedido.FindField('qtde') <> nil then
        PesoTotal := PesoTotal + TabItensPedido.FieldByName('peso').AsCurrency;

      // se existir campo volume
      if TabItensPedido.FindField('id_produto') <> nil then
        Volumes := Volumes + TabItensPedido.FieldByName('volume').AsInteger
      else
        Inc(Volumes); // padrão = 1 por item

      TabItensPedido.Next;
    end;

  finally
    TabItensPedido.EnableControls;
  end;

  // joga na tela (ajuste nomes conforme seus edits)
  cxResumoItens.EditValue     := FormatFloat('000', QtdItens);
  cxResumoPeso.EditValue      := FormatFloat('KG ,0.000', PesoTotal);
  cxResumoVolumes.EditValue   := FormatFloat('000', Volumes);
end;

End.

//procedure TFrmPedidoCad.btnSalvarClick(Sender: TObject);
//var
//msg :String;
//Impressao:string;
//ModelEstoque  :TModelEstoque;
//vservico, vControla:String;
//ModelVal : TValidacao;
//begin
//  //
//
//  if ValidarCampos(msg) then
//  begin
//    Try
//       if Salvar(msg) then
//        begin
//          {$Region 'Estoque Fechamento'}
//
//          if edtStatus.Checked=False then  //Fechando o Pedido
//          begin
//            //Validar o Estoque
//
//            ModelEstoque  := TModelEstoque.create;
//            Try
//              DM.TabItensPedido.DisableControls;
//              DM.TabItensPedido.First;
//
//              while not DM.TabItensPedido.Eof do
//              begin
//
//                //Verificar cadastro do produto/servico
//                if ModelEstoque.ProdutoControlaEstoque(vServico,vControla,
//                                          Produtopedido.DataSet.FieldByName('id_produto').AsInteger) then
//                begin
//                  if (vServico='N') and (vControla='S') then
//                  begin
//                    ModelEstoque.idproduto    := Produtopedido.DataSet.FieldByName('id_produto').AsInteger;
//                    ModelEstoque.movimentacao := 'Saída';
//                    ModelEstoque.qtdenova     := Produtopedido.DataSet.FieldByName('qtde').AsFloat;
//                    ModelEstoque.prccompra    := Produtopedido.DataSet.FieldByName('prc_unitario').AsFloat;
//                    ModelEstoque.prcvenda     := Produtopedido.DataSet.FieldByName('prc_unitario').AsFloat;
//                    ModelEstoque.data         := edtdata.Date;
//                    ModelEstoque.idusuario    := Tsession.ID_USUARIO;
//                    ModelEstoque.obs          := 'Pedido nº '+edtPedido.Text + ' - '+ edtCliente.Text;
//                    ModelEstoque.idempresa    := TSession.IDEMPRESA;
//                    ModelEstoque.numoperacao  := edtPedido.EditValue;
//                    ModelEstoque.idpedido     := idPedido;
//
//                    ModelEstoque.GravarProdutoEstoque;
//                  end;
//
//
//
//                  {ModelEstoque.AdicionarEstoque(Produtopedido.DataSet.FieldByName('id_produto').AsInteger,
//                                              idPedido,
//                                              -Produtopedido.DataSet.FieldByName('qtde').AsFloat
//                                             );}
//                end;
//
//                DM.TabItensPedido.Next;
//              end;
//
//              DM.TabItensPedido.EnableControls;
//              DM.TabItensPedido.First;
//
//            Finally
//              ModelEstoque.free;
//            End;
//
//
//          end;
//
//
//          {$ENDREGION}
//
//          {$REGION 'Livro Caixa Fechamento'}
//
//          if edtStatus.Checked=False then  //Fechando o Pedido
//          begin
//
//            ModelVal      := TValidacao.create;
//            Try
//              if ModelVal.VendaGerarLivroCaixa(TSession.IDEMPRESA) then
//              begin
//                //Verdadeiro gerar o livro caixa
//                RegistrarLivro(msg);
//              end;
//            Finally
//              ModelVal.free;
//            End;
//
//          end;
//
//          {$ENDREGION}
//
//
//          JKDialog('Sucesso',msg, tdSucesso);
//
//          // Chama impressao
//          Impressao   := TConeSul.LerValorIni(TConeSul.ndir,'PEDIDO','TelaImpressao','');
//          if impressao = 'S' then
//          begin
//            Try
//              FrmImpressao            := TFrmImpressao.Create(Application);
//              FrmImpressao.idPedido   := idPedido;
//              FrmImpressao.nmPedido   := edtPedido.EditValue;
//              FrmImpressao.idPessoa   := edtCliente.EditValue;
//              FrmImpressao.nmVendedor	:= edtvendedor.Text;
//              FrmImpressao.nmData     := edtdata.Date;
//              FrmImpressao.nmHora     := edtHora.Time;
//              FrmImpressao.nmTotal    := strtofloat(edttotal.Text);
//
//              FrmImpressao.ShowModal;
//
//            Finally
//              TNavigation.Close(Self);
//            End;
//
//          end
//          else
//          TNavigation.Close(Self);
//
//        end
//        else
//        JKDialog('Aviso',msg, tdAlerta);
//
//
//    Except on e:exception do
//      begin
//        JKDialog('Aviso',msg+' :'+e.Message, tdErro);
//        raise
//      end;
//    End;
//  end
//  else
//  begin
//    JKDialog('Aviso',msg, tdAlerta);
//    exit;
//  end;
//end;
//
//{$REGION 'Financeiro'}
//
//function TFrmPedidoCad.RegistrarLivro(out msg: string): Boolean;
//var
//ModelLC :TModelLivroCaixa;
//ModelVal:TValidacao;
//IdPlano,IdCusto:integer;
//begin
//  Result  := False;
//  ModelLC             := TModelLivroCaixa.Create;
//  ModelVal            := TValidacao.create;
//  Try
//    try
//      //Popular os campo para salvar
//
//      ModelLC.DataLan     := EdtData.EditValue;
//      ModelLC.Operacao    := 'Entrada';
//      ModelLC.DocNumero   := Trim(edtPedido.text);
//      ModelLC.VlrEntrada  := edtTotal.EditValue;
//      ModelLC.VlrSaida    := 0;
//      ModelLC.Saldo       := 0;
//      ModelLC.Historico   := 'Ref.: Pedido Nº '+edtpedido.text+sLineBreak+
//                             'Cliente: '+edtCliente.text+sLineBreak+
//                             'Pagamento:'+edtpagamento.text+sLineBreak+
//                             'Vendedor: '+edtVendedor.text;
//
//      ModelLC.Valor       := edtTotal.EditValue;
//
//      if ModelVal.LivroCaixaVenda(IdPlano,IdCusto, TSession.IDEMPRESA) then
//      begin
//        ModelLC.IdPlano     := IdPlano;
//        ModelLC.IdCusto     := IdCusto;
//      end
//      else
//      begin
//        ModelLC.IdPlano     := 0;
//        ModelLC.IdCusto     := 0;
//      end;
//
//      ModelLC.idpedido    := idPedido;
//
//      if ModelLC.Registrar(msg) then;
//      Result  := True;
//
//    Except on e:exception do
//      begin
//        msg := msg+' :'+e.Message;
//        raise;
//      end;
//    end;
//
//  Finally
//    ModelLC.Free;
//    ModelVal.Free;
//  End;
//
//end;
//
//{$ENDREGION}
//
//procedure TFrmPedidoCad.CalcularItensPedido;
//var
//subtotal:double;
//msg:string;
//begin
//  subtotal:= 0;
//  try
//    Try
//
//      with dm do
//      begin
//        //Quantidade
//        if not TabItensPedido.Active then
//        begin
//          edtQtde.EditValue         :=0;
//          edtSubTotal.EditValue     :=0;
//          edtTotal.EditValue        :=0;
//          edtFrete.EditValue        := 0;
//          edtDesconto.EditValue     := 0;
//          edtadiantamento.EditValue := 0;
//          Exit;
//        end;
//
//        edtQtde.EditValue := TabItensPedido.RecordCount;
//
//        //Subtotal
//        TabItensPedido.First;
//        while not TabItensPedido.eof do
//        begin
//          SubTotal  := subtotal + TabItensPedido.FieldByName('prc_total').Value;
//          TabItensPedido.Next;
//        end;
//
//        edtSubTotal.EditValue := subtotal;
//
//        edtTotal.EditValue    := ((SubTotal -
//                                 edtDesconto.EditValue) + edtFrete.EditValue - edtadiantamento.EditValue);
//
//      end;
//
//    Except
//      edtQtde.EditValue         := 0;
//      edtSubTotal.EditValue     := 0;
//      edtTotal.EditValue        := 0;
//      edtFrete.EditValue        := 0;
//      edtDesconto.EditValue     := 0;
//      edtadiantamento.EditValue := 0;
//    End;
//  finally
//    if Salvar(msg) then
//  end;
//end;

//procedure TFrmPedidoCad.DeleteItensPedido;
//var
//Pedido  :TModelPedido;
//msg     :String;
//begin
////DeleteItensPedido
//  Try
//    Pedido      := TModelpedido.Create;
//
//    Pedido.idPedido       := idPedido;
//    Pedido.idpedidoitens  := ProdutoPedido.DataSet.FieldByName('id_pedido_itens').AsInteger;
//    Pedido.idproduto      := ProdutoPedido.DataSet.FieldByName('id_produto').AsInteger;
//
//    if Pedido.DeleteItensPedido(msg) then
//    JKDialog('Sucesso',msg, tdSucesso);
//
//  Finally
//    DM.TabItensPedido.EmptyDataSet;
//    Pedido.ExibirProdutoPedido(msg);
//    Pedido.Free;
//    CalcularItensPedido;
//  End;
//end;

//procedure TFrmPedidoCad.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
//begin
//  if pagecontrol1.ActivePage = TabLista then
//  begin
//
//    if Key = #13 then
//    begin
//      cxGrid.SetFocus;
//      Key := #0;
//    end;
//
//  end;
//end;

//procedure TFrmPedidoCad.FormKeyDown(Sender: TObject; var Key: Word;
//  Shift: TShiftState);
//var
//idCliPree:integer;
//  begin
//  if key = VK_F3 then
//  begin
//    ExibirProdutoPedido;
//    pagecontrol1.ActivePage := Tabcarrinho;
//  end;
//
//  if key = vk_f4 then
//  begin
//    pagecontrol1.ActivePage := TabLista;
//  end;
//
//
//  if key = vk_F2 then
//  begin
//    if PageControl1.ActivePage = Tabcarrinho then
//    Pagecontrol1.ActivePage := TabLista;
//    edtPesquisa.SetFocus;
//  end;
//
//
//  if key = vk_F8 then
//  begin
//    //Chamar tela de Cadastro
//    Try
//      FrmPessoaCad                  := TFrmPessoaCad.Create(Application);
//      TNavigation.ParamInt          := 0;
//      TNavigation.ParamsStr         := 'N';
//      FrmPessoaCad.ShowModal;
//    Finally
//      idCliPree             := edtCliente.EditValue;  //guardo o id para não perder
//      PopularCliente;                    //recarrego a lista
//      edtCliente.EditValue  := idCliPree;  //e vola o id que estava antes.
//    End;
//  end;
//
//  if key = vk_F6 then
//  begin
//    //Chamar tela de Cadastro
//    Try
//      FrmProdutoCad                 := TFrmProdutoCad.Create(Application);
//      TNavigation.ParamInt          := 0;
//      TNavigation.ParamsStr         := 'N';
//      FrmProdutoCad.ShowModal;
//    Finally
//      PopularProdutoPedido;
//    End;
//  end;
//
//
//
//  if PageControl1.ActivePage = TabCarrinho then
//  begin
//    if key = VK_DELETE then
//    DeleteItensPedido;
//  end;
//
//  if key = vk_F5 then
//  begin
//    btnSalvar.Click;
//  end;
//
//
//end;
//
//procedure TFrmPedidoCad.FormShow(Sender: TObject);
//begin
//  try
//    PopularPrazoPag;
//  Except
//  end;
//
//  try
//    PopularCliente;
//  Except
//  end;
//
//  Try
//    PopularVendedor;
//  Except
//  end;
//
//  Try
//    PopularProdutoPedido;
//  Except
//  end;


//Procedure TFrmPedidoCad.ExibirProdutoPedido;
//var
//Pedido    :TModelPedido;
//msg       :string;
//begin
//  //Exibir os Itens no carrinho
//
//  Try
//    Pedido      := Tmodelpedido.Create;
//
//    Pedido.idPedido := idpedido;
//
//    if pedido.ExibirProdutoPedido(msg) then
//
//  Finally
//    Pedido.Free;
//  End;
//end;


//end.
