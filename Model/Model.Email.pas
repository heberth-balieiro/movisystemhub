unit Model.Email;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TModelEmail = Class

  Private
    FTransacao: TUniTransaction;
    Fidempresa: integer;
    Femail: string;
    Fsenha: string;
    Fsmtp: string;
    Fidemail: integer;
    Fssl: string;
    Ftls: string;
    Fporta: integer;
    Fidmensagem: integer;

  public
    constructor Create;
    destructor Destroy; override;

    property  idemail     :integer  read  Fidemail    write Fidemail;
    property  smtp        :string   read  Fsmtp       write Fsmtp;
    property  porta       :integer  read  Fporta      write Fporta;
    property  email       :string   read  Femail      write Femail;
    property  senha       :string   read  Fsenha      write Fsenha;
    property  ssl         :string   read  Fssl        write Fssl;
    property  tls         :string   read  Ftls        write Ftls;
    property  idempresa   :integer  read  Fidempresa  write Fidempresa;
    property  idmensagem   :integer  read  Fidmensagem  write Fidmensagem;


    Function Insert(out msg:String;out id:integer):Boolean;
    Function Update(out msg:string):Boolean;
    Function Select(out msg:string):Boolean;
    Function GerarId(tab, campo:string):integer;

  End;

implementation

uses
  System.Math;

destructor TModelEmail.Destroy;
begin
  if Assigned(FTransacao) then
    FreeAndNil(FTransacao);
  inherited Destroy;
end;

constructor TModelEmail.Create;
begin
inherited Create;

  FTransacao                    := TUniTransaction.Create(nil);
  FTransacao.DefaultConnection  := dm.Conn;
end;

Function TModelEmail.GerarId(tab, campo:string):integer;
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

Function TModelEmail.Insert(out msg:String;out id:integer):Boolean;
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
      sqlQuery := 'Insert Into email (id_email, smtp, porta, email, senha, aut_ssl, tls, id_empresa, id_mensagem)'+
                  ' Values'+
                  '(:idemail, :smtp, :porta, :email, :senha, :autssl, :tls, :idempresa, :id_mensagem)';
      With Qry do
      begin
        Close;
        Sql.clear;
        Qry.SQL.Text := sqlQuery;

        idGerado                                := GerarId('email', 'id_email');
        id:= idgerado;
        Qry.ParamByName('idemail').AsInteger    := idgerado;
        Qry.ParamByName('smtp').AsString        := Trim(smtp);
        Qry.ParamByName('porta').AsInteger      := porta;
        Qry.ParamByName('email').AsString       := Trim(email);
        Qry.ParamByName('senha').Asstring       := senha;
        Qry.ParamByName('autssl').Asstring         := ssl;
        Qry.ParamByName('tls').Asstring         := tls;
        Qry.ParamByName('idempresa').AsInteger  := idempresa;
        Qry.ParamByName('id_mensagem').AsInteger  := idmensagem;

        execsql;

        msg     := 'Email salvo com sucesso';
        Result  := True;
        FTransacao.Commit;
        Close;
      end;

    Except on e:exception do
      begin
        FTransacao.Rollback;
        msg := 'Erro ao salvar:' +e.message;
        raise;
      end;
    End;

  Finally
    Qry.free;
  End;
end;

Function TModelEmail.Update(out msg:string):Boolean;
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
      sqlQuery := 'UPDATE email SET ' +
                  ' smtp= :smtp,'+
                  ' porta= :porta, ' +
                  ' email= :email,'+
                  ' senha= :senha,'+
                  ' aut_ssl=  :autssl,'+
                  ' tls=  :tls'+
                  ' id_mensagem= :idmensagem '+
                  ' WHERE id_email= :idemail';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      // Definindo parâmetros
      Qry.ParamByName('idemail').AsInteger    := idemail;
      Qry.ParamByName('smtp').AsString        := Trim(smtp);
      Qry.ParamByName('porta').AsInteger      := porta;
      Qry.ParamByName('email').AsString       := Trim(email);
      Qry.ParamByName('senha').Asstring       := senha;
      Qry.ParamByName('autssl').Asstring     := ssl;
      Qry.ParamByName('tls').Asstring         := tls;
      Qry.ParamByName('idmensagem').AsInteger  := idmensagem;

      Qry.ExecSQL;

      msg := 'Email salvo com sucesso';
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

Function TModelEmail.Select(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.Conn;
      sqlQuery := 'SELECT * FROM EMAIL WHERE ID_EMPRESA= :ID';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger  := idempresa;

      Qry.Open;
      if not Qry.IsEmpty then
      begin
        idemail :=  Qry.Fieldbyname('id_email').AsInteger;
        smtp    :=  Qry.Fieldbyname('smtp').AsString;
        porta   :=  Qry.Fieldbyname('porta').AsInteger;
        email   :=  Qry.Fieldbyname('email').AsString;
        senha   :=  Qry.Fieldbyname('senha').AsString;
        ssl     :=  Qry.Fieldbyname('aut_ssl').AsString;
        tls     :=  Qry.Fieldbyname('tls').AsString;
        idmensagem  := Qry.Fieldbyname('id_mensagem').AsInteger;
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

end.
