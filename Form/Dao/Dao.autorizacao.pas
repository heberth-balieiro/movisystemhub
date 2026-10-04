unit Dao.autorizacao;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TDaoAutorizacao = Class

  Private

  public
    Class Function Delete(AID,AIDUser:Integer):Boolean;
    Class Function IncluiRegistroSincronizar:Boolean;
  End;

implementation

{ TDaoAutorizacao }

class function TDaoAutorizacao.Delete(AID, AIDUser: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update autorizacao set excluido= 1, status=''S'', data_excluido= :dt, id_usuario_exc= :iduser, sinc_app=''S'' where id_autorizacao= :id';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;
      Qry.ParamByName('id').AsInteger := AID;
      Qry.ParamByName('dt').AsDateTime:= now;
      Qry.ParamByName('iduser').AsInteger := AIDUser;
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

class function TDaoAutorizacao.IncluiRegistroSincronizar: Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update autorizacao set sinc_app=''S'' where id_autorizacao > 0 and excluido=0';
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

end.
