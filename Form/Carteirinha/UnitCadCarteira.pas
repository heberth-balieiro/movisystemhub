unit UnitCadCarteira;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseCad, cxGraphics, cxControls,
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
  dxSkinXmas2008Blue, ACBrBase, ACBrEnterTab, cxCheckBox, cxTextEdit,
  cxGroupBox, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, Data.DB, DBAccess, Uni,
  uJKDialog, dxBevel, Vcl.Navigation, Vcl.Session,
  UConeSul,DelphiZXingQRCode, Vcl.Validacoes, UnitPrincipalNew, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  Datasnap.DBClient, Vcl.Menus, cxButtons,
  Controller.Carteira, Model.Carteira, Controllers.Auth, UnitBaseNovoCadastro,
  Vcl.ButtonStylesAttributes, Vcl.StyledButton, dxGDIPlusClasses,acbrUtil,
  Model.Mensagem_Whatsapp, Controller.Mensagem_Whatsapp;

type
  TFrmCarteiraCad = class(TFormNovoBaseCadastro)
    dsAssociado: TUniDataSource;
    dsDependente: TUniDataSource;
    TabCliente: TClientDataSet;
    TabDependente: TClientDataSet;
    TabClienteid_socio: TIntegerField;
    TabClientecodigo: TIntegerField;
    TabClientematricula: TIntegerField;
    TabClientenome: TStringField;
    TabClientecpf: TStringField;
    TabClientecliente: TStringField;
    TabClientewhatsapp: TStringField;
    TabDependenteid_dependente: TIntegerField;
    TabDependentecodigo: TIntegerField;
    TabDependentenome: TStringField;
    TabDependenteparentesco: TStringField;
    TabDependentecpf: TStringField;
    TabDependenteautorizado: TStringField;
    TabClientefoto: TBlobField;
    TabClienteaviso: TStringField;
    TabDependentewhatsapp: TStringField;
    Label3: TLabel;
    cxAssociado: TcxLookupComboBox;
    dxBevel2: TdxBevel;
    edtFoto: TImage;
    edtdata: TcxDateEdit;
    Label5: TLabel;
    cxSenha: TcxTextEdit;
    cxDigital: TcxCheckBox;
    cxAtivo: TcxCheckBox;
    cxImpDependente: TcxCheckBox;
    BtnDependentes: TStyledBitBtn;
    cxgroupDependente: TcxGroupBox;
    cxGrid: TcxGrid;
    Grid: TcxGridDBTableView;
    GridRecId: TcxGridDBColumn;
    Gridid_depedente: TcxGridDBColumn;
    Gridcodigo: TcxGridDBColumn;
    Gridnome: TcxGridDBColumn;
    Gridcpf: TcxGridDBColumn;
    Gridparentesco: TcxGridDBColumn;
    Gridautorizado: TcxGridDBColumn;
    Gridid_socio: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure edtFotoDblClick(Sender: TObject);
    procedure BtnDependentesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxAssociadoPropertiesEditValueChanged(Sender: TObject);
  private
    vNome     :String;
    vCPF      :String;
    vMatricula:Integer;
    vwhatsapp :String;
    Procedure ValidarAssociadoSelecionado;
    function ProcedureGravarMSGEnvio(npara, ncpf, nmatricula, nfone,
      msgpadrao: String; idpessoa: Integer):Boolean;
    function RecuperarToken: string;
    procedure RegistrarDependente;
    procedure coll5PropertiesEditValueChanged(Sender: TObject);
    { Private declarations }
  public
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;
    { Public declarations }
  end;

var
  FrmCarteiraCad  : TFrmCarteiraCad;
  ContCarteira    : TCarteiraWebController;
  ObjCarteira     : TCarteiraWeb;
  ContrMensagem   : TMensagemWhatsappController;
  ObjMensagem     : TMensagemWhatsapp;
implementation

{$R *.dfm}

Uses UDM, System.UITypes, dxGDIPlusAPI,
  Model.Mensagem, Model.Usuario, UnitAvisoPessoa, uConfiguracaoService,
  MensagemZap.V1,
  Controller.LookupHelper, UnitGlobal, Vcl.PermissaoUsuario;

procedure TFrmCarteiraCad.BtnDependentesClick(Sender: TObject);
begin
  try
    TLookupHelper.CarregarLookup(
                  TabDependente,'Select                '+
                            ' id_dependente,           '+
                            ' codigo,             '+
                            ' nome,               '+
                            ' parentesco,           '+
                            ' cpf,                   '+
                            ' ''S'' as autorizado, '+
                            ' fone as whatsapp'+
                            ' From sindicato_dependente '+
                            ' where id_socio= '+QuotedStr(cxassociado.EditValue)+
                            ' and ativo=''S'' and excluido =0     '+
                            ' order by codigo, nome');

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmCarteiraCad.cxAssociadoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if cxassociado.Text <> '' then
  ValidarAssociadoSelecionado;
end;

procedure TFrmCarteiraCad.edtFotoDblClick(Sender: TObject);
var
  OpenDialog: TOpenDialog;
begin
  try
    OpenDialog := TOpenDialog.Create(nil);
    try
      OpenDialog.Filter := 'Imagens JPEG|*.jpg;*.jpeg|Imagens PNG|*.png;*.png';
      OpenDialog.Title := 'Selecione uma foto';

      if OpenDialog.Execute then
      begin
        edtfoto.Picture.LoadFromFile(OpenDialog.FileName);
        edtfoto.Tag := 2;
      end;
    finally
      OpenDialog.Free;
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmCarteiraCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmCarteiraCad := nil;
end;

procedure TFrmCarteiraCad.FormShow(Sender: TObject);
var
Permissao: TPermissaoUsuario;
begin
  inherited;
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Carteira');

    if Permissao.TemPermissao('Opção: Digital') then
    begin
      cxDigital.Checked := True;
    end
    else
    cxDigital.Checked := False;

    if Permissao.TemPermissao('Opção: Impressão dependente') then
    begin
      cxImpDependente.Checked := True;
    end
    else
    cxImpDependente.Checked := False;

    TLookupHelper.CarregarLookup(
                  Tabcliente,LookupAssociadoSql);

    if ParamsStr = 'N' then
    begin
      TitleText   := ' Nova emissão de carteira';
      cxAssociado.SetFocus;
    end
    else
    begin
      PopularCampos;
      cxAssociado.Properties.ReadOnly := True;
      cxgroupDependente.Visible   := False;
      BtnDependentes.Visible          := False;
      TitleText   := ' Editar carteira';
      cxassociado.SetFocus;
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmCarteiraCad.PopularCampos;
begin
  inherited;
  ContCarteira  := Nil;
  ObjCarteira   := Nil;

  try
    ContCarteira    := TCarteiraWebController.Create;
    ObjCarteira     := TCarteiraWeb.Create;

    Try
      ObjCarteira    := ContCarteira.BuscarPorID(ParamsInt);
      if Assigned(ObjCarteira) then
      begin
        cxAssociado.EditValue := ObjCarteira.id_socio;
        edtData.EditValue     := TConeSul.ValidarDataNull(ObjCarteira.validade);
        cxSenha.EditValue     := Tconesul.Crypt('D',ObjCarteira.senha);
        cxativo.EditValue     := ObjCarteira.ativo;
        cxdigital.EditValue   := ObjCarteira.digital;
        cximpdependente.EditValue := ObjCarteira.impresso;

      end;
    Finally
      FreeAndNil(ContCarteira);
      FreeAndNil(ObjCarteira);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmCarteiraCad.Salvar(out msg: string): Boolean;
var
AId:Integer;
Permissao: TPermissaoUsuario;
RetTelefone:string;
begin
  Result        := False;
  ContCarteira  := nil;
  ObjCarteira   := nil;
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Carteira');
    ContCarteira  := TCarteiraWebController.Create;
    ObjCarteira   := TCarteiraWeb.Create;

    Try
      if ParamsStr='N' then
      ObjCarteira.id_carteira   := 0
      else
      ObjCarteira.id_carteira   := ParamsInt;
      ObjCarteira.id_socio      := CxAssociado.EditValue;
      if VarIsNull(edtdata.EditValue) or VarIsEmpty(edtdata.EditValue) or (edtdata.EditValue = Null) then
      ObjCarteira.validade      := nulldate
      else
      ObjCarteira.validade      := edtdata.EditValue;
      ObjCarteira.ativo         := cxAtivo.EditValue;
      ObjCarteira.impresso      := cxImpDependente.EditValue;
      ObjCarteira.digital       := cxDigital.EditValue;
      ObjCarteira.senha         := TConesul.Crypt('C',Trim(cxSenha.Text));
      ObjCarteira.id_usuario    := Tsession.ID_USUARIO;
      ObjCarteira.id_empresa    := TSession.IDEMPRESA;
      ObjCarteira.dataemissao   := Now;
      ObjCarteira.token         := '';
      ObjCarteira.token_device  := '';
      ObjCarteira.qrcode        := '';
      ObjCarteira.id_dependente := 0;
      ObjCarteira.api           := 'N';
      ObjCarteira.login         := Trim(vCPF);
      ObjCarteira.nomeuser      := Trim(vNome);
      ObjCarteira.sinc_app      := 'S';
      ObjCarteira.excluido      := 0;
      if edtFoto.Picture.Graphic <> nil then
      if edtFoto.Tag in [1,2] then
      begin
        ObjCarteira.foto        := TConeSul.ConvImgBase64(edtfoto);
        TConeSul.nfoto          :=nil;
      end;

      //Gravar dados
      if ContCarteira.GravarCarteira(ObjCarteira, AId) then
      begin
        msg     := 'Registro salvo com sucesso';

        if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
        begin
          TConfiguracaoService.SincronizarGravar(6, AId);
        end;

        if ObjCarteira.ativo='S' then
        begin

          // validar envio de mensagem
          if Permissao.TemPermissao('Opção: Salvar e enviar mensagem') then
          begin
            if TConfiguracaoService.ValidarPessoaReceberWhatsApp(cxAssociado.EditValue, RetTelefone) then
            begin
              ProcedureGravarMSGEnvio(vNome,
                                      vCPF,
                                      IntToStr(vMatricula),
                                      vwhatsapp,
                                      '',
                                      cxAssociado.EditValue);
            end;
          end;


        end;
          //Registrar Dependentes
          RegistrarDependente;
          Result  := true;
          ParamsCloseTela := 'S';

      end;

    Finally
      edtfoto.Picture:= nil;
      FreeAndNil(ContCarteira);
      FreeAndNil(ObjCarteira);
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmCarteiraCad.ValidarAssociadoSelecionado;
var
  IdSocio: Variant;
  Retfoto:String;
begin
  try
    IdSocio         := cxAssociado.EditValue;

    if not VarIsNull(IdSocio) then
    begin
      if Tabcliente.Locate('id_socio', IdSocio, []) then
      begin
        vNome       := Tabcliente.FieldByName('nome').AsString;
        vCPF        := Tabcliente.FieldByName('cpf').AsString;
        vMatricula  := Tabcliente.FieldByName('matricula').AsInteger;
        vwhatsapp   := Tabcliente.FieldByName('whatsapp').AsString;

        if TConfiguracaoService.RetornoImagemPessoa(Retfoto,IdSocio) then
        begin
          TConesul.ConvBase64Img(Retfoto);
          edtfoto.Picture         := TConeSul.nfoto;
          edtFoto.Tag             := 1;
        end
        else
        edtfoto.Picture := nil;

        if Tabcliente.FieldByName('aviso').AsString <> '' then
        begin
          FrmAvisoPessoa      := TFrmAvisoPessoa.Create(Application);
          FrmAvisoPessoa.msg  := Tabcliente.FieldByName('aviso').AsString;
          FrmAvisoPessoa.ShowModal;
        end;

        cxsenha.EditValue   := Tabcliente.FieldByName('matricula').AsInteger;
        edtdata.SetFocus;
      end
      else
        edtfoto.Picture := nil;
    end
    else
      edtfoto.Picture := nil;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmCarteiraCad.ValidarCampos(out msg: string): Boolean;
var
IdSelecionado: Variant;
Permissao: TPermissaoUsuario;
begin
  Result  := True;
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Carteira');

    if (cxAssociado.Text='') or (cxAssociado.EditValue=0) then
    begin
      msg   := 'Selecione um associado!';
      result:= False;
      exit;
    end;

    if Permissao.TemPermissao('Required: Validade') then
    begin
      if (edtData.Text='') or (Edtdata.EditValue <0) or (edtdata.EditValue=null) then
      begin
        msg   := 'Informe uma valídade!';
        result  := false;
        exit;
      end;
    end;

    if (cxsenha.Text='') or (cxsenha.EditValue=null) then
    begin
      msg     := 'Informe uma senha!';
      cxSenha.EditValue := '1234';
      result:= False;
      exit;
    end;

    if Permissao.TemPermissao('Required: Foto') then
    begin
      if edtfoto.Tag=0 then
      begin
        msg   := 'Informe uma foto!';
        result  := false;
        exit;
      end;
    end;

    //Validar se já existe criado
    if ParamsStr='N' then
    begin
      IdSelecionado     := cxassociado.EditValue;

      if not VarIsNull(IdSelecionado) then
      begin
        if Tabcliente.Locate('id_socio', IdSelecionado, []) then
        begin
          if (Tabcliente.FieldByName('cpf').AsString ='') or (Tabcliente.FieldByName('cpf').IsNull) then
          begin
            msg     := 'Associado sem CPF na ficha de cadastro.';
            Result  := False;
            exit;
          end;
        end;
      end;

      if TConfiguracaoService.ValidarPessoaCarteiraWeb(cxassociado.EditValue) then
      begin
        msg   := 'Associado já consta uma carteira criada.';
        Result:= False;
        exit;
      end;
    end;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmCarteiraCad.ProcedureGravarMSGEnvio(npara, ncpf, nmatricula, nfone, msgpadrao:String; idpessoa:Integer):Boolean;
Var
  telefone      : String;
  Mensagem      : String;
  MensagemFormatada : String;
  RetMensagemPadrao:String;
begin
  Result        := False;
  ContrMensagem := Nil;
  ObjMensagem   := nil;
  Telefone      := TiraPontos(nfone);
  Mensagem      := Trim(msgpadrao);

  Try
    ContrMensagem := TMensagemWhatsappController.Create;
    ObjMensagem   := TMensagemWhatsapp.Create;
    TConfiguracaoService.RetornoMensagemPadraoWhatsApp(RetMensagemPadrao,'id_mensagempadraowhatsapp',Tsession.IDEMPRESA);
    //Preparar Formatacao da mensagem
    MensagemFormatada       := Mensagem;
    MensagemFormatada       := RetMensagemPadrao;//dm.RetornoMensagemenvioWhatsappPadrao(Tsession.IDEMPRESA);
    MensagemFormatada       := StringReplace(MensagemFormatada,'[Nome]'     ,trim(npara), [rfReplaceAll]);
    MensagemFormatada       := StringReplace(MensagemFormatada,'[Empresa]'  ,TSession.RAZAO,[rfReplaceAll]);
    MensagemFormatada       := StringReplace(MensagemFormatada,'[CPF]'      , ncpf,[rfReplaceAll]);
    MensagemFormatada       := StringReplace(MensagemFormatada,'[Matricula]',nmatricula,[rfReplaceAll]);

    //Primeiro Grava a mensagem
    Try
      //Montar os dados no objeto
      ObjMensagem.id_zap            := 0;
      ObjMensagem.mensagem          := MensagemFormatada;
      ObjMensagem.url               := '';
      ObjMensagem.nomepessoa        := Trim(npara);
      ObjMensagem.id_pessoa         := idpessoa;
      ObjMensagem.fone              := Telefone;
      ObjMensagem.status            := 'A';
      ObjMensagem.anexobase         := '';
      ObjMensagem.ext               := '';
      ObjMensagem.tipo              := 'M';  //mensagem apenas
      ObjMensagem.token             := RecuperarToken;
      ObjMensagem.nomeinstancia     := TConeSul.Crypt('C',TSession.RAZAO);

      if ContrMensagem.GravarMensagem(ObjMensagem) then
      begin
        msg := 'Carteira foi salva e será enviada automaticamente pelo WhatsApp.';
        Result  := True;
      end;
    Finally
      FreeAndNil(ContrMensagem);
      FreeAndNil(ObjMensagem);
    End;

  Except on e:exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  End;
end;

Function TFrmCarteiraCad.RecuperarToken:string;
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
        if TConfiguracaoService.RetornoInstanciaWhatsAppEmpresa(token,TSession.IDEMPRESA) then
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

Procedure TFrmCarteiraCad.RegistrarDependente;
var
IDRet :integer;
begin
  try
    //Gravar Dependente se houver. >>>>
    if TabDependente.Active then
    begin
      if TabDependente.RecordCount > 0 then
      begin
        TabDependente.First;
        while not TabDependente.Eof do
        begin
          ObjCarteira.nomeuser  := '';
          ObjCarteira.login     := '';

          if (TabDependenteautorizado.AsString = 'True') or (TabDependenteautorizado.AsString = 'S') then
          begin
            ObjCarteira.id_carteira     := 0;
            ObjCarteira.id_socio        := cxAssociado.EditValue;
            ObjCarteira.ativo           := cxativo.EditValue;
            ObjCarteira.impresso        := cxImpDependente.EditValue;
            ObjCarteira.digital         := cxDigital.EditValue;
            ObjCarteira.senha           := TConesul.Crypt('C',Trim(cxsenha.Text));
            ObjCarteira.id_usuario      := TSession.ID_USUARIO;
            ObjCarteira.id_empresa      := Tsession.idempresa;
            ObjCarteira.id_dependente   := TabDependenteid_dependente.asinteger;
            ObjCarteira.login           := TabDependentecpf.AsString;
            ObjCarteira.nomeuser        := TabDependentenome.AsString;
            ObjCarteira.api             := 'N';
            ObjCarteira.sinc_app        := 'S';
            ObjCarteira.excluido        := 0;

            if ContCarteira.GravarCarteira(ObjCarteira,IDRet) then
            begin
              //Grava a mensagem para o associado/depedente.
              if cxativo.Checked=True then

              ProcedureGravarMSGEnvio(TabDependentenome.AsString,
                                  TabDependentecpf.AsString,
                                  IntToStr(vMatricula),
                                  TabDependenteWhatsApp.AsString,
                                  '',
                                  TabDependenteid_dependente.asinteger);
            end;

            if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
            begin
              TConfiguracaoService.SincronizarGravar(6, IDRet);
            end;

          end;
          TabDependente.Next;
        end;
      end;
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmCarteiraCad.coll5PropertiesEditValueChanged(Sender: TObject);
begin
  if (TabDependente.Active) and (not TabDependente.IsEmpty) then
  begin
    // Entra em modo de edição no ClientDataSet
    if not (TabDependente.State in [dsEdit, dsInsert]) then
      TabDependente.Edit;

    if TcxCheckBox(Sender).Checked then
      TabDependente.FieldByName('autorizado').AsString := 'S'
    else
      TabDependente.FieldByName('autorizado').AsString := 'N';

    // Salva a alteração
    TabDependente.Post;
  end;
end;

End.
