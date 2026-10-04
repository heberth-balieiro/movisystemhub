unit Model.Usuario;

interface

Uses
  System.SysUtils, System.Classes, uAtributosRTTI;

Type
  [TableName('usuario')]
  TModelUsuario = Class

  Private
    Fidfunc: integer;
    Fidempresa: integer;
    Femail: string;
    Finativo: string;
    Fidusuario: integer;
    Fsistema: string;
    Fidsede: integer;
    Fsenha: string;
    Fsinc_app: string;
    Flogin: string;
    Fnome: string;
    Fidperfil: integer;
    Fdescricao: string;

  public
    [FieldName('id_usuario', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property idusuario      :integer  read Fidusuario     write Fidusuario;

    [FieldName('nome')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property nome           :string   read Fnome          write Fnome;

    [FieldName('login')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property login          :string   read Flogin         write Flogin;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert,foSelect])]
    property idempresa      :integer  read Fidempresa     write Fidempresa;

    [FieldName('id_sede')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property idsede         :integer  read Fidsede        write Fidsede;

    [FieldName('senha')]
    [FieldOptions([foInsert,foSelect])]
    property senha          :string   read Fsenha         write Fsenha;

    [FieldName('ativo')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ativo        :string   read Finativo       write Finativo;

    [FieldName('email')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property email          :string   read Femail         write Femail;

    [FieldName('sistema')]
    [FieldOptions([foInsert,foSelect])]
    property sistema        :string   read Fsistema       write Fsistema;

    [FieldName('id_perfil')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property idperfil       :integer  read Fidperfil      write Fidperfil;

    [FieldName('id_funcionario')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property idfunc         :integer  read  Fidfunc       write fidfunc;

    [FieldName('sinc_app')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property sinc_app        :string   read Fsinc_app       write Fsinc_app;

    [FieldName('descricao')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property descricao        :string   read Fdescricao       write Fdescricao;

  End;

implementation

end.

