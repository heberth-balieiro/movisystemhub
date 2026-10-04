unit Model.Pedido;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TModelPedido = Class

  Private
    FTransacao  : TUniTransaction;
    Fobs: String;
    FidEmpresa: Integer;
    FPagComplemento: String;
    Fhora: TTime;
    FPedido: String;
    FidUsuario: Integer;
    FnumPedido: Integer;
    FStatus: String;
    FidPedido: Integer;
    FidCliente: Integer;
    FidPrazo: Integer;
    FidVendedor: Integer;
    Fdata: TDate;
    Fidproduto: integer;
    Fprodcodbarra: string;
    Fprodvenda: double;
    Fprodservico: string;
    Fproaltdescricao: string;
    Fproddescricao: string;
    Fprodestoque: double;
    Fprodcodproduto: integer;
    FProdDescPerc: Double;
    FProdDescReais: Double;
    FProComplemento: String;
    FProdQtde2: Double;
    FProdTotal: Double;
    FProdQtde: Double;
    Facrescimo: Double;
    Fadiantamento: Double;
    Fdescontoperc: Double;
    Fsubtotal: Double;
    Fdescontoreais: Double;
    Ftotal: Double;
    Fidpedidoitens: integer;
    Fdataentrega: tdate;
    Fprodfracionado: String;
    FprodContEstoque: String;
    FProdCusto: Double;
    FProdCompra: Double;
    FProdUND: String;
    FProdFoto: String;
    function ProdutoEstoque(const id: integer): boolean;

  public
    constructor Create;
    destructor Destroy; override;

    property  idPedido        :Integer    read  FidPedido       write FidPedido;
    property  numPedido       :Integer    read  FnumPedido      write FnumPedido;
    property  idCliente       :Integer    read  FidCliente      write FidCliente;
    property  idPrazo         :Integer    read  FidPrazo        write FidPrazo;
    property  idEmpresa       :Integer    read  FidEmpresa      write FidEmpresa;
    property  data            :TDate      read  Fdata           write Fdata;
    property  hora            :TTime      read  Fhora           write Fhora;
    property  Status          :String     read  FStatus         write FStatus;
    property  obs             :String     read  Fobs            write Fobs;
    property  idUsuario       :Integer    read  FidUsuario      write FidUsuario;
    property  idVendedor      :Integer    read  FidVendedor     write FidVendedor;
    property  Pedido          :String     read  FPedido         write FPedido;
    property  PagComplemento  :String     read  FPagComplemento write FPagComplemento;
    property  adiantamento    :Double     read  Fadiantamento   write Fadiantamento;
    property  acrescimo       :Double     read  Facrescimo      write Facrescimo;
    property  descontoperc    :Double     read  Fdescontoperc   write Fdescontoperc;
    property  descontoreais   :Double     read  Fdescontoreais  write Fdescontoreais;
    property  subtotal        :Double     read  Fsubtotal       write Fsubtotal;
    property  total           :Double     read  Ftotal          write Ftotal;
    property  dataentrega     :tdate      read  Fdataentrega    write Fdataentrega;



    //************************************************************************//
    Property  idpedidoitens   :integer    read  Fidpedidoitens    write Fidpedidoitens;
    Property  idproduto       :integer    read  Fidproduto        write Fidproduto;
    Property  prodcodproduto  :integer    read  Fprodcodproduto   write Fprodcodproduto;
    Property  prodcodbarra    :string     read  Fprodcodbarra     write Fprodcodbarra;
    Property  proddescricao   :string     read  Fproddescricao    write Fproddescricao;
    Property  prodvenda       :double     read  Fprodvenda        write Fprodvenda;
    Property  prodservico     :string     read  Fprodservico      write Fprodservico;
    Property  prodestoque     :double     read  Fprodestoque      write Fprodestoque;
    Property  proaltdescricao :string     read  Fproaltdescricao  write Fproaltdescricao;
    Property  ProdQtde        :Double     read  FProdQtde         write FProdQtde;
    Property  ProdQtde2       :Double     read  FProdQtde2        write FProdQtde2;
    Property  ProdDescReais   :Double     read  FProdDescReais    write FProdDescReais;
    Property  ProdDescPerc   :Double     read  FProdDescPerc    write FProdDescPerc;
    Property  ProComplemento :String    read  FProComplemento   write FProComplemento;
    Property  ProdTotal       :Double   read  FProdTotal          write FProdTotal;

    Property  ProdCompra      :Double   read  FProdCompra        write FProdCompra;
    Property  ProdCusto       :Double   read  FProdCusto         write FProdCusto;
    Property  ProdUND         :String   read  FProdUND           write FProdUND;
    Property  ProdFoto        :String   read  FProdFoto          write FProdFoto;

    Property  prodfracionado  :String   read  Fprodfracionado     write Fprodfracionado;
    Property  prodContEstoque :String   read  FprodContEstoque    write FprodContEstoque;

    Function Insert(out msg:String;out id:integer):Boolean;
    Function Update(out msg:string):Boolean;
    Function Delete(out msg:string):Boolean;
    Function Select(out msg:string;id:integer):Boolean;
    Function GerarId(tab, campo:string):integer;
    Function Pesquisa(out msg:string; Tabsituacao, TabStatus:Integer; Filtro:String; dt1,dt2:TDate):Boolean;
    Function SelectProdutoPedido(out msg: string): Boolean;
    Function InsertProdutoPedido: Boolean;
    function ExibirProdutoPedido(out msg: string): Boolean;
    function DeleteItensPedido(out msg: string): Boolean;
    function ValidarItensPedido(out msg: string): Boolean; // Função para verificar se o pedido foi incluso itens ai sim excluir.

    Function Reabrir(out msg:string):boolean;
    Function Cancelar(out msg:string):Boolean;

    function ItensPedido(out msg: string; id: integer): Boolean;

  End;

implementation

uses
  System.Math, Model.Estoque, Vcl.Validacoes, Vcl.Session, Model.LivroCaixa,
  Model.SQLQry;

destructor TModelPedido.Destroy;
begin
  if Assigned(FTransacao) then
    FreeAndNil(FTransacao);

  inherited Destroy;
end;

constructor TModelPedido.Create;
begin
inherited Create;

  FTransacao                    := TUniTransaction.Create(nil);
  FTransacao.DefaultConnection  := dm.Conn;

end;

Function TModelPedido.GerarId(tab, campo:string):integer;
var
Qry       : TUniquery;
sqlQuery  : string;
begin
  Result  := 0;
  Qry     := TUniquery.create(nil);
  Try
    Try
      Qry.Connection := dm.Conn;
      sqlQuery := 'SELECT MAX(' + campo + ') AS id FROM ' + tab;

      With Qry do
      begin
        Close;
        Sql.clear;
        Qry.SQL.Text := sqlQuery;
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

Function TModelPedido.Insert(out msg:String;out id:integer):Boolean;
var
Qry       : TUniquery;
sqlQuery  : string;
idGerado  : Integer;
begin
  Result  := False;
  Qry     := TUniquery.create(nil);
  Try
    Try
      FTransacao.StartTransaction;
      Qry.Connection := dm.Conn;
      sqlQuery := 'Insert Into pedido (id_pedido, numpedido, id_cliente, id_prazo, '+
                    'id_empresa, data, hora, status, id_usuario, id_vendedor, pedido, data_entrega)'+
                  ' Values'+
                  '(:1,:2,:3,:4,:5,:6,:7,:8,:9,:10,:11,:12)';
      With Qry do
      begin
        Close;
        Sql.clear;
        Qry.SQL.Text := sqlQuery;

        idGerado                        := GerarId('pedido', 'id_pedido');
        id:= idgerado;
        Qry.ParamByName('1').AsInteger  := idgerado;
        Qry.ParamByName('2').Asinteger  := GerarId('pedido', 'numpedido');
        Qry.ParamByName('3').Asinteger  := idCliente;
        Qry.ParamByName('4').Asinteger  := idprazo;
        Qry.ParamByName('5').Asinteger  := idempresa;
        Qry.ParamByName('6').AsDateTime := now;
        Qry.ParamByName('7').Asdatetime := Time;
        Qry.ParamByName('8').Asstring   := status;
        Qry.ParamByName('9').AsInteger  := idusuario;
        Qry.ParamByName('10').AsInteger := idvendedor;
        Qry.ParamByName('11').AsString  := pedido;
        qry.ParamByName('12').AsDateTime:= now;

        execsql;

        msg     := 'Pedido Iniciado';
        Result  := True;
        FTransacao.Commit;
        Close;
      end;

    Except on e:exception do
      begin
        FTransacao.Rollback;
        msg := 'Erro ao inserir:' +e.message;
        raise;
      end;
    End;

  Finally
    Qry.free;
  End;
end;

Function TModelPedido.Update(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.Conn;
      // Consulta SQL para atualização
      sqlQuery := 'Update Pedido set'+
                                    ' id_cliente=    :idcliente,'+
                                    ' id_prazo=      :idprazo,'+
                                    ' data=          :data,'+
                                    ' hora=          :hr,'+
                                    ' status=        :sts,'+
                                    ' observacao=    :obs,'+
                                    ' id_vendedor=   :idvendedor,'+
                                    ' pedido=        :pedido,'+
                                    ' pag_complemento= :pagdesc,'+
                                    ' adiantamento=   :adiantamento,'+
                                    ' acrescimo=      :acrescimo,'+
                                    ' descontoperc=   :descontoperc,'+
                                    ' descontoreais=  :descontoreais,'+
                                    ' subtotal=       :subtotal,'+
                                    ' total=          :total,'+
                                    ' data_entrega=   :dataentrega'+
                                    ' where id_pedido= :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      // Definindo parâmetros

      Qry.ParamByName('id').AsInteger             := idPedido;
      Qry.ParamByName('idcliente').AsInteger      := idCliente;
      Qry.ParamByName('idprazo').AsInteger        := idPrazo;
      Qry.ParamByName('data').AsDateTime          := data;
      Qry.ParamByName('hr').AsDateTime            := hora;
      Qry.ParamByName('sts').AsString             := Status;
      Qry.ParamByName('obs').AsString             := obs;
      Qry.ParamByName('idvendedor').AsInteger     := idVendedor;
      Qry.ParamByName('pedido').AsString          := Pedido;
      Qry.ParamByName('pagdesc').AsString         := PagComplemento;
      Qry.ParamByName('adiantamento').AsFloat     := adiantamento;
      Qry.ParamByName('acrescimo').AsFloat        := acrescimo;
      Qry.ParamByName('descontoperc').AsFloat     := descontoperc;
      Qry.ParamByName('descontoreais').AsFloat    := descontoreais;
      Qry.ParamByName('subtotal').AsFloat         := subtotal;
      Qry.ParamByName('total').AsFloat            := total;
      qry.ParamByName('dataentrega').AsDateTime   := dataentrega;

      Qry.ExecSQL;

      msg := 'Pedido/Orçamento salvo com sucesso';
      Result := True;
    except
      on E: Exception do
      begin
        msg := 'Erro ao salva: ' + E.Message;
        raise;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

Function TModelPedido.Delete(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);

  try
    Qry.Connection    := dm.Conn;
    FTransacao.StartTransaction;
    try
      sqlQuery          := 'Delete from pedido where id_pedido= :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      Qry.ParamByName('id').AsInteger    := idpedido;

      {$REGION 'Estoque'}

        if ProdutoEstoque(idpedido) then
        begin
          Qry.ExecSQL;

          if Qry.RowsAffected > 0 then
          begin
            msg := 'Registro deletado com sucesso';
            Result := True;
          end
          else
            msg := 'Nenhum registro encontrado para deletar';
        end
        else
        msg  := 'Erro ao atualizar o estoque';
      {$ENDREGION}


     // Qry.ExecSQL;

      {$REGION 'Estoque'}
       { if ProdutoEstoque(idpedido) then
        begin
          if Qry.RowsAffected > 0 then
          begin
            msg := 'Registro deletado com sucesso';
            Result := True;
          end
          else
            msg := 'Nenhum registro encontrado para deletar';
        end
        else
        msg  := 'Erro ao atualizar o estoque';}
      {$ENDREGION}

      if Result then
      FTransacao.Commit
      else
      FTransacao.Rollback;
    except
      on E: Exception do
      begin
        FTransacao.Rollback;
        msg := 'Erro ao deletar: ' + E.Message;
        raise;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

Function TModelPedido.ProdutoEstoque(const id:integer):boolean;
var
Qry       : TUniquery;
sqlQuery, SqlQryPedido  : string;
ModelEstoque: TModelEstoque;
vServico,vControla:string;
begin
  //Atualizar o estoque do produto quando o pedido for excluido
  Result  := False;
  Qry     := TUniquery.create(nil);

  Try
    Qry.Connection := dm.Conn;

    Try
      sqlQuery      := 'Select id_produto, qtde from pedido_itens where id_pedido= :idpedido';
      SqlQryPedido  := 'Select pedido, status from pedido where id_pedido= :idpedido';

      Qry.Close;
      Qry.Sql.clear;
      Qry.SQL.Text := SqlQryPedido;
      Qry.Params.ParamByName('idpedido').AsInteger  := id;
      Qry.Open;

      if Qry.FieldByName('pedido').AsString='O' then
      begin
        Qry.Close;
        Result  := True;
        Exit;
      end;

      if Qry.FieldByName('status').AsString='A' then
      begin
        Qry.Close;
        Result  := True;
        Exit;
      end;

      Qry.Close;
      Qry.Sql.clear;
      Qry.SQL.Text := sqlQuery;
      Qry.Params.ParamByName('idpedido').AsInteger  := id;
      Qry.Open;


        if not Qry.isempty then
        begin
          ModelEstoque    := TModelEstoque.Create;

          Try
            Qry.First;

            while not Qry.Eof do
            begin

              //Verificar produto/servico
              if ModelEstoque.ProdutoControlaEstoque(vServico,vControla,
                                          Qry.Fieldbyname('id_produto').AsInteger) then
              begin
                if (vServico='N')  and (vControla='S') then
                begin
                  ModelEstoque.idempresa  := Tsession.IDEMPRESA;
                  ModelEstoque.EstornarEstoquePedido(Qry.Fieldbyname('id_produto').AsInteger,
                                                  id,
                                                  Qry.Fieldbyname('qtde').AsFloat
                                                  );
                end;

              end;

              Qry.next;
            end;
            Result  := True;
          Finally
            ModelEstoque.Free;
          End;
        end;
        Result  := true;
        Qry.Close;

    Except on e:exception do
      begin
        raise;
      end;
    End;

  Finally
    Qry.free;
  End;
end;

Function TModelPedido.Pesquisa(out msg:string; Tabsituacao, TabStatus:Integer; Filtro:String; dt1,dt2:TDate):Boolean;
var
  Qry     :TUniquery;
  sqlQuery, filtroQuery: string;
  Filtrosituacao, Filtrodate:string;
  I:integer;
begin
  //Pesquisa de pedido

  Result                := False;
  Filtrosituacao        := '';
  Filtrodate            := '';


  Qry                   := TUniQuery.Create(nil);
  try
    try
      Qry.Connection    := dm.Conn;

      sqlQuery          := 'Select                                      '+
                             ' p.id_pedido as idpedido,                 '+
                             ' p.numpedido,                             '+
                             ' p.data,                                  '+
                             ' p.hora,                                  '+
                             ' case                                     '+
                             ' when p.Status= ''A'' then ''ABERTO''     '+
                             ' else ''FECHADO''                         '+
                             ' end as status,                           '+
                             ' p.pedido,                                '+
                             ' p.observacao as obs,                     '+
                             ' coalesce(p.total,0) as total,            '+
                             ' s.nome as nmpessoa,                      '+
                             ' f.nome as nmvendedor,                    '+
                             ' z.descricao as nmprazo,                   '+
                             ' p.id_cliente as idcliente'+
                             ' From Pedido p                            '+
                             ' inner join socio s                       '+
                             ' on p.id_cliente = s.id_socio             '+
                             ' inner join funcionario f                 '+
                             ' on p.id_vendedor = f.id_funcionario      '+
                             ' inner join prazopagamento z              '+
                             ' on p.id_prazo = z.id_prazo               '+
                             ' where p.id_pedido > 0 ';

      case Tabsituacao of
        0: Filtrosituacao := ' and p.pedido= ''P'' ';
        1: Filtrosituacao := ' and p.pedido= ''O'' ';
      end;

      case TabStatus of
        0: Filtrosituacao := Filtrosituacao + ' and p.status= ''A'' ';//Aberto
        1: Filtrosituacao := Filtrosituacao + ' and p.status= ''F'' ';//Fechado
        2: Filtrosituacao := Filtrosituacao + ' and p.status= ''C'' ';//Cancelado
      end;

      Filtrodate    := ' and p.data between :x and :y ';

      if filtro <> '' then
      begin
        filtroQuery     := ' and (p.numpedido like :Filtro or '+
                                 ' s.nome like :filtro or'+
                                 ' f.nome like :filtro or'+
                                 ' z.descricao like :filtro)';

        sqlQuery  := sqlQuery + Filtrodate + Filtrosituacao + filtroQuery;
      end
      else
      sqlQuery  := sqlQuery + Filtrodate + Filtrosituacao;

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := SqlQuery;

      if Filtro <> '' then
      qry.ParamByName('filtro').Value := '%' + filtro + '%';

      qry.ParamByName('x').AsDateTime := dt1;
      qry.ParamByName('y').AsDateTime := dt2;

      Qry.Open;
      Qry.First;

      if not Qry.IsEmpty then
      begin
        //criar campo na tebela temporaria

        if dm.TabConsPedido.Active then
        begin
          dm.TabConsPedido.Close; // Feche o dataset se estiver ativo
        end;

        dm.TabConsPedido.DisableControls;

        if dm.TabConsPedido.eof then
        begin
          dm.TabConsPedido.fieldDefs.clear;
          dm.TabConsPedido.FieldDefs.Add('idpedido',   ftInteger);
          dm.TabConsPedido.FieldDefs.Add('numpedido',  ftInteger);
          dm.TabConsPedido.FieldDefs.Add('data',       ftDate);
          dm.TabConsPedido.FieldDefs.Add('hora',       ftTime);
          dm.TabConsPedido.FieldDefs.Add('status',     ftstring,15);
          dm.TabConsPedido.FieldDefs.Add('pedido',     ftstring,2);
          dm.TabConsPedido.FieldDefs.Add('obs',        ftString,500);
          dm.TabConsPedido.FieldDefs.Add('total',      ftFloat);
          dm.TabConsPedido.FieldDefs.Add('nmpessoa',   ftString,190);
          dm.TabConsPedido.FieldDefs.Add('nmvendedor', ftString,190);
          dm.TabConsPedido.FieldDefs.Add('nmprazo',    ftString,90);
          dm.TabConsPedido.FieldDefs.Add('idcliente',  ftInteger);
          dm.TabConsPedido.createdataset;
        end
        else
        begin
          dm.TabConsPedido.EmptyDataSet;
        end;

        while not Qry.Eof do
        begin
          dm.TabConsPedido.Append;

          dm.TabConsPedido.FieldByName('idpedido').Value      :=  Qry.FieldByName('idpedido').Value;
          dm.TabConsPedido.FieldByName('numpedido').Value     :=  Qry.FieldByName('numpedido').Value;
          dm.TabConsPedido.FieldByName('data').Value          :=  Qry.FieldByName('data').Value;
          dm.TabConsPedido.FieldByName('hora').Value          :=  Qry.FieldByName('hora').Value;
          dm.TabConsPedido.FieldByName('status').Value        :=  Qry.FieldByName('status').Value;
          dm.TabConsPedido.FieldByName('pedido').Value        :=  Qry.FieldByName('pedido').Value;
          dm.TabConsPedido.FieldByName('obs').Value           :=  Qry.FieldByName('obs').Value;
          dm.TabConsPedido.FieldByName('total').Value         :=  Qry.FieldByName('total').Value;
          dm.TabConsPedido.FieldByName('nmpessoa').Value      :=  Qry.FieldByName('nmpessoa').Value;
          dm.TabConsPedido.FieldByName('nmvendedor').Value    :=  Qry.FieldByName('nmvendedor').Value;
          dm.TabConsPedido.FieldByName('nmprazo').Value       :=  Qry.FieldByName('nmprazo').Value;
          dm.TabConsPedido.FieldByName('idcliente').Value     :=  Qry.FieldByName('idcliente').Value;

          dm.TabConsPedido.Post;
          Qry.Next;
        end;

        dm.TabConsPedido.EnableControls;
        dm.TabConsPedido.First;
        msg := 'Consulta realizada com sucesso';
        Result := True;
      end
      else
      begin
        dm.TabConsPedido.Close;
        msg := 'Nenhum registro encontrado!';
      end;
      Qry.Close;
    except
      on E: Exception do
      begin
        msg := 'Erro ao executar consulta: ' + E.Message;
        raise;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

Function TModelPedido.Select(out msg:string;id:integer):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.Conn;
      sqlQuery := 'Select * from Pedido where id_pedido= :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger  := id;

      Qry.Open;
      if not Qry.IsEmpty then
      begin

        idPedido      := Qry.Fieldbyname('id_pedido').AsInteger;
        numPedido     := Qry.Fieldbyname('numpedido').AsInteger;
        idCliente     := Qry.Fieldbyname('id_cliente').AsInteger;
        idPrazo       := Qry.Fieldbyname('id_prazo').AsInteger;
        data          := Qry.Fieldbyname('data').AsDateTime;
        hora          := Qry.Fieldbyname('hora').AsDateTime;
        idVendedor    := Qry.Fieldbyname('id_vendedor').AsInteger;
        Pedido        := Qry.Fieldbyname('pedido').AsString;
        status        := Qry.Fieldbyname('status').AsString;
        adiantamento  := Qry.Fieldbyname('adiantamento').AsFloat;
        acrescimo     := Qry.Fieldbyname('acrescimo').AsFloat;
        descontoperc  := Qry.Fieldbyname('descontoperc').AsFloat;
        descontoreais := Qry.Fieldbyname('descontoreais').AsFloat;
        subtotal      := Qry.Fieldbyname('subtotal').AsFloat;
        total         := Qry.Fieldbyname('total').AsFloat;
        dataentrega   := qry.FieldByName('data_entrega').AsDateTime;
        PagComplemento:= Qry.FieldByName('pag_complemento').AsString;

        msg := 'Consulta realizada com sucesso';
        Result := True;
      end
      else
        msg := 'Nenhum registro encontrado!';
    except
      on E: Exception do
      begin
        msg := 'Erro ao executar consulta: ' + E.Message;
        raise;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

Function TModelPedido.ValidarItensPedido(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.Conn;
      sqlQuery := 'Select Count(id_pedido_itens) as qtde from Pedido_itens where id_pedido= :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger  := idPedido;

      Qry.Open;

      if not Qry.IsEmpty then
      begin
        if Qry.FieldByName('qtde').AsInteger > 0 then
        begin
          msg     := 'OK';
          Result  := True;
        end
        else
          Result  := False;
      end
      else
        msg := '';
    except
      on E: Exception do
      begin
        msg := 'Erro ao executar consulta: ' + E.Message;
        raise;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

Function TModelPedido.Reabrir(out msg:string):boolean;
var
  sqlQuery  : String;
  ModelVal  : TValidacao;
  Model     : TModelLivroCaixa;
  ModelSql  : TModelSQL;
begin
  Result := False;

  ModelSql      := TModelSQL.Create;
  try
    try
      sqlQuery          := 'Update pedido set status=''A'' where id_pedido= :id';

      {$REGION 'Estoque'}

      if ProdutoEstoque(idpedido) then   //atualiza o stoque
      begin
        if ModelSql.ExecutarSQL(dm.Conn,sqlQuery,[idpedido]) then
        begin

          {$REGION 'Livro Caixa'}

          ModelVal      := TValidacao.create;
          Try
            if ModelVal.VendaGerarLivroCaixa(Tsession.idempresa) then
            begin
              //Configurado para gerar livro caixa
              Model   := TModelLivroCaixa.Create;
              Try
                Model.ExcluirRegistro(msg,idpedido);
              Finally
                model.Free;
              End;

            end;
          Finally
            ModelVal.free;
          End;

          {$ENDREGION}

          msg := 'Registro reaberto com sucesso';
          Result := True;
        end
        else
        msg := 'Nenhum registro encontrado para reabrir';
      end
      else
      msg  := 'Erro ao atualizar o estoque';

      {$ENDREGION}

    except
      on E: Exception do
      begin
        msg := 'Erro ao reabrir: ' + E.Message;
        raise;
      end;
    end;
  finally
    ModelSql.Free;
  end;
end;

Function TModelPedido.Cancelar(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);

  try
    Qry.Connection    := dm.Conn;
    FTransacao.StartTransaction;
    try
      sqlQuery          := 'Update pedido set status=''C'' where id_pedido= :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      Qry.ParamByName('id').AsInteger    := idpedido;

      {$REGION 'Estoque'}

        if ProdutoEstoque(idpedido) then
        begin
          Qry.ExecSQL;

          if Qry.RowsAffected > 0 then
          begin
            msg := 'Registro reaberto com sucesso';
            Result := True;
          end
          else
            msg := 'Nenhum registro encontrado para reabrir';
        end
        else
        msg  := 'Erro ao atualizar o estoque';

      if Result then
      FTransacao.Commit
      else
      FTransacao.Rollback;
    except
      on E: Exception do
      begin
        FTransacao.Rollback;
        msg := 'Erro ao reabrir: ' + E.Message;
        raise;
      end;
    end;
  finally
    Qry.Free;
  end;
end;




{$REGION 'Itens pedido'}

Function TModelPedido.InsertProdutoPedido:Boolean;
var
Qry       : TUniquery;
sqlQuery  : string;
idGerado  : Integer;
begin
  Result  := False;
  Qry     := TUniquery.create(nil);
  Try
    Try
      FTransacao.StartTransaction;
      Qry.Connection := dm.Conn;
      sqlQuery := 'Insert Into pedido_itens (id_pedido_itens, id_pedido, id_produto,'+
                    'qtde, qtde_2, prc_unitario, desconto_perc, desconto_reais,'+
                    'descricao, complemento, prc_total)'+
                  ' Values'+
                  '(:1,:2,:3,:4,:5,:6,:7,:8,:9,:10,:11)';
      With Qry do
      begin
        Close;
        Sql.clear;
        Qry.SQL.Text := sqlQuery;

        idGerado                        := GerarId('pedido_itens', 'id_pedido_itens');

        Qry.ParamByName('1').AsInteger  := idgerado;
        Qry.ParamByName('2').Asinteger  := idPedido;
        Qry.ParamByName('3').Asinteger  := idproduto;
        Qry.ParamByName('4').AsFloat    := ProdQtde;
        Qry.ParamByName('5').AsFloat    := ProdQtde2;
        Qry.ParamByName('6').AsFloat    := prodvenda;
        Qry.ParamByName('7').AsFloat    := ProdDescPerc;
        Qry.ParamByName('8').AsFloat    := ProdDescReais;
        Qry.ParamByName('9').asstring   := proddescricao;
        Qry.ParamByName('10').asstring  := ProComplemento;
        Qry.ParamByName('11').asfloat   := ProdTotal;

        execsql;
        Result  := True;
        FTransacao.Commit;
        Close;
      end;

    Except on e:exception do
      begin
        FTransacao.Rollback;
        raise;
      end;
    End;

  Finally
    Qry.free;
  End;
end;

Function TModelPedido.SelectProdutoPedido(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
  ModelSql  :TModelSQL;
begin
  Result := False;
  ModelSql    := TModelSQL.Create;

  try

      sqlQuery := 'Select                                            '+
                  ' p.id_produto,                                    '+
                  ' coalesce(p.codigo,0) as codigo,                  '+
                  '  coalesce(p.cod_barras,'''') as cod_barras,      '+
                  '  coalesce(p.descricao,'''') as descricao,        '+
                  '  p.servico,                                      '+
                  '  coalesce(p.prc_compra,0) as prc_compra,         '+
                  '  coalesce(p.prc_custo,0) as prc_custo,           '+
                  '  coalesce(p.prc_venda,0) as prc_venda,           '+
                  '  coalesce(p.estoque_atual,0) as estoque_atual,   '+
                  '  p.alterar_descricao,                            '+
                  '  coalesce(p.foto1,'''') as foto1,                '+
                  '  p.fracionado,                                   '+
                  '  p.controlaestoque,                              '+
                  '  u.uni,                                          '+
                  '  u.unidade                                       '+
                  'from produto p                                    '+
                  ' inner join unidade u                             '+
                  ' on p.id_unidade = u.id_unidade                   '+
                  ' where p.id_produto= :id';
    try
      Qry := ModelSql.ConsultarSQL(dm.Conn,sqlQuery,[idProduto]);
      Try
        if not Qry.IsEmpty then
        begin

          prodcodproduto      := Qry.Fieldbyname('codigo').AsInteger;
          prodcodbarra        := Qry.Fieldbyname('cod_barras').AsString;
          proddescricao       := Qry.Fieldbyname('descricao').AsString;
          prodvenda           := Qry.Fieldbyname('prc_venda').AsFloat;
          prodservico         := Qry.Fieldbyname('servico').AsString;
          prodestoque         := Qry.Fieldbyname('estoque_atual').AsFloat;
          proaltdescricao     := Qry.Fieldbyname('alterar_descricao').AsString;
          prodfracionado      := Qry.Fieldbyname('fracionado').AsString;
          prodContEstoque     := Qry.Fieldbyname('controlaestoque').AsString;
          ProdCompra          := Qry.Fieldbyname('prc_compra').AsFloat;
          ProdCusto           := Qry.Fieldbyname('prc_custo').AsFloat;
          ProdUND             := Qry.Fieldbyname('uni').AsString;
          ProdFoto            := Qry.Fieldbyname('foto1').AsString;

          msg := 'Consulta realizada com sucesso';
          Result := True;
        end
        else
          msg := 'Nenhum registro encontrado!';
      Finally
        qry.Free;
      End;
    except
      on E: Exception do
      begin
        raise Exception.Create('Error:'+e.Message);
      end;
    end;
  finally
    ModelSql.Free;
  end;
end;

Function TModelPedido.ExibirProdutoPedido(out msg:string):Boolean;
var
  Qry     :TUniquery;
  sqlQuery :string;
  I:integer;
begin
  Result                := False;

  Qry                   := TUniQuery.Create(nil);
  try
    try
      Qry.Connection    := dm.Conn;

      sqlQuery          := 'Select                       '+
                             ' pi.id_produto,            '+
                             ' pi.id_pedido_itens,       '+
                             ' coalesce(pi.qtde,0) as qtde,                  '+
                             ' coalesce(pi.qtde_2,0) as qtde_2,                '+
                             ' coalesce(pi.prc_unitario,0) as prc_unitario,          '+
                             ' coalesce(pi.desconto_perc,0) as desconto_perc,         '+
                             ' coalesce(pi.desconto_reais,0) as desconto_reais,        '+
                             ' pi.complemento,           '+
                             ' coalesce(pi.prc_total,0) as prc_total,             '+
                             ' p.codigo,                 '+
                             ' p.cod_barras,             '+
                             ' p.descricao,              '+
                             ' p.referencia,             '+
                             ' p.servico,                '+
                             ' m.marca,                  '+
                             ' l.localizacao as local,   '+
                             ' u.uni,                     '+
                             ' pi.descricao as proddescalterada         '+
                             ' From pedido_itens pi      '+
                             ' inner join produto p      '+
                             ' on pi.id_produto = p.id_produto   '+
                             ' inner join marca m                '+
                             ' on p.id_marca = m.id_marca        '+
                             ' inner join localizacao l          '+
                             ' on p.id_localizacao = l.id_localizacao  '+
                             ' inner join unidade u              '+
                             ' on p.id_unidade = u.id_unidade    '+
                             ' where pi.id_pedido_itens > 0 and pi.id_pedido= :id';

      sqlQuery  := sqlQuery;


      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := SqlQuery;
      Qry.Params.ParamByName('id').AsInteger      := idpedido;

      Qry.Open;
      Qry.First;

      if not Qry.IsEmpty then
      begin
        //criar campo na tebela temporaria
        if dm.TabItensPedido.Active then
        begin
          dm.TabItensPedido.Close; // Feche o dataset se estiver ativo
        end;

        dm.TabItensPedido.DisableControls;

        if dm.TabItensPedido.eof then
        begin
          dm.TabItensPedido.fieldDefs.clear;
          dm.TabItensPedido.FieldDefs.Add('id_produto',       ftInteger);
          dm.TabItensPedido.FieldDefs.Add('id_pedido_itens',  ftInteger);
          dm.TabItensPedido.FieldDefs.Add('qtde',             ftFloat);
          dm.TabItensPedido.FieldDefs.Add('qtde_2',           ftFloat);
          dm.TabItensPedido.FieldDefs.Add('prc_unitario',     ftFloat);
          dm.TabItensPedido.FieldDefs.Add('desconto_perc',    ftFloat);
          dm.TabItensPedido.FieldDefs.Add('desconto_reais',   ftFloat);
          dm.TabItensPedido.FieldDefs.Add('complemento',      ftString,190);
          dm.TabItensPedido.FieldDefs.Add('prc_total',        ftFloat);
          dm.TabItensPedido.FieldDefs.Add('codigo',           ftInteger);
          dm.TabItensPedido.FieldDefs.Add('cod_barras',       ftString,40);
          dm.TabItensPedido.FieldDefs.Add('descricao',        ftstring,190);
          dm.TabItensPedido.FieldDefs.Add('referencia',       ftstring,60);
          dm.TabItensPedido.FieldDefs.Add('servico',          ftstring,10);
          dm.TabItensPedido.FieldDefs.Add('marca',            ftstring,90);
          dm.TabItensPedido.FieldDefs.Add('local',            ftstring,90);
          dm.TabItensPedido.FieldDefs.Add('uni',              ftstring,5);
          dm.TabItensPedido.FieldDefs.Add('proddescalterada', ftstring,190);

          dm.TabItensPedido.createdataset;
        end
        else
        begin
          dm.TabItensPedido.EmptyDataSet;
        end;

        while not Qry.Eof do
        begin
          dm.TabItensPedido.Append;

          dm.TabItensPedido.FieldByName('id_produto').Value         :=  Qry.FieldByName('id_produto').Value;
          dm.TabItensPedido.FieldByName('id_pedido_itens').Value    :=  Qry.FieldByName('id_pedido_itens').Value;
          dm.TabItensPedido.FieldByName('qtde').Value               :=  Qry.FieldByName('qtde').Value;
          dm.TabItensPedido.FieldByName('qtde_2').Value             :=  Qry.FieldByName('qtde_2').Value;
          dm.TabItensPedido.FieldByName('prc_unitario').Value       :=  Qry.FieldByName('prc_unitario').Value;
          dm.TabItensPedido.FieldByName('desconto_perc').Value      :=  Qry.FieldByName('desconto_perc').Value;
          dm.TabItensPedido.FieldByName('desconto_reais').Value     :=  Qry.FieldByName('desconto_reais').Value;
          dm.TabItensPedido.FieldByName('complemento').Value        :=  Qry.FieldByName('complemento').Value;
          dm.TabItensPedido.FieldByName('prc_total').Value          :=  Qry.FieldByName('prc_total').Value;
          dm.TabItensPedido.FieldByName('codigo').Value             :=  Qry.FieldByName('codigo').Value;
          dm.TabItensPedido.FieldByName('cod_barras').Value         :=  Qry.FieldByName('cod_barras').Value;
          dm.TabItensPedido.FieldByName('descricao').Value          :=  Qry.FieldByName('descricao').Value;
          dm.TabItensPedido.FieldByName('referencia').Value         :=  Qry.FieldByName('referencia').Value;
          dm.TabItensPedido.FieldByName('servico').Value            :=  Qry.FieldByName('servico').Value;
          dm.TabItensPedido.FieldByName('marca').Value              :=  Qry.FieldByName('marca').Value;
          dm.TabItensPedido.FieldByName('local').Value              :=  Qry.FieldByName('local').Value;
          dm.TabItensPedido.FieldByName('uni').Value                :=  Qry.FieldByName('uni').Value;
          dm.TabItensPedido.FieldByName('proddescalterada').Value   :=  Qry.FieldByName('proddescalterada').Value;

          dm.TabItensPedido.Post;
          Qry.Next;
        end;

        dm.TabItensPedido.First;
        dm.TabItensPedido.EnableControls;
        msg := 'OK';
        Result := True;
      end
      else
        msg := '';

      Qry.Close;
    except
      on E: Exception do
      begin
        msg := 'Erro ao executar consulta: ' + E.Message;
        raise;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

Function TModelPedido.DeleteItensPedido(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.Conn;
      // Consulta SQL para deletar o registro da tabela empresa
      sqlQuery := 'Delete from pedido_itens where id_pedido= :id and id_pedido_itens= :iditens and id_produto= :idprod';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      // Definindo parâmetro
      Qry.ParamByName('id').AsInteger         := idpedido;
      Qry.ParamByName('iditens').AsInteger    := idpedidoitens;
      Qry.ParamByName('idprod').AsInteger     := idproduto;
      //if DeleteCandidato(msg) then
      Qry.ExecSQL;

      if Qry.RowsAffected > 0 then
      begin
        msg := 'Registro deletado com sucesso';
        Result := True;
      end
      else
        msg := 'Nenhum registro encontrado para deletar';
    except
      on E: Exception do
      begin
        msg := 'Erro ao deletar: ' + E.Message;
        raise;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

Function TModelPedido.ItensPedido(out msg:string;id:integer):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      // Verifica se a conexão está ativa
      if not dm.Conn.Connected then
        dm.Conn.Open;
      Qry.Connection := dm.Conn;

      sqlQuery := 'SELECT                    ' +
                  '  COALESCE(i.qtde,0) AS qtde,                    ' +
                  '  COALESCE(i.qtde_2,0) AS qtde2,                  ' +
                  '  COALESCE(i.prc_unitario,0) AS prcunitario,      ' +
                  '  COALESCE(i.desconto_perc,0) AS descontoperc,    ' +
                  '  COALESCE(i.desconto_reais,0) AS descontoreais,  ' +
                  '  i.descricao AS proddescalterada,                ' +
                  '  i.complemento,                                  ' +
                  '  COALESCE(i.prc_total,0) AS prctotal,           ' +
                  '  p.codigo,                                       ' +
                  '  p.cod_barras,                                   ' +
                  '  p.referencia,                                   ' +
                  '  p.descricao,                                    ' +
                  '  p.descricao_fiscal,                             ' +
                  '  case     '+
                  '  when p.servico=''S'' then ''SIM'' '+
                  '  else ''NÃO'' '+
                  '  end as servico,                                      ' +
                  '  p.peso_kg,                                       ' +
                  '  u.uni'+
                  ' FROM pedido_itens i                               ' +
                  ' INNER JOIN produto p                             ' +
                  ' ON i.id_produto = p.id_produto                     ' +
                  ' inner join unidade u                              '+
                  ' on p.id_unidade = u.id_unidade                    '+

                  'WHERE i.id_pedido = :id';
      Qry.Close;
      Qry.SQL.Text := sqlQuery;
      Qry.ParamByName('id').AsInteger := id;

      Qry.Open;

      if DM.TabConsPedidoItens.Active then
      begin
        //DMRelatorio.ClientPedidoItens.Close; // Feche o dataset se estiver ativo
        DM.TabConsPedidoItens.EmptyDataSet;
      end;

      DM.TabConsPedidoItens.DisableControls;

      // Adiciona a estrutura ao TClientDataSet se não estiver definida
      if DM.TabConsPedidoItens.FieldDefs.Count = 0 then
      begin
        DM.TabConsPedidoItens.FieldDefs.Clear;
        DM.TabConsPedidoItens.FieldDefs.Add('qtde',           ftFloat);
        DM.TabConsPedidoItens.FieldDefs.Add('qtde2',          ftFloat);
        DM.TabConsPedidoItens.FieldDefs.Add('prcunitario',    ftFloat);
        DM.TabConsPedidoItens.FieldDefs.Add('descontoperc',   ftFloat);
        DM.TabConsPedidoItens.FieldDefs.Add('descontoreais',  ftFloat);
        DM.TabConsPedidoItens.FieldDefs.Add('proddescalterada', ftString, 255);
        DM.TabConsPedidoItens.FieldDefs.Add('complemento',    ftString, 255);
        DM.TabConsPedidoItens.FieldDefs.Add('prctotal',       ftFloat);
        DM.TabConsPedidoItens.FieldDefs.Add('codigo',         ftInteger);
        DM.TabConsPedidoItens.FieldDefs.Add('cod_barras',     ftString, 50);
        DM.TabConsPedidoItens.FieldDefs.Add('referencia',     ftString, 50);
        DM.TabConsPedidoItens.FieldDefs.Add('descricao',      ftString, 255);
        DM.TabConsPedidoItens.FieldDefs.Add('descricao_fiscal', ftString, 255);
        DM.TabConsPedidoItens.FieldDefs.Add('servico',        ftString, 3);
        DM.TabConsPedidoItens.FieldDefs.Add('peso_kg',        ftFloat);
        DM.TabConsPedidoItens.FieldDefs.Add('uni',            ftString, 5);
        DM.TabConsPedidoItens.CreateDataSet;
      end;
      Qry.First;
      while not Qry.Eof do
      begin
        DM.TabConsPedidoItens.Append;
        DM.TabConsPedidoItens.FieldByName('qtde').Value           := Qry.FieldByName('qtde').Value;
        DM.TabConsPedidoItens.FieldByName('qtde2').Value          := Qry.FieldByName('qtde2').Value;
        DM.TabConsPedidoItens.FieldByName('prcunitario').Value    := Qry.FieldByName('prcunitario').Value;
        DM.TabConsPedidoItens.FieldByName('descontoperc').Value   := Qry.FieldByName('descontoperc').Value;
        DM.TabConsPedidoItens.FieldByName('descontoreais').Value  := Qry.FieldByName('descontoreais').Value;
        DM.TabConsPedidoItens.FieldByName('proddescalterada').Value := Qry.FieldByName('proddescalterada').Value;
        DM.TabConsPedidoItens.FieldByName('complemento').Value   := Qry.FieldByName('complemento').Value;
        DM.TabConsPedidoItens.FieldByName('prctotal').Value       := Qry.FieldByName('prctotal').Value;
        DM.TabConsPedidoItens.FieldByName('codigo').Value        := Qry.FieldByName('codigo').Value;
        DM.TabConsPedidoItens.FieldByName('cod_barras').Value    := Qry.FieldByName('cod_barras').Value;
        DM.TabConsPedidoItens.FieldByName('referencia').Value    := Qry.FieldByName('referencia').Value;
        DM.TabConsPedidoItens.FieldByName('descricao').Value     := Qry.FieldByName('descricao').Value;
        DM.TabConsPedidoItens.FieldByName('descricao_fiscal').Value := Qry.FieldByName('descricao_fiscal').Value;
        DM.TabConsPedidoItens.FieldByName('servico').Value       := Qry.FieldByName('servico').Value;
        DM.TabConsPedidoItens.FieldByName('peso_kg').Value        := Qry.FieldByName('peso_kg').Value;
        DM.TabConsPedidoItens.FieldByName('uni').Value            := Qry.FieldByName('uni').Value;

        DM.TabConsPedidoItens.Post;
        Qry.Next;
      end;
      DM.TabConsPedidoItens.EnableControls;
      Result := True;
      msg := 'Consulta realizada com sucesso';
    except
      on E: Exception do
      begin
        msg := 'Erro ao executar consulta: ' + E.Message;
        // No raise aqui para não interromper o fluxo
      end;
    end;
  finally
    Qry.Free;
  end;
end;



{$ENDREGION}

end.
