unit Dao_Usuario;
interface
Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient,
  Model.Usuario;
Type
  TDaoUsuario = Class
  Private
  public
    Class Function Delete(AID, AIDUser:Integer):Boolean;
    Class Function ValidarLoginAcesso(const ALogin, ASenha: String): TModelUsuario;
    Class Function AlterarSenha(Out AMensagem: String; const ASenha, ASenhaAntiga:String; AID:Integer):Boolean;
    Class Function IncluiRegistroSincronizar:Boolean;
  End;
implementation
{ TDaoUsuario }

class function TDaoUsuario.AlterarSenha(out AMensagem: String; const ASenha, ASenhaAntiga: String; AID: Integer): Boolean;
var
  Qry: TUniQuery;
  SenhaAtual: string;
begin
  Result := False;
  AMensagem := '';
  if Trim(ASenha) = '' then
  begin
    AMensagem := 'Informe a nova senha.';
    Exit;
  end;
  Qry := TUniQuery.Create(nil);
  try
    try
      if not dm.Conn.Connected then
        dm.Conn.Connected := True;
      Qry.Connection := dm.Conn;
      // Buscar senha atual
      Qry.SQL.Text :=
        'SELECT senha FROM usuario ' +
        'WHERE id_usuario = :id AND ativo = ''S''';
      Qry.ParamByName('id').AsInteger := AID;
      Qry.Open;
      if Qry.IsEmpty then
      begin
        AMensagem := 'Usuário não encontrado ou inativo.';
        Exit;
      end;
      SenhaAtual := Qry.FieldByName('senha').AsString;
      //Validar senha antiga
      if SenhaAtual <> ASenhaAntiga then
      begin
        AMensagem := 'Senha atual inválida.';
        Exit;
      end;
      Qry.Close;
      // Atualizar senha
      Qry.SQL.Text :=
        'UPDATE usuario SET senha = :novaSenha ' +
        'WHERE id_usuario = :id';
      Qry.ParamByName('novaSenha').AsString   := ASenha;
      Qry.ParamByName('id').AsInteger := AID;
      Qry.ExecSQL;
      Result := True;
      AMensagem := 'Senha alterada com sucesso.';
    except
      on E: Exception do
        raise Exception.Create(
          'Erro ao alterar senha do usuário:' + sLineBreak + E.Message);
    end;
  finally
    Qry.Free;
  end;
end;

class function TDaoUsuario.Delete(AID,AIDUser: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update usuario set excluido=1, ativo=''N'' where id_usuario= :id';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;
      Qry.ParamByName('id').AsInteger := AID;
      Qry.ExecSQL;
      Result          := true;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao na função de Delete:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TDaoUsuario.IncluiRegistroSincronizar: Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update usuario set sinc_app=''S'' where id_usuario > 0';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;

      Qry.ExecSQL;
      Result          := true;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao na função de IncluiRegistroSincronizar:'+sLineBreak+e.Message);
      end;
    End;

  finally
    Qry.Free;
  end;
end;

class function TDaoUsuario.ValidarLoginAcesso(const ALogin, ASenha: String): TModelUsuario;
var
  Qry: TUniQuery;
Const
  QryStr  = 'SELECT id_usuario, nome, login, senha, email, id_perfil FROM USUARIO '+
                    'where ativo=''S'' and LOWER(login) = LOWER(:login) and senha= :senha';
begin
  Qry := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;
      Qry.ParamByName('login').AsString := ALogin;
      Qry.ParamByName('senha').AsString := Asenha;
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        Result  := TModelUsuario.Create;
        Result.idusuario    := Qry.FieldByName('id_usuario').AsInteger;
        Result.nome         := Qry.FieldByName('nome').AsString;
        Result.login        := Qry.FieldByName('login').AsString;
        Result.senha        := Qry.FieldByName('senha').AsString;
        Result.idperfil     := Qry.FieldByName('id_perfil').AsInteger;
        Result.email        := Qry.FieldByName('email').AsString;
      end
      else
      Result  := nil;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao na função de ValidarLoginAcesso:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

end.
