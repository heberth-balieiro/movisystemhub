unit DAO.TipoSituacao;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TDaoTipoSituacao = Class

  Private

  public
    Class Function Delete(const AIDRegistro: integer; const AIDUser: Integer; const AIDEmpresa: integer):Boolean;
    Class Function ExisteNome(const AStr: String; const AIDEmpresa: Integer =0; const AIDIgnorar:integer = 0):Boolean;
    Class Function PossuiVinculo(const AIDRegistro:Integer):boolean;
  End;

implementation

{ TDaoTipoSituacao }

class function TDaoTipoSituacao.Delete(const AIDRegistro: integer; const AIDUser: Integer; const AIDEmpresa: integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update sindicato_tipo_situacao set excluido= 1, data_exclusao= :dt, id_usuario_exc= :iduser, '+
            ' ativo=''N'' where id_situacao= :idsituacao and id_empresa= :id_empresa';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;

      Qry.ParamByName('idsituacao').AsInteger   := AIDRegistro;
      Qry.ParamByName('dt').AsDateTime          := now;
      Qry.ParamByName('iduser').AsInteger       := AIDUser;
      Qry.ParamByName('id_empresa').AsInteger   := AIDEmpresa;
      Qry.ExecSQL;
      Result     := Qry.RowsAffected > 0;

    except on e:Exception do
      begin
        raise Exception.Create('Erro ao na função de Delete:'+sLineBreak+e.Message);
      end;
    End;

  finally
    Qry.Free;
  end;
end;

class function TDaoTipoSituacao.ExisteNome(const AStr: String; const AIDEmpresa: Integer =0; const AIDIgnorar:integer = 0): Boolean;
var
  Qry: TUniQuery;
  Const
  QryStr  = ' Select count(*) as total from sindicato_tipo_situacao where Upper(descricao) = Upper(:descricao)';
begin
  Result := False;

  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection  := dm.conn;
    Qry.SQL.Text    := QryStr;

    if AIDIgnorar > 0 then
      Qry.SQL.Add(' AND id_situacao <> :id_situacao ');


    if AIDEmpresa > 0 then
    begin
      Qry.SQL.Add(' and id_empresa = :id_empresa');
      Qry.ParamByName('id_empresa').AsInteger   := AIdEmpresa;
    end;

    Qry.ParamByName('descricao').AsString     := Trim(AStr);

    if AIDIgnorar > 0 then
      Qry.ParamByName('id_situacao').AsInteger := AIDIgnorar;

    Qry.Open;

    Result := Qry.FieldByName('total').AsInteger > 0;

  finally
    Qry.Free;
  end;
end;

class function TDaoTipoSituacao.PossuiVinculo(const AIDRegistro: integer): boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = ' Select count(*) as total from socio where id_tiposituacao= :id_tiposituacao';
begin
  Result := False;

  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection  := dm.conn;
    Qry.SQL.Text    := QryStr;
    Qry.ParamByName('id_tiposituacao').AsInteger   := AIDRegistro;
    Qry.Open;
    Result := Qry.FieldByName('total').AsInteger > 0;
  finally
    Qry.Free;
  end;
end;

end.
