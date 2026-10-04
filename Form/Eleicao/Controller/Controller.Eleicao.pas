unit Controller.Eleicao;

interface

uses
  Model.Eleicao,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections, UDM, Dao.EleicaoConfig, uConfiguracaoService;

type
  TEleicaoController = class
  private
    class function AlterarSituacaoEleicao(Const AIDEleicao:integer):boolean;
  public
    class function ListarTodos(const FiltroCampo, FiltroStatus, FiltroAtivo: string;FiltroData1, Filtrodata2:TDate): TObjectList<TModelEleicao>;
    class function BuscarPorID(AID: Integer): TModelEleicao;
    class function Salvar(ADoc: TModelEleicao; out RetornoID:integer): Boolean;
    class function Excluir(AID: Integer): Boolean;
    class function AbrirEleicao(const AIDEleicao, AIDEmpresa:integer;Out AAlerta:string):Boolean; static;
    class function LiberarSincronizacao(const AIDEleicao, AIDEmpresa:integer):boolean;
  end;

implementation

uses
  System.Variants;

{ TEleicaoController }

class function TEleicaoController.AbrirEleicao(const AIDEleicao,AIDEmpresa: integer; Out AAlerta:string): Boolean;
begin
  Result  := False;
  if AIDEleicao <=0 then
    raise Exception.Create('ID da eleição invalido');
  if AIDEmpresa <=0 then
    raise Exception.Create('ID da empresa invalido');
  Try
    Result  := TDaoEleicaoConfig.ValidarEleicaoAbrir(AIDEleicao, AIDEmpresa, AAlerta);
  Except
    on E: Exception do
    begin
      AAlerta := E.Message;
      raise
    end;
  End;
end;

class function TEleicaoController.AlterarSituacaoEleicao(const AIDEleicao: integer): boolean;
var
Dao :TDaoEleicaoConfig;
begin
  result  := false;
  try
    Dao     := TDaoEleicaoConfig.Create;
    try
      Result  := Dao.AlterarSituacaoEleicao(AIDEleicao);
      //aqui mando sincronizar tudo
      if Result then
      begin

      end;

    finally
      Dao.Free;
    end;

  except on e:exception do
   begin
    raise Exception.Create(e.Message);
   end;
  End;
end;

class function TEleicaoController.LiberarSincronizacao(const AIDEleicao, AIDEmpresa:integer):boolean;
var
  Lista: TArray<Integer>;
  ID: Integer;
begin
  Result := False;
  dm.Conn.StartTransaction;

  try

    //0 - Subir primeiro as pessoas
    Lista   := TDaoEleicaoConfig.BuscarAssociadoEleitor(AIDEleicao,AIDEmpresa);
    for ID in Lista do
    begin
      TDaoEleicaoConfig.MarcarTabelaAssociadoSinc(ID, AIDEmpresa);
      TConfiguracaoService.SincronizarGravar(4,ID);
    end;

    //1 - ELEIÇÃO
    TDaoEleicaoConfig.MarcarTabelaSincronizacao(AIDEleicao,AIDEmpresa,'eleicao');
    if TConfiguracaoService.ValidarUsoAppEleicao(AIDEmpresa) then
      TConfiguracaoService.SincronizarGravar(100,AIDEleicao);

    //2 - CONFIGURAÇÃO
    Lista   := TDaoEleicaoConfig.BuscarEleicaoConfiguracoes(AIDEleicao,AIDEmpresa);
    for ID in Lista do
    begin
      TDaoEleicaoConfig.MarcarTabelaSincronizacao(AIDEleicao,AIDEmpresa,'eleicao_configuracao');
      TConfiguracaoService.SincronizarGravar(101,ID);
    end;
    //3 - COMISSÃO ELEITORAL
    Lista := TDaoEleicaoConfig.BuscarEleicaoComissao(AIDEleicao,AIDEmpresa);
    for ID in Lista do
    begin
      TDaoEleicaoConfig.MarcarTabelaSincronizacao(AIDEleicao,AIDEmpresa,'eleicao_comissao');
      TConfiguracaoService.SincronizarGravar(105,ID);
    end;
    //4 - CHAPAS
    Lista := TDaoEleicaoConfig.BuscarEleicaoChapas(AIDEleicao,AIDEmpresa);
    for ID in Lista do
    begin
      TDaoEleicaoConfig.MarcarTabelaSincronizacao(AIDEleicao,AIDEmpresa,'eleicao_chapa');
      TConfiguracaoService.SincronizarGravar(102,ID);
    end;
    //5 - MEMBROS
    Lista := TDaoEleicaoConfig.BuscarEleicaoMembros(AIDEleicao,AIDEmpresa);
    for ID in Lista do
    begin
      TDaoEleicaoConfig.MarcarTabelaSincronizacao(AIDEleicao,AIDEmpresa,'eleicao_chapa_membro');
      TConfiguracaoService.SincronizarGravar(103,ID);
    end;
    //6 - ELEITORES APTOS
    Lista := TDaoEleicaoConfig.BuscarEleicaoEleitores(AIDEleicao,AIDEmpresa);
    for ID in Lista do
    begin
      TDaoEleicaoConfig.MarcarTabelaSincronizacao(AIDEleicao,AIDEmpresa,'eleicao_eleitor');
      TConfiguracaoService.SincronizarGravar(104,ID);
    end;

    //Somente depois de tudo preparado
    TEleicaoController.AlterarSituacaoEleicao(AIDEleicao);
    dm.Conn.Commit;
    Result := True;

  except
    if dm.Conn.InTransaction then
      dm.Conn.Rollback;
    raise;
  end;

end;


class function TEleicaoController.BuscarPorID(AID: Integer): TModelEleicao;
var
  FDAO: TDAOOperacao<TModelEleicao>;
begin
  FDAO := TDAOOperacao<TModelEleicao>.Create(dm.Conn);
  try
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

class function TEleicaoController.Excluir(AID: Integer): Boolean;
var
  FDAO: TDAOOperacao<TModelEleicao>;
begin
  FDAO := TDAOOperacao<TModelEleicao>.Create(dm.Conn);
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

class function TEleicaoController.ListarTodos(const FiltroCampo, FiltroStatus, FiltroAtivo: string;FiltroData1, Filtrodata2:TDate): TObjectList<TModelEleicao>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
  FDAO: TDAOOperacao<TModelEleicao>;
begin
  FDAO := TDAOOperacao<TModelEleicao>.Create(dm.Conn);
  try
    SQL   := 'Select                                                     '+
              ' e.id_eleicao,                                             '+
              ' e.codigo,                                                 '+
              ' e.nome,                                                   '+
              ' concat(''Exercício '',e.ano,'' - '',e.ano_fim) as nexercicio, '+
              ' e.tipo,                                                   '+
              ' e.situacao,                                               '+
              ' case                                                      '+
              ' When e.ativo =''S'' then ''Ativo'' else ''Inativo'' end as ativo,'+
              ' e.data, e.operacao'+
              ' from eleicao e where e.excluido=0';

    if FiltroCampo.Trim <> '' then
    begin
      SQL := SQL + ' AND (e.nome LIKE :filtro or e.codigo like :filtro)';
      Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
    end;

    if FiltroStatus.Trim <> '' then
    begin
      SQL := SQL + ' AND e.situacao = :situacao';
      Params := Params + [TPair<string, Variant>.Create('situacao', FiltroStatus)];
    end;

    if FiltroAtivo.Trim <> '' then
    begin
      SQL := SQL + ' AND e.ativo = :ativo';
      Params := Params + [TPair<string, Variant>.Create('ativo', FiltroAtivo)];
    end;

    Sql := Sql + ' AND e.data BETWEEN :x and :y';
    Params := Params + [TPair<string, Variant>.Create('x', VarFromDateTime(FiltroData1))];
    Params := Params + [TPair<string, Variant>.Create('y', VarFromDateTime(FiltroData2))];

    SQLORDER  := ' order by e.nome';

    Result := FDAO.FindWhere(SQL + SQLORDER, Params);
  Finally
    FDao.Free;
  End;
end;

class function TEleicaoController.Salvar(ADoc: TModelEleicao;
                                              out RetornoID: integer): Boolean;
Var
  FDAO: TDAOOperacao<TModelEleicao>;
begin
  Result              :=  False;
  FDAO := TDAOOperacao<TModelEleicao>.Create(dm.Conn);
  Try
    if ADoc.id_eleicao = 0 then
    begin
      Try
        ADoc.Codigo     := FDao.GetNextCode('codigo');
        RetornoID       := FDAO.Insert(ADoc);
        Result          := True;
      except on e:exception do
        begin
          raise Exception.Create(e.Message);
        end;
      End;
    end
    else
    begin
      Try
        Result := FDAO.Update(ADoc);
      except on e:exception do
        begin
          raise Exception.Create(e.Message);
        end;
      End;
    end;
  Finally
    FDao.Free;
  End;
end;

end.
