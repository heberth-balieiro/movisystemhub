unit Controller_Sindicato_Empresa;

interface
uses
  Model.Sindicato_Empresa,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao_Sindicato_Empresa;

type
  TSindicato_EmpresaController = class
  private
    FDAO: TDAOOperacao<TSindicato_Empresa>;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TSindicato_Empresa>;
    function BuscarPorID(AID: Integer): TSindicato_Empresa;
    function Salvar(ADoc: TSindicato_Empresa; out RetornoID:integer): Boolean;
    function Excluir(AID: Integer): Boolean;
    function ExcluidoCancelado(AID, AIDUser: Integer):boolean;
  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TSindicato_EmpresaController }

function TSindicato_EmpresaController.BuscarPorID(AID: Integer): TSindicato_Empresa;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TSindicato_EmpresaController.Create;
begin
  FDAO := TDAOOperacao<TSindicato_Empresa>.Create(dm.Conn);
end;

destructor TSindicato_EmpresaController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TSindicato_EmpresaController.ExcluidoCancelado(AID, AIDUser: Integer): boolean;
var
Dao :TDaoSindicato_Empresa;
begin
  Result  := false;
  Dao     := TDaoSindicato_Empresa.Create;

  try
    if Dao.Delete(AID, AIDUser) then
    result  := True;
  finally
    Dao.Free;
  end;

end;

function TSindicato_EmpresaController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TSindicato_EmpresaController.ListarTodos(const FiltroCampo,
  FiltroStatus: string): TObjectList<TSindicato_Empresa>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := 'Select                                                                   '+
            ' e.sind_id_empresa, e.codigo,                                                              '+
            ' e.descricao,                                                           '+
            ' case when e.ativo = ''S'' then ''Ativo'' else ''Inativo'' end as ativo,'+
            ' s.razao as vrazao                                                      '+
            ' From                                                                   '+
            ' sindicato_empresa e                                                    '+
            ' inner join sede s                                                      '+
            ' on e.id_sede= s.id_sede';
  SQLORDER  := ' order by e.descricao';

  Result := FDAO.FindWhere(SQL + SQLORDER, Params);
end;

function TSindicato_EmpresaController.Salvar(ADoc: TSindicato_Empresa; out RetornoID: integer): Boolean;
begin
  Result          :=  False;

   if ADoc.sind_id_empresa = 0 then
  begin
    ADoc.Codigo       := FDao.GetNextCode('codigo');
    ADoc.datacadastro := Now;

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
