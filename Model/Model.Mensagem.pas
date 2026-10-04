unit Model.Mensagem;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient,
  Model.SQLQry;

Type
  TModelMensagem = Class

  Private
    Fassuntoemail: String;
    Fativo: string;
    Fidmensagem: Integer;
    Fdescricao: String;
    Fcodigo: integer;
    Fmensagem: String;
    Fuso: String;


  Public

    Property idmensagem   : Integer read Fidmensagem      write Fidmensagem;
    Property codigo       : integer read Fcodigo          write Fcodigo;
    Property descricao    : String  read Fdescricao       write Fdescricao;
    Property ativo        : string  read Fativo           write Fativo;
    Property uso          : String  read Fuso             write Fuso;
    Property assuntoemail : String  read Fassuntoemail    write Fassuntoemail;
    Property mensagem     : String  read Fmensagem        write Fmensagem;

    Function Novo(out msg:string):Boolean;
    Function Editar(out msg:string):Boolean;
    Function Excluir(out msg:string):Boolean;

    Function Localizar(out msg:string;TabStatus:integer;campo:string):Boolean;
    Function LocalizarID(out msg:string;i:integer):Boolean;


    Function GravarMensagemMassa(mensage,url,pessoa,fone,ext,anexo,tipo, tokenzap:String;
                                 idpessoa:integer
                                ):Boolean;

  End;

  var
  ModelSql   :TModelSql;

implementation

{ TModelMensagem }

function TModelMensagem.Editar(out msg: string): Boolean;
var
  sqlQuery: string;
begin
  Result  := false;
  sqlQuery      := 'UPDATE mensagem          '+
                    'SET                     '+
                    '  descricao = :1,       '+
                    '  ativo = :2,           '+
                    '  uso = :3,             '+
                    '  assunto_email = :4,   '+
                    '  mensagem = :5         '+
                    '  WHERE                 '+
                    '  id_mensagem = :id     ';

  ModelSql    := TModelSQL.Create;

  Try
    Try
      if ModelSql.ExecutarSQL(dm.Conn,sqlQuery, [descricao, ativo, uso, assuntoemail, mensagem, idmensagem]) then
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
    ModelSql.Free;
  End;

end;

function TModelMensagem.Excluir(out msg: string): Boolean;
var
  sqlQuery: string;
begin
  Result        := false;
  sqlQuery      := 'Delete from mensagem where id_mensagem= :id';

  ModelSql      := TModelSQL.Create;
  Try
    Try
      if Modelsql.ExecutarSQL(dm.Conn,sqlQuery, [idmensagem]) then
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
    ModelSql.Free;
  End;
end;

function TModelMensagem.Localizar(out msg: string; TabStatus: integer;
                                  campo: string): Boolean;
var
  Qry: TUniQuery;
  sqlQuery, sqlOrdem, sqlstatus, sqlCampo: string;
begin
  Result  := False;

  sqlQuery  := 'Select * from mensagem where id_mensagem >0';

  sqlOrdem  := ' order by descricao';

  case TabStatus of
    1: sqlstatus  := ' and ativo=''S'' ';
    2: sqlstatus  := ' and ativo=''N'' ';
  end;

  ModelSql     := TModelsql.Create;

  Try
    if campo <> '' then
    begin
      sqlCampo  := ' and (codigo like :campo or '+
                        ' descricao like :campo)';
      Qry := ModelSql.ConsultarSQL(dm.Conn,sqlQuery+Sqlstatus+sqlcampo+sqlordem, ['%'+campo+'%']);

    end
    else
    Qry := ModelSql.ConsultarSQL(dm.Conn,sqlQuery+sqlstatus+sqlordem, []);

    try

      if dm.TabConsMensagem.Active then //se estiver ativo limpar tabelas
        begin
          dm.TabConsMensagem.EmptyDataSet;
        end
        else
        begin
          dm.TabConsMensagem.Open;
          dm.TabConsMensagem.EmptyDataSet;
        end;

      if not qry.IsEmpty then
      begin
        Result  := True;
        msg     := 'Pesquisa realizada com sucesso!';

        Qry.First;
        dm.TabConsMensagem.DisableControls;

        while not Qry.Eof do
        begin
          dm.TabConsMensagem.Append;
          dm.TabConsMensagemid_mensagem.AsInteger   := Qry.FieldByName('id_mensagem').AsInteger;
          dm.TabConsMensagemcodigo.AsInteger        := Qry.FieldByName('codigo').AsInteger;
          dm.TabConsMensagemdescricao.AsString      := Qry.FieldByName('descricao').AsString;
          dm.TabConsMensagemativo.AsString          := Qry.FieldByName('ativo').AsString;
          dm.TabConsMensagemuso.AsString            := Qry.FieldByName('uso').AsString;
          dm.TabConsMensagemassunto_email.AsString  := Qry.FieldByName('assunto_email').AsString;
          dm.TabConsMensagemmensagem.AsString       := Qry.FieldByName('mensagem').AsString;
          dm.TabConsMensagem.Post;
          Qry.Next;
        end;

        dm.TabConsMensagem.First;
        dm.TabConsMensagem.EnableControls;
      end
      else
      msg := 'Nenhum registro encontrado!';

    finally
      Qry.Free;
    end;
  Finally
    ModelSql.Free;
  End;
end;

function TModelMensagem.LocalizarID(out msg: string; i: integer): Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result    := False;
  sqlQuery  := 'Select * from mensagem where id_mensagem= :id';

  ModelSql  := TModelsql.Create;
  Try
    Qry     := modelSql.ConsultarSQL(dm.Conn,sqlQuery, [i]);

    try
      if not Qry.IsEmpty then
      begin
        idmensagem    := Qry.FieldByName('id_mensagem').AsInteger;
        codigo        := Qry.FieldByName('codigo').AsInteger;
        descricao     := Qry.FieldByName('descricao').AsString;
        ativo         := Qry.FieldByName('ativo').AsString;
        uso           := Qry.FieldByName('uso').AsString;
        assuntoemail  := Qry.FieldByName('assunto_email').AsString;
        mensagem      := Qry.FieldByName('mensagem').AsString;
        Result        := True;
      end;

    finally
      Qry.Free;
    end;
  Finally
    ModelSql.Free;
  End;
end;

function TModelMensagem.Novo(out msg: string): Boolean;
var
  sqlQuery: string;
begin
  Result  := false;
  sqlQuery      := 'INSERT INTO mensagem (id_mensagem, codigo, descricao, ativo, uso, assunto_email, mensagem)'+
                    'VALUES(:1, :2, :3, :4, :5, :6, :7)';

  ModelSql      := TModelSQL.Create;

  Try

    Try
      idmensagem      := ModelSql.GerarId(dm.Conn,'mensagem','id_mensagem');
      codigo          := ModelSql.GerarId(dm.Conn,'mensagem','codigo');

      if modelSql.ExecutarSQL(dm.Conn,sqlQuery, [idmensagem, codigo, descricao, ativo, uso, assuntoemail, mensagem]) then
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
    ModelSql.Free;
  End;

end;


{$REGION 'Mensagem Massa WhatsApp'}

Function TModelMensagem.GravarMensagemMassa(mensage,url,pessoa,fone,ext,anexo,tipo, tokenzap:String;
                                 idpessoa:integer
                                ):Boolean;
var
  sqlQuery: string;
  Qry :tuniquery;
begin
  Result    := false;
  sqlQuery  := 'INSERT INTO mensagem_zap (id_zap, mensagem, url, nomepessoa, id_pessoa, fone, status, anexobase, ext,tipo, token)'+
                    'VALUES(:1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :11)';

  Qry       := Tuniquery.Create(nil);

  Try
    Try

      Qry.Connection    := dm.Conn;
      Qry.SQL.Clear;
      Qry.SQL.Text      := sqlQuery;

      Qry.Params.ParamByName('1').AsInteger     := 0;
      Qry.Params.ParamByName('2').AsString      := mensage;
      Qry.Params.ParamByName('3').AsString      := url;
      Qry.Params.ParamByName('4').AsString      := pessoa;
      Qry.Params.ParamByName('5').AsInteger     := idpessoa;
      Qry.Params.ParamByName('6').AsString      := fone;
      Qry.Params.ParamByName('7').AsString      := 'A';
      Qry.Params.ParamByName('8').AsString      := anexo;
      Qry.Params.ParamByName('9').AsString      := ext;
      Qry.Params.ParamByName('10').AsString     := tipo;
      qry.Params.ParamByName('11').AsString     := tokenzap;

      Try
        Qry.ExecSQL;
        Result  := True;
      Except on e:exception do
        begin
          raise Exception.Create(e.Message);
        end;
      End;

    Except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;

  Finally
    FreeAndnil(Qry)
  End;
end;

{$ENDREGION}

end.
