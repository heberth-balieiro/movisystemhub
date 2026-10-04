unit Controller.LocalTrabalho;

interface

uses
  Model.localTrabalho,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao.localtrabalho;
type
  TLocalTrabalhoController = class
  private

  public

    class function ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TLocalTrabalho>;
    class function BuscarPorID(AID: Integer): TLocalTrabalho;
    class function Salvar(ADoc: TLocalTrabalho; out RetornoID:integer; out AStr:String): Boolean;
    class function Excluir(const AIDRegistro: integer; const AIDUser: Integer; const AIDEmpresa:integer): Boolean;

  end;

implementation

{ TLocalTrabalhoController }

uses UDM, cxDateUtils, System.Variants;

class function TLocalTrabalhoController.BuscarPorID(AID: Integer): TLocalTrabalho;
var
  FDAO: TDAOOperacao<TLocalTrabalho>;
begin
  FDAO := TDAOOperacao<TLocalTrabalho>.Create(dm.Conn);

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

class function TLocalTrabalhoController.Excluir(const AIDRegistro: integer; const AIDUser: Integer; const AIDEmpresa:integer): Boolean;
var
  FDAO: TDAOOperacao<TLocalTrabalho>;
begin
  Result  := False;
  FDAO    := TDAOOperacao<TLocalTrabalho>.Create(dm.Conn);

  Try
    Try

      if TDaoLocalTrabalho.PossuiVinculo(AIDRegistro) then
      Result  := TDaoLocalTrabalho.Delete(AIDRegistro, AIDUser, AIDEmpresa)
      else
      Result  := FDAO.Delete(AIDRegistro);

    except
      raise;
    End;
  Finally
    FDAO.Free;
  End;

end;

class function TLocalTrabalhoController.ListarTodos(const FiltroCampo,FiltroStatus: string): TObjectList<TLocalTrabalho>;
var
  Sql, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
  FDAO: TDAOOperacao<TLocalTrabalho>;
Const
  QryStr = 'Select id_local, descricao, case when ativo=''S'' then ''Ativo'' else ''Inativo'' end as ativo'+
            ' from sindicato_local_trabalho where excluido=0 ';
begin
  FDAO    := TDAOOperacao<TLocalTrabalho>.Create(dm.Conn);

  Try
    if FiltroCampo.Trim <> '' then
    begin
      SQL := SQL + ' and (descricao LIKE :filtro or id_situacao = :filtro)';
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

class function TLocalTrabalhoController.Salvar(ADoc: TLocalTrabalho; out RetornoID: integer; out AStr:String): Boolean;
var
FDAO: TDAOOperacao<TLocalTrabalho>;
begin
  Result    := False;
  FDAO      := TDAOOperacao<TLocalTrabalho>.Create(dm.Conn);

  Try
    if ADoc.id_local = 0 then
    begin
      Adoc.Data_Cadastro:= Now;
      Adoc.excluido     := 0;
      Try
        if TDaoLocalTrabalho.ExisteNome(Adoc.descricao) then
        begin
          AStr  :='Já existe um local com está descrição.';
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

