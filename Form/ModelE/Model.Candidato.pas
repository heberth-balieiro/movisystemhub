unit Model.Candidato;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('candidato')]
  TCandidato = class
  private
    Fid_candidato: Integer;
    Fcodigo: Integer;
    Fnome: string;
    Fcargo: string;
    Fcpf: string;
    Fdescricao: string;
    Fid_empresa: Integer;
    Ffoto: TBytes;
    Finativo: string;
    Fsinc_app: string;

  public
    [FieldName('id_candidato')]
    property id_candidato: Integer read Fid_candidato write Fid_candidato;

    [FieldName('codigo')]
    property codigo: Integer read Fcodigo write Fcodigo;

    [FieldName('nome')]
    property nome: string read Fnome write Fnome;

    [FieldName('cargo')]
    property cargo: string read Fcargo write Fcargo;

    [FieldName('cpf')]
    property cpf: string read Fcpf write Fcpf;

    [FieldName('descricao')]
    property descricao: string read Fdescricao write Fdescricao;

    [FieldName('id_empresa')]
    property id_empresa: Integer read Fid_empresa write Fid_empresa;

    [FieldName('foto')]
    property foto: TBytes read Ffoto write Ffoto;

    [FieldName('inativo')]
    property inativo: string read Finativo write Finativo;

    [FieldName('sinc_app')]
    property sinc_app: string read Fsinc_app write Fsinc_app;
  end;

implementation

end.
