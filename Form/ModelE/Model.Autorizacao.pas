unit Model.Autorizacao;

interface

Uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('autorizacao')]
  TModelautorizacao = class

  Private
    Fobs: string;
    Fidusuario: Integer;
    Fenviarapp: string;
    Fid_autorizacao: Integer;
    Fqtdepessoa: Integer;
    Fpessoaautorizou: string;
    Fnome: string;
    Fdata: TDate;
    Fexcluido: Integer;
    Fsinc_app: string;

  Public
    [FieldName('id_autorizacao', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_autorizacao      : Integer read Fid_autorizacao     write Fid_autorizacao;

    [FieldName('data')]
    [FieldOptions([foInsert,foUpdate,foselect])]
    property data               : TDate   read Fdata              write Fdata;

    [FieldName('nome')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property nome               : string  read Fnome              write Fnome;

    [FieldName('qtde_pessoa')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property qtdepessoa         : Integer read Fqtdepessoa        write Fqtdepessoa;

    [FieldName('obs')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property obs                : string  read Fobs               write Fobs;

    [FieldName('pessoa_autorizou')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property pessoaautorizou    : string  read Fpessoaautorizou   write Fpessoaautorizou;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert])]
    property idusuario          : Integer read Fidusuario         write Fidusuario;

    [FieldName('status')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property enviarapp             : string  read Fenviarapp            write Fenviarapp;

    [FieldName('sinc_app')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property sinc_app             : string  read Fsinc_app            write Fsinc_app;

    [FieldName('excluido')]
    [FieldOptions([foInsert])]
    property excluido         : Integer read Fexcluido        write Fexcluido;



End;


implementation

{ TModelAutorizacao }


end.
