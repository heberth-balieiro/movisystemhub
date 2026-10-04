unit UnitResultado;

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
  cxClasses, cxGridCustomView, cxGrid, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, cxContainer,
  cxLabel, cxDBLabel, dxCustomTileControl, dxTileBar, Vcl.Imaging.pngimage,
  dxBarBuiltInMenu, cxPC, dxGDIPlusClasses;

type
  TFrmResultado = class(TForm)
    pHeader: TPanel;
    Panel1: TPanel;
    btnAcessar: TSpeedButton;
    Panel2: TPanel;
    btnNovo: TSpeedButton;
    ds: TDataSource;
    Label4: TLabel;
    TimerAtualizar: TTimer;
    Panel3: TPanel;
    PanelBranco: TPanel;
    PanelNulo: TPanel;
    PanelValidos: TPanel;
    PanelAssociado: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    PanelCentral: TPanel;
    cxPageControl1: TcxPageControl;
    TabGrafico1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    DBChart1: TDBChart;
    Series1: TPieSeries;
    dsAssociado: TDataSource;
    EdtAssociado: TcxDBLabel;
    dsVotosValidos: TDataSource;
    cxDBLabel1: TcxDBLabel;
    dsBranco: TDataSource;
    cxDBLabel2: TcxDBLabel;
    cxDBLabel3: TcxDBLabel;
    dsNulos: TDataSource;
    dsdepartamento: TDataSource;
    cxTabSheet1: TcxTabSheet;
    DBChart2: TDBChart;
    Series2: THorizBarSeries;
    PanelNaoVotaram: TPanel;
    Image5: TImage;
    Label6: TLabel;
    cxDBLabel4: TcxDBLabel;
    dsNaoVotaram: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
    procedure TimerAtualizarTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmResultado: TFrmResultado;

implementation

{$R *.dfm}

uses UDM, Model.Campanha, uJKDialog;

procedure TFrmResultado.TimerAtualizarTimer(Sender: TObject);
begin
  btnNovo.Click;
end;

procedure TFrmResultado.btnAcessarClick(Sender: TObject);
begin
  TNavigation.Close(Self);
end;

procedure TFrmResultado.btnNovoClick(Sender: TObject);
var
campanha : TModelcampanha;
msg:string;
Token:String;
begin
  Try
    Campanha := TModelcampanha.Create;

    Token := campanha.BuscarTokenCampanha(TNavigation.ParamInt);

    if Token <> '' then
    begin
      campanha.token  := Token;

      Campanha.SelectVotos(msg);
      Campanha.TotalAssociado;
      Campanha.TotalVotosValidos;
      Campanha.TotalVotosBranco;
      Campanha.TotalVotosNulos;
      Campanha.TotalVotosDepartamento;
      campanha.TotalAssociadoNaoVotaram;

      TimerAtualizar.Enabled  := True;
    end
    else
    JKDialog('Aviso','Não foi encontrado nenhum token!', tdAlerta);

  Finally
    ds.DataSet.Open;
    campanha.Free;
  End;

    //OpenCadTela(0,'N');
end;

procedure TFrmResultado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    FrmResultado := nil;
end;

procedure TFrmResultado.FormShow(Sender: TObject);
begin
  TimerAtualizar.Enabled  := False;
end;

end.
