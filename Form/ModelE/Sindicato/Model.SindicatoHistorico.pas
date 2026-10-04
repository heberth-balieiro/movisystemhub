unit Model.SindicatoHistorico;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('associado_historico')]
  TSindicatoHistorico = class
  private
    Fid_secretaria_nova: Integer;
    Fid_secretaria_anterior: Integer;
    Fid_profissao_nova: Integer;
    Fid_profissao_anterior: Integer;
    Fobservacao: String;
    Fid_historico: Integer;
    Fdata_filiacao: TDateTime;
    Fid_associado: Integer;
    Fid_lotacao_nova: Integer;
    Fid_lotacao_anterior: Integer;
    Fid_motivo: Integer;
    Fdocumento_protocolo: String;
    Fbloqueou_desconto: String;
    Fdata_criacao: TDateTime;
    Finativar_carteira: String;
    Fsituacao_nova: String;
    Fsituacao_anterior: String;
    Fid_empresa: Integer;
    Finativar_cadastro: String;
    Fid_empresa_nova: Integer;
    Fid_empresa_anterior: Integer;
    Fdata_desfiliacao: TDateTime;
    Fmatricula_nova: Integer;
    Fmatricula_anterior: Integer;
    Fid_usuario: Integer;
    Fmotivo: String;
    Fusuario: String;
    Ftipo: String;
    Fcor: String;

  public
    [FieldName('id_historico', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_historico: Integer read Fid_historico write Fid_historico;

    [FieldName('id_associado')]
    [FieldOptions([foInsert, foSelect])]
    property id_associado: Integer read Fid_associado write Fid_associado;

    [FieldName('data_filiacao')]
    [FieldOptions([foInsert,foSelect])]
    property data_filiacao: TDateTime read Fdata_filiacao write Fdata_filiacao;

    [FieldName('data_desfiliacao')]
    [FieldOptions([foInsert,foSelect])]
    property data_desfiliacao: TDateTime read Fdata_desfiliacao write Fdata_desfiliacao;

    [FieldName('situacao_anterior')]
    [FieldOptions([foInsert, foSelect])]
    property situacao_anterior: String read Fsituacao_anterior write Fsituacao_anterior;

    [FieldName('situacao_nova')]
    [FieldOptions([foInsert,foSelect])]
    property situacao_nova: String read Fsituacao_nova write Fsituacao_nova;

    [FieldName('id_motivo')]
    [FieldOptions([foInsert,foSelect])]
    property id_motivo: Integer read Fid_motivo write Fid_motivo;

    [FieldName('observacao')]
    [FieldOptions([foInsert,foSelect])]
    property observacao: String read Fobservacao write Fobservacao;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert,foSelect])]
    property id_usuario: Integer read Fid_usuario write Fid_usuario;

    [FieldName('documento_protocolo')]
    [FieldOptions([foInsert,foSelect])]
    property documento_protocolo: String read Fdocumento_protocolo write Fdocumento_protocolo;

    [FieldName('id_empresa_anterior')]
    [FieldOptions([foInsert,foSelect])]
    property id_empresa_anterior: Integer read Fid_empresa_anterior write Fid_empresa_anterior;

    [FieldName('id_empresa_nova')]
    [FieldOptions([foInsert, foSelect])]
    property id_empresa_nova: Integer read Fid_empresa_nova write Fid_empresa_nova;

    [FieldName('id_secretaria_anterior')]
    [FieldOptions([foInsert, foSelect])]
    property id_secretaria_anterior: Integer read Fid_secretaria_anterior write Fid_secretaria_anterior;

    [FieldName('id_secretaria_nova')]
    [FieldOptions([foInsert, foSelect])]
    property id_secretaria_nova: Integer read Fid_secretaria_nova write Fid_secretaria_nova;

    [FieldName('id_lotacao_anterior')]
    [FieldOptions([foInsert, foSelect])]
    property id_lotacao_anterior: Integer read Fid_lotacao_anterior write Fid_lotacao_anterior;

    [FieldName('id_lotacao_nova')]
    [FieldOptions([foInsert, foSelect])]
    property id_lotacao_nova: Integer read Fid_lotacao_nova write Fid_lotacao_nova;

    [FieldName('id_profissao_anterior')]
    [FieldOptions([foInsert, foSelect])]
    property id_profissao_anterior: Integer read Fid_profissao_anterior write Fid_profissao_anterior;

    [FieldName('id_profissao_nova')]
    [FieldOptions([foInsert, foSelect])]
    property id_profissao_nova: Integer read Fid_profissao_nova write Fid_profissao_nova;

    [FieldName('matricula_anterior')]
    [FieldOptions([foInsert, foSelect])]
    property matricula_anterior: Integer read Fmatricula_anterior write Fmatricula_anterior;

    [FieldName('matricula_nova')]
    [FieldOptions([foInsert, foSelect])]
    property matricula_nova: Integer read Fmatricula_nova write Fmatricula_nova;

    [FieldName('bloqueou_desconto')]
    [FieldOptions([foInsert, foSelect])]
    property bloqueou_desconto: String read Fbloqueou_desconto write Fbloqueou_desconto;

    [FieldName('inativar_cadastro')]
    [FieldOptions([foInsert, foSelect])]
    property inativar_cadastro: String read Finativar_cadastro write Finativar_cadastro;

    [FieldName('inativar_carteira')]
    [FieldOptions([foInsert, foSelect])]
    property inativar_carteira: String read Finativar_carteira write Finativar_carteira;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert, foSelect])]
    property id_empresa: Integer read Fid_empresa write Fid_empresa;

    [FieldName('data_criacao')]
    [FieldOptions([foInsert, foSelect])]
    property data_criacao: TDateTime read Fdata_criacao write Fdata_criacao;

    [FieldName('tipo')]
    [FieldOptions([foInsert,foSelect])]
    property tipo: String read Ftipo write Ftipo;
    // Cadatro de associado, Desfiliação, refiliação, Atualização de Dados, Emissão de declaração

    [FieldName('cor')]
    [FieldOptions([foInsert,foSelect])]
    property cor: String read Fcor write Fcor;





    [FieldName('usuario')]
    [FieldOptions([foSelect])]
    [Editable(false)]
    property usuario: String read Fusuario write Fusuario;

    [FieldName('motivo')]
    [FieldOptions([foSelect])]
    [Editable(false)]
    property motivo: String read Fmotivo write Fmotivo;

  end;

implementation

end.
