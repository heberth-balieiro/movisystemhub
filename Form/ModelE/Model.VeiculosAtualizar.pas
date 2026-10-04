unit Model.VeiculosAtualizar;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('produto')]
  TVeiculoAtualizar = class

  private
    Fveiculo_patiototal: double;
    Fveiculo_patiotaxames: double;
    Fveiculo_comissaoljpercentual: double;
    Fveiculo_comissaovendtotal: double;
    Fprc_custo: double;
    Fveiculo_patiotaxadia: double;
    Fveiculo_valorpraticado: double;
    Fprc_venda: double;
    FId: Integer;
    Fveiculo_comissaoljtotal: double;
    Fper_custo: double;
    Fveiculo_lucro: double;
    Fper_lucro: double;
    Fprc_compra: double;
    Fveiculo_comissaovendpercentual: double;
    Fveiculo_custototal: double;
    Fveiculo_valortroca: double;
    Fveiculo_fipe: double;


  public
    [FieldName('id_produto', True)] //pkAuto
    [FieldOptions([foUpdate, foSelect])]
    property Id: Integer read FId write FId;

    [FieldName('prc_compra')]
    [FieldOptions([foUpdate,foSelect])]
    property prc_compra: double read Fprc_compra write Fprc_compra;

    [FieldName('per_custo')]
    [FieldOptions([foUpdate,foSelect])]
    property per_custo: double read Fper_custo write Fper_custo;

    [FieldName('prc_custo')]
    [FieldOptions([foUpdate,foSelect])]
    property prc_custo: double read Fprc_custo write Fprc_custo;

    [FieldName('per_lucro')]
    [FieldOptions([foUpdate,foSelect])]
    property per_lucro: double read Fper_lucro write Fper_lucro;

    [FieldName('prc_venda')]
    [FieldOptions([foSelect])]
    property prc_venda: double read Fprc_venda write Fprc_venda;

    [FieldName('veiculo_custototal')]
    [FieldOptions([foUpdate,foSelect])]
    property veiculo_custototal: double read Fveiculo_custototal write Fveiculo_custototal;

    [FieldName('veiculo_valortroca')]
    [FieldOptions([foUpdate,foSelect])]
    property veiculo_valortroca: double read Fveiculo_valortroca write Fveiculo_valortroca;

    [FieldName('veiculo_lucro')]
    [FieldOptions([foSelect])]
    property veiculo_lucro: double read Fveiculo_lucro write Fveiculo_lucro;

    [FieldName('veiculo_valorpraticado')]
    [FieldOptions([foSelect])]
    property veiculo_valorpraticado: double read Fveiculo_valorpraticado write Fveiculo_valorpraticado;

    [FieldName('veiculo_patiotaxames')]
    [FieldOptions([foSelect])]
    property veiculo_patiotaxames: double read Fveiculo_patiotaxames write Fveiculo_patiotaxames;

    [FieldName('veiculo_patiotaxadia')]
    [FieldOptions([foSelect])]
    property veiculo_patiotaxadia: double read Fveiculo_patiotaxadia write Fveiculo_patiotaxadia;

    [FieldName('veiculo_patiototal')]
    [FieldOptions([foSelect])]
    property veiculo_patiototal: double read Fveiculo_patiototal write Fveiculo_patiototal;

    [FieldName('veiculo_comissaoljpercentual')]
    [FieldOptions([foSelect])]
    property veiculo_comissaoljpercentual: double read Fveiculo_comissaoljpercentual write Fveiculo_comissaoljpercentual;

    [FieldName('veiculo_comissaoljtotal')]
    [FieldOptions([foSelect])]
    property veiculo_comissaoljtotal: double read Fveiculo_comissaoljtotal write Fveiculo_comissaoljtotal;

    [FieldName('veiculo_comissaovendpercentual')]
    [FieldOptions([foSelect])]
    property veiculo_comissaovendpercentual: double read Fveiculo_comissaovendpercentual write Fveiculo_comissaovendpercentual;

    [FieldName('veiculo_comissaovendtotal')]
    [FieldOptions([foSelect])]
    property veiculo_comissaovendtotal: double read Fveiculo_comissaovendtotal write Fveiculo_comissaovendtotal;

    [FieldName('veiculo_fipe')]
    [FieldOptions([foUpdate,foSelect])]
    property veiculo_fipe: double read Fveiculo_fipe write Fveiculo_fipe;

  end;

type
  [TableName('produtos_valores')]
  TVeiculoValores = class
    Private
    Fperc_lucro: Double;
    Fhistorico: string;
    Fvendedorcomissaopercentual: Double;
    Fid_produto: Integer;
    Flojacomissaopercentual: Double;
    Fvendedorcomissaovalor: Double;
    Fvlr_praticado: Double;
    Fid_pedido: Integer;
    Flojacomissaovelor: Double;
    Fdata_movimentacao: TDate;
    Ftaxames: Double;
    Fvlr_venda: Double;
    Fid_valores: Integer;
    Fid_compra: Integer;
    Fvlr_lucro: Double;
    Ftotalpatio: Double;
    Fvlr_troca: Double;
    Fvlr_compra: Double;
    Ftaxadia: Double;
    Fvlr_fipe: Double;

    Public

      [FieldName('id_valores', True)] //pkAuto
      [FieldOptions([foInsert])]
      property id_valores: Integer read Fid_valores write Fid_valores;

      [FieldName('id_produto')]
      [FieldOptions([foInsert])]
      property id_produto: Integer read Fid_produto write Fid_produto;

      [FieldName('id_compra')]
      [FieldOptions([foInsert])]
      property id_compra: Integer read Fid_compra write Fid_compra;

      [FieldName('id_pedido')]
      [FieldOptions([foInsert])]
      property id_pedido: Integer read Fid_pedido write Fid_pedido;

      [FieldName('historico')]
      [FieldOptions([foInsert])]
      property historico: string read Fhistorico write Fhistorico;

      [FieldName('data_movimentacao')]
      [FieldOptions([foInsert])]
      property data_movimentacao: TDate read Fdata_movimentacao write Fdata_movimentacao;

      [FieldName('vlr_fipe')]
      [FieldOptions([foInsert])]
      property vlr_fipe: Double read Fvlr_fipe write Fvlr_fipe;

      [FieldName('vlr_compra')]
      [FieldOptions([foInsert])]
      property vlr_compra: Double read Fvlr_compra write Fvlr_compra;

      [FieldName('vlr_lucro')]
      [FieldOptions([foInsert])]
      property vlr_lucro: Double read Fvlr_lucro write Fvlr_lucro;

      [FieldName('perc_lucro')]
      [FieldOptions([foInsert])]
      property perc_lucro: Double read Fperc_lucro write Fperc_lucro;

      [FieldName('vlr_venda')]
      [FieldOptions([foInsert])]
      property vlr_venda: Double read Fvlr_venda write Fvlr_venda;

      [FieldName('vlr_troca')]
      [FieldOptions([foInsert])]
      property vlr_troca: Double read Fvlr_troca write Fvlr_troca;

      [FieldName('vlr_praticado')]
      [FieldOptions([foInsert])]
      property vlr_praticado: Double read Fvlr_praticado write Fvlr_praticado;

      [FieldName('taxames')]
      [FieldOptions([foInsert])]
      property taxames: Double read Ftaxames write Ftaxames;

      [FieldName('taxadia')]
      [FieldOptions([foInsert])]
      property taxadia: Double read Ftaxadia write Ftaxadia;

      [FieldName('totalpatio')]
      [FieldOptions([foInsert])]
      property totalpatio: Double read Ftotalpatio write Ftotalpatio;

      [FieldName('lojacomissaopercentual')]
      [FieldOptions([foInsert])]
      property lojacomissaopercentual: Double read Flojacomissaopercentual write Flojacomissaopercentual;

      [FieldName('lojacomissaovelor')]
      [FieldOptions([foInsert])]
      property lojacomissaovelor: Double read Flojacomissaovelor write Flojacomissaovelor;

      [FieldName('vendedorcomissaopercentual')]
      [FieldOptions([foInsert])]
      property vendedorcomissaopercentual: Double read Fvendedorcomissaopercentual write Fvendedorcomissaopercentual;

      [FieldName('vendedorcomissaovalor')]
      [FieldOptions([foInsert])]
      property vendedorcomissaovalor: Double read Fvendedorcomissaovalor write Fvendedorcomissaovalor;


  end;

implementation

end.

