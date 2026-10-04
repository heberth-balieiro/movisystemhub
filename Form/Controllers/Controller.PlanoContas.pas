unit Controller.PlanoContas;

interface

uses
  Model.PlanoConta,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao.PlanoContas;

type
  TPlanoContaController = class
  private
    FDAO: TDAOOperacao<TModelPlanoConta>;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TModelPlanoConta>;
    function BuscarPorID(AID: Integer): TModelPlanoConta;
    function Salvar(ADoc: TModelPlanoConta; out RetornoID:integer): Boolean;
    function Excluir(AID: Integer): Boolean;
    function ExcluidoCancelado(AID, AIDUser: Integer):boolean;
    function GetNextPlanoContasCodigoByPai(AIdPai: Integer;const ATipo: string): string;
  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TModelPlanoContaController }

function TPlanoContaController.BuscarPorID(AID: Integer): TModelPlanoConta;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TPlanoContaController.Create;
begin
  FDAO := TDAOOperacao<TModelPlanoConta>.Create(dm.Conn);
end;

destructor TPlanoContaController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TPlanoContaController.ExcluidoCancelado(AID, AIDUser: Integer): boolean;
var
Dao :TDaoPlanoContas;
begin
  Result  := false;
  Dao     := TDaoPlanoContas.Create;

  try
    if dao.ValidarRegistroFilho(AID) then
    begin
      raise Exception.Create('Existe registro filho vinculado.');
      exit;
    end
    else
    begin
      if Dao.Delete(AID, AidUser) then
      result  := True;
    end;

  finally
    Dao.Free;
  end;

end;

function TPlanoContaController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TPlanoContaController.GetNextPlanoContasCodigoByPai(AIdPai: Integer;const ATipo: string): string;
var
Dao :TDaoPlanoContas;
begin
  Dao     := TDaoPlanoContas.Create;
  try
   Result    := Dao.GetNextPlanoContasCodigoByPai(AIdPai,ATipo[1]);
  finally
    Dao.Free;
  end;
end;

function TPlanoContaController.ListarTodos(const FiltroCampo,
  FiltroStatus: string): TObjectList<TModelPlanoConta>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := 'SELECT                                                         '+
            ' id_planoconta,                                               '+
            ' codigo,                                                      '+
            //' CONCAT(REPEAT(''    '', nivel - 1), descricao) AS descricao,   '+
            ' CONCAT(REPEAT(''    '', nivel - 1), codigo, '' - '', descricao) AS descricao,'+
            ' id_pai,                                                      '+
            ' nivel,                                                       '+
            ' case when nivel=1 then ''1-Grupo''                            '+
            ' when nivel=2 then ''2-Subgrupo''                        '+
            ' when nivel=3 then ''3-Categoria''                        '+
            ' when nivel=4 then ''4-Subcategoria''                       '+
            ' when nivel=5 then ''5-Item'' end as desnivel,                         '+
            ' tipo,                                                        '+
            ' case when aceita_lancamento = ''N'' then ''Não'' else ''Sim'' end as aceita,                                           '+
            ' Case when ativo=''S'' then ''Ativo'' else ''Inativo'' end as ativo,     '+
            ' ordem                                                        '+
            ' FROM planoconta                                              '+
            ' WHERE excluido =0                                      ';



  if FiltroCampo.Trim <> '' then
  begin
    SQL := SQL + ' AND (descricao LIKE :filtro or codigo = :filtro)';
    Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
  end;

  if FiltroStatus.Trim <> '' then
  begin
    SQL := SQL + ' AND ativo = :ativo';
    Params := Params + [TPair<string, Variant>.Create('ativo', FiltroStatus)];
  end;

  SQLORDER  := ' ORDER BY codigo';

  Result := FDAO.FindWhere(SQL + SQLORDER, Params);
end;

function TPlanoContaController.Salvar(ADoc: TModelPlanoConta; out RetornoID: integer): Boolean;
var
Dao :TDaoPlanoContas;
begin
  Result          :=  False;

  if ADoc.id_planoconta = 0 then
  begin
    if Adoc.Codigo = '' then
    begin
      Dao     := TDaoPlanoContas.Create;
      try
        ADoc.Codigo    := Dao.GetNextPlanoContasCodigo('',ADoc.tipo[1]);
      finally
        Dao.Free;
      end;

    end;

    Adoc.DataCriacao  := now;

    Try
      RetornoID       :=  FDAO.Insert(ADoc);
      Result          :=  True;
    except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;

  end
  else
  begin
    Try
      ADoc.data_alteracao   := Now;

      Result := FDAO.Update(ADoc);
    except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;
  end;
end;

end.
