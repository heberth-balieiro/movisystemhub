unit Model.EleicaoEleitor;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('eleicao_eleitor')]
  TModelEleicaoEleitor = class
  private
    Fid_eleitor: Integer;
    Fid_eleicao: Integer;
    Fid_associado: Integer;
    Fsituacao: String;
    Fid_usuario_api: Integer;
    Fdata_geracao: TDateTime;
    Fid_usuario: Integer;
    Fid_empresa: Integer;
    Fobs: String;
    Ftentativas_sync: Integer;
    Fdata_ultima_tentativa: TDateTime;
    Fsinc_app: String;
    Fsocio_codigo: integer;
    Fsocio_nome: string;
    Fsocio_matricula: integer;
    Fsocio_secretaria: string;
    Fsocio_telefone: string;
    Fsincronizacao: string;

  public

    [FieldName('id_eleitor', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_eleitor: Integer read Fid_eleitor write Fid_eleitor;

    [FieldName('id_eleicao')]
    [FieldOptions([foInsert, foSelect])]
    property id_eleicao: Integer read Fid_eleicao write Fid_eleicao;

    [FieldName('id_associado')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_associado: Integer read Fid_associado write Fid_associado;

    [FieldName('situacao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property situacao: String read Fsituacao write Fsituacao;

    [FieldName('id_usuario_api')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_usuario_api: Integer read Fid_usuario_api write Fid_usuario_api;

    [FieldName('data_geracao')]
    [FieldOptions([foInsert, foSelect])]
    property data_geracao: TDateTime read Fdata_geracao write Fdata_geracao;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert, foSelect])]
    property id_usuario: Integer read Fid_usuario write Fid_usuario;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert, foSelect])]
    property id_empresa: Integer read Fid_empresa write Fid_empresa;

    [FieldName('obs')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property obs: String read Fobs write Fobs;

    [FieldName('tentativas_sync')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property tentativas_sync: Integer read Ftentativas_sync write Ftentativas_sync;

    [FieldName('data_ultima_tentativa')]
    [FieldOptions([foUpdate, foSelect])]
    property data_ultima_tentativa: TDateTime read Fdata_ultima_tentativa write Fdata_ultima_tentativa;

    [FieldName('sinc_app')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property sinc_app: String read Fsinc_app write Fsinc_app;

    //temporaria
    [FieldName('socio_codigo')]
    [FieldOptions([foSelect])]
    [Editable(false)]
    property socio_codigo: integer read Fsocio_codigo write Fsocio_codigo;

    [FieldName('socio_matricula')]
    [FieldOptions([foSelect])]
    [Editable(false)]
    property socio_matricula: integer read Fsocio_matricula write Fsocio_matricula;

    [FieldName('socio_nome')]
    [FieldOptions([foSelect])]
    [Editable(false)]
    property socio_nome: string read Fsocio_nome write Fsocio_nome;

    [FieldName('socio_secretaria')]
    [FieldOptions([foSelect])]
    [Editable(false)]
    property socio_secretaria: string read Fsocio_secretaria write Fsocio_secretaria;

    [FieldName('socio_telefone')]
    [FieldOptions([foSelect])]
    [Editable(false)]
    property socio_telefone: string read Fsocio_telefone write Fsocio_telefone;

    [FieldName('sincronizacao')]
    [FieldOptions([foSelect])]
    [Editable(false)]
    property sincronizacao: string read Fsincronizacao write Fsincronizacao;

  end;

implementation

end.
