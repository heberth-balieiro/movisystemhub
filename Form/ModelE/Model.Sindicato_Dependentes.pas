unit Model.Sindicato_Dependentes;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('sindicato_dependente')]
  TSindicato_Dependentes = class
  private
    Fid_dependente: Integer;
    Fcodigo: Integer;
    Fid_socio: Integer;
    Fnome: string;
    Fnascimento: TDate;
    Fparentesco: string;
    Fcpf: string;
    Frg: string;
    Fsexo: string;
    Ffoto: String;
    Fid_empresa: Integer;
    Fid_usuario: Integer;
    Fdatacadastro: TDate;
    Fativo: string;
    Fautorizado: string;
    Ffone: string;
    Fsinc_app: string;
    Fexcluido: Integer;
    Fdata_exc: TDate;
    Fid_usuario_exc: Integer;
    Fnmusuario: string;

  public
    [FieldName('id_dependente', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_dependente: Integer read Fid_dependente write Fid_dependente;

    [FieldName('codigo')]
    [FieldOptions([foInsert, foSelect])]
    property codigo: Integer read Fcodigo write Fcodigo;

    [FieldName('id_socio')]
    [FieldOptions([foInsert])]
    property id_socio: Integer read Fid_socio write Fid_socio;

    [FieldName('nome')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property nome: string read Fnome write Fnome;

    [FieldName('nascimento')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property nascimento: TDate read Fnascimento write Fnascimento;

    [FieldName('parentesco')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property parentesco: string read Fparentesco write Fparentesco;

    [FieldName('cpf')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property cpf: string read Fcpf write Fcpf;

    [FieldName('rg')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property rg: string read Frg write Frg;

    [FieldName('sexo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property sexo: string read Fsexo write Fsexo;

    [FieldName('foto')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property foto: String read Ffoto write Ffoto;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert])]
    property id_empresa: Integer read Fid_empresa write Fid_empresa;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert])]
    property id_usuario: Integer read Fid_usuario write Fid_usuario;

    [FieldName('datacadastro')]
    [FieldOptions([foInsert, foSelect])]
    property datacadastro: TDate read Fdatacadastro write Fdatacadastro;

    [FieldName('ativo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property ativo: string read Fativo write Fativo;

    [FieldName('autorizado')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property autorizado: string read Fautorizado write Fautorizado;

    [FieldName('fone')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property fone: string read Ffone write Ffone;

    [FieldName('sinc_app')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property sinc_app: string read Fsinc_app write Fsinc_app;

    [FieldName('excluido')]
    [FieldOptions([foInsert])]
    property excluido: Integer read Fexcluido write Fexcluido;

    [FieldName('data_exc')]
    [FieldOptions([foSelect])]
    property data_exc: TDate read Fdata_exc write Fdata_exc;

    [FieldName('id_usuario_exc')]
    [FieldOptions([foSelect])]
    property id_usuario_exc: Integer read Fid_usuario_exc write Fid_usuario_exc;

    [FieldName('nmusuario')]
    [FieldOptions([foSelect])]
    [Editable(false)]
    property nmusuario: string read Fnmusuario write Fnmusuario;


  end;

implementation

end.
