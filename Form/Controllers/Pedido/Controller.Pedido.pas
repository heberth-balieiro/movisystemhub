unit Controller.Pedido;
interface
uses
  Model.Pedido,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao.Pedido;
type
  TPedidoController = class
  private
    FDAO: TDAOOperacao<TModelPedido>;
  public
    constructor Create;
    destructor Destroy; override;
    function ListarTodos(const FiltroData1, FiltroData2:TDate; const FiltroStatus,
                        FiltroTipo, FiltroCampo: string; const AIDEmpresa: integer): TObjectList<TModelPedido>;
    function BuscarPorID(AID: Integer): TModelPedido;
    function Salvar(ADoc: TModelPedido; out RetornoID:integer): Boolean;
    function Excluir(AID: Integer): Boolean;
    //function ExcluidoCancelado(AID, AIDUser: Integer):boolean;
    function CancelarPedido(AID, AIDUser:Integer):Boolean;
    function ReabrirPedido(AID,AIDUser:Integer):Boolean;
    Function IniciarPedido(Out AID:Integer):Boolean;
    Function ExcluirPedidoVazio(AID:Integer):Boolean;
    Function ExisteItensNoPedido(AID: Integer): Boolean;

  end;

implementation

{ TPedidoController }

uses UDM, cxDateUtils, System.Variants;

function TPedidoController.BuscarPorID(AID: Integer): TModelPedido;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

function TPedidoController.CancelarPedido(AID, AIDUser: Integer): Boolean;
var
Dao :TDaoPedido;
begin
  Result  := false;
  Dao     := TDaoPedido.Create;
  try
    if Dao.CancelarPedido(AID,AIDUser) then
    result  := True;
  finally
    Dao.Free;
  end;
end;

constructor TPedidoController.Create;
begin
  FDAO := TDAOOperacao<TModelPedido>.Create(dm.Conn);
end;

destructor TPedidoController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TPedidoController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TPedidoController.ExcluirPedidoVazio(AID: Integer): Boolean;
var
Dao :TDaoPedido;
begin
  Result  := false;
  Dao     := TDaoPedido.Create;
  try
    if Dao.ExcluirPedidoVazio(AID) then
    result  := True;
  finally
    Dao.Free;
  end;
end;

function TPedidoController.ExisteItensNoPedido(AID: Integer): Boolean;
var
Dao :TDaoPedido;
begin
  Result  := false;
  Dao     := TDaoPedido.Create;
  try
    if Dao.ExisteItensNoPedido(AID) then
    result  := True;
  finally
    Dao.Free;
  end;
end;

function TPedidoController.IniciarPedido(out AID: Integer): Boolean;
var
Dao :TDaoPedido;
begin
  Result  := false;
  Dao     := TDaoPedido.Create;
  try
    if Dao.IniciarPedido(AID) then
    result  := True;
  finally
    Dao.Free;
  end;
end;

function TPedidoController.ListarTodos(const FiltroData1, FiltroData2: TDate;
  const FiltroStatus, FiltroTipo, FiltroCampo: string;
  const AIDEmpresa: integer): TObjectList<TModelPedido>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SetLength(Params, 0);
  SQL   :=  ' Select                                                         '+
            ' p.id_pedido,                                                   '+
            ' p.numpedido,                                                   '+
            ' p.data,                                                        '+
            ' p.hora,                                                        '+
            ' case When p.status = ''A'' then ''Aberto''                         '+
            ' When p.status = ''F'' then ''Fechado''                             '+
            ' When p.status = ''C'' then ''Cancelado'' end as status,            '+
            ' p.observacao,                                                  '+
            ' case when p.pedido = ''P'' then ''Pedido''                         '+
            ' when p.pedido = ''O'' then ''Orçamento'' end as pedido,            '+
            ' Coalesce(p.total,0) as total,                                  '+
            ' p.data_entrega,                                                '+
            ' concat(''('',s.codigo,'')'' ,s.nome) as nomepessoa,                '+
            ' concat(''('',z.codigo,'')'' ,z.descricao) as prazopagamento,       '+
            ' u.login as nomeusuario,                                        '+
            ' concat(''('',f.codigo,'')'' ,f.nome) as nomevendedor               '+
            ' from pedido p                                                  '+
            ' Inner join socio s                                             '+
            ' on p.id_cliente = s.id_socio                                   '+
            ' Inner join prazopagamento z                                    '+
            ' on p.id_prazo = z.id_prazo                                     '+
            ' Inner Join usuario u                                           '+
            ' on p.id_usuario = u.id_usuario                                 '+
            ' Inner join funcionario f                                       '+
            ' on p.id_vendedor = f.id_funcionario where p.id_pedido > 0        ';

  if FiltroCampo.Trim <> '' then
  begin
    SQL := SQL + ' AND (p.numpedido LIKE :filtro or s.nome LIKE :filtro or z.descricao like :filtro or f.nome like :filtro)';
    Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
  end;

  if FiltroStatus.Trim <> '' then
  begin
    SQL := SQL + ' AND p.status = :status';
    Params := Params + [TPair<string, Variant>.Create('status', FiltroStatus)];
  end;

  if FiltroTipo.Trim <> '' then
  begin
    SQL := SQL + ' AND p.pedido = :pedido';
    Params := Params + [TPair<string, Variant>.Create('pedido', FiltroTipo)];
  end;

  if AIDEmpresa > 0 then
  begin
    SQL := SQL + ' AND p.id_empresa = :Aid';
    Params := Params + [TPair<string, Variant>.Create('Aid', AIDEmpresa)];
  end;


  Sql    := Sql + ' AND p.data BETWEEN :x and :y';
  Params := Params + [TPair<string, Variant>.Create('x', VarFromDateTime(FiltroData1))];
  Params := Params + [TPair<string, Variant>.Create('y', VarFromDateTime(FiltroData2))];

  SQLORDER  := ' order by p.data';
  Result := FDAO.FindWhere(SQL + SQLORDER, Params);

end;

function TPedidoController.ReabrirPedido(AID,AIDUser: Integer): Boolean;
var
Dao :TDaoPedido;
begin
  Result  := false;
  Dao     := TDaoPedido.Create;
  try
    if Dao.ReabrirPedido(AID,AIDUser) then
    result  := True;
  finally
    Dao.Free;
  end;
end;

function TPedidoController.Salvar(ADoc: TModelPedido; out RetornoID: integer): Boolean;
begin
  Result          :=  False;
  if ADoc.id_Pedido  = 0 then
  begin
   
    Try
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
