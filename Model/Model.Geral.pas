unit Model.Geral;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,

  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TModelGeral = Class
    Private
      FTransacao  : TUniTransaction;
      function GerarId(tab, campo: string): integer;
      Function GravarTabProdutosValores(const id_produto, id_compra, id_pedido: Integer;
                  const historico: string;
                  const data_movimentacao: TDate;
                  const vlr_fipe, vlr_compra, vlr_lucro, perc_lucro, vlr_venda,
                        vlr_troca, vlr_praticado, taxames, taxadia, totalpatio,
                        lojacomissaopercentual, lojacomissaovelor,
                        vendedorcomissaopercentual, vendedorcomissaovalor: Currency):Boolean;
    Public
      constructor Create;
      destructor Destroy;

      procedure IniciarTransacao;
      procedure ConfirmarTransacao;
      procedure DesfazerTransacao;

      function BuscarFichaVeiculo(idveiculo,idcompra: integer): Boolean;
      function GravarHistoricoProdutoVeiculo(idProd, iduser, idemp,num:integer; desc:string):Boolean;

  End;

implementation


Function TModelGeral.GerarId(tab, campo:string):integer;
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

{$REGION 'Garagem'}

Function TModelGeral.BuscarFichaVeiculo(idveiculo,idcompra:integer):Boolean;
{var
  Qry         :TUniquery;   //função desabilitada. passado para controller veiculo atualizar
Const
  QryStr  = 'Select * from produto where id_produto= :id';}
begin
  {Result  := False;
  Qry     := Tuniquery.Create(nil);

  Try
    Qry.Connection      := dm.Conn;
    Qry.Params.Clear;
    Qry.SQL.Text        := QryStr;
    Qry.Params.ParamByName('id').AsInteger        := idveiculo;

    Try
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        if GravarTabProdutosValores(Qry.FieldByName('id_produto').AsInteger,
                                    idcompra,
                                    -999,
                                    'Compra veículos',
                                    now,
                                    Qry.FieldByName('veiculo_fipe').AsCurrency,
                                    Qry.FieldByName('prc_compra').AsCurrency,
                                    Qry.FieldByName('veiculo_lucro').AsCurrency,
                                    Qry.FieldByName('per_lucro').AsCurrency,
                                    Qry.FieldByName('prc_venda').AsCurrency,
                                    Qry.FieldByName('veiculo_valortroca').AsCurrency,
                                    Qry.FieldByName('veiculo_valorpraticado').AsCurrency,
                                    Qry.FieldByName('veiculo_patiotaxames').AsCurrency,
                                    Qry.FieldByName('veiculo_patiotaxadia').AsCurrency,
                                    Qry.FieldByName('veiculo_patiototal').AsCurrency,
                                    Qry.FieldByName('veiculo_comissaoljpercentual').AsCurrency,
                                    Qry.FieldByName('veiculo_comissaoljtotal').AsCurrency,
                                    Qry.FieldByName('veiculo_comissaovendpercentual').AsCurrency,
                                    Qry.FieldByName('veiculo_comissaovendtotal').AsCurrency
                                    ) then
        begin
          Result  := True;
        end;
      end;

    Except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;

  Finally
    FreeAndNil(Qry);
  End;}

end;


function TModelGeral.GravarTabProdutosValores(const id_produto, id_compra, id_pedido: Integer;
  const historico: string;
  const data_movimentacao: TDate;
  const vlr_fipe, vlr_compra, vlr_lucro, perc_lucro, vlr_venda,
        vlr_troca, vlr_praticado, taxames, taxadia, totalpatio,
        lojacomissaopercentual, lojacomissaovelor,
        vendedorcomissaopercentual, vendedorcomissaovalor: Currency): Boolean;
{var
  Qry :TUniquery;     //desativado
Const
  QryStr  = 'INSERT INTO produtos_valores (' +
            '  id_valores, id_produto, id_compra, id_pedido, historico, data_movimentacao, ' +
            '  vlr_fipe, vlr_compra, vlr_lucro, perc_lucro, vlr_venda, vlr_troca, ' +
            '  vlr_praticado, taxames, taxadia, totalpatio, ' +
            '  lojacomissaopercentual, lojacomissaovelor, ' +
            '  vendedorcomissaopercentual, vendedorcomissaovalor) ' +
            'VALUES (' +
            '  :id_valores, :id_produto, :id_compra, :id_pedido, :historico, :data_movimentacao, ' +
            '  :vlr_fipe, :vlr_compra, :vlr_lucro, :perc_lucro, :vlr_venda, :vlr_troca, ' +
            '  :vlr_praticado, :taxames, :taxadia, :totalpatio, ' +
            '  :lojacomissaopercentual, :lojacomissaovelor, ' +
            '  :vendedorcomissaopercentual, :vendedorcomissaovalor)'; }
begin
 { Result  := False;
  Qry     := TUniquery.Create(nil);

  Try
    Qry.Connection      := dm.Conn;
    Qry.Params.Clear;
    Qry.SQL.Text        := QryStr;
    //IniciarTransacao;

    Qry.Params.ParamByName('id_valores').AsInteger                := GerarId('produtos_valores','id_valores');
    Qry.Params.ParamByName('id_produto').AsInteger                := id_produto;
    Qry.Params.ParamByName('id_compra').AsInteger                 := id_compra;
    Qry.Params.ParamByName('id_pedido').AsInteger                 := id_pedido;
    Qry.Params.ParamByName('historico').AsString                  := historico;
    Qry.Params.ParamByName('data_movimentacao').AsDate            := data_movimentacao;

    Qry.Params.ParamByName('vlr_fipe').AsCurrency                 := vlr_fipe;
    Qry.Params.ParamByName('vlr_compra').AsCurrency               := vlr_compra;
    Qry.Params.ParamByName('vlr_lucro').AsCurrency                := vlr_lucro;
    Qry.Params.ParamByName('perc_lucro').AsCurrency               := perc_lucro;
    Qry.Params.ParamByName('vlr_venda').AsCurrency                := vlr_venda;
    Qry.Params.ParamByName('vlr_troca').AsCurrency                := vlr_troca;
    Qry.Params.ParamByName('vlr_praticado').AsCurrency            := vlr_praticado;
    Qry.Params.ParamByName('taxames').AsCurrency                  := taxames;
    Qry.Params.ParamByName('taxadia').AsCurrency                  := taxadia;
    Qry.Params.ParamByName('totalpatio').AsCurrency               := totalpatio;

    Qry.Params.ParamByName('lojacomissaopercentual').AsCurrency   := lojacomissaopercentual;
    Qry.Params.ParamByName('lojacomissaovelor').AsCurrency        := lojacomissaovelor;
    Qry.Params.ParamByName('vendedorcomissaopercentual').AsCurrency := vendedorcomissaopercentual;
    Qry.Params.ParamByName('vendedorcomissaovalor').AsCurrency    := vendedorcomissaovalor;

    Try
      Qry.ExecSQL;
      //ConfirmarTransacao;
      Result  := True;
    Except on e:exception do
      begin
        //DesfazerTransacao;
        raise Exception.Create(e.Message);
      end;
    End;

  Finally
    FreeAndNil(Qry);
  End; }

end;


{$ENDREGION}

{$REGION 'Geral'}

function TModelGeral.GravarHistoricoProdutoVeiculo(idProd, iduser, idemp,num:integer; desc:string):Boolean;
var
  Qry     : TUniquery;
Const
  QryStr  = 'Insert into veiculo_log(id, id_veiculo, id_usuario, id_empresa, data, hora, descricao)'+
                                    'Values(0, :1,:2,:3,:4,:5,:6)';
begin
  Result    := False;
  Qry       := TUniquery.Create(nil);

  Try
      Qry.Connection    := DM.Conn;
      Qry.SQL.Text      := QryStr;
      IniciarTransacao;
      qry.Params.ParamByName('1').AsInteger    := idProd;
      qry.Params.ParamByName('2').AsInteger    := iduser;
      qry.Params.ParamByName('3').AsInteger    := idemp;
      qry.Params.ParamByName('4').AsDateTime   := Now;
      qry.Params.ParamByName('5').AsDateTime   := time;
      qry.Params.ParamByName('6').AsString     := Trim(desc)+' '+IntTostr(num);
    try
      Qry.ExecSQL;
      ConfirmarTransacao;
      result  := true;
    Except on e:exception do
      begin
        DesfazerTransacao;
        raise Exception.Create('Erro ao gravar histórico: '+e.Message);
      end;
    End;

  Finally
    FreeandNil(Qry);
  End;
end;

{$ENDREGION}

{$Region 'Transacao'}

procedure TModelGeral.IniciarTransacao;
begin
  try
    if not Assigned(FTransacao) then
      raise Exception.Create('Transação não inicializada.');

    if not FTransacao.Active then
      FTransacao.StartTransaction;
  except
    on E: Exception do
      raise Exception.Create('Erro ao iniciar transação: ' + E.Message);
  end;
end;

destructor TModelGeral.Destroy;
begin
  Try
      if Assigned(FTransacao) then
      FreeAndNil(FTransacao);


    except
      on E: Exception do
        raise Exception.Create('Erro ao liberar recursos: ' + E.Message);
    end;
    inherited;
end;

procedure TModelGeral.DesfazerTransacao;
begin
  try
    if Assigned(FTransacao) and FTransacao.Active then
      FTransacao.Rollback;
  except
    on E: Exception do
      raise Exception.Create('Erro ao desfazer transação: ' + E.Message);
  end;
end;

procedure TModelGeral.ConfirmarTransacao;
begin
  try
    if Assigned(FTransacao) and FTransacao.Active then
      FTransacao.Commit;
  except
    on E: Exception do
      raise Exception.Create('Erro ao confirmar transação: ' + E.Message);
  end;
end;

constructor TModelGeral.Create;
procedure LogErro(const Mensagem: String);
  var
    LogFile: TextFile;
    LogPath: String;
  begin
    LogPath := ExtractFilePath(ParamStr(0)) + 'Log_banco'+FormatDateTime('yyyy-mm-dd hh:nn:ss', Now)+'.txt';
    AssignFile(LogFile, LogPath);
    try
      Rewrite(LogFile);
      Writeln(LogFile, FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) + ' - ' + Mensagem);
    finally
      CloseFile(LogFile);
    end;
  end;

begin
  Try

    FTransacao                    := TUniTransaction.Create(nil);
    FTransacao.DefaultConnection  := dm.Conn;
    //LogErro('Conexão com banco de dados realizado com sucesso.');
  except on E: Exception do
    begin
      LogErro(Format('Erro ao processar conexão index %d: %s - %s', [E.ClassName, E.Message]));
      raise Exception.Create('Erro ao criar conexão: ' + E.Message);
    end;
  end;
end;

{$ENDREGION}
end.
