unit UnitFrmWhatsAppMassa;

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
  cxCustomListBox, cxListBox, cxMemo,
  RESTRequest4D,DataSet.Serialize.Adapter.RESTRequest4D,System.JSON, ACBRUtil,
  ACBrBase, ACBrEnterTab, REST.Types, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Datasnap.DBClient,
  cxCheckBox, Vcl.Menus, DBAccess, Uni, UFormNovoBaseDiversos,
  Controller.LookupHelper, UnitGlobal, Vcl.ButtonStylesAttributes,
  Vcl.StyledButton, UnitMensagemCad, uConfiguracaoService, dxmdaset,
  Controller.Mensagem_Whatsapp, Model.Mensagem_Whatsapp,
  Dao.EleicaoConfig, UnitFrmAddWhatsapp;

type
  TFrmEnviarWhatsAppMassa = class(TFormNovoBaseDiversos)
    cxGroupBox111: TcxGroupBox;
    Panel1: TPanel;
    OpenDialog: TOpenDialog;
    TabMensagem: TClientDataSet;
    TabMensagemid_mensagem: TIntegerField;
    TabMensagemcodigo: TIntegerField;
    TabMensagemdescricao: TStringField;
    TabMensagemnpesquisa: TStringField;
    Label6: TLabel;
    cxMsgpronta: TcxLookupComboBox;
    BtnMensagem: TcxButtonEdit;
    cxMensagem: TcxMemo;
    cxUrl: TcxTextEdit;
    Label2: TLabel;
    BtnAplicar: TStyledBitBtn;
    cxGroupDestinatario: TcxGroupBox;
    cxGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    ncodigo: TcxGridDBColumn;
    coll1: TcxGridDBColumn;
    coll2: TcxGridDBColumn;
    coll5: TcxGridDBColumn;
    nenviado: TcxGridDBColumn;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGroupBox1: TcxGroupBox;
    Panel3: TPanel;
    cxListAnexo: TcxListBox;
    BtnIndividual: TStyledBitBtn;
    BtnAdicionarTodos: TStyledBitBtn;
    BtnExcluir: TStyledBitBtn;
    BtnLimparLista: TStyledBitBtn;
    BtnAdicionarAnexo: TStyledBitBtn;
    BtnRemoverAnexo: TStyledBitBtn;
    BtnSalvar: TStyledBitBtn;
    BtnCancelar1: TStyledBitBtn;
    btnParams: TSpeedButton;
    mdListaPessoa: TdxMemData;
    mdListaPessoaid_socio: TIntegerField;
    mdListaPessoacodigo: TIntegerField;
    mdListaPessoamatricula: TIntegerField;
    mdListaPessoanome: TStringField;
    mdListaPessoacpf: TStringField;
    mdListaPessoacelular: TStringField;
    mdListaPessoawhatsapp: TStringField;
    mdListaPessoaemail: TStringField;
    mdListaPessoanascimento: TDateField;
    dsLista: TUniDataSource;
    mdListaPessoasituacao: TStringField;
    btnmanual: TStyledBitBtn;
    cxWhatsApp: TcxCheckBox;
    cxSMS: TcxCheckBox;
    cxEmail: TcxCheckBox;
    procedure FormShow(Sender: TObject);
    procedure BtnAplicarClick(Sender: TObject);
    procedure BtnAdicionarAnexoClick(Sender: TObject);
    procedure BtnCancelar1Click(Sender: TObject);
    procedure BtnRemoverAnexoClick(Sender: TObject);
    procedure btnParamsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnMensagemPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnAdicionarTodosClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnLimparListaClick(Sender: TObject);
    procedure BtnIndividualClick(Sender: TObject);
    procedure btnmanualClick(Sender: TObject);
    
  private
    Function ValidarCampos(out msg: string):Boolean;
    Function Salvar(Out Msg: String):Boolean;
    Function RecuperarToken: string;
    {$REGION 'Eleicao'}
      Procedure BuscarConfig(AIDEleicao:Integer);
      Procedure BuscarEleitores(AIDEleicao:Integer);
    {$ENDREGION}

    { Private declarations }
  public
    nmVendedor:String;
    AIdCampanha:Integer;
    { Public declarations }
  end;

var
  FrmEnviarWhatsAppMassa: TFrmEnviarWhatsAppMassa;
  ContrMensagem : TMensagemWhatsappController;
  ObjMensagem   : TMensagemWhatsapp;
implementation

{$R *.dfm}

uses uJKDialog, UConeSul, Vcl.Session, UnitPrincipalNew,
  UnitAssociadoAdicionar, model.Campanha, UnitLogin, Vcl.Loading, UDMRelatorio,
  UnitPessoaAdicionar, UVariaveisMensagem, System.Generics.Collections;

{$REGION 'Eleicao'}

Procedure TFrmEnviarWhatsAppMassa.BuscarConfig(AIDEleicao:Integer);
var
 AURL :String;
begin
  if TDaoEleicaoConfig.RetornoURlEleicao(AIDEleicao, AURL) then
    cxUrl.editvalue := AURL;

end;

Procedure TFrmEnviarWhatsAppMassa.BuscarEleitores(AIDEleicao:Integer);
var
List    : TObjectList<TPessoaAdicionar>;
begin
  inherited;
  //Adicionar todos
  ContrMensagem := Nil;
  Try
    List    := Nil;
    ContrMensagem := TMensagemWhatsappController.create;

      Try
        List  := ContrMensagem.BuscarAssociadoEleicao(AIDEleicao);

        mdListaPessoa.Close;
        mdListaPessoa.FieldDefs.Clear;

        if (List = nil) or (List.Count = 0) then
        begin
          mdListaPessoa.Close;
          exit;
        end;

        if not mdListaPessoa.Active then
          mdListaPessoa.Open;

        mdListaPessoa.DisableControls;

        for var Item in List do
        begin
          mdListaPessoa.Append;

          mdListaPessoaid_socio.AsInteger       := Item.id_socio;
          mdListaPessoacodigo.AsInteger         := Item.codigo;
          mdListaPessoamatricula.AsInteger      := Item.matricula;
          mdListaPessoanome.AsString            := Item.nome;
          mdListaPessoacpf.AsString             := Item.cpf;
          mdListaPessoacelular.AsString         := Item.celular;
          mdListaPessoawhatsapp.AsString        := Item.whatsapp;
          mdListaPessoaemail.AsString           := Item.email;
          mdListaPessoanascimento.AsDateTime    := Item.nascimento;
          mdListaPessoasituacao.AsString        := 'Aguardando';

          mdListaPessoa.Post;
        end;
        mdListaPessoa.First;
        mdListaPessoa.EnableControls;

      Finally
        FreeAndNil(ContrMensagem);
        if Assigned(List) then
        List.Free;
      End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

{$ENDREGION}

procedure TFrmEnviarWhatsAppMassa.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  inherited;
  FrmEnviarWhatsAppMassa := nil;
end;

procedure TFrmEnviarWhatsAppMassa.FormShow(Sender: TObject);
begin
  inherited;
  //Configurar conformea empresa
  TitleText    := 'Envio de Mensagem em Massa';

  Try
    //Valitar como vai ser enviado e habilitar as opção
    if TConfiguracaoService.ValidarUsoWhatsApp(TSession.IDEMPRESA) then
    begin
      cxWhatsApp.Enabled  := True;
    end
    else
    begin
      cxWhatsApp.Enabled  := False;
      cxWhatsApp.Checked  := false;
    end;

    if TConfiguracaoService.ValidarUsoSMS(TSession.IDEMPRESA) then
    begin
      cxsms.Enabled  := True;
    end
    else
    begin
      cxsms.Enabled  := False;
      cxsms.Checked  := false;
    end;


    TLookupHelper.CarregarLookup(
                  TabMensagem,LookupMensagemtabConfigsql);
    TabMensagem.First;
    ds.DataSet.Open;

    if (Tsession.onePedido='S') or (Tsession.oneGaragem='S') or (Tsession.onePedido='S') or (Tsession.oneLocacao='S') then
    begin
      ncodigo.Visible := true;
      Coll1.Visible   := False;
    end;

    if (TSession.oneAssociacao='S') or (TSession.oneSindicado='S') then
    begin
      ncodigo.Visible := False;
      Coll1.Visible   := True;
      if AIdCampanha>0 then
      begin
        BuscarEleitores(AIdCampanha);
        BuscarConfig(AIDCampanha);
      end;
    end;

    //DM.PopularMensagemWhatsEmail('ENVIO WHATSAPP');
  Except on e:exception do
    raise Exception.Create(e.Message);
  End;
end;

procedure TFrmEnviarWhatsAppMassa.BtnAdicionarAnexoClick(Sender: TObject);
begin
  inherited;
  //Adicionar Anexo    Imagens PNG (*.png)|*.png  //Imagens JPEG (*.jpeg;*.jpg)|*.jpeg;*.jpg| Todos os arquivos (*.*)|*.*'
  OpenDialog.Filter := 'Imagens PNG (*.png)|*.png|PDFs (*.pdf)|*.pdf| Video mp4 (*.mp4)|*.mp4|';
  OpenDialog.Title  := 'Carregar Anexo';

  if OpenDialog.Execute then
  begin
    cxListAnexo.items.Add(Opendialog.FileName);
  end;
end;

procedure TFrmEnviarWhatsAppMassa.BtnAdicionarTodosClick(Sender: TObject);
var
List    : TObjectList<TPessoaAdicionar>;
begin
  inherited;
  //Adicionar todos
  ContrMensagem := Nil;
  Try
    if JKDialog('Aviso', 'Deseja adicionar todos os registro?', tdMensagem)  then
    begin
      List    := Nil;

      ContrMensagem := TMensagemWhatsappController.create;

      Try
        List  := ContrMensagem.AdcionarTodos;

        mdListaPessoa.Close;
        mdListaPessoa.FieldDefs.Clear;

        if (List = nil) or (List.Count = 0) then
        begin
          mdListaPessoa.Close;
          exit;
        end;

        if not mdListaPessoa.Active then
          mdListaPessoa.Open;

        mdListaPessoa.DisableControls;

        for var Item in List do
        begin
          mdListaPessoa.Append;

          mdListaPessoaid_socio.AsInteger       := Item.id_socio;
          mdListaPessoacodigo.AsInteger         := Item.codigo;
          mdListaPessoamatricula.AsInteger      := Item.matricula;
          mdListaPessoanome.AsString            := Item.nome;
          mdListaPessoacpf.AsString             := Item.cpf;
          mdListaPessoacelular.AsString         := Item.celular;
          mdListaPessoawhatsapp.AsString        := Item.whatsapp;
          mdListaPessoaemail.AsString           := Item.email;
          mdListaPessoanascimento.AsDateTime    := Item.nascimento;
          mdListaPessoasituacao.AsString        := 'Aguardando';

          mdListaPessoa.Post;
        end;
        mdListaPessoa.First;
        mdListaPessoa.EnableControls;

      Finally
        FreeAndNil(ContrMensagem);
        if Assigned(List) then
        List.Free;
      End;

    end;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmEnviarWhatsAppMassa.BtnAplicarClick(Sender: TObject);
var
 RetStr: String;
begin
  inherited;
  //Aplicar
  if (cxMsgpronta.Text <> '') or (cxMsgpronta.EditValue >0) then
  begin
    cxMensagem.Clear;
    if TConfiguracaoService.RetornoMensagemWhatsApp(RetStr,cxMsgpronta.editvalue) then
    cxMensagem.Lines.Add(RetStr);
  end;

end;

procedure TFrmEnviarWhatsAppMassa.BtnCancelar1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmEnviarWhatsAppMassa.BtnExcluirClick(Sender: TObject);
begin
  inherited;
  if not mdListaPessoa.Eof then
  mdListaPessoa.Delete;
end;

procedure TFrmEnviarWhatsAppMassa.BtnIndividualClick(Sender: TObject);
begin
  inherited;
  //Chamar Tela de Pesquisa
  if not Assigned(FrmPessoaAdicionar) then
  FrmPessoaAdicionar      := TFrmPessoaAdicionar.create(Application);
  FrmPessoaAdicionar.ShowModal;
end;

procedure TFrmEnviarWhatsAppMassa.BtnLimparListaClick(Sender: TObject);
begin
  inherited;
  if not mdListaPessoa.Eof then
  mdListaPessoa.Close;
  mdListaPessoa.FieldDefs.Clear;
end;

procedure TFrmEnviarWhatsAppMassa.btnmanualClick(Sender: TObject);
begin
  //manual
  if not Assigned(FrmAdicionarWhatsApp) then
  FrmAdicionarWhatsApp      := TFrmAdicionarWhatsApp.create(Application);
  FrmAdicionarWhatsApp.ShowModal;
end;

procedure TFrmEnviarWhatsAppMassa.BtnMensagemPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  try
    try
      if not Assigned(FrmMensagemCad) then
      FrmMensagemCad := TFrmMensagemCad.Create(Application);
      //FrmMensagemCad.ParamsStr  := 'N';
      FrmMensagemCad.ShowModal;
    finally
      TLookupHelper.CarregarLookup(
                  TabMensagem,LookupMensagemtabConfigsql);
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmEnviarWhatsAppMassa.BtnRemoverAnexoClick(Sender: TObject);
begin
  inherited;
    //Excluir Anexo
  if cxListAnexo.ItemIndex <> -1 then
    cxListAnexo.Items.Delete(cxListAnexo.ItemIndex);
end;

procedure TFrmEnviarWhatsAppMassa.BtnSalvarClick(Sender: TObject);
var
msg:String;
begin
  if ValidarCampos(msg) then
  begin
    Try
       if Salvar(msg) then
        begin
          JKDialog('Sucesso',msg, tdSucesso);
          Close;
        end
        else
        JKDialog('Aviso',msg, tdAlerta);

    Except on e:exception do
      begin
        JKDialog('Aviso',msg+' :'+e.Message, tdErro);
        raise
      end;
    End;
  end
  else
  begin
    JKDialog('Aviso',msg, tdAlerta);
    exit;
  end;
end;

procedure TFrmEnviarWhatsAppMassa.btnParamsClick(Sender: TObject);
begin
  inherited;
  ShowMessage('Variáveis disponíveis:' + sLineBreak + GetVariaveisMensagem);
end;

Function TFrmEnviarWhatsAppMassa.RecuperarToken:string;
var
Token    : String;
begin
    Result  := '';
    Token   := '';

    Try
      //Por Funcionario
      if TConfiguracaoService.ValidarInstanciaWhatsappFuncionario(TSession.IDEMPRESA) then
      begin
        if TConfiguracaoService.RetornoInstanciaWhatsAppFuncionario(token,TSession.ID_USUARIO) then
        begin
          Result  := token;
        end
        else
        Result  := '';
      end
      else
      begin
        //Instancia por empresa
        if TConfiguracaoService.RetornoInstanciaWhatsAppEmpresa(token,TSession.ID_USUARIO) then
        begin
          Result  := token;
        end
        else
        Result  := '';
      end;
      Except on e:exception do
      begin
        JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
      end;
    End;
end;

function TFrmEnviarWhatsAppMassa.Salvar(out Msg: String): Boolean;
Var
  AFone             : TcxMaskEdit;
  MensagemFormatada : String;
  Anexo, Extensao   : String;
  I                 : Integer;
  DadosCampanha     : String;
  ModelCamp         :TModelCampanha;
  campanha          : String;
  DTIni, DTFIm      : Tdate;
  HRIni, HRFim      : Ttime;
  //RecMensagem   : TDadosMensaagem;
begin
  Result        := False;
  ContrMensagem := Nil;
  ObjMensagem   := nil;


  Try
    //Pecorrer a lista de pessoa

    mdListaPessoa.First;
    mdListaPessoa.DisableControls;

    Try
      while not mdListaPessoa.Eof do
      begin
        AFone    := TcxMaskEdit.Create(nil);
        AFone.EditValue := mdListaPessoawhatsapp.AsString;

        if TConeSul.ValidarTelefonePreenchido(AFone) then
        begin
          mdListaPessoa.Edit;
          mdListaPessoasituacao.AsString    := 'Sem Telefone';
          mdListaPessoa.Post;

          mdListaPessoa.Next;
          Continue;
        end;

        //se for campanha
        if AIdCampanha > 0 then
        begin
          Try
            ModelCamp           := TModelCampanha.Create;

            if ModelCamp.DadosCampanhaMensagem(campanha,DTIni,DTFIm,HRIni,HRFim,AIdCampanha) then
            DadosCampanha       := Campanha +sLineBreak+sLineBreak+
                                 'Data de Início: ' +datetostr(DTIni)+sLineBreak+
                                 'Hora de Início: '+TimeToStr(HRIni)+sLineBreak+
                                 'Data do Término: '+datetostr(DTFIm)+sLineBreak+
                                 'Hora de Término: '+TimeToStr(HRFim)+sLineBreak;
          Finally
            FreeAndNil(ModelCamp);
          End;
        end;


        //segue para gravar no banco
        ContrMensagem := TMensagemWhatsappController.Create;
        ObjMensagem   := TMensagemWhatsapp.Create;

        Try
          MensagemFormatada := trim(cxMensagem.Text);
          MensagemFormatada := StringReplace(MensagemFormatada,'[Nome]'       ,mdListaPessoanome.AsString, [rfReplaceAll]);
          MensagemFormatada := StringReplace(MensagemFormatada,'[CPF]'        ,mdListaPessoacpf.AsString, [rfReplaceAll]);
          MensagemFormatada := StringReplace(MensagemFormatada,'[Telefone]'   ,mdListaPessoawhatsapp.AsString, [rfReplaceAll]);
          MensagemFormatada := StringReplace(MensagemFormatada,'[Email]'      ,mdListaPessoaemail.AsString, [rfReplaceAll]);
          MensagemFormatada := StringReplace(MensagemFormatada,'[Nascimento]' ,mdListaPessoanascimento.AsString, [rfReplaceAll]);
          MensagemFormatada := StringReplace(MensagemFormatada,'[Campanha]'   ,DadosCampanha,[rfReplaceAll]);

          //Montar os dados no objeto
          ObjMensagem.id_zap            := 0;
          ObjMensagem.mensagem          := MensagemFormatada;
          ObjMensagem.url               := Trim(cxURL.Text);
          ObjMensagem.nomepessoa        := Trim(mdListaPessoanome.AsString);
          ObjMensagem.id_pessoa         := mdListaPessoaid_socio.AsInteger;
          ObjMensagem.fone              := Tirapontos(mdListaPessoawhatsapp.AsString);
          ObjMensagem.status            := 'A';
          ObjMensagem.tipo              := 'M';
          ObjMensagem.token             := RecuperarToken;
          ObjMensagem.nomeinstancia     := TConeSul.Crypt('C',TSession.RAZAO);

          if ContrMensagem.GravarMensagem(ObjMensagem) then
          begin
            if cxUrl.Text<>'' then
            begin
              ObjMensagem.tipo              := 'L';
              ContrMensagem.GravarMensagem(ObjMensagem);
            end;

            if cxListAnexo.Items.Count > 0 then
            begin
              for i := 0 to cxListAnexo.Items.Count - 1 do
              begin
                Anexo                         := cxListAnexo.Items.Strings[i];
                Extensao                      := ExtractFileExt(anexo);
                ObjMensagem.anexobase         := TConeSul.ArquivoParaBase64(Anexo);
                ObjMensagem.ext               := Extensao;
                ObjMensagem.tipo              := 'A';
                ContrMensagem.GravarMensagem(ObjMensagem);
              end;

            end;


            msg := 'Sua mensagem foi salva e será enviada automaticamente pelo WhatsApp.';
            Result  := True;
          end;

        Finally
          FreeAndNil(ContrMensagem);
          FreeAndNil(ObjMensagem);
        End;

        mdListaPessoa.Next;
      end;


    Finally
      mdListaPessoa.EnableControls;
    End;

  Except on e:exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  End;
end;

function TFrmEnviarWhatsAppMassa.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if cxmensagem.Text ='' then
  begin
    msg   := 'Nenhuma mensagem informada!';
    Result:= False;
    exit;
  end;

  if mdListaPessoa.Eof then
  begin
    msg   := 'Nenhum destinatário na lista para ser enviado!';
    Result:= False;
    exit;
  end;

  //Validar se tem algum token criado
  if RecuperarToken = '' then
  begin
    msg   := 'Nenhuma instância do WhatsApp criada!';
    Result:= False;
    exit;
  end;


//  if TConeSul.ValidarTelefonePreenchido(cxTelefone) then
//  begin
//    msg   := 'Informe um telefone!';
//    Result:= False;
//    exit;
//  end;



end;


end.
