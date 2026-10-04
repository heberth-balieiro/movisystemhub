unit UnitAssembleiaPauta;

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
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, Vcl.Menus, cxButtons,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, DBAccess, Uni, ACBrBase, ACBrEnterTab, ACBRUTIL,
  cxCheckBox, Vcl.Validacoes, UnitBaseNovoCadastro, Vcl.ButtonStylesAttributes,
  Vcl.StyledButton, dxBevel, dxmdaset, System.Generics.Collections,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar,
  Datasnap.DBClient, Controller.LookupHelper, UnitGlobal, Vcl.PermissaoUsuario,
  UConeSul, System.ImageList, Vcl.ImgList, cxImageList,
  cxSpinEdit,
  Frame.QuestaoEscolhaUnica,
  Frame.QuestaoMultiplaEscolha,
  Frame.QuestaoLista,
  Frame.QuestaoTextoLongo,
  Frame.QuestaoTextoCurto,
  Model.EleicaoQuestao,
  Controller.EleicaoQuestao
  ;

type
  TFrmAssembleiaPauta = class(TFormNovoBaseCadastro)
    cxtitulo: TcxTextEdit;
    cxGrid: TcxGrid;
    Grid: TcxGridDBTableView;
    GridRecId: TcxGridDBColumn;
    Gridid_depedente: TcxGridDBColumn;
    Gridcodigo: TcxGridDBColumn;
    Gridnome: TcxGridDBColumn;
    Gridparentesco: TcxGridDBColumn;
    Gridativo: TcxGridDBColumn;
    Gridid_socio: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Btneditar: TStyledBitBtn;
    cxobservacao: TcxBlobEdit;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cxEleicao: TcxLookupComboBox;
    cxAtivo: TcxCheckBox;
    TabEleicao: TClientDataSet;
    dsEleicao: TUniDataSource;
    TabEleicaoid_eleicao: TIntegerField;
    TabEleicaocodigo: TIntegerField;
    TabEleicaonome: TStringField;
    TabEleicaonpesquisa: TStringField;
    cxIMGMenu: TcxImageList;
    mdPesquisa: TdxMemData;
    Label6: TLabel;
    cbbTipoResposta: TcxComboBox;
    GridColumn1: TcxGridDBColumn;
    cxOrdem: TcxSpinEdit;
    Label1: TLabel;
    cxobrigatorio: TcxCheckBox;
    pnlTipoResposta: TPanel;
    mdPesquisaid_questao: TIntegerField;
    mdPesquisaid_eleicao: TIntegerField;
    mdPesquisatitulo: TStringField;
    mdPesquisadescricao: TStringField;
    mdPesquisaordem: TIntegerField;
    mdPesquisatipo_resposta: TStringField;
    mdPesquisaobrigatoria: TStringField;
    mdPesquisaativo: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtneditarClick(Sender: TObject);
    procedure GridCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cbbTipoRespostaPropertiesChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    FFrameEscolhaUnica: TFrameQuestaoEscolhaUnica;
    FFrameMultiplaEscolha: TFrameQuestaoMultiplaEscolha;
    FFrameLista: TFrameQuestaoLista;
    FFrameTextoCurto: TFrameQuestaoTextoCurto;
    FFrameTextoLongo: TFrameQuestaoTextoLongo;

    procedure CarregarTipoResposta;
    procedure LimparFrameResposta;
    procedure PopularOpcoes(const AIDQuestao: Integer);

    Procedure LimparCampos;
    Procedure CarregarGrid;
    Procedure AcaoBtn;
    function SalvarOpcao(const AIDQuestao, AOrdem: Integer;
      const ADescricao: string; out AMsg: string; const AIDOpcao:integer): Boolean;
    function SalvarOpcoesFrame(const AIDQuestao: Integer;
      out AMsg: string): Boolean;

    { Private declarations }
  public
    AIDEleicao :Integer;
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;

    procedure ExcluirOpcao(const AIDOpcao: Integer);

    { Public declarations }
  end;

var
  FrmAssembleiaPauta: TFrmAssembleiaPauta;
  Obj  : TModelEleicaoQuestao;
implementation

{$R *.dfm}

uses Vcl.Session, uJKDialog;

procedure TFrmAssembleiaPauta.AcaoBtn;
begin
  if ParamsStr='E' then
  begin
    BtnEditar.Enabled   := False;
    BtnCancelar.Enabled := False;
    BtnSalvar.Enabled   := true;
  end
  else
  begin
    btnEditar.Enabled   := true;
    BtnCancelar.Enabled := True;
  end;
end;

procedure TFrmAssembleiaPauta.BtnCancelarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);
    if Permissao.TemPermissao('Permitir Excluir Questão') then
    begin
      if not mdPesquisa.Eof then
      begin
        if mdPesquisaid_questao.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;

        if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
        begin

          Try
            if TEleicaoQuestaoController.Excluir(mdPesquisaid_questao.AsInteger) then
            JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
          Finally
            CarregarGrid;
          End;
        end;
      end
      else
      begin
        JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
      end;
    end
    else
      JKDialog('Acesso Negado',
               'O seu perfil não tem permissão para utilizar.' + sLineBreak +
               'Por favor, entre em contato com o administrador do sistema.',
               tdAlerta);
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAssembleiaPauta.BtneditarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);
    if Permissao.TemPermissao('Permitir Editar Questão') then
    begin
      if not mdPesquisa.Eof then
      begin

        if mdPesquisaid_questao.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;

        if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
        begin
          ParamsStr       := 'E';
          PopularCampos;
          AcaoBtn;
        end;
      end
      else
      begin
        JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
      end;
    end
    else
      JKDialog('Acesso Negado',
               'O seu perfil não tem permissão para utilizar.' + sLineBreak +
               'Por favor, entre em contato com o administrador do sistema.',
               tdAlerta);
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAssembleiaPauta.CarregarGrid;
var
  List    : TObjectList<TModelEleicaoQuestao>;
begin
  try
    List    := Nil;
    Try
      List  := TEleicaoQuestaoController.ListarTodos(TSession.IDEMPRESA, AIDEleicao);

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

        mdPesquisaid_questao.AsInteger      := Item.id_questao;
        mdPesquisaid_eleicao.AsInteger      := Item.id_eleicao;
        mdPesquisatitulo.AsString           := Item.titulo;
        mdPesquisadescricao.AsString        := Item.descricao;
        mdPesquisaordem.AsInteger           := Item.ordem;
        mdPesquisatipo_resposta.AsString    := Item.tipo_resposta;
        mdPesquisaobrigatoria.AsString      := Item.obrigatoria;
        mdPesquisaativo.AsString            := Item.ativo;

        mdPesquisa.Post;

      end;
      mdPesquisa.First;
      mdPesquisa.EnableControls;
    Finally
      if Assigned(List) then
      List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAssembleiaPauta.CarregarTipoResposta;
begin
  LimparFrameResposta;

  if SameText(Trim(cbbTipoResposta.Text),'ESCOLHA ÚNICA') then
  begin
    FFrameEscolhaUnica                  := TFrameQuestaoEscolhaUnica.Create(Self);
    FFrameEscolhaUnica.Parent           := pnlTipoResposta;
    FFrameEscolhaUnica.Align            := alClient;
    FFrameEscolhaUnica.Visible          := True;
    FFrameEscolhaUnica.OnOpcaoExcluida  := ExcluirOpcao;
  end
  else
  if SameText(Trim(cbbTipoResposta.Text),'MÚLTIPLA ESCOLHA') then
  begin
    FFrameMultiplaEscolha := TFrameQuestaoMultiplaEscolha.Create(Self);
    FFrameMultiplaEscolha.Parent := pnlTipoResposta;
    FFrameMultiplaEscolha.Align := alClient;
    FFrameMultiplaEscolha.Visible := True;
  end
  else
  if SameText(Trim(cbbTipoResposta.Text),'LISTA') then
  begin
    FFrameLista := TFrameQuestaoLista.Create(Self);
    FFrameLista.Parent := pnlTipoResposta;
    FFrameLista.Align := alClient;
    FFrameLista.Visible := True;
  end
  else
  if SameText(Trim(cbbTipoResposta.Text),'TEXTO CURTO') then
  begin
    FFrameTextoCurto := TFrameQuestaoTextoCurto.Create(Self);
    FFrameTextoCurto.Parent := pnlTipoResposta;
    FFrameTextoCurto.Align := alClient;
    FFrameTextoCurto.Visible := True;
  end
  else
  if SameText(Trim(cbbTipoResposta.Text),'TEXTO LONGO') then
  begin
    FFrameTextoLongo := TFrameQuestaoTextoLongo.Create(Self);
    FFrameTextoLongo.Parent := pnlTipoResposta;
    FFrameTextoLongo.Align := alClient;
    FFrameTextoLongo.Visible := True;
  end;
end;

procedure TFrmAssembleiaPauta.cbbTipoRespostaPropertiesChange(Sender: TObject);
begin
  inherited;
  CarregarTipoResposta;
end;

procedure TFrmAssembleiaPauta.ExcluirOpcao(const AIDOpcao: Integer);
var
  Msg: string;
begin
  if AIDOpcao <= 0 then
  Exit;
  if not TEleicaoQuestaoController.ExcluirOpcao(AIDOpcao) then

end;

procedure TFrmAssembleiaPauta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmAssembleiaPauta := nil;
end;

procedure TFrmAssembleiaPauta.FormCreate(Sender: TObject);
begin
  inherited;
  ParamsStr := 'N';
  ParamsTela:= 'Eleição';

   if not mdPesquisa.Active then
   begin
    mdPesquisa.Open;
   end;
end;

procedure TFrmAssembleiaPauta.FormDestroy(Sender: TObject);
begin
  inherited;
  LimparFrameResposta;
end;

procedure TFrmAssembleiaPauta.FormShow(Sender: TObject);
begin
  inherited;
  try
    TLookupHelper.CarregarLookup(
            Tabeleicao,LookupEleicaoSql);
    Tabeleicao.First;

    if ParamsStr = 'N' then
    begin
      TitleText                 := 'Questão / Pauta';
      cxeleicao.EditValue       := AidEleicao;
      cxtitulo.SetFocus;
    end;

    CarregarGrid;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAssembleiaPauta.GridCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if not mdpesquisa.Eof then
  begin
    ParamsInt := mdpesquisaid_questao.AsInteger;
  end;
end;

procedure TFrmAssembleiaPauta.LimparCampos;
begin
  cxtitulo.Clear;
  cxOrdem.EditValue := 1;
  cbbTipoResposta.ItemIndex := -1;
  cxobservacao.Clear;
  cxobrigatorio.Checked:= true;
  cxativo.Checked := true;
end;

procedure TFrmAssembleiaPauta.LimparFrameResposta;
begin
  FreeAndNil(FFrameEscolhaUnica);
  FreeAndNil(FFrameMultiplaEscolha);
  FreeAndNil(FFrameLista);
  FreeAndNil(FFrameTextoCurto);
  FreeAndNil(FFrameTextoLongo);
end;

procedure TFrmAssembleiaPauta.PopularCampos;
begin
  inherited;
  try
    Obj  := nil;
    Obj  := TModelEleicaoQuestao.Create;

    try
      Obj  := TEleicaoQuestaoController.BuscarPorID(ParamsInt);

      cxtitulo.EditValue      :=Obj.titulo;
      cxordem.EditValue       :=Obj.ordem;
      cbbTipoResposta.Text    :=Obj.tipo_resposta;
      cxobservacao.EditValue  :=Obj.descricao;
      cxobrigatorio.EditValue :=Obj.obrigatoria;
      cxAtivo.EditValue       :=Obj.ativo;

      cbbTipoResposta.Properties.ReadOnly := True;

      //Carregar Opções
      CarregarTipoResposta;
      PopularOpcoes(Obj.id_questao);

    finally
      FreeandNil(Obj);
    end;
  except on E: Exception do
    raise
  end;
end;

procedure TFrmAssembleiaPauta.PopularOpcoes(const AIDQuestao: Integer);
var
  Lista: TObjectList<TModelEleicaoQuestaoOpcao>;
  Item: TModelEleicaoQuestaoOpcao;
  IDOpcao :integer;
begin
  if (AIDQuestao <= 0) or
     SameText(Trim(cbbTipoResposta.Text),'TEXTO CURTO') or
     SameText(Trim(cbbTipoResposta.Text),'TEXTO LONGO') then Exit;

  Lista := TEleicaoQuestaoController.BuscarQuestaoOpcao(AIDQuestao,TSession.IDEMPRESA,AIDEleicao);

  try

    if SameText(Trim(cbbTipoResposta.Text),'ESCOLHA ÚNICA') then
    begin
      FFrameEscolhaUnica.LimparOpcoes;

      for Item in Lista do
        FFrameEscolhaUnica.AdicionarOpcao(Item.id_opcao, Item.descricao);
    end
    else
    if SameText(Trim(cbbTipoResposta.Text),'MÚLTIPLA ESCOLHA') then
    begin
      FFrameMultiplaEscolha.LimparOpcoes;

      for Item in Lista do
        FFrameMultiplaEscolha.AdicionarOpcao(Item.descricao);
    end
    else
    if SameText(Trim(cbbTipoResposta.Text),'LISTA') then
    begin
      FFrameLista.LimparOpcoes;

      for Item in Lista do
        FFrameLista.AdicionarOpcao(Item.descricao);
    end;


    //Liberar o campo quando não tem nada
    IDOpcao:= 0;
    for Item in Lista do
    begin
      IDOpcao := IDOpcao + item.id_opcao;
    end;
    if IDOpcao<=0 then    
    cbbTipoResposta.Properties.ReadOnly := False;

  finally
    Lista.Free;
  end;
end;

function TFrmAssembleiaPauta.SalvarOpcoesFrame(const AIDQuestao: Integer; out AMsg: string): Boolean;

var
  OpcaoUnica: TQuestaoOpcao;
  OpcaoMultipla: TQuestaoOpcaoMultipla;
  OpcaoLista: TQuestaoOpcaoLista;
begin
  Result := False;
  AMsg := '';

  if SameText(Trim(cbbTipoResposta.Text),'ESCOLHA ÚNICA') then
  begin
    for OpcaoUnica in FFrameEscolhaUnica.ObterOpcoes do
      if not SalvarOpcao(AIDQuestao,OpcaoUnica.Ordem,OpcaoUnica.Descricao,AMsg,OpcaoUnica.IDOpcao) then Exit;
  end
  else if SameText(Trim(cbbTipoResposta.Text),'MÚLTIPLA ESCOLHA') then
  begin
    for OpcaoMultipla in FFrameMultiplaEscolha.ObterOpcoes do
      if not SalvarOpcao(AIDQuestao,OpcaoMultipla.Ordem,OpcaoMultipla.Descricao,AMsg,OpcaoUnica.IDOpcao) then Exit;
  end
  else if SameText(Trim(cbbTipoResposta.Text),'LISTA') then
  begin
    for OpcaoLista in FFrameLista.ObterOpcoes do
      if not SalvarOpcao(AIDQuestao,OpcaoLista.Ordem,OpcaoLista.Descricao,AMsg,OpcaoUnica.IDOpcao) then Exit;
  end;

  // TEXTO CURTO e TEXTO LONGO não possuem opções
  Result := True;
end;


function TFrmAssembleiaPauta.SalvarOpcao(const AIDQuestao, AOrdem: Integer;
  const ADescricao: string; out AMsg: string; const AIDOpcao:integer): Boolean;
var
  ObjOpcao: TModelEleicaoQuestaoOpcao;
begin
  Result := False;
  AMsg   := '';

  ObjOpcao := TModelEleicaoQuestaoOpcao.Create;
  try
    if ParamsStr = 'N' then
    ObjOpcao.id_opcao   := 0
    else
    ObjOpcao.id_opcao   := AIDOpcao;
    ObjOpcao.id_questao := AIDQuestao;
    ObjOpcao.id_eleicao := AIDEleicao;
    ObjOpcao.id_empresa := TSession.IDEMPRESA;
    ObjOpcao.id_usuario := TSession.ID_USUARIO;
    ObjOpcao.ordem      := AOrdem;
    ObjOpcao.descricao  := Trim(ADescricao);
    ObjOpcao.ativo      := 'S';
    ObjOpcao.sinc_app   := 'N';

    Result := TEleicaoQuestaoController.SalvarOpcao(ObjOpcao,AMsg);
  finally
    ObjOpcao.Free;
  end;
end;

function TFrmAssembleiaPauta.Salvar(out msg: string): Boolean;
var
AID:Integer;
AStr:String;
begin
  Result        := False;

  try
    //popular os campos conforme registro

    Obj           := nil;
    Obj           := TModelEleicaoQuestao.Create;

    if ParamsStr = 'N' then
    Obj.id_questao      := 0
    else
    Obj.id_questao      := ParamsInt;
    Obj.id_eleicao      := AIDEleicao;
    Obj.id_empresa      := TSession.IDEMPRESA;
    obj.id_usuario      := TSession.ID_USUARIO;
    Obj.titulo          := Trim(cxtitulo.Text);
    Obj.ordem           := cxordem.EditValue;
    Obj.tipo_resposta   := cbbTipoResposta.Text;
    Obj.descricao       := cxobservacao.Text;
    Obj.obrigatoria     := cxobrigatorio.EditValue;
    Obj.ativo           := cxativo.EditValue;

    Try
      //salvar os dados

        if TEleicaoQuestaoController.Salvar(Obj, AID, AStr) then
        begin
          if AStr <> '' then
          begin
            msg := AStr;
            exit;
          end;

          //salvar opção
          if not SalvarOpcoesFrame(AID,AStr) then
          begin
            msg := AStr;
            Exit;
          end;

          Result  := true;
          msg     := 'Registro inserido com sucesso.';
          CarregarGrid;
          LimparCampos;
          cxTitulo.SetFocus;
          ParamsStr       := 'N';
          ParamsCloseTela := 'N';
          AcaoBtn;
          cbbTipoResposta.Properties.ReadOnly := false;
        end
        else
        begin
          ParamsMsgTela := 'S';
          msg           := AStr;
          Result        := False;
          cxtitulo.SetFocus;
        end;


    Finally
      FreeAndNil(Obj);
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmAssembleiaPauta.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if cxtitulo.Text='' then
  begin
    msg:= 'Informe um título';
    Result  := false;
    exit;
  end;

  if cbbTipoResposta.ItemIndex=-1 then
  begin
    msg:= 'Nenhum tipo de resposta selecionado';
    Result  := false;
    exit;
  end;

  if SameText(Trim(cbbTipoResposta.Text),'ESCOLHA ÚNICA') then
  begin
    if not Assigned(FFrameEscolhaUnica) then
    begin
      msg := 'Configure as opções de resposta.';
      Result  := false;
      Exit;
    end;
    Result := FFrameEscolhaUnica.Validar(msg);
    Exit;
  end;
  if SameText(Trim(cbbTipoResposta.Text),'MÚLTIPLA ESCOLHA') then
  begin
    if not Assigned(FFrameMultiplaEscolha) then
    begin
      msg := 'Configure as opções de resposta.';
      Result  := false;
      Exit;
    end;
    Result := FFrameMultiplaEscolha.Validar(msg);
    Exit;
  end;
  if SameText(Trim(cbbTipoResposta.Text),'LISTA') then
  begin
    if not Assigned(FFrameLista) then
    begin
      msg := 'Configure as opções de resposta.';
      Result  := false;
      Exit;
    end;
    Result := FFrameLista.Validar(msg);
    Exit;
  end;
  //Texto curto e longo não possuem opções
  if SameText(Trim(cbbTipoResposta.Text),'TEXTO CURTO') or
     SameText(Trim(cbbTipoResposta.Text),'TEXTO LONGO') then
  begin
    Result := false;
    Exit;
  end;

end;

end.



