unit Model.EleicaoChapaMembro;

interface

uses
  System.SysUtils,
  System.Classes,
  uAtributosRTTI;

type
  [TableName('eleicao_chapa_membro')]
  TModelChapaMembro = class

  private
    Fid: Integer;
    Fid_eleicao: Integer;
    Fid_chapa: Integer;
    Fid_empresa: Integer;
    Fcodigo: Integer;
    Fnome: string;
    Fcpf: string;
    Ftelefone: string;
    Femail: string;
    Fativo: string;
    Fcargo: string;
    Ftipo: string;
    Fobservacao: string;
    Fdatacriacao: TDateTime;
    Fdataalteracao: TDateTime;
    Fid_usuario: Integer;
    Fid_usuario_alt: Integer;
    Farquivo_foto: TBytes;
    Fextensao_foto: string;
    Fcaminho_foto: string;
    Fsinc_app: string;

  public

    [FieldName('id', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id: Integer    read Fid   write Fid;

    [FieldName('id_eleicao')]
    [FieldOptions([foInsert, foSelect])]
    property id_eleicao: Integer  read Fid_eleicao   write Fid_eleicao;

    [FieldName('id_chapa')]
    [FieldOptions([foInsert, foSelect])]
    property id_chapa: Integer    read Fid_chapa    write Fid_chapa;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert, foSelect])]
    property id_empresa: Integer    read Fid_empresa   write Fid_empresa;

    [FieldName('codigo')]
    [FieldOptions([foInsert, foSelect])]
    property codigo: Integer      read Fcodigo      write Fcodigo;

    [FieldName('nome')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property nome: string    read Fnome     write Fnome;

    [FieldName('cpf')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property cpf: string       read Fcpf      write Fcpf;

    [FieldName('telefone')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property telefone: string      read Ftelefone      write Ftelefone;

    [FieldName('email')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property email: string      read Femail      write Femail;

    [FieldName('ativo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property ativo: string      read Fativo      write Fativo;

    [FieldName('cargo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property cargo: string      read Fcargo      write Fcargo;

    [FieldName('tipo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property tipo: string      read Ftipo      write Ftipo;

    [FieldName('observacao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property observacao: string      read Fobservacao      write Fobservacao;

    [FieldName('datacriacao')]
    [FieldOptions([foInsert, foSelect])]
    property datacriacao: TDateTime      read Fdatacriacao      write Fdatacriacao;

    [FieldName('dataalteracao')]
    [FieldOptions([foUpdate, foSelect])]
    property dataalteracao: TDateTime       read Fdataalteracao      write Fdataalteracao;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert, foSelect])]
    property id_usuario: Integer      read Fid_usuario      write Fid_usuario;

    [FieldName('id_usuario_alt')]
    [FieldOptions([foUpdate, foSelect])]
    property id_usuario_alt: Integer      read Fid_usuario_alt      write Fid_usuario_alt;

    [FieldName('arquivo_foto')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property arquivo_foto: TBytes      read Farquivo_foto      write Farquivo_foto;

    [FieldName('extensao_foto')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property extensao_foto: string      read Fextensao_foto      write Fextensao_foto;

    [FieldName('caminho_foto')]
    [FieldOptions([foSelect])]
    [Editable(false)]
    property caminho_foto: string      read Fcaminho_foto      write Fcaminho_foto;


    [FieldName('sinc_app')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property sinc_app: string      read Fsinc_app      write Fsinc_app;

  end;

implementation

end.
