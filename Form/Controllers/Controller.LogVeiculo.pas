unit Controller.LogVeiculo;

interface

uses
  Model.LogVeiculo,
  Dao.Operacoes,
  System.SysUtils, System.Generics.Collections;

type
  TLogVeiculoController = class
  private
    FDAO: TDAOOperacao<TLogVeiculo>;
    function InteirosParaString(const Lista: TArray<Integer>): string;

  public
    constructor Create;
    destructor Destroy; override;

    //function ListarTodos(const FiltroStatus, FiltroTipo, FiltroCampo: string): TObjectList<TLogVeiculo>;
    //function BuscarPorID(AID, AIDs: Integer): TObjectList<TLogVeiculo>;// buscar por idcompra e idveiculo
    //function BuscarPorIDOBJ(AID: Integer): TObjectList<TLogVeiculo>; //buscar dados id do objeto exemplo id_veiculo
    function Salvar(ADoc: TLogVeiculo): Boolean;
    //function Excluir(AID: Integer): Boolean;
  end;

implementation

uses UDM, cxDateUtils, REST.Json;

{ TLogVeiculoController }

constructor TLogVeiculoController.Create;
begin
  FDAO := TDAOOperacao<TLogVeiculo>.Create(dm.Conn);
end;

destructor TLogVeiculoController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TLogVeiculoController.InteirosParaString(
  const Lista: TArray<Integer>): string;
var
  StrList: TArray<string>;
  I: Integer;
begin
  SetLength(StrList, Length(Lista));
  for I := 0 to High(Lista) do
    StrList[I] := Lista[I].ToString;

  Result := String.Join(',', StrList);
end;

function TLogVeiculoController.Salvar(ADoc: TLogVeiculo): Boolean;
begin
  Result          :=  False;

  if ADoc.Id = 0 then
  begin
    Try
      Adoc.nData      := Now;
      Adoc.nhora      := Now;
      FDAO.Insert(ADoc);
      Result          :=  True;
    except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;

  end
  else
  begin
    Result := FDAO.Update(ADoc);
  end;
end;

end.
