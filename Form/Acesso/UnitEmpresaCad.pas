unit UnitEmpresaCad;

interface

uses
  UnitBaseNovoCadastro, cxGraphics, cxControls, cxLookAndFeels,
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
  dxSkinXmas2008Blue, ACBrValidador, Data.DB, DBAccess, Uni, ACBrBase,
  ACBrEnterTab, cxButtonEdit, Vcl.ExtCtrls, cxGroupBox, cxMaskEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxDropDownEdit, cxTextEdit,
  Vcl.Buttons, Vcl.Controls, System.Classes, Vcl.StdCtrls;

type
  TFrmEmpresaCad = class(TForm)
    lblTitulo: TLabel;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    Label1: TLabel;
    edtcodigo: TcxTextEdit;
    edtrazao: TcxTextEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtfantasia: TcxTextEdit;
    edtie: TcxTextEdit;
    edtregime: TcxComboBox;
    Label9: TLabel;
    edtendereco: TcxTextEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edtnumero: TcxTextEdit;
    edtcomplemento: TcxTextEdit;
    Label13: TLabel;
    edtbairro: TcxTextEdit;
    Label14: TLabel;
    edtcidade: TcxLookupComboBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    edtfone1: TcxMaskEdit;
    edtfone2: TcxMaskEdit;
    edtcelular1: TcxMaskEdit;
    edtcelular2: TcxMaskEdit;
    edtwhats: TcxMaskEdit;
    Paneltitulo: TPanel;
    edtemail: TcxTextEdit;
    Label22: TLabel;
    Label27: TLabel;
    edtim: TcxTextEdit;
    Label2: TLabel;
    edtcnae: TcxTextEdit;
    Label5: TLabel;
    cxGroupBox4: TcxGroupBox;
    edtlogo: TImage;
    ACBrEnterTab1: TACBrEnterTab;
    dsCidade: TUniDataSource;
    edtcep: TcxButtonEdit;
    edtcnpj: TcxButtonEdit;
    ACBrValidadorCNpj: TACBrValidador;
    //procedure btnCancelarClick(Sender: TObject);
    //procedure FormClose(Sender: TObject; var Action: TCloseAction);
    //procedure btnSalvarClick(Sender: TObject);
    //procedure FormShow(Sender: TObject);
    //procedure edtcnpjPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    //procedure edtcepPropertiesButtonClick(Sender: TObject;AButtonIndex: Integer);
    //procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    //procedure edtlogoDblClick(Sender: TObject);
  private
    { Private declarations }
    //Function Salvar(out msg:string):Boolean;
    //Function ValidarCampos(out msg:string):Boolean;
    //Procedure CarregarDados;
    //Procedure CarregarCidade;
    //function ValidarTamanhoImagem(caminhoImagem: string; larguraMax, alturaMax: Integer): Boolean;
  public
    { Public declarations }
  end;

var
  FrmEmpresaCad: TFrmEmpresaCad;

implementation

{$R *.dfm}

Uses Udm, model.Empresa, Vcl.Session, uJKDialog, uRotinasComuns, UConeSul,
  Vcl.Validacoes, uConfiguracaoService;

{TFrmEmpresaCad}

{
procedure TFrmEmpresaCad.btnCancelarClick(Sender: TObject);
begin
    TNavigation.Close(Self);
end;

procedure TFrmEmpresaCad.btnSalvarClick(Sender: TObject);
var
msg :String;
begin
  //

  if ValidarCampos(msg) then
  begin
    Try
       if Salvar(msg) then
        begin
          JKDialog('Sucesso',msg, tdSucesso);
          TNavigation.Close(Self);
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

procedure TFrmEmpresaCad.CarregarCidade;
var
msg:string;
begin
  dm.PopularCidade(msg);
end;

procedure TFrmEmpresaCad.CarregarDados;
var
Empresa : TModelEmpresa;
msg:string;
begin

  Try
    try
      empresa             := TModelempresa.Create;
      empresa.idempresa   := TNavigation.ParamInt;

      if empresa.Select(msg) then
      begin
        edtcodigo.EditValue   := empresa.idempresa;
        edtcnpj.EditValue     := empresa.cnpj;
        edtie.EditValue       := empresa.ie;
        edtim.EditValue       := empresa.im;
        edtcnae.EditValue     := empresa.cnae;
        edtrazao.EditValue    := empresa.razao;
        edtfantasia.EditValue := empresa.fantasia;
        edtcep.EditValue      := empresa.cep;
        edtendereco.EditValue := empresa.endereco;
        edtnumero.EditValue   := empresa.numero;
        edtbairro.EditValue   := empresa.bairro;
        edtcomplemento.EditValue  := empresa.complemento;
        edtcidade.EditValue   := empresa.idcidade;
        edtemail.EditValue    := empresa.email1;
        edtfone1.EditValue    := empresa.telefone;
        edtfone2.EditValue    := empresa.telefone2;
        edtcelular1.EditValue := empresa.celular;
        edtcelular2.EditValue := empresa.celular2;
        edtwhats.EditValue    := empresa.whatsapp;
        edtregime.ItemIndex   := empresa.regime;

        if empresa.logo <> '' then
        begin
          TConesul.ConvBase64Img(empresa.logo);
          edtlogo.Picture         := TConeSul.nfoto;
          TConeSul.nfoto.Free;
        end;

      end;

    Except on e:exception do
      begin
        msg := msg+' :'+e.Message;
        raise;
      end;
    end;
  Finally
    Empresa.Free;
  End;
end;

procedure TFrmEmpresaCad.edtcepPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  //Buscar cep
  try
    Dm.ACBrCEP.BuscarPorCEP(edtcep.Text);
    edtendereco.EditValue       := dm.cepEndereco;
    edtcomplemento.EditValue    := dm.cepComplemento;
    edtbairro.EditValue         := dm.cepBairro;
    edtCidade.EditValue         := dm.CepidCidade;

    edtendereco.SetFocus;
  except
    On E: Exception do
    begin
      JKDialog('Error',E.Message, tdErro);
    end;
  end;
end;

procedure TFrmEmpresaCad.edtcnpjPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin

  //Buscar dados CNPJ

  ACBrValidador1.TipoDocto := docCNPJ;
  ACBrValidador1.Documento := edtcnpj.Text;

  if not ACBrValidador1.Validar then
      raise Exception.Create(ACBrValidador1.MsgErro);

  try
      dmrotinas.Pessoa.Clear;
      dmrotinas.BuscaCNPJ(tirapontos(edtcnpj.text));


      edtrazao.EditValue      := UpperCase(dmrotinas.Pessoa.razao);
      edtfantasia.EditValue   := UpperCase(dmrotinas.Pessoa.fantasia);
      edtendereco.EditValue   := UpperCase(dmrotinas.Pessoa.Logradouro);
      edtnumero.EditValue     := UpperCase(dmrotinas.Pessoa.numero);
      edtBairro.EditValue     := UpperCase(dmrotinas.Pessoa.Bairro);
      //edtcidade.EditValue     := UpperCase(dmrotinas.Pessoa.Municipio);
      //reguf                   := UpperCase(dmrotinas.Pessoa.uf);
      edtcep.EditValue        := UpperCase(tirapontos(dmrotinas.Pessoa.cep));
      edtemail.text           := LowerCase(dmrotinas.Pessoa.email);
      edtfone1.EditValue      := dmrotinas.pessoa.telefone;
      edtCidade.EditValue     := dm.BuscarCidadeMunicipio(0,UpperCase(dmrotinas.Pessoa.Municipio));

  except on E: Exception do
    raise Exception.Create(E.Message);
  end;
end;

procedure TFrmEmpresaCad.edtlogoDblClick(Sender: TObject);
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
      if ValidarTamanhoImagem(OpenDialog.FileName,1400,1400) then
      // Carrega a imagem selecionada no TImage
      edtlogo.Picture.LoadFromFile(OpenDialog.FileName)
      else
      Showmessage('Verifique o tamanho a imagem!');
    end;
  finally
    // Libera o objeto TOpenDialog
    OpenDialog.Free;
  end;
end;

function TFrmEmpresaCad.ValidarTamanhoImagem(caminhoImagem: string;
  larguraMax, alturaMax: Integer): Boolean;
var
  picture: TPicture;
begin
  Result := False;
  picture := TPicture.Create;
  try
    try
      picture.LoadFromFile(caminhoImagem);
      if (picture.Width <= larguraMax) and (picture.Height <= alturaMax) then
        Result := True;
    except
      // Lidar com erros de carregamento de arquivo aqui
    end;
  finally
    picture.Free;
  end;
end;


procedure TFrmEmpresaCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    FrmEmpresaCad := nil;
end;

procedure TFrmEmpresaCad.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F10 then
  begin
    btnsalvar.Click;
    key:=0;
  end;

  if key = vk_escape then
  begin
    btncancelar.Click;
    key :=0;
  end;

end;

procedure TFrmEmpresaCad.FormShow(Sender: TObject);
begin
  //carregar cidade
  CarregarCidade;
  if TNavigation.ParamsStr='V' then
  begin
    lblTitulo.Caption := 'Visualizando Empresa';
    CarregarDados;

    btnSalvar.Enabled   := false;
  end;

  if TNavigation.ParamsStr='E' then
  begin
    lblTitulo.Caption := 'Editando Empresa';
    CarregarDados;
    edtcnpj.SetFocus;
    edtcnpj.Properties.ReadOnly := True;

  end;

  if TNavigation.ParamsStr = 'N' then
  edtcnpj.SetFocus;
end;

function TFrmEmpresaCad.Salvar(out msg: string): Boolean;
var
Empresa : TModelEmpresa;
id:integer;
ModelVal  : TValidacao;
begin
  Result  := False;
  Try
    try
      Empresa           :=  TModelEmpresa.Create;

      empresa.cnpj        :=  TiraPontos(edtcnpj.Text);
      empresa.ie          :=  Trim(edtie.Text);
      empresa.im          :=  Trim(edtim.Text);
      empresa.cnae        :=  Trim(edtcnae.Text);
      empresa.razao       :=  Trim(edtrazao.Text);
      empresa.fantasia    :=  Trim(edtfantasia.Text);
      empresa.cep         :=  TiraPontos(Trim(edtcep.Text));
      empresa.endereco    :=  Trim(edtendereco.Text);
      empresa.numero      :=  Trim(edtnumero.Text);
      empresa.complemento :=  Trim(edtcomplemento.Text);
      empresa.bairro      :=  Trim(edtbairro.Text);
      empresa.idcidade    :=  edtcidade.EditValue;
      empresa.email1      :=  Trim(edtemail.Text);
      empresa.telefone    :=  TiraPontos(edtfone1.Text);
      empresa.telefone2   :=  TiraPontos(edtfone2.Text);
      empresa.celular     :=  TiraPontos(edtcelular1.Text);
      empresa.celular2    :=  TiraPontos(edtcelular2.Text);
      empresa.whatsapp    :=  TiraPontos(edtwhats.Text);
      empresa.regime      :=  edtregime.ItemIndex;

      if edtlogo.Picture.Graphic <> nil then
      begin
        empresa.logo        := TConeSul.ConvImgBase64(edtlogo);
      end;

      if TNavigation.ParamsStr='N' then
      begin
        if Empresa.Insert(msg,id) then;
        Result  := True;
      end
      else
      begin
        Empresa.idempresa := TNavigation.ParamInt;
        if empresa.Update(msg) then;
        begin
          Result  := True;
          if TConfiguracaoService.ValidarUsoAppVeiculo(TNavigation.ParamInt) then
          begin
            DM.SincronizarGravar(19, TNavigation.ParamInt)
          end;

        end;

      end;

    Except on e:exception do
      begin
        msg := msg+' :'+e.Message;
        raise;
      end;
    end;
  Finally
    Empresa.Free;
  End;
end;

function TFrmEmpresaCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if (edtcnpj.Text='') or (edtcnpj.Text='  .   .   /    -  ') then
  begin
    msg     := 'Informe um CNPJ!';
    Result  := False;
    Exit;
  end;

  if (edtrazao.Text='') then
  begin
    msg     := 'Informe a razão da empresa!';
    Result  := False;
    Exit;
  end;

  if (edtCidade.Text='') then
  begin
    msg     := 'Informe uma cidade!';
    Result  := False;
    Exit;
  end;


end;
}
end.
