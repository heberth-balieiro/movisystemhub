unit Model.Sincronizar;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

  type
  [TableName('sincronizar')]
  TSincronizar = class
  private
    Fid_registro: Integer;
    Fdescricao: string;
    Ftabela: string;
    Fnsituacao: string;
    Fcod_tabela: Integer;
    Fid_sincronizar: Integer;

  public
    [FieldName('id_sincronizar', True)]
    [FieldOptions([foSelect])]
    property id_sincronizar: Integer read Fid_sincronizar write Fid_sincronizar;
    [FieldName('cod_tabela')]
    [FieldOptions([foSelect])]
    property cod_tabela: Integer read Fcod_tabela write Fcod_tabela;
    [FieldName('id_registro')]
    [FieldOptions([foSelect])]
    property id_registro: Integer read Fid_registro write Fid_registro;
    [FieldName('nsituacao')]
    [FieldOptions([foSelect])]
    property nsituacao: string read Fnsituacao write Fnsituacao;

    [FieldName('tabela')]
    [FieldOptions([foSelect])]
    property tabela: string read Ftabela write Ftabela;

    [FieldName('descricao')]
    [FieldOptions([foSelect])]
    property descricao: string read Fdescricao write Fdescricao;

  end;

implementation

end.
