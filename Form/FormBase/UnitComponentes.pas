{
Botão Salvar (sucesso): #36B37E → $007EB336

Botão Cancelar (atenção): #FF5630 → $003056FF

Botão Salvar (azul IBM): #0F62FE → $00FE620F

Botão Cancelar (alerta Carbon): #DA1E28 → $00281EDA

Botão Salvar (primário azul): #1976D2 → $00D27619

Botão Cancelar (erro): #C62828 → $002828C6



Tamanhos de telas

Padrão Grande    H600 x W650
Padrão Pequeno   H350 x W650 - Botões Salvar Top 235 Left 413 Botões cancelar top 235 left 531




}
unit UnitComponentes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseNovoCadastro, Data.DB, DBAccess,
  Uni, ACBrBase, ACBrEnterTab, Vcl.StdCtrls, Vcl.Buttons, dxBevel, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxCheckBox, cxMaskEdit, cxDropDownEdit,
  cxTextEdit, cxButtonEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxTimeEdit,
  cxSpinEdit, cxCalendar, cxMemo, cxCurrencyEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxBlobEdit, dxStatusBar, Vcl.ButtonStylesAttributes,
  Vcl.StyledButton, cxStyles, cxGridTableView, cxClasses;

type
  TFrmComponents = class(TFormNovoBaseCadastro)
    Label1: TLabel;
    cxCodigo: TcxTextEdit;
    Label3: TLabel;
    cxNatureza: TcxTextEdit;
    Label5: TLabel;
    cxOperacao: TcxComboBox;
    cxAtivo: TcxCheckBox;
    cxcnpj: TcxButtonEdit;
    cxcpf: TcxButtonEdit;
    cxFone: TcxMaskEdit;
    cxCep: TcxButtonEdit;
    cxMemo1: TcxMemo;
    cxData: TcxDateEdit;
    cxSpinEdit1: TcxSpinEdit;
    cxHora: TcxTimeEdit;
    cxValor: TcxCurrencyEdit;
    cxMeno: TcxBlobEdit;
    cxLookup: TcxLookupComboBox;
    edtLooccad: TcxLookupComboBox;
    BtnCliVisualizar: TcxButtonEdit;
    BtnCliNovo: TcxButtonEdit;
    cxSenha: TcxTextEdit;
    Label2: TLabel;
    cxMaskEdit1: TcxMaskEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    dxStatusBar1: TdxStatusBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmComponents: TFrmComponents;

implementation

{$R *.dfm}

end.
