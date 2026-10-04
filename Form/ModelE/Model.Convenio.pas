unit Model.Convenio;
interface
uses
  System.SysUtils, System.Classes, uAtributosRTTI;
type
  [TableName('convenio')]
  TConvenio = class
  private
    Fid_convenio: Integer;
    Fcodigo: Integer;
    Fnome: string;
    Ftipo: string;
    Ftermos: string;
    Finformacao_contrato: string;
    Fvalores: Double;
    Ftelefone: string;
    Fativo: string;
    Fid_empresa: Integer;
    Fdatacriacao: TDate;
    Fid_usuario: Integer;
    Ftipocad: string;
    Fapelido: string;
    Fcpf: string;
    Frg: string;
    Fcep: string;
    Fendereco: string;
    Fnumero: string;
    Fbairro: string;
    Fcomplemento: string;
    Fid_cidade: Integer;
    Fobs: string;
    Faviso: string;
    Femail: string;
    Fchave_pix: string;
    Fbanco: string;
    Fconta: string;
    Fagencia: string;
    Fcorrentista: string;
    Fresponsavel: string;
    Fcontato: string;
    Fcelular: string;
    Fcelular1: string;
    Fsinc_app: string;
    Fexcluido: Integer;
    Fdata_exc: TDate;
    Fid_usuario_exc: Integer;
    Fncidade: string;
    Fexibir_app: string;
    Fdata_firmado: TDate;
  public

    [FieldName('id_convenio', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_convenio: Integer read Fid_convenio write Fid_convenio;

    [FieldName('codigo')]
    [FieldOptions([foInsert, foSelect])]
    property codigo: Integer read Fcodigo write Fcodigo;
    [FieldName('nome')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property nome: string read Fnome write Fnome;
    [FieldName('tipo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property tipo: string read Ftipo write Ftipo;
    [FieldName('termos')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property termos: string read Ftermos write Ftermos;
    [FieldName('informacao_contrato')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property informacao_contrato: string read Finformacao_contrato write Finformacao_contrato;
    [FieldName('valores')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property valores: Double read Fvalores write Fvalores;
    [FieldName('telefone')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property telefone: string read Ftelefone write Ftelefone;
    [FieldName('ativo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property ativo: string read Fativo write Fativo;
    [FieldName('id_empresa')]
    [FieldOptions([foInsert])]
    property id_empresa: Integer read Fid_empresa write Fid_empresa;
    [FieldName('datacriacao')]
    [FieldOptions([foInsert])]
    property datacriacao: TDate read Fdatacriacao write Fdatacriacao;
    [FieldName('id_usuario')]
    [FieldOptions([foInsert])]
    property id_usuario: Integer read Fid_usuario write Fid_usuario;
    [FieldName('tipocad')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property tipocad: string read Ftipocad write Ftipocad;
    [FieldName('apelido')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property apelido: string read Fapelido write Fapelido;
    [FieldName('cpf')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property cpf: string read Fcpf write Fcpf;
    [FieldName('rg')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property rg: string read Frg write Frg;
    [FieldName('cep')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property cep: string read Fcep write Fcep;
    [FieldName('endereco')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property endereco: string read Fendereco write Fendereco;
    [FieldName('numero')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property numero: string read Fnumero write Fnumero;
    [FieldName('bairro')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property bairro: string read Fbairro write Fbairro;
    [FieldName('complemento')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property complemento: string read Fcomplemento write Fcomplemento;
    [FieldName('id_cidade')]
    [FieldOptions([foInsert])]
    property id_cidade: Integer read Fid_cidade write Fid_cidade;
    [FieldName('obs')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property obs: string read Fobs write Fobs;
    [FieldName('aviso')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property aviso: string read Faviso write Faviso;
    [FieldName('email')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property email: string read Femail write Femail;
    [FieldName('chave_pix')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property chave_pix: string read Fchave_pix write Fchave_pix;
    [FieldName('banco')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property banco: string read Fbanco write Fbanco;
    [FieldName('conta')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property conta: string read Fconta write Fconta;
    [FieldName('agencia')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property agencia: string read Fagencia write Fagencia;
    [FieldName('correntista')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property correntista: string read Fcorrentista write Fcorrentista;
    [FieldName('responsavel')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property responsavel: string read Fresponsavel write Fresponsavel;
    [FieldName('contato')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property contato: string read Fcontato write Fcontato;
    [FieldName('celular')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property celular: string read Fcelular write Fcelular;
    [FieldName('celular1')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property celular1: string read Fcelular1 write Fcelular1;
    [FieldName('sinc_app')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property sinc_app: string read Fsinc_app write Fsinc_app;
    [FieldName('excluido')]
    [FieldOptions([foInsert, foUpdate])]
    property excluido: Integer read Fexcluido write Fexcluido;
    [FieldName('data_exc')]
    [FieldOptions([foSelect])]
    property data_exc: TDate read Fdata_exc write Fdata_exc;
    [FieldName('id_usuario_exc')]
    [FieldOptions([foSelect])]
    property id_usuario_exc: Integer read Fid_usuario_exc write Fid_usuario_exc;
    [FieldName('exibir_app')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property exibir_app: string read Fexibir_app write Fexibir_app;
    //variavel fora da tabela
    [FieldName('ncidade')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property ncidade: string read Fncidade write Fncidade;

    [FieldName('data_firmado')]
    [FieldOptions([foInsert, foUpdate,foSelect])]
    property data_firmado: TDate read Fdata_firmado write Fdata_firmado;


  end;
implementation
end.
