unit Model.HistoricoEquipamento;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('historico_equipamento')]
  THistoricoEquipamento = class

    private
    Fobservacao: String;
    Fid_produto: Integer;
    Fid_historico: Integer;
    Fid_tecnico: Integer;
    Fstatus_equipamento: String;
    Fdescricao: String;
    Ftipo_evento: String;
    Fdata_evento: TDate;
    Fid_cliente: Integer;
    Fid_ordem_servico: Integer;
    Fid_usuario: Integer;


    public
      {$REGION 'Historico'}

        [FieldName('id_historico', True)]
        [FieldOptions([foInsert, foUpdate, foSelect])]
        property id_historico: Integer read Fid_historico write Fid_historico;

        [FieldName('id_produto')]
        [FieldOptions([foInsert, foSelect])]
        property id_produto: Integer read Fid_produto write Fid_produto;

        [FieldName('data_evento')]
        [FieldOptions([foInsert, foUpdate, foSelect])]
        property data_evento: TDate read Fdata_evento write Fdata_evento;

        [FieldName('tipo_evento')]  //Ex: OS_ABERTA, ORCAMENTO_REALIZADO, OS_CONCLUIDA
        [FieldOptions([foInsert, foUpdate, foSelect])]
        property tipo_evento: String read Ftipo_evento write Ftipo_evento;

        [FieldName('descricao')]   //-- Texto descritivo do que ocorreu
        [FieldOptions([foInsert, foUpdate, foSelect])]
        property descricao: String read Fdescricao write Fdescricao;

        [FieldName('id_usuario')]
        [FieldOptions([foInsert, foSelect])]
        property id_usuario: Integer read Fid_usuario write Fid_usuario;

        [FieldName('id_ordem_servico')]
        [FieldOptions([foInsert, foSelect])]
        property id_ordem_servico: Integer read Fid_ordem_servico write Fid_ordem_servico;

        [FieldName('observacao')]
        [FieldOptions([foInsert, foUpdate, foSelect])]
        property observacao: String read Fobservacao write Fobservacao;

        [FieldName('status_equipamento')] //Status atual após evento (ex: Em Manutenção)
        [FieldOptions([foInsert, foUpdate, foSelect])]
        property status_equipamento: String read Fstatus_equipamento write Fstatus_equipamento;


        [FieldName('id_cliente')]
        [FieldOptions([foInsert, foSelect])]
        property id_cliente: Integer read Fid_cliente write Fid_cliente;

        [FieldName('id_tecnico')]
        [FieldOptions([foInsert, foUpdate, foSelect])]
        property id_tecnico: Integer read Fid_tecnico write Fid_tecnico;



      {$ENDREGION}

  end;
implementation

end.
