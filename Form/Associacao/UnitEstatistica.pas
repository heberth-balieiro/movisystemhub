unit UnitEstatistica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseCons, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, dxSkinBlack,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, Vcl.Menus, frxClass, frxDBSet,
  Vcl.Tabs, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxGDIPlusClasses, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons,  cxContainer, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  uJKDialog, cxCheckBox, cxGroupBox, UFormNovoBaseDiversos,
  DBAccess, Uni, ACBrBase, ACBrEnterTab, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, View.WebCharts, Controller.Estatisticas,
  Model.Estatisticas, dxmdaset, VCLTee.Series, cxCurrencyEdit;

type
  TFrmEstatisticas = class(TFormNovoBaseDiversos)
    cxGrid: TcxGrid;
    Grid: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    GridCategoria: TcxGridDBColumn;
    GridHomens: TcxGridDBColumn;
    GridMulheres: TcxGridDBColumn;
    GridTotais: TcxGridDBColumn;
    WebCharts1: TWebCharts;
    DBChartPizza: TDBChart;
    mdPesquisa: TdxMemData;
    mdPesquisasituacao: TStringField;
    mdPesquisahomens: TIntegerField;
    mdPesquisamulheres: TIntegerField;
    mdPesquisacisgenero: TIntegerField;
    mdPesquisatransgenero: TIntegerField;
    mdPesquisabinario: TIntegerField;
    mdPesquisaoutros: TIntegerField;
    mdPesquisatotal: TIntegerField;
    Gridcisgenero: TcxGridDBColumn;
    Gridtrans: TcxGridDBColumn;
    Gridbinario: TcxGridDBColumn;
    Gridoutros: TcxGridDBColumn;
    DBChart: TDBChart;
    Series1: THorizBarSeries;
    Series2: TPieSeries;
    DBChartsecretaria: TDBChart;
    HorizBarSeries1: THorizBarSeries;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    mdPesquisaSecretaria: TdxMemData;
    mdPesquisaSecretariaativo: TCurrencyField;
    mdPesquisaSecretariainadimplente: TCurrencyField;
    mdPesquisaSecretariasuspenso: TCurrencyField;
    mdPesquisaSecretariaafastado: TCurrencyField;
    mdPesquisaSecretariainativo: TCurrencyField;
    mdPesquisaSecretariacancelado: TCurrencyField;
    mdPesquisaSecretariasecretaria: TStringField;
    dssecretaria: TUniDataSource;
    cxGridDBTableView1RecId: TcxGridDBColumn;
    cxGridDBTableView1ativo: TcxGridDBColumn;
    cxGridDBTableView1inadimplente: TcxGridDBColumn;
    cxGridDBTableView1suspenso: TcxGridDBColumn;
    cxGridDBTableView1afastado: TcxGridDBColumn;
    cxGridDBTableView1inativo: TcxGridDBColumn;
    cxGridDBTableView1cancelado: TcxGridDBColumn;
    cxGridDBTableView1secretaria: TcxGridDBColumn;
    mdPesquisaSecretariatotal: TIntegerField;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    Procedure CarregarEstatistica;
    Procedure CarregarEstatisticasecretaria;
  public
    { Public declarations }
  end;

var
  FrmEstatisticas: TFrmEstatisticas;
  ObjEst      : TModelEstatisticas;
  ContEst     : TEstatisticasController;

implementation

{$R *.dfm}

Uses System.Generics.Collections;

{ TFrmEstatisticas }

procedure TFrmEstatisticas.CarregarEstatistica;
var
List    : TObjectList<TModelEstatisticas>;
begin
  inherited;
  try
    List        := Nil;

    ContEst     := TEstatisticasController.create;

    Try
      List  := ContEst.ListarTotais();

      mdPesquisa.Close;
      mdPesquisa.FieldDefs.Clear;

      if (List = nil) or (List.Count = 0) then
      begin
        mdPesquisa.Close;
        exit;
      end;

      if not mdPesquisa.Active then
        mdPesquisa.Open;

      mdPesquisa.DisableControls;

      for var Item in List do
      begin
        mdPesquisa.Append;

        mdPesquisasituacao.AsString         := Item.Situacao;
        mdPesquisahomens.AsFloat          := Item.homens;
        mdPesquisamulheres.AsFloat        := Item.mulheres;
        mdPesquisacisgenero.AsFloat       := Item.cisgenero;
        mdPesquisatransgenero.AsFloat     := Item.transgenero;
        mdPesquisabinario.AsFloat         := Item.binario;
        mdPesquisaoutros.AsFloat          := Item.outros;
        mdPesquisatotal.AsFloat           := Item.total;

        mdPesquisa.Post;
      end;
      mdPesquisa.First;
      mdPesquisa.EnableControls;

    Finally
      FreeAndNil(ContEst);
      if Assigned(List) then
        List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmEstatisticas.CarregarEstatisticasecretaria;
var
List    : TObjectList<TModelEstatisticas>;
begin
  inherited;
  try
    List        := Nil;

    ContEst     := TEstatisticasController.create;

    Try
      List  := ContEst.ListarTotaisSecretaria();

      mdPesquisaSecretaria.Close;
      mdPesquisaSecretaria.FieldDefs.Clear;

      if (List = nil) or (List.Count = 0) then
      begin
        mdPesquisaSecretaria.Close;
        exit;
      end;

      if not mdPesquisaSecretaria.Active then
        mdPesquisaSecretaria.Open;

      mdPesquisaSecretaria.DisableControls;

      for var Item in List do
      begin
        mdPesquisaSecretaria.Append;

        mdPesquisaSecretariaativo.AsFloat         := item.ativo;
        mdPesquisaSecretariainadimplente.AsFloat  := item.inadimplente;
        mdPesquisaSecretariasuspenso.AsFloat      := item.suspenso;
        mdPesquisaSecretariaafastado.AsFloat      := item.afastado;
        mdPesquisaSecretariainativo.AsFloat       := item.inativo;
        mdPesquisaSecretariacancelado.AsFloat     := item.cancelado;
        mdPesquisaSecretariasecretaria.AsString   := item.secretaria;
        mdPesquisaSecretariatotal.AsInteger       := Item.total;

        mdPesquisaSecretaria.Post;
      end;
      mdPesquisaSecretaria.First;
      mdPesquisaSecretaria.EnableControls;

    Finally
      FreeAndNil(ContEst);
      if Assigned(List) then
        List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmEstatisticas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmEstatisticas := nil;
end;

procedure TFrmEstatisticas.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;

  if not mdPesquisaSecretaria.Active then
  mdPesquisaSecretaria.Open;
end;

procedure TFrmEstatisticas.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'Estatisticas';
  TitleText   := 'Estatisticas da Associação';
  CarregarEstatistica;
  Sleep(100);
  CarregarEstatisticasecretaria;
  DBChartPizza.RefreshData;
  DBChart.RefreshData;
  DBChartsecretaria.RefreshData;
end;

end.
