unit Model.EntradaVeiculoItens;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('compra_itens')]
  TEntradaVeiculoItens = class
  private
    FIdCompraItens: Integer;
    FIdCompra: Integer;
    FIdProdutoVeiculo: Integer;
    FQtde: Double;
    FPrcUnitario: Double;
    FDescPercentual: Double;
    FDescReais: Double;
    FDescricao: string;
    FComplemento: string;
    FSubtotal: Double;
    FTotal: Double;
    FVeiculoTroca: string;
    FVeiculoPrcFipe: Double;
    FVeiculoPrcVenda: Double;
    FData: TDate;
    FDataCriado: TDateTime;
    FIdEmpresa: Integer;
    FIdUsuario: Integer;
    FVeiculoPercLucro: Double;
    FAtualizarFicha: string;
    FTaxaMes: Double;
    FTaxaDia: Double;
    FTotalPatio: Double;
    FComissaoLojaPerc: Double;
    FComissaoLojaValor: Double;
    FComissaoVendPerc: Double;
    FComissaoVendValor: Double;
    FTaxaConsignado: Double;
    FDataRetiradaConsi: TDate;
    FVeiculoLucroValor: Double;
    FVeiculoValorPraticado: Double;
    FPrcCusto: Double;
    FVeiculoValorTroca: Double;
    Fnmplaca: string;
    Fanomodelo: string;
    Fcodigo: Integer;
    Fdescricao_fiscal: string;
    Fcor: string;
  public

    [FieldName('id_compra_itens', True)] //pkAuto
    [FieldOptions([foInsert])]
    property IdCompraItens: Integer read FIdCompraItens write FIdCompraItens;

    [FieldName('id_compra')]
    [FieldOptions([foInsert, foSelect])]
    //[Editable(False)]
    property IdCompra: Integer read FIdCompra write FIdCompra;

    [FieldName('id_produto_veiculo')]
    [FieldOptions([foInsert, foSelect])]
    property IdProdutoVeiculo: Integer read FIdProdutoVeiculo write FIdProdutoVeiculo;

    [FieldName('qtde')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property Qtde: Double read FQtde write FQtde;

    [FieldName('prc_unitario')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property PrcUnitario: Double read FPrcUnitario write FPrcUnitario;

    [FieldName('desc_percentual')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property DescPercentual: Double read FDescPercentual write FDescPercentual;

    [FieldName('desc_reais')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property DescReais: Double read FDescReais write FDescReais;

    [FieldName('descricao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property Descricao: string read FDescricao write FDescricao;

    [FieldName('complemento')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property Complemento: string read FComplemento write FComplemento;

    [FieldName('subtotal')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property Subtotal: Double read FSubtotal write FSubtotal;

    [FieldName('total')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property Total: Double read FTotal write FTotal;

    [FieldName('veiculo_troca')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property VeiculoTroca: string read FVeiculoTroca write FVeiculoTroca;

    [FieldName('veiculo_prcfipe')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property VeiculoPrcFipe: Double read FVeiculoPrcFipe write FVeiculoPrcFipe;

    [FieldName('veiculo_prcvenda')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property VeiculoPrcVenda: Double read FVeiculoPrcVenda write FVeiculoPrcVenda;

    [FieldName('data')]
    [FieldOptions([foInsert])]
    property Data: TDate read FData write FData;

    [FieldName('data_criado')]
    [FieldOptions([foInsert])]
    property DataCriado: TDateTime read FDataCriado write FDataCriado;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert])] // Apenas no insert
    //[Editable(False)]
    property IdEmpresa: Integer read FIdEmpresa write FIdEmpresa;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert])] // Apenas no insert
    //[Editable(False)]
    property IdUsuario: Integer read FIdUsuario write FIdUsuario;

    [FieldName('veiculoperclucro')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property VeiculoPercLucro: Double read FVeiculoPercLucro write FVeiculoPercLucro;

    [FieldName('atualizarficha')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property AtualizarFicha: string read FAtualizarFicha write FAtualizarFicha;

    [FieldName('taxames')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property TaxaMes: Double read FTaxaMes write FTaxaMes;

    [FieldName('taxadia')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property TaxaDia: Double read FTaxaDia write FTaxaDia;

    [FieldName('totalpatio')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property TotalPatio: Double read FTotalPatio write FTotalPatio;

    [FieldName('comissaolojaperc')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property ComissaoLojaPerc: Double read FComissaoLojaPerc write FComissaoLojaPerc;

    [FieldName('comissaolojavalor')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property ComissaoLojaValor: Double read FComissaoLojaValor write FComissaoLojaValor;

    [FieldName('comissaovendperc')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property ComissaoVendPerc: Double read FComissaoVendPerc write FComissaoVendPerc;

    [FieldName('comissaovendvalor')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property ComissaoVendValor: Double read FComissaoVendValor write FComissaoVendValor;

    [FieldName('taxaconsignado')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property TaxaConsignado: Double read FTaxaConsignado write FTaxaConsignado;

    [FieldName('dataretiradaconsi')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property DataRetiradaConsi: TDate read FDataRetiradaConsi write FDataRetiradaConsi;

    [FieldName('veiculolucrovalor')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property VeiculoLucroValor: Double read FVeiculoLucroValor write FVeiculoLucroValor;

    [FieldName('veiculo_valorpraticado')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property VeiculoValorPraticado: Double read FVeiculoValorPraticado write FVeiculoValorPraticado;

    [FieldName('prc_custo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property PrcCusto: Double read FPrcCusto write FPrcCusto;

    [FieldName('veiculo_valortroca')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property VeiculoValorTroca: Double read FVeiculoValorTroca write FVeiculoValorTroca;

    [FieldName('codigo')]
    [FieldOptions([foSelect])]
    property codigo: Integer read Fcodigo write Fcodigo;

    [FieldName('descricao_fiscal')]
    [FieldOptions([foSelect])]
    property descricao_fiscal: string read Fdescricao_fiscal write Fdescricao_fiscal;

    [FieldName('nmplaca')]
    [FieldOptions([foSelect])]
    property nmplaca: string read Fnmplaca write Fnmplaca;

    [FieldName('anomodelo')]
    [FieldOptions([foSelect])]
    property anomodelo: string read Fanomodelo write Fanomodelo;

    [FieldName('cor')]
    [FieldOptions([foSelect])]
    property cor: string read Fcor write Fcor;

  end;

implementation

end.

