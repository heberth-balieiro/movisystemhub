unit Controller.EleicaoChapa;

interface

Uses
  Model.EleicaoChapa,
  Dao.Operacoes,
  Dao.EleicaoConfig,
  System.SysUtils,
  System.Generics.Collections, UDM;

type
  TEleicaoChapaController = class
  private

  public
    class function ListarTodos(const AIDEmpresa, AIDRegistro:Integer): TObjectList<TModelEleicaoChapa>;
    class function BuscarPorID(AID: Integer): TModelEleicaoChapa;
    class function Salvar(ADoc: TModelEleicaoChapa; RetornoID:integer; out AStr:String): Boolean;
    class function Excluir(AID: Integer): Boolean;
    class function BuscarPorIDEleicao(Aid:integer):TModelEleicaoChapa;
    class function SalvarHomologacao(ADoc: TModelEleicaoChapaHomologacao): Boolean;
    class function ExisteHomologado(const AIDRegistro,AIDEmpresa, AIdEleicao: Integer): Boolean;
    class function SalvarDeferimento(ADoc: TModelEleicaoChapaHomologacao): Boolean;
    Class Function ExisteDeferido(Const AIDRegistro, AIDEmpresa, AIdEleicao:Integer):Boolean;
  end;

implementation

{ TEleicaoChapaController }

class function TEleicaoChapaController.BuscarPorID(AID: Integer): TModelEleicaoChapa;
var
  FDAO: TDAOOperacao<TModelEleicaoChapa>;
begin
  FDAO := TDAOOperacao<TModelEleicaoChapa>.Create(dm.Conn);
  Try
    Try
      Result := FDAO.FindById(AID);
    except
    on E: Exception do
      raise Exception.Create(e.Message);
    end;
  Finally
    FDao.Free;
  End;
end;

class function TEleicaoChapaController.BuscarPorIDEleicao(Aid: integer): TModelEleicaoChapa;
begin

end;

class function TEleicaoChapaController.Excluir(AID: Integer): Boolean;
var
  FDAO: TDAOOperacao<TModelEleicaoChapa>;
begin
  FDAO := TDAOOperacao<TModelEleicaoChapa>.Create(dm.Conn);
  try
    Try
      Result := FDAO.Delete(AID);
    except
    on E: Exception do
      raise Exception.Create(e.Message);
    end;
  Finally
    FDao.Free;
  End;
end;

class function TEleicaoChapaController.ExisteDeferido(const AIDRegistro,
                                      AIDEmpresa, AIdEleicao: Integer): Boolean;
begin
  Result  := False;

  if AIDRegistro <=0 then
  raise Exception.Create('Registro informado invalido.');

  if AIDEmpresa <=0 then
  raise Exception.Create('Empresa invalida.');

  if AIdEleicao <=0  then
  raise Exception.Create('Eleição informada invalido');

  Result  := TDaoEleicaoConfig.ExisteDeferido(AIDRegistro,AIDEmpresa, AIdEleicao);
end;

class function TEleicaoChapaController.ExisteHomologado(const AIDRegistro,AIDEmpresa,
                                                    AIdEleicao: Integer): Boolean;
begin
  Result  := False;

  if AIDRegistro <=0 then
  raise Exception.Create('Registro informado invalido.');

  if AIDEmpresa <=0 then
  raise Exception.Create('Empresa invalida.');

  if AIdEleicao <=0  then
  raise Exception.Create('Eleição informada invalido');

  Result  := TDaoEleicaoConfig.ExisteHomologado(AIDRegistro,AIDEmpresa, AIdEleicao);

end;

class function TEleicaoChapaController.ListarTodos(const AIDEmpresa, AIDRegistro:Integer): TObjectList<TModelEleicaoChapa>;
var
  FDAO: TDAOOperacao<TModelEleicaoChapa>;
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
  Const
  QryStr = 'Select                                                               '+
              'id, codigo, situacao, num_chapa, nome_chapa,                       '+
              ' case when ativo=''S'' then ''Ativo'' else ''Inativo'' end as ativo, id_eleicao'+
              ' From eleicao_chapa where  id >0 ';
begin

  if AIDEmpresa <=0 then
    raise Exception.Create('Dados da empresa inválido.');

  if AIDRegistro <=0 then
    raise Exception.Create('Registro selecionado inválido.');


  FDAO  := TDAOOperacao<TModelEleicaoChapa>.Create(dm.Conn);

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

    SQLORDER  := ' order by data_criacao';

    Result  := FDAO.FindWhere(QryStr + SQL + SQLORDER, Params);
  Finally
    FDao.Free;
  End;
end;

class function TEleicaoChapaController.Salvar(ADoc: TModelEleicaoChapa; RetornoID:integer; out AStr:String): Boolean;
var
FDAO: TDAOOperacao<TModelEleicaoChapa>;
begin
  Result    := False;
  FDAO      := TDAOOperacao<TModelEleicaoChapa>.Create(dm.Conn);

  Try
    if ADoc.id = 0 then
    begin

      Try

        if TDaoEleicaoConfig.ExisteChapaNumero(Adoc.num_chapa, Adoc.id_eleicao, Adoc.idempresa) then
        begin
          AStr  :='Já existe uma chapa com este número.';
          exit;
        end;

        if TDaoEleicaoConfig.ExisteChapa(Adoc.nome_chapa, Adoc.id_eleicao, Adoc.idempresa) then
        begin
          AStr  :='Já existe uma chapa com está descrição.';
          exit;
        end;

        ADoc.codigo     :=  FDao.GetNextCode('codigo');
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

class function TEleicaoChapaController.SalvarDeferimento(ADoc: TModelEleicaoChapaHomologacao): Boolean;
begin
  Result  := False;

  if Adoc.id<=0 then
  raise Exception.Create('Registro informado invalido.');

  if adoc.idempresa<=0 then
  raise Exception.Create('Empresa invalida.');

  Result  := TDaoEleicaoConfig.SalvarDeferimento(ADoc);
end;

class function TEleicaoChapaController.SalvarHomologacao(ADoc: TModelEleicaoChapaHomologacao): Boolean;
begin
  Result  := False;

  if Adoc.id<=0 then
  raise Exception.Create('Registro informado invalido.');

  if adoc.idempresa<=0 then
  raise Exception.Create('Empresa invalida.');

  Result  := TDaoEleicaoConfig.SalvarHomologacao(ADoc);

end;

end.
