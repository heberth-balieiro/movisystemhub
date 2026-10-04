unit Dao_Sindicato_Dependentes;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TDaoSindicato_Dependentes = Class

  Private

  public
    Class Function Delete(AID, AIDUser:Integer):Boolean;

  End;

implementation

{ TDaoSindicato_Dependentes }

class function TDaoSindicato_Dependentes.Delete(AID,AIDUser: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update sindicato_dependente set excluido= 1, data_exc= :dt, id_usuario_exc= :iduser, sinc_app=''S'' where id_dependente= :id';
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
