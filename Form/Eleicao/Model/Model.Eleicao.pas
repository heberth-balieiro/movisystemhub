unit Model.Eleicao;

interface

Uses
  System.SysUtils, System.Classes, uAtributosRTTI;

Type
  [TableName('eleicao')]
  TModelEleicao = Class

  Private
    Fdescricao: string;
    Fcodigo: integer;
    Fativo: String;
    Fid_responsavel: Integer;
    Fdata_cad: Tdate;
    Fano: integer;
    Fsituacao: String;
    Fsinc_app: String;
    Fid_empresa: integer;
    Fnome: string;
    Ftipo: String;
    Fid_eleicao: integer;
    Fano_fim: integer;
    Fnexercicio: String;
    Fdata: Tdate;
    Fid_sede: integer;
    Foperacao: string;

  public
    
    [FieldName('id_eleicao', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_eleicao      :integer  read Fid_eleicao     write Fid_eleicao;

    [FieldName('codigo')]
    [FieldOptions([foInsert, foSelect])]
    property codigo         :integer  read Fcodigo        write Fcodigo;

    [FieldName('nome')]
    [FieldOptions([foInsert,foUpdate, foSelect])]
    property nome           :string   read Fnome          write Fnome;

    [FieldName('descricao')]
    [FieldOptions([foInsert,foUpdate, foSelect])]
    property descricao      :string   read Fdescricao     write Fdescricao;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert, foSelect])]
    property id_empresa      :integer  read Fid_empresa     write Fid_empresa;

    [FieldName('id_sede')]
    [FieldOptions([foInsert,foUpdate, foSelect])]
    property id_sede      :integer  read Fid_sede     write Fid_sede;

    [FieldName('ano')]
    [FieldOptions([foInsert,foUpdate, foSelect])]
    property ano            :integer  read Fano           write Fano;

    [FieldName('ano_fim')]
    [FieldOptions([foInsert,foUpdate, foSelect])]
    property ano_fim            :integer  read Fano_fim           write Fano_fim;

    [FieldName('data_cad')]
    [FieldOptions([foInsert, foSelect])]
    property data_cad           :Tdate    read Fdata_cad          write Fdata_cad;

    [FieldName('ativo')]
    [FieldOptions([foInsert,foUpdate, foSelect])]
    property ativo        :String   read Fativo       write Fativo;

    [FieldName('tipo')]
    [FieldOptions([foInsert,foUpdate, foSelect])]
    property tipo           :String   read Ftipo          write Ftipo;

    [FieldName('sinc_app')]
    [FieldOptions([foInsert,foUpdate, foSelect])]
    property sinc_app           :String   read Fsinc_app          write Fsinc_app;
    
    [FieldName('id_responsavel')]
    [FieldOptions([foInsert,foUpdate, foSelect])]
    property id_responsavel           :Integer   read Fid_responsavel          write Fid_responsavel;

    [FieldName('situacao')]
    [FieldOptions([foInsert,foUpdate, foSelect])]
    property situacao           :String   read Fsituacao          write Fsituacao;

    [FieldName('nexercicio')]
    [Editable(false)]
    [FieldOptions([foSelect])]
    property nexercicio           :String   read Fnexercicio          write Fnexercicio;

    [FieldName('data')]
    [FieldOptions([foInsert,foUpdate, foSelect])]
    property data           :Tdate    read Fdata          write Fdata;

    [FieldName('operacao')]
    [FieldOptions([foInsert,foUpdate, foSelect])]
    property operacao   :string   read Foperacao      write Foperacao;

  End;

implementation



end.
