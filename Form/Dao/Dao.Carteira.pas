unit Dao.Carteira;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TDaoCarteira = Class

  Private

  public
    Class Function Reativar(AID:Integer):Boolean;
    Class Function ReativarDependente(AID:Integer):Boolean;
    Class Function IncluiRegistroSincronizar:Boolean;
  End;

implementation

{ TDaoCarteira }

class function TDaoCarteira.IncluiRegistroSincronizar: Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update carteira set sinc_app=''S'' where id_carteira > 0 and excluido=0';
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

class function TDaoCarteira.Reativar(AID: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update carteira set excluido= 0, ativo=''S'', data_exc= null, id_usuario_exc= null, sinc_app=''S'' where id_socio= :id';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;
      Qry.ParamByName('id').AsInteger     := AID;
      Qry.ExecSQL;
      Result          := true;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao na função de Reativar:'+sLineBreak+e.Message);
      end;
    End;

  finally
    Qry.Free;
  end;
end;

class function TDaoCarteira.ReativarDependente(AID: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update carteira set excluido= 0, ativo=''S'', data_exc= null, id_usuario_exc= null, sinc_app=''S'' where id_carteira= :id';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;
      Qry.ParamByName('id').AsInteger     := AID;
      Qry.ExecSQL;
      Result          := true;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao na função de Reativar:'+sLineBreak+e.Message);
      end;
    End;

  finally
    Qry.Free;
  end;
end;

end.
