unit Dao_Sindicato_Empresa;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TDaoSindicato_Empresa = Class

  Private

  public
    Class Function Delete(AID, AIDUser:Integer):Boolean;
    Class Function MarcaSincronizar(AID:Integer):Boolean;
  End;

implementation

{ TDaoSindicato_Empresa }

class function TDaoSindicato_Empresa.Delete(AID,AIDUser: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Delete from sindicato_empresa where sind_id_empresa= :id';
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

class function TDaoSindicato_Empresa.MarcaSincronizar(AID: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update sindicato_empresa set sinc_app=''S'' where sind_id_empresa= :id';
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
        raise Exception.Create('Erro ao na função de marca como sincronizado:'+sLineBreak+e.Message);
      end;
    End;

  finally
    Qry.Free;
  end;
end;

end.
