unit uEleicaoResultadoMigrations;

interface

uses
  System.SysUtils,
  Uni,
  uDbMigrations;

procedure AppendEleicaoResultadoMigrations(
  var AList: TArray<TMigration>;
  AMigrator: TMigrator
);

implementation

procedure AddMigration(
  var AList: TArray<TMigration>;
  const AName: string;
  const AProc: TMigrateProc
);
var
  L: Integer;
  M: TMigration;
begin
  L := Length(AList);
  SetLength(AList, L + 1);
  M.Name := AName;
  M.Proc := AProc;
  AList[L] := M;
end;

procedure AppendEleicaoResultadoMigrations(
  var AList: TArray<TMigration>;
  AMigrator: TMigrator
);
begin
  AddMigration(
    AList,
    '048_initial_schema_eleicao_resultado',
    procedure(Conn: TUniConnection)
    var
      SQL: string;
    begin
      SQL :=
        'CREATE TABLE IF NOT EXISTS eleicao_resultado (' +
        ' id_resultado BIGINT NOT NULL AUTO_INCREMENT,' +
        ' id_empresa INT NOT NULL,' +
        ' id_eleicao INT NOT NULL,' +
        ' operacao VARCHAR(30) NULL,' +
        ' situacao VARCHAR(30) NOT NULL,' +
        ' total_eleitores INT NOT NULL DEFAULT 0,' +
        ' total_votantes INT NOT NULL DEFAULT 0,' +
        ' total_nao_votantes INT NOT NULL DEFAULT 0,' +
        ' total_votos INT NOT NULL DEFAULT 0,' +
        ' votos_validos INT NOT NULL DEFAULT 0,' +
        ' votos_brancos INT NOT NULL DEFAULT 0,' +
        ' votos_nulos INT NOT NULL DEFAULT 0,' +
        ' recebido_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,' +
        ' atualizado_em DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,' +
        ' PRIMARY KEY (id_resultado),' +
        ' UNIQUE KEY uk_eleicao_resultado (id_empresa, id_eleicao),' +
        ' KEY idx_eleicao_resultado_eleicao (id_eleicao),' +
        ' KEY idx_eleicao_resultado_situacao (id_empresa, situacao)' +
        ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;';

      AMigrator.CreateTableIfMissing(SQL, 'eleicao_resultado');
    end
  );

  AddMigration(
    AList,
    '049_initial_schema_eleicao_resultado_chapa',
    procedure(Conn: TUniConnection)
    var
      SQL: string;
    begin
      SQL :=
        'CREATE TABLE IF NOT EXISTS eleicao_resultado_chapa (' +
        ' id_resultado_chapa BIGINT NOT NULL AUTO_INCREMENT,' +
        ' id_empresa INT NOT NULL,' +
        ' id_eleicao INT NOT NULL,' +
        ' id_chapa INT NOT NULL,' +
        ' numero INT NULL,' +
        ' nome VARCHAR(200) NULL,' +
        ' quantidade_votos INT NOT NULL DEFAULT 0,' +
        ' percentual DECIMAL(10,4) NOT NULL DEFAULT 0.0000,' +
        ' recebido_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,' +
        ' atualizado_em DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,' +
        ' PRIMARY KEY (id_resultado_chapa),' +
        ' UNIQUE KEY uk_eleicao_resultado_chapa (id_empresa, id_eleicao, id_chapa),' +
        ' KEY idx_eleicao_resultado_chapa_eleicao (id_empresa, id_eleicao),' +
        ' KEY idx_eleicao_resultado_chapa_chapa (id_chapa)' +
        ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;';

      AMigrator.CreateTableIfMissing(SQL, 'eleicao_resultado_chapa');
    end
  );
end;

end.
