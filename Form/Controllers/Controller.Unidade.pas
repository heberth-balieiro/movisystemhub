unit Controller.Unidade;

interface

uses
  Model.Unidade,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao.Unidade;

type
  TUnidadeController = class
  private
    FDAO: TDAOOperacao<TModelUnidade>;
  public
    constructor Create;
    destructor Destroy; override;
    function ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TModelUnidade>;
    function BuscarPorID(AID: Integer): TModelUnidade;
    function Salvar(ADoc: TModelUnidade; out RetornoID:integer): Boolean;
    function Excluir(AID: Integer): Boolean;
    function ExcluidoCancelado(AID, AIDUser: Integer):boolean;
  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TCFOPController }

function TUnidadeController.BuscarPorID(AID: Integer): TModelUnidade;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TUnidadeController.Create;
begin
  FDAO := TDAOOperacao<TModelUnidade>.Create(dm.Conn);
end;

destructor TUnidadeController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TUnidadeController.ExcluidoCancelado(AID, AIDUser: Integer): boolean;
var
Dao :TDaoUnidade;
begin
  Result  := false;
  Dao     := TDaoUnidade.Create;

  try
    if Dao.Delete(AID, AIDUser) then
    result  := True;
  finally
    Dao.Free;
  end;

end;

function TUnidadeController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TUnidadeController.ListarTodos(const FiltroCampo,
  FiltroStatus: string): TObjectList<TModelUnidade>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := 'Select id_unidade, codigo, uni, unidade, case when ativo=''S'' then ''Ativo'' else ''Inativo'' end as ativo from Unidade where excluido=0';

  if FiltroCampo.Trim <> '' then
  begin
    SQL := SQL + ' AND (uni LIKE :filtro or unidade like :filtro or codigo = :filtro)';
    Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
  end;

  if FiltroStatus.Trim <> '' then
  begin
    SQL := SQL + ' AND ativo = :ativo';
    if FiltroStatus='Ativo' then
    Params := Params + [TPair<string, Variant>.Create('ativo', 'S')];
    if FiltroStatus='Inativo' then
    Params := Params + [TPair<string, Variant>.Create('ativo', 'N')];
  end;

  SQLORDER  := ' order by codigo, unidade';

  Result := FDAO.FindWhere(SQL + SQLORDER, Params);
end;

function TUnidadeController.Salvar(ADoc: TModelUnidade; out RetornoID: integer): Boolean;
begin
  Result          :=  False;

   if ADoc.id_unidade = 0 then
  begin
    ADoc.Codigo       := FDao.GetNextCode('codigo');
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
