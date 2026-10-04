{

cor $00E2E2E2 cinza
cor $003A47F7 vermelho
}
unit UnitBaseCons;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Navigation, cxGraphics,
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
  dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, ACBrBase, ACBrEnterTab,
  frxClass, frxDBSet, Vcl.Menus, dxGDIPlusClasses, Vcl.Tabs, Vcl.Loading,
  uJKDialog, cxContainer, cxGroupBox;

type
  TFrmModeloConsulta = class(TForm)
    pHeader: TPanel;
    lTitulo: TLabel;
    pNovo: TPanel;
    btnNovo: TSpeedButton;
    ds: TDataSource;
    pBusca: TPanel;
    pPesquisa: TPanel;
    btnBusca: TSpeedButton;
    edtBusca: TEdit;
    cxGrid: TcxGrid;
    Grid: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    frxDBListagem: TfrxDBDataset;
    Popup: TPopupMenu;
    btneditar: TMenuItem;
    N1: TMenuItem;
    btnListagem: TMenuItem;
    btnrelatorio: TMenuItem;
    PPopPap: TPanel;
    Image1: TImage;
    pLimpar: TPanel;
    btnLimpar: TSpeedButton;
    btnExcluir: TMenuItem;
    TabSituacao: TTabSet;
    cxgbPesquisa: TcxGroupBox;
    cxgbfiltro: TcxGroupBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btneditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnListagemClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure TabSituacaoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure GridEditKeyDown(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
  private

    { Private declarations }

  public
    tela      : string;
    Procedure OpenCadTela(id: integer;str:string); virtual; abstract;
    Procedure Editar; virtual; abstract;
    Procedure Excluir; virtual; abstract;
    Procedure Listagem; virtual; abstract;
    Procedure Pesquisa; virtual; abstract;
    procedure TerminatePesquisa(Sender: TObject);
    procedure TerminateDelete(Sender: TObject);
    { Public declarations }
  end;

var
  FrmModeloConsulta: TFrmModeloConsulta;

implementation

{$R *.dfm}

uses Vcl.PermissaoUsuario, Vcl.Session;

procedure TFrmModeloConsulta.btnBuscaClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,tela);

  if Permissao.TemPermissao('Permitir Pesquisa') then
    Pesquisa
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);

end;

procedure TFrmModeloConsulta.btnLimparClick(Sender: TObject);
begin
  //Limpar Campo
  edtbusca.Clear;
  ds.DataSet.Close;
  //Pesquisa;
end;

procedure TFrmModeloConsulta.btnListagemClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,tela);
  if Permissao.TemPermissao('Permitir Imprimir Listagem') then
    Listagem
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);

end;

procedure TFrmModeloConsulta.btnNovoClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,tela);

  if Permissao.TemPermissao('Permitir Criar Novo') then
    OpenCadTela(0,'N')
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);

end;

procedure TFrmModeloConsulta.btnExcluirClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,tela);

  if Permissao.TemPermissao('Permitir Excluir') then
    Excluir
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);

end;

procedure TFrmModeloConsulta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action            := TCloseAction.caFree;
  FrmModeloConsulta := nil;
end;

procedure TFrmModeloConsulta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_F2:btnnovo.Click;
    vk_F3:btneditar.Click;
    vk_F4:btnexcluir.Click;
    vk_f8:btnlimpar.Click;
    vk_f7:btnbusca.Click;
    vk_F9:btnlistagem.Click;
    vk_F10:btnrelatorio.Click;
  end;
end;

procedure TFrmModeloConsulta.FormShow(Sender: TObject);
begin
  Self.SetFocus;
end;

procedure TFrmModeloConsulta.GridEditKeyDown(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    btneditar.Click;
  end;
end;

procedure TFrmModeloConsulta.Image1Click(Sender: TObject);
begin
  PopUp.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TFrmModeloConsulta.TerminatePesquisa(Sender: TObject);
begin
  TLoading.Hide;

  if Sender is TThread then
  if Assigned(TThread(Sender).FatalException) then
  begin
    JKDialog('Erro',Exception(TThread(sender).FatalException).Message, tdErro);
    exit;
  end;

end;

procedure TFrmModeloConsulta.TabSituacaoClick(Sender: TObject);
begin
  Pesquisa;
end;

procedure TFrmModeloConsulta.TerminateDelete(Sender: TObject);
begin
  TLoading.Hide;

  if Sender is TThread then
  if Assigned(TThread(Sender).FatalException) then
  begin
    JKDialog('Erro',Exception(TThread(sender).FatalException).Message, tdErro);
    exit;
  end;

  Pesquisa;
end;

procedure TFrmModeloConsulta.btneditarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,tela);

  if Permissao.TemPermissao('Permitir Editar') then
    Editar
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);

end;

end.
