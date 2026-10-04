unit Model.CFOP;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('CFOP')]
  TCFOP = class
  private
    Foperacao: string;
    Fdata_alteracao: TDate;
    Fnatureza: string;
    Fativo: string;
    Fcodigo: Integer;
    Fcfop: string;
    Fdata_criacao: TDate;
    Fid_cfop: Integer;
    Fid_empresa: Integer;
    Ftipo: string;
    Fexcluido: Integer;
    Fid_usuario_alt: Integer;
    Fid_usuario: Integer;

  public
    [FieldName('id_cfop', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_cfop: Integer read Fid_cfop write Fid_cfop;

    [FieldName('codigo')]
    [FieldOptions([foInsert,foSelect])]
    property Codigo: Integer read Fcodigo write Fcodigo;

    [FieldName('cfop')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property cfop: string read Fcfop write Fcfop;

    [FieldName('natureza')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property natureza: string read Fnatureza write Fnatureza;

    [FieldName('operacao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property operacao: string read Foperacao write Foperacao;

    [FieldName('tipo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property tipo: string read Ftipo write Ftipo;

    [FieldName('ativo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property ativo: string read Fativo write Fativo;

    [FieldName('excluido')]
    [FieldOptions([foInsert, foUpdate])]
    property excluido: Integer read Fexcluido write Fexcluido;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert])]
    property id_empresa: Integer read Fid_empresa write Fid_empresa;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert])]
    property id_usuario: Integer read Fid_usuario write Fid_usuario;

    [FieldName('id_usuario_alt')]
    [FieldOptions([foUpdate])]
    property id_usuario_alt: Integer read Fid_usuario_alt write Fid_usuario_alt;

    [FieldName('data_criacao')]
    [FieldOptions([foInsert])]
    property data_criacao: TDate read Fdata_criacao write Fdata_criacao;

    [FieldName('data_alteracao')]
    [FieldOptions([foUpdate])]
    property data_alteracao: TDate read Fdata_alteracao write Fdata_alteracao;

  end;


implementation

end.
