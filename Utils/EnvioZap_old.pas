unit EnvioZap;

interface

uses
  System.SysUtils, System.Classes, System.Threading, Data.DB, Uni,
  RESTRequest4D,DataSet.Serialize.Adapter.RESTRequest4D,System.JSON, ACBRUtil;

type
  TMessageSender = class
  private
              // Flag para controlar a execução
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

  public
    FRunning: Boolean;
    procedure Start;
    procedure Stop;
  end;

implementation

uses Model.SQLQry,Vcl.Validacoes, Model.Usuario, Vcl.Session, UDM, UConeSul,
  Winapi.Windows, UnitPrincipal;

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
  FrmPrincipal.TEnviar.Enabled  := False;

  TTask.Run(
    procedure
    begin
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
    end);
  //FrmPrincipal.TEnviar.Enabled  := True;
end;

procedure TMessageSender.Stop;
begin
  FRunning := False;
end;

procedure TMessageSender.ProcessMessages;
var
  Query: TUniQuery;
  QryStr :String;
  ModelSql  :TModelSQL;
  msg,Telefone,DDD,CellFormatado, CellSemDDD:string;
  I:Integer;
begin

  ModelSql      := TModelSQL.Create;

  try

    QryStr  := 'Select * from mensagem_zap where status=''A'' order by id_zap';

    Query   := modelSql.ConsultarSQL(QryStr, []);
    Query.First;

    LogSincronizar('Buscando mensagem: ');
    LogSincronizar('Qtde mensagem retornado: ' + Inttostr(Query.RecordCount));

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
          ModelSql.ExecutarSQL(
            'Update mensagem_zap set status=''E'' where id_zap=:id',
            [Query.FieldByName('id_zap').AsInteger]
          );
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
          ModelSql.ExecutarSQL(
            'Update mensagem_zap set status=''E'' where id_zap=:id',
            [Query.FieldByName('id_zap').AsInteger]
          );
          Inc(i);
        end;

        if (Query.FieldByName('ext').AsString = '.pdf') or (Query.FieldByName('ext').AsString = '.PDF') then
        begin
          EnviarMSGArquivo(msg,CellFormatado, Query.FieldByName('mensagem').AsString, Query.FieldByName('anexobase').AsString);
          LogSincronizar('PDF enviada para: '+CellFormatado);
          // Atualiza o status da mensagem no banco de dados
          ModelSql.ExecutarSQL(
            'Update mensagem_zap set status=''E'' where id_zap=:id',
            [Query.FieldByName('id_zap').AsInteger]
          );
          Inc(i);
        end;

        if (Query.FieldByName('ext').AsString = '.mp4') or (Query.FieldByName('ext').AsString = '.MP4') then
        begin //EnviarMSGArquivoVideo
          EnviarMSGArquivoVideo(msg,CellFormatado, Query.FieldByName('mensagem').AsString, Query.FieldByName('anexobase').AsString);
          LogSincronizar('Vídeo enviada para: '+CellFormatado);
          // Atualiza o status da mensagem no banco de dados
          ModelSql.ExecutarSQL(
            'Update mensagem_zap set status=''E'' where id_zap=:id',
            [Query.FieldByName('id_zap').AsInteger]
          );
          Inc(i);
        end;

      end;

      Query.Next;
    end;

    LogSincronizar('Qtde de mensagem enviado:'+inttostr(I));

  finally
    Query.Free;
    modelSql.Free;
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
  ModelUser : TModelUsuario;
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
        //Buscar token do cadastro do usuario
        ModelUser := TModelUsuario.Create;
        Try
          if not Modeluser.InstanciaWhatsApp(token, TSession.ID_USUARIO) then
          begin
            msg     := 'Usuário sem instancia iniciada!';
            result  := False;
            exit;
          end;
        Finally
          ModelUser.Free;
        End;

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
  ModelUser : TModelUsuario;
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
        //Buscar token do cadastro do usuario
        ModelUser := TModelUsuario.Create;
        Try
          if not Modeluser.InstanciaWhatsApp(token, TSession.ID_USUARIO) then
          begin
            msg     := 'Usuário sem instancia iniciada!';
            result  := False;
            exit;
          end;
        Finally
          ModelUser.Free;
        End;

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
  ModelUser : TModelUsuario;
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
          //Buscar token do cadastro do usuario
          ModelUser := TModelUsuario.Create;
          Try
            if not Modeluser.InstanciaWhatsApp(token, TSession.ID_USUARIO) then
            begin
              msg     := 'Usuário sem instancia iniciada!';
              result  := False;
              exit;
            end;
          Finally
            ModelUser.Free;
          End;

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
  ModelUser : TModelUsuario;
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
        //Buscar token do cadastro do usuario
        ModelUser := TModelUsuario.Create;
        Try
          if not Modeluser.InstanciaWhatsApp(token, TSession.ID_USUARIO) then
          begin
            msg     := 'Usuário sem instancia iniciada!';
            result  := False;
            exit;
          end;
        Finally
          ModelUser.Free;
        End;

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
  ModelUser : TModelUsuario;
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
        //Buscar token do cadastro do usuario
        ModelUser := TModelUsuario.Create;
        Try
          if not Modeluser.InstanciaWhatsApp(token, TSession.ID_USUARIO) then
          begin
            msg     := 'Usuário sem instancia iniciada!';
            result  := False;
            exit;
          end;
        Finally
          ModelUser.Free;
        End;

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


end.
