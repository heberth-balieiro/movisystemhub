unit Controller.Departamento;

interface

uses
  Model.Departamento,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao.departamento;
type
  TDepartamentoController = class
  private

  public

    class function ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TDepartamento>;
    class function BuscarPorID(AID: Integer): TDepartamento;
    class function Salvar(ADoc: TDepartamento; out RetornoID:integer; out AStr:String): Boolean;
    class function Excluir(const AIDRegistro: integer; const AIDUser: Integer; const AIDEmpresa:integer): Boolean;

  end;

implementation

{ TDepartamentoController }

uses UDM, cxDateUtils, System.Variants;

class function TDepartamentoController.BuscarPorID(AID: Integer): TDepartamento;
var
  FDAO: TDAOOperacao<TDepartamento>;
begin
  FDAO := TDAOOperacao<TDepartamento>.Create(dm.Conn);

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

class function TDepartamentoController.Excluir(const AIDRegistro: integer; const AIDUser: Integer; const AIDEmpresa:integer): Boolean;
var
  FDAO: TDAOOperacao<TDepartamento>;
begin
  Result  := False;
  FDAO    := TDAOOperacao<TDepartamento>.Create(dm.Conn);

  Try
    Try

      if TDaoDepartamento.PossuiVinculo(AIDRegistro) then
      Result  := TDaoDepartamento.Delete(AIDRegistro, AIDUser, AIDEmpresa)
      else
      Result  := FDAO.Delete(AIDRegistro);

    except
      raise;
    End;
  Finally
    FDAO.Free;
  End;

end;

class function TDepartamentoController.ListarTodos(const FiltroCampo,FiltroStatus: string): TObjectList<TDepartamento>;
var
  Sql, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
  FDAO: TDAOOperacao<TDepartamento>;
Const
  QryStr = 'Select id_departamento, descricao, case when ativo=''S'' then ''Ativo'' else ''Inativo'' end as ativo'+
            ' from departamento where excluido=0 ';
begin
  FDAO    := TDAOOperacao<TDepartamento>.Create(dm.Conn);

  Try
    if FiltroCampo.Trim <> '' then
    begin
      SQL := SQL + ' and (descricao LIKE :filtro or id_departamento = :filtro)';
      Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
    end;

    if FiltroStatus.Trim <> '' then
    begin
      SQL := SQL + ' and ativo = :ativo';
      Params := Params + [TPair<string, Variant>.Create('ativo', FiltroStatus)];
    end;

    SQLORDER  := ' order by descricao';

    Result := FDAO.FindWhere(QryStr + SQL + SQLORDER, Params);

  Finally
    FDAO.Free;
  End;

end;

class function TDepartamentoController.Salvar(ADoc: TDepartamento; out RetornoID: integer; out AStr:String): Boolean;
var
FDAO: TDAOOperacao<TDepartamento>;
begin
  Result    := False;
  FDAO      := TDAOOperacao<TDepartamento>.Create(dm.Conn);

  Try
    if ADoc.id_departamento = 0 then
    begin
      Adoc.Data_Cadastro:= Now;
      Adoc.excluido     := 0;
      Try
        if TDaoDepartamento.ExisteNome(Adoc.descricao) then
        begin
          AStr  :='Já existe um departamento com está descrição.';
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

