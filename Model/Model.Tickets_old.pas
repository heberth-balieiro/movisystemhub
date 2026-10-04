unit Model.Tickets_old;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient,
  cxDateUtils,System.Variants, ACBRUtil;

Type
  TModelTicket = Class

  Private
    FTransacao  : TUniTransaction;
    Fdatadesconto: TDate;
    Fidticket: Integer;
    Fidempresa: Integer;
    Fdatapagamentoreal: TDate;
    Fidusuarioins: Integer;
    Fanotacoes: string;
    Fidusuarioaut: Integer;
    Fdatapagamento: TDate;
    Fdatacancelamento: TDate;
    Fdataticket: TDate;
    Fidconvenio: Integer;
    Fobscancelamento: string;
    Fsituacao: string;
    Fvalorticket: double;
    Fhoracancelamento: TTime;
    Fidsocio: Integer;
    Fidusuariocan: Integer;
    Fcodigolote: integer;
    function GerarTicketPagParcial(idt, ids, idu: Integer;
      vlr: Double): Boolean;


  Public
    constructor Create;
    destructor Destroy;

    property idticket         : Integer   read Fidticket          write Fidticket;
    property idsocio          : Integer   read Fidsocio           write Fidsocio;
    property idconvenio       : Integer   read Fidconvenio        write Fidconvenio;
    property valorticket      : Double    read Fvalorticket       write Fvalorticket;
    property dataticket       : TDate     read Fdataticket        write Fdataticket;
    property datadesconto     : TDate     read Fdatadesconto      write Fdatadesconto;
    property datapagamento    : TDate     read Fdatapagamento     write Fdatapagamento;
    property idusuarioins     : Integer   read Fidusuarioins      write Fidusuarioins;
    property idusuarioaut     : Integer   read Fidusuarioaut      write Fidusuarioaut;
    property anotacoes        : string    read Fanotacoes         write Fanotacoes;
    property situacao         : string    read Fsituacao          write Fsituacao;
    property datapagamentoreal: TDate     read Fdatapagamentoreal write Fdatapagamentoreal;
    property datacancelamento : TDate     read Fdatacancelamento  write Fdatacancelamento;
    property horacancelamento : TTime     read Fhoracancelamento  write Fhoracancelamento;
    property idusuariocan     : Integer   read Fidusuariocan      write Fidusuariocan;
    property obscancelamento  : string    read Fobscancelamento   write Fobscancelamento;
    property idempresa        : Integer   read Fidempresa         write Fidempresa;
    property codigolote       : integer   read Fcodigolote        write Fcodigolote;

    Function Novo(out retid:integer; qtde:integer):Boolean;
    Function Cancela(id,iduser:integer;s:string):Boolean;
    Function SolicitarCancela(id,iduser:integer;s:string):Boolean;
    Function RegistratBaixa(idt, ids, id_usuario_baixa: integer;
                                    dtbaixa: tdate;
                                    obsbaixa:String;
                                    vlrpago, vlrticket:double;
                                    hora_baixa:TTime
                                    ): Boolean;

    Function Localizar(TabStatus:integer;campo:string;Filtrarpor:integer;data1,data2:Tdate):Boolean;
    Function LocalizarID(i:integer):Boolean;
    Function LocalizarBaixa(Campo:string; Filtrarpor:integer; data1,data2:Tdate):Boolean;

    procedure IniciarTransacao;
    procedure ConfirmarTransacao;
    procedure DesfazerTransacao;

    Function CarregarDadosAssociadoTicket(out vMatricula: integer; out vlimite:Double; out vSecretaria:String; i:integer):Boolean;

    Function ImpressaoTicket(i,idAss:integer):Boolean;

    Function RelatorioTicket(dt1,dt2:TDate;Buscar,Situacao,ordem,associadoid, convenioid, secretariaid, usuarioid:integer):Boolean;
    Function RelatorioTotalizadoTicket(dt1,dt2:TDate;Buscar,Situacao,ordem,associadoid, convenioid, secretariaid, usuarioid:integer):Boolean;

    function GerarCodigo(tab, campo: string): integer;

    Function RetornoSaldoAssociado(out aberto, parcial:Double;i:integer;mesdesconto:TDate):Boolean;

  End;

implementation

{ TModelTicket }

uses UDMRelatorio, UConeSul, System.DateUtils;

function TModelTicket.Cancela(id, iduser: integer; S:string): Boolean;
var
  qry         : TUniquery;
  sqlQuery: string;
begin
  Result      := false;
  sqlQuery := 'UPDATE ticket SET situacao = ''C'', ' +
              'data_cancelamento = CURDATE(), ' +
              'hora_cancelamento = CURTIME(), ' +
              'id_usuario_can = :iduser, ' +
              'obs_cancelamento = motivo ' +
              'WHERE id_ticket = :id';

  qry         := TUniquery.Create(nil);

  Try
    Try
      Qry.Connection    := dm.Conn;
      Qry.Params.Clear;
      Qry.SQL.Text      := sqlQuery;
      IniciarTransacao;

      Qry.Params.ParamByName('iduser').AsInteger  := iduser;
      //Qry.Params.ParamByName('obs').AsString      := s;
      Qry.Params.ParamByName('id').AsInteger      := id;

      Try
        Qry.ExecSQL;
        ConfirmarTransacao;
        result  := true;
      Except on e:exception do
        begin
          DesfazerTransacao;
          raise Exception.Create('Erro ao cancelar ticket: ' + e.Message);
        end;
      end;

    Except on e:exception do
      begin
        DesfazerTransacao;
        raise Exception.Create('Erro ao conectar tabela/dados/query: '+e.message);
      end;
    End;

  Finally
    FreeAndNil(Qry);
  End;
end;

function TModelTicket.SolicitarCancela(id, iduser: integer; s: string): Boolean;
var
  qry         : TUniquery;
  sqlQuery: string;
begin
  Result      := false;
  sqlQuery := 'UPDATE ticket SET situacao = ''S'', ' +
              'data_soli        = CURDATE(), ' +
              'hora_soli        = CURTIME(), ' +
              'id_usuario_soli  = :iduser, ' +
              'motivo           = :obs ' +
              'WHERE id_ticket  = :id';

  qry         := TUniquery.Create(nil);

  Try
    Try
      Qry.Connection    := dm.Conn;
      Qry.Params.Clear;
      Qry.SQL.Text      := sqlQuery;
      IniciarTransacao;

      Qry.Params.ParamByName('iduser').AsInteger  := iduser;
      Qry.Params.ParamByName('obs').AsString      := s;
      Qry.Params.ParamByName('id').AsInteger      := id;

      Try
        Qry.ExecSQL;
        ConfirmarTransacao;
        result  := true;
      Except on e:exception do
        begin
          DesfazerTransacao;
          raise Exception.Create('Erro Qry: ' + e.Message);
        end;
      end;

    Except on e:exception do
      begin
        DesfazerTransacao;
        raise Exception.Create('Erro ao conectar tabela/dados/query: '+e.message);
      end;
    End;

  Finally
    FreeAndNil(Qry);
  End;
end;

function TModelTicket.Localizar(TabStatus: integer; campo:string; Filtrarpor: integer;
  data1, data2: Tdate): Boolean;
var
  qry         : TUniquery;
  sqlQuery, sqlcampo, sqlFiltrarpor, sqlsituacao, sqlorder: string;
begin
  Result      := false;
  sqlQuery    := '';
  sqlcampo    := '';
  sqlFiltrarpor:='';
  sqlsituacao := '';

  sqlQuery    := '  Select                                                '+
                  ' t.id_socio,'+
                  ' t.id_ticket,                                          '+
                  ' t.data_ticket,                                       '+
                  ' t.codigo,                                            '+
                  ' t.data_desconto,                                     '+
                  ' t.data_pagamento,                                    '+
                  ' t.anotacoes,                                         '+
                  ' t.codigolote,'+

                  ' Concat(''Data: '',t.data_soli, CHAR(13,10),  '+
                           '''Hora: '',t.hora_soli, CHAR(13,10),   '+
                           '''Usuário: '',u_sol.nome, CHAR(13,10),          '+
                           '''Motivo: '', t.motivo) as motivosolicitacao,'+

                  ' Concat(''Data: '',t.data_cancelamento, CHAR(13,10),  '+
                           '''Hora: '',t.hora_cancelamento, CHAR(13,10),   '+
                           '''Usuário: '', u_can.nome, CHAR(13,10),          '+
                           '''Motivo: '', t.obs_cancelamento ) as motivocancelamento,'+

                  ' case                                                 '+
                  ' when t.situacao = ''A'' then ''Aberto''             '+
                  ' when t.situacao = ''C'' then ''Cancelado''          '+
                  ' when t.situacao = ''P'' then ''Pago''               '+
                  ' when t.situacao = ''S'' then ''Sol. Cancel.''       '+
                  ' end as situacao,                                      '+
                  ' Coalesce(t.valor_ticket,0) as valor_ticket,           '+
                  ' c.nome as nmconvenio,'+
                  ' Concat(s.nome, '' - '',(s.matricula)) as nmsocio,       '+
                  ' u.nome as usuario,'+
                  ' Coalesce(t.vlrpago,0) as vlrpago                      '+
                  ' from ticket t                                         '+
                  ' inner join convenio c                                 '+
                  ' on t.id_convenio = c.id_convenio                      '+
                  ' inner join socio s                                    '+
                  ' on t.id_socio = s.id_socio                            '+
                  ' inner join usuario u                                  '+
                  ' on t.id_usuario_ins = u.id_usuario                    '+
                  ' left join usuario u_sol                               '+
                  ' on t.id_usuario_soli = u_sol.id_usuario                '+
                  ' left join usuario u_can                               '+
                  ' on t.id_usuario_can = u_can.id_usuario                '+

                  ' where id_ticket > 0                                   ';

  if campo <> '' then
  sqlcampo          := ' and (t.codigo like :filtro or c.nome like :filtro or s.nome like :filtro)';


  case Filtrarpor of
    0:  sqlFiltrarpor := ' and t.data_ticket >=:x and t.data_ticket <=:y';
    1:  sqlFiltrarpor := ' and t.data_desconto >= :x and t.data_desconto <= :y';
    2:  sqlFiltrarpor := ' and t.data_pagamento >= :x and t.data_pagamento <= :y';
  end;

  case TabStatus of
    1: sqlsituacao    := ' and t.situacao=''A''';
    2: sqlsituacao    := ' and t.situacao=''C''';
    3: sqlsituacao    := ' and t.situacao=''P''';
    4: sqlsituacao    := ' and t.situacao=''S''';
  end;

  sqlorder            := ' order by t.data_ticket';

  sqlQuery  := sqlQuery + sqlcampo + sqlFiltrarpor + sqlsituacao + sqlorder;

  qry         := TUniquery.Create(nil);

  Try
    Try
      Qry.Connection    := dm.Conn;
      qry.Params.Clear;
      Qry.SQL.Text      := Sqlquery;

      if campo <> '' then
      Qry.Params.ParamByName('filtro').AsString  := '%'+campo+'%';

      Qry.Params.ParamByName('x').AsDateTime     := data1;
      Qry.Params.ParamByName('y').AsDateTime     := data2;

      Try
        Qry.Open;
        Qry.First;

        if dm.TabConsTicket.Active then
        begin
          dm.TabConsTicket.EmptyDataSet;
        end
        else
        begin
          dm.TabConsTicket.Open;
          if dm.TabConsTicket.RecordCount >0 then
          dm.TabConsTicket.EmptyDataSet;
        end;

        while not qry.Eof do
        begin
          result  := true;
          dm.TabConsTicket.Append;

          dm.TabConsTicketid_ticket.AsInteger       := Qry.FieldByName('id_ticket').AsInteger;
          dm.TabConsTicketdata_ticket.AsDateTime    := Qry.FieldByName('data_ticket').AsDateTime;
          dm.TabConsTicketcodigo.AsInteger          := Qry.FieldByName('codigo').AsInteger;
          dm.TabConsTicketdata_desconto.AsDateTime  := Qry.FieldByName('data_desconto').AsDateTime;
          dm.TabConsTicketdata_pagamento.AsDateTime := Qry.FieldByName('data_pagamento').AsDateTime;
          dm.TabConsTicketanotacoes.AsString        := Qry.FieldByName('anotacoes').AsString;
          dm.TabConsTicketsituacao.AsString         := Qry.FieldByName('situacao').AsString;
          dm.TabConsTicketvalor_ticket.AsFloat      := Qry.FieldByName('valor_ticket').AsFloat;
          dm.TabConsTicketnmconvenio.AsString       := Qry.FieldByName('nmconvenio').AsString;
          dm.TabConsTicketnmsocio.AsString          := Qry.FieldByName('nmsocio').AsString;
          dm.TabConsTicketusuario.AsString          := Qry.FieldByName('usuario').AsString;
          dm.TabConsTicketid_socio.AsInteger        := Qry.FieldByName('id_socio').AsInteger;
          dm.TabConsTicketcodigolote.AsInteger      := Qry.FieldByName('codigolote').AsInteger;
          dm.TabConsTicketmotivo.AsString           := Qry.FieldByName('motivosolicitacao').AsString;
          dm.TabConsTicketobs_cancelamento.AsString := Qry.FieldByName('motivocancelamento').AsString;
          dm.TabConsTicketvlrpago.AsFloat           := Qry.FieldByName('vlrpago').AsFloat;
          dm.TabConsTicket.Post;
          Qry.Next;
        end;
        dm.TabConsTicket.First;
        Qry.Close;

      Except on e:exception do
        begin
          raise Exception.Create('Erro ao consultar ticket: ' + e.Message);
        end;
      end;

    Except on e:exception do
      begin
        raise Exception.Create('Erro ao conectar tabela/dados: '+e.message);
      end;
    End;

  Finally
    FreeAndNil(Qry);
  End;

end;

function TModelTicket.LocalizarID(i: integer): Boolean;
var
  qry         : TUniquery;
  sqlQuery: string;
begin
  Result      := false;
  sqlQuery    := 'Select * from ticket where id_ticket= :id';

  qry         := TUniquery.Create(nil);

  Try
    Try
      Qry.Connection    := dm.Conn;
      Qry.SQL.Text      := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger      := i;

      Try
        Qry.Open;
        if not qry.Eof then
        begin
          result  := true;

          idticket            := Qry.FieldByName('id_ticket').AsInteger;
          idsocio             := Qry.FieldByName('id_socio').AsInteger;
          idconvenio          := Qry.FieldByName('id_convenio').AsInteger;
          valorticket         := Qry.FieldByName('valor_ticket').AsFloat;
          dataticket          := Qry.FieldByName('data_ticket').AsDateTime;
          datadesconto        := Qry.FieldByName('data_desconto').AsDateTime;
          datapagamento       := Qry.FieldByName('data_pagamento').AsDateTime;
          anotacoes           := Qry.FieldByName('anotacoes').AsString;

        end;
        Qry.Close;
      Except on e:exception do
        begin
          raise Exception.Create('Erro ao consultar ticket: ' + e.Message);
        end;
      end;

    Except on e:exception do
      begin
        raise Exception.Create('Erro ao conectar tabela/dados: '+e.message);
      end;
    End;

  Finally
    FreeAndNil(Qry);
  End;
end;

Function TModelTicket.LocalizarBaixa(Campo:string; Filtrarpor:integer; data1,data2:Tdate):Boolean;
var
  qry         : TUniquery;
  sqlQuery, sqlcampo, sqlFiltrarpor, sqlorder: string;
begin
  Result      := false;
  sqlQuery    := '';
  sqlcampo    := '';
  sqlFiltrarpor:='';


  sqlQuery    := '  Select                                                '+
                  ' t.id_socio,'+
                  ' t.id_ticket,                                          '+
                  ' t.data_ticket,                                       '+
                  ' t.codigo,                                            '+
                  ' t.data_desconto,                                     '+
                  ' t.data_pagamento,                                    '+
                  ' t.anotacoes,                                         '+
                  ' t.codigolote,'+

                  ' Coalesce(t.valor_ticket,0) as valor_ticket,           '+
                  ' c.nome as nmconvenio,'+
                  ' Concat(s.nome, '' - '',(s.matricula)) as nmsocio,       '+
                  ' u.nome as usuario'+
                  ' from ticket t                                         '+
                  ' inner join convenio c                                 '+
                  ' on t.id_convenio = c.id_convenio                      '+
                  ' inner join socio s                                    '+
                  ' on t.id_socio = s.id_socio                            '+
                  ' inner join usuario u                                  '+
                  ' on t.id_usuario_ins = u.id_usuario                    '+

                  ' where id_ticket > 0 and t.situacao =''A''                                  ';

  if campo <> '' then
  sqlcampo          := ' and (t.codigo like :filtro or c.nome like :filtro or s.nome like :filtro)';


  case Filtrarpor of
    0:  sqlFiltrarpor := ' and t.data_ticket >=:x and t.data_ticket <=:y';
    1:  sqlFiltrarpor := ' and t.data_desconto >= :x and t.data_desconto <= :y';
    2:  sqlFiltrarpor := ' and t.data_pagamento >= :x and t.data_pagamento <= :y';
  end;

  sqlorder            := ' order by t.data_ticket';

  sqlQuery  := sqlQuery + sqlcampo + sqlFiltrarpor + sqlorder;

  qry         := TUniquery.Create(nil);

  Try
    Try
      Qry.Connection    := dm.Conn;
      qry.Params.Clear;
      Qry.SQL.Text      := Sqlquery;

      if campo <> '' then
      Qry.Params.ParamByName('filtro').AsString  := '%'+campo+'%';

      Qry.Params.ParamByName('x').AsDateTime     := data1;
      Qry.Params.ParamByName('y').AsDateTime     := data2;

      Try
        Qry.Open;
        Qry.First;

        if dm.TabConsTicketBaixa.Active then
        begin
          dm.TabConsTicketBaixa.EmptyDataSet;
        end
        else
        begin
          dm.TabConsTicketBaixa.Open;
          if dm.TabConsTicketBaixa.RecordCount >0 then
          dm.TabConsTicketBaixa.EmptyDataSet;
        end;

        while not qry.Eof do
        begin
          result  := true;
          dm.TabConsTicketBaixa.Append;

          dm.TabConsTicketBaixaid_ticket.AsInteger       := Qry.FieldByName('id_ticket').AsInteger;
          dm.TabConsTicketBaixadata_ticket.AsDateTime    := Qry.FieldByName('data_ticket').AsDateTime;
          dm.TabConsTicketBaixacodigo.AsInteger          := Qry.FieldByName('codigo').AsInteger;
          dm.TabConsTicketBaixadata_desconto.AsDateTime  := Qry.FieldByName('data_desconto').AsDateTime;
          dm.TabConsTicketBaixadata_pagamento.AsDateTime := Qry.FieldByName('data_pagamento').AsDateTime;
          dm.TabConsTicketBaixaanotacoes.AsString        := Qry.FieldByName('anotacoes').AsString;
          dm.TabConsTicketBaixavalor_ticket.AsFloat      := Qry.FieldByName('valor_ticket').AsFloat;
          dm.TabConsTicketBaixanmconvenio.AsString       := Qry.FieldByName('nmconvenio').AsString;
          dm.TabConsTicketBaixanmsocio.AsString          := Qry.FieldByName('nmsocio').AsString;
          dm.TabConsTicketBaixausuario.AsString          := Qry.FieldByName('usuario').AsString;
          dm.TabConsTicketBaixaid_socio.AsInteger        := Qry.FieldByName('id_socio').AsInteger;
          dm.TabConsTicketBaixacodigolote.AsInteger      := Qry.FieldByName('codigolote').AsInteger;
          dm.TabConsTicketBaixaselecao.AsString          := 'False';
          dm.TabConsTicketBaixavlrpago.AsFloat           := Qry.FieldByName('valor_ticket').AsFloat;
          dm.TabConsTicketBaixa.Post;
          Qry.Next;
        end;
        dm.TabConsTicketBaixa.First;
        Qry.Close;

      Except on e:exception do
        begin
          raise Exception.Create('Erro ao consultar ticket: ' + e.Message);
        end;
      end;

    Except on e:exception do
      begin
        raise Exception.Create('Erro ao conectar tabela/dados: '+e.message);
      end;
    End;

  Finally
    FreeAndNil(Qry);
  End;
end;

function TModelTicket.Novo(out retid:integer; qtde:integer): Boolean;
var
  qry         : TUniquery;
  sqlQuery: string;
  i:integer;
begin
  Result      := false;
  sqlQuery    := 'INSERT INTO ticket (                         '+
                                    'id_ticket,                '+
                                    'id_socio,                 '+
                                    'id_convenio,              '+
                                    'valor_ticket,             '+
                                    'data_ticket,              '+
                                    'data_desconto,            '+
                                    'data_pagamento,           '+
                                    'id_usuario_ins,           '+
                                    'anotacoes,                '+
                                    'situacao,                 '+
                                    'id_empresa,                '+
                                    'codigo,                    '+
                                    'codigolote                 '+
                                    ') VALUES (                '+
                                    ':1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :11, :12, :13);';
                                    //'select LAST_INSERT_ID() as id';

  qry         := TUniquery.Create(nil);

  Try
    Try
      Qry.Connection    := dm.Conn;
      Qry.SQL.Text      := sqlQuery;

      IniciarTransacao;
      codigolote        := GerarCodigo('ticket','codigolote');

      for I := 0 to qtde -1 do
      begin
        Qry.Params.ParamByName('1').AsInteger       := 0;
        Qry.Params.ParamByName('2').AsInteger       := idsocio;

        if idconvenio >0 then
        Qry.Params.ParamByName('3').AsInteger       := idconvenio
        else
        Qry.Params.ParamByName('3').Clear;

        Qry.Params.ParamByName('4').AsFloat         := valorticket;

        if dataticket = NullDate then
          Qry.Params.ParamByName('5').Clear
        else
          Qry.Params.ParamByName('5').AsDate          := dataticket;

        if I = 0 then
        begin
          if datadesconto = NullDate then
          Qry.Params.ParamByName('6').Clear
          else
          Qry.Params.ParamByName('6').AsDate          := datadesconto;

          if datapagamento = NullDate then
          Qry.Params.ParamByName('7').Clear
          else
          Qry.Params.ParamByName('7').AsDate          := datapagamento;

        end
        else
        begin
          if datadesconto = NullDate then
          Qry.Params.ParamByName('6').Clear
          else
          begin
            datadesconto                := EndOfTheMonth(IncMonth(datadesconto, 1));
            Qry.Params.ParamByName('6').AsDate          := datadesconto;
          end;

          if datapagamento = NullDate then
          Qry.Params.ParamByName('7').Clear
          else
          begin
            datapagamento                := EncodeDate(YearOf(IncMonth(datapagamento, 1)),
                                            MonthOf(IncMonth(datapagamento, 1)),
                                            5);
            Qry.Params.ParamByName('7').AsDate          := datapagamento;
          end;

        end;

        Qry.Params.ParamByName('8').AsInteger       := idusuarioins;
        Qry.Params.ParamByName('9').AsString        := anotacoes;
        Qry.Params.ParamByName('10').AsString       := situacao;
        Qry.Params.ParamByName('11').AsInteger      := idempresa;
        Qry.Params.ParamByName('12').AsInteger      := GerarCodigo('ticket','codigo');
        Qry.Params.ParamByName('13').AsInteger      := codigolote;
        Qry.ExecSQL;

      end;

      Try
        ConfirmarTransacao;
        result  := true;
        retid   := codigolote;//qry.FieldByName('id').AsInteger;
      Except on e:exception do
        begin
          DesfazerTransacao;
          raise Exception.Create('Erro ao inserir ticket: ' + e.Message);
        end;
      end;

    Except on e:exception do
      begin
        DesfazerTransacao;
        raise Exception.Create('Erro ao conectar tabela/dados: '+e.message);
      end;
    End;

  Finally
    FreeAndNil(Qry);
  End;
end;

Function TModelTicket.CarregarDadosAssociadoTicket(out vMatricula: integer; out vlimite:Double; out vSecretaria:String; i:integer):Boolean;
var
  qry         : TUniquery;
  sqlQuery: string;
begin
  Result      := false;
  sqlQuery    := 'Select                                                 '+
                  ' s.matricula, Coalesce(s.limite,0) limite,            '+
                  ' concat(sc.razao,'' / '',sl.descricao) as secretaria  '+
                  ' from socio s                                         '+
                  ' inner join secretaria sc                             '+
                  ' on s.escritorio = sc.id_secretaria                   '+
                  ' inner join sindicato_lotacao sl                      '+
                  '  on s.id_lotacao = sl.id_lotacao                     '+
                  ' where s.id_socio= :id';

  qry         := TUniquery.Create(nil);

  Try
    Try
      Qry.Connection    := dm.Conn;
      Qry.SQL.Text      := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger        := i;
      Try
        Qry.open;

        if not Qry.Eof then
        begin
          vMatricula      := qry.FieldByName('matricula').AsInteger;
          vlimite         := qry.FieldByName('limite').AsFloat;
          vSecretaria     := Qry.FieldByName('secretaria').AsString;
          result  := true;
        end
        else
        begin
          vMatricula      := 0;
          vlimite         := 0;
          vSecretaria     := '';
        end;

        Qry.Close;
      Except on e:exception do
        begin
          raise Exception.Create('Erro ao buscar limite associado: ' + e.Message);
        end;
      end;

    Except on e:exception do
      begin
        raise Exception.Create('Erro ao conectar tabela/dados: '+e.message);
      end;
    End;

  Finally
    FreeAndNil(Qry);
  End;
end;

function TModelTicket.GerarCodigo(tab, campo: string): integer;
var
Qry       : TUniquery;
sqlQuery  : string;
begin
  Result  := 0;
  Qry     := TUniquery.create(nil);
  Try
    Try
      Qry.Connection := Dm.Conn;
      sqlQuery := 'SELECT MAX(' + campo + ') AS id FROM ' + tab;

      With Qry do
      begin
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

function TModelTicket.RegistratBaixa(idt, ids, id_usuario_baixa: integer;
                                    dtbaixa: tdate;
                                    obsbaixa:String;
                                    vlrpago, vlrticket:double;
                                    hora_baixa:TTime
                                    ): Boolean;
var
  qry         : TUniquery;
  sqlQuery    : string;
  ntipo, idret: Integer;
  nvlrrest    : double;
begin
  Result      := false;

  sqlQuery := 'UPDATE ticket SET situacao=  ''P'',                      ' +
              'data_pagamento_real=         :dt,                      ' +
              'obs_baixa=                   :obs,                     ' +
              'vlrpago=                     :vlr,                     ' +
              'hora_baixa=                  :hora,                    ' +
              'id_usuario_baixa=            :iduser,                  ' +
              'tipo=                        :tipo                     ' +
              'WHERE id_ticket= :id and id_socio= :idsocio';

  if vlrpago < vlrticket then
  ntipo   := 1 // Parcial
  else
  ntipo   := 0;//Total

  nvlrrest  := vlrticket - vlrpago;


  qry         := TUniquery.Create(nil);

  Try
    Try
      Qry.Connection    := dm.Conn;
      Qry.Params.Clear;
      Qry.SQL.Text      := sqlQuery;
      IniciarTransacao;

      Qry.Params.ParamByName('id').AsInteger        := idt;
      Qry.Params.ParamByName('dt').AsDateTime       := dtbaixa;
      Qry.Params.ParamByName('idsocio').AsInteger   := ids;
      Qry.Params.ParamByName('obs').AsString        := Trim(obsbaixa);
      Qry.Params.ParamByName('vlr').AsFloat         := vlrpago;
      Qry.Params.ParamByName('hora').AsDateTime     := hora_baixa;
      Qry.Params.ParamByName('iduser').AsInteger    := id_usuario_baixa;

      case ntipo of
        0:Qry.Params.ParamByName('tipo').AsString       := 'T';
        1:Qry.Params.ParamByName('tipo').AsString       := 'P';
      end;


      Try
        Qry.ExecSQL;

        //Verificar para gerar o restante do valor que ficou
        case ntipo of
        0:ConfirmarTransacao;
        1:begin
            //Clonar ticket
            if GerarTicketPagParcial(idt, ids, id_usuario_baixa, nvlrrest) then
            ConfirmarTransacao;
          end;
        end;

        result  := true;
      Except on e:exception do
        begin
          DesfazerTransacao;
          raise Exception.Create('Erro Qry: ' + e.Message);
        end;
      end;

    Except on e:exception do
      begin
        DesfazerTransacao;
        raise Exception.Create('Erro ao conectar tabela/dados/query: '+e.message);
      end;
    End;

  Finally
    FreeAndNil(Qry);
  End;
end;

Function TModelTicket.GerarTicketPagParcial(idt, ids, idu:Integer; vlr:Double):Boolean;
var
QryBusca, QryInsert: TUniquery;
QryBuscaSTR, QryInsertSTR :String;
begin
  Result      := False;
  QryBuscaSTR := 'Select * from ticket where id_ticket= :idticket and id_socio= :idsocio';
  QryInsertSTR:= 'INSERT INTO ticket (                         '+
                                    'id_ticket,                '+
                                    'id_socio,                 '+
                                    'id_convenio,              '+
                                    'valor_ticket,             '+
                                    'data_ticket,              '+
                                    'data_desconto,            '+
                                    'data_pagamento,           '+
                                    'id_usuario_ins,           '+
                                    'anotacoes,                '+
                                    'situacao,                 '+
                                    'id_empresa,                '+
                                    'codigo,                    '+
                                    'codigolote,                 '+
                                    'id_ticketpai              '+
                                    ') VALUES (                '+
                                    ':1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :11, :12, :13, :14);';

  QryBusca    := TUniquery.Create(nil);
  QryInsert   := TUniquery.Create(nil);

  Try
    Try
      //Primeiro buscar o ticket
      QryBusca.Connection   := dm.Conn;
      QryBusca.Params.Clear;
      QryBusca.SQL.Text     := QryBuscaSTR;
      QryBusca.Params.ParamByName('idticket').AsInteger       := idt;
      QryBusca.Params.ParamByName('idsocio').AsInteger        := ids;
      QryBusca.Open;

      if not QryBusca.IsEmpty then
      begin
        //Inserir os novos dados
        QryInsert.Connection    := dm.Conn;
        QryInsert.Params.Clear;
        QryInsert.SQL.Text      := QryInsertSTR;

        IniciarTransacao;
        codigolote        := GerarCodigo('ticket','codigolote');

        QryInsert.Params.ParamByName('1').AsInteger       := 0;
        QryInsert.Params.ParamByName('2').AsInteger       := ids;
        QryInsert.Params.ParamByName('3').AsInteger       := Qrybusca.FieldByName('id_convenio').AsInteger;
        QryInsert.Params.ParamByName('4').AsFloat         := vlr;
        QryInsert.Params.ParamByName('5').AsDate          := date();
        QryInsert.Params.ParamByName('6').AsDate          := Qrybusca.FieldByName('data_desconto').AsDateTime;
        QryInsert.Params.ParamByName('7').AsDate          := Qrybusca.FieldByName('data_pagamento').AsDateTime;
        QryInsert.Params.ParamByName('8').AsInteger       := idu;
        QryInsert.Params.ParamByName('9').AsString        := 'Ref. a baixa parcial do ticket: '+Inttostr(QryBusca.FieldByName('codigo').AsInteger);
        QryInsert.Params.ParamByName('10').AsString       := 'A';
        QryInsert.Params.ParamByName('11').AsInteger      := QryBusca.FieldByName('id_empresa').AsInteger;
        QryInsert.Params.ParamByName('12').AsInteger      := GerarCodigo('ticket','codigo');
        QryInsert.Params.ParamByName('13').AsInteger      := codigolote;
        QryInsert.Params.ParamByName('14').AsInteger      := idt;


        Try
          QryInsert.ExecSQL;
          ConfirmarTransacao;
          result  := true;
        Except on e:exception do
          begin
            DesfazerTransacao;
            raise Exception.Create('Erro ao inserir ticket: ' + e.Message);
          end;
        end;

      end;

      QryBusca.Close;

    Except on e:exception do
      begin
        DesfazerTransacao;
        raise Exception.Create('Erro ao conectar tabela/dados: '+e.message);
      end;
    End;

  Finally
    FreeAndNil(QryBusca);
    FreeAndNil(QryInsert);
  End;

end;

{$REGION 'Impressão'}

Function TModelTicket.ImpressaoTicket(i,idAss:integer):Boolean;
var
  qry         : TUniquery;
  sqlQuery    : string;
  sqlparams   : String;
begin
  Result      := false;
  sqlQuery    := '';
  sqlQuery    := 'Select                                          '+
                  ' t.id_ticket,                                  '+
                  ' t.data_ticket,                                '+
                  ' t.codigo as codticket,                        '+
                  ' t.data_desconto,                              '+
                  ' t.data_pagamento,                             '+
                  ' Coalesce(t.valor_ticket,0) as valor_ticket,   '+
                  ' s.nome as nmassociado,                        '+
                  ' s.matricula,                                  '+
                  ' s.codigo as codassociado,                     '+
                  ' c.nome as nmconvenio,                         '+
                  ' sc.razao as nmsecretaria,                     '+
                  ' u.nome as nmusuario                           '+
                  ' from ticket t                                 '+
                  ' inner join convenio c                         '+
                  ' on t.id_convenio = c.id_convenio              '+
                  ' inner join socio s                            '+
                  ' on t.id_socio = s.id_socio                    '+
                  ' inner join secretaria sc                      '+
                  ' on s.escritorio = sc.id_secretaria            '+
                  ' inner join usuario u                          '+
                  ' on t.id_usuario_ins = u.id_usuario';
                  //' where t.codigolote= :cod and t.id_socio= :idass ';

  if idass = 0 then
  sqlparams       := ' where t.id_ticket= :cod'
  else
  sqlparams       := ' where t.codigolote= :cod and t.id_socio= :idass';


  qry         := TUniquery.Create(nil);

  Try
    Try
      Qry.Connection    := dm.Conn;
      qry.Params.Clear;
      Qry.SQL.Text      := Sqlquery + sqlparams;

      Qry.Params.ParamByName('cod').AsInteger      := i;
      if idass > 0 then      
      Qry.Params.ParamByName('idass').AsInteger    := idAss;

      Try
        Qry.Open;
        Qry.First;

        if dmRelatorio.RelImpressaoTicket.Active then
        begin
          dmRelatorio.RelImpressaoTicket.EmptyDataSet;
        end
        else
        begin
          dmRelatorio.RelImpressaoTicket.Open;
          if dmRelatorio.RelImpressaoTicket.RecordCount >0 then
          dmRelatorio.RelImpressaoTicket.EmptyDataSet;
        end;

        while not qry.Eof do
        begin
          result  := true;
          dmRelatorio.RelImpressaoTicket.Append;

          dmRelatorio.RelImpressaoTicketid_ticket.asinteger	  := Qry.FieldByName('id_ticket').AsInteger;
          dmRelatorio.RelImpressaoTicketvalor.asfloat         := Qry.FieldByName('valor_ticket').AsFloat;
          dmRelatorio.RelImpressaoTicketvalor_real.asstring   := TConeSul.valorPorExtenso(Qry.FieldByName('valor_ticket').AsFloat);
          dmRelatorio.RelImpressaoTicketcodigointerno.asinteger := Qry.FieldByName('codassociado').AsInteger;
          dmRelatorio.RelImpressaoTicketmatricula.asinteger   := Qry.FieldByName('matricula').AsInteger;
          dmRelatorio.RelImpressaoTicketsecretaria.asstring   := Qry.FieldByName('nmsecretaria').AsString;
          dmRelatorio.RelImpressaoTicketdataemissao.asdatetime:= Qry.FieldByName('data_ticket').AsDateTime;

          dmRelatorio.RelImpressaoTicketmesdesconto.asstring  := TConeSul.MesAnoFormatado(Qry.FieldByName('data_desconto').AsDateTime);
          dmRelatorio.RelImpressaoTicketmespagamento.asstring := TConeSul.MesAnoFormatado(Qry.FieldByName('data_pagamento').AsDateTime);

          dmRelatorio.RelImpressaoTicketfornecedor.asstring   := Qry.FieldByName('nmconvenio').AsString;
          dmRelatorio.RelImpressaoTicketcodigo_ticket.asinteger	:= Qry.FieldByName('codticket').AsInteger;
          dmRelatorio.RelImpressaoTicketassociado.asstring    := Qry.FieldByName('nmassociado').AsString;

          dmRelatorio.RelImpressaoTicketnmusuario.asstring    := Qry.FieldByName('nmusuario').AsString;

          dmRelatorio.RelImpressaoTicket.Post;
          Qry.Next;
        end;

        Qry.Close;

      Except on e:exception do
        begin
          raise Exception.Create('Erro ao carregar ticket: ' + e.Message);
        end;
      end;

    Except on e:exception do
      begin
        raise Exception.Create('Erro ao conectar tabela/dados: '+e.message);
      end;
    End;

  Finally
    FreeAndNil(Qry);
  End;
end;


{$ENDREGION}


{$REGION 'Relatorio'}



Function TModelTicket.RelatorioTicket(dt1,dt2:TDate;Buscar,Situacao,ordem,associadoid, convenioid, secretariaid, usuarioid:integer):Boolean;
var
  qry         : TUniquery;
  sqlQuery, sqlcampo, sqlFiltrarpor, sqlsituacao, sqlorder: string;
begin
  Result      := false;
  sqlQuery    := '';
  sqlcampo    := '';
  sqlFiltrarpor:='';
  sqlsituacao := '';

  sqlQuery    := '   Select                                      '+
                 '   t.id_ticket,                                '+
                 '   t.data_ticket as dtemissao,                 '+
                 '   t.codigo as numeroticket,                   '+
                 '   t.data_desconto as dtdesconto,              '+
                 '   t.data_pagamento as dtpagamento,            '+
                 '   Coalesce(t.valor_ticket,0) as vlrticket,    '+
                 '   case                                        '+
                 '   when t.situacao = ''A'' then ''Aberto''     '+
                 '   when t.situacao = ''C'' then ''Cancelado''  '+
                 '   when t.situacao = ''P'' then ''Pago''       '+
                 '   end as situacao,                            '+
                 '   t.anotacoes as obs,                         '+
                 '   s.nome as assnome,                          '+
                 '   s.matricula as assmatricula,               '+
                 '   s.codigo as asscodigo,                      '+
                 '   c.nome as connome,                          '+
                 '   sc.razao as secnome                         '+
                 '   from ticket t                               '+
                 '   inner join convenio c                       '+
                 '   on t.id_convenio = c.id_convenio            '+
                 '   inner join socio s                          '+
                 '   on t.id_socio = s.id_socio                  '+
                 '   inner join secretaria sc                    '+
                 '   on s.escritorio = sc.id_secretaria          '+
                 '   where t.id_ticket > 0                       ';

  if associadoid > 0 then
    sqlQuery          := sqlQuery + ' and t.id_socio= :idsocio';

  if convenioid > 0 then
    sqlQuery          := sqlQuery + ' and t.id_convenio= :idconvenio';

  if secretariaid > 0 then
    sqlQuery          := sqlQuery + ' and sc.id_secretaria= :idsecretaria';

  if usuarioid > 0 then
    sqlQuery          := sqlQuery + ' and t.id_usuario_ins= :idusuario';


  case Buscar of
    0:  sqlFiltrarpor := ' and t.data_ticket >=:x and t.data_ticket <=:y';
    1:  sqlFiltrarpor := ' and t.data_desconto >= :x and t.data_desconto <= :y';
    2:  sqlFiltrarpor := ' and t.data_pagamento >= :x and t.data_pagamento <= :y';
    3:  sqlFiltrarpor := ' and t.data_cancelamento >= :x and t.data_cancelamento <= :y';
    4:  sqlFiltrarpor := ' and t.data_pagamento_real >= :x and t.data_pagamento_real <= :y';
  end;

  case Situacao of
    1: sqlsituacao    := ' and t.situacao=''A''';
    2: sqlsituacao    := ' and t.situacao=''C''';
    3: sqlsituacao    := ' and t.situacao=''P''';
  end;

  case ordem of
    0:  sqlorder      := ' order by s.nome';
    1:  sqlorder      := ' order by s.matricula';
    2:  sqlorder      := ' order by t.codigo';
    3:  sqlorder      := ' order by sc.razao';
    4:  sqlorder      := ' order by t.valor_ticket';
    5:  sqlorder      := ' order by t.data_ticket';
    6:  sqlorder      := ' order by t.data_desconto';
    7:  sqlorder      := ' order by t.data_pagamento';
    8:  sqlorder      := ' order by c.nome';
  end;


  sqlQuery  := sqlQuery + sqlFiltrarpor + sqlsituacao + sqlorder;

  qry         := TUniquery.Create(nil);

  Try
    Try
      Qry.Connection    := dm.Conn;
      qry.Params.Clear;
      Qry.SQL.Text      := Sqlquery;

      Qry.Params.ParamByName('x').AsDateTime     := dt1;
      Qry.Params.ParamByName('y').AsDateTime     := dt2;

      Try
        Qry.Open;
        Qry.First;

        if dmRelatorio.RelTicket.Active then
        begin
          dmRelatorio.RelTicket.EmptyDataSet;
        end
        else
        begin
          dmRelatorio.RelTicket.Open;
          if dmRelatorio.RelTicket.RecordCount >0 then
          dmRelatorio.RelTicket.EmptyDataSet;
        end;

        while not qry.Eof do
        begin
          result  := true;

          DMRelatorio.RelTicket.append;
          dmRelatorio.RelTicketid_ticket.asinteger        :=  Qry.FieldByName('id_ticket').AsInteger;
          dmRelatorio.RelTicketdtemissao.asdatetime       :=  Qry.FieldByName('dtemissao').AsDateTime;
          dmRelatorio.RelTicketnumeroticket.asinteger     :=  Qry.FieldByName('numeroticket').AsInteger;
          dmRelatorio.RelTicketdtdesconto.asdatetime      :=  Qry.FieldByName('dtdesconto').AsDateTime;
          dmRelatorio.RelTicketdtpagamento.asdatetime     :=  Qry.FieldByName('dtpagamento').AsDateTime;
          dmRelatorio.RelTicketvlrticket.asfloat          :=  Qry.FieldByName('vlrticket').AsFloat;
          dmRelatorio.RelTicketsituacao.asstring          :=  Qry.FieldByName('situacao').AsString;
          dmRelatorio.RelTicketobs.asstring               :=  Qry.FieldByName('obs').AsString;
          dmRelatorio.RelTicketassnome.asstring           :=  Qry.FieldByName('assnome').AsString;
          dmRelatorio.RelTicketassmatricula.asinteger     :=  Qry.FieldByName('assmatricula').AsInteger;
          dmRelatorio.RelTicketasscodigo.asinteger        :=  Qry.FieldByName('asscodigo').AsInteger;
          dmRelatorio.RelTicketconnome.asstring           :=  Qry.FieldByName('connome').AsString;
          dmRelatorio.RelTicketsecnome.asstring           :=  Qry.FieldByName('secnome').AsString;

          dmRelatorio.RelTicket.post;
          Qry.Next;
        end;
        dmRelatorio.RelTicket.First;
        Qry.Close;

      Except on e:exception do
        begin
          raise Exception.Create('Erro Qry Relatório: ' + e.Message);
        end;
      end;

    Except on e:exception do
      begin
        raise Exception.Create('Erro ao conectar tabela/dados: '+e.message);
      end;
    End;

  Finally
    FreeAndNil(Qry);
  End;
end;

Function TModelTicket.RelatorioTotalizadoTicket(dt1,dt2:TDate;Buscar,Situacao,ordem,associadoid, convenioid, secretariaid, usuarioid:integer):Boolean;
var
  qry         : TUniquery;
  sqlQuery, sqlcampo, sqlFiltrarpor, sqlsituacao, sqlorder: string;
begin
  Result      := false;
  sqlQuery    := '';
  sqlcampo    := '';
  sqlFiltrarpor:='';
  sqlsituacao := '';

  sqlQuery    := 'SELECT                                               '+
                 ' s.codigo AS asscodigo,                              '+
                 ' s.matricula AS assmatricula,                        '+
                 ' s.nome AS assnome,                                  '+
                 ' sc.razao AS secnome,                                '+
                 ' SUM(COALESCE(t.valor_ticket, 0)) AS vlrticket       '+
                 ' FROM ticket t                                       '+
                 ' INNER JOIN socio s                                  '+
                 ' ON t.id_socio = s.id_socio                          '+
                 ' INNER JOIN secretaria sc                            '+
                 ' ON s.escritorio = sc.id_secretaria                  '+
                 ' WHERE t.id_ticket > 0                               ';

  if associadoid > 0 then
    sqlQuery          := sqlQuery + ' and t.id_socio= :idsocio';

  if convenioid > 0 then
    sqlQuery          := sqlQuery + ' and t.id_convenio= :idconvenio';

  if secretariaid > 0 then
    sqlQuery          := sqlQuery + ' and sc.id_secretaria= :idsecretaria';


  case Buscar of
    0:  sqlFiltrarpor := ' and t.data_ticket >=:x and t.data_ticket <=:y';
    1:  sqlFiltrarpor := ' and t.data_desconto >= :x and t.data_desconto <= :y';
    2:  sqlFiltrarpor := ' and t.data_pagamento >= :x and t.data_pagamento <= :y';
    3:  sqlFiltrarpor := ' and t.data_cancelamento >= :x and t.data_cancelamento <= :y';
    4:  sqlFiltrarpor := ' and t.data_pagamento_real >= :x and t.data_pagamento_real <= :y';
  end;

  case Situacao of
    1: sqlsituacao    := ' and t.situacao=''A''';
    2: sqlsituacao    := ' and t.situacao=''C''';
    3: sqlsituacao    := ' and t.situacao=''P''';
  end;

  sqlorder            := ' GROUP BY s.codigo, s.matricula, s.nome, sc.razao ORDER BY sc.razao, s.nome; ';


  sqlQuery  := sqlQuery + sqlFiltrarpor + sqlsituacao + sqlorder;

  qry         := TUniquery.Create(nil);

  Try
    Try
      Qry.Connection    := dm.Conn;
      qry.Params.Clear;
      Qry.SQL.Text      := Sqlquery;

      Qry.Params.ParamByName('x').AsDateTime     := dt1;
      Qry.Params.ParamByName('y').AsDateTime     := dt2;

      Try
        Qry.Open;
        Qry.First;

        if dmRelatorio.RelTicketTotalizado.Active then
        begin
          dmRelatorio.RelTicketTotalizado.EmptyDataSet;
        end
        else
        begin
          dmRelatorio.RelTicketTotalizado.Open;
          if dmRelatorio.RelTicketTotalizado.RecordCount >0 then
          dmRelatorio.RelTicketTotalizado.EmptyDataSet;
        end;

        while not qry.Eof do
        begin
          result  := true;

          DMRelatorio.RelTicketTotalizado.append;

          dmRelatorio.RelTicketTotalizadoasscodigo.asinteger        :=  Qry.FieldByName('asscodigo').AsInteger;
          dmRelatorio.RelTicketTotalizadoassmatricula.asinteger     :=  Qry.FieldByName('assmatricula').AsInteger;
          dmRelatorio.RelTicketTotalizadoassnome.asstring           :=  Qry.FieldByName('assnome').AsString;
          dmRelatorio.RelTicketTotalizadosecnome.asstring           :=  Qry.FieldByName('secnome').AsString;
          dmRelatorio.RelTicketTotalizadototal.asfloat              :=  Qry.FieldByName('vlrticket').AsFloat;

          dmRelatorio.RelTicketTotalizado.post;
          Qry.Next;
        end;
        dmRelatorio.RelTicketTotalizado.First;
        Qry.Close;

      Except on e:exception do
        begin
          raise Exception.Create('Erro Qry Relatório: ' + e.Message);
        end;
      end;

    Except on e:exception do
      begin
        raise Exception.Create('Erro ao conectar tabela/dados: '+e.message);
      end;
    End;

  Finally
    FreeAndNil(Qry);
  End;
end;


function TModelTicket.RetornoSaldoAssociado(out aberto, parcial: Double;
  i: integer; mesdesconto: TDate): Boolean;
var
  qry         : TUniquery;
  sqlQuery: string;
begin
  Result      := false;
  sqlQuery    := 'Select                         '+
                 ' sum(Coalesce(valor_ticket,0)) as vlr      '+
                 ' from ticket                   '+
                 ' where situacao=''A''            '+
                 ' and id_socio= :idsocio             '+
                 ' and data_desconto >=:x and data_desconto <=:y';

  qry         := TUniquery.Create(nil);

  Try
    Try
      Qry.Connection    := dm.Conn;
      Qry.SQL.Text      := sqlQuery;
      Qry.Params.ParamByName('idsocio').AsInteger        := i;
      Qry.Params.ParamByName('x').AsDateTime             := StartOfTheMonth(mesdesconto);
      Qry.Params.ParamByName('y').AsDateTime             := mesdesconto;

      Try
        Qry.open;

        if not Qry.Eof then
        begin
          aberto    := Qry.FieldByName('vlr').AsFloat;
          parcial   := 0;
          result    := true;
        end
        else
        begin
          aberto    := 0;
          parcial   := 0;
        end;

        Qry.Close;
      Except on e:exception do
        begin
          raise Exception.Create('Erro ao buscar valores associado: ' + e.Message);
        end;
      end;

    Except on e:exception do
      begin
        raise Exception.Create('Erro ao conectar tabela/dados: '+e.message);
      end;
    End;

  Finally
    FreeAndNil(Qry);
  End;
end;

{$ENDREGION}




{$Region 'Transação'}

procedure TModelTicket.IniciarTransacao;
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

procedure TModelTicket.ConfirmarTransacao;
begin
  try
    if Assigned(FTransacao) and FTransacao.Active then
      FTransacao.Commit;
  except
    on E: Exception do
      raise Exception.Create('Erro ao confirmar transação: ' + E.Message);
  end;
end;

procedure TModelTicket.DesfazerTransacao;
begin
  try
    if Assigned(FTransacao) and FTransacao.Active then
      FTransacao.Rollback;
  except
    on E: Exception do
      raise Exception.Create('Erro ao desfazer transação: ' + E.Message);
  end;
end;

constructor TModelTicket.Create;
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

destructor TModelTicket.Destroy;
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

{$ENDREGIOn}

end.
