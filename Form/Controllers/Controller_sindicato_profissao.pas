unit Controller_Sindicato_profissao;

interface
uses
  Model.Sindicato_profissao,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao_Sindicato_profissao;

type
  TSindicato_profissaoController = class
  private
    FDAO: TDAOOperacao<TSindicato_Profissao>;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TSindicato_Profissao>;
    function BuscarPorID(AID: Integer): TSindicato_Profissao;
    function Salvar(ADoc: TSindicato_Profissao; out RetornoID:integer): Boolean;
    function Excluir(AID: Integer): Boolean;
    function ExcluidoCancelado(AID, AIDUser: Integer):boolean;
    function IncluiRegistroSincronizar: boolean;
  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TSindicato_profissaoController }

function TSindicato_profissaoController.BuscarPorID(AID: Integer): TSindicato_Profissao;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TSindicato_profissaoController.Create;
begin
  FDAO := TDAOOperacao<TSindicato_Profissao>.Create(dm.Conn);
end;

destructor TSindicato_profissaoController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TSindicato_profissaoController.ExcluidoCancelado(AID, AIDUser: Integer): boolean;
var
Dao :TDaoSindicato_profissao;
begin
  Result  := false;
  Dao     := TDaoSindicato_profissao.Create;

  try
    if Dao.Delete(AID, AIDUser) then
    result  := True;
  finally
    Dao.Free;
  end;

end;

function TSindicato_profissaoController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TSindicato_profissaoController.IncluiRegistroSincronizar: boolean;
var
Dao :TDaoSindicato_profissao;
begin
  Result  := false;
  Dao     := TDaoSindicato_profissao.Create;
  try
    if Dao.IncluiRegistroSincronizar then
    result  := True;
  finally
    Dao.Free;
  end;
end;

function TSindicato_profissaoController.ListarTodos(const FiltroCampo,
  FiltroStatus: string): TObjectList<TSindicato_Profissao>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := 'Select id_profissao, codigo, descricao, '+
            'case when ativo=''S'' then ''Ativo'' else ''Inativo'' end as ativo'+
            ' From sindicato_profissao where excluido = 0';
  SQLORDER  := ' order by descricao';

  Result := FDAO.FindWhere(SQL + SQLORDER, Params);
end;

function TSindicato_profissaoController.Salvar(ADoc: TSindicato_Profissao; out RetornoID: integer): Boolean;
begin
  Result          :=  False;

   if ADoc.id_profissao = 0 then
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
