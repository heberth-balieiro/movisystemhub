unit Model.AssociadoAtualizarAPI;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  TAssociadoDadosAtuais = class
  private
    FId_Socio: Integer;
    FEmail_Atual: string;
    FCelular_Atual: string;
    FWhatsapp_Atual: string;
    FCep_Atual: string;
    FEndereco_Atual: string;
    FNumero_Atual: string;
    FBairro_Atual: string;
    FComplemento_Atual: string;
    FSituacao_Atual: string;
    Fcidade_atual: string;

  public
    property Id_Socio: Integer
      read FId_Socio write FId_Socio;

    property Email_Atual: string
      read FEmail_Atual write FEmail_Atual;

    property Celular_Atual: string
      read FCelular_Atual write FCelular_Atual;

    property Whatsapp_Atual: string
      read FWhatsapp_Atual write FWhatsapp_Atual;

    property Cep_Atual: string
      read FCep_Atual write FCep_Atual;

    property Endereco_Atual: string
      read FEndereco_Atual write FEndereco_Atual;

    property Numero_Atual: string
      read FNumero_Atual write FNumero_Atual;

    property Bairro_Atual: string
      read FBairro_Atual write FBairro_Atual;

    property Complemento_Atual: string
      read FComplemento_Atual write FComplemento_Atual;

    property Situacao_Atual: string
      read FSituacao_Atual write FSituacao_Atual;

    property cidade_atual:string read Fcidade_atual write Fcidade_atual;
  end;

type
  [TableName('integracao_atualizacao_cadastral')]
  TAssociadoAtualizacao = class
  private
    FErro: string;
    FPessoa_Id_API: Int64;
    FId_Solicitacao_API: Int64;
    Fcep_novo: string;
    Fnumero_novo: string;
    FCPF: string;
    Fcomplemento_novo: string;
    Fwhatsapp_novo: string;
    FSituacao: string;
    Fendereco_novo: string;
    FId_Empresa: Integer;
    Ftelefone_novo: string;
    FMatricula: string;
    FNome: string;
    Fcidade_nova: string;
    Fprocessado_em: TDateTime;
    Frecebido_em: TDateTime;
    Fbairro_novo: string;
    Femail_novo: string;


  public
    [FieldName('id_solicitacao_api', True)]
    [FieldOptions([foUpdate, foSelect])]
    property Id_Solicitacao_API: Int64      read FId_Solicitacao_API write FId_Solicitacao_API;

    [FieldName('Id_Empresa')]
    [FieldOptions([foSelect])]
    property Id_Empresa: Integer           read FId_Empresa write FId_Empresa;
    [FieldName('pessoa_id_api')]
    [FieldOptions([foUpdate, foSelect])]
    property Pessoa_Id_API: Int64           read FPessoa_Id_API write FPessoa_Id_API;
    [FieldName('nome')]
    [FieldOptions([foSelect])]
    property Nome: string                 read FNome write FNome;
    [FieldName('cpf')]
    [FieldOptions([foSelect])]
    property CPF: string                  read FCPF write FCPF;
    [FieldName('matricula')]
    [FieldOptions([foSelect])]
    property Matricula: string            read FMatricula write FMatricula;
    [FieldName('email_novo')]
    [FieldOptions([foSelect])]
    property email_novo: string            read Femail_novo write Femail_novo;
    [FieldName('telefone_novo')]
    [FieldOptions([foSelect])]
    property telefone_novo: string         read Ftelefone_novo write Ftelefone_novo;
    [FieldName('whatsapp_novo')]
    [FieldOptions([foSelect])]
    property whatsapp_novo: string         read Fwhatsapp_novo write Fwhatsapp_novo;
    [FieldName('situacao')]
    [FieldOptions([foUpdate, foSelect])]
    property Situacao: string             read FSituacao write FSituacao;
    [FieldName('recebido_em')]
    [FieldOptions([foSelect])]
    property recebido_em: TDateTime        read Frecebido_em write Frecebido_em;
    [FieldName('processado_em')]
    [FieldOptions([foSelect])]
    property processado_em: TDateTime      read Fprocessado_em write Fprocessado_em;
    [FieldName('erro')]
    [FieldOptions([foUpdate, foSelect])]
    property Erro: string                 read FErro write FErro;
    [FieldName('cep_novo')]
    [FieldOptions([foSelect])]
    property cep_novo: string              read Fcep_novo write Fcep_novo;
    [FieldName('endereco_novo')]
    [FieldOptions([foSelect])]
    property endereco_novo: string         read Fendereco_novo write Fendereco_novo;
    [FieldName('numero_novo')]
    [FieldOptions([foSelect])]
    property numero_novo: string           read Fnumero_novo write Fnumero_novo;
    [FieldName('bairro_novo')]
    [FieldOptions([foSelect])]
    property bairro_novo: string           read Fbairro_novo write Fbairro_novo;
    [FieldName('complemento_novo')]
    [FieldOptions([foSelect])]
    property complemento_novo: string      read Fcomplemento_novo write Fcomplemento_novo;
    [FieldName('cidade_nova')]
    [FieldOptions([foSelect])]
    property cidade_nova: string           read Fcidade_nova write Fcidade_nova;

end;

implementation

end.
