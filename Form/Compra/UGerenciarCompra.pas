unit UGerenciarCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormNovoBasePesquisa, cxGraphics,
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
  cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData,
  cxContainer, Vcl.ButtonStylesAttributes, System.ImageList, Vcl.ImgList,
  cxImageList, Vcl.Menus, cxGridTableView, cxClasses, DBAccess, Uni, ACBrBase,
  ACBrEnterTab, Vcl.StyledButton, cxMaskEdit, cxDropDownEdit, dxGDIPlusClasses,
  Vcl.ExtCtrls, cxTextEdit, cxGroupBox, Vcl.Buttons, Vcl.StdCtrls, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridDBTableView, cxGrid,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, UBuscarSefaz,
  UConsultaXMLImportado;

type
  TFrmGerenciarCompra = class(TFormNovoBasePesquisa)
    EdtDataInicial: TcxDateEdit;
    edtDataFinal: TcxDateEdit;
    EdtFiltropor: TcxComboBox;
    BtnSefaz: TStyledBitBtn;
    N2: TMenuItem;
    BtnXmlImportado: TMenuItem;
    ImportarXML1: TMenuItem;
    notion1: TMenuItem;
    Label5: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    procedure BtnSefazClick(Sender: TObject);
    procedure BtnXmlImportadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGerenciarCompra: TFrmGerenciarCompra;

implementation

{$R *.dfm}

procedure TFrmGerenciarCompra.BtnSefazClick(Sender: TObject);
begin
  //Chamar tela da sefaz
  if not Assigned(FrmBuscarSefaz) then
  FrmBuscarSefaz := TFrmBuscarSefaz.Create(Application);
  FrmBuscarSefaz.ShowModal;
end;

procedure TFrmGerenciarCompra.BtnXmlImportadoClick(Sender: TObject);
begin
  inherited;
  if not Assigned(FrmConsultaXMLImportado) then
  FrmConsultaXMLImportado := TFrmConsultaXMLImportado.Create(Application);
  FrmConsultaXMLImportado.Show;
end;

end.
