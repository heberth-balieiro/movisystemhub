unit DAO.Utilitarios;

interface

uses
  Uni, DBClient, DB, Provider, System.SysUtils;

type
  TDAOUtil = class
  public
    class function GetDataSetAsCDS(const Conn: TUniConnection; const SQL: string): TClientDataSet;
  end;

implementation

class function TDAOUtil.GetDataSetAsCDS(const Conn: TUniConnection; const SQL: string): TClientDataSet;
var
  Qry: TUniQuery;
  Prov: TDataSetProvider;
  CDS: TClientDataSet;
begin
  Qry := TUniQuery.Create(nil);
  Prov := TDataSetProvider.Create(nil);
  CDS := TClientDataSet.Create(nil);
  try
    Qry.Connection := Conn;
    Qry.SQL.Text := SQL;
    Qry.Open;

    Prov.DataSet := Qry;
    CDS.SetProvider(Prov);
    CDS.Open;

    Result := CDS;
  finally
    Prov.Free;
    Qry.Free;
  end;
end;

end.

