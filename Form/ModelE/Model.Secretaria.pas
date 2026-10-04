unit Model.Secretaria;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('secretaria')]
  TSecretaria = class
  private
    Fid_secretaria: Integer;
    Fcodigo: Integer;
    Frazao: string;
    Ffantasia: string;
    Fativo: string;
    Fid_empresa: Integer;
    Fid_usuario: Integer;
    Fsinc_app: string;
    Fexcluido: Integer;
    Fdata_exc: TDate;
    Fid_usuario_exc: Integer;

  public
    [FieldName('id_secretaria', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_secretaria: Integer read Fid_secretaria write Fid_secretaria;

    [FieldName('codigo')]
    [FieldOptions([foInsert, foSelect])]
    property codigo: Integer read Fcodigo write Fcodigo;

    [FieldName('razao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property razao: string read Frazao write Frazao;

    [FieldName('fantasia')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property fantasia: string read Ffantasia write Ffantasia;

    [FieldName('ativo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property ativo: string read Fativo write Fativo;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert])]
    property id_empresa: Integer read Fid_empresa write Fid_empresa;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert])]
    property id_usuario: Integer read Fid_usuario write Fid_usuario;

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
