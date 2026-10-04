unit Dao.LancamentoBancario;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TDaoLancamentoBancario = Class

  Private


  public
    //Class Function Delete(const AIDRegistro: integer; const AIDUser: Integer; const AIDEmpresa: integer):Boolean;
    Class function ExisteFITID(const AFitID: string; const AIDEmpresa, AIDConta: Integer): Boolean; static;
    Class Function ExisteVinculoAnexo(const AOrigem:string;
                                      const AIDEmpresa: Integer = 0;
                                      const AIDRegistro:integer = 0):Boolean;
    Class Function Desconciliar(const AIDEmpresa :Integer = 0;
                                const AIDRegistro:integer = 0;
                                const AIDUser:integer = 0):Boolean;
  End;

implementation

{ TDaoLancamentoBancario }

class function TDaoLancamentoBancario.Desconciliar(const AIDEmpresa,
                                                   AIDRegistro, AIDUser: integer): Boolean;
var
  Qry: TUniQuery;
  Const
  QryStr  = 'Update lancamento_bancario set situacao=''PENDENTE'', conciliado=''N'', '+
            ' data_conciliacao=NULL, id_usuario_desco= :iduser, data_desconciliacao= :datad '+
            ' where id_empresa= :idempresa and id_lancamento_bancario= :id';
begin
  Result  := False;

  Qry := TUniQuery.Create(nil);
  Try
    Qry.Connection  := dm.conn;
    Qry.SQL.Text    := QryStr;

    Qry.ParamByName('iduser').AsInteger       := AIDUser;
    Qry.ParamByName('datad').AsDate           := Date;
    Qry.ParamByName('idempresa').AsInteger    := AIDEmpresa;
    Qry.ParamByName('id').AsInteger           := AIDRegistro;

    Qry.Execute;
    Result        := Qry.RowsAffected > 0;
  Finally
    Qry.Free;
  End;

end;

class function TDaoLancamentoBancario.ExisteVinculoAnexo(const AOrigem: string;
                                const AIDEmpresa, AIDRegistro: integer): Boolean;
var
  Qry: TUniQuery;
  Const
  QryStr  = ' Select count(*) as total from anexo where id_referencia = :idreferencia '+
              ' and tipo_referencia= :origem ';
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

    Qry.ParamByName('idreferencia').AsInteger   := AIDRegistro;
    Qry.ParamByName('origem').AsString          := AOrigem;

    Qry.Open;
    Result := Qry.FieldByName('total').AsInteger > 0;

  finally
    Qry.Free;
  end;
end;

class function TDaoLancamentoBancario.ExisteFITID(const AFitID: string; const AIDEmpresa, AIDConta: Integer): Boolean;
const
  QryStr =
    'SELECT 1 ' +
    ' FROM lancamento_bancario ' +
    ' WHERE id_empresa = :idempresa ' +
    '  AND fitid = :fitid ' +
    '  AND id_conta = :idconta  '+
    ' LIMIT 1';
var
  Qry: TUniQuery;
begin
  Result := False;

  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := dm.Conn;
    Qry.SQL.Text := QryStr;

    Qry.ParamByName('idempresa').AsInteger  := AIDEmpresa;
    Qry.ParamByName('fitid').AsString       := Trim(AFitID);
    Qry.ParamByName('idconta').AsInteger    := AIDConta;
    Qry.Open;

    Result := not Qry.IsEmpty;
  finally
    Qry.Free;
  end;
end;

end.
