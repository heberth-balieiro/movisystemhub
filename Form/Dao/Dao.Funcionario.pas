unit Dao.Funcionario;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TDaoFuncionario = Class

  Private

  public
    Class Function Delete(AID:Integer):Boolean;

  End;

implementation

{ TDaoFuncionario }

class function TDaoFuncionario.Delete(AID: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update funcionario set excluido= 1, ativo=''N'' where id_funcionario= :id';
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

end.
