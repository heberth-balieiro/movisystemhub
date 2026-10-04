unit Model.Contas;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient,
  Model.SQLQry;

Type
  TModelContas = Class

  Private
    Fdatasal: tdate;
    Fativo: string;
    Fcorrent: string;
    Fcodigo: integer;
    Fid: integer;
    Fconta: string;
    Fsaldo: double;
    Fagencia: string;

    {datasal
    ativo
    corrent
    codigo
    id
    conta
    saldo
    agencia}

  Public

    Property id     :integer  read  Fid     write Fid;
    Property codigo :integer  read  Fcodigo write Fcodigo;
    Property agencia:string   read  Fagencia  write Fagencia;
    Property conta  :string   read  Fconta  write Fconta;
    Property corrent:string   read  Fcorrent  write Fcorrent;
    Property saldo  :double   read  Fsaldo  write Fsaldo;
    Property datasal:tdate    read  Fdatasal  write Fdatasal;
    Property ativo  :string   read  Fativo  write Fativo;

    Function Novo(out msg:string):Boolean;
    Function Editar(out msg:string):Boolean;
    Function Excluir(out msg:string):Boolean;

    Function Localizar(out msg:string;TabStatus:integer;campo:string):Boolean;
    Function LocalizarID(out msg:string;i:integer):Boolean;

  End;

  var
  Model   :TModelSql;

implementation

{ TModelContas }

uses Vcl.Session,cxDateUtils;

function TModelContas.Editar(out msg: string): Boolean;
var
  sqlQuery: string;
begin
  Result  := false;
  sqlQuery      := 'Update contas set '+
                    ' codigo= :1,'+
                    ' agencia= :2,'+
                    ' conta= :3,'+
                    ' correntista= :4,'+
                    ' ativo= :5'+
                    ' where id_conta= :id and id_empresa= :idemp';

  Model     :=TModelSql.Create;
  Try
    Try
      if Model.ExecutarSQL(DM.Conn,sqlQuery, [codigo,agencia, conta, corrent,ativo,
                                          id, Tsession.IDEMPRESA]) then
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
    Model.Free;
  End;
end;

function TModelContas.Excluir(out msg: string): Boolean;
var
  sqlQuery: string;
begin
  Result  := false;
  sqlQuery      := 'Delete from contas where id_conta= :id and id_empresa= :idemp';

  model     :=TModelsql.Create;
  Try
    Try
      if Model.ExecutarSQL(DM.Conn,sqlQuery, [Id, Tsession.IDEMPRESA]) then
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
    model.Free;
  End;
end;

function TModelContas.Localizar(out msg: string; TabStatus: integer;
                                    campo: string): Boolean;
var
  Qry: TUniQuery;
  sqlQuery, sqlOrdem, sqlstatus, sqlCampo: string;
begin
  Result  := False;

  sqlQuery  := 'Select * from contas '+
                ' where id_conta > 0';
  sqlOrdem  := ' order by conta';

  case TabStatus of
    1: sqlstatus  := ' and ativo=''S'' ';
    2: sqlstatus  := ' and ativo=''N'' ';
  end;

  Model     :=TModelsql.Create;
  Try
    if campo <> '' then
    begin
      sqlCampo  := ' and (codigo like :campo or '+
                        ' conta like :campo or correntista like :campo)';
      Qry := Model.ConsultarSQL(DM.Conn,sqlQuery+Sqlstatus+sqlcampo+sqlordem, ['%'+campo+'%']);

    end
    else
    Qry := Model.ConsultarSQL(DM.Conn,sqlQuery+sqlstatus+sqlordem, []);

    try

      if dm.TabConsContas.Active then
      begin
        dm.TabConsContas.EmptyDataSet;
      end
      else
      begin
        dm.TabConsContas.Open;
        dm.TabConsContas.EmptyDataSet;
      end;

      if not qry.IsEmpty then
      begin
        Result  := True;
        msg     := 'Pesquisa realizada com sucesso!';


        Qry.First;
        dm.TabConsContas.DisableControls;

        while not Qry.Eof do
        begin
          dm.TabConsContas.Append;
          dm.TabConsContasid.AsInteger              := Qry.FieldByName('id_conta').Value;
          dm.TabConsContascodigo.AsInteger          := Qry.FieldByName('codigo').Value;
          dm.TabConsContasagencia.AsString          := Qry.FieldByName('agencia').Value;
          dm.TabConsContasconta.AsString            := Qry.FieldByName('conta').Value;
          dm.TabConsContascorrentista.AsString      := Qry.FieldByName('correntista').Value;
          dm.TabConsContas.Post;
          Qry.Next;
        end;

        dm.TabConsContas.First;
        dm.TabConsContas.EnableControls;
      end
      else
      msg := 'Nenhum registro encontrado!';

    finally
      Qry.Free;
    end;
  Finally
    Model.Free;
  End;
end;

function TModelContas.LocalizarID(out msg: string; i: integer): Boolean;
var
  Qry: TUniQuery;
  sqlQuery, sqlOrdem, sqlstatus, sqlCampo: string;
begin
  Result  := False;

  sqlQuery  := 'Select * from contas where id_conta= :id and id_empresa= :idemp';

  Model     := TModelsql.Create;
  Try
    Qry     := Model.ConsultarSQL(DM.Conn,sqlQuery, [i,TSession.IDEMPRESA]);

    try

      if not qry.IsEmpty then
      begin
        datasal   := Qry.FieldByName('datasaldo').Value;
        ativo     := Qry.FieldByName('ativo').Value;
        corrent   := Qry.FieldByName('correntista').Value;
        codigo    := Qry.FieldByName('codigo').Value;
        id        := Qry.FieldByName('id_conta').Value;
        conta     := Qry.FieldByName('conta').Value;
        saldo     := Qry.FieldByName('saldo').Value;
        agencia   := Qry.FieldByName('agencia').Value;
        Result    := True;
      end;
    finally
      Qry.Free;
    end;
  Finally
    Model.Free;
  End;
end;

function TModelContas.Novo(out msg: string): Boolean;
var
  sqlQuery: string;
  id:Integer;
  ndata1:string;
begin
  Result  := false;
  sqlQuery      := 'Insert into contas( '+
                    'id_conta,'+
                    'codigo,'+
                    'agencia,'+
                    'conta,'+
                    'correntista,'+
                    'saldo,'+
                    'datasaldo,'+
                    'datacriacao,'+
                    'id_empresa,'+
                    'id_usuario,'+
                    'ativo'+
                    ')'+
                    'values(:1,:2,:3,:4,:5,:6,:7,:8,:9,:10,:11)';


  model       := Tmodelsql.Create;
  Try
    id    := Model.GerarId(dm.Conn,'contas','id_conta');

    Try
      if datasal = Nulldate then
      ndata1      := FormatDateTime('yyyy-mm-dd', now)
      else
      ndata1      := FormatDateTime('yyyy-mm-dd',datasal);

      if Model.ExecutarSQL(DM.Conn,sqlQuery, [id, codigo, agencia, conta, corrent, saldo,
                           ndata1, now, Tsession.IDEMPRESA, TSession.ID_USUARIO, ativo]) then
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
    Model.Free;
  End;
end;

end.
