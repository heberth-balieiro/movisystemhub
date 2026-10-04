unit Controller.EleicaoEleitor;

interface

uses
  Model.EleicaoEleitor,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao.EleicaoConfig,
  UDM;

type
  TEleicaoEleitorController = class
  private

  public
    class function ListarTodos(AIDEleicao: Integer;
                   const FiltroCampo, FiltroSituacao, FiltroSincApp: string;
                   const FiltroSecretaria: integer = 0;
                   const FiltroLotacao: integer = 0;
                   const FiltroCidade: integer = 0): TObjectList<TModelEleicaoEleitor>;
    //class function BuscarPorID(AID: Integer): TModelEleicaoEleitor;
    class function Salvar(ADoc: TModelEleicaoEleitor; out RetornoID: Integer): Boolean;
    class function JaExisteNaEleicao(Const AIDEleicao: Integer; const AIDAssociado: integer):Boolean;
    class function Excluir(AID: Integer): Boolean;
    class function MarcarSincronizar(AID: Integer): Boolean;
  end;

implementation

uses
  System.Variants;

{ TEleicaoEleitorController }

class function TEleicaoEleitorController.Excluir(AID: Integer): Boolean;
Var
  FDAO: TDAOOperacao<TModelEleicaoEleitor>;
begin
  FDAO := TDAOOperacao<TModelEleicaoEleitor>.Create(dm.Conn);
  Try
    Result := FDAO.Delete(AID);
  Finally
    FDao.Free;
  End;
end;

class function TEleicaoEleitorController.JaExisteNaEleicao(const AIDEleicao,AIDAssociado: integer): Boolean;
var
  ADao :TDaoEleicaoConfig;
begin
  try
    ADao      := TDaoEleicaoConfig.Create;
    try
      Result  := ADao.JaExisteNaEleicao(AIDEleicao,AIDAssociado);
    finally
      ADao.Free;
    end;

  except on e:exception do
   begin
    raise Exception.Create(e.Message);
   end;
  End;
end;

class function TEleicaoEleitorController.ListarTodos(AIDEleicao: Integer;
                   const FiltroCampo, FiltroSituacao, FiltroSincApp: string;
                   const FiltroSecretaria: integer = 0;
                   const FiltroLotacao: integer = 0;
                   const FiltroCidade: integer = 0): TObjectList<TModelEleicaoEleitor>;
var
  SQL, SQLOrder: string;
  Params: TArray<TPair<string, Variant>>;
  FDAO: TDAOOperacao<TModelEleicaoEleitor>;
begin
  FDAO := TDAOOperacao<TModelEleicaoEleitor>.Create(dm.Conn);

  Try

    SQL :=
      'SELECT '+
      ' ee.id_eleitor, '+
      ' ee.id_eleicao, '+
      ' ee.id_associado, '+
      ' case '+
      ' when ee.situacao =''A'' then ''APTO'' '+
      ' when ee.situacao =''C'' then ''CANCELADO'' '+
      ' else ''BLOQUEADO'' end as situacao, '+
      ' case '+
      ' when ee.id_usuario_api >0 then ''SINCRONIZADO'' '+
      ' else ''NÃO SINCRONIZADO'' end as sincronizacao, '+
      ' ee.sinc_app, '+
      ' s.nome as socio_nome,  '+
      ' s.codigo as socio_codigo, '+
      ' s.matricula as socio_matricula, '+
      ' sc.razao as socio_secretaria, '+
      ' s.whatsapp as socio_telefone  '+
      ' FROM eleicao_eleitor ee '+
      ' INNER JOIN socio s '+
      ' ON s.id_socio=ee.id_associado '+
      ' LEFT JOIN secretaria sc   '+
      ' ON s.escritorio = sc.id_secretaria  '+
      ' WHERE ee.id_eleitor > 0 ';

    if AIDEleicao > 0 then
    begin
      SQL := SQL + 'AND ee.id_eleicao= :id_eleicao ';
      Params := Params + [TPair<string,Variant>.Create('id_eleicao',AIDEleicao)];
    end;

    if FiltroCampo.Trim <> '' then
    begin
      SQL := SQL + 'AND (s.nome LIKE :filtro OR s.cpf LIKE :filtro OR s.matricula LIKE :filtro OR s.codigo LIKE :filtro) ';
      Params := Params + [TPair<string,Variant>.Create('filtro','%' + FiltroCampo.Trim + '%')];
    end;

    if FiltroSituacao.Trim <> '' then
    begin
      SQL := SQL + 'AND ee.situacao= :situacao ';
      Params := Params + [TPair<string,Variant>.Create('situacao',FiltroSituacao)];
    end;

    if FiltroSincApp.Trim <> '' then
    begin
      SQL := SQL + 'AND ee.sinc_app= :sinc_app ';
      Params := Params + [TPair<string,Variant>.Create('sinc_app',FiltroSincApp)];
    end;

    if FiltroSecretaria > 0 then
    begin
      SQL := SQL + 'AND s.secretaria= :secretaria ';
      Params := Params + [TPair<string,Variant>.Create('secretaria',FiltroSecretaria)];
    end;

    if FiltroLotacao > 0 then
    begin
      SQL := SQL + 'AND s.id_lotacao= :lotacao ';
      Params := Params + [TPair<string,Variant>.Create('lotacao',FiltroLotacao)];
    end;

    if FiltroCidade > 0 then
    begin
      SQL := SQL + 'AND s.id_cidade= :cidade ';
      Params := Params + [TPair<string,Variant>.Create('cidade',FiltroCidade)];
    end;

    SQLOrder := 'ORDER BY s.nome';

    Result := FDAO.FindWhere(SQL + SQLOrder, Params);
  Finally
    FDao.Free;
  End;
end;

class function TEleicaoEleitorController.Salvar(ADoc: TModelEleicaoEleitor;
  out RetornoID: Integer): Boolean;
Var
FDAO: TDAOOperacao<TModelEleicaoEleitor>;
begin
  Result := False;
  RetornoID := 0;

  FDAO := TDAOOperacao<TModelEleicaoEleitor>.Create(dm.Conn);
  Try
    if ADoc.id_eleitor = 0 then
    begin
      try
        RetornoID   := FDAO.Insert(ADoc);
        Result      := RetornoID > 0;
      except
        on E: Exception do
          raise Exception.Create(E.Message);
      end;
    end;
  Finally
    FDao.Free;
  End;
end;

class function TEleicaoEleitorController.MarcarSincronizar(AID: Integer): Boolean;
var
  ADao :TDaoEleicaoConfig;
begin
  Result  := false;

  try
    ADao      := TDaoEleicaoConfig.Create;
    try
      Result  := ADao.MarcarEleitorSincronizacao(AID);
    finally
      ADao.Free;
    end;

  except on e:exception do
   begin
    raise Exception.Create(e.Message);
   end;
  End;


end;

end.
