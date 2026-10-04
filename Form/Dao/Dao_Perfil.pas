unit Dao_Perfil;
interface
Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient;
Type
  TDaoPerfil = Class
  Private
  public
    Class Function Delete(AID, AIDUser:Integer):Boolean;
    Class function InserirTela(const AModulo, ATela, ADescricao:String):Boolean;
    Class function InserirNivel(out msg:String; AId,AIdEmpresa:integer):Boolean;
    Class function UpdateNivel(const AIDPerfil, AIDNivel:Integer; const ALiberado:String):Boolean;

  End;
implementation
{ TDaoPerfil }
class function TDaoPerfil.Delete(AID,AIDUser: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update perfil set excluido=1, ativo=''N'' where id_perfil= :id';
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
class function TDaoPerfil.InserirNivel(out msg: String; AId, AIdEmpresa: integer): Boolean;
var
Qry, QryTela, Qrynivel : TUniquery;
sqlQuery, SqlQueryTela,SqlQryNivel: string;
I:integer;
begin
  Result  := False;
  sqlQuery      := 'Insert Into nivel '+
          '( id_nivel, id_perfil,id_empresa, tela, nome, liberado, modulo '+
          ')'+
          ' Values'+
          '(:idnivel, :idperfil, :idempresa, :tela, :nome, :liberado, :modulo)';
  SqlQueryTela  := 'Select * from tela where id_tela > 0 order by tela';
  SqlQryNivel   := 'Select tela, nome from nivel where id_perfil= :idperfil and tela= :tela and nome= :nome';

  Qry     := TUniquery.create(nil);
  QryTela := TUniquery.create(nil);
  Qrynivel:= TUniquery.create(nil);

  Try
    Try
      Qry.Connection      := dm.Conn;
      QryTela.Connection  := dm.Conn;
      Qrynivel.Connection := dm.Conn;

      //Qry Buscar telas tabela telas
      QryTela.SQL.Text    := sqlQuerytela;
      QryTela.Open;
      QryTela.First;

      While not QryTela.Eof do
      begin

        Qrynivel.Params.Clear;
        Qrynivel.SQL.Text   := SqlQryNivel;
        Qrynivel.Params.ParamByName('idperfil').AsInteger   := Aid;
        Qrynivel.Params.ParamByName('tela').AsString        := QryTela.FieldByName('tela').AsString;
        Qrynivel.Params.ParamByName('nome').AsString        := QryTela.FieldByName('nome').AsString;

        Qrynivel.Open;

        if Qrynivel.Eof then
        begin
          //Inserir na tabela do nivel
          Qry.Params.Clear;
          Qry.SQL.Text                            := sqlQuery;
          Qry.ParamByName('idnivel').AsInteger    := 0;
          Qry.ParamByName('idperfil').Asinteger   := Aid;
          Qry.ParamByName('idempresa').AsInteger  := Aidempresa;
          Qry.ParamByName('tela').AsString        := QryTela.FieldByName('tela').AsString;
          Qry.ParamByName('nome').Asstring        := QryTela.FieldByName('nome').AsString;
          Qry.ParamByName('liberado').AsString    := 'S';
          Qry.ParamByName('modulo').Asstring      := QryTela.FieldByName('modulo').AsString;

          Qry.ExecSql;
        end;

        QryTela.Next;
        msg     := 'Dados Inserido no Banco de Dados';
        Result  := True;
      end;

      QryTela.Close;
      Qrynivel.Close;

    Except on e:exception do
      begin
        msg := 'Erro ao inserir:' +e.message;
        raise;
      end;
    End;

  Finally
    FreeAndNil(Qry);
    FreeAndNil(QryTela);
    FreeAndNil(Qrynivel);
  End;
end;

class function TDaoPerfil.InserirTela(const AModulo, ATela, ADescricao: String): Boolean;
var
Qry, QryTela       : TUniquery;
sqlQuery, SqlQueryTela  : string;
I:integer;
begin
  Result    := False;
  sqlQuery  := 'Insert Into tela'+
                '(id_tela, tela, nome, modulo)'+
                'Values'+
                '(0, :tela, :nome, :modulo)';

  SqlQueryTela  := 'Select id_tela from tela where id_tela > 0 and tela= :tela and nome= :nome';

  Qry     := TUniquery.create(nil);
  QryTela := TUniquery.create(nil);

  Try
    Try
      Qry.Connection      := dm.Conn;
      QryTela.Connection  := dm.Conn;

      QryTela.Params.Clear;
      QryTela.SQL.Text    := SqlQueryTela;
      QryTela.Params.ParamByName('tela').AsString   := Atela;
      QryTela.Params.ParamByName('nome').AsString   := Trim(Adescricao);
      QryTela.Open;

      if QryTela.Eof then
      begin
        Qry.Params.Clear;
        Qry.SQL.Text      := sqlQuery;
        Qry.Params.ParamByName('tela').AsString     := Atela;
        Qry.Params.ParamByName('nome').AsString     := Trim(Adescricao);
        Qry.Params.ParamByName('modulo').AsString     := Trim(Amodulo);

        Qry.ExecSql;
        Result  := True;
      end;

    Except on e:exception do
      begin
        raise Exception.Create('Error: '+e.Message);
      end;
    End;

  Finally
    FreeAndNil(Qry);
    FreeAndNil(QryTela);
  End;
end;

class function TDaoPerfil.updateNivel(const AIDPerfil, AIDNivel:Integer; Const ALiberado: String): Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.Conn;
      // Consulta SQL para atualização
      sqlQuery := 'UPDATE nivel SET ' +
                  ' liberado = :liberado' +
                  ' WHERE id_perfil = :idperfil and id_nivel= :idnivel';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      // Definindo parâmetros
      Qry.ParamByName('idperfil').AsInteger   := AIDPerfil;
      Qry.ParamByName('liberado').AsString    := Trim(ALiberado);
      Qry.ParamByName('idnivel').Asinteger    := AIDNivel;

      Qry.ExecSQL;
      Result := True;
    except
      on E: Exception do
      begin
       raise Exception.Create(e.Message);
      end;
    end;
  finally
    Qry.Free;
  end;
end;

end.
