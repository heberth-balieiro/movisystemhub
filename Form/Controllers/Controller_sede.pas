unit Controller_Sede;

interface

uses
  Model.Sede,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao_Sede;

type
  TSedeController = class
  private
    FDAO: TDAOOperacao<TSede>;
  public
    constructor Create;
    destructor Destroy; override;
    function ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TSede>;
    function BuscarPorID(AID: Integer): TSede;
    function Salvar(ADoc: TSede; out RetornoID:integer): Boolean;
    function Excluir(AID: Integer): Boolean;
    function ExcluidoCancelado(AID, AIDUser: Integer):boolean;
    function RegistraSede(ADoc: TSede; out RetornoID:integer):Boolean;
  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TSedeController }
function TSedeController.BuscarPorID(AID: Integer): TSede;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;
constructor TSedeController.Create;
begin
  FDAO := TDAOOperacao<TSede>.Create(dm.Conn);
end;
destructor TSedeController.Destroy;
begin
  FDAO.Free;
  inherited;
end;
function TSedeController.ExcluidoCancelado(AID, AIDUser: Integer): boolean;
var
Dao :TDaoSede;
begin
  Result  := false;
  Dao     := TDaoSede.Create;
  try
    if Dao.Delete(AID, AIDUser) then
    result  := True;
  finally
    Dao.Free;
  end;
end;

function TSedeController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TSedeController.ListarTodos(const FiltroCampo,
  FiltroStatus: string): TObjectList<TSede>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := 'Select s.id_sede, s.razao, s.fantasia, s.cnpj, s.telefone, s.celular, c.cidade as ncidade, s.sedeprincipal'+
           ' from Sede s                                                                 '+
           ' Inner Join cidade c                                                         '+
           ' on s.id_cidade=c.ID_CIDADE';

  if FiltroCampo.Trim <> '' then
  begin
    SQL := SQL + ' AND (s.razao LIKE :filtro or s.fantasia like :filtro or s.cnpj like :filtro)';
    Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
  end;

  SQLORDER  := ' order by s.razao';

  Result := FDAO.FindWhere(SQL + SQLORDER, Params);
end;

function TSedeController.RegistraSede(ADoc: TSede;
  out RetornoID: integer): Boolean;
begin
  Result          :=  False;
  if ADoc.id_sede = 0 then
  begin
    ADoc.datacadastro    := Now;
    Try
      RetornoID       :=  FDAO.Insert(ADoc);
      Result          :=  True;
    except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;
  end;
end;

function TSedeController.Salvar(ADoc: TSede; out RetornoID: integer): Boolean;
begin
  Result          :=  False;
   if ADoc.id_sede = 0 then
  begin
    ADoc.datacadastro     := Now;
    Try
      RetornoID           :=  FDAO.Insert(ADoc);
      Result              :=  True;
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
