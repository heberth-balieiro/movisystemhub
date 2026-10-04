unit UnitEmpresaRegistro;

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
  dxGDIPlusClasses, ACBrBase, ACBrEnterTab, Data.DB, DBAccess, Uni,
  ACBrValidador, ACBRUTIL,
  DataSet.Serialize,
  RESTRequest4D,
  DataSet.Serialize.Adapter.RESTRequest4D,
  System.JSON,
  Controller_Sede, Model.Sede,
  Controller_usuario, Model.Usuario,
  Vcl.ButtonStylesAttributes,
  Vcl.StyledButton, Datasnap.DBClient,
  Controller_Perfil, Model.Perfil;

type
  TFrmRegistroEmpresa = class(TForm)
    edtrazao: TcxTextEdit;
    edtcnpj: TcxButtonEdit;
    edtemail: TcxTextEdit;
    edtzap: TcxMaskEdit;
    edtcidade: TcxLookupComboBox;
    edtresponsavel: TcxTextEdit;
    cxGroupBox4: TcxGroupBox;
    Logo: TImage;
    ACBrEnter: TACBrEnterTab;
    dsCidade: TUniDataSource;
    ACBrValidador: TACBrValidador;
    btnSalvar: TStyledBitBtn;
    btnCancelar: TStyledBitBtn;
    Paneltitulo: TPanel;
    lblTitulo: TLabel;
    BtnFechar: TSpeedButton;
    PanelButton: TPanel;
    PanelClient: TPanel;
    Label1: TLabel;
    Label12: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label22: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    TabCidade: TClientDataSet;
    TabCidadeid_cidade: TIntegerField;
    TabCidadecidade: TStringField;
    TabCidadeuf: TStringField;
    TabCidadencidade: TStringField;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtcnpjPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
  private
    Fregcep: String;
    Fregnumero: String;
    Fregcidade: String;
    Fregendereco: String;
    Fregfantasia: String;
    FregBairro: String;
    Freguf: String;

    function Registrar(out msg: string): Boolean;
    //function BuscarURLAPI(out url, usuario, senha: string): Boolean;
    function RegistroOnline(out guid: string): Boolean;

    Property regfantasia  :String read Fregfantasia   write Fregfantasia;
    Property regendereco  :String read Fregendereco   write Fregendereco;
    Property regnumero    :String read Fregnumero     write Fregnumero;
    Property regBairro    :String read FregBairro     write FregBairro;
    Property regcidade    :String read Fregcidade     write Fregcidade;
    Property reguf        :String read Freguf         write Freguf;
    property regcep       :String read Fregcep        write Fregcep;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRegistroEmpresa: TFrmRegistroEmpresa;
  ContSede    : TSedeController;
  ModelSede   : TSede;
  ObjUsuario  : TModelUsuario;
  ContUsuario : TUsuarioController;
  ObjPerfil   : TModelPerfil;
  ContPerfil  : TPerfilController;
implementation

{$R *.dfm}

uses UDM, model.Empresa,
  uRotinasComuns, UConeSul, uJKDialog, Model.ConfNF, Vcl.Session,
  TelaFuncoes, System.IniFiles, Controller.LookupHelper, UnitGlobal;

procedure TFrmRegistroEmpresa.btnCancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmRegistroEmpresa.btnSalvarClick(Sender: TObject);
var
msg:String;
begin
  if (edtcnpj.Text='') then
  begin
    Showmessage('Informe um CNPJ!');

    Exit;
  end;

  if (edtrazao.Text ='') or (Length(edtrazao.Text) < 10) then
  begin
    Showmessage('Informe o nome razão completo!');
    Exit;
  end;

  if (edtemail.Text ='') then
  begin
    Showmessage('Informe um email!');
    Exit;
  end;

  if (edtcidade.Text='') or (edtcidade.EditValue=0) then
  begin
    Showmessage('Informe uma cidade!');
    exit;
  end;

  if (edtresponsavel.Text ='') then
  begin
    Showmessage('Informe o nome do responsável!');
    Exit;
  end;

  Try
    if Registrar(msg) then
    begin
      JKDialog('Sucesso',msg, tdSucesso);
      Application.Terminate;
    end
    else
    JKDialog('Alerta',msg, tdAlerta);
  Except on e:exception do
    begin
      JKDialog('Erro',msg+' :'+e.Message, tdErro);
      raise
    end;
  End;
end;

function TFrmRegistroEmpresa.Registrar(out msg:string):Boolean;
var
Model     : TModelEmpresa;
idempresa, idperfil, idconfig, AIDRetSede :integer;
Config    : TModelConfNF;
Telas     : TTelasFuncoes;
guid      : String;
AId       : Integer;
begin
  Result  := False;
  Model   :=  TModelEmpresa.Create;
  Try

    try
      Model.razao       :=  Trim(edtrazao.Text);
      Model.idcidade    :=  edtcidade.EditValue;
      Model.cnpj        :=  TiraPontos(edtcnpj.Text);
      Model.celular     :=  TiraPontos(edtzap.Text);
      Model.email1      :=  Trim(edtemail.Text);
      model.fantasia    :=  regfantasia;
      Model.endereco    :=  regendereco;
      Model.numero      :=  regnumero;
      Model.bairro      :=  regBairro;
      Model.cep         :=  TiraPontos(regcep);
      //model.tipoatividade:= edttipo.ItemIndex; Removido

      if Model.Insert(msg,idempresa) then
      begin
        Result  := True;

        //criar os dados na temp
        Model.idempresa := idempresa;

        {$REGION 'Registro Temp'}
        if Model.RegistroTemp(msg) then
        begin

          {$REGION 'Registro Sede'}
          ContSede  := nil;
          ModelSede := nil;

          ContSede  := TSedeController.Create;
          ModelSede := TSede.Create;

          Try
            //Registrar Sede Padrao
            ModelSede.razao         := Trim(edtrazao.Text);
            ModelSede.fantasia      := 'SEDE';
            ModelSede.id_cidade     := edtcidade.EditValue;
            ModelSede.cnpj          := TiraPontos(edtcnpj.Text);
            ModelSede.celular       := TiraPontos(edtzap.Text);
            ModelSede.email1        :=  Trim(edtemail.Text);
            ModelSede.sedeprincipal := 'S';
            ModelSede.id_empresa    := idempresa;
            ModelSede.fantasia      :=  regfantasia;
            ModelSede.endereco      :=  regendereco;
            ModelSede.numero        :=  regnumero;
            ModelSede.bairro        :=  regBairro;
            ModelSede.cep           :=  TiraPontos(regcep);

            if ContSede.RegistraSede(ModelSede, AIDRetSede) then
            begin
              //Registrou a empresa com sucesso  criar o usuario
              Result            := True;

              {$REGION 'Registro Configuracao'}
              // Criar o registro de configuração
              Config        := TModelConfNF.Create;

              try
                TSession.IDEMPRESA  := idempresa;
                if Config.Insert(msg,idconfig) then
                begin
                  Result  := True;

                  //carregar dados da tela
                  {$REGION 'Registro Perfil'}
                  Telas := TTelasFuncoes.Create;
                  try
                    // Carregar as telas padrão e inseri-las no banco
                    Telas.InserirTelasNoBanco;
                  finally
                    FreeAndNil(Telas);
                  end;

                  //Criar o perfil

                  ObjPerfil   := nil;
                  ContPerfil  := nil;
                  ObjPerfil   := TModelPerfil.Create;
                  ContPerfil  := TPerfilController.Create;
                  Try
                    ObjPerfil.id_perfil  := 0;
                    ObjPerfil.descricao  := 'ADMINISTRADOR';
                    ObjPerfil.inativo    := 'S';
                    ObjPerfil.id_empresa := idempresa;
                    ObjPerfil.sistema    := -1;
                    ObjPerfil.excluido   := 0;

                    if ContPerfil.Salvar(ObjPerfil, idperfil) then
                    begin
                      Result  := True;
                      //Inserir o usuario

                      ObjUsuario        := Nil;
                      ContUsuario       := Nil;

                      ObjUsuario        := TModelUsuario.Create;
                      ContUsuario       := TUsuarioController.Create;

                      Try

                        ObjUsuario.idusuario      := 0;
                        ObjUsuario.nome           := 'ADMIN';
                        ObjUsuario.login          := 'ADMIN';
                        ObjUsuario.senha          := TConeSul.Crypt('C','123');
                        ObjUsuario.idempresa      := idempresa;
                        ObjUsuario.idsede         := AIDRetSede;
                        ObjUsuario.ativo          := 'S';
                        ObjUsuario.email          := 'demo@conesulsistemas.com.br';
                        ObjUsuario.sistema        := 'S';
                        ObjUsuario.idperfil       := idperfil;
                        ObjUsuario.sinc_app       := 'S';

                        if ContUsuario.Salvar(ObjUsuario, AId) then
                        begin
                          msg     := 'Registro salvo com sucesso, ID: '+IntToStr(AId);
                          Result  := true;
                        end;

                      Finally
                        FreeAndNil(ContUsuario);
                        FreeAndNil(ObjUsuario);
                      End;
                    end;
                  Finally
                    ObjPerfil.Free;
                    ContPerfil.Free;
                  End;

                 {$ENDREGION}
                end;
              finally
                //Config.Free;
              end;
             {$ENDREGION}
            end;
          Finally
            FreeAndNil(ContSede);
            FreeAndNil(ModelSede);
          End;
          {$ENDREGION}
        end;
        {$ENDREGION}
      end;
    Except on e:exception do
      begin
        msg := msg+' :'+e.Message;
        raise;
      end;
    end;
  Finally
    Model.Free;
  End;
end;

Function TFrmRegistroEmpresa.RegistroOnline(out guid:string):Boolean;
var
  resp: IResponse;
  url, usuario, senha, resposta: string;
  jsonResponse,Json: TJSONObject;
  erro:Boolean;
  msg:string;
  JsonArray: TJsonArray;
begin
  Result  := False;
  if TConeSul.BuscarURLAPI(url, usuario, senha) then
  begin

    json      := TJsonObject.Create;
    JsonArray := TJsonArray.Create;
    Try
      json.AddPair('guid',        '9999999999');
      json.AddPair('cnpj',        TiraPontos(edtcnpj.Text));
      json.AddPair('razao',       Trim(edtrazao.Text));
      json.AddPair('cep',         TiraPontos(regcep));
      json.AddPair('endereco',    Trim(regendereco));
      json.AddPair('bairro',      Trim(regBairro));
      json.AddPair('cidade',      edtcidade.Text);
      json.AddPair('uf',          'RO');
      json.AddPair('email',       Trim(edtemail.Text));
      json.AddPair('logo',        '');
      json.AddPair('bloquear',    'N');
      json.AddPair('cancelado',   'N');
      json.AddPair('ativo',       'S');
      json.AddPair('telefone',    TiraPontos(edtzap.Text));
      json.AddPair('whatsapp',    TiraPontos(edtzap.Text));
      JsonArray.Add(json);

      resp := TRequest.New.BaseURL(url)
                      .Resource('/v1/empresa')
                      .BasicAuthentication(usuario, senha)
                      .AddBody(JsonArray.ToJSON)
                      .Accept('application/json')
                      .Timeout(60000)
                      .Post;



      if resp.StatusCode <> 201 then
          raise Exception.Create(resp.Content);

    Finally
      JsonArray.Free;
    End;

    resposta  := resp.Content;

    try

      jsonResponse := TJSONObject.ParseJSONValue(resposta) as TJSONObject;

      if Assigned(jsonResponse) then
      begin
        if jsonResponse.TryGetValue<Boolean>('erro', erro) and erro then
        begin
          msg := jsonResponse.GetValue<string>('mensagem');
          msg := 'Erro retornado pela API: ' +msg;
          exit;
        end;

        if jsonResponse.TryGetValue<string>('guid', guid) then
        begin
          Result := True;
        end
        else
        begin
          msg := 'GUID não encontrado na resposta da API.';
        end;

      end
      else
        msg:='Resposta JSON mal formada.';
    except
      on E: Exception do
      begin
        msg:='Erro ao processar Get registro: '+e.Message;
      end;
    end;
  end;
end;
{
Function TFrmRegistroEmpresa.BuscarURLAPI(out url, usuario, senha:string):Boolean;
var
  LeIni: TIniFile;
  arquivo:String;
begin
  result  := False;
  try
    arquivo := ExtractFilePath(Application.ExeName) + 'Config.ini';
    if FileExists(arquivo) then
    begin
      LeIni     := TIniFile.Create(arquivo);
      url       := LeIni.ReadString('API', 'Servidor', '');
      senha     := LeIni.ReadString('API', 'Senha', '');
      usuario   := LeIni.ReadString('API', 'Usuario', '');
      Result    := True;
    end;
  finally
    LeIni.Free;
  end;

end;
}
procedure TFrmRegistroEmpresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action              := TCloseAction.caFree;
    FrmRegistroEmpresa  := nil;
end;

procedure TFrmRegistroEmpresa.FormShow(Sender: TObject);
begin
  try
    TLookupHelper.CarregarLookup(
                  TabCidade,LookupCidadeSql);
  Except on e:exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  End;
end;

procedure TFrmRegistroEmpresa.edtcnpjPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  //Buscar dados CNPJ

  ACBrValidador.TipoDocto := docCNPJ;
  ACBrValidador.Documento := edtcnpj.Text;

  if not ACBrValidador.Validar then
      raise Exception.Create(ACBrValidador.MsgErro);

  try
      dmrotinas.Pessoa.Clear;
      dmrotinas.BuscaCNPJ(tirapontos(edtcnpj.text));

      edtrazao.text           := UpperCase(dmrotinas.Pessoa.razao);
      regfantasia             := UpperCase(dmrotinas.Pessoa.fantasia);
      regendereco             := UpperCase(dmrotinas.Pessoa.Logradouro);
      regnumero               := UpperCase(dmrotinas.Pessoa.numero);
      regBairro               := UpperCase(dmrotinas.Pessoa.Bairro);
      regcidade               := UpperCase(dmrotinas.Pessoa.Municipio);
      reguf                   := UpperCase(dmrotinas.Pessoa.uf);
      regcep                  := UpperCase(tirapontos(dmrotinas.Pessoa.cep));
      edtemail.text           := LowerCase(dmrotinas.Pessoa.email);
      edtzap.text             := TiraPontos(dmrotinas.pessoa.telefone);
      edtCidade.EditValue     := dm.BuscarCidadeMunicipio(0,regcidade);

  except on E: Exception do
    raise Exception.Create(E.Message);
  end;

end;

end.
