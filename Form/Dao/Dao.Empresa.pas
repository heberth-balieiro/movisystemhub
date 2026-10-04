unit Dao.Empresa;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient, UConeSul;

Type
  TDaoEmpresa = Class

  Private

  public
    Class Function Delete(AID:Integer):Boolean;

    //Habilitar empresa para web
    Class Function HabilitarDesabilitarWeb(const AIDEmpresa: Integer): Boolean;

  End;

implementation

{ TDaoEmpresa }

class function TDaoEmpresa.Delete(AID: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Delete from empresa where id_empresa= :id';
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

class function TDaoEmpresa.HabilitarDesabilitarWeb(const AIDEmpresa: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Select habilitadoweb from empresa where id_empresa= :id';
  QryStrA = 'Update empresa set habilitadoweb= :web, sinc_app=''S'', guid= :guid where id_empresa= :id';
begin
  Result  := False;
  Qry     := TUniQuery.Create(nil);

  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;
      Qry.ParamByName('id').AsInteger := AIDEmpresa;
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        if Qry.FieldByName('habilitadoweb').AsString='S' then
        begin
          Result  := False;
        end
        else
        begin
          Qry.Close;
          Qry.SQL.Text                            := QryStrA;
          Qry.ParamByName('web').AsString         := 'S';
          Qry.ParamByName('guid').AsString        := TConeSul.GerarGuid;
          qry.ParamByName('id').AsInteger         := AIDEmpresa;
          Qry.ExecSQL;
          Result          := true;
        end;
      end;

    except on e:Exception do
      begin
        raise Exception.Create('Erro ao na função de HabilitarDesabilitarWeb:'+sLineBreak+e.Message);
      end;
    End;

  finally
    Qry.Free;
  end;
end;

end.
