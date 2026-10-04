unit UnitClienteCad;

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
  Data.DB, DBAccess, Uni;

type
  TFrmClienteCad = class(TForm)
    lblTitulo: TLabel;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    Label1: TLabel;
    edtcodigo: TcxTextEdit;
    edtrazao: TcxTextEdit;
    edtpessoa: TcxComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    labelOrgao: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtcpf: TcxButtonEdit;
    edtfantasia: TcxTextEdit;
    edtie: TcxTextEdit;
    edtorgao: TcxTextEdit;
    Label9: TLabel;
    edtcep: TcxButtonEdit;
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
    Label20: TLabel;
    Label21: TLabel;
    edtobs: TcxBlobEdit;
    edtaviso: TcxBlobEdit;
    Paneltitulo: TPanel;
    edtemail: TcxTextEdit;
    Label22: TLabel;
    Label27: TLabel;
    dxBevel1: TdxBevel;
    edtFoto: TImage;
    cxGroupBox2: TcxGroupBox;
    edtcliente: TcxCheckBox;
    edtfornecedor: TcxCheckBox;
    edtativo: TcxCheckBox;
    edtenviaremail: TcxCheckBox;
    edtenviarwhats: TcxCheckBox;
    edtresponsavel: TcxTextEdit;
    Label8: TLabel;
    ACBrEnterTab1: TACBrEnterTab;
    ACBrValidador1: TACBrValidador;
    dsCidade: TUniDataSource;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtFotoDblClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtcepPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtpessoaPropertiesEditValueChanged(Sender: TObject);
  private
    idpessoa:integer;
    Function Salvar(out msg:string):Boolean;
    Function ValidarCampos(out msg:string):Boolean;
    function ValidarTamanhoImagem(caminhoImagem: string; larguraMax,
      alturaMax: Integer): Boolean;
    procedure CarregarDadosEditar;
    Procedure ValidarTipoPessoa(i:integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmClienteCad: TFrmClienteCad;

implementation

{$R *.dfm}

Uses Model.Socio, UConeSul,UDm, Vcl.Loading, Vcl.Session, uJKDialog;

procedure TFrmClienteCad.btnCancelarClick(Sender: TObject);
begin
    TNavigation.Close(Self);
end;

procedure TFrmClienteCad.btnSalvarClick(Sender: TObject);
var
msg :String;
begin
  //

  if ValidarCampos(msg) then
  begin
    Try
       if Salvar(msg) then
        begin
          JKDialog('Aviso',msg, tdAlerta);
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

procedure TFrmClienteCad.CarregarDadosEditar;
var
Pessoa : TModelSocio;
msg:string;
begin

  Try
    try
      Pessoa                    := TModelSocio.Create;
      Pessoa.idsocio            := TNavigation.ParamInt;

      if Pessoa.Select(msg) then
      begin

        if (Pessoa.cliente = 'S') or (Pessoa.fornecedor='N') then
        edtcodigo.EditValue     := Pessoa.codigo;
        if (pessoa.fornecedor='S') or (Pessoa.cliente='N') then
        edtcodigo.EditValue     := Pessoa.fornecedor;
        if (pessoa.cliente='S') or (pessoa.fornecedor='S') then
        edtcodigo.EditValue     := Pessoa.codigo;

        if Pessoa.clitipo='FÍSICA' then
        begin
          edtpessoa.ItemIndex := 0;
          ValidarTipoPessoa(0);
        end
        else
        begin
          ValidarTipoPessoa(1);
          edtpessoa.ItemIndex := 1;
        end;
        edtcpf.EditValue      := Pessoa.cpf;
        edtie.EditValue       := Pessoa.rg;
        edtorgao.EditValue    := Pessoa.orgao;
        edtrazao.EditValue    := Pessoa.nome;
        edtfantasia.EditValue := Pessoa.apelido;
        edtcep.EditValue      := Pessoa.cep;
        edtendereco.EditValue := Pessoa.endereco;
        edtnumero.EditValue   := Pessoa.numero;
        edtcomplemento.EditValue  := Pessoa.complemento;
        edtbairro.EditValue   :=  Pessoa.bairro;
        edtcidade.EditValue   :=  Pessoa.idcidade;
        edtemail.EditValue    :=  pessoa.email;
        edtfone1.EditValue    :=  pessoa.telefone;
        edtfone2.EditValue    :=  pessoa.telefone2;
        edtcelular1.EditValue :=  pessoa.celular;
        edtcelular2.EditValue :=  pessoa.celular2;
        edtwhats.EditValue    :=  pessoa.whatsapp;
        edtresponsavel.EditValue  := pessoa.responsavel;
        edtobs.EditValue      :=  pessoa.obs;
        edtaviso.EditValue    :=  pessoa.aviso;
        edtcliente.EditValue    :=  pessoa.cliente;
        edtfornecedor.EditValue :=  pessoa.fornecedor;
        edtenviaremail.EditValue:=  pessoa.envemail;
        edtenviarwhats.EditValue:=  pessoa.envwhats;

        if Pessoa.foto <> '' then
        TConesul.ConvBase64Img(Pessoa.foto);
        edtfoto.Picture         := TConeSul.nfoto;


      end;

    Except on e:exception do
      begin
        msg := msg+' :'+e.Message;
        raise;
      end;
    end;
  Finally
    Pessoa.Free;
  End;
end;

procedure TFrmClienteCad.edtcepPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  //Buscar cep
  try
    Dm.ACBrCEP.BuscarPorCEP(edtcep.Text);
    edtendereco.EditValue       := dm.cepEndereco;
    edtcomplemento.EditValue    := dm.cepComplemento;
    edtbairro.EditValue         := dm.cepBairro;
    edtendereco.SetFocus;
  except
    On E: Exception do
    begin
      JKDialog('Error',E.Message, tdErro);
    end;
  end;
end;

procedure TFrmClienteCad.edtFotoDblClick(Sender: TObject);
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
      if ValidarTamanhoImagem(OpenDialog.FileName,400,800) then
      // Carrega a imagem selecionada no TImage
      edtfoto.Picture.LoadFromFile(OpenDialog.FileName)
      else
      JKDialog('Aviso','Verifique o tamanho a imagem!', tdAlerta);

    end;
  finally
    // Libera o objeto TOpenDialog
    OpenDialog.Free;
  end;
end;

procedure TFrmClienteCad.edtpessoaPropertiesEditValueChanged(Sender: TObject);
begin
  if edtpessoa.ItemIndex <>-1 then  
  ValidarTipoPessoa(edtpessoa.ItemIndex) ;
end;

procedure TFrmClienteCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    FrmClienteCad := nil;
end;

procedure TFrmClienteCad.FormShow(Sender: TObject);
begin
  if TNavigation.ParamsStr='V' then
  begin
    lblTitulo.Caption := 'Visualizando Pessoa';
    CarregarDadosEditar;
    btnSalvar.Enabled   := false;
  end;

  if TNavigation.ParamsStr='E' then
  begin
    lblTitulo.Caption := 'Editando Pessoa';
    CarregarDadosEditar;
    edtcpf.SetFocus;
  end;

  if TNavigation.ParamsStr = 'N' then
  begin
    edtativo.Checked        := True;
    edtcliente.Checked      := True;
    edtfornecedor.Checked   := False;
    edtenviaremail.Checked  := True;
    edtenviarwhats.Checked  := True;
    ValidarTipoPessoa(0);
    edtpessoa.SetFocus;

  end;
end;

function TFrmClienteCad.Salvar(out msg: string): Boolean;
var
Pessoa : TModelSocio;
id:integer;
begin
  Result  := False;
  Try
    try
        Pessoa                :=  TModelSocio.Create;

        Pessoa.cpf            := edtcpf.EditValue;
        Pessoa.rg             := edtie.EditValue;
        Pessoa.orgao          := edtorgao.EditValue;
        Pessoa.nome           := edtrazao.EditValue;
        Pessoa.apelido        := edtfantasia.EditValue;
        Pessoa.cep            := edtcep.EditValue;
        Pessoa.endereco       := edtendereco.EditValue;
        Pessoa.numero         := edtnumero.EditValue;
        Pessoa.complemento    := edtcomplemento.EditValue;
        Pessoa.bairro         := edtbairro.EditValue;
        Pessoa.idcidade       := edtcidade.EditValue;
        pessoa.email          := edtemail.EditValue;
        pessoa.telefone       := edtfone1.EditValue;
        pessoa.telefone2      := edtfone2.EditValue;
        pessoa.celular        := edtcelular1.EditValue;
        pessoa.celular2       := edtcelular2.EditValue;
        pessoa.whatsapp       := edtwhats.EditValue;
        pessoa.responsavel    := edtresponsavel.EditValue;
        pessoa.obs            := edtobs.EditValue;
        pessoa.aviso          := edtaviso.EditValue;
        pessoa.cliente        := edtcliente.EditValue;
        pessoa.fornecedor     := edtfornecedor.EditValue;
        pessoa.envemail       := edtenviaremail.EditValue;
        pessoa.envwhats       := edtenviarwhats.EditValue;


      if TNavigation.ParamsStr='N' then
      begin

        if Pessoa.Insert(msg) then;
        Result  := True;
      end
      else
      begin
        Pessoa.idsocio    := TNavigation.ParamInt;

        if Pessoa.Update(msg) then;
        Result  := True;
      end;

    Except on e:exception do
      begin
        msg := msg+' :'+e.Message;
        raise;
      end;
    end;
  Finally
    Pessoa.Free;
  End;
end;

function TFrmClienteCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if (edtpessoa.Text='') or (edtpessoa.ItemIndex=-1) then
  begin
    msg     := 'Selecione o tipo de pessoa!';
    Result  := False;
    Exit;
  end;


  if (edtcpf.Text ='') or (Length(edtcpf.Text) < 3) then
  begin
    msg     := 'Informe um CPF/CNPJ valido!';
    Result  := False;
    Exit;
  end;

  if (edtcidade.Text='') then
  begin
    msg     := 'Selecione uma cidade!';
    Result  := False;
    Exit;
  end;
end;

function TFrmClienteCad.ValidarTamanhoImagem(caminhoImagem: string; larguraMax,
  alturaMax: Integer): Boolean;
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

procedure TFrmClienteCad.ValidarTipoPessoa(i: integer);
begin
  case I of
    0:begin //Fisica
      edtcpf.Properties.EditMask  := '###.###.###-##';
      labelOrgao.Visible          := True;
      edtorgao.Visible            := True;
      edtie.Width                 := 124;
    end;
    1:begin //juridica
      edtcpf.Properties.EditMask  := '##.###.###/####-##';
      labelOrgao.Visible          := False;
      edtorgao.Visible            := False;
      edtie.Width                 := 237;
    end;
  end;
end;

end.
