unit UnitCadMarcaVeiculo;

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
  Vcl.Buttons, Vcl.ExtCtrls, frxClass, frxDBSet;

type
  TFrmCadMarcaVeiculo = class(TFrmBaseCadCons)
    frxRelatorio: TfrxReport;
    frxDBMarcaVeiculo: TfrxDBDataset;

  private
    { Private declarations }

  public
    { Public declarations }
    
  end;

var
  FrmCadMarcaVeiculo: TFrmCadMarcaVeiculo;

implementation

{$R *.dfm}

uses uJKDialog, Model.Marca, Vcl.Navigation, Vcl.Session, UDM, Vcl.Validacoes,
  Model.Empresa, UConeSul, Vcl.Loading;


end.
//procedure TFrmCadMarcaVeiculo.btnNovoClick(Sender: TObject);
//begin
//  inherited;
//  LimparCampos;
//  edtdescricao.SetFocus;
//  TNavigation.ParamsStr :='N';
//end;
//
//procedure TFrmCadMarcaVeiculo.CarregarGrid;
//var
//model : TModelMarca;
//msg:string;
//begin
//  inherited;
//
//  Model      := TModelMarca.Create;
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
//function TFrmCadMarcaVeiculo.Editar: Boolean;
//var
//model : TModelMarca;
//msg:string;
//begin
//  inherited;
//  if not DM.TabConsMarca.Eof then
//    begin
//
//      if JKDialog('Aviso', 'Deseja editar a marca selecionada?', tdMensagem)  then
//      begin
//        Model   := TModelMarca.Create;
//
//        Try
//          Model.idmarca := ds.DataSet.FieldByName('id_marca').AsInteger;
//          if Model.Select(msg) then
//          begin
//            LimparCampos;
//            edtcodigo.EditValue   := Model.Codigo;
//            edtdescricao.EditValue:= Model.marca;
//            edtativo.EditValue    := Model.inativo;
//            TNavigation.ParamsStr := 'E';
//            TNavigation.ParamInt  := ds.DataSet.FieldByName('id_marca').AsInteger;
//            edtdescricao.SetFocus;
//          end;
//
//        Finally
//          model.Free;
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
//function TFrmCadMarcaVeiculo.Excluir: Boolean;
//var
//model : TModelMarca;
//msg:string;
//begin
//  inherited;
//  if not DM.TabConsmarca.Eof then
//    begin
//
//      if JKDialog('Aviso', 'Deseja excluir a marca selecionada?', tdMensagem)  then
//      begin
//        Model   := TModelMarca.Create;
//
//        Try
//          Model.idmarca  := ds.DataSet.FieldByName('id_marca').AsInteger;
//          if Model.Delete(msg) then
//          CarregarGrid;
//
//        Finally
//          model.Free;
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
//procedure TFrmCadMarcaVeiculo.FormShow(Sender: TObject);
//begin
//  inherited;
//  Tela := 'Marca Veículo';
//end;
//
//procedure TFrmCadMarcaVeiculo.LimparCampos;
//begin
//  edtcodigo.Clear;
//  edtdescricao.Clear;
//  edtativo.Checked:= true;
//end;
//
//function TFrmCadMarcaVeiculo.Listagem: Boolean;
//var
//Model :TModelEmpresa;
//msg:String;
//TempImage: Timage;
//begin
//  //Listagem Tipo de pessoa
//
//  Try
//    if not DM.TabConsMarca.Eof then
//    begin
//      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelListagemMarcaVeiculo.fr3');
//      Try
//        DM.TabConsMarca.DisableControls;
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
//          FrxRelatorio.Variables['filtro']          :=quotedstr('Listagem de Marca de Veículos');
//
//        Finally
//          model.Free;
//        End;
//
//        FrxRelatorio.Report.PrepareReport();
//        FrxRelatorio.ShowReport;
//      Finally
//        DM.TabConsMarca.First;
//        DM.TabConsMarca.EnableControls;
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
//function TFrmCadMarcaVeiculo.Pesquisa: boolean;
//var
//msg:string;
//Model :TModelMarca;
//filtro:String;
//begin
//  inherited;
//  Result  := False;
//  if edtCodigo.Text <> '' then
//  Filtro  := edtCodigo.Text
//  else
//  Filtro  := edtdescricao.Text;
//
//  Try
//    TLoading.Show(FrmCadMarcaVeiculo,'Listando dados...');
//
//    Model   := TModelMarca.Create;
//    Try
//      Try
//        if Model.PesquisaMarcaVeiculo(msg, trim(filtro)) then
//        result  := true;
//      Except on e:exception do
//        begin
//          DM.TabConsMarca.Filtered  := false;
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
//function TFrmCadMarcaVeiculo.Salvar(out msg: string): Boolean;
//var
//model : TModelMarca;
//ModelVal  : TValidacao;
//begin
//  Result  := False;
//  Model             :=  TModelMarca.Create;
//
//  Try
//    try
//      Model.marca       := Trim(edtdescricao.Text);
//      Model.inativo     := edtativo.EditValue;
//      Model.IdEmpresa   := Tsession.idempresa;
//      Model.IdUsuario   := TSession.ID_USUARIO;
//      Model.tipo        := 'V';
//
//      if TNavigation.ParamsStr='N' then
//      begin
//        if Model.Insert(msg) then;
//        begin
//          Result  := True;
//          CarregarGrid;
//          LimparCampos;
//        end;
//      end
//      else
//      begin
//        Model.idmarca  := TNavigation.ParamInt;
//
//        if Model.Update(msg) then;
//        begin
//          Result  := True;
//          CarregarGrid;
//          LimparCampos;
//        end;
//      end;
//
//      // verificar se esta habilitado para api
//     { ModelVal      := TValidacao.create;
//      Try
//        if ModelVal.ValidarUsoAppCarteiria(TSession.idempresa) then
//        begin
//          try
//            DM.SincronizarGravar(1, 0);
//          except on e:exception do
//            begin
//              msg   := 'Erro ao gravar registro para sincronizar:'+#13+e.Message;
//              raise;
//            end;
//          end;
//        end;
//      Finally
//        ModelVal.free;
//      End;}
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
//function TFrmCadMarcaVeiculo.ValidarCampos(out msg: string): Boolean;
//begin
//  Result  := True;
//
//  if edtdescricao.Text='' then
//  begin
//    msg := 'Informe uma descrição!';
//    Result  := False;
//    exit;
//  end;
//end;
//
//end.
