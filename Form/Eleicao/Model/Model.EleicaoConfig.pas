unit Model.EleicaoConfig;

interface

Uses
  System.SysUtils, System.Classes, uAtributosRTTI;

Type
  [TableName('eleicao_configuracao')]
  TModelEleicaoConfig = Class
    Private
    Fdata_alteracao: Tdate;
    FidEmpresa: Integer;
    FExigeAssociadoAtivo: string;
    Fexige_tempo_minimo: string;
    FIdEleicao: Integer;
    Fidusuario: integer;
    FBloqueiaPendenciaFinanceira: string;
    FSituacaoInicial: string;
    fidusuarioalt: integer;
    Fgerar_eleitores_aptos: string;
    FExigeAssociadoAdimplente: string;
    FPublicacaoAutomatica: string;
    FIdConfig: Integer;
    FBloqueiaAssociadoSuspenso: string;
    FTempoMinimoFiliacao: Integer;
    FExigeHomologacaoFinal: string;
    FEmail: string;
    FSlug: string;
    FCorPrimaria: string;
    FCorSecundaria: string;
    FUrlInstagram: string;
    FUrlPublica: string;
    FUrlFacebook: string;
    FMensagemBoasVindas: string;
    FLogo: string;
    FNomeExibicao: string;
    FBanner: string;
    FUrlYoutube: string;
    FTelefone: string;
    Fpagina_publicar: string;
    Fsinc_app: string;
    Fdata_hora_inicio: Tdatetime;
    Fdata_hora_fim: Tdatetime;
    Fquorum_base: string;
    Fquorum_minimo: Integer;
    Fexigir_presenca_votacao: string;
    Ftipo_quorum: string;
    Fvotacao_secreta: string;
    Fquorum_percentual: Double;
    Fencerramento_automatico: string;
    Fabertura_automatica: string;
    Fexibir_resultado_parcial: string;
    Fcontrolar_quorum: string;
    Fpublicacao_resultado: string;
    Fcontrolar_presenca: string;

    Public

    [FieldName('id', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property IdConfig: Integer read FIdConfig write FIdConfig;

    [FieldName('id_eleicao')]
    [FieldOptions([foInsert, foSelect])]
    property IdEleicao: Integer read FIdEleicao write FIdEleicao;

    [FieldName('situacao_inicial')]
    [FieldOptions([foInsert, foupdate, foSelect])]
    property SituacaoInicial: string read FSituacaoInicial write FSituacaoInicial;

    [FieldName('exige_homologacao_final')]
    [FieldOptions([foInsert, foupdate, foSelect])]
    property ExigeHomologacaoFinal: string read FExigeHomologacaoFinal write FExigeHomologacaoFinal;

    [FieldName('publicacao_automatica')]
    [FieldOptions([foInsert, foupdate, foSelect])]
    property PublicacaoAutomatica: string read FPublicacaoAutomatica write FPublicacaoAutomatica;

    [FieldName('exige_associado_ativo')]
    [FieldOptions([foInsert, foupdate, foSelect])]
    property ExigeAssociadoAtivo: string read FExigeAssociadoAtivo write FExigeAssociadoAtivo;

    [FieldName('exige_associado_adimplente')]
    [FieldOptions([foInsert, foupdate, foSelect])]
    property ExigeAssociadoAdimplente: string read FExigeAssociadoAdimplente write FExigeAssociadoAdimplente;

    [FieldName('exige_tempo_minimo')]
    [FieldOptions([foInsert, foupdate, foSelect])]
    property exige_tempo_minimo: string read Fexige_tempo_minimo write Fexige_tempo_minimo;

    [FieldName('tempo_minimo_filiacao')]
    [FieldOptions([foInsert, foupdate, foSelect])]
    property TempoMinimoFiliacao: Integer read FTempoMinimoFiliacao write FTempoMinimoFiliacao;

    [FieldName('bloqueia_pendencia_financeira')]
    [FieldOptions([foInsert, foupdate, foSelect])]
    property BloqueiaPendenciaFinanceira: string read FBloqueiaPendenciaFinanceira write FBloqueiaPendenciaFinanceira;

    [FieldName('bloqueia_associado_suspenso')]
    [FieldOptions([foInsert, foupdate, foSelect])]
    property BloqueiaAssociadoSuspenso: string read FBloqueiaAssociadoSuspenso write FBloqueiaAssociadoSuspenso;

    [FieldName('gerar_eleitores_aptos')]
    [FieldOptions([foInsert, foupdate, foSelect])]
    property gerar_eleitores_aptos : string read Fgerar_eleitores_aptos write Fgerar_eleitores_aptos;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert, foSelect])]
    property idEmpresa: Integer read FidEmpresa write FidEmpresa;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert, foSelect])]
    property idusuario: integer read Fidusuario write Fidusuario;

    [FieldName('id_usuario_alt')]
    [FieldOptions([foupdate, foSelect])]
    property idusuarioalt: integer read fidusuarioalt write Fidusuarioalt;

    [FieldName('data_alteracao')]
    [FieldOptions([foupdate, foSelect])]
    property data_alteracao: Tdate read Fdata_alteracao write Fdata_alteracao;

    [FieldName('slug')]
    [FieldOptions([foInsert, foupdate, foSelect])]
    property Slug: string read FSlug write FSlug;

    [FieldName('nome_exibicao')]
    [FieldOptions([foInsert, foupdate, foSelect])]
    property NomeExibicao: string read FNomeExibicao write FNomeExibicao;

    [FieldName('logo')]
    [FieldOptions([foInsert, foupdate, foSelect])]
    property Logo: string read FLogo write FLogo;

    [FieldName('banner')]
    [FieldOptions([foInsert, foupdate, foSelect])]
    property Banner: string read FBanner write FBanner;

    [FieldName('mensagem_boas_vindas')]
    [FieldOptions([foInsert, foupdate, foSelect])]
    property MensagemBoasVindas: string read FMensagemBoasVindas write FMensagemBoasVindas;

    [FieldName('url_publica')]
    [FieldOptions([foInsert, foupdate, foSelect])]
    property UrlPublica: string read FUrlPublica write FUrlPublica;

    [FieldName('email')]
    [FieldOptions([foInsert, foupdate, foSelect])]
    property Email: string read FEmail write FEmail;

    [FieldName('telefone')]
    [FieldOptions([foInsert, foupdate, foSelect])]
    property Telefone: string read FTelefone write FTelefone;

    [FieldName('cor_primaria')]
    [FieldOptions([foInsert, foupdate, foSelect])]
    property CorPrimaria: string read FCorPrimaria write FCorPrimaria;

    [FieldName('cor_secundaria')]
    [FieldOptions([foInsert, foupdate, foSelect])]
    property CorSecundaria: string read FCorSecundaria write FCorSecundaria;

    [FieldName('url_instagram')]
    [FieldOptions([foInsert, foupdate, foSelect])]
    property UrlInstagram: string read FUrlInstagram write FUrlInstagram;

    [FieldName('url_facebook')]
    [FieldOptions([foInsert, foupdate, foSelect])]
    property UrlFacebook: string read FUrlFacebook write FUrlFacebook;

    [FieldName('url_youtube')]
    [FieldOptions([foInsert, foupdate, foSelect])]
    property UrlYoutube: string read FUrlYoutube write FUrlYoutube;

    [FieldName('pagina_publicar')]
    [FieldOptions([foInsert, foupdate, foSelect])]
    property pagina_publicar: string read Fpagina_publicar write Fpagina_publicar;

    [FieldName('sinc_app')]
    [FieldOptions([foInsert, foupdate, foSelect])]
    property sinc_app: string read Fsinc_app write Fsinc_app;

    [FieldName('data_hora_inicio')]
    [FieldOptions([foInsert,foupdate, foSelect])]
    property data_hora_inicio: Tdatetime read Fdata_hora_inicio write Fdata_hora_inicio;

    [FieldName('data_hora_fim')]
    [FieldOptions([foInsert,foupdate, foSelect])]
    property data_hora_fim: Tdatetime read Fdata_hora_fim write Fdata_hora_fim;

    [FieldName('abertura_automatica')]
    [FieldOptions([foInsert,foupdate, foSelect])]
    property abertura_automatica: string read Fabertura_automatica write Fabertura_automatica;

    [FieldName('encerramento_automatico')]
    [FieldOptions([foInsert,foupdate, foSelect])]
    property encerramento_automatico: string read Fencerramento_automatico write Fencerramento_automatico;

    [FieldName('votacao_secreta')]
    [FieldOptions([foInsert,foupdate, foSelect])]
    property votacao_secreta: string read Fvotacao_secreta write Fvotacao_secreta;

    [FieldName('exibir_resultado_parcial')]
    [FieldOptions([foInsert,foupdate, foSelect])]
    property exibir_resultado_parcial: string read Fexibir_resultado_parcial write Fexibir_resultado_parcial;

    [FieldName('publicacao_resultado')]
    [FieldOptions([foInsert,foupdate, foSelect])]
    property publicacao_resultado: string read Fpublicacao_resultado write Fpublicacao_resultado;

    [FieldName('controlar_quorum')]
    [FieldOptions([foInsert,foupdate, foSelect])]
    property controlar_quorum: string read Fcontrolar_quorum write Fcontrolar_quorum;

    [FieldName('tipo_quorum')]
    [FieldOptions([foInsert,foupdate, foSelect])]
    property tipo_quorum: string read Ftipo_quorum write Ftipo_quorum;

    [FieldName('quorum_minimo')]
    [FieldOptions([foInsert,foupdate, foSelect])]
    property quorum_minimo: Integer read Fquorum_minimo write Fquorum_minimo;

    [FieldName('quorum_percentual')]
    [FieldOptions([foInsert,foupdate, foSelect])]
    property quorum_percentual: Double read Fquorum_percentual write Fquorum_percentual;

    [FieldName('quorum_base')]
    [FieldOptions([foInsert,foupdate, foSelect])]
    property quorum_base: string read Fquorum_base write Fquorum_base;

    [FieldName('controlar_presenca')]
    [FieldOptions([foInsert,foupdate, foSelect])]
    property controlar_presenca: string read Fcontrolar_presenca write Fcontrolar_presenca;

     [FieldName('exigir_presenca_votacao')]
    [FieldOptions([foInsert,foupdate, foSelect])]
    property exigir_presenca_votacao: string read Fexigir_presenca_votacao write Fexigir_presenca_votacao;

  End;

implementation

end.
