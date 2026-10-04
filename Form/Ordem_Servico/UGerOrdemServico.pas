unit UGerOrdemServico;

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
  Vcl.StdCtrls, Vcl.Buttons, Datasnap.DBClient, cxContainer, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxGroupBox;

type
  TFrmGerOrdemServico = class(TFrmModeloConsulta)
    TabOrdem: TClientDataSet;
    TabStatus: TTabSet;
    data1: TcxDateEdit;
    data2: TcxDateEdit;
    TabEquipamento: TClientDataSet;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure Pesquisa;override;
    procedure OpenCadTela(id: integer;str:string);override;
    Procedure editar;override;
    Procedure Excluir;override;

  end;

var
  FrmGerOrdemServico: TFrmGerOrdemServico;

implementation

{$R *.dfm}

uses ULancOrdemservico, Vcl.Navigation;

procedure TFrmGerOrdemServico.editar;
begin
  inherited;

end;

procedure TFrmGerOrdemServico.Excluir;
begin
  inherited;

end;

procedure TFrmGerOrdemServico.FormShow(Sender: TObject);
begin
  inherited;
  Tela  := TFrmGerOrdemServico(sender).Caption;
end;

procedure TFrmGerOrdemServico.OpenCadTela(id: integer; str: string);
begin
  inherited;
  TNavigation.ParamInt          := id;
  TNavigation.ParamsStr         := str;
  TNavigation.OpenModal(TFrmRecpOrdemServico, FrmRecpOrdemServico);
end;

procedure TFrmGerOrdemServico.Pesquisa;
var
FiltroStatus,FiltroTipo, FiltroCampo :string;
begin
  FiltroStatus  := '';
  FiltroTipo    := '';
  FiltroCampo   := '';

  case TabStatus.TabIndex of
    1:  FiltroStatus  := 'Aberta';
    2:  FiltroStatus  := 'Aguardando Aprovação';
    3:  FiltroStatus  := 'Aprovada';
    4:  FiltroStatus  := 'Em Execução';
    5:  FiltroStatus  := 'Finalizada';
    6:  FiltroStatus  := 'Cancelada';
  end;


  case TabSituacao.TabIndex of
    1:FiltroStatus := 'Orçamento';
    2:FiltroStatus := 'Execução direta';
    3:FiltroStatus := 'Retorno';
    4:FiltroStatus := 'Garantia';
    5:FiltroStatus := 'Instalação';
    6:FiltroStatus := 'Laudo técnico';
  end;

  if trim(edtBusca.Text) <> '' then
  begin
    FiltroCampo     := trim(edtBusca.Text);
  end;

end;

end.
