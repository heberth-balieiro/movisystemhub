unit Controller.Funcionario;

interface

uses
  Model.Funcionario,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao.Funcionario;

type
  TFuncionarioController = class
  private
    FDAO: TDAOOperacao<TModelFuncionario>;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TModelFuncionario>;
    function BuscarPorID(AID: Integer): TModelFuncionario;
    function Salvar(ADoc: TModelFuncionario; out RetornoID:integer): Boolean;
    function Excluir(AID: Integer): Boolean;
    function ExcluidoCancelado(AID: Integer):boolean;
  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TCFOPController }

function TFuncionarioController.BuscarPorID(AID: Integer): TModelFuncionario;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TFuncionarioController.Create;
begin
  FDAO := TDAOOperacao<TModelFuncionario>.Create(dm.Conn);
end;

destructor TFuncionarioController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TFuncionarioController.ExcluidoCancelado(AID: Integer): boolean;
var
Dao :TDaoFuncionario;
begin
  Result  := false;
  Dao     := TDaoFuncionario.Create;

  try
    if Dao.Delete(AID) then
    result  := True;
  finally
    Dao.Free;
  end;

end;

function TFuncionarioController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TFuncionarioController.ListarTodos(const FiltroCampo,
  FiltroStatus: string): TObjectList<TModelFuncionario>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := 'select                                                          '+
            ' f.id_funcionario,                                             '+
            ' f.codigo,                                                     '+
            ' f.nome,                                                       '+
            ' f.apelido,                                                    '+
            ' f.cpf,                                                        '+
            ' f.funcao,                                                     '+
            ' case                                                          '+
            ' when f.vendedor = ''S'' then ''Sim'' else ''Não'' end as vendedor,  '+
            ' c.CIDADE, f.ativo, f.whatsapp                                 '+
            ' From Funcionario f                                            '+
            ' Inner Join cidade c                                           '+
            ' on f.id_cidade=c.id_cidade                                    '+
            ' where id_funcionario >0';

  if FiltroCampo.Trim <> '' then
  begin
    SQL := SQL + ' AND (f.nome LIKE :filtro or f.apelido like :filtro or c.cidade like :filtro or f.codigo = :filtro)';
    Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
  end;

  if FiltroStatus.Trim <> '' then
  begin
    SQL := SQL + ' AND ativo = :ativo';
    Params := Params + [TPair<string, Variant>.Create('ativo', FiltroStatus)];
  end;

  SQLORDER  := ' order by nome;';

  Result := FDAO.FindWhere(SQL + SQLORDER, Params);
end;

function TFuncionarioController.Salvar(ADoc: TModelFuncionario; out RetornoID: integer): Boolean;
begin
  Result          :=  False;

   if ADoc.id_funcionario = 0 then
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
      //ADoc.data_alteracao   := Now;

      Result := FDAO.Update(ADoc);
    except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;
  end;
end;

end.
