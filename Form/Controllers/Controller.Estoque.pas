unit Controller.Estoque;

interface

uses
  Model.Estoque,
  Dao.Operacoes,
  DAO.Generico,
  System.SysUtils,
  System.Generics.Collections,
  dao.estoque;

type
  TEstoqueController = class
  private
    FDAO: TDAOOperacao<TModelEstoque>;
  public
    constructor Create;
    destructor Destroy; override;

    function Salvar(ADoc: TModelEstoque): Boolean; //Para quando e criado um cadastro novo e informado a quantidade
    function BaixarEstoquePedido(AIDProduto: Integer;
                                  AQuantidade: Double;
                                  AIDEmpresa: Integer;
                                  AIDUsuario: Integer;
                                  AIDPedido: Integer;
                                  APrcCompra, APrcVenda:Double):Boolean; // para baixar o estoque quando feito um pedido.

    function EstornarEstoque(AIDProduto: Integer;
                AQuantidade: Double; AIDEmpresa, AIDUsuario, AIDPedido: Integer; APrcCompra,
                APrcVenda: Double; AMotivo: string): Boolean; //Estonar uestoque do pedido feito.
  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TEstoqueController }

function TEstoqueController.BaixarEstoquePedido(AIDProduto: Integer; AQuantidade: Double; AIDEmpresa, AIDUsuario, AIDPedido: Integer; APrcCompra, APrcVenda:Double): Boolean;
var
Dao :TDaoEstoque;
begin
  Result  := false;
  Try
    Dao     := TDaoEstoque.Create;
    try
      if Dao.BaixarEstoque(AIDProduto,AQuantidade,AIDEmpresa, AIDUsuario, AIDPedido,APrcCompra, APrcVenda) then
      result  := True;
    finally
      Dao.Free;
    end;
  except on e:exception do
    begin
      raise Exception.Create(e.Message);
    end;
  End;
end;

constructor TEstoqueController.Create;
begin
  FDAO := TDAOOperacao<TModelEstoque>.Create(dm.Conn);
end;

destructor TEstoqueController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TEstoqueController.EstornarEstoque(AIDProduto: Integer;
                      AQuantidade: Double; AIDEmpresa, AIDUsuario, AIDPedido: Integer; APrcCompra,
                      APrcVenda: Double; AMotivo: string): Boolean;
var
Dao :TDaoEstoque;
begin
  Result  := false;
  Try
    Dao     := TDaoEstoque.Create;
    try
      if Dao.EstornarEstoque(AIDProduto, AQuantidade,AIDEmpresa, AIDUsuario, AIDPedido,APrcCompra,
                      APrcVenda,AMotivo) then
      result  := True;
    finally
      Dao.Free;
    end;
  except on e:exception do
    begin
      raise Exception.Create(e.Message);
    end;
  End;
end;

function TEstoqueController.Salvar(ADoc: TModelEstoque): Boolean;
var
Aid:integer;
begin
  Result              :=  False;
  Try
    if ADoc.id_estoque  = 0 then
    begin
      Aid := FDAO.Insert(ADoc);
      Result          := True;
    end
    else
    begin
      Result := FDAO.Update(ADoc);
    end;
  except on e:exception do
    begin
      raise Exception.Create(e.Message);
    end;
  End;

end;

end.
