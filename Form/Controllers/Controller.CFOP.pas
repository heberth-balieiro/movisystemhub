unit Controller.CFOP;

interface

uses
  Model.CFOP,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao.CFop;

type
  TCFOPController = class
  private
    FDAO: TDAOOperacao<TCFOP>;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TCFOP>;
    function BuscarPorID(AID: Integer): TCFOP;
    function Salvar(ADoc: TCFOP; out RetornoID:integer): Boolean;
    function Excluir(AID: Integer): Boolean;
    function ExcluidoCancelado(AID: Integer):boolean;
  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TCFOPController }

function TCFOPController.BuscarPorID(AID: Integer): TCFOP;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TCFOPController.Create;
begin
  FDAO := TDAOOperacao<TCFOP>.Create(dm.Conn);
end;

destructor TCFOPController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TCFOPController.ExcluidoCancelado(AID: Integer): boolean;
var
Dao :TDaoCFOP;
begin
  Result  := false;
  Dao     := TDaoCFOP.Create;

  try
    if Dao.Delete(AID) then
    result  := True;
  finally
    Dao.Free;
  end;

end;

function TCFOPController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TCFOPController.ListarTodos(const FiltroCampo,
  FiltroStatus: string): TObjectList<TCFOP>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := 'Select id_cfop, codigo, cfop, natureza, operacao, tipo, ativo from cfop where excluido=0';

  if FiltroCampo.Trim <> '' then
  begin
    SQL := SQL + ' AND (natureza LIKE :filtro or operacao like :filtro or tipo like :filtro or codigo = :filtro)';
    Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
  end;

  if FiltroStatus.Trim <> '' then
  begin
    SQL := SQL + ' AND ativo = :ativo';
    Params := Params + [TPair<string, Variant>.Create('ativo', FiltroStatus)];
  end;

  SQLORDER  := ' order by natureza';

  Result := FDAO.FindWhere(SQL + SQLORDER, Params);
end;

function TCFOPController.Salvar(ADoc: TCFOP; out RetornoID: integer): Boolean;
begin
  Result          :=  False;

   if ADoc.id_cfop = 0 then
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
