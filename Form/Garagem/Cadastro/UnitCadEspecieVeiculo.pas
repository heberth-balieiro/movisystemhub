unit UnitCadEspecieVeiculo;

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
  Vcl.Buttons, Vcl.ExtCtrls, frxClass, frxDBSet, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Datasnap.DBClient;

type
  TFrmCadEspecieVeiculo = class(TFrmBaseCadCons)
    frxRelatorio: TfrxReport;
    frxDBEspecieVeiculo: TfrxDBDataset;
    Label9: TLabel;
    edtgrupo: TcxLookupComboBox;
    dsTipo: TUniDataSource;
    Tab_TipoVeiculo: TClientDataSet;
    Tab_TipoVeiculoid: TIntegerField;
    Tab_TipoVeiculocodigo: TIntegerField;
    Tab_TipoVeiculodescricao: TStringField;
    Tab_TipoVeiculoncompleto: TStringField;
    Tab_TipoVeiculoplaca_obrigatoria: TStringField;
    
  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  FrmCadEspecieVeiculo: TFrmCadEspecieVeiculo;

implementation

{$R *.dfm}

uses Model.Marca, uJKDialog, Vcl.Navigation, UDM, Model.Empresa, Vcl.Session,
  UConeSul, Vcl.Loading, Vcl.Validacoes, Controller.LookupHelper;


  end.
//procedure TFrmCadEspecieVeiculo.btnNovoClick(Sender: TObject);
//begin
//  inherited;
//  LimparCampos;
//  edtdescricao.SetFocus;
//  TNavigation.ParamsStr :='N';
//end;
//
//procedure TFrmCadEspecieVeiculo.CarregarGrid;
//var
//model : TModelEspecie;
//msg:string;
//begin
//  inherited;
//  Model      := TModelEspecie.Create;
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
//function TFrmCadEspecieVeiculo.Editar: Boolean;
//var
//model : TModelEspecie;
//msg:string;
//begin
//  inherited;
//  if not DM.TabConsVeiculoEspecie.Eof then
//    begin
//
//      if JKDialog('Aviso', 'Deseja editar a espécie selecionada?', tdMensagem)  then
//      begin
//        Model   := TModelEspecie.Create;
//
//        Try
//          Model.idespecie     := ds.DataSet.FieldByName('idespecie').AsInteger;
//          if Model.Selecionarid(msg) then
//          begin
//            LimparCampos;
//            edtcodigo.EditValue   := Model.Codigo;
//            edtdescricao.EditValue:= Model.descricao;
//            edtativo.EditValue    := Model.ativo;
//            edtgrupo.EditValue    := model.idtipo;
//            TNavigation.ParamsStr := 'E';
//            TNavigation.ParamInt  := ds.DataSet.FieldByName('idespecie').AsInteger;
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
//function TFrmCadEspecieVeiculo.Excluir: Boolean;
//var
//model : TModelEspecie;
//msg:string;
//begin
//  inherited;
//  if not DM.TabConsVeiculoEspecie.Eof then
//    begin
//
//      if JKDialog('Aviso', 'Deseja excluir a espécie selecionada?', tdMensagem)  then
//      begin
//        Model   := TModelEspecie.Create;
//
//        Try
//          Model.idespecie  := ds.DataSet.FieldByName('idespecie').AsInteger;
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
//procedure TFrmCadEspecieVeiculo.FormShow(Sender: TObject);
//begin
//  inherited;
//  Tela := 'Espécie Veículo';
//
//  CarregarCLookupListaTipoveiculo;
//end;
//
//Procedure TFrmCadEspecieVeiculo.CarregarCLookupListaTipoveiculo;
//begin
//  TLookupHelper.CarregarLookup(
//                Tab_tipoveiculo,'Select                                              '+
//                           ' id_grupo as id,                                   '+
//                           ' codigo,                                            '+
//                           ' grupo as descricao,                                 '+
//                           ' placa_obrigatorio as placa_obrigatoria,'+
//                           ' Concat(codigo,'' | '',grupo) as ncompleto, '+
//                           ' from grupo                                       '+
//                           ' where ativo=''S''                           '+
//                           ' and excluido=0 and tipo=''V'' order by codigo, grupo');
//end;
//
//
//procedure TFrmCadEspecieVeiculo.LimparCampos;
//begin
//  edtcodigo.Clear;
//  edtdescricao.Clear;
//  edtativo.Checked:= true;
//  edtgrupo.EditValue  :=0;
//end;
//
//function TFrmCadEspecieVeiculo.Listagem: Boolean;
//var
//Model :TModelEmpresa;
//msg:String;
//TempImage: Timage;
//begin
//  //Listagem Tipo de pessoa
//
//  Try
//    if not DM.TabConsVeiculoEspecie.Eof then
//    begin
//      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelListagemEspecieVeiculo.fr3');
//      Try
//        DM.TabConsVeiculoEspecie.DisableControls;
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
//          FrxRelatorio.Variables['filtro']          :=quotedstr('Listagem de Espécie de Veículos');
//
//        Finally
//          FreeAndNIl(Model);
//        End;
//
//        FrxRelatorio.Report.PrepareReport();
//        FrxRelatorio.ShowReport;
//      Finally
//        DM.TabConsVeiculoEspecie.First;
//        DM.TabConsVeiculoEspecie.EnableControls;
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
//function TFrmCadEspecieVeiculo.Pesquisa: boolean;
//var
//msg:string;
//Model :TModelEspecie;
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
//    TLoading.Show(FrmCadEspecieVeiculo,'Listando dados...');
//
//    Model   := TModelEspecie.Create;
//    Try
//      Try
//        if Model.Pesquisa(msg, trim(filtro),nativo) then
//        result  := true;
//      Except on e:exception do
//        begin
//          DM.TabConsVeiculoEspecie.Filtered  := false;
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
//function TFrmCadEspecieVeiculo.Salvar(out msg: string): Boolean;
//var
//model : TModelEspecie;
//ModelVal  : TValidacao;
//begin
//  Result                := False;
//  Model                 :=  TModelEspecie.Create;
//
//  Try
//    try
//      Model.descricao           := Trim(edtdescricao.Text);
//      Model.ativo               := edtativo.EditValue;
//      Model.IdEmpresaespecie    := Tsession.idempresa;
//      Model.IdUsuarioespecie    := TSession.ID_USUARIO;
//      Model.idtipo              := edtgrupo.EditValue;
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
//        Model.idespecie  := TNavigation.ParamInt;
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
//function TFrmCadEspecieVeiculo.ValidarCampos(out msg: string): Boolean;
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
//  if (edtgrupo.EditValue = 0) or (edtgrupo.Text='') then
//  begin
//    msg := 'Informe o tipo do veículo!';
//    Result  := False;
//    exit;
//  end;
//end;
//
//end.
