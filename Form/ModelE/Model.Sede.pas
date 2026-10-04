unit Model.Sede;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('sede')]
  TSede = class
  private
    Fid_sede: Integer;
    Frazao: string;
    Ffantasia: string;
    Fcep: string;
    Fendereco: string;
    Fnumero: string;
    Fcomplemento: string;
    Fbairro: string;
    Fid_cidade: Integer;
    Fcnpj: string;
    Fie: string;
    Fim: string;
    Fresponsavel: string;
    Ftelefone: string;
    Fcelular: string;
    Fwhatsapp: string;
    Fsite: string;
    Femail1: string;
    Femail2: string;
    Fsedeprincipal: string;
    Fdatacadastro: TDate;
    Fid_empresa: Integer;
    Fncidade: String;
  public

    [FieldName('id_sede', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_sede: Integer read Fid_sede write Fid_sede;
    [FieldName('razao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property razao: string read Frazao write Frazao;
    [FieldName('fantasia')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property fantasia: string read Ffantasia write Ffantasia;
    [FieldName('cep')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property cep: string read Fcep write Fcep;
    [FieldName('endereco')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property endereco: string read Fendereco write Fendereco;
    [FieldName('numero')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property numero: string read Fnumero write Fnumero;
    [FieldName('complemento')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property complemento: string read Fcomplemento write Fcomplemento;
    [FieldName('bairro')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property bairro: string read Fbairro write Fbairro;
    [FieldName('id_cidade')]
    [FieldOptions([foInsert])]
    property id_cidade: Integer read Fid_cidade write Fid_cidade;
    [FieldName('cnpj')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property cnpj: string read Fcnpj write Fcnpj;
    [FieldName('ie')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property ie: string read Fie write Fie;
    [FieldName('im')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property im: string read Fim write Fim;
    [FieldName('responsavel')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property responsavel: string read Fresponsavel write Fresponsavel;
    [FieldName('telefone')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property telefone: string read Ftelefone write Ftelefone;
    [FieldName('celular')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property celular: string read Fcelular write Fcelular;
    [FieldName('whatsapp')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property whatsapp: string read Fwhatsapp write Fwhatsapp;
    [FieldName('site')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property site: string read Fsite write Fsite;
    [FieldName('email1')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property email1: string read Femail1 write Femail1;
    [FieldName('email2')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property email2: string read Femail2 write Femail2;
    [FieldName('sedeprincipal')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property sedeprincipal: string read Fsedeprincipal write Fsedeprincipal;
    [FieldName('datacadastro')]
    [FieldOptions([foInsert])]
    property datacadastro: TDate read Fdatacadastro write Fdatacadastro;
    [FieldName('id_empresa')]
    [FieldOptions([foInsert])]
    property id_empresa: Integer read Fid_empresa write Fid_empresa;
    [FieldName('ncidade')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property ncidade: String read Fncidade write Fncidade;

  end;
implementation
end.
