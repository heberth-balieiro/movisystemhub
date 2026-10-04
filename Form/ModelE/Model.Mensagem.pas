unit Model.Mensagem;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('mensagem')]
  TModelMensagem = class
  private
    Fid_mensagem: Integer;
    Fcodigo: Integer;
    Fdescricao: string;
    Fativo: string;
    Fuso: string;
    Fassunto_email: string;
    Fmensagem: string;
    Fexcluido: Integer;

  public
    [FieldName('id_mensagem', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_mensagem: Integer read Fid_mensagem write Fid_mensagem;

    [FieldName('codigo')]
    [FieldOptions([foInsert, foSelect])]
    property codigo: Integer read Fcodigo write Fcodigo;

    [FieldName('descricao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property descricao: string read Fdescricao write Fdescricao;

    [FieldName('ativo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property ativo: string read Fativo write Fativo;

    [FieldName('uso')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property uso: string read Fuso write Fuso;

    [FieldName('assunto_email')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property assunto_email: string read Fassunto_email write Fassunto_email;

    [FieldName('mensagem')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property mensagem: string read Fmensagem write Fmensagem;

    [FieldName('excluido')]
    [FieldOptions([foInsert, foSelect])]
    property excluido: Integer read Fexcluido write Fexcluido;

  end;

implementation

end.
