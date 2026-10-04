unit UnitBaseNovoPesquisaDiversos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormNovoBase, Data.DB, DBAccess, Uni,
  ACBrBase, ACBrEnterTab, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.ButtonStylesAttributes,
  Vcl.StyledButton, cxMaskEdit, cxDropDownEdit, dxGDIPlusClasses, cxTextEdit,
  cxGroupBox, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxDateRanges, dxScrollbarAnnotations, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, System.ImageList, Vcl.ImgList, cxImageList,
  Vcl.Menus;

type
  TFormNovoBasePesquisaDiversas = class(TFormNovoBase)
    PanelFiltro: TPanel;
    GBFiltro: TcxGroupBox;
    Label1: TLabel;
    EdtBusca: TcxTextEdit;
    PPopPap: TPanel;
    Menu: TImage;
    BtnLimpar: TStyledBitBtn;
    cxGrid: TcxGrid;
    Grid: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    BtnPesquisar: TStyledBitBtn;
    cxIMGMenu: TcxImageList;
    MenuPop: TPopupMenu;
    btnEditar: TMenuItem;
    btnExcluir: TMenuItem;
    N1: TMenuItem;
    btnListagem: TMenuItem;
    BtnRelatorio: TMenuItem;
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure EdtBuscaPropertiesChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MenuClick(Sender: TObject);
  private
    { Private declarations }
  public
    class var ParamsTela  :String;
    Procedure Pesquisa      ;virtual; abstract;
    Procedure Inserir       ;virtual; abstract;

    { Public declarations }
  end;

var
  FormNovoBasePesquisaDiversas: TFormNovoBasePesquisaDiversas;

implementation

{$R *.dfm}

uses Vcl.PermissaoUsuario, Vcl.Session, uJKDialog;

procedure TFormNovoBasePesquisaDiversas.BtnLimparClick(Sender: TObject);
begin
  inherited;
  EdtBusca.Clear;
  EdtBusca.SetFocus;
end;

procedure TFormNovoBasePesquisaDiversas.BtnPesquisarClick(Sender: TObject);
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

procedure TFormNovoBasePesquisaDiversas.EdtBuscaPropertiesChange(
  Sender: TObject);
begin
  inherited;
  Pesquisa;
end;

procedure TFormNovoBasePesquisaDiversas.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case key of
    vk_F7:BtnPesquisar.Click;
    vk_F8:BtnLimpar.Click;
  end;
end;

procedure TFormNovoBasePesquisaDiversas.MenuClick(Sender: TObject);
begin
  inherited;
  MenuPop.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

end.
