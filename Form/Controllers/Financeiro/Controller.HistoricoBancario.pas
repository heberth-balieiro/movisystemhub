unit Controller.HistoricoBancario;

interface

uses
  Model.HistoricoBancario,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao.HistoricoBancario;
type
  THistoricoBancarioController = class
  private

  public

    class function ListarTodos: TObjectList<THistoricoBancario>;
    class function BuscarPorID(AID: Integer): THistoricoBancario;
    class function Salvar(ADoc: THistoricoBancario; out RetornoID:integer; out AStr:String): Boolean;
    class function Excluir(const AIDRegistro: integer; const AIDUser: Integer; const AIDEmpresa:integer): Boolean;

  end;

implementation

{ THistoricoBancarioController }

uses UDM, cxDateUtils, System.Variants;

class function THistoricoBancarioController.BuscarPorID(AID: Integer): THistoricoBancario;
var
  FDAO: TDAOOperacao<THistoricoBancario>;
begin
  FDAO := TDAOOperacao<THistoricoBancario>.Create(dm.Conn);

  Try
    Try
      Result := FDAO.FindById(AID);
    except
      raise;
    end;
  Finally
    FDAO.Free;
  End;
end;

class function THistoricoBancarioController.Excluir(const AIDRegistro, AIDUser,AIDEmpresa: integer): Boolean;
var
  FDAO: TDAOOperacao<THistoricoBancario>;
begin
  Result  := False;
  FDAO    := TDAOOperacao<THistoricoBancario>.Create(dm.Conn);

  Try
    Try
      if not TDaoHistoricoBancario.ExisteVinculo(AIDEmpresa,AIDRegistro) then
      Result  := FDAO.Delete(AIDRegistro);
    except
      raise;
    End;
  Finally
    FDAO.Free;
  End;
end;

class function THistoricoBancarioController.ListarTodos: TObjectList<THistoricoBancario>;
var
  Sql, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
  FDAO: TDAOOperacao<THistoricoBancario>;
Const
  QryStr = 'Select id_historico, descricao,                                   '+
           ' case when tipo=0 then ''Receita''                                '+
           ' when tipo=1 then ''Despesa'' else ''Ambos'' end as ntipo,        '+
           ' case when ativo=''S'' then ''Ativo'' else ''Inativo'' end as ativo'+
           ' from historico_bancario where 1=1 ';
begin
  FDAO    := TDAOOperacao<THistoricoBancario>.Create(dm.Conn);

  Try
    SQLORDER  := ' order by descricao';

    Result := FDAO.FindWhere(QryStr + SQL + SQLORDER, Params);

  Finally
    FDAO.Free;
  End;
end;

class function THistoricoBancarioController.Salvar(ADoc: THistoricoBancario;
  out RetornoID: integer; out AStr: String): Boolean;
var
FDAO: TDAOOperacao<THistoricoBancario>;
begin
  Result    := False;
  FDAO      := TDAOOperacao<THistoricoBancario>.Create(dm.Conn);

  Try
    if ADoc.id_historico = 0 then
    begin
      Adoc.Data_Cadastro:= Now;
      Try
        if TDaoHistoricoBancario.ExisteNome(Adoc.descricao, ADoc.id_empresa) then
        begin
          AStr  :='Já existe um histórico com está descrição.';
          exit;
        end;
        RetornoID       :=  FDAO.Insert(ADoc);
        Result          :=  True;
      except
        begin
          raise;
        end;
      End;
    end
    else
    begin
      Try
        ADoc.data_alteracao   := Now;
        Result := FDAO.Update(ADoc);
      except
        begin
          raise
        end;
      End;
    end;
  Finally
    FDAO.Free;
  End;
end;

end.
