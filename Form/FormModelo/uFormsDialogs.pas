unit uFormsDialogs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, dxGDIPlusClasses,
  Vcl.StdCtrls, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, cxButtons;


type

  TJKFormDialog = class(TForm)
    pTopo: TPanel;
    pTexto: TPanel;
    pBotton: TPanel;
    imgDialog: TImage;
    ScrollBox1: TScrollBox;
    lTexto: TLabel;
    lNo: TcxButton;
    lYes: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure lYesClick(Sender: TObject);
    procedure lNoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Cor: TColor;
  end;

var
  JKFormDialog: TJKFormDialog;


implementation

{$R *.dfm}

procedure TJKFormDialog.FormShow(Sender: TObject);
begin
  //pTopo.Color           := Cor;
  lTexto.Font.Color     := Cor;
  lYes.SetFocus;
  //lNo.Font.Color        := Cor;
  //shYes.Pen.Color := Cor;
  //shYes.Brush.Color := Cor;
  //shNo.Pen.Color := Cor;
  //lNo.Font.Color        := Cor;
end;

procedure TJKFormDialog.lNoClick(Sender: TObject);
begin
  ModalResult := mrCancel;  //mrCancel
end;

procedure TJKFormDialog.lYesClick(Sender: TObject);
begin
  ModalResult := mrOK;   //mrOK
end;

end.
