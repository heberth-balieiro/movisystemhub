unit UnitEmailCad;

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
  cxCheckBox, Vcl.Menus, cxButtons, ACBrBase, ACBrEnterTab, ACBrMail,
  UnitBaseNovoCadastro, Data.DB, DBAccess, Uni, dxBevel,
  Vcl.ButtonStylesAttributes, Vcl.StyledButton, cxStyles, cxGridTableView,
  cxClasses, Datasnap.DBClient, Controller.LookupHelper, UnitGlobal;

type
  TFrmEmailCad = class(TFormNovoBaseCadastro)
    Label27: TLabel;
    ACBrMail1: TACBrMail;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtssl: TcxCheckBox;
    edttls: TcxCheckBox;
    MemoResult: TMemo;
    Button1: TButton;
    btnIncluir: TcxButton;
    cxsmtp: TcxTextEdit;
    cxPorta: TcxTextEdit;
    cxEmail: TcxTextEdit;
    cxSenha: TcxTextEdit;
    Label8: TLabel;
    cxMsgpronta: TcxLookupComboBox;
    TabMensagem: TClientDataSet;
    TabMensagemid_mensagem: TIntegerField;
    TabMensagemcodigo: TIntegerField;
    TabMensagemdescricao: TStringField;
    TabMensagemnpesquisa: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnIncluirClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cxPortaKeyPress(Sender: TObject; var Key: Char);
  private
    idemail:integer;
    procedure CarregarDados;
    function Salvar(out msg: string): Boolean;
    function ValidarCampos(out msg: string): Boolean;
    function ConfigurarACBR(out msg: string): boolean;
    procedure EnviarEmail;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEmailCad: TFrmEmailCad;

implementation

{$R *.dfm}

Uses Model.Email, Vcl.Loading, Vcl.Session, uJKDialog, UConeSul,
 IdSMTP, IdMessage, IdSSLOpenSSL, IdExplicitTLSClientServerBase, OAuth2,
  OAuth2.Outlook;

function TFrmEmailCad.ConfigurarACBR(out msg:string):boolean;
var
Email :TModelEmail;
Para:string;
begin
  Result  := False;
  Try
    ACBrMail1.Clear;

    //Pegar as configuracao aplicada
    Email       := TModelEmail.Create;
    Try
      email.idempresa             := TSession.IDEMPRESA;

      if email.Select(msg) then
      begin
        ACBrMail1.FromName        := TSession.RAZAO;

        ACBrMail1.Host            := Trim(cxsmtp.Text);
        ACBrMail1.Username        := LowerCase(cxemail.Text);
        ACBrMail1.From            := LowerCase(cxemail.Text);
        ACBrMail1.Password        := cxsenha.Text;
        ACBrMail1.Port            := cxporta.Text;

        ACBrMail1.DefaultCharset  := TMailCharset(27);
        ACBrMail1.IDECharset      := TMailCharset(15);

        ACBrMail1.IsHTML          := true;

        ACBrMail1.SetSSL          := false;
        ACBrMail1.SetTLS          := false;

        if edtssl.Checked then
          ACBrMail1.SetSSL        := true;
        if edttls.Checked then
          ACBrMail1.SetTLS        := true;

        para := LowerCase(cxEmail.Text);
        ACBrMail1.AddAddress(para, '...');

        result  := true;
      end
      else
      msg := 'Nenhum email configurado!';

    Finally
      Email.Free;
    End;
  Except on e:exception do
    begin
      msg := 'Erro ao configurar o email: '+e.message;
      raise;
    end;
  End;
end;

procedure TFrmEmailCad.cxPortaKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, ['0'..'9', #8, ^V, ^C, ^X]) then
        Key := #0;
end;

procedure TFrmEmailCad.EnviarEmail;
var
  SMTP: TIdSMTP;
  Msg: TIdMessage;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
begin
  SMTP := TIdSMTP.Create(nil);
  Msg := TIdMessage.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    SMTP.IOHandler := SSL;
    SMTP.UseTLS := utUseExplicitTLS;
    SMTP.Host := cxsmtp.Text;
    SMTP.Port := strtoint(cxporta.Text);
    SMTP.Username := cxemail.Text;
    SMTP.Password := cxsenha.Text;

    SSL.SSLOptions.Method := sslvTLSv1_2;
    SSL.SSLOptions.Mode := sslmClient;

    Msg.From.Address := 'diegoheberth@gmail.com';
    Msg.Recipients.EmailAddresses := 'diegoheberth@gmail.com';
    Msg.Subject := 'Teste de Envio';
    Msg.Body.Text := 'Este é um teste de envio de e-mail.';

    SMTP.Connect;
    try
      SMTP.Send(Msg);
    finally
      SMTP.Disconnect;
    end;

  finally
    SSL.Free;
    SMTP.Free;
    Msg.Free;
  end;
end;

procedure TFrmEmailCad.btnIncluirClick(Sender: TObject);
var
msg:string;
begin
  ConfigurarACBR(msg);
  ACBrMail1.Send(false);
  //EnviarEmail;
end;

procedure TFrmEmailCad.btnSalvarClick(Sender: TObject);
var
msg :String;
begin
  //Salvar e validar dados
  if ValidarCampos(msg) then
  begin
    Try
       if Salvar(msg) then
        begin
          JKDialog('Sucesso',msg, tdSucesso);
          TNavigation.Close(Self);
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

procedure TFrmEmailCad.Button1Click(Sender: TObject);
var
  OAuth2: TOAuth2;
  Config: TConfigOAuth;
  AccessToken: string;
  TokenExpiry: TDateTime;
  OutlookAuth: TOutlookOAuth;
begin
  // Configure as credenciais e outras informações do OAuth2
  Config.ClientID := 'd93073d6-c6c4-4f31-91ae-da300a5cc316';
  Config.ClientSecret := '51ffb2b0-888c-4767-8b5c-1a72cb1c0d37';
  Config.AccessToken := '';  // Inicialmente vazio, pois será obtido após a autenticação
  Config.RefreshToken := ''; // Inicialmente vazio
  Config.RedirectionEndpoint := 'http://localhost:3000'; // Endpoint de redirecionamento após autenticação
  Config.TokenExpiry := 0;  // O token não está expirado inicialmente
  Config.OnGenerateToken := nil;  // Defina um evento, se necessário

  // Crie uma instância da classe TOAuth2
  OutlookAuth  := TOutlookOAuth.Create(Config);
  try
    // Chama o método de autenticação e exibe o URL de autenticação
    MemoResult.Lines.Add('Iniciando autenticação...');

    // A autenticação irá abrir o navegador, onde o usuário deve autorizar
    //OAuth2.Authenticate(true);
    OutlookAuth.Authenticate(True);
    // Aguarde a resposta (você pode adicionar lógica para esperar o código de autorização)
    // Após autenticação bem-sucedida, o access token será obtido

    // Acesse o token de acesso obtido
    //AccessToken := OAuth2.getAccessToken;
    //TokenExpiry := OAuth2.getTokenExpiry;

    // Exibe o token e a data de expiração no Memo
    MemoResult.Lines.Add('Access Token: ' + AccessToken);
    MemoResult.Lines.Add('Token Expiry: ' + DateTimeToStr(TokenExpiry));

  finally
    OutlookAuth.Free;
    //OAuth2.Free;  // Libere o objeto após o uso
  end;
end;

procedure TFrmEmailCad.CarregarDados;
var
Email : TModelEmail;
msg:string;
begin

  Try
    try
      Email             := TModelEmail.Create;
      Email.idempresa   := TNavigation.ParamInt;  //buscar o id da empresa que contenha o email configurado

      if Email.Select(msg) then
      begin

        //Popular os campos se ouver
        idemail               := email.idemail;
        cxsmtp.EditValue     := email.smtp;
        cxporta.EditValue    := email.porta;
        cxemail.EditValue    := email.email;
        cxsenha.EditValue    := TConeSul.Crypt('D',email.senha);
        edtssl.EditValue      := email.ssl;
        edttls.EditValue      := email.tls;
        cxMsgpronta.EditValue := email.idmensagem;
      end;

    Except on e:exception do
      begin
        msg := msg+' :'+e.Message;
        raise;
      end;
    end;
  Finally
    email.Free;
  End;
end;

procedure TFrmEmailCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmEmailCad := nil;
end;

procedure TFrmEmailCad.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F10 then
  begin
    btnSalvar.Click;
    key :=0;
  end;

  if key = VK_ESCAPE  then
  begin
    btnCancelar.Click;
    key :=0;
  end;
end;

procedure TFrmEmailCad.FormShow(Sender: TObject);
begin

  TitleText   := 'Configuração de E-mail';

  TLookupHelper.CarregarLookup(
                  TabMensagem,LookupMensagemEmailtabConfigsql);

  if TNavigation.ParamsStr='E' then
  CarregarDados;

  cxsmtp.SetFocus;

end;

function TFrmEmailCad.Salvar(out msg: string): Boolean;
var
Email : TModelemail;
id:integer;
begin
  Result  := False;
  Try
    try
      Email           :=  TModelemail.Create;

      Email.smtp      := trim(cxsmtp.Text);
      Email.porta     := strtoint(cxporta.Text);
      Email.email     := trim(cxemail.Text);
      Email.senha     := TConeSul.Crypt('C',Trim(cxsenha.Text));
      Email.ssl       := edtssl.EditValue;
      email.tls       := edttls.editvalue;
      email.idempresa := TSession.IDEMPRESA;
      email.idmensagem:= cxMsgpronta.EditValue;

      if ParamsStr='N' then
      begin
        if email.Insert(msg, id) then;
        Result  := True;
        ParamsCloseTela := 'S';
      end
      else
      begin
        email.idemail     := idemail;//TNavigation.ParamInt;
        if email.Update(msg) then;
        Result  := True;
        ParamsCloseTela := 'S';
      end;

    Except on e:exception do
      begin
        msg := msg+' :'+e.Message;
        raise;
      end;
    end;
  Finally
    Email.Free;
  End;

end;

function TFrmEmailCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if (cxsmtp.Text ='') or (cxporta.text='') then
  begin
    msg     := 'Informe o servidor de smtp e porta!';
    Result  := False;
    Exit;
  end;

  if (cxemail.Text ='') or (cxsenha.text='') then
  begin
    msg     := 'Informe o email e senha!';
    Result  := False;
    Exit;
  end;


end;

end.
