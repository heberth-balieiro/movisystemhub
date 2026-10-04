unit Model.Sindicato_Profissao;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('sindicato_profissao')]
  TSindicato_Profissao = class
  private
    Fid_profissao: Integer;
    Fcodigo: Integer;
    Fdescricao: string;
    Fid_empresa: Integer;
    Fid_usuario: Integer;
    Fdatacadastro: TDate;
    Fativo: string;
    Fsinc_app: string;
    Fexcluido: Integer;
    Fdata_exc: TDate;
    Fid_usuario_exc: Integer;

  public
    [FieldName('id_profissao', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_profissao: Integer read Fid_profissao write Fid_profissao;

    [FieldName('codigo')]
    [FieldOptions([foInsert, foSelect])]
    property codigo: Integer read Fcodigo write Fcodigo;

    [FieldName('descricao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property descricao: string read Fdescricao write Fdescricao;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert])]
    property id_empresa: Integer read Fid_empresa write Fid_empresa;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert])]
    property id_usuario: Integer read Fid_usuario write Fid_usuario;

    [FieldName('datacadastro')]
    [FieldOptions([foInsert])]
    property datacadastro: TDate read Fdatacadastro write Fdatacadastro;

    [FieldName('ativo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property ativo: string read Fativo write Fativo;

    [FieldName('sinc_app')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property sinc_app: string read Fsinc_app write Fsinc_app;

    [FieldName('excluido')]
    [FieldOptions([foInsert, foSelect])]
    property excluido: Integer read Fexcluido write Fexcluido;

    [FieldName('data_exc')]
    [FieldOptions([foSelect])]
    property data_exc: TDate read Fdata_exc write Fdata_exc;

    [FieldName('id_usuario_exc')]
    [FieldOptions([foSelect])]
    property id_usuario_exc: Integer read Fid_usuario_exc write Fid_usuario_exc;
  end;

implementation

end.
