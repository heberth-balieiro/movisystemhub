// Documento do modulo

// Recebido - A = Aberto, R = Recebido, C = Cancelado, F = Faturado




unit Model.Receber;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('receber')]
  TReceber = class
  private
    Fid_receber: Integer;
    Fid_empresa: Integer;
    Fid_natureza: Integer;
    Fid_pessoa: Integer;
    Fid_documento: Integer;
    Fid_usuario_criou: Integer;
    Fid_usuario_alterou: Integer;
    Fdata_lancamento: TDateTime;
    Fdata_vencimento: TDateTime;
    Fdata_recebimento: TDateTime;
    Fdata_competencia: TDateTime;
    Fdata_criacao: TDateTime;
    Fdata_alteracao: TDateTime;
    Fnumero_titulo: string;
    Fvalor_original: Double;
    Fvalor_recebido: Double;
    Fhistorico: string;
    Frecebido: string;
    Fparcela: Integer;
    Fnumparcela: String;
    Fnmpessoacompleto: String;
    Fnmpessoa: String;
    Fnmapelido: String;
    Fnmdocumento: String;
    Fwhatsapp: String;

  public
    [FieldName('id_receber', True)]
    property Id_receber: Integer read Fid_receber write Fid_receber;

    [FieldName('id_empresa')]
     [FieldOptions([foInsert, foSelect])]
    property Id_empresa: Integer read Fid_empresa write Fid_empresa;

    [FieldName('id_natureza')]
    property Id_natureza: Integer read Fid_natureza write Fid_natureza;

    [FieldName('id_pessoa')]
    property Id_pessoa: Integer read Fid_pessoa write Fid_pessoa;

    [FieldName('id_documento')]
    property Id_documento: Integer read Fid_documento write Fid_documento;

    [FieldName('id_usuario_criou')]
     [FieldOptions([foInsert, foSelect])]
    property Id_usuario_criou: Integer read Fid_usuario_criou write Fid_usuario_criou;

    [FieldName('id_usuario_alterou')]
     [FieldOptions([foUpdate, foSelect])]
    property Id_usuario_alterou: Integer read Fid_usuario_alterou write Fid_usuario_alterou;

    [FieldName('data_lancamento')]
    property Data_lancamento: TDateTime read Fdata_lancamento write Fdata_lancamento;

    [FieldName('data_vencimento')]
    property Data_vencimento: TDateTime read Fdata_vencimento write Fdata_vencimento;

    [FieldName('data_recebimento')]
     [FieldOptions([foUpdate, foSelect])]
    property Data_recebimento: TDateTime read Fdata_recebimento write Fdata_recebimento;

    [FieldName('data_competencia')]
    property Data_competencia: TDateTime read Fdata_competencia write Fdata_competencia;

    [FieldName('data_criacao')]
     [FieldOptions([foInsert, foSelect])]
    property Data_criacao: TDateTime read Fdata_criacao write Fdata_criacao;

    [FieldName('data_alteracao')]
     [FieldOptions([foUpdate, foSelect])]
    property Data_alteracao: TDateTime read Fdata_alteracao write Fdata_alteracao;

    [FieldName('numero_titulo')]
    property Numero_titulo: string read Fnumero_titulo write Fnumero_titulo;

    [FieldName('valor_original')]
    property Valor_original: Double read Fvalor_original write Fvalor_original;

    [FieldName('valor_recebido')]
    property Valor_recebido: Double read Fvalor_recebido write Fvalor_recebido;

    [FieldName('historico')]
    property Historico: string read Fhistorico write Fhistorico;

    [FieldName('recebido')]
    property Recebido: string read Frecebido write Frecebido;

    [FieldName('parcela')]
    property Parcela: Integer read Fparcela write Fparcela;

    [FieldName('numparcela')]
    [FieldOptions([foSelect])]
    property numparcela: String read Fnumparcela write Fnumparcela;

    [FieldName('nmpessoa')]
    [FieldOptions([foSelect])]
    property nmpessoa: String read Fnmpessoa write Fnmpessoa;

    [FieldName('nmapelido')]
    [FieldOptions([foSelect])]
    property nmapelido: String read Fnmapelido write Fnmapelido;

    [FieldName('nmpessoacompleto')]
    [FieldOptions([foSelect])]
    property nmpessoacompleto: String read Fnmpessoacompleto write Fnmpessoacompleto;

    [FieldName('whatsapp')]
    [FieldOptions([foSelect])]
    property whatsapp: String read Fwhatsapp write Fwhatsapp;

    [FieldName('nmdocumento')]
    [FieldOptions([foSelect])]
    property nmdocumento: String read Fnmdocumento write Fnmdocumento;


  end;

implementation

end.

