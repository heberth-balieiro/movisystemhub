unit Controller.Cidade;

interface

uses
  Model.Cidade,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections;

type
  TCidadeController = class
  private
    FDAO: TDAOOperacao<TCidade>;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TCidade>;
    function BuscarPorID(AID: Integer): TCidade;
    function Salvar(ADoc: TCidade; out RetornoID:integer): Boolean;

  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TCidadeController }

function TCidadeController.BuscarPorID(AID: Integer): TCidade;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;

end;

constructor TCidadeController.Create;
begin
  FDAO := TDAOOperacao<TCidade>.Create(dm.Conn);
end;

destructor TCidadeController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TCidadeController.ListarTodos(const FiltroCampo,
  FiltroStatus: string): TObjectList<TCidade>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
  NSituacao:integer;
begin
  NSituacao := 0;

  SQL   := 'Select id_cidade, cidade, uf, inativo, cid_ibge from cidade where id_cidade > 0';

  if FiltroCampo.Trim <> '' then
  begin
    SQL := SQL + ' AND (cidade LIKE :filtro or uf like :filtro or cid_ibge = :filtro or id_cidade = :filtro)';
    Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
  end;

  if FiltroStatus.Trim <> '' then
  begin
    if Filtrostatus = 'S' then
    NSituacao := 0
    else
    NSituacao := 1;

    SQL := SQL + ' AND inativo = :inativo';
    Params := Params + [TPair<string, Variant>.Create('inativo', NSituacao)];
  end;

  SQLORDER  := ' order by cidade';

  Result := FDAO.FindWhere(SQL + SQLORDER, Params);
end;

function TCidadeController.Salvar(ADoc: TCidade; out RetornoID: integer): Boolean;
begin
  Result          :=  False;

   if ADoc.id_cidade = 0 then
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
