unit Model.Anexo;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('anexo')]
  TModelAnexo = class
  private
    Fid_anexo: Integer;
    Fid_referencia: Integer;
    Ftipo_referencia: String;

    Fnome_arquivo: String;
    Fnome_original: String;
    Fextensao: String;
    Ftipo_arquivo: String;
    Fmime_type: String;

    Farquivo_blob: TBytes;
    Ftamanho_bytes: Int64;

    Fobservacao: String;
    Fdatainclusao: TDateTime;

    Fid_empresa: Integer;
    Fid_usuario: Integer;
    Fnome: String;

  public
    [FieldName('id_anexo', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_anexo: Integer read Fid_anexo write Fid_anexo;

    [FieldName('id_referencia')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_referencia: Integer read Fid_referencia write Fid_referencia;

    [FieldName('tipo_referencia')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property tipo_referencia: String read Ftipo_referencia write Ftipo_referencia;

    [FieldName('nome_arquivo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property nome_arquivo: String read Fnome_arquivo write Fnome_arquivo;

    [FieldName('nome_original')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property nome_original: String read Fnome_original write Fnome_original;

    [FieldName('extensao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property extensao: String read Fextensao write Fextensao;

    [FieldName('tipo_arquivo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property tipo_arquivo: String read Ftipo_arquivo write Ftipo_arquivo;

    [FieldName('mime_type')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property mime_type: String read Fmime_type write Fmime_type;

    [FieldName('arquivo_blob')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property arquivo_blob: TBytes read Farquivo_blob write Farquivo_blob;

    [FieldName('tamanho_bytes')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property tamanho_bytes: Int64 read Ftamanho_bytes write Ftamanho_bytes;

    [FieldName('observacao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property observacao: String read Fobservacao write Fobservacao;

    [FieldName('datainclusao')]
    [FieldOptions([foInsert, foSelect])]
    property datainclusao: TDateTime read Fdatainclusao write Fdatainclusao;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert, foSelect])]
    property id_empresa: Integer read Fid_empresa write Fid_empresa;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert, foSelect])]
    property id_usuario: Integer read Fid_usuario write Fid_usuario;


    [FieldName('nome')]
    [FieldOptions([foSelect])]
    [Editable(false)]
    property nome: String read Fnome write Fnome;

  end;

implementation

end.
