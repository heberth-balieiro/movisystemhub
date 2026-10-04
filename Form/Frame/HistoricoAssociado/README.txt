Frame para linha do tempo do histórico do associado - Delphi 11 VCL

Arquivos:
- Frame.HistoricoTimelineItem.pas
- Frame.HistoricoTimelineItem.dfm
- ExemploUso_HistoricoAssociado.pas
- ExemploUso_HistoricoAssociado.dfm

Como usar:
1. Adicione Frame.HistoricoTimelineItem.pas ao seu projeto.
2. Na sua tela de histórico, coloque um TScrollBox chamado scrLinhaTempo.
3. Crie os frames dinamicamente dentro do ScrollBox.

Exemplo básico:

var
  Frame: TFrameHistoricoTimelineItem;
begin
  Frame := TFrameHistoricoTimelineItem.Create(scrLinhaTempo);
  Frame.Parent := scrLinhaTempo;
  Frame.Align := alTop;
  Frame.Configurar(
    1,
    'CADASTRO DE ASSOCIADO',
    'Associado cadastrado no sistema.',
    Now,
    'Administrador',
    'ATIVO',
    clGreen,
    True
  );
end;

Evento Visualizar:

procedure TFrmHistorico.VisualizarHistorico(Sender: TObject);
var
  Frame: TFrameHistoricoTimelineItem;
begin
  if Sender is TFrameHistoricoTimelineItem then
  begin
    Frame := TFrameHistoricoTimelineItem(Sender);
    ShowMessage('ID do histórico: ' + Frame.IdHistorico.ToString);
  end;
end;

Observação:
- O frame usa apenas componentes VCL padrão.
- Não depende de banco ou componentes de terceiros.
- Pode ser usado no Delphi 11.
