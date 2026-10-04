unit UFormNovoBaseGerenciamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormNovoBase, Vcl.StdCtrls,
  Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxGroupBox, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxGDIPlusClasses, Vcl.Buttons, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Vcl.CustomizeDlg,
  Vcl.Menus, DBAccess, Uni, ACBrBase, ACBrEnterTab, Vcl.ButtonStylesAttributes,
  Vcl.StyledButton, dxmdaset, System.ImageList, Vcl.ImgList, cxImageList;

type
  TFormNovoBaseGerenciamento = class(TFormNovoBase)
    GBFiltro: TcxGroupBox;
    cxGrid: TcxGrid;
    Grid1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    PPopPap: TPanel;
    Menu: TImage;
    EdtDataInicial: TcxDateEdit;
    edtDataFinal: TcxDateEdit;
    EdtFiltropor: TcxComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    PopupMenu: TPopupMenu;
    edtBusca: TcxTextEdit;
    Grid2: TcxGridDBTableView;
    Grid3: TcxGridDBTableView;
    BtnPesquisar: TStyledBitBtn;
    BtnLimpar: TStyledBitBtn;
    BtnNovo: TStyledBitBtn;
    mdPesquisa: TdxMemData;
    cxIMGMenu: TcxImageList;
    procedure FormShow(Sender: TObject);
    procedure MenuClick(Sender: TObject);
    procedure cxTextEdit1PropertiesChange(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    class var ParamsTela  :String;
    Procedure Novo          ;virtual; abstract;
    Procedure Pesquisa; virtual; abstract;
    Procedure Editar; virtual; abstract;
    Procedure Excluir; virtual; abstract;



    Procedure Cancelar; virtual; abstract;
    Procedure Sincronizar; virtual; abstract;
    Procedure EnviarWhatsApp; virtual; abstract;
    Procedure Limpar; Virtual; abstract;
    { Public declarations }
  end;

var
  FormNovoBaseGerenciamento: TFormNovoBaseGerenciamento;

implementation

{$R *.dfm}

uses Vcl.PermissaoUsuario, Vcl.Session, uJKDialog, UConeSul,
  System.DateUtils;

procedure TFormNovoBaseGerenciamento.BtnLimparClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

  if Permissao.TemPermissao('Permitir Limpar') then
    Limpar
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFormNovoBaseGerenciamento.BtnNovoClick(Sender: TObject);
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

procedure TFormNovoBaseGerenciamento.BtnPesquisarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
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

procedure TFormNovoBaseGerenciamento.cxTextEdit1PropertiesChange(
  Sender: TObject);
begin
  Pesquisa;
end;

procedure TFormNovoBaseGerenciamento.FormShow(Sender: TObject);
var
  Dias: Integer;
  DataBase: TDateTime;
begin
  Self.SetFocus;
  if Sender is TForm then
    ParamsTela := TForm(Sender).Caption;

  Dias      := TConeSul.IntervaloData('IntervaloData');
  DataBase  := Date; // hoje

  // Data inicial: início do mês, menos o intervalo
  EdtdataInicial.Date := StartOfTheMonth(DataBase) - Dias;

  // Data final: fim do mês, mais o intervalo
  EdtdataFinal.Date := EndOfTheMonth(DataBase) + Dias;

end;

procedure TFormNovoBaseGerenciamento.MenuClick(Sender: TObject);
begin
  PopupMenu.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

end.
