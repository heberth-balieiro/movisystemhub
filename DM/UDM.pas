
unit UDM;

interface

uses
  System.SysUtils, System.Classes, DBAccess, Uni, Data.DB, MemDS, Data.FMTBcd,
  Data.SqlExpr, Datasnap.DBClient, Datasnap.Provider, ACBrBase, ACBrSocket,
  ACBrCEP, ACBrValidador, ACBrDFe, ACBrNFe, Model.SQLQry, ACBrDFeReport,
  ACBrDFeDANFeReport, ACBrNFeDANFEClass, ACBrNFeDANFeRLClass, ACBrNFeDANFEFR,
   System.IniFiles, UniProvider, MySQLUniProvider;

type
  // Definindo um tipo Record
  TDadosAssociado = record
    Nome      : string;
    WhatsApp  : string;
    Matricula : Integer;
    cpf       : String;
  end;

type
  TDM = class(TDataModule)
    TabConSede: TClientDataSet;
    TabConsSocio: TClientDataSet;
    TabCidade: TClientDataSet;
    TabSede: TClientDataSet;
    TabConsUsuario: TClientDataSet;
    TabConsPerfil: TClientDataSet;
    TabConChapa: TClientDataSet;
    TabConsEleicao: TClientDataSet;
    TabConsCandidatos: TClientDataSet;
    TabCandidato: TClientDataSet;
    ACBrCEP: TACBrCEP;
    TabConsMembro: TClientDataSet;
    TabConsCampanha: TClientDataSet;
    TabEleicao: TClientDataSet;
    TabConsMarca: TClientDataSet;
    TabConsGrupo: TClientDataSet;
    TabConsUnidade: TClientDataSet;
    TabConsLocalizacao: TClientDataSet;
    TabConsEmpresa: TClientDataSet;
    TabConsProduto: TClientDataSet;
    TabMarca: TClientDataSet;
    TabGrupo: TClientDataSet;
    TabUnidade: TClientDataSet;
    TabLocalizacao: TClientDataSet;
    TabCliente: TClientDataSet;
    TabVendedor: TClientDataSet;
    TabPrazoPag: TClientDataSet;
    TabProdutoPedido: TClientDataSet;
    TabItensPedido: TClientDataSet;
    TabConsPedido: TClientDataSet;
    TabConsFuncionario: TClientDataSet;
    TabConsPrazoPag: TClientDataSet;
    TabConsPedidoItens: TClientDataSet;
    TabVotos: TClientDataSet;
    TabVotosvotos: TIntegerField;
    TabVotoschapa: TStringField;
    TabVotossomavoto: TIntegerField;
    TotalAssociado: TClientDataSet;
    TotalAssociadototal: TIntegerField;
    TabTotalVotos: TClientDataSet;
    TabTotalVotostotal: TIntegerField;
    TabTotalVotoBranco: TClientDataSet;
    TabTotalVotoBrancototal: TIntegerField;
    TabTotalVotoNulo: TClientDataSet;
    TabTotalVotoNulototal: TIntegerField;
    TabTotalVotoDepartamento: TClientDataSet;
    TabTotalVotoDepartamentodepartamento: TStringField;
    TabTotalVotoDepartamentototal_votos: TIntegerField;
    TabNaoVotaram: TClientDataSet;
    TabNaoVotaramtotal: TIntegerField;
    TabConsSecretaria: TClientDataSet;
    TabSecretaria: TClientDataSet;
    TabSecretariaid_secretaria: TIntegerField;
    TabSecretariacodigo: TIntegerField;
    TabSecretariarazao: TStringField;
    TabConsSocioWhats: TClientDataSet;
    ACBrNFe1: TACBrNFe;
    TabManifesto: TClientDataSet;
    TabManifestoid: TIntegerField;
    TabManifestonumero: TStringField;
    TabManifestochave: TStringField;
    TabManifestoserie: TStringField;
    TabManifestonome: TStringField;
    TabManifestocnpj: TStringField;
    TabManifestonsu: TStringField;
    TabManifestovalor: TFloatField;
    TabManifestodt_entrada: TDateField;
    TabManifestodt_emissao: TDateField;
    TabManifestosituacao: TStringField;
    TabManifestoxml: TBlobField;
    TabConsTipoPlano: TClientDataSet;
    TabConsTipoPlanoid_tipo: TIntegerField;
    TabConsTipoPlanocodigo: TIntegerField;
    TabConsTipoPlanotipo: TStringField;
    TabConsTipoPlanodescricao: TStringField;
    TabConsTipoPlanoativo: TStringField;
    TabTipoPlano: TClientDataSet;
    TabGrupoPlano: TClientDataSet;
    TabConsPlanoConta: TClientDataSet;
    TabConsPlanoContaid_planoconta: TIntegerField;
    TabConsPlanoContacodigo: TStringField;
    TabConsPlanoContadescricao: TStringField;
    TabConsPlanoContaid_subgrupoplano: TIntegerField;
    TabConsPlanoContasaldoinicial: TFloatField;
    TabConsPlanoContaativo: TStringField;
    TabSubGrupo: TClientDataSet;
    TabPlanoConta: TClientDataSet;
    TabConsPlanoContansubgrupo: TStringField;
    TabConsPlanoContangrupo: TStringField;
    TabConsPlanoContantipo: TStringField;
    TabConsTransportadora: TClientDataSet;
    TabConsTransportadoraid_transportadora: TIntegerField;
    TabConsTransportadoracodigo: TIntegerField;
    TabConsTransportadorarazao: TStringField;
    TabConsTransportadorafantasia: TStringField;
    TabConsTransportadoraie: TStringField;
    TabConsTransportadoraantt: TStringField;
    TabConsTransportadoracep: TStringField;
    TabConsTransportadoraendereco: TStringField;
    TabConsTransportadoranumero: TStringField;
    TabConsTransportadorabairro: TStringField;
    TabConsTransportadoracomplemento: TStringField;
    TabConsTransportadoraemail: TStringField;
    TabConsTransportadoracidade: TStringField;
    TabConsTransportadoracnpj: TStringField;
    TabConsContas: TClientDataSet;
    TabConsContasid: TIntegerField;
    TabConsContascodigo: TIntegerField;
    TabConsContasagencia: TStringField;
    TabConsContasconta: TStringField;
    TabConsContascorrentista: TStringField;
    TabConsContassaldo: TFloatField;
    TabPrazoPagid_prazo: TIntegerField;
    TabPrazoPagcodigo: TIntegerField;
    TabPrazoPagdescricao: TStringField;
    TabPrazoPagtipo: TStringField;
    TabConsLivroCaixa: TClientDataSet;
    TabConsLivroCaixaid: TIntegerField;
    TabConsLivroCaixacodigo: TIntegerField;
    TabConsLivroCaixadata: TDateField;
    TabConsLivroCaixaoperacao: TStringField;
    TabConsLivroCaixadoc: TStringField;
    TabConsLivroCaixavlre: TFloatField;
    TabConsLivroCaixavlrs: TFloatField;
    TabConsLivroCaixasaldo: TFloatField;
    TabConsLivroCaixahistorico: TStringField;
    TabConsLivroCaixavalor: TFloatField;
    TabPlanoContaid: TIntegerField;
    TabPlanoContacodigo: TIntegerField;
    TabPlanoContadescricao: TStringField;
    TabPlanoContaativo: TStringField;
    TabPlanoContansubplano: TStringField;
    TabPlanoContangrupoplano: TStringField;
    TabPlanoContantipoplano: TStringField;
    TabPlanoContantipo: TStringField;
    TabCusto: TClientDataSet;
    TabCustoid: TIntegerField;
    TabCustocodigo: TIntegerField;
    TabCustodescricao: TStringField;
    TabConsLivroCaixansaldo: TFloatField;
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
    TabConsUsuarioid_usuario: TIntegerField;
    TabConsUsuarionome: TStringField;
    TabConsUsuariologin: TStringField;
    TabConsUsuarioid_empresa: TIntegerField;
    TabConsUsuarioid_sede: TIntegerField;
    TabConsUsuariosenha: TStringField;
    TabConsUsuarioativo: TStringField;
    TabConsUsuarioemail: TStringField;
    TabConsUsuariosistema: TStringField;
    TabConsUsuarioid_perfil: TIntegerField;
    TabConsUsuarioid_funcionario: TIntegerField;
    TabConsMensagem: TClientDataSet;
    TabConsMensagemid_mensagem: TIntegerField;
    TabConsMensagemcodigo: TIntegerField;
    TabConsMensagemdescricao: TStringField;
    TabConsMensagemativo: TStringField;
    TabConsMensagemuso: TStringField;
    TabConsMensagemassunto_email: TStringField;
    TabConsMensagemmensagem: TStringField;
    TabMensagem: TClientDataSet;
    TabMensagemid_mensagem: TIntegerField;
    TabMensagemcodigo: TIntegerField;
    TabMensagemdescricao: TStringField;
    TabMensagemativo: TStringField;
    TabMensagemuso: TStringField;
    TabMensagemassunto_email: TStringField;
    TabMensagemmensagem: TStringField;
    TabConsSocioWhatsid_socio: TIntegerField;
    TabConsSocioWhatscodigo: TIntegerField;
    TabConsSocioWhatsmatricula: TIntegerField;
    TabConsSocioWhatssituacao: TStringField;
    TabConsSocioWhatsnome: TStringField;
    TabConsSocioWhatsapelido: TStringField;
    TabConsSocioWhatscpf: TStringField;
    TabConsSocioWhatstelefone: TStringField;
    TabConsSocioWhatscelular: TStringField;
    TabConsSocioWhatswhatsapp: TStringField;
    TabConsSocioWhatsemail: TStringField;
    TabConsSocioWhatscli_tipo: TStringField;
    TabConsSocioWhatscodfornecedor: TIntegerField;
    TabConsSocioWhatscliente: TStringField;
    TabConsSocioWhatsnascimento: TDateField;
    TabConsSocioWhatsfornecedor: TStringField;
    TabRelacaoAniversariante: TClientDataSet;
    TabRelacaoAniversarianteid_socio: TIntegerField;
    TabRelacaoAniversariantecodigo: TIntegerField;
    TabRelacaoAniversariantenome: TStringField;
    TabRelacaoAniversarianteapelido: TStringField;
    TabRelacaoAniversariantecelular: TStringField;
    TabRelacaoAniversariantewhatsapp: TStringField;
    TabRelacaoAniversariantenascimento: TDateField;
    TabUsuario: TClientDataSet;
    TabUsuarioid_usuario: TIntegerField;
    TabUsuarionome: TStringField;
    TabUsuariologin: TStringField;
    TabUsuariosenha: TStringField;
    TabUsuarioid_funcionario: TIntegerField;
    TabConsSindEmpresa: TClientDataSet;
    TabConsSindEmpresasind_id_empresa: TIntegerField;
    TabConsSindEmpresacodigo: TIntegerField;
    TabConsSindEmpresadescricao: TStringField;
    TabConsSindEmpresaid_sede: TIntegerField;
    TabConsSindEmpresaativo: TStringField;
    TabConsSindProfissao: TClientDataSet;
    TabConsSindProfissaoid_profissao: TIntegerField;
    TabConsSindProfissaocodigo: TIntegerField;
    TabConsSindProfissaodescricao: TStringField;
    TabConsSindProfissaoativo: TStringField;
    TabConsSindLotacao: TClientDataSet;
    TabConsSindLotacaoid_lotacao: TIntegerField;
    TabConsSindLotacaocodigo: TIntegerField;
    TabConsSindLotacaodescricao: TStringField;
    TabConsSindLotacaoativo: TStringField;
    TabSindEmpresa: TClientDataSet;
    TabSindProfissao: TClientDataSet;
    TabSindLotacao: TClientDataSet;
    TabSindEmpresasind_id_empresa: TIntegerField;
    TabSindEmpresacodigo: TIntegerField;
    TabSindEmpresadescricao: TStringField;
    TabSindEmpresaid_sede: TIntegerField;
    TabSindEmpresaativo: TStringField;
    TabSindProfissaoid_profissao: TIntegerField;
    TabSindProfissaocodigo: TIntegerField;
    TabSindProfissaodescricao: TStringField;
    TabSindProfissaoativo: TStringField;
    TabSindLotacaoid_lotacao: TIntegerField;
    TabSindLotacaocodigo: TIntegerField;
    TabSindLotacaodescricao: TStringField;
    TabSindLotacaoativo: TStringField;
    TabSindEmpresanpesquisa: TStringField;
    TabSindProfissaonpesquisa: TStringField;
    TabSindLotacaonpesquisa: TStringField;
    TabConsSecretariaid_secretaria: TIntegerField;
    TabConsSecretariacodigo: TIntegerField;
    TabConsSecretariarazao: TStringField;
    TabConsSecretariafantasia: TStringField;
    TabConsSecretariaativo: TStringField;
    TabSecretarianpesquisa: TStringField;
    TabConsSocioid_socio: TIntegerField;
    TabConsSociocodigo: TIntegerField;
    TabConsSociomatricula: TIntegerField;
    TabConsSociosituacao: TStringField;
    TabConsSocionome: TStringField;
    TabConsSocioapelido: TStringField;
    TabConsSociocpf: TStringField;
    TabConsSociotelefone: TStringField;
    TabConsSociocelular: TStringField;
    TabConsSociowhatsapp: TStringField;
    TabConsSocioemail: TStringField;
    TabConsSociocli_tipo: TStringField;
    TabConsSociocodfornecedor: TIntegerField;
    TabConsSociocliente: TStringField;
    TabConsSociofornecedor: TStringField;
    TabConsSocionascimento: TDateField;
    TabConsSindDependentes: TClientDataSet;
    TabConsSindDependentesid_dependente: TIntegerField;
    TabConsSindDependentescodigo: TIntegerField;
    TabConsSindDependentesnome: TStringField;
    TabConsSindDependentesparentesco: TStringField;
    TabConsSindDependentescpf: TStringField;
    TabConsSindDependentessexo: TStringField;
    TabConsSindDependentesativo: TStringField;
    EntradaProduto: TClientDataSet;
    EntradaProdutoid_produto: TIntegerField;
    EntradaProdutoqtde_anterior: TFloatField;
    EntradaProdutoprc_compra: TFloatField;
    EntradaProdutoprc_venda: TFloatField;
    EntradaProdutoqtde_nova: TFloatField;
    EntradaProdutocodigo: TIntegerField;
    EntradaProdutodescricao: TStringField;
    EntradaProdutound: TStringField;
    EntradaProdutoqtdefinal: TFloatField;
    EntradaProdutoordemprod: TIntegerField;
    TabConsMovEstoque: TClientDataSet;
    TabConsMovEstoqueidmov: TIntegerField;
    TabConsMovEstoqueqtdeajustada: TFloatField;
    TabConsMovEstoqueqtdeanterior: TFloatField;
    TabConsMovEstoqueprccompra: TFloatField;
    TabConsMovEstoqueprcvenda: TFloatField;
    TabConsMovEstoquedatahora: TDateTimeField;
    TabConsMovEstoquenumoperacao: TIntegerField;
    TabConsMovEstoquenomeproduto: TStringField;
    TabConsMovEstoquecodigo: TIntegerField;
    TabSaldoEstoque: TClientDataSet;
    TabSaldoEstoqueid_produto: TIntegerField;
    TabSaldoEstoquenome_produto: TStringField;
    TabSaldoEstoqueprccompra: TFloatField;
    TabSaldoEstoqueprcvenda: TFloatField;
    TabSaldoEstoquecodigo: TIntegerField;
    TabSaldoEstoquenome_marca: TStringField;
    TabSaldoEstoquenome_unidade: TStringField;
    TabSaldoEstoquenome_grupo: TStringField;
    TabSaldoEstoquesaldoestoque: TFloatField;
    TabProdutoZerado: TClientDataSet;
    TabProdutoZeradoid_produto: TIntegerField;
    TabProdutoZeradonome_produto: TStringField;
    TabProdutoZeradoprccompra: TFloatField;
    TabProdutoZeradoprcvenda: TFloatField;
    TabProdutoZeradocodigo: TIntegerField;
    TabProdutoZeradonome_marca: TStringField;
    TabProdutoZeradonome_unidade: TStringField;
    TabProdutoZeradonome_grupo: TStringField;
    TabProdutoZeradosaldoestoque: TFloatField;
    TabEstoqueNegativo: TClientDataSet;
    TabEstoqueNegativoid_produto: TIntegerField;
    TabEstoqueNegativonome_produto: TStringField;
    TabEstoqueNegativoprccompra: TFloatField;
    TabEstoqueNegativoprcvenda: TFloatField;
    TabEstoqueNegativocodigo: TIntegerField;
    TabEstoqueNegativonome_marca: TStringField;
    TabEstoqueNegativonome_unidade: TStringField;
    TabEstoqueNegativonome_grupo: TStringField;
    TabEstoqueNegativosaldoestoque: TFloatField;
    TabProduto: TClientDataSet;
    TabProdutoidproduto: TIntegerField;
    TabProdutocodbarra: TStringField;
    TabProdutoreferencia: TStringField;
    TabProdutoproduto: TStringField;
    TabProdutoestoque: TFloatField;
    TabProdutomarca: TStringField;
    TabProdutogrupo: TStringField;
    TabProdutolocal: TStringField;
    TabProdutounidade: TStringField;
    TabProdutonpesquisa: TStringField;
    TabHistoricoProduto: TClientDataSet;
    TabHistoricoProdutotipo: TStringField;
    TabHistoricoProdutoqtde: TFloatField;
    TabHistoricoProdutodata: TDateTimeField;
    TabHistoricoProdutoobs: TStringField;
    TabHistoricoProdutocodigo: TIntegerField;
    TabHistoricoProdutodescricao: TStringField;
    TabHistoricoProdutonproduto: TStringField;
    TabAssociado: TClientDataSet;
    TabAssociadoid_socio: TIntegerField;
    TabAssociadocodigo: TIntegerField;
    TabAssociadomatricula: TIntegerField;
    TabAssociadonome: TStringField;
    TabAssociadocpf: TStringField;
    TabAssociadonpesquisa: TStringField;
    TabConsCarteira: TClientDataSet;
    TabConsCarteiraid_carteira: TIntegerField;
    TabConsCarteiraid_socio: TIntegerField;
    TabConsCarteiravalidade: TDateField;
    TabConsCarteiraativo: TStringField;
    TabConsCarteiradigital: TStringField;
    TabConsCarteiramatricula: TIntegerField;
    TabConsCarteiracodigo: TIntegerField;
    TabConsCarteiranome: TStringField;
    TabConsCarteiracpf: TStringField;
    TabConsCarteirarazao: TStringField;
    TabCarteirinhaImpresso: TClientDataSet;
    TabCarteirinhaImpressoid_carteira: TIntegerField;
    TabCarteirinhaImpressoid_socio: TIntegerField;
    TabCarteirinhaImpressovalidade: TDateField;
    TabCarteirinhaImpressoativo: TStringField;
    TabCarteirinhaImpressodigital: TStringField;
    TabCarteirinhaImpressomatricula: TIntegerField;
    TabCarteirinhaImpressocodigo: TIntegerField;
    TabCarteirinhaImpressonome: TStringField;
    TabCarteirinhaImpressocpf: TStringField;
    TabCarteirinhaImpressorg: TStringField;
    TabCarteirinhaImpressopis: TStringField;
    TabCarteirinhaImpressoserie: TStringField;
    TabCarteirinhaImpressonascimento: TDateField;
    TabCarteirinhaImpressoadmissao: TDateField;
    TabCarteirinhaImpressoprofissao: TStringField;
    TabCarteirinhaImpressonaturalidade: TStringField;
    TabCarteirinhaImpressomae: TStringField;
    TabCarteirinhaImpressopai: TStringField;
    TabCarteirinhaImpressosocio_deste: TDateField;
    TabCarteirinhaImpressoctps: TStringField;
    TabCarteirinhaImpressodepnome1: TStringField;
    TabCarteirinhaImpressodepnascimento1: TDateField;
    TabCarteirinhaImpressodepparentesco1: TStringField;
    TabCarteirinhaImpressodepcpf1: TStringField;
    TabCarteirinhaImpressodepnome2: TStringField;
    TabCarteirinhaImpressodepnascimento2: TDateField;
    TabCarteirinhaImpressodepparentesco2: TStringField;
    TabCarteirinhaImpressodepcpf2: TStringField;
    TabCarteirinhaImpressodepnome3: TStringField;
    TabCarteirinhaImpressodepnascimento3: TDateField;
    TabCarteirinhaImpressodepparentesco3: TStringField;
    TabCarteirinhaImpressodepcpf3: TStringField;
    TabCarteirinhaImpressodepnome4: TStringField;
    TabCarteirinhaImpressodepnascimento4: TDateField;
    TabCarteirinhaImpressodepparentesco4: TStringField;
    TabCarteirinhaImpressodepcpf4: TStringField;
    TabCarteirinhaImpressodepnome5: TStringField;
    TabCarteirinhaImpressodepnascimento5: TStringField;
    TabCarteirinhaImpressodepparentesco5: TStringField;
    TabCarteirinhaImpressodepcpf5: TStringField;
    TabCarteirinhaImpressodepnome6: TStringField;
    TabCarteirinhaImpressodepnascimento6: TDateField;
    TabCarteirinhaImpressodepparentesco6: TStringField;
    TabCarteirinhaImpressodepcpf6: TStringField;
    TabCarteirinhaImpressofoto: TBlobField;
    TabConsMovEstoquetipo: TStringField;
    TabConsMovEstoquehistorico: TStringField;
    TabEstatisticas: TClientDataSet;
    TabEstatisticasdescricao: TStringField;
    TabEstatisticashomens: TIntegerField;
    TabEstatisticasmulhe: TIntegerField;
    TabEstatisticastotalgeral: TIntegerField;
    TabConsSindDependentesAutorizado: TStringField;
    TabConsConvenio: TClientDataSet;
    TabConsConvenioid_convenio: TIntegerField;
    TabConsConveniocodigo: TIntegerField;
    TabConsConvenionome: TStringField;
    TabConsConveniotipo: TStringField;
    TabConsConveniotermos: TStringField;
    TabConsConvenioinformacao_contrato: TStringField;
    TabConsConveniovalores: TFloatField;
    TabConsConveniotelefone: TStringField;
    TabConsConvenioativo: TStringField;
    TabSindDependentes: TClientDataSet;
    TabSindDependentesid_dependente: TIntegerField;
    TabSindDependentescodigo: TIntegerField;
    TabSindDependentesnome: TStringField;
    TabSindDependentesparentesco: TStringField;
    TabSindDependentesAutorizado: TStringField;
    TabConsCarteiraDependente: TClientDataSet;
    TabConsCarteiraDependenteid_carteira: TIntegerField;
    TabConsCarteiraDependentedigital: TStringField;
    TabConsCarteiraDependentecodigo: TIntegerField;
    TabConsCarteiraDependentenome: TStringField;
    TabConsCarteiraDependentecpf: TStringField;
    TabConsCarteiraDependenteid_dependente: TIntegerField;
    TabConsCarteiraDependenteparentesco: TStringField;
    TabDependenteListcarteira: TClientDataSet;
    TabDependenteListcarteiraid_dependente: TIntegerField;
    TabDependenteListcarteiracodigo: TIntegerField;
    TabDependenteListcarteiranome: TStringField;
    TabDependenteListcarteiranpesquisa: TStringField;
    TabDependenteListcarteiracpf: TStringField;
    TabConsCarteiraDependenteapi: TStringField;
    TabConsCarteiraapi: TStringField;
    TabSindDependentescpf: TStringField;
    Conn: TUniConnection;
    UniTransaction1: TUniTransaction;
    MySQLUniProvider1: TMySQLUniProvider;
    TabMensagemWhatsapp: TClientDataSet;
    TabMensagemWhatsappid_mensagem: TIntegerField;
    TabMensagemWhatsappcodigo: TIntegerField;
    TabMensagemWhatsappdescricao: TStringField;
    TabConsSindregistro: TClientDataSet;
    TabConsSindregistrodataentrada: TDateField;
    TabConsSindregistrohoraentrada: TTimeField;
    TabConsSindregistromatricula: TIntegerField;
    TabConsSindregistronome: TStringField;
    TabConsSindregistrofone: TStringField;
    TabConsSindregistronmusuario: TStringField;
    UniQuery1: TUniQuery;
    TabVendedorid_funcionario: TIntegerField;
    TabVendedorfunc: TStringField;
    TabVendedorcpf: TStringField;
    AvisoDependente18: TClientDataSet;
    AvisoDependente18id_dependente: TIntegerField;
    AvisoDependente18codigo: TIntegerField;
    AvisoDependente18nome: TStringField;
    AvisoDependente18nascimento: TDateField;
    AvisoDependente18cpf: TStringField;
    AvisoDependente18matricula: TIntegerField;
    AvisoDependente18nmsocio: TStringField;
    TabClienteid_socio: TIntegerField;
    TabClientecliente: TStringField;
    TabClientecpf: TStringField;
    TabConsAutorizacao: TClientDataSet;
    TabConsAutorizacaoidautorizacao: TIntegerField;
    TabConsAutorizacaodata: TDateField;
    TabConsAutorizacaonome: TStringField;
    TabConsAutorizacaoqtdepessoa: TIntegerField;
    TabConsAutorizacaoobs: TStringField;
    TabConsAutorizacaopessoaautorizou: TStringField;
    TabConvenioticket: TClientDataSet;
    TabConvenioticketid_convenio: TIntegerField;
    TabConvenioticketnpesquisa: TStringField;
    TabConveniotickettelefone: TStringField;
    TabConsTicket: TClientDataSet;
    TabConsTicketid_ticket: TIntegerField;
    TabConsTicketdata_ticket: TDateField;
    TabConsTicketcodigo: TIntegerField;
    TabConsTicketdata_desconto: TDateField;
    TabConsTicketdata_pagamento: TDateField;
    TabConsTicketanotacoes: TStringField;
    TabConsTicketsituacao: TStringField;
    TabConsTicketvalor_ticket: TFloatField;
    TabConsTicketnmconvenio: TStringField;
    TabConsTicketnmsocio: TStringField;
    TabConsTicketusuario: TStringField;
    TabConsTicketid_socio: TIntegerField;
    TabConsTicketcodigolote: TIntegerField;
    TabConsTicketmotivo: TStringField;
    TabConsTicketobs_cancelamento: TStringField;
    TabConsTicketBaixa: TClientDataSet;
    TabConsTicketBaixaid_ticket: TIntegerField;
    TabConsTicketBaixadata_ticket: TDateField;
    TabConsTicketBaixacodigo: TIntegerField;
    TabConsTicketBaixadata_desconto: TDateField;
    TabConsTicketBaixadata_pagamento: TDateField;
    TabConsTicketBaixaanotacoes: TStringField;
    TabConsTicketBaixasituacao: TStringField;
    TabConsTicketBaixavalor_ticket: TFloatField;
    TabConsTicketBaixanmconvenio: TStringField;
    TabConsTicketBaixanmsocio: TStringField;
    TabConsTicketBaixausuario: TStringField;
    TabConsTicketBaixaid_socio: TIntegerField;
    TabConsTicketBaixacodigolote: TIntegerField;
    TabConsTicketBaixaselecao: TStringField;
    TabConsTicketBaixavlrpago: TFloatField;
    TabConsTicketvlrpago: TFloatField;
    TabConsMarcaid_marca: TIntegerField;
    TabConsMarcacodigo: TIntegerField;
    TabConsMarcamarca: TStringField;
    TabConsMarcaativo: TStringField;
    TabConsGrupoid_grupo: TIntegerField;
    TabConsGrupocodigo: TIntegerField;
    TabConsGrupogrupo: TStringField;
    TabConsGrupoativo: TStringField;
    TabConsGrupotipo: TStringField;
    TabConsVeiculoEspecie: TClientDataSet;
    TabConsVeiculoEspecieidespecie: TIntegerField;
    TabConsVeiculoEspeciecodigo: TIntegerField;
    TabConsVeiculoEspeciedescricao: TStringField;
    TabConsVeiculoEspecieativo: TStringField;
    TabConsModeloVeiculo: TClientDataSet;
    TabConsModeloVeiculoidmodelo: TIntegerField;
    TabConsModeloVeiculocodigo: TIntegerField;
    TabConsModeloVeiculodescricao: TStringField;
    TabConsModeloVeiculoativo: TStringField;
    TabConsModeloVeiculoidmarca: TIntegerField;
    TabConsModeloVeiculonmmarca: TStringField;
    TabMarcaVeiculo: TClientDataSet;
    TabMarcaVeiculoid_marca: TIntegerField;
    TabMarcaVeiculocodigo: TIntegerField;
    TabMarcaVeiculonpesquisa: TStringField;
    TabEspecieVeiculo: TClientDataSet;
    TabEspecieVeiculoid_especie: TIntegerField;
    TabEspecieVeiculocodigo: TIntegerField;
    TabEspecieVeiculonpesquisa: TStringField;
    TabModeloVeiculo: TClientDataSet;
    TabModeloVeiculoid_modelo: TIntegerField;
    TabModeloVeiculocodigo: TIntegerField;
    TabModeloVeiculonpesquisa: TStringField;
    TabConsultaVeiculo: TClientDataSet;
    TabConsultaVeiculoplaca: TStringField;
    TabConsultaVeiculodescricao: TStringField;
    TabConsultaVeiculodescricao_fiscal: TStringField;
    TabConsultaVeiculoprc_venda: TFloatField;
    TabConsultaVeiculoveiculo_fipe: TFloatField;
    TabConsultaVeiculoveiculo_lucro: TFloatField;
    TabConsultaVeiculoveiculo_custototal: TFloatField;
    TabConsultaVeiculoestoque: TStringField;
    TabConsultaVeiculonmmodelo: TStringField;
    TabConsultaVeiculolocal: TStringField;
    TabConsultaVeiculoid_veiculo: TIntegerField;
    TabConsultaVeiculoanomodelo: TStringField;
    TabConsultaVeiculocodigo: TIntegerField;
    TabConsultaVeiculotemfoto: TStringField;
    TabConsultaVeiculotemanexo: TStringField;
    TabLocalizacaoid_localizacao: TIntegerField;
    TabLocalizacaocodigo: TIntegerField;
    TabLocalizacaolocalizacao: TStringField;
    TabAnexo: TClientDataSet;
    TabAnexoid_anexo: TIntegerField;
    TabAnexonome_arquivo: TStringField;
    TabAnexoextensao: TStringField;
    TabAnexodescricao: TStringField;
    TabPrazoPagCompra: TClientDataSet;
    TabPrazoPagCompraid_prazo: TIntegerField;
    TabPrazoPagCompracodigo: TIntegerField;
    TabPrazoPagCompradescricao: TStringField;
    TabPrazoPagCompratipo: TStringField;
    TabConTipoDoc: TClientDataSet;
    TabConTipoDocid_documento: TIntegerField;
    TabConTipoDoccodigo: TIntegerField;
    TabConTipoDocdescricao: TStringField;
    TabConTipoDocativo: TStringField;
    procedure ACBrCEPBuscaEfetuada(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private


    { Private declarations }
  public
    cepEndereco     :String;
    cepNumero       :String;
    cepBairro       :String;
    cepComplemento  :String;
    cepCidade       :String;
    cepUF           :String;
    cepCodMun       :Integer;
    nDir            :String;
    CepidCidade     :integer;
    nDirArquivo     :String;
    DadosAssociado :TDadosAssociado;
    procedure ConexaoBanco;
    Function BuscarGuidApp(out msg, guid: string): boolean;
    Function BuscarURLApp(out msg, url: string): boolean;
    Function BuscarURLWhatsApp(out msg, url: string): boolean;
    function BuscarCidadeMunicipio(cod:integer;sit:string): Integer;
    function BuscarURLAppCarteira(out url, usuario, senha,token: string): boolean;
    Function BuscarTokenWhatsappEmpresa(out token:string; idemp:integer):boolean;


    function BuscarEmailPessoa(out nome, celular, whatsapp, email, envemail,
      envwhats: string; idPessoa: integer): boolean;

   

    Procedure LimparBancoDados;

    Function RetornoMatriculaAssociado(id: integer): Integer;
    Function RetornoDadosAssociadoWhatsapp(id:integer):Boolean;
    function RetornoDadosDependenteWhatsapp(id: integer): Boolean;
    //function RetornoMensagemenvioWhatsappPadrao(id: integer): string;

    //Function RetornoAvisoPessoa(out msg:string; i:integer):Boolean;


    Function AplicarMensagemWhatsEmail(out s:string; i:integer):Boolean;
    function VeiculoAtivarSincronizacao(s: string; idemp: integer): Boolean;
    { Public declarations }
  end;

var
  DM: TDM;
  ModelPopular    : TModelSQL;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
       //UnitPedidoCad
uses Vcl.Session, UConeSul, Vcl.Validacoes,
  Model.Atualizacao, TelaFuncoes, uAppMigrations;

{$R *.dfm}

{ TDM }

{

JKDialog('Aviso','CNPJ Inválido', tdAlerta);

if JKDialog('Aviso', nExcluir, tdMensagem)  then


}

{$REGION 'Validacoes'}

Function TDM.RetornoMatriculaAssociado(id:integer):Integer;
var
qry:TUniquery;
Qrystr:string;
begin
  Result  := 1234;  //remover funcao
  Qrystr  := 'Select matricula from socio where id_socio= :id';

  Qry     := TUniquery.Create(nil);

  Try
    Try
      if not Conn.Connected then
        Conn.Connected := True;

      Qry.Connection          := Conn;
      Qry.SQL.Clear;

      Qry.SQL.Text            := Qrystr;
      Qry.Params.ParamByName('id').AsInteger    := id;
      Qry.Open;

      if not qry.Eof then
      Result  := Qry.FieldByName('matricula').AsInteger
      else
      Result  := 1234;
      Qry.Close;
    except on e:exception do
      raise Exception.Create('Error ao buscar a matricula'+e.Message);
    End;
  Finally
    FreeAndNil(Qry);
  End;

end;

//function TDM.RetornoAvisoPessoa(out msg: string; i: integer): Boolean;
//var
//Qry :TUniquery;
//QryStr  :String;
//begin
//  Result  := false; //inativar 13/08
//  QryStr  := 'Select aviso from socio where id_socio= :id';
//
//  Qry     := TUniquery.Create(nil);
//
//  Try
//    Try
//      Qry.Connection          := Conn;
//      Qry.Params.Clear;
//      Qry.SQL.Text            := QryStr;
//      Qry.Params.ParamByName('id').AsInteger      := i;
//      qry.open;
//
//      if not Qry.Eof then
//      begin
//        if Qry.FieldByName('aviso').AsString <> '' then
//        begin
//          msg       := Qry.FieldByName('aviso').AsString;
//          Result                   := True;
//        end;
//      end;
//      Qry.Close;
//    Except on e:exception do
//     raise Exception.Create(e.Message);
//    End;
//  Finally
//    FreeAndNil(Qry);
//  End;
//end;

Function TDm.RetornoDadosAssociadoWhatsapp(id:integer):Boolean;
var
Qry :TUniquery;
QryStr  :String;
begin
  Result  := false; //remover 14/08
  QryStr  := 'Select matricula, nome, whatsapp, cpf from socio where id_socio= :id';

  Qry     := TUniquery.Create(nil);

  Try
    Try
      if not Conn.Connected then
        Conn.Connected := True;

      Qry.Connection          := Conn;
      Qry.SQL.Clear;

      Qry.SQL.Text                                := QryStr;
      Qry.Params.ParamByName('id').AsInteger      := id;
      qry.open;

      if not Qry.Eof then
      begin
        DadosAssociado.Nome      := Qry.FieldByName('nome').AsString;
        DadosAssociado.WhatsApp  := Qry.FieldByName('whatsapp').AsString;
        DadosAssociado.Matricula := Qry.FieldByName('matricula').AsInteger;
        DadosAssociado.cpf       := Qry.FieldByName('cpf').AsString;
        Result                   := True;
      end
      else
      begin
        DadosAssociado.Nome      := '';
        DadosAssociado.WhatsApp  := '';
        DadosAssociado.Matricula := 0 ;
        DadosAssociado.cpf       := '';
      end;
      Qry.Close;
    Except on e:exception do
     raise Exception.Create(e.Message);
    End;
  Finally
    FreeAndNil(Qry);
  End;

end;

Function TDm.RetornoDadosDependenteWhatsapp(id:integer):Boolean;
var
Qry :TUniquery;
QryStr  :String;
begin
  Result  := false; //desativado 18/08
  QryStr  := '   Select                            '+
                ' d.nome,                          '+
                ' d.cpf,                           '+
                ' d.fone,                          '+
                ' s.matricula                      '+
                ' from sindicato_dependente d      '+
                ' inner join socio s               '+
                ' on d.id_socio = s.id_socio       '+
                ' where d.id_dependente= :id';

  Qry     := TUniquery.Create(nil);

  Try
    Try
      if not Conn.Connected then
        Conn.Connected := True;

      Qry.Connection          := Conn;
      Qry.SQL.Clear;

      Qry.SQL.Text                                := QryStr;
      Qry.Params.ParamByName('id').AsInteger      := id;
      qry.open;

      if not Qry.Eof then
      begin
        DadosAssociado.Nome      := Qry.FieldByName('nome').AsString;
        DadosAssociado.cpf       := Qry.FieldByName('cpf').AsString;
        dadosAssociado.WhatsApp  := qry.FieldByName('fone').AsString;
        DadosAssociado.Matricula := qry.FieldByName('matricula').asinteger;

        Result                   := True;
      end
      else
      begin
        DadosAssociado.Nome      := '';
        DadosAssociado.WhatsApp  := '';
        DadosAssociado.Matricula := 0 ;
        DadosAssociado.cpf       := '';
      end;
      qry.Close;
    Except on e:exception do
     raise Exception.Create(e.Message);
    End;
  Finally
    FreeAndNil(Qry);
  End;

end;


Function TDm.VeiculoAtivarSincronizacao(s:string; idemp:integer):Boolean;
var
Qry: TUniquery;
qryStr:String;
begin
  Result  := False;
  QryStr  := 'Update produto set sinc_app= :1 where id_empresa= :idemp and id_veiculo_especie >0 ';

  Qry     := TUniquery.Create(nil);

  Try
    Qry.Connection                               := Conn;
    Qry.SQL.Text                                 := QryStr;
    Qry.Params.ParamByName('1').AsString         := S;
    Qry.Params.ParamByName('idemp').AsInteger    := idemp;

    Try
      Qry.ExecSQL;
      Result  := True;
    Except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;

  Finally
    FreeAndNil(Qry);
  End;
end;

{$ENDREGION}

procedure TDM.ACBrCEPBuscaEfetuada(Sender: TObject);
begin
  if ACBrCEP.Enderecos.Count < 1 then
  exit
  //JKDialog('Aviso','Nenhum endereço encontrato!', tdAlerta)

  else
  begin
    with ACBrCEP.Enderecos[0] do
    begin

      cepEndereco       := UpperCase(Tipo_Logradouro + ' ' + Logradouro);
      cepNumero         := '';
      cepBairro         := UpperCase(Bairro);
      cepComplemento    := UpperCase(Complemento);
      cepCidade         := UpperCase(Municipio);
      cepCodMun         := StrToIntDef(IBGE_Municipio, 0);
      cepUF             := UpperCase(uf);
      cepCodMun         := 0;//Dados.BuscaCodigoIbge(Dados.qryPessoasMUNICIPIO.Value, Dados.qryPessoasUF.Value);
      CepidCidade       := BuscarCidadeMunicipio(cepCodMun,cepCidade);
    end;
  end;
end;

function TDM.BuscarCidadeMunicipio(cod:integer;sit:string):Integer;
var
  Qry       :TUniquery;
  sqlQuery  :string;
begin

  Qry                   := TUniQuery.Create(nil);
  try
    try

      Qry.Connection    := Conn;

      sqlQuery          := 'Select id_cidade from cidade where cidade= :cod';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := SqlQuery;

      Qry.Params.ParamByName('cod').AsString   := sit;

      Qry.Open;
      Qry.First;

      if not Qry.IsEmpty then
      begin
        result  := Qry.FieldByName('id_cidade').AsInteger;
      end
      else
      begin
        result  :=  -1;
      end;

      Qry.Close;
    except
      on E: Exception do
      begin
        raise;
      end;
    end;
  finally
    Qry.Free;

  end;
end;


{$REGION 'Popular Tabelas'}

//Function TDM.PopularPlanoConta(S:String):Boolean;
//var
//  Qry       :TUniquery;
//  sqlQuery  :string;
//  Model     :TModelsql;
//begin
//  Result    := False;  //desativado passado global
//  Model     := TModelsql.Create;
//
//  try
//    sqlQuery           := 'Select          '+
//                            ' p.id_planoconta,'+
//                            ' p.codigo,       '+
//                            ' p.descricao,  '+
//                            ' p.ativo,       '+
//                            ' ps.descricao as nsubplano, '+
//                            ' pg.descricao as ngrupoplano,'+
//                            ' pt.descricao as ntipoplano, '+
//                            ' pt.tipo as ntipo'+
//                            ' from planoconta p               '+
//                            ' inner join plano_subgrupo ps    '+
//                            ' on p.id_subgrupoplano = ps.id_subgrupo  '+
//                            ' inner join plano_grupo pg           '+
//                            ' on ps.id_grupo = pg.id_grupoplano   '+
//                            ' inner join plano_tipo pt            '+
//                            ' on pg.id_tipoplano = pt.id_tipo';
//    if S = 'C' then
//      sqlQuery    := sqlQuery + ' and pt.tipo=''RECEITAS'' and p.ativo = ''S'' order by p.descricao';
//    if S = 'D' then
//      sqlQuery    := sqlQuery + ' and pt.tipo=''DESPESAS'' and p.ativo = ''S'' order by p.descricao';
//    if S = '' then
//      sqlQuery    := sqlQuery + ' and p.ativo = ''S'' order by p.descricao';
//
//    Try
//      Qry := Model.ConsultarSQL(Conn,sqlquery,[]);
//      try
//        qry.First;
//        if not Qry.IsEmpty then
//        begin
//          TabPlanoConta.EmptyDataSet;
//
//          while not Qry.Eof do
//          begin
//            TabPlanoConta.Append;
//            TabPlanoConta.FieldByName('id').Value               := Qry.FieldByName('id_planoconta').Value;
//            TabPlanoConta.FieldByName('codigo').Value           := Qry.FieldByName('codigo').Value;
//            TabPlanoConta.FieldByName('descricao').Value        := Qry.FieldByName('descricao').Value ;
//            TabPlanoConta.FieldByName('nsubplano').Value        := Qry.FieldByName('nsubplano').Value;
//            TabPlanoConta.FieldByName('ngrupoplano').Value      := Qry.FieldByName('ngrupoplano').Value;
//            TabPlanoConta.FieldByName('ntipoplano').Value       := Qry.FieldByName('ntipoplano').Value;
//            TabPlanoConta.FieldByName('ntipo').Value            := Qry.FieldByName('ntipo').Value;
//            TabPlanoConta.Post;
//            Qry.Next;
//          end;
//
//          TabPlanoConta.First;
//          Result := True;
//        end;
//      finally
//        Qry.Free;
//      end;
//
//    except
//      on E: Exception do
//      begin
//        raise;
//      end;
//    end;
//
//  finally
//    Model.Free;
//  end;
//end;


//Function TDM.PopularUsuarioLogin:Boolean;
//var
//StrSql:string;
//Qry:Tuniquery;
//begin
//  Result    := False;
//  StrSql    := 'Select id_usuario, nome, login, senha, id_funcionario from usuario where ativo in (''S'',''NÃO'') order by login';
//
//  Qry       := TUniquery.Create(nil);
//
//  Try
//    Try
//
//
//       if conn.Connected then
//        begin
//          Qry.Connection    := conn;//configurar a qry
//          Qry.SQL.Text      := StrSql;
//          Qry.Open;
//
//          if TabUsuario.Active then
//          begin
//            TabUsuario.EmptyDataSet;
//          end
//          else
//          begin
//            TabUsuario.Open;
//            TabUsuario.EmptyDataSet;
//          end;
//
//          if not Qry.IsEmpty then
//          begin
//
//            Qry.First;
//            TabUsuario.DisableControls;
//
//            while not Qry.Eof do
//            begin
//              TabUsuario.Append;
//              TabUsuarioid_usuario.AsInteger        :=  Qry.FieldByName('id_usuario').AsInteger;
//              TabUsuarionome.AsString               :=  Qry.FieldByName('nome').AsString;
//              TabUsuariologin.AsString              :=  Qry.FieldByName('login').AsString;
//              TabUsuariosenha.AsString              :=  Qry.FieldByName('senha').AsString;
//              TabUsuarioid_funcionario.AsInteger    :=  Qry.FieldByName('id_funcionario').AsInteger;
//              TabUsuario.Post;
//              Qry.Next;
//            end;
//
//            TabUsuario.First;
//            TabUsuario.EnableControls;
//
//            Result  := True;
//          end;
//
//          Qry.Close;
//      end
//      else
//      begin
//      raise Exception.Create('Falha na conexão com o banco de dados.');
//      end;
//
//    Except on e:exception do
//      raise Exception.Create('Erro ao popular login: '+e.Message);
//    End;
//
//  Finally
//    Freeandnil(qry);
//    //
//  End;
//end;




{$ENDREGION}

Function TDM.AplicarMensagemWhatsEmail(out s:string; i:integer):Boolean;
var
StrSql:string;
Qry:Tuniquery;
Model :TModelSQL;
begin
  Result    := False;
  Model     := TModelSQL.Create;
  S         := '';
  Try
    StrSql  := 'Select mensagem from mensagem where id_mensagem= :id';

    Try
      Try
        Qry     := Model.ConsultarSQL(Conn,StrSql,[i]);

        if not Qry.IsEmpty then
        begin
          S:= Qry.FieldByName('mensagem').AsString;
          Result  := True;
        end;

      Finally
        Qry.Free;
      End;

    Except on e:exception do
      raise Exception.Create(e.Message);
    End;

  Finally
    model.Free;
  End;
end;

Function TDM.BuscarURLWhatsApp(out msg,url:string):boolean;
var
  Qry       :TUniquery;
  sqlQuery  :string;
begin
  Result      := False;
  sqlQuery    := 'Select urlapiwhatsapp as url from configuracao_nf where id_empresa= :id';
  Qry         := TUniQuery.Create(nil);

  try
    try
      Qry.Connection    := Conn;
      Qry.SQL.Text      := SqlQuery;
      qry.ParamByName('id').AsInteger   := TSession.idempresa;

      Qry.Open;

      if not Qry.IsEmpty then
      begin
        if qry.FieldByName('url').AsString <> '' then
        begin
          url     := qry.FieldByName('url').AsString;
          Result  := True;
          msg     := 'URL True';
        end
        else
        begin
          url     := '';
          Result  := False;
          msg     := 'URL False';
        end;
      end
      else
      begin
        url     := '';
        Result  := False;
        msg     := 'URL False';
      end;

      Qry.Close;
    except
      on E: Exception do
      begin
        msg := 'Erro ao executar consulta: ' + E.Message;
        raise;
      end;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

Function TDM.BuscarURLApp(out msg, url: string): boolean;
var
  Qry       :TUniquery;
  sqlQuery  :string;
begin
  Result                := False;

  Qry                   := TUniQuery.Create(nil);
  try
    try

      Qry.Connection    := Conn;

      sqlQuery          := 'Select urlapiapp as url from configuracao_nf where id_empresa= :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text      := SqlQuery;
      qry.ParamByName('id').AsInteger   := TSession.idempresa;

      Qry.Open;

      if not Qry.IsEmpty then
      begin
        if qry.FieldByName('url').AsString <> '' then
        begin
          url     := qry.FieldByName('url').AsString;
          Result  := True;
          msg     := 'URL True';
        end
        else
        begin
          url     := '';
          Result  := False;
          msg     := 'URL False';
        end;
      end
      else
      begin
        url     := '';
        Result  := False;
        msg     := 'URL False';
      end;

      Qry.Close;
    except
      on E: Exception do
      begin
        msg := 'Erro ao executar consulta: ' + E.Message;
        raise;
      end;
    end;
  finally
    Qry.Free;
    //
  end;
end;

Function TDM.BuscarURLAppCarteira(out url,usuario, senha, token: string): boolean;
var
  Qry       :TUniquery;
  sqlQuery  :string;
begin
  Result                := False;

  Qry                   := TUniQuery.Create(nil);
  try
    try

      Qry.Connection    := Conn;

      sqlQuery          := 'Select carteira_api, carteira_usuario, carteira_senha, carteira_token from configuracao_nf where id_empresa= :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text      := SqlQuery;
      qry.ParamByName('id').AsInteger   := TSession.idempresa;

      Qry.Open;

      if not Qry.IsEmpty then
      begin
        if qry.FieldByName('carteira_api').AsString <> '' then
        begin
          url     := qry.FieldByName('carteira_api').AsString;
          usuario := qry.FieldByName('carteira_usuario').AsString;
          senha   := qry.FieldByName('carteira_senha').AsString;
          token   := qry.FieldByName('carteira_token').AsString;
          Result  := True;
        end
        else
        begin
          url     := '';
          Result  := False;
        end;
      end
      else
      begin
        url     := '';
        Result  := False;
      end;

      Qry.Close;
    except
      on E: Exception do
      begin
        raise;
      end;
    end;
  finally
    Qry.Free;

  end;
end;

Function TDM.BuscarGuidApp(out msg, guid: string): boolean;
var
  Qry       :TUniquery;
  sqlQuery  :string;
begin
  Result                := False;

  Qry                   := TUniQuery.Create(nil);
  try
    try

      Qry.Connection    := Conn;

      sqlQuery          := 'Select guid as guid from empresa where id_empresa= :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text      := SqlQuery;
      qry.ParamByName('id').AsInteger   := TSession.idempresa;

      Qry.Open;

      if not Qry.IsEmpty then
      begin
        if qry.FieldByName('guid').AsString <> '' then
        begin
          guid     := qry.FieldByName('guid').AsString;
          Result  := True;
          msg     := 'Guid True';
        end
        else
        begin
          guid     := '';
          Result  := False;
          msg     := 'Guid False';
        end;
      end
      else
      begin
        guid     := '';
        Result  := False;
        msg     := 'Guid False';
      end;

      Qry.Close;
    except
      on E: Exception do
      begin
        msg := 'Erro ao executar consulta: ' + E.Message;
        raise;
      end;
    end;
  finally
    Qry.Free;

  end;
end;

function TDM.BuscarTokenWhatsappEmpresa(out token:string; idemp: integer): boolean;
var
StrSql:string;
Qry:Tuniquery;
Model :TModelSQL;
begin
  Result    := False;
  Model     := TModelSQL.Create;

  Try
    StrSql  := 'Select instance_key from temp where id_empresa= :id';

    Try
      Try
        Qry     := Model.ConsultarSQL(Conn,StrSql,[idemp]);

        if not Qry.IsEmpty then
        begin
          token:= Qry.FieldByName('instance_key').AsString;
          Result  := True;
        end;

      Finally
        Qry.Free;
      End;

    Except on e:exception do
      raise Exception.Create(e.Message);
    End;

  Finally
    model.Free;
  End;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
var
VersaoEXE :String;
VersaoBD  :String;
modelVal  :TValidacao;
Telas     : TTelasFuncoes;
begin
  nDir    := GetCurrentDir + '\Config.ini';
  nDirArquivo :=  GetCurrentDir;
  //modelVal    :=  TValidacao.Create;
  //Verificar Versão exe e BD
  VersaoEXE   := TConesul.GetAppVersion;
  VersaoExe   := Copy(VersaoEXE,8, 14);

  //Tentar conectar o banco de dados
  ConexaoBanco;
  RunAppMigrations(Conn);
  //carregar tela

  Telas := TTelasFuncoes.Create;
  try
    // Carregar as telas padrão e inseri-las no banco
    Telas.InserirTelasNoBanco;
  finally
    FreeAndNil(Telas);
  end;


  {Try
    Try
     // conectar e se não cria o banco de dados
     Conn := GetConnection;
     //criar as tabelas caso não criado
     TModelAtualizacao.CriarTabelas;

     //verificar se tem empresa ou se e nova
     if TModelAtualizacao.EmpresaRegistrada then
     begin
      if modelval.ObterVersaoBD(VersaoBD) then

      if VersaoExe > VersaoBD then
      TModelAtualizacao.AtualizarIncremental(VersaoExe);
     end;

    Finally
      modelval.Free;
    End;
  except on e:exception do
   raise Exception.Create(e.Message);
  End;
  }
end;

Procedure TDm.ConexaoBanco;
var
  arq_ini : string;
  ini : TIniFile;
  senha:string;
begin
  arq_ini := GetCurrentDir + '\Config.ini';

  // Verifica se INI existe...
  if NOT FileExists(arq_ini) then
  begin
    exit;
  end;

  // Instanciar arquivo INI...
  ini     := TIniFile.Create(arq_ini);

  try
    senha   := ini.ReadString('DADOS', 'Password', '');
    // Buscar dados do arquivo fisico...
    with Conn do
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
      Connected:= True;

    end;

  finally
    if Assigned(ini) then
    ini.DisposeOf;
  end;
end;

procedure TDM.LimparBancoDados;
var
  Qry       :TUniquery;
begin

  Qry                   := TUniQuery.Create(nil);

  try
    try
      Qry.Connection    := Conn;

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := 'CALL LimparTodasTabelas();';
      Qry.ExecSQL;

    except
      
    end;

  finally
    Qry.Free;

  end;
end;

Function TDM.BuscarEmailPessoa(out nome, celular, whatsapp, email, envemail, envwhats:string;idPessoa:integer):boolean;
var
  Qry       :TUniquery;
  sqlQuery  :string;
begin
  Result                := False;

  Qry                   := TUniQuery.Create(nil);
  try
    try

      Qry.Connection    := Conn;

      sqlQuery          := 'Select nome, celular, whatsapp, email, envemail, envwhats from socio where id_socio= :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text      := SqlQuery;
      qry.ParamByName('id').AsInteger   := idPessoa;

      Qry.Open;

      if not Qry.IsEmpty then
      begin
        nome      := Qry.FieldByName('nome').AsString;
        celular   := Qry.FieldByName('celular').AsString;
        whatsapp  := Qry.FieldByName('whatsapp').AsString;
        email     := Qry.FieldByName('email').AsString;
        envemail  := Qry.FieldByName('envemail').AsString;
        envwhats  := Qry.FieldByName('envwhats').AsString;
        result    := True;
      end
      else
      begin
        nome      := Qry.FieldByName('nome').AsString;
        celular   := Qry.FieldByName('celular').AsString;
        whatsapp  := Qry.FieldByName('whatsapp').AsString;
        email     := Qry.FieldByName('email').AsString;
        envemail  := Qry.FieldByName('envemail').AsString;
        envwhats  := Qry.FieldByName('envwhats').AsString;
        Result    := False;
      end;

      Qry.Close;
    except
      on E: Exception do
      begin

        raise;
      end;
    end;
  finally
    Qry.Free;

  end;
end;


end.
