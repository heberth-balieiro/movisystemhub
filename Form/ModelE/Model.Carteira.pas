unit Model.Carteira;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('carteira')]
  TCarteiraWeb = class
  private
    Fapi: String;
    Fativo: String;
    Fdigital: String;
    Fid_socio: Integer;
    Fid_dependente: Integer;
    Ftoken: String;
    Fdataemissao: TDateTime;
    Ftoken_device: String;
    Fsenha: String;
    Fsinc_app: String;
    Fnomeuser: String;
    Fid_empresa: Integer;
    Fqrcode: String;
    Fid_usuario_exc: Integer;
    Fdata_exc: TDateTime;
    Flogin: String;
    Fimpresso: String;
    Fid_carteira: Integer;
    Fexcluido: Integer;
    Fid_usuario: Integer;
    Fvalidade: TDateTime;
    FvCodigo: Integer;
    FvCPF: String;
    FvRazaosecretaria: String;
    FvNome: String;
    FvMatricula: Integer;
    FvParentesco: String;
    FvNascimento: TDatetime;
    FvWhatsapp: String;
    Ffoto: String;
    Fnmusuario: String;

  public

      [FieldName('id_carteira', True)]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property id_carteira: Integer read Fid_carteira write Fid_carteira;

      [FieldName('id_socio')]
      [FieldOptions([foInsert, foupdate,foSelect])]
      property id_socio: Integer read Fid_socio write Fid_socio;

      [FieldName('validade')]
      [FieldOptions([foInsert, foupdate, foSelect])]
      property validade: TDateTime read Fvalidade write Fvalidade;

      [FieldName('ativo')]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property ativo: String read Fativo write Fativo;

      [FieldName('impresso_dependente')]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property impresso: String read Fimpresso write Fimpresso;

      [FieldName('digital')]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property digital: String read Fdigital write Fdigital;

      [FieldName('senha')]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property senha: String read Fsenha write Fsenha;

      [FieldName('id_usuario')]
      [FieldOptions([foInsert, foSelect])]
      property id_usuario: Integer read Fid_usuario write Fid_usuario;

      [FieldName('id_empresa')]
      [FieldOptions([foInsert, foSelect])]
      property id_empresa: Integer read Fid_empresa write Fid_empresa;

      [FieldName('dataemissao')]
      [FieldOptions([foInsert, foSelect])]
      property dataemissao: TDateTime read Fdataemissao write Fdataemissao;

      [FieldName('token')]
      [FieldOptions([foInsert, foSelect])]
      property token: String read Ftoken write Ftoken;

      [FieldName('token_device')]
      [FieldOptions([foInsert, foSelect])]
      property token_device: String read Ftoken_device write Ftoken_device;

      [FieldName('qrcde')]
      [FieldOptions([foInsert, foSelect])]
      property qrcode: String read Fqrcode write Fqrcode;

      [FieldName('id_dependente')]
      [FieldOptions([foInsert, foSelect])]
      property id_dependente: Integer read Fid_dependente write Fid_dependente;

      [FieldName('api')]
      [FieldOptions([foInsert, foSelect])]
      property api: String read Fapi write Fapi;

      [FieldName('login')]
      [FieldOptions([foInsert, foSelect])]
      property login: String read Flogin write Flogin;

      [FieldName('nomeuser')]
      [FieldOptions([foInsert, foSelect])]
      property nomeuser: String read Fnomeuser write Fnomeuser;

      [FieldName('sinc_app')]
      [FieldOptions([foInsert, foUpdate, foSelect])]
      property sinc_app: String read Fsinc_app write Fsinc_app;

      [FieldName('excluido')]
      [FieldOptions([foInsert, foupdate, foSelect])]
      property excluido: Integer read Fexcluido write Fexcluido;

      [FieldName('data_exc')]
      [FieldOptions([foSelect])]
      property data_exc: TDateTime read Fdata_exc write Fdata_exc;

      [FieldName('id_usuario_exc')]
      [FieldOptions([foSelect])]
      property id_usuario_exc: Integer read Fid_usuario_exc write Fid_usuario_exc;

      //Variavel
      [FieldName('vMatricula')]
      [FieldOptions([foSelect])]
      [Editable(False)]
      property vMatricula: Integer read FvMatricula write FvMatricula;

      [FieldName('vCodigo')]
      [FieldOptions([foSelect])]
      [Editable(False)]
      property vCodigo: Integer read FvCodigo write FvCodigo;

      [FieldName('vNome')]
      [FieldOptions([foSelect])]
      [Editable(False)]
      property vNome: String read FvNome write FvNome;

      [FieldName('vCPF')]
      [FieldOptions([foSelect])]
      [Editable(False)]
      property vCPF: String read FvCPF write FvCPF;

      [FieldName('vRazaosecretaria')]
      [FieldOptions([foSelect])]
      [Editable(False)]
      property vRazaosecretaria: String read FvRazaosecretaria write FvRazaosecretaria;

      [FieldName('vParentesco')]
      [FieldOptions([foSelect])]
      [Editable(False)]
      property vParentesco: String read FvParentesco write FvParentesco;

      [FieldName('vNascimento')]
      [FieldOptions([foSelect])]
      [Editable(False)]
      property vNascimento: TDatetime read FvNascimento write FvNascimento;

      [FieldName('vWhatsapp')]
      [FieldOptions([foSelect])]
      [Editable(False)]
      property vWhatsapp: String read FvWhatsapp write FvWhatsapp;

      [FieldName('foto')]
      [FieldOptions([foInsert, foupdate, foSelect])]
      property foto: String read Ffoto write Ffoto;


      [FieldName('nmusuario')]
      [FieldOptions([foSelect])]
      [Editable(False)]
      property nmusuario: String read Fnmusuario write Fnmusuario;
  end;

implementation

end.
