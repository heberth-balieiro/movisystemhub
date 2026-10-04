unit UnitProdutoEntrada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseCad, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue, ACBrBase, ACBrEnterTab, cxCheckBox, cxTextEdit,
  cxGroupBox, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, cxCurrencyEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Vcl.Menus, cxButtons, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, UDM, DBAccess, Uni, uJKDialog,
  Datasnap.DBClient, UnitProdutoEstoque, UnitProdutoCad, Vcl.Navigation, cxMemo,
  Model.Estoque, Vcl.Session, UConeSul, frxClass, frxDBSet, Model.Empresa,
  Model.SQLQry;

type
  TFrmProdutoEntrada = class(TFrmBaseCad)
    cxGrid: TcxGrid;
    cxGridDB: TcxGridDBTableView;
    coll1: TcxGridDBColumn;
    coll2: TcxGridDBColumn;
    coll3: TcxGridDBColumn;
    coll5: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Pop: TPopupMenu;
    btnexcluir: TMenuItem;
    btnLimpar: TMenuItem;
    Label7: TLabel;
    Label8: TLabel;
    Panel3: TPanel;
    cxGroupBox11: TcxGroupBox;
    edtPesquisa: TcxTextEdit;
    cxGridLista: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    idproduto: TcxGridDBColumn;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    cxGridDBTableView1Column5: TcxGridDBColumn;
    cxGridDBTableView1Column6: TcxGridDBColumn;
    cxGridDBTableView1Column8: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    dsListaProduto: TUniDataSource;
    dsEntrada: TDataSource;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    Label2: TLabel;
    Label3: TLabel;
    ordem: TcxGridDBColumn;
    cxStyleGridProd: TcxStyleRepository;
    GridProduto: TcxGridTableViewStyleSheet;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    edtObs: TcxMemo;
    frxDBEstoqueEntrada: TfrxDBDataset;
    frxRelatorio: TfrxReport;
    procedure FormShow(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure edtPesquisaPropertiesChange(Sender: TObject);
    procedure cxGridDBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnLimparClick(Sender: TObject);
    procedure btnexcluirClick(Sender: TObject);
  private
    procedure AbrirProduto;
    procedure FormCadastroproduto;
    Procedure Impressao;
    { Private declarations }
  public
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    { Public declarations }
  end;

var
  FrmProdutoEntrada: TFrmProdutoEntrada;

implementation

{$R *.dfm}

procedure TFrmProdutoEntrada.btnexcluirClick(Sender: TObject);
begin
  inherited;
  if not Assigned(dm.EntradaProduto) then
  raise Exception.Create('Dataset EntradaProduto não está criado.');

  if not dm.EntradaProduto.Active then
  dm.EntradaProduto.CreateDataSet;

  if dm.EntradaProduto.RecordCount = 0 then
  begin
    JKDialog('Aviso','Nenhum produto na lista!', tdAlerta);
    exit;
  end;

  if JKDialog('Aviso', 'Confirma excluir o produto da lista?', tdMensagem)  then
  begin
    if dsEntrada.DataSet.FieldByName('id_produto').AsInteger > 0 then
    dm.EntradaProduto.Delete
    else
    JKDialog('Aviso','Nenhum produto selecionado!', tdAlerta);
  end;
end;

procedure TFrmProdutoEntrada.btnLimparClick(Sender: TObject);
begin
  inherited;
  if not Assigned(dm.EntradaProduto) then
  raise Exception.Create('Dataset EntradaProduto não está criado.');

  if not dm.EntradaProduto.Active then
  dm.EntradaProduto.CreateDataSet;

  if JKDialog('Aviso', 'Confirma limpar a lista?', tdMensagem)  then
  dm.EntradaProduto.EmptyDataSet;



end;

procedure TFrmProdutoEntrada.cxGridDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  AbrirProduto;
end;

procedure TFrmProdutoEntrada.cxGridDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    AbrirProduto;
  end;
end;

Procedure TFrmProdutoEntrada.AbrirProduto;
begin
  with cxGridDBTableView1.controller do
    begin
      if SelectedRowCount <=0 then
      begin
        JKDialog('Aviso','Nenhum produto selecionado!', tdAlerta);
        Exit;
      end;
      Try
        FrmProdutoEstoque          := TFrmProdutoEstoque.Create(Application);
        FrmProdutoEstoque.Tag      := dsListaProduto.DataSet.FieldByName('id_produto').AsInteger;
        FrmProdutoEstoque.operacao := TNavigation.ParamsStr;
        FrmProdutoEstoque.ShowModal;

      Finally
        cxGridLista.SetFocus;
      End;
    end;
end;

procedure TFrmProdutoEntrada.edtPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
    begin
      cxGridLista.SetFocus;
      Key := #0;
    end;
end;

procedure TFrmProdutoEntrada.edtPesquisaPropertiesChange(Sender: TObject);
var
  Texto: string;
  Codigo: string;
  Filtro: string;
begin
  inherited;
  //Pesquisa Produto

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
    dm.TabProdutoPedido.Filtered := False; // Desativa o filtro atual
    if Filtro = '//' then
    begin
      if codigo <> '' then
        dm.TabProdutoPedido.Filter := 'codigo = ' + IntToStr(StrToInt(Codigo))
      else
        dm.TabProdutoPedido.Filter := '';
    end
    else if Filtro = '**' then
    begin
      if codigo <> '' then
        dm.TabProdutoPedido.Filter := 'barra like ' + QuotedStr('%' + Codigo + '%')
      else
        dm.TabProdutoPedido.Filter := '';
    end
    else if Filtro = '--' then
    begin
      dm.TabProdutoPedido.Filter := 'referencia like ' + QuotedStr('%' + Codigo + '%');
    end
    else if Filtro = '' then
    begin
      dm.TabProdutoPedido.Filter := 'descricao like ' + QuotedStr('%' + Codigo + '%');
    end;
    dm.TabProdutoPedido.Filtered := True; // Ativa o novo filtro
  except
    on E: Exception do
      ShowMessage('Erro ao filtrar os dados: ' + E.Message);
  end;
end;

procedure TFrmProdutoEntrada.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
    vk_F2: edtpesquisa.SetFocus;
    vk_F4: btnexcluir.Click;
    vk_F5: btnsalvar.Click;
    vk_F6: FormCadastroproduto;
    vk_escape:btncancelar.Click;
  end;

  if (Key = Ord('D')) and (ssCtrl in Shift) then
  begin
    btnLimpar.Click;
    Key := 0;
  end;

end;

procedure TFrmProdutoEntrada.FormCadastroproduto;
var
msg:string;
begin
  Try
      FrmProdutoCad                 := TFrmProdutoCad.Create(Application);
      TNavigation.ParamInt          := 0;
      TNavigation.ParamsStr         := 'N';
      FrmProdutoCad.ShowModal;
  Finally
    Try
      //dm.PopularProdutoPedido(msg);
    Except on e:exception do
      begin
        JKDialog('Erro','Erro ao carregar a lista de produto!'+msg+e.Message, tdErro);
      end;
    end;
  End;
end;

procedure TFrmProdutoEntrada.FormShow(Sender: TObject);
var
msg:string;
begin
  inherited;
  DM.EntradaProduto.EmptyDataSet;
  if TNavigation.ParamsStr ='Entrada' then
  begin
    lbltitulo.caption	:= 'Entrada de produtos';
  end
  else
  lbltitulo.caption	:=  'Saída de produtos';

  Try
    //dm.PopularProdutoPedido(msg);
    edtpesquisa.SetFocus;
    dsEntrada.DataSet.Open;
  Except on e:exception do
    begin
      JKDialog('Erro','Erro ao carregar a lista de produto!'+msg+e.Message, tdErro);
    end;
  end;

end;

function TFrmProdutoEntrada.Salvar(out msg: string): Boolean;
var
Model       : TModelEstoque;
ModelSql    :TModelSql;
Impresso    :String;
numoperacao :integer;
begin
  Result  := False;
  Model   := TModelEstoque.Create;
  ModelSql:= TModelSql.Create;
  Try
    try
      DM.EntradaProduto.DisableControls;
      DM.EntradaProduto.First;

      Try
        //Gerar o numero da operacao
        Try
          numoperacao   := Modelsql.GerarId(dm.Conn,'movimentacao_estoque','num_operacao');
        Finally
          ModelSql.Free;
        End;

        while not DM.EntradaProduto.Eof do
        begin

//          Model.idproduto   := DM.EntradaProdutoid_produto.AsInteger;
//          Model.qtdenova    := DM.EntradaProdutoqtde_nova.AsFloat;
//          Model.movimentacao:= TNavigation.ParamsStr;
//          Model.data        := Now;
//          Model.qtdeantes   := DM.EntradaProdutoqtde_anterior.AsFloat;
//          Model.prccompra   := DM.EntradaProdutoprc_compra.AsFloat;
//          Model.prcvenda    := DM.EntradaProdutoprc_venda.AsFloat;
//          Model.idusuario   := Tsession.ID_USUARIO;
//          Model.idempresa   := TSession.IDEMPRESA;
//          Model.obs         := trim(edtObs.Text);
//          Model.numoperacao := numoperacao;
//
//          if not Model.GravarProdutoEstoque then
//          raise Exception.Create('Erro:');
//
//          DM.EntradaProduto.Next;
        end;
      Finally
        //Chamar o relatorio
        Impresso  := TConeSul.LerValorIni(TConeSul.ndir,'PEDIDO','ImpressoEstEntrada','');
        if Impresso = 'S' then
        begin
          DM.EntradaProduto.First;
          Impressao;
          Result  := True;
          msg:= 'Entrada realizada com sucesso.';
          DM.EntradaProduto.EmptyDataSet;
          dsEntrada.DataSet.Close;
          DM.EntradaProduto.EnableControls;
        end
        else
        begin
          Result  := True;
          msg:= 'Entrada realizada com sucesso.';
          DM.EntradaProduto.EmptyDataSet;
          dsEntrada.DataSet.Close;
          DM.EntradaProduto.EnableControls;
        end;

      End;

    Except on e:exception do
      begin
        msg := e.Message;
        raise;
      end;
    end;

  Finally
    Model.Free;
  End;
end;

Procedure TFrmProdutoEntrada.Impressao;
var
Model :TModelEmpresa;
msg:String;
TempImage: Timage;
begin
  //Listagem de entrada

    if not DM.EntradaProduto.Eof then
    begin
      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelEstoqueEntrada.fr3');
        Model               := TModelEmpresa.Create;
        Try
          Model.idempresa   := TSession.IDEMPRESA;
          Model.SelectCabecalhoReport(msg);

          FrxRelatorio.Variables.Clear;
          FrxRelatorio.Variables['nrazao']          :=quotedstr(Model.razao);
          FrxRelatorio.Variables['nfantasia']       :=quotedstr(model.fantasia);
          FrxRelatorio.Variables['nendereco']       :=quotedstr(model.endereco);
          FrxRelatorio.Variables['nnumero']         :=quotedstr(model.numero);
          FrxRelatorio.Variables['nbairro']         :=quotedstr(model.bairro);
          FrxRelatorio.Variables['ntelefone']       :=quotedstr(model.telefone);
          FrxRelatorio.Variables['nfone1']          :=quotedstr(model.telefone2);
          FrxRelatorio.Variables['nfone2']          :=quotedstr(model.celular);
          FrxRelatorio.Variables['nemail']          :=quotedstr(model.email1);
          FrxRelatorio.Variables['ncnpj']           :=quotedstr(model.cnpj);
          FrxRelatorio.Variables['nie']             :=quotedstr(model.ie);

          try
            // Decodifica a imagem Base64 e carrega no fluxo de memória
            TempImage             := TImage.Create(nil);
            TConesul.ConvBase64Img(model.logo);
            TempImage.Picture     :=TConesul.nfoto;
            TConesul.nfoto.Free;
            TempImage.Picture.SaveToFile(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg')
          finally
            TempImage.Free;
          end;

          FrxRelatorio.Variables['wlogo']           :=quotedstr(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg');
          FrxRelatorio.Variables['ncep']            :=quotedstr(model.cep);
          FrxRelatorio.Variables['ncidade']         :=quotedstr(model.cidade);
          FrxRelatorio.Variables['filtro']          :=quotedstr(TNavigation.ParamsStr+' de Produto');

        Finally
          model.Free;
        End;

        FrxRelatorio.Report.PrepareReport();
        FrxRelatorio.ShowReport;
    end
    else
    begin
      JKDialog('Aviso','Nenhum registro encontrato!', tdAlerta);
    end;

end;

function TFrmProdutoEntrada.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if DM.EntradaProduto.RecordCount = 0 then
  begin
    msg     := 'Nenhum produto inserido na lista para registar a entrada!';
    Result  := False;
    Exit;
  end;

end;

end.
