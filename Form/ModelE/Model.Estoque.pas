unit Model.Estoque;

interface

Uses
 System.SysUtils, System.Classes, uAtributosRTTI;

Type
  [TableName('estoque')]
  TModelEstoque = Class

  Private
    Fid_produto: Integer;
    Fid_estoque: Integer;
    Fqtde: double;
    Fid_empresa: Integer;

  public

    [FieldName('id_estoque', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_estoque: Integer read Fid_estoque write Fid_estoque;

    [FieldName('id_produto')]
    [FieldOptions([foInsert,foUpdate,foSelect])]
    property id_produto: Integer read Fid_produto write Fid_produto;

    [FieldName('qtde')]
    [FieldOptions([foInsert,foUpdate,foSelect])]
    property qtde: double read Fqtde write Fqtde;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert,foUpdate,foselect])]
    property id_empresa: Integer read Fid_empresa write Fid_empresa;





//    Property idproduto    :integer  read  Fidproduto    write Fidproduto;
//    Property qtdenova     :double   read  Fqtdenova     write Fqtdenova;
//    Property movimentacao :string   read  Fmovimentacao write Fmovimentacao;
//    Property obs          :string   read  Fobs          write Fobs;
//    Property data         :TDateTime    read  Fdata         write Fdata;
//    Property idpedido     :integer  read  Fidpedido     write Fidpedido;
//    Property qtdeantes    :double   read  Fqtdeantes    write Fqtdeantes;
//    Property prccompra    :double   read  Fprccompra    write Fprccompra;
//    property prcvenda     :double   read  Fprcvenda     write Fprcvenda;
//    property codigo       :integer  read  Fcodigo       write Fcodigo;
//    property descricao    :string   read  Fdescricao    write Fdescricao;
//    property und          :string   read  Fund          write Fund;
//    Property idusuario    :integer  read  Fidusuario    write Fidusuario;
//    property idempresa    :integer  read  Fidempresa    write Fidempresa;
//    property numoperacao  :integer  read  Fnumoperacao  write Fnumoperacao;
//    property idcompra     :integer  read  Fidcompra     write Fidcompra;

//    procedure AdicionarEstoque(const idProduto,idPedido: Integer; const quantidade: Double);
//    procedure RemoverEstoque(const idProduto: Integer; const quantidade: Double);
//    function ConsultarEstoque(const idProduto: Integer): Double;
//    procedure AtualizarEstoque(const idProduto: Integer;
//      const quantidade: Double);
//    Function ProdutoControlaEstoque(out servico, contestoque:String;const id:Integer):Boolean;

    //Nova 20/10
    //Function AjusteEstoque:Boolean;


    //Function Localizar:boolean;
    //Function Editar:Boolean;
    //function Excluir:Boolean;

    //Funcionalidade nova 21/11/2024
//    Function ProdutoIncluirLista(Ope:String):Boolean;
//    Function GravarProdutoEstoque:Boolean;  // grava a movimentacao do produto como entrada, saida e ajuste.
//    Function Localizar(out msg:string;tab:integer;campo:string):Boolean;
//    Function RelSaldoEstoque(out msg:string):Boolean;  //Relatorio de saldo de estoque
//    Function RelProdutoZerado(out msg:string):Boolean;
//    Function RelProdutoNegativo(out msg:string):boolean;
//    Function RelImpresaoAjuste(out msg:string;id:integer):boolean;
//    Function IncluirProdutoEstoqueNovo:boolean; //função para quando um produto novo for cadastrado inserir na tabela estoque.
//    Function HistoricoProduto(id,tipo:integer;dt1,dt2:Tdate):boolean; //funcao para trazer o historico de um determinado produto
//    Function EstornarEstoquePedido(id,idpedido:integer;qtde:double):Boolean;

  End;

implementation


//destructor TModelEstoque.Destroy;
//begin
//  {if Assigned(FTransacao) then
//    FreeAndNil(FTransacao);
//  Model.Connection.Disconect;
//  inherited Destroy;}
//
//  inherited Destroy;
//end;

//procedure TModelEstoque.AdicionarEstoque(const idProduto,idPedido: Integer;
//  const quantidade: Double);
////var
////Model     :TModelsql;
//begin
//  {Model     := TModelsql.Create;
//  Try
//    try
//      Model.ExecutarSQL(
//        'Insert into Estoque(id_estoque, id_produto, qtde, movimentacao, observacao, data, id_pedido)'+
//                            'Values(0, :idprod, :qtde, :mov, :obs, now(), :idpedido)'
//                            ,[idProduto,quantidade,'Venda','',idpedido]);
//      // Atualiza a coluna estoque_atual na tabela produto
//      Model.ExecutarSQL(
//        'UPDATE produto SET estoque_atual = estoque_atual + :quantidade WHERE id_produto = :idprod',
//        [quantidade, idProduto]
//      );
//
//    except on e:exception do
//      raise Exception.Create(e.Message);
//    end;
//  Finally
//    model.Free;
//  End;}
//end;

//function TModelEstoque.ConsultarEstoque(const idProduto: Integer): Double;
//var
//Model :TModelsql;
//qry:tuniquery;
//strsql:string;
//begin
//  result  := 0;
//
//  Model     := TModelsql.Create;
//
//  try
//    strSql  := 'SELECT quantidade FROM estoque WHERE id_produto = :id_produto';
//
//    qry     := Model.ConsultarSQL(dm.Conn, strSql,[idProduto]);
//
//    Try
//    if not qry.IsEmpty then
//    begin
//      Result  := Qry.FieldByName('quantidade').AsFloat;
//    end;
//    Finally
//      qry.Free;
//    End;
//
//  finally
//    model.Free;
//  end;
//
//end;


//procedure TModelEstoque.RemoverEstoque(const idProduto: Integer;
//  const quantidade: Double);
////var
////Model  :TModelsql;
//begin
//  {Model     := TModelsql.Create;
//  try
//    try
//      Model.ExecutarSQL(
//        'UPDATE estoque SET quantidade = quantidade - :quantidade WHERE id_produto = :id_produto',
//        [quantidade, idProduto]
//      );
//
//    except
//
//      raise;
//    end;
//  finally
//    Model.Free;
//  end;}
//end;

//procedure TModelEstoque.AtualizarEstoque(const idProduto: Integer;
//  const quantidade: Double);
////var
////Model     :TModelsql;
//begin
//  {Model     := TModelsql.Create;
//  Try
//    try
//      Model.ExecutarSQL(
//        'UPDATE Produto SET estoque_atual = estoque_atual + :quantidade WHERE id_produto = :id_produto',
//        [quantidade, idProduto]
//      );
//
//    except
//
//      raise;
//    end;
//  Finally
//    Model.Free;
//  End;}
//end;

//constructor TModelEstoque.Create;
//begin
//inherited Create;
//
// { Model.Connection.Connect;
//  FTransacao                    := TUniTransaction.Create(nil);
//  FTransacao.DefaultConnection  := model.connection.FConnection;
//   }
//end;

//Function TModelEstoque.ProdutoControlaEstoque(out servico, contestoque: String; const id: Integer): Boolean;
//var
//  Qry: TUniQuery;
//  sqlQuery:String;
//  Model : TModelsql;
//begin
//  Result := False;
//
//  Model     := TModelsql.Create;
//
//  try
//    try
//      sqlQuery      := 'SELECT servico, controlaestoque FROM produto WHERE id_produto= :id';
//
//      Qry       := Model.ConsultarSQL(dm.Conn, SqlQuery,[id]);
//
//      if not Qry.IsEmpty then
//      begin
//        servico     := Qry.FieldByName('servico').AsString;
//        contestoque := Qry.FieldByName('controlaestoque').AsString;
//        Result := True;
//      end
//      else
//      begin
//        servico     := 'N';
//        contestoque := 'N';
//        Result := True;
//      end;
//    except
//      on E: Exception do
//      begin
//       raise Exception.Create(e.Message);
//      end;
//    end;
//  finally
//    Qry.Free;
//    model.Free;
//  end;
//end;

{$REGION 'Ajuste Estoque'}

//Function TModelEstoque.AjusteEstoque:Boolean;
//var
//  sqlQuery: string;
//  id:Integer;
//  Model     :TModelsql;
//begin
//  Result  := false;
//  sqlQuery      := 'Insert into estoque(id_estoque, id_produto, qtde, movimentacao,'+
//                    ' observacao, data, id_pedido, qtde_anterior, id_empresa, id_usuario)'+
//                    'values(:1,:2,:3,:4,:5,:6,:7,:8,:9,:10)';
//
//  Model     := TModelsql.Create;
//  Try
//    Try
//      id      := TModelSQL.GerarId(dm.Conn,'estoque','id_estoque');
//
//      if Model.ExecutarSQL(dm.Conn, sqlQuery, [id, idproduto, qtdenova, movimentacao, obs,
//                                      data, idpedido, qtdeantes, Tsession.IDEMPRESA, TSession.ID_USUARIO]) then
//      begin
//        Result  := True;
//        AtualizarEstoque(idproduto,qtdenova);
//      end
//      else
//
//    Except on e:exception do
//      begin
//       raise Exception.Create(e.Message);
//      end;
//    End;
//  Finally
//    model.Free;
//  End;
//end;

{$ENDREGION}

//Função criada para novo controle de estoque 21/11/2024

{$REGION 'Entrada Mercadoria Manual novo codigo'}

//Function TModelEstoque.ProdutoIncluirLista(Ope:String):Boolean;
//var
//  OrdemInsercao: Integer;
//begin
//  //Inclui produto na lista para dar entrada manual
//
//  if not Assigned(dm.EntradaProduto) then
//  raise Exception.Create('Dataset EntradaProduto não está criado.');
//
//  if not dm.EntradaProduto.Active then
//  dm.EntradaProduto.CreateDataSet;
//
//  if dm.EntradaProduto.RecordCount = 0 then
//    OrdemInsercao := 1
//  else
//    OrdemInsercao := dm.EntradaProduto.RecordCount + 1;
//
//
//  if dm.EntradaProduto.Active then
//  begin
//    dm.EntradaProduto.Append;
//
//    dm.EntradaProdutoid_produto.AsInteger     := idproduto;
//    dm.EntradaProdutoqtde_anterior.AsFloat    := qtdeantes;
//    dm.EntradaProdutoprc_compra.AsFloat       := prccompra;
//    dm.EntradaProdutoprc_venda.AsFloat        := prcvenda;
//    dm.EntradaProdutoqtde_nova.AsFloat        := qtdenova;
//    dm.EntradaProdutocodigo.AsInteger         := codigo;
//    dm.EntradaProdutodescricao.AsString       := descricao;
//    dm.EntradaProdutound.AsString             := und;
//    if ope = 'Entrada' then
//    dm.EntradaProdutoqtdefinal.AsFloat        := (qtdeantes + qtdenova)
//    else
//    dm.EntradaProdutoqtdefinal.AsFloat        := (qtdeantes - qtdenova);
//    dm.EntradaProdutoordemprod.AsInteger      := OrdemInsercao;
//    dm.EntradaProduto.Post;
//
//
//
//    Result  := true;
//  end
//  else
//  begin
//    Try
//      dm.EntradaProduto.Open;
//      dm.EntradaProduto.Append;
//
//      dm.EntradaProdutoid_produto.AsInteger     := idproduto;
//      dm.EntradaProdutoqtde_anterior.AsFloat    := qtdeantes;
//      dm.EntradaProdutoprc_compra.AsFloat       := prccompra;
//      dm.EntradaProdutoprc_venda.AsFloat        := prcvenda;
//      dm.EntradaProdutoqtde_nova.AsFloat        := qtdenova;
//      dm.EntradaProdutocodigo.AsInteger         := codigo;
//      dm.EntradaProdutodescricao.AsString       := descricao;
//      dm.EntradaProdutound.AsString             := und;
//      if ope = 'Entrada' then
//      dm.EntradaProdutoqtdefinal.AsFloat        := (qtdeantes + qtdenova)
//      else
//      dm.EntradaProdutoqtdefinal.AsFloat        := (qtdeantes - qtdenova);
//      dm.EntradaProdutoordemprod.AsInteger      := OrdemInsercao;
//      dm.EntradaProduto.Post;
//
//      Result  := true;
//
//    except on e:exception do
//      begin
//        raise Exception.Create('Error:'+e.Message);
//      end;
//    End;
//  end;
//
//end;
//
//Function TModelEstoque.GravarProdutoEstoque:Boolean;
//var
//  QryStr, QryStr1, QryStr2    :String;
//  ModelSql  :TModelSql;
//  id:Integer;
//begin
//  // função para gravar a mercadoria quando a movimentacao de entrada e saida  //repassando funcao para o controller estoque geral
//
//    Result  := False;
//    ModelSql  :=TModelSql.Create;
//
//
//    QryStr    := 'Insert into movimentacao_estoque(id_movimentacao, id_produto, tipo,'+
//                 ' quantidade, quantidade_anterior, preco_compra, preco_venda, '+
//                 ' data_movimentacao, id_usuario, observacao, id_empresa, num_operacao, id_pedido, id_compra)Values('+
//                 ':1,:2,:3,:4,:5,:6,:7,:8,:9,:10,:11,:12,:13, :14)';
//    Try
//
//      id  := Modelsql.GerarId(dm.Conn,'movimentacao_estoque','id_movimentacao');
//
//      if (idpedido=0) or (idpedido<0) or (idpedido=-1) then
//      idpedido  :=  -999;
//
//      if (idcompra=0) or (idcompra<0) or (idcompra=-1) then
//      idcompra  :=  -999;
//
//      if not ModelSql.ExecutarSQL(dm.Conn, QryStr,[id, idproduto, movimentacao, qtdenova, qtdeantes ,
//                               prccompra, prcvenda, data, idusuario, movimentacao+' - '+obs, idempresa, numoperacao, idpedido, idcompra]) then
//      raise Exception.Create('Error ao inserir movimentação.');
//
//      if movimentacao = 'Entrada' then
//        QryStr1 := 'UPDATE estoque SET qtde = qtde + :qtde WHERE id_produto = :idprod AND id_empresa = :idemp'
//      else if movimentacao = 'Saída' then
//        QryStr1 := 'UPDATE estoque SET qtde = qtde - :qtde WHERE id_produto = :idprod AND id_empresa = :idemp'
//      else
//        raise Exception.Create('Operação inválida. Use "Entrada" ou "Saída".');
//
//      if not ModelSql.ExecutarSQL(dm.Conn, QryStr1,[qtdenova, idproduto, idempresa]) then
//      raise Exception.Create('Error ao atualizar estoque.');
//
//      //Atualizar o produtos com os dados
//
//      if movimentacao = 'Entrada' then
//        QryStr2 := 'UPDATE Produto SET estoque_atual = estoque_atual + :qtde WHERE id_produto = :idprod'
//      else if movimentacao = 'Saída' then
//        QryStr2 := 'UPDATE Produto SET estoque_atual = estoque_atual - :qtde WHERE id_produto = :idprod'
//      else
//        raise Exception.Create('Operação inválida. Use "Entrada" ou "Saída".');
//
//      if not ModelSql.ExecutarSQL(dm.Conn, QryStr2,[qtdenova,idproduto])  then
//      raise Exception.Create('Error ao atualiza a ficha.');
//
//
//      Result  := true;
//    except on e:exception do
//      begin
//        raise Exception.Create('Error:'+e.Message);
//      end;
//    End;
//
//    ModelSql.Free;
//
//end;
//
//Function TModelEstoque.Localizar(out msg:string;tab:integer;campo:string):Boolean;
//var
//  Qry: TUniQuery;
//  sqlQuery, sqlOrdem, sqlCampo, sqlTab: string;
//  ModelSql :TModelsql;
//begin
//  Result  := False;
//
//  sqlQuery  := 'Select                                        '+
//                ' m.id_movimentacao as idmov,                 '+
//                ' m.tipo as tipo,                             '+
//                ' m.observacao as obs,                        '+
//                ' m.quantidade as qtdeajustada,               '+
//                ' m.quantidade_anterior as qtdeanterior,      '+
//                ' Coalesce(m.preco_compra,0) as prccompra,    '+
//                ' Coalesce(m.preco_venda,0) as prcvenda,      '+
//                ' m.data_movimentacao as datamov,             '+
//                ' m.num_operacao as numope,                   '+
//                ' p.descricao as nomeproduto,                 '+
//                ' p.codigo as codigoproduto                   '+
//                ' From movimentacao_estoque m                 '+
//                ' inner join produto p                        '+
//                ' on m.id_produto = p.id_produto where id_movimentacao >0';
//
//  sqlOrdem  := ' order by m.data_movimentacao, m.id_movimentacao';
//
//  if not Assigned(dm.TabConsMovEstoque) then
//  raise Exception.Create('Dataset Estoque não está criado.');
//
//  if not dm.TabConsMovEstoque.Active then
//  dm.TabConsMovEstoque.CreateDataSet;
//
//  ModelSql     := TModelsql.Create;
//
//  Try
//
//    case Tab of
//      1:sqlTab    := ' and m.tipo= ''Entrada'' ';
//      2:sqlTab    := ' and m.tipo= ''Saída'' ';
//    end;
//
//
//    if campo <> '' then
//    begin
//      sqlCampo  := ' and (m.num_operacao like :filtro or p.codigo like :filtro or p.descricao like :filtro)';
//      Qry       := ModelSql.ConsultarSQL(dm.Conn, sqlQuery+sqlTab+sqlCampo+sqlordem, ['%'+campo+'%']);
//    end
//    else
//    Qry := ModelSql.ConsultarSQL(dm.Conn, sqlQuery+sqlTab+sqlordem, []);
//
//    try
//      dm.TabConsMovEstoque.EmptyDataSet;
//      dm.TabConsMovEstoque.Open;
//
//      if not qry.IsEmpty then
//      begin
//        Result  := True;
//        msg     := 'Pesquisa realizada com sucesso!';
//
//        Qry.First;
//        dm.TabConsMovEstoque.DisableControls;
//
//        while not Qry.Eof do
//        begin
//          dm.TabConsMovEstoque.Append;
//
//          dm.TabConsMovEstoqueidmov.AsInteger       := Qry.FieldByName('idmov').AsInteger;
//          dm.TabConsMovEstoqueqtdeajustada.AsFloat  := Qry.FieldByName('qtdeajustada').AsFloat;
//          dm.TabConsMovEstoqueqtdeanterior.AsFloat  := Qry.FieldByName('qtdeanterior').AsFloat;
//          dm.TabConsMovEstoqueprccompra.AsFloat     := Qry.FieldByName('prccompra').AsFloat;
//          dm.TabConsMovEstoqueprcvenda.AsFloat      := Qry.FieldByName('prcvenda').AsFloat;
//          dm.TabConsMovEstoquedatahora.AsDateTime   := Qry.FieldByName('datamov').AsDateTime;
//          dm.TabConsMovEstoquenumoperacao.AsInteger := Qry.FieldByName('numope').AsInteger;
//          dm.TabConsMovEstoquenomeproduto.AsString  := Qry.FieldByName('nomeproduto').AsString;
//          dm.TabConsMovEstoquecodigo.AsInteger      := Qry.FieldByName('codigoproduto').AsInteger;
//          dm.TabConsMovEstoquetipo.asstring         := Qry.FieldByName('tipo').AsString;
//          dm.TabConsMovEstoquehistorico.AsString    := Qry.FieldByName('obs').AsString;
//
//          Qry.Next;
//        end;
//        dm.TabConsMovEstoque.Post;
//        dm.TabConsMovEstoque.First;
//      end
//      else
//      msg := 'Nenhum registro encontrado!';
//
//    finally
//      Qry.Free;
//      dm.TabConsMovEstoque.EnableControls;
//    end;
//  Finally
//    ModelSql.Free;
//  End;
//end;
//
//Function TModelEstoque.RelSaldoEstoque(out msg:string):Boolean;
//var
//  QryStr:String;
//  ModelSql: TModelsql;
//  Qry:Tuniquery;
//begin
//  Result  := False;
//
//  QryStr  := 'SELECT                                             '+
//             '   p.id_produto AS id_Produto,                     '+
//             '   p.descricao AS nome_produto,                    '+
//             '   p.prc_compra AS preco_compra,                   '+
//             '   p.prc_venda AS preco_venda,                     '+
//             '   p.codigo as codigo,                             '+
//             '   m.marca as nome_marca,                          '+
//             '   u.uni as nome_unidade,                          '+
//             '   g.grupo as nome_grupo,                          '+
//             '   e.qtde AS saldo_estoque,                        '+
//             '   e.id_empresa AS empresa                         '+
//            ' FROM                                                '+
//            '    estoque e                                       '+
//            ' INNER JOIN                                          '+
//            '    produto p ON p.id_produto = e.id_produto       '+
//            ' INNER JOIN                                          '+
//            '  marca m ON p.id_marca = m.id_marca                '+
//            ' INNER JOIN                                           '+
//            '  unidade u ON p.id_unidade=u.id_unidade             '+
//            ' INNER JOIN                                           '+
//            '  grupo g ON p.id_grupo=g.id_grupo                   '+
//            ' WHERE                                                '+
//            '    e.qtde > 0                                       '+
//            ' AND                                                  '+
//            '    p.ativo=''S''                                      '+
//            ' AND                                                  '+
//            '  p.servico=''N''                                      '+
//            ' ORDER BY                                             '+
//            '    p.descricao ASC;';
//
//  ModelSql     := TModelsql.Create;
//
//  Try
//    try
//      Qry :=  ModelSql.ConsultarSQL(dm.Conn, QryStr,[]);
//
//      Try
//        if not Qry.IsEmpty then
//        begin
//          qry.First;
//          dm.TabSaldoEstoque.DisableControls;
//          while not Qry.Eof do
//          begin
//            dm.TabSaldoEstoque.Append;
//            dm.TabSaldoEstoqueid_produto.AsInteger    := Qry.FieldByName('id_Produto').AsInteger;
//            dm.TabSaldoEstoquenome_produto.AsString   := Qry.FieldByName('nome_produto').AsString;
//            dm.TabSaldoEstoqueprccompra.AsFloat       := Qry.FieldByName('preco_compra').AsFloat;
//            dm.TabSaldoEstoqueprcvenda.AsFloat        := Qry.FieldByName('preco_venda').AsFloat;
//            dm.TabSaldoEstoquecodigo.AsInteger        := Qry.FieldByName('codigo').AsInteger;
//            dm.TabSaldoEstoquenome_marca.AsString     := Qry.FieldByName('nome_marca').AsString;
//            dm.TabSaldoEstoquenome_unidade.AsString   := Qry.FieldByName('nome_unidade').AsString;
//            dm.TabSaldoEstoquenome_grupo.AsString     := Qry.FieldByName('nome_grupo').AsString;
//            dm.TabSaldoEstoquesaldoestoque.AsFloat    := Qry.FieldByName('saldo_estoque').AsFloat;
//
//            Qry.Next;
//          end;
//          dm.TabSaldoEstoque.Post;
//          dm.TabSaldoEstoque.First;
//          result  := true;
//        end;
//      Finally
//        Qry.Free;
//      End;
//
//    except on e:exception do
//      raise Exception.Create('Error ao consulta estoque.');
//    end;
//
//  Finally
//    ModelSql.Free;
//  End;
//
//end;
//
//Function TModelEstoque.RelProdutoZerado(out msg:string):Boolean;
//var
//  QryStr:String;
//  ModelSql: TModelsql;
//  Qry:Tuniquery;
//begin
//  Result  := False;
//
//  QryStr  := 'SELECT                                             '+
//             '   p.id_produto AS id_Produto,                     '+
//             '   p.descricao AS nome_produto,                    '+
//             '   p.prc_compra AS preco_compra,                   '+
//             '   p.prc_venda AS preco_venda,                     '+
//             '   p.codigo as codigo,                             '+
//             '   m.marca as nome_marca,                          '+
//             '   u.uni as nome_unidade,                          '+
//             '   g.grupo as nome_grupo,                          '+
//             '   e.qtde AS saldo_estoque,                        '+
//             '   e.id_empresa AS empresa                         '+
//            ' FROM                                                '+
//            '    estoque e                                       '+
//            ' INNER JOIN                                          '+
//            '    produto p ON p.id_produto = e.id_produto       '+
//            ' INNER JOIN                                          '+
//            '  marca m ON p.id_marca = m.id_marca                '+
//            ' INNER JOIN                                           '+
//            '  unidade u ON p.id_unidade=u.id_unidade             '+
//            ' INNER JOIN                                           '+
//            '  grupo g ON p.id_grupo=g.id_grupo                   '+
//            ' WHERE                                                '+
//            '    e.qtde = 0                                       '+
//            ' AND                                                  '+
//            '    p.ativo=''S''                                      '+
//            ' AND                                                  '+
//            '  p.servico=''N''                                      '+
//            ' ORDER BY                                             '+
//            '    p.descricao ASC;';
//
//  ModelSql     := TModelsql.Create;
//
//  Try
//    try
//      Qry :=  ModelSql.ConsultarSQL(dm.Conn, QryStr,[]);
//
//      Try
//        if not Qry.IsEmpty then
//        begin
//          qry.First;
//          dm.TabProdutoZerado.DisableControls;
//          while not Qry.Eof do
//          begin
//            dm.TabProdutoZerado.Append;
//            dm.TabProdutoZeradoid_produto.AsInteger    := Qry.FieldByName('id_Produto').AsInteger;
//            dm.TabProdutoZeradonome_produto.AsString   := Qry.FieldByName('nome_produto').AsString;
//            dm.TabProdutoZeradoprccompra.AsFloat       := Qry.FieldByName('preco_compra').AsFloat;
//            dm.TabProdutoZeradoprcvenda.AsFloat        := Qry.FieldByName('preco_venda').AsFloat;
//            dm.TabProdutoZeradocodigo.AsInteger        := Qry.FieldByName('codigo').AsInteger;
//            dm.TabProdutoZeradonome_marca.AsString     := Qry.FieldByName('nome_marca').AsString;
//            dm.TabProdutoZeradonome_unidade.AsString   := Qry.FieldByName('nome_unidade').AsString;
//            dm.TabProdutoZeradonome_grupo.AsString     := Qry.FieldByName('nome_grupo').AsString;
//            dm.TabProdutoZeradosaldoestoque.AsFloat    := Qry.FieldByName('saldo_estoque').AsFloat;
//
//            Qry.Next;
//          end;
//          dm.TabProdutoZerado.Post;
//          dm.TabProdutoZerado.First;
//          result  := true;
//        end;
//      Finally
//        Qry.Free;
//      End;
//
//    except on e:exception do
//      raise Exception.Create('Error ao consulta estoque.');
//    end;
//
//  Finally
//    ModelSql.Free;
//  End;
//end;
//
//Function TModelEstoque.RelProdutoNegativo(out msg:string):boolean;
//var
//  QryStr:String;
//  ModelSql: TModelsql;
//  Qry:Tuniquery;
//begin
//  Result  := False;
//
//  QryStr  := 'SELECT                                             '+
//             '   p.id_produto AS id_Produto,                     '+
//             '   p.descricao AS nome_produto,                    '+
//             '   p.prc_compra AS preco_compra,                   '+
//             '   p.prc_venda AS preco_venda,                     '+
//             '   p.codigo as codigo,                             '+
//             '   m.marca as nome_marca,                          '+
//             '   u.uni as nome_unidade,                          '+
//             '   g.grupo as nome_grupo,                          '+
//             '   e.qtde AS saldo_estoque,                        '+
//             '   e.id_empresa AS empresa                         '+
//            ' FROM                                                '+
//            '    estoque e                                       '+
//            ' INNER JOIN                                          '+
//            '    produto p ON p.id_produto = e.id_produto       '+
//            ' INNER JOIN                                          '+
//            '  marca m ON p.id_marca = m.id_marca                '+
//            ' INNER JOIN                                           '+
//            '  unidade u ON p.id_unidade=u.id_unidade             '+
//            ' INNER JOIN                                           '+
//            '  grupo g ON p.id_grupo=g.id_grupo                   '+
//            ' WHERE                                                '+
//            '    e.qtde <0                                       '+
//            ' AND                                                  '+
//            '    p.ativo=''S''                                      '+
//            ' AND                                                  '+
//            '  p.servico=''N''                                      '+
//            ' ORDER BY                                             '+
//            '    p.descricao ASC;';
//
//  ModelSql     := TModelsql.Create;
//
//  Try
//    try
//      Qry :=  ModelSql.ConsultarSQL(dm.Conn, QryStr,[]);
//
//      Try
//        if not Qry.IsEmpty then
//        begin
//          qry.First;
//          dm.TabEstoqueNegativo.DisableControls;
//          while not Qry.Eof do
//          begin
//            dm.TabEstoqueNegativo.Append;
//            dm.TabEstoqueNegativoid_produto.AsInteger    := Qry.FieldByName('id_Produto').AsInteger;
//            dm.TabEstoqueNegativonome_produto.AsString   := Qry.FieldByName('nome_produto').AsString;
//            dm.TabEstoqueNegativoprccompra.AsFloat       := Qry.FieldByName('preco_compra').AsFloat;
//            dm.TabEstoqueNegativoprcvenda.AsFloat        := Qry.FieldByName('preco_venda').AsFloat;
//            dm.TabEstoqueNegativocodigo.AsInteger        := Qry.FieldByName('codigo').AsInteger;
//            dm.TabEstoqueNegativonome_marca.AsString     := Qry.FieldByName('nome_marca').AsString;
//            dm.TabEstoqueNegativonome_unidade.AsString   := Qry.FieldByName('nome_unidade').AsString;
//            dm.TabEstoqueNegativonome_grupo.AsString     := Qry.FieldByName('nome_grupo').AsString;
//            dm.TabEstoqueNegativosaldoestoque.AsFloat    := Qry.FieldByName('saldo_estoque').AsFloat;
//
//            Qry.Next;
//          end;
//          dm.TabEstoqueNegativo.Post;
//          dm.TabEstoqueNegativo.First;
//          result  := true;
//        end;
//      Finally
//        Qry.Free;
//      End;
//
//    except on e:exception do
//      raise Exception.Create('Error ao consulta estoque.');
//    end;
//
//  Finally
//    ModelSql.Free;
//  End;
//end;
//
//Function TModelEstoque.RelImpresaoAjuste(out msg:string;id:integer):boolean;
//var
//  Qry: TUniQuery;
//  sqlQuery: string;
//  ModelSql :TModelsql;
//begin
//  Result  := False;
//
//  sqlQuery  := 'Select                                        '+
//                ' m.id_movimentacao as idmov,                 '+
//                ' m.id_produto as idproduto,                   '+
//                ' m.tipo as tipo,'+
//                ' m.quantidade as qtdeajustada,               '+
//                ' m.quantidade_anterior as qtdeanterior,      '+
//                ' Coalesce(m.preco_compra,0) as prccompra,    '+
//                ' Coalesce(m.preco_venda,0) as prcvenda,      '+
//                ' m.data_movimentacao as datamov,             '+
//                ' m.num_operacao as numope,                   '+
//                ' p.descricao as nomeproduto,                 '+
//                ' p.codigo as codigoproduto,                   '+
//                ' u.uni as unidade'+
//                ' From movimentacao_estoque m                 '+
//                ' inner join produto p                        '+
//                ' on m.id_produto = p.id_produto              '+
//                ' inner join unidade u                        '+
//                ' on p.id_unidade = u.id_unidade'+
//                ' where m.num_operacao= :op';
//
//  ModelSql     := TModelsql.Create;
//
//  Try
//
//    Qry := ModelSql.ConsultarSQL(dm.Conn, sqlQuery, [id]);
//
//    try
//      dm.EntradaProduto.EmptyDataSet;
//      dm.EntradaProduto.Open;
//
//      if not qry.IsEmpty then
//      begin
//        Result  := True;
//
//        Qry.First;
//        dm.EntradaProduto.DisableControls;
//
//        while not Qry.Eof do
//        begin
//          dm.EntradaProduto.Append;
//
//          dm.EntradaProdutoid_produto.AsInteger   := Qry.FieldByName('idproduto').AsInteger;
//          dm.EntradaProdutoqtde_anterior.AsFloat  := Qry.FieldByName('qtdeanterior').AsFloat;
//          dm.EntradaProdutoprc_compra.AsFloat     := Qry.FieldByName('prccompra').AsFloat;
//          dm.EntradaProdutoprc_venda.AsFloat      := Qry.FieldByName('prcvenda').AsFloat;
//          dm.EntradaProdutoqtde_nova.AsFloat      := Qry.FieldByName('qtdeajustada').AsFloat;
//          dm.EntradaProdutocodigo.AsInteger       := Qry.FieldByName('codigoproduto').AsInteger;
//          dm.EntradaProdutodescricao.AsString     := Qry.FieldByName('nomeproduto').AsString;
//          dm.EntradaProdutound.AsString           := Qry.FieldByName('unidade').AsString;
//
//          if Qry.FieldByName('tipo').AsString = 'Entrada' then
//          dm.EntradaProdutoqtdefinal.AsFloat      := (Qry.FieldByName('qtdeanterior').AsFloat + Qry.FieldByName('qtdeajustada').AsFloat)
//          else
//          dm.EntradaProdutoqtdefinal.AsFloat      := (Qry.FieldByName('qtdeanterior').AsFloat - Qry.FieldByName('qtdeajustada').AsFloat);
//
//          msg := Qry.FieldByName('tipo').AsString;
//          Qry.Next;
//        end;
//        dm.EntradaProduto.Post;
//        dm.EntradaProduto.First;
//      end;
//
//    finally
//      Qry.Free;
//      dm.EntradaProduto.EnableControls;
//    end;
//  Finally
//    ModelSql.Free;
//  End;
//end;
//
//Function TModelEstoque.IncluirProdutoEstoqueNovo:boolean;
//var
//  QryStr     :String;
//  ModelSql  :TModelSql;
//  id:Integer;
//begin
//  // função para gravar a mercadoria quando a movimentacao
//
//    Result  := False;
//    ModelSql  :=TModelSql.Create;
//
//    QryStr    := 'Insert into estoque(id_estoque, id_produto, qtde, id_empresa)'+
//                  'values(:1,:2,:3,:4)';
//    Try
//
//
//      id  := Modelsql.GerarId(dm.Conn,'estoque','id_estoque');
//
//      if not ModelSql.ExecutarSQL(dm.Conn, QryStr,[id, idproduto, qtdenova, idempresa]) then
//      raise Exception.Create('Error ao inserir estoque.');
//
//      Result  := true;
//    except on e:exception do
//      begin
//
//        raise Exception.Create('Error:'+e.Message);
//      end;
//    End;
//
//    ModelSql.Free;
//end;
//
//Function TModelEstoque.HistoricoProduto(id,tipo:integer;dt1,dt2:Tdate):boolean;
//var
//  QryStr, QryTipo:String;
//  ModelSql: TModelsql;
//  Qry:Tuniquery;
//  nDate1,nDate2:string;
//begin
//  Result  := False;
//
//  QryStr  := 'Select                                          '+
//              ' m.id_movimentacao as id,'+
//              ' m.tipo as tipo,                               '+
//              ' m.quantidade as qtde,                         '+
//              ' m.data_movimentacao as datamov,               '+
//              ' m.observacao as obs,                          '+
//              ' p.codigo,                                     '+
//              ' p.descricao,                                  '+
//              ' concat(p.codigo,'' | '',p.descricao) as nproduto  '+
//              ' From movimentacao_estoque m                   '+
//              ' inner join produto p                          '+
//              ' on m.id_produto=p.id_produto where m.id_movimentacao >0 '+
//              ' and m.data_movimentacao >= :x and m.data_movimentacao < :y and m.id_produto= :id ';
//
//  ModelSql     := TModelsql.Create;
//
//  Try
//    try
//
//      case tipo of
//        0: QryTipo := ' and tipo=''Entrada'' ';
//        1: QryTipo := ' and tipo=''Saída'' ';
//        2: QryTipo := ' and tipo=''Ajuste'' ';
//      end;
//
//      nDate1   := FormatDateTime('yyyy-mm-dd', dt1);
//      nDate2   := FormatDateTime('yyyy-mm-dd', dt2);
//
//      Qry :=  ModelSql.ConsultarSQL(dm.Conn, QryStr+QryTipo,[nDate1,nDate2,id]);
//
//      Try
//        if not Qry.IsEmpty then
//        begin
//          qry.First;
//
//          if not Assigned(dm.TabHistoricoProduto) then
//          raise Exception.Create('Dataset EntradaProduto não está criado.');
//
//          if not dm.TabHistoricoProduto.Active then
//          dm.TabHistoricoProduto.CreateDataSet;
//
//          dm.TabHistoricoProduto.EmptyDataSet;
//
//          dm.TabHistoricoProduto.DisableControls;
//          while not Qry.Eof do
//          begin
//            dm.TabHistoricoProduto.Append;
//
//            dm.TabHistoricoProdutotipo.AsString       := Qry.FieldByName('tipo').AsString;
//            dm.TabHistoricoProdutoqtde.AsFloat        := Qry.FieldByName('qtde').AsFloat;
//            dm.TabHistoricoProdutodata.AsDateTime     := Qry.FieldByName('datamov').AsDateTime;
//            dm.TabHistoricoProdutoobs.AsString        := Qry.FieldByName('obs').AsString;
//            dm.TabHistoricoProdutocodigo.AsInteger    := Qry.FieldByName('codigo').AsInteger;
//            dm.TabHistoricoProdutodescricao.AsString  := Qry.FieldByName('descricao').AsString;
//            dm.TabHistoricoProdutonproduto.AsString   := Qry.FieldByName('nproduto').AsString;
//
//            Qry.Next;
//          end;
//          dm.TabHistoricoProduto.Post;
//          dm.TabHistoricoProduto.First;
//          result  := true;
//        end;
//      Finally
//        Qry.Free;
//        dm.TabHistoricoProduto.EnableControls;
//      End;
//
//    except on e:exception do
//      raise Exception.Create('Error ao consulta estoque.');
//    end;
//
//  Finally
//    ModelSql.Free;
//  End;
//end;
//
//
//Function TModelEstoque.EstornarEstoquePedido(id,idpedido:integer;qtde:double):Boolean;
//var
//  QryStr,QryStrEstoque,QryStrProduto  :String;
//  ModelSql  :TModelSql;
//begin  //Funcao para estornar estoque quando e feito no pedido
//  Result  := False;
//
//  Try
//    ModelSql  := TModelSql.Create;
//    Try
//      QryStr  := 'Delete from movimentacao_estoque where id_produto= :id and id_pedido= :idpedido';
//
//
//
//      if not ModelSql.ExecutarSQL(dm.Conn, QryStr,[id, idpedido]) then
//      raise Exception.Create('Error ao inserir estoque.');
//
//      QryStrEstoque := 'UPDATE estoque SET qtde = qtde + :qtde WHERE id_produto = :idprod AND id_empresa = :idemp';
//      if not ModelSql.ExecutarSQL(dm.Conn, QryStrEstoque,[qtde, id, idempresa]) then
//      raise Exception.Create('Error ao atualizar estoque.');
//
//      QryStrProduto := 'UPDATE Produto SET estoque_atual = estoque_atual + :qtde WHERE id_produto = :idprod';
//      if not ModelSql.ExecutarSQL(dm.Conn,QryStrProduto,[qtde,id])  then
//      raise Exception.Create('Error ao atualiza a ficha do produto.');
//
//
//      Result  := true;
//    Finally
//      ModelSql.Free;
//    End;
//
//  Except on e:exception do
//   begin
//    raise Exception.Create(e.Message);
//
//   end;
//  End;
//
//end;



{$ENDREGION}



end.
