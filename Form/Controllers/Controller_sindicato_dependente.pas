unit Controller_Sindicato_Dependente;

interface
uses
  Model.Sindicato_Dependentes,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao_Sindicato_Dependentes;

type
  TSindicato_DependentesController = class
  private
    FDAO: TDAOOperacao<TSindicato_Dependentes>;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarTodos(const AID:Integer): TObjectList<TSindicato_Dependentes>;
    function BuscarPorID(AID: Integer): TSindicato_Dependentes;
    function Salvar(ADoc: TSindicato_Dependentes; out RetornoID:integer): Boolean;
    function Excluir(AID: Integer): Boolean;
    function ExcluidoCancelado(AID, AIDUser: Integer):boolean;
  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TSindicato_DependentesController }

function TSindicato_DependentesController.BuscarPorID(AID: Integer): TSindicato_Dependentes;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TSindicato_DependentesController.Create;
begin
  FDAO := TDAOOperacao<TSindicato_Dependentes>.Create(dm.Conn);
end;

destructor TSindicato_DependentesController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TSindicato_DependentesController.ExcluidoCancelado(AID, AIDUser: Integer): boolean;
var
Dao :TDaoSindicato_Dependentes;
begin
  Result  := false;
  Dao     := TDaoSindicato_Dependentes.Create;

  try
    if Dao.Delete(AID, AIDUser) then
    result  := True;
  finally
    Dao.Free;
  end;

end;

function TSindicato_DependentesController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TSindicato_DependentesController.ListarTodos(Const AID:integer): TObjectList<TSindicato_Dependentes>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := 'Select d.id_dependente, d.codigo, d.nome, d.cpf, d.parentesco, case when d.ativo= ''S'' then ''Sim'' else ''Não'' end as ativo,'+
            ' case when d.autorizado=''S'' then ''Sim'' else ''Não'' end as autorizado, d.id_socio, d.datacadastro, u.login as nmusuario '+
            ' From sindicato_dependente d    '+
            ' inner join usuario u           '+
            ' on d.id_usuario = u.id_usuario '+
            ' where d.excluido = 0 '+
            ' and d.id_socio= :idsocio '+
            ' order by d.nome';

  Params := [TPair<string, Variant>.Create('idsocio', AID)];

  Result := FDAO.FindWhere(SQL,Params);
end;

function TSindicato_DependentesController.Salvar(ADoc: TSindicato_Dependentes; out RetornoID: integer): Boolean;
begin
  Result          :=  False;

   if ADoc.id_dependente = 0 then
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
