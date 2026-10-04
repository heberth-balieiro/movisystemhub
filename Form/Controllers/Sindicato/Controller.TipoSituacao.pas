unit Controller.TipoSituacao;

interface

uses
  Model.TipoSituacao,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao.TipoSituacao;
type
  TTipoSituacaoController = class
  private

  public

    class function ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TTipoSituacao>;
    class function BuscarPorID(AID: Integer): TTipoSituacao;
    class function Salvar(ADoc: TTipoSituacao; out RetornoID:integer; out AStr:String): Boolean;
    class function Excluir(const AIDRegistro: integer; const AIDUser: Integer; const AIDEmpresa:integer): Boolean;

  end;

implementation

{ TTipoSituacaoController }

uses UDM, cxDateUtils, System.Variants;

class function TTipoSituacaoController.BuscarPorID(AID: Integer): TTipoSituacao;
var
  FDAO: TDAOOperacao<TTipoSituacao>;
begin
  FDAO := TDAOOperacao<TTipoSituacao>.Create(dm.Conn);

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

class function TTipoSituacaoController.Excluir(const AIDRegistro: integer; const AIDUser: Integer; const AIDEmpresa:integer): Boolean;
var
  FDAO: TDAOOperacao<TTipoSituacao>;
begin
  Result  := False;
  FDAO    := TDAOOperacao<TTipoSituacao>.Create(dm.Conn);

  Try
    Try

      if TDaoTipoSituacao.PossuiVinculo(AIDRegistro) then
      Result  := TDaoTipoSituacao.Delete(AIDRegistro, AIDUser, AIDEmpresa)
      else
      Result  := FDAO.Delete(AIDRegistro);

    except
      raise;
    End;
  Finally
    FDAO.Free;
  End;

end;

class function TTipoSituacaoController.ListarTodos(const FiltroCampo,FiltroStatus: string): TObjectList<TTipoSituacao>;
var
  Sql, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
  FDAO: TDAOOperacao<TTipoSituacao>;
Const
  QryStr = 'Select id_situacao, descricao, case when ativo=''S'' then ''Ativo'' else ''Inativo'' end as ativo'+
            ' from sindicato_tipo_situacao where excluido=0 ';
begin
  FDAO    := TDAOOperacao<TTipoSituacao>.Create(dm.Conn);

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

class function TTipoSituacaoController.Salvar(ADoc: TTipoSituacao; out RetornoID: integer; out AStr:String): Boolean;
var
FDAO: TDAOOperacao<TTipoSituacao>;
begin
  Result    := False;
  FDAO      := TDAOOperacao<TTipoSituacao>.Create(dm.Conn);

  Try
    if ADoc.id_situacao = 0 then
    begin
      Adoc.Data_Cadastro:= Now;
      Adoc.excluido     := 0;
      Try
        if TDaoTipoSituacao.ExisteNome(Adoc.descricao) then
        begin
          AStr  :='Já existe uma situação com está descrição.';
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
