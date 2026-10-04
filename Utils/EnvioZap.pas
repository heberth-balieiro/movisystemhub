unit EnvioZap;
{

Unit não utilizada mai nova unit usincronizacaozap


}
interface

uses
  System.SysUtils, System.Classes, System.Threading, Data.DB, Uni,
  RESTRequest4D,DataSet.Serialize.Adapter.RESTRequest4D,System.JSON, ACBRUtil,
  uConfiguracaoService;

type
  TMessageSender = class
  private
    FTransacao: TUniTransaction;          // Flag para controlar a execução
    procedure ProcessMessages;

    function EnviarMSG(out msg: string; telefone, mensagem: string): boolean;
    function EnviarMSGArquivo(out msg: string; telefone, mensagem,
      anexo: string): boolean;
    function EnviarMSGArquivoIMG(out msg: string; telefone, mensagem,
      anexo: string): boolean;
    function EnviarMSGArquivoVideo(out msg: string; telefone, mensagem,
      anexo: string): boolean;
    function EnviarMSGLink(out msg: string; telefone, URLAPP: string): boolean;
    procedure LogSincronizar(const msg: string);
    procedure GravarStatusMensage(id: integer);

  public
    FRunning: Boolean;

    constructor Create;
    destructor Destroy; override;

    procedure Start;
    procedure Stop;

    procedure IniciarTransacao;
    procedure ConfirmarTransacao;
    procedure DesfazerTransacao;
  end;

implementation

uses Vcl.Validacoes, Vcl.Session, UDM, UConeSul,
  Winapi.Windows;

procedure TMessageSender.LogSincronizar(const msg: string);
var
  LogFile: TextFile;
  FileName: string;
begin
  FileName := GetCurrentDir+'\LogMensagens.txt'; // Adjust path as needed
  AssignFile(LogFile, FileName);
  if FileExists(FileName) then
    Append(LogFile)
  else
    Rewrite(LogFile);
  try
    Writeln(LogFile, FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) + ' - ' + Msg);
  finally
    CloseFile(LogFile);
  end;
end;

procedure TMessageSender.Start;
begin
  if FRunning then Exit; // Já está em execução
  FRunning := True;
  //FrmPrincipal.TEnviar.Enabled  := False;

  {TTask.Run(
    procedure
    begin

    end); }

    while FRunning do
      begin
        try
          // Processar as mensagens na tabela
          LogSincronizar('Iniciando envio:');
          ProcessMessages;
          FRunning := False;
          Sleep(20000);
        except
          on E: Exception do
          begin
            // Log de erro (substitua pelo log que você utiliza)
            TThread.Synchronize(nil,
              procedure
              begin
                LogSincronizar('Erro ao processar mensagens: ' + E.Message);
                //Writeln('Erro ao processar mensagens: ' + E.Message);
              end);
          end;
        end;
      end;


  //FrmPrincipal.TEnviar.Enabled  := True;
end;

procedure TMessageSender.Stop;
begin
  FRunning := False;
end;

procedure TMessageSender.ProcessMessages;
var
  Query, Qry: TUniQuery;
  QryStr :String;
  msg,Telefone,DDD,CellFormatado, CellSemDDD:string;
  I:Integer;
begin
  QryStr  := 'Select * from mensagem_zap where status=''A'' order by id_zap';

  Query   := TUniquery.Create(nil);

  try
    Try
      //if not Conn.Connected then
      //  Conn.Connected := True;
      Query.Close;
      Query.Connection    := dm.Conn;
      Query.SQL.Clear;
      Query.SQL.Text      := QryStr;

      LogSincronizar('Buscando mensagem: ');
      Query.Open;
      LogSincronizar('Qtde mensagem retornado: ' + Inttostr(Query.RecordCount));
      Query.First;

       while not Query.Eof do
        begin

          // Envia a mensagem
          Telefone      := TiraPontos(query.FieldByName('fone').AsString);
          DDD           := copy(TiraPontos(telefone), 1, 2);
          CellSemDDD    := copy(TiraPontos(telefone),3,11); //numero sem o ddd

          if Length(CellSemDDD) = 9 then
          CellFormatado := '55' + DDD + trim(copy(TiraPontos(telefone), 4, 11))
          else
          if Length(CellSemDDD) = 8 then
          CellFormatado := '55' + DDD + trim(copy(TiraPontos(telefone), 3, 10))
          else
          begin
            LogSincronizar('Número inválido: ' + Telefone);
            Query.Next;
            Continue; // Ignora esse registro e segue para o próximo
          end;

          //Tipo de mensagem a ser enviada

          if Query.FieldByName('tipo').AsString = 'M' then
          begin

            if EnviarMSG(msg, CellFormatado, Query.FieldByName('mensagem').AsString) then
            begin
              LogSincronizar('Mensagem enviada para: '+CellFormatado);

              // Atualiza o status da mensagem no banco de dados
              GravarStatusMensage(Query.FieldByName('id_zap').AsInteger);
              Inc(i);
            end;
          end
          else
          begin
            if (Query.FieldByName('ext').AsString = '.png') or
            (Query.FieldByName('ext').AsString = '.PNG') or
            (Query.FieldByName('ext').AsString = '.jpeg') or (Query.FieldByName('ext').AsString = '.JPEG') then
            begin
              EnviarMSGArquivoIMG(msg,CellFormatado, Query.FieldByName('mensagem').AsString, Query.FieldByName('anexobase').AsString);
              LogSincronizar('Imagen enviada para: '+CellFormatado);
              // Atualiza o status da mensagem no banco de dados
              GravarStatusMensage(Query.FieldByName('id_zap').AsInteger);
              Inc(i);
            end;

            if (Query.FieldByName('ext').AsString = '.pdf') or (Query.FieldByName('ext').AsString = '.PDF') then
            begin
              EnviarMSGArquivo(msg,CellFormatado, Query.FieldByName('mensagem').AsString, Query.FieldByName('anexobase').AsString);
              LogSincronizar('PDF enviada para: '+CellFormatado);
              // Atualiza o status da mensagem no banco de dados
              GravarStatusMensage(Query.FieldByName('id_zap').AsInteger);
              Inc(i);
            end;

            if (Query.FieldByName('ext').AsString = '.mp4') or (Query.FieldByName('ext').AsString = '.MP4') then
            begin //EnviarMSGArquivoVideo
              EnviarMSGArquivoVideo(msg,CellFormatado, Query.FieldByName('mensagem').AsString, Query.FieldByName('anexobase').AsString);
              LogSincronizar('Vídeo enviada para: '+CellFormatado);
              // Atualiza o status da mensagem no banco de dados
              GravarStatusMensage(Query.FieldByName('id_zap').AsInteger);
              Inc(i);
            end;

          end;

          Query.Next;
        end;
        LogSincronizar('Qtde de mensagem enviado:'+inttostr(I));
        Query.Close;
    except on e:exception do
      raise Exception.Create(e.Message);
    End;

  finally
    FreeAndNil(Query);
  end;
end;

Procedure TMessageSender.GravarStatusMensage(id:integer);
var
qry :tuniquery;
strQry:string;
begin
  strqry  := 'Update mensagem_zap set status=''E'' where id_zap=:id';
  Qry     := Tuniquery.create(nil);

  try
    Try
      if not dm.Conn.Connected then
      dm.Conn.Connected := True;

      Qry.Connection          := dm.Conn;
      Qry.SQL.Clear;

      IniciarTransacao;
      Qry.SQL.Text            := strqry;
      Qry.Params.ParamByName('id').AsInteger    := id;

      Try
        Qry.ExecSQL;
        ConfirmarTransacao;

      Except on e:exception do
        begin
          DesfazerTransacao;
          raise Exception.Create(e.Message);
          exit;
        end;
      end;
    except on e:exception do
      begin
        DesfazerTransacao;
        raise Exception.Create(e.Message);
      end;
    End;
  finally
    FreeAndNil(qry);
  end;

end;

{$REGION 'Envio'}

Function TMessageSender.EnviarMSG(out msg:string;telefone, mensagem:string):boolean;
var
  LResponse : IResponse;
  JsonBody  : TJsonObject;
  token     : string;
  url       : string;
  ModelVal  : TValidacao;

begin
  //Chamada de envio de mensagem
  Result  := false;

  if DM.BuscarURLWhatsApp(msg, url) then
  begin

    //validar instancia por funcionario
    ModelVal      := TValidacao.create;
    Try
      if ModelVal.InstanciaPorFunc(TSession.IDEMPRESA) then
      begin
        //Por Funcionario

          if not TConfiguracaoService.RetornoInstanciaWhatsAppFuncionario(token, TSession.ID_USUARIO) then
          begin
            msg     := 'Usuário sem instancia iniciada!';
            result  := False;
            exit;
          end;
       

        LResponse := TRequest.New.BaseURL(url)
                .Resource('/message/text?')
                .AddParam('key',token)
                .AddField('id',telefone)
                .AddField('message',Mensagem)
                .Post;
        LogSincronizar('Mensagem postada: '+LResponse.StatusText + ' Code:' +Inttostr(LResponse.StatusCode));

        if LResponse.StatusCode = 201 then
        begin
          msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
          Result  := True
        end
        else
        begin
          msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
          result  := False;
        end;


      end
      else
      begin
        //Instancia por empresa

        token       := TConeSul.Crypt('C',TSession.RAZAO);

        LResponse := TRequest.New.BaseURL(url)
                .Resource('/message/text?')
                .AddParam('key',token)
                .AddField('id',telefone)
                .AddField('message',Mensagem)
                .Post;

        LogSincronizar('Mensagem postada: '+LResponse.StatusText + ' Code:' +Inttostr(LResponse.StatusCode));

        if LResponse.StatusCode = 201 then
        begin
          msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
          Result  := True
        end
        else
        begin
          msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
          result  := False;
        end;

      end;
    Finally
      ModelVal.Free;
    End;

  end;

end;

Function TMessageSender.EnviarMSGArquivo(out msg:string;telefone, mensagem, anexo:string):boolean;
var
  LResponse : IResponse;
  token     : string;
  url       : string;
  ModelVal  : TValidacao;

begin
  //Chamada de envio de enviar PDF
  Result  := False;

  if DM.BuscarURLWhatsApp(msg, url) then
  begin
    //validar instancia por funcionario
    ModelVal      := TValidacao.create;
    Try
      if ModelVal.InstanciaPorFunc(TSession.IDEMPRESA) then
      begin
        //Por Funcionario

          if not TConfiguracaoService.RetornoInstanciaWhatsAppFuncionario(token, TSession.ID_USUARIO) then
          begin
            msg     := 'Usuário sem instancia iniciada!';
            result  := False;
            exit;
          end;


        LResponse := TRequest.New.BaseURL(url)
                .Resource('/message/doc?')
                .AddParam('key',token)
                .AddFile('file',anexo)
                .AddField('id',telefone)
                .AddField('filename','')
                .Post;

        LogSincronizar('Arquivo postado: '+LResponse.StatusText + ' Code:' +Inttostr(LResponse.StatusCode));

        if LResponse.StatusCode = 201 then
        begin
          msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
          Result  := True
        end
        else
        begin
          msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
          result  := False;
        end;



      end
      else
      begin
        //instancia por empresa

        token       := TConeSul.Crypt('C',TSession.RAZAO);

        LResponse := TRequest.New.BaseURL(url)
                .Resource('/message/doc?')
                .AddParam('key',token)
                .AddFile('file',anexo)
                .AddField('id',telefone)
                .AddField('filename','')
                .Post;
        LogSincronizar('Arquivo postado: '+LResponse.StatusText + ' Code:' +Inttostr(LResponse.StatusCode));

        if LResponse.StatusCode = 201 then
        begin
          msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
          Result  := True
        end
        else
        begin
          msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
          result  := False;
        end;

      end;
    Finally
      ModelVal.Free;
    End;

  end;

end;

Function TMessageSender.EnviarMSGArquivoIMG(out msg:string;telefone, mensagem, anexo:string):boolean;
var
  LResponse : IResponse;
  token     : string;
  url       : string;
  ModelVal  : TValidacao;

begin
  //Chamada de envio de enviar PDF
  Result  := False;

  if DM.BuscarURLWhatsApp(msg, url) then
  begin
    ModelVal      := TValidacao.create;
    Try
      if ModelVal.InstanciaPorFunc(TSession.IDEMPRESA) then
        begin
          //Por Funcionario

            if not TConfiguracaoService.RetornoInstanciaWhatsAppFuncionario(token, TSession.ID_USUARIO) then
            begin
              msg     := 'Usuário sem instancia iniciada!';
              result  := False;
              exit;
            end;
       

          LResponse := TRequest.New.BaseURL(url)
                  .Resource('/message/image?')
                  .AddParam('key',token)
                  .AddFile('file',anexo)
                  .AddField('id',telefone)
                  .AddField('caption','')
                  .Post;
          LogSincronizar('Imagen postada: '+LResponse.StatusText + ' Code:' +Inttostr(LResponse.StatusCode));

          if LResponse.StatusCode = 201 then
          begin
            msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
            Result  := True
          end
          else
          begin
            msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
            result  := False;
          end;

        end
        else
        begin
          //instancia por empresa

          token       := TConeSul.Crypt('C',TSession.RAZAO);

          LResponse := TRequest.New.BaseURL(url)
                  .Resource('/message/image?')
                  .AddParam('key',token)
                  .AddFile('file',anexo)
                  .AddField('id',telefone)
                  .AddField('caption','')
                  .Post;
          LogSincronizar('Imagen postada: '+LResponse.StatusText + ' Code:' +Inttostr(LResponse.StatusCode));

          if LResponse.StatusCode = 201 then
          begin
            msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
            Result  := True
          end
          else
          begin
            msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
            result  := False;
          end;

        end;
    Finally
      ModelVal.Free;
    End;

  end;

end;

Function TMessageSender.EnviarMSGLink(out msg:string;telefone, URLAPP:string):boolean;
var
  LResponse : IResponse;
  JsonBody  : TJsonObject;
  token     : string;
  url       : string;
  ModelVal  : TValidacao;

begin
  //Chamada de envio de mensagem
  Result  := False;

  if DM.BuscarURLWhatsApp(msg, url) then
  begin
    //validar instancia por funcionario
    ModelVal      := TValidacao.create;
    Try
      if ModelVal.InstanciaPorFunc(TSession.IDEMPRESA) then
      begin
        //Por Funcionario

          if not TConfiguracaoService.RetornoInstanciaWhatsAppFuncionario(token, TSession.ID_USUARIO) then
          begin
            msg     := 'Usuário sem instancia iniciada!';
            result  := False;
            exit;
          end;
       

        LResponse := TRequest.New.BaseURL(url)
                .Resource('/message/mediaurl?')
                .AddParam('key',token)
                .AddField('id',telefone)
                .AddField('message',URLAPP)
                .Post;
        LogSincronizar('Link postado: '+LResponse.StatusText + ' Code:' +Inttostr(LResponse.StatusCode));

        if LResponse.StatusCode = 201 then
        begin
          msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
          Result  := True
        end
        else
        begin
          msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
          result  := False;
        end;



      end
      else
      begin
        //instancia por empresa

        token       := TConeSul.Crypt('C',TSession.RAZAO);

        LResponse := TRequest.New.BaseURL(url)
                .Resource('/message/mediaurl?')
                .AddParam('key',token)
                .AddField('id',telefone)
                .AddField('message',URLAPP)
                .Post;
        LogSincronizar('Link postado: '+LResponse.StatusText + ' Code:' +Inttostr(LResponse.StatusCode));

        if LResponse.StatusCode = 201 then
        begin
          msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
          Result  := True
        end
        else
        begin
          msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
          result  := False;
        end;


      end;
    Finally
      ModelVal.Free;
    End;
  end;

end;

Function TMessageSender.EnviarMSGArquivoVideo(out msg:string;telefone, mensagem, anexo:string):boolean;
var
  LResponse : IResponse;
  token     : string;
  url       : string;
  ModelVal  : TValidacao;

begin
  //Chamada de envio de enviar PDF
  Result  := False;

  if DM.BuscarURLWhatsApp(msg, url) then
  begin
    //validar instancia por funcionario
    ModelVal      := TValidacao.create;
    Try
      if ModelVal.InstanciaPorFunc(TSession.IDEMPRESA) then
      begin
        //Por Funcionario

          if not TConfiguracaoService.RetornoInstanciaWhatsAppFuncionario(token, TSession.ID_USUARIO) then
          begin
            msg     := 'Usuário sem instancia iniciada!';
            result  := False;
            exit;
          end;
       

        LResponse := TRequest.New.BaseURL(url)
                .Resource('/message/video?')
                .AddParam('key',token)
                .AddFile('file',anexo)
                .AddField('id',telefone)
                .AddField('caption','')
                .Post;
        LogSincronizar('Vídeo postado: '+LResponse.StatusText + ' Code:' +Inttostr(LResponse.StatusCode));

        if LResponse.StatusCode = 201 then
        begin
          msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
          Result  := True
        end
        else
        begin
          msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
          result  := False;
        end;

      end
      else
      begin
        //instancia por empresa

        token       := TConeSul.Crypt('C',TSession.RAZAO);

        LResponse := TRequest.New.BaseURL(url)
                .Resource('/message/video?')
                .AddParam('key',token)
                .AddFile('file',anexo)
                .AddField('id',telefone)
                .AddField('caption','')
                .Post;
        LogSincronizar('Vídeo postado: '+LResponse.StatusText + ' Code:' +Inttostr(LResponse.StatusCode));

        if LResponse.StatusCode = 201 then
        begin
          msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
          Result  := True
        end
        else
        begin
          msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
          result  := False;
        end;

      end;
    Finally
      ModelVal.Free;
    End;

  end;

end;

{$ENDREGION}

{$REGION 'Transaçao'}

procedure TMessageSender.IniciarTransacao;
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

procedure TMessageSender.ConfirmarTransacao;
begin
  try
    if Assigned(FTransacao) and FTransacao.Active then
      FTransacao.Commit;
  except
    on E: Exception do
      raise Exception.Create('Erro ao confirmar transação: ' + E.Message);
  end;
end;

procedure TMessageSender.DesfazerTransacao;
begin
  try
    if Assigned(FTransacao) and FTransacao.Active then
      FTransacao.Rollback;
  except
    on E: Exception do
      raise Exception.Create('Erro ao desfazer transação: ' + E.Message);
  end;
end;

constructor TMessageSender.Create;
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

destructor TMessageSender.Destroy;
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

{$ENDREGION}


end.
