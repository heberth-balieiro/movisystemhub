unit UFormNovoBasePesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormNovoBase, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, cxGraphics, cxControls, cxLookAndFeels,
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
  dxSkinXmas2008Blue, dxGDIPlusClasses, cxGroupBox, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxTextEdit, Vcl.Menus, cxButtons, DBAccess, Uni, ACBrBase,
  ACBrEnterTab, cxCheckBox, cxMaskEdit, cxDropDownEdit, System.ImageList,
  Vcl.ImgList, cxImageList, UscIconButton, Vcl.ButtonStylesAttributes,
  Vcl.StyledButton;

type
  TFormNovoBasePesquisa = class(TFormNovoBase)
    PanelFiltro: TPanel;
    cxGrid: TcxGrid;
    Grid: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    GBFiltro: TcxGroupBox;
    EdtBusca: TcxTextEdit;
    PPopPap: TPanel;
    Menu: TImage;
    Label1: TLabel;
    cxAtivo: TcxComboBox;
    Label2: TLabel;
    MenuPop: TPopupMenu;
    btnEditar: TMenuItem;
    btnExcluir: TMenuItem;
    N1: TMenuItem;
    btnListagem: TMenuItem;
    BtnRelatorio: TMenuItem;
    BtnPesquisar: TStyledBitBtn;
    BtnLimpar: TStyledBitBtn;
    BtnNovo: TStyledBitBtn;
    cxIMGMenu: TcxImageList;
    procedure btnNovoClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure EdtBuscaPropertiesChange(Sender: TObject);
    procedure MenuClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnListagemClick(Sender: TObject);
    procedure BtnRelatorioClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    class var ParamsTela  :String;
    Procedure Novo          ;virtual; abstract;
    Procedure Pesquisa      ;virtual; abstract;
    Procedure Editar        ;virtual; abstract;
    Procedure Excluir       ;virtual; abstract;
    Procedure Listagem      ;virtual; abstract;
    Procedure Relatorio     ;virtual; abstract;

    { Public declarations }
  end;

var
  FormNovoBasePesquisa: TFormNovoBasePesquisa;

implementation

{$R *.dfm}

uses Vcl.PermissaoUsuario, Vcl.Session, uJKDialog;

procedure TFormNovoBasePesquisa.btnPesquisarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  inherited;
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

  if Permissao.TemPermissao('Permitir Pesquisa') then
    Pesquisa
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFormNovoBasePesquisa.btnEditarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  inherited;

  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

  if Permissao.TemPermissao('Permitir Editar') then
    Editar
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFormNovoBasePesquisa.btnExcluirClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  inherited;

  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

  if Permissao.TemPermissao('Permitir Excluir') then
    Excluir
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFormNovoBasePesquisa.btnLimparClick(Sender: TObject);
begin
  inherited;
  EdtBusca.Clear;
  EdtBusca.SetFocus;
end;

procedure TFormNovoBasePesquisa.btnListagemClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  inherited;

  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

  if Permissao.TemPermissao('Permitir Imprimir Listagem') then
    Listagem
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFormNovoBasePesquisa.btnNovoClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  inherited;

  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

  if Permissao.TemPermissao('Permitir Criar Novo') then
    Novo
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFormNovoBasePesquisa.BtnRelatorioClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  inherited;

  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

  if Permissao.TemPermissao('Permitir Relatório') then
    Relatorio
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFormNovoBasePesquisa.EdtBuscaPropertiesChange(Sender: TObject);
begin
  inherited;
  Pesquisa;
end;

procedure TFormNovoBasePesquisa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
    vk_F7:BtnPesquisar.Click;
    vk_F8:BtnLimpar.Click;
    vk_F2:BtnNovo.Click;
    vk_f3:btnEditar.Click;
    vk_f4:btnExcluir.Click;
    vk_F5:btnlistagem.Click;
    vk_F6:btnrelatorio.Click;
  end;
end;

procedure TFormNovoBasePesquisa.MenuClick(Sender: TObject);
begin
  inherited;
  MenuPop.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

end.
