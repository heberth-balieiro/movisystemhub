unit Model.Funcionario;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

Type
  [TableName('funcionario')]
  TModelFuncionario = Class

  Private
    Ffuncao: string;
    Faviso: string;
    Fobs: string;
    Frg: string;
    Femail: string;
    Fbairro: string;
    Fnascimento: TDate;
    Fid_funcionario: Integer;
    Fativo: string;
    Fapelido: string;
    Ftokenwhatsapp: string;
    Fdata_cadastro: TDate;
    Fcodigo: Integer;
    Fcpf: string;
    Fsincronizado: string;
    Fvendedor: string;
    Fcep: string;
    Ffoto: string;
    Fnumero: string;
    Fsenha: string;
    Forgao: string;
    Fcomplemento: string;
    Fid_empresa: Integer;
    Fwhatsapp: string;
    Fnome: string;
    Fapp: string;
    Fendereco: string;
    Ftelefone: string;
    Fid_usuario: Integer;
    Fcelular: string;
    Fid_cidade: Integer;
    Fcidade: String;


  public
    [FieldName('id_funcionario', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_funcionario: Integer read Fid_funcionario write Fid_funcionario;

    [FieldName('codigo')]
    [FieldOptions([foInsert,foSelect])]
    property Codigo: Integer read Fcodigo write Fcodigo;

    [FieldName('nome')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property nome: string read Fnome write Fnome;

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

    [FieldName('complemento')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property complemento: string read Fcomplemento write Fcomplemento;

    [FieldName('bairro')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property bairro: string read Fbairro write Fbairro;

    [FieldName('id_cidade')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_cidade: Integer read Fid_cidade write Fid_cidade;

    [FieldName('ativo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property ativo: string read Fativo write Fativo;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert, foSelect])]
    property id_empresa: Integer read Fid_empresa write Fid_empresa;

    [FieldName('email')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property email: string read Femail write Femail;

    [FieldName('data_cadastro')]
    [FieldOptions([foInsert, foSelect])]
    property data_cadastro: TDate read Fdata_cadastro write Fdata_cadastro;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert, foSelect])]
    property id_usuario: Integer read Fid_usuario write Fid_usuario;

    [FieldName('funcao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property funcao: string read Ffuncao write Ffuncao;

    [FieldName('telefone')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property telefone: string read Ftelefone write Ftelefone;

    [FieldName('celular')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property celular: string read Fcelular write Fcelular;

    [FieldName('whatsapp')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property whatsapp: string read Fwhatsapp write Fwhatsapp;

    [FieldName('nascimento')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property nascimento: TDate read Fnascimento write Fnascimento;

    [FieldName('obs')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property obs: string read Fobs write Fobs;

    [FieldName('aviso')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property aviso: string read Faviso write Faviso;

    [FieldName('foto')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property foto: string read Ffoto write Ffoto;

    [FieldName('vendedor')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property vendedor: string read Fvendedor write Fvendedor;

    [FieldName('orgao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property orgao: string read Forgao write Forgao;

    [FieldName('app')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property app: string read Fapp write Fapp;

    [FieldName('senha')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property senha: string read Fsenha write Fsenha;

    [FieldName('sincronizado')]
    [FieldOptions([foUpdate, foSelect])]
    property sincronizado: string read Fsincronizado write Fsincronizado;

    [FieldName('tokenwhatsapp')]
    [FieldOptions([foUpdate, foSelect])]
    property tokenwhatsapp: string read Ftokenwhatsapp write Ftokenwhatsapp;


    [FieldName('cidade')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property cidade: String read Fcidade write Fcidade;

  End;

implementation

end.
