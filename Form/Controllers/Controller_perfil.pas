unit Controller_Perfil;

interface

uses
  Model.Perfil,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao_Perfil;
type
  TPerfilController = class
  private
    FDAO      : TDAOOperacao<TModelPerfil>;
    FDAONivel : TDAOOperacao<TModelNivel>;
  public

    constructor Create;
    destructor Destroy; override;
    function ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TModelPerfil>;
    function BuscarPorID(AID: Integer): TModelPerfil;
    function Salvar(ADoc: TModelPerfil; out RetornoID:integer): Boolean;
    function Excluir(AID: Integer): Boolean;
    function ExcluidoCancelado(AID, AIDUser: Integer):boolean;

    function InserirTela(const AModulo, ATela, ADescricao:String):Boolean;
    function InserirNivel(out msg: String; AId, AIdEmpresa: integer): Boolean;
    Function ListarNivelPerfil(AID, AIDEmpresa:Integer):TObjectList<TModelNivel>;
    function UpdateNivel(const AIDPerfil, AIDNivel:Integer; const ALiberado:String):Boolean;
  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TPerfilController }

function TPerfilController.BuscarPorID(AID: Integer): TModelPerfil;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TPerfilController.Create;
begin
  FDAO      := TDAOOperacao<TModelPerfil>.Create(dm.Conn);
  FDAONivel := TDAOOperacao<TModelNivel>.Create(dm.Conn);
end;

destructor TPerfilController.Destroy;
begin
  FDAO.Free;
  FDAONivel.Free;
  inherited;
end;

function TPerfilController.ExcluidoCancelado(AID, AIDUser: Integer): boolean;
var
Dao :TDaoPerfil;
begin
  Result  := false;
  Dao     := TDaoPerfil.Create;
  try
    if Dao.Delete(AID, AIDUser) then
    result  := True;
  finally
    Dao.Free;
  end;
end;

function TPerfilController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TPerfilController.InserirNivel(out msg: String; AId, AIdEmpresa: integer): Boolean;
var
Dao :TDaoPerfil;
begin
  Result  := false;
  Dao     := TDaoPerfil.Create;
  try
    if Dao.InserirNivel(msg, Aid, AidEmpresa) then
    result  := True;
  finally
    Dao.Free;
  end;
end;

function TPerfilController.InserirTela(const AModulo, ATela, ADescricao: String): Boolean;
var
Dao :TDaoPerfil;
begin
  Result  := false;
  Dao     := TDaoPerfil.Create;
  try
    if Dao.InserirTela(AModulo, ATela, ADescricao) then
    result  := True;
  finally
    Dao.Free;
  end;
end;

function TPerfilController.ListarNivelPerfil(AID, AIDEmpresa: Integer): TObjectList<TModelNivel>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
  S:String;
begin
  SQL   := 'Select id_nivel, id_perfil, tela, nome, liberado, modulo'+
                           ' FROM nivel ';

  SQL := SQL + ' WHERE ID_PERFIL= :AId ';
  Params := Params + [TPair<string, Variant>.Create('AID', AID)];

  SQLORDER  := ' order by modulo, tela';

  InserirNivel(s, AID, AIDEmpresa);

  Result := FDAONivel.FindWhere(SQL + SQLORDER, Params);

end;

function TPerfilController.ListarTodos(const FiltroCampo,FiltroStatus: string): TObjectList<TModelPerfil>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := 'Select id_perfil, codigo, descricao, Case when ativo=''S'' then ''Ativo'' else ''Inativo'' end as inativo From perfil where excluido=0';
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
  SQLORDER  := ' order by descricao';
  Result := FDAO.FindWhere(SQL + SQLORDER, Params);
end;

function TPerfilController.Salvar(ADoc: TModelPerfil; out RetornoID: integer): Boolean;
begin
  Result          :=  False;
   if ADoc.id_perfil = 0 then
  begin
    ADoc.Codigo       := FDao.GetNextCode('codigo');
    Adoc.excluido     := 0;
    Adoc.sistema      := 0;
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


function TPerfilController.UpdateNivel(const AIDPerfil, AIDNivel: Integer; const ALiberado: String): Boolean;
var
Dao :TDaoPerfil;
begin
  Result  := false;
  Dao     := TDaoPerfil.Create;
  try
    if Dao.UpdateNivel(AIDPerfil,AIDNivel,ALiberado) then
    result  := True;
  finally
    Dao.Free;
  end;
end;

end.
