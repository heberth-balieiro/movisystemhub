unit Model.Bem;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('bens')]
  TModelBem = class
  private
    Fid_bem: Integer;
    Fcodigo: Integer;
    Fdescricao: String;
    Ftombamento: String;

    Fid_categoria: Integer;
    Fid_grupo: Integer;
    Fid_localizacao: Integer;
    Fid_departamento: Integer;
    Fid_marca: Integer;

    Fmodelo: String;
    Fnumero_serie: String;

    Fdata_aquisicao: TDate;
    Fvalor_aquisicao: Currency;
    Fvida_util_meses: Integer;

    Fid_fornecedor: Integer;
    Fnota_fiscal: String;
    Fobservacao: String;

    Fativo: String;
    Fexcluido: Integer;

    Fid_usuario: Integer;
    Fid_usuario_alt: Integer;
    Fid_usuario_exc: Integer;

    Fid_empresa: Integer;

    Fdata_cadastro: TDateTime;
    Fdata_alteracao: TDateTime;
    Fdata_exclusao: TDateTime;
    Fsituacao: String;
    Flocalizacao: String;
    Fdepartamento: String;
    Ftem_anexo: Integer;

  public
    [FieldName('id_bem', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_bem: Integer read Fid_bem write Fid_bem;

    [FieldName('codigo')]
    [FieldOptions([foInsert,foSelect])]
    property codigo: Integer read Fcodigo write Fcodigo;

    [FieldName('descricao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property descricao: String read Fdescricao write Fdescricao;

    [FieldName('tombamento')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property tombamento: String read Ftombamento write Ftombamento;

    [FieldName('id_categoria')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_categoria: Integer read Fid_categoria write Fid_categoria;

    [FieldName('id_grupo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_grupo: Integer read Fid_grupo write Fid_grupo;

    [FieldName('id_localizacao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_localizacao: Integer read Fid_localizacao write Fid_localizacao;

    [FieldName('id_departamento')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_departamento: Integer read Fid_departamento write Fid_departamento;

    [FieldName('id_marca')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_marca: Integer read Fid_marca write Fid_marca;

    [FieldName('modelo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property modelo: String read Fmodelo write Fmodelo;

    [FieldName('numero_serie')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property numero_serie: String read Fnumero_serie write Fnumero_serie;

    [FieldName('data_aquisicao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property data_aquisicao: TDate read Fdata_aquisicao write Fdata_aquisicao;

    [FieldName('valor_aquisicao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property valor_aquisicao: Currency read Fvalor_aquisicao write Fvalor_aquisicao;

    [FieldName('vida_util_meses')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property vida_util_meses: Integer read Fvida_util_meses write Fvida_util_meses;

    [FieldName('id_fornecedor')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_fornecedor: Integer read Fid_fornecedor write Fid_fornecedor;

    [FieldName('nota_fiscal')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property nota_fiscal: String read Fnota_fiscal write Fnota_fiscal;

    [FieldName('observacao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property observacao: String read Fobservacao write Fobservacao;

    [FieldName('ativo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property ativo: String read Fativo write Fativo;

    [FieldName('excluido')]
    [FieldOptions([foInsert, foSelect])]
    property excluido: Integer read Fexcluido write Fexcluido;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert, foSelect])]
    property id_usuario: Integer read Fid_usuario write Fid_usuario;

    [FieldName('id_usuario_alt')]
    [FieldOptions([foUpdate])]
    property id_usuario_alt: Integer read Fid_usuario_alt write Fid_usuario_alt;

    [FieldName('id_usuario_exc')]
    [FieldOptions([foSelect])]
    property id_usuario_exc: Integer read Fid_usuario_exc write Fid_usuario_exc;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert, foSelect])]
    property id_empresa: Integer read Fid_empresa write Fid_empresa;

    [FieldName('data_cadastro')]
    [FieldOptions([foInsert, foSelect])]
    property data_cadastro: TDateTime read Fdata_cadastro write Fdata_cadastro;

    [FieldName('data_alteracao')]
    [FieldOptions([foUpdate])]
    property data_alteracao: TDateTime read Fdata_alteracao write Fdata_alteracao;

    [FieldName('data_exclusao')]
    [FieldOptions([foSelect])]
    property data_exclusao: TDateTime read Fdata_exclusao write Fdata_exclusao;

    [FieldName('situacao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property situacao: String read Fsituacao write Fsituacao;

    [FieldName('departamento')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property departamento: String read Fdepartamento write Fdepartamento;

    [FieldName('localizacao')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property localizacao: String read Flocalizacao write Flocalizacao;

    [FieldName('tem_anexo')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property tem_anexo: Integer read Ftem_anexo write Ftem_anexo;



  end;

implementation

end.
