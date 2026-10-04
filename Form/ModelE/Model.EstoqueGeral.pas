unit Model.EstoqueGeral;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('movimentacao_estoque')]
  Testoquemovimentacao = class

  private
    Fpreco_venda: Double;
    Fobservacao: String;
    Fid_produto: Integer;
    Fid_pedido: Integer;
    Fpreco_compra: Double;
    Fdata_movimentacao: Tdate;
    Fid_compra: Integer;
    Fquantidade_anterior: Double;
    Fquantidade: Double;
    Fid_empresa: Integer;
    Ftipo: String;
    Fnum_operacao: Integer;
    Fid_usuario: Integer;
    Fid_movimentacao: Integer;

  public
    [FieldName('id_movimentacao', True)] //pkAuto
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_movimentacao: Integer read Fid_movimentacao write Fid_movimentacao;

    [FieldName('id_produto')]
    [FieldOptions([foInsert, foUpdate,foSelect])]
    property id_produto: Integer read Fid_produto write Fid_produto;

    [FieldName('tipo')]
    [FieldOptions([foInsert, foUpdate,foSelect])]
    property tipo: String read Ftipo write Ftipo;

    [FieldName('quantidade')]
    [FieldOptions([foInsert, foUpdate,foSelect])]
    property quantidade: Double read Fquantidade write Fquantidade;

    [FieldName('quantidade_anterior')]
    [FieldOptions([foInsert, foUpdate,foSelect])]
    property quantidade_anterior: Double read Fquantidade_anterior write Fquantidade_anterior;

    [FieldName('preco_compra')]
    [FieldOptions([foInsert, foUpdate,foSelect])]
    property preco_compra: Double read Fpreco_compra write Fpreco_compra;

    [FieldName('preco_venda')]
    [FieldOptions([foInsert, foUpdate,foSelect])]
    property preco_venda: Double read Fpreco_venda write Fpreco_venda;

    [FieldName('data_movimentacao')]
    [FieldOptions([foInsert, foUpdate,foSelect])]
    property data_movimentacao: Tdate read Fdata_movimentacao write Fdata_movimentacao;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert, foUpdate,foSelect])]
    property id_usuario: Integer read Fid_usuario write Fid_usuario;

    [FieldName('observacao')]
    [FieldOptions([foInsert, foUpdate,foSelect])]
    property observacao: String read Fobservacao write Fobservacao;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert, foUpdate,foSelect])]
    property id_empresa: Integer read Fid_empresa write Fid_empresa;

    [FieldName('num_operacao')]
    [FieldOptions([foInsert, foUpdate,foSelect])]
    property num_operacao: Integer read Fnum_operacao write Fnum_operacao;

    [FieldName('id_pedido')]
    [FieldOptions([foInsert, foUpdate,foSelect])]
    property id_pedido: Integer read Fid_pedido write Fid_pedido;

    [FieldName('id_compra')]
    [FieldOptions([foInsert, foUpdate,foSelect])]
    property id_compra: Integer read Fid_compra write Fid_compra;

  end;

type
  [TableName('produto')]
  TProdutoEstoque = class

  private
    Fid_produto: Integer;
    Festoque_atual: double;
    Fqtdenova: double;

  public
    [FieldName('id_produto', true)]
    [FieldOptions([foUpdate])]
    property id_produto: Integer read Fid_produto write Fid_produto;

    [FieldName('estoque_atual')]
    [FieldOptions([foUpdate])]
    [TFieldMathOp('soma')]
    property estoque_atual: double read Festoque_atual write Festoque_atual;

    [FieldName('qtdenova')]
    [Editable(False)]
    property qtdenova: double read Fqtdenova write Fqtdenova;

  end;

implementation

end.
