unit Controller.EleicaoQuestao;

interface

Uses
  Model.EleicaoQuestao,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections, UDM,
  Dao.EleicaoConfig;

type
  TEleicaoQuestaoController = class
  private

  public
    class function ListarTodos(const AIDEmpresa, AIDRegistro:Integer): TObjectList<TModelEleicaoQuestao>;
    class function BuscarPorID(AID: Integer): TModelEleicaoQuestao;
    class function Salvar(ADoc: TModelEleicaoQuestao; out RetornoID:integer; out AStr:String): Boolean;
    class function Excluir(AID: Integer): Boolean;

    //opcao
    class function SalvarOpcao(AdocOpcao:TModelEleicaoQuestaoOpcao;out AStr:String):Boolean; static;
    class function BuscarQuestaoOpcao(Const AIDQuestao, AIDEmpresa, AIDEleicao: Integer): TObjectList<TModelEleicaoQuestaoOpcao>; static;
    class function ExcluirOpcao(AID: Integer): Boolean;
end;

implementation

{ TEleicaoQuestaoController }

class function TEleicaoQuestaoController.BuscarPorID(AID: Integer): TModelEleicaoQuestao;
var
  FDAO: TDAOOperacao<TModelEleicaoQuestao>;
begin
  FDAO := TDAOOperacao<TModelEleicaoQuestao>.Create(dm.Conn);
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

class function TEleicaoQuestaoController.Excluir(AID: Integer): Boolean;
var
  FDAO: TDAOOperacao<TModelEleicaoQuestao>;
begin
  FDAO := TDAOOperacao<TModelEleicaoQuestao>.Create(dm.Conn);
  Try
    Try
      Result := FDAO.Delete(AID);
    except
    on E: Exception do
      raise Exception.Create(e.Message);
    end;
  Finally
    Fdao.Free;
  End;
end;



class function TEleicaoQuestaoController.ListarTodos(const AIDEmpresa,
                        AIDRegistro: Integer): TObjectList<TModelEleicaoQuestao>;
var
  FDAO: TDAOOperacao<TModelEleicaoQuestao>;
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
  Const
  QryStr = 'Select                                                               '+
              'id_questao, id_eleicao, titulo, descricao, ordem, tipo_resposta, '+
              ' case when obrigatoria=''S'' then ''Sim'' else ''Não'' end obrigatoria,'+
              ' case when ativo=''S'' then ''Sim'' else ''Não'' end as ativo'+
              ' From eleicao_questao where id_questao >0 ';
begin

  if AIDEmpresa <=0 then
    raise Exception.Create('Dados da empresa inválido.');

  if AIDRegistro <=0 then
    raise Exception.Create('Registro selecionado inválido.');


  FDAO  := TDAOOperacao<TModelEleicaoQuestao>.Create(dm.Conn);
  Try
    if AIDEmpresa > 0 then
    begin
      SQL := SQL + ' and id_empresa= :idempresa';
      Params := Params + [TPair<string, Variant>.Create('idempresa', AIDEmpresa)];
    end;

     if AIDRegistro > 0 then
    begin
      SQL := SQL + ' and id_eleicao= :ideleicao';
      Params := Params + [TPair<string, Variant>.Create('ideleicao', AIDRegistro)];
    end;

    SQLORDER  := ' order by ordem';

    Result  := FDAO.FindWhere(QryStr + SQL + SQLORDER, Params);
  Finally
    Fdao.Free;
  End;
end;



class function TEleicaoQuestaoController.Salvar(ADoc: TModelEleicaoQuestao;
                                  out RetornoID: integer; out AStr: String): Boolean;
var
FDAO: TDAOOperacao<TModelEleicaoQuestao>;
begin
  Result    := False;
  FDAO      := TDAOOperacao<TModelEleicaoQuestao>.Create(dm.Conn);

  Try
    if ADoc.id_questao = 0 then
    begin

      Try
        Adoc.data_cadastro  := Now;
        Adoc.sinc_app       := 'N';

        //Validar

        if TDaoEleicaoConfig.ExisteQuestao(Adoc.titulo,Adoc.ordem, Adoc.id_eleicao, Adoc.id_empresa, 0,AStr) then
        Exit;

        RetornoID           :=  FDAO.Insert(ADoc);
        Result              :=  True;
      except
        begin
          raise;
        end;
      End;
    end
    else
    begin
      Try
        RetornoID   := Adoc.id_questao;
        Adoc.data_alteracao := now;
        if TDaoEleicaoConfig.ExisteQuestao(Adoc.titulo,Adoc.ordem, Adoc.id_eleicao, Adoc.id_empresa, Adoc.id_questao,AStr) then
        Exit;

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

{$REGION 'Opção'}

class function TEleicaoQuestaoController.SalvarOpcao(AdocOpcao: TModelEleicaoQuestaoOpcao; out AStr: String): Boolean;
var
FDAO: TDAOOperacao<TModelEleicaoQuestaoOpcao>;
RetornoID:integer;
begin
  Result    := False;
  FDAO      := TDAOOperacao<TModelEleicaoQuestaoOpcao>.Create(dm.Conn);

  Try
    if AdocOpcao.id_opcao = 0 then
    begin

      Try
        AdocOpcao.data_cadastro  := Now;
        AdocOpcao.sinc_app       := 'N';
        RetornoID           :=  FDAO.Insert(AdocOpcao);
        Result              :=  True;
      except
        begin
          raise;
        end;
      End;
    end
    else
    begin
      Try
        AdocOpcao.data_alteracao := now;
        Result := FDAO.Update(AdocOpcao);
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

class function TEleicaoQuestaoController.BuscarQuestaoOpcao(Const AIDQuestao, AIDEmpresa, AIDEleicao: Integer): TObjectList<TModelEleicaoQuestaoOpcao>;
var
  FDAO: TDAOOperacao<TModelEleicaoQuestaoOpcao>;
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
  Const
  QryStr = 'Select * From eleicao_questao_opcao where id_opcao >0 ';
begin

  if AIDEmpresa <=0 then
    raise Exception.Create('Dados da empresa inválido.');

  if AIDQuestao <=0 then
    raise Exception.Create('Registro selecionado inválido.');

  if AIDEleicao <=0 then
    raise Exception.Create('Registro selecionado inválido.');

  FDAO  := TDAOOperacao<TModelEleicaoQuestaoOpcao>.Create(dm.Conn);
  Try
    if AIDEmpresa > 0 then
    begin
      SQL := SQL + ' and id_empresa= :idempresa';
      Params := Params + [TPair<string, Variant>.Create('idempresa', AIDEmpresa)];
    end;

     if AIDQuestao > 0 then
    begin
      SQL := SQL + ' and id_questao= :idquestao';
      Params := Params + [TPair<string, Variant>.Create('idquestao', AIDQuestao)];
    end;

    if AIDEleicao > 0 then
    begin
      SQL := SQL + ' and id_eleicao= :ideleicao';
      Params := Params + [TPair<string, Variant>.Create('ideleicao', AIDEleicao)];
    end;

    SQLORDER  := ' order by ordem';

    Result  := FDAO.FindWhere(QryStr + SQL + SQLORDER, Params);
  Finally
    FDao.Free;
  End;
end;

class function TEleicaoQuestaoController.ExcluirOpcao(AID: Integer): Boolean;
var
  FDAO: TDAOOperacao<TModelEleicaoQuestaoOpcao>;
begin
  FDAO := TDAOOperacao<TModelEleicaoQuestaoOpcao>.Create(dm.Conn);
  Try
    Try
      Result := FDAO.Delete(AID);
    except
    on E: Exception do
      raise Exception.Create(e.Message);
    end;
  Finally
    Fdao.Free;
  End;
end;

{$ENDREGION}

end.
