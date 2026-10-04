unit Model.Notificacao;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('notificacao')]
  TNotificacao = class
    Private
    Ftitulo: string;
    Ffoto: string;
    Fdataenvio: Tdate;
    Fpublico: string;
    Fsinc_app: string;
    Fmensagem: string;
    Ftipo: integer;
    Fid_notificacao: Integer;
    Fdatacriacao: Tdate;

    Public
      [FieldName('id_notificacao', True)]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property id_notificacao: Integer read Fid_notificacao write Fid_notificacao;

      [FieldName('tipo')]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property tipo: integer read Ftipo write Ftipo;

      [FieldName('titulo')]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property titulo: string read Ftitulo write Ftitulo;

      [FieldName('mensagem')]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property mensagem: string read Fmensagem write Fmensagem;

      [FieldName('datacriacao')]
      [FieldOptions([foInsert, foSelect])]
      property datacriacao: Tdate read Fdatacriacao write Fdatacriacao;

      [FieldName('dataenvio')]
      [FieldOptions([foUpdate, foSelect])]
      property dataenvio: Tdate read Fdataenvio write Fdataenvio;

      [FieldName('publico')]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property publico: string read Fpublico write Fpublico;

      [FieldName('foto')]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property foto: string read Ffoto write Ffoto;

      [FieldName('sinc_app')]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property sinc_app: string read Fsinc_app write Fsinc_app;

  end;


implementation

{ TModelNotificacao }

end.
