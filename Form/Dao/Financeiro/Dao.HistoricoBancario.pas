unit Dao.HistoricoBancario;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TDaoHistoricoBancario = Class

  Private

  public
    //Class Function Delete(const AIDRegistro: integer; const AIDUser: Integer; const AIDEmpresa: integer):Boolean;
    Class Function ExisteNome(const AStr: String; const AIDEmpresa: Integer = 0; const AIDIgnorar:integer = 0):Boolean;
    Class Function ExisteVinculo(const AIDEmpresa: Integer = 0; const AIDRegistro:integer = 0):Boolean;
  End;

implementation

{ TDaoHistoricoBancario }

class function TDaoHistoricoBancario.ExisteNome(const AStr: String;const AIDEmpresa, AIDIgnorar: integer): Boolean;
var
  Qry: TUniQuery;
  Const
  QryStr  = ' Select count(*) as total from historico_bancario where Upper(descricao) = Upper(:descricao)';
begin
  Result := False;

  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection  := dm.conn;
    Qry.SQL.Text    := QryStr;

    if AIDIgnorar > 0 then
      Qry.SQL.Add(' AND id_historico <> :id_historico ');


    if AIDEmpresa > 0 then
    begin
      Qry.SQL.Add(' and id_empresa = :id_empresa');
      Qry.ParamByName('id_empresa').AsInteger   := AIdEmpresa;
    end;

    Qry.ParamByName('descricao').AsString     := Trim(AStr);

    if AIDIgnorar > 0 then
      Qry.ParamByName('id_historico').AsInteger := AIDIgnorar;

    Qry.Open;

    Result := Qry.FieldByName('total').AsInteger > 0;

  finally
    Qry.Free;
  end;
end;

class function TDaoHistoricoBancario.ExisteVinculo(const AIDEmpresa,AIDRegistro: integer): Boolean;
var
  Qry: TUniQuery;
  Const
  QryStr  = ' Select count(*) as total from lancamento_bancario where id_historico = :idhistorico ';
begin
  Result := False;

  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection  := dm.conn;
    Qry.SQL.Text    := QryStr;

    if AIDEmpresa > 0 then
    begin
      Qry.SQL.Add(' and id_empresa = :id_empresa');
      Qry.ParamByName('id_empresa').AsInteger   := AIdEmpresa;
    end;

    Qry.ParamByName('idhistorico').AsInteger    := AIDRegistro;
    Qry.Open;
    Result := Qry.FieldByName('total').AsInteger > 0;

  finally
    Qry.Free;
  end;
end;

end.
