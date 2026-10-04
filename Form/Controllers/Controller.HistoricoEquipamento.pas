{
OS_ABERTA

OS_CANCELADA
ORCAMENTO_ENVIADO
ORCAMENTO_APROVADO
INICIADO_REPARO
FINALIZADA_EXECUCAO
EQUIPAMENTO_ENTREGUE


}


unit Controller.HistoricoEquipamento;

interface

uses
  Model.HistoricoEquipamento,
  Dao.Operacoes,
  System.SysUtils, System.Generics.Collections;

type
  THistoricoEquipamentoController = class
  private
    FDAO: TDAOOperacao<THistoricoEquipamento>;
  public
    constructor Create;
    destructor Destroy; override;

    Function GravarHistorico(ADoc: THistoricoEquipamento; out RetornoID:integer):boolean;
    function BuscarPorID(AID: Integer): THistoricoEquipamento;

  end;

implementation

uses UDM, cxDateUtils, REST.Json;

{ THistoricoEquipamentoController }

function THistoricoEquipamentoController.BuscarPorID(
  AID: Integer): THistoricoEquipamento;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor THistoricoEquipamentoController.Create;
begin
  FDAO := TDAOOperacao<THistoricoEquipamento>.Create(dm.Conn);
end;

destructor THistoricoEquipamentoController.Destroy;
begin
FDAO.Free;
  inherited;
end;

function THistoricoEquipamentoController.GravarHistorico(ADoc: THistoricoEquipamento;
  out RetornoID: integer): boolean;
begin
  Result          :=  False;

   if ADoc.Id_historico = 0 then
  begin

    Try
      RetornoID       :=  FDAO.Insert(ADoc);
      Result          :=  True;
    except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;

  end
  else
  begin
    Try
      Result := FDAO.Update(ADoc);
    except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;
  end;
end;

end.
