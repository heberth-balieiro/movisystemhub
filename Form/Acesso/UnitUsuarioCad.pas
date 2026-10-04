unit UnitUsuarioCad;

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
  ACBrBase, ACBrEnterTab, Data.DB, DBAccess, Uni, cxCheckBox,
  UnitBaseNovoCadastro, Vcl.ButtonStylesAttributes, Vcl.StyledButton, dxBevel,
  Controller_usuario, Model.Usuario, UConeSul, Datasnap.DBClient,
  Controller.LookupHelper, UnitGlobal, cxStyles, cxGridTableView, cxClasses;

type
  TFrmUsuarioCad = class(TFormNovoBaseCadastro)
    Label5: TLabel;
    cxcodigo: TcxTextEdit;
    Label22: TLabel;
    cxnome: TcxTextEdit;
    cxlogin: TcxTextEdit;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    cxsede: TcxLookupComboBox;
    cxsenha1: TcxTextEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label1: TLabel;
    cxperfil: TcxLookupComboBox;
    cxfuncionario: TcxLookupComboBox;
    cxativo: TcxCheckBox;
    cxSenha: TcxTextEdit;
    Label8: TLabel;
    cxemail: TcxTextEdit;
    dsPerfil: TUniDataSource;
    dsfuncionario: TUniDataSource;
    TabSede: TClientDataSet;
    TabSedeid_sede: TIntegerField;
    TabSederazao: TStringField;
    TabSedefantasia: TStringField;
    TabSedecnpj: TStringField;
    TabSedecelular: TStringField;
    TabSedesedeprincipal: TStringField;
    TabSedensede: TStringField;
    TabPerfil: TClientDataSet;
    TabPerfilid_perfil: TIntegerField;
    TabPerfilcodigo: TIntegerField;
    TabPerfildescricao: TStringField;
    TabPerfilnperfil: TStringField;
    TabFuncionario: TClientDataSet;
    TabFuncionarioid_funcionario: TIntegerField;
    TabFuncionariofunc: TStringField;
    TabFuncionariocpf: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    
  private

    { Private declarations }
  public
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;
    { Public declarations }
  end;

var
  FrmUsuarioCad: TFrmUsuarioCad;
  ContUsuario : TUsuarioController;
  ObjUsuario  : TModelUsuario;

implementation

{$R *.dfm}

Uses Vcl.Session, uJKDialog, uConfiguracaoService;

procedure TFrmUsuarioCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmUsuarioCad := nil;
end;

procedure TFrmUsuarioCad.FormShow(Sender: TObject);
begin
  inherited;
  Try
    TLookupHelper.CarregarLookup(
                  TabSede,LookupSedeSql);

    TLookupHelper.CarregarLookup(
                  TabPerfil,LookupPerfilSql);

    TLookupHelper.CarregarLookup(
                  TabFuncionario,LookupFuncionarioSql);

    if ParamsStr = 'N' then
    begin
      TitleText   := 'Novo Usuário';
      cxNome.SetFocus;
    end
    else
    begin
      label12.Visible   := False;
      label13.Visible   := false;
      cxsenha.Visible   := false;
      cxsenha1.Visible  := false;
      label14.Left      := 6;
      cxsede.Left       := 6;
      cxsede.Width      := 638;
      TitleText   := 'Editar Usuário';
      PopularCampos;
    end;

  Except on e:exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  End;
end;

procedure TFrmUsuarioCad.PopularCampos;
begin
  inherited;
  try
    ObjUsuario        := Nil;
    ContUsuario       := Nil;

    ObjUsuario        := TModelUsuario.Create;
    ContUsuario       := TUsuarioController.Create;
    Try

        ObjUsuario    := ContUsuario.BuscarPorID(ParamsInt);
        if Assigned(ObjUsuario) then
        begin
          cxcodigo.EditValue        := ObjUsuario.idusuario;
          cxnome.EditValue          := ObjUsuario.nome;
          cxlogin.EditValue         := ObjUsuario.login;
          cxsede.EditValue          := ObjUsuario.idsede;
          cxemail.EditValue         := ObjUsuario.email;
          cxperfil.EditValue        := ObjUsuario.idperfil;
          cxfuncionario.EditValue   := ObjUsuario.idfunc;
          cxativo.EditValue         := ObjUsuario.ativo;

          cxnome.SetFocus;
        end
        else
        begin
          JKDialog('Aviso','Não foi possivel carregar os dados.', tdAlerta);
          exit;
        end;

    Finally
      FreeAndNil(ObjUsuario);
      FreeAndNil(ContUsuario);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmUsuarioCad.Salvar(out msg: string): Boolean;
var
AId:Integer;
begin
  try
    Result            := False;
    ObjUsuario        := Nil;
    ContUsuario       := Nil;

    ObjUsuario        := TModelUsuario.Create;
    ContUsuario       := TUsuarioController.Create;

    Try
      if ParamsStr='N' then
      ObjUsuario.idusuario      := 0
      else
      ObjUsuario.idusuario      := ParamsInt;
      ObjUsuario.nome           := Trim(cxnome.Text);
      ObjUsuario.login          := Trim(cxlogin.Text);
      if ParamsStr='N' then
      ObjUsuario.senha          := TConeSul.Crypt('C',Trim(cxsenha.Text));
      ObjUsuario.idempresa      := TSession.IDEMPRESA;
      ObjUsuario.idsede         := cxsede.EditValue;
      ObjUsuario.ativo          := cxativo.EditValue;
      ObjUsuario.email          := Trim(cxemail.Text);
      ObjUsuario.sistema        := 'N';
      ObjUsuario.idperfil       := cxperfil.EditValue;
      ObjUsuario.idfunc         := cxfuncionario.EditValue;
      ObjUsuario.sinc_app       := 'S';

      if ContUsuario.Salvar(ObjUsuario, AId) then
      begin
        if AID = 0 then
        AID     := ParamsInt;
        msg     := 'Registro salvo com sucesso, ID: '+IntToStr(AId);

        if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
        begin
          if ParamsStr='N' then
            TConfiguracaoService.SincronizarGravar(15, AId)
          else
            TConfiguracaoService.SincronizarGravar(15, ParamsInt);
        end;
        Result  := true;
        ParamsCloseTela := 'S';
      end;
    Finally
      FreeAndNil(ContUsuario);
      FreeAndNil(ObjUsuario);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmUsuarioCad.ValidarCampos(out msg: string): Boolean;
begin
  try
    Result  := True;

    if (cxnome.Text='') then
    begin
      msg     := 'Informe o nome do usuário!';
      result  := False;
      Exit;
    end;

    if (cxlogin.Text='') then
    begin
      msg     := 'Informe um login!';
      result  := False;
      Exit;
    end;

    if ParamsStr = 'N' then
    begin
      if (cxsenha.Text ='') or (Length(cxsenha.Text) < 3) then
      begin
        msg     := 'Tamanho minino para senha e de 3!';
        Result  := False;
        Exit;
      end;

      if (cxsenha.Text <>cxsenha1.Text) then
      begin
        msg     := 'Senha informada não confere!';
        Result  := False;
        Exit;
      end;
    end;

    if (cxsede.Text= '') or (cxsede.EditValue=0) then
    begin
      msg     := 'Selecione uma sede!';
      result  := False;
      Exit;
    end;

    if (cxemail.Text='') then
    begin
      msg     := 'Informe um email!';
      result  := False;
      Exit;
    end;

    if (cxperfil.Text= '') or (cxperfil.EditValue=0) then
    begin
      msg     := 'Selecione um perfil!';
      result  := False;
      Exit;
    end;

    if TConfiguracaoService.ValidarUsuarioLoginExit(Trim(cxlogin.Text),ParamsInt) then
    begin
      msg     := 'Já existe um usuário com esse login. Informe outro.!';
      result  := False;
      Exit;
    end;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

end.
