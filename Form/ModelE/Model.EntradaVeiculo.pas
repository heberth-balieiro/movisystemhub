unit Model.EntradaVeiculo;

interface

uses
  System.SysUtils, uAtributosRTTI;

type
  [TableName('compra')]
  TEntradaVeiculo = class
  private
    Fid_compra: Integer;
    Fid_empresa: Integer;
    Fid_usuario: Integer;
    Fnumero: Integer;
    Fdata: TDate;
    Fhora: TTime;
    Ftipo: string;
    Fid_pessoa: Integer;
    Fid_responsavel: Integer;
    Fobs: string;
    Fsituacao: string;
    Fgerar_financeiro: string;
    Fgerar_estoque: string;
    Fdata_criado: TDateTime;
    Fnmpessoa: string;
    Fnmresponsavel: string;
    Ftotal: string;
    Fdata_cancelado: TDateTime;
    Fid_usuario_cancelado: Integer;
    Fvlr_subtotal: double;
    Fvlr_troca: double;
    Fvlr_total: double;
    Fvlr_desconto: double;

  public
    [FieldName('id_compra', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property Id_compra: Integer read Fid_compra write Fid_compra;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert])]
    property Id_empresa: Integer read Fid_empresa write Fid_empresa;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert])]
    property Id_usuario: Integer read Fid_usuario write Fid_usuario;

    [FieldName('numero')]
    [FieldOptions([foInsert,foSelect])]
    property Numero: Integer read Fnumero write Fnumero;

    [FieldName('data')]
    [FieldOptions([foInsert, foUpdate,foSelect])]
    property Data: TDate read Fdata write Fdata;

    [FieldName('hora')]
    [FieldOptions([foInsert, foUpdate,foSelect])]
    property Hora: TTime read Fhora write Fhora;

    [FieldName('tipo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property Tipo: string read Ftipo write Ftipo;

    [FieldName('id_pessoa')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property Id_pessoa: Integer read Fid_pessoa write Fid_pessoa;

    [FieldName('id_responsavel')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property Id_responsavel: Integer read Fid_responsavel write Fid_responsavel;

    [FieldName('obs')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property Obs: string read Fobs write Fobs;

    [FieldName('situacao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property Situacao: string read Fsituacao write Fsituacao;

    [FieldName('gerar_financeiro')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property Gerar_financeiro: string read Fgerar_financeiro write Fgerar_financeiro;

    [FieldName('gerar_estoque')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property Gerar_estoque: string read Fgerar_estoque write Fgerar_estoque;

    [FieldName('data_criado')]
    [FieldOptions([foInsert])]
    property Data_criado: TDateTime read Fdata_criado write Fdata_criado;

    //Campos relacao
    [FieldName('nmpessoa')]
    [FieldOptions([foSelect])]
    //[Editable(False)]
    property nmpessoa: string read Fnmpessoa write Fnmpessoa;

    [FieldName('nmresponsavel')]
    [FieldOptions([foSelect])]
    //[Editable(False)]
    property nmresponsavel: string read Fnmresponsavel write Fnmresponsavel;

    [FieldName('total')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property total: string read Ftotal write Ftotal;

    [FieldName('id_usuario_cancelado')]
    [FieldOptions([foUpdate])]
    //[Editable(False)]
    property id_usuario_cancelado: Integer read Fid_usuario_cancelado write Fid_usuario_cancelado;

    [FieldName('data_cancelado')]
    [FieldOptions([foUpdate])]
    //[Editable(False)]
    property data_cancelado: TDateTime read Fdata_cancelado write Fdata_cancelado;

    [FieldName('vlr_troca')]
    [FieldOptions([foUpdate])]
    property vlr_troca: double  read  Fvlr_troca  write Fvlr_troca;

    [FieldName('vlr_subtotal')]
    [FieldOptions([foUpdate])]
    property vlr_subtotal: double  read  Fvlr_subtotal  write Fvlr_subtotal;

    [FieldName('vlr_total')]
    [FieldOptions([foSelect,foUpdate])]
    property vlr_total: double  read  Fvlr_total  write Fvlr_total;

    [FieldName('vlr_desconto')]
    [FieldOptions([foUpdate])]
    property vlr_desconto: double  read  Fvlr_desconto  write Fvlr_desconto;

  end;

implementation

end.

