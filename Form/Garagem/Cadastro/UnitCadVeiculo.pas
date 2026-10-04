unit UnitCadVeiculo;

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
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxButtonEdit,
  dxBevel, cxCurrencyEdit, cxBlobEdit, Vcl.ComCtrls, ACBRUTIL, dxCore,
  cxDateUtils, cxCalendar, Vcl.Menus, cxButtons, Data.DB, DBAccess, Uni,
  UnitVeiculoFoto, Datasnap.DBClient;

type
  TFrmCadVeiculo = class(TFrmBaseCad)
    edttipo: TcxComboBox;
    Label2: TLabel;
    edtgrupo: TcxLookupComboBox;
    edtplaca: TcxButtonEdit;
    dxBevel1: TdxBevel;
    edtFoto: TImage;
    edtespecie: TcxLookupComboBox;
    edtmarca: TcxLookupComboBox;
    edtmodelo: TcxLookupComboBox;
    edtorigem: TcxComboBox;
    edtano: TcxButtonEdit;
    edtanomodelo: TcxButtonEdit;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edtcombustivel: TcxComboBox;
    edtcambio: TcxComboBox;
    edtcor: TcxComboBox;
    edtporta: TcxComboBox;
    edtcv: TcxButtonEdit;
    edtkm: TcxCurrencyEdit;
    PageValores: TPageControl;
    TabValores: TTabSheet;
    lb_compra: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label29: TLabel;
    edtcompra: TcxCurrencyEdit;
    edtperlucro: TcxCurrencyEdit;
    edtprcvenda: TcxCurrencyEdit;
    vlrFipe: TcxCurrencyEdit;
    edtValorTroca: TcxCurrencyEdit;
    TabAdicionais: TTabSheet;
    TabFotos: TTabSheet;
    cxGroupBox5: TcxGroupBox;
    edtIPVAPago: TcxCheckBox;
    cxedtativo: TcxCheckBox;
    edtmostrarapp: TcxCheckBox;
    edtIntencaovenda: TcxCheckBox;
    edtEstoque: TcxCheckBox;
    Label31: TLabel;
    edtrenavam: TcxButtonEdit;
    edtchassi: TcxButtonEdit;
    Label32: TLabel;
    edtcrv: TcxButtonEdit;
    Label33: TLabel;
    edtPlavamercosul: TcxCheckBox;
    edtLicPago: TcxCheckBox;
    edtTaxabombeiro: TcxCheckBox;
    edtValorPraticado: TcxCurrencyEdit;
    Label25: TLabel;
    Label34: TLabel;
    edttaxames: TcxCurrencyEdit;
    edtCustototal: TcxCurrencyEdit;
    Label35: TLabel;
    edtljpercentual: TcxCurrencyEdit;
    Label36: TLabel;
    edtljtotal: TcxCurrencyEdit;
    Label37: TLabel;
    edtvendpercentual: TcxCurrencyEdit;
    edtvendtotal: TcxCurrencyEdit;
    Label38: TLabel;
    Label39: TLabel;
    edtdatahodometro: TcxDateEdit;
    Label40: TLabel;
    Label41: TLabel;
    edtNumeromotor: TcxButtonEdit;
    edtTipoCRV: TcxComboBox;
    Label42: TLabel;
    Label43: TLabel;
    edtCodigoseguranca: TcxButtonEdit;
    btnFoto: TcxButton;
    btnexcluirfoto: TcxButton;
    TabHistorico: TTabSheet;
    TabDespesas: TTabSheet;
    dsTipo: TUniDataSource;
    dsespecie: TUniDataSource;
    dsMarca: TUniDataSource;
    dsmodelo: TUniDataSource;
    dsLocalizacao: TUniDataSource;
    Label20: TLabel;
    vlrCustogerais: TcxCurrencyEdit;
    Label24: TLabel;
    edtValorLucro: TcxCurrencyEdit;
    edttaxadia: TcxCurrencyEdit;
    Label28: TLabel;
    edtpatiototal: TcxCurrencyEdit;
    Label44: TLabel;
    edtPatioGerar: TcxCheckBox;
    Label45: TLabel;
    edtDescricaoveiculo: TcxButtonEdit;
    Label19: TLabel;
    edtlocalizacao: TcxLookupComboBox;
    edtProcuracao: TcxComboBox;
    Label46: TLabel;
    edtdtVencimento: TcxDateEdit;
    Label47: TLabel;
    Label26: TLabel;
    edtobs: TcxBlobEdit;
    Label30: TLabel;
    edtaviso: TcxBlobEdit;
    edtFinanciamentoAtivo: TcxCheckBox;
    lb_estoque: TLabel;
    edtCadPessoa: TcxButtonEdit;
    cxButtonEdit1: TcxButtonEdit;
    btnespecie: TcxButtonEdit;
    cxButtonEdit3: TcxButtonEdit;
    btnModelo: TcxButtonEdit;
    Tab_TipoVeiculo: TClientDataSet;
    Tab_TipoVeiculoid: TIntegerField;
    Tab_TipoVeiculocodigo: TIntegerField;
    Tab_TipoVeiculodescricao: TStringField;
    Tab_TipoVeiculoncompleto: TStringField;
    Tab_TipoVeiculoplaca_obrigatoria: TStringField;
    Tab_Localizacao: TClientDataSet;
    Tab_Localizacaoid: TIntegerField;
    Tab_Localizacaocodigo: TIntegerField;
    Tab_Localizacaodescricao: TStringField;
    Tab_Localizacaoncompleto: TStringField;
    Tab_Especie: TClientDataSet;
    Tab_Especieid: TIntegerField;
    Tab_Especiecodigo: TIntegerField;
    Tab_Especiedescricao: TStringField;
    Tab_Especiencompleto: TStringField;
    Tab_Marca: TClientDataSet;
    Tab_Marcaid: TIntegerField;
    Tab_Marcacodigo: TIntegerField;
    Tab_Marcadescricao: TStringField;
    Tab_Marcancompleto: TStringField;
    Tab_Modelo: TClientDataSet;
    Tab_Modeloid: TIntegerField;
    Tab_Modelocodigo: TIntegerField;
    Tab_Modelodescricao: TStringField;
    Tab_Modeloncompleto: TStringField;
    procedure FormShow(Sender: TObject);
    procedure edtmarcaPropertiesEditValueChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edttipoPropertiesChange(Sender: TObject);
    procedure edtplacaExit(Sender: TObject);
    procedure edtrenavamKeyPress(Sender: TObject; var Key: Char);
    procedure edtgrupoPropertiesEditValueChanged(Sender: TObject);
    procedure btnFotoClick(Sender: TObject);
    procedure btnexcluirfotoClick(Sender: TObject);
    procedure edtCadPessoaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnespeciePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnModeloPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    procedure TabCarregarDados;
    Procedure ValidarOperacao(i:integer);
    function PlacaValida(const Placa: string): Boolean;
    procedure SomenteNumerosKeyPress(Sender: TObject; var Key: Char);
    procedure LimparCaracteresInvalidos(Sender: TObject);
    procedure CarregarCLookupListaTipoveiculo;
    procedure CarregarCLookupListaLocalizacao;
    procedure CarregarCLookupListaEspecieVeiculo;
    procedure CarregarCLookupListaMarca;
    procedure CarregarCLookupListaModeloVeiculo;
    { Private declarations }
  public
    { Public declarations }
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure CarregarDados; override;
  end;

var
  FrmCadVeiculo: TFrmCadVeiculo;

implementation

{$R *.dfm}

uses Model.Produto, Vcl.Navigation, uJKDialog, Vcl.Session, UConeSul, UDM, System.RegularExpressions,
  Vcl.Validacoes, uConfiguracaoService, Vcl.PermissaoUsuario,
  UnitCadTipoVeiculo, Controller.LookupHelper, UnitLocalizacaoCad,
  UnitLocalizacao, UnitCadEspecieVeiculo, UnitCadMarcaVeiculo,
  UnitCadModeloVeiculo;

{ TFrmBaseCad1 }

{$REGION 'Funcoes'}

procedure TFrmCadVeiculo.SomenteNumerosKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then  // permite números e Backspace
    Key := #0;
end;

function TFrmCadVeiculo.PlacaValida(const Placa: string): Boolean;
var
  PadraoAntigo, PadraoMercosul: string;
begin
  // Remove espaços e deixa em maiúsculas
  var PlacaLimpa := UpperCase(Trim(Placa));

  // Expressões regulares
  PadraoAntigo    := '^[A-Z]{3}[0-9]{4}$';       // Ex: ABC1234
  PadraoMercosul  := '^[A-Z]{3}[0-9]{1}[A-Z]{1}[0-9]{2}$'; // Ex: ABC1D23

  // Verifica se bate com um dos padrões
  Result := TRegEx.IsMatch(PlacaLimpa, PadraoAntigo) or
            TRegEx.IsMatch(PlacaLimpa, PadraoMercosul);
end;

procedure TFrmCadVeiculo.LimparCaracteresInvalidos(Sender: TObject);
var
  TextoLimpo, TextoOriginal: string;
  I: Integer;
begin
  TextoOriginal := (Sender as TEdit).Text;
  TextoLimpo := '';

  for I := 1 to Length(TextoOriginal) do
    if TextoOriginal[I] in ['0'..'9'] then
      TextoLimpo := TextoLimpo + TextoOriginal[I];

  (Sender as TEdit).Text := TextoLimpo;
  (Sender as TEdit).SelStart := Length(TextoLimpo); // reposiciona o cursor
end;


{$ENDREGION}

Procedure TFrmCadVeiculo.ValidarOperacao(i:integer);
begin
  case i of
    0:begin  //Consignado
        lb_compra.Caption       := 'Consignado';
        edtljpercentual.Enabled := True;
        edtljtotal.Enabled      := true;
        edttaxames.Enabled      := False;
        edttaxadia.Enabled      := False;
        edtpatiototal.Enabled   := False;
      end;
    1:begin //Consignado Loja
        lb_compra.Caption       := 'Consignado';
        edtljpercentual.Enabled := True;
        edtljtotal.Enabled      := true;
        edttaxames.Enabled      := False;
        edttaxadia.Enabled      := False;
        edtpatiototal.Enabled   := False;
      end;
    2:begin //Próprio
        lb_compra.Caption       := 'Compra';
        edtljpercentual.Enabled := false;
        edtljtotal.Enabled      := false;
        edttaxames.Enabled      := True;
        edttaxadia.Enabled      := True;
        edtpatiototal.Enabled   := True;
      end;
    3:begin  //Refinanciamento
        lb_compra.Caption       := 'Compra';
        edtljpercentual.Enabled := false;
        edtljtotal.Enabled      := false;
        edttaxames.Enabled      := False;
        edttaxadia.Enabled      := False;
        edtpatiototal.Enabled   := False;
      end;
    4:begin //Repasse
        lb_compra.Caption       := 'Compra';
        edtljpercentual.Enabled := false;
        edtljtotal.Enabled      := false;
        edttaxames.Enabled      := False;
        edttaxadia.Enabled      := False;
        edtpatiototal.Enabled   := False;
      end;
    5:begin  //Zero
        lb_compra.Caption       := 'Compra';
        edtljpercentual.Enabled := True;
        edtljtotal.Enabled      := true;
        edttaxames.Enabled      := False;
        edttaxadia.Enabled      := False;
        edtpatiototal.Enabled   := False;
      end;
  end;
end;

procedure TFrmCadVeiculo.CarregarDados;
var
model : TModelVeiculo;
msg:string;
begin
  inherited;
  Model             := TModelVeiculo.Create;
  Try
    try
      if Model.SelecionarEditar(msg, TNavigation.ParamInt) then
      begin
        EdtCodigo.EditValue             :=  Model.idProduto;
        edttipo.EditValue               :=  Model.tipoproduto;
        edtgrupo.EditValue              :=  Model.idgrupo;
        edtplaca.EditValue              :=  Model.placa;
        edtDescricao.EditValue          :=  Model.uf;

        edtDescricaoveiculo.EditValue   :=  Model.descricao;
        edtlocalizacao.EditValue        :=  Model.idlocalizacao;
        edtespecie.EditValue            :=  Model.idespecie;
        edtmarca.EditValue              :=  Model.idmarca;
        edtmodelo.EditValue             :=  Model.idmodelo;
        edtorigem.EditValue             :=  Model.origem;
        edtano.EditValue                :=  Model.ano;
        edtanomodelo.EditValue          :=  Model.anomodelo;

        edtcombustivel.Text             :=  Model.combustivel;
        edtcambio.Text                  :=  Model.cambio;
        edtcor.Text                     :=  Model.cor;
        edtporta.EditValue              :=  Model.porta;

        edtkm.EditValue                 :=  Model.km;
        edtcv.EditValue                 :=  Model.cv;
        edtrenavam.EditValue            :=  Model.renavan;
        edtchassi.EditValue             :=  Model.chassi;
        edtcrv.EditValue                :=  Model.crv;

        edtIPVAPago.EditValue           :=  Model.veiculoipvaPago;
        cxedtativo.EditValue            :=  Model.inativo;
        edtmostrarapp.EditValue         :=  Model.mostrarapp;
        edtIntencaovenda.EditValue      :=  Model.veiculointencaovenda;
        edtEstoque.EditValue            :=  Model.controlaestoque;
        edtPlavamercosul.EditValue      :=  Model.veiculoplacamercosul;
        edtLicPago.EditValue            :=  Model.veiculolicpago;
        edtTaxabombeiro.EditValue       :=  Model.veiculotaxabombeiro;
        edtFinanciamentoAtivo.EditValue :=  Model.veiculofinanciamentoativo;

        vlrFipe.EditValue               :=  Model.veiculofipe;
        edtcompra.EditValue             :=  Model.prccompra;
        vlrCustogerais.EditValue        :=  Model.prccusto;
        edtCustototal.EditValue         :=  Model.veiculocustototal;
        edtprcvenda.EditValue           :=  Model.prcvenda;
        edtValorTroca.EditValue         :=  Model.veiculovalortroca;
        edtperlucro.EditValue           :=  Model.perlucro;
        edtValorLucro.EditValue         :=  Model.veiculolucro;
        edtValorPraticado.EditValue     :=  Model.veiculovalorpraticado;
        edttaxames.EditValue            :=  Model.veiculopatiotaxames;
        edttaxadia.EditValue            :=  Model.veiculopatiotaxadia;
        edtpatiototal.EditValue         :=  Model.veiculopatiototal;
        edtljpercentual.EditValue       :=  Model.veiculocomissaoljpercentual;
        edtljtotal.EditValue            :=  Model.veiculocomissaoljtotal;
        edtvendpercentual.EditValue     :=  Model.veiculocomissaovendpercentual;
        edtvendtotal.EditValue          :=  Model.veiculocomissaovendtotal;
        edtPatioGerar.EditValue         :=  Model.veiculopatiogerar;

        if Model.vencprocuracao <> strtodate('30/12/1899') then
        edtdatahodometro.EditValue      :=  Model.veiculodatahodometro;
        edtNumeromotor.EditValue        :=  Model.veiculonumeromotor;
        edtCodigoseguranca.EditValue    :=  Model.veiculocodigoseguranca;
        edtTipoCRV.EditValue            :=  Model.veiculotipocrv;
        edtProcuracao.EditValue         :=  Model.procuracao;
        if Model.veiculodatahodometro <> strtodate('30/12/1899') then
        edtdtVencimento.EditValue       :=  Model.vencprocuracao;
        edtobs.EditValue                :=  Model.obs;
        edtaviso.EditValue              :=  Model.aviso;

        if model.estoqueatual > 0 then
        lb_estoque.Visible  := True
        else
        lb_estoque.Visible  := False;

        if Model.foto1 <> '' then
        begin
          TConesul.ConvBase64Img(Model.foto1);
          edtfoto.Picture         := TConeSul.nfoto;
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
    Model.Free;
  End;
end;

procedure TFrmCadVeiculo.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
msg:string;
Permissao   : TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Localizacao');

  if Permissao.TemPermissao('Permitir Criar Novo') then
  begin
    Try

      //15/05/2025 Abrir cadastro de localizacao
      Try
        FrmLocalizacao            := TFrmLocalizacao.Create(Application);
        TNavigation.ParamInt    := 0;
        TNavigation.ParamsStr   := 'N';

        FrmLocalizacao.ShowModal;
      Finally
        CarregarCLookupListaLocalizacao;
      End;

    Finally
      CarregarCLookupListaLocalizacao;
    End;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmCadVeiculo.cxButtonEdit3PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
msg:string;
Permissao   : TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Marca Veículo');

  if Permissao.TemPermissao('Permitir Criar Novo') then
  begin
    Try

      //15/05/2025 Abrir cadastro de Marca Veículo
      Try
        FrmCadMarcaVeiculo            := TFrmCadMarcaVeiculo.Create(Application);
        TNavigation.ParamInt    := 0;
        TNavigation.ParamsStr   := 'N';

        FrmCadMarcaVeiculo.ShowModal;
      Finally
        CarregarCLookupListaMarca;
      End;

    Finally
      CarregarCLookupListaMarca;
    End;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

Procedure TFrmCadVeiculo.CarregarCLookupListaMarca;
begin
  TLookupHelper.CarregarLookup(
                Tab_Marca,'Select                                              '+
                           ' id_marca as id,                                   '+
                           ' codigo,                                            '+
                           ' marca as descricao,                                 '+
                           ' Concat(codigo,'' | '',marca) as ncompleto '+
                           ' from marca                                       '+
                           ' where ativo=''S''                           '+
                           ' and excluido=0 and tipo=''V'' order by codigo, marca');
end;

Procedure TFrmCadVeiculo.CarregarCLookupListaLocalizacao;
begin
  TLookupHelper.CarregarLookup(
                Tab_Localizacao,'Select                                              '+
                           ' id_localizacao as id,                                   '+
                           ' codigo,                                            '+
                           ' localizacao as descricao,                                 '+
                           ' Concat(codigo,'' | '',localizacao) as ncompleto '+
                           ' from localizacao                                       '+
                           ' where ativo=''S''                           '+
                           ' and excluido=0 order by codigo, localizacao');
end;

procedure TFrmCadVeiculo.btnespeciePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
msg:string;
Permissao   : TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Espécie Veículo');

  if Permissao.TemPermissao('Permitir Criar Novo') then
  begin
    Try

      //15/05/2025 Abrir cadastro de Espécie Veículo
      Try
        FrmCadEspecieVeiculo            := TFrmCadEspecieVeiculo.Create(Application);
        TNavigation.ParamInt    := 0;
        TNavigation.ParamsStr   := 'N';

        FrmCadEspecieVeiculo.ShowModal;
      Finally
        if (edtgrupo.EditValue > 0) or (edtgrupo.Text <>'') then
        CarregarCLookupListaEspecieVeiculo;
      End;

    Finally
      if (edtgrupo.EditValue > 0) or (edtgrupo.Text <>'') then
      CarregarCLookupListaEspecieVeiculo;
    End;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

Procedure TFrmCadVeiculo.CarregarCLookupListaEspecieVeiculo;
begin
  TLookupHelper.CarregarLookup(
                Tab_Especie,'Select                                              '+
                           ' id_veiculo_especie as id,                                   '+
                           ' codigo,                                            '+
                           ' descricao,                                 '+
                           ' Concat(codigo,'' | '',descricao) as ncompleto '+
                           ' from veiculo_especie                                       '+
                           ' where ativo=''S'' and id_tipo='+QuotedStr(edtgrupo.EditValue) +
                           ' order by codigo, descricao');
end;

procedure TFrmCadVeiculo.btnexcluirfotoClick(Sender: TObject);
begin
  inherited;
  edtfoto.Picture:=nil;
end;

procedure TFrmCadVeiculo.btnFotoClick(Sender: TObject);
var
  OpenDialog: TOpenDialog;
begin

  OpenDialog := TOpenDialog.Create(nil);
  try

    OpenDialog.Filter := 'Imagens JPEG|*.jpg;*.jpeg|Imagens PNG|*.png;*.png';
    OpenDialog.Title := 'Selecione uma foto';

    if OpenDialog.Execute then
    begin
      //if ValidarTamanhoImagem(OpenDialog.FileName,1600,1900) then
      // Carrega a imagem selecionada no TImage
      edtfoto.Picture.LoadFromFile(OpenDialog.FileName);


      //else
      //JKDialog('Aviso','Verifique o tamanho a imagem!', tdAlerta);

    end;


  finally
    // Libera o objeto TOpenDialog
    OpenDialog.Free;
  end;
end;

procedure TFrmCadVeiculo.btnModeloPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
msg:string;
Permissao   : TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Modelo Veículo');

  if Permissao.TemPermissao('Permitir Criar Novo') then
  begin
    Try

      //15/05/2025 Abrir cadastro de Modelo Veículo
      Try
        FrmCadModeloVeiculo            := TFrmCadModeloVeiculo.Create(Application);
        TNavigation.ParamInt    := 0;
        TNavigation.ParamsStr   := 'N';

        FrmCadModeloVeiculo.ShowModal;
      Finally
        if (edtMarca.EditValue > 0) or (edtMarca.Text <>'') then
        CarregarCLookupListaModeloVeiculo;
      End;

    Finally
      if (edtMarca.EditValue > 0) or (edtMarca.Text <>'') then
      CarregarCLookupListaModeloVeiculo;
    End;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

Procedure TFrmCadVeiculo.CarregarCLookupListaModeloVeiculo;
begin
  TLookupHelper.CarregarLookup(
                Tab_Modelo,'Select                                              '+
                           ' id_veiculo_modelo as id,                                   '+
                           ' codigo,                                            '+
                           ' descricao,                                 '+
                           ' Concat(codigo,'' | '',descricao) as ncompleto '+
                           ' from veiculo_modelo                                       '+
                           ' where ativo=''S'' and id_marca='+QuotedStr(edtMarca.EditValue)+
                           ' order by codigo, descricao');
end;

procedure TFrmCadVeiculo.edtCadPessoaPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
msg:string;
Permissao   : TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Tipo Veículo');

  if Permissao.TemPermissao('Permitir Criar Novo') then
  begin
    Try

      //15/05/2025 Abrir cadastro de tipo de veiculo
      Try
        FrmCadTipoVeiculo            := TFrmCadTipoVeiculo.Create(Application);
        TNavigation.ParamInt    := 0;
        TNavigation.ParamsStr   := 'N';

        FrmCadTipoVeiculo.ShowModal;
      Finally
        CarregarCLookupListaTipoveiculo;
      End;

    Finally
      CarregarCLookupListaTipoveiculo;
    End;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

Procedure TFrmCadVeiculo.CarregarCLookupListaTipoveiculo;
begin
  TLookupHelper.CarregarLookup(
                Tab_tipoveiculo,'Select                                              '+
                           ' id_grupo as id,                                   '+
                           ' codigo,                                            '+
                           ' grupo as descricao,                                 '+
                           ' placa_obrigatorio as placa_obrigatoria,'+
                           ' Concat(codigo,'' | '',grupo) as ncompleto '+
                           ' from grupo                                       '+
                           ' where ativo=''S''                           '+
                           ' and excluido=0 and tipo=''V'' order by codigo, grupo');
end;

procedure TFrmCadVeiculo.edtgrupoPropertiesEditValueChanged(Sender: TObject);
begin
  if (edtgrupo.EditValue > 0) or (edtgrupo.Text <>'') then
  CarregarCLookupListaEspecieVeiculo;
end;

procedure TFrmCadVeiculo.edtmarcaPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if (edtmarca.EditValue > 0) or (edtmarca.Text <>'') then
  begin
    CarregarCLookupListaModeloVeiculo;
  end;
end;

procedure TFrmCadVeiculo.edtplacaExit(Sender: TObject);
begin
  inherited;
  if edtPlaca.Text<>'' then
  begin
    if not PlacaValida(edtPlaca.Text) then
    begin
      JKDialog('Aviso','Placa informada inválida!', tdAlerta);
      edtplaca.SetFocus;
      Exit;
    end;
  end;
end;

procedure TFrmCadVeiculo.edtrenavamKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  SomenteNumerosKeyPress(Sender,key);
end;

procedure TFrmCadVeiculo.edttipoPropertiesChange(Sender: TObject);
begin
  inherited;
  if edttipo.ItemIndex<>-1 then
  ValidarOperacao(edttipo.ItemIndex);

end;

procedure TFrmCadVeiculo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmCadVeiculo := nil;
end;

procedure TFrmCadVeiculo.FormShow(Sender: TObject);
begin
  inherited;
  // Carregar Dados Tabela
  TabCarregarDados;
  lb_estoque.Visible    := False;

  if TNavigation.ParamsStr = 'V' then
  begin
    lblTitulo.Caption   := 'Visualizando dado Veículo';
    CarregarDados;
    cxGroupBox1.Enabled := False;
    btnSalvar.Enabled   := false;
    TabValores.Enabled := False;
    TabAdicionais.Enabled := false;
    cxGroupBox5.Enabled := False;
  end
  else if TNavigation.ParamsStr = 'E' then
  begin
    lblTitulo.Caption := 'Editando Veículo';
    CarregarDados;
    edtcodigo.SetFocus;
  end
  else if TNavigation.ParamsStr = 'N' then
  begin
    lblTitulo.Caption := 'Novo Veículo';
    edtcodigo.SetFocus;
    edtativo.Checked := True;

    if TNavigation.ParamsStrCompraOP='CONSIGNADO' then
    edttipo.ItemIndex   := 0;
    if TNavigation.ParamsStrCompraOP='CONSIGNADO LOJA' then
    edttipo.ItemIndex   := 1;
    if TNavigation.ParamsStrCompraOP='PRÓPRIO' then
    edttipo.ItemIndex   := 2;
    if TNavigation.ParamsStrCompraOP='ZERO' then
    edttipo.ItemIndex   := 3;
    edttipo.Enabled     := False; //desabilita o campo
  end;

end;

Procedure TFrmCadVeiculo.TabCarregarDados;
var
msg:string;
begin

  Try
    CarregarCLookupListaTipoveiculo;
    Sleep(100);
    
    CarregarCLookupListaMarca;
    Sleep(100);

    CarregarCLookupListaLocalizacao;

  except on e:exception do
    JKDialog('Erro',e.Message, tdErro);
  End;

end;

function TFrmCadVeiculo.Salvar(out msg: string): Boolean;
var
Model : TModelVeiculo;
begin
  Result  := False;
  Try
    try
      model                     :=  TModelVeiculo.Create;

        //Popular Model
        model.idmarca         := edtmarca.EditValue; //marca veiculo;
        model.idgrupo         := edtgrupo.EditValue; // Tipo veiculo
        model.idunidade       := -1;
        model.idlocalizacao   := edtlocalizacao.EditValue;
        model.idempresa       := TSession.IDEMPRESA;
        model.tipoproduto     := edttipo.Text;    //tipo de Operacao consignado consignado loja, próprio
        model.descricao       := Trim(edtDescricaoveiculo.Text);
        model.desfiscal       := Trim(edtmarca.Text+' / '+edtmodelo.Text);
        model.servico         := 'N';
        model.inativo         := cxedtativo.EditValue;
        model.prccompra       := edtcompra.Value;
        model.percusto        := 0;
        model.prccusto        := vlrCustogerais.EditValue;
        model.perlucro        := edtperlucro.Value;
        model.prcvenda        := edtprcvenda.Value;
        model.estoqueminimo   := 1;
        model.estoqueinicial  := 0;
        model.estoqueatual    := 0;
        model.pesokg          := 0;
        model.prcpromocao     := 0;
        model.obs             := Trim(edtobs.Text);
        model.aviso           := Trim(edtaviso.Text);
        model.mostrarapp      := edtmostrarapp.EditValue;
        model.altedescricao   := 'N';
        model.idusuario       := TSession.ID_USUARIO;

        if edtFoto.Picture.Graphic <> nil then
        model.foto1           := TConeSul.ConvImgBase64(edtfoto);

        model.fracionado      := 'N';
        model.controlaestoque := edtestoque.EditValue;
        model.idespecie       := edtespecie.EditValue;
        model.idmodelo        := edtmodelo.EditValue;
        model.origem          := edtorigem.Text;
        model.ano             := Trim(edtano.Text);
        model.anomodelo       := Trim(edtanomodelo.Text);
        model.combustivel     := edtcombustivel.Text;
        model.cambio          := edtcambio.Text;
        model.cor             := edtcor.Text;
        model.porta           := edtporta.ItemIndex;
        model.km              := edtkm.Text;
        model.cv              := edtcv.Text;
        model.placa           := Trim(TiraPontos(edtplaca.Text));
        model.uf              := Trim(edtDescricao.Text);
        model.renavan         := trim(edtrenavam.Text);
        model.chassi          := Trim(edtchassi.Text);
        Model.crv             := Trim(edtcrv.Text);
        model.procuracao      := edtProcuracao.Text;

        if (edtdtVencimento.EditValue=null) or (edtdtVencimento.Text='') then
        model.vencprocuracao  := NullDate
        else
        model.vencprocuracao  := edtdtVencimento.EditValue;

        model.veiculofipe                     := vlrFipe.EditValue;
        model.veiculocustototal               := edtCustototal.EditValue;
        model.veiculovalortroca               := edtValorTroca.EditValue;
        model.veiculolucro                    := edtValorLucro.EditValue;
        model.veiculovalorpraticado           := edtValorPraticado.EditValue;
        model.veiculopatiotaxames             := edttaxames.EditValue;
        model.veiculopatiotaxadia             := edttaxadia.EditValue;
        model.veiculopatiototal               := edtpatiototal.EditValue;
        model.veiculocomissaoljpercentual     := edtljpercentual.EditValue;
        model.veiculocomissaoljtotal          := edtljtotal.EditValue;
        model.veiculocomissaovendpercentual   := edtvendpercentual.EditValue;
        model.veiculocomissaovendtotal        := edtvendtotal.EditValue;
        model.veiculopatiogerar               := edtPatioGerar.EditValue;

        if (edtdatahodometro.EditValue=null) or (edtdatahodometro.Text='') then  //NullDate
        model.veiculodatahodometro            := NullDate
        else
        model.veiculodatahodometro            := edtdatahodometro.EditValue;

        model.veiculonumeromotor              := Trim(edtNumeromotor.Text);
        if (edtCodigoseguranca.EditValue > 0) or (edtCodigoseguranca.Text <> '') then
        model.veiculocodigoseguranca          := edtCodigoseguranca.EditValue
        else
        model.veiculocodigoseguranca          :='';

        model.veiculotipocrv                  := edtTipoCRV.Text;

        model.veiculoipvaPago                 := edtIPVAPago.EditValue;
        model.veiculointencaovenda            := edtIntencaovenda.EditValue;
        model.veiculoplacamercosul            := edtPlavamercosul.EditValue;
        model.veiculolicpago                  := edtLicPago.EditValue;
        model.veiculotaxabombeiro             := edtTaxabombeiro.EditValue;
        model.veiculofinanciamentoativo       := edtFinanciamentoAtivo.EditValue;

      if TNavigation.ParamsStr='N' then
      begin
        if model.Novo(msg) then;
        Result  := True;
      end
      else
      begin
        model.idproduto := TNavigation.ParamInt;
        if model.SalvarAlteracoes(msg) then;
        Result  := True;
      end;

    Except on e:exception do
      begin
        msg := msg+' :'+e.Message;
        raise;
      end;
    end;
  Finally
    model.Free;
  End;
end;

function TFrmCadVeiculo.ValidarCampos(out msg: string): Boolean;
var
  Val : TValidacao;
begin
  Result  := True;

  if (edttipo.Text = '') or (edttipo.ItemIndex=-1) then
  begin
    msg     := 'Selecione o tipo de operação!';
    result  := False;
    Exit;
  end;

   if (edtgrupo.EditValue = 0) or (edtgrupo.Text='') then
  begin
    msg     := 'Selecione o tipo do veículo!';
    result  := False;
    Exit;
  end;

  if edttipo.ItemIndex <>  5 then
  begin

      if TConfiguracaoService.ValidarCampoPlaca(edtGrupo.EditValue) then
      begin
        if (edtplaca.Text='') or (Length(trim(edtplaca.EditValue)) < 7) then
        begin
          msg     := 'Informe uma placa válida!';
          result  := False;
          Exit;
        end;

        if (edtDescricao.Text='') or (Length(trim(edtDescricao.EditValue)) < 2) then
        begin
          msg     := 'Informe uma UF válida!';
          result  := False;
          Exit;
        end;

      end;


  end;


  if (Trim(edtDescricaoveiculo.Text)='') or (Length(Trim(edtDescricaoveiculo.Text))<3) then
  begin
    msg     := 'Informe a descrição do veículo!';
    result  := False;
    Exit;
  end;

  if (edtlocalizacao.EditValue=0) or (edtlocalizacao.Text='') then
  begin
    msg     := 'Selecione a localização do veículo!';
    result  := False;
    Exit;
  end;

  if (edtespecie.EditValue=0) or (edtespecie.Text='') then
  begin
    msg     := 'Selecione a especie do veículo!';
    result  := False;
    Exit;
  end;

  if (edtmarca.EditValue=0) or (edtmarca.Text='') then
  begin
    msg     := 'Selecione a marca do veículo!';
    result  := False;
    Exit;
  end;

  if (edtmodelo.EditValue=0) or (edtmodelo.Text='') then
  begin
    msg     := 'Selecione o modelo do veículo!';
    result  := False;
    Exit;
  end;

  if (edtorigem.Text='') or (edtorigem.ItemIndex=-1) then
  begin
    msg     := 'Selecione a origem do veículo!';
    result  := False;
    Exit;
  end;

  if (edtano.Text='') or (Length(edtano.Text)<4) then
  begin
    msg     := 'Informe o ano do veículo!';
    result  := False;
    Exit;
  end;

  if (edtanomodelo.Text='') or (Length(edtanomodelo.Text) <4) then
  begin
    msg     := 'Informe o ano modelo do veículo!';
    result  := False;
    Exit;
  end;

  if (edtcombustivel.Text='') or (edtcombustivel.ItemIndex =-1) then
  begin
    msg     := 'Selecione o tipo de combustível!';
    result  := False;
    Exit;
  end;

  if (edtcambio.Text='') or (edtcambio.ItemIndex=-1) then
  begin
    msg     := 'Selecione o tipo do câmbio!';
    result  := False;
    Exit;
  end;

  if (edtcor.Text='') or (edtcor.ItemIndex=-1) then
  begin
    msg     := 'Selecione uma cor!';
    result  := False;
    Exit;
  end;

  if (edtrenavam.Text='') or (Length(edtrenavam.Text)<4) then
  begin
    msg     := 'Informe o número do renavam';
    result  := False;
    Exit;
  end;

  if (edtchassi.Text='') or (Length(edtchassi.Text)<5) then
  begin
    msg     := 'Informe o número do chassi!';
    result  := False;
    Exit;
  end;

  if (edtprcvenda.EditValue=0) or (Length(edtprcvenda.EditValue)<1) then
  begin
    msg     := 'Informe um valor de venda válido!';
    result  := False;
    Exit;
  end;


  if (edtTipoCRV.ItemIndex=-1) then
  begin
    msg     := 'Selecione o tipo do CRV!';
    result  := False;
    Exit;
  end;

  {
  if True then
  begin
    msg     := '';
    result  := False;
    Exit;
  end;
  }

end;

end.
