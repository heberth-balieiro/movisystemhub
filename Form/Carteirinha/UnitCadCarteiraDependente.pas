unit UnitCadCarteiraDependente;

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
  uJKDialog, dxBevel, Model.Carteirinha, Vcl.Navigation, Vcl.Session,
  UConeSul,DelphiZXingQRCode, Vcl.Validacoes,  cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  Datasnap.DBClient, Vcl.Menus, cxButtons, Controller.Carteira, Model.Carteira,
  UnitBaseNovoCadastro, Vcl.ButtonStylesAttributes, Vcl.StyledButton,
  dxGDIPlusClasses;

type
  TFrmCarteiraCadDependente = class(TFormNovoBaseCadastro)
    QrCodeImagen: TImage;
    TabDependente: TClientDataSet;
    TabDependenteid_dependente: TIntegerField;
    TabDependenteid_socio: TIntegerField;
    TabDependentecodigo: TIntegerField;
    TabDependentenome: TStringField;
    TabDependentecpf: TStringField;
    TabDependentefone: TStringField;
    TabDependentefoto: TBlobField;
    TabDependentedependente: TStringField;
    Label3: TLabel;
    cxDependente: TcxLookupComboBox;
    Label5: TLabel;
    Label1: TLabel;
    edtdata: TcxDateEdit;
    cxSenha: TcxTextEdit;
    cxAtivo: TcxCheckBox;
    cxDigital: TcxCheckBox;
    dxBevel2: TdxBevel;
    edtFoto: TImage;
    TabDependentematricula: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cxDependentePropertiesChange(Sender: TObject);
  private
    vNome       :String;
    vCPF        :String;
    vMatricula  :integer;
    vwhatsapp   :String;
    procedure ValidarAssociadoSelecionado;
    Function ProcedureGravarMSGEnvio(npara, ncpf, nmatricula, nfone,
      msgpadrao: String; idpessoa: Integer):boolean;
    function RecuperarToken: string;
    { Private declarations }
  public
    IDSocio    :Integer;
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;
    { Public declarations }
  end;

var
  FrmCarteiraCadDependente: TFrmCarteiraCadDependente;
  ContCarteira      : TCarteiraWebController;
  ObjCarteira       : TCarteiraWeb;

implementation

{$R *.dfm}

Uses UDM, System.UITypes, dxGDIPlusAPI, Controllers.Auth, UnitFrmWhatsApp,
  uConfiguracaoService, Controller.LookupHelper, Vcl.PermissaoUsuario,
  Model.Mensagem, Controller.Mensagem_Whatsapp,
  Model.Mensagem_Whatsapp;

procedure TFrmCarteiraCadDependente.cxDependentePropertiesChange(
  Sender: TObject);
begin
  inherited;
  if cxDependente.Text <> '' then
  ValidarAssociadoSelecionado;
end;

procedure TFrmCarteiraCadDependente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmCarteiraCadDependente := Nil;
end;

procedure TFrmCarteiraCadDependente.FormShow(Sender: TObject);
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

    TLookupHelper.CarregarLookup(
                  TabDependente,'Select                                                        '+
                                  ' d.id_dependente,                                           '+
                                  ' d.id_socio,                                                '+
                                  ' d.codigo,                                                  '+
                                  ' d.nome,                                                    '+
                                  ' d.cpf,                                                     '+
                                  ' d.fone,                                                    '+
                                  ' Concat(d.codigo,'' | '',d.nome,'' | '',d.cpf) as dependente,'+
                                  ' s.matricula                                                '+
                                  ' From sindicato_dependente d                                '+
                                  ' Inner join Socio s                                         '+
                                  ' on d.id_socio = s.id_socio                                 '+
                                  ' where d.ativo=''S''                                        '+
                                  ' and d.excluido=0                                           '+
                                  ' and d.id_socio= '+InttoStr(IDSocio)                         +
                                  ' order by d.nome;');

    if ParamsStr = 'N' then
    begin
      TitleText   := ' Nova emissão de carteira';
      cxDependente.SetFocus;
    end
    else
    begin
      PopularCampos;
      cxDependente.Properties.ReadOnly := True;
      TitleText   := ' Editar carteira';
      cxdependente.SetFocus;
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmCarteiraCadDependente.PopularCampos;
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
        cxDependente.EditValue := ObjCarteira.id_dependente;
        edtData.EditValue     := TConeSul.ValidarDataNull(ObjCarteira.validade);
        cxSenha.EditValue     := Tconesul.Crypt('D',ObjCarteira.senha);
        cxativo.EditValue     := ObjCarteira.ativo;
        cxdigital.EditValue   := ObjCarteira.digital;
        IDSocio               := ObjCarteira.id_socio;
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

function TFrmCarteiraCadDependente.Salvar(out msg: string): Boolean;
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
    Permissao     := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Carteira');
    ContCarteira  := TCarteiraWebController.Create;
    ObjCarteira   := TCarteiraWeb.Create;

    Try
      if ParamsStr='N' then
      ObjCarteira.id_carteira   := 0
      else
      ObjCarteira.id_carteira   := ParamsInt;
      ObjCarteira.id_socio      := IDSocio;
      if VarIsNull(edtdata.EditValue) or VarIsEmpty(edtdata.EditValue) or (edtdata.EditValue = Null) then
      ObjCarteira.validade      := nulldate
      else
      ObjCarteira.validade      := edtdata.EditValue;
      ObjCarteira.ativo         := cxAtivo.EditValue;
      ObjCarteira.impresso      := 'N';
      ObjCarteira.digital       := cxDigital.EditValue;
      ObjCarteira.senha         := TConesul.Crypt('C',Trim(cxSenha.Text));
      ObjCarteira.id_usuario    := Tsession.ID_USUARIO;
      ObjCarteira.id_empresa    := TSession.IDEMPRESA;
      ObjCarteira.dataemissao   := Now;
      ObjCarteira.token         := '';
      ObjCarteira.token_device  := '';
      ObjCarteira.qrcode        := '';
      ObjCarteira.id_dependente := cxdependente.EditValue;
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
        edtfoto.Picture:= nil;
        if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
        begin
          TConfiguracaoService.SincronizarGravar(6, AId);// sinicronizar apenas esse registro
        end;
        Result  := true;
        // validar envio de mensagem
        if Permissao.TemPermissao('Opção: Salvar e enviar mensagem') then
        begin
          if TConfiguracaoService.ValidarPessoaReceberWhatsApp(IDSocio, RetTelefone) then
          begin
            if cxAtivo.Checked=True then            
            ProcedureGravarMSGEnvio(vNome,
                                    vCPF,
                                    IntToStr(vmatricula),
                                    vwhatsapp,
                                    '',
                                    cxDependente.EditValue);
          end;
        end;
        ParamsCloseTela := 'S';
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

function TFrmCarteiraCadDependente.ValidarCampos(out msg: string): Boolean;
var
IdSelecionado: Variant;
Permissao: TPermissaoUsuario;
begin
  Result  := True;
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Carteira');

    if (cxDependente.Text='') or (cxdependente.EditValue=0) then
    begin
      msg   := 'Selecione um dependente!';
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
      IdSelecionado     := cxDependente.EditValue;

      if not VarIsNull(IdSelecionado) then
      begin
        if TabDependente.Locate('id_dependente', IdSelecionado, []) then
        begin
          if (TabDependente.FieldByName('cpf').AsString ='') or (TabDependente.FieldByName('cpf').IsNull) then
          begin
            msg     := 'Dependente sem CPF na ficha de cadastro.';
            Result  := False;
            exit;
          end;
        end;
      end;

      if TConfiguracaoService.ValidarPessoaDependenteCarteiraWeb(cxdependente.EditValue) then
      begin
        msg   := 'Dependente já consta uma carteira criada.';
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

procedure TFrmCarteiraCadDependente.ValidarAssociadoSelecionado;
var
  IdDependente: Variant;
  RetFoto:String;
begin
  try
    IdDependente         := cxDependente.EditValue;

    if not VarIsNull(IdDependente) then
    begin
      if TabDependente.Locate('id_dependente',IdDependente, []) then
      begin
        vNome               := TabDependente.FieldByName('nome').AsString;
        vCPF                := TabDependente.FieldByName('cpf').AsString;
        cxsenha.EditValue   := TabDependente.FieldByName('matricula').AsInteger;
        vMatricula          := TabDependente.FieldByName('matricula').AsInteger;
        vwhatsapp           := TabDependente.FieldByName('fone').AsString;

        if TConfiguracaoService.RetornoImagemDependente(RetFoto,IdDependente) then
        begin
          TConesul.ConvBase64Img(RetFoto);
          edtfoto.Picture         := TConeSul.nfoto;
          edtFoto.Tag             := 1;
        end;
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

Function TFrmCarteiraCadDependente.ProcedureGravarMSGEnvio(npara, ncpf, nmatricula, nfone, msgpadrao:String; idpessoa:Integer):boolean;
var
Model :TModelMensagem;
ModelVal  : TValidacao;
MensagemFormatada:String;
token,RetMensagemPadrao:string;

ContrMensagem : TMensagemWhatsappController;
ObjMensagem   : TMensagemWhatsapp;
begin
  ContrMensagem := Nil;
  ObjMensagem   := Nil;

  ModelVal      := TValidacao.Create;

  Try
    if ModelVal.InstanciaPorFunc(TSession.IDEMPRESA) then
    begin
      //funcionario

    end
    else
    begin
      //empresa
      //28/07/2025 Novo codigo
      ContrMensagem := TMensagemWhatsappController.Create;
      ObjMensagem   := TMensagemWhatsapp.Create;
      TConfiguracaoService.RetornoMensagemPadraoWhatsApp(RetMensagemPadrao,'id_mensagempadraowhatsapp',Tsession.IDEMPRESA);
      MensagemFormatada         := RetMensagemPadrao;//dm.RetornoMensagemenvioWhatsappPadrao(Tsession.IDEMPRESA);
              MensagemFormatada := StringReplace(MensagemFormatada,'[Nome]'     ,trim(npara), [rfReplaceAll]);
              MensagemFormatada := StringReplace(MensagemFormatada,'[Empresa]'  ,TSession.RAZAO,[rfReplaceAll]);
              MensagemFormatada := StringReplace(MensagemFormatada,'[CPF]'      ,ncpf,[rfReplaceAll]);
              MensagemFormatada := StringReplace(MensagemFormatada,'[Matricula]',nmatricula,[rfReplaceAll]);
      Try
        //Montar os dados no objeto
        ObjMensagem.id_zap            := 0;
        ObjMensagem.mensagem          := MensagemFormatada;
        ObjMensagem.url               := '';
        ObjMensagem.nomepessoa        := Trim(npara);
        ObjMensagem.id_pessoa         := idpessoa;
        ObjMensagem.fone              := nfone;
        ObjMensagem.status            := 'A';
        ObjMensagem.anexobase         := '';
        ObjMensagem.ext               := '';
        ObjMensagem.tipo              := 'M';
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

    end;
  Finally
    FreeAndnil(Modelval);
  End;


end;

Function TFrmCarteiraCadDependente.RecuperarToken:string;
var
ModelVal : TValidacao;
Token    : String;
begin
  //validar instancia por funcionario
    result  := '';
    ModelVal      := TValidacao.create;
    Try
      if ModelVal.InstanciaPorFunc(TSession.IDEMPRESA) then
      begin
        //Por Funcionario
        if TConfiguracaoService.RetornoInstanciaWhatsAppFuncionario(token, TSession.ID_USUARIO) then
        Result      := Trim(Token);
      end
      else
      begin
        //Instancia por empresa
        if ModelVal.TokenWhatsapp(token,TSession.IDEMPRESA) then
        Result      := Trim(Token);
      end;
    Finally
      ModelVal.Free;
    End;
end;

end.

//procedure TFrmCarteiraCadDependente.EnviarWhatsApp;
//begin
//    if edtsocio.EditValue > 0 then
//    begin
//      FrmEnviarWhatsApp                         := TFrmEnviarWhatsApp.Create(Application);
//
//      FrmEnviarWhatsApp.edtpara.EditValue       := vnome;
//      FrmEnviarWhatsApp.edtcelular.EditValue    := vWhatsApp;
//      FrmEnviarWhatsApp.nmVendedor              := '';
//      FrmEnviarWhatsApp.edtMensagem.EditValue   := '';
//
//      FrmEnviarWhatsApp.ShowModal;
//
//    end;
//end;


