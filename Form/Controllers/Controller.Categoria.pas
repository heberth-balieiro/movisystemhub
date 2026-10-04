unit Controller.Categoria;

interface

uses
  Model.Categoria,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao.Categoria;
type
  TCategoriaController = class
  private

  public

    class function ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TCategoria>;
    class function BuscarPorID(AID: Integer): TCategoria;
    class function Salvar(ADoc: TCategoria; out RetornoID:integer; out AStr:String): Boolean;
    class function Excluir(const AIDRegistro: integer; const AIDUser: Integer; const AIDEmpresa:integer): Boolean;

  end;

implementation

{ TCategoriaController }

uses UDM, cxDateUtils, System.Variants;

class function TCategoriaController.BuscarPorID(AID: Integer): TCategoria;
var
  FDAO: TDAOOperacao<TCategoria>;
begin
  FDAO := TDAOOperacao<TCategoria>.Create(dm.Conn);

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

class function TCategoriaController.Excluir(const AIDRegistro: integer; const AIDUser: Integer; const AIDEmpresa:integer): Boolean;
var
  FDAO: TDAOOperacao<TCategoria>;
begin
  Result  := False;
  FDAO    := TDAOOperacao<TCategoria>.Create(dm.Conn);

  Try
    Try

      if TDaoCategoria.PossuiVinculo(AIDRegistro) then
      Result  := TDaoCategoria.Delete(AIDRegistro, AIDUser, AIDEmpresa)
      else
      Result  := FDAO.Delete(AIDRegistro);

    except
      raise;
    End;
  Finally
    FDAO.Free;
  End;

end;

class function TCategoriaController.ListarTodos(const FiltroCampo,FiltroStatus: string): TObjectList<TCategoria>;
var
  Sql, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
  FDAO: TDAOOperacao<TCategoria>;
Const
  QryStr = 'Select id_categoria, descricao, case when ativo=''S'' then ''Ativo'' else ''Inativo'' end as ativo'+
            ' from categoria where excluido=0 ';
begin
  FDAO    := TDAOOperacao<TCategoria>.Create(dm.Conn);

  Try
    if FiltroCampo.Trim <> '' then
    begin
      SQL := SQL + ' and (descricao LIKE :filtro or id_categoria = :filtro)';
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

class function TCategoriaController.Salvar(ADoc: TCategoria; out RetornoID: integer; out AStr:String): Boolean;
var
FDAO: TDAOOperacao<TCategoria>;
begin
  Result    := False;
  FDAO      := TDAOOperacao<TCategoria>.Create(dm.Conn);

  Try
    if ADoc.id_categoria = 0 then
    begin
      Adoc.Data_Cadastro:= Now;
      Adoc.excluido     := 0;
      Try
        if TDaoCategoria.ExisteNome(Adoc.descricao) then
        begin
          AStr  :='Já existe uma categoria com está descrição.';
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
