unit Controller.EstoqueGeral;
//
//interface
//
//uses
//  Model.Estoque,
//  dao.estoque,
//  Dao.Operacoes,
//  System.SysUtils,
//  System.Generics.Collections;
//
//type
//  TEstoqueGeralController = class
//  private
//    FDAO: TDAOOperacao<Tmodelestoque>;
//    function InteirosParaString(const Lista: TArray<Integer>): string;
//
//  public
//    constructor Create;
//    destructor Destroy; override;
//    Function GravarEstoque(ADoc: Tmodelestoque):boolean;
//  end;
//
//
//
//type
//  TEstoqueMovimentacaoController = class
//  private
//    FDAO: TDAOOperacao<Testoquemovimentacao>;
//    function InteirosParaString(const Lista: TArray<Integer>): string;
//
//  public
//    constructor Create;
//    destructor Destroy; override;
//
//    Function GravarMovimentacao(ADoc: Testoquemovimentacao):Boolean;
//    Function DeletarMovimentacao(AID: Integer): Boolean;
//    Function DeletarMovimentacaoCompra(AIDCompra, AIDProduto :Integer):Boolean;
//
//    Function BaixarEstoque(AIDProduto: Integer;
//                                  AQuantidade: Double;
//                                  AIDEmpresa: Integer;
//                                  AIDUsuario: Integer;
//                                  AIDPedido: Integer):Boolean;
//
//  end;
//
//type
//  TProdutoEstoqueController = class
//  private
//    FDAO: TDAOOperacao<TProdutoEstoque>;
//
//  public
//    constructor Create;
//    destructor Destroy; override;
//
//    Function GravarProduto(ADoc: TProdutoEstoque):Boolean;
//
//  end;
//
//
implementation
//
uses UDM, cxDateUtils, REST.Json;
//
//
//{ TEstoqueGeralController }
//
//{$REGION 'Estoque'}
//
//constructor TEstoqueGeralController.Create;
//begin
//  FDAO := TDAOOperacao<Testoquegeral>.Create(dm.Conn);
//end;
//
//destructor TEstoqueGeralController.Destroy;
//begin
//  FDAO.Free;
//  inherited;
//end;
//
//function TEstoqueGeralController.InteirosParaString(const Lista: TArray<Integer>): string;
//var
//  StrList: TArray<string>;
//  I: Integer;
//begin
//  SetLength(StrList, Length(Lista));
//  for I := 0 to High(Lista) do
//    StrList[I] := Lista[I].ToString;
//
//  Result := String.Join(',', StrList);
//end;
//
//function TEstoqueGeralController.GravarEstoque(ADoc: TestoqueGeral): boolean;
//var
//  RetornoID :Integer;
//begin
//  Result          :=  False;
//
//  if ADoc.id_estoque = 0 then
//  begin
//    Try
//      RetornoID := FDAO.Insert(ADoc);
//      Result  :=  True;
//    except on e:exception do
//      begin
//        raise Exception.Create(e.Message);
//      end;
//    End;
//  end
//  else
//  begin
//    Result := FDAO.Update(ADoc);
//    Result          :=  True;
//  end;
//end;
//
//
//
//{$ENDREGION}
//
//
//
//{ TEstoqueMovimentacaoController }
//
//{$REGION 'Estoque Movimentacao'}
//
//constructor TEstoqueMovimentacaoController.Create;
//begin
//  FDAO := TDAOOperacao<Testoquemovimentacao>.Create(dm.Conn);
//end;
//
//destructor TEstoqueMovimentacaoController.Destroy;
//begin
//  FDAO.Free;
//  inherited;
//end;
//
//function TEstoqueMovimentacaoController.InteirosParaString(const Lista: TArray<Integer>): string;
//var
//  StrList: TArray<string>;
//  I: Integer;
//begin
//  SetLength(StrList, Length(Lista));
//  for I := 0 to High(Lista) do
//    StrList[I] := Lista[I].ToString;
//
//  Result := String.Join(',', StrList);
//end;
//
//function TEstoqueMovimentacaoController.GravarMovimentacao(ADoc: Testoquemovimentacao): Boolean;
//begin
//  Result          :=  False;
//
//  if ADoc.id_movimentacao = 0 then
//  begin
//    Try
//      FDAO.Insert(ADoc);
//      Result          :=  True;
//    except on e:exception do
//      begin
//        raise Exception.Create(e.Message);
//      end;
//    End;
//  end
//  else
//  begin
//    Result := FDAO.Update(ADoc);
//  end;
//end;
//
//Function TEstoqueMovimentacaoController.DeletarMovimentacao(AID: Integer): Boolean;
//begin
//  Try
//    Result := FDAO.Delete(AID);
//  Except on e:exception do
//    begin
//      raise Exception.Create('Ero ao excluir movimentação: '+e.Message);
//    end;
//  End;
//end;
//
//Function TEstoqueMovimentacaoController.DeletarMovimentacaoCompra(AIDCompra, AIDProduto :Integer):Boolean;
//var
//  Filtros: TDictionary<string, Variant>;
//begin
//  result  := false;
//
//  Filtros := TDictionary<string, Variant>.Create;
//  Try
//    Filtros.Add('id_compra', AIDCompra);
//    Filtros.Add('id_produto', AIDProduto);
//
//    Try
//      Result := FDAO.DeleteWhere(Filtros);
//    Except on e:exception do
//      begin
//        raise Exception.Create('Ero ao excluir movimentação: '+e.Message);
//      end;
//    End;
//
//  Finally
//    Filtros.Free;
//  End;
//
//end;
//
//{$ENDREGION}
//
//
//{ TProdutoEstoqueController }
//
//{$REGION 'Produto Estoque'}
//
//Function TEstoqueMovimentacaoController.BaixarEstoque(AIDProduto: Integer;
//  AQuantidade: Double; AIDEmpresa, AIDUsuario, AIDPedido: Integer):Boolean;
//var
//Dao :TDaoEstoqueGeral;
//begin
//  Result  := False;
//  Dao     := TDaoEstoqueGeral.Create;
//  try
//    if Dao.BaixarEstoque(AIDProduto,AQuantidade,AIDEmpresa, AIDUsuario, AIDPedido) then
//    Result  := True;
//  finally
//    Dao.Free;
//  end;
//end;
//
//constructor TProdutoEstoqueController.Create;
//begin
//  FDAO := TDAOOperacao<TProdutoEstoque>.Create(dm.Conn);
//end;
//
//destructor TProdutoEstoqueController.Destroy;
//begin
//  FDAO.Free;
//  inherited;
//end;
//
//function TProdutoEstoqueController.GravarProduto(ADoc: TProdutoEstoque): Boolean;
//begin
//  Result          :=  False;
//
//  if ADoc.id_produto = 0 then
//  begin
//    Try
//      FDAO.Insert(ADoc);
//      Result          :=  True;
//    except on e:exception do
//      begin
//        raise Exception.Create(e.Message);
//      end;
//    End;
//  end
//  else
//  begin
//    Result := FDAO.UpdateComOperacao(ADoc);
//  end;
//end;
//
//{$ENDREGION}
//
end.
