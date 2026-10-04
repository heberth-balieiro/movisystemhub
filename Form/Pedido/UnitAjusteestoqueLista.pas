unit UnitAjusteestoqueLista;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseCons, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, Vcl.Menus, frxClass, frxDBSet,
  ACBrBase, ACBrEnterTab, Vcl.Tabs, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, UnitProdutoEntrada,
  Vcl.Navigation, uJKDialog, UDM,  Vcl.Loading, Model.Estoque,
  cxCalendar, Model.Empresa, Vcl.Session, UConeSul, UnitHistoricoProduto,
  cxContainer, cxGroupBox;

type
  TFrmAjusteEstoqueLista = class(TFrmModeloConsulta)
    Gridcodigo: TcxGridDBColumn;
    Griddescricao: TcxGridDBColumn;
    Gridajustada: TcxGridDBColumn;
    Griddata: TcxGridDBColumn;
    Gridoperacao: TcxGridDBColumn;
    btnImpAjuste: TMenuItem;
    btnSaldo: TMenuItem;
    btnZerado: TMenuItem;
    frxRelatorio: TfrxReport;
    frxDBEstoqueSaldo: TfrxDBDataset;
    frxDBEstoqueZerado: TfrxDBDataset;
    btnNegativo: TMenuItem;
    frxDBEstoqueNegativo: TfrxDBDataset;
    frxDBEstoqueEntrada: TfrxDBDataset;
    N2: TMenuItem;
    btnhistorico: TMenuItem;
    GridColumn1: TcxGridDBColumn;
    GridColumn2: TcxGridDBColumn;
    procedure btnSaldoClick(Sender: TObject);
    procedure btnZeradoClick(Sender: TObject);
    procedure btnNegativoClick(Sender: TObject);
    procedure btnImpAjusteClick(Sender: TObject);
    procedure btnhistoricoClick(Sender: TObject);
  private
    { Private declarations }
  public
    Procedure Pesquisa;override;
    procedure OpenCadTela(id: integer;str:string);override;
    { Public declarations }
  end;

var
  FrmAjusteEstoqueLista: TFrmAjusteEstoqueLista;

implementation

{$R *.dfm}

procedure TFrmAjusteEstoqueLista.btnhistoricoClick(Sender: TObject);
begin
  inherited;
  TNavigation.ParamInt          := 0;
  TNavigation.ParamsStr         := 'N';
  TNavigation.OpenModal(TFrmHistoricoProduto, FrmHistoricoProduto);
end;

procedure TFrmAjusteEstoqueLista.btnImpAjusteClick(Sender: TObject);
var
Model :TModelEmpresa;
msg, tipo:String;
TempImage: Timage;
ModelEst:TModelEstoque;
begin
  inherited;
  //Listagem de entrada

   if not DM.TabConsMovEstoque.Eof then
  begin
    if ds.DataSet.FieldByName('numoperacao').AsInteger > 0 then
    begin
      ModelEst:=TModelEstoque.Create;

      try
        if not Assigned(dm.EntradaProduto) then
        raise Exception.Create('Dataset Estoque não está criado.');

        if not dm.EntradaProduto.Active then
        dm.EntradaProduto.CreateDataSet;

        dm.EntradaProduto.EmptyDataSet;

//        if not Modelest.RelImpresaoAjuste(tipo,ds.DataSet.FieldByName('numoperacao').AsInteger) then
//        begin
//          JKDialog('Aviso','Nenhuma informação encontrada!', tdAlerta);
//          exit;
//        end;

      finally
        ModelEst.Free;
      end;

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
            FrxRelatorio.Variables['filtro']          :=quotedstr(tipo+' de Produto');

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


    end
    else
    JKDialog('Aviso','Selecione um registro da lista!', tdAlerta);
  end
  else
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  end;

end;

procedure TFrmAjusteEstoqueLista.btnNegativoClick(Sender: TObject);
var
Model :TModelEmpresa;
msg:String;
TempImage: Timage;
ModelEst:TModelEstoque;
begin
  inherited;
  //Saldo de Estoque
  ModelEst:=TModelEstoque.Create;

  try
    if not Assigned(dm.TabEstoqueNegativo) then
    raise Exception.Create('Dataset Estoque não está criado.');

    if not dm.TabEstoqueNegativo.Active then
    dm.TabEstoqueNegativo.CreateDataSet;

    dm.TabEstoqueNegativo.EmptyDataSet;

//    if not Modelest.RelProdutoNegativo(msg) then
//    begin
//      JKDialog('Aviso','Nenhuma informação encontrada!', tdAlerta);
//      exit;
//    end;

  finally
    ModelEst.Free;
  end;

    if not DM.TabEstoqueNegativo.Eof then
    begin
      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelEstoqueSaldoNegativo.fr3');
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
          FrxRelatorio.Variables['filtro']          :=quotedstr('Estoque Negativo');

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

    dm.TabEstoqueNegativo.EmptyDataSet;
end;

procedure TFrmAjusteEstoqueLista.Pesquisa;
var
msg:string;
Model:TModelEstoque;
begin
  inherited;
  //
//  Try
//    TLoading.Show(FrmAjusteEstoqueLista,'Listando ajuste...');
//
//    TLoading.ExecuteThread(procedure
//        begin
//          Model   := TModelEstoque.Create;
//          Try
//            Try
//              if Model.Localizar(msg, TabSituacao.TabIndex, trim(edtBusca.Text)) then
//
//            Except on e:exception do
//              begin
//                JKDialog('Erro',msg, tdErro);
//                raise;
//              end;
//            End;
//
//          Finally
//            Model.Free;
//          End;
//
//        end, TerminatePesquisa);
//  Finally
//    TLoading.Hide;
//  End;

end;

procedure TFrmAjusteEstoqueLista.btnSaldoClick(Sender: TObject);
var
Model :TModelEmpresa;
msg:String;
TempImage: Timage;
ModelEst:TModelEstoque;
begin
  inherited;
  //Saldo de Estoque
  ModelEst:=TModelEstoque.Create;

  try
    if not Assigned(dm.TabSaldoEstoque) then
    raise Exception.Create('Dataset Saldo não está criado.');

    if not dm.TabSaldoEstoque.Active then
    dm.TabSaldoEstoque.CreateDataSet;

    dm.TabSaldoEstoque.EmptyDataSet;

//    if not Modelest.RelSaldoEstoque(msg) then
//    begin
//      JKDialog('Aviso','Nenhuma informação encontrada!', tdAlerta);
//      exit;
//    end;

  finally
    ModelEst.Free;
  end;

    if not DM.TabSaldoEstoque.Eof then
    begin
      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelEstoqueSaldo.fr3');
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
          FrxRelatorio.Variables['filtro']          :=quotedstr('Saldo do Estoque');

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
    dm.TabSaldoEstoque.EmptyDataSet;
end;

procedure TFrmAjusteEstoqueLista.btnZeradoClick(Sender: TObject);
var
Model :TModelEmpresa;
msg:String;
TempImage: Timage;
ModelEst:TModelEstoque;
begin
  inherited;
  //Saldo de Estoque
  ModelEst:=TModelEstoque.Create;

  try
    if not Assigned(dm.TabProdutoZerado) then
    raise Exception.Create('Dataset Estoque não está criado.');

    if not dm.TabProdutoZerado.Active then
    dm.TabProdutoZerado.CreateDataSet;

    dm.TabProdutoZerado.EmptyDataSet;

//    if not Modelest.RelProdutoZerado(msg) then
//    begin
//      JKDialog('Aviso','Nenhuma informação encontrada!', tdAlerta);
//      exit;
//    end;

  finally
    ModelEst.Free;
  end;

    if not DM.TabProdutoZerado.Eof then
    begin
      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelEstoqueSaldoZerado.fr3');
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
          FrxRelatorio.Variables['filtro']          :=quotedstr('Estoque Zerado');

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

    dm.TabProdutoZerado.EmptyDataSet;
end;

procedure TFrmAjusteEstoqueLista.OpenCadTela(id: integer; str: string);
begin
  inherited;


    if JKDialog('Operação', 'Sim para entrada de produto e Não para saída de produto.', tdMensagem)  then
    begin
      TNavigation.ParamInt          := 0;
      TNavigation.ParamsStr         := 'Entrada';
      TNavigation.OpenModal(TFrmProdutoEntrada, FrmProdutoEntrada);
    end
    else
    begin
      TNavigation.ParamInt          := 0;
      TNavigation.ParamsStr         := 'Saída';
      TNavigation.OpenModal(TFrmProdutoEntrada, FrmProdutoEntrada);
    end;

end;

end.
