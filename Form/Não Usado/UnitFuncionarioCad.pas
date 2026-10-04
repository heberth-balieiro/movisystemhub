unit UnitFuncionarioCad;

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
  cxBlobEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxGroupBox;

type
  TFrmFuncionarioCad = class(TForm)
    lblTitulo: TLabel;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    Label1: TLabel;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxComboBox1: TcxComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cxButtonEdit1: TcxButtonEdit;
    cxTextEdit3: TcxTextEdit;
    cxTextEdit4: TcxTextEdit;
    cxTextEdit5: TcxTextEdit;
    cxComboBox2: TcxComboBox;
    Label9: TLabel;
    cxButtonEdit2: TcxButtonEdit;
    cxTextEdit6: TcxTextEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    cxTextEdit7: TcxTextEdit;
    cxTextEdit8: TcxTextEdit;
    Label13: TLabel;
    cxTextEdit9: TcxTextEdit;
    Label14: TLabel;
    cxLookupComboBox1: TcxLookupComboBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    cxMaskEdit1: TcxMaskEdit;
    cxMaskEdit2: TcxMaskEdit;
    cxMaskEdit3: TcxMaskEdit;
    cxMaskEdit4: TcxMaskEdit;
    cxMaskEdit5: TcxMaskEdit;
    Label20: TLabel;
    Label21: TLabel;
    cxBlobEdit1: TcxBlobEdit;
    cxBlobEdit2: TcxBlobEdit;
    Paneltitulo: TPanel;
    cxTextEdit10: TcxTextEdit;
    Label22: TLabel;
    cxGroupBox1: TcxGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFuncionarioCad: TFrmFuncionarioCad;

implementation

{$R *.dfm}

procedure TFrmFuncionarioCad.btnCancelarClick(Sender: TObject);
begin
    TNavigation.Close(Self);
end;

procedure TFrmFuncionarioCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    FrmFuncionarioCad := nil;
end;

end.
