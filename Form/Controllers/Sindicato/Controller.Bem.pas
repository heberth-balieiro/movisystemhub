unit Controller.Bem;

interface

uses
  Model.Bem,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao.Bem;
type
  TBemController = class
  private

  public

    class function ListarTodos(const FiltroCampo, FiltroStatus: string; const AIdCategoria:integer=0; const AIDDepartamento:integer=0): TObjectList<TModelBem>;
    class function BuscarPorID(AID: Integer): TModelBem;
    class function Salvar(ADoc: TModelBem; out RetornoID:integer; out AStr:String): Boolean;
    class function Excluir(const AIDRegistro: integer; const AIDUser: Integer; const AIDEmpresa:integer): Boolean;

  end;

implementation

{ TBemController }

uses UDM, cxDateUtils, System.Variants;

class function TBemController.BuscarPorID(AID: Integer): TModelBem;
var
  FDAO: TDAOOperacao<TModelBem>;
begin
  FDAO := TDAOOperacao<TModelBem>.Create(dm.Conn);

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

class function TBemController.Excluir(const AIDRegistro: integer; const AIDUser: Integer; const AIDEmpresa:integer): Boolean;
var
  FDAO: TDAOOperacao<TModelBem>;
begin
  Result  := False;
  FDAO    := TDAOOperacao<TModelBem>.Create(dm.Conn);

  Try
    Try
      Result  := FDAO.Delete(AIDRegistro);
    except
      raise;
    End;
  Finally
    FDAO.Free;
  End;

end;

class function TBemController.ListarTodos(const FiltroCampo, FiltroStatus: string; const AIdCategoria:integer=0; const AIDDepartamento:integer=0): TObjectList<TModelBem>;
var
  Sql, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
  FDAO: TDAOOperacao<TModelBem>;
Const
  QryStr =  'Select '+
            ' b.id_bem, '+
            ' b.codigo, '+
            ' b.descricao, '+
            ' case when b.ativo=''S'' then ''Ativo'' else ''Inativo'' end as ativo, '+
            ' b.modelo, '+
            ' b.situacao, '+
            ' coalesce(b.valor_aquisicao,0) as valor_aquisicao, '+
            ' d.descricao as departamento, '+
            ' l.localizacao, '+
            ' case when exists ( '+
            '   select 1 '+
            '   from anexo a '+
            '   where a.id_referencia = b.id_bem '+
            '     and a.id_empresa = b.id_empresa '+
            ' ) then 1 else 0 end as tem_anexo '+
            ' from bens b '+
            ' inner join departamento d '+
            ' on b.id_departamento = d.id_departamento '+
            ' inner join localizacao l '+
            ' on b.id_localizacao = l.id_localizacao '+
            ' where b.excluido=0 ';

//            'Select b.id_bem, b.codigo, b.descricao, case when b.ativo=''S'' then ''Ativo'' else ''Inativo'' end as ativo, '+
//            ' b.modelo, b.situacao, coalesce(b.valor_aquisicao,0) as valor_aquisicao, d.descricao as departamento, l.localizacao '+
//            ' from bens b '+
//            ' inner join departamento d  '+
//            ' on b.id_departamento = d.id_departamento  '+
//            ' inner join localizacao l  '+
//            ' on b.id_localizacao = l.id_localizacao  '+
//            ' where b.excluido=0 ';
begin
  FDAO    := TDAOOperacao<TModelBem>.Create(dm.Conn);

  Try
    if FiltroCampo.Trim <> '' then
    begin
      SQL := SQL + ' and (b.descricao LIKE :filtro or b.codigo = :filtro)';
      Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
    end;

    if FiltroStatus.Trim <> '' then
    begin
      SQL := SQL + ' and b.ativo = :ativo';
      Params := Params + [TPair<string, Variant>.Create('ativo', FiltroStatus)];
    end;

    if AIdCategoria > 0 then
    begin
      SQL := SQL + ' and b.id_categoria= :idcategoria';
      Params := Params + [TPair<string, Variant>.Create('idcategoria', AIdCategoria )];
    end;

    if AIDDepartamento > 0 then
    begin
      SQL := SQL + ' and b.id_departamento= :iddepartamento';
      Params := Params + [TPair<string, Variant>.Create('iddepartamento', AIDDepartamento )];
    end;

    SQLORDER  := ' order by b.descricao';

    Result := FDAO.FindWhere(QryStr + SQL + SQLORDER, Params);

  Finally
    FDAO.Free;
  End;

end;

class function TBemController.Salvar(ADoc: TModelBem; out RetornoID: integer; out AStr:String): Boolean;
var
FDAO: TDAOOperacao<TModelBem>;
begin
  Result    := False;
  FDAO      := TDAOOperacao<TModelBem>.Create(dm.Conn);

  Try
    if ADoc.id_bem = 0 then
    begin
      Adoc.Data_Cadastro:= Now;
      Adoc.excluido     := 0;
      Try
        if TDaoBem.ExisteNome(Adoc.descricao) then
        begin
          AStr  :='Já existe um bem com está descrição.';
          exit;
        end;
        Adoc.codigo     :=  FDao.GetNextCode('codigo');
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
