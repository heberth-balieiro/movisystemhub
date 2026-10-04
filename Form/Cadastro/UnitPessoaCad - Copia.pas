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
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
  TFrmPessoaCad = class(TFormNovoBaseCadastro)
    dsCidade: TUniDataSource;
    cxGrupoDados: TcxGroupBox;
    cxPage: TcxPageControl;
    TabDados: TcxTabSheet;
    Label1: TLabel;
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
    dxBevel1: TdxBevel;
    edtFoto: TImage;
    Label8: TLabel;
    edtcodigo: TcxTextEdit;
    edtrazao: TcxTextEdit;
    edtpessoa: TcxComboBox;
    edtcpf: TcxButtonEdit;
    edtfantasia: TcxTextEdit;
    edtie: TcxTextEdit;
    edtorgao: TcxTextEdit;
    edtcep: TcxButtonEdit;
    edtendereco: TcxTextEdit;
    edtnumero: TcxTextEdit;
    edtcomplemento: TcxTextEdit;
    edtbairro: TcxTextEdit;
    edtcidade: TcxLookupComboBox;
    edtfone1: TcxMaskEdit;
    edtfone2: TcxMaskEdit;
    edtcelular1: TcxMaskEdit;
    edtcelular2: TcxMaskEdit;
    edtwhats: TcxMaskEdit;
    edtobs: TcxBlobEdit;
    edtaviso: TcxBlobEdit;
    edtemail: TcxTextEdit;
    cxGroupBox2: TcxGroupBox;
    edtcliente: TcxCheckBox;
    edtfornecedor: TcxCheckBox;
    edtativo: TcxCheckBox;
    edtenviaremail: TcxCheckBox;
    edtenviarwhats: TcxCheckBox;
    edtApp: TcxCheckBox;
    edtresponsavel: TcxTextEdit;
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
    edtsexo: TcxComboBox;
    edtcivil: TcxComboBox;
    edtnascimento: TcxDateEdit;
    edtnatural: TcxLookupComboBox;
    edtpai: TcxTextEdit;
    edtmae: TcxTextEdit;
    edtcnh: TcxComboBox;
    edttiporesidencia: TcxComboBox;
    edttemporesidencia: TcxTextEdit;
    edtdatarg: TcxDateEdit;
    edtnacionalidade: TcxTextEdit;
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
    edtCadPessoa: TcxButtonEdit;
    cxButtonEdit1: TcxButtonEdit;
    cxButtonEdit2: TcxButtonEdit;
    
  private
//    idpessoa:integer;
//    Function Salvar(out msg:string):Boolean;
//    Function ValidarCampos(out msg:string):Boolean;
//    function ValidarTamanhoImagem(caminhoImagem: string; larguraMax,
//      alturaMax: Integer): Boolean;
//    procedure CarregarDadosEditar;
//    Procedure ValidarTipoPessoa(i:integer);
//    procedure CarregarCidade;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPessoaCad: TFrmPessoaCad;

implementation

{$R *.dfm}

Uses UConeSul,UDm, Vcl.Loading, Vcl.Session, uJKDialog,uRotinasComuns, UnitGlobal;


end.

//procedure TFrmPessoaCad.btnCancelarClick(Sender: TObject);
//begin
//    TNavigation.Close(Self);
//end;
//
//procedure TFrmPessoaCad.btnSalvarClick(Sender: TObject);
//var
//msg :String;
//begin
//  //
//
//  if ValidarCampos(msg) then
//  begin
//    Try
//       if Salvar(msg) then
//        begin
//          JKDialog('Salvar',msg, tdSucesso);
//          TNavigation.Close(Self);
//        end
//        else
//        JKDialog('Aviso',msg, tdAlerta);
//
//
//    Except on e:exception do
//      begin
//        JKDialog('Aviso',msg+' :'+e.Message, tdErro);
//        raise
//      end;
//    End;
//  end
//  else
//  begin
//    JKDialog('Aviso',msg, tdAlerta);
//    exit;
//  end;
//end;
//
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
//
//procedure TFrmPessoaCad.edtcepPropertiesButtonClick(Sender: TObject;
//  AButtonIndex: Integer);
//begin
//  //Buscar cep
//  try
//    Dm.ACBrCEP.BuscarPorCEP(edtcep.Text);
//    edtendereco.EditValue       := dm.cepEndereco;
//    edtcomplemento.EditValue    := dm.cepComplemento;
//    edtbairro.EditValue         := dm.cepBairro;
//    edtCidade.EditValue         := dm.CepidCidade;
//
//    edtendereco.SetFocus;
//  except
//    On E: Exception do
//    begin
//      JKDialog('Error',E.Message, tdErro);
//    end;
//  end;
//end;
//
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
//
//procedure TFrmPessoaCad.edtFotoDblClick(Sender: TObject);
//var
//  OpenDialog: TOpenDialog;
//begin
//  // Cria um objeto TOpenDialog
//  OpenDialog := TOpenDialog.Create(nil);
//  try
//    // Configurações do diálogo
//    OpenDialog.Filter := 'Imagens JPEG|*.jpg;*.jpeg|Imagens PNG|*.png;*.png';
//    OpenDialog.Title := 'Selecione uma foto';
//
//    // Exibe o diálogo e verifica se o usuário selecionou um arquivo
//    if OpenDialog.Execute then
//    begin
//      if ValidarTamanhoImagem(OpenDialog.FileName,500,1000) then
//      // Carrega a imagem selecionada no TImage
//      edtfoto.Picture.LoadFromFile(OpenDialog.FileName)
//      else
//      JKDialog('Aviso','Verifique o tamanho a imagem!', tdAlerta);
//
//    end;
//  finally
//    // Libera o objeto TOpenDialog
//    OpenDialog.Free;
//  end;
//end;
//
//procedure TFrmPessoaCad.edtpessoaPropertiesEditValueChanged(Sender: TObject);
//begin
//  if edtpessoa.ItemIndex <>-1 then
//  ValidarTipoPessoa(edtpessoa.ItemIndex) ;
//end;
//
//procedure TFrmPessoaCad.FormClose(Sender: TObject; var Action: TCloseAction);
//begin
//    Action := TCloseAction.caFree;
//    FrmPessoaCad := nil;
//end;
//
//procedure TFrmPessoaCad.FormCreate(Sender: TObject);
//begin
//  if TSession.oneGaragem='S' then
//  begin
//    TabProfissional.TabVisible := True;
//    TabReferencia.TabVisible   := True;
//    TabFinanciamento.TabVisible:= True;
//    TabOperacoes.TabVisible    := True;
//  end
//  else
//  begin
//    TabProfissional.TabVisible := False;
//    TabReferencia.TabVisible   := False;
//    TabFinanciamento.TabVisible:= False;
//    TabOperacoes.TabVisible    := False;
//  end;
//
//end;
//
//procedure TFrmPessoaCad.FormKeyDown(Sender: TObject; var Key: Word;
//  Shift: TShiftState);
//begin
//   if key = vk_F5 then
//  begin
//    btnsalvar.Click;
//    key:=0;
//  end;
//
//  if key = vk_escape then
//  begin
//    btncancelar.Click;
//    key :=0;
//  end;
//end;
//
//procedure TFrmPessoaCad.FormShow(Sender: TObject);
//begin
//  Tabdados.SetFocus;
//  CarregarCidade;
//
//  if TNavigation.ParamsStr='V' then
//  begin
//    lblTitulo.Caption := 'Visualizando Pessoa';
//    CarregarDadosEditar;
//    btnSalvar.Enabled   := false;
//  end;
//
//  if TNavigation.ParamsStr='E' then
//  begin
//    lblTitulo.Caption := 'Editando Pessoa';
//    CarregarDadosEditar;
//    edtcpf.SetFocus;
//  end;
//
//  if TNavigation.ParamsStr = 'N' then
//  begin
//    edtativo.Checked        := True;
//    edtcliente.Checked      := True;
//    edtfornecedor.Checked   := False;
//    edtenviaremail.Checked  := True;
//    edtenviarwhats.Checked  := True;
//    ValidarTipoPessoa(0);
//    edtpessoa.SetFocus;
//
//  end;
//end;
//
//procedure TFrmPessoaCad.prof_cepPropertiesButtonClick(Sender: TObject;
//  AButtonIndex: Integer);
//begin
//  //buscar endereco profissional
//  //Buscar cep
//  try
//    Dm.ACBrCEP.BuscarPorCEP(prof_cep.Text);
//    prof_endereco.EditValue       := dm.cepEndereco;
//    prof_complemento.EditValue    := dm.cepComplemento;
//    prof_bairro.EditValue         := dm.cepBairro;
//    prof_Cidade.EditValue         := dm.CepidCidade;
//
//    prof_endereco.SetFocus;
//  except
//    On E: Exception do
//    begin
//      JKDialog('Error',E.Message, tdErro);
//    end;
//  end;
//end;
//
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
//function TFrmPessoaCad.Salvar(out msg: string): Boolean;
//var
//Pessoa : TModelSocio;
//id:integer;
//begin
//  Result  := False;
//  Try
//    try
//        Pessoa                :=  TModelSocio.Create;
//
//        Pessoa.cpf            := TiraPontos(edtcpf.text);
//        Pessoa.rg             := edtie.text;
//        Pessoa.orgao          := edtorgao.text;
//        Pessoa.nome           := edtrazao.text;
//        Pessoa.apelido        := edtfantasia.text;
//        Pessoa.cep            := TiraPontos(edtcep.text);
//        Pessoa.endereco       := edtendereco.text;
//        Pessoa.numero         := edtnumero.text;
//        Pessoa.complemento    := edtcomplemento.text;
//        Pessoa.bairro         := edtbairro.text;
//        Pessoa.idcidade       := edtcidade.EditValue;
//        pessoa.email          := edtemail.text;
//        pessoa.telefone       := TiraPontos(edtfone1.text);
//        pessoa.telefone2      := TiraPontos(edtfone2.text);
//        pessoa.celular        := TiraPontos(edtcelular1.text);
//        pessoa.celular2       := TiraPontos(edtcelular2.text);
//        pessoa.whatsapp       := TiraPontos(edtwhats.text);
//        pessoa.responsavel    := edtresponsavel.text;
//        pessoa.obs            := edtobs.text;
//        pessoa.aviso          := edtaviso.text;
//        pessoa.cliente        := edtcliente.editvalue;
//        pessoa.fornecedor     := edtfornecedor.EditValue;
//        pessoa.envemail       := edtenviaremail.EditValue;
//        pessoa.envwhats       := edtenviarwhats.EditValue;
//        pessoa.idempresa      := TSession.IDEMPRESA;
//        if edtativo.Checked then
//        pessoa.situacao       := 'ATIVO'
//        else
//        pessoa.situacao       := 'INATIVO';
//        pessoa.sociodeste     := now;//datacadastro;
//        if edtFoto.Picture.Graphic <> nil then
//        Pessoa.foto           := TConeSul.ConvImgBase64(edtfoto);
//
//        Pessoa.app            := edtApp.EditValue;
//        Pessoa.sexo           := edtsexo.Text;
//        Pessoa.civil          := edtcivil.Text;
//        if edtNascimento.EditValue=null then
//        Pessoa.nascimento     := 0
//        else
//        Pessoa.nascimento     := edtnascimento.EditValue;
//
//        Pessoa.naturalde      := edtnatural.EditValue;
//        Pessoa.pai            := trim(edtpai.Text);
//        Pessoa.mae            := trim(edtmae.Text);
//        Pessoa.cnh            := edtcnh.Text;
//        Pessoa.tiporesidencia := edttiporesidencia.Text;
//        Pessoa.temporesidencia:= Trim(edttemporesidencia.Text);
//
//        if edtdatarg.EditValue = null then
//        Pessoa.emissaorg      := 0
//        else
//        Pessoa.emissaorg      := edtdatarg.EditValue;
//        Pessoa.nacionalidade  := Trim(edtnacionalidade.Text);
//
//
//        //dados profissionais
//        if TSession.oneGaragem='S' then
//        begin
//          Pessoa.ProfCNPJ                := TiraPontos(prof_cnpj.Text);
//          Pessoa.ProfRazao               := Trim(prof_razao.Text);
//          Pessoa.ProfTelefone            := tirapontos(prof_telefone.Text);
//          Pessoa.ProfCEP                 := tirapontos(prof_cep.Text);
//          Pessoa.ProfEndereco            := trim(prof_endereco.Text);
//          Pessoa.ProfNumero              := trim(prof_numero.Text);
//          Pessoa.ProfComplemento         := trim(prof_complemento.Text);
//          Pessoa.ProfBairro              := trim(prof_bairro.Text);
//          Pessoa.ProfIDCidade            := prof_cidade.EditValue;
//          Pessoa.ProfTempoServico        := prof_temposervico.Text;
//          if prof_admissao.EditValue=null then
//          Pessoa.admissao                := 0
//          else
//          Pessoa.admissao                := prof_admissao.EditValue;
//          Pessoa.salario                 := Prof_renda.EditValue;
//          Pessoa.profissao               := Trim(prof_profissao.Text);
//
//          Pessoa.ref_banco1               := Trim(ref_banco1.Text);
//          Pessoa.ref_banco2               := Trim(ref_banco2.Text);
//          Pessoa.ref_agencia1             := Trim(ref_agencia1.Text);
//          Pessoa.ref_agencia2             := Trim(ref_agencia2.Text);
//          Pessoa.ref_conta1               := Trim(ref_conta1.Text);
//          Pessoa.ref_conta2               := Trim(ref_conta2.Text);
//          Pessoa.ref_telefone1            := TiraPontos(ref_telefone1.Text);
//          Pessoa.ref_telefone2            := TiraPontos(ref_telefone2.Text);
//          Pessoa.ref_tempo1               := ref_tempo1.Text;
//          Pessoa.ref_tempo2               := ref_tempo2.Text;
//          Pessoa.ref_pessoal1             := Trim(ref_pessoal1.Text);
//          Pessoa.ref_pessoal2             := Trim(ref_pessoal2.Text);
//          Pessoa.ref_telefone3            := TiraPontos(ref_telefone3.Text);
//          Pessoa.ref_telefone4            := TiraPontos(ref_telefone4.Text);
//          Pessoa.ref_afinidade1           := Trim(ref_afinidade1.Text);
//          Pessoa.ref_afinidade2           := Trim(ref_afinidade2.Text);
//          Pessoa.ref_comercial1           := Trim(ref_comercial1.Text);
//          Pessoa.ref_comercial2           := Trim(ref_comercial2.Text);
//          Pessoa.ref_telefone5            := TiraPontos(ref_telefone5.Text);
//          Pessoa.ref_telefone6            := TiraPontos(ref_telefone6.Text);
//
//          Pessoa.fin_veiculo1             := fin_veiculo1.Text;
//          Pessoa.fin_veiculo2             := fin_veiculo2.Text;
//          Pessoa.fin_veiculo3             := fin_veiculo3.Text;
//          Pessoa.fin_veiculo4             := fin_veiculo4.Text;
//          Pessoa.fin_ano1                 := fin_ano1.Text;
//          Pessoa.fin_ano2                 := fin_ano2.Text;
//          Pessoa.fin_ano3                 := fin_ano3.Text;
//          Pessoa.fin_ano4                 := fin_ano4.Text;
//          Pessoa.fin_financio1            := fin_financio1.Text;
//          Pessoa.fin_financio2            := fin_financio2.Text;
//          Pessoa.fin_financio3            := fin_financio3.Text;
//          Pessoa.fin_financio4            := fin_financio4.Text;
//          Pessoa.fin_parcela1             := fin_parcela1.EditValue;
//          Pessoa.fin_parcela2             := fin_parcela2.EditValue;
//          Pessoa.fin_parcela3             := fin_parcela3.EditValue;
//          Pessoa.fin_parcela4             := fin_parcela4.EditValue;
//          Pessoa.fin_outros               := fin_outros.Text;
//
//        end;
//
//
//        if TNavigation.ParamsStr='N' then
//        begin
//
//          if Pessoa.Insert(msg,id) then;
//          Result  := True;
//        end
//        else
//        begin
//          Pessoa.idsocio    := TNavigation.ParamInt;
//
//          if Pessoa.Update(msg) then;
//          Result  := True;
//        end;
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
//
//function TFrmPessoaCad.ValidarCampos(out msg: string): Boolean;
//begin
//  Result  := True;
//
//  if (edtpessoa.Text='') or (edtpessoa.ItemIndex=-1) then
//  begin
//    msg     := 'Selecione o tipo de pessoa!';
//    Result  := False;
//    Exit;
//  end;
//
//  if AppValidarCPFCNPJ = 'S' then
//  begin
//    if (TiraPontos(edtcpf.Text) ='') then
//    begin
//      msg     := 'Informe um CPF/CNPJ valido!';
//      Result  := False;
//      Exit;
//    end;
//  end;
//
//  if edtrazao.Text='' then
//  begin
//    msg     := 'Informe o nome/razão!';
//    Result  := False;
//    Exit;
//  end;
//
//  if (edtcidade.Text='') then
//  begin
//    msg     := 'Selecione uma cidade!';
//    Result  := False;
//    Exit;
//  end;
//end;
//
//function TFrmPessoaCad.ValidarTamanhoImagem(caminhoImagem: string; larguraMax,
//  alturaMax: Integer): Boolean;
//var
//  picture: TPicture;
//begin
//  Result := False;
//  picture := TPicture.Create;
//  try
//    try
//      picture.LoadFromFile(caminhoImagem);
//      if (picture.Width <= larguraMax) and (picture.Height <= alturaMax) then
//        Result := True;
//    except
//      // Lidar com erros de carregamento de arquivo aqui
//    end;
//  finally
//    picture.Free;
//  end;
//end;
//
//procedure TFrmPessoaCad.ValidarTipoPessoa(i: integer);
//begin
//  case I of
//    0:begin //Fisica
//      edtcpf.Properties.EditMask  := '###.###.###-##';
//      labelOrgao.Visible          := True;
//      edtorgao.Visible            := True;
//      edtie.Width                 := 124;
//    end;
//    1:begin //juridica
//      edtcpf.Properties.EditMask  := '##.###.###/####-##';
//      labelOrgao.Visible          := False;
//      edtorgao.Visible            := False;
//      edtie.Width                 := 237;
//    end;
//  end;
//end;
//
//procedure TFrmPessoaCad.CarregarCidade;
//var
//msg:string;
//begin
//  //dm.PopularCidade(msg);
//end;


