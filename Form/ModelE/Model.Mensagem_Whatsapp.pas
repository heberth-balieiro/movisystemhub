unit Model.Mensagem_Whatsapp;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('mensagem_zap')]
  TMensagemWhatsapp = class

  private
    Ffone: String;
    Fnomepessoa: String;
    Fanexobase: String;
    Fid_pessoa: Integer;
    Ftoken: String;
    Fstatus: String;
    Fid_zap: Integer;
    Fmensagem: String;
    Furl: String;
    Ftipo: String;
    Fext: String;
    Fnomeinstancia: String;

  public
    [FieldName('id_zap', True)] //pkAuto
    [FieldOptions([foInsert, foSelect])]
    property id_zap: Integer read Fid_zap write Fid_zap;

    [FieldName('mensagem')]
    [FieldOptions([foInsert, foSelect])]
    property mensagem: String read Fmensagem write Fmensagem;

    [FieldName('url')]
    [FieldOptions([foInsert, foSelect])]
    property url: String read Furl write Furl;

    [FieldName('nomepessoa')]
    [FieldOptions([foInsert, foSelect])]
    property nomepessoa: String read Fnomepessoa write Fnomepessoa;

    [FieldName('id_pessoa')]
    [FieldOptions([foInsert, foSelect])]
    property id_pessoa: Integer read Fid_pessoa write Fid_pessoa;

    [FieldName('fone')]
    [FieldOptions([foInsert, foSelect])]
    property fone: String read Ffone write Ffone;

    [FieldName('status')]
    [FieldOptions([foInsert, foSelect])]
    property status: String read Fstatus write Fstatus;

    [FieldName('anexobase')]
    [FieldOptions([foInsert, foSelect])]
    property anexobase: String read Fanexobase write Fanexobase;

    [FieldName('ext')]
    [FieldOptions([foInsert, foSelect])]
    property ext: String read Fext write Fext;

    [FieldName('tipo')]
    [FieldOptions([foInsert, foSelect])]
    property tipo: String read Ftipo write Ftipo;

    [FieldName('token')]
    [FieldOptions([foInsert, foSelect])]
    property token: String read Ftoken write Ftoken;

    [FieldName('nomeinstancia')]
    [FieldOptions([foInsert, foSelect])]
    property nomeinstancia: String read Fnomeinstancia write Fnomeinstancia;

  end;


type
  [Tablename('socio')]
  TPessoaAdicionar = class

    Private
    Femail: String;
    Fnascimento: TDate;
    Fcpf: String;
    Fid_socio: Integer;
    Fsituacao: String;
    Fwhatsapp: String;
    Fnome: String;
    Fmatricula: Integer;
    Fcelular: String;
    Fcodigo: Integer;

    Public

    [FieldName('id_socio')]
    [FieldOptions([foSelect])]
    property id_socio: Integer read Fid_socio write Fid_socio;

    [FieldName('codigo')]
    [FieldOptions([foSelect])]
    property codigo: Integer read Fcodigo write Fcodigo;

    [FieldName('matricula')]
    [FieldOptions([foSelect])]
    property matricula: Integer read Fmatricula write Fmatricula;

    [FieldName('nome')]
    [FieldOptions([foInsert, foSelect])]
    property nome: String read Fnome write Fnome;

    [FieldName('cpf')]
    [FieldOptions([foInsert, foSelect])]
    property cpf: String read Fcpf write Fcpf;

    [FieldName('celular')]
    [FieldOptions([foInsert, foSelect])]
    property celular: String read Fcelular write Fcelular;

    [FieldName('whatsapp')]
    [FieldOptions([foInsert, foSelect])]
    property whatsapp: String read Fwhatsapp write Fwhatsapp;

    [FieldName('email')]
    [FieldOptions([foInsert, foSelect])]
    property email: String read Femail write Femail;

    [FieldName('nascimento')]
    [FieldOptions([foInsert, foSelect])]
    property nascimento: TDate read Fnascimento write Fnascimento;

    [FieldName('situacao')]
    [FieldOptions([foInsert, foSelect])]
    property situacao: String read Fsituacao write Fsituacao;

  end;

implementation

end.
