unit UnitPrincipalNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, 
  dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxClasses, dxRibbonBackstageView, cxBarEditItem,
  dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxCore, dxRibbonCustomizationForm,
  cxTextEdit, dxSkinsForm, dxStatusBar, dxRibbonStatusBar, System.Actions,
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  dxGDIPlusClasses, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, cxImageList,
  Vcl.StdCtrls, Vcl.Buttons, cxStyles, cxGridTableView, UnitPedido,
  UGerOrdemServico, UnitProduto, UnitUnidade, UnitUsuario, UnitAlterarSenha,
  UnitPerfil, UnitConfiguracaoTerminal, UnitFrmMensagem, Vcl.ExtDlgs,
  Model.Avisos, UnitPlanoConta, UnitTransportadora, UnitManifesto,
  UGerenciarCompra, UnitTipoSituacaoCad, UnitLocalTrabalhoCad,
  UnitControleSindicato, UnitDepartamentoCad, UnitCategoriaCad, UnitControleBens,
  UnitControleBancario, UnitHistoricoBancario, UnitAtualizacaoCadastro;

type
  TFrmPrincipalNew = class(TdxRibbonForm)
    dxBarManager1: TdxBarManager;
    dxRibbon: TdxRibbon;
    TabCadastro: TdxRibbonTab;
    dxRibbonStatusBar: TdxRibbonStatusBar;
    dxSkinSistema: TdxSkinController;
    dxBarManager1Bar2: TdxBar;
    cxBarEditItem1: TcxBarEditItem;
    BarCadastro: TdxBar;
    TabVeiculo: TdxRibbonTab;
    TabAssociacao: TdxRibbonTab;
    TabMovimentacao: TdxRibbonTab;
    TabOrdemServiso: TdxRibbonTab;
    TabFiscal: TdxRibbonTab;
    TabFinanceiro: TdxRibbonTab;
    TabAcesso: TdxRibbonTab;
    TabFerramentas: TdxRibbonTab;
    TabLocacao: TdxRibbonTab;
    Menu: TActionManager;
    Cad_Empresa: TAction;
    Cad_Pessoa: TAction;
    Cad_funcionario: TAction;
    Cad_FormaPagamento: TAction;
    Cad_PlanoContas: TAction;
    cad_Contas: TAction;
    Cad_Transportadora: TAction;
    Cad_Produto: TAction;
    Cad_marca: TAction;
    Cad_Grupo: TAction;
    Cad_Unidade: TAction;
    Cad_Localizacao: TAction;
    Ac_Pedido: TAction;
    Ac_ConsulNF: TAction;
    Cad_Cidade: TAction;
    ac_compra: TAction;
    ac_pdv: TAction;
    ac_devolucao: TAction;
    actTroca: TAction;
    Aclivrocaixa: TAction;
    ActTerminal: TAction;
    ActUsuario: TAction;
    ActAcesso: TAction;
    ActAltsenha: TAction;
    ActWhatsApp: TAction;
    ActLogof: TAction;
    ActSocioDep: TAction;
    ActHistorico: TAction;
    ActSecretaria: TAction;
    ActCandidato: TAction;
    Actcampanha: TAction;
    ActEleicao: TAction;
    ActCarteirinha: TAction;
    ActSede: TAction;
    ActOutros: TAction;
    ActEmpCad: TAction;
    ActProfissao: TAction;
    ActLotacao: TAction;
    ActEstoque: TAction;
    ActHistoricoProduto: TAction;
    ActEstatistica: TAction;
    ActTickets: TAction;
    ActConvenio: TAction;
    ActWeb: TAction;
    actSincronizar: TAction;
    ActStatus: TAction;
    Actregistro: TAction;
    ActNotificacao: TAction;
    ActBotInstalar: TAction;
    actIniciarservice: TAction;
    ActAutorizacao: TAction;
    actTipo: TAction;
    ActEspecie: TAction;
    ActMarca: TAction;
    ActModelo: TAction;
    ActGaragem: TAction;
    ActEntradaVeiculo: TAction;
    ActSaidaVeiculo: TAction;
    AcTipoDocumento: TAction;
    Act_ordemServico: TAction;
    Act_equipamento: TAction;
    ActReceber: TAction;
    dxCFOP: TdxBarLargeButton;
    dxCidade: TdxBarLargeButton;
    dxConta: TdxBarLargeButton;
    dxEmpresa: TdxBarLargeButton;
    dxPagamento: TdxBarLargeButton;
    dxFuncionario: TdxBarLargeButton;
    dxGrupo: TdxBarLargeButton;
    dxLocalizaao: TdxBarLargeButton;
    dxMarca: TdxBarLargeButton;
    Cad_CFOP: TAction;
    dxPessoa: TdxBarLargeButton;
    dxPlanoConta: TdxBarLargeButton;
    dxProduto: TdxBarLargeButton;
    dxTransportadora: TdxBarLargeButton;
    dxUnidade: TdxBarLargeButton;
    Logofundo: TImage;
    cxImageStatus: TcxImageList;
    BitBtn1: TBitBtn;
    cxStyle: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxGridHeader: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxColunaPedido: TcxStyle;
    GridCancelado: TcxStyle;
    GridSolicitacao: TcxStyle;
    GridPago: TcxStyle;
    GridInativo: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    GridVencido: TcxStyle;
    GridVencDia: TcxStyle;
    CxGridPedido: TcxGridTableViewStyleSheet;
    GridTableDependente: TcxGridTableViewStyleSheet;
    dxBarCadastro: TdxBar;
    dxBarTicket: TdxBar;
    dxBarCarteira: TdxBar;
    dxBarEstatistica: TdxBar;
    dxBarVotacao: TdxBar;
    dxBarSincronizacao: TdxBar;
    dxAssociado: TdxBarLargeButton;
    dxSede: TdxBarLargeButton;
    dxBarLargeButton17: TdxBarLargeButton;
    dxOutros: TdxBarSubItem;
    dxTicket: TdxBarLargeButton;
    dxCarteira: TdxBarLargeButton;
    dxappweb: TdxBarLargeButton;
    dxNotificacao: TdxBarLargeButton;
    dxAutorizacao: TdxBarLargeButton;
    dxEstatisticas: TdxBarLargeButton;
    dxRegistroEntrada: TdxBarLargeButton;
    dxCandidato: TdxBarLargeButton;
    dxeleicao: TdxBarLargeButton;
    dxCampanha: TdxBarLargeButton;
    dxsincronizar: TdxBarLargeButton;
    dxBarLargeButton29: TdxBarLargeButton;
    dxBarLargeButton30: TdxBarLargeButton;
    dxBarLargeButton31: TdxBarLargeButton;
    dxBarLargeButton32: TdxBarLargeButton;
    dxBarLargeButton33: TdxBarLargeButton;
    dxBarLargeButton34: TdxBarLargeButton;
    dxBarLargeButton35: TdxBarLargeButton;
    dxBarLargeButton36: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    ActLog: TAction;
    dxBarManager1Bar1: TdxBar;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarManager1Bar3: TdxBar;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    dxBarLargeButton11: TdxBarLargeButton;
    dxBarLargeButton12: TdxBarLargeButton;
    dxBarLargeButton13: TdxBarLargeButton;
    dxBarManager1Bar5: TdxBar;
    dxBarManager1Bar6: TdxBar;
    dxBarLargeButton14: TdxBarLargeButton;
    dxBarLargeButton15: TdxBarLargeButton;
    dxBarLargeButton16: TdxBarLargeButton;
    dxBarLargeButton18: TdxBarLargeButton;
    dxBarManager1Bar7: TdxBar;
    dxBarManager1Bar8: TdxBar;
    dxBarManager1Bar9: TdxBar;
    dxBarLargeButton19: TdxBarLargeButton;
    dxBarLargeButton20: TdxBarLargeButton;
    dxBarLargeButton21: TdxBarLargeButton;
    dxBarLargeButton22: TdxBarLargeButton;
    Memo1: TMemo;
    dxBarManager1Bar10: TdxBar;
    dxBarManager1Bar11: TdxBar;
    dxBarLargeButton23: TdxBarLargeButton;
    Logzap: TAction;
    dxBarSubItem1: TdxBarSubItem;
    dxBarLargeButton24: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton25: TdxBarLargeButton;
    dxBarLargeButton26: TdxBarLargeButton;
    TimerHora: TTimer;
    OpenPicture: TOpenPictureDialog;
    dxBarManager1Bar12: TdxBar;
    dxBarLargeButton27: TdxBarLargeButton;
    dxBarSindicato: TdxBar;
    dxBarLargeButton28: TdxBarLargeButton;
    dxBarLargeButton37: TdxBarLargeButton;
    dxBarLargeButton38: TdxBarLargeButton;
    dxBarTipoSituacao: TdxBarLargeButton;
    ActTipoSituacao: TAction;
    dxBarLocalTrabalho: TdxBarLargeButton;
    ActLocalTrabalho: TAction;
    ActControleAssociado: TAction;
    ActControlebens: TAction;
    dxBarLargeButton39: TdxBarLargeButton;
    dxBarLargeButton40: TdxBarLargeButton;
    ActCategoria: TAction;
    ActDepartamento: TAction;
    dxBarManager1Bar4: TdxBar;
    dxBarManager1Bar13: TdxBar;
    dxBarManager1Bar14: TdxBar;
    dxBarLargeButton41: TdxBarLargeButton;
    dxBarLargeButton42: TdxBarLargeButton;
    dxBarLargeButton43: TdxBarLargeButton;
    ActBancario: TAction;
    ActHistoricoBancario: TAction;
    dxBarLargeButton44: TdxBarLargeButton;
    dxBarLargeButton45: TdxBarLargeButton;
    Ac_solicitacaoapi: TAction;
    procedure FormCreate(Sender: TObject);
    procedure Cad_CidadeExecute(Sender: TObject);
    procedure cad_ContasExecute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Cad_CFOPExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Cad_EmpresaExecute(Sender: TObject);
    procedure Cad_funcionarioExecute(Sender: TObject);
    procedure Cad_FormaPagamentoExecute(Sender: TObject);
    procedure Cad_GrupoExecute(Sender: TObject);
    procedure ActSocioDepExecute(Sender: TObject);
    procedure ActSedeExecute(Sender: TObject);
    procedure ActEmpCadExecute(Sender: TObject);
    procedure ActSecretariaExecute(Sender: TObject);
    procedure ActProfissaoExecute(Sender: TObject);
    procedure ActLotacaoExecute(Sender: TObject);
    procedure ActConvenioExecute(Sender: TObject);
    procedure ActTicketsExecute(Sender: TObject);
    procedure ActCarteirinhaExecute(Sender: TObject);
    procedure ActWebExecute(Sender: TObject);
    procedure ActNotificacaoExecute(Sender: TObject);
    procedure ActAutorizacaoExecute(Sender: TObject);
    procedure ActEstatisticaExecute(Sender: TObject);
    procedure ActregistroExecute(Sender: TObject);
    procedure ActEleicaoExecute(Sender: TObject);
    procedure ActcampanhaExecute(Sender: TObject);
    procedure ActLogExecute(Sender: TObject);
    procedure Cad_LocalizacaoExecute(Sender: TObject);
    procedure Cad_marcaExecute(Sender: TObject);
    procedure Cad_PessoaExecute(Sender: TObject);
    procedure Ac_PedidoExecute(Sender: TObject);
    procedure Act_ordemServicoExecute(Sender: TObject);
    procedure Cad_ProdutoExecute(Sender: TObject);
    procedure Cad_UnidadeExecute(Sender: TObject);
    procedure ActUsuarioExecute(Sender: TObject);
    procedure ActAltsenhaExecute(Sender: TObject);
    procedure ActAcessoExecute(Sender: TObject);
    procedure ActLogofExecute(Sender: TObject);
    procedure ActTerminalExecute(Sender: TObject);
    procedure ActWhatsAppExecute(Sender: TObject);
    procedure ActBotInstalarExecute(Sender: TObject);
    procedure actIniciarserviceExecute(Sender: TObject);
    procedure dxBarSubItem1Click(Sender: TObject);
    procedure TimerHoraTimer(Sender: TObject);
    procedure LogofundoDblClick(Sender: TObject);
    procedure actSincronizarExecute(Sender: TObject);
    procedure Cad_PlanoContasExecute(Sender: TObject);
    procedure Cad_TransportadoraExecute(Sender: TObject);
    procedure Ac_ConsulNFExecute(Sender: TObject);
    procedure ac_compraExecute(Sender: TObject);
    procedure ActTipoSituacaoExecute(Sender: TObject);
    procedure ActLocalTrabalhoExecute(Sender: TObject);
    procedure ActControleAssociadoExecute(Sender: TObject);
    procedure ActCategoriaExecute(Sender: TObject);
    procedure ActDepartamentoExecute(Sender: TObject);
    procedure ActControlebensExecute(Sender: TObject);
    procedure ActBancarioExecute(Sender: TObject);
    procedure ActHistoricoBancarioExecute(Sender: TObject);
    procedure Ac_solicitacaoapiExecute(Sender: TObject);
  private
    procedure CarregaImagemFundo;
    procedure CarregarSistema;
    function ValidarConexao: Boolean;
    function CriarEmpresa: Boolean;
    function ChamaLogin: Boolean;
    procedure AbrirURL(const URL: string);
    function LiberarModulo: Boolean;
    function Iniciarbootwhatsapp(const service: string): boolean;
    function Instalarbootwhatsapp(const service: string): Boolean;
    procedure AvisoSistema;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipalNew: TFrmPrincipalNew;

implementation

{$R *.dfm}

uses UnitBasePesquisa, UFormNovoBaseGerenciamento, UFormNovoBasePesquisa,
  UnitPesqCFOP, uConfiguracaoService, Vcl.Session, uJKDialog, UConeSul, UDM,
  Model.Empresa, UnitEmpresaRegistro, UnitLogin, UnitConfiguracaoBancoDados,
  UnitPesqCidade, UnitContas, UnitPesqEmpresa, UnitFuncionario, UnitPrazo,
  UnitGrupo, Vcl.PermissaoUsuario, UnitAssociado, UnitSede, UnitCadEmpresa,
  UnitEmpresa, UnitEmpCad, UnitSecretariaCadn, UniProfissaoCad, UnitLotacaoCad,
  UnitConsConvenio, UnitConsTickets, UnitCarteirinha, Winapi.ShellAPI,
  UnitFrmNotificacaoAPP, UnitAutorizacao, UnitEstatistica,
  UnitConsRegistroEntrada,
  ULogsSincronizacao, UnitLocalizacao, UnitMarca, UnitPessoas, Winapi.WinSvc,
  UnitAvisoDependente, System.IniFiles, UnitEleicao;

{ TFrmPrincipalNew }

{$REGION 'Função Botoes Menu'}

procedure TFrmPrincipalNew.ActAcessoExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  //perfil
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Perfil');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmPerfil) then
    FrmPerfil  := TFrmPerfil.Create(Application);
    FrmPerfil.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActAltsenhaExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  //alterar senha
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Alterar Senha');

  if Permissao.TemPermissao('Permitir Alterar Senha') then
  begin
    if not Assigned(FrmAlterarSenha) then
    FrmAlterarSenha  := TFrmAlterarSenha.Create(Application);
    FrmAlterarSenha.ShowModal;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActAutorizacaoExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Autorização');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmAutorizacao) then
    FrmAutorizacao  := TFrmAutorizacao.Create(Application);
    FrmAutorizacao.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActBancarioExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Controle Bancário');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmControleBancario) then
    FrmControleBancario  := TFrmControleBancario.Create(Application);
    FrmControleBancario.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActBotInstalarExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  //easybot instalacao
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Instalar Bot');

  if Permissao.TemPermissao('Permitir Instalar Bot') then
  begin
      if Instalarbootwhatsapp('Easybotservice') then
    begin
      JKDialog('Sucesso','Serviço instalado com sucesso.', tdsucesso);
    end
    else
      JKDialog('Erro','Erro ao instalar o serviço.', tderro);
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

function TFrmPrincipalNew.Instalarbootwhatsapp(const service: string): Boolean;
var
  SCMHandle, ServiceHandle: SC_HANDLE;
begin
  Result := False;

  // Abrir o Gerenciador de Controle de Serviços
  SCMHandle := OpenSCManager(nil, nil, SC_MANAGER_CREATE_SERVICE);
  if SCMHandle = 0 then
  begin
    Writeln('Erro ao abrir o Gerenciador de Serviços: ', GetLastError);
    Exit;
  end;

  try
    // Criar o serviço
    ServiceHandle := CreateService(
      SCMHandle,           // Gerenciador de Serviços
      PChar(service),  // Nome interno do Serviço
      PChar(service),  // Nome de exibição
      SERVICE_ALL_ACCESS,  // Permissões
      SERVICE_WIN32_OWN_PROCESS, // Tipo de Serviço
      SERVICE_AUTO_START,  // Tipo de Inicialização
      SERVICE_ERROR_NORMAL,// Tipo de Erro
      PChar(dm.nDirArquivo+'\Easybot.exe'),     // Caminho para o executável
      nil, nil, nil, nil, nil);

    if ServiceHandle = 0 then
    begin
      Writeln('Erro ao criar o serviço: ', GetLastError);
      Exit;
    end;

    CloseServiceHandle(ServiceHandle);
    Result := True;
  finally
    CloseServiceHandle(SCMHandle);
  end;
end;

function TFrmPrincipalNew.Iniciarbootwhatsapp(const service: string): boolean;
var
  SCMHandle, ServiceHandle: SC_HANDLE;
  ServiceStatus: TServiceStatus;
  Args: PWideChar;
  WaitTime: Integer;
begin
  Result := False;
  Args  := nil;
  // Abrir o Gerenciador de Controle de Serviços
  SCMHandle := OpenSCManager(nil, nil, SC_MANAGER_CONNECT);
  if SCMHandle = 0 then
  begin
    Writeln('Erro ao abrir o Gerenciador de Serviços: ', GetLastError);
    Exit;
  end;

  try
    // Abrir o Serviço
    ServiceHandle := OpenService(SCMHandle, PChar(service), SERVICE_START);
    if ServiceHandle = 0 then
    begin
      Writeln('Erro ao abrir o serviço: ', GetLastError);
      Exit;
    end;

    try
      // Iniciar o Serviço
      if not StartService(ServiceHandle, 0, Args) then
      begin
        Writeln('Erro ao iniciar o serviço: ', GetLastError);
        Exit;
      end;

      // Verificar status
      QueryServiceStatus(ServiceHandle, ServiceStatus);
      if SERVICE_RUNNING = 4 then
      Result  := True
      else
      Result := ServiceStatus.dwCurrentState = SERVICE_RUNNING;
    finally
      CloseServiceHandle(ServiceHandle);
    end;
  finally
    CloseServiceHandle(SCMHandle);
  end;
end;





procedure TFrmPrincipalNew.ActcampanhaExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Campanha');

//  if Permissao.TemPermissao('Permitir Utilizar') then
//  begin  //Autorizacao
//    if not Assigned(FrmGerEleicao) then
//    FrmGerEleicao  := TFrmGerEleicao.Create(Application);
//    FrmGerEleicao.Show;
//  end
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
end;

procedure TFrmPrincipalNew.ActCarteirinhaExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Carteira');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmCarteira) then
    FrmCarteira  := TFrmCarteira.Create(Application);
    FrmCarteira.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActCategoriaExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Categoria');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmCategoriaCad) then
    FrmCategoriaCad  := TFrmCategoriaCad.Create(Application);
    FrmCategoriaCad.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActControleAssociadoExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Associados/Dependentes');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmAssociadoSindicato) then
    FrmAssociadoSindicato  := TFrmAssociadoSindicato.Create(Application);
    FrmAssociadoSindicato.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActControlebensExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Bem');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmControleBens) then
    FrmControleBens  := TFrmControleBens.Create(Application);
    FrmControleBens.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActConvenioExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Convênio');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmConConveio) then
    FrmConConveio  := TFrmConConveio.Create(Application);
    FrmConConveio.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActDepartamentoExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Departamento');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmdepartamentoCad) then
    FrmdepartamentoCad  := TFrmdepartamentoCad.Create(Application);
    FrmdepartamentoCad.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActEleicaoExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Eleição');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmEleicao) then
    FrmEleicao  := TFrmEleicao.Create(Application);
    FrmEleicao.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActEmpCadExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Empresa');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmEmpCad) then
    FrmEmpCad  := TFrmEmpCad.Create(Application);
    FrmEmpCad.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActEstatisticaExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Estatísticas');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmEstatisticas) then
    FrmEstatisticas  := TFrmEstatisticas.Create(Application);
    FrmEstatisticas.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActHistoricoBancarioExecute(Sender: TObject);
var
Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Histórico Bancário');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmHistoricoBancario) then
    FrmHistoricoBancario  := TFrmHistoricoBancario.Create(Application);
    FrmHistoricoBancario.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActLocalTrabalhoExecute(Sender: TObject);
var
Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Local Trabalho');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmLocalTrabalhoCad) then
    FrmLocalTrabalhoCad  := TFrmLocalTrabalhoCad.Create(Application);
    FrmLocalTrabalhoCad.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActLogExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Logs Sincronização');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmLogs) then
    FrmLogs  := TFrmLogs.Create(Application);
    FrmLogs.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActLogofExecute(Sender: TObject);
begin
  if ChamaLogin then
    exit;
end;

procedure TFrmPrincipalNew.ActLotacaoExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Lotação');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmProfissaoCad) then
    FrmLotacaoCad  := TFrmLotacaoCad.Create(Application);
    FrmLotacaoCad.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActNotificacaoExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Notificação Web');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmEnviarNotificacao) then
    FrmEnviarNotificacao            := TFrmEnviarNotificacao.Create(Application);
    FrmEnviarNotificacao.ParamsStr  := 'N';
    FrmEnviarNotificacao.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActProfissaoExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Profissão');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmProfissaoCad) then
    FrmProfissaoCad  := TFrmProfissaoCad.Create(Application);
    FrmProfissaoCad.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActregistroExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Registro de Entrada');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmRegistroEntrada) then
    FrmRegistroEntrada  := TFrmRegistroEntrada.Create(Application);
    FrmRegistroEntrada.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActSecretariaExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Secretaria');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmSecretariaCadN) then
    FrmSecretariaCadN  := TFrmSecretariaCadN.Create(Application);
    FrmSecretariaCadN.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActSedeExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Sede');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmSede) then
    FrmSede  := TFrmSede.Create(Application);
    FrmSede.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.actSincronizarExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  //sincronizacao
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Sede');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
    begin

    end;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActSocioDepExecute(Sender: TObject);
var
Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao   := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Associados/Dependentes');
  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmAssociado) then
    FrmAssociado  := TFrmAssociado.Create(Application);
    FrmAssociado.Show;
  end
  else
  JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.actIniciarserviceExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Iniciar Bot');

  if Permissao.TemPermissao('Permitir Iníciar Bot') then
  begin
    if Iniciarbootwhatsapp('Easybotservice') then
    begin
      JKDialog('Sucesso','Serviço iniciado com sucesso.', tdsucesso);
    end
    else
      JKDialog('Erro','Erro ao iniciar o serviço.', tderro);
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActTerminalExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  //Terminal
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Terminal');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmConfiguracaoTerminal) then
    FrmConfiguracaoTerminal  := TFrmConfiguracaoTerminal.Create(Application);
    FrmConfiguracaoTerminal.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActTicketsExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Ticket');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmConsTickets) then
    FrmConsTickets  := TFrmConsTickets.Create(Application);
    FrmConsTickets.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActTipoSituacaoExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Tipo Situação');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmTipoSituacaoCad) then
    FrmTipoSituacaoCad  := TFrmTipoSituacaoCad.Create(Application);
    FrmTipoSituacaoCad.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActUsuarioExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Usuário');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmUsuario) then
    FrmUsuario  := TFrmUsuario.Create(Application);
    FrmUsuario.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActWebExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);

  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'APP Web');

  if Permissao.TemPermissao('Permitir Abrir APP Web') then
    AbrirURL('https://asmuv.conesulsistemas.com.br')
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ActWhatsAppExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  //mensagem padrao
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Cadastro Mensagem');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmMensagem) then
    FrmMensagem         := TFrmMensagem.Create(Application);
    FrmMensagem.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.Act_ordemServicoExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Ordem Serviço');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmGerOrdemServico) then
    FrmGerOrdemServico         := TFrmGerOrdemServico.Create(Application);
    FrmGerOrdemServico.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.ac_compraExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  //compras
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Manifesto');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmGerenciarCompra) then
    FrmGerenciarCompra         := TFrmGerenciarCompra.Create(Application);
    FrmGerenciarCompra.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.Ac_ConsulNFExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Manifesto');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmManifesto) then
    FrmManifesto         := TFrmManifesto.Create(Application);
    FrmManifesto.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.Ac_PedidoExecute(Sender: TObject); //FrmPedido
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Pedido');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmPedido) then
    FrmPedido         := TFrmPedido.Create(Application);
    FrmPedido.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.Ac_solicitacaoapiExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  //Solicitação API
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Associados/Dependentes');

  if Permissao.TemPermissao('Permitir Processar atualização') then
  begin
    if not Assigned(FrmAssociadoAtualizacao) then
    FrmAssociadoAtualizacao  := TFrmAssociadoAtualizacao.Create(Application);
    FrmAssociadoAtualizacao.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.AbrirURL(const URL: string);
begin
  ShellExecute(0, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
end;

procedure TFrmPrincipalNew.BitBtn1Click(Sender: TObject);
begin
  //TFormNovoBaseGerenciamento,
  FormNovoBasePesquisa.show;
end;

procedure TFrmPrincipalNew.Cad_CFOPExecute(Sender: TObject);
begin
  //Cfop
  if not Assigned(FrmPesqCFOP) then
    FrmPesqCFOP := TFrmPesqCFOP.Create(Application);

  FrmPesqCFOP.Show;
end;

procedure TFrmPrincipalNew.Cad_CidadeExecute(Sender: TObject);
begin
  //CIdade
  if not Assigned(FrmPesCidade) then
    FrmPesCidade := TFrmPesCidade.Create(Application);

  FrmPesCidade.Show;
end;

procedure TFrmPrincipalNew.cad_ContasExecute(Sender: TObject);
begin
  //Contas

  if not Assigned(FrmContas) then
    FrmContas := TFrmContas.Create(Application);

  FrmContas.Show;
end;

procedure TFrmPrincipalNew.Cad_EmpresaExecute(Sender: TObject);
begin
  //Empresa
  if not Assigned(FormPesqEmpresa) then
    FormPesqEmpresa := TFormPesqEmpresa.Create(Application);
  FormPesqEmpresa.Show;
end;

procedure TFrmPrincipalNew.Cad_FormaPagamentoExecute(Sender: TObject);
begin
  //Prazo de pagamento
  if not Assigned(FrmPrazo) then
    FrmPrazo := TFrmPrazo.Create(Application);
  FrmPrazo.Show;
end;

procedure TFrmPrincipalNew.Cad_funcionarioExecute(Sender: TObject);
begin
  //Funcionario
  if not Assigned(FrmFuncionario) then
    FrmFuncionario := TFrmFuncionario.Create(Application);
  FrmFuncionario.Show;
end;

procedure TFrmPrincipalNew.Cad_GrupoExecute(Sender: TObject);
begin
  //grupo
  if not Assigned(FrmGrupo) then
    FrmGrupo := TFrmGrupo.Create(Application);

  FrmGrupo.Show;

end;

procedure TFrmPrincipalNew.Cad_LocalizacaoExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  //Localizacao
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'localizacao');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmLocalizacao) then
    FrmLocalizacao  := TFrmLocalizacao.Create(Application);
    FrmLocalizacao.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);

end;

procedure TFrmPrincipalNew.Cad_marcaExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  //Marca
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'marca');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmMarca) then
    FrmMarca  := TFrmMarca.Create(Application);
    FrmMarca.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.Cad_PessoaExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  //Pessoa
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Pessoa');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmPessoa) then
    FrmPessoa  := TFrmPessoa.Create(Application);
    FrmPessoa.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.Cad_PlanoContasExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  //Plano contas
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Plano de Contas');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmPlanoContaCons) then
    FrmPlanoContaCons   := TFrmPlanoContaCons.Create(Application);
    FrmPlanoContaCons.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.Cad_ProdutoExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  //Produto
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Produto');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmProdutos) then
    FrmProdutos   := TFrmProdutos.Create(Application);
    FrmProdutos.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.Cad_TransportadoraExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  //transportadora
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Transportadora');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmProdutos) then
    FrmTransportadoraConsulta   := TFrmTransportadoraConsulta.Create(Application);
    FrmTransportadoraConsulta.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPrincipalNew.Cad_UnidadeExecute(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  //unidade
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Unidade');

  if Permissao.TemPermissao('Permitir Utilizar') then
  begin
    if not Assigned(FrmUnidade) then
    FrmUnidade   := TFrmUnidade.Create(Application);
    FrmUnidade.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

{$ENDREGION}

{$REGION 'Form'}

procedure TFrmPrincipalNew.FormCreate(Sender: TObject);
begin
  DisableAero := True;
  dxSkinSistema.NativeStyle := False;
  dxSkinSistema.SkinName := 'Office2019Colorful';
end;

procedure TFrmPrincipalNew.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //Atualizar Lista de acesso
  if key = vk_F12 then
  begin
    Try
      if TConfiguracaoService.CriarAcesso(TSession.idempresa) then
      JKDialog('Sucesso','Nível atualizado com sucesso.', tdSucesso);
    Except on e:exception do
      begin
        JKDialog('Erro','Ocorreu um erro: '+e.Message, tderro);
      end;
    End;
  end;

end;

procedure TFrmPrincipalNew.FormShow(Sender: TObject);
begin
  //Iniciar Sistema

  CarregaImagemFundo;
  CarregarSistema;

  dxRibbonStatusBar.Panels[3].Text    := TSession.NOME;
  dxRibbonStatusBar.Panels[9].Text    := TSession.localsys;
  dxRibbonStatusBar.Panels[12].Text   := TSession.versaosys;
  FrmPrincipalNew.Caption  := Application.Title +' - Registrado para: ['+ inttostr(TSession.idempresa)+'] '+TSession.razao;

end;

procedure TFrmPrincipalNew.CarregaImagemFundo;
begin

  if FileExists(TConeSul.LerValorIni(dm.nDir,'PEDIDO','ImgFundo','')) then
  begin
    LogoFundo.Picture.LoadFromFile(TConeSul.LerValorIni(dm.nDir,'PEDIDO','ImgFundo',''));
  end;

end;

Procedure TFrmPrincipalNew.CarregarSistema;
begin
  //Testar conexão com o banco de dados

  if ValidarConexao then
  begin
    CriarEmpresa;

    if ChamaLogin then
    exit;

  end
  else
  begin
    try
      if not Assigned(FrmConfiguracaoBancodados) then
      FrmConfiguracaoBancodados  := TFrmConfiguracaoBancodados.Create(Application);
      FrmConfiguracaoBancodados.ShowModal;
    finally
      dm.Conn.Close;
      dm.ConexaoBanco;
    end;
  end;

end;

Function TFrmPrincipalNew.ValidarConexao:Boolean;
begin
  Result := False;

  Try
    if dm.Conn.Connected = False then
    begin
      Result  := false;
    end
    else
    Result := True;
  Except on E: Exception do
    begin
      if not Assigned(FrmConfiguracaoBancodados) then
      FrmConfiguracaoBancodados  := TFrmConfiguracaoBancodados.Create(Application);
      FrmConfiguracaoBancodados.ShowModal;
      JKDialog('Erro','Erro ao conectar ao banco de dados: '+e.Message, tderro);
    end;
  end;

end;

Function TFrmPrincipalNew.CriarEmpresa:Boolean;
var
Model : TModelEmpresa;
msg   :string;
begin
  Result  := False;
  Try
    try
      Model             :=  TModelEmpresa.Create;

      if Model.Registrada(msg) then
      begin
        if msg='OK' then
        Result  := True;

      end
      else
      begin
        //Chamar a tela para registro
        Try
          FrmRegistroEmpresa  := TFrmRegistroEmpresa.create(Application);
          FrmRegistroEmpresa.ShowModal;

        Finally
          FrmRegistroEmpresa.Release;
        End;
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

procedure TFrmPrincipalNew.dxBarSubItem1Click(Sender: TObject);
begin
  //
end;

function TFrmPrincipalNew.ChamaLogin: Boolean;
var
  msg, ret: string;
begin
  Result := False;

  FrmLogin := TFrmLogin.Create(Application);
  FrmLogin.ShowModal;
  try

      // Protege a chamada de verificação de terminal
      {try
        if RegistroTerminal(msg, ret) then
        begin
          if ret = 'N' then
          begin
            JKDialog('Acesso Negado',
              'O seu terminal não tem permissão para acessar.' + sLineBreak +
              'Por favor, entre em contato com o administrador do sistema.',
              tdAlerta);
            Application.Terminate;
          end;
        end
        else
        begin
          JKDialog('Erro de Registro',
            'Falha ao validar o terminal. Verifique a conexão ou permissões.',
            tdErro);
          Exit;
        end;
      except
        on E: Exception do
        begin
          JKDialog('Erro',
            'Erro ao validar terminal: ' + E.Message,
            tdErro);
          Exit;
        end;
      end;   Voltar  }

     LiberarModulo;
     AvisoSistema;
     Result := True;

  finally
    FrmLogin.Free;
  end;
end;

Procedure TFrmPrincipalNew.AvisoSistema;
var
  Config: TIniFile;
  avisodependente:string;
  Model:TModelAvisos;
begin
  Config := TIniFile.Create(dm.nDirArquivo + '\Config.ini');

  Try
    avisodependente   := Config.ReadString('PEDIDO', 'Avisodependente', 'N');

    if avisodependente='S' then
    begin
      Model     := TModelAvisos.Create;

      Try
        if Model.AvisoDependente18Anos then
        begin
          FrmAvisoDependente    := TFrmAvisoDependente.Create(Application);
          FrmAvisoDependente.ShowModal;
        end;
      Finally
        FreeAndNil(Model);
      End;

    end;

  finally
    Config.Free;
  end;

end;


function TFrmPrincipalNew.LiberarModulo;
begin
 Try
  TabVeiculo.Visible      := False;
  TabAssociacao.Visible   := False;
  TabMovimentacao.Visible := False;
  TabOrdemServiso.Visible := False;
  TabFiscal.Visible       := False;
  TabFinanceiro.Visible   := False;
  TabLocacao.Visible      := False;


  {$REGION  'Associado'}

  if (TSession.oneAssociacao = 'S') then
  begin
    //Aba Cadastro
    TabCadastro.Visible     := True;
    dxPessoa.Visible        := ivNever;

    //Aba Associacao
    TabAssociacao.Visible   := True;

    //Validar configurações
    if TConfiguracaoService.UsarSubModTicket(TSession.IDEMPRESA) then
    begin
      dxBarTicket.Visible       := True;
    end
    else
    begin
      dxBarTicket.Visible       := False;
    end;

    if TConfiguracaoService.UsarSubModCarteira(TSession.IDEMPRESA) then
    begin
      dxBarCarteira.Visible     := True;
      dxBarEstatistica.Visible  := True;
    end
    else
    begin
      dxBarCarteira.Visible     := False;
      dxBarEstatistica.Visible  := False;
    end;


    //habilitar sindicato dentro da associação
    if TConfiguracaoService.usarSubModSindicato(TSession.IDEMPRESA) then
    begin
      dxBarSindicato.Visible    := True;
      dxBarTipoSituacao.Visible := ivAlways;
      dxBarLocalTrabalho.Visible:= ivAlways;
    end
    else
    begin
      dxBarSindicato.Visible    := False;
      dxBarTipoSituacao.Visible := ivNever;
      dxBarLocalTrabalho.Visible:= ivNever;
    end;


    if TConfiguracaoService.UsarSubModVotacao(TSession.IDEMPRESA) then
    dxBarVotacao.Visible  := True
    else
    dxBarVotacao.Visible  := False;



    TabVeiculo.Visible      := False;
    TabMovimentacao.Visible := False;
    TabOrdemServiso.Visible := False;
    TabFiscal.Visible       := False;
    TabFinanceiro.Visible   := True;
    TabLocacao.Visible      := False;


  end;

  {$ENDREGION}

  {$REGION  'Pedido - padrao sistema'}

  if (TSession.onePedido = 'S') then
  begin
    TabMovimentacao.Visible := True;
    TabVeiculo.Visible      := False;

    TabOrdemServiso.Visible := False;
    TabFiscal.Visible       := True;
    TabFinanceiro.Visible   := False;
    TabLocacao.Visible      := False;

  end;

  {$ENDREGION}

  {$REGION 'Financeiro'}

    //if TConfiguracaoService.UsarFinanceiro(TSession.IDEMPRESA) then


    //TabFinanceiro.Visible   := True;

  {$ENDREGION}



      {if (TSession.oneGaragem = 'S') then
      begin
        TabContVeiculo.Visible  := True;
        TabFiscal.Visible       := True;
        TabFinanceiro.Visible   := True;
      end;



      if (TSession.oneLocacao = 'S') then
      begin
        TabFiscal.Visible   := true;
        TabFinanceiro.Visible := true;
      end;

      if (TSession.oneEstoque = 'S') then
      begin
        TabVenda.Visible            := True;
        if (TSession.oneAssociacao = 'S') then
        TabAssociacao.Visible       := True;
        if (TSession.onePedido = 'S') then
        TabFiscal.Visible           := True;
        if (TSession.onePedido = 'S') then
        TabFinanceiro.Visible       := True;
        if (TSession.onePedido = 'S') then
        btnacesso.Visible           := ivNever;
        if (TSession.onePedido = 'S') then
        BarCadestoque.Visible    := true;
        if (TSession.onePedido = 'S') then
        dxBarManagerBar3.Visible    := true;

      end;

      if (TSession.oneOrdemServico = 'S') then
      begin
        Rb_ordemServico.Visible := True;
        TabFinanceiro.Visible   := True;
        TabFiscal.Visible       := True;
        TabVenda.Visible        := True;
      end;

      }


 except on E: Exception do
  begin
    JKDialog('Erro','Ocorreu um erro ao carregar dados:'+#13+e.Message, tderro);
  end;
 End;
end;


procedure TFrmPrincipalNew.LogofundoDblClick(Sender: TObject);
begin
  //Carregar logo fundo
  OpenPicture.Execute;
  if Trim(OpenPicture.FileName) <> '' then
  begin
    TConeSul.GravarValorIni(dm.nDir,'PEDIDO','ImgFundo',OpenPicture.FileName);

    CarregaImagemFundo;

  end;

end;



procedure TFrmPrincipalNew.TimerHoraTimer(Sender: TObject);
begin
  dxRibbonStatusBar.Panels[6].Text  := FormatDateTime('dddd, dd/mm/yyyy', Now) + ' - ' +FormatDateTime('hh:nn:ss', Now);
end;

{
Procedure TFrmPrincipalNew.AvisoSistema;
var
  Config: TIniFile;
  avisodependente:string;
  Model:TModelAvisos;
begin
  Config := TIniFile.Create(dm.nDirArquivo + '\Config.ini');

  Try
    avisodependente   := Config.ReadString('PEDIDO', 'Avisodependente', 'N');

    if avisodependente='S' then
    begin
      Model     := TModelAvisos.Create;

      Try
        if Model.AvisoDependente18Anos then
        begin
          FrmAvisoDependente    := TFrmAvisoDependente.Create(Application);
          FrmAvisoDependente.ShowModal;
        end;
      Finally
        FreeAndNil(Model);
      End;

    end;

  finally
    Config.Free;
  end;

end; }

{$ENDREGION}

end.
