unit Dao.Marca;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TDaoMarca = Class

  Private

  public
    Class Function Delete(AID,AIDuser:Integer):Boolean;

  End;

implementation

{ TDaoMarca }

class function TDaoMarca.Delete(AID,AIDuser: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update marca set excluido= 1, ativo=''N'', data_excluido= :dt, id_usuario_exc= :iduser where id_marca= :id';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;
      Qry.ParamByName('id').AsInteger     := AID;
      qry.ParamByName('dt').AsDateTime    := now;
      Qry.ParamByName('iduser').AsInteger := AIDuser;
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
