unit Model.Sindicato_Empresa;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('sindicato_empresa')]
  TSindicato_Empresa = class
  private
    Fsind_id_empresa: Integer;
    Fcodigo: Integer;
    Fdescricao: string;
    Fid_sede: Integer;
    Fid_empresa: Integer;
    Fid_usuario: Integer;
    Fdatacadastro: TDate;
    Fativo: string;
    Fsinc_app: string;
    Fvrazao: String;

  public
    [FieldName('sind_id_empresa', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property sind_id_empresa: Integer read Fsind_id_empresa write Fsind_id_empresa;

    [FieldName('codigo')]
    [FieldOptions([foInsert, foSelect])]
    property codigo: Integer read Fcodigo write Fcodigo;

    [FieldName('descricao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property descricao: string read Fdescricao write Fdescricao;

    [FieldName('id_sede')]
    [FieldOptions([foInsert, foUpdate])]
    property id_sede: Integer read Fid_sede write Fid_sede;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert])]
    property id_empresa: Integer read Fid_empresa write Fid_empresa;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert])]
    property id_usuario: Integer read Fid_usuario write Fid_usuario;

    [FieldName('datacadastro')]
    [FieldOptions([foInsert])]
    property datacadastro: TDate read Fdatacadastro write Fdatacadastro;

    [FieldName('ativo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property ativo: string read Fativo write Fativo;

    [FieldName('sinc_app')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property sinc_app: string read Fsinc_app write Fsinc_app;

    [FieldName('vRazao')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property vrazao: String read Fvrazao write Fvrazao;


  end;

implementation

end.
