unit Controller.Autorizacao;

interface
uses
  Model.Autorizacao,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao.Autorizacao;
type
  TAutorizacaoController = class
  private
    FDAO: TDAOOperacao<TModelautorizacao>;
  public
    constructor Create;
    destructor Destroy; override;
    function ListarTodos(const FiltroCampo, FiltroStatus: string; FiltroDate1, FiltroDate2: TDate): TObjectList<TModelAutorizacao>;
    function BuscarPorID(AID: Integer): TModelAutorizacao;
    function Salvar(ADoc: TModelAutorizacao; out RetornoID: integer): Boolean;
    function Excluir(AID: Integer): Boolean;
    function ExcluidoCancelado(AID, AIDUser: Integer):boolean;
    function IncluiRegistroSincronizar: boolean;
  end;

implementation
uses UDM, cxDateUtils, System.Variants;
{ TAutorizacaoController }
function TAutorizacaoController.BuscarPorID(AID: Integer): TModelAutorizacao;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;
constructor TAutorizacaoController.Create;
begin
  FDAO := TDAOOperacao<TModelAutorizacao>.Create(dm.Conn);
end;
destructor TAutorizacaoController.Destroy;
begin
  FDAO.Free;
  inherited;
end;
function TAutorizacaoController.ExcluidoCancelado(AID, AIDUser: Integer): boolean;
var
Dao :TDaoAutorizacao;
begin
  Result  := false;
  Dao     := TDaoAutorizacao.Create;
  try
    if Dao.Delete(AID, AIDUser) then
    result  := True;
  finally
    Dao.Free;
  end;
end;
function TAutorizacaoController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TAutorizacaoController.IncluiRegistroSincronizar: boolean;
var
Dao :TDaoAutorizacao;
begin
  Result  := false;
  Dao     := TDaoAutorizacao.Create;
  try
    if Dao.IncluiRegistroSincronizar then
    result  := True;
  finally
    Dao.Free;
  end;
end;

function TAutorizacaoController.ListarTodos(const FiltroCampo, FiltroStatus: string; FiltroDate1, FiltroDate2: TDate): TObjectList<TModelAutorizacao>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   :=  ' Select                                                            '+
            ' id_autorizacao,                                                   '+
            ' data,                                                             '+
            ' nome,                                                             '+
            ' qtde_pessoa as qtdepessoa,'+
            ' obs,                                                              '+
            ' pessoa_autorizou as pessoaautorizou,                               '+
            ' Case                                                              '+
            ' when status=''S'' then ''Sim'' else ''Não'' end as enviarapp,     '+
            ' Case                                                              '+
            ' when sinc_app=''S'' then ''Sincronizado'' else ''Não Sincronizado'' end as sinc_app '+
            ' From autorizacao where excluido=0';
  if FiltroCampo.Trim <> '' then
  begin
    SQL := SQL + ' AND (nome LIKE :filtro or pessoa_autorizou LIKE :filtro)';
    Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
  end;
  if FiltroStatus.Trim <> '' then
  begin
    SQL := SQL + ' AND status = :status';
    Params := Params + [TPair<string, Variant>.Create('status', FiltroStatus)];
  end;
  Sql := Sql + ' AND data BETWEEN :x and :y';
  Params := Params + [TPair<string, Variant>.Create('x', VarFromDateTime(FiltroDate1))];
  Params := Params + [TPair<string, Variant>.Create('y', VarFromDateTime(FiltroDate2))];

  SQLORDER  := ' order by data';
  Result := FDAO.FindWhere(SQL + SQLORDER, Params);
end;

function TAutorizacaoController.Salvar(ADoc: TModelAutorizacao; out RetornoID: integer): Boolean;
begin
  Result          :=  False;
  if ADoc.id_autorizacao = 0 then
  begin
    Adoc.excluido     := 0;
    Try
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
