unit UnitCadEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseNovoCadastro, Data.DB, DBAccess,
  Uni, ACBrBase, ACBrEnterTab, Vcl.StdCtrls, Vcl.Buttons, dxBevel, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxGroupBox,
  Model.Empresas, Controller.Empresa, ACBRUTIL, Datasnap.DBClient, ACBRCEP,
  ACBrValidador, Vcl.ButtonStylesAttributes, Vcl.StyledButton, cxStyles,
  cxGridTableView, cxClasses;

type
  TFrmCadEmpresa = class(TFormNovoBaseCadastro)
    Label1: TLabel;
    cxCodigo: TcxTextEdit;
    cxcnpj: TcxButtonEdit;
    Label2: TLabel;
    cxIE: TcxTextEdit;
    cxIm: TcxTextEdit;
    cxcnae: TcxTextEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cxrazao: TcxTextEdit;
    cxfantasia: TcxTextEdit;
    cxCep: TcxButtonEdit;
    Label9: TLabel;
    cxendereco: TcxTextEdit;
    Label10: TLabel;
    Label11: TLabel;
    cxnumero: TcxTextEdit;
    Label12: TLabel;
    cxcomplemento: TcxTextEdit;
    Label13: TLabel;
    cxbairro: TcxTextEdit;
    Label14: TLabel;
    cxcidade: TcxLookupComboBox;
    btnCidade: TcxButtonEdit;
    cxemail: TcxTextEdit;
    Label15: TLabel;
    Label17: TLabel;
    cxFone1: TcxMaskEdit;
    cxfone2: TcxMaskEdit;
    cxcelular1: TcxMaskEdit;
    cxcelular2: TcxMaskEdit;
    cxwhatsapp: TcxMaskEdit;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    cxregime: TcxComboBox;
    cxLogo: TcxGroupBox;
    edtlogo: TImage;
    TabCidade: TClientDataSet;
    TabCidadeid_cidade: TIntegerField;
    TabCidadecidade: TStringField;
    TabCidadeuf: TStringField;
    TabCidadencidade: TStringField;
    DsCidade: TUniDataSource;
    ACBrValidadorCNPJ: TACBrValidador;
    procedure cxIEKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cxCepPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxcnpjPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtlogoDblClick(Sender: TObject);
    procedure btnCidadePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCodigoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;
    { Public declarations }
  end;

var
  FrmCadEmpresa : TFrmCadEmpresa;
  ObjEmpresa    : TEmpresa;
  ContEmpresa   : TEmpresaController;
implementation

{$R *.dfm}

uses Vcl.Session, uJKDialog, Controller.LookupHelper, UnitGlobal, UCEPService,
  uRotinasComuns, uDM, UConeSul, uConfiguracaoService, Vcl.PermissaoUsuario,
  UnitCadCidade;

{ TFrmCadEmpresa }

procedure TFrmCadEmpresa.btnCidadePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Permissao: TPermissaoUsuario;
begin

  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Cidade');

  if Permissao.TemPermissao('Permitir Criar Novo') then
  begin
    Try
      if not Assigned(FrmCadCidade) then
      FrmCadCidade            := TFrmCadCidade.Create(Application);
      FrmCadCidade.ParamsStr  := 'N';
      FrmCadCidade.ShowModal;
    Finally
      TLookupHelper.CarregarLookup(
                TabCidade,LookupCidadeSql);
    End;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);

end;

procedure TFrmCadEmpresa.cxCepPropertiesButtonClick(Sender: TObject;
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

procedure TFrmCadEmpresa.cxcnpjPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  //cnpj

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

      cxrazao.EditValue      := UpperCase(dmrotinas.Pessoa.razao);
      cxfantasia.EditValue   := UpperCase(dmrotinas.Pessoa.fantasia);
      cxendereco.EditValue   := UpperCase(dmrotinas.Pessoa.Logradouro);
      cxnumero.EditValue     := UpperCase(dmrotinas.Pessoa.numero);
      cxBairro.EditValue     := UpperCase(dmrotinas.Pessoa.Bairro);
      //edtcidade.EditValue     := UpperCase(dmrotinas.Pessoa.Municipio);
      //reguf                   := UpperCase(dmrotinas.Pessoa.uf);
      cxcep.EditValue        := UpperCase(tirapontos(dmrotinas.Pessoa.cep));
      cxemail.text           := LowerCase(dmrotinas.Pessoa.email);
      cxfone1.EditValue      := dmrotinas.pessoa.telefone;
      cxCidade.EditValue     := dm.BuscarCidadeMunicipio(0,UpperCase(dmrotinas.Pessoa.Municipio));

  except on E: Exception do
    raise Exception.Create(E.Message);
  end;

end;

procedure TFrmCadEmpresa.cxCodigoKeyPress(Sender: TObject; var Key: Char);
begin
if not CharInSet(Key, ['0'..'9', #8, ^V, ^C, ^X]) then
        Key := #0;
end;

procedure TFrmCadEmpresa.cxIEKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0'..'9', #8, ^V, ^C, ^X]) then
        Key := #0;
end;

procedure TFrmCadEmpresa.edtlogoDblClick(Sender: TObject);
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
      //if ValidarTamanhoImagem(OpenDialog.FileName,1400,1400) then
      // Carrega a imagem selecionada no TImage
      edtlogo.Picture.LoadFromFile(OpenDialog.FileName)
      //else
      //Showmessage('Verifique o tamanho a imagem!');
    end;
  finally
    // Libera o objeto TOpenDialog
    OpenDialog.Free;
  end;
end;

procedure TFrmCadEmpresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmCadEmpresa   := Nil;
end;

procedure TFrmCadEmpresa.FormShow(Sender: TObject);
begin
  inherited;

  TLookupHelper.CarregarLookup(
                TabCidade,LookupCidadeSql);

  if ParamsStr = 'N' then
  begin
    TitleText   := 'Nova Empresa';
    cxCNPJ.SetFocus;
  end
  else
  begin
    TitleText                     := 'Editar Empresa';
    cxCNPJ.Properties.ReadOnly    := True;
    cxRazao.Properties.ReadOnly   := True;
    cxCNPJ.Properties.Buttons[0].Visible  := False;
    PopularCampos;
  end;
end;

procedure TFrmCadEmpresa.PopularCampos;
begin
  inherited;
  ObjEmpresa    := Nil;
  ContEmpresa   := Nil;

  ObjEmpresa    := TEmpresa.Create;
  ContEmpresa   := TEmpresaController.Create;
  Try
    try

      ObjEmpresa := ContEmpresa.BuscarPorID(ParamsInt);

      if Assigned(ObjEmpresa) then
      begin
        cxCodigo.EditValue            := ObjEmpresa.id_empresa;
        cxcnpj.EditValue              := ObjEmpresa.cnpj;
        cxie.EditValue                := ObjEmpresa.ie;
        cxim.EditValue                := ObjEmpresa.im;
        cxrazao.EditValue             := ObjEmpresa.razao;
        cxfantasia.EditValue          := ObjEmpresa.fantasia;
        cxcep.EditValue               := ObjEmpresa.cep;
        cxendereco.EditValue          := ObjEmpresa.endereco;
        cxnumero.EditValue            := ObjEmpresa.numero;
        cxcomplemento.EditValue       := ObjEmpresa.complemento;
        cxbairro.EditValue            := ObjEmpresa.bairro;
        cxcidade.EditValue            := ObjEmpresa.id_cidade;
        cxemail.EditValue             := ObjEmpresa.email1;
        cxfone1.EditValue             := ObjEmpresa.telefone;
        cxfone2.EditValue             := ObjEmpresa.fone2;
        cxcelular1.EditValue          := ObjEmpresa.celular;
        cxcelular2.EditValue          := ObjEmpresa.celular2;
        cxwhatsapp.EditValue          := ObjEmpresa.whatsapp;

        if ObjEmpresa.tipo_atividade = 0 then
        cxregime.ItemIndex            := 0;

        if ObjEmpresa.tipo_atividade = 1 then
        cxregime.ItemIndex            := 1;

        if ObjEmpresa.tipo_atividade = 2 then
        cxregime.ItemIndex            := 2;

        //Foto
        if ObjEmpresa.logo <> '' then
        begin
          TConesul.ConvBase64Img(ObjEmpresa.logo);
          edtlogo.Picture             := TConeSul.nfoto;
          TConeSul.nfoto.Free;
        end;

        cxCNPJ.SetFocus;
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
    ObjEmpresa.Free;
    ContEmpresa.Free;
  End;
end;

function TFrmCadEmpresa.Salvar(out msg: string): Boolean;
var
AId:Integer;
begin
  Result        := False;

  ObjEmpresa    := nil;
  ContEmpresa   := nil;

  ObjEmpresa    := TEmpresa.Create;
  ContEmpresa   := TEmpresaController.Create;

  Try
    if ParamsStr='N' then
      ObjEmpresa.id_empresa       := 0
    else
      ObjEmpresa.id_empresa       := ParamsInt;
      ObjEmpresa.cnpj             := TiraPontos(cxcnpj.text);
      ObjEmpresa.ie               := Trim(cxie.Text);
      ObjEmpresa.im               := Trim(cxim.Text);
      ObjEmpresa.razao            := trim(cxrazao.Text);
      ObjEmpresa.fantasia         := Trim(cxfantasia.Text);
      ObjEmpresa.cep              := TiraPontos(cxcep.Text);
      ObjEmpresa.endereco         := Trim(cxendereco.Text);
      ObjEmpresa.numero           := Trim(cxnumero.Text);
      ObjEmpresa.complemento      := trim(cxcomplemento.Text);
      ObjEmpresa.bairro           := Trim(cxbairro.Text);
      ObjEmpresa.id_cidade        := cxcidade.EditValue;
      ObjEmpresa.email1           := Trim(cxemail.Text);
      ObjEmpresa.telefone         := TiraPontos(cxfone1.Text);
      ObjEmpresa.telefone         := TiraPontos(cxfone1.Text);
      ObjEmpresa.fone2            := TiraPontos(cxfone2.Text);
      ObjEmpresa.celular          := TiraPontos(cxcelular1.Text);
      ObjEmpresa.celular2         := TiraPontos(cxcelular2.Text);
      ObjEmpresa.whatsapp         := TiraPontos(cxwhatsapp.Text);

      case cxregime.ItemIndex of
        0:ObjEmpresa.tipo_atividade   :=0;
        1:ObjEmpresa.tipo_atividade   :=1;
        2:ObjEmpresa.tipo_atividade   :=2;
      end;

      if (edtlogo.Picture <> nil) and (not edtlogo.Picture.Graphic.Empty) then
      ObjEmpresa.logo             := TConeSul.ConvImgBase64(edtlogo);

      Try
        if ContEmpresa.Salvar(ObjEmpresa, AId) then
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
    FreeAndNil(ContEmpresa);
    FreeAndNil(ObjEmpresa);
  End;
end;

function TFrmCadEmpresa.ValidarCampos(out msg: string): Boolean;
var
rCod:integer;
begin
  Result  := True;

  if (Tirapontos(cxcnpj.text)='') then
  begin
    msg     := 'Informe um CNPJ!';
    Result  := False;
    exit;
  end;

  if ParamsStr ='N' then
  begin
    if (TiraPontos(cxCNPJ.Text) <> '') then
    begin
      if TConfiguracaoService.ValidarEmpresaExits(rCod,TiraPontos(cxcnpj.Text)) then
      begin
        Result  := False;
        msg     := 'Empresa já tem um cadastro no sistema!'+#13+'Código: '+inttostr(rCod);
        exit;
      end;
    end;
  end;

  if (cxrazao.Text='')  or (Length(cxrazao.Text) < 5 ) then
  begin
    msg     := 'Informe a razão social da empresa!';
    Result  := False;
    exit;
  end;

  if (cxCidade.Text = '') or (cxCidade.EditValue=0) then
  begin
    msg     := 'Selecione uma cidade!';
    Result  := False;
    exit;
  end;

  if (cxregime.ItemIndex =-1) or (cxregime.Text='') then
  begin
    msg     := 'Selecione um regime tributário!';
    Result  := False;
    exit;
  end;
end;

end.
