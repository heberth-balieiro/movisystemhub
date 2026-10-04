unit Model.Sindicato_Lotacao;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('sindicato_lotacao')]
  TSindicato_Lotacao = class
  private
    Fid_lotacao: Integer;
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
    [FieldName('id_lotacao', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_lotacao: Integer read Fid_lotacao write Fid_lotacao;

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
    [FieldOptions([foInsert, foUpdate])]
    property excluido: Integer read Fexcluido write Fexcluido;

    [FieldName('data_exc')]
    [FieldOptions([foUpdate])]
    property data_exc: TDate read Fdata_exc write Fdata_exc;

    [FieldName('id_usuario_exc')]
    [FieldOptions([foUpdate])]
    property id_usuario_exc: Integer read Fid_usuario_exc write Fid_usuario_exc;
  end;

implementation

end.
