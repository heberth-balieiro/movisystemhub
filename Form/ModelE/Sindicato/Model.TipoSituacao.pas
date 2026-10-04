unit Model.TipoSituacao;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('sindicato_tipo_situacao')]
  TTipoSituacao = class
  private
    Fdata_exclusao: TDate;
    Fdata_alteracao: TDate;
    Fdescricao: String;
    Fdata_cadastro: TDate;
    Fativo: String;
    Fid_empresa: Integer;
    Fid_situacao: Integer;
    Fid_usuario_exc: Integer;
    Fexcluido: Integer;
    Fid_usuario_alt: Integer;
    Fid_usuario: Integer;

  public
    [FieldName('id_situacao', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_situacao      : Integer Read  Fid_situacao    Write Fid_situacao;

    [FieldName('descricao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property descricao        : String  Read  Fdescricao      Write Fdescricao;

    [FieldName('ativo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property ativo         : String  Read  Fativo       Write Fativo;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert, foSelect])]
    property id_empresa       : Integer Read  Fid_empresa     Write Fid_empresa;

    [FieldName('data_cadastro')]
    [FieldOptions([foInsert])]
    property data_cadastro    : TDate   Read  Fdata_cadastro  Write Fdata_cadastro;

    [FieldName('data_alteracao')]
    [FieldOptions([foUpdate])]
    property data_alteracao   : TDate   Read  Fdata_alteracao Write Fdata_alteracao;

    [FieldName('data_exclusao')]
    property data_exclusao    : TDate   Read  Fdata_exclusao  Write Fdata_exclusao;

    [FieldName('excluido')]
    [FieldOptions([foInsert, foUpdate])]
    property excluido         : Integer Read  Fexcluido       Write Fexcluido;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert])]
    property id_usuario       : Integer Read  Fid_usuario     Write Fid_usuario;

    [FieldName('id_usuario_alt')]
    [FieldOptions([foUpdate])]
    property id_usuario_alt   : Integer Read  Fid_usuario_alt Write Fid_usuario_alt;

    [FieldName('id_usuario_exc')]
    [FieldOptions([foUpdate])]
    property id_usuario_exc   : Integer Read  Fid_usuario_exc Write Fid_usuario_exc;

end;

implementation

end.
