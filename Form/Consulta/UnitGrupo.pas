unit UnitGrupo;

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
  cxMaskEdit, cxDropDownEdit, cxTextEdit, cxGroupBox,
  Model.Grupo, Controller.Grupo, dxmdaset,System.Generics.Collections,
  Vcl.ButtonStylesAttributes, Vcl.StyledButton;

type
  TFrmGrupo = class(TFormNovoBasePesquisa)
    Popup: TPopupMenu;
    btnvisualizar: TMenuItem;
    frxRelatorio: TfrxReport;
    frxDBListagemgrupo: TfrxDBDataset;
    mdPesquisa: TdxMemData;
    mdPesquisaid_grupo: TIntegerField;
    mdPesquisacodigo: TIntegerField;
    mdPesquisagrupo: TStringField;
    mdPesquisaativo: TStringField;
    GridRecId: TcxGridDBColumn;
    Gridid_grupo: TcxGridDBColumn;
    Gridcodigo: TcxGridDBColumn;
    Gridgrupo: TcxGridDBColumn;
    Gridativo: TcxGridDBColumn;
    procedure btnLimparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure Novo        ;override;
    Procedure Pesquisa    ;override;
    Procedure Editar      ;override;
    Procedure Excluir     ;override;
    Procedure Listagem    ;override;
    Procedure Relatorio   ;override;
  end;

var
  FrmGrupo: TFrmGrupo;
  ObjGrupo  :TModelGrupo;
  ContGrupo :TGrupoController;

implementation

{$R *.dfm}

uses UnitGrupoCad, UConeSul, Vcl.Loading, Vcl.Session,uJKDialog;

procedure TFrmGrupo.btnLimparClick(Sender: TObject);
begin
  inherited;
  mdPesquisa.Close;
end;

procedure TFrmGrupo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmGrupo  := Nil;
end;

procedure TFrmGrupo.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;
end;

procedure TFrmGrupo.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'GRUPO';
  TitleText   := 'Pesquisa de GRUPO';
end;

procedure TFrmGrupo.Listagem;
begin
  inherited;
   JKDialog('Alerta','Funcionalidade em desenvolvimento.', tdAlerta);
end;

procedure TFrmGrupo.Novo;
begin
  inherited;
  if not Assigned(FrmGrupoCad) then
    FrmGrupoCad := TFrmGrupoCad.Create(Application);
  FrmGrupoCad.ParamsStr  := 'N';
  FrmGrupoCad.ShowModal;
end;

procedure TFrmGrupo.Editar;
begin
  inherited;
  if not mdPesquisa.Eof then
  begin
    if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
    begin
      Try
        if not Assigned(FrmGrupoCad) then
        FrmGrupoCad := TFrmGrupoCad.Create(Application);
        FrmGrupoCad.ParamsStr  := 'E';
        FrmGrupoCad.ParamsInt  := mdPesquisaid_grupo.AsInteger;
        FrmGrupoCad.Show;

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

procedure TFrmGrupo.Excluir;
begin
  inherited;
  if not mdPesquisa.Eof then
  begin
    if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
    begin
      Try
        ContGrupo    := Nil;
        ContGrupo    := TGrupoController.Create;

        Try
          if ContGrupo.ExcluidoCancelado(mdPesquisaid_grupo.AsInteger, TSession.ID_USUARIO) then
          JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
        Finally
          FreeAndNil(ContGrupo);
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

procedure TFrmGrupo.Pesquisa;
var
List    : TObjectList<TModelGrupo>;
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

  ContGrupo      := TGrupoController.Create;

  Try
    List         := ContGrupo.ListarTodos(nCampo, nSituacao);

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
      mdPesquisaid_grupo.AsInteger    := Item.id_grupo;
      mdPesquisacodigo.AsInteger      := Item.Codigo;
      mdPesquisagrupo.AsString        := Item.grupo;
      mdPesquisaativo.AsString        := Item.Ativo;
      mdPesquisa.Post;
    end;
    mdPesquisa.First;
    mdPesquisa.EnableControls;

  Finally
    FreeAndNil(Contgrupo);
    if Assigned(List) then
      List.Free;
  End;
end;

procedure TFrmGrupo.Relatorio;
begin
  inherited;
  JKDialog('Alerta','Funcionalidade em desenvolvimento.', tdAlerta);
end;

end.


//procedure TFrmGrupo.OpenCadTela(id: integer;str:string);
//begin
//  TNavigation.ExecuteOnClose    := RefreshTela;
//  TNavigation.ParamInt          := id;
//  TNavigation.ParamsStr         := Str;
//  TNavigation.OpenModal(TFrmGrupoCad, FrmGrupoCad);
//
//end;
//
//procedure TFrmGrupo.RefreshTela;
//begin
//  carregardadosgrid;
//  {TLoading.Show;
//
//      TLoading.ExecuteThread(procedure
//      begin
//          ds.DataSet.Close;
//          cxGridDbtableview1.DataController.DataSource := nil;
//          carregardadosgrid;
//      end,
//      TerminateBusca);}
//end;
//
//procedure TFrmGrupo.TabSituacaoChange(Sender: TObject; NewTab: Integer;
//  var AllowChange: Boolean);
//begin
//  RefreshTela;
//end;
//
//procedure TFrmGrupo.TerminateBusca(Sender: TObject);
//begin
//    TLoading.Hide;
//    cxGridDbtableview1.DataController.DataSource := ds;
//    //TabCliente.EnableControls;
//
//    if Sender is TThread then
//    if Assigned(TThread(Sender).FatalException) then
//    begin
//      JKDialog('Erro',Exception(TThread(sender).FatalException).Message, tdErro);
//      exit;
//    end;
//
//    if bookmark <> nil then
//    try
//      cxGridDbtableview1.DataController.DataSource.DataSet.GotoBookmark(bookmark);
//      bookmark := nil;
//    except
//    end;
//end;
//
//procedure TFrmGrupo.TerminateDelete(Sender: TObject);
//begin
//  TLoading.Hide;
//
//  if Sender is TThread then
//  if Assigned(TThread(Sender).FatalException) then
//  begin
//    JKDialog('Erro',Exception(TThread(sender).FatalException).Message, tdErro);
//    exit;
//  end;
//
//  RefreshTela;
//end;
//
//procedure TFrmGrupo.btnBuscaClick(Sender: TObject);
//begin
//  RefreshTela;
//end;
//
//procedure TFrmGrupo.btnLimparClick(Sender: TObject);
//begin
//  edtBusca.Clear;
//  DM.TabConsGrupo.EmptyDataSet;
//end;
//
//procedure TFrmGrupo.btnListagemClick(Sender: TObject);
//var
//Model :TModelEmpresa;
//msg:String;
//TempImage: Timage;
//begin
//  //Listagem grupo
//
//  Try
//    if not DM.TabConsGrupo.Eof then
//    begin
//      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelListagemGrupo.fr3');
//      Try
//        DM.TabConsGrupo.DisableControls;
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
//          FrxRelatorio.Variables['filtro']          :=quotedstr('Listagem de Grupo');
//
//        Finally
//          model.Free;
//        End;
//
//        FrxRelatorio.Report.PrepareReport();
//        FrxRelatorio.ShowReport;
//      Finally
//        DM.TabConsGrupo.First;
//        DM.TabConsGrupo.EnableControls;
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
//procedure TFrmGrupo.btnNovoClick(Sender: TObject);
//begin
//  OpenCadTela(0,'N');
//end;
//
//procedure TFrmGrupo.btnvisualizarClick(Sender: TObject);
//begin
//  if not dm.TabConsGrupo.Eof then
//  begin
//    if ds.DataSet.FieldByName('id_grupo').AsInteger > 0 then
//    begin
//      BookMark  := cxGridDbtableview1.DataController.DataSource.DataSet.GetBookmark;
//      OpenCadTela(ds.DataSet.FieldByName('id_grupo').AsInteger,'V');
//    end
//    else
//    JKDialog('Aviso','Selecione um registro da lista!', tdAlerta);
//  end
//  else
//  begin
//    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
//  end;
//end;
//
//procedure TFrmGrupo.CarregarDadosGrid;
//var
//Grupo : TModelgrupo;
//msg:string;
//begin
//
//  Try
//    Try
//      Grupo    := TModelGrupo.Create;
//      if Grupo.Pesquisa(msg, trim(edtBusca.Text),Tabsituacao.TabIndex,'G') then
//      //JKDialog('Aviso',msg, tdAlerta)
//      else
//      JKDialog('Aviso',msg, tdAlerta);
//    Except on e:exception do
//      begin
//      raise
//      end;
//    End;
//
//  Finally
//    Grupo.Free;
//  End;
//end;
//
//
//procedure TFrmGrupo.cxGridDBTableView1CellDblClick(
//  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
//  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
//begin
//  btneditar.Click;
//end;
//
//procedure TFrmGrupo.cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
//  Shift: TShiftState);
//begin
//  if Key = VK_RETURN then
//  begin
//    btneditar.Click;
//  end;
//end;
//
//procedure TFrmGrupo.btneditarClick(Sender: TObject);
//begin
//   if not dm.TabConsGrupo.Eof then
//  begin
//    if ds.DataSet.FieldByName('id_grupo').AsInteger > 0 then
//    begin
//      BookMark  := cxGridDbtableview1.DataController.DataSource.DataSet.GetBookmark;
//      OpenCadTela(ds.DataSet.FieldByName('id_grupo').AsInteger,'E');
//    end
//    else
//    JKDialog('Aviso','Selecione um registro da lista!', tdAlerta)
//  end
//  else
//  begin
//    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
//  end;
//end;
//
//procedure TFrmGrupo.btnexcluirClick(Sender: TObject);
//var
//Grupo : TModelGrupo;
//msg:string;
//begin
//  if not dm.TabConsGrupo.Eof then
//  begin
//
//    if JKDialog('Aviso', 'Deseja excluir o grupo selecionada?', tdMensagem)  then
//    begin
//        TLoading.Show;
//        TLoading.ExecuteThread(procedure
//        begin
//          Try
//            Grupo             := TModelGrupo.Create;
//            Grupo.idGrupo   := ds.DataSet.FieldByName('id_Grupo').AsInteger;
//            Grupo.Delete(msg);
//          Finally
//            Grupo.Free;
//          End;
//        end, TerminateDelete);
//    end;
//
//  end
//  else
//  begin
//    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
//  end;
//end;
//
//procedure TFrmGrupo.FormClose(Sender: TObject; var Action: TCloseAction);
//begin
//    Action := TCloseAction.caFree;
//    FrmGrupo := nil;
//end;
//
//procedure TFrmGrupo.FormKeyDown(Sender: TObject; var Key: Word;
//  Shift: TShiftState);
//begin
//  case key of
//    vk_F2:btnnovo.Click;
//    vk_F3:btneditar.Click;
//    vk_F4:btnexcluir.Click;
//    vk_f8:btnlimpar.Click;
//    vk_f7:btnbusca.Click;
//    vk_F9:btnlistagem.Click;
//    vk_F10:btnrelatorio.Click;
//  end;
//end;
//
//procedure TFrmGrupo.FormShow(Sender: TObject);
//begin
//  self.SetFocus;
//end;
//
//procedure TFrmGrupo.Image1Click(Sender: TObject);
//begin
//  PopUp.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
//end;
//
//end.
