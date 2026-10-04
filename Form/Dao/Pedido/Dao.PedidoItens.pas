unit Dao.PedidoItens;
interface
Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient, Vcl.Session, UConeSul, Model.PedidoItens,
  System.RTTI, uAtributosRTTI;
Type
  TDaoPedidoItens = Class
  Private
    FContext: TRttiContext;
  public
    //Class Function DeleteItensPedido(AIDPedido, AIDItem:Integer):Boolean;
    Class Function MaxSeguenciaItem(AidPedido:Integer):Integer;
    Class Function BuscarProdutoAlterar(Const AID:Integer):TModelPedidoItens;

  End;

implementation
{ TDaoPedidoItens }

class function TDaoPedidoItens.BuscarProdutoAlterar(const AID: Integer): TModelPedidoItens;
var
  Qry: TUniQuery;
  Obj: TModelPedidoItens;
  Ctx: TRttiContext;
  RType: TRttiType;
  RProp: TRttiProperty;
  Attr: TCustomAttribute;
  FieldAttr: FieldName;
  Field: TField;
  V: TValue;
begin
  Result := nil;
  Obj := nil;
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := dm.conn;
    Qry.SQL.Text :=
      'SELECT ' +
      '  p.id_produto, ' +
      '  p.codigo AS prodcodproduto, ' +
      '  p.cod_barras AS prodcodbarra, ' +
      '  p.descricao AS proddescricao, ' +
      '  p.estoque_atual AS prodestoque, ' +
      '  p.alterar_descricao AS proaltdescricao, ' +
      '  p.foto1 AS ProdFoto, ' +
      '  p.fracionado AS prodfracionado, ' +
      '  i.id_pedido_itens, ' +
      '  i.id_pedido, ' +
      '  i.id_produto, ' +
      '  i.qtde, ' +
      '  i.qtde_2, ' +
      '  i.prc_unitario, ' +
      '  i.desconto_perc, ' +
      '  i.desconto_reais, ' +
      '  i.descricao, ' +
      '  i.complemento, ' +
      '  i.prc_total, ' +
      '  i.prc_subtotal, ' +
      '  i.seqitem, ' +
      '  i.peso,'+
      '  i.volume, '+
      '  p.preco_m2,'+
      '  Coalesce(i.altura,0) as altura,    '+
      '  Coalesce(i.largura,0) as largura  '+
      ' FROM pedido_itens i ' +
      ' INNER JOIN produto p ON i.id_produto = p.id_produto ' +
      ' WHERE i.id_pedido_itens = :ID';

    Qry.ParamByName('ID').AsInteger := AID;
    Qry.Open;

    if not Qry.IsEmpty then
    begin
      Obj := TModelPedidoItens.Create;
      RType := Ctx.GetType(Obj.ClassType);

      for RProp in RType.GetProperties do
      begin
        FieldAttr := nil;

        for Attr in RProp.GetAttributes do
        begin
          if Attr is FieldName then
          begin
            FieldAttr := FieldName(Attr);
            Break;
          end;
        end;

        if not Assigned(FieldAttr) then
          Continue;

        Field := Qry.FindField(FieldAttr.Field);
        if not Assigned(Field) or Field.IsNull then
          Continue;

        case RProp.PropertyType.TypeKind of
          tkInteger, tkInt64:
            V := Field.AsInteger;

          tkFloat:
            begin
              if RProp.PropertyType.Handle = TypeInfo(TDate) then
                V := Field.AsDateTime
              else if RProp.PropertyType.Handle = TypeInfo(TDateTime) then
                V := Field.AsDateTime
              else
                V := Field.AsFloat;
            end;

          tkUString, tkWString, tkLString, tkString:
            V := Field.AsString;

          tkEnumeration:
            begin
              if RProp.PropertyType.Handle = TypeInfo(Boolean) then
                V := Field.AsBoolean
              else
                V := TValue.FromOrdinal(RProp.PropertyType.Handle, Field.AsInteger);
            end;
        else
          V := TValue.FromVariant(Field.Value);
        end;

        RProp.SetValue(Obj, V);
      end;

      Result := Obj;
    end;
  finally
    Qry.Free;
  end;
end;


class function TDaoPedidoItens.MaxSeguenciaItem(AidPedido: Integer): Integer;
var
Qry       : TUniquery;
QryStr  : string;
begin
  Result  := 0;
  Qry     := TUniquery.create(nil);
  Try
    Try
      Qry.Connection  := dm.conn;
      QryStr        := 'SELECT MAX(seqitem) AS id FROM pedido_itens where id_pedido= :id';

      With Qry do
      begin
        Close;
        Sql.clear;
        Qry.SQL.Text := QryStr;
        Qry.ParamByName('id').AsInteger :=AidPedido;

        Open;
        if not Qry.IsEmpty then
        Result := Qry.FieldByName('id').AsInteger + 1
        else
        Result  := 1;
        Close;
      end;
    Except on e:exception do
      raise Exception.Create('Erro ao gerar seqitem:' + e.message);
    End;
  Finally
    Qry.free;
  End;
end;

end.
