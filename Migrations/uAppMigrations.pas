unit uAppMigrations;

interface

uses
  System.SysUtils, System.Generics.Collections,
  Uni,
  uDbMigrations;

procedure RunAppMigrations(AConn: TUniConnection);

implementation

uses
  Winapi.Windows;

type
  TLogger     = class(TInterfacedObject, IMigrationLogger)
  public
    procedure Info(const S: string);
    procedure Error(const S: string);
  end;

{ TLogger }

procedure TLogger.Info(const S: string);
begin
  // Troque para seu logger preferido
  OutputDebugString(PChar('[MIG] ' + S));
end;

procedure TLogger.Error(const S: string);
begin
  OutputDebugString(PChar('[MIG][ERR] ' + S));
end;

// Função auxiliar para adicionar migrations sem repetir muito código
procedure AddMigration(var List: TArray<TMigration>; const AName: string; const AProc: TMigrateProc);
var
  L: Integer;
  M: TMigration;
begin
  L := Length(List);
  SetLength(List, L + 1);
  M.Name := AName;
  M.Proc := AProc;
  List[L] := M;
end;

// -----------------------------------------------------------------------------
// Ponto único onde você registra TODAS as migrations do app
procedure RunAppMigrations(AConn: TUniConnection);
var
  Migrator: TMigrator;
  Migs: TArray<TMigration>;
begin
  Migrator := TMigrator.Create(AConn, TLogger.Create);
  try
    SetLength(Migs, 0);
    //=================== Criação de Tabelas =======================

    {$REGION 'Criação Tabela'}

    {$REGION 'Socio 001'}
    // ================= 001 - Tabela SOCIO =================
    AddMigration(Migs, '001_initial_schema_socio',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
        SQL: string;
      begin
        SQL :=
          'CREATE TABLE socio ('+
          '  id_socio INT NOT NULL AUTO_INCREMENT,'+
          '  id_empresa INT NOT NULL,'+
          '  id_sede INT NOT NULL,'+
          '  codigo INT DEFAULT NULL,'+
          '  matricula INT DEFAULT NULL,'+
          '  socio_deste DATE DEFAULT NULL,'+
          '  situacao VARCHAR(45) NULL,'+
          '  nome VARCHAR(150) NOT NULL,'+
          '  apelido VARCHAR(60) NULL,'+
          '  cep VARCHAR(20) NULL,'+
          '  endereco VARCHAR(90) NULL,'+
          '  numero VARCHAR(15) NULL,'+
          '  bairro VARCHAR(60) NULL,'+
          '  complemento VARCHAR(45) NULL,'+
          '  id_cidade INT NOT NULL,'+
          '  telefone VARCHAR(20) NULL,'+
          '  celular VARCHAR(20) NULL,'+
          '  whatsapp VARCHAR(20) NULL,'+
          '  cpf VARCHAR(18) NULL,'+
          '  rg VARCHAR(20) NULL,'+
          '  orgao VARCHAR(15) NULL,'+
          '  ctps VARCHAR(15) NULL,'+
          '  serie VARCHAR(10) NULL,'+
          '  pis VARCHAR(15) NULL,'+
          '  sexo VARCHAR(20) NULL,'+
          '  estado_civil VARCHAR(20) NULL,'+
          '  nascimento DATE DEFAULT NULL,'+
          '  natural_cidade INT DEFAULT NULL,'+
          '  email VARCHAR(180) DEFAULT NULL,'+
          '  pai VARCHAR(90) DEFAULT NULL,'+
          '  mae VARCHAR(90) DEFAULT NULL,'+
          '  profissao VARCHAR(60) DEFAULT NULL,'+
          '  admissao DATE DEFAULT NULL,'+
          '  data_desativacao DATE DEFAULT NULL,'+
          '  obs VARCHAR(250) DEFAULT NULL,'+
          '  cli_tipo VARCHAR(20) DEFAULT NULL,'+
          '  cli_responsavel VARCHAR(45) DEFAULT NULL,'+
          '  cliente CHAR(1) DEFAULT ''S'','+
          '  fornecedor CHAR(1) DEFAULT ''N'','+
          '  envemail CHAR(1) DEFAULT ''S'','+
          '  envwhats CHAR(1) DEFAULT ''S'','+
          '  codfornecedor INT DEFAULT NULL,'+
          '  telefone2 VARCHAR(20) DEFAULT NULL,'+
          '  celular2 VARCHAR(20) DEFAULT NULL,'+
          '  aviso VARCHAR(500) DEFAULT NULL,'+
          '  foto LONGBLOB,'+
          '  escritorio INT DEFAULT NULL,'+
          '  mostrarapp CHAR(1) DEFAULT NULL,'+
          '  sindicato_perc_desconto DECIMAL(15,2) DEFAULT NULL,'+
          '  sindicato_salario DECIMAL(15,2) DEFAULT NULL,'+
          '  tipo_mensalidade VARCHAR(60) DEFAULT NULL,'+
          '  bloqueado CHAR(1) DEFAULT ''N'','+
          '  sind_id_empresa INT DEFAULT NULL,'+
          '  id_profissao INT DEFAULT NULL,'+
          '  id_lotacao INT DEFAULT NULL,'+
          '  limite DECIMAL(15,2) DEFAULT 0.00,'+
          '  prof_cnpj VARCHAR(20) DEFAULT NULL,'+
          '  prof_razao VARCHAR(150) DEFAULT NULL,'+
          '  prof_telefone VARCHAR(20) DEFAULT NULL,'+
          '  prof_cep VARCHAR(20) DEFAULT NULL,'+
          '  prof_endereco VARCHAR(60) DEFAULT NULL,'+
          '  prof_numero VARCHAR(20) DEFAULT NULL,'+
          '  prof_complemento VARCHAR(40) DEFAULT NULL,'+
          '  prof_bairro VARCHAR(40) DEFAULT NULL,'+
          '  prof_idcidade INT DEFAULT -1,'+
          '  prof_temposervico VARCHAR(40) DEFAULT NULL,'+
          '  cnh VARCHAR(5) DEFAULT NULL,'+
          '  tiporesidencia VARCHAR(45) DEFAULT NULL,'+
          '  temporesidencia VARCHAR(45) DEFAULT NULL,'+
          '  emissaorg DATE DEFAULT NULL,'+
          '  nacionalidade VARCHAR(45) DEFAULT NULL,'+
          '  ref_banco1 VARCHAR(40) DEFAULT NULL,'+
          '  ref_banco2 VARCHAR(40) DEFAULT NULL,'+
          '  ref_agencia1 VARCHAR(20) DEFAULT NULL,'+
          '  ref_agencia2 VARCHAR(20) DEFAULT NULL,'+
          '  ref_conta1 VARCHAR(20) DEFAULT NULL,'+
          '  ref_conta2 VARCHAR(20) DEFAULT NULL,'+
          '  ref_telefone1 VARCHAR(20) DEFAULT NULL,'+
          '  ref_telefone2 VARCHAR(20) DEFAULT NULL,'+
          '  ref_tempo1 VARCHAR(20) DEFAULT NULL,'+
          '  ref_tempo2 VARCHAR(20) DEFAULT NULL,'+
          '  ref_pessoal1 VARCHAR(40) DEFAULT NULL,'+
          '  ref_pessoal2 VARCHAR(40) DEFAULT NULL,'+
          '  ref_telefone3 VARCHAR(20) DEFAULT NULL,'+
          '  ref_telefone4 VARCHAR(20) DEFAULT NULL,'+
          '  ref_afinidade1 VARCHAR(40) DEFAULT NULL,'+
          '  ref_afinidade2 VARCHAR(40) DEFAULT NULL,'+
          '  ref_comercial1 VARCHAR(40) DEFAULT NULL,'+
          '  ref_comercial2 VARCHAR(40) DEFAULT NULL,'+
          '  ref_telefone5 VARCHAR(20) DEFAULT NULL,'+
          '  ref_telefone6 VARCHAR(20) DEFAULT NULL,'+
          '  fin_veiculo1 VARCHAR(60) DEFAULT NULL,'+
          '  fin_veiculo2 VARCHAR(60) DEFAULT NULL,'+
          '  fin_veiculo3 VARCHAR(60) DEFAULT NULL,'+
          '  fin_veiculo4 VARCHAR(60) DEFAULT NULL,'+
          '  fin_ano1 VARCHAR(10) DEFAULT NULL,'+
          '  fin_ano2 VARCHAR(10) DEFAULT NULL,'+
          '  fin_ano3 VARCHAR(10) DEFAULT NULL,'+
          '  fin_ano4 VARCHAR(10) DEFAULT NULL,'+
          '  fin_financiou1 CHAR(3) DEFAULT ''NÃO'','+
          '  fin_financiou2 CHAR(3) DEFAULT ''NÃO'','+
          '  fin_financiou3 CHAR(3) DEFAULT ''NÃO'','+
          '  fin_financiou4 CHAR(3) DEFAULT ''NÃO'','+
          '  fin_parcela1 DECIMAL(15,2) DEFAULT 0.00,'+
          '  fin_parcela2 DECIMAL(15,2) DEFAULT 0.00,'+
          '  fin_parcela3 DECIMAL(15,2) DEFAULT 0.00,'+
          '  fin_parcela4 DECIMAL(15,2) DEFAULT 0.00,'+
          '  fin_outros VARCHAR(60) DEFAULT NULL,'+
          '  excluido INT DEFAULT 0,'+
          '  sinc_app CHAR(1) DEFAULT ''N'','+
          '  data_exc DATE DEFAULT NULL,'+
          '  id_usuario_exc INT DEFAULT NULL,'+
          '  PRIMARY KEY (id_socio)'+
          ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;';

        M.CreateTableIfMissing(SQL, 'socio');


        // 2) Índices
        M.AddIndexIfMissing('socio', 's_id_empresa_idx', 'INDEX s_id_empresa_idx (id_empresa)');
        M.AddIndexIfMissing('socio', 'fk_id_cidade_idxs', 'INDEX fk_id_cidade_idxs (id_cidade)');

        // 3) FKs (só se as tabelas alvo existirem)
        if M.HasTable('cidade') then
          M.AddForeignKeyIfMissing('socio', 'fk_cidade_id',
            'FOREIGN KEY (id_cidade) REFERENCES cidade(ID_CIDADE)');

        if M.HasTable('empresa') then
          M.AddForeignKeyIfMissing('socio', 'fk_pessoa_empresa',
            'FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa) '+
            'ON DELETE RESTRICT ON UPDATE CASCADE');

      end
    );
    {$ENDREGION}

    {$REGION 'Anexo 002'}
    // ================= 002 - Tabela ANEXO =================
    AddMigration(Migs, '002_initial_schema_anexo',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
        SQL: string;
      begin
        SQL :=
          'CREATE TABLE anexo ('+
          '  id_anexo INT NOT NULL AUTO_INCREMENT,'+
          '  id_referencia INT NOT NULL,'+
          '  tipo_referencia VARCHAR(80) NOT NULL,'+

          '  nome_arquivo VARCHAR(255) NOT NULL,'+
          '  nome_original VARCHAR(255) DEFAULT NULL,'+
          '  extensao VARCHAR(10) DEFAULT NULL,'+
          '  tipo_arquivo VARCHAR(20) DEFAULT NULL,'+
          '  mime_type VARCHAR(100) DEFAULT NULL,'+

          '  arquivo_blob LONGBLOB NOT NULL,'+
          '  tamanho_bytes BIGINT DEFAULT NULL,'+

          '  observacao VARCHAR(500) DEFAULT NULL,'+
          '  datainclusao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,'+

          '  id_empresa INT NOT NULL,'+
          '  id_usuario INT NOT NULL,'+

          '  PRIMARY KEY (id_anexo)'+
          ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;';

        M.CreateTableIfMissing(SQL, 'anexo');

        M.AddIndexIfMissing(
          'anexo',
          'idx_anexo_empresa',
          'INDEX idx_anexo_empresa (id_empresa)'
        );

        M.AddIndexIfMissing(
          'anexo',
          'idx_anexo_tipo_ref',
          'INDEX idx_anexo_tipo_ref (id_empresa, tipo_referencia, id_referencia)'
        );
      end
    );
{$ENDREGION}

    {$REGION 'CFOP 003'}
    // ================= 003 - Tabela CFOP =================
    AddMigration(Migs, '003_initial_schema_cfop',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
        SQL: string;
      begin
        SQL :=
          'CREATE TABLE cfop(                         '+
          'id_cfop INT NOT NULL AUTO_INCREMENT,       '+
          'codigo INT NULL,                          '+
          'natureza VARCHAR(160) NULL,               '+
          'cfop VARCHAR(4) NULL,                     '+
          'operacao VARCHAR(15) NULL,                '+
          'tipo VARCHAR(15) NULL,                    '+
          'ativo CHAR(1) NULL DEFAULT ''S'',         '+
          'excluido INT NULL DEFAULT 0,              '+
          'id_empresa INT NULL,                      '+
          'id_usuario INT NULL,                      '+
          'id_usuario_alt INT NULL,                  '+
          'data_criacao DATE NULL,                   '+
          'data_alteracao DATE NULL,                 '+
          'PRIMARY KEY (id_cfop)                     '+
          ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;';

        M.CreateTableIfMissing(SQL, 'cfop');

        M.AddIndexIfMissing('cfop', 'fk_id_empresa_idx', 'INDEX `fk_id_empresa_idx` (`id_empresa` ASC) INVISIBLE');

        if M.HasTable('empresa') then
          M.AddForeignKeyIfMissing('cfop', 'fk_id_empresa_i',
            'FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa) ' +
            'ON DELETE CASCADE ON UPDATE NO ACTION');
      end);
    {$ENDREGION}

    {$REGION 'Conta-004'}
    // ================= 004 - Tabela CONTAS =================
    AddMigration(Migs, '004_initial_schema_contas',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
        SQL: string;
      begin
        SQL :=
          'CREATE TABLE contas (                    '+
          'id_conta int NOT NULL AUTO_INCREMENT,    '+
          'codigo int DEFAULT NULL,                 '+
          'agencia varchar(10) DEFAULT NULL,        '+
          'conta varchar(10) DEFAULT NULL,          '+
          'correntista varchar(255) DEFAULT NULL,   '+
          'saldo decimal(15,2) DEFAULT NULL,        '+
          'datasaldo date DEFAULT NULL,             '+
          'datacriacao date DEFAULT NULL,           '+
          'id_empresa int DEFAULT NULL,             '+
          'id_usuario int DEFAULT NULL,             '+
          'ativo char(1) NULL DEFAULT ''S'',        '+
          'PRIMARY KEY (id_conta)                   '+
          ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;';
        M.CreateTableIfMissing(SQL, 'contas');

        M.AddIndexIfMissing('contas', 'fk_contas_empresa_idx', 'INDEX `fk_contas_empresa_idx` (`id_empresa` ASC) INVISIBLE');

        if M.HasTable('empresa') then
          M.AddForeignKeyIfMissing('contas', 'fk_contas_empresa_idx',
            'FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa) ' +
            'ON DELETE CASCADE ON UPDATE NO ACTION');
      end);

    {$ENDREGION}

    {$Region 'Funcionario 005'}
    // ================= 005 - Tabela Funcionarios =================
    AddMigration(Migs, '005_initial_schema_funcionario',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
        SQL: string;
      begin
        SQL :=
          'CREATE TABLE funcionario (                                                              '+
          'id_funcionario int NOT NULL AUTO_INCREMENT,                                             '+
          'codigo int NOT NULL,                                                                    '+
          'nome varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,            '+
          'apelido varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,      '+
          'cpf varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,          '+
          'rg varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,           '+
          'cep varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,          '+
          'endereco varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,     '+
          'numero varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,       '+
          'complemento varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,  '+
          'bairro varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,       '+
          'id_cidade int NOT NULL,                                                                 '+
          'ativo char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''SIM'',         '+
          'id_empresa int NOT NULL,                                                                '+
          'email varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,       '+
          'data_cadastro date DEFAULT NULL,                                                        '+
          'id_usuario int DEFAULT NULL,                                                            '+
          'funcao varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,       '+
          'telefone varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,     '+
          'celular varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,      '+
          'whatsapp varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,     '+
          'nascimento date DEFAULT NULL,                                                           '+
          'obs varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,         '+
          'aviso varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,       '+
          'foto longblob,                                                                          '+
          'vendedor char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''N'',          '+
          'orgao varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,        '+
          'app char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,              '+
          'senha varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,       '+
          'sincronizado char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,     '+
          'tokenwhatsapp varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,'+
          'PRIMARY KEY (id_funcionario)                                                             '+
          ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;';

        M.CreateTableIfMissing(SQL, 'funcionario');

        M.AddIndexIfMissing('funcionario', 'fk_func_empresa_idx', 'INDEX `fk_func_empresa_idx` (`id_empresa` ASC) INVISIBLE');

        if M.HasTable('empresa') then
          M.AddForeignKeyIfMissing('funcionario', 'fk_func_empresa_i',
            'FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa) ' +
            'ON DELETE CASCADE ON UPDATE NO ACTION');
      end);
    {$ENDREGION}

    {$REGION 'PrazoPag-006'}
    // ================= 006 - Tabela PrazoPag =================
    AddMigration(Migs, '006_initial_schema_prazopag',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
        SQL: string;
      begin
        SQL :=
          'CREATE TABLE prazopagamento (                                                          '+
          'id_prazo int NOT NULL AUTO_INCREMENT,                                                  '+
          'codigo int NOT NULL,                                                                   '+
          'id_empresa int NOT NULL,                                                               '+
          'tipo varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,            '+
          'descricao varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,       '+
          'ativo char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''S'',          '+
          'data_cadastro date DEFAULT NULL,                                                       '+
          'id_usuario int DEFAULT NULL,                                                           '+
          'pedido char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''N'',         '+
          'sistema char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''N'',        '+
          'exibirapp char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''N'',      '+
          'PRIMARY KEY (id_prazo)                                                                 '+
          ') ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci';

        M.CreateTableIfMissing(SQL, 'prazopagamento');

      end);

    {$ENDREGION}

    {$REGION 'localizacao-007'}
    // ================= 007 - Tabela localizacao =================
    AddMigration(Migs, '007_initial_schema_localizacao',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
        SQL: string;
      begin
        SQL :=
          'CREATE TABLE `localizacao` (                                '+
          '`id_localizacao` int NOT NULL AUTO_INCREMENT,               '+
          '`codigo` int NOT NULL,                                      '+
          '`localizacao` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,   '+
          '`ativo` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,         '+
          '`data_cadastro` date DEFAULT NULL,                          '+
          '`data_alteracao` date DEFAULT NULL,                         '+
          '`excluido` int DEFAULT NULL,                                '+
          '`id_empresa` int DEFAULT NULL,                              '+
          '`id_usuario` int DEFAULT NULL,                              '+
          '`data_excluido` date DEFAULT NULL,                          '+
          '`id_usuario_exc` int DEFAULT NULL,                          '+
          '`id_usuario_alt` int DEFAULT NULL,                          '+
          'PRIMARY KEY (`id_localizacao`)                             '+
          ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci';

        M.CreateTableIfMissing(SQL, 'localizacao');

        M.AddIndexIfMissing('localizacao', 'fk_local_empresa_idx', 'INDEX `fk_local_empresa_idx` (`id_empresa` ASC) INVISIBLE');

        if M.HasTable('empresa') then
          M.AddForeignKeyIfMissing('localizacao', 'fk_contas_empresa_idx',
            'FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa) ' +
            'ON DELETE CASCADE ON UPDATE NO ACTION');

      end);

    {$ENDREGION}

    {$REGION 'grupo-008'}
    // ================= 008 - Tabela grupo =================
    AddMigration(Migs, '008_initial_schema_grupo',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
        SQL: string;
      begin
        SQL :=
          'CREATE TABLE `grupo` (                                                                     '+
          '`id_grupo` int NOT NULL AUTO_INCREMENT,                                                    '+
          '`codigo` int NOT NULL,                                                                     '+
          '`grupo` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,             '+
          '`ativo` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,             '+
          '`data_cadastro` date DEFAULT NULL,                                                         '+
          '`data_alteracao` date DEFAULT NULL,                                                        '+
          '`excluido` int DEFAULT NULL,                                                               '+
          '`id_empresa` int DEFAULT NULL,                                                             '+
          '`id_usuario` int DEFAULT NULL,                                                             '+
          '`tipo` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,              '+
          '`placa_obrigatorio` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''S'','+
          '`id_usuario_alt` int DEFAULT NULL,                                                         '+
          '`data_excluido` date DEFAULT NULL,                                                         '+
          '`id_usuario_exc` int DEFAULT NULL,                                                         '+
          'PRIMARY KEY (`id_grupo`)                                                                   '+
          ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci';
        M.CreateTableIfMissing(SQL, 'grupo');

        M.AddIndexIfMissing('grupo', 'fk_grupo_empresa_idx', 'INDEX `fk_grupo_empresa_idx` (`id_empresa` ASC) INVISIBLE');

        if M.HasTable('empresa') then
          M.AddForeignKeyIfMissing('contas', 'fk_grupo_empresa_i',
            'FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa) ' +
            'ON DELETE CASCADE ON UPDATE NO ACTION');

      end);

    {$ENDREGION}

    {$REGION 'Marca-009'}
    // ================= 009 - Tabela marca =================
    AddMigration(Migs, '009_initial_schema_marca',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
        SQL: string;
      begin
        SQL :=
          'CREATE TABLE `marca` (                                                           '+
          '`id_marca` int NOT NULL AUTO_INCREMENT,                                          '+
          '`codigo` int NOT NULL,                                                           '+
          '`marca` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,   '+
          '`ativo` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,   '+
          '`data_cadastro` date DEFAULT NULL,                                               '+
          '`data_alteracao` date DEFAULT NULL,                                              '+
          '`excluido` int DEFAULT NULL,                                                     '+
          '`id_empresa` int DEFAULT NULL,                                                   '+
          '`id_usuario` int DEFAULT NULL,                                                   '+
          '`tipo` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,    '+
          '`id_usuario_alt` int DEFAULT NULL,                                               '+
          '`id_usuario_exc` int DEFAULT NULL,                                               '+
          'PRIMARY KEY (`id_marca`)                                                         '+
          ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;';
        M.CreateTableIfMissing(SQL, 'marca');

        M.AddIndexIfMissing('marca', 'fk_marca_empresa_idx', 'INDEX `fk_marca_empresa_idx` (`id_empresa` ASC) INVISIBLE');

        if M.HasTable('empresa') then
          M.AddForeignKeyIfMissing('contas', 'fk_marca_empresa_i',
            'FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa) ' +
            'ON DELETE CASCADE ON UPDATE NO ACTION');

      end);

    {$ENDREGION}

    {$REGION 'Unidade-010'}
    // ================= 010 - Tabela Unidade =================
    AddMigration(Migs, '010_initial_schema_unidade',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
        SQL: string;
      begin
        SQL :=
          'CREATE TABLE `unidade` (                                                          '+
          '`id_unidade` int NOT NULL AUTO_INCREMENT,                                         '+
          '`codigo` int NOT NULL,                                                            '+
          '`uni` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,       '+
          '`unidade` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,  '+
          '`ativo` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,    '+
          '`data_cadastro` date DEFAULT NULL,                                                '+
          '`data_alteracao` date DEFAULT NULL,                                               '+
          '`excluido` int DEFAULT NULL,                                                      '+
          '`id_empresa` int DEFAULT NULL,                                                    '+
          '`id_usuario` int DEFAULT NULL,                                                    '+
          '`data_excluido` date DEFAULT NULL,                                                '+
          '`id_usuario_exc` int DEFAULT NULL,                                                '+
          '`id_usuario_alt` int DEFAULT NULL,                                                '+
          'PRIMARY KEY (`id_unidade`)                                                        '+
          ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;';
        M.CreateTableIfMissing(SQL, 'unidade');
        M.AddIndexIfMissing('unidade', 'fk_id_empresa_idx', 'INDEX `fk_id_empresa_idx` (`id_empresa` ASC) INVISIBLE');

        if M.HasTable('empresa') then
          M.AddForeignKeyIfMissing('contas', 'unid_id_empresa_i',
            'FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa) ' +
            'ON DELETE CASCADE ON UPDATE NO ACTION');

      end);

    {$ENDREGION}

    {$REGION 'PlanoConta-011'}
    // ================= 011 - Tabela Planoconta =================
    AddMigration(Migs, '011_initial_schema_planoconta',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
        SQL: string;
      begin
        SQL :=
          'CREATE TABLE `planoconta` (                                        '+
          '`id_planoconta` int NOT NULL AUTO_INCREMENT,                       '+
          '`codigo` varchar(20) NOT NULL,                                     '+
          '`descricao` varchar(255) NOT NULL,                                 '+
          '`id_subgrupoplano` int NOT NULL,                                   '+
          '`saldoinicial` decimal(15,3) DEFAULT NULL,                         '+
          '`datacriacao` date DEFAULT NULL,                                   '+
          '`id_usuario` int DEFAULT NULL,                                     '+
          '`id_empresa` int DEFAULT NULL,                                     '+
          '`ativo` char(1) DEFAULT NULL,                                      '+
          '`data_alteracao` date DEFAULT NULL,                                '+
          '`data_excluido` date DEFAULT NULL,                                 '+
          '`id_usuario_alt` int DEFAULT NULL,                                 '+
          '`id_usuario_exc` int DEFAULT NULL,                                 '+
          '`excluido` int DEFAULT NULL,                                       '+
          'PRIMARY KEY (`id_planoconta`)                                      '+
          ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;';

        M.CreateTableIfMissing(SQL, 'planoconta');
      end);

    {$ENDREGION}

    {$REGION 'LogMensagem-012'}
    // ================= 011 - Tabela Planoconta =================
    AddMigration(Migs, '012_initial_schema_Logmensagem',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
        SQL: string;
      begin
        SQL :=
          'CREATE TABLE `log_mensagem` (                '+
          '`id` int NOT NULL AUTO_INCREMENT,            '+
          '`data` date DEFAULT NULL,                    '+
          '`hora` time DEFAULT NULL,                    '+
          '`id_usuario` int DEFAULT NULL,               '+
          '`descricao` longblob,                        '+
          '`para` varchar(160) DEFAULT NULL,            '+
          '`fone` varchar(20) DEFAULT NULL,             '+
          'PRIMARY KEY (`id`)                           '+
          ') ENGINE=InnoDB AUTO_INCREMENT=73757 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci';

        M.CreateTableIfMissing(SQL, 'log_mensagem');
      end);

    {$ENDREGION}

    {$REGION 'EleicaoConfiguracao-013'}
    AddMigration(Migs, '013_initial_schema_EleicaoConfiguracao',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
        SQL: string;
      begin
        SQL :=
          'CREATE TABLE `eleicao_configuracao` (                   '+
          '`id` INT NOT NULL AUTO_INCREMENT,                                 '+
          '`id_eleicao` INT NOT NULL,                                        '+
          '`situacao_inicial` VARCHAR(45) NULL DEFAULT ''RASCUNHO'',         '+
          '`exige_homologacao_final` CHAR(1) NULL DEFAULT ''N'',             '+
          '`publicacao_automatica` CHAR(1) NULL DEFAULT ''N'',               '+
          '`exige_associado_ativo` CHAR(1) NULL DEFAULT ''N'',               '+
          '`exige_associado_adimplente` CHAR(1) NULL DEFAULT ''N'',          '+
          '`exige_tempo_minimo` CHAR(1) NULL DEFAULT ''N'',                  '+
          '`tempo_minimo_filiacao` INT NULL,                                 '+
          '`bloqueia_pendencia_financeira` CHAR(1) NULL DEFAULT ''N'',       '+
          '`bloqueia_associado_suspenso` CHAR(1) NULL DEFAULT ''N'',         '+
          '`gerar_eleitores_aptos` CHAR(1) NULL DEFAULT ''N'',               '+
          '`id_empresa` INT NULL,                                            '+
          '`id_usuario` INT NULL,                                            '+
          '`id_usuario_alt` INT NULL,                                        '+
          '`data_alteracao` DATE NULL,                                       '+
          'PRIMARY KEY (`id`));';

        M.CreateTableIfMissing(SQL, 'eleicao_configuracao');
      end);

    {$ENDREGION}

    {$REGION 'Parametros_grid-014'}
    AddMigration(Migs, '014_initial_schema_ParametrosGrid',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
        SQL: string;
      begin
        SQL :=
          'CREATE TABLE parametros_grid (                   '+
          'campo VARCHAR(45) NULL,          '+
          'tela Varchar(45) NUll,'+
          'visivel CHAR(1) NULL DEFAULT ''S'')';

        M.CreateTableIfMissing(SQL, 'parametros_grid');
      end);

    {$ENDREGION}

    {$REGION 'distribuicao_dfe_log-015'}

    AddMigration(Migs, '015_create_distribuicao_dfe_log',
    procedure(Conn: TUniConnection)
    var
      M: TMigrator absolute Migrator;
      SQL: string;
    begin
      SQL :=
        'CREATE TABLE distribuicao_dfe_log (                 '+
        'id_log INT NOT NULL AUTO_INCREMENT,                '+
        'id_empresa INT NOT NULL,                           '+
        'cnpj_consulta VARCHAR(14) NOT NULL,                '+
        'arquivo_origem VARCHAR(255) NULL,                  '+
        'tp_amb INT NULL,                                   '+
        'ver_aplic VARCHAR(20) NULL,                        '+
        'c_stat INT NULL,                                   '+
        'x_motivo VARCHAR(255) NULL,                        '+
        'dh_resp DATETIME NULL,                             '+
        'ult_nsu VARCHAR(15) NULL,                          '+
        'max_nsu VARCHAR(15) NULL,                          '+
        'xml_retorno LONGTEXT NULL,                         '+
        'dt_cadastro DATETIME NOT NULL,                     '+
        'PRIMARY KEY (id_log)                               '+
        ')';

      M.CreateTableIfMissing(SQL, 'distribuicao_dfe_log');
    end);

    {$ENDREGION}

    {$REGION 'distribuicao_dfe_doc-016'}

    AddMigration(Migs, '016_create_distribuicao_dfe_doc',
    procedure(Conn: TUniConnection)
    var
      M: TMigrator absolute Migrator;
      SQL: string;
    begin
      SQL :=
        'CREATE TABLE distribuicao_dfe_doc (                 '+
        'id_doc INT NOT NULL AUTO_INCREMENT,                '+
        'id_log INT NOT NULL,                               '+
        'id_empresa INT NOT NULL,                           '+
        'nsu VARCHAR(15) NOT NULL,                          '+
        'schema_name VARCHAR(60) NULL,                      '+
        'xml_descompactado LONGTEXT NULL,                   '+
        'caminho_arquivo VARCHAR(255) NULL,                 '+
        'tipo_documento VARCHAR(30) NULL,                   '+
        'chave_acesso VARCHAR(44) NULL,                     '+
        'cnpj_emitente VARCHAR(14) NULL,                    '+
        'x_nome_emitente VARCHAR(255) NULL,                 '+
        'numero_nfe VARCHAR(20) NULL,                       '+
        'serie_nfe VARCHAR(10) NULL,                        '+
        'valor_nfe DECIMAL(15,2) NULL,                      '+
        'dh_emissao DATETIME NULL,                          '+
        'situacao_manifesto VARCHAR(30) NULL,               '+
        'dt_cadastro DATETIME NOT NULL,                     '+
        'PRIMARY KEY (id_doc)                               '+
        ')';

      M.CreateTableIfMissing(SQL, 'distribuicao_dfe_doc');
    end);

    {$ENDREGION}

    {$REGION 'Tipo Situacao-017'}

    AddMigration(Migs, '017_initial_schema_tiposituacao',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
        SQL: string;
      begin
        SQL :=
          'CREATE TABLE IF NOT EXISTS `sindicato_tipo_situacao` (                                                           '+
          '`id_situacao` int NOT NULL AUTO_INCREMENT,                                          '+
          '`descricao` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,   '+
          '`ativo` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''S'',   '+
          '`id_empresa` int DEFAULT NULL,                                                   '+
          '`data_cadastro` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,                                               '+
          '`data_alteracao` DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,                                              '+
          '`data_exclusao` date DEFAULT NULL,                                              '+
          '`excluido` int DEFAULT NULL,                                                     '+
          '`id_usuario` int DEFAULT NULL,                                                   '+
          '`id_usuario_alt` int DEFAULT NULL,                                               '+
          '`id_usuario_exc` int DEFAULT NULL,                                               '+
          'PRIMARY KEY (`id_situacao`)                                                         '+
          ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;';
        M.CreateTableIfMissing(SQL, 'sindicato_tipo_situacao');

        M.AddIndexIfMissing('sindicato_tipo_situacao', 'fk_tipo_situacao_empresa_idx', 'INDEX `fk_tipo_situacao_empresa_idx` (`id_empresa` ASC) INVISIBLE');

        if M.HasTable('empresa') then
          M.AddForeignKeyIfMissing('contas', 'fk_tipo_situacao_empresa_i',
            'FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa) ' +
            'ON DELETE CASCADE ON UPDATE NO ACTION');

      end);


    {$ENDREGION}

    {$REGION 'Local trabalho-018'}

    AddMigration(Migs, '018_initial_schema_localtrabalho',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
        SQL: string;
      begin
        SQL :=
          'CREATE TABLE IF NOT EXISTS `sindicato_local_trabalho` (                                                           '+
          '`id_local` int NOT NULL AUTO_INCREMENT,                                          '+
          '`descricao` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,   '+
          '`ativo` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''S'',   '+
          '`id_empresa` int DEFAULT NULL,                                                   '+
          '`data_cadastro` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,                                               '+
          '`data_alteracao` DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,                                              '+
          '`data_exclusao` date DEFAULT NULL,                                              '+
          '`excluido` int DEFAULT NULL,                                                     '+
          '`id_usuario` int DEFAULT NULL,                                                   '+
          '`id_usuario_alt` int DEFAULT NULL,                                               '+
          '`id_usuario_exc` int DEFAULT NULL,                                               '+
          'PRIMARY KEY (`id_local`)                                                         '+
          ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;';
        M.CreateTableIfMissing(SQL, 'sindicato_local_trabalho');

        M.AddIndexIfMissing('sindicato_local_trabalho', 'fk_local_trabalho_empresa_idx', 'INDEX `fk_local_trabalho_empresa_idx` (`id_empresa` ASC) INVISIBLE');

        if M.HasTable('empresa') then
          M.AddForeignKeyIfMissing('contas', 'fk_local_trabalho_empresa_i',
            'FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa) ' +
            'ON DELETE CASCADE ON UPDATE NO ACTION');

      end);


    {$ENDREGION}

    {$REGION 'associado_motivo_movimento -019'}

    AddMigration(Migs, '019_initial_schema_associado_motivo_movimento ',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
        SQL: string;
      begin
        SQL :=
          'CREATE TABLE IF NOT EXISTS associado_motivo_movimento (  '+
          ' id_motivo INT NOT NULL AUTO_INCREMENT,                  '+
          ' descricao VARCHAR(150) NOT NULL,                        '+
          ' tipo CHAR(1) NOT NULL,                                  '+
          ' ativo CHAR(1) NOT NULL DEFAULT ''S'',                   '+
          ' data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,  '+
          'PRIMARY KEY (id_motivo),                                 '+
          'INDEX idx_motivo_tipo (tipo),                            '+
          'INDEX idx_motivo_ativo (ativo))';
        M.CreateTableIfMissing(SQL, 'associado_motivo_movimento');

        {

        D = Desfiliação
        F = Filiação / Refiliação
        A = Ambos

        }

      end);


    {$ENDREGION}

    {$REGION 'HistoricoAssociado-020'}

    AddMigration(Migs, '020_initial_schema_associado_historico ',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
        SQL: string;
      begin
        SQL :=
          'CREATE TABLE IF NOT EXISTS associado_historico  (              '+

          'id_historico BIGINT NOT NULL AUTO_INCREMENT,                   '+
          'id_associado BIGINT NOT NULL,                                  '+
          'data_filiacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,     '+
          'data_desfiliacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,  '+
          'situacao_anterior VARCHAR(50) DEFAULT NULL,                    '+
          'situacao_nova VARCHAR(50) DEFAULT NULL,                        '+
          'id_motivo BIGINT NOT NULL,                                     '+
          'observacao VARCHAR(500) NOT NULL,                              '+
          'id_usuario BIGINT DEFAULT NULL,                                '+
          'documento_protocolo VARCHAR(100) DEFAULT NULL,                 '+
          'id_empresa_anterior BIGINT DEFAULT NULL,                       '+
          'id_empresa_nova BIGINT DEFAULT NULL,                           '+
          'id_secretaria_anterior BIGINT DEFAULT NULL,                    '+
          'id_secretaria_nova BIGINT DEFAULT NULL,                        '+
          'id_lotacao_anterior BIGINT DEFAULT NULL,                       '+
          'id_lotacao_nova BIGINT DEFAULT NULL,                           '+
          'id_profissao_anterior BIGINT DEFAULT NULL,                     '+
          'id_profissao_nova BIGINT DEFAULT NULL,                         '+
          'matricula_anterior BIGINT default null,                        '+
          'matricula_nova BIGINT default null,                            '+

          'bloqueou_desconto CHAR(1) NOT NULL DEFAULT ''N'',              '+
          'inativar_cadastro CHAR(1) NOT NULL DEFAULT ''N'',              '+
          'inativar_carteira CHAR(1) NOT NULL DEFAULT ''N'',              '+
          'id_empresa BIGINT DEFAULT NULL,                                '+
          'data_criacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,      '+
          'tipo VARCHAR(45) NULL,'+
          'cor VARCHAR(45) NULL,'+
          'PRIMARY KEY (id_historico),                                    '+
          'KEY idx_assoc_hist_associado (id_associado),                   '+
          'KEY idx_assoc_hist_usuario (id_usuario),                       '+
          'KEY idx_assoc_hist_empresa (id_empresa))';

          M.CreateTableIfMissing(SQL, 'associado_historico');

      end);


    {$ENDREGION}

    {$REGION 'Bem-021'}

    AddMigration(Migs, '021_initial_schema_bem ',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
        SQL: string;
      begin
        SQL :=
          'CREATE TABLE IF NOT EXISTS bens (                                      '+
          'id_bem BIGINT NOT NULL AUTO_INCREMENT,                                 '+
          'codigo BIGINT DEFAULT NULL,                                            '+
          'descricao VARCHAR(250) NOT NULL,                                       '+
          'tombamento VARCHAR(100) DEFAULT NULL,                                  '+
          'id_categoria BIGINT DEFAULT NULL,                                      '+
          'id_grupo BIGINT DEFAULT NULL,                                          '+
          'id_localizacao BIGINT DEFAULT NULL,                                    '+
          'id_departamento BIGINT DEFAULT NULL,                                   '+
          'id_marca BIGINT DEFAULT NULL,                                          '+
          'modelo VARCHAR(100) DEFAULT NULL,                                      '+
          'numero_serie VARCHAR(100) DEFAULT NULL,                                '+
          'data_aquisicao DATE DEFAULT NULL,                                      '+
          'valor_aquisicao DECIMAL(15,2) NOT NULL DEFAULT 0.00,                   '+
          'vida_util_meses INT NOT NULL DEFAULT 0,                                '+
          'id_fornecedor BIGINT DEFAULT NULL,                                     '+
          'nota_fiscal VARCHAR(100) DEFAULT NULL,                                 '+
          'observacao VARCHAR(500) DEFAULT NULL,                                  '+
          'ativo CHAR(1) NOT NULL DEFAULT ''S'',                                  '+
          'excluido INT NOT NULL DEFAULT 0,                                       '+
          'situacao VARCHAR(40) NOT NULL,                                         '+
          'id_usuario BIGINT DEFAULT NULL,                                        '+
          'id_usuario_alt BIGINT DEFAULT NULL,                                    '+
          'id_usuario_exc BIGINT DEFAULT NULL,                                    '+
          'id_empresa BIGINT DEFAULT NULL,                                        '+
          'data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,             '+
          'data_alteracao DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP, '+
          'data_exclusao DATETIME DEFAULT NULL,                                   '+
          'PRIMARY KEY (id_bem),                                                  '+
          'KEY idx_bens_codigo (codigo),                                          '+
          'KEY idx_bens_tombamento (tombamento),                                  '+
          'KEY idx_bens_descricao (descricao),                                    '+
          'KEY idx_bens_categoria (id_categoria),                                 '+
          'KEY idx_bens_grupo (id_grupo),                                         '+
          'KEY idx_bens_localizacao (id_localizacao),                             '+
          'KEY idx_bens_marca (id_marca),                             '+
          'KEY idx_bens_departamento (id_departamento),                           '+
          'KEY idx_bens_fornecedor (id_fornecedor),                               '+
          'KEY idx_bens_ativo (ativo),                                            '+
          'KEY idx_bens_excluido (excluido),                                      '+
          'KEY idx_bens_empresa (id_empresa)                                      '+
          ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;';

          M.CreateTableIfMissing(SQL, 'bens');

      end);


    {$ENDREGION}

    {$REGION 'categoria-022'}

    AddMigration(Migs, '022_initial_schema_categoria',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
        SQL: string;
      begin
        SQL :=
          'CREATE TABLE IF NOT EXISTS `categoria` (                                                           '+
          '`id_categoria` int NOT NULL AUTO_INCREMENT,                                          '+
          '`descricao` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,   '+
          '`ativo` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''S'',   '+
          '`id_empresa` int DEFAULT NULL,                                                   '+
          '`data_cadastro` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,                                               '+
          '`data_alteracao` DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,                                              '+
          '`data_exclusao` date DEFAULT NULL,                                              '+
          '`excluido` int DEFAULT NULL,                                                     '+
          '`id_usuario` int DEFAULT NULL,                                                   '+
          '`id_usuario_alt` int DEFAULT NULL,                                               '+
          '`id_usuario_exc` int DEFAULT NULL,                                               '+
          'PRIMARY KEY (`id_categoria`)                                                         '+
          ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;';
        M.CreateTableIfMissing(SQL, 'categoria');

        M.AddIndexIfMissing('categoria', 'fk_categoria_empresa_idx', 'INDEX `fk_categoria_empresa_idx` (`id_empresa` ASC) INVISIBLE');

        if M.HasTable('empresa') then
          M.AddForeignKeyIfMissing('categoria', 'fk_categoria_empresa_i',
            'FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa) ' +
            'ON DELETE CASCADE ON UPDATE NO ACTION');

      end);


    {$ENDREGION}

    {$REGION 'Departamento-023'}

    AddMigration(Migs, '023_initial_schema_departamento',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
        SQL: string;
      begin
        SQL :=
          'CREATE TABLE IF NOT EXISTS `departamento` (                                                           '+
          '`id_departamento` int NOT NULL AUTO_INCREMENT,                                          '+
          '`descricao` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,   '+
          '`ativo` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''S'',   '+
          '`id_empresa` int DEFAULT NULL,                                                   '+
          '`data_cadastro` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,                                               '+
          '`data_alteracao` DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,                                              '+
          '`data_exclusao` date DEFAULT NULL,                                              '+
          '`excluido` int DEFAULT NULL,                                                     '+
          '`id_usuario` int DEFAULT NULL,                                                   '+
          '`id_usuario_alt` int DEFAULT NULL,                                               '+
          '`id_usuario_exc` int DEFAULT NULL,                                               '+
          'PRIMARY KEY (`id_departamento`)                                                         '+
          ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;';
        M.CreateTableIfMissing(SQL, 'departamento');

        M.AddIndexIfMissing('departamento', 'fk_departamento_empresa_idx', 'INDEX `fk_departamento_empresa_idx` (`id_empresa` ASC) INVISIBLE');

        if M.HasTable('empresa') then
          M.AddForeignKeyIfMissing('contas', 'fk_departamento_empresa_i',
            'FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa) ' +
            'ON DELETE CASCADE ON UPDATE NO ACTION');

      end);


    {$ENDREGION}

    {$REGION 'Banco-024'}

    AddMigration(Migs, '024_initial_schema_lancamento_bancario ',
    procedure(Conn: TUniConnection)
    var
      M: TMigrator absolute Migrator;
      SQL: string;
    begin
      SQL :=
        'CREATE TABLE IF NOT EXISTS lancamento_bancario (                            '+
        'id_lancamento_bancario integer NOT NULL AUTO_INCREMENT,                     '+

        'id_conta integer NOT NULL,                                         '+
        'data_emissao DATE NOT NULL,                                                '+
        'data_competencia DATE DEFAULT NULL,                                        '+
        'data_vencimento DATE DEFAULT NULL,                                         '+

        'numero VARCHAR(60) DEFAULT NULL,                                           '+
        'valor DECIMAL(15,2) NOT NULL DEFAULT 0.00,                                 '+

        'tipo_movimento CHAR(1) NOT NULL DEFAULT ''C'',                             '+
        'situacao VARCHAR(30) NOT NULL DEFAULT ''Pendente'',                        '+

        'cheque char(6) NOT NULL DEFAULT ''NÃO'',                                '+
        'previsao CHAR(4) NOT NULL DEFAULT ''NÃO'',                                   '+

        'id_historico integer DEFAULT NULL,                                 '+
        'historico VARCHAR(500) DEFAULT NULL,                                       '+
        'id_prazo integer DEFAULT NULL,                                    '+

        'id_planoconta integer DEFAULT NULL,                                       '+
        'id_custo integer DEFAULT NULL,                                       '+
        'id_pessoa integer DEFAULT NULL,                                             '+
        'id_departamento integer DEFAULT NULL,                                       '+

        'origem VARCHAR(30) NOT NULL DEFAULT ''Manual'',                            '+
        'id_origem integer DEFAULT NULL,                                             '+
        'tabela_origem VARCHAR(80) DEFAULT NULL,                                    '+

        'conciliado CHAR(1) NOT NULL DEFAULT ''N'',                                 '+
        'data_conciliacao DATE DEFAULT NULL,                                         '+

        'id_usuario integer DEFAULT NULL,                                            '+
        'id_usuario_alt integer DEFAULT NULL,                                        '+
        'id_empresa integer DEFAULT NULL,                                            '+
        'id_usuario_conci integer DEFAULT NULL,                                      '+
        'id_usuario_desco integer DEFAULT NULL,                                            '+

        'data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,                 '+
        'data_alteracao DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,     '+
        'data_desconciliacao DATE DEFAULT NULL,                                         '+
        'fitid VARCHAR(45) DEFAULT NULL, '+

        'PRIMARY KEY (id_lancamento_bancario),                                      '+

        'KEY idx_lanc_banc_conta (id_conta),                               '+
        'KEY idx_lanc_banc_emissao (data_emissao),                                  '+
        'KEY idx_lanc_banc_competencia (data_competencia),                          '+
        'KEY idx_lanc_banc_vencimento (data_vencimento),                            '+
        'KEY idx_lanc_banc_numero (numero),                                         '+
        'KEY idx_lanc_banc_tipo (tipo_movimento),                                   '+
        'KEY idx_lanc_banc_situacao (situacao),                                     '+
        'KEY idx_lanc_banc_previsao (previsao),                                     '+
        'KEY idx_lanc_banc_historico (id_historico),                       '+
        'KEY idx_lanc_banc_forma_pagamento (id_prazo),                    '+
        'KEY idx_lanc_banc_id_planoconta (id_planoconta),                          '+
        'KEY idx_lanc_banc_custo (id_custo),                          '+
        'KEY idx_lanc_banc_pessoa (id_pessoa),                                      '+
        'KEY idx_lanc_banc_departamento (id_departamento),                          '+
        'KEY idx_lanc_banc_origem (origem),                                         '+
        'KEY idx_lanc_banc_id_origem (id_origem),                                   '+
        'KEY idx_lanc_banc_empresa (id_empresa),                                    '+

        'CONSTRAINT chk_lanc_banc_tipo                                              '+
        'CHECK (tipo_movimento IN (''C'', ''D'')),                                  '+

        'CONSTRAINT chk_lanc_banc_previsao                                          '+
        'CHECK (previsao IN (''SIM'', ''NÃO'')),                                        '+

        'CONSTRAINT chk_lanc_banc_conciliado                                        '+
        'CHECK (conciliado IN (''S'', ''N''))                                       '+

        ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;';

        M.CreateTableIfMissing(SQL, 'lancamento_bancario');

    end);

  {$ENDREGION}


    {$REGION 'historico-025'}

    AddMigration(Migs, '025_initial_schema_historico_bancario',
    procedure(Conn: TUniConnection)
    var
      M: TMigrator absolute Migrator;
      SQL: string;
    begin
      SQL :=
        'CREATE TABLE IF NOT EXISTS `historico_bancario` (                                      '+
        'id_historico BIGINT NOT NULL AUTO_INCREMENT,                                           '+
        'descricao varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,       '+
        'tipo integer NOT NULL,                                                                  '+
        'id_planoconta integer DEFAULT NULL,                                                     '+
        'id_custo integer DEFAULT NULL,                                                          '+
        'ativo char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''S'','+
        'id_empresa integer DEFAULT NULL,                                                        '+
        'data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,                             '+
        'data_alteracao DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,                 '+
        'id_usuario integer DEFAULT NULL,                                                        '+
        'id_usuario_alt integer DEFAULT NULL,                                                    '+
        'PRIMARY KEY (`id_historico`),                                                          '+
        'KEY idx_historico_descricao (descricao),                                               '+
        'KEY idx_historico_id_planoconta (id_planoconta),                                       '+
        'KEY idx_historico_id_custo (id_custo),                                                 '+
        'KEY idx_historico_ativo (ativo),                                                       '+
        'KEY fk_historico_bancario_empresa_idx (id_empresa)                                     '+
        ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;';

      M.CreateTableIfMissing(SQL, 'historico_bancario');

      if M.HasTable('empresa') then
          M.AddForeignKeyIfMissing('historico_bancario', 'fk_historico_bancario_id_empresa',
            'FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa) '+
            'ON DELETE CASCADE ON UPDATE NO ACTION');

      if M.HasTable('planoconta') then
        M.AddForeignKeyIfMissing(
          'historico_bancario',
          'fk_historico_bancario_planoconta',
          'FOREIGN KEY (id_planoconta) REFERENCES planoconta(id_planoconta) ' +
          'ON DELETE SET NULL ON UPDATE NO ACTION');

      if M.HasTable('custo') then
        M.AddForeignKeyIfMissing(
          'historico_bancario',
          'fk_historico_bancario_custo',
          'FOREIGN KEY (id_custo) REFERENCES custo(id_custo) ' +
          'ON DELETE SET NULL ON UPDATE NO ACTION');

    end);


    {$ENDREGION}


    {$REGION 'Eleicao chapa-026'}

    AddMigration(Migs, '024_initial_schema_eleicao_chapa ',
    procedure(Conn: TUniConnection)
    var
      M: TMigrator absolute Migrator;
      SQL: string;
    begin
      SQL :=
        'CREATE TABLE IF NOT EXISTS eleicao_chapa (                      '+
        '`id` INT NOT NULL AUTO_INCREMENT,                               '+
        '`codigo` INT NULL,                                              '+
        '`id_eleicao` INT NOT NULL,                                      '+
        '`situacao` VARCHAR(45) NOT NULL,                                '+
        '`num_chapa` INT NULL,                                           '+
        '`nome_chapa` VARCHAR(200) NOT NULL,                             '+
        '`data_criacao` DATE NOT NULL,                                   '+
        '`slogan` VARCHAR(200) NULL,                                     '+
        '`representante_chapa` VARCHAR(120) NULL,                        '+
        '`repres_telefone` VARCHAR(20) NULL,                             '+
        '`repres_email` VARCHAR(180) NULL,                               '+
        '`data_homologacao` DATE NULL,                                   '+
        '`data_indeferimento` DATE NULL,                                 '+
        '`motivo_indeferimento` VARCHAR(500) NULL,                       '+
        '`obs` VARCHAR(500) NULL,                                        '+
        '`ativo` CHAR(1) NOT NULL DEFAULT ''S'',                         '+
        '`sinc_app` CHAR(1) NOT NULL DEFAULT ''S'',                      '+
        '`datacriacao` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,      '+
        '`dataalteracao` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,        '+
        '`id_usuario` INT NOT NULL,                                      '+
        '`id_usuario_alt` INT NULL,                                      '+
        '`id_empresa` INT NOT NULL,                                      '+
        '`id_usuario_homol` INT NOT NULL,                                '+
        '`id_usuario_defe` INT NOT NULL,                                 '+

        'PRIMARY KEY (`id`),                                             '+

        'KEY idx_chapa_id_eleicao (id_eleicao),                          '+
        'KEY idx_chapa_data_criacao (data_criacao),                      '+
        'KEY idx_chapa_num_chapa (num_chapa),                            '+
        'KEY idx_chapa_empresa (id_empresa)                              '+

        ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;';

        M.CreateTableIfMissing(SQL, 'eleicao_chapa');

    end);

  {$ENDREGION}

    {$REGION 'Eleicao membro-027'}

    AddMigration(Migs, '027_initial_schema_eleicao_membro ',
    procedure(Conn: TUniConnection)
    var
      M: TMigrator absolute Migrator;
      SQL: string;
    begin
      SQL :=
        'CREATE TABLE IF NOT EXISTS eleicao_chapa_membro (  '+
        'id INT NOT NULL AUTO_INCREMENT,                    '+
        'id_eleicao INT NOT NULL,                           '+
        'id_chapa INT NOT NULL,                             '+
        'id_empresa INT NOT NULL,                           '+
        'codigo INT NULL,                                   '+
        'nome VARCHAR(180) NULL,                            '+
        'cpf VARCHAR(18) NOT NULL,                          '+
        'telefone VARCHAR(14) NULL,                         '+
        'email VARCHAR(160) NULL,                           '+
        'ativo CHAR(1) NULL DEFAULT ''S'',                  '+
        'cargo VARCHAR(45) NULL,                            '+
        'tipo VARCHAR(45) NULL,                             '+
        'observacao VARCHAR(45) NULL,                       '+
        'datacriacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,                         '+
        'dataalteracao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,                       '+
        'id_usuario INT NULL,                               '+
        'id_usuario_alt INT NULL,                           '+
        'arquivo_foto LONGBLOB NULL,                        '+
        'extensao_foto CHAR(4) NULL DEFAULT ''PNG'',        '+
        'PRIMARY KEY (id),                                  '+

        'KEY idx_membro_id_eleicao (id_eleicao),            '+
        'KEY idx_membro_id_chapa (id_chapa),                '+
        'KEY idx_membro_datacriacao (datacriacao),          '+
        'KEY idx_membro_nome (nome),                        '+
        'KEY idx_membro_empresa (id_empresa)                '+

        ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;';

        M.CreateTableIfMissing(SQL, 'eleicao_chapa_membro');

    end);

    {$ENDREGION}

    {$REGION 'Eleicao eleicao_eleitor-028'}

    AddMigration(Migs, '028_initial_schema_eleicao_eleitor ',
    procedure(Conn: TUniConnection)
    var
      M: TMigrator absolute Migrator;
      SQL: string;
    begin
      SQL :=
        'CREATE TABLE IF NOT EXISTS eleicao_eleitor (                           '+
                  ' id_eleitor integer PRIMARY KEY AUTO_INCREMENT,               '+
                  ' id_eleicao INT NOT NULL,                                     '+
                  ' id_associado INT NOT NULL,                                   '+
                  ' situacao CHAR (1) NOT NULL DEFAULT ''A'', '+ //COMMENT ''-- Apto, cancelado, bloqueado''
                  ' id_usuario_api int NULL,                                     '+
                  ' data_geracao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,    '+
                  ' id_usuario INT NOT NULL,                                         '+
                  ' id_empresa INT NOT NULL,                                         '+
                  ' obs VARCHAR (255 ) NULL,                                     '+
                  ' tentativas_sync INT NOT NULL DEFAULT 0,                      '+
                  ' data_ultima_tentativa DATETIME NULL,                         '+
                  ' sinc_app CHAR (1) NOT NULL DEFAULT ''N'',                    '+
                  ' KEY idx_eleicao (id_eleicao),                                '+
                  ' KEY idx_associado (id_associado),                            '+
                  ' KEY idx_empresa (id_empresa), '+
                  ' KEY idx_sinc_app (sinc_app), '+
                  ' UNIQUE KEY uk_eleicao_associado (id_eleicao,id_associado), '+
                  ' CONSTRAINT fk_eleitor_eleicao FOREIGN KEY (id_eleicao) REFERENCES eleicao(id_eleicao) ON DELETE RESTRICT, '+
                  ' CONSTRAINT fk_eleitor_associado FOREIGN KEY (id_associado) REFERENCES socio(id_socio) ON DELETE RESTRICT, '+
                  ' CONSTRAINT fk_eleitor_empresa FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa) ON DELETE RESTRICT '+
                  ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;';

        M.CreateTableIfMissing(SQL, 'eleicao_eleitor');

    end);

    {$ENDREGION}

    {$REGION 'Eleicao eleicao_comissao -029'}

    AddMigration(Migs, '029_initial_schema_eleicao_comissao  ',
    procedure(Conn: TUniConnection)
    var
      M: TMigrator absolute Migrator;
      SQL: string;
    begin
      SQL :=
        'CREATE TABLE IF NOT EXISTS eleicao_comissao (     '+
          'id_comissao INT NOT NULL AUTO_INCREMENT,        '+
          'id_eleicao INT NOT NULL,                        '+
          'id_empresa INT NOT NULL,                        '+
          'nome VARCHAR(150) NOT NULL,                     '+
          'cpf VARCHAR(14) NULL,                           '+
          'telefone VARCHAR(20) NULL,                      '+
          'email VARCHAR(180) NULL,                        '+
          'cargo VARCHAR(60) NULL,                         '+
          'ativo CHAR(1) NOT NULL DEFAULT ''S'',           '+
          'observacao VARCHAR(255) NULL,                   '+
          'data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, '+
          'id_usuario INT NOT NULL,                        '+
          'sinc_app CHAR(1) NOT NULL DEFAULT ''N'',        '+
          'PRIMARY KEY (id_comissao),                      '+
          'KEY idx_comissao_eleicao (id_eleicao),          '+
          'KEY idx_comissao_empresa (id_empresa),          '+
          'CONSTRAINT fk_comissao_eleicao                  '+
          '  FOREIGN KEY (id_eleicao)                      '+
          '  REFERENCES eleicao(id_eleicao),               '+
          'CONSTRAINT fk_comissao_empresa                  '+
          '  FOREIGN KEY (id_empresa)                      '+
          '  REFERENCES empresa(id_empresa)                '+
          ') ENGINE=InnoDB                                 '+
          'DEFAULT CHARSET=utf8mb4                         '+
          'COLLATE=utf8mb4_unicode_ci;';

          M.CreateTableIfMissing(SQL, 'eleicao_comissao');

    end);

    {$ENDREGION}

    {$REGION 'Eleicao eleicao_questao-030'}

    AddMigration(Migs, '030_initial_schema_eleicao_questao ',
    procedure(Conn: TUniConnection)
    var
      M: TMigrator absolute Migrator;
      SQL: string;
    begin
      SQL :=
        'CREATE TABLE IF NOT EXISTS eleicao_questao (                     '+
        'id_questao INT NOT NULL AUTO_INCREMENT,                          '+
        'id_eleicao INT NOT NULL,                                         '+
        'id_empresa INT NOT NULL,                                         '+
        'titulo VARCHAR(200) NOT NULL,                                    '+
        'descricao TEXT NULL,                                             '+
        'ordem INT NOT NULL DEFAULT 1,                                    '+
        'tipo_resposta VARCHAR(30) NOT NULL,                              '+
        'obrigatoria CHAR(1) NOT NULL DEFAULT ''S'',                      '+
        'ativo CHAR(1) NOT NULL DEFAULT ''S'',                            '+
        'id_usuario INT NOT NULL,                                         '+
        'data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,       '+
        'data_alteracao DATETIME NULL,                                   '+
        'sinc_app CHAR(1) NOT NULL DEFAULT ''N'',                         '+
        'PRIMARY KEY (id_questao),                                        '+
        'KEY idx_questao_eleicao (id_eleicao),                            '+
        'KEY idx_questao_empresa (id_empresa),                            '+
        'KEY idx_questao_ordem (id_eleicao, ordem),                       '+
        'KEY idx_questao_sinc_app (sinc_app),                             '+
        'CONSTRAINT fk_questao_eleicao                                    '+
        '  FOREIGN KEY (id_eleicao)                                       '+
        '  REFERENCES eleicao(id_eleicao)                                 '+
        '  ON DELETE RESTRICT,                                            '+
        'CONSTRAINT fk_questao_empresa                                    '+
        '  FOREIGN KEY (id_empresa)                                       '+
        '  REFERENCES empresa(id_empresa)                                 '+
        '  ON DELETE RESTRICT                                             '+
        ') ENGINE=InnoDB                                                  '+
        'DEFAULT CHARSET=utf8mb4                                          '+
        'COLLATE=utf8mb4_unicode_ci;';

        M.CreateTableIfMissing(SQL, 'eleicao_questao');

    end);

    {$ENDREGION}

    {$REGION 'Eleicao eleicao_questao_opcao -031'}

    AddMigration(Migs, '031_initial_schema_eleicao_questao_opcao',
    procedure(Conn: TUniConnection)
    var
      M: TMigrator absolute Migrator;
      SQL: string;
    begin
      SQL :=
        'CREATE TABLE IF NOT EXISTS eleicao_questao_opcao (            '+
        'id_opcao INT NOT NULL AUTO_INCREMENT,                         '+
        'id_questao INT NOT NULL,                                      '+
        'id_eleicao INT NOT NULL,                                      '+
        'id_empresa INT NOT NULL,                                      '+
        'ordem INT NOT NULL DEFAULT 1,                                 '+
        'descricao VARCHAR(200) NOT NULL,                              '+
        'ativo CHAR(1) NOT NULL DEFAULT ''S'',                         '+
        'id_usuario INT NOT NULL,                                      '+
        'data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,    '+
        'data_alteracao DATETIME NULL,                                 '+
        'sinc_app CHAR(1) NOT NULL DEFAULT ''N'',                      '+
        'PRIMARY KEY (id_opcao),                                       '+
        'KEY idx_opcao_questao (id_questao),                           '+
        'KEY idx_opcao_eleicao (id_eleicao),                           '+
        'KEY idx_opcao_empresa (id_empresa),                           '+
        'KEY idx_opcao_sinc_app (sinc_app),                            '+
        'UNIQUE KEY uk_questao_ordem (id_questao, ordem),              '+
        'CONSTRAINT fk_opcao_questao                                   '+
        '  FOREIGN KEY (id_questao)                                    '+
        '  REFERENCES eleicao_questao(id_questao)                      '+
        '  ON DELETE RESTRICT,                                         '+
        'CONSTRAINT fk_opcao_eleicao                                   '+
        '  FOREIGN KEY (id_eleicao)                                    '+
        '  REFERENCES eleicao(id_eleicao)                              '+
        ' ON DELETE RESTRICT,                                          '+
        ' CONSTRAINT fk_opcao_empresa                                  '+
        '  FOREIGN KEY (id_empresa)                                    '+
        '  REFERENCES empresa(id_empresa)                              '+
        '  ON DELETE RESTRICT                                          '+
        ' ) ENGINE=InnoDB                                              '+
        'DEFAULT CHARSET=utf8mb4                                       '+
        'COLLATE=utf8mb4_unicode_ci;';

        M.CreateTableIfMissing(SQL, 'eleicao_questao_opcao');

    end);

    {$ENDREGION}

    {$REGION 'Eleicao Atualizar cadastro-032'}

    AddMigration(Migs, '032_integracao_atualizacao_cadastral ',
    procedure(Conn: TUniConnection)
    var
      M: TMigrator absolute Migrator;
      SQL: string;
    begin
      SQL :=

        'CREATE TABLE IF NOT EXISTS integracao_atualizacao_cadastral (' +
        ' id_solicitacao_api BIGINT NOT NULL,' +
        ' id_empresa INT NOT NULL,' +
        ' pessoa_id_api BIGINT NULL,' +
        ' nome VARCHAR(180) NULL,' +
        ' cpf VARCHAR(20) NULL,' +
        ' matricula VARCHAR(30) NULL,' +
        ' email_novo VARCHAR(180) NULL,' +
        ' telefone_novo VARCHAR(20) NULL,' +
        ' whatsapp_novo VARCHAR(20) NULL,' +
        ' situacao VARCHAR(20) NOT NULL DEFAULT ''PENDENTE'',' +
        ' criado_em_api DATETIME NULL,' +
        ' recebido_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,' +
        ' processado_em DATETIME NULL,' +
        ' erro VARCHAR(500) NULL,' +
        ' PRIMARY KEY (id_solicitacao_api, id_empresa),' +
        ' KEY idx_integracao_atualizacao_situacao (id_empresa, situacao)' +
        ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4';

        M.CreateTableIfMissing(SQL, 'integracao_atualizacao_cadastral');

    end);

  {$ENDREGION}




    {$ENDREGION}

    //====================== Alter Table =================================

    {$REGION 'Alterar Tabela'}


    {$REGION 'Alter Conta-001'}
    // ================= 001 - ALTER TABLE contas =================
    AddMigration(Migs, '001_alter_conta',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('contas', 'banco', 'VARCHAR(60) NULL');
        M.AddColumnIfMissing('contas', 'dataalteracao', 'date NULL');
        M.AddColumnIfMissing('contas', 'id_usuario_alt', 'int NULL');
        M.AddColumnIfMissing('contas', 'excluido', 'int NULL');
      end
    );

    {$ENDREGION}

    {$REGION 'PrazoPag-002'}
    // ================= 002 - ALTER TABLE =================
    // Adiciona coluna se não existir (útil para evolução incremental)
    AddMigration(Migs, '002_alter_prazopag',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('prazopagamento', 'excluido', 'INT NULL DEFAULT 0');
        M.AddColumnIfMissing('prazopagamento', 'data_excluido', 'DATE NULL');
        M.AddColumnIfMissing('prazopagamento', 'id_usuario_exc', 'INT NULL');
        M.AddColumnIfMissing('prazopagamento', 'data_alteracao', 'DATE NULL');
        M.AddColumnIfMissing('prazopagamento', 'id_usuario_alt', 'INT NULL');
      end
    );
    {$ENDREGION}

    {$REGION 'Localizacao-003'}
    // ================= 002 - ALTER TABLE =================
    // Adiciona coluna se não existir (útil para evolução incremental)
    AddMigration(Migs, '003_alter_localizacao',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('localizacao', 'data_excluido', 'DATE NULL');
        M.AddColumnIfMissing('localizacao', 'id_usuario_exc', 'INT NULL');
        M.AddColumnIfMissing('localizacao', 'id_usuario_alt', 'INT NULL');
      end
    );
    {$ENDREGION}

    {$REGION 'Grupo-004'}
    // ================= 004 - ALTER TABLE =================
    // Adiciona coluna se não existir (útil para evolução incremental)
    AddMigration(Migs, '004_alter_grupo',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('grupo', 'data_excluido', 'DATE NULL');
        M.AddColumnIfMissing('grupo', 'id_usuario_exc', 'INT NULL');
        M.AddColumnIfMissing('grupo', 'id_usuario_alt', 'INT NULL');
      end
    );
    {$ENDREGION}

    {$REGION 'Marca-005'}
    // ================= 005 - ALTER TABLE =================
    // Adiciona coluna se não existir (útil para evolução incremental)
    AddMigration(Migs, '005_alter_marca',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('marca', 'id_usuario_alt', 'INT NULL');
        M.AddColumnIfMissing('marca', 'id_usuario_exc', 'INT NULL');
        M.AddColumnIfMissing('marca', 'data_excluido', 'DATE NULL');
      end
    );
    {$ENDREGION}

    {$REGION 'Unidade-006'}
    // ================= 006 - ALTER TABLE =================
    // Adiciona coluna se não existir (útil para evolução incremental)
    AddMigration(Migs, '006_alter_unidade',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('unidade', 'data_excluido', 'DATE NULL');
        M.AddColumnIfMissing('unidade', 'id_usuario_exc', 'INT NULL');
        M.AddColumnIfMissing('unidade', 'id_usuario_alt', 'INT NULL');
      end
    );
    {$ENDREGION}

    {$REGION 'PlanoConta-007'}
    // ================= 007 - ALTER TABLE =================
    // Adiciona coluna se não existir (útil para evolução incremental)
    AddMigration(Migs, '007_alter_planoconta',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('planoconta', 'data_alteracao', 'DATE NULL');
        M.AddColumnIfMissing('planoconta', 'data_excluido', 'DATE NULL');
        M.AddColumnIfMissing('planoconta', 'id_usuario_alt', 'INT NULL');
        M.AddColumnIfMissing('planoconta', 'id_usuario_exc', 'INT NULL');
        M.AddColumnIfMissing('planoconta', 'excluido', 'INT DEFAULT 0');
      end
    );
    {$ENDREGION}

    {$REGION 'Carteira-008'}
    // ================= 008 - ALTER TABLE =================
    // Adiciona coluna se não existir (útil para evolução incremental)
    AddMigration(Migs, '008_alter_Carteira',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('carteira', 'foto', 'LONGBLOB NULL');
      end
    );
    {$ENDREGION}

    {$REGION 'Convenio-009'}
    // ================= 009 - ALTER TABLE =================
    // Adiciona coluna se não existir (útil para evolução incremental)
    AddMigration(Migs, '009_alter_Convenio',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('convenio', 'exibir_app', 'CHAR(1) NULL DEFAULT ''N''');
      end
    );
    {$ENDREGION}

    {$REGION 'Produto-010'}
    // ================= 010 - ALTER TABLE =================
    // Adiciona coluna se não existir (útil para evolução incremental)
    AddMigration(Migs, '010_alter_Produto',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('produto', 'prod_gtin', 'VARCHAR(14) NULL');
        M.AddColumnIfMissing('produto', 'prod_comissaoperc', 'DECIMAL(15,2) NULL');
        M.AddColumnIfMissing('produto', 'prod_estoque_maximo', 'DECIMAL(15,2) NULL');
        M.AddColumnIfMissing('produto', 'prod_equipamento', 'CHAR(1) NULL DEFAULT ''N''');
        M.AddColumnIfMissing('produto', 'prod_materiaprima', 'CHAR(1) NULL DEFAULT ''N''');
        M.AddColumnIfMissing('produto', 'prod_estoque_per_negativo', 'CHAR(1) NULL DEFAULT ''N''');
      end
    );
    {$ENDREGION}

    {$REGION 'Produto-011'}
    // ================= 011 - ALTER TABLE =================
    // Adiciona coluna se não existir (útil para evolução incremental)
    AddMigration(Migs, '011_alter_Produto',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('produto', 'prod_estoque_per_negativo', 'CHAR(1) NULL DEFAULT ''N''');
      end
    );
    {$ENDREGION}

    {$REGION 'Autorizacao-012'}
    AddMigration(Migs, '012_alter_Autorizacao',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('autorizacao', 'excluido', 'INT NULL DEFAULT 0');
        M.AddColumnIfMissing('autorizacao', 'data_excluido', 'DATE NULL');
        M.AddColumnIfMissing('autorizacao', 'id_usuario_exc', 'INT NULL');
      end
    );
    {$ENDREGION}

    {$REGION 'Convenio-013'}
    AddMigration(Migs, '013_alter_Convenio',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('convenio', 'data_firmado', 'DATE NULL DEFAULT NULL');
      end
    );
    {$ENDREGION}

    {$REGION 'Usuario-014'}
    AddMigration(Migs, '014_alter_usuario',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('usuario', 'excluido', 'INT NULL DEFAULT 0');
      end
    );
    {$ENDREGION}

    {$REGION 'Perfil-015'}
    AddMigration(Migs, '014_alter_perfil',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('perfil', 'excluido', 'INT NULL DEFAULT 0');
      end
    );
    {$ENDREGION}

    {$REGION 'Mensagem-016'}
    AddMigration(Migs, '016_alter_mensagem',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('mensagem', 'excluido', 'INT NULL DEFAULT 0');
      end
    );
    {$ENDREGION}

    {$REGION 'Eleicao-017'}
    AddMigration(Migs, '017_alter_eleicao',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('eleicao', 'ano_fim', 'INT NULL DEFAULT 0');
        M.AddColumnIfMissing('eleicao', 'id_responsavel', 'INT NULL DEFAULT 0');
        M.AddColumnIfMissing('eleicao', 'situacao', 'Varchar(60) NULL');
        M.AddColumnIfMissing('eleicao', 'excluido', 'INT NULL DEFAULT 0');
      end
    );
    {$ENDREGION}

    {$REGION 'Eleicao-018'}
    AddMigration(Migs, '018_alter_eleicao',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('eleicao', 'Data', 'DATE NULL');
      end
    );
    {$ENDREGION}

    {$REGION 'Chapa-019'}
    AddMigration(Migs, '019_alter_chapa',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('chapa', 'responsavel', 'varchar(60) NULL');
      end
    );
    {$ENDREGION}

    {$REGION 'Email-020'}
    AddMigration(Migs, '020_alter_email',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('email', 'id_mensagem', 'INT NULL');
      end
    );
    {$ENDREGION}

    {$REGION 'PlanoContas-021'}
    AddMigration(Migs, '021_alter_planocontas',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('planoconta', 'nivel', 'INT NULL');
        M.AddColumnIfMissing('planoconta', 'tipo', 'char(10) NOT NULL');
        M.AddColumnIfMissing('planoconta', 'aceita_lancamento', 'char(1) DEFAULT ''N''');
        M.AddColumnIfMissing('planoconta', 'ordem', 'INT NULL');
      end
    );
    {$ENDREGION}

    {$REGION 'PedidoItens-022'}
    AddMigration(Migs, '022_alter_pedidoitens',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('pedido_itens', 'seqitem', 'INT NULL');
        M.AddColumnIfMissing('pedido_itens', 'peso', 'DECIMAL(15,3) NULL');
        M.AddColumnIfMissing('pedido_itens', 'volume', 'INT NULL');
        M.AddColumnIfMissing('pedido_itens', 'altura', 'DECIMAL(10,3) NULL');
        M.AddColumnIfMissing('pedido_itens', 'largura', 'DECIMAL(10,3) NULL');
        M.AddColumnIfMissing('pedido_itens', 'prc_unitariom2', 'DECIMAL(15,3) NULL DEFAULT 0');
      end
    );
    {$ENDREGION}

    {$REGION 'Configuracao-023'}
    AddMigration(Migs, '023_alter_configuracao',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('configuracao_nf', 'calculo_vidracaria', 'CHAR(1) NULL DEFAULT ''N'' ');
        M.AddColumnIfMissing('configuracao_nf', 'alterar_preco_pedido', 'CHAR(1) NULL DEFAULT ''N'' ');
      end
    );
    {$ENDREGION}

    {$REGION 'Produto-024'}
    AddMigration(Migs, '024_alter_Produto',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('produto', 'preco_m2', 'CHAR(1) NULL DEFAULT ''N'' ');
      end
    );
    {$ENDREGION}

    {$REGION 'Pedido-025'}
    AddMigration(Migs, '025_alter_Pedido',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('pedido', 'resumoitem', 'Int NULL DEFAULT 0 ');
        M.AddColumnIfMissing('pedido', 'resumopeso', 'Decimal(15,3) NULL DEFAULT 0 ');
        M.AddColumnIfMissing('pedido', 'resumovolume', 'Int NULL DEFAULT 0 ');
        M.AddColumnIfMissing('pedido', 'totalapagar', 'Decimal(15,3) NULL DEFAULT 0 ');
        M.AddColumnIfMissing('pedido', 'id_usuario_alt', 'Int NULL');
        M.AddColumnIfMissing('pedido', 'id_usuario_reabriu', 'Int NULL');
        M.AddColumnIfMissing('pedido', 'id_usuario_cancelou', 'Int NULL');
        M.AddColumnIfMissing('pedido', 'data_cancelado', 'Date NULL');
      end
    );
    {$ENDREGION}

    {$REGION 'Produto-026'}
    AddMigration(Migs, '026_alter_Produto',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('produto', 'usa_chapa', 'CHAR(1) NULL DEFAULT ''N'' ');
        M.AddColumnIfMissing('produto', 'largura_chapa', 'DECIMAL(10,3) NULL ');
        M.AddColumnIfMissing('produto', 'altura_chapa', 'DECIMAL(10,3) NULL ');
        M.AddColumnIfMissing('produto', 'area_chapa', 'DECIMAL(10,3) NULL ');
        M.AddColumnIfMissing('produto', 'qtde_chapa', 'DECIMAL(10,3) NULL ');
      end
    );
    {$ENDREGION}

    {$REGION 'PedidoItens-027'}
    AddMigration(Migs, '027_alter_PedidoItens',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('pedido_itens', 'usa_chapa', 'CHAR(1) NULL DEFAULT ''N'' ');
      end
    );
    {$ENDREGION}

    {$REGION 'funcionario-028'}
    AddMigration(Migs, '028_alter_funcionario',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('funcionario', 'app', 'CHAR(1) NULL DEFAULT ''N'' ');
        M.AddColumnIfMissing('funcionario', 'senha', 'varchar(250) NULL ');
        M.AddColumnIfMissing('funcionario', 'sincronizado', 'CHAR(1) NULL DEFAULT ''N'' ');
        M.AddColumnIfMissing('funcionario', 'tokenwhatsapp', 'varchar(250) NULL ');
      end
    );
    {$ENDREGION}

    {$REGION 'PrazoPag-029'}

    AddMigration(Migs, '029_alter_prazopag',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('prazopagamento', 'exibirapp', 'CHAR(1) NULL DEFAULT ''N''');
      end
    );
    {$ENDREGION}

    {$REGION 'Transportadora-030'}

    AddMigration(Migs, '030_alter_Transportadora',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('transportadora', 'excluido', 'INT NULL DEFAULT 0');
        M.AddColumnIfMissing('transportadora', 'data_exclusao', 'DATE NULL ');
        M.AddColumnIfMissing('transportadora', 'id_usuario_exclusao', 'INT NULL');
      end
    );
    {$ENDREGION}

    {$REGION 'distribuicao_dfe_doc-031'}

    AddMigration(Migs, '031_alter_distribuicao_dfe_doc',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('distribuicao_dfe_doc', 'possui_xml_completo', 'CHAR(1) DEFAULT ''N''');
      end
    );
    {$ENDREGION}

    {$REGION 'Socio-032'}

    AddMigration(Migs, '032_alter_socio',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('socio', 'id_tiposituacao', 'INT ');
      end
    );
    {$ENDREGION}

    {$REGION 'Socio-033'}

    AddMigration(Migs, '033_alter_socio',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('socio', 'id_localtrabalho', 'INT ');
      end
    );
    {$ENDREGION}

    {$REGION 'Dependente-034'}

    AddMigration(Migs, '034_alter_dependente',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('sindicato_dependente', 'data_desfiliacao', 'DATE NULL');
        M.AddColumnIfMissing('sindicato_dependente', 'id_usuario_desfiliacao', 'INT NULL');
      end
    );
    {$ENDREGION}

    {$REGION 'Carteira-035'}

    AddMigration(Migs, '035_alter_carteira',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('carteira', 'data_desfiliacao', 'DATE NULL');
        M.AddColumnIfMissing('carteira', 'id_usuario_desfiliacao', 'INT NULL');
      end
    );
    {$ENDREGION}

    {$REGION 'Empresa-036'}

    AddMigration(Migs, '036_alter_empresa',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('empresa', 'habilitadoweb', 'char(1) DEFAULT ''N'' ');
        M.AddColumnIfMissing('empresa', 'sinc_app', 'char(1) DEFAULT ''N''');
      end
    );
    {$ENDREGION}

    {$REGION 'Configuracoes-037'}

    AddMigration(Migs, '037_alter_configuracoes',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('configuracao_nf', 'eleicao_api', 'varchar(100) ');
        M.AddColumnIfMissing('configuracao_nf', 'eleicao_usuario', 'varchar(60)');
        M.AddColumnIfMissing('configuracao_nf', 'eleicao_senha', 'varchar(250)');
        M.AddColumnIfMissing('configuracao_nf', 'eleicao_token', 'varchar(500)');
      end
    );
    {$ENDREGION}

    {$REGION 'Configuracoeseleicao-038'}

    AddMigration(Migs, '038_alter_eleicao_configuracao',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('eleicao_configuracao', 'slug', 'varchar(60) ');
        M.AddColumnIfMissing('eleicao_configuracao', 'nome_exibicao', 'varchar(150)');
        M.AddColumnIfMissing('eleicao_configuracao', 'logo', 'LONGBLOB DEFAULT NULL');
        M.AddColumnIfMissing('eleicao_configuracao', 'banner', 'LONGBLOB DEFAULT NULL');
        M.AddColumnIfMissing('eleicao_configuracao', 'mensagem_boas_vindas', 'varchar(500)');
        M.AddColumnIfMissing('eleicao_configuracao', 'url_publica', 'varchar(80)');
        M.AddColumnIfMissing('eleicao_configuracao', 'email', 'varchar(150)');
        M.AddColumnIfMissing('eleicao_configuracao', 'telefone', 'varchar(20)');
        M.AddColumnIfMissing('eleicao_configuracao', 'cor_primaria', 'varchar(25)');
        M.AddColumnIfMissing('eleicao_configuracao', 'cor_secundaria', 'varchar(25)');
        M.AddColumnIfMissing('eleicao_configuracao', 'url_instagram', 'varchar(100)');
        M.AddColumnIfMissing('eleicao_configuracao', 'url_facebook', 'varchar(100)');
        M.AddColumnIfMissing('eleicao_configuracao', 'url_youtube', 'varchar(100)');
        M.AddColumnIfMissing('eleicao_configuracao', 'pagina_publicar', 'char(1) DEFAULT ''N''');
        M.AddColumnIfMissing('eleicao_configuracao', 'sinc_app', 'char(1) DEFAULT ''N''');
      end
    );
    {$ENDREGION}

    {$REGION 'mensagemzap-039'}

    AddMigration(Migs, '039_alter_mensagem_zap',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('mensagem_zap', 'tentativas', 'SMALLINT UNSIGNED NOT NULL DEFAULT 0 ');
        M.AddColumnIfMissing('mensagem_zap', 'proximo_envio', 'DATETIME NULL');
        M.AddColumnIfMissing('mensagem_zap', 'processando_em', 'DATETIME NULL');
        M.AddColumnIfMissing('mensagem_zap', 'ultimo_erro', 'TEXT NULL');
        M.AddColumnIfMissing('mensagem_zap', 'message_id', 'VARCHAR(255) NULL');

      end
    );
    {$ENDREGION}

    {$REGION 'ConfigEleicao-040'}

    AddMigration(Migs, '040_alter_eleicao_configuracao',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('eleicao_configuracao', 'data_hora_inicio', 'DATETIME NULL');
        M.AddColumnIfMissing('eleicao_configuracao', 'data_hora_fim', 'DATETIME NULL');
      end
    );
    {$ENDREGION}

    {$REGION 'Chapamembros-041'}

    AddMigration(Migs, '041_alter_eleicao_chapa_membro',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('eleicao_chapa_membro', 'sinc_app', 'CHAR(1) NULL DEFAULT ''S''');
      end
    );
    {$ENDREGION}

    {$REGION 'Eleicao-042'}

    AddMigration(Migs, '042_alter_eleicao',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('eleicao', 'id_sede', 'INT NULL');
      end);
    {$ENDREGION}

    {$REGION 'Eleicao-043'}

    AddMigration(Migs, '043_alter_eleicao',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('eleicao', 'operacao', 'Varchar(30) NULL DEFAULT ''ELEIÇÃO'' '); //eleicao, assembleia
      end);

    {$ENDREGION}

    {$REGION 'eleicao_configuracao-044'}

    AddMigration(Migs, '044_alter_eleicao_configuracao',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('eleicao_configuracao', 'abertura_automatica', 'Char(1) NOT NULL DEFAULT ''N'' ');
        M.AddColumnIfMissing('eleicao_configuracao', 'encerramento_automatico', 'Char(1) NOT NULL DEFAULT ''N'' ');
        M.AddColumnIfMissing('eleicao_configuracao', 'votacao_secreta', 'Char(1) NOT NULL DEFAULT ''S'' ');
        M.AddColumnIfMissing('eleicao_configuracao', 'exibir_resultado_parcial', 'Char(1) NOT NULL DEFAULT ''N'' ');
        M.AddColumnIfMissing('eleicao_configuracao', 'publicacao_resultado', 'Char(1) NOT NULL DEFAULT ''N'' ');
        M.AddColumnIfMissing('eleicao_configuracao', 'controlar_quorum', 'Char(1) NOT NULL DEFAULT ''N'' ');
        M.AddColumnIfMissing('eleicao_configuracao', 'tipo_quorum', 'Varchar(20) NOT NULL DEFAULT ''PERCENTUAL'' ');
        M.AddColumnIfMissing('eleicao_configuracao', 'quorum_minimo', 'INT NOT NULL DEFAULT 0');
        M.AddColumnIfMissing('eleicao_configuracao', 'quorum_percentual', 'DECIMAL(5,2) NOT NULL DEFAULT 0.00');
        M.AddColumnIfMissing('eleicao_configuracao', 'quorum_base', 'Varchar(20) NOT NULL DEFAULT ''APTOS'' ');
        M.AddColumnIfMissing('eleicao_configuracao', 'controlar_presenca', 'Char(1) NOT NULL DEFAULT ''N'' ');
        M.AddColumnIfMissing('eleicao_configuracao', 'exigir_presenca_votacao', 'Char(1) NOT NULL DEFAULT ''N'' ');
      end);

    {$ENDREGION}

    {$REGION 'configuracao_nf-045'}

    AddMigration(Migs, '045_alter_configuracao_nf',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('configuracao_nf', 'utilizasms', 'Char(1) NOT NULL DEFAULT ''N'' ');
        M.AddColumnIfMissing('configuracao_nf', 'provedorsms', 'varchar(45) NOT NULL DEFAULT ''Zenvia'' ');
        M.AddColumnIfMissing('configuracao_nf', 'tokensms', 'varchar(500) NOT NULL ');
        M.AddColumnIfMissing('configuracao_nf', 'identificadorsms', 'varchar(60) NOT NULL ');
        M.AddColumnIfMissing('configuracao_nf', 'urlsms', 'varchar(200) NOT NULL ');
      end);

    {$ENDREGION}



    {$ENDREGION}

    //====================== Alter Table datatype ==============================

    {$REGION 'Alterar Tipo do campo da tabela '}

     {$REGION 'autorizacao-001'}

      AddMigration(Migs, '001_Change_autorizacao',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.ChangeColumnifMissing('autorizacao','data','data','DATE NULL DEFAULT NULL');
      end
      );

     {$ENDREGION}

     {$REGION 'Perfil-002'}

      AddMigration(Migs, '002_Change_perfil',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.ChangeColumnifMissing('perfil','inativo','ativo','CHAR(3) CHARACTER SET ''utf8mb4'' COLLATE ''utf8mb4_unicode_ci'' NULL DEFAULT ''S'' ');
      end
      );

     {$ENDREGION}

     {$REGION 'Eleicao-003'}

      AddMigration(Migs, '003_Change_eleicao',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.ChangeColumnifMissing('eleicao','tipo','tipo','varchar(20) CHARACTER SET ''utf8mb4'' COLLATE ''utf8mb4_unicode_ci'' NULL');
        M.ChangeColumnifMissing('eleicao','inativo','ativo','Char(1) CHARACTER SET ''utf8mb4'' COLLATE ''utf8mb4_unicode_ci'' NULL DEFAULT ''S'' ');
      end
      );

     {$ENDREGION}

     {$REGION 'Chapa-004'}

      AddMigration(Migs, '004_Change_chapa',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.ChangeColumnifMissing('chapa','inativo','ativo','char(1) CHARACTER SET ''utf8mb4'' COLLATE ''utf8mb4_unicode_ci'' NULL');
      end
      );

     {$ENDREGION}

     {$REGION 'PlanoContas-005'}

      AddMigration(Migs, '005_Change_PlanoContas',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.ChangeColumnifMissing('planoconta','id_subgrupoplano','id_pai','INT NULL');
      end);

     {$ENDREGION}

     {$REGION 'Eleicao-006'}

      AddMigration(Migs, '006_Change_Eleicao',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.ChangeColumnifMissing('eleicao','id_empresa','id_empresa','INT NULL');
      end);

     {$ENDREGION}


    {$ENDREGION}


     //====================== Update Table  ====================================

     {$REGION 'Update Tabela Ajustes '}

     {$REGION 'Perfil-001'}

      AddMigration(Migs, '001_Update_perfil',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.UpdateTabela('Update perfil set ativo=''S'' where ativo=''NÃO''');
      end
      );

     {$ENDREGION}

     {$REGION 'Perfil-002'}

      AddMigration(Migs, '002_Update_perfil',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.UpdateTabela('Update perfil set ativo=''N'' where ativo=''SIM''');
      end
      );

     {$ENDREGION}

     {$REGION 'Tipo motivo 003'}

      AddMigration(Migs, '003_insert_tipo_motivo',
        procedure(Conn: TUniConnection)
        var
          M: TMigrator absolute Migrator;
        begin
          M.UpdateTabela('INSERT INTO associado_motivo_movimento (descricao, tipo) VALUES(''Solicitação do associado'', ''D'')');
          M.UpdateTabela('INSERT INTO associado_motivo_movimento (descricao, tipo) VALUES(''Desligamento da empresa'', ''D'')');
          M.UpdateTabela('INSERT INTO associado_motivo_movimento (descricao, tipo) VALUES(''Falecimento'', ''D'')');
          M.UpdateTabela('INSERT INTO associado_motivo_movimento (descricao, tipo) VALUES(''Mudança de cidade'', ''D'')');
          M.UpdateTabela('INSERT INTO associado_motivo_movimento (descricao, tipo) VALUES(''Inadimplência'', ''D'')');
          M.UpdateTabela('INSERT INTO associado_motivo_movimento (descricao, tipo) VALUES(''Erro de cadastro'', ''D'')');
          M.UpdateTabela('INSERT INTO associado_motivo_movimento (descricao, tipo) VALUES(''Outros'', ''A'')');
          M.UpdateTabela('INSERT INTO associado_motivo_movimento (descricao, tipo) VALUES(''Retorno do associado'', ''F'')');
          M.UpdateTabela('INSERT INTO associado_motivo_movimento (descricao, tipo) VALUES(''Regularização cadastral'', ''F'')');
          M.UpdateTabela('INSERT INTO associado_motivo_movimento (descricao, tipo) VALUES(''Nova filiação'', ''F'')');
          M.UpdateTabela('INSERT INTO associado_motivo_movimento (descricao, tipo) VALUES(''Reativação de cadastro'', ''F'')');
        end);

     {$ENDREGION}




     {$ENDREGION}


     // ================= FK Tabela ============================================
    // FK e quer adicionar depois

    {$REGION 'FK Tabela'}

    {$REGION 'FK_Eleicao 001'}

    AddMigration(Migs, '001_add_fk_eleicaoconfig',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        if M.HasTable('eleicao_configuracao') then
          M.AddForeignKeyIfMissing('eleicao_configuracao', 'fk_id_eleicao_idx',
            'FOREIGN KEY (id_eleicao) REFERENCES eleicao(id_eleicao) ON DELETE RESTRICT ON UPDATE NO ACTION');

      end);

    {$ENDREGION}

    {$REGION 'FK_PlanoContas 002'}

     AddMigration(Migs, '002_add_fk_planocontas',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        if M.HasTable('planoconta') then
          M.AddForeignKeyIfMissing('planoconta', 'fk_plano_contas_pai',
            'FOREIGN KEY (id_pai) REFERENCES planoconta(id_planoconta)');

      end);

    {$ENDREGION}

    {$REGION 'FK_Pedidoitens 003'}

     AddMigration(Migs, '003_add_fk_pedidoitens',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        if M.HasTable('pedido_itens') then
          M.AddForeignKeyIfMissing('pedido_itens', 'kf_idproduto_del_idx',
            'FOREIGN KEY (id_produto) REFERENCES produto(id_produto) ON DELETE RESTRICT ON UPDATE NO ACTION');

      end);

    {$ENDREGION}



    {$ENDREGION}



    // ================= Index Tabela ============================================


    {$REGION 'Index Tabela'}

    {$REGION 'Index_PlanoContas 001'}

    AddMigration(Migs, '001_index_planoconta',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        if M.HasTable('planoconta') then
        M.AddIndexIfMissing('planoconta', 'idx_planoconta_codigo', 'INDEX idx_planoconta_codigo (codigo)');
        M.AddIndexIfMissing('planoconta', 'idx_planoconta_pai', 'INDEX idx_planoconta_pai (id_pai)');
      end);

    {$ENDREGION}

    {$REGION 'Index_mensagem_zap 002'}

    AddMigration(Migs, '002_index_mensagem_zap',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        if M.HasTable('mensagem_zap') then
        M.AddIndexIfMissing('mensagem_zap', 'idx_mensagem_zap_fila', 'INDEX idx_mensagem_zap_fila (status, proximo_envio, id_zap)');

      end);

    {$ENDREGION}



    {$ENDREGION}



     {  colocar


  





     }










    // ================= 003 - Exemplo ALTER TABLE =================
    // Adiciona coluna se não existir (útil para evolução incremental)
    {AddMigration(Migs, '003_alter_socio_add_email',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        M.AddColumnIfMissing('socio', 'email', 'VARCHAR(180) NULL');
        M.AddIndexIfMissing('socio', 'idx_socio_email', 'INDEX idx_socio_email (email)');
      end
    );}

    // ================= 004 - Tabela TIPO_DOCUMENTO (exemplo simples) ==========
    {AddMigration(Migs, '004_create_tipo_documento',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
        SQL: string;
      begin
        SQL :=
          'CREATE TABLE tipo_documento ('+
          '  id_documento INT NOT NULL AUTO_INCREMENT,'+
          '  codigo INT,'+
          '  descricao VARCHAR(60) NOT NULL,'+
          '  ativo CHAR(1) DEFAULT ''S'','+
          '  id_empresa INT NULL,'+
          '  PRIMARY KEY (id_documento)'+
          ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;';
        M.CreateTableIfMissing(SQL, 'tipo_documento');

        M.AddIndexIfMissing('tipo_documento', 'idx_td_empresa', 'INDEX idx_td_empresa (id_empresa)');
        if M.HasTable('empresa') then
          M.AddForeignKeyIfMissing('tipo_documento', 'fk_td_empresa',
            'FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa) ON UPDATE CASCADE');
      end
    );}

    // ================= 005 - Exemplo de FK tardia =================
    // Útil quando você criou a tabela sem FK e quer adicionar depois
    {AddMigration(Migs, '005_add_fk_anexo_empresa_usuario',
      procedure(Conn: TUniConnection)
      var
        M: TMigrator absolute Migrator;
      begin
        if M.HasTable('empresa') then
          M.AddForeignKeyIfMissing('anexo', 'fk_anexo_empresa',
            'FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa) ON UPDATE CASCADE');

        if M.HasTable('usuario') then
          M.AddForeignKeyIfMissing('anexo', 'fk_anexo_usuario',
            'FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON UPDATE CASCADE');
      end
    );}

    // ================= Executa todas =================
    Migrator.RunAll(Migs);

  finally
    Migrator.Free;
  end;
end;






end.

