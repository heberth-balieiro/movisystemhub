unit UnitCadConvenio;

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
  cxDropDownEdit, cxBlobEdit, cxCurrencyEdit, Vcl.Navigation, ACBRUTIL,
  Vcl.Session, Vcl.Validacoes,  cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxButtonEdit, ACBrValidador, Data.DB, DBAccess, Uni,
  UnitBaseNovoCadastro, Vcl.ButtonStylesAttributes, Vcl.StyledButton, dxBevel,
  Datasnap.DBClient,ACBRCEP,
  Controller_convenio, Model.Convenio, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCalendar, UConeSul, cxStyles, cxGridTableView, cxClasses;

type
  TFrmCadConvenio = class(TFormNovoBaseCadastro)
    ACBrValidador1: TACBrValidador;
    dsCidade: TUniDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cxCodigo: TcxTextEdit;
    cxPessoa: TcxComboBox;
    cxcnpj: TcxButtonEdit;
    cxrg: TcxTextEdit;
    cxTipo: TcxComboBox;
    cxNome: TcxTextEdit;
    cxApelido: TcxTextEdit;
    Label8: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    cxCep: TcxButtonEdit;
    cxEndereco: TcxTextEdit;
    cxNumero: TcxTextEdit;
    Label16: TLabel;
    cxBairro: TcxTextEdit;
    Label9: TLabel;
    cxComplemento: TcxTextEdit;
    Label17: TLabel;
    cxCidade: TcxLookupComboBox;
    BtnCidade: TcxButtonEdit;
    Label10: TLabel;
    cxemail: TcxTextEdit;
    Label11: TLabel;
    cxtelefone: TcxMaskEdit;
    Label12: TLabel;
    cxCelular: TcxMaskEdit;
    Label13: TLabel;
    cxzap: TcxMaskEdit;
    Label34: TLabel;
    cxobs: TcxBlobEdit;
    Label36: TLabel;
    cxSituacao: TcxComboBox;
    cxContato: TcxTextEdit;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    cxvalor: TcxCurrencyEdit;
    cxResponsavel: TcxTextEdit;
    cxPix: TcxTextEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    cxCorrentista: TcxTextEdit;
    cxBanco: TcxTextEdit;
    cxAgencia: TcxTextEdit;
    cxConta: TcxTextEdit;
    Label26: TLabel;
    cxTermos: TcxBlobEdit;
    Label27: TLabel;
    cxContrato: TcxBlobEdit;
    cxAviso: TcxBlobEdit;
    Label28: TLabel;
    cxEnviarAPP: TcxCheckBox;
    TabCidade: TClientDataSet;
    TabCidadeid_cidade: TIntegerField;
    TabCidadecidade: TStringField;
    TabCidadeuf: TStringField;
    TabCidadencidade: TStringField;
    cxdata: TcxDateEdit;
    Label29: TLabel;
    procedure BtnCidadePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCepPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxcnpjPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxPessoaPropertiesEditValueChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cxrgKeyPress(Sender: TObject; var Key: Char);
    
  private
    AIDConvenio :integer;
    procedure ValidarTipoPessoa(i: integer);
    { Private declarations }
  public
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;
    { Public declarations }
  end;

var
  FrmCadConvenio: TFrmCadConvenio;
  ContConvenio  : TConvenioController;
  ObjConvenio   : TConvenio;
implementation

{$R *.dfm}

uses UDM,uJKDialog, uRotinasComuns, uConfiguracaoService, UnitCadCidade,
  Controller.LookupHelper, UnitGlobal, UCEPService;

{ TFrmCadConvenio }

{$REGION 'Chamadas'}

procedure TFrmCadConvenio.BtnCidadePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  try
    try
      if not Assigned(FrmCadCidade) then
      FrmCadCidade := TFrmCadCidade.Create(Application);
      FrmCadCidade.ParamsStr  := 'N';
      FrmCadCidade.ShowModal;
    finally
      TLookupHelper.CarregarLookup(
                  TabCidade,LookupCidadeSql);
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmCadConvenio.cxCepPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Svc: ICEPService;
  R: TCEPResultado;
  Err: string;
begin
  try
      Svc       := TCEPService.Create(wsRepublicaVirtual);
      if Svc.Buscar(Tirapontos(cxcep.Text), R, Err) then
      begin
        cxendereco.Text    := R.Logradouro;
        cxBairro.Text      := R.Bairro;
        cxCidade.EditValue := R.IdCidade;
        cxcomplemento.Text := R.Complemento;
      end
      else
        JKDialog('Aviso',err, tdAlerta);

  except on E: Exception do
    Begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    End;
  end;
end;

procedure TFrmCadConvenio.cxcnpjPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if cxPessoa.ItemIndex = 1 then
  begin
    ACBrValidador1.TipoDocto := docCNPJ;
    ACBrValidador1.Documento := TiraPontos(cxCnpj.Text);

    if not ACBrValidador1.Validar then
    begin
      JKDialog('Erro',ACBrValidador1.MsgErro, tdErro);
      exit;
    end;

    try
      dmrotinas.Pessoa.Clear;
      dmrotinas.BuscaCNPJ(tirapontos(cxcnpj.text));
      cxNome.EditValue      := UpperCase(dmrotinas.Pessoa.razao);
      cxApelido.EditValue   := UpperCase(dmrotinas.Pessoa.fantasia);
      cxendereco.EditValue  := UpperCase(dmrotinas.Pessoa.Logradouro);
      cxnumero.EditValue    := UpperCase(dmrotinas.Pessoa.numero);
      cxBairro.EditValue    := UpperCase(dmrotinas.Pessoa.Bairro);
      cxcep.EditValue       := UpperCase(tirapontos(dmrotinas.Pessoa.cep));
      cxemail.text          := LowerCase(dmrotinas.Pessoa.email);
      cxtelefone.EditValue  := dmrotinas.pessoa.telefone;
      cxCidade.EditValue    := dm.BuscarCidadeMunicipio(0,UpperCase(dmrotinas.Pessoa.Municipio));  //verificar para remover onde usar
    except on E: Exception do
      Begin
        JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
      End;
    end;
  end
  else
  JKDialog('Aviso','Válido somente para pessoa com CNPJ.', tdMensagem);

end;

procedure TFrmCadConvenio.cxPessoaPropertiesEditValueChanged(Sender: TObject);
begin
  Try
    if cxpessoa.ItemIndex <> -1 then
    ValidarTipoPessoa(cxpessoa.ItemIndex);
  except on E: Exception do
    Begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    End;
  End;
end;

procedure TFrmCadConvenio.cxrgKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
   if not CharInSet(Key, ['0'..'9', #8, ^V, ^C, ^X]) then
        Key := #0;
end;

procedure TFrmCadConvenio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmCadConvenio  := Nil;
end;

procedure TFrmCadConvenio.FormShow(Sender: TObject);
begin
  inherited;
  Try
    TLookupHelper.CarregarLookup(
                  TabCidade,LookupCidadeSql);

    if ParamsStr = 'N' then
    begin
      TitleText   := 'Novo Convênio';
      ValidarTipoPessoa(0);
      cxPessoa.SetFocus;
      cxsituacao.ItemIndex  := 0;
      cxvalor.EditValue     := 0;
      cxEnviarAPP.Checked   := True;
    end
    else
    begin
      TitleText   := 'Editar Convênio';
      cxCNPJ.SetFocus;
      PopularCampos;
    end;

  except on E: Exception do
    Begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    End;
  End;
end;

procedure TFrmCadConvenio.PopularCampos;
begin
  inherited;
  Contconvenio  := Nil;
  Objconvenio   := Nil;
  try
    ContConvenio    := TconvenioController.Create;
    Objconvenio     := TConvenio.Create;

    Try
      if (ParamsInt=0) or (InttoStr(ParamsInt) = '') then
      raise Exception.Create('Nenhum ID passado no parâmetro.');

      Objconvenio    := ContConvenio.BuscarPorID(ParamsInt);
      if Assigned(ObjConvenio) then
      begin
        cxCodigo.EditValue          := ObjConvenio.codigo;
        cxPessoa.Text               := ObjConvenio.tipocad;
        if ObjConvenio.tipocad= 'FISICA' then
        ValidarTipoPessoa(0);
        cxcnpj.Text                 := ObjConvenio.cpf;
        cxrg.EditValue              := ObjConvenio.rg;
        cxtipo.Text                 := ObjConvenio.tipo;
        cxnome.EditValue            := ObjConvenio.nome;
        cxapelido.EditValue         := ObjConvenio.apelido;
        cxcep.EditValue             := ObjConvenio.cep;
        cxendereco.EditValue        := ObjConvenio.endereco;
        cxnumero.EditValue          := ObjConvenio.numero;
        cxbairro.EditValue          := ObjConvenio.bairro;
        cxcomplemento.EditValue     := ObjConvenio.complemento;
        cxcidade.EditValue          := ObjConvenio.id_cidade;
        cxtelefone.EditValue        := ObjConvenio.telefone;
        cxcelular.EditValue         := ObjConvenio.celular;
        cxzap.EditValue             := ObjConvenio.celular1;
        cxemail.EditValue           := ObjConvenio.email;
        cxcontato.EditValue         := ObjConvenio.contato;
        cxresponsavel.EditValue     := ObjConvenio.responsavel;
        cxvalor.EditValue           := ObjConvenio.valores;
        cxpix.EditValue             := ObjConvenio.chave_pix;
        cxbanco.EditValue           := ObjConvenio.banco;
        cxagencia.EditValue         := ObjConvenio.agencia;
        cxconta.EditValue           := ObjConvenio.conta;
        cxcorrentista.EditValue     := ObjConvenio.correntista;
        cxtermos.EditValue          := ObjConvenio.termos;
        cxcontrato.EditValue        := ObjConvenio.informacao_contrato;
        cxobs.EditValue             := ObjConvenio.obs;
        cxaviso.EditValue           := ObjConvenio.aviso;
        if ObjConvenio.ativo ='S' then
        cxsituacao.ItemIndex        := 0
        else
        cxsituacao.ItemIndex        := 1;
        if ObjConvenio.exibir_app = 'S' then
        cxenviarapp.Checked         := True
        else
        cxenviarapp.Checked         := false;
        cxdata.EditValue            := TConesul.ValidarDataNull(ObjConvenio.data_firmado);

      end;
    Finally
      FreeAndNil(ContConvenio);
      FreeAndNil(Objconvenio);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmCadConvenio.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  Try
    if cxpessoa.ItemIndex = -1 then
    begin
      msg   := 'Selecione um tipo de pessoa!';
      result:= False;
      exit;
    end;

    if (TiraPontos(cxcnpj.Text) = '') then
    begin
      msg     := 'Informe um CPF/CNPJ válido!';
      Result  := False;
      Exit;
    end;

    if cxtipo.ItemIndex=-1 then
    begin
      msg   := 'Selecione o tipo do convênio!';
      result:= False;
      exit;
    end;

    if cxNome.Text= '' then
    begin
      msg   := 'Informe o nome do convênio!';
      result:= False;
      exit;
    end;

    if (cxcidade.Text='') or (cxcidade.EditValue=0) then
    begin
      msg   := 'Selecione uma cidade!';
      result:= False;
      exit;
    end;

  except on E: Exception do
    Begin
      JKDialog('Erro','Ocorreu um erro ao validar os campos:'+#13+e.Message, tderro);
    End;
  End;

end;

procedure TFrmCadConvenio.ValidarTipoPessoa(i: integer);
begin
  Try
    case I of
      0:begin //Fisica
        cxcnpj.Properties.EditMask  := '###.###.###-##';

      end;
      1:begin //juridica
        cxcnpj.Properties.EditMask  := '##.###.###/####-##';
      end;
    end;
  except on E: Exception do
    Begin
      raise Exception.Create(e.Message);
    End;
  End;
end;

{$ENDREGION}

{$REGION 'CRUD'}

function TFrmCadConvenio.Salvar(out msg: string): Boolean;
var
AId, ACOD:Integer;
begin
  try
    Result        := False;
    ContConvenio  := nil;
    ObjConvenio   := nil;

    Contconvenio  := TConvenioController.Create;
    ObjConvenio   := TConvenio.Create;

    Try
      if ParamsStr='N' then
      ObjConvenio.id_convenio     := 0
      else
      ObjConvenio.id_convenio     := ParamsInt;

      ObjConvenio.tipocad         := CxPessoa.Text;
      ObjConvenio.cpf             := TiraPontos(cxCnpj.Text);
      ObjConvenio.rg              := TiraPontos(cxRG.Text);
      ObjConvenio.tipo            := cxTipo.Text;
      ObjConvenio.nome            := Trim(cxNome.Text);
      ObjConvenio.apelido         := Trim(cxapelido.Text);

      ObjConvenio.cep             := TiraPontos(cxcep.Text);
      ObjConvenio.endereco        := Trim(cxendereco.Text);
      ObjConvenio.numero          := Trim(cxnumero.Text);
      ObjConvenio.bairro          := Trim(cxbairro.Text);
      ObjConvenio.complemento     := trim(cxcomplemento.Text);
      ObjConvenio.id_cidade       := cxCidade.EditValue;

      ObjConvenio.telefone        := TiraPontos(cxTelefone.Text);
      ObjConvenio.celular         := TiraPontos(cxcelular.Text);
      ObjConvenio.celular1        := TiraPontos(cxzap.Text);
      ObjConvenio.email           := Trim(cxemail.Text);
      ObjConvenio.contato         := Trim(cxcontato.Text);
      ObjConvenio.responsavel     := Trim(cxResponsavel.Text);

      ObjConvenio.valores         := cxvalor.EditValue;
      ObjConvenio.chave_pix       := Trim(cxpix.Text);
      ObjConvenio.banco           := Trim(cxbanco.Text);
      ObjConvenio.agencia         := Trim(cxagencia.Text);
      ObjConvenio.conta           := trim(cxconta.Text);
      ObjConvenio.correntista     := Trim(cxcorrentista.Text);

      ObjConvenio.termos          := Trim(cxtermos.Text);
      ObjConvenio.informacao_contrato := Trim(cxContrato.Text);
      ObjConvenio.obs             := Trim(cxObs.Text);
      ObjConvenio.aviso           := Trim(cxaviso.Text);
      if cxsituacao.ItemIndex = 0 then
      ObjConvenio.ativo           := 'S'
      else
      ObjConvenio.ativo           := 'N';
      if cxEnviarAPP.Checked = True then
      ObjConvenio.exibir_app        := 'S'
      else
      ObjConvenio.exibir_app        := 'N';

      ObjConvenio.id_usuario      := TSession.ID_USUARIO;
      ObjConvenio.id_empresa      := TSession.IDEMPRESA;

      if cxdata.EditValue = null then
      ObjConvenio.data_firmado    := Nulldate
      else
      ObjConvenio.data_firmado    := TConesul.ValidarDataNull(cxdata.EditValue);
      ObjConvenio.sinc_app        := 'S';

      if Contconvenio.Salvar(Objconvenio, AId, ACOD) then
      begin
        if AID = 0 then
        AID     := ParamsInt;

        if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
        begin
          TConfiguracaoService.SincronizarGravar(7, AID);
        end;

        msg     := 'Registro salvo com sucesso, ID: '+IntToStr(AID);
        Result  := true;
        ParamsCloseTela := 'S';
      end;

    Finally
      FreeAndNil(ContConvenio);
      FreeAndNil(ObjConvenio);
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;

end;

{$ENDREGION}

end.






