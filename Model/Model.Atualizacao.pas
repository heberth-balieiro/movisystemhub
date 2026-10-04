unit Model.Atualizacao;

interface

Uses
  Uni,
  System.SysUtils,
  UDm;

Type
  TModelAtualizacao = class

    Private
      Class Function AtualizarBaseDados(versao:string):Boolean;
    Public
      class function AtualizarIncremental(VersaoAtual: String): Boolean; static;
      class Procedure CriarTabelas; static;
      class procedure GravarVersao(s:string); static;
      class function EmpresaRegistrada:boolean;static;
      class Function RodaScripbanco(const sql:string):Boolean;
    end;

implementation

{ TModelAtualizacao }

class Function TModelAtualizacao.RodaScripbanco(const sql:string):Boolean;
var
Qry   :TUniquery;

begin

  Qry       := TUniquery.Create(nil);

  Try
    Try


      if dm.Conn.Connected then
      begin
        Qry.Connection    := dm.Conn;//configurar a qry
        Qry.SQL.Text      := sql;

        Qry.ExecSQL;
        Result  := True;
      end
      else
      begin
        raise Exception.Create('Falha na conexão com o banco de dados.');
      end;

    Except on e:exception do
      begin
        raise Exception.Create('Erro ao executar SQL'+e.Message);
      end;
    End;
  Finally
    FreeandNil(Qry);

  End;
end;

class function TModelAtualizacao.AtualizarBaseDados(versao:String): Boolean;
begin
  Result  := False;
  {$REGION '1.24.11.0'}
  if versao = '1.24.11.0' then
  begin
    Try

      //RodaScripbanco('');


      //RodaScripbanco('Update empresa set versaobd= :ver where id_empresa >0',[versao]);

      Result  := True;
    except
    End;
  end;

  {$ENDREGION}

  {$REGION '1.24.11.2'}
  if versao = '1.24.11.2' then
  begin
    Try

      RodaScripbanco('ALTER TABLE configuracao_nf'+
                        ' ADD COLUMN `instanciawhatsappfunc` CHAR(1) NULL DEFAULT ''N'' AFTER `sistema_multiempresa`;'+
                        '');

      RodaScripbanco('ALTER TABLE funcionario  '+
                        ' ADD COLUMN `tokenwhatsapp` VARCHAR(250) NULL AFTER `sincronizado`;');

      RodaScripbanco('ALTER TABLE configuracao_nf    '+
                        ' ADD COLUMN `id_plano_venda` INT NULL AFTER `instanciawhatsappfunc`, '+
                        ' ADD COLUMN `id_plano_compra` INT NULL AFTER `id_plano_venda`,      '+
                        ' ADD COLUMN `id_plano_acredito` INT NULL AFTER `id_plano_compra`,   '+
                        ' ADD COLUMN `id_plano_adebito` INT NULL AFTER `id_plano_acredito`,  '+
                        ' ADD COLUMN `id_custo_avulso` INT NULL AFTER `id_plano_adebito`;    '+
                        '');

      RodaScripbanco('ALTER TABLE configuracao_nf    '+
                        ' ADD COLUMN `vendagerarlivrocaixa` CHAR(1) NULL DEFAULT ''N'' AFTER `id_custo_avulso`; '+
                        '');

      RodaScripbanco('ALTER TABLE livrocaixa  '+
                        ' ADD COLUMN `id_pedido` INT NULL AFTER `data_cadastro`;');

      //RodaScripbanco();



      //RodaScripbanco('Update empresa set versaobd= :ver where id_empresa >0',[versao]);

      Result  := True;
    except
    End;
  end;

  {$ENDREGION}

  {$REGION '1.24.11.3'}

  if versao = '1.24.11.3' then
  begin
    Try

      RodaScripbanco('ALTER TABLE `mensagem_zap`   '+
                      ' ADD COLUMN `tipo` CHAR(1) NULL AFTER `ext`;');

     RodaScripbanco('ALTER TABLE `configuracao_nf`      '+
                      ' CHANGE COLUMN `nfe_nsu` `nfe_nsu` VARCHAR(30) NULL DEFAULT NULL ;');



      //RodaScripbanco('Update empresa set versaobd= :ver where id_empresa >0',[versao]);

      Result  := True;
    except
    End;
  end;

  {$ENDREGION}

  {$REGION '1.24.11.4'}

  if versao = '1.24.11.4' then
  begin
    Try


      RodaScripbanco('ALTER TABLE `socio` '+
                        ' ADD COLUMN `sindicato_perc_desconto` DECIMAL(15,2) NULL AFTER `mostrarapp`,          '+
                        ' ADD COLUMN `sindicato_salario` DECIMAL(15,2) NULL AFTER `sindicato_perc_desconto`,   '+
                        ' ADD COLUMN `tipo_mensalidade` VARCHAR(60) NULL AFTER `sindicato_salario`,            '+
                        ' ADD COLUMN `bloqueado` CHAR(1) NULL DEFAULT ''N'' AFTER `tipo_mensalidade`;          '+
                        '');

      RodaScripbanco('ALTER TABLE `socio`                '+
                        ' ADD COLUMN `sind_id_empresa` INT NULL AFTER `bloqueado`,  '+
                        ' ADD COLUMN `id_profissao` INT NULL AFTER `sind_id_empresa`, '+
                        ' ADD COLUMN `id_lotacao` INT NULL AFTER `id_profissao`;');



      RodaScripbanco('ALTER TABLE `movimentacao_estoque`  '+
                            ' ADD COLUMN `num_operacao` INT NULL AFTER `id_empresa`;');


      RodaScripbanco('ALTER TABLE `movimentacao_estoque`   '+
                          ' CHANGE COLUMN `data_movimentacao` `data_movimentacao` DATE NULL DEFAULT NULL ; '+
                          '');


      RodaScripbanco('ALTER TABLE `movimentacao_estoque`'+
                          ' ADD COLUMN `id_pedido` INT NULL AFTER `num_operacao`;');

      RodaScripbanco('ALTER TABLE `configuracao_nf`        '+
                      ' ADD COLUMN `moduloestoque` CHAR(1) NULL DEFAULT ''N'' AFTER `vendagerarlivrocaixa`;');


     // RodaScripbanco('Update empresa set versaobd= :ver where id_empresa >0',[versao]);

      Result  := True;
    except
    End;
  end;


  {$ENDREGION}

  {$REGION '1.24.11.5'}

  if versao = '1.24.11.5' then
  begin
    Try



      RodaScripbanco('ALTER TABLE `carteira`     '+
                          ' ADD COLUMN `token` VARCHAR(500) NULL AFTER `dataemissao`;');



      RodaScripbanco('ALTER TABLE `carteira`                        '+
                          ' ADD COLUMN `token_device` VARCHAR(500) NULL AFTER `token`;');

      RodaScripbanco('ALTER TABLE `configuracao_nf`      '+
                          ' ADD COLUMN `carteira_api` VARCHAR(100) NULL AFTER `moduloestoque`, '+
                          ' ADD COLUMN `carteira_usuario` VARCHAR(60) NULL AFTER `carteira_api`,'+
                          ' ADD COLUMN `carteira_senha` VARCHAR(250) NULL AFTER `carteira_usuario`, '+
                          ' ADD COLUMN `carteira_token` VARCHAR(500) NULL AFTER `carteira_senha`;'+
                          '');

      RodaScripbanco('ALTER TABLE `configuracao_nf` '+
                          ' ADD COLUMN `utilizaappcarteira` CHAR(1) NULL AFTER `carteira_token`;'+
                          ' ');



      RodaScripbanco('ALTER TABLE `carteira`   '+
                    ' ADD COLUMN `qrcde` LONGBLOB NULL DEFAULT NULL AFTER `token_device`;');

      RodaScripbanco('ALTER TABLE `socio`    '+
                    ' ADD COLUMN `limite` DECIMAL(15,2) NULL DEFAULT 0 AFTER `id_lotacao`;');

      RodaScripbanco('ALTER TABLE `sindicato_dependente`    '+
                    ' ADD COLUMN `autorizado` CHAR(1) NULL DEFAULT ''N'' AFTER `ativo`;');

      RodaScripbanco('ALTER TABLE `socio`                                '+
                     ' ADD COLUMN `prof_cnpj` VARCHAR(20) NULL AFTER `limite`,              '+
                     ' ADD COLUMN `prof_razao` VARCHAR(150) NULL AFTER `prof_cnpj`,          '+
                     ' ADD COLUMN `prof_telefone` VARCHAR(20) NULL AFTER `prof_razao`,        '+
                     ' ADD COLUMN `prof_cep` VARCHAR(20) NULL AFTER `prof_telefone`,           '+
                     ' ADD COLUMN `prof_endereco` VARCHAR(60) NULL AFTER `prof_cep`,            '+
                     ' ADD COLUMN `prof_numero` VARCHAR(20) NULL AFTER `prof_endereco`,          '+
                     ' ADD COLUMN `prof_complemento` VARCHAR(40) NULL AFTER `prof_numero`,        '+
                     ' ADD COLUMN `prof_bairro` VARCHAR(40) NULL AFTER `prof_complemento`,         '+
                     ' ADD COLUMN `prof_idcidade` INT NULL DEFAULT -1 AFTER `prof_bairro`,          '+
                     ' ADD COLUMN `prof_temposervico` VARCHAR(40) NULL AFTER `prof_idcidade`,              '+
                     ' ADD COLUMN `cnh` VARCHAR(5) NULL AFTER `prof_temposervico`,                '+
                     ' ADD COLUMN `tiporesidencia` VARCHAR(45) NULL AFTER `cnh`,                   '+
                     ' ADD COLUMN `temporesidencia` VARCHAR(45) NULL AFTER `tiporesidencia`,        '+
                     ' ADD COLUMN `emissaorg` DATE NULL AFTER `temporesidencia`,                  '+
                     ' ADD COLUMN `nacionalidade` VARCHAR(45) NULL AFTER `emissaorg`,     '+
                     ' ADD COLUMN `ref_banco1` VARCHAR(40) NULL AFTER `nacionalidade`,    '+
                     ' ADD COLUMN `ref_banco2` VARCHAR(40) NULL AFTER `ref_banco1`,        '+
                     ' ADD COLUMN `ref_agencia1` VARCHAR(20) NULL AFTER `ref_banco2`,       '+
                     ' ADD COLUMN `ref_agencia2` VARCHAR(20) NULL AFTER `ref_agencia1`,      '+
                     ' ADD COLUMN `ref_conta1` VARCHAR(20) NULL AFTER `ref_agencia2`,         '+
                     ' ADD COLUMN `ref_conta2` VARCHAR(20) NULL AFTER `ref_conta1`,            '+
                     ' ADD COLUMN `ref_telefone1` VARCHAR(20) NULL AFTER `ref_conta2`,          '+
                     ' ADD COLUMN `ref_telefone2` VARCHAR(20) NULL AFTER `ref_telefone1`,        '+
                     ' ADD COLUMN `ref_tempo1` VARCHAR(20) NULL AFTER `ref_telefone2`,            '+
                     ' ADD COLUMN `ref_tempo2` VARCHAR(20) NULL AFTER `ref_tempo1`,                '+
                     ' ADD COLUMN `ref_pessoal1` VARCHAR(40) NULL AFTER `ref_tempo2`,               '+
                     ' ADD COLUMN `ref_pessoal2` VARCHAR(40) NULL AFTER `ref_pessoal1`,              '+
                     ' ADD COLUMN `ref_telefone3` VARCHAR(20) NULL AFTER `ref_pessoal2`,              '+
                     ' ADD COLUMN `ref_telefone4` VARCHAR(20) NULL AFTER `ref_telefone3`,              '+
                     ' ADD COLUMN `ref_afinidade1` VARCHAR(40) NULL AFTER `ref_telefone4`,              '+
                     ' ADD COLUMN `ref_afinidade2` VARCHAR(40) NULL AFTER `ref_afinidade1`,              '+
                     ' ADD COLUMN `ref_comercial1` VARCHAR(40) NULL AFTER `ref_afinidade2`,               '+
                     ' ADD COLUMN `ref_comercial2` VARCHAR(40) NULL AFTER `ref_comercial1`,               '+
                     ' ADD COLUMN `ref_telefone5` VARCHAR(20) NULL AFTER `ref_comercial2`,                '+
                     ' ADD COLUMN `ref_telefone6` VARCHAR(20) NULL AFTER `ref_telefone5`,                 '+
                     ' ADD COLUMN `fin_veiculo1` VARCHAR(60) NULL AFTER `ref_telefone6`, '+
                     ' ADD COLUMN `fin_veiculo2` VARCHAR(60) NULL AFTER `fin_veiculo1`,  '+
                     ' ADD COLUMN `fin_veiculo3` VARCHAR(60) NULL AFTER `fin_veiculo2`,  '+
                     ' ADD COLUMN `fin_veiculo4` VARCHAR(60) NULL AFTER `fin_veiculo3`,  '+
                     ' ADD COLUMN `fin_ano1` VARCHAR(10) NULL AFTER `fin_veiculo4`,      '+
                     ' ADD COLUMN `fin_ano2` VARCHAR(10) NULL AFTER `fin_ano1`,         '+
                     ' ADD COLUMN `fin_ano3` VARCHAR(10) NULL AFTER `fin_ano2`,         '+
                     ' ADD COLUMN `fin_ano4` VARCHAR(10) NULL AFTER `fin_ano3`,         '+
                     ' ADD COLUMN `fin_financiou1` CHAR(3) NULL DEFAULT ''NÃO'' AFTER `fin_ano4`,  '+
                     ' ADD COLUMN `fin_financiou2` CHAR(3) NULL DEFAULT ''NÃO'' AFTER `fin_financiou1`, '+
                     ' ADD COLUMN `fin_financiou3` CHAR(3) NULL DEFAULT ''NÃO'' AFTER `fin_financiou2`, '+
                     ' ADD COLUMN `fin_financiou4` CHAR(3) NULL DEFAULT ''NÃO'' AFTER `fin_financiou3`, '+
                     ' ADD COLUMN `fin_parcela1` DECIMAL(15,2) NULL DEFAULT 0 AFTER `fin_financiou4`,   '+
                     ' ADD COLUMN `fin_parcela2` DECIMAL(15,2) NULL DEFAULT 0 AFTER `fin_parcela1`,     '+
                     ' ADD COLUMN `fin_parcela3` DECIMAL(15,2) NULL DEFAULT 0 AFTER `fin_parcela2`,    '+
                     ' ADD COLUMN `fin_parcela4` DECIMAL(15,2) NULL DEFAULT 0 AFTER `fin_parcela3`,   '+
                     ' ADD COLUMN `fin_outros` VARCHAR(60) NULL AFTER `fin_parcela4`;               '+
                     ';');

      RodaScripbanco('ALTER TABLE `carteira`  '+
                     ' ADD COLUMN `id_dependente` INT NULL AFTER `qrcde`;');

      RodaScripbanco('ALTER TABLE `carteira`         '+
                     ' ADD COLUMN `api` CHAR(1) NULL DEFAULT ''N'' AFTER `id_dependente`;');

      RodaScripbanco('ALTER TABLE `notificacao`    '+
                      ' ADD COLUMN `foto` LONGBLOB NULL AFTER `publico`;');

     RodaScripbanco('ALTER TABLE `carteira`             '+
                      ' ADD COLUMN `login` VARCHAR(20) NULL AFTER `api`;');

     RodaScripbanco('ALTER TABLE `carteira`  '+
                      ' ADD COLUMN `nomeuser` VARCHAR(90) NULL AFTER `login`;');

      RodaScripbanco('ALTER TABLE `sindicato_dependente` '+
                      ' ADD COLUMN `fone` VARCHAR(20) NULL AFTER `autorizado`;');

      //RodaScripbanco('');

      //RodaScripbanco('');

      //RodaScripbanco('');

      //RodaScripbanco('');

      //RodaScripbanco('');


      //RodaScripbanco('Update empresa set versaobd= :ver where id_empresa >0',[versao]);

      Result  := True;
    except
    End;
  end;




  {$ENDREGION}

  {$REGION '1.25.1.0'}
  if versao = '1.25.1.0' then
    begin
      Try
      //RodaScripbanco('');

      //RodaScripbanco('');

      //RodaScripbanco('');

      //RodaScripbanco('');

      //RodaScripbanco('');

      {
      ALTER TABLE `easydev`.`mensagem_zap`
      ADD COLUMN `token` VARCHAR(1500) NULL AFTER `tipo`;

      ALTER TABLE `easydev`.`configuracao_nf`
      ADD COLUMN `id_mensagempadraowhatsapp` INT NULL AFTER `utilizaappcarteira`;

      ALTER TABLE `easydev`.`sindicato_registro`
      ADD COLUMN `sincronizado` CHAR(1) NULL DEFAULT 'N' AFTER `obs`;

      CREATE TABLE `easydev`.`sincronizar` (
      `id_sincronizar` INT NOT NULL AUTO_INCREMENT,
      `cod_tabela` INT NULL,
      `status` CHAR(1) NULL COMMENT 'S = sincronizado\nC = concluido',
      `id_registro` INT NULL,
      PRIMARY KEY (`id_sincronizar`));

      CREATE TABLE `easydev`.`notificacao_lida` (
      `id` INT NOT NULL AUTO_INCREMENT,
      `id_notificacao` INT NULL,
      `id_carteira` INT NULL,
      `data_leitura` DATE NULL,
      PRIMARY KEY (`id`));

      }


      //RodaScripbanco('Update empresa set versaobd= :ver where id_empresa >0',[versao]);

      Result  := True;
    except
    End;
  end;


  {$ENDREGION}

end;

class function TModelAtualizacao.AtualizarIncremental(VersaoAtual: String): Boolean;
var
  Versoes: TArray<String>;
  Versao: String;
begin
  Result := False;
  try
    // Define a ordem das versões disponíveis
    Versoes := ['1.24.11.0', '1.24.11.2', '1.24.11.3','1.24.11.4','1.24.11.5','1.25.1.0']; // Adicione as versões futuras aqui

    // Inicia uma transação para garantir consistência

    for Versao in Versoes do
    begin
      // Se a versão atual do cliente for menor, aplica a atualização
      if Versao > VersaoAtual then
      begin
        if not AtualizarBaseDados(Versao) then
          raise Exception.Create('Erro ao atualizar para a versão ' + Versao);

        // Atualiza a versão do cliente no banco de dados
        VersaoAtual := Versao;
      end;
    end;

    // Confirma a transação após todas as atualizações

    Result := True;
  except
    on E: Exception do
    begin
      // Reverte as alterações em caso de falha


      raise; // Rethrow para diagnóstico externo
    end;
  end;
end;

class Procedure TModelAtualizacao.CriarTabelas;
begin
  RodaScripbanco('CREATE TABLE IF NOT EXISTS `eleicao` (             '+
            '`id_eleicao` int NOT NULL AUTO_INCREMENT,        '+
            '`codigo` int DEFAULT NULL,                         '+
            '`nome` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, '+
            '`descricao` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,  '+
            '`id_empresa` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,  '+
            '`ano` int DEFAULT NULL,                                                               '+
            '`data_cad` date DEFAULT NULL,                                                         '+
            '`inativo` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''NÃO'',     '+
            '`tipo` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''E'',  '+
            'PRIMARY KEY (`id_eleicao`)                                                         '+
            ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');


  RodaScripbanco('CREATE TABLE IF NOT EXISTS `campanha` (             '+
            '`id_campanha` int NOT NULL AUTO_INCREMENT,        '+
            '`codigo` int NOT NULL,                            '+
            '`id_empresa` int NOT NULL,                        '+
            '`id_usuario` int DEFAULT NULL,                    '+
            '`data_ini` date NOT NULL,                         '+
            '`hora_ini` time NOT NULL,                         '+
            '`data_final` date NOT NULL,                       '+
            '`hora_final` time NOT NULL,                       '+
            '`auditoria` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,     '+
            '`id_eleicao` int NOT NULL,                                                              '+
            '`detalhes` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,  '+
            '`publicada` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,      '+
            '`token` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,     '+
            '`dthr_publicacao` datetime DEFAULT NULL,                                                '+
            '`dthr_fechamento` datetime DEFAULT NULL,                                                '+
            '`dthr_despublicacao` datetime DEFAULT NULL,                                             '+
            '`concluida` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,      '+
            '`anexo` longblob,                                                                       '+
            '`anexo_formato` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,  '+
            '`chave_key` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, '+
            '`chave_key_alt` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,  '+
            '`chave_key_publicar` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,  '+
            '`chave_key_despublicar` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, '+
            '`fechamento_automatico` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,        '+
            '`chave_key_encerramento` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,   '+
            'PRIMARY KEY (`id_campanha`),                                                                        '+
            'KEY `fk_ideleicao3_idx` (`id_eleicao`),                                                              '+
            'CONSTRAINT `fk_ideleicao3` FOREIGN KEY (`id_eleicao`) REFERENCES `eleicao` (`id_eleicao`)           '+
            ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `campanha_historico` (        '+
            '`id_historico` int NOT NULL,                           '+
            '`id_membro` int NOT NULL,                               '+
            '`cpf_confirmacao` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,'+
            '`data` date DEFAULT NULL,                                                               '+
            '`hora` time DEFAULT NULL,                                                                '+
            'PRIMARY KEY (`id_historico`)                                                              '+
            ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `candidato` (                        '+
            '`id_candidato` int NOT NULL AUTO_INCREMENT,                  '+
            '`codigo` int DEFAULT NULL,                                    '+
            '`nome` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,   '+
            '`cargo` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,   '+
            '`cpf` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,      '+
            '`descricao` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,  '+
            '`id_empresa` int DEFAULT NULL,                                                             '+
            '`foto` longblob,                                                                             '+
            '`inativo` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''NÃO'',              '+
            'PRIMARY KEY (`id_candidato`)                                                                     '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `carteira` (               '+
            '`id_carteira` int NOT NULL AUTO_INCREMENT,          '+
            '`id_socio` int NOT NULL,                             '+
            '`validade` date DEFAULT NULL,                         '+
            '`ativo` char(1) DEFAULT ''N'',                           '+
            '`impresso_dependente` char(1) DEFAULT ''N'',              '+
            '`digital` char(1) DEFAULT ''N'',                           '+
            '`senha` varchar(250) DEFAULT NULL,                        '+
            '`id_usuario` int DEFAULT NULL,                             '+
            '`id_empresa` int DEFAULT NULL,                              '+
            '`dataemissao` date DEFAULT NULL,                             '+
            '`token` varchar(500) DEFAULT NULL,                            '+
            '`token_device` varchar(500) DEFAULT NULL,                      '+
            '`qrcde` longblob,                                               '+
            '`id_dependente` INT NULL,'+
            '`api` CHAR(1) NULL DEFAULT ''N'', '+
            '`login` VARCHAR(20) NULL,'+
            '`nomeuser` VARCHAR(90) NULL,'+
            'PRIMARY KEY (`id_carteira`)                                      '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;');






  RodaScripbanco('CREATE TABLE IF NOT EXISTS `chapa` (        '+
            '`id_chapa` int NOT NULL AUTO_INCREMENT,                  '+
            '`codigo` int DEFAULT NULL,                                   '+
            '`nome` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, '+
            '`descricao` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, '+
            '`inativo` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,     '+
            '`id_empresa` int NOT NULL,                                                      '+
            '`data_cadastro` date DEFAULT NULL,                                              '+
            '`id_eleicao` int NOT NULL,                                                      '+
            '`id_candidato` int DEFAULT NULL,                                                 '+
            '`exibir` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,   '+
            'PRIMARY KEY (`id_chapa`),                                                        '+
            'KEY `fk_ideleicao_idx` (`id_eleicao`),                                            '+
            'KEY `fk_idcandidato_idx` (`id_candidato`),                                         '+
            'CONSTRAINT `fk_idcandidato` FOREIGN KEY (`id_candidato`) REFERENCES `candidato` (`id_candidato`),'+
            'CONSTRAINT `fk_ideleicao` FOREIGN KEY (`id_eleicao`) REFERENCES `eleicao` (`id_eleicao`)   '+
            ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `cidade` (           '+
            '`ID_CIDADE` int NOT NULL AUTO_INCREMENT,      '+
            '`CIDADE` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,  '+
            '`UF` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,     '+
            '`INATIVO` int DEFAULT NULL,                                                        '+
            '`CID_IBGE` int DEFAULT NULL,                                                        '+
            '`UF_IBGE` int DEFAULT NULL,                                                          '+
            'PRIMARY KEY (`ID_CIDADE`)                                                            '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `configuracao_nf` (          '+
            '`id_config` int NOT NULL AUTO_INCREMENT,               '+
            '`id_empresa` int NOT NULL,                             '+
            '`nfe_ambiente` int DEFAULT NULL,                         '+
            '`nfe_tipoemissao` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL, '+
            '`nfe_versao` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,      '+
            '`nfe_formaemissao` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,  '+
            '`nfe_caminhocertificado` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL, '+
            '`nfe_senha` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,          '+
            '`nfe_certificadonumero` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL, '+
            '`nfe_numero` int DEFAULT NULL,                                                                 '+
            '`nfe_serie` int DEFAULT NULL,                                                                   '+
            '`nfe_nsu` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,            '+
            '`nfe_cryptlib` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,       '+
            '`nfe_httplib` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,    '+
            '`nfe_xmlsignlib` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,  '+
            '`nfe_ssl` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,        '+
            '`nfe_pathresposta` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,'+
            '`nfe_pathxsd` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,      '+
            '`nfe_pathenviadas` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,  '+
            '`nfe_pathcencelada` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,  '+
            '`nfe_pathcce` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,       '+
            '`nfe_pathinutilizacao` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL, '+
            '`nfe_pathdpec` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,      '+
            '`nfe_pathevento` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,   '+
            '`nfe_pathpdf` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,     '+
            '`nfe_maxnsu` int DEFAULT NULL,                                                             '+
            '`datahoramanifesto` time DEFAULT NULL,                                                      '+
            '`urlapiwhatsapp` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,  '+
            '`urlapiapp` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,       '+
            '`utilizawhatsapp` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT ''N'',     '+
            '`utilizaapp` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT ''N'',        '+
            '`sistema_associacao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT ''N'',  '+
            '`sistema_sindicato` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT ''N'',   '+
            '`sistema_garagem` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT ''N'',   '+
            '`sistema_pedido` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT ''S'',    '+
            '`sistema_locacao` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT ''N'',    '+
            '`sistema_multiempresa` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT ''N'', '+
            '`instanciawhatsappfunc` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT ''N'', '+
            '`id_plano_venda` int DEFAULT NULL,                                                     '+
            '`id_plano_compra` int DEFAULT NULL,                                                     '+
            '`id_plano_acredito` int DEFAULT NULL,                                                    '+
            '`id_plano_adebito` int DEFAULT NULL,                                                      '+
            '`id_custo_avulso` int DEFAULT NULL,                                                       '+
            '`vendagerarlivrocaixa` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT ''N'', '+
            '`moduloestoque` char(1) COLLATE utf8mb3_swedish_ci DEFAULT ''N'',                             '+
            '`carteira_api` varchar(100) COLLATE utf8mb3_swedish_ci DEFAULT NULL,                       '+
            '`carteira_usuario` varchar(60) COLLATE utf8mb3_swedish_ci DEFAULT NULL,                     '+
            '`carteira_senha` varchar(250) COLLATE utf8mb3_swedish_ci DEFAULT NULL,                     '+
            '`carteira_token` varchar(500) COLLATE utf8mb3_swedish_ci DEFAULT NULL,                      '+
            '`utilizaappcarteira` char(1) COLLATE utf8mb3_swedish_ci DEFAULT NULL,                       '+
            'PRIMARY KEY (`id_config`)                                                                   '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `contas` (   '+
            '`id_conta` int NOT NULL AUTO_INCREMENT,                '+
            '`codigo` int DEFAULT NULL,                              '+
            '`agencia` varchar(10) DEFAULT NULL,                     '+
            '`conta` varchar(10) DEFAULT NULL,                        '+
            '`correntista` varchar(255) DEFAULT NULL,                 '+
            '`saldo` decimal(15,2) DEFAULT NULL,                       '+
            '`datasaldo` date DEFAULT NULL,                            '+
            '`datacriacao` date DEFAULT NULL,                           '+
            '`id_empresa` int DEFAULT NULL,                             '+
            '`id_usuario` int DEFAULT NULL,                              '+
            '`ativo` char(1) DEFAULT NULL,                                 '+
            'PRIMARY KEY (`id_conta`)                                         '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `convenio` (               '+
            '`id_convenio` int NOT NULL AUTO_INCREMENT,           '+
            '`codigo` int NOT NULL,                                '+
            '`nome` varchar(90) NOT NULL,                           '+
            '`tipo` varchar(45) NOT NULL,                            '+
            '`termos` varchar(250) DEFAULT NULL,                      '+
            '`informacao_contrato` varchar(500) DEFAULT NULL,          '+
            '`valores` decimal(15,2) DEFAULT NULL,                      '+
            '`telefone` varchar(20) DEFAULT NULL,                        '+
            '`ativo` char(1) DEFAULT ''S'',                                 '+
            '`id_empresa` int DEFAULT NULL,                                '+
            '`datacriacao` date DEFAULT NULL,                               '+
            '`id_usuario` int DEFAULT NULL,                                  '+
            'PRIMARY KEY (`id_convenio`)                                      '+
            ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `custo` (          '+
            '`id_custo` int NOT NULL AUTO_INCREMENT,      '+
            '`codigo` int DEFAULT NULL,                    '+
            '`descricao` varchar(50) DEFAULT NULL,          '+
            '`ativo` char(1) DEFAULT NULL,                   '+
            '`data_cadastro` date DEFAULT NULL,               '+
            '`id_usuario` int DEFAULT NULL,                    '+
            '`id_empresa` int DEFAULT NULL,                     '+
            'PRIMARY KEY (`id_custo`)                            '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;');


  RodaScripbanco('CREATE TABLE IF NOT EXISTS `email` (       '+
            '`id_email` int NOT NULL AUTO_INCREMENT,                 '+
            '`smtp` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, '+
            '`porta` int NOT NULL,                                                           '+
            '`email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,  '+
            '`senha` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,  '+
            '`aut_ssl` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,  '+
            '`tls` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,     '+
            '`id_empresa` int DEFAULT NULL,                                                  '+
            'PRIMARY KEY (`id_email`)                                                        '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `empresa` (                                      '+
            '`id_empresa` int NOT NULL AUTO_INCREMENT,                                                '+
            '`razao` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,           '+
            '`fantasia` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,     '+
            '`cep` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,            '+
            '`endereco` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,        '+
            '`numero` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,           '+
            '`complemento` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,       '+
            '`bairro` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,             '+
            '`id_cidade` int NOT NULL,                                                                        '+
            '`cnpj` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,                     '+
            '`ie` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,                    '+
            '`im` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,                     '+
            '`responsavel` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,             '+
            '`telefone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,                 '+
            '`celular` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,                   '+
            '`whatsapp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,                   '+
            '`site` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,                       '+
            '`email1` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,                      '+
            '`email2` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,                       '+
            '`datacadastro` date DEFAULT NULL,                                                                          '+
            '`tipo_atividade` int DEFAULT NULL,                                                    '+
            '`cnae` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,       '+
            '`fone2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,        '+
            '`celular2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,       '+
            '`logo` longblob,                                                                              '+
            '`guid` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,              '+
            '`versaobd` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,             '+
            'PRIMARY KEY (`id_empresa`),                                                                         '+
            'KEY `fk_id_cidade_idx` (`id_cidade`),                                                                 '+
            'CONSTRAINT `fk_id_cidade` FOREIGN KEY (`id_cidade`) REFERENCES `cidade` (`ID_CIDADE`)                   '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');


  RodaScripbanco('CREATE TABLE IF NOT EXISTS `funcionario` (                            '+
            '`id_funcionario` int NOT NULL AUTO_INCREMENT,                                     '+
            '`codigo` int NOT NULL,                                                              '+
            '`nome` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,        '+
            '`apelido` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,    '+
            '`cpf` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,          '+
            '`rg` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,             '+
            '`cep` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,              '+
            '`endereco` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,           '+
            '`numero` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,               '+
            '`complemento` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,            '+
            '`bairro` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,                   '+
            '`id_cidade` int NOT NULL,                                                                               '+
            '`ativo` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''SIM'',                           '+
            '`id_empresa` int NOT NULL,                                                                                  '+
            '`email` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,                           '+
            '`data_cadastro` date DEFAULT NULL,                                                                              '+
            '`id_usuario` int DEFAULT NULL,                                                                                    '+
            '`funcao` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,                                 '+
            '`telefone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,                                 '+
            '`celular` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,                                    '+
            '`whatsapp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,                                     '+
            '`nascimento` date DEFAULT NULL,                                                                                             '+
            '`obs` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,                                             '+
            '`aviso` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,                                             '+
            '`foto` longblob,                                                                                                                    '+
            '`vendedor` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''N'',   '+
            '`orgao` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,     '+
            '`app` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,             '+
            '`senha` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,        '+
            '`sincronizado` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,        '+
            '`tokenwhatsapp` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,    '+
            'PRIMARY KEY (`id_funcionario`)                                                                   '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `grupo` (                        '+
            '`id_grupo` int NOT NULL AUTO_INCREMENT,                                 '+
            '`codigo` int NOT NULL,                                                    '+
            '`grupo` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, '+
            '`ativo` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,   '+
            '`data_cadastro` date DEFAULT NULL,                                                '+
            '`data_alteracao` date DEFAULT NULL,                                                '+
            '`excluido` int DEFAULT NULL,                                                         '+
            '`id_empresa` int DEFAULT NULL,                                                         '+
            '`id_usuario` int DEFAULT NULL,                                                           '+
            'PRIMARY KEY (`id_grupo`)                                                                   '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `livrocaixa` ( '+
            '`id_livro` int NOT NULL AUTO_INCREMENT,               '+
            '`codigo` int DEFAULT NULL,                             '+
            '`datalan` date DEFAULT NULL,                            '+
            '`operacao` varchar(15) DEFAULT NULL,                     '+
            '`doc_numero` varchar(45) DEFAULT NULL,                    '+
            '`vlr_entrada` decimal(15,4) DEFAULT ''0.0000'',              '+
            '`vlr_saida` decimal(15,4) DEFAULT ''0.0000'',                 '+
            '`saldo` decimal(15,4) DEFAULT ''0.0000'',                      '+
            '`historico` varchar(250) DEFAULT NULL,                        '+
            '`valor` decimal(15,4) DEFAULT ''0.0000'',                        '+
            '`id_plano` int DEFAULT NULL,                                    '+
            '`id_custo` int DEFAULT NULL,                                     '+
            '`id_empresa` int DEFAULT NULL,                                    '+
            '`id_usuario` int DEFAULT NULL,                                     '+
            '`data_cadastro` date DEFAULT NULL,                                  '+
            '`id_pedido` int DEFAULT NULL,                                        '+
            'PRIMARY KEY (`id_livro`)                                              '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `localizacao` (   '+
            '`id_localizacao` int NOT NULL AUTO_INCREMENT,            '+
            '`codigo` int NOT NULL,                                     '+
            '`localizacao` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,   '+
            '`ativo` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,          '+
            '`data_cadastro` date DEFAULT NULL,                                                       '+
            '`data_alteracao` date DEFAULT NULL,                                                       '+
            '`excluido` int DEFAULT NULL,                                                               '+
            '`id_empresa` int DEFAULT NULL,                                                             '+
            '`id_usuario` int DEFAULT NULL,                                                             '+
            'PRIMARY KEY (`id_localizacao`)                                                             '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `marca` (      '+
            '`id_marca` int NOT NULL AUTO_INCREMENT,               '+
            '`codigo` int NOT NULL,                                 '+
            '`marca` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, '+
            '`ativo` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,   '+
            '`data_cadastro` date DEFAULT NULL,                                             '+
            '`data_alteracao` date DEFAULT NULL,                                             '+
            '`excluido` int DEFAULT NULL,                                                     '+
            '`id_empresa` int DEFAULT NULL,                                                    '+
            '`id_usuario` int DEFAULT NULL,                                                     '+
            'PRIMARY KEY (`id_marca`)                                                            '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `membro` (   '+
            '`id_membro` int NOT NULL AUTO_INCREMENT,            '+
            '`codigo` int DEFAULT NULL,                            '+
            '`nome` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,  '+
            '`presidente` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, '+
            '`cpf` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,   '+
            '`id_empresa` int DEFAULT NULL,                                                     '+
            '`foto` longblob,                                                                   '+
            '`inativo` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''NÃO'', '+
            '`id_usuario` int DEFAULT NULL,                                                    '+
            '`id_eleicao` int DEFAULT NULL,                                                      '+
            '`whatsapp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, '+
            '`email` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,     '+
            '`chave_key` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,   '+
            '`secretaria` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,         '+
            '`mesario` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,              '+
            'PRIMARY KEY (`id_membro`),                                                                      '+
            'KEY `fk_ideleicao1_idx` (`id_eleicao`),                                                           '+
            'CONSTRAINT `fk_ideleicao1` FOREIGN KEY (`id_eleicao`) REFERENCES `eleicao` (`id_eleicao`)           '+
            ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `mensagem` (  '+
            '`id_mensagem` int NOT NULL AUTO_INCREMENT,           '+
            '`codigo` int DEFAULT NULL,                             '+
            '`descricao` varchar(90) DEFAULT NULL,                    '+
            '`ativo` char(1) DEFAULT ''N'',                             '+
            '`uso` varchar(45) DEFAULT NULL,                              '+
            '`assunto_email` varchar(120) DEFAULT NULL,                     '+
            '`mensagem` varchar(500) DEFAULT NULL,                            '+
            'PRIMARY KEY (`id_mensagem`)                                        '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `mensagem_zap` (  '+
            '`id_zap` int NOT NULL AUTO_INCREMENT,                    '+
            '`mensagem` varchar(1500) DEFAULT NULL,                    '+
            '`url` varchar(500) DEFAULT NULL,                           '+
            '`nomepessoa` varchar(190) DEFAULT NULL,                     '+
            '`id_pessoa` int DEFAULT NULL,                                '+
            '`fone` varchar(20) DEFAULT NULL,                              '+
            '`status` char(1) DEFAULT NULL,                                 '+
            '`anexobase` longblob,                                           '+
            '`ext` varchar(4) DEFAULT NULL,                                   '+
            '`tipo` char(1) DEFAULT NULL,                                      '+
            'PRIMARY KEY (`id_zap`)                                             '+
            ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci');


  RodaScripbanco('CREATE TABLE IF NOT EXISTS `nfe_manifesto` (  '+
            '`id` int NOT NULL AUTO_INCREMENT,                          '+
            '`numero` varchar(10) DEFAULT NULL,        '+
            '`chave` varchar(44) DEFAULT NULL,          '+
            '`serie` varchar(3) DEFAULT NULL,            '+
            '`nome` varchar(180) DEFAULT NULL,            '+
            '`cnpj` varchar(20) DEFAULT NULL,              '+
            '`ie` varchar(20) DEFAULT NULL,                 '+
            '`nsu` varchar(20) DEFAULT NULL,                 '+
            '`valor` decimal(15,2) DEFAULT NULL,              '+
            '`dt_entrada` date DEFAULT NULL,                  '+
            '`dt_emissao` date DEFAULT NULL,                  '+
            '`situacao` varchar(40) DEFAULT NULL,              '+
            '`id_empresa` int NOT NULL,                         '+
            '`id_usuario` int DEFAULT NULL,                      '+
            '`dir_xml` varchar(200) DEFAULT NULL,                 '+
            '`xml` longblob,                                       '+
            '`gerou` varchar(1) DEFAULT NULL,                       '+
            '`data_evento` date DEFAULT NULL,                        '+
            '`xmotivo` varchar(250) DEFAULT NULL,                     '+
            '`dtmotivo` date DEFAULT NULL,                             '+
            '`modnfe` int DEFAULT NULL,                                 '+
            '`protocolo` varchar(100) DEFAULT NULL,                      '+
            '`digval` varchar(250) DEFAULT NULL,                          '+
            '`evento_verapli` varchar(45) DEFAULT NULL,                    '+
            '`evento_corgao` int DEFAULT NULL,                              '+
            '`evento_tpevento` varchar(80) DEFAULT NULL,                     '+
            '`evento_nseqevento` int DEFAULT NULL,                            '+
            '`evento_dhregevento` varchar(45) DEFAULT NULL,                   '+
            '`evento_nprot` varchar(100) DEFAULT NULL,                         '+
            '`cstat` int DEFAULT NULL,                                          '+
            '`xml_resumo` longblob,                                            '+
            '`impresso` varchar(45) DEFAULT NULL,                              '+
            '`tiponfe` char(1) DEFAULT NULL COMMENT ''entrada ou saida'',     '+
            '`evento_xevento` varchar(50) DEFAULT NULL,                       '+
            '`evento_dhrecebto` datetime DEFAULT NULL,                       '+
            'PRIMARY KEY (`id`)                                              '+
            ') ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `nivel` ( '+
            '`id_nivel` int NOT NULL AUTO_INCREMENT,          '+
            '`id_perfil` int NOT NULL,                         '+
            '`id_empresa` int NOT NULL,                         '+
            '`tela` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,  '+
            '`nome` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, '+
            '`liberado` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''S'',   '+
            'PRIMARY KEY (`id_nivel`)                                                          '+
            ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `notificacao` (  '+
            '`id_notificacao` int NOT NULL AUTO_INCREMENT,          '+
            '`id_socio` int DEFAULT NULL,                           '+
            '`tipo` int NOT NULL,                                   '+
            '`titulo` varchar(90) NOT NULL,                         '+
            '`mensagem` varchar(250) NOT NULL,                      '+
            '`datacriacao` date DEFAULT NULL,                       '+
            '`dataenvio` date DEFAULT NULL,                         '+
            '`retornoenvio` varchar(250) DEFAULT NULL,              '+
            '`horacriacao` time DEFAULT NULL,                       '+
            '`horaenvio` time DEFAULT NULL,                          '+
            '`publico` char(1) DEFAULT NULL,                          '+
            '`foto` LONGBLOB NULL,                                    '+
            'PRIMARY KEY (`id_notificacao`)                            '+
            ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci');





  RodaScripbanco('CREATE TABLE IF NOT EXISTS `produto` (    '+
            '`id_produto` int NOT NULL AUTO_INCREMENT,            '+
            '`codigo` int NOT NULL,                               '+
            '`id_marca` int NOT NULL,                             '+
            '`id_grupo` int NOT NULL,                             '+
            '`id_unidade` int NOT NULL,                           '+
            '`id_localizacao` int NOT NULL,                       '+
            '`id_empresa` int NOT NULL,                             '+
            '`cod_barras` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,   '+
            '`referencia` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,    '+
            '`tipo_produto` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,   '+
            '`descricao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,          '+
            '`descricao_fiscal` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,'+
            '`servico` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,               '+
            '`ativo` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,                  '+
            '`prc_compra` decimal(15,4) DEFAULT NULL,                                                         '+
            '`per_custo` decimal(15,4) DEFAULT NULL,                                                           '+
            '`prc_custo` decimal(15,4) DEFAULT NULL,                                                            '+
            '`per_lucro` decimal(15,4) DEFAULT NULL,                                                          '+
            '`prc_venda` decimal(15,4) DEFAULT NULL,                                                        '+
            '`estoque_minimo` decimal(15,2) DEFAULT NULL,                                                    '+
            '`estoque_inicial` decimal(15,2) DEFAULT NULL,                                                    '+
            '`estoque_atual` decimal(15,2) DEFAULT NULL,                                                       '+
            '`peso_kg` decimal(15,3) DEFAULT NULL,                                                              '+
            '`prc_promocao` decimal(15,4) DEFAULT NULL,                                                          '+
            '`observacao` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,             '+
            '`avisos` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,                  '+
            '`mostrar_app` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,                   '+
            '`alterar_descricao` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,              '+
            '`data_cadastro` date DEFAULT NULL,                                        '+
            '`data_alteracao` date DEFAULT NULL,                                        '+
            '`id_usuario` int DEFAULT NULL,                                              '+
            '`id_usuario_alt` int DEFAULT NULL,                                           '+
            '`excluido` int DEFAULT NULL,                                                  '+
            '`foto1` longblob,                                                              '+
            '`foto2` longblob,                                                               '+
            '`foto3` longblob,                                                                '+
            '`fracionado` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''N'', '+
            '`controlaestoque` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''S'',   '+
            'PRIMARY KEY (`id_produto`)                                                                '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `pedido` (  '+
            '`id_pedido` int NOT NULL AUTO_INCREMENT,         '+
            '`numpedido` int DEFAULT NULL,                    '+
            '`id_cliente` int NOT NULL,                       '+
            '`id_prazo` int NOT NULL,                         '+
            '`id_empresa` int NOT NULL,                       '+
            '`data` date DEFAULT NULL,                        '+
            '`hora` time DEFAULT NULL,                         '+
            '`status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,  '+
            '`observacao` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,'+
            '`id_usuario` int DEFAULT NULL,                                                         '+
            '`id_vendedor` int NOT NULL,                                                            '+
            '`pedido` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''P'',         '+
            '`pag_complemento` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,  '+
            '`adiantamento` decimal(15,3) DEFAULT ''0.000'',          '+
            '`acrescimo` decimal(15,3) DEFAULT ''0.000'',             '+
            '`descontoperc` decimal(15,3) DEFAULT ''0.000'',          '+
            '`descontoreais` decimal(15,3) DEFAULT ''0.000'',         '+
            '`subtotal` decimal(15,3) DEFAULT ''0.000'',              '+
            '`total` decimal(15,3) DEFAULT ''0.000'',                 '+
            '`data_entrega` date DEFAULT NULL,                      '+
            'PRIMARY KEY (`id_pedido`)                              '+
            ') ENGINE=InnoDB AUTO_INCREMENT=1061 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `pedido_itens` (  '+
            '`id_pedido_itens` int NOT NULL AUTO_INCREMENT,          '+
            '`id_pedido` int NOT NULL,                               '+
            '`id_produto` int NOT NULL,                              '+
            '`qtde` decimal(15,3) DEFAULT NULL,                      '+
            '`qtde_2` decimal(15,3) DEFAULT NULL,                    '+
            '`prc_unitario` decimal(15,3) DEFAULT NULL,              '+
            '`desconto_perc` decimal(15,3) DEFAULT NULL,             '+
            '`desconto_reais` decimal(15,3) DEFAULT NULL,            '+
            '`descricao` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,   '+
            '`complemento` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, '+
            '`prc_total` decimal(15,3) DEFAULT NULL,                                                   '+
            '`prc_subtotal` decimal(15,3) DEFAULT NULL,                                                '+
            'PRIMARY KEY (`id_pedido_itens`),                                                          '+
            'KEY `fk_idpedido_del_idx` (`id_pedido`),                                                  '+
            'CONSTRAINT `fk_idpedido_del` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE CASCADE  '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `movimentacao_estoque` (  '+
            '`id_movimentacao` int NOT NULL AUTO_INCREMENT,                  '+
            '`id_produto` int NOT NULL,                                       '+
            '`tipo` enum(''Entrada'',''Saída'',''Ajuste'') NOT NULL,           '+
            '`quantidade` decimal(10,2) NOT NULL,                               '+
            '`quantidade_anterior` decimal(10,2) NOT NULL,                       '+
            '`preco_compra` decimal(10,2) DEFAULT NULL,                            '+
            '`preco_venda` decimal(10,2) DEFAULT NULL,                               '+
            '`data_movimentacao` date DEFAULT NULL,                                    '+
            '`id_usuario` int DEFAULT NULL,                                              '+
            '`observacao` text,                                                            '+
            '`id_empresa` int DEFAULT NULL,                                                  '+
            '`num_operacao` int DEFAULT NULL,                                                  '+
            '`id_pedido` int DEFAULT NULL,                                                       '+
            'PRIMARY KEY (`id_movimentacao`),                                                      '+
            'KEY `id_produto` (`id_produto`),                                                        '+
            'CONSTRAINT `movimentacao_estoque_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `estoque` (        '+
            '`id_estoque` int NOT NULL AUTO_INCREMENT,   '+
            '`id_produto` int NOT NULL,                    '+
            '`qtde` decimal(15,3) DEFAULT NULL,              '+
            '`id_empresa` int DEFAULT NULL,                    '+
            'PRIMARY KEY (`id_estoque`)                          '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `perfil` (     '+
            '`id_perfil` int NOT NULL AUTO_INCREMENT,             '+
            '`codigo` int DEFAULT NULL,                             '+
            '`descricao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, '+
            '`inativo` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''NÃO'', '+
            '`id_empresa` int NOT NULL,                                                         '+
            '`sistema` int DEFAULT ''0'',                                                        '+
            'PRIMARY KEY (`id_perfil`)                                                            '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `plano_grupo` (  '+
            '`id_grupoplano` int NOT NULL AUTO_INCREMENT,           '+
            '`codigo` varchar(10) NOT NULL,                          '+
            '`descricao` varchar(255) DEFAULT NULL,                   '+
            '`id_tipoplano` int NOT NULL,                              '+
            '`datacriacao` date DEFAULT NULL,                           '+
            '`id_usuario` int DEFAULT NULL,                              '+
            '`id_empresa` int DEFAULT NULL,                               '+
            '`ativo` char(1) DEFAULT NULL,                                 '+
            'PRIMARY KEY (`id_grupoplano`)                                  '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `plano_subgrupo` (   '+
            '`id_subgrupo` int NOT NULL AUTO_INCREMENT,    '+
            '`codigo` varchar(10) NOT NULL,                 '+
            '`descricao` varchar(255) DEFAULT NULL,          '+
            '`id_grupo` int NOT NULL,                         '+
            '`datacriacao` date DEFAULT NULL,                  '+
            '`id_usuario` int DEFAULT NULL,                     '+
            '`id_empresa` int DEFAULT NULL,                      '+
            '`ativo` char(1) DEFAULT NULL,                        '+
            'PRIMARY KEY (`id_subgrupo`)                           '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `plano_tipo` ( '+
            '`id_tipo` int NOT NULL AUTO_INCREMENT,             '+
            '`codigo` int NOT NULL,                             '+
            '`tipo` varchar(45) NOT NULL,                       '+
            '`descricao` varchar(255) NOT NULL,                 '+
            '`datacriacao` date DEFAULT NULL,                   '+
            '`ativo` char(1) DEFAULT NULL,                      '+
            '`id_usuario` int DEFAULT NULL,                     '+
            '`id_empresa` int DEFAULT NULL,                     '+
            'PRIMARY KEY (`id_tipo`)                             '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `planoconta` (   '+
            '`id_planoconta` int NOT NULL AUTO_INCREMENT,          '+
            '`codigo` varchar(20) NOT NULL,                        '+
            '`descricao` varchar(255) NOT NULL,                    '+
            '`id_subgrupoplano` int NOT NULL,                      '+
            '`saldoinicial` decimal(15,3) DEFAULT NULL,            '+
            '`datacriacao` date DEFAULT NULL,                      '+
            '`id_usuario` int DEFAULT NULL,                        '+
            '`id_empresa` int DEFAULT NULL,                        '+
            '`ativo` char(1) DEFAULT NULL,                         '+
            'PRIMARY KEY (`id_planoconta`)                          '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `prazopagamento` (  '+
            '`id_prazo` int NOT NULL AUTO_INCREMENT,                   '+
            '`codigo` int NOT NULL,                                     '+
            '`id_empresa` int NOT NULL,                                  '+
            '`tipo` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,      '+
            '`descricao` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,  '+
            '`ativo` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''S'',        '+
            '`data_cadastro` date DEFAULT NULL,                                                    '+
            '`id_usuario` int DEFAULT NULL,                                                         '+
            '`pedido` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''N'',          '+
            '`sistema` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''N'',          '+
            '`exibirapp` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''N'',         '+
            'PRIMARY KEY (`id_prazo`)                                                                   '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');


  RodaScripbanco('CREATE TABLE IF NOT EXISTS `secretaria` (        '+
            '`id_secretaria` int NOT NULL AUTO_INCREMENT,                 '+
            '`codigo` int DEFAULT NULL,                                    '+
            '`razao` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,      '+
            '`fantasia` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,  '+
            '`ativo` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,          '+
            '`id_empresa` int NOT NULL,                                                            '+
            '`id_usuario` int DEFAULT NULL,                                                        '+
            'PRIMARY KEY (`id_secretaria`)                                                         '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `sede` (      '+
            '`id_sede` int NOT NULL AUTO_INCREMENT,               '+
            '`razao` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,        '+
            '`fantasia` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,  '+
            '`cep` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,         '+
            '`endereco` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,     '+
            '`numero` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,        '+
            '`complemento` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,    '+
            '`bairro` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,        '+
            '`id_cidade` int NOT NULL,                                                                 '+
            '`cnpj` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,         '+
            '`ie` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,           '+
            '`im` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,           '+
            '`responsavel` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,  '+
            '`telefone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,     '+
            '`celular` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,          '+
            '`whatsapp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,     '+
            '`site` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,        '+
            '`email1` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,       '+
            '`email2` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,       '+
            '`sedeprincipal` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''N'',  '+
            '`datacadastro` date DEFAULT NULL,                        '+
            '`id_empresa` int DEFAULT NULL,                           '+
            'PRIMARY KEY (`id_sede`),                                 '+
            'KEY `fk_id_empresa_sede_idx` (`id_empresa`),             '+
            'CONSTRAINT `fk_id_empresa_sede` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`)  '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `sindicato_dependente` (    '+
            '`id_dependente` int NOT NULL AUTO_INCREMENT,       '+
            '`codigo` int DEFAULT NULL,                         '+
            '`id_socio` int NOT NULL,                           '+
            '`nome` varchar(190) NOT NULL,                      '+
            '`nascimento` date DEFAULT NULL,                    '+
            '`parentesco` varchar(40) NOT NULL,                 '+
            '`cpf` varchar(20) NOT NULL,                        '+
            '`rg` varchar(20) NOT NULL,                         '+
            '`sexo` varchar(10) NOT NULL,                       '+
            '`foto` longblob,                                   '+
            '`id_empresa` int DEFAULT NULL,                     '+
            '`id_usuario` int DEFAULT NULL,                      '+
            '`datacadastro` date DEFAULT NULL,                    '+
            '`ativo` char(1) DEFAULT ''S'',                        '+
            '`autorizado` CHAR(1) NULL DEFAULT ''N'',               '+
            'PRIMARY KEY (`id_dependente`),                         '+
            'KEY `id_empresa_idl` (`id_empresa`),                    '+
            'CONSTRAINT `sindicato_dependente_id_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`)      '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `sindicato_empresa` (   '+
            '`sind_id_empresa` int NOT NULL AUTO_INCREMENT,                '+
            '`codigo` int DEFAULT NULL,                                     '+
            '`descricao` varchar(190) NOT NULL,                              '+
            '`id_sede` int DEFAULT NULL,                                      '+
            '`id_empresa` int DEFAULT NULL,                                    '+
            '`id_usuario` int DEFAULT NULL,                                     '+
            '`datacadastro` date DEFAULT NULL,                                   '+
            '`ativo` char(1) DEFAULT ''S'',                                         '+
            'PRIMARY KEY (`sind_id_empresa`),                                      '+
            'KEY `id_sede_idx` (`id_sede`),                                         '+
            'CONSTRAINT `id_sede` FOREIGN KEY (`id_sede`) REFERENCES `sede` (`id_sede`) '+
            ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `sindicato_lotacao` (   '+
          '`id_lotacao` int NOT NULL AUTO_INCREMENT,                       '+
          '`codigo` int DEFAULT NULL,                                       '+
          '`descricao` varchar(190) NOT NULL,                                '+
          '`id_empresa` int DEFAULT NULL,                                     '+
          '`id_usuario` int DEFAULT NULL,                                      '+
          '`datacadastro` date DEFAULT NULL,                                    '+
          '`ativo` char(1) DEFAULT ''S'',                                          '+
          'PRIMARY KEY (`id_lotacao`),                                            '+
          'KEY `id_empresa_idl` (`id_empresa`),                                    '+
          'CONSTRAINT `sindicato_lotacao_id_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`)  '+
          ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `sindicato_profissao` (               '+
          '`id_profissao` int NOT NULL AUTO_INCREMENT,                                   '+
          '`codigo` int DEFAULT NULL,                                                     '+
          '`descricao` varchar(190) NOT NULL,                                              '+
          '`id_empresa` int DEFAULT NULL,                                                   '+
          '`id_usuario` int DEFAULT NULL,                                                    '+
          '`datacadastro` date DEFAULT NULL,                                                 '+
          '`ativo` char(1) DEFAULT ''S'',                                                      '+
          'PRIMARY KEY (`id_profissao`),                                                      '+
          'KEY `id_empresa_idx` (`id_empresa`),                                                '+
          'CONSTRAINT `id_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`)   '+
          ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `socio` (        '+
  '`id_socio` int NOT NULL AUTO_INCREMENT,                           '+
  '`id_empresa` int NOT NULL,                                         '+
  '`id_sede` int NOT NULL,                                             '+
  '`codigo` int DEFAULT NULL,                                           '+
  '`matricula` int DEFAULT NULL,                                         '+
  '`socio_deste` date DEFAULT NULL,                                       '+
  '`situacao` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,    '+
  '`nome` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,            '+
  '`apelido` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,       '+
  '`cep` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,            '+
  '`endereco` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,        '+
  '`numero` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,           '+
  '`bairro` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,            '+
  '`complemento` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,        '+
  '`id_cidade` int NOT NULL,                                                                 '+
  '`telefone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,     '+
  '`celular` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,      '+
  '`whatsapp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,     '+
  '`cpf` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,          '+
  '`rg` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,           '+
  '`orgao` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,        '+
  '`ctps` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,         '+
  '`serie` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,        '+
  '`pis` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,          '+
  '`sexo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,         '+
  '`estado_civil` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, '+
  '`nascimento` date DEFAULT NULL,                                                           '+
  '`natural_cidade` int DEFAULT NULL,                                                        '+
  '`email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,       '+
  '`pai` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,          '+
  '`mae` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,          '+
  '`profissao` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,    '+
  '`admissao` date DEFAULT NULL,                                                             '+
  '`data_desativacao` date DEFAULT NULL,                                                     '+
  '`obs` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,         '+
  '`cli_tipo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,     '+
  '`cli_responsavel` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, '+
  '`cliente` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''S'',              '+
  '`fornecedor` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''N'',          '+
  '`envemail` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''S'',               '+
  '`envwhats` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''S'',                '+
  '`codfornecedor` int DEFAULT NULL,                                                                '+
  '`telefone2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,            '+
  '`celular2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,           '+
  '`aviso` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,             '+
  '`foto` longblob,                                                                              '+
  '`escritorio` int DEFAULT NULL,                                                                '+
  '`mostrarapp` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,           '+
  '`sindicato_perc_desconto` decimal(15,2) DEFAULT NULL,                                        '+
  '`sindicato_salario` decimal(15,2) DEFAULT NULL,                                              '+
  '`tipo_mensalidade` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,                      '+
  '`bloqueado` char(1) COLLATE utf8mb4_unicode_ci DEFAULT ''N'',                                  '+
  '`sind_id_empresa` int DEFAULT NULL,                                                '+
  '`id_profissao` int DEFAULT NULL,                                                   '+
  '`id_lotacao` int DEFAULT NULL,                                                     '+
  '`limite` decimal(15,2) DEFAULT ''0.00'',                                             '+
  '`prof_cnpj` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,                   '+
  '`prof_razao` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,                 '+
  '`prof_telefone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,               '+
  '`prof_cep` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,                   '+
  '`prof_endereco` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,              '+
  '`prof_numero` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,                '+
  '`prof_complemento` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,           '+
  '`prof_bairro` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,                '+
  '`prof_idcidade` int DEFAULT ''-1'',                                                '+
  '`prof_temposervico` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,         '+
  '`cnh` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,                        '+
  '`tiporesidencia` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,            '+
  '`temporesidencia` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,          '+
  '`emissaorg` date DEFAULT NULL,                                                  '+
  '`nacionalidade` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,            '+
  '`ref_banco1` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,              '+
  '`ref_banco2` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,              '+
  '`ref_agencia1` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,            '+
  '`ref_agencia2` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,            '+
  '`ref_conta1` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,              '+
  '`ref_conta2` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,              '+
  '`ref_telefone1` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,           '+
  '`ref_telefone2` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,           '+
  '`ref_tempo1` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,              '+
  '`ref_tempo2` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,              '+
  '`ref_pessoal1` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,            '+
  '`ref_pessoal2` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,           '+
  '`ref_telefone3` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,          '+
  '`ref_telefone4` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,         '+
  '`ref_afinidade1` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,         '+
  '`ref_afinidade2` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,         '+
  '`ref_comercial1` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,         '+
  '`ref_comercial2` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,         '+
  '`ref_telefone5` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,          '+
  '`ref_telefone6` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,          '+
  '`fin_veiculo1` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,           '+
  '`fin_veiculo2` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,           '+
  '`fin_veiculo3` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,           '+
  '`fin_veiculo4` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,          '+
  '`fin_ano1` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,              '+
  '`fin_ano2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,              '+
  '`fin_ano3` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,              '+
  '`fin_ano4` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,              '+
  '`fin_financiou1` char(3) COLLATE utf8mb4_unicode_ci DEFAULT ''NÃO'',            '+
  '`fin_financiou2` char(3) COLLATE utf8mb4_unicode_ci DEFAULT ''NÃO'',           '+
  '`fin_financiou3` char(3) COLLATE utf8mb4_unicode_ci DEFAULT ''NÃO'',           '+
  '`fin_financiou4` char(3) COLLATE utf8mb4_unicode_ci DEFAULT ''NÃO'',           '+
  '`fin_parcela1` decimal(15,2) DEFAULT ''0.00'',                                 '+
  '`fin_parcela2` decimal(15,2) DEFAULT ''0.00'',                                 '+
  '`fin_parcela3` decimal(15,2) DEFAULT ''0.00'',                                '+
  '`fin_parcela4` decimal(15,2) DEFAULT ''0.00'',                                 '+
  '`fin_outros` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,               '+
  'PRIMARY KEY (`id_socio`),                                                    '+
  'KEY `fk_id_cidade_idxs` (`id_cidade`) /*!80000 INVISIBLE */,                 '+
  'KEY `s_id_empresa_idx` (`id_empresa`),                                       '+
  'KEY `ss_id_empresa_idx` (`id_empresa`),                                      '+
  'KEY `fk_empresa_id_idx` (`id_empresa`),                                       '+
  'CONSTRAINT `fk_cidade_id` FOREIGN KEY (`id_cidade`) REFERENCES `cidade` (`ID_CIDADE`)   '+
  ') ENGINE=InnoDB AUTO_INCREMENT=1007 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `tela` (                                '+
          '`id_tela` int NOT NULL AUTO_INCREMENT,                                           '+
          '`tela` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, '+
          '`nome` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,  '+
          '`situacao` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,   '+
          '`tipo_atividade` int DEFAULT NULL,                                                 '+
          'PRIMARY KEY (`id_tela`)                                                            '+
          ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `temp` (           '+
          '`id_temp` int NOT NULL AUTO_INCREMENT,                      '+
          '`id_empresa` int DEFAULT NULL,                                '+
          '`nome` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,           '+
          '`data_cadastro` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,   '+
          '`data_expiracao` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,   '+
          '`api_whatsapp` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,      '+
          '`usar_whatsapp` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''N'',            '+
          '`instance_key` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,        '+
          '`api_app` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,              '+
          'PRIMARY KEY (`id_temp`)                                                                             '+
          ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `transportadora` (    '+
          '`id_transportadora` int NOT NULL AUTO_INCREMENT,               '+
          '`codigo` int NOT NULL,                                          '+
          '`cnpj` varchar(20) DEFAULT NULL,                                 '+
          '`razao` varchar(255) NOT NULL,                                    '+
          '`fantasia` varchar(200) DEFAULT NULL,                              '+
          '`ie` varchar(20) DEFAULT NULL,                                      '+
          '`antt` varchar(20) DEFAULT NULL,                                     '+
          '`cep` varchar(20) DEFAULT NULL,                                       '+
          '`endereco` varchar(150) DEFAULT NULL,                                  '+
          '`numero` varchar(20) DEFAULT NULL,                                      '+
          '`bairro` varchar(90) DEFAULT NULL,                                       '+
          '`complemento` varchar(90) DEFAULT NULL,                                   '+
          '`id_cidade` int NOT NULL,                                                  '+
          '`email` varchar(255) DEFAULT NULL,                                         '+
          '`telefone` varchar(20) DEFAULT NULL,                                       '+
          '`datacriacao` date DEFAULT NULL,                                           '+
          '`ativo` char(1) DEFAULT NULL,                                              '+
          '`id_empresa` int NOT NULL,                                                 '+
          '`id_usuario` int DEFAULT NULL,                                             '+
          '`tipo` int DEFAULT NULL,                                                    '+
          'PRIMARY KEY (`id_transportadora`),                                           '+
          'KEY `t_id_empresa_idx` (`id_empresa`),                                        '+
          'CONSTRAINT `t_id_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`)  '+
          ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `unidade` (                            '+
          '`id_unidade` int NOT NULL AUTO_INCREMENT,                                       '+
          '`codigo` int NOT NULL,                                                           '+
          '`uni` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,       '+
          '`unidade` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,   '+
          '`ativo` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,      '+
          '`data_cadastro` date DEFAULT NULL,                                                   '+
          '`data_alteracao` date DEFAULT NULL,                                                   '+
          '`excluido` int DEFAULT NULL,                                                           '+
          '`id_empresa` int DEFAULT NULL,                                                          '+
          '`id_usuario` int DEFAULT NULL,                                                           '+
          'PRIMARY KEY (`id_unidade`),                                                                '+
          'KEY `fk_id_empresa_idx` (`id_empresa`),                                                     '+
          'KEY `und_id_empresa_idx` (`id_empresa`),                                                     '+
          'CONSTRAINT `unid_id_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`)   '+
          ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `usuario` (               '+
          '`id_usuario` int NOT NULL AUTO_INCREMENT,                          '+
          '`nome` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,   '+
          '`login` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,   '+
          '`id_empresa` int NOT NULL,                                                        '+
          '`id_sede` int NOT NULL,                                                            '+
          '`senha` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,     '+
          '`ativo` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''N'',        '+
          '`email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,   '+
          '`sistema` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT ''N'',        '+
          '`id_perfil` int DEFAULT NULL,                                                           '+
          '`id_funcionario` int DEFAULT NULL,                                                       '+
          'PRIMARY KEY (`id_usuario`),                                                               '+
          'KEY `fk_id_empresa_idx` (`id_empresa`),                                                    '+
          'CONSTRAINT `fk_id_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`)   '+
          ') ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `verificacode` (                        '+
          '`id` int NOT NULL AUTO_INCREMENT,                                                '+
          '`code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,'+
          '`expiracao` datetime DEFAULT NULL,                                              '+
          '`id_associado` int DEFAULT NULL,                                                '+
          'PRIMARY KEY (`id`)                                                              '+
          ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');

  RodaScripbanco('CREATE TABLE IF NOT EXISTS `votos` (                             '+
          '`id_votos` int NOT NULL AUTO_INCREMENT,                                        '+
          '`token` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, '+
          '`voto` int NOT NULL,                                                             '+
          '`chave` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL, '+
          '`data` date DEFAULT NULL,                                                       '+
          '`hora` time DEFAULT NULL,                                                        '+
          '`id_associado` int NOT NULL,                                                     '+
          '`ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,   '+
          '`ordem` int DEFAULT NULL,                                                        '+
          'PRIMARY KEY (`id_votos`)                                                         '+
          ') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci');


  RodaScripbanco('CREATE TABLE IF NOT EXISTS `sindicato_registro` (        '+
          '`id_registro` INT NOT NULL AUTO_INCREMENT,        '+
          '`id_carteira` INT NOT NULL,                       '+
          '`id_usuario` INT NOT NULL,                        '+
          '`data` DATE NULL,                                 '+
          '`hora` TIME NULL,                                 '+
          '`obs` VARCHAR(250) NULL,                          '+
          'PRIMARY KEY (`id_registro`));');



  {RodaScripbanco('CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `app_empresa` '+
            'AS select `empresa`.`id_empresa` AS `IDEMPRESA`,coalesce(`empresa`.`razao`,'') AS `RAZAO`,'+
            'coalesce(`empresa`.`fantasia`,'') AS `FANTASIA`,coalesce(`empresa`.`cep`,'') AS `CEP`,'+
            'coalesce(`empresa`.`endereco`,'') AS `ENDERECO`,coalesce(`empresa`.`numero`,'') AS `NUMERO`,'+
            'coalesce(`empresa`.`complemento`,'') AS `COMPLEMENTO`,coalesce(`empresa`.`bairro`,'') AS `BAIRRO`,'+
            '`empresa`.`id_cidade` AS `IDCIDADE`,coalesce(`empresa`.`cnpj`,'') AS `CNPJ`,'+
            'coalesce(`empresa`.`ie`,'') AS `IE`,coalesce(`empresa`.`responsavel`,'') AS `RESP`,'+
            'coalesce(`empresa`.`telefone`,'') AS `TELEFONE`,coalesce(`empresa`.`celular`,'') AS `CELULAR`,'+
            'coalesce(`empresa`.`whatsapp`,'') AS `WHATSAPP`,coalesce(`empresa`.`site`,'') AS `SITE`,'+
            'coalesce(`empresa`.`email1`,'') AS `EMAIL`,coalesce(`empresa`.`logo`,'') AS `LOGO`,'+
            'coalesce(`empresa`.`guid`,'') AS `guid` from `empresa` where (`empresa`.`id_empresa` > 0) '+
            'order by coalesce(`empresa`.`razao`,'')');

  RodaScripbanco('CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `app_pessoa` AS '+
  'select `p`.`id_socio` AS `idcliente`,`p`.`id_empresa` AS `idempresa`,`p`.`codigo` AS `codigo`,'+
  'coalesce(`p`.`situacao`,'') AS `ativo`,coalesce(`p`.`nome`,'') AS `nome`,coalesce(`p`.`apelido`,'') AS `apelido`,'+
  'coalesce(`p`.`cep`,'') AS `cep`,coalesce(`p`.`endereco`,'') AS `endereco`,coalesce(`p`.`numero`,'') AS `numero`,'+
  'coalesce(`p`.`bairro`,'') AS `bairro`,coalesce(`p`.`complemento`,'') AS `complemento`,'+
  'coalesce(`p`.`telefone`,'') AS `telefone`,coalesce(`p`.`celular`,'') AS `celular`,'+
  'coalesce(`p`.`whatsapp`,'') AS `whatsapp`,coalesce(`p`.`cpf`,'') AS `cpf`,coalesce(`p`.`rg`,'') AS `rg`,'+
  'coalesce(`p`.`nascimento`,'') AS `nascimento`,coalesce(`p`.`email`,'') AS `email`,'+
  'coalesce(`p`.`obs`,'') AS `obs`,coalesce(`p`.`cli_tipo`,'') AS `tipopessoa`,'+
  'coalesce(`p`.`envemail`,'') AS `enviaremail`,coalesce(`p`.`envwhats`,'') AS `enviarwhats`,'+
  'coalesce(`p`.`telefone2`,'') AS `telefone2`,coalesce(`p`.`celular2`,'') AS `celular2`,'+
  'coalesce(`p`.`aviso`,'') AS `aviso`,`c`.`CIDADE` AS `cidade`,`c`.`UF` AS `uf`,`c`.`CID_IBGE` AS `cid_ibge`,'+
  'coalesce(`p`.`mostrarapp`,'') AS `exibirapp` from (`socio` `p` join `cidade` `c` '+
  'on((`p`.`id_cidade` = `c`.`ID_CIDADE`))) where ((`p`.`id_socio` > 0) and (`p`.`cliente` = ''S'') and (`p`.`mostrarapp` = ''S''))');

  RodaScripbanco('CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `app_prazo`'+
  ' AS select `p`.`id_prazo` AS `IDPRAZO`,`p`.`codigo` AS `CODIGO`,`p`.`id_empresa` AS `ID_EMPRESA`,'+
  'coalesce(`p`.`tipo`,'') AS `TIPO`,coalesce(`p`.`descricao`,'') AS `DESCRICAO`,coalesce(`p`.`ativo`,'') AS `ATIVO`,'+
  'coalesce(`p`.`pedido`,'') AS `PEDIDO`,coalesce(`p`.`sistema`,'') AS `SISTEMA` from `prazopagamento` `p`'+
  ' where ((`p`.`id_prazo` > 0) and (`p`.`exibirapp` = ''S''))');

  RodaScripbanco('CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `app_produto` AS '+
  ' select `p`.`id_produto` AS `idproduto`,`p`.`codigo` AS `codigo`,`p`.`id_empresa` AS `idempresa`,'+
  'coalesce(`p`.`cod_barras`,'') AS `codbarra`,coalesce(`p`.`referencia`,'') AS `ref`,'+
  'coalesce(`p`.`descricao`,'') AS `descricao`,coalesce(`p`.`descricao_fiscal`,'') AS `descricaofiscal`,'+
  'coalesce(`p`.`servico`,'') AS `servico`,coalesce(`p`.`ativo`,'') AS `ativo`,'+
  'coalesce(`p`.`prc_compra`,0) AS `prccompra`,coalesce(`p`.`prc_custo`,0) AS `prccusto`,'+
  'coalesce(`p`.`prc_venda`,0) AS `prcvenda`,coalesce(`p`.`estoque_atual`,0) AS `estoque`,'+
  'coalesce(`p`.`peso_kg`,0) AS `peso`,coalesce(`p`.`prc_promocao`,0) AS `promocao`,'+
  'coalesce(`p`.`avisos`,'') AS `aviso`,coalesce(`p`.`mostrar_app`,'') AS `exibir`,'+
  'coalesce(`p`.`alterar_descricao`,'') AS `alterardescricao`,coalesce(`p`.`foto1`,'') AS `foto`,'+
  'coalesce(`p`.`fracionado`,'') AS `fracionado`,coalesce(`p`.`controlaestoque`,'') AS '+
  '`controla`,`m`.`marca` AS `marca`,`g`.`grupo` AS `grupo`,`l`.`localizacao` AS `localizacao`,`u`.`uni` AS `unidade`'+
  ' from ((((`produto` `p` join `marca` `m` on((`p`.`id_marca` = `m`.`id_marca`))) join `grupo` `g`'+
  ' on((`p`.`id_grupo` = `g`.`id_grupo`))) join `localizacao` `l` on((`p`.`id_localizacao` = `l`.`id_localizacao`))) '+
  'join `unidade` `u` on((`p`.`id_unidade` = `u`.`id_unidade`))) where ((`p`.`id_produto` > 0) and (`p`.`mostrar_app` = ''S''))');

  RodaScripbanco('CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `app_vendedor` AS '+
  'select `funcionario`.`id_funcionario` AS `id_funcionario`,coalesce(`funcionario`.`nome`,'') AS `nome`,'+
  'coalesce(`funcionario`.`cpf`,'') AS `cpf`,`funcionario`.`ativo` AS `ativo`,`funcionario`.`id_empresa` AS `id_empresa`,'+
  'coalesce(`funcionario`.`vendedor`,'') AS `vendedor`,coalesce(`funcionario`.`senha`,'') AS `senha` from `funcionario`'+
  ' where ((`funcionario`.`id_funcionario` > 0) and (`funcionario`.`app` = ''S'') and (`funcionario`.`ativo` = ''S''))');

  RodaScripbanco('CREATE DEFINER=`root`@`%` PROCEDURE `AtualizarEstoque`(IN p_id_produto INT, IN p_qtde INT)   '+
              'BEGIN                                                                                                 '+
              '    UPDATE produto                                                                                     '+
              '    SET estoque_atual = estoque_atual - p_qtde                                                          '+
              '    WHERE id_produto = p_id_produto;                                                                  '+
              ' END');

  RodaScripbanco('CREATE DEFINER=`root`@`%` PROCEDURE `AtualizarEstoqueDelete`(IN p_id_produto INT, IN p_qtde INT)  '+
              'BEGIN                                                                                                     '+
              '    UPDATE produto                                                                                        '+
              '    SET estoque_atual = estoque_atual + p_qtde                                                            '+
              '    WHERE id_produto = p_id_produto;                                                                     '+
              'END');

  RodaScripbanco('CREATE DEFINER=`root`@`%` PROCEDURE `GetCampanhaCabechalho`(IN situacao_param VARCHAR(500))  '+
              'BEGIN                                       '+
              '    Select                                   '+
              '    e.descricao,                              '+
              '    e.nome,                                    '+
              '    c.data_ini,                                 '+
              '    c.hora_ini,                                  '+
              '    c.data_final,                                 '+
              '    c.hora_final                                   '+
              '  From campanha c                                   '+
              '  inner join eleicao e                               '+
              '  on c.id_eleicao = e.id_eleicao                      '+
              '  where c.id_campanha >0                               '+
              '  and c.token=  situacao_param;                         '+
              ' END');

  RodaScripbanco('CREATE DEFINER=`root`@`%` PROCEDURE `GetCampanhaNaoVotantes`(IN situacao_param VARCHAR(500))  '+
              'BEGIN                                           '+
              '    SELECT                                       '+
              '    s.codigo,                                     '+
              '    s.matricula,                                   '+
              '    s.nome,                                         '+
              '    s.cpf,                                           '+
              '    s.rg,                                             '+
              '    s.orgao,                                          '+
              '    s.email                                           '+
              'FROM                                                   '+
              '    socio s                                             '+
              'LEFT JOIN                                                '+
              '    votos v                                               '+
              'ON                                                         '+
              '    s.id_socio = v.id_associado                             '+
              'AND                                                          '+
              '    v.token = situacao_param                              '+
              'WHERE                                                      '+
              '    s.situacao=''S''                                          '+
              '                                                             '+
              'and v.id_votos IS NULL                                        '+
              'ORDER BY                                                       '+
              '    s.nome;                                                    '+
              '                                                                '+
              'END');

  RodaScripbanco('CREATE DEFINER=`root`@`%` PROCEDURE `GetListaAssociadoVotantes`(IN situacao_param VARCHAR(500)) '+
              'BEGIN                                '+
              '    Select                            '+
              '    s.codigo,                          '+
              '    s.matricula,                        '+
              '    s.nome,                              '+
              '    s.cpf,                                '+
              '    s.rg,                                  '+
              '    s.orgao,                                '+
              '        v.ordem,                             '+
              '        v.ip,                                 '+
              '        v.chave,                               '+
              '        v.data,                                 '+
              '        v.hora                                   '+
              '  from votos v                                    '+
              '  inner join socio s                               '+
              '  on v.id_associado = s.id_socio                    '+
              '  where id_votos >0                                  '+
              '  and v.token= situacao_param                         '+
              '  order by v.ordem;                                    '+
              'END');

  RodaScripbanco('CREATE DEFINER=`root`@`%` PROCEDURE `GetSociosPorSituacao`(IN situacao_param VARCHAR(5)) '+
              'BEGIN                                    '+
              '    SELECT                                '+
              '        s.codigo,                          '+
              '        s.matricula,                        '+
              '        s.nome,                              '+
              '        a.razao,                              '+
              '        s.cpf                                  '+
              '    FROM                                        '+
              '        socio s                                  '+
              '    INNER JOIN                                    '+
              '        secretaria a                               '+
              '    ON                                             '+
              '        s.escritorio = a.id_secretaria              '+
              '    WHERE                                            '+
              '        s.id_socio > 0                                '+
              '        AND s.situacao = situacao_param                '+
              '        order by s.nome;                                '+
              'END');

  RodaScripbanco('CREATE DEFINER=`root`@`%` PROCEDURE `LimparTodasTabelas`()  '+
              'BEGIN                                                                 '+
              '    DECLARE done INT DEFAULT 0;                                       '+
              '    DECLARE tabela_nome VARCHAR(255);                                  '+
              '    DECLARE coluna_id VARCHAR(255);                                     '+
              '    DECLARE fk_tabela_nome VARCHAR(255);                                 '+
              '    DECLARE fk_coluna_id VARCHAR(255);                                    '+
              '                                                                          '+
              '    -- Cursor principal para listar as tabelas na ordem correta            '+
              '    DECLARE cursor_tabelas CURSOR FOR                                       '+
              '        SELECT table_name                                                    '+
              '        FROM information_schema.tables                                        '+
              '        WHERE table_schema = DATABASE()                                        '+
              '        ORDER BY                                                               '+
              '            (SELECT COUNT(*) FROM information_schema.key_column_usage           '+
              '             WHERE referenced_table_schema = DATABASE()                          '+
              '             AND referenced_table_name = table_name) ASC;                         '+
              '                                                                                   '+
              '    -- Cursor para as tabelas dependentes (filhas)                                 '+
              '    DECLARE cursor_dependentes CURSOR FOR                                           '+
              '        SELECT table_name, column_name                                               '+
              '        FROM information_schema.key_column_usage                                      '+
              '        WHERE referenced_table_schema = DATABASE()                                     '+
              '          AND referenced_table_name = tabela_nome;                                      '+
              '                                                                                         '+
              '    -- Tratador de final de cursor compartilhado para ambos os cursores                   '+
              '    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;                                   '+
              '                                                                                            '+
              '    -- Abrir o cursor principal                                                              '+
              '    OPEN cursor_tabelas;                                                                      '+
              '                                                                                               '+
              '    tabela_loop: LOOP                                               '+
              '        SET done = 0;  -- Resetar `done` antes de cada uso de cursor '+
              '        FETCH cursor_tabelas INTO tabela_nome;                        '+
              '        IF done THEN                                                   '+
              '            LEAVE tabela_loop;                                          '+
              '        END IF;                                                          '+
              '                                                                          '+
              '        -- Verifica se a tabela é uma das que devem ser mantidas           '+
              '        IF tabela_nome IN (''cidade'') THEN                                   '+
              '            ITERATE tabela_loop; -- pula para a próxima iteração do loop     '+
              '        END IF;                                                               '+
              '                                                                               '+
              '        -- Obter o nome da coluna de chave primária                             '+
              '        SET coluna_id = (SELECT column_name                                      '+
              '                         FROM information_schema.columns                          '+
              '                         WHERE table_schema = DATABASE()                           '+
              '                         AND table_name = tabela_nome                               '+
              '                         AND column_key = ''PRI''                                      '+
              '                         LIMIT 1);                                                    '+
              '                                                                                       '+
              '        -- Verificar se uma coluna de chave primária foi encontrada e limpar os dados das tabelas filhas    '+
              '        IF coluna_id IS NOT NULL THEN                                                                        '+
              '            -- Abrir cursor para as tabelas dependentes                                                       '+
              '            OPEN cursor_dependentes;                                                                           '+
              '            dependente_loop: LOOP                                                                               '+
              '                SET done = 0;  -- Resetar `done` antes de usar o cursor dependente                               '+
              '                FETCH cursor_dependentes INTO fk_tabela_nome, fk_coluna_id;                                       '+
              '                IF done THEN                                                                                       '+
              '                    LEAVE dependente_loop;                                                                          '+
              '                END IF;                                                                                              '+
              '                                                                                                                      '+
              '                SET @delete_sql = CONCAT(''DELETE FROM '', fk_tabela_nome, '' WHERE '', fk_coluna_id, '' > 0'');             '+
              '                PREPARE stmt FROM @delete_sql;                                                                          '+
              '                EXECUTE stmt;                                                                                            '+
              '                DEALLOCATE PREPARE stmt;                                                                                  '+
              '            END LOOP;                                                                                                      '+
              '            CLOSE cursor_dependentes;                                                          '+
              '                                                                                                '+
              '            -- Limpar a tabela principal                                                         '+
              '            SET @delete_sql = CONCAT(''DELETE FROM '', tabela_nome, '' WHERE '', coluna_id, '' > 0'');  '+
              '            PREPARE stmt FROM @delete_sql;                                                         '+
              '            EXECUTE stmt;                                                                           '+
              '            DEALLOCATE PREPARE stmt;                                                                 '+
              '        END IF;                                                                                       '+
              '                                                                                                       '+
              '    END LOOP;                                                                                           '+
              '                                                                                                         '+
              '    -- Fechar o cursor principal                                                                          '+
              '    CLOSE cursor_tabelas;                                                                                  '+
              'END');
               }
  //RodaScripbanco('');

  //RodaScripbanco('');

  //RodaScripbanco('');

  //RodaScripbanco('');

  //RodaScripbanco('');
  //RodaScripbanco('');
  //RodaScripbanco('');
  //RodaScripbanco('');
  //RodaScripbanco('');
  //RodaScripbanco('');
  //RodaScripbanco('');

end;

class procedure TModelAtualizacao.GravarVersao(s:string);
begin
  //RodaScripbanco('Update empresa set versaobd= :ver where id_empresa >0',[s]);
end;

class function TModelAtualizacao.EmpresaRegistrada:boolean;
var
Qry:Tuniquery;
begin
  Result  := True;

  {Try
     Qry   := TModelSQL.ConsultarSQL('Select id_empresa from empresa where id_empresa>0 limit 1');
     if not Qry.IsEmpty then
     result := true;
  Finally
    Qry.Free;
  End;}

end;

end.
