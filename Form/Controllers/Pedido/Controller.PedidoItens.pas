unit Controller.PedidoItens;
interface
uses
  Model.PedidoItens,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao.PedidoItens;
type
  TPedidoItensController = class
  private
    FDAO: TDAOOperacao<TModelPedidoItens>;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarTodos(const AIDPedido, AIDEmpresa:Integer): TObjectList<TModelPedidoItens>;
    function BuscarPorID(AID: Integer): TModelPedidoItens;
    function Salvar(ADoc: TModelPedidoItens; out RetornoID:integer): Boolean;
    function BuscarPorIDInserir(AIDProd: Integer): TModelPedidoItens;
    function Excluir(AID: Integer): Boolean;
    Function BuscarProdutoAlterar(Const AID:Integer):TModelPedidoItens;
    //function ExcluidoCancelado(AID, AIDUser: Integer):boolean;

  end;
implementation
{ TPedidoItensController }

uses UDM, cxDateUtils, System.Variants;

function TPedidoItensController.BuscarPorID(AID: Integer): TModelPedidoItens;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

function TPedidoItensController.BuscarPorIDInserir(AIDProd: Integer): TModelPedidoItens;
begin
  Try
    Result := FDAO.FindById(AIDProd);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

function TPedidoItensController.BuscarProdutoAlterar(const AID: Integer): TModelPedidoItens;
var
Dao :TDaoPedidoItens;
begin
  Dao     := TDaoPedidoItens.Create;
  try
    Result := Dao.BuscarProdutoAlterar(AID);
  finally
    Dao.Free;
  end;
end;

constructor TPedidoItensController.Create;
begin
  FDAO := TDAOOperacao<TModelPedidoItens>.Create(dm.Conn);
end;

destructor TPedidoItensController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TPedidoItensController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TPedidoItensController.ListarTodos(const AIDPedido,AIDEmpresa: Integer): TObjectList<TModelPedidoItens>;
begin

end;

function TPedidoItensController.Salvar(ADoc: TModelPedidoItens; out RetornoID: integer): Boolean;
var
Dao     :TDaoPedidoItens;
begin
  Result          :=  False;
  if ADoc.id_pedido_itens  = 0 then
  begin
    Try
      Dao     := TDaoPedidoItens.Create;
      try
        Adoc.seqitem  := Dao.MaxSeguenciaItem(Adoc.id_pedido);
        result  := True;
      finally
        Dao.Free;
      end;

      RetornoID       := FDAO.Insert(ADoc);
      Result          := True;
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

end.
