unit UnitPesqEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormNovoBasePesquisa, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic,
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
  dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData,
  cxContainer, System.ImageList, Vcl.ImgList, cxImageList, Vcl.Menus, DBAccess,
  Uni, ACBrBase, ACBrEnterTab, cxMaskEdit, cxDropDownEdit, dxGDIPlusClasses,
  Vcl.ExtCtrls, cxTextEdit, cxGroupBox, Vcl.Buttons, Vcl.StdCtrls, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Controller.Empresa, model.Empresas, dxmdaset,
  Vcl.ButtonStylesAttributes, Vcl.StyledButton;

type
  TFormPesqEmpresa = class(TFormNovoBasePesquisa)
    mdPesquisa: TdxMemData;
    mdPesquisaid_empresa: TIntegerField;
    mdPesquisarazao: TStringField;
    mdPesquisafantasia: TStringField;
    mdPesquisacep: TStringField;
    mdPesquisaendereco: TStringField;
    mdPesquisanumero: TStringField;
    mdPesquisabairro: TStringField;
    mdPesquisacnpj: TStringField;
    mdPesquisaie: TStringField;
    mdPesquisatelefone: TStringField;
    mdPesquisawhatsapp: TStringField;
    GridRecId: TcxGridDBColumn;
    Gridid_empresa: TcxGridDBColumn;
    Gridrazao: TcxGridDBColumn;
    Gridfantasia: TcxGridDBColumn;
    Gridcep: TcxGridDBColumn;
    Gridendereco: TcxGridDBColumn;
    Gridnumero: TcxGridDBColumn;
    Gridbairro: TcxGridDBColumn;
    Gridcnpj: TcxGridDBColumn;
    Gridie: TcxGridDBColumn;
    Gridtelefone: TcxGridDBColumn;
    Gridwhatsapp: TcxGridDBColumn;
    N2: TMenuItem;
    btnConfigSistema: TMenuItem;
    btnConfigEmail: TMenuItem;
    btnDispositivo: TMenuItem;
    N3: TMenuItem;
    btnLimpardados: TMenuItem;
    N4: TMenuItem;
    BtnCredencial: TMenuItem;
    btnSincronizarapp: TMenuItem;
    N5: TMenuItem;
    btnSincronizarEmpresa: TMenuItem;
    procedure btnLimparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfigSistemaClick(Sender: TObject);
    procedure btnConfigEmailClick(Sender: TObject);
    procedure btnDispositivoClick(Sender: TObject);
    procedure btnLimpardadosClick(Sender: TObject);
    procedure BtnCredencialClick(Sender: TObject);
  private
    function CriaRegistroConfig(out msg: string; out idconf: integer): boolean;
    function BuscarConfigEmail(id: integer): Boolean;
    { Private declarations }
  public
    { Public declarations }
    Procedure Novo        ;override;
    Procedure Pesquisa    ;override;
    Procedure Editar      ;override;
    Procedure Excluir     ;override;
    Procedure Listagem    ;override;
    Procedure Relatorio   ;override;
  end;

var
  FormPesqEmpresa : TFormPesqEmpresa;
  ContEmpresa     : TEmpresaController;
implementation

uses UnitCadEmpresa, System.Generics.Collections, uJKDialog,
  Vcl.PermissaoUsuario, Vcl.Session, uConfiguracaoService, UnitConfiguracao,
  Model.ConfNF, Model.Email, UnitEmailCad, Vcl.Validacoes, UnitQrCodeWhatsApp,
  UDM;

{$R *.dfm}

Function TFormPesqEmpresa.CriaRegistroConfig(out msg:string; out idconf:integer):boolean;
var
Model : TModelConfNf;
smg:string;
begin
  Try
    Model       := TModelConfNf.Create;

    Model.NfeAmbiente     := 0;

    if Model.Insert(smg, idconf) then
    result  := True
    else
    result  := False;

  Finally
    Model.free;
  End;
end;

Function TFormPesqEmpresa.BuscarConfigEmail(id:integer):Boolean;
var
Email : TModelEmail;
smg:string;
begin
  Try
    Email       := Tmodelemail.Create;

    email.idempresa   := id;

    if Email.Select(smg) then
    result  := True
    else
    result  := False;

  Finally
    Email.free;
  End;
end;

procedure TFormPesqEmpresa.btnConfigEmailClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Empresa');

  if Permissao.TemPermissao('Permitir Configurar Email') then
  begin
    // Configurar email
    if not mdPesquisa.Eof then
    begin
      Try
        if BuscarConfigEmail(ds.DataSet.FieldByName('id_empresa').AsInteger) then
        begin
          if not Assigned(FrmEmailCad) then
          begin
            FrmEmailCad             := TFrmEmailCad.Create(Application);
            //FrmEmailCad.ParamsStr   := 'E';
            //FrmEmailCad.ParamsInt   := mdPesquisaid_empresa.AsInteger;
            FrmEmailCad.ShowModal;
          end;

        end
        else
        begin
          FrmEmailCad             := TFrmEmailCad.Create(Application);
            //FrmEmailCad.ParamsStr   := 'N';
            //FrmEmailCad.ParamsInt   := mdPesquisaid_empresa.AsInteger;
          FrmEmailCad.Show;

        end;

      except on e:exception do
        begin
          JKDialog('Erro','Erro ao abrir a tela de configuração.'+#13+e.Message, tdErro);
          exit;
        end;
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
end;

procedure TFormPesqEmpresa.btnConfigSistemaClick(Sender: TObject);
var
idconfig:integer;
msg:string;
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Empresa');

  if Permissao.TemPermissao('Permitir Configurar Sistema') then
  begin
    if not mdPesquisa.Eof then
    begin
      Try

        if TConfiguracaoService.RetornoIDConfig(idconfig,mdPesquisaId_empresa.AsInteger) then
        begin
          if not Assigned(FrmConfiguracao) then
          begin
            FrmConfiguracao             := TFrmConfiguracao.Create(Application);
            FrmConfiguracao.ParamsStr   := 'E';
            FrmConfiguracao.ParamsInt   := mdPesquisaid_empresa.AsInteger;
            FrmConfiguracao.ShowModal;
          end;
        end
        else
        begin
          if CriaRegistroConfig(msg,idconfig) then
          begin
            FrmConfiguracao             := TFrmConfiguracao.Create(Application);
            //FrmConfiguracao.ParamsStr   := 'E';
            //FrmConfiguracao.ParamsInt   := idconfig;
            FrmConfiguracao.Show;
          end;
        end;

      except on e:exception do
        begin
          JKDialog('Erro','Erro ao abrir a tela de configuração.'+#13+e.Message, tdErro);
          exit;
        end;
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

end;

procedure TFormPesqEmpresa.BtnCredencialClick(Sender: TObject);
begin
  //habilitar empresa
  if not mdPesquisa.Eof then
  begin
    if JKDialog('Aviso', 'Deseja Habilita/Desabilitar na web o registro selecionado?', tdMensagem)  then
    begin
      Try
        ContEmpresa    := Nil;
        ContEmpresa    := TEmpresaController.Create;

        Try
          if ContEmpresa.HabilitarDesabilitarWeb(mdPesquisaid_empresa.AsInteger) then
          JKDialog('Sucesso','Empresa habilitada com sucesso', tdsucesso)
          else
          JKDialog('Alerta','Empresa já habilitada.', tdAlerta);
        Finally
          FreeAndNil(ContEmpresa);
        End;

      except on e:exception do
        begin
          JKDialog('Erro','Erro ao habilitar/desabilitar o registro.'+#13+e.Message, tdErro);
          exit;
        end;
      end;

    end;

  end
  else
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  end;
end;

procedure TFormPesqEmpresa.btnDispositivoClick(Sender: TObject);
var
ModelVal  :TValidacao;
Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Empresa');

  if Permissao.TemPermissao('Permitir Conectar Dispositivo') then
  begin
    //Conectar Whast
    if not mdPesquisa.Eof then
    begin
      Try

        //Validar para ver se está habilitado para usar o zap
        ModelVal      := TValidacao.create;
        Try
          if not ModelVal.ValidarUsoWhatsApp(mdPesquisaid_empresa.AsInteger) then
          begin
            JKDialog('Aviso','Função não habilitada!', tdAlerta);
            exit;
          end;
        Finally
          ModelVal.free;
        End;


        //validar tipo de conexao
        ModelVal      := TValidacao.create;
        Try
          if ModelVal.InstanciaPorFunc(mdPesquisaid_empresa.AsInteger) then
          begin
            JKDialog('Aviso','Sistema configurado para conectar por funcionário!', tdAlerta);
            exit;
          end;
        Finally
          ModelVal.free;
        End;

        if not Assigned(FrmQrCodeWhatsApp) then
        begin
          FrmQrCodeWhatsApp             := TFrmQrCodeWhatsApp.Create(Application);
          FrmQrCodeWhatsApp.ParamsStr   := '';
          FrmQrCodeWhatsApp.ParamInt    := mdPesquisaid_empresa.AsInteger;
          FrmQrCodeWhatsApp.ShowModal;
        end;

      except on e:exception do
        begin
          JKDialog('Erro','Erro ao abrir a tela de configuração.'+#13+e.Message, tdErro);
          exit;
        end;
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
end;

procedure TFormPesqEmpresa.btnLimparClick(Sender: TObject);
begin
  inherited;
  mdPesquisa.Close;
end;

procedure TFormPesqEmpresa.btnLimpardadosClick(Sender: TObject);
var
senha :String;
SenhaCorreta:String;
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Empresa');

  if Permissao.TemPermissao('Permitir Limpar Dados') then
  begin
    //Limpar dados só com senha
    SenhaCorreta:= 'hd860412';

    if JKDialog('Aviso', 'Confirmar limpar os dados do banco?', tdMensagem)  then
    begin
      Senha   := inputBox('Senha', 'Digite sua senha master:','');
      if (senha <> '') and (senha =SenhaCorreta) then
      begin
        Try
          dm.LimparBancoDados;
        Finally
          JKDialog('Sucesso','Banco limpo. Saia do sistema', tdSucesso);
        End;
      end
      else
      begin
        JKDialog('Alerta','Verifique a senha digitada!', tdAlerta);
      end;
    end;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFormPesqEmpresa.Editar;
begin
  inherited;
  if not mdPesquisa.Eof then
  begin
    if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
    begin
      Try
        if not Assigned(FrmCadEmpresa) then
        FrmCadEmpresa             := TFrmCadEmpresa.Create(Application);
        FrmCadEmpresa.ParamsStr   := 'E';
        FrmCadEmpresa.ParamsInt   := mdPesquisaid_empresa.AsInteger;
        FrmCadEmpresa.Show;

      except on e:exception do
        begin
          JKDialog('Erro','Erro ao editar o registro.'+#13+e.Message, tdErro);
          exit;
        end;
      end;
    end;
  end
  else
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  end;
end;

procedure TFormPesqEmpresa.Excluir;
begin
  inherited;
  if not mdPesquisa.Eof then
  begin
    if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
    begin
      Try
        ContEmpresa    := Nil;
        ContEmpresa    := TEmpresaController.Create;

        Try
          if ContEmpresa.ExcluidoCancelado(mdPesquisaid_empresa.AsInteger) then
          JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
        Finally
          FreeAndNil(ContEmpresa);
        End;

      except on e:exception do
        begin
          JKDialog('Erro','Erro ao excluir o registro.'+#13+e.Message, tdErro);
          exit;
        end;
      end;

    end;

  end
  else
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  end;
end;

procedure TFormPesqEmpresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FormPesqEmpresa   := Nil;
end;

procedure TFormPesqEmpresa.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;
end;

procedure TFormPesqEmpresa.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'Empresa';
  TitleText   := 'Pesquisa Empresa';
end;

procedure TFormPesqEmpresa.Listagem;
begin
  inherited;
  JKDialog('Alerta','Funcionalidade em desenvolvimento.', tdAlerta);
end;

procedure TFormPesqEmpresa.Novo;
begin
  inherited;
  if not Assigned(FrmCadEmpresa) then
    FrmCadEmpresa := TFrmCadEmpresa.Create(Application);
  FrmCadEmpresa.ParamsStr  := 'N';
  FrmCadEmpresa.Show;
end;

procedure TFormPesqEmpresa.Pesquisa;
var
List    : TObjectList<TEmpresa>;
nCampo, nSituacao  : String;
begin
  inherited;
  List    := Nil;
  nCampo  := '';

  if trim(edtBusca.Text) <> '' then
  begin
    nCampo     := Trim(edtBusca.Text);
  end;

  case cxAtivo.ItemIndex of
    1: nSituacao := 'S';
    2: nSituacao := 'N';
  end;

  ContEmpresa      := TEmpresaController.Create;

  Try
    List  := ContEmpresa.ListarTodos(nCampo, nSituacao);

    mdPesquisa.Close;
    mdPesquisa.FieldDefs.Clear;

    if (List = nil) or (List.Count = 0) then
    begin
      mdPesquisa.Close;
      JKDialog('Aviso','Nenhum registro encontrado!', tdAlerta);
      exit;
    end;

    if not mdPesquisa.Active then
      mdPesquisa.Open;

    mdPesquisa.DisableControls;

    for var Item in List do
    begin
      mdPesquisa.Append;

      mdPesquisaid_empresa.AsInteger      := Item.id_empresa;
      mdPesquisarazao.AsString            := Item.razao;
      mdPesquisafantasia.AsString         := Item.fantasia;
      mdPesquisacep.AsString              := Item.cep;
      mdPesquisaendereco.AsString         := Item.endereco;
      mdPesquisanumero.AsString           := Item.numero;
      mdPesquisabairro.AsString           := Item.bairro;
      mdPesquisacnpj.AsString             := Item.cnpj;
      mdPesquisaie.AsString               := Item.ie;
      mdPesquisatelefone.AsString         := Item.telefone;
      mdPesquisawhatsapp.AsString         := Item.whatsapp;

      mdPesquisa.Post;

    end;
    mdPesquisa.First;
    mdPesquisa.EnableControls;

  Finally
    FreeAndNil(ContEmpresa);
    if Assigned(List) then
      List.Free;
  End;
end;

procedure TFormPesqEmpresa.Relatorio;
begin
  inherited;
  JKDialog('Alerta','Funcionalidade em desenvolvimento.', tdAlerta);
end;

end.
