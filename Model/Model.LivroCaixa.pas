unit Model.LivroCaixa;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,

  UDM,
  data.DB,
  datasnap.dbclient,
  Model.SQLQry;

Type
  TModelLivroCaixa = Class

  Private
    FHistorico: string;
    FOperacao: string;
    FValor: Currency;
    FDocNumero: string;
    FCodigo: Integer;
    FIdLivro: Integer;
    FIdCusto: Integer;
    FVlrSaida: Currency;
    FSaldo: Currency;
    FVlrEntrada: Currency;
    FIdPlano: Integer;
    FData: TDate;
    Fidpedido: Integer;



  Public
    constructor Create;
    destructor Destroy;
    property IdLivro    : Integer   read FIdLivro     write FIdLivro;
    property Codigo     : Integer   read FCodigo      write FCodigo;
    property DataLan    : TDate     read FData        write FData;
    property Operacao   : string    read FOperacao    write FOperacao;
    property DocNumero  : string    read FDocNumero   write FDocNumero;
    property VlrEntrada : Currency  read FVlrEntrada  write FVlrEntrada;
    property VlrSaida   : Currency  read FVlrSaida    write FVlrSaida;
    property Saldo      : Currency  read FSaldo       write FSaldo;
    property Historico  : string    read FHistorico   write FHistorico;
    property Valor      : Currency  read FValor       write FValor;
    property IdPlano    : Integer   read FIdPlano     write FIdPlano;
    property IdCusto    : Integer   read FIdCusto     write FIdCusto;

    property idpedido   : Integer   read  Fidpedido   write Fidpedido;

    Function Novo(out msg:string):Boolean;
    Function Editar(out msg:string):Boolean;
    Function Excluir(out msg:string):Boolean;

    Function Localizar(out msg:string;TabStatus:integer;campo:string; dtIni, dtfim:tDate):Boolean;
    Function LocalizarID(out msg:string;i:integer):Boolean;

    Function Registrar(out msg: string): Boolean; //Registrar origem Pedido
    Function ExcluirRegistro(out msg: string; idpedido: integer): Boolean; //Origem Pedido

  End;

  var
  ModelSql : TModelSQL;

implementation

{ TModelLivroCaixa }

uses Vcl.Session, System.DateUtils;

constructor TModelLivroCaixa.Create;
begin

end;

destructor TModelLivroCaixa.Destroy;
begin

end;

function TModelLivroCaixa.Editar(out msg: string): Boolean;
var
  sqlQuery,SqlQuerySaldo: string;
  saldoatual, vlrentradaant,vlrsaidaant,novoSaldo:Double;
  QryRet  :Tuniquery;
  nDate:string;
begin
  Result  := false;
  sqlQuery      := 'UPDATE livrocaixa SET '+
                            'datalan = :data, '+
                            'operacao = :operacao, '+
                            'doc_numero = :doc_numero, '+
                            'vlr_entrada = :vlr_entrada, '+
                            'vlr_saida = :vlr_saida, '+
                            'saldo = :saldo, '+
                            'historico = :historico, '+
                            'valor = :valor, '+
                            'id_plano = :id_plano, '+
                            'id_custo = :id_custo '+
                            'WHERE id_livro = :id;';

  SqlQuerySaldo  := 'SELECT saldo, vlr_entrada, vlr_saida FROM livrocaixa where id_livro= :id;';

  ModelSql       := TModelSQL.Create;


  Try
    //atualizar o saldo
    QryRet       := Modelsql.ConsultarSQL(dm.Conn,SqlQuerySaldo,[idLivro]);

    Try
      if not Qryret.IsEmpty then
      begin
        saldoatual    := QryRet.Fields.FieldByName('saldo').AsFloat;
        vlrentradaant := QryRet.Fields.FieldByName('vlr_entrada').AsFloat;
        vlrsaidaant   := QryRet.Fields.FieldByName('vlr_saida').AsFloat;
      end;
    Finally
      QryRet.Free;
    End;

    Try
      nDate   := FormatDateTime('yyyy-mm-dd', DataLan);

      if operacao = 'Entrada' then
      novoSaldo   := saldoatual - vlrentradaant + VlrEntrada
      else
      novoSaldo   := saldoatual + vlrsaidaant - VlrSaida; // Atualiza saldo para saída

      if Modelsql.ExecutarSQL(dm.Conn,sqlQuery, [nDate, Operacao, DocNumero, VlrEntrada,
                              VlrSaida, novoSaldo, Historico, Valor, IdPlano, IdCusto, idLivro])  then
      begin
        Result  := True;
        msg     := 'Registro atualizado com sucesso!';
      end
      else
        msg     := 'Erro ao atualizar os dados!';
    Except on e:exception do
      begin
        msg := 'Erro ao atualizar os dados:'+#13+e.Message;
      end;
    End;
  Finally
    Modelsql.Free;
  End;
end;

function TModelLivroCaixa.Excluir(out msg: string): Boolean;
var
  sqlQuery: string;
begin
  Result  := false;
  sqlQuery      := 'Delete from livrocaixa where id_livro= :id and id_empresa= :idemp';

  ModelSql      := TModelSQL.Create;
  Try
    Try
      if ModelSql.ExecutarSQL(dm.Conn,sqlQuery, [idlivro, Tsession.IDEMPRESA]) then
      begin
        Result  := True;
        msg     := 'Registro excluido com sucesso!';
      end
      else
        msg     := 'Erro ao excluir os dados!';
    Except on e:exception do
      begin
        msg := 'Erro ao excluir os dados:'+#13+e.Message;
      end;
    End;
  Finally
    //Modelsql.Free;
  End;
end;

function TModelLivroCaixa.Localizar(out msg: string; TabStatus: integer;campo: string; dtIni, dtfim:tDate): Boolean;
var
  Qry,QrySaldo: TUniQuery;
  sqlQuery, sqlOrdem, sqlstatus, sqlCampo,sqldata, SqlQuerySaldo: string;
  ndata1, ndata2:string;
  nSaldo:double;
begin
  //Converte as data
  ndata1      := FormatDateTime('yyyy-mm-dd', dtIni);
  ndata2      := FormatDateTime('yyyy-mm-dd', dtfim);

  SqlQuery := 'SELECT 0 AS ordem, ' +
            ' NULL AS id_livro, ' +
            ' NULL AS codigo, ' +
            ' NULL AS datalan, ' +
            ' CASE WHEN (SELECT COALESCE(SUM(vlr_entrada - vlr_saida), 0) as saldo '+
            ' FROM livrocaixa AS lc WHERE lc.datalan <= DATE_SUB(STR_TO_DATE(:ndata, ''%Y-%m-%d''),INTERVAL 1 DAY)) > 0 THEN ''C'' ELSE ''D'' END AS operacao, ' +
            ' NULL AS doc_numero, ' +
            ' ''Saldo Anterior'' AS historico, ' +
            ' NULL AS vlr_entrada, ' +
            ' NULL AS vlr_saida, ' +
            ' (SELECT COALESCE(SUM(vlr_entrada - vlr_saida), 0)  '+
            ' FROM livrocaixa AS lc WHERE lc.datalan <= DATE_SUB(STR_TO_DATE(:ndata1, ''%Y-%m-%d''), INTERVAL 1 DAY)) AS saldo, ' +
            ' NULL AS valor ' +
            ' UNION ALL ' +
            ' SELECT 1 AS ordem, id_livro, codigo, datalan, ' +
            ' CASE WHEN operacao = ''Entrada'' THEN ''C'' ELSE ''D'' END AS operacao, ' +
            ' doc_numero, historico, COALESCE(vlr_entrada, 0) AS vlr_entrada, ' +
            ' COALESCE(vlr_saida, 0) AS vlr_saida, COALESCE(saldo, 0) AS saldo, COALESCE(valor, 0) AS valor ' +
            ' FROM livrocaixa WHERE id_livro > 0';

  sqlOrdem  := ' order by id_livro, datalan;';

  //Pega saldo
  SqlQuerySaldo  := ' SELECT COALESCE(SUM(vlr_entrada - vlr_saida), 0) AS saldo FROM livrocaixa WHERE datalan <= DATE_SUB(STR_TO_DATE(:ndata, ''%Y-%m-%d''), INTERVAL 1 DAY)';
                 //'SELECT COALESCE(SUM(saldo), 0) as saldo FROM livrocaixa AS lc WHERE lc.datalan < STR_TO_DATE('+ndata1+', ''%Y-%m-01'')';

  case TabStatus of
    1: sqlstatus  := ' and operacao=''Entrada'' ';
    2: sqlstatus  := ' and operacao=''Saída'' ';
  end;

  Sqldata   := ' and datalan >= :x and datalan <= :y';

  ModelSql  := TModelSQL.Create;
  nsaldo    := 0;

  try

    //consulta saldo
    QrySaldo    := modelSql.ConsultarSQL(dm.Conn,SqlQuerySaldo,[ndata1]);

    Try
      if not QrySaldo.Eof then
      begin
        nSaldo    := QrySaldo.FieldByName('saldo').AsFloat;
      end;

    Finally
      QrySaldo.Free;
    End;

    if campo <> '' then
    begin
      sqlCampo  := ' and (codigo like :campo or '+
                        ' doc_numero like :campo or '+
                        ' historico like :campo)';

      sqlQuery  := sqlQuery + sqlstatus + Sqldata + sqlCampo + sqlOrdem;
      Qry       := modelSql.ConsultarSQL(dm.Conn,sqlQuery, [ndata1,ndata1, ndata1, ndata2, '%'+campo+'%']);

    end
    else
    begin
      SqlQuery  := sqlQuery + sqlstatus + Sqldata + sqlOrdem;
      Qry       := modelSql.ConsultarSQL(dm.Conn,sqlQuery, [ndata1,ndata1, ndata1, ndata2]);
    end;

    try
      dm.TabConsLivroCaixa.EmptyDataSet;
      dm.TabConsLivroCaixa.Open;

      if not qry.IsEmpty then
      begin

        Qry.First;
        dm.TabConsLivroCaixa.DisableControls;

        while not Qry.Eof do
        begin
          //Resultado da consulta

          Dm.TabConsLivroCaixa.append;
          Dm.TabConsLivroCaixaid.asinteger	   := Qry.FieldByName('id_livro').AsInteger;
          Dm.TabConsLivroCaixacodigo.asinteger := Qry.FieldByName('codigo').AsInteger;
          if Qry.FieldByName('datalan').IsNull then
          Dm.TabConsLivroCaixadata.asdatetime  := EndOfTheMonth(IncMonth(dtIni, -1))
          else
          Dm.TabConsLivroCaixadata.asdatetime  := Qry.FieldByName('datalan').AsDateTime;
          Dm.TabConsLivroCaixaoperacao.asstring:= Qry.FieldByName('operacao').AsString;
          Dm.TabConsLivroCaixadoc.asstring     := Qry.FieldByName('doc_numero').AsString;
          Dm.TabConsLivroCaixavlre.asfloat     := Qry.FieldByName('vlr_entrada').AsFloat;
          Dm.TabConsLivroCaixavlrs.asfloat     := Qry.FieldByName('vlr_saida').AsFloat;
          Dm.TabConsLivroCaixasaldo.asfloat    := Qry.FieldByName('saldo').AsFloat;
          Dm.TabConsLivroCaixahistorico.asstring	:= Qry.FieldByName('historico').AsString;
          Dm.TabConsLivroCaixavalor.asfloat    := Qry.FieldByName('valor').AsFloat;
          dm.TabConsLivroCaixansaldo.AsFloat   := nSaldo;

          Qry.Next;
        end;
        Dm.TabConsLivroCaixa.post;
        //dm.TabConsLivroCaixa.First;
        Result  := True;
        msg     := 'Pesquisa realizada com sucesso!';
      end
      else
      msg := 'Nenhum registro encontrado!';

    finally
      Qry.Free;
      Dm.TabConsLivroCaixa.EnableControls;
    end;
  finally
    ModelSql.Free;
  end;
end;

function TModelLivroCaixa.LocalizarID(out msg: string; i: integer): Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result    := False;
  sqlQuery  := 'Select * from livrocaixa where id_livro= :id and id_empresa= :idemp';

  ModelSql  := TModelsql.Create;
  Try
    Qry     := ModelSql.ConsultarSQL(dm.Conn,sqlQuery, [i,TSession.IDEMPRESA]);

    try
      if not qry.Eof then
      begin
        idlivro   := Qry.FieldByName('id_livro').AsInteger;
        codigo    := Qry.FieldByName('codigo').AsInteger;
        datalan   := Qry.FieldByName('datalan').AsDateTime;
        operacao  := Qry.FieldByName('operacao').AsString;
        docnumero := Qry.FieldByName('doc_numero').AsString;
        historico := Qry.FieldByName('historico').AsString;
        valor     := Qry.FieldByName('valor').AsFloat;
        idplano   := Qry.FieldByName('id_plano').AsInteger;
        idcusto   := Qry.FieldByName('id_custo').AsInteger;
        Result    := true;
      end;
    finally
      Qry.Free;
    end;
  Finally
    ModelSql.Free;
  End;
end;

function TModelLivroCaixa.Novo(out msg: string): Boolean;
var
  sqlQuery,SqlQuerySaldo: string;
  id, cod:Integer;
  nDate:string;
  SaldoAnterior, Novosaldo:Double;
  QryRet  :Tuniquery;
begin
  Result  := False;
  sqlQuery      := 'INSERT INTO livrocaixa (    '+
                              ' id_livro,'+
                              ' codigo,'         +
                              ' datalan,'           +
                              ' operacao,'       +
                              ' doc_numero,'     +
                              ' vlr_entrada,'   +
                              ' vlr_saida,'     +
                              ' saldo,'         +
                              ' historico,'     +
                              ' valor,'         +
                              ' id_plano,'      +
                              ' id_custo,'      +
                              ' id_empresa,'    +
                              ' id_usuario,'    +
                              ' data_cadastro'   +
                              ') VALUES (       '+
                              ' :id,'+
                              ' :codigo,        '+
                              ' :data,          '+
                              ' :operacao,      '+
                              ' :doc_numero,    '+
                              ' :vlr_entrada,   '+
                              ' :vlr_saida,     '+
                              ' :saldo,         '+
                              ' :historico,     '+
                              ' :valor,         '+
                              ' :id_plano,      '+
                              ' :id_custo,      '+
                              ' :id_empresa,    '+
                              ' :id_usuario,    '+
                              ' :data_cadastro  '+
                              ');';

  SqlQuerySaldo  := 'SELECT saldo FROM livrocaixa ORDER BY id_livro DESC LIMIT 1;';

  ModelSql       := TModelSQL.Create;
  saldoAnterior  := 0;

  Try
    //buscar ultimo saldo anterior do lançamento

    QryRet       := Modelsql.ConsultarSQL(dm.Conn,SqlQuerySaldo,[]);

    Try
      if not Qryret.IsEmpty then
      begin
        saldoAnterior := QryRet.Fields.FieldByName('saldo').AsFloat;
      end;
    Finally
      QryRet.Free;
    End;

    id    := ModelSql.GerarId(dm.Conn,'livrocaixa','id_livro');
    cod   := ModelSql.GerarId(dm.Conn,'livrocaixa','codigo');

    Try
      nDate   := FormatDateTime('yyyy-mm-dd', DataLan);

      if operacao = 'Entrada' then
      novoSaldo   := saldoAnterior + VlrEntrada // Atualiza saldo para entrada
      else
      novoSaldo   := saldoAnterior - VlrSaida; // Atualiza saldo para saída

      if Modelsql.ExecutarSQL(dm.Conn,sqlQuery, [id, cod, nDate, Operacao, DocNumero, VlrEntrada,
                              VlrSaida, novoSaldo, Historico, Valor, IdPlano, IdCusto, TSession.IDEMPRESA,
                              TSession.ID_USUARIO, Now]) then
      begin
        Result  := True;
        msg     := 'Registro inserido com sucesso!';
      end
      else
        msg     := 'Erro ao inserir os dados!';
    Except on e:exception do
      begin
        msg := 'Erro ao inserir os dados:'+#13+e.Message;
      end;
    End;
  Finally
    Modelsql.Free;
  End;
end;


{$REGION 'Pedido'}

function TModelLivroCaixa.Registrar(out msg: string): Boolean;
var
  sqlQuery,SqlQuerySaldo: string;
  id, cod:Integer;
  nDate:string;
  SaldoAnterior, Novosaldo:Double;
  QryRet  :Tuniquery;
begin
  Result  := False;
  sqlQuery      := 'INSERT INTO livrocaixa (    '+
                              ' id_livro,'+
                              ' codigo,'         +
                              ' datalan,'           +
                              ' operacao,'       +
                              ' doc_numero,'     +
                              ' vlr_entrada,'   +
                              ' vlr_saida,'     +
                              ' saldo,'         +
                              ' historico,'     +
                              ' valor,'         +
                              ' id_plano,'      +
                              ' id_custo,'      +
                              ' id_empresa,'    +
                              ' id_usuario,'    +
                              ' data_cadastro,  '+
                              ' id_pedido       '+
                              ') VALUES (       '+
                              ' :id,'+
                              ' :codigo,        '+
                              ' :data,          '+
                              ' :operacao,      '+
                              ' :doc_numero,    '+
                              ' :vlr_entrada,   '+
                              ' :vlr_saida,     '+
                              ' :saldo,         '+
                              ' :historico,     '+
                              ' :valor,         '+
                              ' :id_plano,      '+
                              ' :id_custo,      '+
                              ' :id_empresa,    '+
                              ' :id_usuario,    '+
                              ' :data_cadastro, '+
                              ' :idpedido       '+
                              ');';

  SqlQuerySaldo  := 'SELECT saldo FROM livrocaixa ORDER BY id_livro DESC LIMIT 1;';

  ModelSql       := TModelSQL.Create;
  saldoAnterior  := 0;

  Try
    //buscar ultimo saldo anterior do lançamento

    QryRet       := Modelsql.ConsultarSQL(dm.Conn,SqlQuerySaldo,[]);

    Try
      if not Qryret.IsEmpty then
      begin
        saldoAnterior := QryRet.Fields.FieldByName('saldo').AsFloat;
      end;
    Finally
      QryRet.Free;
    End;

    id    := ModelSql.GerarId(dm.Conn,'livrocaixa','id_livro');
    cod   := ModelSql.GerarId(dm.Conn,'livrocaixa','codigo');

    Try
      nDate   := FormatDateTime('yyyy-mm-dd', DataLan);

      if operacao = 'Entrada' then
      novoSaldo   := saldoAnterior + VlrEntrada // Atualiza saldo para entrada
      else
      novoSaldo   := saldoAnterior - VlrSaida; // Atualiza saldo para saída

      if Modelsql.ExecutarSQL(dm.Conn,sqlQuery, [id, cod, nDate, Operacao, DocNumero, VlrEntrada,
                              VlrSaida, novoSaldo, Historico, Valor, IdPlano, IdCusto, TSession.IDEMPRESA,
                              TSession.ID_USUARIO, Now,idpedido]) then
      begin
        Result  := True;
        msg     := 'Registro inserido com sucesso!';
      end
      else
        msg     := 'Erro ao inserir os dados!';
    Except on e:exception do
      begin
        msg := 'Erro ao inserir os dados:'+#13+e.Message;
      end;
    End;
  Finally
    Modelsql.Free;
  End;
end;

function TModelLivroCaixa.ExcluirRegistro(out msg: string;idpedido:integer): Boolean;
var
  sqlQuery: string;
begin
  Result  := false;
  sqlQuery      := 'Delete from livrocaixa where id_pedido= :id and id_empresa= :idemp';

  ModelSql      := TModelSQL.Create;
  Try
    Try
      if ModelSql.ExecutarSQL(dm.Conn,sqlQuery, [idpedido, Tsession.IDEMPRESA]) then
      begin
        Result  := True;
        msg     := 'Registro excluido com sucesso!';
      end
      else
        msg     := 'Erro ao excluir os dados!';
    Except on e:exception do
      begin
        msg := 'Erro ao excluir os dados:'+#13+e.Message;
      end;
    End;
  Finally
    Modelsql.Free;
  End;
end;



{$ENDREGION}

end.
