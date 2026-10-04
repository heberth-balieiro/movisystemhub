unit Controller.Transportadora;

interface

uses
  Model.Transportadora,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao.Transportadora;

type
  TTransportadoraController = class
  private
    FDAO: TDAOOperacao<TModelTransportadora>;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TModelTransportadora>;
    function BuscarPorID(AID: Integer): TModelTransportadora;
    function Salvar(ADoc: TModelTransportadora; out RetornoID:integer): Boolean;
    function Excluir(AID: Integer): Boolean;
    function ExcluidoCancelado(const AID, AIDUser: Integer):boolean;

  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TTransportadoraController }

function TTransportadoraController.BuscarPorID(AID: Integer): TModelTransportadora;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TTransportadoraController.Create;
begin
  FDAO := TDAOOperacao<TModelTransportadora>.Create(dm.Conn);
end;

destructor TTransportadoraController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TTransportadoraController.ExcluidoCancelado(const AID, AIDUser: Integer): boolean;
var
Dao :TDaoTransportadora;
begin
  Result  := false;
  Dao     := TDaoTransportadora.Create;

  try
    if Dao.Delete(AID,AIDUser) then
    result  := True;
  finally
    Dao.Free;
  end;

end;

function TTransportadoraController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TTransportadoraController.ListarTodos(const FiltroCampo,
  FiltroStatus: string): TObjectList<TModelTransportadora>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := 'SELECT t.id_transportadora,t.codigo,t.cnpj,t.razao,t.fantasia,t.ie,t.antt,t.email,t.telefone,'+
            ' case when t.ativo=''S'' then ''Ativo'' else ''Inativo'' end as ativo,                            '+
            ' Concat(c.cidade,''/'',c.uf) as nmcidade                                                      '+
            ' FROM transportadora t                                                                      '+
            ' Inner Join cidade c                                                                        '+
            ' on t.id_cidade = c.id_cidade where t.excluido=0 ';

  if FiltroCampo.Trim <> '' then
  begin
    SQL := SQL + ' AND (t.razao LIKE :filtro or t.fantasia like :filtro or t.cnpj like :filtro or t.telefone = :filtro)';
    Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
  end;

  if FiltroStatus.Trim <> '' then
  begin
    SQL := SQL + ' AND t.ativo = :ativo';
    Params := Params + [TPair<string, Variant>.Create('ativo', FiltroStatus)];
  end;

  SQLORDER  := ' order by t.id_transportadora, t.razao';

  Result := FDAO.FindWhere(SQL + SQLORDER, Params);
end;

function TTransportadoraController.Salvar(ADoc: TModelTransportadora; out RetornoID: integer): Boolean;
begin
  Result          :=  False;

   if ADoc.id_transportadora = 0 then
  begin
    ADoc.Codigo       := FDao.GetNextCode('codigo');
    Adoc.excluido     := 0;
    Adoc.datacriacao  := now;
    if adoc.ativo='' then
    Adoc.ativo        := 'S';

    if (adoc.ativo = 'Ativo') or (adoc.ativo = 'ATIVO') then
    Adoc.ativo := 'S'
    else
    adoc.ativo := 'N';

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
