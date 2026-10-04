unit Dao.Produto;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TDaoProduto = Class

  Private

  public
    Class Function Delete(AID:Integer):Boolean;

  End;

implementation

{ TDaoProduto }

class function TDaoProduto.Delete(AID: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update produto set excluido= 1, ativo=''N'' where id_produto= :id';
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
