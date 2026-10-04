unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.WinXCtrls, System.ImageList, Vcl.ImgList, Vcl.CategoryButtons,
  Vcl.StdCtrls, Vcl.Session, Vcl.Navigation, dxGDIPlusClasses, System.Actions,
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, cxStyles,
  cxGridTableView, cxClasses, Vcl.ExtDlgs, Model.GrupoPlano, UnitGrupoPlanoCad,
  UnitPlanoContaCad, Vcl.Menus;

type
  TFrmPrincipal = class(TForm)
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
    pNavbar: TPanel;
    pTela: TPanel;
    pUsuario: TPanel;
    lblNome: TLabel;
    lblEmail: TLabel;
    Image2: TImage;
    Image3: TImage;
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
    Button1: TButton;
    PopupMenu1: TPopupMenu;
    Planoconta1: TMenuItem;
    ransportadora1: TMenuItem;
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
    procedure btnMenuClick(Sender: TObject);
    procedure btnCloseSubClick(Sender: TObject);
    procedure CategoryMenuButtonsCategories0Items2Click(Sender: TObject);
    procedure CategoryMenuButtonsCategories0Items5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CategoryMenuButtonsCategories0Items4Click(Sender: TObject);
    procedure BtnCloseAcessoClick(Sender: TObject);
    procedure CategoryButtons1Categories0Items1Click(Sender: TObject);
    procedure AcessoSubMenuCategories0Items0Click(Sender: TObject);
    procedure ActSedeExecute(Sender: TObject);
    procedure ActChapaExecute(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MenuPrincipalCategories0Items2Click(Sender: TObject);
    procedure LogofundoDblClick(Sender: TObject);
    procedure MenuPrincipalCategories0Items3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
    procedure FormCreate(Sender: TObject);
  private
    procedure CloseSubMenu;
    Procedure CloseMenuAcesso;
    function CriarEmpresa: Boolean;
    procedure CarregarSistema;
    function ChamaLogin: Boolean;
    function LiberarModulo(tipo: integer): boolean;
    procedure DisableCategoryButtonItem(CategoryIndex, ItemIndex: Integer);
    procedure HideCategoryButtonItem(CategoryIndex, ItemIndex: Integer);
    procedure CloseMenuProduto;
    procedure CarregaImagemFundo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;
  //$00553A35
implementation


{$R *.dfm}

uses Model.Empresa, UnitEmpresaRegistro, UnitUsuario,
  UnitLogin, unitPerfil, UnitEmpresa, unitPessoas, unitProduto, Unitmarca, unitGrupo,
  unitlocalizacao, unitunidade, UnitPedido, UnitFuncionario, UnitPrazo,
  UnitFrmWhatsApp, UConeSul, UDM, UnitManifesto, Model.Tipoplano, UnitTipoPlano,
  UnitPlanoConta, UnitTransportadora, UnitContas, UnitGlobal;

procedure TFrmPrincipal.AcessoSubMenuCategories0Items0Click(Sender: TObject);
begin
  CloseMenuAcesso;
  TNavigation.Open(TFrmPerfil, FrmPerfil, pContainer);
end;

procedure TFrmPrincipal.ActChapaExecute(Sender: TObject);
begin
  //Eleicao
  CloseSubMenu;
  //TNavigation.Open(TFrmEleicao, FrmEleicao, pContainer);
end;

procedure TFrmPrincipal.ActSedeExecute(Sender: TObject);
begin
  CloseSubMenu;
  CloseMenuAcesso;
  //TNavigation.Open(TFrmSede, FrmSede, pContainer);
end;

procedure TFrmPrincipal.Ac_ContasExecute(Sender: TObject);
begin
  //Contas
  TNavigation.Open(TFrmContas, FrmContas, pContainer);
end;

procedure TFrmPrincipal.ac_EmpresaExecute(Sender: TObject);
begin
  //CloseSubMenu;
  TNavigation.Open(TFrmEmpresa, FrmEmpresa, pContainer);
end;

procedure TFrmPrincipal.Ac_FormaPagamentoExecute(Sender: TObject);
begin
  //Prazo de Pagamento
  //CloseSubMenu;
  TNavigation.Open(TFrmPrazo, FrmPrazo, pContainer);
end;

procedure TFrmPrincipal.Ac_funcionarioExecute(Sender: TObject);
begin
  //Funcionario
  //CloseSubMenu;
  TNavigation.Open(TFrmFuncionario, FrmFuncionario, pContainer);
end;

procedure TFrmPrincipal.Ac_GrupoExecute(Sender: TObject);
begin
  //grupo
  TNavigation.Open(TFrmGrupo, FrmGrupo, pContainer);
end;

procedure TFrmPrincipal.Ac_LocalizacaoExecute(Sender: TObject);
begin
  //localizacao
  TNavigation.Open(TFrmLocalizacao, Frmlocalizacao, pContainer);
end;

procedure TFrmPrincipal.Ac_marcaExecute(Sender: TObject);
begin
  //marca
  TNavigation.Open(TFrmMarca, FrmMarca, pContainer);
end;

procedure TFrmPrincipal.Ac_PessoaExecute(Sender: TObject);
begin
  //Pessoa
  //CloseSubMenu;
  TNavigation.Open(TFrmPessoa, FrmPessoa, pContainer);
end;

procedure TFrmPrincipal.Ac_PlanoContasExecute(Sender: TObject);
begin
  //Plano de contas
  TNavigation.Open(TFrmPlanoContaCons, FrmPlanoContaCons, pContainer);
end;

procedure TFrmPrincipal.Ac_ProdutoExecute(Sender: TObject);
begin
  //Consulta Produto
  //CloseMenuProduto;
  //CloseSubMenu;
  TNavigation.Open(TFrmProdutos, FrmProdutos, pContainer);
end;

procedure TFrmPrincipal.Ac_TransportadoraExecute(Sender: TObject);
begin
  TNavigation.Open(TFrmTransportadoraConsulta, FrmTransportadoraConsulta, pContainer);
end;

procedure TFrmPrincipal.Ac_UnidadeExecute(Sender: TObject);
begin
  //unidade
  TNavigation.Open(TFrmUnidade, Frmunidade, pContainer);
end;

procedure TFrmPrincipal.BtnCloseAcessoClick(Sender: TObject);
begin
  CloseMenuAcesso;
end;

procedure TFrmPrincipal.btnCloseSubClick(Sender: TObject);
begin
    CloseSubMenu;
end;

procedure TFrmPrincipal.btnMenuClick(Sender: TObject);
begin
    sMenu.Opened := NOT sMenu.Opened;
end;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
var
Model :TModeltipoplano;
msg:string;
begin

  //TNavigation.ExecuteOnClose    := RefreshTela;
  TNavigation.ParamInt          := 0;
  TNavigation.ParamsStr         := 'N';
  TNavigation.OpenModal(TFrmPlanoCad, FrmPlanoCad);


  //TNavigation.Open(TFrmTipoPlano, FrmTipoPlano, pContainer);

  {Try
    Model :=TModeltipoplano.Create;

    Model.Tipo        :='RECEITA';
    Model.Descricao   :='ATIVOS';
    model.Inativo     :='N';
    MODEL.Idtipo      := 1;
    try
      if model.novo(msg) then
      showmessage(msg);

    except on e:exception do
      begin
        raise Exception.Create(msg);
      end;
    end;


  Finally
    model.Free;
  End; }
end;

procedure TFrmPrincipal.CloseSubMenu;
begin
    if sSubMenu.Opened then
    begin
        sSubMenu.Opened := false;
        CadastroSubmenu.SelectedItem := nil;
        sMenu.SetFocus;
    end;
end;

Procedure TFrmPrincipal.CloseMenuAcesso;
begin
  if sMenuAcesso.Opened then
  begin
    smenuacesso.Opened := false;
    AcessoSubmenu.SelectedItem := nil;
    sMenu.SetFocus;
  end;

end;

Procedure TFrmPrincipal.CloseMenuProduto;
begin
  if sMenuSubProduto.Opened then
  begin
    sMenuSubProduto.Opened := false;
    CategoriaSubProduto.SelectedItem := nil;
    sMenu.SetFocus;
  end;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  //Estruturar Menu

  if AppMenu = 'S' then
  begin
    MenuPrincipal.Categories[3].VisibleGutter:= False;
    MenuPrincipal.Categories[5].VisibleGutter:= False;
    MenuPrincipal.Categories[6].VisibleGutter:= False;
    MenuPrincipal.Categories[7].VisibleGutter:= False;
    MenuPrincipal.Categories[9].VisibleGutter:= False;
    MenuPrincipal.Categories[10].VisibleGutter:= False;
    MenuPrincipal.Categories[11].VisibleGutter:= False;
  end;

end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  //Carregar dados do Sistema
  CarregarSistema;

  lblNome.Caption       := TSession.NOME;
  lblEmail.Caption      := TSession.EMAIL;
  FrmPrincipal.Caption  := FrmPrincipal.Caption +' - Registrado para: '+ inttostr(TSession.idempresa)+' '+TSession.razao;

end;

procedure TFrmPrincipal.CategoryButtons1Categories0Items1Click(Sender: TObject);
begin
  //Usuario consulta
  CloseSubMenu;
  CloseMenuAcesso;
  TNavigation.Open(TFrmUsuario, FrmUsuario, pContainer);
end;

procedure TFrmPrincipal.CategoryMenuButtonsCategories0Items2Click(
  Sender: TObject);
begin
    CloseMenuAcesso;
    sSubMenu.Opened := true;
end;

procedure TFrmPrincipal.CategoryMenuButtonsCategories0Items4Click(
  Sender: TObject);
begin
  //Acesso
  CloseSubMenu;
  sMenuAcesso.Opened := true;
end;

procedure TFrmPrincipal.CategoryMenuButtonsCategories0Items5Click(
  Sender: TObject);
begin
    Application.Terminate;
end;

Function TFrmPrincipal.CriarEmpresa:Boolean;
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

        //Liberar os modulos    TSession.tipoatividade
        LiberarModulo(TSession.tipoatividade);

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

Procedure TFrmPrincipal.CarregarSistema;
begin
  if CriarEmpresa then
  begin

  end;

  if ChamaLogin then
    exit;

end;

function TfrmPrincipal.ChamaLogin: Boolean;
begin
    try
      FrmLogin := TFrmLogin.Create(Application);
      FrmLogin.ShowModal;
    finally
      FrmLogin.Release;
    end;

end;

Function TFrmPrincipal.LiberarModulo(tipo:integer):boolean;
begin
  case tipo of
  0:begin
      //CadastrosubMenu.Categories[0].Items[0].CategoryButtons.visible:=False;

    end;

  1:begin
      {CadastrosubMenu.Categories[0].Items[0].Free;
      CadastrosubMenu.Categories[0].Items[1].Free;
      CadastrosubMenu.Categories[0].Items[2].Free;
      CadastrosubMenu.Categories[0].Items[3].Free;
      }


      //hideCategoryButtonItem(0, 0);
      //DisableCategoryButtonItem(0, 0);



    end;

  2:begin

    end;

  3:begin

    end;
  end;

end;

procedure TFrmPrincipal.LogofundoDblClick(Sender: TObject);
begin
  //Carregar logo fundo
  OpenPicture.Execute;
  if Trim(OpenPicture.FileName) <> '' then
  begin
    TConeSul.GravarValorIni(dm.nDir,'PEDIDO','ImgFundo',OpenPicture.FileName);

    CarregaImagemFundo;

  end;

end;

procedure TFrmPrincipal.CarregaImagemFundo;
begin

  if FileExists(TConeSul.LerValorIni(dm.nDir,'PEDIDO','ImgFundo','')) then
  begin
    LogoFundo.Picture.LoadFromFile(TConeSul.LerValorIni(dm.nDir,'PEDIDO','ImgFundo',''));
  end;

end;

procedure TFrmPrincipal.MenuPrincipalCategories0Items2Click(Sender: TObject);
begin
  //Pedido
  TNavigation.Open(TFrmPedido, FrmPedido, pContainer);

end;

procedure TFrmPrincipal.MenuPrincipalCategories0Items3Click(Sender: TObject);
begin   //FrmManifesto
  TNavigation.Open(TFrmManifesto, FrmManifesto, pContainer);
end;

procedure TFrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  CloseMenuProduto;
end;

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


end.
