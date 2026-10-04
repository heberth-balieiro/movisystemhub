unit UnitBaseRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Navigation, cxGraphics, cxControls, cxLookAndFeels,
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
  dxSkinXmas2008Blue, cxButtonEdit, cxMaskEdit, cxDropDownEdit, cxTextEdit,
  cxBlobEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxGroupBox,
  cxCheckBox, ACBrBase, ACBrEnterTab, UFormNovoBase, cxStyles, cxGridTableView,
  cxClasses, Data.DB, DBAccess, Uni, Vcl.ButtonStylesAttributes,
  Vcl.StyledButton, frxClass, frxDBSet, frxExportHelpers, frxExportSVG,
  frxExportBaseDialog, frxExportPDF;

type
  TFrmBaseRelatorio = class(TFormNovoBase)
    cxGroupBox1: TcxGroupBox;
    BtnImprimir: TStyledBitBtn;
    BtnCancelar: TStyledBitBtn;
    frxDB: TfrxDBDataset;
    frxPDFExport: TfrxPDFExport;
    frxSVGExport: TfrxSVGExport;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    ParamsAviso:String;
    function Imprimir(out msg: string): Boolean; virtual; abstract;
    function ValidarCampos(out msg: string): Boolean; virtual; abstract;

    { Public declarations }
  end;

var
  FrmBaseRelatorio: TFrmBaseRelatorio;

implementation

{$R *.dfm}

Uses Udm, Vcl.Session, uJKDialog, UConeSul,uConfiguracaoService;

procedure TFrmBaseRelatorio.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmBaseRelatorio.BtnImprimirClick(Sender: TObject);
var
  Msg: string;
begin
  if not ValidarCampos(Msg) then
  begin
    JKDialog('Aviso', Msg, tdAlerta);
    Exit;
  end;
  if not Imprimir(Msg) then
  begin
    if ParamsAviso='Alerta' then
    JKDialog('Aviso', Msg, tdAlerta);

    if ParamsAviso='Error' then
    JKDialog('Erro', Msg, tdErro);
    Exit;
  end;
end;

procedure TFrmBaseRelatorio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action  := caFree;
  FrmBaseRelatorio := nil;
end;

procedure TFrmBaseRelatorio.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F5:
      begin
        BtnImprimir.Click;
        Key := 0;
      end;
    VK_ESCAPE:
      begin
        BtnCancelar.Click;
        Key := 0;
      end;
  end;

end;

end.
