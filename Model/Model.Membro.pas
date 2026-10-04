unit Model.Membro;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,

  UDM,
  data.DB,
  datasnap.dbclient,
  RESTRequest4D,DataSet.Serialize.Adapter.RESTRequest4D,System.JSON,REST.Types, ACBRUTIL;

Type
  TModelMembro = Class

  Private
    FTransacao: TUniTransaction;
    Fpresidente: string;
    Fidempresa: integer;
    Fidusuario: integer;
    Fcodigo: integer;
    FidMembro: integer;
    Fcpf: string;
    Finativo: String;
    Ffoto: String;
    Fnome: string;
    Fidcampanha: integer;
    Femail: string;
    Fchave_key: string;
    Fwhatsapp: string;
    Fmesario: string;
    Fsecretaria: string;

    Procedure EnviarWhatsAppKey(fone, nome, key:string);


  public
    constructor Create;
    destructor Destroy; override;

    property idMembro     :integer  read FidMembro    write FidMembro;
    property codigo       :integer  read Fcodigo      write Fcodigo;
    property nome         :string   read Fnome        write Fnome;
    property presidente   :string   read Fpresidente  write Fpresidente;
    property cpf          :string   read Fcpf         write Fcpf;
    property idempresa    :integer  read Fidempresa   write Fidempresa;
    property foto         :String   read Ffoto        write Ffoto;
    property inativo      :String   read Finativo     write Finativo;
    Property idusuario    :integer  read Fidusuario   write Fidusuario;
    Property ideleicao    :integer  read Fidcampanha  write Fidcampanha;
    property whatsapp     :string   read Fwhatsapp    write Fwhatsapp;
    property email        :string   read Femail       write Femail;
    property chave_key    :string   read Fchave_key   write Fchave_key;
    property secretaria   :string   read Fsecretaria  write Fsecretaria;
    property mesario      :string   read Fmesario     write Fmesario;

    Function Insert(out msg:String;out id:integer):Boolean;
    Function Update(out msg:string):Boolean;
    Function Delete(out msg:string):Boolean;
    Function Select(out msg:string):Boolean;
    Function GerarId(tab, campo:string):integer;
    Function Pesquisa(out msg:string;id:integer):Boolean;
    function ValidarRegistro(out msg: string): boolean;
    function ValidarPresidente(out msg: string; id: integer): Boolean;
    function ValidarAcessoKey(out msg: string; key: string): boolean;
  End;

implementation

uses
  System.Math, UConeSul, Vcl.Session;

destructor TModelMembro.Destroy;
begin
  if Assigned(FTransacao) then
    FreeAndNil(FTransacao);

  inherited Destroy;
end;

constructor TModelMembro.Create;
begin
inherited Create;

  FTransacao                    := TUniTransaction.Create(nil);
  FTransacao.DefaultConnection  := dm.Conn;

end;

Function TModelMembro.GerarId(tab, campo:string):integer;
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

Function TModelMembro.Insert(out msg:String;out id:integer):Boolean;
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
      sqlQuery := 'Insert Into membro (id_membro, codigo, nome, presidente, cpf,'+
                  ' id_empresa, foto, inativo, id_usuario, id_eleicao, whatsapp, email, chave_key, secretaria, mesario,sinc_app)'+
                  ' Values'+
                  '(:idmembro, :codigo, :nome, :pres, :cpf, :idempresa, :foto, '+
                    ':inativo, :iduser, :ideleicao, :whatsapp, :email, :chavekey, :secretaria, :mesario,''S'')';
      With Qry do
      begin
        Close;
        Sql.clear;
        Qry.SQL.Text := sqlQuery;

        idGerado                                := GerarId('membro', 'id_membro');
        id:= idgerado;
        Qry.ParamByName('idMembro').AsInteger   := idgerado;
        Qry.ParamByName('codigo').Asinteger     := GerarId('membro', 'codigo');
        Qry.ParamByName('nome').AsString        := Trim(nome);
        Qry.ParamByName('pres').AsString        := Trim(presidente);
        Qry.ParamByName('cpf').Asstring         := cpf;
        Qry.ParamByName('idempresa').Asinteger  := idempresa;
        Qry.ParamByName('foto').AsString        := foto;
        Qry.ParamByName('inativo').AsString	    := inativo;
        Qry.ParamByName('iduser').AsInteger     := idusuario;
        Qry.ParamByName('ideleicao').AsInteger  := ideleicao;
        Qry.ParamByName('whatsapp').AsString	  := whatsapp;
        Qry.ParamByName('email').AsString	      := email;
        Qry.ParamByName('secretaria').AsString	:= secretaria;
        Qry.ParamByName('mesario').AsString	    := mesario;

        if presidente='S' then
        begin
          chave_key := TConeSul.GenerateRandomCode(6);//TConesul.Crypt('C',cpf+inttostr(ideleicao));
          Qry.ParamByName('chavekey').AsString	  := chave_key;
        end;

        execsql;
        msg     := 'Registro realizado com sucesso';
        Result  := True;
        FTransacao.Commit;

        //deu certo
        if (presidente='S') and (whatsapp <>'') then
        begin
          EnviarWhatsAppKey(whatsapp,nome,chave_key);
        end;

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

Function TModelMembro.Update(out msg:string):Boolean;
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
      sqlQuery := 'UPDATE MEMBRO SET ' +
                  ' nome= :nome,'+
                  ' presidente= :pres,'+
                  ' cpf= :cpf,'+
                  ' foto= :foto,'+
                  ' inativo = :inativo,'+
                  ' whatsapp= :whatsapp,'+
                  ' email= :email,'+
                  ' secretaria= :secretaria,'+
                  ' mesario= :mesario,'+
                  ' sinc_app= ''S'''+
                  ' WHERE id_membro = :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      // Definindo parâmetros
      Qry.ParamByName('id').AsInteger           := idmembro;
      Qry.ParamByName('nome').AsString          := Trim(nome);
      Qry.ParamByName('pres').AsString          := Trim(presidente);
      Qry.ParamByName('cpf').AsString           := Trim(cpf);
      Qry.ParamByName('foto').AsString          := Trim(foto);
      Qry.ParamByName('inativo').AsString       := inativo;
      Qry.ParamByName('whatsapp').AsString	    := whatsapp;
      Qry.ParamByName('email').AsString	        := email;
      Qry.ParamByName('secretaria').AsString	  := secretaria;
      Qry.ParamByName('mesario').AsString	      := mesario;

      Qry.ExecSQL;

      msg := 'Registro atualizado com sucesso';
      Result := True;
    except
      on E: Exception do
      begin
        msg := 'Erro ao atualizar: ' + E.Message;
        raise;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

Function TModelMembro.Delete(out msg:string):Boolean;
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
      sqlQuery := 'DELETE FROM MEMBRO WHERE ID_MEMBRO = :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      // Definindo parâmetro
      Qry.ParamByName('id').AsInteger    := idmembro;

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

Function TModelMembro.Select(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.Conn;
      sqlQuery := 'SELECT * FROM MEMBRO WHERE ID_MEMBRO= :ID';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger  := idMEMBRO;

      Qry.Open;
      if not Qry.IsEmpty then
      begin

        Idmembro      := Qry.Fieldbyname('id_membro').AsInteger;
        codigo        := Qry.Fieldbyname('codigo').AsInteger;
        nome          := Qry.Fieldbyname('nome').AsString;
        presidente    := Qry.Fieldbyname('presidente').AsString;
        cpf           := Qry.Fieldbyname('cpf').AsString;
        foto          := Qry.Fieldbyname('foto').AsString;
        inativo       := Qry.Fieldbyname('inativo').AsString;
        whatsapp      := Qry.Fieldbyname('whatsapp').AsString;
        email         := Qry.Fieldbyname('email').AsString;
        secretaria    := Qry.Fieldbyname('secretaria').AsString;
        mesario       := Qry.Fieldbyname('mesario').AsString;


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

Function TModelMembro.Pesquisa(out msg:string;id:integer):Boolean;
var
  Qry     :TUniquery;
  sqlQuery :string;

begin
  Result                := False;

  Qry                   := TUniQuery.Create(nil);
  try
    try
      Qry.Connection    := dm.Conn;

      sqlQuery          := 'SELECT ID_MEMBRO, CODIGO, NOME, '+
                          ' case when PRESIDENTE= ''S'' then ''SIM'' else ''NÃO'' end as presidente, '+
                          ' CPF, '+
                          ' case when INATIVO=''S'' then ''SIM'' else ''NÃO'' end as inativo'+
                          ' FROM MEMBRO WHERE ID_MEMBRO > 0 and id_eleicao= :ideleicao';


      sqlQuery  := sqlQuery;


      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := SqlQuery;
      qry.Params.ParamByName('ideleicao').AsInteger   := id;

      Qry.Open;
      Qry.First;

      if not Qry.IsEmpty then
      begin
        if dm.TabConsMembro.Active then
        begin
          dm.TabConsMembro.Close; // Feche o dataset se estiver ativo
        end;

        dm.TabConsMembro.DisableControls;

        if dm.TabConsMembro.eof then
        begin
          dm.TabConsMembro.fieldDefs.clear;
          dm.TabConsMembro.FieldDefs.Add('ID_MEMBRO',   ftInteger);
          dm.TabConsMembro.FieldDefs.Add('CODIGO',      ftInteger);
          dm.TabConsMembro.FieldDefs.Add('NOME',        ftString,150);
          dm.TabConsMembro.FieldDefs.Add('PRESIDENTE',  ftString,5);
          dm.TabConsMembro.FieldDefs.Add('CPF',         ftString,20);
          dm.TabConsMembro.FieldDefs.Add('inativo',     ftString,5);
          dm.TabConsMembro.createdataset;
        end
        else
        begin
          dm.TabConsMembro.EmptyDataSet;
        end;

        while not Qry.Eof do
        begin
          dm.TabConsMembro.Append;
          dm.TabConsMembro.FieldByName('ID_MEMBRO').Value      :=  Qry.FieldByName('ID_MEMBRO').Value;
          dm.TabConsMembro.FieldByName('CODIGO').Value         :=  Qry.FieldByName('CODIGO').Value;
          dm.TabConsMembro.FieldByName('NOME').Value           :=  Qry.FieldByName('NOME').Value;
          dm.TabConsMembro.FieldByName('PRESIDENTE').Value     :=  Qry.FieldByName('PRESIDENTE').Value;
          dm.TabConsMembro.FieldByName('CPF').Value            :=  Qry.FieldByName('CPF').Value;
          dm.TabConsMembro.FieldByName('inativo').Value        :=  Qry.FieldByName('inativo').Value;
          dm.TabConsMembro.Post;
          Qry.Next;
        end;
        dm.TabConsMembro.EnableControls;
        dm.TabConsMembro.First;
        msg := 'Consulta realizada com sucesso';
        Result := True;
      end
      else
      msg := 'Nenhum registro encontrado!';

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

Function TModelMembro.ValidarRegistro(out msg:string):boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.Conn;
      sqlQuery := 'SELECT 1 FROM MEMBRO WHERE cpf= :cpf';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      Qry.Params.ParamByName('cpf').AsString  := cpf;

      Qry.Open;
      if not Qry.IsEmpty then
      begin
        msg := 'OK';
        Result := True;
      end
      else
        msg := 'Sem registro';
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

Function TModelMembro.ValidarPresidente(out msg:string;id:integer):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.Conn;
      sqlQuery := 'select count(*) as i from membro where id_eleicao= :id and presidente=''S''';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger  := id;

      Qry.Open;
      if Qry.Fields[0].AsInteger >0 then
      begin
        msg := 'Já consta um presidente nessa eleição!';
        Result := True;
      end
      else
      msg := 'Nenhum presidente na eleição!';
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

Procedure TModelMembro.EnviarWhatsAppKey(fone, nome, key:string);
var
  LResponse : IResponse;
  token     : string;
  url       : string;
  msg       : string;
  DDD       : string;
  Celular   : String;
  Mensagem  : string;
begin
  //Chamada de envio de mensagem

  if DM.BuscarURLWhatsApp(msg, url) then
  begin
    token       := TConeSul.Crypt('C',TSession.RAZAO);

    DDD := copy(TiraPontos(fone), 1, 2);
    Celular := '55' + DDD + trim(copy(TiraPontos(fone), 4, 11));

    Mensagem  := 'Olá '+nome+','+sLineBreak+sLineBreak+
                 'Segue abaixo a chave de segurança para acesso ao sistema de votos:'+sLineBreak+sLineBreak+
                 'Chave de Segurança:'+sLineBreak+sLineBreak+
                 ' *'+key+'* '+sLineBreak+sLineBreak+
                 'Por favor, mantenha essa chave em um local seguro e não a compartilhe com terceiros. Caso tenha algum problema ou dúvida, entre em contato conosco.'+sLineBreak+
                 sLineBreak+
                 'Atenciosamente,  '+sLineBreak+
                 '*Conesul Sistemas*';

    LResponse := TRequest.New.BaseURL(url)
            .Resource('/message/text?')
            .AddParam('key',token)
            .AddField('id',Celular)
            .AddField('message',Mensagem)
            //.Timeout(60000)
            .Post;

  end;
end;

Function TModelMembro.ValidarAcessoKey(out msg:string;key:string):boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.Conn;
      sqlQuery := 'select count(*) as i from membro where chave_key= :key and inativo=''S'' ';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      Qry.Params.ParamByName('key').AsString  := key;

      Qry.Open;
      if Qry.Fields[0].AsInteger >0 then
      begin
        msg := 'Presidente valido';
        Result := True;
      end
      else
      msg := 'Nenhum presidente na eleição!';
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

end.
