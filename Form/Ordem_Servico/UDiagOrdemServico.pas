unit UDiagOrdemServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseOperacoes, cxGraphics,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, ACBrBase, ACBrEnterTab, cxGroupBox,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxButtonEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxDropDownEdit, cxSpinEdit, cxTimeEdit, cxMaskEdit, cxCalendar, cxTextEdit,
  cxMemo, dxBarBuiltInMenu, cxPC, cxCustomListBox, cxListBox, cxBlobEdit;

type
  TFrmTecnOrdemServico = class(TFrmBaseOperacoes)
    Label1: TLabel;
    edtNumero: TcxTextEdit;
    Label2: TLabel;
    edtData: TcxDateEdit;
    Label3: TLabel;
    edtHora: TcxTimeEdit;
    Label4: TLabel;
    EdtStatus: TcxComboBox;
    Label5: TLabel;
    EdtPrioridade: TcxComboBox;
    Label6: TLabel;
    EdtGarantia: TcxComboBox;
    Label8: TLabel;
    EdtTipoOS: TcxComboBox;
    Label7: TLabel;
    edtCliente: TcxLookupComboBox;
    BtnCliVisualizar: TcxButtonEdit;
    EdtTecnico: TcxLookupComboBox;
    Label9: TLabel;
    Label12: TLabel;
    EdtObs: TcxBlobEdit;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxGroupBox4: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    Label10: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    EdtEstado: TcxComboBox;
    Edt_DescEquipamento: TcxLookupComboBox;
    EdtSerie: TcxTextEdit;
    edtDefeito: TcxBlobEdit;
    EdtAnexo: TcxListBox;
    cxBlobEdit1: TcxBlobEdit;
    Label11: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTecnOrdemServico: TFrmTecnOrdemServico;

implementation

{$R *.dfm}

end.
