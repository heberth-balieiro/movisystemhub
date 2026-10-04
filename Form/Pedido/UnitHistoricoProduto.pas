unit UnitHistoricoProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseCadCons, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
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
  cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData,
  DBAccess, Uni, Vcl.Menus, ACBrBase, ACBrEnterTab, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxCheckBox, cxTextEdit, cxGroupBox, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCalendar, cxButtons, UDM, uJKDialog, cxCurrencyEdit, Model.Estoque,System.DateUtils;

type
  TFrmHistoricoProduto = class(TFrmBaseCadCons)
    Label2: TLabel;
    data1: TcxDateEdit;
    data2: TcxDateEdit;
    Label3: TLabel;
    Label5: TLabel;
    edttipo: TcxComboBox;
    Label6: TLabel;
    btnIncluir: TcxButton;
    dsProduto: TUniDataSource;
    edtproduto: TcxLookupComboBox;
    edtestoque: TcxCurrencyEdit;
    procedure FormShow(Sender: TObject);
    procedure edtprodutoExit(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CarregarGrid; override;
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    Function Excluir: Boolean;override;
    Function Editar:Boolean;override;
    { Public declarations }
  end;

var
  FrmHistoricoProduto: TFrmHistoricoProduto;

implementation

{$R *.dfm}

{ TFrmHistoricoProduto }

procedure TFrmHistoricoProduto.btnIncluirClick(Sender: TObject);
var
Model :TModelEstoque;
begin
  inherited;

  if edtproduto.Text='' then
  begin
    JKDialog('Alerta','Selecione um produto!', tdAlerta);
    edtproduto.SetFocus;
    exit;
  end;

//  Model   :=  TModelEstoque.Create;
//  Try
//    Try
//      if Model.HistoricoProduto(edtproduto.EditValue,edttipo.ItemIndex,data1.Date,data2.Date) then
//      begin
//
//      end
//      else
//      begin
//        JKDialog('Alerta','Nenhum registro encontrado!', tdAlerta);
//      end;
//
//    except on e:exception do
//      JKDialog('Erro','Erro ao carregar dados:'+e.Message, tderro);
//    End;
//  Finally
//    Model.free;
//  End;


end;

procedure TFrmHistoricoProduto.CarregarGrid;
begin
  inherited;

end;

function TFrmHistoricoProduto.Editar: Boolean;
begin

end;

procedure TFrmHistoricoProduto.edtprodutoExit(Sender: TObject);
begin
  inherited;
  if edtproduto.Text<>'' then
  begin
    edtcodigo.Text        := dsProduto.DataSet.FieldByName('unidade').AsString;
    edtestoque.EditValue  := dsproduto.DataSet.FieldByName('estoque').AsFloat;
  end
  else
  begin
    edtcodigo.Text  := '';
    edtestoque.EditValue  := 0;
  end;
end;

function TFrmHistoricoProduto.Excluir: Boolean;
begin

end;

procedure TFrmHistoricoProduto.FormShow(Sender: TObject);
var
msg:string;
begin
  inherited;
  try
    //if DM.PopularProdutoHistorico(msg) then
  except on e:exception do
    JKDialog('Erro','Erro ao carregar produto:'+e.Message, tderro);
  end;

  data1.EditValue := StartOfTheMonth(Date);
  data2.EditValue := EndOfTheMonth(Date);

end;

function TFrmHistoricoProduto.Salvar(out msg: string): Boolean;
begin

end;

function TFrmHistoricoProduto.ValidarCampos(out msg: string): Boolean;
begin

end;

end.
