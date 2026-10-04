unit Model.Receber.PlanoContas;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('receber_plano_contas')]
  TReceberPlano = class
  private
    Fid_custo: Integer;
    Fvalor: Double;
    Fid_receber: Integer;
    Fid_receber_plano: Integer;
    Fid_plano: Integer;
    Fid_empresa: Integer;
    Fid_usuario: Integer;
  public

    [FieldName('id_receber_plano', True)]
    property id_receber_plano: Integer read Fid_receber_plano write Fid_receber_plano;

    [FieldName('id_receber')]
    [FieldOptions([foInsert, foSelect])]
    property id_receber: Integer read Fid_receber write Fid_receber;

    [FieldName('id_plano')]
    [FieldOptions([foInsert, foSelect])]
    property id_plano: Integer read Fid_plano write Fid_plano;

    [FieldName('id_custo')]
    [FieldOptions([foInsert, foSelect])]
    property id_custo: Integer read Fid_custo write Fid_custo;

    [FieldName('valor')]
    [FieldOptions([foInsert, foSelect])]
    property valor: Double read Fvalor write Fvalor;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert, foSelect])]
    property id_empresa: Integer read Fid_empresa write Fid_empresa;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert, foSelect])]
    property id_usuario: Integer read Fid_usuario write Fid_usuario;

  end;

implementation

end.
