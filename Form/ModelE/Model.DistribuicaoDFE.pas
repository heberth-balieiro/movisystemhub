unit Model.DistribuicaoDFE;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

Type
  [TableName('distribuicao_dfe_doc')]
  TModelDistribuicao = Class
  Private
    Fnumero_nfe: String;
    Fx_nome_emitente: String;
    Fchave_acesso: String;
    Fcnpj_emitente: String;
    Fsituacao_manifesto: String;
    Fcaminho_arquivo: String;
    Fschema_name: String;
    Fvalor_nfe: Double;
    Fdh_emissao: TDate;
    Fdt_cadastro: TDate;
    Fid_empresa: Integer;
    Fxml_descompactado: String;
    Fid_log: Integer;
    Fnsu: String;
    Fid_doc: Integer;
    Fserie_nfe: String;
    Ftipo_documento: String;

  Public

  [FieldName('id_doc', True)]
  [FieldOptions([foInsert, foUpdate, foSelect])]
  property id_doc              : Integer  read Fid_doc             write Fid_doc;

  [FieldName('id_log')]
  [FieldOptions([foInsert, foSelect])]
  property id_log              : Integer  read Fid_log             write Fid_log;

  [FieldName('id_empresa')]
  [FieldOptions([foInsert, foSelect])]
  property id_empresa          : Integer  read Fid_empresa         write Fid_empresa;

  [FieldName('nsu')]
  [FieldOptions([foInsert, foSelect])]
  property nsu                 : String   read Fnsu                write Fnsu;

  [FieldName('schema_name')]
  [FieldOptions([foInsert, foSelect])]
  property schema_name         : String   read Fschema_name        write Fschema_name;

  [FieldName('xml_descompactado')]
  [FieldOptions([foInsert, foSelect])]
  property xml_descompactado   : String   read Fxml_descompactado  write Fxml_descompactado;

  [FieldName('caminho_arquivo')]
  [FieldOptions([foInsert, foSelect])]
  property caminho_arquivo     : String   read Fcaminho_arquivo    write Fcaminho_arquivo;

  [FieldName('tipo_documento')]
  [FieldOptions([foInsert, foSelect])]
  property tipo_documento      : String   read Ftipo_documento     write Ftipo_documento;

  [FieldName('chave_acesso')]
  [FieldOptions([foInsert, foSelect])]
  property chave_acesso        : String   read Fchave_acesso       write Fchave_acesso;

  [FieldName('cnpj_emitente')]
  [FieldOptions([foInsert, foSelect])]
  property cnpj_emitente       : String   read Fcnpj_emitente      write Fcnpj_emitente;

  [FieldName('x_nome_emitente')]
  [FieldOptions([foInsert, foSelect])]
  property x_nome_emitente     : String   read Fx_nome_emitente    write Fx_nome_emitente;

  [FieldName('numero_nfe')]
  [FieldOptions([foInsert, foSelect])]
  property numero_nfe          : String   read Fnumero_nfe         write Fnumero_nfe;

  [FieldName('serie_nfe')]
  [FieldOptions([foInsert, foSelect])]
  property serie_nfe           : String   read Fserie_nfe          write Fserie_nfe;

  [FieldName('valor_nfe')]
  [FieldOptions([foInsert, foSelect])]
  property valor_nfe           : Double   read Fvalor_nfe          write Fvalor_nfe;

  [FieldName('dh_emissao')]
  [FieldOptions([foInsert, foSelect])]
  property dh_emissao          : TDate    read Fdh_emissao         write Fdh_emissao;

  [FieldName('situacao_manifesto')]
  [FieldOptions([foInsert, foSelect])]
  property situacao_manifesto  : String   read Fsituacao_manifesto write Fsituacao_manifesto;

  [FieldName('dt_cadastro')]
  [FieldOptions([foInsert, foSelect])]
  property dt_cadastro         : TDate    read Fdt_cadastro        write Fdt_cadastro;

  End;

implementation

end.
