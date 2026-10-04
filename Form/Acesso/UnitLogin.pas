unit UnitLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.DwmApi,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Loading, Vcl.Session,
  ACBrBase, ACBrEnterTab,
  Data.DB, Datasnap.DBClient,
  DBAccess, Uni,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxButtons, cxLabel, cxGroupBox,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinDevExpressDarkStyle, dxSkinBasic,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.Menus, cxClasses, dxGDIPlusClasses,
  Controller_usuario, Model.Usuario, UnitConfiguracaoBancoDados;

type
  TMarginsDWM = record
    cxLeftWidth: Integer;
    cxRightWidth: Integer;
    cyTopHeight: Integer;
    cyBottomHeight: Integer;
  end;

type
  TFrmLogin = class(TForm)
    ImageBg: TImage;
    ACBrEnterTab1: TACBrEnterTab;
    ds: TUniDataSource;
    TabUsuario: TClientDataSet;
    TabUsuarioid_usuario: TIntegerField;
    TabUsuarionome: TStringField;
    TabUsuariologin: TStringField;
    TabUsuariosenha: TStringField;
    TabUsuarioid_funcionario: TIntegerField;
    cxLookAndFeelController1: TcxLookAndFeelController;
    lblBrand: TcxLabel;
    lblBrand2: TcxLabel;
    lblTitle: TcxLabel;
    lblLogin: TcxLabel;
    edtEmail: TcxLookupComboBox;
    lblSenha: TcxLabel;
    edtSenha: TcxTextEdit;
    btnAcessar: TcxButton;
    btnSair: TcxButton;
    lblConfiguracao: TcxLabel;
    Logo: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure TopBarMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure edtEmailKeyPress(Sender: TObject; var Key: Char);
    procedure lblConfiguracaoClick(Sender: TObject);
  private
    email: string;
    senha: string;
    idusuario: Integer;
    idperfil: Integer;
    nome: string;
    login: string;
    procedure TerminateLogin(Sender: TObject);

    procedure FillRectAlpha(ACanvas: TCanvas; const R: TRect; AColor: TColor; AAlpha: Byte);

  public
  end;

var
  FrmLogin: TFrmLogin;
  ObjUsuario  : TModelUsuario;
  ContUsuario : TUsuarioController;

implementation

{$R *.dfm}

uses
  UConeSul, uJKDialog, Model.ConfNF, UDM,
  UnitPrincipalNew, Controller.LookupHelper, UnitGlobal;

{ Helpers }

procedure TFrmLogin.FillRectAlpha(ACanvas: TCanvas; const R: TRect; AColor: TColor; AAlpha: Byte);
var
  bmp: TBitmap;
  bf: BLENDFUNCTION;
  W, H: Integer;
begin
  W := R.Right - R.Left;
  H := R.Bottom - R.Top;

  if (W <= 0) or (H <= 0) then
    Exit;

  bmp := TBitmap.Create;
  try
    bmp.SetSize(W, H);
    bmp.PixelFormat := pf32bit;
    bmp.Canvas.Brush.Color := AColor;
    bmp.Canvas.FillRect(Rect(0, 0, W, H));

    bf.BlendOp := AC_SRC_OVER;
    bf.BlendFlags := 0;
    bf.SourceConstantAlpha := AAlpha;
    bf.AlphaFormat := 0;

    Winapi.Windows.AlphaBlend(
    ACanvas.Handle, R.Left, R.Top, W, H,
    bmp.Canvas.Handle, 0, 0, W, H,
    bf    );
  finally
    bmp.Free;
  end;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  BorderStyle   := bsNone;
  Position      := poScreenCenter;
  DoubleBuffered := True;

  // Skin
  cxLookAndFeelController1.NativeStyle := False;
  cxLookAndFeelController1.SkinName := 'DevExpressDarkStyle';


  // Password
  edtSenha.Properties.EchoMode := eemPassword;
  edtSenha.Properties.PasswordChar := '●';

  // Botões
  btnAcessar.Caption := 'Acessar';
  btnSair.Caption := 'Sair';

end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin

  try
    TLookupHelper.CarregarLookup(TabUsuario, LookupUsuarioLoginSql);
    edtEmail.SetFocus;
  except
    on E: Exception do
      JKDialog('Erro', 'Ocorreu um erro ao carregar os dados:' + sLineBreak + E.Message, tdErro);
  end;
end;

procedure TFrmLogin.lblConfiguracaoClick(Sender: TObject);
begin
  try
    if not Assigned(FrmConfiguracaoBancodados) then
      FrmConfiguracaoBancodados  := TFrmConfiguracaoBancodados.Create(Application);
      FrmConfiguracaoBancodados.ShowModal;
  finally
    dm.Conn.Close;
    dm.ConexaoBanco;
    TLookupHelper.CarregarLookup(TabUsuario, LookupUsuarioLoginSql);
    cxLookAndFeelController1.NativeStyle := False;
    cxLookAndFeelController1.SkinName := 'DevExpressDarkStyle';
  end;
end;

procedure TFrmLogin.TopBarMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  // arrastar janela (borderless)
  if Button = mbLeft then
  begin
    ReleaseCapture;
    SendMessage(Handle, WM_NCLBUTTONDOWN, HTCAPTION, 0);
  end;
end;

procedure TFrmLogin.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmLogin.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmLogin.edtEmailKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
    edtSenha.SetFocus;
  end;
end;

procedure TFrmLogin.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btnAcessar.Click;
  end;
end;

procedure TFrmLogin.btnAcessarClick(Sender: TObject);
begin
  if (edtEmail.Text = '') or (edtEmail.EditValue= 0) then
  begin
    JKDialog('Aviso', 'Selecione um usuário!', tdAlerta);
    edtEmail.SetFocus;
    Exit;
  end;

  if Trim(edtSenha.Text) = '' then
  begin
    JKDialog('Aviso', 'Informe uma senha!', tdAlerta);
    edtSenha.SetFocus;
    Exit;
  end;

  TLoading.Show(Self);

  TLoading.ExecuteThread(
    procedure
    begin
      ObjUsuario  := nil;
      ContUsuario := nil;

      ObjUsuario  := TModelUsuario.Create;
      ContUsuario := TUsuarioController.Create;

      Try
        ObjUsuario    := ContUsuario.ValidarLoginAcesso(edtemail.Text, TConeSul.Crypt('C',Trim(edtsenha.Text)));
        if Assigned(ObjUsuario) then
        begin
          idusuario := ObjUsuario.idusuario;
          nome      := ObjUsuario.nome;
          email     := ObjUsuario.email;
          senha     := ObjUsuario.senha;
          login     := ObjUsuario.login;
          idperfil  := ObjUsuario.idperfil;
        end
        else
        begin
          idusuario := 0;
          nome := '';
          email := '';
          senha := '';
          login := '';
          idperfil := 0;
        end;
      Finally
        FreeAndNIl(ObjUsuario);
        FreeAndNIl(ContUsuario);
      End;
    end,
    TerminateLogin
  );
end;

procedure TFrmLogin.TerminateLogin(Sender: TObject);
var
  ModelConf: TModelConfNF;
  oneAssociacao: String;
  oneSindicado: String;
  oneGaragem: String;
  onePedido: String;
  oneLocacao: String;
  oneEstoque: string;
  oneOrdemServico: String;
begin
  TLoading.Hide;

  if Sender is TThread then
    if Assigned(TThread(Sender).FatalException) then
    begin
      ShowMessage(Exception(TThread(Sender).FatalException).Message);
      Exit;
    end;

  // Mantive sua validação final (mesma essência)
  if edtEmail.Text <> login then
  begin
    JKDialog('Aviso', 'Verifique o login/senha informado!', tdAlerta);
    edtEmail.SetFocus;
    Exit;
  end;

  if TConeSul.Crypt('C', edtSenha.Text) <> senha then
  begin
    JKDialog('Aviso', 'Verifique o login/senha informado!', tdAlerta);
    edtSenha.SetFocus;
    Exit;
  end;

  TSession.ID_USUARIO       := idusuario;
  TSession.idperfiluser     := idperfil;
  TSession.EMAIL            := email;
  TSession.NOME             := nome;
  Tsession.versaosys        := TConesul.GetAppVersion;
  Tsession.localsys         := TConesul.ObterNomeDaMaquina + ' / ' + Tconesul.ObterEnderecoIPDaMaquina;

  ModelConf := TModelConfNF.Create;
  try
    if ModelConf.OneRamoEmpresa(oneAssociacao, oneSindicado,
      oneGaragem, onePedido, oneLocacao, oneEstoque, oneOrdemServico, TSession.IDEMPRESA) then
    begin
      Tsession.oneAssociacao := oneAssociacao;
      Tsession.oneSindicado := oneSindicado;
      Tsession.oneGaragem := oneGaragem;
      Tsession.onePedido := onePedido;
      Tsession.oneLocacao := oneLocacao;
      TSession.oneEstoque := oneEstoque;
      TSession.oneOrdemServico := oneOrdemServico;
    end;
  finally
    ModelConf.Free;
  end;

  if not Assigned(FrmPrincipalNew) then
    Application.CreateForm(TFrmPrincipalNew, FrmPrincipalNew);

  cxLookAndFeelController1.SkinName := 'Office2019Colorful';
  FrmPrincipalNew.Show;
  Close;
end;

end.

