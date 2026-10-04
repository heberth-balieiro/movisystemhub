unit UnitSedeCad;

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
  Data.DB, DBAccess, Uni, ACBrBase, ACBrEnterTab, ACBrValidador, ACBRUTIL,
  UnitBaseNovoCadastro, Vcl.ButtonStylesAttributes, Vcl.StyledButton, dxBevel,
  Model.Sede, Controller_sede, Datasnap.DBClient,ACBRCEP, cxStyles,
  cxGridTableView, cxClasses;

type
  TFrmSedeCad = class(TFormNovoBaseCadastro)
    dsCidade: TUniDataSource;
    ACBrValidadorCNPJ: TACBrValidador;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    cxCodigo: TcxTextEdit;
    cxcnpj: TcxButtonEdit;
    cxnome: TcxTextEdit;
    cxapelido: TcxTextEdit;
    cxTelefone: TcxMaskEdit;
    cxCelular: TcxMaskEdit;
    cxWhatsapp: TcxMaskEdit;
    Label27: TLabel;
    cxCep: TcxButtonEdit;
    Label28: TLabel;
    cxEndereco: TcxTextEdit;
    Label29: TLabel;
    cxNumero: TcxTextEdit;
    Label30: TLabel;
    cxBairro: TcxTextEdit;
    Label31: TLabel;
    cxComplemento: TcxTextEdit;
    Label32: TLabel;
    cxCidade: TcxLookupComboBox;
    BtnCidade: TcxButtonEdit;
    cxInsestadual: TcxTextEdit;
    cxInsMunicipal: TcxTextEdit;
    Label33: TLabel;
    Label34: TLabel;
    cxSite: TcxTextEdit;
    Label35: TLabel;
    cxEmail01: TcxTextEdit;
    cxEmail02: TcxTextEdit;
    Label36: TLabel;
    Label1: TLabel;
    TabCidade: TClientDataSet;
    TabCidadeid_cidade: TIntegerField;
    TabCidadecidade: TStringField;
    TabCidadeuf: TStringField;
    TabCidadencidade: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxcnpjPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCepPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BtnCidadePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCodigoKeyPress(Sender: TObject; var Key: Char);
  private
    IdSede  :Integer;
    { Private declarations }
  public
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;
    { Public declarations }
  end;

var
  FrmSedeCad: TFrmSedeCad;
  ContSede  : TSedeController;
  ObjSede   : TSede;
implementation

{$R *.dfm}

Uses Vcl.Session, uRotinasComuns, uJKDialog, Controller.LookupHelper,
  UnitGlobal, UDM,UCEPService, UnitCadCidade;

procedure TFrmSedeCad.BtnCidadePropertiesButtonClick(Sender: TObject;
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

procedure TFrmSedeCad.cxCepPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Svc: ICEPService;
  R: TCEPResultado;
  Err: string;
begin
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

procedure TFrmSedeCad.cxcnpjPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  ACBrValidadorCNPJ.TipoDocto := docCNPJ;
  ACBrValidadorCNPJ.Documento := TiraPontos(cxCnpj.Text);

  if not ACBrValidadorCNPJ.Validar then
  begin
    JKDialog('Erro',ACBrValidadorCNPJ.MsgErro, tdErro);
    exit;
  end;

  try
      dmrotinas.Pessoa.Clear;
      dmrotinas.BuscaCNPJ(tirapontos(cxcnpj.text));

      cxNome.EditValue       := UpperCase(dmrotinas.Pessoa.razao);
      cxApelido.EditValue    := UpperCase(dmrotinas.Pessoa.fantasia);
      cxendereco.EditValue   := UpperCase(dmrotinas.Pessoa.Logradouro);
      cxnumero.EditValue     := UpperCase(dmrotinas.Pessoa.numero);
      cxBairro.EditValue     := UpperCase(dmrotinas.Pessoa.Bairro);
      //edtcidade.EditValue  := UpperCase(dmrotinas.Pessoa.Municipio);
      //reguf                := UpperCase(dmrotinas.Pessoa.uf);
      cxcep.EditValue        := UpperCase(tirapontos(dmrotinas.Pessoa.cep));
      cxemail01.text         := LowerCase(dmrotinas.Pessoa.email);
      cxtelefone.EditValue   := dmrotinas.pessoa.telefone;
      cxCidade.EditValue     := dm.BuscarCidadeMunicipio(0,UpperCase(dmrotinas.Pessoa.Municipio));

  except on E: Exception do
    raise Exception.Create(E.Message);
  end;

end;

procedure TFrmSedeCad.cxCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, ['0'..'9', #8, ^V, ^C, ^X]) then
        Key := #0;
end;

procedure TFrmSedeCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmSedeCad  := Nil;
end;

procedure TFrmSedeCad.FormShow(Sender: TObject);
begin
  inherited;
  try
    TLookupHelper.CarregarLookup(
                  TabCidade,LookupCidadeSql);

    if ParamsStr = 'N' then
    begin
      TitleText   := ' Nova Sede';
      cxCNPJ.SetFocus;
    end
    else
    begin
      PopularCampos;
      TitleText   := ' Editar Sede';
      cxCNPJ.Properties.ReadOnly        := True;
      cxInsestadual.Properties.ReadOnly := True;

      cxNome.SetFocus;
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmSedeCad.PopularCampos;
begin
  inherited;
  ContSede  := Nil;
  ObjSede   := Nil;
  try
    ContSede    := TSedeController.Create;
    ObjSede     := TSede.Create;

    Try
      if (ParamsInt=0) or (InttoStr(ParamsInt) = '') then
      raise Exception.Create('Nenhum ID passado no parâmetro.');

      ObjSede    := ContSede.BuscarPorID(ParamsInt);
      if Assigned(ObjSede) then
      begin
        IdSede                  := ObjSede.id_sede;
        cxCodigo.EditValue      := ObjSede.id_sede;
        cxCnpj.EditValue        := ObjSede.cnpj;
        cxNome.EditValue        := ObjSede.razao;
        cxApelido.EditValue     := ObjSede.fantasia;
        cxCep.EditValue         := ObjSede.cep;
        cxEndereco.EditValue    := ObjSede.endereco;
        cxNumero.EditValue      := ObjSede.numero;
        cxBairro.EditValue      := ObjSede.bairro;
        cxComplemento.EditValue := ObjSede.complemento;
        cxCidade.EditValue      := ObjSede.id_cidade;
        cxTelefone.EditValue    := ObjSede.telefone;
        cxCelular.EditValue     := ObjSede.celular;
        cxWhatsapp.EditValue    := ObjSede.whatsapp;
        cxInsestadual.EditValue := ObjSede.ie;
        cxInsmunicipal.EditValue:= ObjSede.im;
        cxSite.EditValue        := ObjSede.site;
        cxEmail01.EditValue     := ObjSede.email1;
        cxEmail02.EditValue     := ObjSede.email2;
      end;
    Finally
      FreeAndNil(ContSede);
      FreeAndNil(ObjSede);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmSedeCad.Salvar(out msg: string): Boolean;
var
AId:Integer;
begin
  try
    Result      := False;
    ContSede  := nil;
    ObjSede   := nil;

    ContSede  := TSedeController.Create;
    ObjSede   := TSede.Create;

    Try
      if ParamsStr='N' then
      ObjSede.id_sede     := 0
      else
      ObjSede.id_sede     := ParamsInt;

      ObjSede.cnpj        := TiraPontos(cxCnpj.Text);
      ObjSede.razao       := Trim(cxNome.Text);
      ObjSede.fantasia    := Trim(cxApelido.Text);
      ObjSede.cep         := TiraPontos(cxCep.Text);
      ObjSede.endereco    := Trim(cxEndereco.Text);
      ObjSede.numero      := Trim(cxNumero.Text);
      ObjSede.bairro      := Trim(cxBairro.Text);
      ObjSede.complemento := Trim(cxComplemento.Text);
      ObjSede.id_cidade   := cxCidade.EditValue;
      ObjSede.telefone    := TiraPontos(cxTelefone.Text);
      ObjSede.celular     := TiraPontos(cxCelular.Text);
      ObjSede.whatsapp    := TiraPontos(cxWhatsapp.Text);
      ObjSede.ie          := TiraPontos(cxInsestadual.Text);
      ObjSede.im          := TiraPontos(cxInsmunicipal.Text);
      ObjSede.site        := Trim(cxSite.Text);
      ObjSede.email1      := Trim(cxEmail01.Text);
      ObjSede.email2      := Trim(cxEmail02.Text);
      ObjSede.sedeprincipal := 'N';
      ObjSede.id_empresa    := TSession.IDEMPRESA;

      if ContSede.Salvar(ObjSede, AId) then
      begin
        if AID = 0 then
        AID     := ParamsInt;
        msg     := 'Registro salvo com sucesso, Código: '+IntToStr(AId);
        Result  := true;
        ParamsCloseTela := 'S';
      end;

    Finally
      FreeAndNil(ContSede);
      FreeAndNil(ObjSede);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmSedeCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if (cxcnpj.Text='') or (cxcnpj.EditValue=null) then
  begin
    msg     := 'Informe um CNPJ!';
    Result  := False;
    Exit;
  end;

  if cxNome.Text='' then
  begin
    msg     := 'Informe o nome da sede!';
    Result  := False;
    Exit;
  end;

  if (cxCidade.Text='') or (cxCidade.EditValue=0) then
  begin
    msg     := 'Selecione uma cidade!';
    result  := False;
    Exit;
  end;

end;

end.





