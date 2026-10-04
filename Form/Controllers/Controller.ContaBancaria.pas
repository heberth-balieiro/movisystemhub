unit Controller.ContaBancaria;

interface

uses
  Model.ContasBancaria,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao.ContaBancaria;

type
  TContaController = class
  private
    FDAO: TDAOOperacao<TContas>;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TContas>;
    function BuscarPorID(AID: Integer): TContas;
    function Salvar(ADoc: TContas; out RetornoID:integer): Boolean;
    function Excluir(AID: Integer): Boolean;
    function ExcluidoCancelado(AID: Integer):boolean;
  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TContaController }

function TContaController.BuscarPorID(AID: Integer): TContas;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TContaController.Create;
begin
  FDAO := TDAOOperacao<TContas>.Create(dm.Conn);
end;

destructor TContaController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TContaController.ExcluidoCancelado(AID: Integer): boolean;
var
Dao :TDaoContasBancaria;
begin
  Result  := false;
  Dao     := TDaoContasBancaria.Create;

  try
    if Dao.Delete(AID) then
    result  := True;
  finally
    Dao.Free;
  end;

end;

function TContaController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TContaController.ListarTodos(const FiltroCampo,
  FiltroStatus: string): TObjectList<TContas>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := 'Select id_conta, codigo, banco, agencia, conta, correntista, ativo from contas where excluido=0';

  if FiltroCampo.Trim <> '' then
  begin
    SQL := SQL + ' AND (banco LIKE :filtro or conta LIKE :filtro or agencia like :filtro or correntista like :filtro or codigo = :filtro)';
    Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
  end;

  if FiltroStatus.Trim <> '' then
  begin
    SQL := SQL + ' AND ativo = :ativo';
    Params := Params + [TPair<string, Variant>.Create('ativo', FiltroStatus)];
  end;

  SQLORDER  := ' order by conta';

  Result := FDAO.FindWhere(SQL + SQLORDER, Params);
end;

function TContaController.Salvar(ADoc: TContas; out RetornoID: integer): Boolean;
begin
  Result          :=  False;

   if ADoc.id_conta = 0 then
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
      ADoc.dataalteracao   := Now;

      Result := FDAO.Update(ADoc);
    except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;
  end;
end;

end.
