unit Dao.Grupo;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TDaoGrupo = Class

  Private

  public
    Class Function Delete(AID,AIDUser:Integer):Boolean;

  End;

implementation

{ TDaoGrupo }

class function TDaoGrupo.Delete(AID, AIDUser: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update grupo set excluido= 1, ativo=''N'', data_excluido= :dt, id_usuario_exc= :iduser where id_grupo= :id';
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

end.
