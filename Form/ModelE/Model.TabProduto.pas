unit Model.TabProduto;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('produto')]
  TTabProduto = class

  private
    Fprc_promocao: Double;
    Festoque_inicial: Double;
    Fid_grupo: Integer;
    Fcontrolaestoque: String;
    Fdata_alteracao: Tdate;
    Fobservacao: String;
    Fpeso_kg: Double;
    Fid_produto: Integer;
    Fservico: String;
    Ffoto2: String;
    Fmostrar_app: String;
    Ffoto3: String;
    Fativo: String;
    Ffoto1: String;
    Fdescricao: String;
    Fdata_cadastro: Tdate;
    Fprc_custo: Double;
    Fcodigo: Integer;
    Fcod_barras: String;
    Fprc_venda: Double;
    Falterar_descricao: String;
    Ftipo_produto: String;
    Fper_custo: Double;
    Fcad_produto: String;
    Fid_localizacao: Integer;
    Festoque_atual: Double;
    Fid_empresa: Integer;
    Ffracionado: String;
    Festoque_minimo: Double;
    Fper_lucro: Double;
    Fprc_compra: Double;
    Fid_unidade: Integer;
    Fdescricao_fiscal: String;
    Freferencia: String;
    Favisos: String;
    Fid_marca: Integer;
    Fexcluido: Integer;
    Fid_usuario_alt: Integer;
    Fid_usuario: Integer;
    Fprod_gtin: String;
    Fprod_comissaoperc: Double;
    Fprod_estoque_maximo: Double;
    Fprod_materiaprima: String;
    Fprod_equipamento: String;
    Funi              : String;
    Flocalizacao      : String;
    Fmarca            : String;
    Fgrupo            : String;
    Fprod_estoque_per_negativo: String;
    Fpreco_m2: String;
    Farea_chapa: Double;
    Fusa_chapa: String;
    Faltura_chapa: Double;
    Flargura_chapa: Double;
    Fqtde_chapa: Double;

  Public
    [FieldName('id_produto', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_produto: Integer read Fid_produto write Fid_produto;

    [FieldName('codigo')]
    [FieldOptions([foInsert, foSelect])]
    property codigo: Integer read Fcodigo write Fcodigo;

    [FieldName('id_marca')]
    [FieldOptions([foInsert,foUpdate, foSelect])]
    property id_marca: Integer read Fid_marca write Fid_marca;

    [FieldName('id_grupo')]
    [FieldOptions([foInsert,foUpdate, foSelect])]
    property id_grupo: Integer read Fid_grupo write Fid_grupo;

    [FieldName('id_unidade')]
    [FieldOptions([foInsert,foUpdate, foSelect])]
    property id_unidade: Integer read Fid_unidade write Fid_unidade;

    [FieldName('id_localizacao')]
    [FieldOptions([foInsert,foUpdate, foSelect])]
    property id_localizacao: Integer read Fid_localizacao write Fid_localizacao;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert, foSelect])]
    property id_empresa: Integer read Fid_empresa write Fid_empresa;

    [FieldName('cod_barras')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property cod_barras: String read Fcod_barras write Fcod_barras;

    [FieldName('referencia')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property referencia: String read Freferencia write Freferencia;

    [FieldName('tipo_produto')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property tipo_produto: String read Ftipo_produto write Ftipo_produto;

    [FieldName('descricao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property descricao: String read Fdescricao write Fdescricao;

    [FieldName('descricao_fiscal')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property descricao_fiscal: String read Fdescricao_fiscal write Fdescricao_fiscal;

    [FieldName('servico')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property servico: String read Fservico write Fservico;

    [FieldName('ativo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property ativo: String read Fativo write Fativo;

    [FieldName('prc_compra')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property prc_compra: Double read Fprc_compra write Fprc_compra;

    [FieldName('per_custo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property per_custo: Double read Fper_custo write Fper_custo;

    [FieldName('prc_custo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property prc_custo: Double read Fprc_custo write Fprc_custo;

    [FieldName('per_lucro')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property per_lucro: Double read Fper_lucro write Fper_lucro;

    [FieldName('prc_venda')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property prc_venda: Double read Fprc_venda write Fprc_venda;

    [FieldName('estoque_minimo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property estoque_minimo: Double read Festoque_minimo write Festoque_minimo;

    [FieldName('estoque_inicial')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property estoque_inicial: Double read Festoque_inicial write Festoque_inicial;

    [FieldName('estoque_atual')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property estoque_atual: Double read Festoque_atual write Festoque_atual;

    [FieldName('peso_kg')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property peso_kg: Double read Fpeso_kg write Fpeso_kg;

    [FieldName('prc_promocao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property prc_promocao: Double read Fprc_promocao write Fprc_promocao;

    [FieldName('observacao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property observacao: String read Fobservacao write Fobservacao;

    [FieldName('avisos')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property avisos: String read Favisos write Favisos;

    [FieldName('mostrar_app')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property mostrar_app: String read Fmostrar_app write Fmostrar_app;

    [FieldName('alterar_descricao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property alterar_descricao: String read Falterar_descricao write Falterar_descricao;

    [FieldName('data_cadastro')]
    [FieldOptions([foInsert, foSelect])]
    property data_cadastro: Tdate read Fdata_cadastro write Fdata_cadastro;

    [FieldName('data_alteracao')]
    [FieldOptions([foUpdate])]
    property data_alteracao: Tdate read Fdata_alteracao write Fdata_alteracao;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert])]
    property id_usuario: Integer read Fid_usuario write Fid_usuario;

    [FieldName('id_usuario_alt')]
    [FieldOptions([foUpdate])]
    property id_usuario_alt: Integer read Fid_usuario_alt write Fid_usuario_alt;

    [FieldName('excluido')]
    [FieldOptions([foInsert, foSelect])]
    property excluido: Integer read Fexcluido write Fexcluido;

    [FieldName('foto1')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property foto1: String read Ffoto1 write Ffoto1;

    [FieldName('foto2')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property foto2: String read Ffoto2 write Ffoto2;

    [FieldName('foto3')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property foto3: String read Ffoto3 write Ffoto3;

    [FieldName('fracionado')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property fracionado: String read Ffracionado write Ffracionado;

    [FieldName('controlaestoque')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property controlaestoque: String read Fcontrolaestoque write Fcontrolaestoque;

    [FieldName('cad_produto')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property cad_produto: String read Fcad_produto write Fcad_produto;

    [FieldName('prod_gtin')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property prod_gtin: String read Fprod_gtin write Fprod_gtin;

    [FieldName('prod_comissaoperc')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property prod_comissaoperc: Double read Fprod_comissaoperc write Fprod_comissaoperc;

    [FieldName('prod_estoque_maximo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property prod_estoque_maximo: Double read Fprod_estoque_maximo write Fprod_estoque_maximo;

    [FieldName('prod_equipamento')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property prod_equipamento: String read Fprod_equipamento write Fprod_equipamento;

    [FieldName('prod_materiaprima')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property prod_materiaprima: String read Fprod_materiaprima write Fprod_materiaprima;

    [FieldName('prod_estoque_per_negativo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property prod_estoque_per_negativo: String read Fprod_estoque_per_negativo write Fprod_estoque_per_negativo;

    [FieldName('preco_m2')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property preco_m2: String read Fpreco_m2 write Fpreco_m2;

    [FieldName('grupo')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property grupo: String read Fgrupo write Fgrupo;

    [FieldName('marca')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property marca: String read Fmarca write Fmarca;

    [FieldName('uni')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property uni: String read Funi write Funi;

    [FieldName('localizacao')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property localizacao: String read Flocalizacao write Flocalizacao;

    [FieldName('usa_chapa')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property usa_chapa: String read Fusa_chapa write Fusa_chapa;

    [FieldName('largura_chapa')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property largura_chapa: Double read Flargura_chapa write Flargura_chapa;


    [FieldName('altura_chapa')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property altura_chapa: Double read Faltura_chapa write Faltura_chapa;

    [FieldName('area_chapa')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property area_chapa: Double read Farea_chapa write Farea_chapa;

    [FieldName('qtde_chapa')]
    [FieldOptions([foInsert, foSelect])]
    property qtde_chapa: Double read Fqtde_chapa write Fqtde_chapa;

  end;

type
  [TableName('produto_equipamento')]
  TTabProdutoEquipamento = class

  private
    Fid_produto       : Integer;
    Fid_equipamento   : Integer;
    Fnum_patrimonio   : String;
    Fdata_cadastro    : Tdate;
    Fid_cliente       : Integer;
    Fnumero_serie     : String;
    Ftipo_equipamento : String;
    Fid_empresa       : Integer;
    Fid_usuario       : Integer;
    Fid_modelo        : Integer;


  Public
    [FieldName('id_equipamento', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_equipamento: Integer read Fid_equipamento write Fid_equipamento;

    [FieldName('id_produto')]
    [FieldOptions([foInsert, foSelect])]
    property id_produto: Integer read Fid_produto write Fid_produto;

    [FieldName('id_cliente')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_cliente: Integer read Fid_cliente write Fid_cliente;

    [FieldName('tipo_equipamento')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property tipo_equipamento: String read Ftipo_equipamento write Ftipo_equipamento;

    [FieldName('numero_serie')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property numero_serie: String read Fnumero_serie write Fnumero_serie;

    [FieldName('num_patrimonio')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property num_patrimonio: String read Fnum_patrimonio write Fnum_patrimonio;

    [FieldName('data_cadastro')]
    [FieldOptions([foInsert, foSelect])]
    property data_cadastro: Tdate read Fdata_cadastro write Fdata_cadastro;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert, foSelect])]
    property id_empresa: Integer read Fid_empresa write Fid_empresa;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert, foSelect])]
    property id_usuario: Integer read Fid_usuario write Fid_usuario;

    [FieldName('id_modelo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_modelo: Integer read Fid_modelo write Fid_modelo;







  end;

implementation

end.
