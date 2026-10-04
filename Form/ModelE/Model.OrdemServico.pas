{
Status_equipamento

Cadastrado ➝ Recebido ➝ Em Avaliação Técnica ➝ Orçamento Realizado ➝
Aguardando Aprovação ➝ Aprovado para Reparo ➝ Em Manutenção ➝
Montado/Testado ➝ Pronto para Entrega ➝ Entregue ao Cliente




}

unit Model.OrdemServico;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('ordem_servico')]
  TOrdemServico = class

  private
    Fos_numero: Integer;
    Fos_status: String;
    Fos_garantia_final: Tdate;
    Fos_tipo: String;
    Fos_data: Tdate;
    Fos_previsao: Tdate;
    Fos_prioridade: String;
    Fos_obs: String;
    Fos_garantia: String;
    Fos_hora: Ttime;
    Fid_empresa: Integer;
    Fos_id_tecnico: Integer;
    Fid_usuario: Integer;
    Fos_id_cliente: Integer;
    Fid_os: Integer;

  public
    {$REGION 'OrdemServico'}

      [FieldName('id_os', True)]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property id_os: Integer read Fid_os write Fid_os;

      [FieldName('os_numero')]
      [FieldOptions([foInsert, foSelect])]
      property os_numero: Integer read Fos_numero write Fos_numero;

      [FieldName('os_data')]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property os_data: Tdate read Fos_data write Fos_data;

      [FieldName('os_hora')]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property os_hora: Ttime read Fos_hora write Fos_hora;

      [FieldName('os_status')]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property os_status: String read Fos_status write Fos_status;

      [FieldName('os_prioridade')]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property os_prioridade: String read Fos_prioridade write Fos_prioridade;

      [FieldName('os_garantia')]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property os_garantia: String read Fos_garantia write Fos_garantia;

      [FieldName('os_tipo')]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property os_tipo: String read Fos_tipo write Fos_tipo;

      [FieldName('os_id_cliente')]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property os_id_cliente: Integer read Fos_id_cliente write Fos_id_cliente;

      [FieldName('os_id_tecnico')]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property os_id_tecnico: Integer read Fos_id_tecnico write Fos_id_tecnico;

      [FieldName('os_obs')]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property os_obs: String read Fos_obs write Fos_obs;

      [FieldName('os_previsao')]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property os_previsao: Tdate read Fos_previsao write Fos_previsao;

      [FieldName('os_garantia_final')]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property os_garantia_final: Tdate read Fos_garantia_final write Fos_garantia_final;

      [FieldName('id_empresa')]
      [FieldOptions([foInsert, foSelect])]
      property id_empresa: Integer read Fid_empresa write Fid_empresa;

      [FieldName('id_usuario')]
      [FieldOptions([foInsert, foSelect])]
      property id_usuario: Integer read Fid_usuario write Fid_usuario;

    {$ENDREGION}
  end;

type
  [TableName('ordem_servico_equipamento')]
  TOrdemServicoEquipamento = class

    private
    Fid_produto: Integer;
    Fdefeito_reclamado: String;
    Fid: Integer;
    Fid_empresa: Integer;
    Fid_usuario: Integer;
    Festado: String;
    Fid_ordem: Integer;

    public
      {$REGION 'Equipamento'}
        [FieldName('id', True)]
        [FieldOptions([foInsert, foUpdate, foSelect])]
        property id: Integer read Fid write Fid;

        [FieldName('id_ordem')]
        [FieldOptions([foInsert, foSelect])]
        property id_ordem: Integer read Fid_ordem write Fid_ordem;

        [FieldName('id_produto')]
        [FieldOptions([foInsert,foUpdate, foSelect])]
        property id_produto: Integer read Fid_produto write Fid_produto;

        [FieldName('estado')]
        [FieldOptions([foInsert, foUpdate, foSelect])]
        property estado: String read Festado write Festado;

        [FieldName('defeito_reclamado')]
        [FieldOptions([foInsert, foUpdate, foSelect])]
        property defeito_reclamado: String read Fdefeito_reclamado write Fdefeito_reclamado;

        [FieldName('id_usuario')]
        [FieldOptions([foInsert, foSelect])]
        property id_usuario: Integer read Fid_usuario write Fid_usuario;

        [FieldName('id_empresa')]
        [FieldOptions([foInsert, foSelect])]
        property id_empresa: Integer read Fid_empresa write Fid_empresa;

      {$ENDREGION}
  end;


type
  [TableName('ordem_servico_foto')]
  TOrdemServicoFoto = class

    private
    Fcaminho: String;
    Fid_produto: Integer;
    Fid: Integer;
    Fanexo: String;
    Fid_empresa: Integer;
    Fext: String;
    Fid_usuario: Integer;
    Fid_ordem: Integer;

    public
      {$REGION 'Foto'}
        [FieldName('id', True)]
        [FieldOptions([foInsert, foUpdate, foSelect])]
        property id: Integer read Fid write Fid;

        [FieldName('id_ordem')]
        [FieldOptions([foInsert, foSelect])]
        property id_ordem: Integer read Fid_ordem write Fid_ordem;

        [FieldName('id_produto')]
        [FieldOptions([foInsert, foSelect])]
        property id_produto: Integer read Fid_produto write Fid_produto;

        [FieldName('anexo')]
        [FieldOptions([foInsert, foSelect])]
        property anexo: String read Fanexo write Fanexo;

        [FieldName('caminho')]
        [FieldOptions([foInsert, foSelect])]
        property caminho: String read Fcaminho write Fcaminho;

        [FieldName('ext')]
        [FieldOptions([foInsert, foSelect])]
        property ext: String read Fext write Fext;

        [FieldName('id_usuario')]
        [FieldOptions([foInsert, foSelect])]
        property id_usuario: Integer read Fid_usuario write Fid_usuario;

        [FieldName('id_empresa')]
        [FieldOptions([foInsert, foSelect])]
        property id_empresa: Integer read Fid_empresa write Fid_empresa;

      {$ENDREGION}
  end;


implementation

end.
