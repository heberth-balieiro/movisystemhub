unit UnitCadModeloVeiculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseCadCons, cxGraphics, cxControls,
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
  dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData,
  DBAccess, Uni, Vcl.Menus, ACBrBase, ACBrEnterTab, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxCheckBox, cxTextEdit, cxGroupBox, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, frxClass, frxDBSet;

type
  TFrmCadModeloVeiculo = class(TFrmBaseCadCons)
    edtmarca: TcxLookupComboBox;
    Label2: TLabel;
    frxRelatorio: TfrxReport;
    frxDBModeloVeiculo: TfrxDBDataset;
    dsMarca: TUniDataSource;
    
  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  FrmCadModeloVeiculo: TFrmCadModeloVeiculo;

implementation

{$R *.dfm}

uses UConeSul, uJKDialog, Vcl.Loading, Vcl.Navigation, UDM, Model.Empresa,
  Model.Marca, Vcl.Session, Vcl.Validacoes;

{ TFrmBaseCadCons1 }
end.
//procedure TFrmCadModeloVeiculo.btnNovoClick(Sender: TObject);
//begin
//  inherited;
//  LimparCampos;
//  edtdescricao.SetFocus;
//  TNavigation.ParamsStr :='N';
//end;
//
//procedure TFrmCadModeloVeiculo.CarregarGrid;
//var
//model : TModelModelo;
//msg:string;
//begin
//  inherited;
//  Model      := TModelModelo.Create;
//  Try
//    Try
//      Model.Pesquisa(msg,'',0);
//
//    Except on e:exception do
//      begin
//        JKDialog('Erro',msg, tdErro);
//        raise;
//      end;
//    End;
//
//  Finally
//    Model.Free;
//  End;
//end;
//
//function TFrmCadModeloVeiculo.Editar: Boolean;
//var
//model : TModelModelo;
//msg:string;
//begin
//  inherited;
//  if not DM.TabConsModeloVeiculo.Eof then
//    begin
//
//      if JKDialog('Aviso', 'Deseja editar o modelo selecionado?', tdMensagem)  then
//      begin
//        Model   := TModelModelo.Create;
//
//        Try
//          Model.idveiculomodelo   := ds.DataSet.FieldByName('idmodelo').AsInteger;
//          if Model.Selecionarid(msg) then
//          begin
//            LimparCampos;
//            edtcodigo.EditValue   := Model.Codigo;
//            edtdescricao.EditValue:= Model.descricao;
//            edtativo.EditValue    := Model.ativo;
//            edtmarca.EditValue    := Model.idmarca;
//            TNavigation.ParamsStr := 'E';
//            TNavigation.ParamInt  := ds.DataSet.FieldByName('idmodelo').AsInteger;
//            edtdescricao.SetFocus;
//          end;
//
//        Finally
//          FreeAndNil(model);
//        End;
//
//      end;
//
//    end
//    else
//    begin
//      JKDialog('Aviso','Nenhum registro selecionado para editar!', tdAlerta);
//    end;
//end;
//
//function TFrmCadModeloVeiculo.Excluir: Boolean;
//var
//model : TModelModelo;
//msg:string;
//begin
//  inherited;
//  if not DM.TabConsModeloVeiculo.Eof then
//    begin
//
//      if JKDialog('Aviso', 'Deseja excluir o modelo selecionado?', tdMensagem)  then
//      begin
//        Model   := TModelModelo.Create;
//
//        Try
//          Model.idveiculomodelo  := ds.DataSet.FieldByName('idmodelo').AsInteger;
//          if Model.Excluir(msg) then
//          CarregarGrid;
//
//        Finally
//          FreeAndNil(Model);
//        End;
//
//      end;
//
//    end
//    else
//    begin
//      JKDialog('Aviso','Nenhum registro selecionado para excluir!', tdAlerta);
//    end;
//end;
//
//procedure TFrmCadModeloVeiculo.FormShow(Sender: TObject);
//begin
//  inherited;
//  tela  := 'Modelo Veículo';
//
//  Try
//    if Dm.PopularMarcaVeiculo then
//  except
//
//  End;
//
//end;
//
//procedure TFrmCadModeloVeiculo.LimparCampos;
//begin
//  edtcodigo.Clear;
//  edtdescricao.Clear;
//  edtativo.Checked:= true;
//  edtmarca.EditValue  := 0;
//
//end;
//
//function TFrmCadModeloVeiculo.Listagem: Boolean;
//var
//Model :TModelEmpresa;
//msg:String;
//TempImage: Timage;
//begin
//  //Listagem Tipo de pessoa
//
//  Try
//    if not DM.TabConsModeloVeiculo.Eof then
//    begin
//      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelListagemModeloVeiculo.fr3');
//      Try
//        DM.TabConsModeloVeiculo.DisableControls;
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
//          FrxRelatorio.Variables['filtro']          :=quotedstr('Listagem de Modelo de Veículos');
//
//        Finally
//          FreeAndNIl(Model);
//        End;
//
//        FrxRelatorio.Report.PrepareReport();
//        FrxRelatorio.ShowReport;
//      Finally
//        DM.TabConsModeloVeiculo.First;
//        DM.TabConsModeloVeiculo.EnableControls;
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
//function TFrmCadModeloVeiculo.Pesquisa: boolean;
//var
//msg:string;
//Model :TModelModelo;
//filtro:String;
//nativo:integer;
//begin
//  inherited;
//  Result  := False;
//  if edtCodigo.Text <> '' then
//  Filtro  := edtCodigo.Text
//  else
//  Filtro  := edtdescricao.Text;
//
//  if edtativo.Checked then
//  nativo    := 0
//  else
//  nativo    := 1;
//
//  Try
//    TLoading.Show(FrmCadModeloVeiculo,'Listando dados...');
//
//    Model   := TModelModelo.Create;
//    Try
//      Try
//        if Model.Pesquisa(msg, trim(filtro),nativo) then
//        result  := true;
//      Except on e:exception do
//        begin
//          DM.TabConsModeloVeiculo.Filtered  := false;
//          JKDialog('Erro',msg, tdErro);
//          raise;
//        end;
//      End;
//
//    Finally
//      FreeAndNIl(model);
//    End;
//
//  Finally
//    TLoading.Hide;
//  End;
//end;
//
//function TFrmCadModeloVeiculo.Salvar(out msg: string): Boolean;
//var
//model : TModelModelo;
//ModelVal  : TValidacao;
//begin
//  Result                := False;
//  Model                 :=  TModelModelo.Create;
//
//  Try
//    try
//      Model.descricao           := Trim(edtdescricao.Text);
//      Model.ativo               := edtativo.EditValue;
//      Model.IdEmpresa           := Tsession.idempresa;
//      Model.IdUsuario           := TSession.ID_USUARIO;
//      Model.idmarca             := edtmarca.EditValue;
//
//      if TNavigation.ParamsStr='N' then
//      begin
//        if Model.Novo(msg) then;
//        begin
//          Result  := True;
//          CarregarGrid;
//          LimparCampos;
//        end;
//      end
//      else
//      begin
//        Model.idveiculomodelo  := TNavigation.ParamInt;
//
//        if Model.editar(msg) then;
//        begin
//          Result  := True;
//          CarregarGrid;
//          LimparCampos;
//        end;
//      end;
//
//    Except on e:exception do
//      begin
//        msg := msg+' :'+e.Message;
//        raise;
//      end;
//    end;
//
//  Finally
//    Model.Free;
//  End;
//end;
//
//function TFrmCadModeloVeiculo.ValidarCampos(out msg: string): Boolean;
//begin
//  Result  := True;
//
//  if edtdescricao.Text='' then
//  begin
//    msg := 'Informe uma descrição!';
//    Result  := False;
//    exit;
//  end;
//
//  if (edtmarca.Text='') or (edtmarca.EditValue=0) then
//  begin
//    msg := 'Informe uma marca!';
//    Result  := False;
//    exit;
//  end;
//
//
//end;
//
//end.
