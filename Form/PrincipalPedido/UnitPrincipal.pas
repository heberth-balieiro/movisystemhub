unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.WinXCtrls, System.ImageList, Vcl.ImgList, Vcl.CategoryButtons,
  Vcl.StdCtrls, Vcl.Session, Vcl.Navigation, dxGDIPlusClasses, System.Actions,
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, cxStyles,
  cxGridTableView, cxClasses, Vcl.ExtDlgs, Model.GrupoPlano, UnitGrupoPlanoCad,
  UnitPlanoContaCad, Vcl.Menus, dxSkinsCore, dxSkinBasic, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxCore, dxRibbonSkins, dxRibbonCustomizationForm,
  dxRibbon, dxBar, dxStatusBar, dxRibbonStatusBar,EnvioZap, UnitSede,
  Model.ConfNF, APP.Asmuv, UGerador, uJKDialog,
  Winapi.ShellAPI, Vcl.Validacoes, Vcl.Loading, uSincronizacaoZap,WinSvc,System.IniFiles,
  DataSet.Serialize,
  RESTRequest4D,
  DataSet.Serialize.Adapter.RESTRequest4D,
  System.JSON, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData,
  cxGridCustomTableView, cxGridDBTableView, dxmdaset, cxGridLevel,
  cxGridCustomView, cxGrid, dxSkinsForm, dxRibbonForm,
  Controller_Perfil, Model.Perfil;



type
  TFrmPrincipal = class(TdxRibbonForm) //class(TForm)
    sMenu: TSplitView;
    pLogo: TPanel;
    btnMenu: TSpeedButton;
    Image1: TImage;
    ImageList: TImageList;
    MenuPrincipal: TCategoryButtons;
    sSubMenu: TSplitView;
    Panel1: TPanel;
    CadastroSubMenu: TCategoryButtons;
    Label1: TLabel;
    btnCloseSub: TSpeedButton;
    pTela: TPanel;
    pContainer: TPanel;
    sMenuAcesso: TSplitView;
    Panel2: TPanel;
    Label2: TLabel;
    BtnCloseAcesso: TSpeedButton;
    AcessoSubMenu: TCategoryButtons;
    sMenuSubProduto: TSplitView;
    Panel3: TPanel;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    CategoriaSubProduto: TCategoryButtons;
    cxStyleGridPedido: TcxStyleRepository;
    CxGridPedido: TcxGridTableViewStyleSheet;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxColunaPedido: TcxStyle;
    _PanelBotton: TPanel;
    Label4: TLabel;
    Logofundo: TImage;
    OpenPicture: TOpenPictureDialog;
    Menu: TActionManager;
    ac_Empresa: TAction;
    Ac_Pessoa: TAction;
    Ac_funcionario: TAction;
    Ac_FormaPagamento: TAction;
    Ac_PlanoContas: TAction;
    Ac_Contas: TAction;
    Ac_Transportadora: TAction;
    Ac_Produto: TAction;
    Ac_marca: TAction;
    Ac_Grupo: TAction;
    Ac_Unidade: TAction;
    Ac_Localizacao: TAction;
    dxBarManager: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarManagerBar1: TdxBar;
    BarCadFinanceiro: TdxBar;
    BarCadestoque: TdxBar;
    dxBarManagerBar5: TdxBar;
    dxBarManagerBar6: TdxBar;
    dxBarManagerBar7: TdxBar;
    dxBarManagerBar8: TdxBar;
    dxBarManagerBar9: TdxBar;
    dxBarManagerBar10: TdxBar;
    dxBarManagerBar11: TdxBar;
    dxBarManagerBar12: TdxBar;
    dxBarManagerBar13: TdxBar;
    dxBarManagerBar14: TdxBar;
    dxBarManagerBar15: TdxBar;
    dxBarManagerBar16: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    btnPessoa: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    dxBarLargeButton11: TdxBarLargeButton;
    dxBarLargeButton12: TdxBarLargeButton;
    dxBarLargeButton13: TdxBarLargeButton;
    dxBarLargeButton14: TdxBarLargeButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarLargeButton15: TdxBarLargeButton;
    dxBarLargeButton16: TdxBarLargeButton;
    dxBarLargeButton17: TdxBarLargeButton;
    dxBarLargeButton18: TdxBarLargeButton;
    dxBarLargeButton19: TdxBarLargeButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarLargeButton20: TdxBarLargeButton;
    dxBarLargeButton21: TdxBarLargeButton;
    dxBarLargeButton22: TdxBarLargeButton;
    dxBarLargeButton23: TdxBarLargeButton;
    dxBarLargeButton24: TdxBarLargeButton;
    dxBarLargeButton25: TdxBarLargeButton;
    dxBarLargeButton26: TdxBarLargeButton;
    btnacesso: TdxBarLargeButton;
    dxBarLargeButton28: TdxBarLargeButton;
    dxBarLargeButton29: TdxBarLargeButton;
    dxBarLargeButton30: TdxBarLargeButton;
    dxBarLargeButton31: TdxBarLargeButton;
    dxBarLargeButton32: TdxBarLargeButton;
    dxBarLargeButton33: TdxBarLargeButton;
    dxBarLargeButton34: TdxBarLargeButton;
    dxBarLargeButton35: TdxBarLargeButton;
    dxBarLargeButton36: TdxBarLargeButton;
    dxBarLargeButton37: TdxBarLargeButton;
    dxBarLargeButton38: TdxBarLargeButton;
    dxBarLargeButton39: TdxBarLargeButton;
    dxBarLargeButton40: TdxBarLargeButton;
    dxBarLargeButton41: TdxBarLargeButton;
    dxBarLargeButton42: TdxBarLargeButton;
    dxBarLargeButton43: TdxBarLargeButton;
    dxBarLargeButton44: TdxBarLargeButton;
    dxRibbon: TdxRibbon;
    TabCadastro: TdxRibbonTab;
    TabContVeiculo: TdxRibbonTab;
    TabAssociacao: TdxRibbonTab;
    tabContmarmoraria: TdxRibbonTab;
    TabVenda: TdxRibbonTab;
    TabCompra: TdxRibbonTab;
    TabFiscal: TdxRibbonTab;
    TabFinanceiro: TdxRibbonTab;
    TabRelatorio: TdxRibbonTab;
    tabacesso: TdxRibbonTab;
    tabConfiguracao: TdxRibbonTab;
    dxRibbonBar: TdxRibbonStatusBar;
    Ac_Pedido: TAction;
    dxBarManagerBar3: TdxBar;
    dxBarLargeButton45: TdxBarLargeButton;
    dxBarManagerBar17: TdxBar;
    dxBarLargeButton46: TdxBarLargeButton;
    Ac_ConsulNF: TAction;
    Ac_Cidade: TAction;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Aclivrocaixa: TAction;
    TDataHora: TTimer;
    dxBarManagerBar18: TdxBar;
    dxBarLargeButton47: TdxBarLargeButton;
    ActTerminal: TAction;
    ActUsuario: TAction;
    ActAcesso: TAction;
    ActAltsenha: TAction;
    dxBarManagerBar19: TdxBar;
    dxBarLargeButton48: TdxBarLargeButton;
    ActWhatsApp: TAction;
    ActLogof: TAction;
    dxBarManagerBar20: TdxBar;
    dxBarLargeButton49: TdxBarLargeButton;
    TEnviar: TTimer;
    Button1: TButton;
    dxBarManagerBar21: TdxBar;
    dxBarManagerBar22: TdxBar;
    dxBarLargeButton50: TdxBarLargeButton;
    dxBarLargeButton51: TdxBarLargeButton;
    dxBarLargeButton52: TdxBarLargeButton;
    ActSocioDep: TAction;
    ActHistorico: TAction;
    dxBarManagerBar23: TdxBar;
    dxBarLargeButton53: TdxBarLargeButton;
    dxBarManagerBar24: TdxBar;
    dxBarLargeButton54: TdxBarLargeButton;
    dxBarLargeButton55: TdxBarLargeButton;
    dxBarLargeButton56: TdxBarLargeButton;
    dxBarLargeButton57: TdxBarLargeButton;
    dxBarManagerBar25: TdxBar;
    dxBarLargeButton58: TdxBarLargeButton;
    ActSecretaria: TAction;
    ActCandidato: TAction;
    Actcampanha: TAction;
    ActEleicao: TAction;
    ActCarteirinha: TAction;
    ActSede: TAction;
    Button2: TButton;
    dxBarLargeButton59: TdxBarLargeButton;
    ActOutros: TAction;
    ActEmpCad: TAction;
    dxBarSubItem3: TdxBarSubItem;
    dxBarLargeButton60: TdxBarLargeButton;
    dxBarLargeButton61: TdxBarLargeButton;
    ActProfissao: TAction;
    dxBarLargeButton62: TdxBarLargeButton;
    ActLotacao: TAction;
    dxBarLargeButton63: TdxBarLargeButton;
    dxBarLargeButton64: TdxBarLargeButton;
    dxBarManagerBar26: TdxBar;
    dxBarLargeButton65: TdxBarLargeButton;
    ActEstoque: TAction;
    dxBarLargeButton27: TdxBarLargeButton;
    ActHistoricoProduto: TAction;
    TSincronizarApp: TTimer;
    ActEstatistica: TAction;
    dxBarManagerBar27: TdxBar;
    dxBarLargeButton66: TdxBarLargeButton;
    ActTickets: TAction;
    dxBarLargeButton67: TdxBarLargeButton;
    dxBarLargeButton68: TdxBarLargeButton;
    ActConvenio: TAction;
    dxBarLargeButton2: TdxBarLargeButton;
    ActWeb: TAction;
    dxBarManagerBar2: TdxBar;
    dxBarLargeButton69: TdxBarLargeButton;
    actSincronizar: TAction;
    dxBarLargeButton70: TdxBarLargeButton;
    ActStatus: TAction;
    dxBarLargeButton71: TdxBarLargeButton;
    Actregistro: TAction;
    dxBarLargeButton72: TdxBarLargeButton;
    ActNotificacao: TAction;
    Button3: TButton;
    Memo1: TMemo;
    dxBarManagerBar4: TdxBar;
    dxBarLargeButton73: TdxBarLargeButton;
    dxBarLargeButton74: TdxBarLargeButton;
    ActBotInstalar: TAction;
    ActStop: TAction;
    dxBarLargeButton75: TdxBarLargeButton;
    ActAutorizacao: TAction;
    GridCancelado: TcxStyle;
    GridSolicitacao: TcxStyle;
    GridPago: TcxStyle;
    actTipo: TAction;
    ActEspecie: TAction;
    ActMarca: TAction;
    ActModelo: TAction;
    dxBarSubItem4: TdxBarSubItem;
    dxBarLargeButton76: TdxBarLargeButton;
    dxBarLargeButton77: TdxBarLargeButton;
    dxBarLargeButton78: TdxBarLargeButton;
    dxBarLargeButton79: TdxBarLargeButton;
    ActGaragem: TAction;
    ActEntradaVeiculo: TAction;
    ActSaidaVeiculo: TAction;
    dxBarLargeButton80: TdxBarLargeButton;
    AcTipoDocumento: TAction;
    Rb_ordemServico: TdxRibbonTab;
    dxBarManagerBar28: TdxBar;
    dxBarManagerBar29: TdxBar;
    dxBarManagerBar30: TdxBar;
    dxBarLargeButton81: TdxBarLargeButton;
    dxBarLargeButton82: TdxBarLargeButton;
    dxBarLargeButton83: TdxBarLargeButton;
    Act_ordemServico: TAction;
    Act_equipamento: TAction;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxMemData1: TdxMemData;
    dxMemData1id: TIntegerField;
    dxMemData1nome: TStringField;
    dxMemData1id_socio: TStringField;
    dxMemData1codigo: TIntegerField;
    dxMemData2: TdxMemData;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField2: TIntegerField;
    dxMemData2id_dep: TIntegerField;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView2Column1: TcxGridDBColumn;
    cxGrid1DBTableView2Column2: TcxGridDBColumn;
    cxGrid1DBTableView2Column3: TcxGridDBColumn;
    GridInativo: TcxStyle;
    GridTableDependente: TcxGridTableViewStyleSheet;
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
    ActReceber: TAction;
    GridVencido: TcxStyle;
    GridVencDia: TcxStyle;
    dxSkinSistema: TdxSkinController;
    procedure btnMenuClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CategoryButtons1Categories0Items1Click(Sender: TObject);
    procedure ActSedeExecute(Sender: TObject);
    procedure LogofundoDblClick(Sender: TObject);
    procedure ac_EmpresaExecute(Sender: TObject);
    procedure Ac_PessoaExecute(Sender: TObject);
    procedure Ac_funcionarioExecute(Sender: TObject);
    procedure Ac_FormaPagamentoExecute(Sender: TObject);
    procedure Ac_PlanoContasExecute(Sender: TObject);
    procedure Ac_TransportadoraExecute(Sender: TObject);
    procedure Ac_ProdutoExecute(Sender: TObject);
    procedure Ac_marcaExecute(Sender: TObject);
    procedure Ac_GrupoExecute(Sender: TObject);
    procedure Ac_UnidadeExecute(Sender: TObject);
    procedure Ac_LocalizacaoExecute(Sender: TObject);
    procedure Ac_ContasExecute(Sender: TObject);
    procedure Ac_PedidoExecute(Sender: TObject);
    procedure Ac_ConsulNFExecute(Sender: TObject);
    procedure AclivrocaixaExecute(Sender: TObject);
    procedure TDataHoraTimer(Sender: TObject);
    procedure ActTerminalExecute(Sender: TObject);
    procedure ActUsuarioExecute(Sender: TObject);
    procedure ActAcessoExecute(Sender: TObject);
    procedure ActAltsenhaExecute(Sender: TObject);
    procedure ActLogofExecute(Sender: TObject);
    procedure ActWhatsAppExecute(Sender: TObject);
    //procedure TimeSincronizarZap(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure ActSocioDepExecute(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ActEmpCadExecute(Sender: TObject);
    procedure ActOutrosExecute(Sender: TObject);
    procedure ActProfissaoExecute(Sender: TObject);
    procedure ActLotacaoExecute(Sender: TObject);
    procedure ActSecretariaExecute(Sender: TObject);
    procedure ActCandidatoExecute(Sender: TObject);
    procedure ActEleicaoExecute(Sender: TObject);
    procedure ActcampanhaExecute(Sender: TObject);
    procedure ActEstoqueExecute(Sender: TObject);
    procedure ActCarteirinhaExecute(Sender: TObject);
    procedure TSincronizarAppTimer(Sender: TObject);
    procedure ActEstatisticaExecute(Sender: TObject);
    procedure ActTicketsExecute(Sender: TObject);
    procedure ActConvenioExecute(Sender: TObject);
    procedure ActWebExecute(Sender: TObject);
    procedure actSincronizarExecute(Sender: TObject);
    procedure ActNotificacaoExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TEnviarTimer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    //procedure ActBotInstalarExecute(Sender: TObject);
    //procedure ActStopExecute(Sender: TObject);
    procedure ActregistroExecute(Sender: TObject);
    procedure ActAutorizacaoExecute(Sender: TObject);
    //procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ActMarcaExecute(Sender: TObject);
    procedure actTipoExecute(Sender: TObject);
    procedure ActEspecieExecute(Sender: TObject);
    procedure ActModeloExecute(Sender: TObject);
    procedure ActGaragemExecute(Sender: TObject);
    procedure ActEntradaVeiculoExecute(Sender: TObject);
    procedure AcTipoDocumentoExecute(Sender: TObject);
    procedure Act_ordemServicoExecute(Sender: TObject);
    procedure ActReceberExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private

    function CriarEmpresa: Boolean;
    procedure CarregarSistema;
    function ChamaLogin: Boolean;
    function LiberarModulo(tipo: string): boolean;
    procedure DisableCategoryButtonItem(CategoryIndex, ItemIndex: Integer);
    procedure HideCategoryButtonItem(CategoryIndex, ItemIndex: Integer);

    procedure CarregaImagemFundo;
    function ValidarConexao: Boolean;
    procedure AbrirURL(const URL: string);
    
    procedure TimeSincronizarZap;

//    Function Instalarbootwhatsapp(const service:string):Boolean;
//    Function Iniciarbootwhatsapp(const service:string):boolean;

    Procedure AvisoSistema;
    function RegistroTerminal(out msg: String;out reternoapi:string): boolean;
    { Private declarations }
  public
    //Timeenvio:integer;
    APIIDPessoa:Integer;
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

  //MessageSender: TMessageSender;
  Modelzap : TSincronizadorZap;
  //$00553A35
implementation


{$R *.dfm}

uses Model.Empresa, UnitEmpresaRegistro, UnitUsuario,
  UnitLogin, unitPerfil, UnitEmpresa, unitPessoas, unitProduto, Unitmarca, unitGrupo,
  unitlocalizacao, unitunidade, UnitPedido, UnitFuncionario, UnitPrazo,
  UnitFrmWhatsApp, UConeSul, UDM, UnitManifesto, Model.Tipoplano, UnitTipoPlano,
  UnitPlanoConta, UnitTransportadora, UnitContas, UnitGlobal, ULivroCaixa,
  UnitConfiguracaoTerminal, UnitAlterarSenha, UnitFrmMensagem,
  UnitConfiguracaoBancoDados, Uni, UnitAssociado,UnitEmpCad,
  UniprofissaoCad, unitlotacaocad,UnitSecretariaCadn, UnitCandidato,
  UnitEleicao, UnitGerEleicao,UnitAjusteestoqueLista,UnitHistoricoProduto,UnitCarteirinha,
  UnitEstatistica, UnitConsTickets, UnitConsConvenio, UnitFrmNotificacaoAPP,
  UnitConsRegistroEntrada, UnitAvisoDependente, Model.Avisos, UnitAutorizacao,
  Vcl.PermissaoUsuario,UnitCadMarcaVeiculo, UnitCadTipoVeiculo,
  UnitCadEspecieVeiculo, UnitCadModeloVeiculo, UnitGerenciarVeiculo,
  UnitConsultaTipoDocumento, UnitGerenciarCompraVeiculo, uConfiguracaoService,
  UGerOrdemServico, UnitBasePesquisa, UFrmPesquisaCliente, UConsultaReceber,
  UFormNovoBaseGerenciamento, UnitStyles;

//procedure TFrmPrincipal.ActCandidatoExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Candidato');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//    //Autorizacao
//    TNavigation.Open(TFrmCandidato, FrmCandidato, pContainer)
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//end;

//procedure TFrmPrincipal.ActCarteirinhaExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Carteira');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//    TNavigation.Open(TFrmCarteira, FrmCarteira, FrmPrincipal.pContainer)
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//end;

//procedure TFrmPrincipal.ActConvenioExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Convênio');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//    TNavigation.Open(TFrmConConveio, FrmConConveio, pContainer)
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//end;

//procedure TFrmPrincipal.ActEleicaoExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Eleição');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//    //Autorizacao
//    TNavigation.Open(TFrmEleicao, FrmEleicao, pContainer)
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//end;

//procedure TFrmPrincipal.ActEmpCadExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Empresa');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//  begin
//    //sindicato empresa (prefeitura)
//    TNavigation.ParamInt          := 0;
//    TNavigation.ParamsStr         := 'N';
//    TNavigation.OpenModal(TFrmEmpCad, FrmEmpCad);
//  end
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//end;

//procedure TFrmPrincipal.ActEntradaVeiculoExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  //Saida Veiculo
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Entrada Veículo');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//    //Autorizacao
//    TNavigation.Open(TFrmGerenciarCompraVeiculo, FrmGerenciarCompraVeiculo, pContainer)
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//end;

//procedure TFrmPrincipal.ActEspecieExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  // Marca veiculo
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Espécie Veículo');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//  begin
//    TNavigation.ParamInt          := 0;
//    TNavigation.ParamsStr         := 'N';
//    TNavigation.OpenModal(TFrmCadEspecieVeiculo, FrmCadEspecieVeiculo);
//  end
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//end;

//procedure TFrmPrincipal.ActEstatisticaExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Estatísticas');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//    //Autorizacao
//    TNavigation.Open(TFrmEstatisticas, FrmEstatisticas, pContainer)
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//end;

//procedure TFrmPrincipal.ActEstoqueExecute(Sender: TObject);
//begin
//  //estoque
//  TNavigation.Open(TFrmAjusteEstoqueLista, FrmAjusteEstoqueLista, pContainer);
//end;

//procedure TFrmPrincipal.ActGaragemExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  //Controle veiculo     FrmGerenciarVeiculo
//
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Controle Veículo');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//    //Autorizacao
//    TNavigation.Open(TFrmGerenciarVeiculo, FrmGerenciarVeiculo, pContainer)
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//end;

//procedure TFrmPrincipal.AcTipoDocumentoExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Documento');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//  begin
//    TNavigation.Open(TFrmConsultaTipoDocumento, FrmConsultaTipoDocumento, pContainer);
//  end
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//end;

//procedure TFrmPrincipal.ActLogofExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Logof');
//
//  if Permissao.TemPermissao('Permitir Fazer Logof') then
//  begin
//    if ChamaLogin then
//    exit;
//  end
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//end;

//procedure TFrmPrincipal.ActLotacaoExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Lotação');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//  begin
//    TNavigation.ParamInt          := 0;
//    TNavigation.ParamsStr         := 'N';
//    TNavigation.OpenModal(TFrmLotacaoCad, FrmLotacaoCad);
//  end
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//end;

//procedure TFrmPrincipal.ActMarcaExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  // Marca veiculo
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Marca Veículo');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//  begin
//    TNavigation.ParamInt          := 0;
//    TNavigation.ParamsStr         := 'N';
//    TNavigation.OpenModal(TFrmCadMarcaVeiculo, FrmCadMarcaVeiculo);
//  end
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//
//end;

//procedure TFrmPrincipal.ActModeloExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  // Modelo veiculo
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Modelo Veículo');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//  begin
//    TNavigation.ParamInt          := 0;
//    TNavigation.ParamsStr         := 'N';
//    TNavigation.OpenModal(TFrmCadModeloVeiculo, FrmCadModeloVeiculo);
//  end
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//end;

//procedure TFrmPrincipal.ActNotificacaoExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Notificação Web');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//  begin
//    //notificacao
//    FrmEnviarNotificacao                         := TFrmEnviarNotificacao.Create(Application);
//    FrmEnviarNotificacao.ShowModal;
//  end
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//end;

procedure TFrmPrincipal.ActOutrosExecute(Sender: TObject);
begin
  //
end;

//procedure TFrmPrincipal.ActProfissaoExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Profissão');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//  begin
//    TNavigation.ParamInt          := 0;
//    TNavigation.ParamsStr         := 'N';
//    TNavigation.OpenModal(TFrmProfissaoCad, FrmProfissaoCad);
//  end
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//end;

//procedure TFrmPrincipal.ActReceberExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  //Contas a receber
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Contas a Receber');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//    TNavigation.Open(TFrmConsReceber, FrmConsReceber, pContainer)
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//end;

//procedure TFrmPrincipal.ActregistroExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Registro de Entrada');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//    //Autorizacao
//    TNavigation.Open(TFrmRegistroEntrada, FrmRegistroEntrada, pContainer)
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//
//end;

//procedure TFrmPrincipal.ActAcessoExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Perfil');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//    TNavigation.Open(TFrmPerfil, FrmPerfil, pContainer)
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//end;

//procedure TFrmPrincipal.ActAltsenhaExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Alterar Senha');
//
//  if Permissao.TemPermissao('Permitir Alterar Senha') then
//    TNavigation.OpenModal(TFrmAlterarSenha, FrmAlterarSenha)
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//end;

//procedure TFrmPrincipal.ActAutorizacaoExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Autorização');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//    //Autorizacao
//  TNavigation.Open(TFrmAutorizacao, FrmAutorizacao, pContainer)
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//end;

//procedure TFrmPrincipal.ActcampanhaExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Campanha');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//    //Autorizacao
//    TNavigation.Open(TFrmGerEleicao, FrmGerEleicao, pContainer)
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//end;

//procedure TFrmPrincipal.AclivrocaixaExecute(Sender: TObject);
//begin
//  //Livro caixa
//  TNavigation.Open(TFrmLivroCaixa, FrmLivroCaixa, pContainer);
//end;

//procedure TFrmPrincipal.ActSecretariaExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Secretaria');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//  begin
//    TNavigation.ParamInt          := 0;
//    TNavigation.ParamsStr         := 'N';
//    TNavigation.OpenModal(TFrmSecretariaCadN, FrmSecretariaCadN);
//  end
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//
//end;

//procedure TFrmPrincipal.ActSedeExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Sede');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//    TNavigation.Open(TFrmSede, FrmSede, pContainer)
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//end;

//procedure TFrmPrincipal.actSincronizarExecute(Sender: TObject);
//var
//
//Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Sincronizar');
//
//  if Permissao.TemPermissao('Permitir Sincronizar API') then
//  begin
//
//        if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
//        begin
//          try
////            if DM.SincronizarGravar(1, 0) then
////            if DM.SincronizarGravar(2, 0) then
////            if DM.SincronizarGravar(3, 0) then
////            if DM.SincronizarGravar(4, 0) then
////            if DM.SincronizarGravar(5, 0) then
////            if DM.SincronizarGravar(6, 0) then
////            if DM.SincronizarGravar(7, 0) then
////            if DM.SincronizarGravar(8, 0) then
////            if DM.SincronizarGravar(9, 0) then
////            if DM.SincronizarGravar(10, 0) then
////            if DM.SincronizarGravar(11, 0) then
////            if DM.SincronizarGravar(12, 0) then
////            if DM.SincronizarGravar(14, 0) then
////            if DM.SincronizarGravar(15, 0) then
////            if DM.SincronizarGravar(16, 0) then
////            if DM.SincronizarGravar(17, 0) then
//            JKDialog('Aviso','Sincronização rodando em segundo plano aguarde...', tdAlerta);
//          except on e:exception do
//            begin
//              raise;
//            end;
//          end;
//        end;
//
//  end
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//
//end;

//procedure TFrmPrincipal.ActSocioDepExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Associados/Dependentes');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//    TNavigation.Open(TFrmAssociado, FrmAssociado, pContainer)
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//end;



//procedure TFrmPrincipal.ActTerminalExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Terminal');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//  begin
//    TNavigation.ParamInt          := 0;
//    TNavigation.ParamsStr         := 'N';
//    TNavigation.OpenModal(TFrmConfiguracaoTerminal, FrmConfiguracaoTerminal);
//  end
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//  //
//
//
//end;

//procedure TFrmPrincipal.ActTicketsExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Ticket');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//    TNavigation.Open(TFrmConsTickets, FrmConsTickets, pContainer)
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//end;

//procedure TFrmPrincipal.actTipoExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  // Marca veiculo
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Tipo Veículo');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//  begin
//    TNavigation.ParamInt          := 0;
//    TNavigation.ParamsStr         := 'N';
//    TNavigation.OpenModal(TFrmCadTipoVeiculo, FrmCadTipoVeiculo);
//  end
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//end;

//procedure TFrmPrincipal.ActUsuarioExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Usuário');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//    TNavigation.Open(TFrmUsuario, FrmUsuario, pContainer)
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//end;

//procedure TFrmPrincipal.ActWebExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'APP Web');
//
//  if Permissao.TemPermissao('Permitir Abrir APP Web') then
//    AbrirURL('https://asmuv.conesulsistemas.com.br')
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//end;

//procedure TFrmPrincipal.AbrirURL(const URL: string);
//begin
//  ShellExecute(0, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
//end;

//procedure TFrmPrincipal.ActWhatsAppExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  // Libera a instância anterior para garantir uma nova
//  FreeAndNil(TPermissaoUsuario.FInstance);
//
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Cadastro Mensagem');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//  begin
//    TNavigation.Open(TFrmMensagem, FrmMensagem, pContainer);
//  end
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//
//end;

//procedure TFrmPrincipal.Act_ordemServicoExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  //Ordem de Servico
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Ordem Serviço');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//    TNavigation.Open(TFrmGerOrdemServico, FrmGerOrdemServico, pContainer)
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//end;

procedure TFrmPrincipal.Ac_ConsulNFExecute(Sender: TObject);
begin
  //FrmManifesto
  //TNavigation.Open(TFrmManifesto, FrmManifesto, pContainer);
end;

procedure TFrmPrincipal.Ac_ContasExecute(Sender: TObject);
begin
  //Contas
 // TNavigation.Open(TFrmContas, FrmContas, pContainer);
end;

//procedure TFrmPrincipal.ac_EmpresaExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Empresa');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//    //CloseSubMenu;
//    TNavigation.Open(TFrmEmpresa, FrmEmpresa, pContainer)
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//end;

procedure TFrmPrincipal.Ac_FormaPagamentoExecute(Sender: TObject);
begin
  //Prazo de Pagamento
  //CloseSubMenu;
  //TNavigation.Open(TFrmPrazo, FrmPrazo, pContainer);
end;

//procedure TFrmPrincipal.Ac_funcionarioExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Funcionário');
//
//  if Permissao.TemPermissao('Permitir Utilizar') then
//    TNavigation.Open(TFrmFuncionario, FrmFuncionario, pContainer)
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//end;

procedure TFrmPrincipal.Ac_GrupoExecute(Sender: TObject);
begin
  //grupo
  //TNavigation.Open(TFrmGrupo, FrmGrupo, pContainer);
end;

procedure TFrmPrincipal.Ac_LocalizacaoExecute(Sender: TObject);
begin
  //localizacao
  //TNavigation.Open(TFrmLocalizacao, Frmlocalizacao, pContainer);
end;

procedure TFrmPrincipal.Ac_marcaExecute(Sender: TObject);
begin
  //marca
 // TNavigation.Open(TFrmMarca, FrmMarca, pContainer);
end;

procedure TFrmPrincipal.Ac_PedidoExecute(Sender: TObject);
begin
  //Pedido
  //TNavigation.Open(TFrmPedido, FrmPedido, pContainer);
end;

procedure TFrmPrincipal.Ac_PessoaExecute(Sender: TObject);
begin
  //Pessoa
  //CloseSubMenu;
  //TNavigation.Open(TFrmPessoa, FrmPessoa, pContainer);
end;

procedure TFrmPrincipal.Ac_PlanoContasExecute(Sender: TObject);
begin
  //Plano de contas
  //TNavigation.Open(TFrmPlanoContaCons, FrmPlanoContaCons, pContainer);
end;

procedure TFrmPrincipal.Ac_ProdutoExecute(Sender: TObject);
begin
  //Consulta Produto
  //CloseMenuProduto;
  //CloseSubMenu;
 // TNavigation.Open(TFrmProdutos, FrmProdutos, pContainer);
end;

procedure TFrmPrincipal.Ac_TransportadoraExecute(Sender: TObject);
begin
  TNavigation.Open(TFrmTransportadoraConsulta, FrmTransportadoraConsulta, pContainer);
end;

procedure TFrmPrincipal.Ac_UnidadeExecute(Sender: TObject);
begin
  //unidade
  //TNavigation.Open(TFrmUnidade, Frmunidade, pContainer);
end;

procedure TFrmPrincipal.btnMenuClick(Sender: TObject);
begin
   // sMenu.Opened := NOT sMenu.Opened;
end;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
begin
  //TEnviar.Enabled := True;
end;

procedure TFrmPrincipal.Button2Click(Sender: TObject);
begin
  //TNavigation.ParamInt          := 0;
  //TNavigation.ParamsStr         := 'N';
  //TNavigation.OpenModal(TFrmEmpCad, FrmEmpCad);
  //FrmPesquisaCliente  := TFrmPesquisaCliente.Create(Application);
  //FrmPesquisaCliente.show;

   //FormNovoBaseGerenciamento.show;
  //TNavigation.Open(TFormNovoBaseGerenciamento, FormNovoBaseGerenciamento, pContainer);

end;


//procedure TFrmPrincipal.Button3Click(Sender: TObject);
//begin
//  TEnviar.Enabled := true
//end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {if Assigned(MessageSender) then
  begin
    MessageSender.Stop;
    MessageSender.Free;
  end; }

  
end;

//procedure TFrmPrincipal.FormCreate(Sender: TObject);
//begin
//  DisableAero := True;
//end;

procedure TFrmPrincipal.FormDestroy(Sender: TObject);
begin
   // Finaliza a thread do sincronizador e libera o timer
  {if Assigned(Modelzap) then
  begin
    modelzap.Terminate;
    modelzap.WaitFor;
    //FreeAndNil(modelzap);
  end;
  }

  //FreeAndNil(TimerSincronizacao);
  {if Assigned(Modelzap) then
  begin
    modelzap.Terminate;
    modelzap.WaitFor;
    //FreeAndNil(modelzap);
  end;}
end;

//procedure TFrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
//  Shift: TShiftState);
//var
//msg:string;
//Qry   :Tuniquery;
//I:integer;
//begin
//
//  if key = vk_F12 then
//  begin
//    //Criar nivel dos usuarios
//    Perfil        := TModelPerfil.Create;
//    qry           := Tuniquery.Create(self);
//    Try
//      try
//        Qry.Connection    := dm.Conn;
//        Qry.SQL.Text      := 'Select id_perfil from perfil where id_perfil >0';
//        Qry.Open;
//        Qry.First;
//        Perfil.idempresa  := Tsession.IDEMPRESA;
//        if not Qry.Eof then
//        begin
//          for I := 0 to Qry.RecordCount -1 do
//          begin
//            Perfil.InserirNivel(msg,Qry.FieldByName('id_perfil').AsInteger);
//            qry.Next;
//          end;
//          JKDialog('Sucesso','Nível atualizado com sucesso.', tdAlerta);
//        end;
//        Qry.Close;
//
//      Except on e:exception do
//        begin
//          JKDialog('Aviso','Erro: '+msg+' - '+e.Message, tdAlerta);
//          raise;
//        end;
//      end;
//    Finally
//      FreeAndNIl(Perfil);
//    End;
//  end;
//end;

//procedure TFrmPrincipal.FormShow(Sender: TObject);
//begin
//  //Carregar dados do Sistema
//  CarregaImagemFundo;
//  CarregarSistema;
//
//  dxRibbonBar.Panels[1].Text  := TSession.NOME;
//  dxRibbonBar.Panels[5].Text  := TSession.localsys;
//  dxRibbonBar.Panels[7].Text  := TSession.versaosys;
//  dxRibbonBar.Panels[8].Text  := '['+ inttostr(TSession.idempresa)+'] '+TSession.razao;
//
//  FrmPrincipal.Caption  := Application.Title +' - Registrado para: ['+ inttostr(TSession.idempresa)+'] '+TSession.razao;
//
//end;

//procedure TFrmPrincipal.CategoryButtons1Categories0Items1Click(Sender: TObject);
//begin
//  //Usuario consulta
//
//  TNavigation.Open(TFrmUsuario, FrmUsuario, pContainer);
//end;

//Function TFrmPrincipal.CriarEmpresa:Boolean;
//var
//Model : TModelEmpresa;
//msg   :string;
//begin
//  Result  := False;
//  Try
//    try
//      Model             :=  TModelEmpresa.Create;
//
//      if Model.Registrada(msg) then
//      begin
//        if msg='OK' then
//        Result  := True;
//
//      end
//      else
//      begin
//        //Chamar a tela para registro
//        Try
//          FrmRegistroEmpresa  := TFrmRegistroEmpresa.create(Application);
//          FrmRegistroEmpresa.ShowModal;
//
//        Finally
//          FrmRegistroEmpresa.Release;
//        End;
//      end;
//
//    Except on e:exception do
//      begin
//        msg := msg+' :'+e.Message;
//        raise;
//      end;
//    end;
//  Finally
//    Model.Free;
//  End;
//end;

Function TFrmPrincipal.ValidarConexao:Boolean;
begin
  Result := False;

  Try
    dm.Conn.Connected;
    Result := True;
  Except on E: Exception do
    ShowMessage('Erro ao conectar ao banco de dados: ' + E.Message);
  end;

end;

//Procedure TFrmPrincipal.CarregarSistema;
//begin
//  //Testar conexão com o banco de dados
//
//  if ValidarConexao then
//  begin
//    CriarEmpresa;
//
//    if ChamaLogin then
//    exit;
//
//  end
//  else
//  begin
//    try
//      FrmConfiguracaoBancodados  := TFrmConfiguracaoBancodados.Create(Application);
//      FrmConfiguracaoBancodados.ShowModal;
//    finally
//      //FrmConfiguracaoBancodados.Release;
//    end;
//  end;
//
//end;

{function TfrmPrincipal.ChamaLogin: Boolean;
var
msg, ret:string;
begin
    try
      FrmLogin  := TFrmLogin.Create(Application);
      FrmLogin.ShowModal;
    finally
      if RegistroTerminal(msg, ret) then
      begin
        if ret = 'N' then
        begin
          JKDialog('Acesso Negado',
             'O seu terminal não tem permissão para acessar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
          exit;
        end;
      end;
      LiberarModulo('');
      AvisoSistema;
      FrmLogin.Release;
    end;
end;}

//function TfrmPrincipal.ChamaLogin: Boolean;
//var
//  msg, ret: string;
//begin
//  Result := False;
//
//  //FrmLogin := TFrmLogin.Create(Application);
//  //FrmLogin.ShowModal;
//  try
//
//      // Protege a chamada de verificação de terminal
//      {try
//        if RegistroTerminal(msg, ret) then
//        begin
//          if ret = 'N' then
//          begin
//            JKDialog('Acesso Negado',
//              'O seu terminal não tem permissão para acessar.' + sLineBreak +
//              'Por favor, entre em contato com o administrador do sistema.',
//              tdAlerta);
//            Application.Terminate;
//          end;
//        end
//        else
//        begin
//          JKDialog('Erro de Registro',
//            'Falha ao validar o terminal. Verifique a conexão ou permissões.',
//            tdErro);
//          Exit;
//        end;
//      except
//        on E: Exception do
//        begin
//          JKDialog('Erro',
//            'Erro ao validar terminal: ' + E.Message,
//            tdErro);
//          Exit;
//        end;
//      end;   Voltar  }
//
//      LiberarModulo('');
//      AvisoSistema;
//      Result := True;
//
//  finally
//    //FrmLogin.Free;
//  end;
//end;

{$REGION 'Liberação e Registro de terminal'}

Function TFrmPrincipal.RegistroTerminal(out msg:String;out reternoapi:string):boolean;
var
Emp   : TModelEmpresa;
Guid  : String;
Ident : String;
erro  : Boolean;
resp: IResponse;
url, usuario, senha, resposta: string;
jsonResponse,Json: TJSONObject;
JsonArray: TJsonArray;
begin
  Result  := False;
  Emp := TModelEmpresa.Create;
  Try
    Emp.Select(msg);
    Guid  := Emp.guid;
  Finally
    FreeAndNil(Emp);
  End;

  Ident := TConesul.ObterNomeDaMaquina;

  //Preparar para envair para API

  if TConesul.BuscarURLAPI(url, usuario, senha) then
  begin

    json      := TJsonObject.Create;
    JsonArray := TJsonArray.Create;
    Try
      json.AddPair('guid',            Guid);
      json.AddPair('identificador',   Ident);
      
      JsonArray.Add(json);

      resp := TRequest.New.BaseURL(url)
                      .Resource('/v1/equipamento')
                      .BasicAuthentication(usuario, senha)
                      .AddBody(JsonArray.ToJSON)
                      .Accept('application/json')
                      .Timeout(60000)
                      .Post;



      if resp.StatusCode <> 201 then
          raise Exception.Create(resp.Content);

    Finally
      JsonArray.Free;
    End;

    resposta  := resp.Content;

    try

      jsonResponse := TJSONObject.ParseJSONValue(resposta) as TJSONObject;

      if Assigned(jsonResponse) then
      begin
        if jsonResponse.TryGetValue<Boolean>('erro', erro) and erro then
        begin
          msg := jsonResponse.GetValue<string>('mensagem');
          msg := 'Erro retornado pela API: ' +msg;
          exit;
        end;

        if jsonResponse.TryGetValue<string>('autorizado', reternoapi) then
        begin
          Result := True;
        end
        else
        begin
          msg := 'GUID não encontrado na resposta da API.';
        end;

      end
      else
        msg:='Resposta JSON mal formada.';
    except
      on E: Exception do
      begin
        msg:='Erro ao processar Get registro: '+e.Message;
      end;
    end;
  end;




end;

{$ENDREGION}



Procedure TFrmPrincipal.AvisoSistema;
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

Function TFrmPrincipal.LiberarModulo(tipo:String):boolean;
begin
  result  := False;

    Try
      TabAssociacao.Visible   := False;
      TabFinanceiro.Visible   := False;
      TabFiscal.Visible       := False;
      TabVenda.Visible        := False;
      TabContVeiculo.Visible  := False;
      Rb_ordemServico.visible := False;

      if (TSession.oneAssociacao = 'S') then
      begin
        btnPessoa.Visible       := ivNever;
        BarCadestoque.Visible   := False;
        BarCadFinanceiro.Visible:= False;
        TabAssociacao.Visible   := True;
        TabContVeiculo.Visible  := False;
      end;

      if (TSession.oneGaragem = 'S') then
      begin
        TabContVeiculo.Visible  := True;
        TabFiscal.Visible       := True;
        TabFinanceiro.Visible   := True;
      end;

      if (TSession.onePedido = 'S') then
      begin
        TabVenda.Visible    := True;
        TabFiscal.Visible   := True;
        TabFinanceiro.Visible := True;
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


      Result  := True;

    Except on e:exception do

    End;


end;

//procedure TFrmPrincipal.LogofundoDblClick(Sender: TObject);
//begin
//  //Carregar logo fundo
//  OpenPicture.Execute;
//  if Trim(OpenPicture.FileName) <> '' then
//  begin
//    TConeSul.GravarValorIni(dm.nDir,'PEDIDO','ImgFundo',OpenPicture.FileName);
//
//    CarregaImagemFundo;
//
//  end;
//
//end;

//procedure TFrmPrincipal.CarregaImagemFundo;
//begin
//
//  if FileExists(TConeSul.LerValorIni(dm.nDir,'PEDIDO','ImgFundo','')) then
//  begin
//    LogoFundo.Picture.LoadFromFile(TConeSul.LerValorIni(dm.nDir,'PEDIDO','ImgFundo',''));
//  end;
//
//end;

//procedure TFrmPrincipal.TDataHoraTimer(Sender: TObject);
//begin
//  dxRibbonBar.Panels[3].Text  := FormatDateTime('dddd, dd/mm/yyyy', Now) + ' - ' +FormatDateTime('hh:nn:ss', Now);
//end;

procedure TFrmPrincipal.TEnviarTimer(Sender: TObject);
begin
  //TimeSincronizarZap;
end;

Procedure TFrmPrincipal.TimeSincronizarZap;
begin
  if not Assigned(Modelzap) then
  begin
    Modelzap := TSincronizadorZap.Create(
    procedure (msg:string)
    begin

    end);
    modelzap.FreeOnTerminate  := True;
    TEnviar.Enabled := False; // Desativa o Timer após iniciar o sincronizador
  end;
end;


{$REGION 'Sincronizar API'}

procedure TFrmPrincipal.TSincronizarAppTimer(Sender: TObject);
begin
  //Sincronizar para APP ASMUV
  //SincronizarAPIAsmuv(Timeenvio);
end;


{$ENDREGION}

procedure TFrmPrincipal.HideCategoryButtonItem(CategoryIndex, ItemIndex: Integer);
var
  Category: TButtonCategory;
  Item: TButtonItem;
begin
  // Verifica se o índice da categoria é válido
  if (CategoryIndex >= 0) and (CategoryIndex < CadastroSubmenu.Categories.Count) then
  begin
    Category := CadastroSubmenu.Categories[CategoryIndex];
    // Verifica se o índice do item é válido
    if (ItemIndex >= 0) and (ItemIndex < Category.Items.Count) then
    begin
      Item := Category.Items[ItemIndex];
      // Modifica o texto do item para torná-lo vazio
      Item.Caption := '';
    end;
  end;
end;

//function TFrmPrincipal.Iniciarbootwhatsapp(const service: string): boolean;
//var
//  SCMHandle, ServiceHandle: SC_HANDLE;
//  ServiceStatus: TServiceStatus;
//  Args: PWideChar;
//  WaitTime: Integer;
//begin
//  Result := False;
//  Args  := nil;
//  // Abrir o Gerenciador de Controle de Serviços
//  SCMHandle := OpenSCManager(nil, nil, SC_MANAGER_CONNECT);
//  if SCMHandle = 0 then
//  begin
//    Writeln('Erro ao abrir o Gerenciador de Serviços: ', GetLastError);
//    Exit;
//  end;
//
//  try
//    // Abrir o Serviço
//    ServiceHandle := OpenService(SCMHandle, PChar(service), SERVICE_START);
//    if ServiceHandle = 0 then
//    begin
//      Writeln('Erro ao abrir o serviço: ', GetLastError);
//      Exit;
//    end;
//
//    try
//      // Iniciar o Serviço
//      if not StartService(ServiceHandle, 0, Args) then
//      begin
//        Writeln('Erro ao iniciar o serviço: ', GetLastError);
//        Exit;
//      end;
//
//      // Verificar status
//      QueryServiceStatus(ServiceHandle, ServiceStatus);
//      if SERVICE_RUNNING = 4 then
//      Result  := True
//      else
//      Result := ServiceStatus.dwCurrentState = SERVICE_RUNNING;
//    finally
//      CloseServiceHandle(ServiceHandle);
//    end;
//  finally
//    CloseServiceHandle(SCMHandle);
//  end;
//end;

//function TFrmPrincipal.Instalarbootwhatsapp(const service: string): Boolean;
//var
//  SCMHandle, ServiceHandle: SC_HANDLE;
//begin
//  Result := False;
//
//  // Abrir o Gerenciador de Controle de Serviços
//  SCMHandle := OpenSCManager(nil, nil, SC_MANAGER_CREATE_SERVICE);
//  if SCMHandle = 0 then
//  begin
//    Writeln('Erro ao abrir o Gerenciador de Serviços: ', GetLastError);
//    Exit;
//  end;
//
//  try
//    // Criar o serviço
//    ServiceHandle := CreateService(
//      SCMHandle,           // Gerenciador de Serviços
//      PChar(service),  // Nome interno do Serviço
//      PChar(service),  // Nome de exibição
//      SERVICE_ALL_ACCESS,  // Permissões
//      SERVICE_WIN32_OWN_PROCESS, // Tipo de Serviço
//      SERVICE_AUTO_START,  // Tipo de Inicialização
//      SERVICE_ERROR_NORMAL,// Tipo de Erro
//      PChar(dm.nDirArquivo+'\Easybot.exe'),     // Caminho para o executável
//      nil, nil, nil, nil, nil);
//
//    if ServiceHandle = 0 then
//    begin
//      Writeln('Erro ao criar o serviço: ', GetLastError);
//      Exit;
//    end;
//
//    CloseServiceHandle(ServiceHandle);
//    Result := True;
//  finally
//    CloseServiceHandle(SCMHandle);
//  end;
//end;

procedure TFrmPrincipal.DisableCategoryButtonItem(CategoryIndex, ItemIndex: Integer);
var
  Category: TButtonCategory;
  Item: TButtonItem;
begin
  // Verifica se o índice da categoria é válido
  if (CategoryIndex >= 0) and (CategoryIndex < CadastroSubmenu.Categories.Count) then
  begin
    Category := CadastroSubmenu.Categories[CategoryIndex];
    // Verifica se o índice do item é válido
    if (ItemIndex >= 0) and (ItemIndex < Category.Items.Count) then
    begin
      Item := Category.Items[ItemIndex];
      // Desativa o item
      Item.Destroy;
    end;
  end;
end;

//procedure TFrmPrincipal.ActBotInstalarExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Instalar Bot');
//
//  if Permissao.TemPermissao('Permitir Instalar Bot') then
//  begin
//      if Instalarbootwhatsapp('Easybotservice') then
//    begin
//      JKDialog('Sucesso','Serviço instalado com sucesso.', tdsucesso);
//    end
//    else
//      JKDialog('Erro','Erro ao instalar o serviço.', tderro);
//  end
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//end;

//procedure TFrmPrincipal.ActStopExecute(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Iniciar Bot');
//
//  if Permissao.TemPermissao('Permitir Iníciar Bot') then
//  begin
//    if Iniciarbootwhatsapp('Easybotservice') then
//    begin
//      JKDialog('Sucesso','Serviço iniciado com sucesso.', tdsucesso);
//    end
//    else
//      JKDialog('Erro','Erro ao iniciar o serviço.', tderro);
//  end
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//end;

end.
