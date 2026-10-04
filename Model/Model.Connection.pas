unit Model.Connection;

interface

uses
  System.Classes, System.IniFiles, System.SysUtils,
  UniProvider, MySQLUniProvider, DBAccess, Uni,
  Data.DB, MemDS;

//var
  //FConnection : TUniConnection;

  function GetConnection: TUniConnection; //criada para teste
  Function SetupConnection(FConn: TUniConnection): String;
  //Function Connect : TUniConnection;
  //Procedure Disconect;
  procedure ReleaseConnection(var FConn: TUniConnection); // criada nova
  //Procedure EnsuredatabaseExists;

implementation

uses UConeSul;

function SetupConnection(FConn: TUniConnection): string;
var
  arq_ini : string;
  ini : TIniFile;
  senha:string;
begin
  arq_ini := GetCurrentDir + '\Config.ini';

  // Verifica se INI existe...
  if NOT FileExists(arq_ini) then
  begin
    Result := 'Arquivo INI não encontrado: ' + arq_ini;
    exit;
  end;

  // Instanciar arquivo INI...
  ini     := TIniFile.Create(arq_ini);

  try
    senha   := ini.ReadString('DADOS', 'Password', '');
    // Buscar dados do arquivo fisico...
    with FConn do
    begin
      ProviderName      := ini.ReadString('DADOS', 'DriverID', '');//'MySQL';
      Server            := ini.ReadString('DADOS', 'Server', '');//'192.168.130.12';
      Port              := ini.Readinteger('DADOS', 'Port', 3306);//3306;
      DataBase          := ini.ReadString('DADOS', 'Database', '');//'easyapidb';
      UserName          := ini.ReadString('DADOS', 'User_Name', '');//'Root';
      PassWord          := TConeSul.Crypt('D',senha);// ini.ReadString('DADOS', 'Password', '');//'hd860412';
      LoginPrompt       := False;
      SpecificOptions.Values['charset'] :='utf8mb4';
      SpecificOptions.Values['Connectiontimeout'] :='30';
      SpecificOptions.Values['UseUnicode'] :='True';

      Pooling := true;
      PoolingOptions.MaxPoolSize:= 50;
      PoolingOptions.MinPoolSize:= 2;
      PoolingOptions.ConnectionLifetime:= 30;
      Result := 'OK';
    end;

  finally
    if Assigned(ini) then
    ini.DisposeOf;
  end;

end;

function GetConnection: TUniConnection;
begin
  Result := TUniConnection.Create(nil);
  try
    SetupConnection(Result);
    Result.Connected := True;
  except
    Result.Free;
    raise;
  end;
end;

procedure ReleaseConnection(var FConn: TUniConnection);
begin
  if Assigned(FConn) then
  begin
    if FConn.Connected then
      FConn.Connected := False;
    FreeAndNil(FConn);
  end;
end;


{function Connect : TUniConnection;
begin
  if not Assigned(FConnection) then
  begin
    FConnection := TUniConnection.Create(nil);
    SetupConnection(FConnection);
    EnsureDatabaseExists;
  end;
  if not FConnection.Connected then
    FConnection.Connected := True;
  Result := FConnection;

    {       codigo antes
    FConnection := TUniConnection.Create(nil);
    SetupConnection(FConnection);
    EnsureDatabaseExists;
    FConnection.Connected := true;

    Result := FConnection;
    }
{
end; }
{
procedure Disconect;
begin
  if Assigned(FConnection) then
  begin
    if FConnection.Connected then
      FConnection.Connected := False;
    FConnection.Free;  // Libera o objeto
    FConnection := nil;  // Garante que o objeto não seja acessado após a liberação
  end;

    {   codigo antes
    if Assigned(FConnection) then
    begin
        if FConnection.Connected then
            FConnection.Connected := false;

        FConnection.Free;
    end;
    }
{
end; }
{
Procedure EnsuredatabaseExists;
var
  TempConnection: TUniConnection;
  DatabaseName: string;
  Qry :TUniquery;
begin
  TempConnection  := TUniConnection.Create(nil);
  try
    SetupConnection(TempConnection);
    // Desconectar do banco atual para verificar a existência do banco de dados
    TempConnection.DataBase := '';
    TempConnection.Connected := True;

    // Obter o nome do banco de dados do arquivo INI
    DatabaseName := FConnection.Database;

    // Verificar se o banco de dados existe
    Qry := TUniQuery.Create(nil);

    try
      Qry.Connection := TempConnection;
      Qry.SQL.Text := 'SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = :DatabaseName';
      Qry.ParamByName('DatabaseName').AsString := DatabaseName;
      Qry.Open;

      if Qry.IsEmpty then
      TempConnection.ExecSQL('CREATE DATABASE ' + DatabaseName+' CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci');

    finally
      Qry.Free;
    end;

    TempConnection.Connected := False;
  finally
    TempConnection.Free;
  end;
end;}

end.
