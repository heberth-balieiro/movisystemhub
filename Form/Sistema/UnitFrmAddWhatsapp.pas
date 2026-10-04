unit UnitFrmAddWhatsapp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.ButtonStylesAttributes,
  Vcl.StyledButton, cxGroupBox, cxMaskEdit, cxTextEdit, uJKDialog;

type
  TFrmAdicionarWhatsApp = class(TForm)
    Paneltitulo: TPanel;
    lblTitulo: TLabel;
    BtnFechar: TSpeedButton;
    PanelButton: TPanel;
    cxGroupBox1: TcxGroupBox;
    BtnCancelar: TStyledBitBtn;
    BtnSalvar: TStyledBitBtn;
    cxNome: TcxTextEdit;
    cxTelefone: TcxMaskEdit;
    Label2: TLabel;
    Label1: TLabel;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure lblTituloMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAdicionarWhatsApp: TFrmAdicionarWhatsApp;

implementation

uses UnitFrmWhatsAppMassa;
{$R *.dfm}

procedure TFrmAdicionarWhatsApp.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAdicionarWhatsApp.BtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmAdicionarWhatsApp.BtnSalvarClick(Sender: TObject);
begin
  if cxnome.Text='' then
  begin
    JKDialog('Alerta','Informe um nome', TdAlerta);
    exit;
  end;

  if cxtelefone.Text='' then
  begin
    JKDialog('Alerta','Informe um número', TdAlerta);
    exit;
  end;

  //enviar para a tela
  if not FrmEnviarWhatsAppMassa.mdListaPessoa.Active then
    FrmEnviarWhatsAppMassa.mdListaPessoa.Open;

  FrmEnviarWhatsAppMassa.mdListaPessoa.Append;

  Try

    FrmEnviarWhatsAppMassa.mdListaPessoaid_socio.AsInteger       := 0;
    FrmEnviarWhatsAppMassa.mdListaPessoacodigo.AsInteger         := 0;
    FrmEnviarWhatsAppMassa.mdListaPessoamatricula.AsInteger      := 0;
    FrmEnviarWhatsAppMassa.mdListaPessoanome.AsString            := Trim(cxnome.text);
    FrmEnviarWhatsAppMassa.mdListaPessoacpf.AsString             := '';
    FrmEnviarWhatsAppMassa.mdListaPessoawhatsapp.AsString        := cxtelefone.text;
    FrmEnviarWhatsAppMassa.mdListaPessoaemail.AsString           := '';
    FrmEnviarWhatsAppMassa.mdListaPessoasituacao.AsString        := 'Aguardando';
    FrmEnviarWhatsAppMassa.mdListaPessoa.Post;

  Finally
    Cxnome.Clear;
    cxtelefone.Clear;
    cxnome.SetFocus;
  End;

end;

procedure TFrmAdicionarWhatsApp.lblTituloMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(Self.Handle, WM_NCLBUTTONDOWN, HTCAPTION, 0);
end;

end.
