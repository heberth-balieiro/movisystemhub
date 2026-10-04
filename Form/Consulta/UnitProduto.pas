unit UnitProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Navigation, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic,
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
  dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Vcl.Menus, dxGDIPlusClasses,
  cxCurrencyEdit, ACBrBase, ACBrEnterTab, Vcl.Tabs, Vcl.ComCtrls, frxClass,
  frxDBSet, UFormNovoBasePesquisa, cxContainer, Vcl.ButtonStylesAttributes,
  System.ImageList, Vcl.ImgList, cxImageList, DBAccess, Uni, Vcl.StyledButton,
  cxMaskEdit, cxDropDownEdit, cxTextEdit, cxGroupBox, dxmdaset,
  Controller.Produto, Model.TabProduto;

type
  TFrmProdutos = class(TFormNovoBasePesquisa)
    frxRelatorio: TfrxReport;
    frxDBListagemProduto: TfrxDBDataset;
    ListagemcomPreo1: TMenuItem;
    ListagemAgrupadoGrupo1: TMenuItem;
    ListagemAgrupadoMarca1: TMenuItem;
    ListagemAgrupadoLocalizao1: TMenuItem;
    ListagemEstoque1: TMenuItem;
    N2: TMenuItem;
    SincronizardadosAPP1: TMenuItem;
    mdPesquisa: TdxMemData;
    mdPesquisaid_produto: TIntegerField;
    mdPesquisacodigo: TIntegerField;
    mdPesquisacod_barras: TStringField;
    mdPesquisareferencia: TStringField;
    mdPesquisadescricao: TStringField;
    mdPesquisaservico: TStringField;
    mdPesquisaativo: TStringField;
    mdPesquisaprc_venda: TCurrencyField;
    mdPesquisaestoque_atual: TCurrencyField;
    mdPesquisaprc_promocao: TCurrencyField;
    mdPesquisamarca: TStringField;
    mdPesquisagrupo: TStringField;
    mdPesquisauni: TStringField;
    mdPesquisalocalizacao: TStringField;
    GridRecId: TcxGridDBColumn;
    Gridid_produto: TcxGridDBColumn;
    Gridcodigo: TcxGridDBColumn;
    Gridcod_barras: TcxGridDBColumn;
    Gridreferencia: TcxGridDBColumn;
    Griddescricao: TcxGridDBColumn;
    Gridservico: TcxGridDBColumn;
    Gridativo: TcxGridDBColumn;
    Gridequipamento: TcxGridDBColumn;
    Gridprc_venda: TcxGridDBColumn;
    Gridestoque_atual: TcxGridDBColumn;
    Gridprc_promocao: TcxGridDBColumn;
    Gridmarca: TcxGridDBColumn;
    Gridgrupo: TcxGridDBColumn;
    Griduni: TcxGridDBColumn;
    Gridlocalizacao: TcxGridDBColumn;
    mdPesquisaprod_equipamento: TStringField;
    procedure BtnLimparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    Procedure Novo        ;override;
    Procedure Pesquisa    ;override;
    Procedure Editar      ;override;
    Procedure Excluir     ;override;
    Procedure Listagem    ;override;
    Procedure Relatorio   ;override;
    { Public declarations }
  end;

var
  FrmProdutos: TFrmProdutos;
  ObjProd   : TTabProduto;
  ContProd  : TProdutoController;
implementation

{$R *.dfm}

uses UnitProdutoCad, UConeSul, Vcl.Loading, Vcl.Session,uJKDialog, UnitPrincipalNew,
 AppVendas, Vcl.Validacoes, System.Generics.Collections;


procedure TFrmProdutos.BtnLimparClick(Sender: TObject);
begin
  inherited;
  mdPesquisa.Close;
end;

procedure TFrmProdutos.Editar;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
      begin
        if not Assigned(FrmProdutoCad) then
        FrmProdutoCad := TFrmProdutoCad.Create(Application);
        FrmProdutoCad.ParamsStr  := 'E';
        FrmProdutoCad.ParamsInt  := mdPesquisaid_produto.AsInteger;
        if mdPesquisaid_produto.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;
        FrmProdutoCad.Show;
      end;
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

procedure TFrmProdutos.Excluir;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
      begin
        Try
          ContProd  := Nil;
          ContProd  := TProdutoController.Create;

          if mdPesquisaid_produto.AsInteger = 0 then
          begin
            JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
            exit;
          end;

          if ContProd.Excluir(mdPesquisaid_produto.AsInteger) then
          begin
            Pesquisa;
            JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
          end;

        Finally
          FreeAndNil(ContProd);
        End;
      end;
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

procedure TFrmProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmProdutos := nil;
end;

procedure TFrmProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;
end;

procedure TFrmProdutos.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'Produto';
  TitleText   := 'Pesquisa de Produto';
end;

procedure TFrmProdutos.Listagem;
begin
  inherited;
  try
    JKDialog('Alerta','Funcionalidade em desenvolvimento.', tdAlerta);
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmProdutos.Novo;
begin
  inherited;
  if not Assigned(FrmProdutoCad) then
  FrmProdutoCad   := TFrmProdutoCad.Create(Application);
  FrmProdutoCad.ParamsStr  := 'N';
  FrmProdutoCad.ShowModal;
end;

procedure TFrmProdutos.Pesquisa;
var
List    : TObjectList<TTabProduto>;
nCampo, nSituacao : String;
begin
  inherited;
  try
    List      := Nil;
    nCampo    := '';
    nSituacao := '';

    if trim(edtBusca.Text) <> '' then
    nCampo     := Trim(edtBusca.Text);

    if cxativo.ItemIndex > 0 then
    nsituacao   := cxativo.Text;

    ContProd   := TProdutoController.Create;

    Try
      List  := ContProd.ListarTodos(nCampo, nSituacao);

      mdPesquisa.Close;
      mdPesquisa.FieldDefs.Clear;

      if (List = nil) or (List.Count = 0) then
      begin
        mdPesquisa.Close;
        exit;
      end;

      if not mdPesquisa.Active then
        mdPesquisa.Open;

      mdPesquisa.DisableControls;

      for var Item in List do
      begin
        mdPesquisa.Append;

        mdPesquisaid_produto.AsInteger        := Item.id_produto;
        mdPesquisacodigo.AsInteger            := Item.codigo;
        mdPesquisacod_barras.AsString         := Item.cod_barras;
        mdPesquisareferencia.AsString         := Item.referencia;
        mdPesquisadescricao.AsString          := Item.descricao;
        mdPesquisaservico.AsString            := Item.servico;
        mdPesquisaativo.AsString              := Item.ativo;
        mdPesquisaprod_equipamento.AsString   := Item.prod_equipamento;
        mdPesquisaprc_venda.AsFloat           := Item.prc_venda;
        mdPesquisaestoque_atual.AsFloat       := Item.estoque_atual;
        mdPesquisaprc_promocao.AsFloat        := Item.prc_promocao;
        mdPesquisamarca.AsString              := Item.marca;
        mdPesquisagrupo.AsString              := Item.grupo;
        mdPesquisauni.AsString                := Item.Uni;
        mdPesquisalocalizacao.AsString        := Item.localizacao;

        mdPesquisa.Post;
      end;
      mdPesquisa.First;
      mdPesquisa.EnableControls;

    Finally
      FreeAndNil(ContProd);
      if Assigned(List) then
        List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmProdutos.Relatorio;
begin
  inherited;
  try
    JKDialog('Alerta','Funcionalidade em desenvolvimento.', tdAlerta);
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

end.

//procedure TFrmProdutos.btnListagemClick(Sender: TObject);
//var
//Model :TModelEmpresa;
//msg:String;
//TempImage: Timage;
//begin
//  //Listagem produto
//
//  Try
//    if not DM.TabConsProduto.Eof then
//    begin
//      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelListagemProduto.fr3');
//      Try
//        DM.TabConsProduto.DisableControls;
//
//        Model               := TModelEmpresa.Create;
//        Try
//          Model.idempresa   := TSession.IDEMPRESA;
//          Model.SelectCabecalhoReport(msg);
//
//          FrxRelatorio.Variables.Clear;
//          FrxRelatorio.Variables['nrazao']          :=quotedstr(Model.razao);
//          FrxRelatorio.Variables['nfantasia']       :=quotedstr(model.fantasia);
//          FrxRelatorio.Variables['nendereco']       :=quotedstr(model.endereco);
//          FrxRelatorio.Variables['nnumero']         :=quotedstr(model.numero);
//          FrxRelatorio.Variables['nbairro']         :=quotedstr(model.bairro);
//          FrxRelatorio.Variables['ntelefone']       :=quotedstr(model.telefone);
//          FrxRelatorio.Variables['nfone1']          :=quotedstr(model.telefone2);
//          FrxRelatorio.Variables['nfone2']          :=quotedstr(model.celular);
//          FrxRelatorio.Variables['nemail']          :=quotedstr(model.email1);
//          FrxRelatorio.Variables['ncnpj']           :=quotedstr(model.cnpj);
//          FrxRelatorio.Variables['nie']             :=quotedstr(model.ie);
//
//          try
//            // Decodifica a imagem Base64 e carrega no fluxo de memória
//            TempImage             := TImage.Create(nil);
//            TConesul.ConvBase64Img(model.logo);
//            TempImage.Picture     :=TConesul.nfoto;
//            TConesul.nfoto.Free;
//            TempImage.Picture.SaveToFile(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg')
//          finally
//            TempImage.Free;
//          end;
//
//          FrxRelatorio.Variables['wlogo']           :=quotedstr(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg');
//          FrxRelatorio.Variables['ncep']            :=quotedstr(model.cep);
//          FrxRelatorio.Variables['ncidade']         :=quotedstr(model.cidade);
//          FrxRelatorio.Variables['filtro']          :=quotedstr('Listagem de Produto');
//
//        Finally
//          model.Free;
//        End;
//
//        FrxRelatorio.Report.PrepareReport();
//        FrxRelatorio.ShowReport;
//      Finally
//        DM.TabConsProduto.First;
//        DM.TabConsProduto.EnableControls;
//      End;
//
//    end
//    else
//    begin
//      JKDialog('Aviso','Nenhum registro encontrato!', tdAlerta);
//    end;
//
//  Except
//
//  End;
//end;
//
//procedure TFrmProdutos.btnlistestoqueClick(Sender: TObject);
//var
//Model :TModelEmpresa;
//msg:String;
//TempImage: Timage;
//begin
//  //Listagem produto
//
//  Try
//    if not DM.TabConsProduto.Eof then
//    begin
//      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelListagemProdutoEstoque.fr3');
//      Try
//        DM.TabConsProduto.DisableControls;
//
//        Model               := TModelEmpresa.Create;
//        Try
//          Model.idempresa   := TSession.IDEMPRESA;
//          Model.SelectCabecalhoReport(msg);
//
//          FrxRelatorio.Variables.Clear;
//          FrxRelatorio.Variables['nrazao']          :=quotedstr(Model.razao);
//          FrxRelatorio.Variables['nfantasia']       :=quotedstr(model.fantasia);
//          FrxRelatorio.Variables['nendereco']       :=quotedstr(model.endereco);
//          FrxRelatorio.Variables['nnumero']         :=quotedstr(model.numero);
//          FrxRelatorio.Variables['nbairro']         :=quotedstr(model.bairro);
//          FrxRelatorio.Variables['ntelefone']       :=quotedstr(model.telefone);
//          FrxRelatorio.Variables['nfone1']          :=quotedstr(model.telefone2);
//          FrxRelatorio.Variables['nfone2']          :=quotedstr(model.celular);
//          FrxRelatorio.Variables['nemail']          :=quotedstr(model.email1);
//          FrxRelatorio.Variables['ncnpj']           :=quotedstr(model.cnpj);
//          FrxRelatorio.Variables['nie']             :=quotedstr(model.ie);
//
//          try
//            // Decodifica a imagem Base64 e carrega no fluxo de memória
//            TempImage             := TImage.Create(nil);
//            TConesul.ConvBase64Img(model.logo);
//            TempImage.Picture     :=TConesul.nfoto;
//            TConesul.nfoto.Free;
//            TempImage.Picture.SaveToFile(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg')
//          finally
//            TempImage.Free;
//          end;
//
//          FrxRelatorio.Variables['wlogo']           :=quotedstr(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg');
//          FrxRelatorio.Variables['ncep']            :=quotedstr(model.cep);
//          FrxRelatorio.Variables['ncidade']         :=quotedstr(model.cidade);
//          FrxRelatorio.Variables['filtro']          :=quotedstr('Listagem de Produto Estoque');
//
//        Finally
//          model.Free;
//        End;
//
//        FrxRelatorio.Report.PrepareReport();
//        FrxRelatorio.ShowReport;
//      Finally
//        DM.TabConsProduto.First;
//        DM.TabConsProduto.EnableControls;
//      End;
//
//    end
//    else
//    begin
//      JKDialog('Aviso','Nenhum registro encontrato!', tdAlerta);
//    end;
//
//  Except
//
//  End;
//end;
//
//procedure TFrmProdutos.btnListGrupoClick(Sender: TObject);
//var
//Model :TModelEmpresa;
//msg:String;
//TempImage: Timage;
//begin
//  //Listagem produto
//
//  Try
//    if not DM.TabConsProduto.Eof then
//    begin
//      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelListagemProdutoGrupo.fr3');
//      Try
//        DM.TabConsProduto.DisableControls;
//
//        Model               := TModelEmpresa.Create;
//        Try
//          Model.idempresa   := TSession.IDEMPRESA;
//          Model.SelectCabecalhoReport(msg);
//
//          FrxRelatorio.Variables.Clear;
//          FrxRelatorio.Variables['nrazao']          :=quotedstr(Model.razao);
//          FrxRelatorio.Variables['nfantasia']       :=quotedstr(model.fantasia);
//          FrxRelatorio.Variables['nendereco']       :=quotedstr(model.endereco);
//          FrxRelatorio.Variables['nnumero']         :=quotedstr(model.numero);
//          FrxRelatorio.Variables['nbairro']         :=quotedstr(model.bairro);
//          FrxRelatorio.Variables['ntelefone']       :=quotedstr(model.telefone);
//          FrxRelatorio.Variables['nfone1']          :=quotedstr(model.telefone2);
//          FrxRelatorio.Variables['nfone2']          :=quotedstr(model.celular);
//          FrxRelatorio.Variables['nemail']          :=quotedstr(model.email1);
//          FrxRelatorio.Variables['ncnpj']           :=quotedstr(model.cnpj);
//          FrxRelatorio.Variables['nie']             :=quotedstr(model.ie);
//
//          try
//            // Decodifica a imagem Base64 e carrega no fluxo de memória
//            TempImage             := TImage.Create(nil);
//            TConesul.ConvBase64Img(model.logo);
//            TempImage.Picture     :=TConesul.nfoto;
//            TConesul.nfoto.Free;
//            TempImage.Picture.SaveToFile(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg')
//          finally
//            TempImage.Free;
//          end;
//
//          FrxRelatorio.Variables['wlogo']           :=quotedstr(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg');
//          FrxRelatorio.Variables['ncep']            :=quotedstr(model.cep);
//          FrxRelatorio.Variables['ncidade']         :=quotedstr(model.cidade);
//          FrxRelatorio.Variables['filtro']          :=quotedstr('Listagem de Produto Agrupado por Grupo');
//
//        Finally
//          model.Free;
//        End;
//
//        FrxRelatorio.Report.PrepareReport();
//        FrxRelatorio.ShowReport;
//      Finally
//        DM.TabConsProduto.First;
//        DM.TabConsProduto.EnableControls;
//      End;
//
//    end
//    else
//    begin
//      JKDialog('Aviso','Nenhum registro encontrato!', tdAlerta);
//    end;
//
//  Except
//
//  End;
//end;
//
//procedure TFrmProdutos.btnListmarcaClick(Sender: TObject);
//var
//Model :TModelEmpresa;
//msg:String;
//TempImage: Timage;
//begin
//  //Listagem produto
//
//  Try
//    if not DM.TabConsProduto.Eof then
//    begin
//      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelListagemProdutoMarca.fr3');
//      Try
//        DM.TabConsProduto.DisableControls;
//
//        Model               := TModelEmpresa.Create;
//        Try
//          Model.idempresa   := TSession.IDEMPRESA;
//          Model.SelectCabecalhoReport(msg);
//
//          FrxRelatorio.Variables.Clear;
//          FrxRelatorio.Variables['nrazao']          :=quotedstr(Model.razao);
//          FrxRelatorio.Variables['nfantasia']       :=quotedstr(model.fantasia);
//          FrxRelatorio.Variables['nendereco']       :=quotedstr(model.endereco);
//          FrxRelatorio.Variables['nnumero']         :=quotedstr(model.numero);
//          FrxRelatorio.Variables['nbairro']         :=quotedstr(model.bairro);
//          FrxRelatorio.Variables['ntelefone']       :=quotedstr(model.telefone);
//          FrxRelatorio.Variables['nfone1']          :=quotedstr(model.telefone2);
//          FrxRelatorio.Variables['nfone2']          :=quotedstr(model.celular);
//          FrxRelatorio.Variables['nemail']          :=quotedstr(model.email1);
//          FrxRelatorio.Variables['ncnpj']           :=quotedstr(model.cnpj);
//          FrxRelatorio.Variables['nie']             :=quotedstr(model.ie);
//
//          try
//            // Decodifica a imagem Base64 e carrega no fluxo de memória
//            TempImage             := TImage.Create(nil);
//            TConesul.ConvBase64Img(model.logo);
//            TempImage.Picture     :=TConesul.nfoto;
//            TConesul.nfoto.Free;
//            TempImage.Picture.SaveToFile(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg')
//          finally
//            TempImage.Free;
//          end;
//
//          FrxRelatorio.Variables['wlogo']           :=quotedstr(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg');
//          FrxRelatorio.Variables['ncep']            :=quotedstr(model.cep);
//          FrxRelatorio.Variables['ncidade']         :=quotedstr(model.cidade);
//          FrxRelatorio.Variables['filtro']          :=quotedstr('Listagem de Produto Agrupado por Marca');
//
//        Finally
//          model.Free;
//        End;
//
//        FrxRelatorio.Report.PrepareReport();
//        FrxRelatorio.ShowReport;
//      Finally
//        DM.TabConsProduto.First;
//        DM.TabConsProduto.EnableControls;
//      End;
//
//    end
//    else
//    begin
//      JKDialog('Aviso','Nenhum registro encontrato!', tdAlerta);
//    end;
//
//  Except
//
//  End;
//end;
//
//procedure TFrmProdutos.btnListLocalClick(Sender: TObject);
//var
//Model :TModelEmpresa;
//msg:String;
//TempImage: Timage;
//begin
//  //Listagem produto
//
//  Try
//    if not DM.TabConsProduto.Eof then
//    begin
//      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelListagemProdutoLocal.fr3');
//      Try
//        DM.TabConsProduto.DisableControls;
//
//        Model               := TModelEmpresa.Create;
//        Try
//          Model.idempresa   := TSession.IDEMPRESA;
//          Model.SelectCabecalhoReport(msg);
//
//          FrxRelatorio.Variables.Clear;
//          FrxRelatorio.Variables['nrazao']          :=quotedstr(Model.razao);
//          FrxRelatorio.Variables['nfantasia']       :=quotedstr(model.fantasia);
//          FrxRelatorio.Variables['nendereco']       :=quotedstr(model.endereco);
//          FrxRelatorio.Variables['nnumero']         :=quotedstr(model.numero);
//          FrxRelatorio.Variables['nbairro']         :=quotedstr(model.bairro);
//          FrxRelatorio.Variables['ntelefone']       :=quotedstr(model.telefone);
//          FrxRelatorio.Variables['nfone1']          :=quotedstr(model.telefone2);
//          FrxRelatorio.Variables['nfone2']          :=quotedstr(model.celular);
//          FrxRelatorio.Variables['nemail']          :=quotedstr(model.email1);
//          FrxRelatorio.Variables['ncnpj']           :=quotedstr(model.cnpj);
//          FrxRelatorio.Variables['nie']             :=quotedstr(model.ie);
//
//          try
//            // Decodifica a imagem Base64 e carrega no fluxo de memória
//            TempImage             := TImage.Create(nil);
//            TConesul.ConvBase64Img(model.logo);
//            TempImage.Picture     :=TConesul.nfoto;
//            TConesul.nfoto.Free;
//            TempImage.Picture.SaveToFile(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg')
//          finally
//            TempImage.Free;
//          end;
//
//          FrxRelatorio.Variables['wlogo']           :=quotedstr(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg');
//          FrxRelatorio.Variables['ncep']            :=quotedstr(model.cep);
//          FrxRelatorio.Variables['ncidade']         :=quotedstr(model.cidade);
//          FrxRelatorio.Variables['filtro']          :=quotedstr('Listagem de Produto Agrupado por Localização');
//
//        Finally
//          model.Free;
//        End;
//
//        FrxRelatorio.Report.PrepareReport();
//        FrxRelatorio.ShowReport;
//      Finally
//        DM.TabConsProduto.First;
//        DM.TabConsProduto.EnableControls;
//      End;
//
//    end
//    else
//    begin
//      JKDialog('Aviso','Nenhum registro encontrato!', tdAlerta);
//    end;
//
//  Except
//
//  End;
//end;
//

//procedure TFrmProdutos.SincronizarAPP1Click(Sender: TObject);
//var
//Model :TModelAppVendas;
//ModelVal : TValidacao;
//begin
//
//  ModelVal      := TValidacao.create;
//  Try
//    if not ModelVal.ValidarUsoWhatsApp(TSession.idempresa) then
//    begin
//      JKDialog('Aviso','Função não habilitada!', tdAlerta);
//      exit;
//    end;
//  Finally
//    ModelVal.free;
//  End;
//
//  TLoading.ShowNovo(FrmProdutos,'Sincronizando produto...');
//
//  try
//    TThread.CreateAnonymousThread(
//    procedure
//    begin
//      Try
//        Model := TModelAppVendas.Create;
//        Try
//          Model.SincronizarProduto;
//        Finally
//
//        End;
//        TThread.Synchronize(TThread.CurrentThread,
//        procedure
//        begin
//          TLoading.Hide;
//        end);
//
//      Except on e:exception do
//        begin
//          TThread.Synchronize(TThread.CurrentThread,
//          procedure
//          begin
//            TLoading.Hide;
//            ShowMessage('Erro durante a sincronização: ' + E.Message);
//          end);
//        end;
//      End;
//    end).Start;
//
//  except
//    TLoading.Hide;
//  end;
//
//end;
//
//procedure TFrmProdutos.btnListprecoClick(Sender: TObject);
//var
//Model :TModelEmpresa;
//msg:String;
//TempImage: Timage;
//begin
//  //Listagem produto preço
//
//  Try
//    if not DM.TabConsProduto.Eof then
//    begin
//      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelListagemProdutoPreco.fr3');
//      Try
//        DM.TabConsProduto.DisableControls;
//
//        Model               := TModelEmpresa.Create;
//        Try
//          Model.idempresa   := TSession.IDEMPRESA;
//          Model.SelectCabecalhoReport(msg);
//
//          FrxRelatorio.Variables.Clear;
//          FrxRelatorio.Variables['nrazao']          :=quotedstr(Model.razao);
//          FrxRelatorio.Variables['nfantasia']       :=quotedstr(model.fantasia);
//          FrxRelatorio.Variables['nendereco']       :=quotedstr(model.endereco);
//          FrxRelatorio.Variables['nnumero']         :=quotedstr(model.numero);
//          FrxRelatorio.Variables['nbairro']         :=quotedstr(model.bairro);
//          FrxRelatorio.Variables['ntelefone']       :=quotedstr(model.telefone);
//          FrxRelatorio.Variables['nfone1']          :=quotedstr(model.telefone2);
//          FrxRelatorio.Variables['nfone2']          :=quotedstr(model.celular);
//          FrxRelatorio.Variables['nemail']          :=quotedstr(model.email1);
//          FrxRelatorio.Variables['ncnpj']           :=quotedstr(model.cnpj);
//          FrxRelatorio.Variables['nie']             :=quotedstr(model.ie);
//
//          try
//            // Decodifica a imagem Base64 e carrega no fluxo de memória
//            TempImage             := TImage.Create(nil);
//            TConesul.ConvBase64Img(model.logo);
//            TempImage.Picture     :=TConesul.nfoto;
//            TConesul.nfoto.Free;
//            TempImage.Picture.SaveToFile(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg')
//          finally
//            TempImage.Free;
//          end;
//
//          FrxRelatorio.Variables['wlogo']           :=quotedstr(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg');
//          FrxRelatorio.Variables['ncep']            :=quotedstr(model.cep);
//          FrxRelatorio.Variables['ncidade']         :=quotedstr(model.cidade);
//          FrxRelatorio.Variables['filtro']          :=quotedstr('Listagem de Produto Preço de Venda');
//
//        Finally
//          model.Free;
//        End;
//
//        FrxRelatorio.Report.PrepareReport();
//        FrxRelatorio.ShowReport;
//      Finally
//        DM.TabConsProduto.First;
//        DM.TabConsProduto.EnableControls;
//      End;
//
//    end
//    else
//    begin
//      JKDialog('Aviso','Nenhum registro encontrato!', tdAlerta);
//    end;
//
//  Except
//
//  End;
//end;







