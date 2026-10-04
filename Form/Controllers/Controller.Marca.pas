unit Controller.Marca;

interface

uses
  Model.Marca,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao.Marca;
type
  TMarcaController = class
  private
    FDAO: TDAOOperacao<TModelMarca>;
  public
    constructor Create;
    destructor Destroy; override;
    function ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TModelMarca>;
    function BuscarPorID(AID: Integer): TModelMarca;
    function Salvar(ADoc: TModelMarca; out RetornoID:integer): Boolean;
    function Excluir(AID: Integer): Boolean;
    function ExcluidoCancelado(AID, AIDUser: Integer):boolean;
  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TMarcaController }

function TMarcaController.BuscarPorID(AID: Integer): TModelMarca;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TMarcaController.Create;
begin
  FDAO := TDAOOperacao<TModelMarca>.Create(dm.Conn);
end;

destructor TMarcaController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TMarcaController.ExcluidoCancelado(AID, AIDUser: Integer): boolean;
var
Dao :TDaoMarca;
begin
  Result  := false;
  Dao     := TDaoMarca.Create;

  try
    if Dao.Delete(AID,AIDUser) then
    result  := True;
  finally
    Dao.Free;
  end;

end;

function TMarcaController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TMarcaController.ListarTodos(const FiltroCampo,
  FiltroStatus: string): TObjectList<TModelMarca>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := 'Select id_marca, codigo, marca, case when ativo=''S'' then ''Ativo'' else ''Inativo'' end as ativo  '+
	         'from marca where excluido=0 and tipo=''M'' ';

  if FiltroCampo.Trim <> '' then
  begin
    SQL := SQL + ' AND (marca LIKE :filtro or codigo = :filtro)';
    Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
  end;

  if FiltroStatus.Trim <> '' then
  begin
    SQL := SQL + ' AND ativo = :ativo';
    Params := Params + [TPair<string, Variant>.Create('ativo', FiltroStatus)];
  end;

  SQLORDER  := ' order by marca';

  Result := FDAO.FindWhere(SQL + SQLORDER, Params);
end;

function TMarcaController.Salvar(ADoc: TModelMarca; out RetornoID: integer): Boolean;
begin
  Result          :=  False;

   if ADoc.id_Marca = 0 then
  begin
    ADoc.Codigo       := FDao.GetNextCode('codigo');
    Adoc.Data_Cadastro:= Now;
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
      ADoc.data_alteracao   := Now;

      Result := FDAO.Update(ADoc);
    except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;
  end;
end;

end.
