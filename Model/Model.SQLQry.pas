unit Model.SQLQry;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  data.DB,
  datasnap.dbclient,
  System.Variants;

Type
  TModelSQL = Class

  Private
    class var FTransacao  : TUniTransaction;

  Public
    class Function GerarId(Conn:Tuniconnection;tab, campo:string):integer;
    class function ExecutarSQL(Conn:Tuniconnection; const sqlQuery: string;
      const Params: array of Variant): Boolean;
    class function ConsultarSQL(Conn:Tuniconnection; const sqlQuery: string;
      const Params: array of Variant): TUniQuery;

End;

implementation

{ TModelSQL }

class function TModelSQL.ConsultarSQL(Conn:Tuniconnection; const sqlQuery: string;
  const Params: array of Variant): TUniQuery;
var
  Qry: TUniQuery;
  I: Integer;
begin
  Qry := TUniQuery.Create(nil);

  try

    Qry.Connection  := Conn;
    Qry.SQL.Text    := sqlQuery;

    // Adicionando os parâmetros à consulta
    for I := Low(Params) to High(Params) do
      Qry.Params[I].Value := Params[I];

    // Executa a consulta
    Qry.Open;

    // Retorna o resultado da consulta
    Result := Qry;
    //Qry.Close;
  except
    on E: Exception do
    begin
      Qry.Free;  // Libera a query em caso de erro
      raise Exception.Create('Erro ao consultar dados: ' + E.Message);
    end;
  end;
end;

class function TModelSQL.ExecutarSQL(Conn:Tuniconnection; const sqlQuery: string;
  const Params: array of Variant): Boolean;
var
  Qry: TUniQuery;
  I: Integer;
  ParamValue: Variant;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := Conn;
      Qry.SQL.Text := sqlQuery;

      // Se houver parâmetros, adiciona-os
      for I := Low(Params) to High(Params) do
      begin
        ParamValue := Params[I];

        // Tratamento especial para campos de data
        if VarIsNull(ParamValue) or VarIsEmpty(ParamValue) then
        begin
          Qry.Params[I].DataType := ftDateTime; // Define o tipo do parâmetro como data/hora
          Qry.Params[I].Clear;                 // Define o valor como NULL
        end
        else if VarType(ParamValue) = varDate then
        begin
          Qry.Params[I].AsDateTime := TDateTime(ParamValue);
        end
        else
        begin
          Qry.Params[I].Value := ParamValue;  // Outros tipos de dados
        end;
      end;

      Qry.ExecSQL;
      Result := True;  // Sucesso
    except on E: Exception do
      raise Exception.Create('Erro ao executar SQL: ' + E.Message);
    end;
  finally
    Qry.Free;
  end;
end;

class function TModelSQL.GerarId(Conn:Tuniconnection; tab, campo: string): integer;
var
Qry       : TUniquery;
sqlQuery  : string;
begin
  Result  := 0;
  Qry     := TUniquery.create(nil);
  Try
    Try
      Qry.Connection := Conn;
      sqlQuery := 'SELECT MAX(' + campo + ') AS id FROM ' + tab;

      With Qry do
      begin
        Qry.SQL.Text := sqlQuery;
        Open;

        if not Qry.IsEmpty then
        Result := Qry.FieldByName('id').AsInteger + 1
        else
        Result  := 1;

        Close;
      end;

    Except on e:exception do
      raise Exception.Create('Erro ao gerar ID:' + e.message);
    End;

  Finally
    Qry.free;
  End;
end;

end.
