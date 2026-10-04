unit Controller_Usuario;
interface
uses
  Model.Usuario,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao_Usuario;
type
  TUsuarioController = class
  private
    FDAO: TDAOOperacao<TModelUsuario>;
  public
    constructor Create;
    destructor Destroy; override;
    function ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TModelUsuario>;
    function BuscarPorID(AID: Integer): TModelUsuario;
    function Salvar(ADoc: TModelUsuario; out RetornoID:integer): Boolean;
    function Excluir(AID: Integer): Boolean;
    function ExcluidoCancelado(AID, AIDUser: Integer):boolean;
    function ValidarLoginAcesso(const ALogin, ASenha: String):TModelUsuario;
    function AlterarSenha(out AMensagem: String; const ASenha, ASenhaAntiga: String; AID: Integer): Boolean;
    function IncluiRegistroSincronizar: boolean;
  end;
implementation
uses UDM, cxDateUtils, System.Variants;
{ TUsuarioController }

function TUsuarioController.AlterarSenha(out AMensagem: String; const ASenha,ASenhaAntiga: String; AID: Integer): Boolean;
var
Dao :TDaoUsuario;
begin
  Result  := False;
  try
    if Trim(ASenha) = '' then
    begin
      AMensagem := 'Informe a nova senha.';
      Result    := False;
      Exit;
    end;

    Dao     := TDaoUsuario.Create;
    try
      if Dao.AlterarSenha(AMensagem,ASenha,ASenhaAntiga,AID) then      
      Result  := True
    finally
      Dao.Free;
    end;

  except on e:exception do
   begin
    raise Exception.Create(e.Message);
   end;
  End;
end;

function TUsuarioController.BuscarPorID(AID: Integer): TModelUsuario;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TUsuarioController.Create;
begin
  FDAO := TDAOOperacao<TModelUsuario>.Create(dm.Conn);
end;

destructor TUsuarioController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TUsuarioController.ExcluidoCancelado(AID, AIDUser: Integer): boolean;
var
Dao :TDaoUsuario;
begin
  Result  := false;
  Dao     := TDaoUsuario.Create;
  try
    if Dao.Delete(AID, AIDUser) then
    result  := True;
  finally
    Dao.Free;
  end;
end;

function TUsuarioController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TUsuarioController.IncluiRegistroSincronizar: boolean;
var
Dao :TDaoUsuario;
begin
  Result  := false;
  Dao     := TDaoUsuario.Create;
  try
    if Dao.IncluiRegistroSincronizar then
    result  := True;
  finally
    Dao.Free;
  end;
end;

function TUsuarioController.ListarTodos(const FiltroCampo,FiltroStatus: string): TObjectList<TModelUsuario>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := 'Select                                                              '+
           ' u.id_usuario as idusuario,                                                      '+
           ' u.nome,                                                            '+
           ' u.login,                                                           '+
           ' u.email,                                                           '+
           ' p.descricao,                                                       '+
           ' Case                                                               '+
           ' When u.ativo=''S'' then ''Ativo'' else ''Inativo'' end as ativo      '+
           ' from usuario u                                                     '+
           ' Inner join perfil p                                                '+
           ' on u.id_perfil = p.id_perfil                                       '+
           ' where u.sistema = ''N'' ';

  if FiltroCampo.Trim <> '' then
  begin
    SQL := SQL + ' AND (u.nome LIKE :filtro or u.login like :filtro)';
    Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
  end;

  if FiltroStatus.Trim <> '' then
  begin
    SQL := SQL + ' AND ativo = :ativo';
    Params := Params + [TPair<string, Variant>.Create('ativo', FiltroStatus)];
  end;
  SQLORDER  := ' order by u.login';

  Result := FDAO.FindWhere(SQL + SQLORDER, Params);

end;

function TUsuarioController.Salvar(ADoc: TModelUsuario; out RetornoID: integer): Boolean;
begin
  Result          :=  False;
   if ADoc.idusuario = 0 then
  begin
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

function TUsuarioController.ValidarLoginAcesso(const ALogin, ASenha: String): TModelUsuario;
var
Dao :TDaoUsuario;
begin

  try
    Dao     := TDaoUsuario.Create;
    try
      Result  := Dao.ValidarLoginAcesso(ALogin, Asenha);
    finally
      Dao.Free;
    end;

  except on e:exception do
   begin
    raise Exception.Create(e.Message);
   end;
  End;
end;

end.
