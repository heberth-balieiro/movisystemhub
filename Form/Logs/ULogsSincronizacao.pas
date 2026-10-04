unit ULogsSincronizacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormNovoBaseDiversos, Data.DB,
  DBAccess, Uni, ACBrBase, ACBrEnterTab, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxmdaset, Model.Sincronizar, Controller_sincronizar;

type
  TFrmLogs = class(TFormNovoBaseDiversos)
    cxGrid: TcxGrid;
    Grid: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    mdPesquisa: TdxMemData;
    mdPesquisaid_sincronizar: TIntegerField;
    mdPesquisasituacao: TStringField;
    mdPesquisadescricao: TStringField;
    mdPesquisacod_tabela: TIntegerField;
    mdPesquisaid_registro: TIntegerField;
    mdPesquisatabela: TStringField;
    TimerSinc: TTimer;
    GridRecId: TcxGridDBColumn;
    Gridid_sincronizar: TcxGridDBColumn;
    Gridcod_tabela: TcxGridDBColumn;
    Gridid_registro: TcxGridDBColumn;
    Gridsituacao: TcxGridDBColumn;
    Gridtabela: TcxGridDBColumn;
    Griddescricao: TcxGridDBColumn;
    procedure TimerSincTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    Procedure BuscarLogs;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogs: TFrmLogs;
  ContSincronizar : TSincronizarController;
  ObjSincronizar  : TSincronizar;
implementation

{$R *.dfm}

Uses System.Generics.Collections, uJKDialog;

procedure TFrmLogs.BuscarLogs;
var
List    : TObjectList<TSincronizar>;
begin
  inherited;
  try
    List    := Nil;

    ContSincronizar   := TsincronizarController.Create;

    Try
      List  := ContSincronizar.ListarTodos;

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

        mdPesquisaid_sincronizar.AsInteger    := Item.id_sincronizar;
        mdPesquisacod_tabela.AsInteger        := Item.cod_tabela;
        mdPesquisaid_registro.AsInteger       := Item.id_registro;
        mdPesquisasituacao.AsString           := Item.nsituacao;
        mdPesquisatabela.AsString             := Item.tabela;
        mdPesquisadescricao.AsString          := Item.descricao;

        mdPesquisa.Post;
      end;
      mdPesquisa.First;
      mdPesquisa.EnableControls;

    Finally
      FreeAndNil(Contsincronizar);
      if Assigned(List) then
        List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmLogs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmLogs := nil;
end;

procedure TFrmLogs.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;
end;

procedure TFrmLogs.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'Logs Sincronização';
  TitleText   := 'Painel de Logs';
  BuscarLogs;
end;

procedure TFrmLogs.TimerSincTimer(Sender: TObject);
begin
  inherited;
  BuscarLogs;
end;

end.
