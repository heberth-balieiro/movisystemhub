unit dao.estoque;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient,
  Vcl.Session,
  UConeSul,
  uConfiguracaoService;

Type
  TDaoEstoque = Class
  Private

  public

    Class function BaixarEstoque(AIDProduto: Integer; AQuantidade: Double; AIDEmpresa: Integer;
                                  AIDUsuario: Integer; AIDPedido: Integer; APrcCompra, APrcVenda:Double):Boolean;

    class function EstornarEstoque(AIDProduto: Integer; AQuantidade: Double; AIDEmpresa: Integer;
                                   AIDUsuario: Integer; AIDPedido: Integer; APrcCompra, APrcVenda: Double;
                                   AMotivo: string = 'Estorno de pedido'): Boolean;
  End;

implementation

{ TDaoEstoqueGeral }

class Function TDaoEstoque.BaixarEstoque(AIDProduto: Integer;
                            AQuantidade: Double; AIDEmpresa, AIDUsuario, AIDPedido: Integer;
                             APrcCompra, APrcVenda:Double):Boolean;
var
  Qry: TUniQuery;
  QtdeAtual: Double;
begin
  Result  := False;
  Qry := TUniQuery.Create(nil);

  try
    Qry.Connection := dm.conn;

    // 1. Buscar estoque atual
    Qry.SQL.Text :=
        'SELECT qtde FROM estoque WHERE id_produto = :produto AND id_empresa = :empresa';
    Qry.ParamByName('produto').AsInteger := AIDProduto;
    Qry.ParamByName('empresa').AsInteger := AIDEmpresa;
    Qry.Open;

    QtdeAtual     := Qry.FieldByName('qtde').AsFloat;

    if not TConfiguracaoService.ValidarProdutoEstoqueNegativo(AIDProduto) then
    begin

      if Qry.IsEmpty then
        raise Exception.Create('Produto sem estoque cadastrado.');

      // 2. Validar saldo
      if QtdeAtual < AQuantidade then
        raise Exception.Create('Estoque insuficiente.');
    end;

    // 3. Atualizar estoque
    Qry.Close;
    Qry.SQL.Text :=
      'UPDATE estoque SET qtde = qtde - :qtde WHERE id_produto = :produto AND id_empresa = :empresa';
    Qry.ParamByName('produto').AsInteger  := AIDProduto;
    Qry.ParamByName('empresa').AsInteger  := AIDEmpresa;
    Qry.ParamByName('qtde').AsFloat       := AQuantidade;
    Qry.ExecSQL;

    // 4. Registrar movimentação
    Qry.Close;
    Qry.SQL.Text :=
      'INSERT INTO movimentacao_estoque ' +
      '(id_produto, tipo, quantidade, quantidade_anterior, preco_compra, preco_venda, data_movimentacao, id_usuario, id_empresa, id_pedido) ' +
      'VALUES (:produto, ''Saída'', :qtde, :anterior, :preco_compra, :preco_venda, NOW(), :usuario, :empresa, :pedido)';

    Qry.ParamByName('produto').AsInteger  := AIDProduto;
    Qry.ParamByName('qtde').AsFloat       := AQuantidade;
    Qry.ParamByName('anterior').AsFloat   := QtdeAtual;
    Qry.ParamByName('preco_compra').AsFloat := APrcCompra;
    Qry.ParamByName('preco_venda').AsFloat  := APrcVenda;
    Qry.ParamByName('usuario').AsInteger  := AIDUsuario;
    Qry.ParamByName('empresa').AsInteger  := AIDEmpresa;
    Qry.ParamByName('pedido').AsInteger   := AIDPedido;
    Qry.ExecSQL;

    // Buscar estoque atual depois de atualizado
    Qry.SQL.Text :=
        'SELECT qtde FROM estoque WHERE id_produto = :produto AND id_empresa = :empresa';
    Qry.ParamByName('produto').AsInteger := AIDProduto;
    Qry.ParamByName('empresa').AsInteger := AIDEmpresa;
    Qry.Open;

    QtdeAtual     := Qry.FieldByName('qtde').AsFloat;

    //atualizar estoque no cadastro de produto
    Qry.Close;
    Qry.SQL.Text  := 'Update produto set estoque_atual = :qtde where id_produto= :produto';
    Qry.ParamByName('produto').AsInteger    := AIDProduto;
    Qry.ParamByName('qtde').AsFloat         := QtdeAtual;
    Qry.ExecSQL;

    {
    //atualizar estoque no cadastro de produto
    Qry.Close;
    Qry.SQL.Text  := 'Update produto set estoque_atual = estoque_atual - :qtde where id_produto= :produto';
    Qry.ParamByName('produto').AsInteger    := AIDProduto;
    Qry.ParamByName('qtde').AsFloat         := AQuantidade;
    Qry.ExecSQL;
    }

    Result  := True;
  finally
    Qry.Free;
  end;
end;

class function TDaoEstoque.EstornarEstoque(AIDProduto: Integer;
                AQuantidade: Double; AIDEmpresa, AIDUsuario, AIDPedido: Integer; APrcCompra,
                APrcVenda: Double; AMotivo: string): Boolean;
var
  Qry: TUniQuery;
  QtdeAtual: Double;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := dm.conn;
    // 1. Buscar estoque atual
    Qry.SQL.Text :=
      'SELECT qtde FROM estoque WHERE id_produto = :produto AND id_empresa = :empresa';
    Qry.ParamByName('produto').AsInteger := AIDProduto;
    Qry.ParamByName('empresa').AsInteger := AIDEmpresa;
    Qry.Open;
    if Qry.IsEmpty then
      raise Exception.Create('Produto sem estoque cadastrado para estorno.');
    QtdeAtual := Qry.FieldByName('qtde').AsFloat;
    // 2. Somar estoque
    Qry.Close;
    Qry.SQL.Text :=
      'UPDATE estoque SET qtde = qtde + :qtde WHERE id_produto = :produto AND id_empresa = :empresa';
    Qry.ParamByName('produto').AsInteger := AIDProduto;
    Qry.ParamByName('empresa').AsInteger := AIDEmpresa;
    Qry.ParamByName('qtde').AsFloat      := AQuantidade;
    Qry.ExecSQL;
    // 3. Registrar movimentação de entrada
    Qry.Close;
    Qry.SQL.Text :=
      'INSERT INTO movimentacao_estoque ' +
      '(id_produto, tipo, quantidade, quantidade_anterior, preco_compra, preco_venda, data_movimentacao, id_usuario, id_empresa, id_pedido, observacao) ' +
      'VALUES (:produto, ''Entrada'', :qtde, :anterior, :preco_compra, :preco_venda, NOW(), :usuario, :empresa, :pedido, :obs)';
    Qry.ParamByName('produto').AsInteger    := AIDProduto;
    Qry.ParamByName('qtde').AsFloat         := AQuantidade;
    Qry.ParamByName('anterior').AsFloat     := QtdeAtual;
    Qry.ParamByName('preco_compra').AsFloat := APrcCompra;
    Qry.ParamByName('preco_venda').AsFloat  := APrcVenda;
    Qry.ParamByName('usuario').AsInteger    := AIDUsuario;
    Qry.ParamByName('empresa').AsInteger    := AIDEmpresa;
    Qry.ParamByName('pedido').AsInteger     := AIDPedido;
    Qry.ParamByName('obs').AsString         := AMotivo;
    Qry.ExecSQL;
    // 4. Atualizar produto
    Qry.Close;
    Qry.SQL.Text :=
      'UPDATE produto SET estoque_atual = estoque_atual + :qtde WHERE id_produto = :produto';
    Qry.ParamByName('produto').AsInteger  := AIDProduto;
    Qry.ParamByName('qtde').AsFloat       := AQuantidade;
    Qry.ExecSQL;
    Result := True;
  finally
    Qry.Free;
  end;
end;

end.
