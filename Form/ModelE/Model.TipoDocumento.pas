unit Model.TipoDocumento;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('tipo_documento')]
  TTipoDocumento = class
  private
    Fid_documento: Integer;
    Fcodigo: Integer;
    Fdescricao: string;
    Fativo: string;
    Ftipo: string;
    Fid_empresa: Integer;
    Fid_usuario: Integer;
    Fdata_criacao: TDateTime;
    Fid_usuario_alteracao: Integer;
    Fdata_alteracao: TDateTime;
    Fexcluido: Integer;
    Fid_usuario_excluiu: Integer;
    Fdata_exclusao: TDateTime;

  public

    [FieldName('id_documento', True)]
    property Id_documento: Integer read Fid_documento write Fid_documento;

    [FieldName('codigo')]
    property Codigo: Integer read Fcodigo write Fcodigo;

    [FieldName('descricao')]
    [Editable(True)]
    property Descricao: string read Fdescricao write Fdescricao;

    [FieldName('ativo')]
    [Editable(True)]
    property Ativo: string read Fativo write Fativo;

    [FieldName('tipo')]
    [Editable(False)]
    property Tipo: string read Ftipo write Ftipo;

    [FieldName('id_empresa')]
    [Editable(False)]
    property Id_empresa: Integer read Fid_empresa write Fid_empresa;

    [FieldName('id_usuario')]
    [Editable(False)]
    property Id_usuario: Integer read Fid_usuario write Fid_usuario;

    [FieldName('data_criacao')]
    [Editable(False)]
    property Data_criacao: TDateTime read Fdata_criacao write Fdata_criacao;

    [FieldName('id_usuario_alteracao')]
    [Editable(True)]
    property Id_usuario_alteracao: Integer read Fid_usuario_alteracao write Fid_usuario_alteracao;

    [FieldName('data_alteracao')]
    [Editable(True)]
    property Data_alteracao: TDateTime read Fdata_alteracao write Fdata_alteracao;

    [FieldName('excluido')]
    [Editable(True)]
    property Excluido: Integer read Fexcluido write Fexcluido;

    [FieldName('id_usuario_excluiu')]
    property Id_usuario_excluiu: Integer read Fid_usuario_excluiu write Fid_usuario_excluiu;

    [FieldName('data_exclusao')]
    [Editable(False)]
    property Data_exclusao: TDateTime read Fdata_exclusao write Fdata_exclusao;
  end;

implementation

end.
