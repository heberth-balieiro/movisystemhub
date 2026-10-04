unit Controller_Sindicato_Lotacao;

interface
uses
  Model.Sindicato_Lotacao,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao_Sindicato_Lotacao;

type
  TSindicato_LotacaoController = class
  private
    FDAO: TDAOOperacao<TSindicato_Lotacao>;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TSindicato_Lotacao>;
    function BuscarPorID(AID: Integer): TSindicato_Lotacao;
    function Salvar(ADoc: TSindicato_Lotacao; out RetornoID:integer): Boolean;
    function Excluir(AID: Integer): Boolean;
    function ExcluidoCancelado(AID, AIDUser: Integer):boolean;
    function IncluiRegistroSincronizar: boolean;
  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TSindicato_LotacaoController }

function TSindicato_LotacaoController.BuscarPorID(AID: Integer): TSindicato_Lotacao;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TSindicato_LotacaoController.Create;
begin
  FDAO := TDAOOperacao<TSindicato_Lotacao>.Create(dm.Conn);
end;

destructor TSindicato_LotacaoController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TSindicato_LotacaoController.ExcluidoCancelado(AID, AIDUser: Integer): boolean;
var
Dao :TDaoSindicato_Lotacao;
begin
  Result  := false;
  Dao     := TDaoSindicato_Lotacao.Create;

  try
    if Dao.Delete(AID, AIDUser) then
    result  := True;
  finally
    Dao.Free;
  end;

end;

function TSindicato_LotacaoController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TSindicato_LotacaoController.IncluiRegistroSincronizar: boolean;
var
Dao :TDaoSindicato_Lotacao;
begin
  Result  := false;
  Dao     := TDaoSindicato_Lotacao.Create;
  try
    if Dao.IncluiRegistroSincronizar then
    result  := True;
  finally
    Dao.Free;
  end;
end;

function TSindicato_LotacaoController.ListarTodos(const FiltroCampo,
  FiltroStatus: string): TObjectList<TSindicato_Lotacao>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := 'Select id_lotacao, codigo, descricao, ativo From sindicato_lotacao where excluido = 0';

  if FiltroCampo.Trim <> '' then
  begin
    SQL := SQL + ' AND (descricao LIKE :filtro or codigo = :filtro)';
    Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
  end;

  if FiltroStatus.Trim <> '' then
  begin
    SQL := SQL + ' AND ativo = :ativo';
    Params := Params + [TPair<string, Variant>.Create('ativo', FiltroStatus)];
  end;

  SQLORDER  := ' order by descricao';

  Result := FDAO.FindWhere(SQL + SQLORDER, Params);
end;

function TSindicato_LotacaoController.Salvar(ADoc: TSindicato_Lotacao; out RetornoID: integer): Boolean;
begin
  Result          :=  False;

   if ADoc.id_lotacao = 0 then
  begin
    ADoc.Codigo       := FDao.GetNextCode('codigo');
    ADoc.datacadastro    := Now;
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

end.
