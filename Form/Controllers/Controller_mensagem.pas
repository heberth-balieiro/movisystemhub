unit Controller_Mensagem;

interface
uses
  Model.Mensagem,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao_Mensagem;

type
  TMensagemController = class
  private
    FDAO: TDAOOperacao<TModelMensagem>;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TModelMensagem>;
    function BuscarPorID(AID: Integer): TModelMensagem;
    function Salvar(ADoc: TModelMensagem; out RetornoID:integer): Boolean;
    function Excluir(AID: Integer): Boolean;
    function ExcluidoCancelado(AID, AIDUser: Integer):boolean;
  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TMensagemController }

function TMensagemController.BuscarPorID(AID: Integer): TModelMensagem;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TMensagemController.Create;
begin
  FDAO := TDAOOperacao<TModelMensagem>.Create(dm.Conn);
end;

destructor TMensagemController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TMensagemController.ExcluidoCancelado(AID, AIDUser: Integer): boolean;
var
Dao :TDaoMensagem;
begin
  Result  := false;
  Dao     := TDaoMensagem.Create;

  try
    if Dao.Delete(AID, AIDUser) then
    result  := True;
  finally
    Dao.Free;
  end;

end;

function TMensagemController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TMensagemController.ListarTodos(const FiltroCampo,
  FiltroStatus: string): TObjectList<TModelMensagem>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := 'Select id_mensagem, codigo, descricao, case when ativo=''S'' then ''Ativo'' else ''Inativo'' end as ativo, uso From mensagem where excluido=0';

  if FiltroCampo.Trim <> '' then
  begin
    SQL := SQL + ' AND (descricao LIKE :filtro or uso like :filtro or codigo = :filtro)';
    Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
  end;

  if FiltroStatus.Trim <> '' then
  begin
    SQL := SQL + ' AND ativo = :ativo';
    Params := Params + [TPair<string, Variant>.Create('ativo', FiltroStatus)];
  end;

  SQLORDER  := ' order by descricao';

  Result := FDAO.FindWhere(SQL + SQLORDER, Params);
end;

function TMensagemController.Salvar(ADoc: TModelMensagem; out RetornoID: integer): Boolean;
begin
  Result          :=  False;

   if ADoc.id_mensagem = 0 then
  begin
    ADoc.Codigo       := FDao.GetNextCode('codigo');
    Adoc.excluido     := 0;
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

      Result := FDAO.Update(ADoc);
    except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;
  end;
end;

end.
