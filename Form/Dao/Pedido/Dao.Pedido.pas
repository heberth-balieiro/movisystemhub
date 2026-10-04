unit Dao.Pedido;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient, Vcl.Session, UConeSul;

Type
  TDaoPedido = Class
  Private

    class function GerarSeguencia(tab, campo: string): integer; static;

  public

    Class Function CancelarPedido(AID, AIDUser:Integer):Boolean;
    Class Function IniciarPedido(Out AID:Integer):Boolean;
    Class Function ExcluirPedidoVazio(AID: Integer): Boolean;
    Class Function ExisteItensNoPedido(AID: Integer):Boolean;
    Class Function ReabrirPedido(AID, AIDUser: Integer):Boolean;

  End;

implementation

{ TDaoPedido }

class function TDaoPedido.CancelarPedido(AID, AIDUser: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update pedido set status=''C'', id_usuario_cancelou= :iduser, data_cancelado= :dt where id_pedido= :id';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;
      Qry.ParamByName('id').AsInteger     := AID;
      Qry.ParamByName('dt').AsDateTime    := now;
      Qry.ParamByName('iduser').AsInteger := AIDUser;
      Qry.ExecSQL;
      Result          := true;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao na função de CancelarPedido:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TDaoPedido.IniciarPedido(out AID: Integer): Boolean;
var
  Qry: TUniQuery;
  AIdCliente, AIDPrazo, AIDVendedor:integer;
Const
  QryStr  = 'Insert Into pedido (id_pedido, numpedido, id_cliente, id_prazo, '+
                    'id_empresa, data, hora, status, id_usuario, id_vendedor, pedido)'+
                    'Values(:idpedido, :numpedido, :idcliente, :idprazo, :idempresa, :data, :hora, :status, :idusuario, :idvendedor, :pedido) '+
                    '';
begin
  Result  := False;
  AID     := 0;
  Qry := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;
      Qry.ParamByName('idpedido').AsInteger   := 0;
      Qry.ParamByName('numpedido').AsInteger  := GerarSeguencia('pedido','numpedido');
      AIdCliente  := StrtoInt(TConeSul.LerValorIni(TConeSul.ndir,'PEDIDO','Pessoa',''));
      if (AIdCliente = -1) or (AIdCliente > 0) then
      Qry.ParamByName('idcliente').AsInteger  := AIdCliente
      else
      Qry.ParamByName('idcliente').AsInteger  := -1;
      AIDPrazo  := StrtoInt(TConeSul.LerValorIni(TConeSul.ndir,'PEDIDO','Pagamento',''));
      if (AIDPrazo = -1) or (AIDPrazo > 0) then
      Qry.ParamByName('idprazo').AsInteger    := AIDPrazo
      else
      Qry.ParamByName('idprazo').AsInteger    := 2;
      Qry.ParamByName('idempresa').AsInteger  := TSession.idempresa;
      Qry.ParamByName('data').AsDateTime      := now;
      Qry.ParamByName('hora').AsDateTime      := time;
      Qry.ParamByName('status').asstring      := 'A';
      Qry.ParamByName('idusuario').AsInteger  := Tsession.id_usuario;
      AIDVendedor := StrtoInt(TConeSul.LerValorIni(TConeSul.ndir,'PEDIDO','Vendedor',''));
      if (AIDVendedor = -1) or (AIDVendedor > 0) then
      Qry.ParamByName('idvendedor').AsInteger := AIDVendedor
      else
      Qry.ParamByName('idvendedor').AsInteger := -1;
      Qry.ParamByName('pedido').AsString      := 'P';
      Qry.ExecSQL;
      Qry.SQL.Text    := 'SELECT LAST_INSERT_ID() AS id_pedido';
      Qry.open;
      AID     := Qry.FieldByName('id_pedido').AsInteger;
      Result  := AID > 0;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao inserir novo pedido:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TDaoPedido.ReabrirPedido(AID,AIDUser: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update pedido set status=''A'', id_usuario_reabriu= :iduser where id_pedido= :id';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;
      Qry.ParamByName('id').AsInteger     := AID;
      Qry.ParamByName('iduser').AsInteger := AIDUser;
      Qry.ExecSQL;
      Result          := true;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao na função de ReabrirPedido:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TDaoPedido.ExcluirPedidoVazio(AID: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Delete from pedido where id_pedido= :ID';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;
      Qry.ParamByName('id').AsInteger := AID;
      Qry.ExecSQL;
      Result          := true;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao na função de ExcluirPedidoVazio:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TDaoPedido.ExisteItensNoPedido(AID: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'SELECT count(*) as itens FROM pedido_itens where id_pedido= :id';
begin
  Result  := False;
  Qry := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;
      Qry.ParamByName('id').AsInteger := AID;
      Qry.Open;

      Result := Qry.FieldByName('itens').AsInteger > 0;

    except on e:Exception do
      begin
        raise Exception.Create('Erro na função de ExisteItensNoPedido:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class Function TDaoPedido.GerarSeguencia(tab, campo:string):integer;
var
Qry       : TUniquery;
QryStr  : string;
begin
  Result  := 0;
  Qry     := TUniquery.create(nil);
  Try
    Try
      Qry.Connection  := dm.conn;
      QryStr        := 'SELECT MAX(' + campo + ') AS id FROM ' + tab;
      With Qry do
      begin
        Close;
        Sql.clear;
        Qry.SQL.Text := QryStr;
        Open;
        if not Qry.IsEmpty then
        Result := Qry.FieldByName('id').AsInteger + 1
        else
        Result  := 1;
        Close;
      end;
    Except on e:exception do
      raise Exception.Create('Erro ao gerar ID:' + e.message);
    End;
  Finally
    Qry.free;
  End;
end;

end.
