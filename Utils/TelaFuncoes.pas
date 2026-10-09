unit TelaFuncoes;

interface

uses
  System.SysUtils, System.Generics.Collections,Controller_Perfil, Model.Perfil;

type
  TTelaFuncao = class
  public
    Modulo:string;
    Tela: string;
    Funcao: string;
    constructor Create(const AModulo, ATela, AFuncao: string);
  end;

  TTelasFuncoes = class
  private
    FTelas: TObjectList<TTelaFuncao>;
  public
    constructor Create;
    destructor Destroy; override;

    procedure AdicionarTela(const Modulo, Tela, Funcao: string);
    procedure CarregarTelasPadrao;
    procedure InserirTelasNoBanco;
    function GetTelas: TObjectList<TTelaFuncao>;
  end;

  Var
  ObjPerfil   : TModelPerfil;
  ContPerfil  : TPerfilController;
implementation
{ TTelaFuncao }



constructor TTelaFuncao.Create(const AModulo, ATela, AFuncao: string);
begin
  Modulo  := AModulo;
  Tela    := ATela;
  Funcao  := AFuncao;
end;

{ TTelasFuncoes }

constructor TTelasFuncoes.Create;
begin
  FTelas := TObjectList<TTelaFuncao>.Create;
  CarregarTelasPadrao;
end;

destructor TTelasFuncoes.Destroy;
begin
  FTelas.Free;
  inherited;
end;

procedure TTelasFuncoes.AdicionarTela(const Modulo, Tela, Funcao: string);
begin
  FTelas.Add(TTelaFuncao.Create(Modulo, Tela, Funcao));
end;

procedure TTelasFuncoes.CarregarTelasPadrao;
begin
  // Carrega as telas e funções padrão

  AdicionarTela('Acesso','Usuário','Permitir Utilizar');
  AdicionarTela('Acesso','Usuário','Permitir Pesquisa');
  AdicionarTela('Acesso','Usuário','Permitir Criar Novo');
  AdicionarTela('Acesso','Usuário','Permitir Editar');
  AdicionarTela('Acesso','Usuário','Permitir Excluir');
  AdicionarTela('Acesso','Usuário','Permitir Imprimir Listagem');
  AdicionarTela('Acesso','Usuário','Permitir Sincronizar API');

  AdicionarTela('Acesso','Perfil','Permitir Utilizar');
  AdicionarTela('Acesso','Perfil','Permitir Pesquisa');
  AdicionarTela('Acesso','Perfil','Permitir Criar Novo');
  AdicionarTela('Acesso','Perfil','Permitir Editar');
  AdicionarTela('Acesso','Perfil','Permitir Excluir');
  AdicionarTela('Acesso','Perfil','Permitir Imprimir Listagem');
  AdicionarTela('Acesso','Perfil','Permitir Editar Permissões');
  AdicionarTela('Acesso','Perfil','Permitir Visualizar');
  AdicionarTela('Acesso','Perfil','Permitir Relatório');

  AdicionarTela('Acesso','Alterar Senha','Permitir Alterar Senha');
  AdicionarTela('Acesso','Logof','Permitir Fazer Logof');

  AdicionarTela('Ferramentas','Terminal','Permitir Utilizar');
  AdicionarTela('Ferramentas','Terminal','Permitir Alterar Cliente');
  AdicionarTela('Ferramentas','Terminal','Permitir Alterar Vendedor');
  AdicionarTela('Ferramentas','Terminal','Permitir Alterar Prazo de Pagamento');
  AdicionarTela('Ferramentas','Terminal','Permitir Alterar Caminho Impressora Ticket');
  AdicionarTela('Ferramentas','Terminal','Permitir Alterar Visualizar Ticket');
  AdicionarTela('Ferramentas','Terminal','Permitir Alterar Situação Ticket');
  AdicionarTela('Ferramentas','Terminal','Permitir Alterar Salvar Pedido em Aberto');
  AdicionarTela('Ferramentas','Terminal','Permitir Alterar Iníciar Operação com Orçamento');
  AdicionarTela('Ferramentas','Terminal','Permitir Alterar Tela de Impressão');
  AdicionarTela('Ferramentas','Terminal','Permitir Alterar Aviso Dependente');

  AdicionarTela('Ferramentas','Cadastro Mensagem','Permitir Utilizar');
  AdicionarTela('Ferramentas','Cadastro Mensagem','Permitir Pesquisa');
  AdicionarTela('Ferramentas','Cadastro Mensagem','Permitir Criar Novo');
  AdicionarTela('Ferramentas','Cadastro Mensagem','Permitir Editar');
  AdicionarTela('Ferramentas','Cadastro Mensagem','Permitir Excluir');
  AdicionarTela('Ferramentas','Cadastro Mensagem','Permitir Imprimir Listagem');

  AdicionarTela('Ferramentas','Instalar Bot','Permitir Instalar Bot');
  AdicionarTela('Ferramentas','Iniciar Bot','Permitir Iníciar Bot');

  AdicionarTela('Associação','Associados/Dependentes','Permitir Utilizar');
  AdicionarTela('Associação','Associados/Dependentes','Permitir Pesquisa');
  AdicionarTela('Associação','Associados/Dependentes','Permitir Criar Novo');
  AdicionarTela('Associação','Associados/Dependentes','Permitir Editar');
  AdicionarTela('Associação','Associados/Dependentes','Permitir Excluir');
  AdicionarTela('Associação','Associados/Dependentes','Permitir Imprimir Listagem');
  AdicionarTela('Associação','Associados/Dependentes','Permitir Cadastrar Dependente');
  AdicionarTela('Associação','Associados/Dependentes','Permitir Enviar WhatsApp');
  AdicionarTela('Associação','Associados/Dependentes','Permitir Enviar WhatsApp Massa');
  AdicionarTela('Associação','Associados/Dependentes','Permitir Relatório');
  AdicionarTela('Associação','Associados/Dependentes','Permitir Importar Arquivo Json');
  AdicionarTela('Associação','Associados/Dependentes','Permitir Sincronizar API');
  AdicionarTela('Associação','Associados/Dependentes','Permitir Bloquear');
  AdicionarTela('Associação','Associados/Dependentes','Permitir Alterar Matrícula');
  AdicionarTela('Associação','Associados/Dependentes','Permitir Alterar Limite');
  AdicionarTela('Associação','Associados/Dependentes','Permitir Alterar % de Desconto');
  AdicionarTela('Associação','Associados/Dependentes','Permitir desfiliar');
  AdicionarTela('Associação','Associados/Dependentes','Permitir refiliar');
  AdicionarTela('Associação','Associados/Dependentes','Permitir visualizar histórico');
  AdicionarTela('Associação','Associados/Dependentes','Permitir Processar atualização');
  AdicionarTela('Associação','Associados/Dependentes','Permitir Processar');
  AdicionarTela('Associação','Associados/Dependentes','Permitir Rejeitar Cadastro');
  AdicionarTela('Associação','Associados/Dependentes','Permitir Marcar com Erro');


  AdicionarTela('Associação','Dependentes','Permitir Criar Novo');
  AdicionarTela('Associação','Dependentes','Permitir Editar');
  AdicionarTela('Associação','Dependentes','Permitir Excluir');
  AdicionarTela('Associação','Dependentes','Required: Nome');
  AdicionarTela('Associação','Dependentes','Required: Nascimento');
  AdicionarTela('Associação','Dependentes','Required: CPF');
  AdicionarTela('Associação','Dependentes','Required: Parentesco');
  AdicionarTela('Associação','Dependentes','Required: Telefone');
  AdicionarTela('Associação','Dependentes','Required: Foto');

  AdicionarTela('Associação','Sede','Permitir Utilizar');
  AdicionarTela('Associação','Sede','Permitir Pesquisa');
  AdicionarTela('Associação','Sede','Permitir Criar Novo');
  AdicionarTela('Associação','Sede','Permitir Editar');
  AdicionarTela('Associação','Sede','Permitir Excluir');
  AdicionarTela('Associação','Sede','Permitir Imprimir Listagem');
  AdicionarTela('Associação','Sede','Permitir Relatório');

  AdicionarTela('Associação','Empresa Associação','Permitir Utilizar');
  AdicionarTela('Associação','Empresa Associação','Permitir Criar Novo');
  AdicionarTela('Associação','Empresa Associação','Permitir Editar');
  AdicionarTela('Associação','Empresa Associação','Permitir Excluir');

  AdicionarTela('Associação','Secretaria','Permitir Utilizar');
  AdicionarTela('Associação','Secretaria','Permitir Criar Novo');
  AdicionarTela('Associação','Secretaria','Permitir Editar');
  AdicionarTela('Associação','Secretaria','Permitir Excluir');
  AdicionarTela('Associação','Secretaria','Permitir Sincronizar API');

  AdicionarTela('Associação','Profissão','Permitir Utilizar');
  AdicionarTela('Associação','Profissão','Permitir Criar Novo');
  AdicionarTela('Associação','Profissão','Permitir Editar');
  AdicionarTela('Associação','Profissão','Permitir Excluir');
  AdicionarTela('Associação','Profissão','Permitir Sincronizar API');

  AdicionarTela('Associação','Lotação','Permitir Utilizar');
  AdicionarTela('Associação','Lotação','Permitir Criar Novo');
  AdicionarTela('Associação','Lotação','Permitir Editar');
  AdicionarTela('Associação','Lotação','Permitir Excluir');
  AdicionarTela('Associação','Lotação','Permitir Sincronizar API');

  AdicionarTela('Associação','Convênio','Permitir Utilizar');
  AdicionarTela('Associação','Convênio','Permitir Pesquisa');
  AdicionarTela('Associação','Convênio','Permitir Criar Novo');
  AdicionarTela('Associação','Convênio','Permitir Editar');
  AdicionarTela('Associação','Convênio','Permitir Excluir');
  AdicionarTela('Associação','Convênio','Permitir Imprimir Listagem');
  AdicionarTela('Associação','Convênio','Permitir Sincronizar API');

  AdicionarTela('Associação','Ticket', 'Permitir Utilizar');
  AdicionarTela('Associação','Ticket', 'Permitir Pesquisa');
  AdicionarTela('Associação','Ticket', 'Permitir Criar Novo');
  AdicionarTela('Associação','Ticket', 'Permitir Solicitar Cancelamento');
  AdicionarTela('Associação','Ticket', 'Permitir Imprimir');
  AdicionarTela('Associação','Ticket', 'Permitir Reimprimir');
  AdicionarTela('Associação','Ticket', 'Permitir Anexar Documento');
  AdicionarTela('Associação','Ticket', 'Permitir Baixar');
  AdicionarTela('Associação','Ticket', 'Permitir Relatório');
  AdicionarTela('Associação','Ticket', 'Permitir Gerar Seguência');
  AdicionarTela('Associação','Ticket', 'Permitir Visualizar Fechado');
  AdicionarTela('Associação','Ticket', 'Permitir Visualizar Solicitação');
  AdicionarTela('Associação','Ticket', 'Permitir Cancelar');
  AdicionarTela('Associação','Ticket', 'Permitir Gerar sem Limite');

  AdicionarTela('Associação','Carteira','Permitir Utilizar');
  AdicionarTela('Associação','Carteira','Permitir Pesquisa');
  AdicionarTela('Associação','Carteira','Permitir Criar Novo');
  AdicionarTela('Associação','Carteira','Permitir Editar');
  AdicionarTela('Associação','Carteira','Permitir Excluir');
  AdicionarTela('Associação','Carteira','Permitir Imprimir');
  AdicionarTela('Associação','Carteira','Permitir Imprimir Listagem');
  AdicionarTela('Associação','Carteira','Permitir Enviar WhatsApp Associado');
  AdicionarTela('Associação','Carteira','Permitir Sincronizar API');
  AdicionarTela('Associação','Carteira','Permitir Novo Dependente');
  AdicionarTela('Associação','Carteira','Permitir Editar Dependente');
  AdicionarTela('Associação','Carteira','Permitir Excluir Dependente');
  AdicionarTela('Associação','Carteira','Permitir Cancelar Dependente');
  AdicionarTela('Associação','Carteira','Permitir Enviar WhatsApp Dependente');
  AdicionarTela('Associação','Carteira','Required: Foto');
  AdicionarTela('Associação','Carteira','Required: Validade');
  AdicionarTela('Associação','Carteira','Opção: Digital');
  AdicionarTela('Associação','Carteira','Opção: Impressão dependente');
  AdicionarTela('Associação','Carteira','Opção: Salvar e enviar mensagem'); //criado para quando a carteira for salva enviar mensagem.
  AdicionarTela('Associação','Carteira','Permitir reativar carteira');

  AdicionarTela('Associação','APP Web','Permitir Abrir APP Web');
  AdicionarTela('Associação','Notificação Web','Permitir Utilizar');

  AdicionarTela('Associação','Logs Sincronização','Permitir Utilizar');

  AdicionarTela('Associação','Autorização','Permitir Utilizar');
  AdicionarTela('Associação','Autorização','Permitir Pesquisa');
  AdicionarTela('Associação','Autorização','Permitir Criar Novo');
  AdicionarTela('Associação','Autorização','Permitir Editar');
  AdicionarTela('Associação','Autorização','Permitir Excluir');
  AdicionarTela('Associação','Autorização','Permitir Imprimir Listagem');
  AdicionarTela('Associação','Autorização','Permitir Sincronizar API');

  AdicionarTela('Associação','Estatísticas','Permitir Utilizar');
  AdicionarTela('Associação','Estatísticas','Permitir Pesquisa');
  AdicionarTela('Associação','Estatísticas','Permitir Imprimir');

  AdicionarTela('Associação','Registro de Entrada','Permitir Utilizar');
  AdicionarTela('Associação','Registro de Entrada','Permitir Pesquisa');
  AdicionarTela('Associação','Registro de Entrada','Permitir Imprimir Listagem');
  AdicionarTela('Associação','Registro de Entrada','Permitir Receber Dados');

  AdicionarTela('Associação','Candidato','Permitir Utilizar');
  AdicionarTela('Associação','Candidato','Permitir Pesquisa');
  AdicionarTela('Associação','Candidato','Permitir Criar Novo');
  AdicionarTela('Associação','Candidato','Permitir Editar');
  AdicionarTela('Associação','Candidato','Permitir Excluir');

  AdicionarTela('Associação','Eleição','Permitir Utilizar');
  AdicionarTela('Associação','Eleição','Permitir Pesquisa');
  AdicionarTela('Associação','Eleição','Permitir Criar Novo');
  AdicionarTela('Associação','Eleição','Permitir Editar');
  AdicionarTela('Associação','Eleição','Permitir Excluir');
  AdicionarTela('Associação','Eleição','Permitir Visualizar');
  AdicionarTela('Associação','Eleição','Permitir Imprimir Listagem');
  AdicionarTela('Associação','Eleição','Permitir Relatório');
  AdicionarTela('Associação','Eleição','Permitir Cadastrar Membros');
  AdicionarTela('Associação','Eleição','Permitir Excluir Membros');
  AdicionarTela('Associação','Eleição','Permitir Editar Membros');
  AdicionarTela('Associação','Eleição','Permitir Cadastrar Chapa');
  AdicionarTela('Associação','Eleição','Permitir Excluir Chapa');
  AdicionarTela('Associação','Eleição','Permitir Editar Chapa');
  AdicionarTela('Associação','Eleição','Permitir Homologar Chapa');
  AdicionarTela('Associação','Eleição','Permitir Indeferir Chapa');
  AdicionarTela('Associação','Eleição','Permitir Configurar');
  AdicionarTela('Associação','Eleição','Permitir visualizar eleitores');
  AdicionarTela('Associação','Eleição','Permitir excluir eleitores');
  AdicionarTela('Associação','Eleição','Permitir adicionar eleitores');
  AdicionarTela('Associação','Eleição','Permitir sincronizar eleitores');
  AdicionarTela('Associação','Eleição','Permitir Abrir Eleição');
  AdicionarTela('Associação','Eleição','Permitir Cadastrar Comissão');
  AdicionarTela('Associação','Eleição','Permitir Editar Comissão');
  AdicionarTela('Associação','Eleição','Permitir Excluir Comissão');
  AdicionarTela('Associação','Eleição','Permitir Sincronizar');
  AdicionarTela('Associação','Eleição','Permitir Utilizar Anexo');

  AdicionarTela('Associação','Eleição','Permitir Cadastrar Questão');
  AdicionarTela('Associação','Eleição','Permitir Editar Questão');
  AdicionarTela('Associação','Eleição','Permitir Excluir Questão');

  AdicionarTela('Associação','Campanha','Permitir Utilizar');
  AdicionarTela('Associação','Campanha','Permitir Pesquisa');
  AdicionarTela('Associação','Campanha','Permitir Criar Novo');
  AdicionarTela('Associação','Campanha','Permitir Editar');
  AdicionarTela('Associação','Campanha','Permitir Excluir');
  AdicionarTela('Associação','Campanha','Permitir Publicar');
  AdicionarTela('Associação','Campanha','Permitir Despublicar');
  AdicionarTela('Associação','Campanha','Permitir Encerrar Campanha');
  AdicionarTela('Associação','Campanha','Permitir Visualizar Resultado');
  AdicionarTela('Associação','Campanha','Permitir Gerar Ata');
  AdicionarTela('Associação','Campanha','Permitir Imprimir Listagem de Associados Aptos');
  AdicionarTela('Associação','Campanha','Permitir Imprimir Listagem de Associados Inaptos');
  AdicionarTela('Associação','Campanha','Permitir Imprimir Listagem de Votação');
  AdicionarTela('Associação','Campanha','Permitir Imprimir Listagem de não Votantes');
  AdicionarTela('Associação','Campanha','Permitir Enviar Link');
  AdicionarTela('Associação','Campanha','Permitir Imprimir Listagem');
  AdicionarTela('Associação','Campanha','Permitir Relatório');
  AdicionarTela('Associação','Campanha','Permitir Sincronizar API');

  AdicionarTela('Associação','Sincronizar','Permitir Sincronizar API');

  AdicionarTela('Associação','Tipo Situação','Permitir Utilizar');
  AdicionarTela('Associação','Tipo Situação','Permitir Criar Novo');
  AdicionarTela('Associação','Tipo Situação','Permitir Editar');
  AdicionarTela('Associação','Tipo Situação','Permitir Excluir');

  AdicionarTela('Associação','Local Trabalho','Permitir Utilizar');
  AdicionarTela('Associação','Local Trabalho','Permitir Criar Novo');
  AdicionarTela('Associação','Local Trabalho','Permitir Editar');
  AdicionarTela('Associação','Local Trabalho','Permitir Excluir');

  AdicionarTela('Associação','Bem','Permitir Utilizar');
  AdicionarTela('Associação','Bem','Permitir Criar Novo');
  AdicionarTela('Associação','Bem','Permitir Editar');
  AdicionarTela('Associação','Bem','Permitir Excluir');
  AdicionarTela('Associação','Bem','Permitir Pesquisa');
  AdicionarTela('Associação','Bem','Permitir Imprimir Listagem');
  AdicionarTela('Associação','Bem','Permitir Anexar');

  AdicionarTela('Ferramentas','Anexo','Permitir Incluir');
  AdicionarTela('Ferramentas','Anexo','Permitir Excluir');
  AdicionarTela('Ferramentas','Anexo','Permitir Visualizar');

  AdicionarTela('Cadastro','Empresa','Permitir Utilizar');
  AdicionarTela('Cadastro','Empresa','Permitir Pesquisa');
  AdicionarTela('Cadastro','Empresa','Permitir Criar Novo');
  AdicionarTela('Cadastro','Empresa','Permitir Editar');
  AdicionarTela('Cadastro','Empresa','Permitir Excluir');
  AdicionarTela('Cadastro','Empresa','Permitir Visualizar');
  AdicionarTela('Cadastro','Empresa','Permitir Imprimir Listagem');
  AdicionarTela('Cadastro','Empresa','Permitir Relatório');
  AdicionarTela('Cadastro','Empresa','Permitir Configurar Sistema');
  AdicionarTela('Cadastro','Empresa','Permitir Configurar Email');
  AdicionarTela('Cadastro','Empresa','Permitir Conectar Dispositivo');
  AdicionarTela('Cadastro','Empresa','Permitir Limpar Dados');
  AdicionarTela('Cadastro','Empresa','Permitir Ativar/Desativar APP Pedido');
  AdicionarTela('Cadastro','Empresa','Permitir Sincronizar APP Pedido');

  AdicionarTela('Cadastro','Empresa','Permitir Sincronizar Dados Empresa');


  AdicionarTela('Cadastro','Histórico Bancário','Permitir Utilizar');
  AdicionarTela('Cadastro','Histórico Bancário','Permitir Criar Novo');
  AdicionarTela('Cadastro','Histórico Bancário','Permitir Editar');
  AdicionarTela('Cadastro','Histórico Bancário','Permitir Excluir');

  AdicionarTela('Cadastro','Funcionário','Permitir Utilizar');
  AdicionarTela('Cadastro','Funcionário','Permitir Pesquisa');
  AdicionarTela('Cadastro','Funcionário','Permitir Criar Novo');
  AdicionarTela('Cadastro','Funcionário','Permitir Editar');
  AdicionarTela('Cadastro','Funcionário','Permitir Excluir');
  AdicionarTela('Cadastro','Funcionário','Permitir Imprimir Listagem');
  AdicionarTela('Cadastro','Funcionário','Permitir Relatório');
  AdicionarTela('Cadastro','Funcionário','Permitir Visualizar');
  AdicionarTela('Cadastro','Funcionário','Permitir Sincronizar APP Pedido');
  AdicionarTela('Cadastro','Funcionário','Permitir Conectar Instância WhatsApp');


  AdicionarTela('Cadastro','Pessoa','Permitir Utilizar');
  AdicionarTela('Cadastro','Pessoa','Permitir Pesquisa');
  AdicionarTela('Cadastro','Pessoa','Permitir Criar Novo');
  AdicionarTela('Cadastro','Pessoa','Permitir Editar');
  AdicionarTela('Cadastro','Pessoa','Permitir Excluir');

  AdicionarTela('Cadastro','Documento','Permitir Utilizar');
  AdicionarTela('Cadastro','Documento','Permitir Pesquisa');
  AdicionarTela('Cadastro','Documento','Permitir Criar Novo');
  AdicionarTela('Cadastro','Documento','Permitir Editar');
  AdicionarTela('Cadastro','Documento','Permitir Excluir');
  AdicionarTela('Cadastro','Documento','Permitir Imprimir Listagem');
  AdicionarTela('Cadastro','Documento','Permitir Relatório');
  AdicionarTela('Cadastro','Documento','Permitir Visualizar');

  AdicionarTela('Cadastro','Localizacao','Permitir Utilizar');
  AdicionarTela('Cadastro','Localizacao','Permitir Pesquisa');
  AdicionarTela('Cadastro','Localizacao','Permitir Criar Novo');
  AdicionarTela('Cadastro','Localizacao','Permitir Editar');
  AdicionarTela('Cadastro','Localizacao','Permitir Excluir');
  AdicionarTela('Cadastro','Localizacao','Permitir Imprimir Listagem');
  AdicionarTela('Cadastro','Localizacao','Permitir Relatório');
  AdicionarTela('Cadastro','Localizacao','Permitir Visualizar');

  AdicionarTela('Cadastro','Marca','Permitir Utilizar');
  AdicionarTela('Cadastro','Marca','Permitir Criar Novo');
  AdicionarTela('Cadastro','Marca','Permitir Editar');
  AdicionarTela('Cadastro','Marca','Permitir Excluir');
  AdicionarTela('Cadastro','Marca','Permitir Pesquisa');
  AdicionarTela('Cadastro','Marca','Permitir Imprimir Listagem');

  AdicionarTela('Cadastro','Grupo','Permitir Utilizar');
  AdicionarTela('Cadastro','Grupo','Permitir Criar Novo');
  AdicionarTela('Cadastro','Grupo','Permitir Editar');
  AdicionarTela('Cadastro','Grupo','Permitir Excluir');
  AdicionarTela('Cadastro','Grupo','Permitir Pesquisa');
  AdicionarTela('Cadastro','Grupo','Permitir Imprimir Listagem');

  AdicionarTela('Cadastro','Unidade','Permitir Utilizar');
  AdicionarTela('Cadastro','Unidade','Permitir Criar Novo');
  AdicionarTela('Cadastro','Unidade','Permitir Editar');
  AdicionarTela('Cadastro','Unidade','Permitir Excluir');
  AdicionarTela('Cadastro','Unidade','Permitir Pesquisa');
  AdicionarTela('Cadastro','Unidade','Permitir Imprimir Listagem');

  AdicionarTela('Cadastro','Modelo','Permitir Utilizar');
  AdicionarTela('Cadastro','Modelo','Permitir Criar Novo');
  AdicionarTela('Cadastro','Modelo','Permitir Editar');
  AdicionarTela('Cadastro','Modelo','Permitir Excluir');
  AdicionarTela('Cadastro','Modelo','Permitir Pesquisa');
  AdicionarTela('Cadastro','Modelo','Permitir Imprimir Listagem');

  AdicionarTela('Cadastro','Transportadora','Permitir Utilizar');
  AdicionarTela('Cadastro','Transportadora','Permitir Criar Novo');
  AdicionarTela('Cadastro','Transportadora','Permitir Editar');
  AdicionarTela('Cadastro','Transportadora','Permitir Excluir');
  AdicionarTela('Cadastro','Transportadora','Permitir Pesquisa');
  AdicionarTela('Cadastro','Transportadora','Permitir Imprimir Listagem');

  AdicionarTela('Cadastro','Produto','Permitir Utilizar');
  AdicionarTela('Cadastro','Produto','Permitir Criar Novo');
  AdicionarTela('Cadastro','Produto','Permitir Editar');
  AdicionarTela('Cadastro','Produto','Permitir Excluir');
  AdicionarTela('Cadastro','Produto','Permitir Pesquisa');
  AdicionarTela('Cadastro','Produto','Permitir Imprimir Listagem');

  AdicionarTela('Cadastro','Plano de Contas','Permitir Utilizar');
  AdicionarTela('Cadastro','Plano de Contas','Permitir Criar Novo');
  AdicionarTela('Cadastro','Plano de Contas','Permitir Editar');
  AdicionarTela('Cadastro','Plano de Contas','Permitir Excluir');
  AdicionarTela('Cadastro','Plano de Contas','Permitir Pesquisa');
  AdicionarTela('Cadastro','Plano de Contas','Permitir Imprimir Listagem');

  AdicionarTela('Cadastro','CFOP','Permitir Utilizar');
  AdicionarTela('Cadastro','CFOP','Permitir Criar Novo');
  AdicionarTela('Cadastro','CFOP','Permitir Editar');
  AdicionarTela('Cadastro','CFOP','Permitir Excluir');
  AdicionarTela('Cadastro','CFOP','Permitir Pesquisa');
  AdicionarTela('Cadastro','CFOP','Permitir Imprimir Listagem');

  AdicionarTela('Cadastro','Cidade','Permitir Utilizar');
  AdicionarTela('Cadastro','Cidade','Permitir Criar Novo');
  AdicionarTela('Cadastro','Cidade','Permitir Editar');
  AdicionarTela('Cadastro','Cidade','Permitir Excluir');
  AdicionarTela('Cadastro','Cidade','Permitir Pesquisa');
  AdicionarTela('Cadastro','Cidade','Permitir Imprimir Listagem');

  AdicionarTela('Cadastro','Contas','Permitir Utilizar');
  AdicionarTela('Cadastro','Contas','Permitir Criar Novo');
  AdicionarTela('Cadastro','Contas','Permitir Editar');
  AdicionarTela('Cadastro','Contas','Permitir Excluir');
  AdicionarTela('Cadastro','Contas','Permitir Pesquisa');
  AdicionarTela('Cadastro','Contas','Permitir Imprimir Listagem');

  AdicionarTela('Cadastro','Prazo','Permitir Utilizar');
  AdicionarTela('Cadastro','Prazo','Permitir Criar Novo');
  AdicionarTela('Cadastro','Prazo','Permitir Editar');
  AdicionarTela('Cadastro','Prazo','Permitir Excluir');
  AdicionarTela('Cadastro','Prazo','Permitir Pesquisa');
  AdicionarTela('Cadastro','Prazo','Permitir Imprimir Listagem');

  AdicionarTela('Cadastro','Categoria','Permitir Utilizar');
  AdicionarTela('Cadastro','Categoria','Permitir Pesquisa');
  AdicionarTela('Cadastro','Categoria','Permitir Criar Novo');
  AdicionarTela('Cadastro','Categoria','Permitir Editar');
  AdicionarTela('Cadastro','Categoria','Permitir Excluir');

  AdicionarTela('Cadastro','Departamento','Permitir Utilizar');
  AdicionarTela('Cadastro','Departamento','Permitir Pesquisa');
  AdicionarTela('Cadastro','Departamento','Permitir Criar Novo');
  AdicionarTela('Cadastro','Departamento','Permitir Editar');
  AdicionarTela('Cadastro','Departamento','Permitir Excluir');

  //Garagem
  AdicionarTela('Garagem','Marca Veículo','Permitir Utilizar');
  AdicionarTela('Garagem','Marca Veículo','Permitir Criar Novo');
  AdicionarTela('Garagem','Marca Veículo','Permitir Editar');
  AdicionarTela('Garagem','Marca Veículo','Permitir Excluir');
  AdicionarTela('Garagem','Marca Veículo','Permitir Pesquisa');
  AdicionarTela('Garagem','Marca Veículo','Permitir Imprimir Listagem');

  AdicionarTela('Garagem','Tipo Veículo','Permitir Utilizar');
  AdicionarTela('Garagem','Tipo Veículo','Permitir Criar Novo');
  AdicionarTela('Garagem','Tipo Veículo','Permitir Editar');
  AdicionarTela('Garagem','Tipo Veículo','Permitir Excluir');
  AdicionarTela('Garagem','Tipo Veículo','Permitir Pesquisa');
  AdicionarTela('Garagem','Tipo Veículo','Permitir Imprimir Listagem');

  AdicionarTela('Garagem','Espécie Veículo','Permitir Utilizar');
  AdicionarTela('Garagem','Espécie Veículo','Permitir Criar Novo');
  AdicionarTela('Garagem','Espécie Veículo','Permitir Editar');
  AdicionarTela('Garagem','Espécie Veículo','Permitir Excluir');
  AdicionarTela('Garagem','Espécie Veículo','Permitir Pesquisa');
  AdicionarTela('Garagem','Espécie Veículo','Permitir Imprimir Listagem');

  AdicionarTela('Garagem','Modelo Veículo','Permitir Utilizar');
  AdicionarTela('Garagem','Modelo Veículo','Permitir Criar Novo');
  AdicionarTela('Garagem','Modelo Veículo','Permitir Editar');
  AdicionarTela('Garagem','Modelo Veículo','Permitir Excluir');
  AdicionarTela('Garagem','Modelo Veículo','Permitir Pesquisa');
  AdicionarTela('Garagem','Modelo Veículo','Permitir Imprimir Listagem');

  AdicionarTela('Garagem','Controle Veículo','Permitir Utilizar');
  AdicionarTela('Garagem','Controle Veículo','Permitir Criar Novo');
  AdicionarTela('Garagem','Controle Veículo','Permitir Editar');
  AdicionarTela('Garagem','Controle Veículo','Permitir Excluir');
  AdicionarTela('Garagem','Controle Veículo','Permitir Pesquisa');
  AdicionarTela('Garagem','Controle Veículo','Permitir Sincronizar Dados');
  AdicionarTela('Garagem','Controle Veículo','Permitir Visualizar');

  AdicionarTela('Garagem','Controle Veículo','Permitir Anexar Foto');

  AdicionarTela('Garagem','Controle Veículo','Permitir Anexar Documento');    //para abrir a tela
  AdicionarTela('Garagem','Controle Veículo','Permitir Inserir Documento');
  AdicionarTela('Garagem','Controle Veículo','Permitir Excluir Documento');
  AdicionarTela('Garagem','Controle Veículo','Permitir Visualizar Documento');



  AdicionarTela('Garagem','Entrada Veículo','Permitir Utilizar');
  AdicionarTela('Garagem','Entrada Veículo','Permitir Criar Novo');
  AdicionarTela('Garagem','Entrada Veículo','Permitir Editar');
  AdicionarTela('Garagem','Entrada Veículo','Permitir Excluir');
  AdicionarTela('Garagem','Entrada Veículo','Permitir Cancelar');
  AdicionarTela('Garagem','Entrada Veículo','Permitir reabrir');
  AdicionarTela('Garagem','Entrada Veículo','Permitir Pesquisa');
  AdicionarTela('Garagem','Entrada Veículo','Excluir Veículo Compra');
  AdicionarTela('Garagem','Entrada Veículo','Permitir Editar Veículo Compra');

  //Ordem de Serviço 01/08/2025

  AdicionarTela('Ordem Serviço','Ordem Serviço','Permitir Utilizar');
  AdicionarTela('Ordem Serviço','Ordem Serviço','Permitir Pesquisa');
  AdicionarTela('Ordem Serviço','Ordem Serviço','Permitir Criar Novo');
  AdicionarTela('Ordem Serviço','Ordem Serviço','Permitir Editar');
  AdicionarTela('Ordem Serviço','Ordem Serviço','Permitir Excluir');
  AdicionarTela('Ordem Serviço','Ordem Serviço','Permitir Imprimir Listagem');
  AdicionarTela('Ordem Serviço','Ordem Serviço','Permitir Relatório');
  AdicionarTela('Ordem Serviço','Ordem Serviço','Permitir Visualizar');

  AdicionarTela('Ordem Serviço','Equipamento','Permitir Utilizar');
  AdicionarTela('Ordem Serviço','Equipamento','Permitir Pesquisa');
  AdicionarTela('Ordem Serviço','Equipamento','Permitir Criar Novo');
  AdicionarTela('Ordem Serviço','Equipamento','Permitir Editar');
  AdicionarTela('Ordem Serviço','Equipamento','Permitir Excluir');
  AdicionarTela('Ordem Serviço','Equipamento','Permitir Imprimir Listagem');
  AdicionarTela('Ordem Serviço','Equipamento','Permitir Relatório');
  AdicionarTela('Ordem Serviço','Equipamento','Permitir Visualizar');

  //fiscal
  AdicionarTela('Movimentação','Manifesto','Permitir Utilizar');
  AdicionarTela('Movimentação','Manifesto','Permitir Pesquisa');
  AdicionarTela('Movimentação','Manifesto','Permitir Consultar');
  //AdicionarTela('Movimentação','Pedido','Permitir Editar');
  //AdicionarTela('Movimentação','Pedido','Permitir Excluir');


  AdicionarTela('Movimentação','Compra','Permitir Utilizar');
  AdicionarTela('Movimentação','Compra','Permitir Pesquisa');

  //Movimentacao
  AdicionarTela('Movimentação','Pedido','Permitir Utilizar');
  AdicionarTela('Movimentação','Pedido','Permitir Pesquisa');
  AdicionarTela('Movimentação','Pedido','Permitir Criar Novo');
  AdicionarTela('Movimentação','Pedido','Permitir Editar');
  AdicionarTela('Movimentação','Pedido','Permitir Excluir');

  //Financeiro

  AdicionarTela('Financeiro','Contas a Receber', 'Permitir Utilizar');
  AdicionarTela('Financeiro','Contas a Receber', 'Permitir Pesquisa');
  AdicionarTela('Financeiro','Contas a Receber', 'Permitir Criar Novo');
  AdicionarTela('Financeiro','Contas a Receber', 'Permitir Cancelar');
  AdicionarTela('Financeiro','Contas a Receber','Permitir Editar');
  AdicionarTela('Financeiro','Contas a Receber','Permitir Excluir');
  //AdicionarTela('Financeiro','Contas a Receber', 'Permitir Solicitar Cancelamento');
  AdicionarTela('Financeiro','Contas a Receber', 'Permitir Imprimir');
  //AdicionarTela('Financeiro','Contas a Receber', 'Permitir Reimprimir');
  AdicionarTela('Financeiro','Contas a Receber', 'Permitir Anexar Documento');
  AdicionarTela('Financeiro','Contas a Receber', 'Permitir Baixar');
  AdicionarTela('Financeiro','Contas a Receber', 'Permitir Relatório');
  //AdicionarTela('Financeiro','Contas a Receber', 'Permitir Gerar Seguência');
  //AdicionarTela('Financeiro','Contas a Receber', 'Permitir Visualizar Fechado');
  //AdicionarTela('Financeiro','Contas a Receber', 'Permitir Visualizar Solicitação');
  //AdicionarTela('Financeiro','Contas a Receber', 'Permitir Gerar sem Limite');

  AdicionarTela('Financeiro','Controle Bancário', 'Permitir Utilizar');
  AdicionarTela('Financeiro','Controle Bancário', 'Permitir Pesquisa');
  AdicionarTela('Financeiro','Controle Bancário', 'Permitir Criar Novo');
  AdicionarTela('Financeiro','Controle Bancário','Permitir Editar');
  AdicionarTela('Financeiro','Controle Bancário','Permitir Excluir');
  AdicionarTela('Financeiro','Controle Bancário','Permitir Anexar');
  AdicionarTela('Financeiro','Controle Bancário','Permitir Desconciliar');
  AdicionarTela('Financeiro','Controle Bancário','Permitir Conciliar');
  AdicionarTela('Financeiro','Controle Bancário','Permitir Imprimir');
  AdicionarTela('Financeiro','Controle Bancário','Permitir Relatório');
  AdicionarTela('Financeiro','Controle Bancário','Permitir Ler OFX');
end;

procedure TTelasFuncoes.InserirTelasNoBanco;
var
  TelaFuncao: TTelaFuncao;
begin

  try
    ContPerfil  := Nil;
    ContPerfil  := TPerfilController.Create;

    Try
      for TelaFuncao in FTelas do
      begin
        if ContPerfil.InserirTela(TelaFuncao.Modulo, TelaFuncao.Tela, TelaFuncao.Funcao) then
      end;
    Finally
      FreeAndNil(ContPerfil);
    End;
  except on E: Exception do
    begin
      raise Exception.Create(e.Message);
    end;
  end;





  // Exemplo de inserção no banco de dados.
//  Model       := TModelPerfil.Create;
//
//  Try
//    for TelaFuncao in FTelas do
//    begin
//      Model.InserirTela(TelaFuncao.Modulo, TelaFuncao.Tela, TelaFuncao.Funcao);
//    end;
//  Finally
//    FreeandNil(Model);
//  End;
end;

function TTelasFuncoes.GetTelas: TObjectList<TTelaFuncao>;
begin
  Result := FTelas;
end;

end.


{

exemplo de uso

procedure RegistrarPrimeiroAcesso;
var
  Telas: TTelasFuncoes;
begin
  Telas := TTelasFuncoes.Create;
  try
    // Carregar as telas padrão e inseri-las no banco
    Telas.InserirTelasNoBanco;
  finally
    Telas.Free;
  end;
end;


}

