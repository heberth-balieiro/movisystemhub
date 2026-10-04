unit Controller_Secretaria;

interface
uses
  Model.Secretaria,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao_Secretaria;

type
  TSecretariaController = class
  private
    FDAO: TDAOOperacao<TSecretaria>;

  public
    constructor Create;
    destructor Destroy; override;

    function ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TSecretaria>;
    function BuscarPorID(AID: Integer): TSecretaria;
    function Salvar(ADoc: TSecretaria; out RetornoID:integer): Boolean;
    function Excluir(AID: Integer): Boolean;
    function ExcluidoCancelado(AID, AIDUser: Integer):boolean;
    function IncluiRegistroSincronizar: boolean;
  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TSecretariaController }

function TSecretariaController.BuscarPorID(AID: Integer): TSecretaria;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TSecretariaController.Create;
begin
  FDAO := TDAOOperacao<TSecretaria>.Create(dm.Conn);
end;

destructor TSecretariaController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TSecretariaController.ExcluidoCancelado(AID, AIDUser: Integer): boolean;
var
Dao :TDaoSecretaria;
begin
  Result  := false;
  Dao     := TDaoSecretaria.Create;

  try
    if Dao.Delete(AID, AIDUser) then
    result  := True;
  finally
    Dao.Free;
  end;

end;

function TSecretariaController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TSecretariaController.ListarTodos(const FiltroCampo,
  FiltroStatus: string): TObjectList<TSecretaria>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := 'Select id_secretaria, codigo, razao,fantasia, case when ativo= ''S'' then ''Ativo'' else ''Inativo'' end as ativo From secretaria where excluido = 0';
  SQLORDER  := ' order by razao';

  Result := FDAO.FindWhere(SQL + SQLORDER, Params);
end;

function TSecretariaController.Salvar(ADoc: TSecretaria; out RetornoID: integer): Boolean;
begin
  Result          :=  False;

   if ADoc.id_secretaria = 0 then
  begin
    ADoc.Codigo       := FDao.GetNextCode('codigo');
    Adoc.excluido     := 0;

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

function TSecretariaController.IncluiRegistroSincronizar: boolean;
var
Dao :TDaoSecretaria;
begin
  Result  := false;
  Dao     := TDaoSecretaria.Create;
  try
    if Dao.IncluiRegistroSincronizar then
    result  := True;
  finally
    Dao.Free;
  end;
end;

end.
