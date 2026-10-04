unit Model.HistoricoBancario;

interface

uses
  System.SysUtils,
  System.Classes,
  uAtributosRTTI;

type
  [TableName('historico_bancario')]
  THistoricoBancario = class
  private
    Fid_custo: Integer;
    Fdata_alteracao: TDateTime;
    Fid_historico: Integer;
    Fativo: string;
    Fid_planoconta: Integer;
    Fdescricao: string;
    Fdata_cadastro: TDateTime;
    Fid_empresa: Integer;
    Fid_usuario_alt: Integer;
    Fid_usuario: Integer;
    Ftipo: Integer;
    Fntipo: string;
  published
    [FieldName('id_historico',true)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_historico: Integer read Fid_historico write Fid_historico;

    [FieldName('descricao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property descricao: string read Fdescricao write Fdescricao;

    [FieldName('tipo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property tipo: Integer read Ftipo write Ftipo;

    [FieldName('id_planoconta')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_planoconta: Integer read Fid_planoconta write Fid_planoconta;

    [FieldName('id_custo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_custo: Integer read Fid_custo write Fid_custo;

    [FieldName('ativo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property ativo: string read Fativo write Fativo;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert, foSelect])]
    property id_empresa: Integer read Fid_empresa write Fid_empresa;

    [FieldName('data_cadastro')]
    [FieldOptions([foInsert, foSelect])]
    property data_cadastro: TDateTime read Fdata_cadastro write Fdata_cadastro;

    [FieldName('data_alteracao')]
    [FieldOptions([foUpdate, foSelect])]
    property data_alteracao: TDateTime read Fdata_alteracao write Fdata_alteracao;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert, foSelect])]
    property id_usuario: Integer read Fid_usuario write Fid_usuario;

    [FieldName('id_usuario_alt')]
    [FieldOptions([foUpdate, foSelect])]
    property id_usuario_alt: Integer read Fid_usuario_alt write Fid_usuario_alt;


    [FieldName('ntipo')]
    [FieldOptions([foSelect])]
    [Editable(false)]
    property ntipo: string read Fntipo write Fntipo;

  end;

implementation

end.
