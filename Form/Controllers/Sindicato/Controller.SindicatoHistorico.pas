unit Controller.SindicatoHistorico;

interface

uses
  Model.SindicatoHistorico,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections;

type
  TSindicatoHistoricoController = class
  private

  public
    class function Incluir(ADoc: TSindicatoHistorico): Boolean;
    class function buscarhistoricoporid(const AIDAssociado:integer): TObjectList<TSindicatoHistorico>;
  end;


implementation

{ TSindicatoHistoricoController }


uses UDM, cxDateUtils, System.Variants;

class function TSindicatoHistoricoController.buscarhistoricoporid(const AIDAssociado: integer): TObjectList<TSindicatoHistorico>;
var
  Sql, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
  FDAO: TDAOOperacao<TSindicatoHistorico>;
Const
  QryStr = 'Select a.id_historico, a.data_filiacao, a.data_desfiliacao, a.data_criacao, a.situacao_anterior, a.situacao_nova,'+
            ' a.documento_protocolo, a.matricula_nova, m.descricao as motivo, u.nome as usuario, a.tipo, a.cor, a.observacao'+
            ' from associado_historico a '+
            ' inner join associado_motivo_movimento m'+
            ' on a.id_motivo = m.id_motivo '+
            ' inner join usuario u'+
            ' on a.id_usuario = u.id_usuario'+
            ' where id_historico> 0 ';
begin
  FDAO    := TDAOOperacao<TSindicatoHistorico>.Create(dm.Conn);

  Try
    SQL := SQL + ' and a.id_associado = :id';
    Params := Params + [TPair<string, Variant>.Create('id', AIDAssociado)];
    SQLORDER  := ' order by a.id_historico, a.data_criacao';
    Result := FDAO.FindWhere(QryStr + SQL + SQLORDER, Params);
  Finally
    FDAO.Free;
  End;
end;

class function TSindicatoHistoricoController.Incluir(ADoc: TSindicatoHistorico): Boolean;
var
FDAO      : TDAOOperacao<TSindicatoHistorico>;
RetornoID : integer;
begin
  Result    := False;
  FDAO      := TDAOOperacao<TSindicatoHistorico>.Create(dm.Conn);

  Try
    if ADoc.id_historico = 0 then
    begin
      Adoc.data_criacao := Now;
      Try
        RetornoID       :=  FDAO.Insert(ADoc);
        Result          :=  True;
      except
        begin
          raise;
        end;
      End;
    end;

  Finally
    FDAO.Free;
  End;
end;

end.
