{
14/09/2025 as 11:19 até 12:23
}

unit Controller.PrazoPag;

interface

uses
  Model.PrazoPag,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao.PrazoPag;

type
  TPrazoPagController = class
  private
    FDAO: TDAOOperacao<TModelPrazoPag>;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TModelPrazoPag>;
    function BuscarPorID(AID: Integer): TModelPrazoPag;
    function Salvar(ADoc: TModelPrazoPag; out RetornoID:integer): Boolean;
    function Excluir(AID: Integer): Boolean;
    function ExcluidoCancelado(AID, AIDUser: Integer):boolean;
  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TCFOPController }

function TPrazoPagController.BuscarPorID(AID: Integer): TModelPrazoPag;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TPrazoPagController.Create;
begin
  FDAO := TDAOOperacao<TModelPrazoPag>.Create(dm.Conn);
end;

destructor TPrazoPagController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TPrazoPagController.ExcluidoCancelado(AID, AIDUser: Integer): boolean;
var
Dao :TDaoPrazoPag;
begin
  Result  := false;
  Dao     := TDaoPrazoPag.Create;

  try
    if Dao.Delete(AID, AIDUser) then
    result  := True;
  finally
    Dao.Free;
  end;

end;

function TPrazoPagController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TPrazoPagController.ListarTodos(const FiltroCampo,
  FiltroStatus: string): TObjectList<TModelPrazoPag>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := 'Select id_prazo, codigo, case when tipo= ''C'' then ''Crédito'' else ''Débito'' end as tipo,  '+
		        ' descricao, case when ativo= ''S'' then ''Sim'' else ''Não'' end as ativo,                   '+
            ' pedido, sistema, exibirapp from prazopagamento where excluido =0';

  if FiltroCampo.Trim <> '' then
  begin
    SQL := SQL + ' AND (descricao LIKE :filtro or tipo like :filtro or codigo = :filtro)';
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

function TPrazoPagController.Salvar(ADoc: TModelPrazoPag; out RetornoID: integer): Boolean;
begin
  Result          :=  False;

   if ADoc.id_prazo = 0 then
  begin
    ADoc.Codigo       := FDao.GetNextCode('codigo');
    ADoc.sistema      := 'N';
    ADoc.excluido     := 0;
    ADoc.data_cadastro:= now;

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
      ADoc.data_alteracao  := Now;

      Result := FDAO.Update(ADoc);
    except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;
  end;
end;

end.
