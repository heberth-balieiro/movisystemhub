unit ExemploUso_HistoricoAssociado;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Frame.HistoricoTimelineItem;

type
  TFrmExemploHistoricoAssociado = class(TForm)
    scrLinhaTempo: TScrollBox;
    procedure FormCreate(Sender: TObject);
  private
    procedure AdicionarItem(
      const AIdHistorico: Int64;
      const ATitulo, ADescricao, AUsuario, ASituacao: string;
      const ADataHora: TDateTime;
      const ACor: TColor
    );

    procedure VisualizarHistorico(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

procedure TFrmExemploHistoricoAssociado.FormCreate(Sender: TObject);
begin
  scrLinhaTempo.Align := alClient;
  scrLinhaTempo.BorderStyle := bsNone;
  scrLinhaTempo.VertScrollBar.Visible := True;

  AdicionarItem(1, 'CADASTRO DE ASSOCIADO', 'Associado cadastrado no sistema.', 'Maria Oliveira', 'ATIVO', EncodeDateTime(2022, 1, 10, 9, 15, 23, 0), clGreen);
  AdicionarItem(2, 'DESFILIAÇÃO', 'Solicitação de desfiliação realizada pelo associado.', 'João da Silva', 'DESFILIADO', EncodeDateTime(2023, 5, 20, 14, 32, 10, 0), clRed);
  AdicionarItem(3, 'REFILIAÇÃO', 'Associado realizou nova adesão.', 'Atendente Sindical', 'ATIVO', EncodeDateTime(2024, 6, 1, 8, 45, 0, 0), clBlue);
  AdicionarItem(4, 'ATUALIZAÇÃO DE DADOS', 'Dados cadastrais do associado foram atualizados.', 'Atendente Sindical', 'ALTERAÇÃO', EncodeDateTime(2025, 2, 15, 10, 20, 45, 0), $000080FF);
end;

procedure TFrmExemploHistoricoAssociado.AdicionarItem(
  const AIdHistorico: Int64;
  const ATitulo, ADescricao, AUsuario, ASituacao: string;
  const ADataHora: TDateTime;
  const ACor: TColor
);
var
  Frame: TFrameHistoricoTimelineItem;
begin
  Frame := TFrameHistoricoTimelineItem.Create(scrLinhaTempo);
  Frame.Parent := scrLinhaTempo;
  Frame.Align := alTop;
  Frame.Configurar(AIdHistorico, ATitulo, ADescricao, ADataHora, AUsuario, ASituacao, ACor, True);
  Frame.OnVisualizar := VisualizarHistorico;
end;

procedure TFrmExemploHistoricoAssociado.VisualizarHistorico(Sender: TObject);
var
  Frame: TFrameHistoricoTimelineItem;
begin
  if Sender is TFrameHistoricoTimelineItem then
  begin
    Frame := TFrameHistoricoTimelineItem(Sender);
    ShowMessage('Visualizar histórico ID: ' + Frame.IdHistorico.ToString);
  end;
end;

end.
