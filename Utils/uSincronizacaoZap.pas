unit uSincronizacaoZap;

interface

uses
  System.Classes,
  System.SysUtils,
  Data.DB,
  Uni, ACBRUTIL, RESTRequest4D,DataSet.Serialize.Adapter.RESTRequest4D,System.JSON,
  uConfiguracaoService;

type
  TSincronizadorZap = class(TThread)
  private
    FOnLog: TProc<string>;
    procedure Log(const Msg: string);
    procedure BuscarEEnviarMensagens;
    function EnviarMSG(out msg: string; telefone, mensagem: string): boolean;
    function EnviarMSGArquivo(out msg: string; telefone, mensagem,
      anexo: string): boolean;
    function EnviarMSGArquivoIMG(out msg: string; telefone, mensagem,
      anexo: string): boolean;
    function EnviarMSGArquivoVideo(out msg: string; telefone, mensagem,
      anexo: string): boolean;
    function EnviarMSGLink(out msg: string; telefone, URLAPP: string): boolean;
  protected
    procedure Execute; override;
  public
    constructor Create(OnLogCallback: TProc<string>);
    destructor Destroy; override;
  end;
implementation

uses Vcl.Validacoes, Vcl.Session, UDM, UConeSul,
  Winapi.Windows;

{ TSincronizadorZap }

constructor TSincronizadorZap.Create(OnLogCallback: TProc<string>);
begin
  inherited Create(True); // Cria a thread suspensa
  FOnLog := OnLogCallback;
  FreeOnTerminate := True; // Libera a memória automaticamente quando a thread terminar
  Resume; // Inicia a execução da thread
end;

destructor TSincronizadorZap.Destroy;
begin

  inherited;
end;

procedure TSincronizadorZap.Log(const Msg: string);
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

procedure TSincronizadorZap.BuscarEEnviarMensagens;
var
  Query, Qryupdate: Tuniquery;
  msg,Telefone,DDD,CellFormatado, CellSemDDD:string;
  I:Integer;
begin

  Query     := Tuniquery.Create(nil);
  Qryupdate := Tuniquery.Create(nil);

  try

    if DM.Conn.Connected then
    begin
      Query.Connection      := DM.Conn;
      Qryupdate.Connection  := DM.Conn;
      Log('Buscando mensagem');

      Query.SQL.Text := 'Select * from mensagem_zap where status=''A'' order by id_zap';

      Try
        Query.Open;

      Except on e:exception do
        begin
          Log('Erro ao abrir consulta: ' + E.Message);
          exit;
        end;
      End;

      while not Query.Eof do
      begin
        if Terminated then
          Exit;

        try
          // Prepara a mensagem para o envio
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
              Log('Número inválido: ' + Telefone);
              Query.Next;
              Continue; // Ignora esse registro e segue para o próximo
            end;

            //Tipo de mensagem a ser enviada

            if Query.FieldByName('tipo').AsString = 'M' then
            begin
              if EnviarMSG(msg, CellFormatado, Query.FieldByName('mensagem').AsString) then
              begin
                Log('Mensagem enviada para: '+Query.FieldByName('nomepessoa').AsString+' - '+CellFormatado);
                // Marca mensagem como enviada
                Qryupdate.SQL.Text := 'Update mensagem_zap set status=''E'' where id_zap= :id';
                Qryupdate.ParamByName('id').AsInteger := Query.FieldByName('id_zap').AsInteger;
                Qryupdate.ExecSQL;
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
                Log('Mensagem enviada para: '+Query.FieldByName('nomepessoa').AsString+' - '+CellFormatado);
                // Marca mensagem como enviada
                Qryupdate.SQL.Text := 'Update mensagem_zap set status=''E'' where id_zap= :id';
                Qryupdate.ParamByName('id').AsInteger := Query.FieldByName('id_zap').AsInteger;
                Qryupdate.ExecSQL;
                Inc(i);
              end;

              if (Query.FieldByName('ext').AsString = '.pdf') or (Query.FieldByName('ext').AsString = '.PDF') then
              begin
                EnviarMSGArquivo(msg,CellFormatado, Query.FieldByName('mensagem').AsString, Query.FieldByName('anexobase').AsString);
                Log('PDF enviada para: '+Query.FieldByName('nomepessoa').AsString+' - '+CellFormatado);
                // Marca mensagem como enviada
                Qryupdate.SQL.Text := 'Update mensagem_zap set status=''E'' where id_zap= :id';
                Qryupdate.ParamByName('id').AsInteger := Query.FieldByName('id_zap').AsInteger;
                Qryupdate.ExecSQL;
                Inc(i);
              end;

              if (Query.FieldByName('ext').AsString = '.mp4') or (Query.FieldByName('ext').AsString = '.MP4') then
              begin //EnviarMSGArquivoVideo
                EnviarMSGArquivoVideo(msg,CellFormatado, Query.FieldByName('mensagem').AsString, Query.FieldByName('anexobase').AsString);
                Log('Vídeo enviada para: '+Query.FieldByName('nomepessoa').AsString+' - '+CellFormatado);
                // Marca mensagem como enviada
                Qryupdate.SQL.Text := 'Update mensagem_zap set status=''E'' where id_zap= :id';
                Qryupdate.ParamByName('id').AsInteger := Query.FieldByName('id_zap').AsInteger;
                Qryupdate.ExecSQL;
                Inc(i);
              end;

            end;

        except
          on E: Exception do
          begin
            Log(Format('Erro ao enviar mensagem: %s', [E.Message]));
          end;
        end;
        Query.Next;
      end;
      Log('Nenhuma mensagem para enviar.');
    end
    else
    begin
      Log('Falha na conexão com o banco de dados.');
    end;
  finally
    Freeandnil(Query);
    FreeAndNil(Qryupdate);

  end;
end;

procedure TSincronizadorZap.Execute;
begin
  while not Terminated do
  begin
    try
      BuscarEEnviarMensagens;
    except
      on E: Exception do
      begin
        Log(Format('Erro na sincronização: %s', [E.Message]));
      end;
    end;
    Sleep(60000); // Intervalo entre sincronizações
  end;
end;


{$REGION 'Envio'}

Function TSincronizadorZap.EnviarMSG(out msg:string;telefone, mensagem:string):boolean;
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
        Log('Mensagem postada: '+LResponse.StatusText + ' Code:' +Inttostr(LResponse.StatusCode));

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

        Log('Mensagem postada: '+LResponse.StatusText + ' Code:' +Inttostr(LResponse.StatusCode));

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

Function TSincronizadorZap.EnviarMSGArquivo(out msg:string;telefone, mensagem, anexo:string):boolean;
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

        Log('Arquivo postado: '+LResponse.StatusText + ' Code:' +Inttostr(LResponse.StatusCode));

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
        Log('Arquivo postado: '+LResponse.StatusText + ' Code:' +Inttostr(LResponse.StatusCode));

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

Function TSincronizadorZap.EnviarMSGArquivoIMG(out msg:string;telefone, mensagem, anexo:string):boolean;
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
          Log('Imagen postada: '+LResponse.StatusText + ' Code:' +Inttostr(LResponse.StatusCode));

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
          Log('Imagen postada: '+LResponse.StatusText + ' Code:' +Inttostr(LResponse.StatusCode));

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

Function TSincronizadorZap.EnviarMSGLink(out msg:string;telefone, URLAPP:string):boolean;
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
        Log('Link postado: '+LResponse.StatusText + ' Code:' +Inttostr(LResponse.StatusCode));

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
        Log('Link postado: '+LResponse.StatusText + ' Code:' +Inttostr(LResponse.StatusCode));

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

Function TSincronizadorZap.EnviarMSGArquivoVideo(out msg:string;telefone, mensagem, anexo:string):boolean;
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
        Log('Vídeo postado: '+LResponse.StatusText + ' Code:' +Inttostr(LResponse.StatusCode));

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
        Log('Vídeo postado: '+LResponse.StatusText + ' Code:' +Inttostr(LResponse.StatusCode));

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

