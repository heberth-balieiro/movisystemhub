{
Tipo V - Veiculo
Tipo E - Equipamento
Tipo G - Grupo

}

unit Controller.Grupo;

interface
uses
  Model.Grupo,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao.Grupo;

type
  TGrupoController = class
  private
    FDAO: TDAOOperacao<TModelGrupo>;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TModelGrupo>;
    function BuscarPorID(AID: Integer): TModelGrupo;
    function Salvar(ADoc: TModelGrupo; out RetornoID:integer): Boolean;
    function Excluir(AID: Integer): Boolean;
    function ExcluidoCancelado(AID, AIDUser: Integer):boolean;
  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TLocalizacaoController }

function TGrupoController.BuscarPorID(AID: Integer): TModelGrupo;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TGrupoController.Create;
begin
  FDAO := TDAOOperacao<TModelGrupo>.Create(dm.Conn);
end;

destructor TGrupoController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TGrupoController.ExcluidoCancelado(AID, AIDUser: Integer): boolean;
var
Dao :TDaoGrupo;
begin
  Result  := false;
  Dao     := TDaoGrupo.Create;

  try
    if Dao.Delete(AID, AIDUser) then
    result  := True;
  finally
    Dao.Free;
  end;

end;

function TGrupoController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TGrupoController.ListarTodos(const FiltroCampo,
  FiltroStatus: string): TObjectList<TModelGrupo>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := 'Select id_grupo, codigo, grupo, case when ativo=''S'' then ''Ativo'' else ''Inativo'' end as ativo'+
            ' From grupo where excluido =0 and tipo=''G'' ';

  if FiltroCampo.Trim <> '' then
  begin
    SQL := SQL + ' AND (grupo LIKE :filtro or codigo = :filtro)';
    Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
  end;

  if FiltroStatus.Trim <> '' then
  begin
    SQL := SQL + ' AND ativo = :ativo';
    Params := Params + [TPair<string, Variant>.Create('ativo', FiltroStatus)];
  end;

  SQLORDER  := ' order by grupo';

  Result := FDAO.FindWhere(SQL + SQLORDER, Params);
end;

function TGrupoController.Salvar(ADoc: TModelGrupo; out RetornoID: integer): Boolean;
begin
  Result              :=  False;

   if ADoc.id_grupo   = 0 then
  begin
    ADoc.Codigo       := FDao.GetNextCode('codigo');
    ADoc.data_cadastro:= Now;
    Adoc.excluido     := 0;
    Adoc.placa_obrigatoria  := 'N';

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
