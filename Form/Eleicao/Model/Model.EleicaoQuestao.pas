unit Model.EleicaoQuestao;

interface

Uses
  System.SysUtils, System.Classes, uAtributosRTTI;

Type
  [TableName('eleicao_questao')]
  TModelEleicaoQuestao = Class
    Private
    Fdata_alteracao: TDateTime;
    Ftitulo: string;
    Fativo: string;
    Ftipo_resposta: string;
    Fdescricao: string;
    Fdata_cadastro: TDateTime;
    Fid_questao: Integer;
    Fsinc_app: string;
    Fid_empresa: Integer;
    Fordem: Integer;
    Fid_eleicao: Integer;
    Fid_usuario: Integer;
    Fobrigatoria: string;

    public

      [FieldName('id_questao', True)]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property id_questao       : Integer     read Fid_questao write Fid_questao;

      [FieldName('id_eleicao')]
      [FieldOptions([foInsert, foSelect])]
      property id_eleicao       : Integer     read Fid_eleicao write Fid_eleicao;

      [FieldName('id_empresa')]
      [FieldOptions([foInsert, foSelect])]
      property id_empresa       : Integer     read Fid_empresa write Fid_empresa;

      [FieldName('titulo')]
      [FieldOptions([foInsert,foUpdate, foSelect])]
      property titulo           : string      read Ftitulo write Ftitulo;

      [FieldName('descricao')]
      [FieldOptions([foInsert,foUpdate, foSelect])]
      property descricao        : string      read Fdescricao write Fdescricao;

      [FieldName('ordem')]
      [FieldOptions([foInsert,foUpdate, foSelect])]
      property ordem            : Integer     read Fordem write Fordem;

      [FieldName('tipo_resposta')]
      [FieldOptions([foInsert,foUpdate, foSelect])]
      property tipo_resposta    : string      read Ftipo_resposta write Ftipo_resposta;

      [FieldName('obrigatoria')]
      [FieldOptions([foInsert,foUpdate, foSelect])]
      property obrigatoria      : string      read Fobrigatoria write Fobrigatoria;

      [FieldName('ativo')]
      [FieldOptions([foInsert,foUpdate, foSelect])]
      property ativo            : string      read Fativo write Fativo;

      [FieldName('id_usuario')]
      [FieldOptions([foInsert, foSelect])]
      property id_usuario       : Integer     read Fid_usuario write Fid_usuario;

      [FieldName('data_cadastro')]
      [FieldOptions([foInsert,foSelect])]
      property data_cadastro    : TDateTime   read Fdata_cadastro write Fdata_cadastro;

      [FieldName('data_alteracao')]
      [FieldOptions([foUpdate, foSelect])]
      property data_alteracao   : TDateTime   read Fdata_alteracao write Fdata_alteracao;

      [FieldName('sinc_app')]
      [FieldOptions([foInsert,foUpdate, foSelect])]
      property sinc_app         : string      read Fsinc_app write Fsinc_app;
End;

Type
  [TableName('eleicao_questao_opcao')]
  TModelEleicaoQuestaoOpcao = class
    private
    Fdata_alteracao: TDateTime;
    Fativo: string;
    Fdescricao: string;
    Fdata_cadastro: TDateTime;
    Fid_questao: Integer;
    Fsinc_app: string;
    Fid_opcao: Integer;
    Fid_empresa: Integer;
    Fordem: Integer;
    Fid_eleicao: Integer;
    Fid_usuario: Integer;

    public

      [FieldName('id_opcao', True)]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property id_opcao: Integer read Fid_opcao write Fid_opcao;

      [FieldName('id_questao')]
      [FieldOptions([foInsert, foSelect])]
      property id_questao: Integer read Fid_questao write Fid_questao;

      [FieldName('id_eleicao')]
      [FieldOptions([foInsert, foSelect])]
      property id_eleicao: Integer read Fid_eleicao write Fid_eleicao;

      [FieldName('id_empresa')]
      [FieldOptions([foInsert, foSelect])]
      property id_empresa: Integer read Fid_empresa write Fid_empresa;

      [FieldName('ordem')]
      [FieldOptions([foInsert, foupdate, foSelect])]
      property ordem: Integer read Fordem write Fordem;

      [FieldName('descricao')]
      [FieldOptions([foInsert, foupdate, foSelect])]
      property descricao: string read Fdescricao write Fdescricao;

      [FieldName('ativo')]
      [FieldOptions([foInsert, foupdate, foSelect])]
      property ativo: string read Fativo write Fativo;

      [FieldName('id_usuario')]
      [FieldOptions([foInsert, foSelect])]
      property id_usuario: Integer read Fid_usuario write Fid_usuario;

      [FieldName('data_cadastro')]
      [FieldOptions([foInsert, foSelect])]
      property data_cadastro: TDateTime read Fdata_cadastro write Fdata_cadastro;

      [FieldName('data_alteracao')]
      [FieldOptions([foupdate, foSelect])]
      property data_alteracao: TDateTime read Fdata_alteracao write Fdata_alteracao;

      [FieldName('sinc_app')]
      [FieldOptions([foInsert, foupdate, foSelect])]
      property sinc_app: string read Fsinc_app write Fsinc_app;
end;


implementation

end.
