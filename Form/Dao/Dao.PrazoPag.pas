{
13/03/2025 12:24 até as 12:27
Dão a parte para comando eventuais fora do dao generico
}

unit Dao.PrazoPag;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TDaoPrazoPag = Class

  Private


  public
    Class Function Delete(AID, AIDUser:Integer):Boolean;

  End;

implementation

{ TDaoPrazoPag }

class function TDaoPrazoPag.Delete(AID, AIDUser: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update prazopagamento set excluido= 1, ativo=''N'', data_excluido= :dt, id_usuario_exc= :iduser where id_prazo= :id';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;
      Qry.ParamByName('id').AsInteger     := AID;
      Qry.ParamByName('dt').AsDateTime    := Now;
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
