unit Dao.Transportadora;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TDaoTransportadora = Class

  Private

  public
    Class Function Delete(const AID, AIDUser:Integer):Boolean;

  End;

implementation

{ TDaoTransportadora }

class function TDaoTransportadora.Delete(const AID, AIDUser: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update transportadora set excluido= 1, ativo=''N'', data_exclusao= :dtx, id_usuario_exclusao= :iduser where id_transportadora= :id';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;
      Qry.ParamByName('dtx').AsDate       := Now;
      Qry.ParamByName('iduser').AsInteger := AIDUser;
      Qry.ParamByName('id').AsInteger     := AID;
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
