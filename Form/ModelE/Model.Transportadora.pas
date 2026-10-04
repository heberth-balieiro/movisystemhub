unit Model.Transportadora;

interface

Uses
  System.SysUtils, System.Classes, uAtributosRTTI;

Type
  [TableName('transportadora')]
  TModelTransportadora = Class

  Private
    Fid_usuario_exclusao: integer;
    Fdata_exclusao: Tdate;
    Ffantasia: string;
    Fcnpj: String;
    Femail: string;
    Fbairro: string;
    Fantt: string;
    Fativo: string;
    Fid: integer;
    Fcodigo: integer;
    Fcep: string;
    Fnumero: String;
    Fie: string;
    Fcomplemento: string;
    Fid_empresa: integer;
    Ftipo: integer;
    Fexcluido: integer;
    Fendereco: string;
    Fid_usuario: integer;
    Ftelefone: string;
    Frazao: string;
    Fdatacriacao: Tdate;
    Fidcidade: integer;
    Fnmcidade: string;

  Public
    [FieldName('id_transportadora', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    Property id_transportadora           :integer  read  Fid       write Fid;

    [FieldName('codigo')]
    [FieldOptions([foInsert,foSelect])]
    Property codigo       :integer  read  Fcodigo   write Fcodigo;

    [FieldName('cnpj')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    Property cnpj         :String   read  Fcnpj     write Fcnpj;

    [FieldName('razao')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    Property razao        :string   read  Frazao    write Frazao;

    [FieldName('fantasia')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    Property fantasia     :string   read  Ffantasia write Ffantasia;

    [FieldName('ie')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    Property ie           :string   read  Fie       write Fie;

    [FieldName('antt')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    Property antt         :string   read  Fantt     write Fantt;

    [FieldName('cep')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    Property cep          :string   read  Fcep      write Fcep;

    [FieldName('endereco')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    Property endereco     :string   read  Fendereco write Fendereco;

    [FieldName('numero')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    Property numero       :String   read  Fnumero   write Fnumero;

    [FieldName('bairro')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    Property bairro       :string   read  Fbairro   write Fbairro;

    [FieldName('complemento')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    Property complemento  :string   read  Fcomplemento  write Fcomplemento;

    [FieldName('id_cidade')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    Property id_cidade     :integer  read  Fidcidade write fidcidade;

    [FieldName('email')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    Property email        :string   read  Femail    write Femail;

    [FieldName('telefone')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    Property telefone     :string   read  Ftelefone write Ftelefone;

    [FieldName('datacriacao')]
    [FieldOptions([foInsert,foSelect])]
    Property datacriacao  :Tdate    read  Fdatacriacao write Fdatacriacao;

    [FieldName('ativo')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    Property ativo        :string   read  Fativo    write FAtivo;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert,foSelect])]
    Property id_empresa   :integer  read  Fid_empresa write Fid_empresa;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert,foSelect])]
    Property id_usuario   :integer  read  Fid_usuario write Fid_usuario;

    [FieldName('tipo')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    Property tipo         :integer  read  Ftipo     write Ftipo;

    [FieldName('excluido')]
    [FieldOptions([foInsert,foSelect])]
    Property excluido     :integer  read  Fexcluido write Fexcluido;

    [FieldName('data_exclusao')]
    [FieldOptions([foSelect])]
    Property data_exclusao:Tdate    read  Fdata_exclusao  write Fdata_exclusao;

    [FieldName('id_usuario_exclusao')]
    [FieldOptions([foSelect])]
    Property id_usuario_exclusao  :integer  read  Fid_usuario_exclusao  write Fid_usuario_exclusao;

    [FieldName('nmcidade')]
    [FieldOptions([foSelect])]
    [Edittable(False)]
    Property nmcidade     :string   read  Fnmcidade write Fnmcidade;

  End;

implementation

end.
