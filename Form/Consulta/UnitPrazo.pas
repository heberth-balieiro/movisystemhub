unit UnitPrazo;

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
  Vcl.Menus, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, dxGDIPlusClasses,
  ACBrBase, ACBrEnterTab, Vcl.Tabs, frxClass, frxDBSet, UFormNovoBasePesquisa,
  cxContainer, System.ImageList, Vcl.ImgList, cxImageList, DBAccess, Uni,
  cxMaskEdit, cxDropDownEdit, cxTextEdit, cxGroupBox, Model.prazopag, controller.PrazoPag,
  dxmdaset, Vcl.ButtonStylesAttributes, Vcl.StyledButton;

type
  TFrmPrazo = class(TFormNovoBasePesquisa)
    frxRelatorio: TfrxReport;
    frxDBListagemPrazo: TfrxDBDataset;
    mdPesquisa: TdxMemData;
    mdPesquisaid_prazo: TIntegerField;
    mdPesquisacodigo: TIntegerField;
    mdPesquisatipo: TStringField;
    mdPesquisadescricao: TStringField;
    mdPesquisaativo: TStringField;
    mdPesquisapedido: TStringField;
    mdPesquisasistema: TStringField;
    mdPesquisaexibirapp: TStringField;
    GridRecId: TcxGridDBColumn;
    Gridid_prazo: TcxGridDBColumn;
    Gridcodigo: TcxGridDBColumn;
    Gridtipo: TcxGridDBColumn;
    Griddescricao: TcxGridDBColumn;
    Gridativo: TcxGridDBColumn;
    Gridpedido: TcxGridDBColumn;
    Gridsistema: TcxGridDBColumn;
    Gridexibirapp: TcxGridDBColumn;
    procedure btnLimparClick(Sender: TObject);
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
  FrmPrazo: TFrmPrazo;
  Controller : TPrazoPagController;
implementation

{$R *.dfm}

uses UnitPrazoCad, UConeSul, Vcl.Loading, Vcl.Session,
  uJKDialog, UnitPrincipalNew, AppVendas, Vcl.Validacoes, System.Generics.Collections;


{$REGION 'Função'}

{$ENDREGION}

{$REGION 'Form'}

procedure TFrmPrazo.btnLimparClick(Sender: TObject);
begin
  inherited;
  mdPesquisa.Close
end;

procedure TFrmPrazo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmPrazo    := Nil;
end;

procedure TFrmPrazo.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;
end;

procedure TFrmPrazo.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'PRAZO';
  TitleText   := 'Pesquisa de Prazo de Pagamento';
end;

{$ENDREGION}


{$REGION 'Procedimento'}

procedure TFrmPrazo.Pesquisa;
var
List    : TObjectList<TModelPrazopag>;
nCampo, nSituacao  : String;
begin
  inherited;
  List    := Nil;
  nCampo  := '';

  if trim(edtBusca.Text) <> '' then
  begin
    nCampo     := Trim(edtBusca.Text);
  end;

  case cxAtivo.ItemIndex of
    1: nSituacao := 'S';
    2: nSituacao := 'N';
  end;

  Controller      := TPrazoPagController.Create;

  Try
    List  := Controller.ListarTodos(nCampo, nSituacao);

    mdPesquisa.Close;
    mdPesquisa.FieldDefs.Clear;

    if (List = nil) or (List.Count = 0) then
    begin
      mdPesquisa.Close;
      JKDialog('Aviso','Nenhum registro encontrado!', tdAlerta);
      exit;
    end;

    if not mdPesquisa.Active then
      mdPesquisa.Open;

    mdPesquisa.DisableControls;

    for var Item in List do
    begin
      mdPesquisa.Append;

      mdPesquisaid_prazo.AsInteger        := Item.id_prazo;
      mdPesquisacodigo.AsInteger          := Item.Codigo;
      mdPesquisatipo.AsString             := Item.tipo;
      mdPesquisadescricao.AsString        := Item.descricao;
      mdPesquisaativo.AsString            := Item.ativo;
      mdPesquisapedido.AsString           := Item.pedido;
      mdPesquisasistema.AsString          := Item.sistema;
      mdPesquisaexibirapp.AsString        := Item.exibirapp;

      mdPesquisa.Post;

    end;
    mdPesquisa.First;
    mdPesquisa.EnableControls;

  Finally
    FreeAndNil(Controller);
    if Assigned(List) then
      List.Free;
  End;
end;

procedure TFrmPrazo.Novo;
begin
  inherited;
  if not Assigned(FrmPrazoCad) then
    FrmPrazoCad := TFrmPrazoCad.Create(Application);
  FrmPrazoCad.ParamsStr  := 'N';
  FrmPrazoCad.ShowModal;
end;

procedure TFrmPrazo.Editar;
begin
  inherited;
  if not mdPesquisa.Eof then
  begin
    if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
    begin
      Try
        Try
          if not Assigned(FrmPrazoCad) then
          FrmPrazoCad := TFrmPrazoCad.Create(Application);
          FrmPrazoCad.ParamsStr  := 'E';
          FrmPrazoCad.ParamsInt  := mdPesquisaid_prazo.AsInteger;
          FrmPrazoCad.ShowModal;
        Finally
          Pesquisa;
        End;

      except on e:exception do
        begin
          JKDialog('Erro','Erro ao editar o registro.'+#13+e.Message, tdErro);
          exit;
        end;
      end;

    end;

  end
  else
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  end;
end;

procedure TFrmPrazo.Excluir;
begin
  inherited;
  if not mdPesquisa.Eof then
  begin
    if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
    begin
      Try
        Controller    := Nil;
        Controller    := TPrazoPagController.Create;

        Try
          if Controller.ExcluidoCancelado(mdPesquisaid_prazo.AsInteger, TSession.id_usuario) then
          JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
        Finally
          FreeAndNil(Controller);
          Pesquisa;
        End;

      except on e:exception do
        begin
          JKDialog('Erro','Erro ao editar o registro.'+#13+e.Message, tdErro);
          exit;
        end;
      end;

    end;

  end
  else
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  end;
end;

procedure TFrmPrazo.Listagem;
begin
  inherited;
  JKDialog('Alerta','Funcionalidade em desenvolvimento.', tdAlerta);
end;

procedure TFrmPrazo.Relatorio;
begin
  inherited;
  JKDialog('Alerta','Funcionalidade em desenvolvimento.', tdAlerta);
end;

{$ENDREGION}



{
procedure TFrmPrazo.SincronizarAPP1Click(Sender: TObject);
var
Model :TModelAppVendas;
ModelVal : TValidacao;
begin

  ModelVal      := TValidacao.create;
  Try
    if not ModelVal.ValidarUsoWhatsApp(TSession.idempresa) then
    begin
      JKDialog('Aviso','Função não habilitada!', tdAlerta);
      exit;
    end;
  Finally
    ModelVal.free;
  End;


  TLoading.ShowNovo(FrmPrazo,'Sincronizando forma de pagamento...');

  try
    TThread.CreateAnonymousThread(
    procedure
    begin
      Try
        Model := TModelAppVendas.Create;
        Try
          Model.SincronizarPrazo;
        Finally

        End;
        TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin
          TLoading.Hide;
        end);

      Except on e:exception do
        begin
          TThread.Synchronize(TThread.CurrentThread,
          procedure
          begin
            TLoading.Hide;
            ShowMessage('Erro durante a sincronização: ' + E.Message);
          end);
        end;
      End;
    end).Start;

  except
    TLoading.Hide;
  end;




end;

procedure TFrmPrazo.btnListagemClick(Sender: TObject);
var
Model :TModelEmpresa;
msg:String;
TempImage: Timage;
begin
  //Listagem marca

  Try
    if not DM.TabConsPrazoPag.Eof then
    begin
      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelListagemPrazo.fr3');
      Try
        DM.TabConsPrazoPag.DisableControls;

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
          FrxRelatorio.Variables['filtro']          :=quotedstr('Listagem de Prazo de Pagamento');

        Finally
          model.Free;
        End;

        FrxRelatorio.Report.PrepareReport();
        FrxRelatorio.ShowReport;
      Finally
        DM.TabConsPrazoPag.First;
        DM.TabConsPrazoPag.EnableControls;
      End;

    end
    else
    begin
      JKDialog('Aviso','Nenhum registro encontrato!', tdAlerta);
    end;

  Except

  End;
end;

procedure TFrmPrazo.btneditarClick(Sender: TObject);
begin
   if not dm.TabConsPrazoPag.Eof then
  begin
    if ds.DataSet.FieldByName('id_prazo').AsInteger > 0 then
    begin
      BookMark  := cxGridDbtableview1.DataController.DataSource.DataSet.GetBookmark;
      OpenCadTela(ds.DataSet.FieldByName('id_prazo').AsInteger,'E');
    end
    else
    JKDialog('Aviso','Selecione um registro da lista!', tdAlerta)
  end
  else
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  end;
end;

procedure TFrmPrazo.btnexcluirClick(Sender: TObject);
var
Prazo : TModelPrazo;
msg:string;
begin
  if not dm.TabConsPrazoPag.Eof then
  begin

    if JKDialog('Aviso', 'Deseja excluir o prazo pagamento selecionada?', tdMensagem)  then
    begin
        TLoading.Show;
        TLoading.ExecuteThread(procedure
        begin
          Try
            Prazo             := TModelprazo.Create;
            Prazo.idprazo     := ds.DataSet.FieldByName('id_prazo').AsInteger;
            Prazo.Delete(msg);
          Finally
            prazo.Free;
          End;
        end, TerminateDelete);
    end;

  end
  else
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  end;
end;

procedure TFrmPrazo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmPrazo := nil;
end;

}




end.
