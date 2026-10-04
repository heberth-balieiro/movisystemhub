unit Controller.Receber.PlanoContas;

interface

uses
  Model.Receber.PlanoContas,
  Dao.Operacoes,
  System.SysUtils, System.Generics.Collections;

type
  TReceberPlanoContasController = class
  private
    FDAO: TDAOOperacao<TReceberPlano>;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarTodos(const FiltroDescricao: string; const FiltroAtivo: string): TObjectList<TReceberPlano>;
    function BuscarPorID(AID: Integer): TReceberPlano;
    function Salvar(ADoc: TReceberPlano; out RetornoID:integer): Boolean;
    function Excluir(AID: Integer): Boolean;

  end;


implementation

uses UDM, cxDateUtils;

{ TReceberPlanoContasController }

function TReceberPlanoContasController.BuscarPorID(AID: Integer): TReceberPlano;
begin

end;

constructor TReceberPlanoContasController.Create;
begin
  FDAO := TDAOOperacao<TReceberPlano>.Create(dm.Conn);
end;

destructor TReceberPlanoContasController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TReceberPlanoContasController.Excluir(AID: Integer): Boolean;
begin

end;

function TReceberPlanoContasController.ListarTodos(const FiltroDescricao,
  FiltroAtivo: string): TObjectList<TReceberPlano>;
begin

end;

function TReceberPlanoContasController.Salvar(ADoc: TReceberPlano;
  out RetornoID: integer): Boolean;
begin
  Result          :=  False;

   if ADoc.id_receber_plano = 0 then
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
