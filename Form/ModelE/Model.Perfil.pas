unit Model.Perfil;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('perfil')]
  TModelPerfil = class
  private
    Fid_perfil: Integer;
    Fcodigo: Integer;
    Fdescricao: string;
    Finativo: string;
    Fid_empresa: Integer;
    Fsistema: Integer;
    Fexcluido: Integer;

  public
    [FieldName('id_perfil', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_perfil: Integer read Fid_perfil write Fid_perfil;

    [FieldName('codigo')]
    [FieldOptions([foInsert, foSelect])]
    property codigo: Integer read Fcodigo write Fcodigo;

    [FieldName('descricao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property descricao: string read Fdescricao write Fdescricao;

    [FieldName('ativo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property inativo: string read Finativo write Finativo;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert])]
    property id_empresa: Integer read Fid_empresa write Fid_empresa;

    [FieldName('sistema')]
    [FieldOptions([foInsert, foSelect])]
    property sistema: Integer read Fsistema write Fsistema;

    [FieldName('excluido')]
    [FieldOptions([foInsert, foSelect])]
    property excluido: Integer read Fexcluido write Fexcluido;

  end;

type
  [TableName('nivel')]
  TModelNivel = class
  private
    Fliberado: string;
    Fid_perfil: Integer;
    Fid_nivel: Integer;
    Fid_empresa: Integer;
    Ftela: string;
    Fnome: string;
    Fmodulo: string;


    public

    [FieldName('id_nivel', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_nivel: Integer read Fid_nivel write Fid_nivel;

    [FieldName('id_perfil')]
    [FieldOptions([foInsert, foSelect])]
    property id_perfil: Integer read Fid_perfil write Fid_perfil;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert, foSelect])]
    property id_empresa: Integer read Fid_empresa write Fid_empresa;

    [FieldName('tela')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property tela: string read Ftela write Ftela;

    [FieldName('nome')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property nome: string read Fnome write Fnome;

    [FieldName('liberado')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property liberado: string read Fliberado write Fliberado;

    [FieldName('modulo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property modulo: string read Fmodulo write Fmodulo;


  end;


implementation

end.
