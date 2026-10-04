unit Controller.EleicaoComissao;

interface

Uses
  Model.EleicaoChapa,
  Dao.Operacoes,
  Dao.EleicaoConfig,
  System.SysUtils,
  System.Generics.Collections, UDM;

type
  TEleicaoComissaoController = class
  private

  public
    class function ListarTodos(const AIDEleicao, AIDEmpresa:Integer): TObjectList<TModelEleicaoComissao>;
    class function BuscarPorID(const AIDComissao: Integer): TModelEleicaoComissao;
    class function Salvar(ADoc: TModelEleicaoComissao; RetornoID:integer; out AStr:String): Boolean;
    class function Excluir(const AIDComissao: Integer): Boolean;

end;

implementation

{ TEleicaoComissaoController }

class function TEleicaoComissaoController.BuscarPorID(const AIDComissao: Integer): TModelEleicaoComissao;
var
  FDAO: TDAOOperacao<TModelEleicaoComissao>;
begin
  FDAO := TDAOOperacao<TModelEleicaoComissao>.Create(dm.Conn);
  Try
    Try
      Result := FDAO.FindById(AIDComissao);
    except
    on E: Exception do
      raise Exception.Create(e.Message);
    end;
  Finally
    FDao.Free;
  End;
end;

class function TEleicaoComissaoController.Excluir(const AIDComissao: Integer): Boolean;
var
  FDAO: TDAOOperacao<TModelEleicaoComissao>;
begin
  FDAO := TDAOOperacao<TModelEleicaoComissao>.Create(dm.Conn);
  Try
    Try
      Result := FDAO.Delete(AIDComissao);
    except
    on E: Exception do
      raise Exception.Create(e.Message);
    end;
  Finally
    FDao.Free;
  End;
end;

class function TEleicaoComissaoController.ListarTodos(const AIDEleicao,
                      AIDEmpresa: Integer): TObjectList<TModelEleicaoComissao>;
var
  FDAO: TDAOOperacao<TModelEleicaoComissao>;
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
  Const
  QryStr = 'Select                                                               '+
              'id_comissao, id_eleicao, nome, cpf, telefone, email, cargo,       '+
              ' case when ativo=''S'' then ''Ativo'' else ''Inativo'' end as ativo'+
              ' From eleicao_comissao where id_comissao > 0 ';
begin

  if AIDEmpresa <= 0 then
    raise Exception.Create('Dados da empresa inválido.');

  if AIDeleicao <=0 then
    raise Exception.Create('Registro selecionado inválido.');

  FDAO  := TDAOOperacao<TModelEleicaoComissao>.Create(dm.Conn);
  Try
    if AIDEmpresa > 0 then
    begin
      SQL := SQL + ' and id_empresa= :idempresa';
      Params := Params + [TPair<string, Variant>.Create('idempresa', AIDEmpresa)];
    end;

    if AIDEleicao > 0 then
    begin
      SQL := SQL + ' and id_eleicao= :ideleicao';
      Params := Params + [TPair<string, Variant>.Create('ideleicao', AIDeleicao)];
    end;

    SQLORDER  := ' order by nome';

    Result  := FDAO.FindWhere(QryStr + SQL + SQLORDER, Params);
  Finally
    FDao.Free;
  End;
end;

class function TEleicaoComissaoController.Salvar(ADoc: TModelEleicaoComissao;
                                  RetornoID: integer; out AStr: String): Boolean;
var
FDAO: TDAOOperacao<TModelEleicaoComissao>;
begin
  Result    := False;
  FDAO      := TDAOOperacao<TModelEleicaoComissao>.Create(dm.Conn);

  Try
    if ADoc.id_comissao = 0 then
    begin

      Try
        ADoc.sinc_app       := 'N';
        Adoc.data_cadastro  := Now;
        RetornoID           := FDAO.Insert(ADoc);
        Result              := True;
      except
        begin
          raise;
        end;
      End;

    end
    else
    begin
      Try
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
