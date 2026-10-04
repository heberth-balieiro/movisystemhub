unit Frame.QuestaoOpcaoMultiplaItem;

interface

uses
  System.SysUtils, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, cxGraphics,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxMaskEdit, cxButtonEdit;

type
  TExcluirOpcaoMultiplaEvent = procedure(Sender: TObject) of object;

  TFrameQuestaoOpcaoMultiplaItem = class(TFrame)
    chkOpcao: TCheckBox;
    edtdescricao: TcxTextEdit;
    btnExcluir: TcxButtonEdit;
    procedure btnExcluirPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    FOrdem: Integer;
    FOnExcluir: TExcluirOpcaoMultiplaEvent;
    FIDOpcao: Integer;
    function GetDescricao: string;
    procedure SetDescricao(const Value: string);
    procedure SetOrdem(const Value: Integer);
  public
    property Ordem: Integer read FOrdem write SetOrdem;
    property IDOpcao: Integer read FIDOpcao write FIDOpcao;
    property Descricao: string read GetDescricao write SetDescricao;
    property OnExcluir: TExcluirOpcaoMultiplaEvent read FOnExcluir write FOnExcluir;
  end;

implementation

{$R *.dfm}

procedure TFrameQuestaoOpcaoMultiplaItem.btnExcluirPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  if Assigned(FOnExcluir) then FOnExcluir(Self);
end;

function TFrameQuestaoOpcaoMultiplaItem.GetDescricao: string;
begin
  Result := edtDescricao.Text;
end;

procedure TFrameQuestaoOpcaoMultiplaItem.SetDescricao(const Value: string);
begin
  edtDescricao.Text := Value;
end;

procedure TFrameQuestaoOpcaoMultiplaItem.SetOrdem(const Value: Integer);
begin
  FOrdem := Value;
end;

end.
