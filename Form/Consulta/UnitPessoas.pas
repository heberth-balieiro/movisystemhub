unit UnitPessoas;

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
  cxClasses, cxGridCustomView, cxGrid, Vcl.Menus, dxGDIPlusClasses, Vcl.ComCtrls,
  cxMaskEdit, ACBrBase, ACBrEnterTab, Vcl.Tabs, frxClass, frxDBSet,
  UFormNovoBasePesquisa, cxContainer, Vcl.ButtonStylesAttributes,
  System.ImageList, Vcl.ImgList, cxImageList, DBAccess, Uni, Vcl.StyledButton,
  cxDropDownEdit, cxTextEdit, cxGroupBox, dxmdaset, Model.Pessoa, Controller.Pessoa;

type
  TFrmPessoa = class(TFormNovoBasePesquisa)
    frxDBListagemPessoa: TfrxDBDataset;
    frxRelatorio: TfrxReport;
    mdPesquisa: TdxMemData;
    mdPesquisaid_socio: TIntegerField;
    cxPessoa: TcxComboBox;
    Label3: TLabel;
    mdPesquisacodigo_exibir: TStringField;
    mdPesquisasituacao: TStringField;
    mdPesquisanome: TStringField;
    mdPesquisaapelido: TStringField;
    mdPesquisatelefone: TStringField;
    mdPesquisawhatsapp: TStringField;
    mdPesquisacpf: TStringField;
    mdPesquisaclitipo: TStringField;
    mdPesquisacidade: TStringField;
    mdPesquisatipo_pessoa: TStringField;
    mdPesquisaenvemail: TStringField;
    mdPesquisaenvwhats: TStringField;
    GridRecId: TcxGridDBColumn;
    Gridid_socio: TcxGridDBColumn;
    Gridcodigo_exibir: TcxGridDBColumn;
    Gridsituacao: TcxGridDBColumn;
    Gridnome: TcxGridDBColumn;
    Gridapelido: TcxGridDBColumn;
    Gridtelefone: TcxGridDBColumn;
    Gridwhatsapp: TcxGridDBColumn;
    Gridcpf: TcxGridDBColumn;
    Gridclitipo: TcxGridDBColumn;
    Gridcidade: TcxGridDBColumn;
    Gridtipo_pessoa: TcxGridDBColumn;
    Gridenvemail: TcxGridDBColumn;
    Gridenvwhats: TcxGridDBColumn;
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
  FrmPessoa: TFrmPessoa;
  ObjPessoa   : TPESSOA;
  ContPessoa  : TPessoaController;

implementation

{$R *.dfm}

uses UnitPessoaCad, Vcl.Loading, Vcl.Session, uJKDialog,
  UnitPrincipalNew, Model.Empresa, UConeSul, AppVendas, Vcl.Validacoes,
  UnitFrmWhatsApp, UnitFrmWhatsAppMassa, UnitRelacaoAniversariante,System.Generics.Collections;

procedure TFrmPessoa.BtnLimparClick(Sender: TObject);
begin
  inherited;
  mdPesquisa.Close;
end;

procedure TFrmPessoa.Editar;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
      begin
        if not Assigned(FrmPessoaCad) then
        FrmPessoaCad := TFrmPessoaCad.Create(Application);
        FrmPessoaCad.ParamsStr  := 'E';
        FrmPessoaCad.ParamsInt  := mdPesquisaid_socio.AsInteger;
        if mdPesquisaid_socio.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;
        FrmPessoaCad.Show;
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

procedure TFrmPessoa.Excluir;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
      begin
        Try
          ContPessoa    := Nil;
          ContPessoa    := TPessoaController.Create;

          if mdPesquisaid_socio.AsInteger = 0 then
          begin
            JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
            exit;
          end;

          if ContPessoa.Excluir(mdPesquisaid_socio.AsInteger) then
          begin
            Pesquisa;
            JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
          end;

        Finally
          FreeAndNil(ContPessoa);
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

procedure TFrmPessoa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmPessoa := nil;
end;

procedure TFrmPessoa.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;
end;

procedure TFrmPessoa.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'Pessoa';
  TitleText   := 'Pesquisa de Pessoa';
end;

procedure TFrmPessoa.Listagem;
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

procedure TFrmPessoa.Novo;
begin
  inherited;
  if not Assigned(FrmPessoaCad) then
  FrmPessoaCad := TFrmPessoaCad.Create(Application);
  FrmPessoaCad.ParamsStr  := 'N';
  FrmPessoaCad.ShowModal;
end;

procedure TFrmPessoa.Pesquisa;
var
List    : TObjectList<TPESSOA>;
nCampo, nSituacao, npessoa : String;
begin
  inherited;
  try
    List      := Nil;
    nCampo    := '';
    nSituacao := '';
    npessoa   := '';

    if trim(edtBusca.Text) <> '' then
    nCampo     := Trim(edtBusca.Text);

    if cxativo.ItemIndex > 0 then
    nsituacao   := cxativo.Text;

    case cxpessoa.ItemIndex of
      1: npessoa := 'C';
      2: npessoa := 'F';
    end;

    ContPessoa   := TPessoaController.Create;

    Try
      List  := ContPessoa.ListarPessoas(nCampo, nSituacao, npessoa);

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

        mdPesquisaid_socio.AsInteger      := Item.idsocio;
        mdPesquisacodigo_exibir.AsString  := Item.codigo_exibir;
        mdPesquisasituacao.AsString       := Item.situacao;
        mdPesquisanome.AsString           := Item.nome;
        mdPesquisaapelido.AsString        := Item.apelido;
        mdPesquisatelefone.AsString       := Item.telefone;
        mdPesquisawhatsapp.AsString       := Item.whatsapp;
        mdPesquisacpf.AsString            := Item.cpf;
        mdPesquisaclitipo.AsString        := Item.clitipo;
        mdPesquisacidade.AsString         := Item.cidade;
        mdPesquisatipo_pessoa.AsString    := Item.tipo_pessoa;
        mdPesquisaenvemail.AsString       := Item.envemail;
        mdPesquisaenvwhats.AsString       := Item.envwhats;

        mdPesquisa.Post;
      end;
      mdPesquisa.First;
      mdPesquisa.EnableControls;

    Finally
      FreeAndNil(ContPessoa);
      if Assigned(List) then
        List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmPessoa.Relatorio;
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

//procedure TFrmPessoa.SincronizarAPP1Click(Sender: TObject);
//var
//Model :TModelAppVendas;
//ModelVal      : TValidacao;
//begin
//  ModelVal      := TValidacao.create;
//  Try
//    if not ModelVal.ValidarUsoApp(TSession.idempresa) then
//    begin
//      JKDialog('Aviso','Função não habilitada!', tdAlerta);
//      exit;
//    end;
//  Finally
//    ModelVal.free;
//  End;
//
//  TLoading.ShowNovo(FrmPessoa,'Sincronizando pessoa...');
//
//  try
//    TThread.CreateAnonymousThread(
//    procedure
//    begin
//      Try
//        Model := TModelAppVendas.Create;
//        Try
//          Model.SincronizarPessoa;
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


//procedure TFrmPessoa.BtnListagemClick(Sender: TObject);
//var
//Model :TModelEmpresa;
//msg:String;
//TempImage: Timage;
//begin
//  //Listagem Pessoas
//
//  Try
//    if not DM.TabConsSocio.Eof then
//    begin
//      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelListagemPessoa.fr3');
//      Try
//        DM.TabConsSocio.DisableControls;
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
//          FrxRelatorio.Variables['filtro']          :=quotedstr('Listagem de Pessoa');
//
//        Finally
//          model.Free;
//        End;
//
//        FrxRelatorio.Report.PrepareReport();
//        FrxRelatorio.ShowReport;
//      Finally
//        DM.TabConsSocio.First;
//        DM.TabConsSocio.EnableControls;
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
//
//end;
//
//{$REGION 'Acoes Botoes'}

//procedure TFrmPessoa.btnRelacaoClick(Sender: TObject);
//begin
//  //Relacao
//  //TNavigation.Open(TFrmRelacaoniverConsulta, FrmRelacaoniverConsulta, pContainer);
//  //FrmRelacaoniverConsulta     := TFrmRelacaoniverConsulta.Create(Application);
//  //FrmRelacaoniverConsulta.ShowModal;
//  TNavigation.OpenModal(TFrmRelacaoniverConsulta, FrmRelacaoniverConsulta);
//end;

//{$ENDREGION}
//
//{$REGION 'Acoes PopPap'}
//

//procedure TFrmPessoa.btn_WhatsappClick(Sender: TObject);
//var
//ModelVal  :TValidacao;
//begin
//  //Enviar Whatsapps
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
//
//  if not dm.TabConsSocio.Eof then
//  begin
//    if ds.DataSet.FieldByName('id_socio').AsInteger > 0 then
//    begin
//      FrmEnviarWhatsApp                         := TFrmEnviarWhatsApp.Create(Application);
//      FrmEnviarWhatsApp.edtpara.EditValue       := ds.DataSet.FieldByName('nome').AsString;
//      FrmEnviarWhatsApp.edtcelular.EditValue    := ds.DataSet.FieldByName('whatsapp').AsString;
//      FrmEnviarWhatsApp.nmVendedor              := '';
//      FrmEnviarWhatsApp.edtMensagem.EditValue   :=
//                            ' Nome: '+ds.DataSet.FieldByName('nome').AsString+sLineBreak +
//                            ' CPF: '+ ds.DataSet.FieldByName('cpf').AsString+sLineBreak +
//                            ' Data Nascimento: '+ FormatDateTime('dd/mm/yyyy', ds.DataSet.FieldByName('nascimento').AsDateTime)+sLineBreak +
//                            ' Email: '+ds.DataSet.FieldByName('email').AsString;
//
//      FrmEnviarWhatsApp.ShowModal;
//    end
//    else
//    JKDialog('Aviso','Selecione um registro da lista!', tdAlerta);
//  end
//  else
//  JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
//
//end;
//
//procedure TFrmPessoa.btnCampanhaClick(Sender: TObject);
//var
//ModelVal  :TValidacao;
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
//  FrmEnviarWhatsAppMassa     := TFrmEnviarWhatsAppMassa.Create(Application);
//  FrmEnviarWhatsAppMassa.ShowModal;
//end;
//
//
//
//{$ENDREGION}



