unit UnitAlterarSenha;

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
  cxGroupBox, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, UFormNovoBaseDiversos,
  Data.DB, DBAccess, Uni,
  Controller_usuario, Vcl.ButtonStylesAttributes,
  Vcl.StyledButton, uJKDialog, uConfiguracaoService, UConeSul, cxStyles,
  cxGridTableView, cxClasses;

type
  TFrmAlterarSenha = class(TFormNovoBaseDiversos)
    Label12: TLabel;
    cxSenha: TcxTextEdit;
    Label1: TLabel;
    cxNova: TcxTextEdit;
    Label2: TLabel;
    cxconfirma: TcxTextEdit;
    BtnSalvar: TStyledBitBtn;
    BtnCancelar: TStyledBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
  private
    function Salvar(out msg: string): Boolean;
    function ValidarCampos(out msg: string): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAlterarSenha: TFrmAlterarSenha;
  ContUsuario : TUsuarioController;
implementation

{$R *.dfm}

uses Vcl.Session;

{ TFrmAlterarSenha }

procedure TFrmAlterarSenha.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmAlterarSenha.BtnSalvarClick(Sender: TObject);
var
msg:string;
begin
  inherited;
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

procedure TFrmAlterarSenha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmAlterarSenha := nil;
end;

procedure TFrmAlterarSenha.FormShow(Sender: TObject);
begin
  inherited;
  Try
    TitleText   := 'Alterar senha';
    cxsenha.SetFocus;

  Except on e:exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  End;
end;

function TFrmAlterarSenha.Salvar(out msg: string): Boolean;
begin
  try
    Result            := False;
    ContUsuario       := Nil;

    ContUsuario       := TUsuarioController.Create;

    Try
      if ContUsuario.AlterarSenha(msg, TConeSul.Crypt('C',Trim(cxnova.Text)), TConeSul.Crypt('C',Trim(cxSenha.Text)), TSession.ID_USUARIO) then
      begin
        Result  := True;

        if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
        begin
          TConfiguracaoService.SincronizarGravar(15, TSession.ID_USUARIO);
        end;
      end;

    Finally
      FreeAndNil(ContUsuario);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmAlterarSenha.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;
  Try
    if (cxsenha.Text ='') or (Length(cxsenha.Text) < 3) then
    begin
      msg     := 'Informe a senha antiga corretamente!';
      Result  := False;
      Exit;
    end;

    if (cxnova.Text ='') or (Length(cxnova.Text) < 3) then
    begin
      msg     := 'Tamanho minino para senha nova e de 3!';
      Result  := False;
      Exit;
    end;

    if (cxconfirma.Text ='') or (Length(cxconfirma.Text) < 3) then
    begin
      msg     := 'Verifique a senha de confirmação!';
      Result  := False;
      Exit;
    end;

    if (cxNova.Text <> cxconfirma.Text) then
    begin
      msg     := 'Senha informada não confere!';
      Result  := False;
      Exit;
    end;

  Except on e:exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  End;
end;

end.
