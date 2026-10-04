unit UnitTransportadoraCad;

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
  cxGroupBox, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, cxMaskEdit, cxButtonEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Data.DB,
  DBAccess, Uni, ACBrValidador, ACBRUTIL, UnitBaseNovoCadastro,
  Vcl.ButtonStylesAttributes, cxStyles, cxGridTableView, cxClasses,
  Vcl.StyledButton, dxBevel,
  Controller.Transportadora,Model.Transportadora, UnitCadCidade,
  Controller.LookupHelper, UnitGlobal, Datasnap.DBClient, UCEPService, UDM, ACBRCEP,
  Vcl.Session;

type
  TFrmTransportadoraCad = class(TFormNovoBaseCadastro)
    dsCidade: TUniDataSource;
    ACBrValidador1: TACBrValidador;
    Label1: TLabel;
    cxCodigo: TcxTextEdit;
    Label2: TLabel;
    cxPessoa: TcxComboBox;
    Label3: TLabel;
    cxcnpj: TcxButtonEdit;
    Label4: TLabel;
    cxie: TcxTextEdit;
    Label6: TLabel;
    cxNome: TcxTextEdit;
    Label7: TLabel;
    cxApelido: TcxTextEdit;
    cxTantt: TcxTextEdit;
    Label5: TLabel;
    Label11: TLabel;
    cxtelefone: TcxMaskEdit;
    Label8: TLabel;
    cxCep: TcxButtonEdit;
    Label14: TLabel;
    cxEndereco: TcxTextEdit;
    Label15: TLabel;
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
    Label36: TLabel;
    cxSituacao: TcxComboBox;
    TabCidade: TClientDataSet;
    TabCidadeid_cidade: TIntegerField;
    TabCidadecidade: TStringField;
    TabCidadeuf: TStringField;
    TabCidadencidade: TStringField;
    procedure BtnCidadePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCepPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxcnpjPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxieKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cxPessoaPropertiesEditValueChanged(Sender: TObject);
    
  private
    { Private declarations }
    Procedure ValidarTipoPessoa(i: integer);
  public
    { Public declarations }
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;
  end;

var
  FrmTransportadoraCad: TFrmTransportadoraCad;
  ContTrans : TTransportadoraController;
  ObjTrans  : TModelTransportadora;

implementation

{$R *.dfm}

uses Vcl.Navigation, uRotinasComuns, uJKDialog;

{ TFrmTransportadoraCad }

{$REGION 'Chamadas'}

procedure TFrmTransportadoraCad.BtnCidadePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
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


procedure TFrmTransportadoraCad.cxCepPropertiesButtonClick(Sender: TObject;
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

procedure TFrmTransportadoraCad.cxcnpjPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
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

procedure TFrmTransportadoraCad.cxPessoaPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  Try
    if cxpessoa.ItemIndex <> -1 then
    ValidarTipoPessoa(cxpessoa.ItemIndex);
  except on E: Exception do
    Begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    End;
  End;
end;

procedure TFrmTransportadoraCad.cxieKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0'..'9', #8, ^V, ^C, ^X]) then
        Key := #0;
end;

procedure TFrmTransportadoraCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmTransportadoraCad:= nil;
end;

procedure TFrmTransportadoraCad.FormShow(Sender: TObject);
begin
  inherited;
  Try
    TLookupHelper.CarregarLookup(
                  TabCidade,LookupCidadeSql);

    if ParamsStr = 'N' then
    begin
      TitleText   := 'Nova Transportadora';
      ValidarTipoPessoa(0);
      cxPessoa.SetFocus;
      cxsituacao.ItemIndex  := 0;

    end
    else
    begin
      TitleText   := 'Editar Transportadora';
      cxCNPJ.SetFocus;
      PopularCampos;
    end;

  except on E: Exception do
    Begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    End;
  End;
end;

procedure TFrmTransportadoraCad.PopularCampos;
begin
  inherited;
  ContTrans  := Nil;
  ObjTrans   := Nil;
  try
    ContTrans    := TTransportadoraController.Create;
    ObjTrans     := TModelTransportadora.Create;

    Try
      if (ParamsInt=0) or (InttoStr(ParamsInt) = '') then
      raise Exception.Create('Nenhum ID passado no parâmetro.');

      ObjTrans    := ContTrans.BuscarPorID(ParamsInt);
      if Assigned(ObjTrans) then
      begin
        cxcodigo.EditValue     := ObjTrans.codigo;
        cxpessoa.ItemIndex     := ObjTrans.tipo;
        cxcnpj.EditValue       := ObjTrans.cnpj;
        cxie.EditValue         := ObjTrans.ie;
        cxtelefone.EditValue   := ObjTrans.telefone;
        cxTantt.EditValue      := ObjTrans.antt;
        if ObjTrans.ativo = 'S' then
        cxsituacao.EditValue   := 'ATIVO'
        else
        cxsituacao.EditValue   := 'INATIVO';
        cxnome.EditValue       := ObjTrans.razao;
        cxapelido.EditValue    := ObjTrans.fantasia;
        cxcep.EditValue        := ObjTrans.cep;
        cxendereco.EditValue   := ObjTrans.endereco;
        cxnumero.EditValue     := ObjTrans.numero;
        cxcomplemento.EditValue:= ObjTrans.complemento;
        cxbairro.EditValue     := ObjTrans.bairro;
        cxcidade.EditValue     := ObjTrans.id_cidade;
        cxemail.EditValue      := ObjTrans.email;

      end;
    Finally
      FreeAndNil(ContTrans);
      FreeAndNil(ObjTrans);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmTransportadoraCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  Try
    if cxpessoa.ItemIndex = -1 then
    begin
      msg   := 'Selecione um tipo!';
      result:= False;
      exit;
    end;

    if (TiraPontos(cxcnpj.Text) = '') then
    begin
      msg     := 'Informe um CPF/CNPJ válido!';
      Result  := False;
      Exit;
    end;

    if cxNome.Text= '' then
    begin
      msg   := 'Informe uma razão!';
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

procedure TFrmTransportadoraCad.ValidarTipoPessoa(i: integer);
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


{$REGION 'Crud'}

function TFrmTransportadoraCad.Salvar(out msg: string): Boolean;
var
AId:Integer;
begin
  try
    Result        := False;
    ContTrans     := nil;
    ObjTrans      := nil;

    ContTrans  := TTransportadoraController.Create;
    ObjTrans   := TModelTransportadora.Create;

    Try
      if ParamsStr='N' then
      ObjTrans.id_transportadora     := 0
      else
      ObjTrans.id_transportadora     := ParamsInt;

      ObjTrans.tipo       := cxpessoa.ItemIndex;
      ObjTrans.cnpj       := Trim(Tirapontos(cxcnpj.Text));
      ObjTrans.ie         := trim(Tirapontos(cxie.Text));
      ObjTrans.telefone   := trim(Tirapontos(cxtelefone.Text));
      ObjTrans.antt       := trim(cxTantt.Text);
      ObjTrans.ativo      := cxSituacao.text;
      ObjTrans.razao      := trim(cxNome.Text);
      ObjTrans.fantasia   := trim(cxApelido.Text);
      ObjTrans.cep        := trim(Tirapontos(cxCep.Text));
      ObjTrans.endereco   := trim(cxEndereco.Text);
      ObjTrans.numero     := trim(cxNumero.Text);
      ObjTrans.complemento:= trim(cxComplemento.Text);
      ObjTrans.bairro     := trim(cxBairro.Text);
      ObjTrans.id_cidade  := cxCidade.EditValue;
      ObjTrans.email      := trim(cxemail.Text);
      ObjTrans.id_empresa := TSession.IDEMPRESA;
      ObjTrans.id_usuario := TSession.ID_USUARIO;

      if ContTrans.Salvar(ObjTrans, AId) then
      begin
        if AID = 0 then
        AID     := ParamsInt;
        msg     := 'Registro salvo com sucesso, ID: '+IntToStr(AID);
        Result  := true;
        ParamsCloseTela := 'S';
      end;

    Finally
      FreeAndNil(ContTrans);
      FreeAndNil(ObjTrans);
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;


{$ENDREGION}

end.


