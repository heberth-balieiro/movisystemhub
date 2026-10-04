unit UnitBasePesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, cxGraphics,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.Buttons, cxGroupBox,
  dxGDIPlusClasses, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Menus;

type
  TFrmBasePesquisa = class(TForm)
    cxGroupBox1: TcxGroupBox;
    PCancelar: TPanel;
    btnCancelar: TSpeedButton;
    PSelecionar: TPanel;
    btnSalvar: TSpeedButton;
    pHeader: TPanel;
    lTitulo: TLabel;
    pBusca: TPanel;
    pPesquisa: TPanel;
    btnBusca: TSpeedButton;
    pLimpar: TPanel;
    btnLimpar: TSpeedButton;
    PPopPap: TPanel;
    Image1: TImage;
    cxGrid: TcxGrid;
    Grid: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    Popup: TPopupMenu;
    btneditar: TMenuItem;
    btnExcluir: TMenuItem;
    N1: TMenuItem;
    btnListagem: TMenuItem;
    btnrelatorio: TMenuItem;
    ds: TDataSource;
    cxgbfiltro: TcxGroupBox;
    cxgbPesquisa: TcxGroupBox;
    edtBusca: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tela      : String;
    Origem    : String;

    Procedure Pesquisa; virtual; abstract;
    Procedure Selecionar; virtual; abstract;
  end;

var
  FrmBasePesquisa: TFrmBasePesquisa;

implementation

uses Vcl.PermissaoUsuario, Vcl.Session, uJKDialog, Vcl.Navigation;

{$R *.dfm}

procedure TFrmBasePesquisa.btnBuscaClick(Sender: TObject);
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

procedure TFrmBasePesquisa.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmBasePesquisa.btnLimparClick(Sender: TObject);
begin
  edtbusca.Clear;
  ds.DataSet.Close;
end;

procedure TFrmBasePesquisa.btnSalvarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TFrmBasePesquisa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action            := TCloseAction.caFree;
  FrmBasePesquisa   := nil;
end;

procedure TFrmBasePesquisa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of

    vk_f8:btnlimpar.Click;
    vk_f7:btnbusca.Click;

  end;
end;

procedure TFrmBasePesquisa.FormShow(Sender: TObject);
begin
  Self.SetFocus;
end;

end.
