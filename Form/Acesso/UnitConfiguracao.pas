unit UnitConfiguracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.FileCtrl,
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
  cxCheckBox, Vcl.Menus, cxButtons, ACBrBase, ACBrEnterTab, dxBarBuiltInMenu,
  cxPC, ACBRUTIL, ACBrDFe, ACBrNFe,ACBrDFeSSL, Data.DB, DBAccess, Uni, cxStyles,
  dxScrollbarAnnotations, cxVGrid, cxInplaceContainer, cxClasses, cxCurrencyEdit,
  UnitBaseNovoCadastro, dxBevel, Vcl.ButtonStylesAttributes, Vcl.StyledButton,
  Datasnap.DBClient, uConfiguracaoService, UnitGlobal, Controller.LookupHelper,
  cxGridTableView;

type
  TFrmConfiguracao = class(TFormNovoBaseCadastro)

    cxPage: TcxPageControl;
    TabNFe: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtNumero: TcxTextEdit;
    edtsenha: TcxTextEdit;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edtAmbiente: TcxComboBox;
    edtTipoEmissao: TcxComboBox;
    edtVersao: TcxComboBox;
    edtFormaEmissao: TcxComboBox;
    edtCertificado: TcxButtonEdit;
    edtSerie: TcxTextEdit;
    edtUltNsu: TcxTextEdit;
    edtCryptLib: TcxComboBox;
    Edtnfehttplib: TcxComboBox;
    Edtnfexmlsignlib: TcxComboBox;
    Edtnfessl: TcxComboBox;
    edtnfepathresposta: TcxButtonEdit;
    Label16: TLabel;
    Edtnfepathxsd: TcxButtonEdit;
    Edtnfepathenviadas: TcxButtonEdit;
    Label17: TLabel;
    Label18: TLabel;
    EdtNfePathCancelada: TcxButtonEdit;
    Edtnfepathcce: TcxButtonEdit;
    Label19: TLabel;
    Label20: TLabel;
    Edtnfepathinutilizacao: TcxButtonEdit;
    Label21: TLabel;
    Edtnfepathdpec: TcxButtonEdit;
    Label22: TLabel;
    edtnfepathevento: TcxButtonEdit;
    Label23: TLabel;
    Edtnfepathpdf: TcxButtonEdit;
    OpenDialog: TOpenDialog;
    ACBrNFe1: TACBrNFe;
    cxTabParametro: TcxTabSheet;
    cxGroupBox2: TcxGroupBox;
    edt_multempresa: TcxCheckBox;
    TablivroCaixa: TcxTabSheet;
    cxGroupBox3: TcxGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    dsCusto: TDataSource;
    dsPlano: TDataSource;
    edtPlanoVenda: TcxLookupComboBox;
    edtPlanoCompra: TcxLookupComboBox;
    edtPlanoAvulsoCredito: TcxLookupComboBox;
    edtPlanoAvulsoDebito: TcxLookupComboBox;
    edtCusto: TcxLookupComboBox;
    dsmensagem: TUniDataSource;
    TabEmpresa: TcxTabSheet;
    cxVerticalGrid: TcxVerticalGrid;
    cxEmpresa: TcxCategoryRow;
    sistema_associacao: TcxEditorRow;
    utilizar_ticket: TcxEditorRow;
    utilizar_votacao_web: TcxEditorRow;
    ticket_mespag_mesdesconto: TcxEditorRow;
    sistema_garagem: TcxEditorRow;
    sistema_pedido: TcxEditorRow;
    sistema_locacao: TcxEditorRow;
    cxGerais: TcxCategoryRow;
    utilizawhatsapp: TcxEditorRow;
    urlapiwhatsapp: TcxEditorRow;
    utilizaapp: TcxEditorRow;
    urlapiapp: TcxEditorRow;
    instanciawhatsappfunc: TcxEditorRow;
    utilizaappcarteira: TcxEditorRow;
    carteira_api: TcxEditorRow;
    carteira_usuario: TcxEditorRow;
    carteira_senha: TcxEditorRow;
    carteira_token: TcxEditorRow;
    id_mensagempadraowhatsapp: TcxEditorRow;
    cxFinanceiro: TcxCategoryRow;
    cxEstoque: TcxCategoryRow;
    vendagerarlivrocaixa: TcxEditorRow;
    moduloestoque: TcxEditorRow;
    ticket_seguencia: TcxEditorRow;
    tabveiculo_app: TcxEditorRow;
    tabveiculourlapi: TcxEditorRow;
    TabVeiculoUsuario: TcxEditorRow;
    tabveiculosenha: TcxEditorRow;
    tabveiculoToken: TcxEditorRow;
    Memo1: TMemo;
    Garagem_taxaPatio: TcxEditorRow;
    Garagem_taxaConsignado: TcxEditorRow;
    Garagem_Comissaovendedor: TcxEditorRow;
    zap_versao: TcxEditorRow;
    zap_apikey: TcxEditorRow;
    Ordem_servico: TcxEditorRow;
    ordem_servico_tipo: TcxEditorRow;
    OrdemMensagemPadraoWhatsapp: TcxEditorRow;
    ordemmsgorcamento: TcxEditorRow;
    ordemmsgexecucao: TcxEditorRow;
    ordemmsgfinalizada: TcxEditorRow;
    ordemmsgpecas: TcxEditorRow;
    TabMensagem: TClientDataSet;
    TabMensagemid_mensagem: TIntegerField;
    TabMensagemcodigo: TIntegerField;
    TabMensagemdescricao: TStringField;
    TabMensagemnpesquisa: TStringField;
    VerticalGrid: TcxVerticalGridStyleSheet;
    cxStyle7: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    vidracaria_calculo: TcxEditorRow;
    pedido_altPrecoUnitario: TcxEditorRow;
    utilizar_sindicato: TcxEditorRow;
    SMSUtilizar: TcxEditorRow;
    SMSProvedor: TcxEditorRow;
    SMSToken: TcxEditorRow;
    SMSIdentificador: TcxEditorRow;
    SMSURL: TcxEditorRow;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtnfepathrespostaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdtnfepathxsdPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdtnfepathenviadasPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdtNfePathCanceladaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdtnfepathccePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdtnfepathinutilizacaoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdtnfepathdpecPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtnfepatheventoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdtnfepathpdfPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtCertificadoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtTipoEmissaoPropertiesChange(Sender: TObject);
    procedure edtCryptLibPropertiesChange(Sender: TObject);
    procedure EdtnfehttplibPropertiesChange(Sender: TObject);
    procedure EdtnfexmlsignlibPropertiesChange(Sender: TObject);

  private
    id:integer;
    procedure CarregarDados;
    function Salvar(out msg: string): Boolean; override;


    function ValidarCampos(out msg: string): Boolean; override;
    procedure PathClick(Sender: TObject);
    { Private declarations }
  public

    Numcert:String;
    { Public declarations }
  end;

var
  FrmConfiguracao: TFrmConfiguracao;

implementation

{$R *.dfm}

Uses Model.Email, Vcl.Loading, Vcl.Session, uJKDialog, UConeSul, Model.ConfNF,
  UDM;

const
  SELDIRHELP = 1000;


procedure TFrmConfiguracao.CarregarDados;
var
Model : TModelConfNF;
msg:string;
begin
  Model                   := TModelConfNF.Create;
  Try
    try

      Model.idconfig      := ParamsInt;  //buscar o id da empresa que contenha o email configurado
      id                  := ParamsInt;

      if Model.SelectID(msg) then
      begin

        //Popular os campos
        edtAmbiente.ItemIndex         :=  Model.nfeambiente;
        edtTipoEmissao.EditValue      :=  Model.nfetipoemissao;
        edtVersao.EditValue           :=  Model.nfeversao;
        edtFormaEmissao.EditValue     := Model.nfeformaemissao;
        edtCertificado.EditValue      :=  Model.nfecaminhocertificado;
        edtsenha.EditValue            := TConeSul.Crypt('D',Model.nfesenha);
        edtNumero.EditValue           := Model.nfenumero;
        edtSerie.EditValue            := Model.nfeserie;
        edtUltNsu.EditValue           := Model.NfeNsu;
        edtCryptLib.EditValue         := Model.nfecryptlib;
        Edtnfehttplib.EditValue       := Model.nfehttplib;
        Edtnfexmlsignlib.EditValue    := Model.nfexmlsignlib;
        Edtnfessl.EditValue           := Model.nfessl;

        Numcert                       := Model.NfeCertificadoNumero;

        edt_multempresa.EditValue     :=  Model.multiempresa;

        edtPlanoVenda.EditValue       :=  model.idplanovenda;
        edtPlanoCompra.EditValue      :=  model.idplanocompra;
        edtPlanoAvulsoCredito.EditValue :=model.idplanoacredito;
        edtPlanoAvulsoDebito.EditValue:=  model.idplanoadebito;
        edtCusto.EditValue            :=  model.idcustoavulso;
        

        //Popular pivor Grid

        if Model.associacao = 'S' then
        sistema_associacao.Properties.Value := 'Sim'
        else
        sistema_associacao.Properties.Value := 'Não';

        if Model.utilizarticket = 'S' then
        utilizar_ticket.Properties.Value := 'Sim'
        else
        utilizar_ticket.Properties.Value := 'Não';

        if Model.sindicato = 'S' then
        utilizar_sindicato.Properties.Value := 'Sim'
        else
        utilizar_sindicato.Properties.Value := 'Não';


        if Model.mespagdesconto = 'S' then
        ticket_mespag_mesdesconto.Properties.Value := 'Sim'
        else
        ticket_mespag_mesdesconto.Properties.Value := 'Não';

        if Model.utilizaappcarteira = 'S' then
        utilizaappcarteira.Properties.Value := 'Sim'
        else
        utilizaappcarteira.Properties.Value := 'Não';

        carteira_api.Properties.Value       :=model.carteiraapi;
        carteira_usuario.Properties.Value   :=model.carteirausuario;
        carteira_senha.Properties.Value     :=model.carteirasenha;
        carteira_token.Properties.Value     :=model.carteiratoken;


        if Model.utilizarvotacaoweb  = 'S'  then
        utilizar_votacao_web.Properties.Value := 'Sim'
        else
        utilizar_votacao_web.Properties.Value := 'Não';

        if Model.garagem ='S' then
        sistema_garagem.Properties.Value := 'Sim'
        else
        sistema_garagem.Properties.Value := 'Não';


        if Model.pedido = 'S' then
        sistema_pedido.Properties.Value := 'Sim'
        else
        sistema_pedido.Properties.Value := 'Não';

        if Model.locacao ='S' then
        sistema_locacao.Properties.Value := 'Sim'
        else
        sistema_locacao.Properties.Value := 'Não';

        if Model.usarwhats ='S' then
        utilizawhatsapp.Properties.Value := 'Sim'
        else
        utilizawhatsapp.Properties.Value := 'Não';

        urlapiwhatsapp.Properties.Value   := Model.urlwhats;

        if model.instanciawhatsappfunc = 'S' then
        instanciawhatsappfunc.Properties.Value := 'Sim'
        else
        instanciawhatsappfunc.Properties.Value := 'Não';

        if model.idmensagemzap > 0 then
        id_mensagempadraowhatsapp.Properties.Value  := model.idmensagemzap;

        if Model.usarapp = 'S'  then
        utilizaapp.Properties.Value := 'Sim'
        else
        utilizaapp.Properties.Value := 'Não';

        urlapiapp.Properties.Value  := Model.urlapp;


        if model.vendagerarlivrocaixa  ='S'  then
        vendagerarlivrocaixa.Properties.Value := 'Sim'
        else
        vendagerarlivrocaixa.Properties.Value := 'Não';

        if model.moduloestoque  ='S'  then
        moduloestoque.Properties.Value := 'Sim'
        else
        moduloestoque.Properties.Value := 'Não';

        if Model.ticketseguencia = 'S' then
        ticket_seguencia.Properties.Value := 'Sim'
        else
        ticket_seguencia.Properties.Value := 'Não';


        //veiculos APP
        tabveiculourlapi.Properties.Value   := model.veiculoapi;
        TabVeiculoUsuario.Properties.Value  := model.veiculousuario;
        tabveiculosenha.Properties.Value    := model.veiculosenha;
        tabveiculoToken.Properties.Value    := model.veiculotoken;

        if model.utilizaappveiculo = 'S' then
        tabveiculo_app.Properties.Value := 'Sim'
        else
        tabveiculo_app.Properties.Value := 'Não';

        if Model.veiculocomisvendedor = 'S' then
        Garagem_Comissaovendedor.Properties.Value := 'Sim'
        else
        Garagem_Comissaovendedor.Properties.Value := 'Não';

        Garagem_taxaPatio.Properties.Value      := Model.veiculotaxapatio;
        Garagem_taxaConsignado.Properties.Value := Model.veiculotaxaconsignado;

        zap_versao.Properties.Value             := Model.whatsappversao;
        zap_apikey.Properties.Value             := Model.whatsappapikey;

        // Ordem de Serviço
        if model.utilizarordemservico = 'S' then
        Ordem_servico.Properties.Value := 'Sim'
        else
        Ordem_servico.Properties.Value := 'Não';

        ordem_servico_tipo.Properties.Value := model.tipoordemservico;

        if Model.id_msgpadraowhatsappordem > 0 then
        OrdemMensagemPadraoWhatsapp.Properties.Value  := Model.id_msgpadraowhatsappordem;

        if Model.id_msgordemorcamentoenviado >0 then
        ordemmsgorcamento.Properties.Value            := Model.id_msgordemorcamentoenviado;

        if model.id_msgordeminicioexecucao > 0 then
        ordemmsgexecucao.Properties.Value             := model.id_msgordeminicioexecucao;

        if model.id_msgordemfinalizada >0 then
        ordemmsgfinalizada.Properties.Value           := model.id_msgordemfinalizada;

        if model.id_msgordempecas >0 then
        ordemmsgpecas.Properties.Value                := model.id_msgordempecas;

        if model.calculo_vidracaria = 'S' then
        vidracaria_calculo.Properties.Value := 'Sim'
        else
        vidracaria_calculo.Properties.Value := 'Não';

        if model.alterar_preco_pedido= 'S' then
        pedido_altPrecoUnitario.Properties.Value := 'Sim'
        else
        pedido_altPrecoUnitario.Properties.Value := 'Não';

        //SMS
        if model.utilizasms = 'S' then
        SMSUtilizar.Properties.Value       := 'Sim'
        else SMSUtilizar.Properties.Value  := 'Não';

        SMSProvedor.Properties.Value       := model.provedorsms;
        SMSToken.Properties.Value          := model.tokensms;
        SMSIdentificador.Properties.Value  := model.identificadorsms;
        SMSURL.Properties.Value            := model.urlsms;
       
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

procedure TFrmConfiguracao.edtCertificadoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  Try
    Numcert              := ACBrNFe1.SSL.SelecionarCertificado;

  Finally
    edtCertificado.Text  := ACBrNFe1.SSL.CertRazaoSocial + '/'+ACBrNFe1.SSL.CertIssuerName;
  End;

  {OpenDialog.Title := 'Selecione o Certificado';
  OpenDialog.DefaultExt := '*.pfx';
  OpenDialog.Filter := 'Arquivos PFX (*.pfx)|*.pfx|Todos os Arquivos (*.*)|*.*';

  OpenDialog.InitialDir := ApplicationPath;

  if OpenDialog.Execute then
    edtCertificado.Text := OpenDialog.FileName;}
end;

procedure TFrmConfiguracao.edtCryptLibPropertiesChange(Sender: TObject);
begin
  try
    if edtCryptLib.ItemIndex <> -1 then
      ACBrNFe1.Configuracoes.Geral.SSLCryptLib := TSSLCryptLib(edtCryptLib.ItemIndex);
  finally

  end;
end;

procedure TFrmConfiguracao.EdtnfehttplibPropertiesChange(Sender: TObject);
begin
  try
    if Edtnfehttplib.ItemIndex <> -1 then
      ACBrNFe1.Configuracoes.Geral.SSLHttpLib := TSSLHttpLib(Edtnfehttplib.ItemIndex);
  finally

  end;
end;

procedure TFrmConfiguracao.EdtNfePathCanceladaPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  PathClick(EdtNfePathCancelada);
end;

procedure TFrmConfiguracao.EdtnfepathccePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  PathClick(Edtnfepathcce);
end;

procedure TFrmConfiguracao.EdtnfepathdpecPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  PathClick(Edtnfepathdpec);
end;

procedure TFrmConfiguracao.EdtnfepathenviadasPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  PathClick(Edtnfepathenviadas);
end;

procedure TFrmConfiguracao.edtnfepatheventoPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  PathClick(edtnfepathevento);
end;

procedure TFrmConfiguracao.EdtnfepathinutilizacaoPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  PathClick(Edtnfepathinutilizacao);
end;

procedure TFrmConfiguracao.EdtnfepathpdfPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  PathClick(Edtnfepathpdf);
end;

procedure TFrmConfiguracao.edtnfepathrespostaPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  PathClick(edtnfepathresposta);
end;

procedure TFrmConfiguracao.EdtnfepathxsdPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  PathClick(Edtnfepathxsd);
end;

procedure TFrmConfiguracao.EdtnfexmlsignlibPropertiesChange(Sender: TObject);
begin
  try
    if Edtnfexmlsignlib.ItemIndex <> -1 then
      ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib := TSSLXmlSignLib(Edtnfexmlsignlib.ItemIndex);
  finally

  end;
end;

procedure TFrmConfiguracao.edtTipoEmissaoPropertiesChange(Sender: TObject);
begin
  try
    if edtTipoEmissao.ItemIndex <> -1 then
      ACBrNFe1.Configuracoes.Geral.SSLLib := TSSLLib(edtTipoEmissao.ItemIndex);
  finally

  end;
end;

procedure TFrmConfiguracao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmConfiguracao := nil;
end;

procedure TFrmConfiguracao.FormShow(Sender: TObject);
begin
  inherited;
  cxPage.ActivePage := TabNfe;

  Try
    TLookupHelper.CarregarLookup(
                  TabMensagem,LookupMensagemtabConfigsql);

  Except on e:exception do
   raise Exception.Create(e.Message);
  End;





  if ParamsStr = 'N' then
  begin
    TitleText   := 'Configuração do Sistema';

  end
  else
  begin
    TitleText   := 'Configuração do Sistema';
    CarregarDados;
  end;

end;

function TFrmConfiguracao.Salvar(out msg: string): Boolean;
var
Model :TModelConfNF;
begin
  Result:= false;
  Model       := TModelConfNF.Create;
  Try

    Model.nfeambiente             := edtAmbiente.ItemIndex;
    Model.nfetipoemissao          := edtTipoEmissao.Text;
    Model.nfeversao               := edtVersao.Text;
    Model.nfeformaemissao         := edtFormaEmissao.Text;
    Model.nfecaminhocertificado   := edtCertificado.Text;
    Model.nfesenha                := TConesul.Crypt('C',edtsenha.Text);
    if Numcert<> '' then
    Model.nfecertificadonumero    := Numcert;
    Model.nfenumero               := strtoint(edtNumero.Text);
    Model.nfeserie                := strtoint(edtSerie.Text);
    Model.NfeNsu                  := strtoint(edtUltNsu.text);
    Model.nfecryptlib             := edtCryptLib.Text;
    Model.nfehttplib              := Edtnfehttplib.Text;
    Model.nfexmlsignlib           := Edtnfexmlsignlib.Text;
    Model.nfessl                  := Edtnfessl.Text;

    model.multiempresa            := edt_multempresa.EditValue;

    model.idplanovenda            := edtPlanoVenda.EditValue;
    model.idplanocompra           := edtPlanoCompra.EditValue;
    model.idplanoacredito         := edtPlanoAvulsoCredito.EditValue;
    model.idplanoadebito          := edtPlanoAvulsoDebito.EditValue;
    model.idcustoavulso           := edtCusto.EditValue;
    

    //Pecorrer os dados da Pivorgrid
    if sistema_associacao.Properties.Value = 'Sim' then
    Model.associacao              := 'S'
    else
    Model.associacao              := 'N';

    if utilizar_ticket.Properties.Value = 'Sim' then
    Model.utilizarticket          := 'S'
    else
    Model.utilizarticket          := 'N';

    if ticket_mespag_mesdesconto.Properties.Value = 'Sim' then
    Model.mespagdesconto          := 'S'
    else
    Model.mespagdesconto          := 'N';

    if utilizaappcarteira.Properties.Value = 'Sim' then
    Model.utilizaappcarteira      := 'S'
    else
    Model.utilizaappcarteira      := 'N';

    model.carteiraapi             := carteira_api.Properties.Value;
    model.carteirausuario         := carteira_usuario.Properties.Value;
    model.carteirasenha           := carteira_senha.Properties.Value;
    model.carteiratoken           := carteira_token.Properties.Value;

    if utilizar_votacao_web.Properties.Value = 'Sim' then
    Model.utilizarvotacaoweb      := 'S'
    else
    Model.utilizarvotacaoweb      := 'N';

    if utilizar_sindicato.Properties.Value = 'Sim' then
    model.sindicato               := 'S'
    else
    model.sindicato               := 'M';

    if sistema_garagem.Properties.Value = 'Sim' then
    Model.garagem                 := 'S'
    else
    Model.garagem                 := 'N';

    if sistema_pedido.Properties.Value = 'Sim' then
    Model.pedido                 := 'S'
    else
    Model.pedido                 := 'N';

    if sistema_locacao.Properties.Value = 'Sim' then
    Model.locacao                 := 'S'
    else
    Model.locacao                 := 'N';

    if utilizawhatsapp.Properties.Value = 'Sim' then
    Model.usarwhats               := 'S'
    else
    Model.usarwhats               := 'N';

    Model.urlwhats                := Trim(urlapiwhatsapp.Properties.Value);

    if instanciawhatsappfunc.Properties.Value = 'Sim' then
    model.instanciawhatsappfunc   := 'S'
    else
    model.instanciawhatsappfunc   := 'N';

    if id_mensagempadraowhatsapp.Properties.Value > 0 then
    model.idmensagemzap           := id_mensagempadraowhatsapp.Properties.Value;

    if utilizaapp.Properties.Value = 'Sim' then
    Model.usarapp                 := 'S'
    else
    Model.usarapp                 := 'N';

    Model.urlapp                  := Trim(urlapiapp.Properties.Value);

    if vendagerarlivrocaixa.Properties.Value = 'Sim' then
    model.vendagerarlivrocaixa    := 'S'
    else
    model.vendagerarlivrocaixa    := 'N';

    if moduloestoque.Properties.Value = 'Sim' then
    model.moduloestoque           := 'S'
    else
    model.moduloestoque           := 'N';

    if ticket_seguencia.Properties.Value = 'Sim' then
    Model.ticketseguencia         := 'S'
    else
    Model.ticketseguencia         := 'N';

    model.veiculoapi              := Trim(tabveiculourlapi.Properties.Value);
    model.veiculousuario          := Trim(TabVeiculoUsuario.Properties.Value);
    model.veiculosenha            := Trim(tabveiculosenha.Properties.Value);
    model.veiculotoken            := Trim(tabveiculoToken.Properties.Value);
    if tabveiculo_app.Properties.Value='Sim' then
    model.utilizaappveiculo       := 'S'
    else
    model.utilizaappveiculo       := 'N';

    if Garagem_Comissaovendedor.Properties.Value = 'Sim' then
      Model.veiculocomisvendedor  := 'S'
    else
      Model.veiculocomisvendedor  := 'N';

    Model.veiculotaxapatio        := Garagem_taxaPatio.Properties.Value;
    Model.veiculotaxaconsignado   := Garagem_taxaConsignado.Properties.Value;

    Model.whatsappversao          := zap_versao.Properties.Value;
    Model.whatsappapikey          := Trim(zap_apikey.Properties.Value);

    // Ordem de Serviço
    if Ordem_servico.Properties.Value = 'Sim' then
    model.utilizarordemservico    := 'S'
    else
    model.utilizarordemservico    := 'N';

    model.tipoordemservico        := ordem_servico_tipo.Properties.Value;

    if OrdemMensagemPadraoWhatsapp.Properties.Value > 0 then
    Model.id_msgpadraowhatsappordem := OrdemMensagemPadraoWhatsapp.Properties.Value;

    if ordemmsgorcamento.Properties.Value > 0 then
    Model.id_msgordemorcamentoenviado     := ordemmsgorcamento.Properties.Value;

    if ordemmsgexecucao.Properties.Value > 0 then
    Model.id_msgordeminicioexecucao       := ordemmsgexecucao.Properties.Value;

    if ordemmsgfinalizada.Properties.Value > 0 then
    Model.id_msgordemfinalizada           := ordemmsgfinalizada.Properties.Value;

    if ordemmsgpecas.Properties.Value > 0 then
    Model.id_msgordempecas                := ordemmsgpecas.Properties.Value;

    if vidracaria_calculo.Properties.Value = 'Sim' then
    model.calculo_vidracaria      := 'S'
    else
    model.calculo_vidracaria      := 'N';

    if pedido_altPrecoUnitario.Properties.Value = 'Sim' then
    model.alterar_preco_pedido      := 'S'
    else
    model.alterar_preco_pedido      := 'N';

    //SMS
    if SMSUtilizar.Properties.Value = 'Sim' then
    model.utilizasms              := 'S'
    else model.utilizasms         := 'N';

    model.provedorsms             := SMSProvedor.Properties.Value;
    model.tokensms                := Trim(SMSToken.Properties.Value);
    model.identificadorsms        := trim(SMSIdentificador.Properties.Value);
    model.urlsms                  := Trim(SMSURL.Properties.Value);

    if Model.Update(msg,id) then
    Result  := True
    else
    Result  := False;

    ParamsCloseTela := 'S';

  Finally
    Model.Free;
  End;

end;

function TFrmConfiguracao.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;
end;

procedure TFrmConfiguracao.PathClick(Sender: TObject);
var
  Dir: string;
begin
  if Length(TCxButtonEdit(Sender).Text) <= 0 then
    Dir := ExtractFileDir(application.ExeName);
  {else
    Dir := TDBEdit(Sender).Text; }
  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt], SELDIRHELP)
  then
    TCxButtonEdit(Sender).Text := Dir;
end;


end.
