unit Model.Departamento;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('departamento')]
  TDepartamento = class
  private
    Fid_departamento: Integer;
    Fdescricao: String;
    Fativo: String;
    Fid_empresa: Integer;
    Fdata_cadastro: TDateTime;
    Fdata_alteracao: TDateTime;
    Fdata_exclusao: TDate;
    Fexcluido: Integer;
    Fid_usuario: Integer;
    Fid_usuario_alt: Integer;
    Fid_usuario_exc: Integer;

  public
    [FieldName('id_departamento', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_departamento: Integer read Fid_departamento write Fid_departamento;

    [FieldName('descricao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property descricao: String read Fdescricao write Fdescricao;

    [FieldName('ativo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property ativo: String read Fativo write Fativo;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert, foSelect])]
    property id_empresa: Integer read Fid_empresa write Fid_empresa;

    [FieldName('data_cadastro')]
    [FieldOptions([foInsert, foSelect])]
    property data_cadastro: TDateTime read Fdata_cadastro write Fdata_cadastro;

    [FieldName('data_alteracao')]
    [FieldOptions([foUpdate])]
    property data_alteracao: TDateTime read Fdata_alteracao write Fdata_alteracao;

    [FieldName('data_exclusao')]
    [FieldOptions([foSelect])]
    property data_exclusao: TDate read Fdata_exclusao write Fdata_exclusao;

    [FieldName('excluido')]
    [FieldOptions([foInsert, foSelect])]
    property excluido: Integer read Fexcluido write Fexcluido;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert, foSelect])]
    property id_usuario: Integer read Fid_usuario write Fid_usuario;

    [FieldName('id_usuario_alt')]
    [FieldOptions([foUpdate])]
    property id_usuario_alt: Integer read Fid_usuario_alt write Fid_usuario_alt;

    [FieldName('id_usuario_exc')]
    [FieldOptions([foSelect])]
    property id_usuario_exc: Integer read Fid_usuario_exc write Fid_usuario_exc;

  end;

implementation

end.
