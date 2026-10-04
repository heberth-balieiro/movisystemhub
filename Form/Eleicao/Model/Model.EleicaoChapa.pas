unit Model.EleicaoChapa;

interface

Uses
  System.SysUtils, System.Classes, uAtributosRTTI;

Type
  TModelEleicaoChapaHomologacao = Class
    Private
    Fid_usuario_homol: integer;
    Fid: integer;
    Fdata_homologacao: Tdate;
    Fidempresa: integer;
    Fmotivo_indeferimento: string;
    Fid_usuario_defe: integer;
    Fdata_indeferimento: Tdate;
    Fsinc_app: string;

    Public
      property id                 :integer  read Fid                  write Fid;
      property data_homologacao   :Tdate    read Fdata_homologacao    write Fdata_homologacao;
      property id_usuario_homol   :integer  read Fid_usuario_homol    write Fid_usuario_homol;
      property idempresa          :integer  read Fidempresa           write Fidempresa;
      property id_usuario_defe    :integer  read Fid_usuario_defe     write Fid_usuario_defe;
      property motivo_indeferimento      :string   read Fmotivo_indeferimento     write Fmotivo_indeferimento;
      property data_indeferimento         :Tdate    read Fdata_indeferimento        write Fdata_indeferimento;
      property sinc_app      :string   read Fsinc_app     write Fsinc_app;
  End;

Type
  [TableName('eleicao_comissao')]
  TModelEleicaoComissao = class
    Private
    Fobs: string;
    Femail: string;
    Fativo: string;
    Fdata_cadastro: Tdate;
    Fcpf: string;
    Fsinc_app: string;
    Fid_comissao: integer;
    Fid_empresa: integer;
    Fcargo: string;
    Fnome: string;
    Fid_eleicao: integer;
    Fid_usuario: integer;
    Ftelefone: string;

    Public
      [FieldName('id_comissao', True)]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property id_comissao      :integer  read Fid_comissao     write Fid_comissao;

      [FieldName('id_eleicao')]
      [FieldOptions([foInsert, foSelect])]
      property id_eleicao       :integer  read Fid_eleicao      write Fid_eleicao;

      [FieldName('id_empresa')]
      [FieldOptions([foInsert, foSelect])]
      property id_empresa       :integer  read Fid_empresa      write Fid_empresa;

      [FieldName('nome')]
      [FieldOptions([foInsert,foUpdate, foSelect])]
      property nome         :string   read Fnome        write Fnome;

      [FieldName('cpf')]
      [FieldOptions([foInsert,foUpdate, foSelect])]
      property cpf         :string   read Fcpf        write Fcpf;

      [FieldName('telefone')]
      [FieldOptions([foInsert,foUpdate, foSelect])]
      property telefone         :string   read Ftelefone        write Ftelefone;

      [FieldName('email')]
      [FieldOptions([foInsert,foUpdate, foSelect])]
      property email         :string   read Femail        write Femail;

      [FieldName('cargo')]
      [FieldOptions([foInsert,foUpdate, foSelect])]
      property cargo         :string   read Fcargo        write Fcargo;

      [FieldName('ativo')]
      [FieldOptions([foInsert,foUpdate, foSelect])]
      property ativo         :string   read Fativo        write Fativo;

      [FieldName('observacao')]
      [FieldOptions([foInsert,foUpdate, foSelect])]
      property obs         :string   read Fobs        write Fobs;

      [FieldName('data_cadastro ')]
      [FieldOptions([foInsert, foSelect])]
      property data_cadastro          :Tdate    read Fdata_cadastro         write Fdata_cadastro ;

      [FieldName('id_usuario')]
      [FieldOptions([foInsert, foSelect])]
      property id_usuario    :integer  read Fid_usuario   write Fid_usuario;

      [FieldName('sinc_app ')]
      [FieldOptions([foInsert,foUpdate, foSelect])]
      property sinc_app          :string   read Fsinc_app        write Fsinc_app;



  end;

Type
  [TableName('eleicao_chapa')]
  TModelEleicaoChapa = Class

  Private
    Fidempresa: integer;
    Fobs: string;
    Fnome_chapa: string;
    Fmotivo_indeferimento: string;
    Fativo: string;
    Frepresentante_chapa: string;
    Fcodigo: integer;
    Frepres_telefone: string;
    Fid: integer;
    Fnum_chapa: integer;
    Fdata_criacao: Tdate;
    Frepres_email: string;
    Fsinc_app: string;
    Fsituacao: string;
    Fslogan: string;
    Fdata_indeferimento: Tdate;
    Fid_eleicao: integer;
    Fid_usuario_alt: integer;
    Fid_usuario: integer;
    Fdata_homologacao: Tdate;

  public

    [FieldName('id', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id      :integer  read Fid     write Fid;

    [FieldName('codigo')]
    [FieldOptions([foInsert, foSelect])]
    property codigo       :integer  read Fcodigo      write Fcodigo;

    [FieldName('id_eleicao')]
    [FieldOptions([foInsert, foSelect])]
    property id_eleicao   :integer  read Fid_eleicao      write Fid_eleicao;

    [FieldName('situacao')]
    [FieldOptions([foInsert,foUpdate, foSelect])]
    property situacao         :string   read Fsituacao        write Fsituacao;

    [FieldName('num_chapa')]
    [FieldOptions([foInsert,foUpdate, foSelect])]
    property num_chapa       :integer  read Fnum_chapa      write Fnum_chapa;

    [FieldName('nome_chapa')]
    [FieldOptions([foInsert,foUpdate, foSelect])]
    property nome_chapa         :string   read Fnome_chapa        write Fnome_chapa;

    [FieldName('data_criacao')]
    [FieldOptions([foInsert, foSelect])]
    property data_criacao         :Tdate    read Fdata_criacao        write Fdata_criacao;

    [FieldName('slogan')]
    [FieldOptions([foInsert,foUpdate, foSelect])]
    property slogan      :string   read Fslogan     write Fslogan;

    [FieldName('representante_chapa')]
    [FieldOptions([foInsert,foUpdate, foSelect])]
    property representante_chapa      :string   read Frepresentante_chapa     write Frepresentante_chapa;

    [FieldName('repres_telefone')]
    [FieldOptions([foInsert,foUpdate, foSelect])]
    property repres_telefone      :string   read Frepres_telefone     write Frepres_telefone;

    [FieldName('repres_email')]
    [FieldOptions([foInsert,foUpdate, foSelect])]
    property repres_email      :string   read Frepres_email     write Frepres_email;

    [FieldName('data_homologacao')]
    [FieldOptions([foSelect])]
    property data_homologacao   :Tdate    read Fdata_homologacao    write Fdata_homologacao;

    [FieldName('data_indeferimento')]
    [FieldOptions([foSelect])]
    property data_indeferimento         :Tdate    read Fdata_indeferimento        write Fdata_indeferimento;

    [FieldName('motivo_indeferimento')]
    [FieldOptions([foSelect])]
    property motivo_indeferimento      :string   read Fmotivo_indeferimento     write Fmotivo_indeferimento;

    [FieldName('obs')]
    [FieldOptions([foInsert,foUpdate, foSelect])]
    property obs    :string   read Fobs   write Fobs;

    [FieldName('ativo')]
    [FieldOptions([foInsert,foUpdate, foSelect])]
    property ativo      :string   read Fativo     write Fativo;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert, foSelect])]
    property id_usuario    :integer  read Fid_usuario   write Fid_usuario;

    [FieldName('id_usuario_alt')]
    [FieldOptions([foupdate, foSelect])]
    property id_usuario_alt    :integer  read Fid_usuario_alt   write Fid_usuario_alt;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert, foSelect])]
    property idempresa    :integer  read Fidempresa   write Fidempresa;

    [FieldName('sinc_app')]
    [FieldOptions([foUpdate, foSelect])]
    property sinc_app      :string   read Fsinc_app     write Fsinc_app;

  End;



implementation

end.
