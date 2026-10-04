unit UnitPessoaCad;

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
  Data.DB, DBAccess, Uni, ACBRUTIL, dxBarBuiltInMenu, cxPC, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxCalendar, cxCurrencyEdit, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  UnitBaseNovoCadastro, Vcl.ButtonStylesAttributes, Vcl.StyledButton,
  Controller.Pessoa, Model.Pessoa, Datasnap.DBClient, Controller.LookupHelper,
  UnitCadCidade, UCEPService, ACBRCEP, uConfiguracaoService;

type
  TFrmPessoaCad = class(TFormNovoBaseCadastro)
    dsCidade: TUniDataSource;
    cxPage: TcxPageControl;
    TabDados: TcxTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    labelOrgao: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label8: TLabel;
    edtcodigo: TcxTextEdit;
    cxNome: TcxTextEdit;
    cxpessoa: TcxComboBox;
    cxCPF: TcxButtonEdit;
    cxApelido: TcxTextEdit;
    cxRG: TcxTextEdit;
    cxorgao: TcxTextEdit;
    cxCep: TcxButtonEdit;
    cxEndereco: TcxTextEdit;
    cxNumero: TcxTextEdit;
    cxComplemento: TcxTextEdit;
    cxBairro: TcxTextEdit;
    cxCidade: TcxLookupComboBox;
    cxFone1: TcxMaskEdit;
    cxfone2: TcxMaskEdit;
    cxcelular1: TcxMaskEdit;
    cxcelular2: TcxMaskEdit;
    cxWhatsapp: TcxMaskEdit;
    cxObs: TcxBlobEdit;
    cxAviso: TcxBlobEdit;
    cxEmail: TcxTextEdit;
    cxResp: TcxTextEdit;
    btncacidade: TcxButtonEdit;
    TabAdicionais: TcxTabSheet;
    Label5: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    cxSexo: TcxComboBox;
    cxcivel: TcxComboBox;
    cxNascimento: TcxDateEdit;
    cxNatural: TcxLookupComboBox;
    cxPai: TcxTextEdit;
    cxMae: TcxTextEdit;
    cxCNH: TcxComboBox;
    cxtpresidencia: TcxComboBox;
    cxTempo: TcxTextEdit;
    cxemissaorg: TcxDateEdit;
    cxNacionalidade: TcxTextEdit;
    btnCidadenatural: TcxButtonEdit;
    TabProfissional: TcxTabSheet;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    prof_cnpj: TcxButtonEdit;
    prof_cep: TcxButtonEdit;
    prof_endereco: TcxTextEdit;
    prof_numero: TcxTextEdit;
    prof_complemento: TcxTextEdit;
    prof_bairro: TcxTextEdit;
    prof_cidade: TcxLookupComboBox;
    prof_razao: TcxTextEdit;
    prof_telefone: TcxMaskEdit;
    prof_admissao: TcxDateEdit;
    Prof_renda: TcxCurrencyEdit;
    prof_profissao: TcxTextEdit;
    prof_temposervico: TcxTextEdit;
    cxButtonEdit2: TcxButtonEdit;
    TabReferencia: TcxTabSheet;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    ref_banco1: TcxTextEdit;
    ref_agencia1: TcxTextEdit;
    ref_conta1: TcxTextEdit;
    ref_telefone1: TcxMaskEdit;
    ref_tempo1: TcxTextEdit;
    ref_banco2: TcxTextEdit;
    ref_agencia2: TcxTextEdit;
    ref_conta2: TcxTextEdit;
    ref_telefone2: TcxMaskEdit;
    ref_tempo2: TcxTextEdit;
    ref_pessoal1: TcxTextEdit;
    ref_telefone3: TcxMaskEdit;
    ref_afinidade1: TcxTextEdit;
    ref_pessoal2: TcxTextEdit;
    ref_telefone4: TcxMaskEdit;
    ref_afinidade2: TcxTextEdit;
    ref_comercial1: TcxTextEdit;
    ref_telefone5: TcxMaskEdit;
    ref_comercial2: TcxTextEdit;
    ref_telefone6: TcxMaskEdit;
    TabFinanciamento: TcxTabSheet;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    fin_veiculo1: TcxTextEdit;
    fin_ano1: TcxTextEdit;
    fin_financio1: TcxComboBox;
    fin_parcela1: TcxCurrencyEdit;
    fin_veiculo2: TcxTextEdit;
    fin_ano2: TcxTextEdit;
    fin_financio2: TcxComboBox;
    fin_parcela2: TcxCurrencyEdit;
    fin_veiculo3: TcxTextEdit;
    fin_ano3: TcxTextEdit;
    fin_financio3: TcxComboBox;
    fin_parcela3: TcxCurrencyEdit;
    fin_veiculo4: TcxTextEdit;
    fin_ano4: TcxTextEdit;
    fin_financio4: TcxComboBox;
    fin_parcela4: TcxCurrencyEdit;
    fin_outros: TcxTextEdit;
    TabOperacoes: TcxTabSheet;
    cxGrid: TcxGrid;
    Grid: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    Label1: TLabel;
    dxBevel2: TdxBevel;
    edtFoto: TImage;
    cxsituacao: TcxComboBox;
    Label27: TLabel;
    cxcliente: TcxCheckBox;
    cxFornecedor: TcxCheckBox;
    cxEnvemail: TcxCheckBox;
    cxenvwhatsapp: TcxCheckBox;
    cxExibirapp: TcxCheckBox;
    TabCidade: TClientDataSet;
    TabCidadeid_cidade: TIntegerField;
    TabCidadecidade: TStringField;
    TabCidadeuf: TStringField;
    TabCidadencidade: TStringField;
    ACBrValidador1: TACBrValidador;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxpessoaPropertiesEditValueChanged(Sender: TObject);
    procedure edtFotoDblClick(Sender: TObject);
    procedure btncacidadePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCepPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    
  private
    procedure ValidarTipoPessoa(i: integer);
    { Private declarations }
  public
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;
    { Public declarations }
  end;

var
  FrmPessoaCad: TFrmPessoaCad;
  ObjPessoa   : TPESSOA;
  ContPessoa  : TPessoaController;

implementation

{$R *.dfm}

Uses UConeSul,Vcl.Loading, Vcl.Session, uJKDialog, UnitGlobal;

procedure TFrmPessoaCad.btncacidadePropertiesButtonClick(Sender: TObject;
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

procedure TFrmPessoaCad.cxCepPropertiesButtonClick(Sender: TObject;
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

procedure TFrmPessoaCad.cxpessoaPropertiesEditValueChanged(Sender: TObject);
begin
  if cxPessoa.ItemIndex >-1 then
  ValidarTipoPessoa(cxPessoa.ItemIndex);
end;

procedure TFrmPessoaCad.edtFotoDblClick(Sender: TObject);
var
  OpenDialog: TOpenDialog;
begin
  try
    OpenDialog := TOpenDialog.Create(nil);
    try
      OpenDialog.Filter := 'Imagens JPEG|*.jpg;*.jpeg|Imagens PNG|*.png;*.png';
      OpenDialog.Title := 'Selecione uma foto';

      if OpenDialog.Execute then
      begin
        edtfoto.Picture.LoadFromFile(OpenDialog.FileName);
      end;
    finally
      OpenDialog.Free;
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmPessoaCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  TConeSul.nfoto:=nil;
  FrmPessoaCad  := nil;
end;

procedure TFrmPessoaCad.FormCreate(Sender: TObject);
begin
  inherited;
  if TSession.oneGaragem='S' then
  begin
    TabProfissional.TabVisible := True;
    TabReferencia.TabVisible   := True;
    TabFinanciamento.TabVisible:= True;
    TabOperacoes.TabVisible    := True;
  end
  else
  begin
    TabProfissional.TabVisible := False;
    TabReferencia.TabVisible   := False;
    TabFinanciamento.TabVisible:= False;
    TabOperacoes.TabVisible    := False;
  end;
end;

procedure TFrmPessoaCad.FormShow(Sender: TObject);
begin
  inherited;
  Tabdados.SetFocus;

  TLookupHelper.CarregarLookup(
                  TabCidade,LookupCidadeSql);
  
  try
    if ParamsStr = 'N' then
    begin
      TitleText   := ' Nova Pessoa';
      cxsituacao.ItemIndex    := 0;
      cxcliente.Checked       := True;
      cxfornecedor.Checked    := False;
      cxEnvemail.Checked      := True;
      cxenvwhatsapp.Checked   := True;
      ValidarTipoPessoa(0);
      cxPessoa.SetFocus;
    end
    else
    begin
      PopularCampos;
      ValidarTipoPessoa(cxpessoa.ItemIndex);
      TitleText   := ' Editar Pessoa';
      cxPessoa.SetFocus;
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmPessoaCad.ValidarTipoPessoa(i: integer);
begin
  case I of
    0:begin //Fisica
      cxcpf.Properties.EditMask  := '###.###.###-##';
      labelOrgao.Visible          := True;
      cxorgao.Visible            := True;
      cxrg.Width                 := 113;
    end;
    1:begin //juridica
      cxcpf.Properties.EditMask  := '##.###.###/####-##';
      labelOrgao.Visible         := False;
      cxorgao.Visible            := False;
      cxrg.Width                 := 177;
      TabAdicionais.TabVisible   := False;
      {cxSexo.Enabled             := False;
      cxcivel.Enabled            := false;
      cxnascimento.Enabled       := False;
      cxnatural.Enabled          := false;
      btnCidadenatural.Enabled   := False;
      cxpai.Enabled              := false;
      cxmae.Enabled              := false;
      cxcnh.Enabled              := false;
      cxtpresidencia.Enabled     := false;
      cxtempo.Enabled            := false;
      cxemissaorg.Enabled        := false;
      cxnacionalidade.Enabled    := false;}
    end;
  end;
end;

procedure TFrmPessoaCad.PopularCampos;
begin
inherited;
  try
    ObjPessoa        := Nil;
    ContPessoa       := Nil;

    ObjPessoa        := TPESSOA.Create;
    ContPessoa       := TPessoaController.Create;
      Try

        ObjPessoa    := ContPessoa.BuscarPorID(ParamsInt);
        if Assigned(ObjPessoa) then
        begin
          edtCodigo.EditValue       := ObjPessoa.codigo;
          cxPessoa.EditValue        := ObjPessoa.clitipo;
          cxcpf.EditValue          := ObjPessoa.cpf;
          cxrg.EditValue           := ObjPessoa.rg;
          cxorgao.EditValue        := ObjPessoa.orgao;
          cxnome.EditValue         := ObjPessoa.nome;
          cxapelido.EditValue      := ObjPessoa.apelido;
          cxcep.EditValue          := ObjPessoa.cep;
          cxendereco.EditValue     := ObjPessoa.endereco;
          cxNumero.EditValue       := ObjPessoa.numero;
          cxBairro.EditValue       := ObjPessoa.bairro;
          cxcomplemento.EditValue  := ObjPessoa.complemento;
          cxcidade.EditValue       := ObjPessoa.idcidade;
          cxemail.EditValue        := ObjPessoa.email;
          cxResp.EditValue         :=  objPessoa.responsavel;
          cxfone1.EditValue         := ObjPessoa.telefone;
          cxfone2.EditValue         := objpessoa.telefone2;
          cxCelular1.EditValue      := ObjPessoa.celular;
          cxCelular2.EditValue      := ObjPessoa.celular2;
          cxwhatsapp.EditValue      := ObjPessoa.whatsapp;
          cxsituacao.EditValue     := ObjPessoa.situacao;
          cxobs.EditValue          := ObjPessoa.obs;
          cxAviso.EditValue        := ObjPessoa.aviso;
          cxcliente.EditValue      := objpessoa.cliente;
          cxFornecedor.EditValue   := objpessoa.fornecedor;
          cxEnvemail.EditValue     := objpessoa.envemail;
          cxenvwhatsapp.EditValue   := objpessoa.envwhats;
          cxExibirapp.EditValue   := objpessoa.app;

          cxsexo.EditValue         := ObjPessoa.sexo;
          cxcivel.EditValue        := ObjPessoa.civil;
          cxnascimento.EditValue   := TConeSul.ValidarDataNull(ObjPessoa.nascimento);
          cxnatural.EditValue      := ObjPessoa.naturalde;
          cxpai.EditValue          := ObjPessoa.pai;
          cxmae.EditValue          := ObjPessoa.mae;
          cxcnh.EditValue         := objpessoa.cnh;
          cxtpresidencia.EditValue:= objpessoa.tiporesidencia;
          cxTempo.EditValue       := objpessoa.temporesidencia;
          cxemissaorg.EditValue   := TConeSul.ValidarDataNull(ObjPessoa.emissaorg);
          cxNacionalidade.EditValue:= objpessoa.nacionalidade;

          if ObjPessoa.foto <> '' then
          begin
            TConesul.ConvBase64Img(ObjPessoa.foto);
            edtFoto.Picture         := TConeSul.nfoto;
            TConeSul.nfoto.Free;
          end;
          cxpessoa.SetFocus;
        end
        else
        begin
          JKDialog('Aviso','Não foi possivel carregar os dados.', tdAlerta);
          exit;
        end;

    Finally
      ObjPessoa.Free;
      ContPessoa.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmPessoaCad.Salvar(out msg: string): Boolean;
var
AId:Integer;
begin
  Result        := False;
  ContPessoa    := Nil;
  Objpessoa     := Nil;

  try
    ContPessoa  := TPessoaController.Create;
    Objpessoa   := TPESSOA.create;

    Try
      if ParamsStr='N' then
      ObjPessoa.idsocio     := 0
      else
      ObjPessoa.idsocio     := ParamsInt;

      ObjPessoa.clitipo     := cxPessoa.Text;
      ObjPessoa.cpf         := TiraPontos(cxCPF.Text);
      ObjPessoa.rg          := TiraPontos(Trim(cxRg.Text));
      ObjPessoa.orgao       := Trim(cxOrgao.Text);
      ObjPessoa.nome        := Trim(cxNome.Text);
      ObjPessoa.apelido     := Trim(cxApelido.Text);
      ObjPessoa.cep         := TiraPontos(cxCep.Text);
      ObjPessoa.endereco    := Trim(cxEndereco.Text);
      ObjPessoa.numero      := Trim(cxNumero.Text);
      ObjPessoa.bairro      := Trim(cxBairro.Text);
      ObjPessoa.complemento := Trim(cxComplemento.Text);
      ObjPessoa.idcidade    := cxCidade.EditValue;
      ObjPessoa.email       := Trim(cxemail.Text);
      ObjPessoa.responsavel := Trim(cxResp.Text);
      ObjPessoa.telefone    := TiraPontos(cxFone1.Text);
      ObjPessoa.telefone2   := TiraPontos(cxFone2.Text);
      ObjPessoa.celular     := TiraPontos(cxCelular1.Text);
      ObjPessoa.celular2    := TiraPontos(cxCelular2.Text);
      ObjPessoa.whatsapp    := TiraPontos(cxwhatsapp.Text);
      ObjPessoa.situacao    := cxSituacao.Text;
      ObjPessoa.obs         := Trim(cxObs.Text);
      ObjPessoa.aviso       := Trim(cxAviso.Text);
      ObjPessoa.cliente     := cxcliente.EditValue;
      ObjPessoa.fornecedor  := cxFornecedor.EditValue;
      ObjPessoa.envemail    := cxenvemail.EditValue;
      ObjPessoa.envwhats    := cxenvwhatsapp.EditValue;
      ObjPessoa.app         := cxexibirapp.EditValue;

      ObjPessoa.sexo        := cxsexo.Text;
      ObjPessoa.civil       := cxcivel.Text;
      if cxnascimento.EditValue = Null then
      ObjPessoa.nascimento  := Nulldate
      else
      ObjPessoa.nascimento  := cxnascimento.EditValue;
      ObjPessoa.naturalde   := cxnatural.EditValue;
      ObjPessoa.pai         := Trim(cxPai.Text);
      ObjPessoa.mae         := Trim(cxmae.Text);
      ObjPessoa.cnh         := cxcnh.Text;
      ObjPessoa.tiporesidencia  := cxtpresidencia.Text;
      ObjPessoa.temporesidencia := Trim(cxTempo.Text);
      if cxemissaorg.EditValue = Null then
      ObjPessoa.emissaorg  := Nulldate
      else
      ObjPessoa.emissaorg   := cxemissaorg.EditValue;
      ObjPessoa.nacionalidade   := Trim(cxNacionalidade.Text);
      ObjPessoa.idempresa   := TSession.IDEMPRESA;
      if ParamsStr='N' then
      ObjPessoa.sociodeste  := Now();
      ObjPessoa.bloqueado   := 'N';
      if edtFoto.Picture.Graphic <> nil then
      begin
        ObjPessoa.foto      := TConeSul.ConvImgBase64(edtfoto);
        TConeSul.nfoto:= nil;
      end;

      if ContPessoa.Salvar(ObjPessoa, AId) then
      begin
        if AID = 0 then
        AID     := ParamsInt;
        msg     := 'Registro salvo com sucesso, Código: '+IntToStr(AId);
        Result  := true;
        ParamsCloseTela := 'S';
      end;

    Finally
      FreeAndNil(ContPessoa);
      FreeAndNil(Objpessoa);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmPessoaCad.ValidarCampos(out msg: string): Boolean;
var
cod:integer;
begin
  Result  := True;
  if (cxpessoa.Text='') or (cxpessoa.ItemIndex=-1) then
  begin
    msg     := 'Selecione o tipo de pessoa!';
    Result  := False;
    Exit;
  end;

  if AppValidarCPFCNPJ = 'S' then // se e real
  begin
    if (TiraPontos(cxcpf.Text) ='') then
    begin
      msg     := 'Informe um CPF/CNPJ valido!';
      Result  := False;
      Exit;
    end;
  end;

  if (cxcpf.Text <>'') or  (cxcpf.Text<> '000.000.000-00') then
    begin
      ACBrValidador1.TipoDocto := docCPF;
      ACBrValidador1.Documento := cxcpf.EditValue;
      if not ACBrValidador1.Validar then
      msg     := ACBrValidador1.MsgErro;
      if msg = '' then
      Result  := True
      else
      Result  := False;
      exit;
    end;

    //Validar se o cadastro já existe.
    if ParamsStr ='N' then
    begin
      if (TiraPontos(cxcpf.Text) <> '') then
      begin
        if TConfiguracaoService.ValidarCadastroExitAssociado(cod,TiraPontos(cxcpf.Text)) then
        begin
          Result  := False;
          msg     := 'Pessoa já tem um cadastro com esse CPF/CNPJ!'+#13+'Código: '+inttostr(cod);
          exit;
        end;
      end;
    end;

  if cxNome.Text='' then
  begin
    msg     := 'Informe o nome/razão!';
    Result  := False;
    Exit;
  end;

  if (cxcidade.Text='') then
  begin
    msg     := 'Selecione uma cidade!';
    Result  := False;
    Exit;
  end;
end;

end.

//procedure TFrmPessoaCad.CarregarDadosEditar;
//var
//Pessoa : TModelSocio;
//msg:string;
//begin
//
//  Try
//    try
//      Pessoa                    := TModelSocio.Create;
//      Pessoa.idsocio            := TNavigation.ParamInt;
//
//      if Pessoa.Select(msg) then
//      begin
//
//        if (Pessoa.cliente = 'S') or (Pessoa.fornecedor='N') then
//        edtcodigo.EditValue     := Pessoa.codigo;
//        if (pessoa.fornecedor='S') or (Pessoa.cliente='N') then
//        edtcodigo.EditValue     := Pessoa.codfornecedor;
//        if (pessoa.cliente='S') and (pessoa.fornecedor='S') then
//        edtcodigo.EditValue     := Pessoa.codigo;
//
//        if Pessoa.clitipo='FÍSICA' then
//        begin
//          edtpessoa.ItemIndex := 0;
//          ValidarTipoPessoa(0);
//        end
//        else
//        begin
//          ValidarTipoPessoa(1);
//          edtpessoa.ItemIndex := 1;
//        end;
//        edtcpf.EditValue      := Pessoa.cpf;
//        edtie.EditValue       := Pessoa.rg;
//        edtorgao.EditValue    := Pessoa.orgao;
//        edtrazao.EditValue    := Pessoa.nome;
//        edtfantasia.EditValue := Pessoa.apelido;
//        edtcep.EditValue      := Pessoa.cep;
//        edtendereco.EditValue := Pessoa.endereco;
//        edtnumero.EditValue   := Pessoa.numero;
//        edtcomplemento.EditValue  := Pessoa.complemento;
//        edtbairro.EditValue   :=  Pessoa.bairro;
//        edtcidade.EditValue   :=  Pessoa.idcidade;
//        edtemail.EditValue    :=  pessoa.email;
//        edtfone1.EditValue    :=  pessoa.telefone;
//        edtfone2.EditValue    :=  pessoa.telefone2;
//        edtcelular1.EditValue :=  pessoa.celular;
//        edtcelular2.EditValue :=  pessoa.celular2;
//        edtwhats.EditValue    :=  pessoa.whatsapp;
//        edtresponsavel.EditValue  := pessoa.responsavel;
//        edtobs.EditValue      :=  pessoa.obs;
//        edtaviso.EditValue    :=  pessoa.aviso;
//        edtcliente.EditValue    :=  pessoa.cliente;
//        edtfornecedor.EditValue :=  pessoa.fornecedor;
//        edtenviaremail.EditValue:=  pessoa.envemail;
//        edtenviarwhats.EditValue:=  pessoa.envwhats;
//
//        if pessoa.situacao='ATIVO' then
//        edtativo.EditValue      := 'S'
//        else
//        edtativo.EditValue      := 'N';
//        edtApp.EditValue        := Pessoa.app;
//
//        if Pessoa.foto <> '' then
//        TConesul.ConvBase64Img(Pessoa.foto);
//        edtfoto.Picture         := TConeSul.nfoto;
//        if Pessoa.sexo <> null then
//        edtsexo.EditValue      := Pessoa.sexo;
//        if Pessoa.civil <> null then
//        edtcivil.EditValue     := Pessoa.civil;
//        if Pessoa.nascimento <> strtodate('30/12/1899') then
//        edtnascimento.EditValue := Pessoa.nascimento;
//
//        edtnatural.EditValue    := Pessoa.naturalde;
//        edtpai.EditValue        := Pessoa.pai;
//        edtmae.EditValue        := Pessoa.mae;
//        edtcnh.EditValue        := Pessoa.cnh;
//        edttiporesidencia.EditValue := Pessoa.tiporesidencia;
//        edttemporesidencia.EditValue:= Pessoa.temporesidencia;
//        if Pessoa.emissaorg <> strtodate('30/12/1899') then
//        edtdatarg.EditValue     := Pessoa.emissaorg;
//        edtnacionalidade.EditValue  := Pessoa.nacionalidade;
//
//        //dados profissionais/referencia
//        if TSession.oneGaragem='S' then
//        begin
//          prof_cnpj.EditValue             := Pessoa.ProfCNPJ;
//          prof_razao.EditValue            := Pessoa.ProfRazao;
//          prof_telefone.EditValue         := Pessoa.ProfTelefone;
//          prof_cep.EditValue              := Pessoa.ProfCep;
//          prof_endereco.EditValue         := Pessoa.ProfEndereco;
//          prof_numero.EditValue           := Pessoa.ProfNumero;
//          prof_complemento.EditValue      := Pessoa.ProfComplemento;
//          prof_bairro.EditValue           := Pessoa.ProfBairro;
//          prof_cidade.EditValue           := Pessoa.ProfIDCidade;
//          prof_temposervico.EditValue     := Pessoa.ProfTempoServico;
//          if Pessoa.admissao <> strtodate('30/12/1899') then
//          prof_admissao.EditValue         := Pessoa.admissao;
//          Prof_renda.EditValue            := Pessoa.salario;
//          prof_profissao.EditValue        := Pessoa.profissao;
//
//          ref_banco1.EditValue            := Pessoa.ref_banco1;
//          ref_banco2.editvalue	          := Pessoa.ref_banco2;
//          ref_agencia1.EditValue          := Pessoa.ref_agencia1;
//          ref_agencia2.EditValue          := Pessoa.ref_agencia2;
//          ref_conta1.EditValue            := Pessoa.ref_conta1;
//          ref_conta2.EditValue            := Pessoa.ref_conta2;
//          ref_telefone1.EditValue         := Pessoa.ref_telefone1;
//          ref_telefone2.EditValue         := Pessoa.ref_telefone2;
//          ref_tempo1.EditValue            := Pessoa.ref_tempo1;
//          ref_tempo2.EditValue            := Pessoa.ref_tempo2;
//          ref_pessoal1.EditValue          := Pessoa.ref_pessoal1;
//          ref_pessoal2.EditValue          := Pessoa.ref_pessoal2;
//          ref_telefone3.EditValue         := Pessoa.ref_telefone3;
//          ref_telefone4.EditValue         := Pessoa.ref_telefone4;
//          ref_afinidade1.editvalue        := Pessoa.ref_afinidade1;
//          ref_afinidade2.editvalue        := Pessoa.ref_afinidade2;
//          ref_comercial1.editvalue        := Pessoa.ref_comercial1;
//          ref_comercial2.editvalue        := Pessoa.ref_comercial2;
//          ref_telefone5.editvalue         := Pessoa.ref_telefone5;
//          ref_telefone6.editvalue         := Pessoa.ref_telefone6;
//
//          fin_veiculo1.EditValue          := Pessoa.fin_veiculo1;
//          fin_veiculo2.EditValue          := Pessoa.fin_veiculo2;
//          fin_veiculo3.EditValue          := Pessoa.fin_veiculo3;
//          fin_veiculo4.EditValue          := Pessoa.fin_veiculo4;
//          fin_ano1.EditValue              := Pessoa.fin_ano1;
//          fin_ano2.EditValue              := Pessoa.fin_ano2;
//          fin_ano3.EditValue              := Pessoa.fin_ano3;
//          fin_ano4.EditValue              := Pessoa.fin_ano4;
//          fin_financio1.EditValue         := Pessoa.fin_financio1;
//          fin_financio2.EditValue         := Pessoa.fin_financio2;
//          fin_financio3.EditValue         := Pessoa.fin_financio3;
//          fin_financio4.EditValue         := Pessoa.fin_financio4;
//          fin_parcela1.EditValue          := Pessoa.fin_parcela1;
//          fin_parcela2.EditValue          := Pessoa.fin_parcela2;
//          fin_parcela3.EditValue          := Pessoa.fin_parcela3;
//          fin_parcela4.EditValue          := Pessoa.fin_parcela4;
//          fin_outros.EditValue            := Pessoa.fin_outros;
//
//        end;
//
//      end;
//
//    Except on e:exception do
//      begin
//        msg := msg+' :'+e.Message;
//        raise;
//      end;
//    end;
//  Finally
//    Pessoa.Free;
//  End;
//end;

//procedure TFrmPessoaCad.edtcpfPropertiesButtonClick(Sender: TObject;
//  AButtonIndex: Integer);
//begin
//  if edtpessoa.ItemIndex = 0 then
//  begin
//    JKDialog('Aviso','Somente disponível para pessoa jurídica!', tdAlerta);
//    exit;
//  end;
//
//  //Buscar dados CNPJ
//
//  ACBrValidador1.TipoDocto := docCNPJ;
//  ACBrValidador1.Documento := edtcpf.Text;
//
//  if not ACBrValidador1.Validar then
//      raise Exception.Create(ACBrValidador1.MsgErro);
//
//  try
//      dmrotinas.Pessoa.Clear;
//      dmrotinas.BuscaCNPJ(tirapontos(edtcpf.text));
//
//
//      edtrazao.EditValue      := UpperCase(dmrotinas.Pessoa.razao);
//      edtfantasia.EditValue   := UpperCase(dmrotinas.Pessoa.fantasia);
//      edtendereco.EditValue   := UpperCase(dmrotinas.Pessoa.Logradouro);
//      edtnumero.EditValue     := UpperCase(dmrotinas.Pessoa.numero);
//      edtBairro.EditValue     := UpperCase(dmrotinas.Pessoa.Bairro);
//      //edtcidade.EditValue     := UpperCase(dmrotinas.Pessoa.Municipio);
//      //reguf                   := UpperCase(dmrotinas.Pessoa.uf);
//      edtcep.EditValue        := UpperCase(tirapontos(dmrotinas.Pessoa.cep));
//      edtemail.text           := LowerCase(dmrotinas.Pessoa.email);
//      edtfone1.EditValue      := dmrotinas.pessoa.telefone;
//      edtCidade.EditValue     := dm.BuscarCidadeMunicipio(0,UpperCase(dmrotinas.Pessoa.Municipio));
//
//  except on E: Exception do
//    raise Exception.Create(E.Message);
//  end;
//
//end;

//procedure TFrmPessoaCad.prof_cnpjPropertiesButtonClick(Sender: TObject;
//  AButtonIndex: Integer);
//begin
//
//  //Buscar dados CNPJ da empresa profissional
//
//  ACBrValidador1.TipoDocto := docCNPJ;
//  ACBrValidador1.Documento := prof_cnpj.Text;
//
//  if not ACBrValidador1.Validar then
//      raise Exception.Create(ACBrValidador1.MsgErro);
//
//  try
//      dmrotinas.Pessoa.Clear;
//      dmrotinas.BuscaCNPJ(tirapontos(prof_cnpj.text));
//
//      prof_razao.EditValue      := UpperCase(dmrotinas.Pessoa.razao);
//      prof_endereco.EditValue   := UpperCase(dmrotinas.Pessoa.Logradouro);
//      prof_numero.EditValue     := UpperCase(dmrotinas.Pessoa.numero);
//      prof_Bairro.EditValue     := UpperCase(dmrotinas.Pessoa.Bairro);
//      prof_cep.EditValue        := UpperCase(tirapontos(dmrotinas.Pessoa.cep));
//      prof_telefone.EditValue   := dmrotinas.pessoa.telefone;
//      prof_Cidade.EditValue     := dm.BuscarCidadeMunicipio(0,UpperCase(dmrotinas.Pessoa.Municipio));
//
//  except on E: Exception do
//    raise Exception.Create(E.Message);
//  end;
//end;
//


