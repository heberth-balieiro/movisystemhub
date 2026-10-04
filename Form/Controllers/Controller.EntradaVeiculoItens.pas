unit Controller.EntradaVeiculoItens;

interface

uses
  Model.EntradaVeiculoItens,
  Dao.Operacoes,
  System.SysUtils, System.Generics.Collections;

type
  TEntradaItensVeiculoController = class
  private
    FDAO: TDAOOperacao<TEntradaVeiculoItens>;
    function InteirosParaString(const Lista: TArray<Integer>): string;


  public
    constructor Create;
    destructor Destroy; override;

    function ListarTodos(const FiltroStatus, FiltroTipo, FiltroCampo: string): TObjectList<TEntradaVeiculoItens>;
    function ListarPorIdsCompra(
      const ListaIdsCompra: TArray<Integer>): TObjectList<TEntradaVeiculoItens>;
    function ListarPorIdsCompraTroca(
      const ListaIdsCompra: TArray<Integer>): TObjectList<TEntradaVeiculoItens>;
    function BuscarPorID(AID, AIDs: Integer): TObjectList<TEntradaVeiculoItens>;// buscar por idcompra e idveiculo
    function BuscarPorIDOBJ(AID: Integer): TObjectList<TEntradaVeiculoItens>; //buscar dados id do objeto exemplo id_veiculo
    function Salvar(ADoc: TEntradaVeiculoItens; out RetornoID:integer): Boolean;
    function Excluir(AID: Integer): Boolean;
  end;

implementation

uses UDM, cxDateUtils, REST.Json;

{ TEntradaItensVeiculo }

function TEntradaItensVeiculoController.BuscarPorIDOBJ(AID: Integer): TObjectList<TEntradaVeiculoItens>;
var
  SQL: string;
begin
  //Retornar os dados de um veiculo da ficha
  SQL :=        ' Select                                          '+
                ' id_produto as IdProdutoVeiculo,                 '+
                ' codigo,                                         '+
                ' descricao,                                      '+
                ' descricao_fiscal,                               '+
                ' prc_compra as PrcUnitario,                      '+
                ' prc_venda as VeiculoPrcVenda,                   '+
                ' veiculo_placa as nmplaca,                       '+
                ' veiculo_fipe as VeiculoPrcFipe,                 '+
                ' prc_custo as PrcCusto,                          '+
                ' veiculo_valortroca as VeiculoValorTroca,        '+
                ' veiculo_lucro as VeiculoLucroValor,             '+
                ' veiculo_valorpraticado as VeiculoValorPraticado,'+
                ' per_lucro as veiculoperclucro,                  '+
                ' veiculo_patiotaxames as taxames,                '+
                ' veiculo_patiotaxadia as taxadia,                '+
                ' veiculo_patiototal as totalpatio,               '+
                ' veiculo_comissaoljpercentual as comissaolojaperc,'+
                ' veiculo_comissaoljtotal as comissaolojavalor,'+
                ' veiculo_comissaovendpercentual as comissaovendperc,'+
                ' veiculo_comissaovendtotal as comissaovendvalor'+
                ' From produto where id_produto= '+IntToStr(AID)+' limit 1;';


  Result := FDAO.FindWhere(SQL,[]);
end;

constructor TEntradaItensVeiculoController.Create;
begin
  FDAO := TDAOOperacao<TEntradaVeiculoItens>.Create(dm.Conn);
end;

destructor TEntradaItensVeiculoController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TEntradaItensVeiculoController.ListarTodos(const FiltroStatus, FiltroTipo, FiltroCampo: string): TObjectList<TEntradaVeiculoItens>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL := 'Select                              '+
          'c.id_compra_itens,                 '+
          'c.id_produto_veiculo,              '+
          'c.qtde,                            '+
          'c.prc_unitario,                    '+
          'c.subtotal,                        '+
          'c.total,                           '+
          'c.veiculo_prcfipe,                 '+
          'c.prc_custo,                       '+
          'p.codigo,                          '+
          'p.descricao,                       '+
          'p.descricao_fiscal,                '+
          'p.veiculo_placa,                   '+
          'p.veiculo_ano,                     '+
          'p.veiculo_ano_modelo               '+
          'From Compra_itens c                '+
          'Inner Join Produto P               '+
          'on c.id_produto_veiculo = p.id_produto';

  {SQLORDER  := ' order by c.id_compra, c.data, c.numero';

  if FiltroCampo.Trim <> '' then
  begin
    SQL := SQL + ' AND (c.numero LIKE :filtro or s.nome like :filtro or f.nome like :filtro)';
    Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
  end;

  if FiltroStatus = 'A' then
  begin
    SQL := SQL + ' AND c.situacao = :situacao';
    Params := Params + [TPair<string, Variant>.Create('situacao', FiltroStatus)];
  end
  else if FiltroStatus = 'F' then
  begin
    SQL := SQL + ' AND c.situacao = :situacao';
    Params := Params + [TPair<string, Variant>.Create('ativo', FiltroStatus)];
  end;

  if FiltroTipo <> '' then
  begin
    Sql := Sql + ' AND c.tipo = :tipo';
    Params := Params + [TPair<string, Variant>.Create('tipo', FiltroTipo)];
  end;}

  Result := FDAO.FindWhere(SQL+SQLORDER, Params);
  //Result := FDAO.FindAll;
end;

function TEntradaItensVeiculoController.ListarPorIdsCompra(const ListaIdsCompra: TArray<Integer>): TObjectList<TEntradaVeiculoItens>;
var
  SQL: string;
  Params: TArray<TPair<string, Variant>>;
  ListaIdString: string;
begin
  // Monta a string dos IDs no formato (1,2,3)
  ListaIdString := '(' + InteirosParaString(ListaIdsCompra) + ')';
  SQL := 'Select                              '+
          'c.id_compra_itens as IdCompraItens,                 '+
          'c.id_compra as idcompra,'+
          'c.id_produto_veiculo as IdProdutoVeiculo,              '+
          'c.qtde,                            '+
          'c.prc_unitario as PrcUnitario,                    '+
          'c.subtotal as Subtotal,                        '+
          'c.total,                           '+
          'c.veiculo_prcfipe as VeiculoPrcFipe,                 '+
          'c.prc_custo as PrcCusto,                       '+
          'p.codigo,                          '+
          'p.descricao,                       '+
          'p.descricao_fiscal,                '+
          'p.veiculo_placa as nmplaca,                   '+
          'Concat(p.veiculo_ano,''/'', p.veiculo_ano_modelo) as anomodelo, '+
          'p.veiculo_cor as cor               '+
          ' From Compra_itens c                '+
          ' Inner Join Produto P               '+
          ' on c.id_produto_veiculo = p.id_produto'+
          ' WHERE veiculo_troca=''N'' and c.id_compra IN ' + ListaIdString;

  Result := FDAO.FindWhere(SQL,[]);
end;

function TEntradaItensVeiculoController.ListarPorIdsCompraTroca(const ListaIdsCompra: TArray<Integer>): TObjectList<TEntradaVeiculoItens>;
var
  SQL: string;
  Params: TArray<TPair<string, Variant>>;
  ListaIdString: string;
begin
  // Monta a string dos IDs no formato (1,2,3)
  ListaIdString := '(' + InteirosParaString(ListaIdsCompra) + ')';
  SQL := 'Select                              '+
          'c.id_compra_itens as IdCompraItens,                 '+
          'c.id_compra as idcompra,'+
          'c.id_produto_veiculo as IdProdutoVeiculo,              '+
          'c.qtde,                            '+
          'c.prc_unitario as PrcUnitario,                    '+
          'c.subtotal as Subtotal,                        '+
          'c.total,                           '+
          'c.veiculo_prcfipe as VeiculoPrcFipe,                 '+
          'c.prc_custo as PrcCusto,                       '+
          'p.codigo,                          '+
          'p.descricao,                       '+
          'p.descricao_fiscal,                '+
          'p.veiculo_placa as nmplaca,                   '+
          'Concat(p.veiculo_ano,''/'', p.veiculo_ano_modelo) as anomodelo, '+
          'p.veiculo_cor as cor               '+
          ' From Compra_itens c                '+
          ' Inner Join Produto P               '+
          ' on c.id_produto_veiculo = p.id_produto'+
          ' WHERE veiculo_troca=''S'' and c.id_compra IN ' + ListaIdString;

  Result := FDAO.FindWhere(SQL,[]);
end;

function TEntradaItensVeiculoController.BuscarPorID(AID, AIDs: Integer): TObjectList<TEntradaVeiculoItens>;
var
  SQL: string;
begin
  //Retornar os dados de um veiculo de uma compra
  SQL := 'Select                                  '+
               ' p.codigo,                              '+
               ' p.descricao,                           '+
               ' p.descricao_fiscal,                    '+
               ' p.veiculo_placa as nmplaca,            '+
               ' c.qtde,                                '+
               ' c.prc_unitario as PrcUnitario,         '+
               ' c.desc_percentual as DescPercentual,   '+
               ' c.desc_reais as DescReais,             '+
               ' c.complemento,                         '+
               ' c.total,                               '+
               ' c.veiculo_troca as VeiculoTroca,       '+
               ' c.veiculo_prcfipe as VeiculoPrcFipe,   '+
               ' c.veiculo_prcvenda as VeiculoPrcVenda, '+
               ' c.veiculoperclucro as VeiculoPercLucro,'+
               ' c.atualizarficha,                      '+
               ' c.taxames,                             '+
               ' c.taxadia,                             '+
               ' c.totalpatio,                          '+
               ' c.comissaolojaperc,                    '+
               ' c.comissaolojavalor,                   '+
               ' c.comissaovendperc,                    '+
               ' c.comissaovendvalor,                   '+
               ' c.taxaconsignado,                      '+
               ' c.dataretiradaconsi as DataRetiradaConsi,                   '+
               ' c.veiculolucrovalor as VeiculoLucroValor,                   '+
               ' c.veiculo_valorpraticado as VeiculoValorPraticado,              '+
               ' c.prc_custo as PrcCusto,                           '+
               ' c.veiculo_valortroca as VeiculoValorTroca                   '+
               ' From Compra_itens c                    '+
               ' inner Join Produto p                   '+
               ' On c.id_produto_veiculo = p.id_produto '+
               ' where c.id_compra= '+IntToStr(AID)+' and c.id_compra_itens= '+IntToStr(AIDs)+''+
               '';

  Result := FDAO.FindWhere(SQL,[]);

  {Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;}
end;

function TEntradaItensVeiculoController.Salvar(ADoc: TEntradaVeiculoItens; out RetornoID:integer): Boolean;
begin
  Result          :=  False;

  if ADoc.IdCompraItens = 0 then
  begin
    Try
      Adoc.DataCriado :=  Now;
      RetornoID       :=  FDAO.Insert(ADoc);
      Result          :=  True;
    except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;

  end
  else
  begin
    Try
      Result := FDAO.Update(ADoc);
    except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;
  end;
end;

function TEntradaItensVeiculoController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TEntradaItensVeiculoController.InteirosParaString(const Lista: TArray<Integer>): string;
var
  StrList: TArray<string>;
  I: Integer;
begin
  SetLength(StrList, Length(Lista));
  for I := 0 to High(Lista) do
    StrList[I] := Lista[I].ToString;

  Result := String.Join(',', StrList);
end;

end.

