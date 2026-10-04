unit Controller.EntradaVeiculoFinanceiro;

interface

uses
  Model.EntradaVeiculoFinanceiro,
  Dao.Operacoes,
  System.SysUtils, System.Generics.Collections;

type
  TEntradaFinanceiroVeiculoController = class
  private
    FDAO: TDAOOperacao<TEntradaVeiculoFinanceiro>;
    function InteirosParaString(const Lista: TArray<Integer>): string;

  public
    constructor Create;
    destructor Destroy; override;

    function ListarTodos(const FiltroStatus, FiltroTipo, FiltroCampo: string): TObjectList<TEntradaVeiculoFinanceiro>;
    function ListarPorIdsCompra(
      const ListaIdsCompra: TArray<Integer>): TObjectList<TEntradaVeiculoFinanceiro>;
    
    function BuscarPorID(AID: Integer): TEntradaVeiculoFinanceiro;
    function Salvar(ADoc: TEntradaVeiculoFinanceiro; out RetornoID:integer): Boolean;
    function Excluir(AID: Integer): Boolean;
  end;

implementation

uses UDM, cxDateUtils, REST.Json;

{ TEntradaItensVeiculo }

constructor TEntradaFinanceiroVeiculoController.Create;
begin
  FDAO := TDAOOperacao<TEntradaVeiculoFinanceiro>.Create(dm.Conn);
end;

destructor TEntradaFinanceiroVeiculoController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TEntradaFinanceiroVeiculoController.ListarTodos(const FiltroStatus, FiltroTipo, FiltroCampo: string): TObjectList<TEntradaVeiculoFinanceiro>;
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

function TEntradaFinanceiroVeiculoController.ListarPorIdsCompra(const ListaIdsCompra: TArray<Integer>): TObjectList<TEntradaVeiculoFinanceiro>;
var
  SQL: string;
  Params: TArray<TPair<string, Variant>>;
  ListaIdString: string;
begin
  // Monta a string dos IDs no formato (1,2,3)
  ListaIdString := '(' + InteirosParaString(ListaIdsCompra) + ')';
  SQL := 'Select                              '+
          'c.id_pagamento,'+
          'c.id_compra,'+
          'c.forma_pagamento,        '+
          'c.data_pagamento,                   '+
          'c.parcelado,                       '+
          'c.numero_parcelas as parcelas,     '+
          'c.observacao,                      '+
          'c.valor                            '+
          'From compra_Pagamento c            '+
          ' WHERE c.id_compra IN ' + ListaIdString;

  Result := FDAO.FindWhere(SQL,[]);
end;

function TEntradaFinanceiroVeiculoController.BuscarPorID(AID: Integer): TEntradaVeiculoFinanceiro;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

function TEntradaFinanceiroVeiculoController.Salvar(ADoc: TEntradaVeiculoFinanceiro; out RetornoID:integer): Boolean;
begin
  Result          :=  False;

  if ADoc.id_pagamento = 0 then
  begin
    Try
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
    Result := FDAO.Update(ADoc);
  end;
end;

function TEntradaFinanceiroVeiculoController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TEntradaFinanceiroVeiculoController.InteirosParaString(const Lista: TArray<Integer>): string;
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

