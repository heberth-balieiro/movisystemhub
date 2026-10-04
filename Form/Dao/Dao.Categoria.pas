unit Dao.Categoria;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TDaoCategoria = Class

  Private

  public
    Class Function Delete(const AIDRegistro: integer; const AIDUser: Integer; const AIDEmpresa: integer):Boolean;
    Class Function ExisteNome(const AStr: String; const AIDEmpresa: Integer =0; const AIDIgnorar:integer = 0):Boolean;
    Class Function PossuiVinculo(const AIDRegistro:Integer):boolean;
  End;

implementation

{ TDaoCategoria }

class function TDaoCategoria.Delete(const AIDRegistro: integer; const AIDUser: Integer; const AIDEmpresa: integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update categoria set excluido= 1, data_exclusao= :dt, id_usuario_exc= :iduser, '+
            ' ativo=''N'' where id_categoria= :idcategoria and id_empresa= :id_empresa';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;

      Qry.ParamByName('idcategoria').AsInteger   := AIDRegistro;
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

class function TDaoCategoria.ExisteNome(const AStr: String; const AIDEmpresa: Integer =0; const AIDIgnorar:integer = 0): Boolean;
var
  Qry: TUniQuery;
  Const
  QryStr  = ' Select count(*) as total from categoria where Upper(descricao) = Upper(:descricao)';
begin
  Result := False;

  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection  := dm.conn;
    Qry.SQL.Text    := QryStr;

    if AIDIgnorar > 0 then
      Qry.SQL.Add(' AND id_categoria <> :id_categoria ');


    if AIDEmpresa > 0 then
    begin
      Qry.SQL.Add(' and id_empresa = :id_empresa');
      Qry.ParamByName('id_empresa').AsInteger   := AIdEmpresa;
    end;

    Qry.ParamByName('descricao').AsString     := Trim(AStr);

    if AIDIgnorar > 0 then
      Qry.ParamByName('id_categoria').AsInteger := AIDIgnorar;

    Qry.Open;

    Result := Qry.FieldByName('total').AsInteger > 0;

  finally
    Qry.Free;
  end;
end;

class function TDaoCategoria.PossuiVinculo(const AIDRegistro: integer): boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = ' Select count(*) as total from bens where id_categoria= :id_categoria';
begin
  Result := False;

  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection  := dm.conn;
    Qry.SQL.Text    := QryStr;
    Qry.ParamByName('id_categoria').AsInteger   := AIDRegistro;
    Qry.Open;
    Result := Qry.FieldByName('total').AsInteger > 0;
  finally
    Qry.Free;
  end;
end;

end.
