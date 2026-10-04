unit Model.Empresas;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('empresa')]
  TEmpresa = class
  private
    Fcnae: string;
    Fcnpj: string;
    Ffantasia: string;
    Fsite: string;
    Fbairro: string;
    Ftipo_atividade: Integer;
    Fim: string;
    Fresponsavel: string;
    Fcep: string;
    Fie: string;
    Fnumero: string;
    Fcelular2: string;
    Fcomplemento: string;
    Ffone2: string;
    Fdatacadastro: TDate;
    Fid_empresa: Integer;
    Fwhatsapp: string;
    Fguid: string;
    Flogo: String;
    Fversaobd: string;
    Femail2: string;
    Fendereco: string;
    Ftelefone: string;
    Frazao: string;
    Femail1: string;
    Fcelular: string;
    Fid_cidade: Integer;

  public
    [FieldName('id_empresa', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_empresa: Integer read Fid_empresa write Fid_empresa;

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
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_cidade: Integer read Fid_cidade write Fid_cidade;

    [FieldName('cnpj')]
    [FieldOptions([foInsert, foSelect])]
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

    [FieldName('datacadastro')]
    [FieldOptions([foInsert, foSelect])]
    property datacadastro: TDate read Fdatacadastro write Fdatacadastro;

    [FieldName('tipo_atividade')]
    [FieldOptions([foInsert, foSelect])]
    property tipo_atividade: Integer read Ftipo_atividade write Ftipo_atividade;

    [FieldName('cnae')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property cnae: string read Fcnae write Fcnae;

    [FieldName('fone2')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property fone2: string read Ffone2 write Ffone2;

    [FieldName('celular2')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property celular2: string read Fcelular2 write Fcelular2;

    [FieldName('logo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property logo: String read Flogo write Flogo;

    [FieldName('guid')]
    [FieldOptions([foInsert, foSelect])]
    property guid: string read Fguid write Fguid;

    [FieldName('versaobd')]
    [FieldOptions([foInsert, foSelect])]
    property versaobd: string read Fversaobd write Fversaobd;

  end;

implementation

end.
