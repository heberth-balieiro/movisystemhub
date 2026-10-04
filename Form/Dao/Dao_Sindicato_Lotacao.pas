unit Dao_Sindicato_Lotacao;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TDaoSindicato_Lotacao = Class

  Private

  public
    Class Function Delete(AID, AIDUser:Integer):Boolean;
    Class Function IncluiRegistroSincronizar:Boolean;
  End;

implementation

{ TDaoSindicato_Lotacao }

class function TDaoSindicato_Lotacao.Delete(AID,AIDUser: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update sindicato_lotacao set excluido= 1, data_exc= :dt, id_usuario_exc= :iduser where id_lotacao= :id';
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

class function TDaoSindicato_Lotacao.IncluiRegistroSincronizar: Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update sindicato_lotacao set sinc_app=''S'' where id_lotacao > 0 and excluido=0';
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
