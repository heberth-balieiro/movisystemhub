unit uDbMigrations;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections,
  Uni, DB;

type
  TMigrateProc = reference to procedure (Conn: TUniConnection);

  TMigration = record
    Name: string;      // nome único (ex: '001_create_receber')
    Proc: TMigrateProc;// código que executa as alterações
  end;

  IMigrationLogger = interface
    ['{3F93E3E4-1B14-47B7-9E05-0E7F9B59D2C3}']
    procedure Info(const S: string);
    procedure Error(const S: string);
  end;

  TMigrator = class
  private
    FConn: TUniConnection;
    FLogger: IMigrationLogger;

    // Consultas internas
    function TableExists(const ATable: string; const ADatabase: string = ''): Boolean;
    function ColumnExists(const ATable, AColumn: string; const ADatabase: string = ''): Boolean;
    function IndexExists(const ATable, AIndex: string; const ADatabase: string = ''): Boolean;
    function ForeignKeyExists(const ATable, AFKName: string; const ADatabase: string = ''): Boolean;

    procedure ExecSQL(const SQL: string);
    procedure EnsureMigrationsTable;
    function IsMigrationApplied(const AName: string): Boolean;
    procedure MarkMigrationApplied(const AName: string);
    function CurrentDatabase: string;

  public
    constructor Create(AConn: TUniConnection; ALogger: IMigrationLogger = nil);
    procedure RunAll(const Migrations: TArray<TMigration>);

    // Helpers (podem ser usados dentro das migrations)
    procedure CreateTableIfMissing(const TableSQL, TableName: string);
    procedure AddColumnIfMissing(const TableName, ColumnName, ColumnDDL: string);
    procedure AddIndexIfMissing(const TableName, IndexName, IndexDDL: string);
    procedure AddForeignKeyIfMissing(const TableName, FKName, FKDDL: string);
    procedure ChangeColumnifMissing(const TableName, ColumnName,ColumnName2, ColumnDDL: string);
    procedure UpdateTabela(const Sql: String);

    // ✅ Wrappers públicos para checagem (evitam acesso a privados)
    function HasTable(const ATable: string; const ADatabase: string = ''): Boolean;
    function HasColumn(const ATable, AColumn: string; const ADatabase: string = ''): Boolean;
    function HasIndex(const ATable, AIndex: string; const ADatabase: string = ''): Boolean;
    function HasForeignKey(const ATable, AFKName: string; const ADatabase: string = ''): Boolean;

    property Conn: TUniConnection read FConn;
  end;

implementation

uses
  System.Variants;

{ TMigrator }

constructor TMigrator.Create(AConn: TUniConnection; ALogger: IMigrationLogger);
begin
  inherited Create;
  FConn := AConn;
  FLogger := ALogger;
end;

procedure TMigrator.ExecSQL(const SQL: string);
var
  Q: TUniQuery;
begin
  if Assigned(FLogger) then FLogger.Info('SQL: ' + SQL);
  Q := TUniQuery.Create(nil);
  try
    Q.Connection := FConn;
    Q.SQL.Text := SQL;
    Q.Execute;
  finally
    Q.Free;
  end;
end;

function TMigrator.CurrentDatabase: string;
var
  Q: TUniQuery;
begin
  Result := '';
  Q := TUniQuery.Create(nil);
  try
    Q.Connection := FConn;
    Q.SQL.Text := 'SELECT DATABASE() AS db';
    Q.Open;
    if not Q.IsEmpty then
      Result := Q.FieldByName('db').AsString;
  finally
    Q.Free;
  end;
end;

function TMigrator.TableExists(const ATable, ADatabase: string): Boolean;
var
  Q: TUniQuery;
  DBName: string;
begin
  DBName := ADatabase;
  if DBName = '' then DBName := CurrentDatabase;

  Q := TUniQuery.Create(nil);
  try
    Q.Connection := FConn;
    Q.SQL.Text :=
      'SELECT COUNT(*) AS cnt '+
      'FROM INFORMATION_SCHEMA.TABLES '+
      'WHERE TABLE_SCHEMA = :db AND TABLE_NAME = :tbl';
    Q.ParamByName('db').AsString  := DBName;
    Q.ParamByName('tbl').AsString := ATable;
    Q.Open;
    Result := Q.Fields[0].AsInteger > 0;
  finally
    Q.Free;
  end;
end;

procedure TMigrator.UpdateTabela(const Sql: String);
begin
  Try
    ExecSQL(Sql);
  except on e:exception do
    raise Exception.Create(e.Message);
  End;
end;

function TMigrator.ColumnExists(const ATable, AColumn, ADatabase: string): Boolean;
var
  Q: TUniQuery;
  DBName: string;
begin
  DBName := ADatabase;
  if DBName = '' then DBName := CurrentDatabase;

  Q := TUniQuery.Create(nil);
  try
    Q.Connection := FConn;
    Q.SQL.Text :=
      'SELECT COUNT(*) AS cnt '+
      'FROM INFORMATION_SCHEMA.COLUMNS '+
      'WHERE TABLE_SCHEMA = :db AND TABLE_NAME = :tbl AND COLUMN_NAME = :col';
    Q.ParamByName('db').AsString  := DBName;
    Q.ParamByName('tbl').AsString := ATable;
    Q.ParamByName('col').AsString := AColumn;
    Q.Open;
    Result := Q.Fields[0].AsInteger > 0;
  finally
    Q.Free;
  end;
end;

function TMigrator.IndexExists(const ATable, AIndex, ADatabase: string): Boolean;
var
  Q: TUniQuery;
  DBName: string;
begin
  DBName := ADatabase;
  if DBName = '' then DBName := CurrentDatabase;

  Q := TUniQuery.Create(nil);
  try
    Q.Connection := FConn;
    Q.SQL.Text :=
      'SELECT COUNT(*) AS cnt '+
      'FROM INFORMATION_SCHEMA.STATISTICS '+
      'WHERE TABLE_SCHEMA = :db AND TABLE_NAME = :tbl AND INDEX_NAME = :idx';
    Q.ParamByName('db').AsString  := DBName;
    Q.ParamByName('tbl').AsString := ATable;
    Q.ParamByName('idx').AsString := AIndex;
    Q.Open;
    Result := Q.Fields[0].AsInteger > 0;
  finally
    Q.Free;
  end;
end;

function TMigrator.ForeignKeyExists(const ATable, AFKName, ADatabase: string): Boolean;
var
  Q: TUniQuery;
  DBName: string;
begin
  DBName := ADatabase;
  if DBName = '' then DBName := CurrentDatabase;

  Q := TUniQuery.Create(nil);
  try
    Q.Connection := FConn;
    Q.SQL.Text :=
      'SELECT COUNT(*) AS cnt '+
      'FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS '+
      'WHERE CONSTRAINT_SCHEMA = :db AND TABLE_NAME = :tbl '+
      'AND CONSTRAINT_NAME = :fk AND CONSTRAINT_TYPE = ''FOREIGN KEY''';
    Q.ParamByName('db').AsString  := DBName;
    Q.ParamByName('tbl').AsString := ATable;
    Q.ParamByName('fk').AsString  := AFKName;
    Q.Open;
    Result := Q.Fields[0].AsInteger > 0;
  finally
    Q.Free;
  end;
end;

procedure TMigrator.EnsureMigrationsTable;
begin
  if not TableExists('schema_migrations') then
  begin
    ExecSQL(
      'CREATE TABLE schema_migrations ('+
      '  id INT NOT NULL AUTO_INCREMENT,'+
      '  name VARCHAR(255) NOT NULL,'+
      '  applied_at DATETIME NOT NULL,'+
      '  PRIMARY KEY (id),'+
      '  UNIQUE KEY uq_schema_migrations_name (name)'+
      ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;'
    );
    if Assigned(FLogger) then FLogger.Info('Tabela schema_migrations criada.');
  end;
end;

function TMigrator.IsMigrationApplied(const AName: string): Boolean;
var
  Q: TUniQuery;
begin
  Q := TUniQuery.Create(nil);
  try
    Q.Connection := FConn;
    Q.SQL.Text := 'SELECT 1 FROM schema_migrations WHERE name = :n LIMIT 1';
    Q.ParamByName('n').AsString := AName;
    Q.Open;
    Result := not Q.IsEmpty;
  finally
    Q.Free;
  end;
end;

procedure TMigrator.MarkMigrationApplied(const AName: string);
var
  Q: TUniQuery;
begin
  Q := TUniQuery.Create(nil);
  try
    Q.Connection := FConn;
    Q.SQL.Text :=
      'INSERT INTO schema_migrations (name, applied_at) VALUES (:n, NOW())';
    Q.ParamByName('n').AsString := AName;
    Q.Execute;
  finally
    Q.Free;
  end;
end;

procedure TMigrator.CreateTableIfMissing(const TableSQL, TableName: string);
begin
  if not TableExists(TableName) then
  begin
    ExecSQL(TableSQL);
    if Assigned(FLogger) then FLogger.Info('Create table: ' + TableName);
  end
  else if Assigned(FLogger) then
    FLogger.Info('Table already exists: ' + TableName);
end;

procedure TMigrator.AddColumnIfMissing(const TableName, ColumnName, ColumnDDL: string);
begin
  if not ColumnExists(TableName, ColumnName) then
  begin
    ExecSQL(Format('ALTER TABLE %s ADD COLUMN %s %s;', [TableName, ColumnName, ColumnDDL]));
    if Assigned(FLogger) then FLogger.Info(Format('Add column %s.%s',[TableName, ColumnName]));
  end
  else if Assigned(FLogger) then
    FLogger.Info(Format('Column already exists %s.%s',[TableName, ColumnName]));
end;

procedure TMigrator.ChangeColumnifMissing(const TableName, ColumnName, ColumnName2, ColumnDDL: string);
begin
  if ColumnExists(TableName, ColumnName) then
  begin
    ExecSQL(Format('ALTER TABLE %s CHANGE COLUMN %s %s %s;', [TableName, ColumnName, ColumnName2, ColumnDDL]));
    if Assigned(FLogger) then FLogger.Info(Format('CHANGE column %s.%s',[TableName, ColumnName]));
  end
  else
  begin
    ExecSQL(Format('ALTER TABLE %s ADD COLUMN %s %s;', [TableName, ColumnName, ColumnDDL]));
    if Assigned(FLogger) then FLogger.Info(Format('Add column %s.%s',[TableName, ColumnName]));
  end
end;

procedure TMigrator.AddIndexIfMissing(const TableName, IndexName, IndexDDL: string);
begin
  if not IndexExists(TableName, IndexName) then
  begin
    ExecSQL(Format('ALTER TABLE %s ADD %s;', [TableName, IndexDDL])); // IndexDDL = 'INDEX idx_name (col)'
    if Assigned(FLogger) then FLogger.Info('Add index: '+IndexName+' on '+TableName);
  end
  else if Assigned(FLogger) then
    FLogger.Info('Index already exists: '+IndexName);
end;

procedure TMigrator.AddForeignKeyIfMissing(const TableName, FKName, FKDDL: string);
begin
  if not ForeignKeyExists(TableName, FKName) then
  begin
    ExecSQL(Format('ALTER TABLE %s ADD CONSTRAINT %s %s;', [TableName, FKName, FKDDL]));
    if Assigned(FLogger) then FLogger.Info('Add FK: '+FKName+' on '+TableName);
  end
  else if Assigned(FLogger) then
    FLogger.Info('FK already exists: '+FKName);
end;

procedure TMigrator.RunAll(const Migrations: TArray<TMigration>);
const
  MIG_ATUALIZACAO_CADASTRAL_RETORNO_API =
    '047_integracao_atualizacao_cadastral_retorno_api';
var
  M: TMigration;
begin
  EnsureMigrationsTable;

  FConn.StartTransaction;
  try
    for M in Migrations do
    begin
      if IsMigrationApplied(M.Name) then
      begin
        if Assigned(FLogger) then FLogger.Info('Skip migration: ' + M.Name);
        Continue;
      end;

      if Assigned(FLogger) then FLogger.Info('Running migration: ' + M.Name);
      try
        M.Proc(FConn);            // executa a migration
        MarkMigrationApplied(M.Name);
        if Assigned(FLogger) then FLogger.Info('Applied: ' + M.Name);
      except
        on E: Exception do
        begin
          if Assigned(FLogger) then FLogger.Error('Fail: ' + M.Name + ' - ' + E.Message);
          FConn.Rollback;
          raise; // propaga para você tratar
        end;
      end;
    end;

    // Migração local do Hub para controlar o retorno do EasyBot à API.
    // Fica no módulo de migrations do EasyOne; o EasyBot não altera schema local.
    if TableExists('integracao_atualizacao_cadastral') and
       not IsMigrationApplied(MIG_ATUALIZACAO_CADASTRAL_RETORNO_API) then
    begin
      if Assigned(FLogger) then
        FLogger.Info('Running migration: ' + MIG_ATUALIZACAO_CADASTRAL_RETORNO_API);

      AddColumnIfMissing(
        'integracao_atualizacao_cadastral',
        'retornado_api_em',
        'DATETIME NULL'
      );
      AddColumnIfMissing(
        'integracao_atualizacao_cadastral',
        'retorno_api_erro',
        'VARCHAR(500) NULL'
      );

      MarkMigrationApplied(MIG_ATUALIZACAO_CADASTRAL_RETORNO_API);
      if Assigned(FLogger) then
        FLogger.Info('Applied: ' + MIG_ATUALIZACAO_CADASTRAL_RETORNO_API);
    end;

    FConn.Commit;
  except
    on E: Exception do
    begin
      if FConn.InTransaction then
        FConn.Rollback;
      raise;
    end;
  end;
end;

{ === Wrappers públicos === }

function TMigrator.HasTable(const ATable, ADatabase: string): Boolean;
begin
  Result := TableExists(ATable, ADatabase);
end;

function TMigrator.HasColumn(const ATable, AColumn, ADatabase: string): Boolean;
begin
  Result := ColumnExists(ATable, AColumn, ADatabase);
end;

function TMigrator.HasIndex(const ATable, AIndex, ADatabase: string): Boolean;
begin
  Result := IndexExists(ATable, AIndex, ADatabase);
end;

function TMigrator.HasForeignKey(const ATable, AFKName, ADatabase: string): Boolean;
begin
  Result := ForeignKeyExists(ATable, AFKName, ADatabase);
end;

end.
