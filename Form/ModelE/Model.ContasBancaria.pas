unit Model.ContasBancaria;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('CONTAS')]
  TContas = class
  private
    Fbanco: string;
    Fativo: string;
    Fcorrentista: string;
    Fcodigo: Integer;
    Fdataalteracao: TDate;
    Fdatasaldo: TDate;
    Fconta: string;
    Fid_empresa: Integer;
    Fsaldo: double;
    Fid_conta: Integer;
    Fagencia: string;
    Fexcluido: Integer;
    Fid_usuario_alt: Integer;
    Fid_usuario: Integer;
    Fdatacriacao: TDate;

  public
    [FieldName('id_conta', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_conta: Integer read Fid_conta write Fid_conta;

    [FieldName('codigo')]
    [FieldOptions([foInsert,foSelect])]
    property Codigo: Integer read Fcodigo write Fcodigo;

    [FieldName('banco')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property banco: string read Fbanco write Fbanco;

    [FieldName('agencia')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property agencia: string read Fagencia write Fagencia;

    [FieldName('conta')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property conta: string read Fconta write Fconta;

    [FieldName('correntista')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property correntista: string read Fcorrentista write Fcorrentista;

    [FieldName('saldo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property saldo: double read Fsaldo write Fsaldo;

    [FieldName('datasaldo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property datasaldo: TDate read Fdatasaldo write Fdatasaldo;

    [FieldName('datacriacao')]
    [FieldOptions([foInsert, foSelect])]
    property datacriacao: TDate read Fdatacriacao write Fdatacriacao;

    [FieldName('dataalteracao')]
    [FieldOptions([foUpdate, foSelect])]
    property dataalteracao: TDate read Fdataalteracao write Fdataalteracao;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert,foSelect])]
    property id_empresa: Integer read Fid_empresa write Fid_empresa;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert,foSelect])]
    property id_usuario: Integer read Fid_usuario write Fid_usuario;

    [FieldName('ativo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property ativo: string read Fativo write Fativo;

    [FieldName('id_usuario_alt')]
    [FieldOptions([foUpdate,foSelect])]
    property id_usuario_alt: Integer read Fid_usuario_alt write Fid_usuario_alt;

    [FieldName('excluido')]
    [FieldOptions([foInsert,foSelect])]
    property excluido: Integer read Fexcluido write Fexcluido;


  end;

implementation

end.
