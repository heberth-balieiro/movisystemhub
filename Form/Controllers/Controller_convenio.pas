unit Controller_Convenio;
interface
uses
  Model.Convenio,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao_Convenio;
type
  TConvenioController = class
  private
    FDAO: TDAOOperacao<TConvenio>;
  public
    constructor Create;
    destructor Destroy; override;
    function ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TConvenio>;
    function BuscarPorID(AID: Integer): TConvenio;
    function Salvar(ADoc: TConvenio; out RetornoID, RetornoCod:integer): Boolean;
    function Excluir(AID: Integer): Boolean;
    function ExcluidoCancelado(AID, AIDUser: Integer):boolean;
    function IncluiRegistroSincronizar: boolean;

  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TConvenioController }
function TConvenioController.BuscarPorID(AID: Integer): TConvenio;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;
constructor TConvenioController.Create;
begin
  FDAO := TDAOOperacao<TConvenio>.Create(dm.Conn);
end;
destructor TConvenioController.Destroy;
begin
  FDAO.Free;
  inherited;
end;
function TConvenioController.ExcluidoCancelado(AID, AIDUser: Integer): boolean;
var
Dao :TDaoConvenio;
begin
  Result  := false;
  Dao     := TDaoConvenio.Create;
  try
    if Dao.Delete(AID, AIDUser) then
    result  := True;
  finally
    Dao.Free;
  end;
end;
function TConvenioController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;
function TConvenioController.IncluiRegistroSincronizar: boolean;
var
Dao :TDaoConvenio;
begin
  Result  := false;
  Dao     := TDaoConvenio.Create;
  try
    if Dao.IncluiRegistroSincronizar then
    result  := True;
  finally
    Dao.Free;
  end;
end;

function TConvenioController.ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TConvenio>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   :=  'Select             '+
            ' o.id_convenio,      '+
            ' o.codigo,           '+
            ' o.cpf,              '+
            ' o.nome,             '+
            ' o.apelido,          '+
            ' c.cidade as ncidade,'+
            ' o.telefone,         '+
            ' o.celular,          '+
            ' o.celular1,         '+
            ' Case when o.ativo = ''S'' then ''Ativo'' else ''Inativo'' end as ativo '+
            ' From convenio o     '+
            ' Inner join cidade c '+
            ' on o.id_cidade = c.id_cidade'+
            ' where o.excluido = 0';
  if FiltroCampo.Trim <> '' then
  begin
    SQL := SQL + ' AND (o.nome LIKE :filtro or o.cpf LIKE :Filtro or o.apelido LIKE :Filtro or o.codigo = :filtro)';
    Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
  end;
  if FiltroStatus.Trim <> '' then
  begin
    SQL := SQL + ' AND o.ativo = :ativo';
    Params := Params + [TPair<string, Variant>.Create('ativo', FiltroStatus)];
  end;
  SQLORDER  := ' order by o.nome';
  Result := FDAO.FindWhere(SQL + SQLORDER, Params);
end;
function TConvenioController.Salvar(ADoc: TConvenio; out RetornoID, RetornoCod: integer): Boolean;
begin
  Result          :=  False;
  if ADoc.id_convenio = 0 then
  begin
    ADoc.Codigo       := FDao.GetNextCode('codigo');
    ADoc.datacriacao  := Now;
    Adoc.excluido     := 0;
    Try
      RetornoCod      := ADoc.codigo;
      RetornoID       := FDAO.Insert(ADoc);
      Result          := True;
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
