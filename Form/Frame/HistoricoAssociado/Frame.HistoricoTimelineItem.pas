unit Frame.HistoricoTimelineItem;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons;

type
  TFrameHistoricoTimelineItem = class(TFrame)
    pnlCard: TPanel;
    shpLinha: TShape;
    shpCirculo: TShape;
    lblTitulo: TLabel;
    lblDescricao: TLabel;
    lblDataUsuario: TLabel;
    lblSituacao: TLabel;
    btnVisualizar: TSpeedButton;
    lblDataAssociado: TLabel;
    procedure btnVisualizarClick(Sender: TObject);
  private
    FIdHistorico: Int64;
    FOnVisualizar: TNotifyEvent;
    procedure SetCorEvento(const ACor: TColor);
    procedure AjustarLayout;
  public
    constructor Create(AOwner: TComponent); override;

    procedure Configurar(
      const AIdHistorico: Int64;
      const ATitulo: string;
      const ADescricao: string;
      const ADataHora: TDate;
      const ADataFiliacao:TDate;
      const ADataDesfiliacao:TDate;
      const AUsuario: string;
      const ASituacao: string;
      const ACor:string;// TColor;
      const AExibirBotaoVisualizar: Boolean = True
      );

    property IdHistorico: Int64 read FIdHistorico;
    property OnVisualizar: TNotifyEvent read FOnVisualizar write FOnVisualizar;
  end;

implementation

{$R *.dfm}

{ TFrameHistoricoTimelineItem }

constructor TFrameHistoricoTimelineItem.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Align := alTop;
  Height := 118;
  Width := 800;
end;

procedure TFrameHistoricoTimelineItem.AjustarLayout;
begin
  pnlCard.Left      := 76;
  pnlCard.Top       := 8;
  pnlCard.Width     := Width - 90;
  pnlCard.Height    := 98;

  lblTitulo.Left    := 16;
  lblTitulo.Top     := 12;
  lblTitulo.Width   := pnlCard.Width - 180;

  lblDescricao.Left     := 16;
  lblDescricao.Top      := 38;
  lblDescricao.Width    := pnlCard.Width - 180;

  lblDataUsuario.Left   := 16;
  lblDataUsuario.Top    := 70;
  lblDataUsuario.Width  := pnlCard.Width - 190;

  lblSituacao.Left      := pnlCard.Width - 134;
  lblSituacao.Top       := 16;
  lblSituacao.Width     := 110;
  lblSituacao.Height    := 24;

  lblDataAssociado.Left   := pnlCard.Width - 134;
  lblDataAssociado.Top    := 70;
  lblDataAssociado.Width  := 94;
  lblDataAssociado.Height := 15;


  btnVisualizar.Left    := pnlCard.Width - 134;
  btnVisualizar.Top     := 58;
  btnVisualizar.Width   := 110;
  btnVisualizar.Height  := 28;
end;

procedure TFrameHistoricoTimelineItem.SetCorEvento(const ACor: TColor);
begin
  shpCirculo.Brush.Color  := ACor;
  shpCirculo.Pen.Color    := ACor;

  lblTitulo.Font.Color    := ACor;
  lblSituacao.Font.Color  := ACor;
end;

procedure TFrameHistoricoTimelineItem.Configurar(
  const AIdHistorico: Int64;
  const ATitulo: string;
  const ADescricao: string;
  const ADataHora: TDate;
  const ADataFiliacao:TDate;
  const ADataDesfiliacao:TDate;
  const AUsuario: string;
  const ASituacao: string;
  const ACor:string;// TColor;
  const AExibirBotaoVisualizar: Boolean);
begin
  FIdHistorico                := AIdHistorico;

  lblTitulo.Caption           := ATitulo;
  lblDescricao.Caption        := ADescricao;
  lblDataUsuario.Caption      := 'Data criação: ' + FormatDateTime('dd/mm/yyyy', ADataHora) +
                              '   |   Usuário: ' + AUsuario;
  lblSituacao.Caption         := ASituacao;

  if (ATitulo = 'CADASTRO DE ASSOCIADO') or (ATitulo = 'REFILIAÇÃO') then
  lblDataAssociado.Caption    := 'Início: '+ FormatDateTime('dd/mm/yyyy',ADataFiliacao);

  if ATitulo = 'DESFILIAÇÃO' then
  lblDataAssociado.Caption    := 'Fim: '+ FormatDateTime('dd/mm/yyyy',ADataDesfiliacao);

  btnVisualizar.Visible       := AExibirBotaoVisualizar;

  SetCorEvento(StringToColor(ACor));
  AjustarLayout;
end;

procedure TFrameHistoricoTimelineItem.btnVisualizarClick(Sender: TObject);
begin
  if Assigned(FOnVisualizar) then
    FOnVisualizar(Self);
end;

end.
