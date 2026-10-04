unit UnitFrmEmail;

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
  cxCustomListBox, cxListBox, ACBrBase, ACBrMail, ACBrEnterTab;

type
  TFrmEnviarEmail = class(TForm)
    lblTitulo: TLabel;
    Paneltitulo: TPanel;
    cxGroupBox1: TcxGroupBox;
    _BtnPanelCancelar: TPanel;
    btnCancelar: TSpeedButton;
    _PanelEnviar: TPanel;
    btnSalvar: TSpeedButton;
    Label1: TLabel;
    edtemail: TcxTextEdit;
    Label2: TLabel;
    edtAssunto: TcxTextEdit;
    edtMensagem: TcxTextEdit;
    Label3: TLabel;
    EdtAnexo: TcxListBox;
    Label4: TLabel;
    ACBrMail1: TACBrMail;
    _add: TPanel;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    SpeedButton2: TSpeedButton;
    ACBrEnter: TACBrEnterTab;
    edtcopia: TcxTextEdit;
    Label5: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalvarClick(Sender: TObject);
  private
    Function ValidarCampos(out msg: string):Boolean;
    Function Enviar(out msg:string):boolean;
    function ConfigurarACBR(out msg:string):boolean;
    { Private declarations }
  public
    AnexaArquivo:Boolean;
    vTituloAnexo:string;
    nmPessoa    :String;
    { Public declarations }
  end;

var
  FrmEnviarEmail: TFrmEnviarEmail;

implementation

{$R *.dfm}

uses uJKDialog, Model.Email, Vcl.Session, UConeSul;

procedure TFrmEnviarEmail.btnCancelarClick(Sender: TObject);
begin
    TNavigation.Close(Self);
end;

procedure TFrmEnviarEmail.btnSalvarClick(Sender: TObject);
var
msg:string;
begin
  if ValidarCampos(msg) then
  begin
    Try
       if Enviar(msg) then
        begin
          JKDialog('Sucesso','Email enviado para '+edtemail.Text, tdSucesso);
          FrmEnviarEmail.Close;
          //TNavigation.Close(Self);
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

function TFrmEnviarEmail.Enviar(out msg: string): boolean;
var
Mensagem:Tstrings;
I:integer;
begin
  Result  := False;
  Try
    if ConfigurarACBR(msg) then
    begin
      //Preparar envio
      Try
        mensagem        := TstringList.Create;
        mensagem.Add(edtMensagem.Text);

        if AnexaArquivo then
        begin
          ACBrMail1.Subject           := EdtAssunto.Text;
          ACBrMail1.AltBody.Add('Enviado P/ ' + nmPessoa);
          ACBrMail1.AltBody.Add(edtMensagem.Text);
          ACBrMail1.ClearAttachments;
          for i := 0 to EdtAnexo.Items.Count - 1 do
          begin
            ACBrMail1.AddAttachment(EdtAnexo.Items.Strings[i], vTituloAnexo);
          end;
          ACBrMail1.Send(false);
        end;
        Result  := True;
      Finally
        Mensagem.free;
      End;

    end;
  Except on e:exception do
    begin
      msg :=e.Message;
      raise;
    end;
  End;
end;

function TFrmEnviarEmail.ConfigurarACBR(out msg:string):boolean;
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

        ACBrMail1.Host            := Email.smtp;
        ACBrMail1.Username        := LowerCase(email.email);
        ACBrMail1.From            := LowerCase(email.email);
        ACBrMail1.Password        := TConeSul.Crypt('D',Email.Senha);
        ACBrMail1.Port            := InttoStr(Email.porta);

        ACBrMail1.DefaultCharset  := TMailCharset(27);
        ACBrMail1.IDECharset      := TMailCharset(15);

        ACBrMail1.IsHTML          := true;

        ACBrMail1.SetSSL          := false;
        ACBrMail1.SetTLS          := false;

        if Email.SSL = 'S' then
          ACBrMail1.SetSSL        := true;
        if email.TLS = 'S' then
          ACBrMail1.SetTLS        := true;

        para := LowerCase(edtEmail.Text);
        ACBrMail1.AddAddress(para, '...');
        if edtcopia.Text <>'' then
        ACBRMail1.AddCC(edtcopia.Text,'...');

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

procedure TFrmEnviarEmail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    FrmEnviarEmail := nil;
end;

function TFrmEnviarEmail.ValidarCampos(out msg: string): Boolean;
begin
  Result  := true;

  if edtemail.Text='' then
  begin
    msg     := 'Informe um email!';
    Result  := False;
    exit;
  end;

  if edtassunto.Text='' then
  begin
    msg     := 'Informe um assunto!';
    Result  := False;
    exit;
  end;

  if edtmensagem.Text='' then
  begin
    msg     := 'Informe uma mensagem!';
    Result  := False;
    exit;
  end;


end;

end.
