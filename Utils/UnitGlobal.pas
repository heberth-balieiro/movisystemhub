unit UnitGlobal;

interface

uses
  System.SysUtils;

const
  AppName               : String  = 'EasyOne Systems';
  AppVersion            : String  = '1.25.8.0';
  AppValidarCPFCNPJ     : string  = 'N';

  NfePathCancelada      : string  = '\NFe\Cancelamento';
  NfePathCCe            : string  = '\NFe\CCe';
  NfePathDocs           : string  = '\NFe\Docs';
  NfePathEnviadas       : string  = '\NFe\Enviadas';
  NfePathEvento         : string  = '\NFe\Evento';
  NfePathInutilizacao   : string  = '\NFe\Inutilizacao';
  NfePathPdf            : string  = '\NFe\PDF';
  NfePathResposta       : string  = '\NFe\Xml';
  NfePathDpec           : string  = '\NFe\Dpec';
  PathSalvar            : string  = '\NFe\PDF';

  NfePathXsd            : string  = '\Schemas\NFe';

  //Sql Para o Lookup padroes

  LookupPessoaSql       = 'Select ' +
                  '  s.id_socio, ' +
                  '  Concat( ' +
                  '    ''['', ' +
                  '    case when s.cliente = ''S'' then Concat(''C:'', s.codigo) else '''' end, ' +
                  '    case when s.cliente = ''S'' and s.fornecedor = ''S'' then '' / '' else '''' end, ' +
                  '    case when s.fornecedor = ''S'' then Concat(''F:'', s.codfornecedor) else '''' end, ' +
                  '    ''] '', ' +
                  '    s.nome, '' | '', ' +
                  '    (CASE ' +
                  '       WHEN LENGTH(s.cpf) = 11 THEN ' +
                  '         CONCAT(SUBSTRING(s.cpf, 1, 3), ''.'', SUBSTRING(s.cpf, 4, 3), ''.'', SUBSTRING(s.cpf, 7, 3), ''-'', SUBSTRING(s.cpf, 10, 2)) ' +
                  '       WHEN LENGTH(s.cpf) = 14 THEN ' +
                  '         CONCAT(SUBSTRING(s.cpf, 1, 2), ''.'', SUBSTRING(s.cpf, 3, 3), ''.'', SUBSTRING(s.cpf, 6, 3), ''/'', SUBSTRING(s.cpf, 9, 4), ''-'', SUBSTRING(s.cpf, 13, 2)) ' +
                  '       ELSE s.cpf ' +
                  '     END) ' +
                  '  ) as cliente, ' +
                  '  (CASE ' +
                  '     WHEN LENGTH(s.cpf) = 11 THEN ' +
                  '       CONCAT(SUBSTRING(s.cpf, 1, 3), ''.'', SUBSTRING(s.cpf, 4, 3), ''.'', SUBSTRING(s.cpf, 7, 3), ''-'', SUBSTRING(s.cpf, 10, 2)) ' +
                  '     WHEN LENGTH(s.cpf) = 14 THEN ' +
                  '       CONCAT(SUBSTRING(s.cpf, 1, 2), ''.'', SUBSTRING(s.cpf, 3, 3), ''.'', SUBSTRING(s.cpf, 6, 3), ''/'', SUBSTRING(s.cpf, 9, 4), ''-'', SUBSTRING(s.cpf, 13, 2)) ' +
                  '     ELSE s.cpf ' +
                  '   END) as cpf, ' +
                  '  s.whatsapp, ' +
                  '  s.aviso ' +
                  ' from socio s ' +
                  ' where s.situacao = ''ATIVO'' and s.excluido = 0 ' +
                  '  and (s.cliente = ''S'' or s.fornecedor = ''S'') ' +
                  ' order by s.nome ';

  LookupPessoaFornecedorSql       = 'Select ' +
                  '  s.id_socio, ' +
                  '  Concat( ' +
                  '    ''['', ' +
                  '    case when s.cliente = ''S'' then Concat(''C:'', s.codigo) else '''' end, ' +
                  '    case when s.cliente = ''S'' and s.fornecedor = ''S'' then '' / '' else '''' end, ' +
                  '    case when s.fornecedor = ''S'' then Concat(''F:'', s.codfornecedor) else '''' end, ' +
                  '    ''] '', ' +
                  '    s.nome, '' | '', ' +
                  '    (CASE ' +
                  '       WHEN LENGTH(s.cpf) = 11 THEN ' +
                  '         CONCAT(SUBSTRING(s.cpf, 1, 3), ''.'', SUBSTRING(s.cpf, 4, 3), ''.'', SUBSTRING(s.cpf, 7, 3), ''-'', SUBSTRING(s.cpf, 10, 2)) ' +
                  '       WHEN LENGTH(s.cpf) = 14 THEN ' +
                  '         CONCAT(SUBSTRING(s.cpf, 1, 2), ''.'', SUBSTRING(s.cpf, 3, 3), ''.'', SUBSTRING(s.cpf, 6, 3), ''/'', SUBSTRING(s.cpf, 9, 4), ''-'', SUBSTRING(s.cpf, 13, 2)) ' +
                  '       ELSE s.cpf ' +
                  '     END) ' +
                  '  ) as cliente, ' +
                  '  (CASE ' +
                  '     WHEN LENGTH(s.cpf) = 11 THEN ' +
                  '       CONCAT(SUBSTRING(s.cpf, 1, 3), ''.'', SUBSTRING(s.cpf, 4, 3), ''.'', SUBSTRING(s.cpf, 7, 3), ''-'', SUBSTRING(s.cpf, 10, 2)) ' +
                  '     WHEN LENGTH(s.cpf) = 14 THEN ' +
                  '       CONCAT(SUBSTRING(s.cpf, 1, 2), ''.'', SUBSTRING(s.cpf, 3, 3), ''.'', SUBSTRING(s.cpf, 6, 3), ''/'', SUBSTRING(s.cpf, 9, 4), ''-'', SUBSTRING(s.cpf, 13, 2)) ' +
                  '     ELSE s.cpf ' +
                  '   END) as cpf, ' +
                  '  s.whatsapp, ' +
                  '  s.aviso ' +
                  ' from socio s ' +
                  ' where s.situacao = ''ATIVO'' and s.excluido = 0 ' +
                  '  and (s.fornecedor = ''S'') ' +
                  ' order by s.nome ';

  LookupEmpresaSql    =
                  'Select                           '+
                  ' id_empresa,                     '+
                  ' Concat(                         '+
                  '  Razao,'' | '',                 '+
                  '  Fantasia,'' | '',               '+
                  '  (Case                           '+
                  '  When Length(cnpj)=14 then      '+
                  '  Concat(                        '+
                  '  SUBSTRING(cnpj, 1, 2), ''.'',    '+
                  '  SUBSTRING(cnpj, 3, 3), ''.'',    '+
                  '  SUBSTRING(cnpj, 6, 3), ''/'',    '+
                  '  SUBSTRING(cnpj, 9, 4), ''-'',    '+
                  '  SUBSTRING(cnpj, 13, 2)         '+
                  '  )                              '+
                  '  else cnpj end)) as empresa '+
                  ' From Empresa order by razao;                   ';

  LookupDocumentoSql     =
                  'Select                       '+
                  ' id_documento, descricao,               '+
                  '  Concat(                    '+
                  '  codigo,'' | '', descricao  '+
                  '  ) as doc                   '+
                  ' From tipo_documento         '+
                  ' where excluido=0            '+
                  ' and ativo=''S''               '+
                  ' order by descricao;         ';

  LookupCustoSql         =
                  ' Select                 '+
                  ' id_custo, descricao,            '+
                  ' Concat(                '+
                  '  codigo,'' | '',       '+
                  '    descricao           '+
                  ' ) as custo             '+
                  ' From custo             '+
                  ' where ativo=''S''      '+
                  ' order by descricao;    ';
  //plano conta tab

//  LookupPlanoContaRecSql = 'SELECT                       '+
//                        ' id_planoconta,              '+
//                        ' codigo,                     '+
//                        ' concat(REPEAT('' '', (nivel - 1) * 4), codigo,'' - '',descricao) AS DESCRICAO_COMPLETA, '+
//                        ' nivel                       '+
//                        ' FROM planoconta             '+
//                        ' WHERE ATIVO = ''S''         '+
//                        ' AND aceita_lancamento = ''S'' '+
//                        ' AND nivel > 4                 '+
//                        ' AND tipo=''RECEITA''          '+
//                        ' AND EXCLUIDO=0                '+
//                        ' ORDER BY CODIGO';

    LookupPlanoContaRecSql =
    'SELECT                                                      '+
    '  id_planoconta,                                            '+
    '  TRIM(codigo) AS codigo,                                   '+
    '  CONCAT(                                                   '+
    '    TRIM(codigo),                                           '+
    '    '' - '',                                                '+
    '    TRIM(descricao)                                         '+
    '  ) AS descricao_completa,                                  '+
    '  nivel                                                     '+
    'FROM planoconta                                             '+
    'WHERE ativo = ''S''                                         '+
    '  AND aceita_lancamento = ''S''                             '+
    '  AND nivel > 4                                             '+
    '  AND tipo = ''RECEITA''                                    '+
    '  AND excluido = 0                                          '+
    'ORDER BY codigo';

//  LookupPlanoContaDesSql = 'SELECT                       '+
//                        ' id_planoconta,              '+
//                        ' codigo,                     '+
//                        ' concat(REPEAT('' '', (nivel - 1) * 4), codigo,'' - '',descricao) AS DESCRICAO_COMPLETA, '+
//                        ' nivel                       '+
//                        ' FROM planoconta             '+
//                        ' WHERE ATIVO = ''S''         '+
//                        ' AND aceita_lancamento = ''S'' '+
//                        ' AND nivel > 4                 '+
//                        ' AND tipo=''DESPESA''          '+
//                        ' AND EXCLUIDO=0                '+
//                        ' ORDER BY CODIGO';

    LookupPlanoContaDesSql =
    'SELECT                                                      '+
    '  id_planoconta,                                            '+
    '  TRIM(codigo) AS codigo,                                   '+
    '  CONCAT(                                                   '+
    '    TRIM(codigo),                                           '+
    '    '' - '',                                                '+
    '    TRIM(descricao)                                         '+
    '  ) AS descricao_completa,                                  '+
    '  nivel                                                     '+
    'FROM planoconta                                             '+
    'WHERE ativo = ''S''                                         '+
    '  AND aceita_lancamento = ''S''                             '+
    '  AND nivel > 4                                             '+
    '  AND tipo = ''DESPESA''                                    '+
    '  AND excluido = 0                                          '+
    'ORDER BY codigo';

//  LookupPlanoContaAmbosSql = 'SELECT                       '+
//                        ' id_planoconta,              '+
//                        ' codigo,                     '+
//                        ' concat(REPEAT('' '', (nivel - 1) * 4), codigo,'' - '',descricao) AS DESCRICAO_COMPLETA, '+
//                        ' nivel                       '+
//                        ' FROM planoconta             '+
//                        ' WHERE ATIVO = ''S''         '+
//                        ' AND aceita_lancamento = ''S'' '+
//                        ' AND nivel > 4                 '+
//                        ' AND EXCLUIDO=0                '+
//                        ' ORDER BY CODIGO';

    LookupPlanoContaAmbosSql =
    'SELECT                                                      '+
    '  id_planoconta,                                            '+
    '  TRIM(codigo) AS codigo,                                   '+
    '  CONCAT(                                                   '+
    '    TRIM(codigo),                                           '+
    '    '' - '',                                                '+
    '    TRIM(descricao)                                         '+
    '  ) AS descricao_completa,                                  '+
    '  nivel                                                     '+
    'FROM planoconta                                             '+
    'WHERE ativo = ''S''                                         '+
    '  AND aceita_lancamento = ''S''                             '+
    '  AND nivel > 4                                             '+
    '  AND tipo IN (''RECEITA'', ''DESPESA'')                    '+
    '  AND excluido = 0                                          '+
    'ORDER BY codigo';


  LookupNaturezaOrigemRecSql         =
                  ' Select                 '+
                  ' id_natureza, descricao,            '+
                  ' Concat(                '+
                  '  codigo,'' | '',       '+
                  '    descricao           '+
                  ' ) as natureza          '+
                  ' From natureza_origem   '+
                  ' where ativo=''S''      '+
                  ' and excluido=0          '+
                  ' and origem =''Contas a Receber'''+
                  ' order by descricao;    ';

  LookupCidadeSql          =
                  'Select id_cidade, cidade, uf, '+
                  ' Concat(id_cidade,'' | '', cidade, '' | '', uf) as ncidade'+
                  ' from cidade                 '+
                  ' where id_cidade>0 order by cidade';

  LookupSedeSql =  'Select id_sede, razao, fantasia, cnpj, celular, sedeprincipal, '+
                    ' Concat(id_sede,'' | '', razao,'' | '',cnpj) as nsede from sede where id_sede>0 order by razao';

  LookupSecretariaSql = 'Select id_secretaria, codigo, razao,           '+
                   ' concat(codigo,'' | '',razao) as nsecretaria     '+
                   ' from secretaria where excluido=0 and ativo=''S'' order by nsecretaria';

  LookupEmpresaSindsql = 'Select sind_id_empresa, codigo, descricao,           '+
                   ' concat(codigo,'' | '',descricao) as nempresa     '+
                   ' from sindicato_empresa where ativo=''S'' order by nempresa';

  LookupProfissaoSql = 'Select id_profissao, codigo, descricao,           '+
                   ' concat(codigo,'' | '',descricao) as nprofissao     '+
                   ' from sindicato_profissao where excluido=0 and ativo=''S'' order by nprofissao';

  LookupLotacaoSql = 'Select id_lotacao, codigo, descricao,           '+
                   ' concat(codigo,'' | '',descricao) as nlotacao    '+
                   ' from sindicato_lotacao where excluido=0 and  ativo=''S'' order by nlotacao';

//  popularcliente                 'Select                                         '+
//                           ' s.id_socio,                                   '+
//                           ' Concat(s.codigo,'' | '',s.nome) as cliente,   '+
//                           ' s.cpf                                         '+
//                           ' from  socio s                                 '+
//                           ' where situacao=''ATIVO''                            '+
//                           ' and cliente=''S''                             '+
//                           ' ';
  LookupAssociadoSql  = 'Select                                              '+
                           ' s.id_socio, codigo, matricula, nome, cpf,          '+
                           ' Concat(s.codigo,'' | '', s.matricula, '' | '',s.nome, '' | '', s.cpf) as cliente, '+
                           ' s.whatsapp,s.aviso                                  '+  // s.foto removido a foto que estava travando
                           ' from socio s                                       '+
                           ' where situacao=''ATIVO''                           '+
                           ' and s.excluido=0 order by s.nome';





  LookupTipoPlanoSql = 'Select id_tipo, codigo, descricao, tipo, '+
                     ' Concat(codigo,'' | '',descricao, '' | '', tipo) as ntipo from plano_tipo where ativo=''S'' order by ntipo';

  LookupGrupoPlanoSql = 'Select pg.id_grupoplano, pg.codigo, pg.descricao, pt.tipo   '+
                            ' from plano_grupo pg                                  '+
                            ' inner join plano_tipo pt                             '+
                            ' on pg.id_tipoplano = pt.id_tipo                      '+
                            ' where pg.ativo=''S''                                   '+
                            ' order by pg.descricao';

  LookupSubgrupoPlanoSql =  'Select ps.id_subgrupo, ps.codigo, ps.descricao, pg.descricao as ngrupo, pt.descricao as ntipo'+
                            ' from plano_subgrupo ps                                  '+
                            ' inner join plano_grupo pg                             '+
                            ' on ps.id_grupo = pg.id_grupoplano                      '+
                            ' inner join plano_tipo pt'+
                            ' on pg.id_tipoplano = pt.id_tipo'+
                            ' where ps.ativo=''S''                                   '+
                            ' order by ps.descricao';


  LookupCandidatoSql = 'Select id_candidato, codigo, nome, cpf, '+
                       ' Concat(codigo,,'' | '', nome,'' |'',cpf) as ncandidato from candidato where id_candidato > 0 and inativo=''S'' order by ncandidato';

  LookupPerfilSql = 'Select id_perfil, codigo, descricao, '+
                    ' Concat(codigo,'' | '',descricao) as nperfil from perfil where ativo=''S'' order by descricao';

  LookupPrazoPagSql = 'Select                '+
                            ' id_prazo,           '+
                            ' codigo,             '+
                            ' tipo,               '+
                            ' descricao,           '+
                            ' concat(codigo,'' | '',descricao,'' | '', tipo) as nprazopag'+
                            ' From prazopagamento '+
                            ' where id_prazo> 0   '+
                            ' and ativo=''S''     '+
                            ' and tipo=''C''        '+
                            ' and pedido=''S''';

  LookupPrazoPagCompraSql = 'Select                '+
                            ' id_prazo,           '+
                            ' codigo,             '+
                            ' tipo,               '+
                            ' descricao,           '+
                            ' concat(codigo,'' | '',descricao,'' | '', tipo) as nprazopag'+
                            ' From prazopagamento '+
                            ' where id_prazo> 0   '+
                            ' and ativo=''S''     '+
                            ' and tipo=''D''      '+
                            ' and pedido=''N''';

  GridProdutoPedidoSql = 'Select                            '+
                            '  p.id_produto,                  '+
                            '  Coalesce(p.codigo,0) as codigo,'+
                            '  Coalesce(p.cod_barras,'''') as cod_barras,         '+
                            '  Coalesce(p.referencia,'''') as referencia,                  '+
                            '  p.descricao,                   '+
                            '  Coalesce(p.prc_compra,0) as prc_compra,                  '+
                            '  Coalesce(p.prc_venda,0) as prc_venda,                   '+
                            '  Coalesce(p.estoque_atual,0) as estoque_atual,               '+
                            '  m.marca,                       '+
                            '  g.grupo,                        '+
                            '  u.uni,                          '+
                            '  l.localizacao as local          '+
                            '  From Produto p                  '+
                            '  inner join Marca m              '+
                            '  on p.id_marca = m.id_marca      '+
                            '  inner join grupo g              '+
                            '  on p.id_grupo = g.id_grupo      '+
                            '  inner join unidade u             '+
                            '  on p.id_unidade = u.id_unidade   '+
                            '  inner join localizacao l           '+
                            '  on p.id_localizacao = l.id_localizacao'+
                            '  where p.id_produto >0               '+
                            '  and p.ativo=''S''                   '+
                            '  and p.excluido=0';

  GridProdutoHistoricoSql = 'Select                                  '+
                            ' p.id_produto as idproduto,            '+
                            ' p.cod_barras as codbarra,             '+
                            ' p.referencia as referencia,           '+
                            ' p.descricao as nomeproduto,           '+
                            ' p.estoque_atual as estoque,           '+
                            ' m.marca as nomemarca,                 '+
                            ' g.grupo as nomegrupo,                 '+
                            ' l.localizacao as nomelocal,           '+
                            ' u.uni as nomeunidade,                 '+
                            ' concat(p.codigo,'' | '',p.descricao,'' | '',m.marca,'' | '', u.uni) as npesquisa    '+
                            ' From produto p                        '+
                            ' Inner join marca m                    '+
                            ' on p.id_marca = m.id_marca            '+
                            ' Inner join grupo g                    '+
                            ' on p.id_grupo=g.id_grupo              '+
                            ' Inner join localizacao l              '+
                            ' on p.id_localizacao=l.id_localizacao  '+
                            ' Inner join unidade u                  '+
                            ' on p.id_unidade=u.id_unidade          '+
                            ' where p.id_produto >0                 '+
                            ' and p.ativo=''S''                     '+
                            ' and servico=''N''                     '+
                            ' order by p.descricao';

  LookupEleicaoSql    = 'Select id_eleicao, codigo, nome, concat(codigo,'' | '',nome,'' | '',tipo) as npesquisa '+
                          ' from eleicao where ativo=''S'' order by nome';

  LookupEleicaoChapaSql = '';

  LookupGrupoSql      = 'Select id_grupo, codigo, concat(codigo,'' | '',grupo) as nmgrupo from grupo where ativo=''S'' and excluido=0 order by grupo';

  LookupLocalizacaoSql = 'Select id_localizacao, codigo, concat(codigo,'' | '',localizacao) as nmlocalizacao from localizacao where ativo=''S'' and excluido=0 order by localizacao';

  LookupMarcaSql = 'Select id_marca, codigo, concat(codigo,'' | '',marca) as nmmarca from marca where ativo=''S'' and excluido=0 and tipo<>''V'' order by marca';

  LookupMarcaVeiculosql = 'Select                                                              '+
                ' id_marca, codigo,                                                    '+
                ' concat(codigo, '' | '', marca) as npesquisa '+
                ' From marca                                                   '+
                ' where ativo=''S'' and tipo=''V'' order by codigo, marca';


  LookupUnidadeSql = 'Select id_unidade, codigo, concat(codigo,'' | '',uni,'' | '',unidade) as nmunidade  from unidade where ativo=''S'' and excluido=0 order by uni';

  LookupVendedorSql = 'Select                                      '+
                           ' F.id_funcionario,                          '+
                           ' Concat(F.codigo,'' | '',F.nome) as Func,   '+
                           ' F.cpf                                      '+
                           ' From funcionario f                         '+
                           ' where id_funcionario >0                    '+
                           ' and ativo=''S''                          '+
                           ' and vendedor=''S'' order by Func';

  LookupFuncionarioSql = 'Select                                      '+
                           ' F.id_funcionario,                          '+
                           ' Concat(F.codigo,'' | '',F.nome) as Func,   '+
                           ' F.cpf                                      '+
                           ' From funcionario f                         '+
                           ' where id_funcionario >0                    '+
                           ' and ativo=''S''                            '+
                           ' order by Func';

  GridPessoawhatsmassaSql = 'Select                                         '+
                           ' s.codigo,                                      '+
                           ' s.id_socio, s.matricula,                       '+
                           ' s.nome as cliente,   '+
                           ' s.whatsapp, s.email, s.cpf, s.nascimento                                         '+
                           ' from  socio s                                 '+
                           ' where s.id_socio > 0                          '+
                           ' and situacao in (''S'',''ATIVO'')                            '+
                           ' and cliente=''S''                             '+
                           ' order by cliente';

  GridPessoawhatsindSql = 'Select                                         '+
                           ' s.codigo, s.id_socio, s.matricula,                       '+
                           ' s.nome as cliente,   '+
                           ' s.whatsapp, s.email, s.cpf, s.nascimento                                         '+
                           ' from  socio s                                 '+
                           ' where s.id_socio= :id';

  LookupMensageEnviarSql = 'Select * from mensagem where ativo=''S'' and uso= :u ';

  LoolupDepedenteSql = 'Select               '+
                  ' id_dependente,          '+
                  ' codigo,            '+
                  ' nome,              '+
                  ' cpf,               '+
                  ' Concat(codigo,'' | '', nome,'' | '',cpf) as npesquisa '+
                  ' From sindicato_dependente                                               '+
                  ' where ativo=''S''                                  '+
                  ' ';//passar o parametro and id_socio= :id'

  LookupMensagemtabConfigsql = 'Select id_mensagem, codigo, descricao, concat(codigo, '' | '', descricao) as npesquisa  from mensagem where ativo= ''S'' and excluido=0 and uso=''ENVIO WHATSAPP'' order by descricao';

  LookupMensagemEmailtabConfigsql = 'Select id_mensagem, codigo, descricao, concat(codigo, '' | '', descricao) as npesquisa  from mensagem where ativo= ''S'' and excluido=0 and uso=''Envio E-mail'' order by descricao';

  LookupConvenioTicketSql = 'Select                                                              '+
                ' c.id_convenio,                                                    '+
                ' concat(c.codigo, '' | '', c.nome, '' | '', c.tipo) as npesquisa,  '+
                ' c.telefone                                                        '+
                ' From convenio c                                                   '+
                ' where c.ativo=''S'' order by c.codigo, c.nome';

  LookupUsuarioLoginSql = 'Select id_usuario, nome, login, senha, id_funcionario from usuario where ativo in (''S'',''NÃO'') and excluido=0 order by login';


  LookupPlanoContaSql = 'SELECT                       '+
                        ' id_planoconta,              '+
                        ' codigo,                     '+
                        ' concat(REPEAT('' '', (nivel - 1) * 4), codigo,'' - '',descricao) AS DESCRICAO_COMPLETA, '+
                        ' nivel                       '+
                        ' FROM planoconta             '+
                        ' WHERE ATIVO = ''S''         '+
                        ' AND aceita_lancamento = ''N'' '+
                        ' AND nivel < 5                 '+
                        ' ORDER BY CODIGO';


  LookupSindicatoTipoSituacao  = 'Select id_situacao, descricao, '+
                                  ' concat(id_situacao,'' | '', descricao) as npesquisa'+
                                  ' from sindicato_tipo_situacao '+
                                  ' where excluido=0 and ativo=''S'' order by descricao';

  LookupsindicatoLocalTrabalho = 'Select id_local, descricao, '+
                                  ' concat(id_local,'' | '', descricao) as npesquisa'+
                                  ' from sindicato_local_trabalho '+
                                  ' where excluido=0 and ativo=''S'' order by descricao';

  LookupSindicatoMotivoDesfiliar = 'Select id_motivo, descricao, '+
                                  ' concat(id_motivo,'' | '', descricao) as npesquisa'+
                                  ' from associado_motivo_movimento '+
                                  ' where ativo=''S'' and tipo =''D'' order by descricao';

  LookupSindicatoMotivoAfiliar = 'Select id_motivo, descricao, '+
                                  ' concat(id_motivo,'' | '', descricao) as npesquisa'+
                                  ' from associado_motivo_movimento '+
                                  ' where ativo=''S'' and tipo =''F'' order by descricao';


  LookupCategoria               = 'Select id_categoria, descricao, '+
                                  ' concat(id_categoria,'' | '', descricao) as npesquisa'+
                                  ' from categoria '+
                                  ' where excluido=0 and ativo=''S'' order by descricao';

  LookupDepartamento  = 'Select id_departamento, descricao, '+
                                  ' concat(id_departamento,'' | '', descricao) as npesquisa'+
                                  ' from departamento '+
                                  ' where excluido=0 and ativo=''S'' order by descricao';

  LookupContaBanco    = 'Select id_conta, codigo, agencia, conta, correntista, banco,   '+
                        ' Concat(codigo,'' | '', agencia,''/'',conta, '' | '', correntista, '' | '', banco) as npesquisa  '+
                        ' from contas where ativo=''S'' and excluido=0 order by correntista';

  LookupHistoricoBancarioReceita  = 'SELECT                                                             '+
                                    ' id_historico,                                                     '+
                                    ' descricao,                                                        '+
                                    ' CONCAT(id_historico, '' | '',descricao, '' | '',                  '+
                                    ' CASE WHEN tipo = 0 THEN ''Receita''                               '+
                                    ' WHEN tipo = 1 THEN ''Despesa'' ELSE ''Ambos'' END) AS npesquisa   '+
                                    ' FROM historico_bancario                                           '+
                                    ' WHERE ativo = ''S'' and tipo=0 ORDER BY descricao;';

  LookupHistoricoBancarioDespesa  = 'SELECT                                                             '+
                                    ' id_historico,                                                     '+
                                    ' descricao,                                                        '+
                                    ' CONCAT(id_historico, '' | '',descricao, '' | '',                  '+
                                    ' CASE WHEN tipo = 0 THEN ''Receita''                               '+
                                    ' WHEN tipo = 1 THEN ''Despesa'' ELSE ''Ambos'' END) AS npesquisa   '+
                                    ' FROM historico_bancario                                           '+
                                    ' WHERE ativo = ''S'' and tipo=1 ORDER BY descricao;';

  LookupHistoricoBancarioAmbos    = 'SELECT                                                             '+
                                    ' id_historico,                                                     '+
                                    ' descricao,                                                        '+
                                    ' CONCAT(id_historico, '' | '',descricao, '' | '',                  '+
                                    ' CASE WHEN tipo = 0 THEN ''Receita''                               '+
                                    ' WHEN tipo = 1 THEN ''Despesa'' ELSE ''Ambos'' END) AS npesquisa   '+
                                    ' FROM historico_bancario                                           '+
                                    ' WHERE ativo = ''S'' and tipo=2 ORDER BY descricao;';



function GetGridProdutoCarrinhoPedidoSql(const AIDPedido: Integer): String;
function GetProdutoPedidoListaSQL(Const AIDPedido: Integer): String;

implementation

function GetGridProdutoCarrinhoPedidoSql(const AIDPedido: Integer): String;
begin
  Result :=
    'Select ' +
    ' pi.id_produto, ' +
    ' pi.id_pedido_itens, ' +
    ' coalesce(pi.qtde,0) as qtde, ' +
    ' coalesce(pi.qtde_2,0) as qtde_2, ' +
    ' coalesce(pi.prc_unitario,0) as prc_unitario, ' +
    ' coalesce(pi.desconto_perc,0) as desconto_perc, ' +
    ' coalesce(pi.desconto_reais,0) as desconto_reais, ' +
    ' pi.complemento, ' +
    ' coalesce(pi.prc_total,0) as prc_total, ' +
    ' p.codigo, ' +
    ' p.cod_barras, ' +
    ' p.descricao, ' +
    ' p.referencia, ' +
    ' p.servico, ' +
    ' m.marca, ' +
    ' l.localizacao as local, ' +
    ' u.uni, ' +
    ' pi.descricao as proddescalterada, ' +
    ' pi.seqitem,'+
    ' Coalesce(pi.prc_subtotal,0) as prc_subtotal,'+
    ' Coalesce(peso,0) as peso,'+
    ' volume,'+
    ' Coalesce(p.prc_compra,0) as prc_compra,'+
    ' Coalesce(p.prc_custo,0) as prc_custo,'+
    ' p.controlaestoque,  '+
    ' pi.usa_chapa  '+
    ' From pedido_itens pi ' +
    ' inner join produto p on pi.id_produto = p.id_produto ' +
    ' inner join marca m on p.id_marca = m.id_marca ' +
    ' inner join localizacao l on p.id_localizacao = l.id_localizacao ' +
    ' inner join unidade u on p.id_unidade = u.id_unidade ' +
    ' where pi.id_pedido_itens > 0 and pi.id_pedido = ' + IntToStr(AIDPedido)+' order by pi.seqitem DESC';
end;

function GetProdutoPedidoListaSQL(Const AIDPedido: Integer): String;
begin
  Result :=
    'select ' +
    '    pi.id_produto, ' +
    '    pi.id_pedido_itens, ' +
    '    coalesce(pi.qtde,0) as qtde, ' +
    '    coalesce(pi.prc_unitario,0) as prc_unitario, ' +
    '    p.servico, ' +
    '    pi.seqitem, ' +
    '    coalesce(( ' +
    '        select mx.preco_compra ' +
    '        from movimentacao_estoque mx ' +
    '        where mx.id_produto = pi.id_produto ' +
    '          and mx.id_pedido = pi.id_pedido ' +
    '          and mx.tipo = ''Saída'' ' +
    '        order by mx.data_movimentacao desc ' +
    '        limit 1 ' +
    '    ),0) as prc_compra, ' +
    '    p.controlaestoque, ' +
    ' pi.usa_chapa'+
    ' from pedido_itens pi ' +
    ' inner join produto p ' +
    '    on pi.id_produto = p.id_produto ' +
    ' where pi.id_pedido_itens > 0 ' +
    '  and pi.id_pedido = '+ IntToStr(AIDPedido)+' ' +
    ' order by pi.seqitem desc';
end;

end.
