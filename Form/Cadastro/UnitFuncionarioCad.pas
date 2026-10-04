unit UnitFuncionarioCad;

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
  cxCheckBox, dxBevel, dxGDIPlusClasses, ACBrBase, ACBrEnterTab, ACBrValidador,
  Data.DB, DBAccess, Uni, ACBRUTIL, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCalendar, UnitBaseNovoCadastro,Model.Funcionario, Controller.Funcionario,
  Datasnap.DBClient, ACBRCEP, Vcl.ButtonStylesAttributes, Vcl.StyledButton,
  cxStyles, cxGridTableView, cxClasses;

type
  TFrmFuncionarioCad = class(TFormNovoBaseCadastro)
    Label27: TLabel;
    ACBrValidador1: TACBrValidador;
    dsCidade: TUniDataSource;
    Label3: TLabel;
    Label7: TLabel;
    labelOrgao: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    edtFoto: TImage;
    gbOpcao: TcxGroupBox;
    cxVendedor: TcxCheckBox;
    cxAtivo: TcxCheckBox;
    cxApp: TcxCheckBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label12: TLabel;
    Label22: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label8: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label5: TLabel;
    cxNascimento: TcxDateEdit;
    cxNome: TcxTextEdit;
    cxapelido: TcxTextEdit;
    cxCep: TcxButtonEdit;
    cxEndereco: TcxTextEdit;
    cxNumero: TcxTextEdit;
    cxComplemento: TcxTextEdit;
    cxBairro: TcxTextEdit;
    cxcidade: TcxLookupComboBox;
    btnCidade: TcxButtonEdit;
    cxEmail: TcxTextEdit;
    cxFone: TcxMaskEdit;
    cxCelular: TcxMaskEdit;
    cxWhatsapp: TcxMaskEdit;
    cxFuncao: TcxTextEdit;
    cxobs: TcxBlobEdit;
    cxavisos: TcxBlobEdit;
    cxcpf: TcxButtonEdit;
    cxCodigo: TcxTextEdit;
    cxRg: TcxTextEdit;
    cxorgao: TcxTextEdit;
    dxBevel2: TdxBevel;
    TabCidade: TClientDataSet;
    TabCidadeid_cidade: TIntegerField;
    TabCidadecidade: TStringField;
    TabCidadeuf: TStringField;
    TabCidadencidade: TStringField;

    procedure edtFotoDblClick(Sender: TObject);
    procedure cxRgKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cxCepPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    idpessoa:integer;
    { Private declarations }
  public
    { Public declarations }
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;
  end;

var
  FrmFuncionarioCad: TFrmFuncionarioCad;
  ObjFuncionario  : TModelFuncionario;
  ContFuncionario : TFuncionarioController;
implementation

{$R *.dfm}

Uses UConeSul,UDm, Vcl.Loading, Vcl.Session, uJKDialog,
  uRotinasComuns, UnitGlobal, Controller.LookupHelper, UCEPService,
  uConfiguracaoService;

{$Region 'Funções'}

function TFrmFuncionarioCad.Salvar(out msg: string): Boolean;
var
AId:Integer;
begin
  Result    := False;

  ObjFuncionario  := Nil;
  ContFuncionario := Nil;

  ObjFuncionario  := TModelFuncionario.Create;
  ContFuncionario := TFuncionarioController.Create;

  Try
    if ParamsStr='N' then
    ObjFuncionario.id_funcionario       := 0
    else
    ObjFuncionario.id_funcionario       := ParamsInt;
    ObjFuncionario.nome                 := Trim(cxNome.Text);
    ObjFuncionario.apelido              := Trim(cxApelido.Text);
    ObjFuncionario.cpf                  := TiraPontos(cxCpf.Text);
    ObjFuncionario.rg                   := Trim(cxRg.Text);
    ObjFuncionario.cep                  := TiraPontos(cxCep.Text);
    ObjFuncionario.endereco             := Trim(cxEndereco.Text);
    ObjFuncionario.numero               := Trim(cxNumero.Text);
    ObjFuncionario.complemento          := Trim(cxComplemento.Text);
    ObjFuncionario.bairro               := Trim(cxBairro.Text);
    ObjFuncionario.id_cidade            := cxCidade.EditValue;
    ObjFuncionario.ativo                := cxAtivo.EditValue;
    ObjFuncionario.id_empresa           := TSession.IDEMPRESA;
    ObjFuncionario.email                := Trim(cxEmail.Text);
    ObjFuncionario.data_cadastro        := Now;
    ObjFuncionario.id_usuario           := TSession.ID_USUARIO;
    ObjFuncionario.funcao               := Trim(cxFuncao.Text);
    ObjFuncionario.telefone             := TiraPontos(cxFone.Text);
    ObjFuncionario.celular              := TiraPontos(cxCelular.Text);
    ObjFuncionario.whatsapp             := TiraPontos(cxWhatsapp.Text);
    if cxNascimento.EditValue = null then
    ObjFuncionario.nascimento           := 0
    else
    ObjFuncionario.nascimento           := cxNascimento.Date;
    ObjFuncionario.obs                  := Trim(cxObs.Text);
    ObjFuncionario.aviso                := Trim(cxAvisos.Text);
    if (edtFoto.Picture <> nil) then
    ObjFuncionario.foto                 := TConeSul.ConvImgBase64(edtFoto);
    ObjFuncionario.vendedor             := cxVendedor.EditValue;
    ObjFuncionario.orgao                := Trim(cxorgao.Text);
    ObjFuncionario.app                  := cxApp.EditValue;

    if cxApp.Checked = True then
    begin
      if TiraPontos(cxCpf.Text) <> '' then
      ObjFuncionario.senha              := TConeSul.Crypt('C',Copy(TiraPontos(cxCpf.Text),1,4));
    end;

    ObjFuncionario.sincronizado         := 'A';
    ObjFuncionario.tokenwhatsapp        := '';

    Try
      if ContFuncionario.Salvar(ObjFuncionario, AId) then
      begin
        msg     := 'Registro salvo com sucesso';
        Result  := true;
        ParamsCloseTela := 'S';
      end;
    Except on e:exception do
      begin
        msg   := 'Ocorreu um erro ao salvar: '+e.Message;
        exit;
      end;
    End;

  Finally
    FreeAndNil(ObjFuncionario);
    FreeAndNil(ContFuncionario);
  End;
end;

function TFrmFuncionarioCad.ValidarCampos(out msg: string): Boolean;
var
rCod:Integer;
begin
  Result  := True;

  if cxNome.text='' then
  begin
    msg     := 'Informe o nome do funcionário!';
    Result  := False;
    exit;
  end;

  if (cxCidade.Text='') or (cxCidade.EditValue=0) then
  begin
    msg     := 'Selecione uma cidade!';
    Result  := False;
    exit;
  end;

  if ParamsStr ='N' then
  begin
    if (TiraPontos(cxCPF.Text) <> '') then
    begin
      if TConfiguracaoService.ValidarFuncionarioExits(rCod,TiraPontos(cxcpf.Text)) then
      begin
        Result  := False;
        msg     := 'Já consta um CPF com o cadastro no sistema!'+#13+'Código: '+inttostr(rCod);
        exit;
      end;
    end;
  end;

end;


{$ENDREGION}

{$Region 'Procedimento'}

procedure TFrmFuncionarioCad.PopularCampos;
begin
  inherited;

  ObjFuncionario  := Nil;
  ContFuncionario := Nil;

  ObjFuncionario  := TModelFuncionario.Create;
  ContFuncionario := TFuncionarioController.Create;
  Try
    try

      ObjFuncionario            := ContFuncionario.BuscarPorID(ParamsInt);

      if Assigned(ObjFuncionario) then
      begin
        cxCodigo.EditValue      :=  ObjFuncionario.Codigo;
        cxCpf.EditValue         :=  ObjFuncionario.cpf;
        cxrg.EditValue          :=  ObjFuncionario.rg;
        if ObjFuncionario.nascimento <> strtodate('30/12/1899') then
        cxNascimento.EditValue  :=  ObjFuncionario.nascimento;
        cxOrgao.EditValue       :=  ObjFuncionario.orgao;

        cxNome.EditValue        :=  ObjFuncionario.nome;
        cxApelido.EditValue     :=  ObjFuncionario.apelido;

        cxCep.EditValue         :=  ObjFuncionario.cep;
        cxEndereco.EditValue    :=  ObjFuncionario.endereco;
        cxNumero.EditValue      :=  ObjFuncionario.numero;

        cxComplemento.EditValue :=  ObjFuncionario.complemento;
        cxBairro.EditValue      :=  ObjFuncionario.bairro;

        cxCidade.EditValue      :=  ObjFuncionario.id_cidade;
        cxEmail.EditValue       :=  ObjFuncionario.email;

        cxFone.EditValue        :=  ObjFuncionario.telefone;
        cxCelular.EditValue     :=  ObjFuncionario.celular;
        cxWhatsapp.EditValue    :=  ObjFuncionario.whatsapp;
        cxFuncao.EditValue      :=  ObjFuncionario.funcao;

        cxObs.EditValue         :=  ObjFuncionario.obs;
        cxAvisos.EditValue      :=  ObjFuncionario.aviso;

        cxAtivo.EditValue       :=  ObjFuncionario.ativo;
        cxVendedor.EditValue    :=  ObjFuncionario.vendedor;
        cxApp.EditValue         :=  ObjFuncionario.app;

        if ObjFuncionario.foto <> '' then
        begin
          TConesul.ConvBase64Img(ObjFuncionario.foto);
          edtFoto.Picture       := TConeSul.nfoto;
          TConeSul.nfoto.Free;
        end;

        cxCpf.SetFocus;
      end
      else
      begin
        JKDialog('Aviso','Não foi possivel carregar os dados.', tdAlerta);
        exit;
      end;

    Except on e:exception do
      begin
        msg := msg+' :'+e.Message;
        raise;
      end;
    end;

  Finally
    ObjFuncionario.Free;
    ContFuncionario.Free;
  End;

end;


{$ENDREGION}

{$Region 'Form'}

procedure TFrmFuncionarioCad.cxCepPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Svc: ICEPService;
  R: TCEPResultado;
  Err: string;
begin
  inherited;
  //Buscar Cep

  Svc       := TCEPService.Create(wsRepublicaVirtual);
  if Svc.Buscar(Tirapontos(cxCEP.Text), R, Err) then
  begin
    cxEndereco.Text    := R.Logradouro;
    cxBairro.Text      := R.Bairro;
    cxCidade.EditValue := R.IdCidade;
    //edtUF.Text          := R.UF;
    cxComplemento.Text := R.Complemento;
    //edtIBGE.Text        := R.IBGE;
  end
  else
    JKDialog('Aviso',err, tdAlerta);
end;

procedure TFrmFuncionarioCad.cxRgKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0'..'9', #8, ^V, ^C, ^X]) then
        Key := #0;
end;

procedure TFrmFuncionarioCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmFuncionarioCad := nil;
end;

procedure TFrmFuncionarioCad.FormShow(Sender: TObject);
begin
  inherited;
  TLookupHelper.CarregarLookup(
                TabCidade,LookupCidadeSql);

  if ParamsStr = 'N' then
  begin
    TitleText   := 'Novo Funcionário';
    cxCPF.SetFocus;
  end
  else
  begin
    TitleText   := 'Editar Funcionário';
    PopularCampos;
  end;
end;

procedure TFrmFuncionarioCad.edtFotoDblClick(Sender: TObject);
var
  OpenDialog: TOpenDialog;
begin
  // Cria um objeto TOpenDialog
  OpenDialog := TOpenDialog.Create(nil);
  try
    // Configurações do diálogo
    OpenDialog.Filter := 'Imagens JPEG|*.jpg;*.jpeg|Imagens PNG|*.png;*.png';
    OpenDialog.Title := 'Selecione uma foto';

    // Exibe o diálogo e verifica se o usuário selecionou um arquivo
    if OpenDialog.Execute then
    begin

      edtfoto.Picture.LoadFromFile(OpenDialog.FileName)
      

    end;
  finally
    // Libera o objeto TOpenDialog
    OpenDialog.Free;
  end;
end;


{$ENDREGION}

end.
