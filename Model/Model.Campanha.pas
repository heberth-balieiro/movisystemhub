unit Model.Campanha;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,

  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TModelCampanha = Class

  Private
    FTransacao: TUniTransaction;
    Fidempresa: integer;
    Fhorafinal: TTime;
    Fdataini: Tdate;
    Fideleicao: integer;
    Fidusuario: integer;
    Fcodigo: integer;
    Fhoraini: Ttime;
    Fpublicada: String;
    Fdetalhes: String;
    Ftoken: String;
    FidCampanha: integer;
    Fauditoria: String;
    Fdatafinal: TDate;
    FchaveKey: String;
    Ffechamentoautomatico: String;
    Fpermitinulo: String;
    Fpermitirbranco: String;



  public
    constructor Create;
    destructor Destroy; override;

    property idCampanha   :integer  read FidCampanha    write Fidcampanha;
    property codigo       :integer  read Fcodigo        write Fcodigo;
    property idempresa    :integer  read Fidempresa     write Fidempresa;
    Property idusuario    :integer  read Fidusuario     write Fidusuario;
    property dataini      :Tdate    read Fdataini       write Fdataini;
    property horaini      :Ttime    read Fhoraini       write Fhoraini;
    property datafinal    :TDate    read Fdatafinal     write Fdatafinal;
    property horafinal    :TTime    read Fhorafinal     write Fhorafinal;
    property auditoria    :String   read Fauditoria     write Fauditoria;
    Property ideleicao    :integer  Read Fideleicao     write Fideleicao;
    property detalhes     :String   read Fdetalhes      write Fdetalhes;
    property publicada    :String   read Fpublicada     write Fpublicada;
    property token        :String   read Ftoken         write Ftoken;
    property chaveKey     :String   read FchaveKey      write FchaveKey;//chave do presidente
    property fechamentoautomatico  :String  read Ffechamentoautomatico  write Ffechamentoautomatico;

    Function Insert(out msg:String;out id:integer):Boolean;
    Function Update(out msg:string):Boolean;
    Function Delete(out msg:string):Boolean;
    Function Select(out msg:string):Boolean;
    Function GerarId(tab, campo:string):integer;
    Function Pesquisa(out msg:string):Boolean;
    function ValidarRegistro(out msg: string): boolean;
    function PublicarCampanha(out msg: string): boolean;
    function DespublicarCampanha(out msg: string): boolean;
    function EncerrarCampanha(out msg: string): boolean;

    function SelectVotos(out msg: string): Boolean;
    function TotalAssociado: Boolean;
    function TotalVotosValidos: Boolean;
    function TotalVotosBranco: Boolean;
    function TotalVotosNulos: Boolean;
    function TotalVotosDepartamento: Boolean;
    function TotalAssociadoNaoVotaram: Boolean;
    function BuscarTokenCampanha(i: integer): string;
    //function ConfiguracaoCampanha(out msg, nulo, branco: string): boolean;
    function DadosCampanhaMensagem(out campanha: String; out DTIni,
      DTFIm: Tdate; out HRIni, HRFim: Ttime; id: integer): boolean;
  End;

implementation

uses
  System.Math, UConeSul;

destructor TModelCampanha.Destroy;
begin
  if Assigned(FTransacao) then
    FreeAndNil(FTransacao);

  inherited Destroy;
end;

constructor TModelCampanha.Create;
begin
inherited Create;

  FTransacao                    := TUniTransaction.Create(nil);
  FTransacao.DefaultConnection  := dm.Conn;

end;

Function TModelCampanha.GerarId(tab, campo:string):integer;
var
Qry       : TUniquery;
sqlQuery  : string;
begin
  Result  := 0;
  sqlQuery := 'SELECT MAX(' + campo + ') AS id FROM ' + tab;
  Qry     := TUniquery.create(nil);

  Try
    Try
      if dm.Conn.Connected then
      begin
        Qry.Connection := dm.Conn;
        Qry.SQL.Text   := sqlQuery;
        Qry.Open;

        if not Qry.IsEmpty then
        Result := Qry.FieldByName('id').AsInteger + 1
        else
        Result  := 1;

        Qry.Close;

      end
      else
      begin
        raise Exception.Create('Falha na conexão com o banco de dados.');
      end;

    Except on e:exception do
      raise Exception.Create('Erro ao gerar ID:' + e.message);
    End;

  Finally
    FreeAndNil(Qry)
  End;
end;

Function TModelCampanha.Insert(out msg:String;out id:integer):Boolean;
var
Qry       : TUniquery;
sqlQuery  : string;
idGerado  : Integer;
begin
  Result  := False;
  sqlQuery := 'Insert Into campanha (id_campanha, codigo, id_empresa, id_usuario, data_ini, hora_ini, '+
                  'data_final, hora_final, auditoria, id_eleicao, detalhes, '+
                  'publicada, token, chave_key, concluida, fechamento_automatico, sinc_app)'+
                  ' Values'+
                  '(:1,:2,:3,:4,:5,:6,:7,:8,:9,:10,:11,:12,:13,:14,:15,:16,''S'')';

  Qry     := TUniquery.create(nil);

  Try
    Try
      if dm.Conn.Connected then
      begin
        Qry.Connection := dm.Conn;
        Qry.SQL.Text := sqlQuery;

        With Qry do
        begin

          FTransacao.StartTransaction;
          idGerado                          := GerarId('campanha', 'id_campanha');
          id:= idgerado;
          Qry.ParamByName('1').AsInteger    := idgerado;
          Qry.ParamByName('2').Asinteger    := GerarId('campanha', 'codigo');
          Qry.ParamByName('3').Asinteger    := idempresa;
          Qry.ParamByName('4').asinteger    := idusuario;
          Qry.ParamByName('5').AsDateTime   := dataini;
          Qry.ParamByName('6').AsDateTime   := horaini;
          Qry.ParamByName('7').AsDateTime   := datafinal;
          Qry.ParamByName('8').AsDateTime   := horafinal;
          Qry.ParamByName('9').AsString     := auditoria;
          Qry.ParamByName('10').AsInteger   := ideleicao;
          Qry.ParamByName('11').AsString    := detalhes;
          Qry.ParamByName('12').AsString    := publicada;
          Qry.ParamByName('13').AsString    := token;
          Qry.ParamByName('14').AsString    := chaveKey;
          Qry.ParamByName('15').AsString    := 'N';
          Qry.ParamByName('16').AsString    := fechamentoautomatico;

          execsql;

          msg     := 'Registro realizado com sucesso';
          Result  := True;
          FTransacao.Commit;
          Close;
        end;
      end
      else
      begin
        raise Exception.Create('Falha na conexão com o banco de dados.');
      end;

    Except on e:exception do
      begin
        FTransacao.Rollback;
        msg := 'Erro ao inserir:' +e.message;
        raise;
      end;
    End;

  Finally
    FreeAndnil(Qry);
  End;
end;

Function TModelCampanha.Update(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  sqlQuery := 'UPDATE CAMPANHA SET ' +
                  ' data_ini= :dt1,'+
                  ' hora_ini= :hr1,'+
                  ' data_final= :dt2,'+
                  ' hora_final= :hr2,'+
                  ' auditoria= :aud,'+
                  ' detalhes= :detalhes,'+
                  ' chave_key_alt= :key,'+
                  ' fechamento_automatico= :api,'+
                  ' sinc_app=''S'' '+
                  ' WHERE id_campanha = :id';
  Qry := TUniQuery.Create(nil);

  try
    try

      if dm.Conn.Connected then
      begin
        Qry.Connection := dm.Conn;
        Qry.SQL.Text := sqlQuery;
        FTransacao.StartTransaction;
        // Definindo parâmetros
        Qry.ParamByName('id').AsInteger           := idcampanha;
        Qry.ParamByName('dt1').asdatetime         := dataini;
        Qry.ParamByName('hr1').asdatetime         := horaini;
        Qry.ParamByName('dt2').asdatetime         := datafinal;
        Qry.ParamByName('hr2').asdatetime         := horafinal;
        Qry.ParamByName('aud').AsString           := auditoria;
        Qry.ParamByName('detalhes').AsString      := detalhes;
        Qry.ParamByName('key').AsString           := chaveKey;
        Qry.ParamByName('api').AsString           := fechamentoautomatico;

        Qry.ExecSQL;
        FTransacao.Commit;
        msg := 'Registro atualizado com sucesso';
        Result := True;
      end
      else
      begin
        raise Exception.Create('Falha na conexão com o banco de dados.');
      end;
    except
      on E: Exception do
      begin
        FTransacao.Rollback;
        msg := 'Erro ao atualizar: ' + E.Message;
        raise;
      end;
    end;
  finally
    FreeAndNIl(qry);
  end;
end;

Function TModelCampanha.Delete(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  sqlQuery := 'DELETE FROM CAMPANHA WHERE ID_CAMPANHA = :id';
  Qry := TUniQuery.Create(nil);

  try
    try
      if dm.Conn.Connected then
      begin
        Qry.Connection := dm.Conn;
        Qry.SQL.Text := sqlQuery;
        Qry.ParamByName('id').AsInteger    := idcampanha;

        Qry.ExecSQL;

        if Qry.RowsAffected > 0 then
        begin
          msg := 'Registro deletado com sucesso';
          Result := True;
        end
        else
          msg := 'Nenhum registro encontrado para deletar';
      end
      else
      begin
        raise Exception.Create('Falha na conexão com o banco de dados.');
      end;
    except
      on E: Exception do
      begin
        msg := 'Erro ao deletar: ' + E.Message;
        raise;
      end;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

Function TModelCampanha.Select(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  sqlQuery := 'SELECT * FROM CAMPANHA WHERE ID_CAMPANHA= :ID';
  Qry := TUniQuery.Create(nil);

  try
    try
      if dm.Conn.Connected then
      begin
        Qry.Connection := dm.Conn;
        Qry.SQL.Text := sqlQuery;
        Qry.Params.ParamByName('id').AsInteger  := idcampanha;

        Qry.Open;
        if not Qry.IsEmpty then
        begin

          Idcampanha    := Qry.Fieldbyname('id_campanha').AsInteger;
          codigo        := Qry.Fieldbyname('codigo').AsInteger;
          dataini       := Qry.Fieldbyname('data_ini').AsDatetime;
          horaini       := Qry.Fieldbyname('hora_ini').AsDatetime;
          datafinal     := Qry.Fieldbyname('data_final').AsDateTime;
          horafinal     := Qry.Fieldbyname('hora_final').AsDatetime;
          auditoria     := Qry.Fieldbyname('auditoria').AsString;
          detalhes      := Qry.Fieldbyname('detalhes').AsString;
          ideleicao     := Qry.FieldByName('id_eleicao').AsInteger;
          fechamentoautomatico  := Qry.Fieldbyname('fechamento_automatico').AsString;


          msg := 'Consulta realizada com sucesso';
          Result := True;
        end
        else
          msg := 'Nenhum registro encontrado!';
      end
      else
      begin
        raise Exception.Create('Falha na conexão com o banco de dados.');
      end;
    except
      on E: Exception do
      begin
        msg := 'Erro ao executar consulta: ' + E.Message;
        raise;
      end;
    end;
  finally
    FreeandNil(qry);
  end;
end;

Function TModelCampanha.Pesquisa(out msg:string):Boolean;
var
  Qry     :TUniquery;
  sqlQuery :string;
  I:integer;
begin
  Result                := False;
  sqlQuery          := 'SELECT C.ID_CAMPANHA, C.CODIGO, C.DATA_INI, C.HORA_INI, C.DATA_FINAL, '+
                          ' C.HORA_FINAL, C.AUDITORIA, C.DETALHES, '+
                          ' CASE WHEN C.PUBLICADA = ''S'' THEN ''PUBLICADA'' ELSE ''NÃO PUBLICADA'' END AS PUBLICADA,'+
                           'E.NOME, C.CONCLUIDA, C.TOKEN'+
                           ' FROM CAMPANHA C '+
                           ' INNER JOIN ELEICAO E'+
                           ' ON C.ID_ELEICAO = E.ID_ELEICAO'+
                           ' WHERE C.ID_CAMPANHA > 0';
  Qry                   := TUniQuery.Create(nil);
  try
    try
      if dm.Conn.Connected then
      begin
        Qry.Connection    := dm.Conn;
        Qry.SQL.Text := SqlQuery;

        Qry.Open;
        Qry.First;

        if not Qry.IsEmpty then
        begin
          //criar campo na tebela temporaria
          if dm.TabConsCampanha.eof then
          begin
            dm.TabConsCampanha.fieldDefs.clear;
            dm.TabConsCampanha.FieldDefs.Add('id_campanha', ftInteger);
            dm.TabConsCampanha.FieldDefs.Add('codigo',      ftInteger);
            dm.TabConsCampanha.FieldDefs.Add('data_ini',    ftdate);
            dm.TabConsCampanha.FieldDefs.Add('hora_ini',    fttime);
            dm.TabConsCampanha.FieldDefs.Add('data_final',  ftdate);
            dm.TabConsCampanha.FieldDefs.Add('hora_final',  fttime);
            dm.TabConsCampanha.FieldDefs.Add('auditoria',   ftString, 3);
            dm.TabConsCampanha.FieldDefs.Add('detalhes',    ftString, 500);
            dm.TabConsCampanha.FieldDefs.Add('publicada',   ftString, 50);
            dm.TabConsCampanha.FieldDefs.Add('nome',        ftString, 90);
            dm.TabConsCampanha.FieldDefs.Add('concluida',   ftString, 1);
            dm.TabConsCampanha.FieldDefs.Add('token',       ftString, 500);
            //dm.TabConsCampanha.fieldDefs.assign(Qry.FieldDefs);
            dm.TabConsCampanha.createdataset;
          end
          else
          begin
            dm.TabConsCampanha.EmptyDataSet;
          end;

          while not Qry.Eof do
          begin
            dm.TabConsCampanha.Append;
            for I := 0 to Qry.FieldCount - 1 do
            begin
              dm.TabConsCampanha.FieldByName('id_campanha').Value   := Qry.FieldByName('id_campanha').Value;
              dm.TabConsCampanha.FieldByName('codigo').Value        := Qry.FieldByName('codigo').Value;
              dm.TabConsCampanha.FieldByName('data_ini').Value      := Qry.FieldByName('data_ini').Value;
              dm.TabConsCampanha.FieldByName('hora_ini').Value      := Qry.FieldByName('hora_ini').Value;
              dm.TabConsCampanha.FieldByName('data_final').Value    := Qry.FieldByName('data_final').Value;
              dm.TabConsCampanha.FieldByName('hora_final').Value    := Qry.FieldByName('hora_final').Value;
              dm.TabConsCampanha.FieldByName('auditoria').Value     := Qry.FieldByName('auditoria').Value;
              dm.TabConsCampanha.FieldByName('detalhes').Value      := Qry.FieldByName('detalhes').Value;
              dm.TabConsCampanha.FieldByName('publicada').Value     := Qry.FieldByName('publicada').Value;
              dm.TabConsCampanha.FieldByName('nome').Value          := Qry.FieldByName('nome').Value;
              dm.TabConsCampanha.FieldByName('concluida').Value     := Qry.FieldByName('concluida').Value;
              dm.TabConsCampanha.FieldByName('token').Value         := Qry.FieldByName('token').Value;

              //dm.TabConsCampanha.Fields[I].Value := Qry.Fields[I].Value;
            end;

            dm.TabConsCampanha.Post;
            Qry.Next;
          end;

          msg := 'Consulta realizada com sucesso';
          Result := True;
        end
        else
          msg := 'Nenhum registro encontrado!';

        Qry.Close;
      end
      else
      begin
        raise Exception.Create('Falha na conexão com o banco de dados.');
      end;
    except
      on E: Exception do
      begin
        msg := 'Erro ao executar consulta: ' + E.Message;
        raise;
      end;
    end;
  finally
    Freeandnil(Qry);
  end;
end;

Function TModelCampanha.ValidarRegistro(out msg:string):boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  sqlQuery := 'Select Count(*) as id from campanha where id_eleicao= :id';
  Qry := TUniQuery.Create(nil);

  try
    try
      if dm.Conn.Connected then
      begin
        Qry.Connection := dm.Conn;
        Qry.SQL.Text := sqlQuery;
        Qry.Params.ParamByName('id').AsInteger  := ideleicao;

        Qry.Open;
        if Qry.Fields[0].AsInteger > 0 then
        begin
          msg := 'Já exite uma campanha criada para essa eleição!';
          Result := True;
        end
        else
          msg := 'Sem registro';
      end
      else
      begin
        raise Exception.Create('Falha na conexão com o banco de dados.');
      end;
    except
      on E: Exception do
      begin
        msg := 'Erro ao executar consulta: ' + E.Message;
        raise;
      end;
    end;
  finally
    FreeAndnil(qry);
  end;
end;

Function TModelCampanha.PublicarCampanha(out msg:string):boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  sqlQuery := 'UPDATE CAMPANHA SET ' +
                  ' publicada= :publicada,'+
                  ' token= :token,'+
                  ' dthr_publicacao= :dthr,'+
                  ' chave_key_publicar= :key,'+
                  ' sinc_app= ''S'' '+
                  ' WHERE id_campanha = :id';
  Qry := TUniQuery.Create(nil);

  try
    try
      if dm.Conn.Connected then
      begin

        Qry.Connection := dm.Conn;
        Qry.SQL.Text := sqlQuery;

        Qry.ParamByName('id').AsInteger           := idcampanha;
        Qry.ParamByName('publicada').AsString     := 'S';
        Qry.ParamByName('token').AsString         := Tconesul.Crypt('C',inttostr(idcampanha)+chavekey);//formado pelo id da campanha e key do presidente
        Qry.ParamByName('dthr').asdatetime        := now;
        Qry.ParamByName('key').AsString           := chaveKey;

        Qry.ExecSQL;

        msg := 'Registro atualizado com sucesso';
        Result := True;
      end
      else
      begin
        raise Exception.Create('Falha na conexão com o banco de dados.');
      end;
    except
      on E: Exception do
      begin
        msg := 'Erro ao atualizar: ' + E.Message;
        raise;
      end;
    end;
  finally
    freeandnil(qry);
  end;
end;

Function TModelCampanha.DespublicarCampanha(out msg:string):boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  sqlQuery := 'UPDATE CAMPANHA SET ' +
                  ' publicada= :publicada,'+
                  ' dthr_despublicacao= :dthr,'+
                  ' chave_key_despublicar= :key,'+
                  ' sinc_app= ''S'' '+
                  ' WHERE id_campanha = :id';
  Qry := TUniQuery.Create(nil);

  try
    try
      if dm.Conn.Connected then
      begin
        Qry.Connection := dm.Conn;
        Qry.SQL.Text := sqlQuery;

        Qry.ParamByName('id').AsInteger           := idcampanha;
        Qry.ParamByName('publicada').AsString     := 'N';
        //Qry.ParamByName('token').AsString         := '';//Tconesul.Crypt('C',inttostr(idcampanha)+chavekey);//formado pelo id da campanha e key do presidente
        Qry.ParamByName('dthr').asdatetime        := now;
        Qry.ParamByName('key').AsString           := chaveKey;

        Qry.ExecSQL;

        msg := 'Registro atualizado com sucesso';
        Result := True;
      end
      else
      begin
        raise Exception.Create('Falha na conexão com o banco de dados.');
      end;
    except
      on E: Exception do
      begin
        msg := 'Erro ao atualizar: ' + E.Message;
        raise;
      end;
    end;
  finally
    FreeAndNil(qry);
  end;
end;

function TModelCampanha.EncerrarCampanha(out msg: string): boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  sqlQuery := 'UPDATE CAMPANHA SET ' +
                  ' dtrh_fechamento= :dthr,'+
                  ' concluida= ''S'','+
                  ' chave_key_encerramento= :key,'+
                  ' sinc_app= ''S'' '+
                  ' WHERE id_campanha = :id';
  Qry := TUniQuery.Create(nil);

  try
    try
      if dm.Conn.Connected then
      begin
        Qry.Connection := dm.Conn;
        Qry.SQL.Text := sqlQuery;

        Qry.ParamByName('id').AsInteger           := idcampanha;
        Qry.ParamByName('dthr').asdatetime        := now;
        Qry.ParamByName('key').AsString           := chaveKey;

        Qry.ExecSQL;

        msg := 'Registro atualizado com sucesso';
        Result := True;
      end
      else
      begin
        raise Exception.Create('Falha na conexão com o banco de dados.');
      end;
    except
      on E: Exception do
      begin
        msg := 'Erro ao atualizar: ' + E.Message;
        raise;
      end;
    end;
  finally
    FreeAndnIl(qry);
  end;
end;

Function TModelCampanha.DadosCampanhaMensagem(out campanha:String;
                                              out DTIni, DTFIm:Tdate;
                                              out HRIni,HRFim:Ttime;
                                              id:integer):boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  sqlQuery := 'Select                     '+
                    ' c.data_ini,             '+
                    ' c.hora_ini,             '+
                    ' c.data_final,           '+
                    ' c.hora_final,           '+
                    ' e.nome,                 '+
                    ' e.descricao             '+
                    ' From campanha c         '+
                    ' inner join eleicao e    '+
                    ' on c.id_eleicao = e.id_eleicao '+
                    ' where c.id_campanha= :id';
  Qry := TUniQuery.Create(nil);

  try
    try
      if dm.Conn.Connected then
      begin
        Qry.Connection := dm.Conn;
        Qry.SQL.Text := sqlQuery;
        Qry.Params.ParamByName('id').AsInteger  := id;

        Qry.Open;
        if not Qry.IsEmpty then
        begin

          campanha  := Qry.Fieldbyname('nome').AsString;
          DTIni     := Qry.Fieldbyname('data_ini').AsDatetime;
          HRIni     := Qry.Fieldbyname('hora_ini').AsDatetime;
          DTFIm     := Qry.Fieldbyname('data_final').AsDateTime;
          HRFim     := Qry.Fieldbyname('hora_final').AsDatetime;
          Result := True;
        end;
      end
      else
      begin
        raise Exception.Create('Falha na conexão com o banco de dados.');
      end;
    except
      on E: Exception do
      begin
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    Freeandnil(qry);
  end;
end;

{$REGION 'Resultado Painel'}

Function TModelCampanha.BuscarTokenCampanha(i:integer):string;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := '';
  sqlQuery := 'Select token from campanha where id_campanha= :id';
  Qry := TUniQuery.Create(nil);

  try
    try
      if dm.Conn.Connected then
      begin
        Qry.Connection := dm.Conn;
        Qry.SQL.Text := sqlQuery;
        Qry.Params.ParamByName('id').AsInteger    :=i;

        Qry.Open;

        if not Qry.IsEmpty then
        begin
          Result  := Qry.Fieldbyname('token').asstring;
        end
        else
        Result  :=  '';
        Qry.Close;
      end
      else
      begin
        raise Exception.Create('Falha na conexão com o banco de dados.');
      end;

    except
      on E: Exception do
      begin
        raise;
      end;
    end;
  finally
    Freeandnil(qry);
  end;
end;


Function TModelCampanha.SelectVotos(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  sqlQuery := 'Select                                     '+
                   ' count(voto) as votos, cp.nome as chapa   '+
                   ' from votos v                             '+
                   ' inner join chapa cp                      '+
                   ' on v.voto = cp.id_chapa                  '+
                   ' where v.token= :token                    '+
                   ' group by cp.nome';
  Qry := TUniQuery.Create(nil);

  try
    try
      if dm.Conn.Connected then
      begin
        Qry.Connection := dm.Conn;
        Qry.SQL.Text := sqlQuery;
        Qry.Params.ParamByName('token').AsString  := token;

        Qry.Open;

        if not Qry.IsEmpty then
        begin
          if dm.TabVotos.Active then
          begin
            dm.TabVotos.Close; // Feche o dataset se estiver ativo
          end;

          Dm.TabVotos.DisableControls;
          if dm.TabVotos.eof then
          begin
            dm.TabVotos.fieldDefs.clear;
            dm.TabVotos.FieldDefs.Add('votos', ftInteger);
            dm.TabVotos.FieldDefs.Add('chapa',   ftString, 90);
            dm.TabVotos.FieldDefs.Add('somavoto', ftInteger);

            dm.TabVotos.createdataset;
          end
          else
          begin
            dm.TabVotos.EmptyDataSet;
          end;

          while not Qry.Eof do
          begin
            dm.TabVotos.Append;
            dm.TabVotos.FieldByName('votos').Value      :=  Qry.FieldByName('votos').Value;
            dm.TabVotos.FieldByName('chapa').Value      :=  Qry.FieldByName('chapa').Value;

            dm.TabVotos.Post;
            Qry.Next;
          end;

          dm.TabVotos.EnableControls;
          dm.TabVotos.First;

          msg := 'OK';
          Result := True;

        end
        else
        msg := 'Nenhum registro encontrado!';
        Qry.Close;
      end
      else
      begin
        raise Exception.Create('Falha na conexão com o banco de dados.');
      end;

    except
      on E: Exception do
      begin
        msg := 'Erro ao executar consulta: ' + E.Message;
        raise;
      end;
    end;
  finally
    FreeAndnil(qry);
  end;
end;

Function TModelCampanha.TotalAssociado:Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  sqlQuery := 'Select count(*) as total from socio where situacao=''S''';
  Qry := TUniQuery.Create(nil);

  try
    try
      if dm.Conn.Connected then
      begin
        Qry.Connection := dm.Conn;
        Qry.SQL.Text := sqlQuery;

        Qry.Open;

        if not Qry.IsEmpty then
        begin
          if dm.TotalAssociado.Active then
          begin
            dm.TotalAssociado.Close; // Feche o dataset se estiver ativo
          end;

          Dm.TotalAssociado.DisableControls;
          if dm.TotalAssociado.eof then
          begin
            dm.TotalAssociado.fieldDefs.clear;
            dm.TotalAssociado.FieldDefs.Add('total', ftInteger);

            dm.TotalAssociado.createdataset;
          end
          else
          begin
            dm.TotalAssociado.EmptyDataSet;
          end;

          while not Qry.Eof do
          begin
            dm.TotalAssociado.Append;
            dm.TotalAssociado.FieldByName('total').Value      :=  Qry.FieldByName('total').Value;
            dm.TotalAssociado.Post;
            Qry.Next;
          end;

          dm.TotalAssociado.EnableControls;
          dm.TotalAssociado.First;
          Result := True;

        end
        else

        Qry.Close;
      end
      else
      begin
        raise Exception.Create('Falha na conexão com o banco de dados.');
      end;

    except
      on E: Exception do
      begin
        //msg := 'Erro ao executar consulta: ' + E.Message;
        raise;
      end;
    end;
  finally
    freeandnil(qry);
  end;
end;

Function TModelCampanha.TotalVotosValidos:Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  sqlQuery := 'Select count(*) as total from votos where token= :token';
  Qry := TUniQuery.Create(nil);

  try
    try
      if dm.Conn.Connected then
      begin
        Qry.Connection := dm.Conn;
        Qry.SQL.Text := sqlQuery;
        Qry.Params.ParamByName('token').AsString      := token;
        Qry.Open;

        if not Qry.IsEmpty then
        begin
          if dm.TabTotalVotos.Active then
          begin
            dm.TabTotalVotos.Close; // Feche o dataset se estiver ativo
          end;

          Dm.TabTotalVotos.DisableControls;
          if dm.TabTotalVotos.eof then
          begin
            dm.TabTotalVotos.fieldDefs.clear;
            dm.TabTotalVotos.FieldDefs.Add('total', ftInteger);

            dm.TabTotalVotos.createdataset;
          end
          else
          begin
            dm.TabTotalVotos.EmptyDataSet;
          end;

          while not Qry.Eof do
          begin
            dm.TabTotalVotos.Append;
            dm.TabTotalVotos.FieldByName('total').Value      :=  Qry.FieldByName('total').Value;
            dm.TabTotalVotos.Post;
            Qry.Next;
          end;

          dm.TabTotalVotos.EnableControls;
          dm.TabTotalVotos.First;
          Result := True;

        end
        else

        Qry.Close;
      end
      else
      begin
        raise Exception.Create('Falha na conexão com o banco de dados.');
      end;

    except
      on E: Exception do
      begin
        //msg := 'Erro ao executar consulta: ' + E.Message;
        raise;
      end;
    end;
  finally
    freeandnil(Qry);
  end;
end;

Function TModelCampanha.TotalVotosBranco:Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  sqlQuery := 'Select                   '+
                   ' count(*) as total      '+
                   ' from votos v           '+
                   ' inner join chapa c     '+
                   ' on v.voto = c.id_chapa '+
                   ' where v.token= :token  '+
                   ' and c.nome=''BRANCO''';
  Qry := TUniQuery.Create(nil);

  try
    try
      if dm.Conn.Connected then
      begin
        Qry.Connection := dm.Conn;
        Qry.SQL.Text := sqlQuery;
        Qry.Params.ParamByName('token').AsString      := token;
        Qry.Open;

        if not Qry.IsEmpty then
        begin
          if dm.TabTotalVotoBranco.Active then
          begin
            dm.TabTotalVotoBranco.Close; // Feche o dataset se estiver ativo
          end;

          Dm.TabTotalVotoBranco.DisableControls;
          if dm.TabTotalVotoBranco.eof then
          begin
            dm.TabTotalVotoBranco.fieldDefs.clear;
            dm.TabTotalVotoBranco.FieldDefs.Add('total', ftInteger);

            dm.TabTotalVotoBranco.createdataset;
          end
          else
          begin
            dm.TabTotalVotoBranco.EmptyDataSet;
          end;

          while not Qry.Eof do
          begin
            dm.TabTotalVotoBranco.Append;
            dm.TabTotalVotoBranco.FieldByName('total').Value      :=  Qry.FieldByName('total').Value;
            dm.TabTotalVotoBranco.Post;
            Qry.Next;
          end;

          dm.TabTotalVotoBranco.EnableControls;
          dm.TabTotalVotoBranco.First;
          Result := True;

        end
        else

        Qry.Close;
      end
      else
      begin
        raise Exception.Create('Falha na conexão com o banco de dados.');
      end;

    except
      on E: Exception do
      begin
        //msg := 'Erro ao executar consulta: ' + E.Message;
        raise;
      end;
    end;
  finally
    freeandnil(qry);
  end;
end;

Function TModelCampanha.TotalVotosNulos:Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  sqlQuery := 'Select                   '+
                   ' count(*) as total      '+
                   ' from votos v           '+
                   ' inner join chapa c     '+
                   ' on v.voto = c.id_chapa '+
                   ' where v.token= :token  '+
                   ' and c.nome=''NULO''';
  Qry := TUniQuery.Create(nil);

  try
    try
      if dm.Conn.Connected then
      begin
        Qry.Connection := dm.Conn;
        Qry.SQL.Text := sqlQuery;
        Qry.Params.ParamByName('token').AsString      := token;
        Qry.Open;

        if not Qry.IsEmpty then
        begin
          if dm.TabTotalVotoNulo.Active then
          begin
            dm.TabTotalVotoNulo.Close; // Feche o dataset se estiver ativo
          end;

          Dm.TabTotalVotoNulo.DisableControls;
          if dm.TabTotalVotoNulo.eof then
          begin
            dm.TabTotalVotoNulo.fieldDefs.clear;
            dm.TabTotalVotoNulo.FieldDefs.Add('total', ftInteger);

            dm.TabTotalVotoNulo.createdataset;
          end
          else
          begin
            dm.TabTotalVotoNulo.EmptyDataSet;
          end;

          while not Qry.Eof do
          begin
            dm.TabTotalVotoNulo.Append;
            dm.TabTotalVotoNulo.FieldByName('total').Value      :=  Qry.FieldByName('total').Value;
            dm.TabTotalVotoNulo.Post;
            Qry.Next;
          end;

          dm.TabTotalVotoNulo.EnableControls;
          dm.TabTotalVotoNulo.First;
          Result := True;

        end
        else

        Qry.Close;
      end
      else
      begin
        raise Exception.Create('Falha na conexão com o banco de dados.');
      end;

    except
      on E: Exception do
      begin
        //msg := 'Erro ao executar consulta: ' + E.Message;
        raise;
      end;
    end;
  finally
    freeandnil(qry);
  end;
end;

Function TModelCampanha.TotalVotosDepartamento:Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  sqlQuery := 'SELECT e.razao AS Departamento, COUNT(v.id_associado) AS Total_Votos '+
                  ' FROM votos v                                                           '+
                  ' JOIN socio s                                                           '+
                  ' ON v.id_associado = s.id_socio                                         '+
                  ' join secretaria e                                                      '+
                  ' on s.escritorio = e.id_secretaria                                      '+
                  ' where v.token= :token'+
                  ' GROUP BY s.escritorio                                                  '+
                  ' ORDER BY Total_Votos DESC';
  Qry := TUniQuery.Create(nil);

  try
    try
      if dm.Conn.Connected then
      begin
        Qry.Connection := dm.Conn;
        Qry.SQL.Text := sqlQuery;
        Qry.Params.ParamByName('token').AsString      := token;
        Qry.Open;

        if not Qry.IsEmpty then
        begin
          if dm.TabTotalVotoDepartamento.Active then
          begin
            dm.TabTotalVotoDepartamento.Close; // Feche o dataset se estiver ativo
          end;

          Dm.TabTotalVotoDepartamento.DisableControls;
          if dm.TabTotalVotoDepartamento.eof then
          begin
            dm.TabTotalVotoDepartamento.fieldDefs.clear;
            dm.TabTotalVotoDepartamento.FieldDefs.Add('Departamento', ftString,100);
            dm.TabTotalVotoDepartamento.FieldDefs.Add('Total_Votos', ftInteger);
            dm.TabTotalVotoDepartamento.createdataset;
          end
          else
          begin
            dm.TabTotalVotoDepartamento.EmptyDataSet;
          end;

          while not Qry.Eof do
          begin
            dm.TabTotalVotoDepartamento.Append;
            dm.TabTotalVotoDepartamento.FieldByName('Departamento').Value      :=  Qry.FieldByName('Departamento').Value;
            dm.TabTotalVotoDepartamento.FieldByName('Total_Votos').Value      :=  Qry.FieldByName('Total_Votos').Value;
            dm.TabTotalVotoDepartamento.Post;
            Qry.Next;
          end;

          dm.TabTotalVotoDepartamento.EnableControls;
          dm.TabTotalVotoDepartamento.First;
          Result := True;

        end
        else

        Qry.Close;
      end
      else
      begin
        raise Exception.Create('Falha na conexão com o banco de dados.');
      end;

    except
      on E: Exception do
      begin
        //msg := 'Erro ao executar consulta: ' + E.Message;
        raise;
      end;
    end;
  finally
    freeandnil(qry);
  end;
end;

Function TModelCampanha.TotalAssociadoNaoVotaram:Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  sqlQuery := 'SELECT (COUNT(*) -1) AS total               '+
                   ' FROM socio s                                     '+
                   ' LEFT JOIN votos v ON s.id_socio = v.id_associado '+
                   ' WHERE s.situacao = ''S'' AND v.id_associado IS NULL';
  Qry := TUniQuery.Create(nil);

  try
    try
      if dm.Conn.Connected then
      begin
        Qry.Connection := dm.Conn;
        Qry.SQL.Text := sqlQuery;

        Qry.Open;

        if not Qry.IsEmpty then
        begin
          if dm.TabNaoVotaram.Active then
          begin
            dm.TabNaoVotaram.Close; // Feche o dataset se estiver ativo
          end;

          Dm.TabNaoVotaram.DisableControls;
          if dm.TabNaoVotaram.eof then
          begin
            dm.TabNaoVotaram.fieldDefs.clear;
            dm.TabNaoVotaram.FieldDefs.Add('total', ftInteger);

            dm.TabNaoVotaram.createdataset;
          end
          else
          begin
            dm.TabNaoVotaram.EmptyDataSet;
          end;

          while not Qry.Eof do
          begin
            dm.TabNaoVotaram.Append;
            dm.TabNaoVotaram.FieldByName('total').Value      :=  Qry.FieldByName('total').Value;
            dm.TabNaoVotaram.Post;
            Qry.Next;
          end;

          dm.TabNaoVotaram.EnableControls;
          dm.TabNaoVotaram.First;
          Result := True;

        end
        else

        Qry.Close;
      end
      else
      begin
        raise Exception.Create('Falha na conexão com o banco de dados.');
      end;

    except
      on E: Exception do
      begin
        //msg := 'Erro ao executar consulta: ' + E.Message;
        raise;
      end;
    end;
  finally
    Freeandnil(qry);
  end;
end;


{$ENDREGION}

{$REGION 'ATA'}




{$ENDREGION}
end.
