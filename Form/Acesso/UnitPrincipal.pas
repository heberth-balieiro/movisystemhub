unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.WinXCtrls, System.ImageList, Vcl.ImgList, Vcl.CategoryButtons,
  Vcl.StdCtrls, Vcl.Session, Vcl.Navigation, dxGDIPlusClasses, System.Actions,
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, cxStyles,
  cxGridTableView, cxClasses, Vcl.ExtDlgs, dxBarBuiltInMenu, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic,
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
  dxSkinXmas2008Blue, cxPC, Vcl.ComCtrls;

type
  TFrmPrincipal = class(TForm)
    pLogo: TPanel;
    btnMenu: TSpeedButton;
    ImageList: TImageList;
    MenuPrincipal: TCategoryButtons;
    Panel1: TPanel;
    btnCloseSub: TSpeedButton;
    pNavbar: TPanel;
    pTela: TPanel;
    pUsuario: TPanel;
    lblNome: TLabel;
    lblEmail: TLabel;
    Image2: TImage;
    Image3: TImage;
    pContainer: TPanel;
    ActMenu: TActionManager;
    ActSede: TAction;
    ActCandidato: TAction;
    ActChapa: TAction;
    ActCidade: TAction;
    Action5: TAction;
    Action6: TAction;
    Action7: TAction;
    ActAssociado: TAction;
    OpenPicture: TOpenPictureDialog;
    cxStyleGridPedido: TcxStyleRepository;
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
    CxGridPedido: TcxGridTableViewStyleSheet;
    Logofundo: TImage;
    Edit1: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    procedure btnMenuClick(Sender: TObject);
    procedure btnCloseSubClick(Sender: TObject);
    procedure CategoryMenuButtonsCategories0Items2Click(Sender: TObject);
    procedure CategoryMenuButtonsCategories0Items5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CategoryMenuButtonsCategories0Items1Click(Sender: TObject);
    procedure CategoryMenuButtonsCategories0Items4Click(Sender: TObject);
    procedure BtnCloseAcessoClick(Sender: TObject);
    procedure CategoryButtons1Categories0Items1Click(Sender: TObject);
    procedure AcessoSubMenuCategories0Items0Click(Sender: TObject);
    procedure ActAssociadoExecute(Sender: TObject);
    procedure ActSedeExecute(Sender: TObject);
    procedure ActCandidatoExecute(Sender: TObject);
    procedure ActChapaExecute(Sender: TObject);
    procedure CadastroSubMenuCategories0Items0Click(Sender: TObject);
    procedure LogofundoDblClick(Sender: TObject);
    procedure MenuPrincipalCategories0Items0Click(Sender: TObject);
    procedure CadastroSubMenuCategories0Items5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure CloseSubMenu;
    Procedure CloseMenuAcesso;
    function CriarEmpresa: Boolean;
    procedure CarregarSistema;
    function ChamaLogin: Boolean;
    function LiberarModulo(tipo: integer): boolean;
    procedure DisableCategoryButtonItem(CategoryIndex, ItemIndex: Integer);
    procedure HideCategoryButtonItem(CategoryIndex, ItemIndex: Integer);
    procedure CarregaImagemFundo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation


{$R *.dfm}

uses UnitAssociado, Model.Empresa, UnitEmpresaRegistro, UnitUsuario, unitSede,
  UnitLogin, UnitCandidatoCad, UnitEleicao, unitPerfil, unitGerEleicao,
  UnitCandidato, UnitEmpresa, UConeSul, UDM, UnitDashBoard, UnitSecretaria;

procedure TFrmPrincipal.AcessoSubMenuCategories0Items0Click(Sender: TObject);
begin
  CloseMenuAcesso;
  TNavigation.Open(TFrmPerfil, FrmPerfil, pContainer);
end;

procedure TFrmPrincipal.ActAssociadoExecute(Sender: TObject);
begin
  CloseSubMenu;
    TNavigation.Open(TFrmAssociado, FrmAssociado, pContainer);
end;

procedure TFrmPrincipal.ActCandidatoExecute(Sender: TObject);
begin
  //Candidato
  CloseSubMenu;
  //TNavigation.ParamInt          := 0;
  //TNavigation.ParamsStr         := 'N';
  //TNavigation.OpenModal(TFrmCandidatoCad, FrmCandidatoCad);

  //
  TNavigation.Open(TFrmCandidato, FrmCandidato, pContainer);

end;

procedure TFrmPrincipal.ActChapaExecute(Sender: TObject);
begin
  //Eleicao
  CloseSubMenu;
  TNavigation.Open(TFrmEleicao, FrmEleicao, pContainer);
end;

procedure TFrmPrincipal.ActSedeExecute(Sender: TObject);
begin
  CloseSubMenu;
  CloseMenuAcesso;
  TNavigation.Open(TFrmSede, FrmSede, pContainer);
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
begin
  Memo1.Lines.Add(TConesul.Crypt('D',edit1.Text));
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

procedure TFrmPrincipal.CategoryMenuButtonsCategories0Items1Click(
  Sender: TObject);
begin
  CloseSubMenu;
  TNavigation.Open(TFrmGerEleicao, FrmGerEleicao, pContainer);
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

procedure TFrmPrincipal.CadastroSubMenuCategories0Items0Click(Sender: TObject);
begin
  //Empresa
  CloseSubMenu;
  CloseMenuAcesso;

  TNavigation.Open(TFrmEmpresa, Frmempresa, pContainer);
end;

procedure TFrmPrincipal.CadastroSubMenuCategories0Items5Click(Sender: TObject);
begin
  //Secretaria
  CloseSubMenu;
  CloseMenuAcesso;

  TNavigation.Open(TFrmSecretaria, Frmsecretaria, pContainer);
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

procedure TFrmPrincipal.MenuPrincipalCategories0Items0Click(Sender: TObject);
begin
  //Principal
  CloseMenuAcesso;
  CloseSubMenu;
  TNavigation.Open(TFrmDashBoard, FrmDashBoard, pContainer);
end;

procedure TFrmPrincipal.CarregaImagemFundo;
begin

  if FileExists(TConeSul.LerValorIni(dm.nDir,'PEDIDO','ImgFundo','')) then
  begin
    LogoFundo.Picture.LoadFromFile(TConeSul.LerValorIni(dm.nDir,'PEDIDO','ImgFundo',''));
  end;

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
