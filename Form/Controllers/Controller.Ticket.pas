unit Controller.Ticket;

interface

uses
  Model.Ticket,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao.Ticket;

type
  TTicketController = class
  private
    FDAO: TDAOOperacao<TTicket>;
  public
    constructor Create;
    destructor Destroy; override;

    Function ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<Tticket>;
    Function BuscarPorID(AID: Integer): TTicket;
    Function Salvar(ADoc: TTicket; out RetornoID,RetornoCodigo:integer): Boolean;
    Function Excluir(AID: Integer): Boolean;
    Function ExcluidoCancelado(AID, AIDUser: Integer):boolean;
    Function ImpressaoTicket(AID, IDAssociado: integer): Boolean;

  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TTicketController }

function TTicketController.BuscarPorID(AID: Integer): TTicket;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TTicketController.Create;
begin
  FDAO := TDAOOperacao<TTicket>.Create(dm.Conn);
end;

destructor TTicketController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TTicketController.ExcluidoCancelado(AID, AIDUser: Integer): boolean;
var
Dao :TDaoTicket;
begin
  Result  := false;
  Dao     := TDaoTicket.Create;
  try
    if Dao.Delete(AID, AIDUser) then
    result  := True;
  finally
    Dao.Free;
  end;
end;

function TTicketController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TTicketController.ImpressaoTicket(AID, IDAssociado: integer): Boolean;
var
Dao :TDaoTicket;
begin
  Result  := false;
  Dao     := TDaoTicket.Create;
  try
    if Dao.ImpressaoTicket(AID, IDAssociado) then
    result  := True;
  finally
    Dao.Free;
  end;
end;

function TTicketController.ListarTodos(const FiltroCampo,
  FiltroStatus: string): TObjectList<Tticket>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := 'Select s.id_sede, s.razao, s.fantasia, s.cnpj, s.telefone, s.celular, c.cidade as ncidade, s.sedeprincipal'+
           ' from Sede s                                                                 '+
           ' Inner Join cidade c                                                         '+
           ' on s.id_cidade=c.ID_CIDADE';

  if FiltroCampo.Trim <> '' then
  begin
    SQL := SQL + ' AND (s.razao LIKE :filtro or s.fantasia like :filtro or s.cnpj like :filtro)';
    Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
  end;

  SQLORDER  := ' order by s.razao';

  Result := FDAO.FindWhere(SQL + SQLORDER, Params);
end;

function TTicketController.Salvar(ADoc: TTicket;
  out RetornoID,RetornoCodigo: integer): Boolean;
begin
  Result          :=  False;
  if ADoc.idticket = 0 then
  begin
    Try
      ADoc.codigo         :=  FDao.GetNextCode('codigo');
      Adoc.codigolote     :=  FDao.GetNextCode('codigolote');
      RetornoCodigo       :=  Adoc.codigo;
      RetornoID           :=  FDAO.Insert(ADoc);
      Result              :=  True;
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
