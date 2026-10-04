unit Model.LogVeiculo;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('veiculo_log')]
  TLogVeiculo = class

  private
    Fndata: Tdate;
    FIdempresa: Integer;
    Fnhora: Ttime;
    FIdveiculo: Integer;
    FIdusuario: Integer;
    Fndescricao: string;
    FId: Integer;

  public
    [FieldName('id', True)] //pkAuto
    [FieldOptions([foInsert])]
    property Id: Integer read FId write FId;

    [FieldName('id_veiculo')]
    [FieldOptions([foInsert])]
    property Idveiculo: Integer read FIdveiculo write FIdveiculo;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert])]
    property Idusuario: Integer read FIdusuario write FIdusuario;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert])]
    property Idempresa: Integer read FIdempresa write FIdempresa;

    [FieldName('data')]
    [FieldOptions([foInsert])]
    property ndata: Tdate read Fndata write Fndata;

    [FieldName('hora')]
    [FieldOptions([foInsert])]
    property nhora: Ttime read Fnhora write Fnhora;

    [FieldName('descricao')]
    [FieldOptions([foInsert])]
    property ndescricao: string read Fndescricao write Fndescricao;


  end;

implementation

end.
