unit Frame.QuestaoLista;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.ExtCtrls,
  cxButtons,
  Frame.QuestaoOpcaoListaItem, dxSkinsCore, dxSkinBasic, dxSkinBlack,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls, Vcl.ButtonStylesAttributes,
  Vcl.StyledButton;

type
  TExclusaoOpcaoEvent = procedure(const AIDOpcao: Integer) of object;

  TQuestaoOpcaoLista = record
    IDOpcao: Integer;
    Ordem: Integer;
    Descricao: string;
  end;

  TFrameQuestaoLista = class(TFrame)
    pnlRodape: TPanel;
    ScrollOpcoes: TScrollBox;
    FlowOpcoes: TFlowPanel;
    btnAdicionarOpcao: TStyledBitBtn;
    procedure btnAdicionarOpcaoClick(Sender: TObject);
  private
    FItens            : TList<TFrameQuestaoOpcaoListaItem>;
    FOnOpcaoExcluida  : TExclusaoOpcaoEvent;
    procedure ExcluirOpcao(Sender: TObject);
    procedure ReordenarOpcoes;
    procedure AjustarLarguraItens;
  protected
    procedure Resize; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AdicionarOpcao(const ADescricao: string = ''; const AIDOpcao: Integer = 0);
    procedure Limpar;
    procedure LimparOpcoes;
    function Validar(out AMensagem: string): Boolean;
    function ObterOpcoes: TArray<TQuestaoOpcaoLista>;
    property OnOpcaoExcluida: TExclusaoOpcaoEvent read FOnOpcaoExcluida write FOnOpcaoExcluida;

  end;

implementation

{$R *.dfm}

constructor TFrameQuestaoLista.Create(AOwner: TComponent);
begin
  inherited;
  FItens := TList<TFrameQuestaoOpcaoListaItem>.Create;
  FlowOpcoes.FlowStyle := fsLeftRightTopBottom;
  FlowOpcoes.AutoSize := True;
  AdicionarOpcao;
end;

destructor TFrameQuestaoLista.Destroy;
var
  I: Integer;
begin
  for I := FItens.Count - 1 downto 0 do FItens[I].Free;
  FItens.Free;
  inherited;
end;

procedure TFrameQuestaoLista.Resize;
begin
  inherited;
  AjustarLarguraItens;
end;

procedure TFrameQuestaoLista.AjustarLarguraItens;
var
  Item: TFrameQuestaoOpcaoListaItem;
begin
  for Item in FItens do
  begin
    Item.AutoSize := False;
    Item.Width := FlowOpcoes.ClientWidth - 10;
    Item.Height := 38;
  end;
  FlowOpcoes.Realign;
end;

procedure TFrameQuestaoLista.AdicionarOpcao(const ADescricao: string; const AIDOpcao: Integer);
var
  Item: TFrameQuestaoOpcaoListaItem;
begin
  Item          := TFrameQuestaoOpcaoListaItem.Create(nil);
  Item.Parent   := FlowOpcoes;
  Item.AutoSize := False;
  Item.Height := 38;
  Item.Descricao := ADescricao;
  Item.IDOpcao    := AIDOpcao;
  Item.OnExcluir := ExcluirOpcao;
  FItens.Add(Item);
  ReordenarOpcoes;
  AjustarLarguraItens;
  Item.Visible := True;
  FlowOpcoes.Realign;
end;

procedure TFrameQuestaoLista.btnAdicionarOpcaoClick(Sender: TObject);
begin
  AdicionarOpcao;
end;

procedure TFrameQuestaoLista.ExcluirOpcao(Sender: TObject);
var
  Item: TFrameQuestaoOpcaoListaItem;
begin
  if not (Sender is TFrameQuestaoOpcaoListaItem) then Exit;
  Item := TFrameQuestaoOpcaoListaItem(Sender);
  if FItens.Count = 1 then
  begin
    Item.Descricao := '';

    //retorno da form que chamou
    if (Item.IDOpcao > 0) and Assigned(FOnOpcaoExcluida) then
    FOnOpcaoExcluida(Item.IDOpcao);

    Exit;
  end;

  //retorno da form que chamou
    if (Item.IDOpcao > 0) and Assigned(FOnOpcaoExcluida) then
    FOnOpcaoExcluida(Item.IDOpcao);

  FItens.Remove(Item);
  ReordenarOpcoes;

  TThread.ForceQueue(nil,
    procedure
    begin
      Item.Free;
    end);
end;

procedure TFrameQuestaoLista.ReordenarOpcoes;
var
  I: Integer;
begin
  for I := 0 to FItens.Count - 1 do FItens[I].Ordem := I + 1;
end;

procedure TFrameQuestaoLista.Limpar;

begin
 LimparOpcoes;
  AdicionarOpcao;
end;

procedure TFrameQuestaoLista.LimparOpcoes;
var
  I: Integer;
begin
  for I := FItens.Count - 1 downto 0 do
    FItens[I].Free;
  FItens.Clear;
  FlowOpcoes.Realign;
end;

function TFrameQuestaoLista.Validar(out AMensagem: string): Boolean;
var
  Item: TFrameQuestaoOpcaoListaItem;
begin
  Result := False;
  AMensagem := '';
  if FItens.Count < 2 then
  begin
    AMensagem := 'Cadastre pelo menos duas opções de resposta.';
    Exit;
  end;
  for Item in FItens do
    if Trim(Item.Descricao) = '' then
    begin
      AMensagem := Format('Informe a descrição da opção %d.', [Item.Ordem]);
      Exit;
    end;
  Result := True;
end;

function TFrameQuestaoLista.ObterOpcoes: TArray<TQuestaoOpcaoLista>;
var
  I: Integer;
begin
  SetLength(Result, FItens.Count);
  for I := 0 to FItens.Count - 1 do
  begin
    Result[I].IDOpcao   := FItens[I].IDOpcao;
    Result[I].Ordem     := FItens[I].Ordem;
    Result[I].Descricao := Trim(FItens[I].Descricao);
  end;
end;

end.
