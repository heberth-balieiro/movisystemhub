unit UnitLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Loading, Vcl.Session, ACBrBase, ACBrEnterTab,
  dxGDIPlusClasses, cxGraphics, cxControls, cxLookAndFeels,
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
  dxSkinXmas2008Blue, Data.DB, DBAccess, Uni, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Datasnap.DBClient;

type
  TFrmLogin = class(TForm)
    Image1: TImage;
    pLogin: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PanelAcessar: TPanel;
    Label4: TLabel;
    PanelLogin: TPanel;
    PanelSenha: TPanel;
    edtSenha: TEdit;
    btnAcessar: TSpeedButton;
    ACBrEnterTab1: TACBrEnterTab;
    _panelCancelar: TPanel;
    btncancelar: TSpeedButton;
    ds: TUniDataSource;
    edtEmail: TcxLookupComboBox;
    TabUsuario: TClientDataSet;
    TabUsuarioid_usuario: TIntegerField;
    TabUsuarionome: TStringField;
    TabUsuariologin: TStringField;
    TabUsuariosenha: TStringField;
    TabUsuarioid_funcionario: TIntegerField;
    procedure btnAcessarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure edtEmailKeyPress(Sender: TObject; var Key: Char);
  private
    email:string;
    senha:string;
    idusuario:integer;
    idperfil:integer;
    nome:string;
    login:string;
    procedure TerminateLogin(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses UnitPrincipal, model.Usuario, UConeSul, uJKDialog, Model.ConfNF, UDM,
  UnitPrincipalNew, Controller.LookupHelper, UnitGlobal;

procedure TFrmLogin.btncancelarClick(Sender: TObject);
begin
  //Sair
  Application.Terminate;
end;

procedure TFrmLogin.edtEmailKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
    edtsenha.SetFocus;
  end;
end;

procedure TFrmLogin.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btnacessar.Click;
  end;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  Try
    TLookupHelper.CarregarLookup(
                  TabUsuario,LookupUsuarioLoginSql);
     edtEmail.SetFocus;
  except on e:exception do
    begin
      JKDialog('Erro','Ocorreu um erro ao carregar os dados:'+#13+e.Message, tdErro);
    end;
  End;
 end;

procedure TFrmLogin.TerminateLogin(Sender: TObject);
var
ModelConf :TModelConfNF;
oneAssociacao :String;
oneSindicado  :String;
oneGaragem    :String;
onePedido     :String;
oneLocacao    :String;
oneEstoque    :string;
oneOrdemServico : String;
begin
    TLoading.Hide;

    if Sender is TThread then
    if Assigned(TThread(Sender).FatalException) then
    begin
      showmessage(Exception(TThread(sender).FatalException).Message);
      exit;
    end;

    // Dados de acesso...
    if edtemail.Text <> login then
    begin
      JKDialog('Aviso','Verifique o login/senha informado!', tdAlerta);
      edtemail.SetFocus;
      exit;
    end;

    if TConeSul.Crypt('C',edtsenha.Text) <> senha then
    begin
      JKDialog('Aviso','Verifique o login/senha informado!', tdAlerta);
      edtsenha.SetFocus;
      exit;
    end;

    TSession.ID_USUARIO       := idusuario;
    TSession.idperfiluser     := idperfil;
    TSession.EMAIL            := email;
    TSession.NOME             := nome;
    Tsession.versaosys        := TConesul.GetAppVersion;
    Tsession.localsys         := TConesul.ObterNomeDaMaquina+' / '+Tconesul.ObterEnderecoIPDaMaquina;

    ModelConf     := TModelConfNF.create;
    Try
      if ModelConf.OneRamoEmpresa(oneAssociacao,oneSindicado,
                                oneGaragem,onePedido,oneLocacao, oneEstoque, oneOrdemServico, TSession.IDEMPRESA) then
      Tsession.oneAssociacao  := oneAssociacao;
      Tsession.oneSindicado   := oneSindicado;
      Tsession.oneGaragem     := oneGaragem;
      Tsession.onePedido      := onePedido;
      Tsession.oneLocacao     := oneLocacao;
      TSession.oneEstoque     := oneEstoque;
      TSession.oneOrdemServico:= oneOrdemServico;
    Finally
      ModelConf.free;
    End;

    if NOT Assigned(FrmPrincipal) then
        Application.CreateForm(TFrmPrincipalNew, FrmPrincipalNew);

    FrmPrincipalNew.Show;
    close;
end;

procedure TFrmLogin.btnAcessarClick(Sender: TObject);
var
usuario :TModelusuario;
msg:string;
begin

    if (edtemail.Text = '') or (edtemail.EditValue=0) then
    begin
      JKDialog('Aviso','Selecione um usuário!', tdAlerta);
      edtemail.SetFocus;
      exit;
    end;

    if (edtSenha.Text = '') then
    begin
      JKDialog('Aviso','Informe uma senha!', tdAlerta);
      edtSenha.SetFocus;
      exit;
    end;


    TLoading.Show(Self);

    TLoading.ExecuteThread(procedure
    begin
        
      usuario         :=  TModelusuario.Create;
      Try
        if usuario.ValidarLogin(msg,edtemail.Text, edtsenha.Text) then
        begin
          idusuario   := usuario.idusuario;
          nome        := usuario.nome;
          email       := usuario.email;
          senha       := usuario.senha;
          login       := usuario.login;
          idperfil    := usuario.idperfil;
        end
        else
        begin
          idusuario   := 0;
          nome        := '';
          email       := '';
          senha       := '';
          idperfil    := 0;
        end;

      Finally
        usuario.Free;
      End;
    end
    ,TerminateLogin);
end;

end.
