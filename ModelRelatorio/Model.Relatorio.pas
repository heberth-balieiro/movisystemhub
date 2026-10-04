unit Model.Relatorio;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,

  UDM,
  data.DB,
  datasnap.dbclient,
  UDMRelatorio,
  System.MaskUtils;

Type
  TModelRelatorio = Class

  Private
    FTransacao  : TUniTransaction;
    function RelListagemVotantesCabecalho(Filtro: String): boolean;

  public
    constructor Create;
    destructor Destroy; override;

    //Pedidos
    Function RelPedido(out msg:String;idPedido:integer):Boolean;
    Function RelPedidoItens(out msg:String;idPedido:integer):Boolean;
    Function RelListagemPessoa(TabPessoa, TabAtivo:Integer;Filtro:string):Boolean;

    //Eleição
    Function RelListagemAssociadoAptosInaptos(Filtro:String):boolean;
    Function RelListagemAssociadoVotantes(Filtro: String): boolean;
    function RelListagemAssociadoNaoVotantes(Filtro: String): boolean;

    //ATA
    Function RelAta(Filtro:String):Boolean;

  End;

implementation

uses
  System.Math, Model.SQLQry, UConeSul;

destructor TModelRelatorio.Destroy;
begin
  if Assigned(FTransacao) then
    FreeAndNil(FTransacao);

  inherited Destroy;
end;

constructor TModelRelatorio.Create;
begin
inherited Create;

  FTransacao                    := TUniTransaction.Create(nil);
  FTransacao.DefaultConnection  := dm.Conn;

end;

{$REGION 'Impresso Pedido'}

Function TModelRelatorio.RelPedido(out msg:String;idPedido:integer):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);

  try
    try

      if not dm.Conn.Connected then
        dm.Conn.Open;

      Qry.Connection := dm.Conn;

      sqlQuery := 'Select                    '+
                  '  p.numPedido,             '+
                  '  p.data,                 '+
                  '  p.hora,                 '+
                  '  p.observacao,           '+
                  '  coalesce(p.adiantamento,0) as adiantamento,         '+
                  '  coalesce(p.acrescimo,0) as acrescimo,            '+
                  '  coalesce(p.descontoperc,0) as descontoperc ,         '+
                  '  coalesce(p.descontoreais,0) as descontoreais,        '+
                  '  coalesce(p.subtotal,0) as subtotal,             '+
                  '  coalesce(p.total,0) as total,                '+
                  '  p.data_entrega,         '+
                  '  s.nome,                 '+
                  '  s.apelido,              '+
                  '  s.endereco,             '+
                  '  s.numero,               '+
                  '  s.bairro,               '+
                  '  s.cep,                  '+
                  '  s.cpf,                  '+
                  '  s.rg,                   '+
                  '  s.email,                '+
                  '  s.telefone,             '+
                  '  s.whatsapp,             '+
                  '  s.celular,              '+
                  '  c.cidade,               '+
                  '  z.descricao             '+
                  '  From pedido P           '+
                  '  inner join socio s      '+
                  '  on p.id_cliente = s.id_socio  '+
                  '  inner join cidade c           '+
                  '  on s.id_cidade = c.id_cidade  '+
                  '  inner join prazopagamento z   '+
                  '  on p.id_prazo = z.id_prazo    '+
                  '  where p.id_pedido= :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger  := IdPedido;

      Qry.Open;

      if DMRelatorio.ClientPedido.Active then
      begin
        dMRelatorio.ClientPedido.Close; // Feche o dataset se estiver ativo
      end;

      DMRelatorio.ClientPedido.DisableControls;


      if DMRelatorio.ClientPedido.FieldDefs.Count = 0 then
      begin
        DMRelatorio.ClientPedido.fieldDefs.clear;
        DMRelatorio.ClientPedido.FieldDefs.Add('numPedido',      ftInteger);
        DMRelatorio.ClientPedido.FieldDefs.Add('data',           ftDate);
        DMRelatorio.ClientPedido.FieldDefs.Add('hora',           ftTime);
        DMRelatorio.ClientPedido.FieldDefs.Add('observacao',     ftString,500);
        DMRelatorio.ClientPedido.FieldDefs.Add('adiantamento',   ftFloat);
        DMRelatorio.ClientPedido.FieldDefs.Add('acrescimo',      ftFloat);
        DMRelatorio.ClientPedido.FieldDefs.Add('descontoperc',   ftFloat);
        DMRelatorio.ClientPedido.FieldDefs.Add('descontoreais',  ftFloat);
        DMRelatorio.ClientPedido.FieldDefs.Add('subtotal',       ftFloat);
        DMRelatorio.ClientPedido.FieldDefs.Add('total',          ftFloat);
        DMRelatorio.ClientPedido.FieldDefs.Add('data_entrega',   ftDate);
        DMRelatorio.ClientPedido.FieldDefs.Add('nome',           ftString,190);
        DMRelatorio.ClientPedido.FieldDefs.Add('apelido',        ftString,120);
        DMRelatorio.ClientPedido.FieldDefs.Add('endereco',       ftstring,90);
        DMRelatorio.ClientPedido.FieldDefs.Add('numero',         ftString,20);
        DMRelatorio.ClientPedido.FieldDefs.Add('bairro',         ftString,60);
        DMRelatorio.ClientPedido.FieldDefs.Add('cep',            ftString,20);
        DMRelatorio.ClientPedido.FieldDefs.Add('cpf',            ftString,20);
        DMRelatorio.ClientPedido.FieldDefs.Add('rg',             ftString,20);
        DMRelatorio.ClientPedido.FieldDefs.Add('email',          ftString,190);
        DMRelatorio.ClientPedido.FieldDefs.Add('telefone',       ftString,20);
        DMRelatorio.ClientPedido.FieldDefs.Add('whatsapp',       ftstring,20);
        DMRelatorio.ClientPedido.FieldDefs.Add('celular',        ftstring,20);
        DMRelatorio.ClientPedido.FieldDefs.Add('cidade',         ftstring,90);
        DMRelatorio.ClientPedido.FieldDefs.Add('descricao',      ftstring,90);

        DMRelatorio.ClientPedido.createdataset;
      end
      else
      begin
        DMRelatorio.ClientPedido.createdataset;
      end;

      DMRelatorio.ClientPedido.Append;
      DMRelatorio.ClientPedido.FieldByName('numPedido').Value    := Qry.FieldByName('numPedido').Value;
      DMRelatorio.ClientPedido.FieldByName('data').Value         := Qry.FieldByName('data').Value;
      DMRelatorio.ClientPedido.FieldByName('hora').Value         := Qry.FieldByName('hora').Value;
      DMRelatorio.ClientPedido.FieldByName('observacao').Value   := Qry.FieldByName('observacao').Value;
      DMRelatorio.ClientPedido.FieldByName('adiantamento').Value := Qry.FieldByName('adiantamento').Value;
      DMRelatorio.ClientPedido.FieldByName('acrescimo').Value    := Qry.FieldByName('acrescimo').Value;
      DMRelatorio.ClientPedido.FieldByName('descontoperc').Value := Qry.FieldByName('descontoperc').Value;
      DMRelatorio.ClientPedido.FieldByName('descontoreais').Value:= Qry.FieldByName('descontoreais').Value;
      DMRelatorio.ClientPedido.FieldByName('subtotal').Value     := Qry.FieldByName('subtotal').Value;
      DMRelatorio.ClientPedido.FieldByName('total').Value        := Qry.FieldByName('total').Value;
      DMRelatorio.ClientPedido.FieldByName('data_entrega').Value := Qry.FieldByName('data_entrega').Value;
      DMRelatorio.ClientPedido.FieldByName('nome').Value         := Qry.FieldByName('nome').Value;
      DMRelatorio.ClientPedido.FieldByName('apelido').Value      := Qry.FieldByName('apelido').Value;
      DMRelatorio.ClientPedido.FieldByName('endereco').Value     := Qry.FieldByName('endereco').Value;
      DMRelatorio.ClientPedido.FieldByName('numero').Value       := Qry.FieldByName('numero').Value;
      DMRelatorio.ClientPedido.FieldByName('bairro').Value       := Qry.FieldByName('bairro').Value;
      DMRelatorio.ClientPedido.FieldByName('cep').Value          := Qry.FieldByName('cep').Value;
      DMRelatorio.ClientPedido.FieldByName('cpf').Value          := Qry.FieldByName('cpf').Value;
      DMRelatorio.ClientPedido.FieldByName('rg').Value           := Qry.FieldByName('rg').Value;
      DMRelatorio.ClientPedido.FieldByName('email').Value        := Qry.FieldByName('email').Value;
      DMRelatorio.ClientPedido.FieldByName('telefone').Value     := Qry.FieldByName('telefone').Value;
      DMRelatorio.ClientPedido.FieldByName('whatsapp').Value     := Qry.FieldByName('whatsapp').Value;
      DMRelatorio.ClientPedido.FieldByName('celular').Value      := Qry.FieldByName('celular').Value;
      DMRelatorio.ClientPedido.FieldByName('cidade').Value       := Qry.FieldByName('cidade').Value;
      DMRelatorio.ClientPedido.FieldByName('descricao').Value    := Qry.FieldByName('descricao').Value;

      DMRelatorio.ClientPedido.Post;
      DMRelatorio.ClientPedido.EnableControls;
      Result := True;
      msg := 'Consulta realizada com sucesso';

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

Function TModelRelatorio.RelPedidoItens(out msg:String;idPedido:integer):Boolean;
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
                  '  p.servico,                                      ' +
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
      Qry.ParamByName('id').AsInteger := idPedido;

      Qry.Open;

      if DMRelatorio.ClientPedidoItens.Active then
      begin
        //DMRelatorio.ClientPedidoItens.Close; // Feche o dataset se estiver ativo
        DMRelatorio.ClientPedidoItens.EmptyDataSet;
      end;

      DMRelatorio.ClientPedidoItens.DisableControls;

      // Adiciona a estrutura ao TClientDataSet se não estiver definida
      if DMRelatorio.ClientPedidoItens.FieldDefs.Count = 0 then
      begin
        DMRelatorio.ClientPedidoItens.FieldDefs.Clear;
        DMRelatorio.ClientPedidoItens.FieldDefs.Add('qtde',           ftFloat);
        DMRelatorio.ClientPedidoItens.FieldDefs.Add('qtde2',          ftFloat);
        DMRelatorio.ClientPedidoItens.FieldDefs.Add('prcunitario',    ftFloat);
        DMRelatorio.ClientPedidoItens.FieldDefs.Add('descontoperc',   ftFloat);
        DMRelatorio.ClientPedidoItens.FieldDefs.Add('descontoreais',  ftFloat);
        DMRelatorio.ClientPedidoItens.FieldDefs.Add('proddescalterada', ftString, 255);
        DMRelatorio.ClientPedidoItens.FieldDefs.Add('complemento',    ftString, 255);
        DMRelatorio.ClientPedidoItens.FieldDefs.Add('prctotal',       ftFloat);
        DMRelatorio.ClientPedidoItens.FieldDefs.Add('codigo',         ftInteger);
        DMRelatorio.ClientPedidoItens.FieldDefs.Add('cod_barras',     ftString, 50);
        DMRelatorio.ClientPedidoItens.FieldDefs.Add('referencia',     ftString, 50);
        DMRelatorio.ClientPedidoItens.FieldDefs.Add('descricao',      ftString, 255);
        DMRelatorio.ClientPedidoItens.FieldDefs.Add('descricao_fiscal', ftString, 255);
        DMRelatorio.ClientPedidoItens.FieldDefs.Add('servico',        ftString, 1);
        DMRelatorio.ClientPedidoItens.FieldDefs.Add('peso_kg',        ftFloat);
        DMRelatorio.ClientPedidoItens.FieldDefs.Add('uni',            ftString, 5);
        DMRelatorio.ClientPedidoItens.CreateDataSet;
      end;
      Qry.First;
      while not Qry.Eof do
      begin
        DMRelatorio.ClientPedidoItens.Append;
        DMRelatorio.ClientPedidoItens.FieldByName('qtde').Value           := Qry.FieldByName('qtde').Value;
        DMRelatorio.ClientPedidoItens.FieldByName('qtde2').Value          := Qry.FieldByName('qtde2').Value;
        DMRelatorio.ClientPedidoItens.FieldByName('prcunitario').Value    := Qry.FieldByName('prcunitario').Value;
        DMRelatorio.ClientPedidoItens.FieldByName('descontoperc').Value   := Qry.FieldByName('descontoperc').Value;
        DMRelatorio.ClientPedidoItens.FieldByName('descontoreais').Value  := Qry.FieldByName('descontoreais').Value;
        DMRelatorio.ClientPedidoItens.FieldByName('proddescalterada').Value := Qry.FieldByName('proddescalterada').Value;
        DMRelatorio.ClientPedidoItens.FieldByName('complemento').Value   := Qry.FieldByName('complemento').Value;
        DMRelatorio.ClientPedidoItens.FieldByName('prctotal').Value       := Qry.FieldByName('prctotal').Value;
        DMRelatorio.ClientPedidoItens.FieldByName('codigo').Value        := Qry.FieldByName('codigo').Value;
        DMRelatorio.ClientPedidoItens.FieldByName('cod_barras').Value    := Qry.FieldByName('cod_barras').Value;
        DMRelatorio.ClientPedidoItens.FieldByName('referencia').Value    := Qry.FieldByName('referencia').Value;
        DMRelatorio.ClientPedidoItens.FieldByName('descricao').Value     := Qry.FieldByName('descricao').Value;
        DMRelatorio.ClientPedidoItens.FieldByName('descricao_fiscal').Value := Qry.FieldByName('descricao_fiscal').Value;
        DMRelatorio.ClientPedidoItens.FieldByName('servico').Value       := Qry.FieldByName('servico').Value;
        DMRelatorio.ClientPedidoItens.FieldByName('peso_kg').Value        := Qry.FieldByName('peso_kg').Value;
        DMRelatorio.ClientPedidoItens.FieldByName('uni').Value            := Qry.FieldByName('uni').Value;

        DMRelatorio.ClientPedidoItens.Post;
        Qry.Next;
      end;
      DMRelatorio.ClientPedidoItens.EnableControls;
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

Function TModelRelatorio.RelListagemPessoa(TabPessoa, TabAtivo:Integer;Filtro:string):Boolean;
begin

end;






{$ENDREGION}

{$REGION 'Impresso Eleição'}

Function TModelRelatorio.RelListagemAssociadoAptosInaptos(Filtro:String):boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
   Result := False;
   Qry := TUniQuery.Create(nil);

   Try
    Try
      if not dm.Conn.Connected then
      dm.Conn.Open;
      Qry.Connection := dm.Conn;

      sqlQuery    := 'CALL GetSociosPorSituacao('''+filtro+''');';

      Qry.Close;
      Qry.SQL.Text := sqlQuery;

      qry.Open;

      if DMRelatorio.RelListagemAptos.Active then
      begin
        DMRelatorio.RelListagemAptos.EmptyDataSet;
      end;

      DMRelatorio.RelListagemAptos.DisableControls;

      // Adiciona a estrutura ao TClientDataSet se não estiver definida
      if DMRelatorio.RelListagemAptos.FieldDefs.Count = 0 then
      begin
        DMRelatorio.RelListagemAptos.fieldDefs.clear;
        DMRelatorio.RelListagemAptos.FieldDefs.Add('codigo',      ftInteger);
        DMRelatorio.RelListagemAptos.FieldDefs.Add('matricula',   ftInteger);
        DMRelatorio.RelListagemAptos.FieldDefs.Add('nome',        ftstring,190);
        DMRelatorio.RelListagemAptos.FieldDefs.Add('razao',       ftstring,190);
        DMRelatorio.RelListagemAptos.FieldDefs.Add('cpf',         ftString,20);
        DMRelatorio.RelListagemAptos.createdataset;
      end;


      Qry.First;
      while not Qry.Eof do
      begin
        DMRelatorio.RelListagemAptos.Append;
        DMRelatorio.RelListagemAptos.FieldByName('codigo').Value         := Qry.FieldByName('codigo').Value;
        DMRelatorio.RelListagemAptos.FieldByName('matricula').Value      := Qry.FieldByName('matricula').Value;
        DMRelatorio.RelListagemAptos.FieldByName('nome').Value           := Qry.FieldByName('nome').Value;
        DMRelatorio.RelListagemAptos.FieldByName('razao').Value          := Qry.FieldByName('razao').Value;
        DMRelatorio.RelListagemAptos.FieldByName('cpf').Value            := FormatMaskText('000\.000\.000\-00;0',Qry.FieldByName('cpf').Value);

        DMRelatorio.RelListagemAptos.Post;
        Qry.Next;
      end;
      DMRelatorio.RelListagemAptos.first;
      DMRelatorio.RelListagemAptos.EnableControls;
      Result := True;

    Except on e:exception do
      raise Exception.Create(e.Message);
    End;
   Finally
    FreeAndNil(Qry);
   End;

end;

Function TModelRelatorio.RelListagemAssociadoVotantes(Filtro:String):boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
   Result := False;
   Qry := TUniQuery.Create(nil);

   if RelListagemVotantesCabecalho(Filtro) = False then
   Exit;

   Try
    Try
      if not dm.Conn.Connected then
      dm.Conn.open;
      Qry.Connection := dm.Conn;

      sqlQuery    := 'CALL GetListaAssociadoVotantes('''+filtro+''');';

      Qry.Close;
      Qry.SQL.Text := sqlQuery;

      qry.Open;

      if DMRelatorio.RelListagemVotantes.Active then
      begin
        DMRelatorio.RelListagemVotantes.EmptyDataSet;
      end;

      DMRelatorio.RelListagemVotantes.DisableControls;

      // Adiciona a estrutura ao TClientDataSet se não estiver definida
      if DMRelatorio.RelListagemVotantes.FieldDefs.Count = 0 then
      begin
        DMRelatorio.RelListagemVotantes.fieldDefs.clear;
        DMRelatorio.RelListagemVotantes.FieldDefs.Add('codigo',      ftInteger);
        DMRelatorio.RelListagemVotantes.FieldDefs.Add('matricula',   ftInteger);
        DMRelatorio.RelListagemVotantes.FieldDefs.Add('nome',        ftstring,190);
        DMRelatorio.RelListagemVotantes.FieldDefs.Add('cpf',         ftString,20);
        DMRelatorio.RelListagemVotantes.FieldDefs.Add('rg',          ftstring,20);
        DMRelatorio.RelListagemVotantes.FieldDefs.Add('orgao',       ftString,20);
        DMRelatorio.RelListagemVotantes.FieldDefs.Add('ordem',       ftInteger);
        DMRelatorio.RelListagemVotantes.FieldDefs.Add('ip',          ftString,30);
        DMRelatorio.RelListagemVotantes.FieldDefs.Add('chave',       ftString,500);
        DMRelatorio.RelListagemVotantes.FieldDefs.Add('data',        ftDate);
        DMRelatorio.RelListagemVotantes.FieldDefs.Add('hora',        ftTime);

        DMRelatorio.RelListagemVotantes.createdataset;
      end;


      Qry.First;
      while not Qry.Eof do
      begin
        DMRelatorio.RelListagemVotantes.Append;
        DMRelatorio.RelListagemVotantes.FieldByName('codigo').Value         := Qry.FieldByName('codigo').Value;
        DMRelatorio.RelListagemVotantes.FieldByName('matricula').Value      := Qry.FieldByName('matricula').Value;
        DMRelatorio.RelListagemVotantes.FieldByName('nome').Value           := Qry.FieldByName('nome').Value;
        DMRelatorio.RelListagemVotantes.FieldByName('cpf').Value            := FormatMaskText('000\.000\.000\-00;0',Qry.FieldByName('cpf').Value);
        DMRelatorio.RelListagemVotantes.FieldByName('rg').Value             := Qry.FieldByName('rg').Value;
        DMRelatorio.RelListagemVotantes.FieldByName('orgao').Value          := Qry.FieldByName('orgao').Value;
        DMRelatorio.RelListagemVotantes.FieldByName('ordem').Value          := Qry.FieldByName('ordem').Value;
        DMRelatorio.RelListagemVotantes.FieldByName('ip').Value          := Qry.FieldByName('ip').Value;
        DMRelatorio.RelListagemVotantes.FieldByName('chave').Value          := Qry.FieldByName('chave').Value;
        DMRelatorio.RelListagemVotantes.FieldByName('data').Value          := Qry.FieldByName('data').Value;
        DMRelatorio.RelListagemVotantes.FieldByName('hora').Value          := Qry.FieldByName('hora').Value;

        DMRelatorio.RelListagemVotantes.Post;
        Qry.Next;
      end;
      DMRelatorio.RelListagemVotantes.first;
      DMRelatorio.RelListagemVotantes.EnableControls;
      Result := True;

    Except on e:exception do
      raise Exception.Create(e.Message);
    End;
   Finally
    FreeAndNil(Qry);
   End;

end;

Function TModelRelatorio.RelListagemVotantesCabecalho(Filtro:String):boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
   Result := False;
   Qry := TUniQuery.Create(nil);

   Try
    Try
      if not dm.Conn.Connected then
      dm.Conn.Open;
      Qry.Connection := dm.Conn;

      sqlQuery    := 'CALL GetCampanhaCabechalho('''+filtro+''');';

      Qry.Close;
      Qry.SQL.Text := sqlQuery;

      qry.Open;

      if DMRelatorio.RelCabechalhoVotantes.Active then
      begin
        DMRelatorio.RelCabechalhoVotantes.EmptyDataSet;
      end;

      DMRelatorio.RelCabechalhoVotantes.DisableControls;

      // Adiciona a estrutura ao TClientDataSet se não estiver definida
      if DMRelatorio.RelCabechalhoVotantes.FieldDefs.Count = 0 then
      begin
        DMRelatorio.RelCabechalhoVotantes.fieldDefs.clear;

        DMRelatorio.RelCabechalhoVotantes.FieldDefs.Add('descricao',   ftstring,250);
        DMRelatorio.RelCabechalhoVotantes.FieldDefs.Add('nome',        ftString,250);
        DMRelatorio.RelCabechalhoVotantes.FieldDefs.Add('data_ini',    ftdate);
        DMRelatorio.RelCabechalhoVotantes.FieldDefs.Add('hora_ini',    fttime);
        DMRelatorio.RelCabechalhoVotantes.FieldDefs.Add('data_final',  ftdate);
        DMRelatorio.RelCabechalhoVotantes.FieldDefs.Add('hora_final',  fttime);

        DMRelatorio.RelCabechalhoVotantes.createdataset;
      end;


      Qry.First;
      while not Qry.Eof do
      begin
        DMRelatorio.RelCabechalhoVotantes.Append;
        DMRelatorio.RelCabechalhoVotantes.FieldByName('descricao').Value         := Qry.FieldByName('descricao').Value;
        DMRelatorio.RelCabechalhoVotantes.FieldByName('nome').Value      := Qry.FieldByName('nome').Value;
        DMRelatorio.RelCabechalhoVotantes.FieldByName('data_ini').Value           := Qry.FieldByName('data_ini').Value;
        DMRelatorio.RelCabechalhoVotantes.FieldByName('hora_ini').Value            := Qry.FieldByName('hora_ini').Value;
        DMRelatorio.RelCabechalhoVotantes.FieldByName('data_final').Value             := Qry.FieldByName('data_final').Value;
        DMRelatorio.RelCabechalhoVotantes.FieldByName('hora_final').Value          := Qry.FieldByName('hora_final').Value;

        DMRelatorio.RelCabechalhoVotantes.Post;
        Qry.Next;
      end;
      DMRelatorio.RelCabechalhoVotantes.first;
      DMRelatorio.RelCabechalhoVotantes.EnableControls;
      Result := True;

    Except on e:exception do
      raise Exception.Create(e.Message);
    End;
   Finally
    FreeAndNil(Qry);
   End;

end;

Function TModelRelatorio.RelListagemAssociadoNaoVotantes(Filtro:String):boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
   Result := False;
   Qry := TUniQuery.Create(nil);

   if RelListagemVotantesCabecalho(Filtro) = False then
   Exit;

   Try
    Try
      if not dm.Conn.Connected then
      dm.Conn.Open;
      Qry.Connection := dm.Conn;

      sqlQuery    := 'CALL GetCampanhaNaoVotantes('''+filtro+''');';

      Qry.Close;
      Qry.SQL.Text := sqlQuery;

      qry.Open;

      if DMRelatorio.RelListagemNaoVotantes.Active then
      begin
        DMRelatorio.RelListagemNaoVotantes.EmptyDataSet;
      end;

      DMRelatorio.RelListagemNaoVotantes.DisableControls;

      // Adiciona a estrutura ao TClientDataSet se não estiver definida
      if DMRelatorio.RelListagemNaoVotantes.FieldDefs.Count = 0 then
      begin
        DMRelatorio.RelListagemNaoVotantes.fieldDefs.clear;
        DMRelatorio.RelListagemNaoVotantes.FieldDefs.Add('codigo',      ftInteger);
        DMRelatorio.RelListagemNaoVotantes.FieldDefs.Add('matricula',   ftInteger);
        DMRelatorio.RelListagemNaoVotantes.FieldDefs.Add('nome',        ftstring,190);
        DMRelatorio.RelListagemNaoVotantes.FieldDefs.Add('cpf',         ftString,20);
        DMRelatorio.RelListagemNaoVotantes.FieldDefs.Add('rg',          ftstring,20);
        DMRelatorio.RelListagemNaoVotantes.FieldDefs.Add('orgao',       ftString,20);
        DMRelatorio.RelListagemNaoVotantes.FieldDefs.Add('email',       ftString,190);

        DMRelatorio.RelListagemNaoVotantes.createdataset;
      end;


      Qry.First;
      while not Qry.Eof do
      begin
        DMRelatorio.RelListagemNaoVotantes.Append;
        DMRelatorio.RelListagemNaoVotantes.FieldByName('codigo').Value         := Qry.FieldByName('codigo').Value;
        DMRelatorio.RelListagemNaoVotantes.FieldByName('matricula').Value      := Qry.FieldByName('matricula').Value;
        DMRelatorio.RelListagemNaoVotantes.FieldByName('nome').Value           := Qry.FieldByName('nome').Value;
        DMRelatorio.RelListagemNaoVotantes.FieldByName('cpf').Value            := FormatMaskText('000\.000\.000\-00;0',Qry.FieldByName('cpf').Value);
        DMRelatorio.RelListagemNaoVotantes.FieldByName('rg').Value             := Qry.FieldByName('rg').Value;
        DMRelatorio.RelListagemNaoVotantes.FieldByName('orgao').Value          := Qry.FieldByName('orgao').Value;
        DMRelatorio.RelListagemNaoVotantes.FieldByName('email').Value          := Qry.FieldByName('email').Value;

        DMRelatorio.RelListagemNaoVotantes.Post;
        Qry.Next;
      end;
      DMRelatorio.RelListagemNaoVotantes.first;
      DMRelatorio.RelListagemNaoVotantes.EnableControls;
      Result := True;

    Except on e:exception do
      raise Exception.Create(e.Message);
    End;
   Finally
    FreeAndNil(Qry);
   End;

end;

Function TModelRelatorio.RelAta(Filtro:String):Boolean;
var
  QryStringVotantes, QryStringChapa,QryStringVencedora:String;
  ModelQry :TModelSQL;
  Qry1, Qry2, Qry3: TUniQuery;
begin
  Result  := False;
  QryStringVotantes   := 'SELECT COUNT(DISTINCT id_associado) AS TotalVotantes    '+
                                          ' FROM votos where token= :tk;';

  QryStringChapa      := 'SELECT                                               '+
                            ' SUM(CASE WHEN voto = 1 THEN 1 ELSE 0 END) AS chapa,'+
                            ' SUM(CASE WHEN voto = 3 THEN 1 ELSE 0 END) AS brancos'+
                            ' FROM votos where token= :tk';

  QryStringVencedora  := 'SELECT                                               '+
                                ' c.nome AS nChapa,                            '+
                                ' a.nome AS nCandidato,                        '+
                                ' COUNT(*) AS TotalVotos                       '+
                                ' FROM votos v                                 '+
                                ' INNER JOIN chapa c ON v.voto = c.id_chapa    '+
                                ' INNER JOIN candidato a ON c.id_candidato = a.id_candidato '+
                                ' and v.token= :tk'+
                                ' GROUP BY c.nome, a.nome                '+
                                ' ORDER BY TotalVotos DESC               '+
                                ' LIMIT 1;                                ';

  ModelQry    := TModelSQL.Create;

  Try
    Qry1      := ModelQry.ConsultarSQL(dm.Conn,QryStringVotantes,[Filtro]);
    Qry2      := ModelQry.ConsultarSQL(dm.Conn,QryStringChapa,[Filtro]);
    Qry3      := ModelQry.ConsultarSQL(dm.Conn,QryStringVencedora,[Filtro]);

    try
      DMRelatorio.RelATA.Append;
      if not Qry1.Eof then
      begin
        DMRelatorio.RelATAqtde_votantes.AsInteger   := Qry1.FieldByName('TotalVotantes').AsInteger;
        DMRelatorio.RelATAvotantesstr.Asstring      := TConeSul.NumeroPorExtenso(Qry1.FieldByName('TotalVotantes').AsInteger);
        //DMRelatorio.RelATA.Post;
      end;

      if not Qry2.Eof then
      begin
        //DMRelatorio.RelATA.Append;
        DMRelatorio.RelATAqtde_votantes_chapa1.AsInteger   := Qry2.FieldByName('chapa').AsInteger;
        DMRelatorio.RelATAqtde_votantes_branco.AsInteger   := Qry2.FieldByName('brancos').AsInteger;
        DMRelatorio.RelATAchapastr.asstring                := TConeSul.NumeroPorExtenso(Qry2.FieldByName('chapa').AsInteger);
        DMRelatorio.RelATAbrancostr.asstring               := TConeSul.NumeroPorExtenso(Qry2.FieldByName('brancos').AsInteger);
        //DMRelatorio.RelATA.Post;
      end;

      if not Qry3.Eof then
      begin
        //DMRelatorio.RelATA.Append;
        DMRelatorio.RelATApessoa.Asstring       := Qry3.FieldByName('nCandidato').asstring;
        DMRelatorio.RelATAnchapa.AsString       := qry3.FieldByName('nChapa').AsString;
        DMRelatorio.RelATAqtde_votos.asinteger  := qry3.FieldByName('TotalVotos').AsInteger;
        DMRelatorio.RelATAvotosstr.asstring     := TConeSul.NumeroPorExtenso(qry3.FieldByName('TotalVotos').AsInteger);
      end;

      Try
        DMRelatorio.RelATA.Post;
        Result  := True;
      except on e:exception do
        raise Exception.Create(e.Message);
      End;

    finally
      Qry1.free;
      Qry2.free;
      Qry3.free;
    end;

  Finally
    ModelQry.free;
  End;

end;

{$ENDREGION}

end.
