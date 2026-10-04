unit Model.Candidato;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TModelCandidato = Class

  Private
    FTransacao: TUniTransaction;
    Fidempresa: integer;
    Fdescricao: string;
    Fcodigo: integer;
    Fidcandidato: integer;
    Fcpf: string;
    Finativo: String;
    Ffoto: String;
    Fcargo: string;
    Fnome: string;
    function TabelaVinculo: Boolean;


  public
    constructor Create;
    destructor Destroy; override;

    property idcandidato  :integer  read Fidcandidato write Fidcandidato;
    property codigo       :integer  read Fcodigo      write Fcodigo;
    property nome         :string   read Fnome        write Fnome;
    property cargo        :string   read Fcargo       write Fcargo;
    property cpf          :string   read Fcpf         write Fcpf;
    property descricao    :string   read Fdescricao    write Fdescricao;
    property idempresa    :integer  read Fidempresa   write Fidempresa;
    property foto         :String   read Ffoto        write Ffoto;
    property inativo      :String   read Finativo     write Finativo;


    Function Insert(out msg:String):Boolean;
    Function Update(out msg:string):Boolean;
    Function Delete(out msg:string):Boolean;
    Function Select(out msg:string):Boolean;
    Function GerarId(tab, campo:string):integer;
    Function Pesquisa(out msg:string):Boolean;
    function ValidarRegistro(out msg: string): boolean;
    function PopularDataSetFiltragem(out msg: string; Filtro: String;TabAtivo:Integer): Boolean;

  End;


implementation

uses
  System.Math;

destructor TModelCandidato.Destroy;
begin
  if Assigned(FTransacao) then
    FreeAndNil(FTransacao);

  inherited Destroy;
end;

constructor TModelCandidato.Create;
begin
inherited Create;

  FTransacao                    := TUniTransaction.Create(nil);
  FTransacao.DefaultConnection  := dm.Conn;

end;

Function TModelCandidato.GerarId(tab, campo:string):integer;
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
      end
      else
      begin
        raise Exception.Create('Falha na conexão com o banco de dados.');
      end;

    Except on e:exception do
      raise Exception.Create('Erro ao gerar ID:' + e.message);
    End;

  Finally
    Qry.free;
  End;
end;

Function TModelCandidato.Insert(out msg:String):Boolean;
var
Qry       : TUniquery;
sqlQuery  : string;
idGerado  : Integer;
begin
  Result  := False;
  sqlQuery := 'Insert Into candidato (id_candidato, codigo, nome, cargo, cpf, descricao, id_empresa, foto, inativo, sinc_app)'+
                  ' Values'+
                  '(:idcandidato, :codigo, :nome, :cargo, :cpf, :descricao, :idempresa, :foto, :inativo,''S'')';
  Qry     := TUniquery.create(nil);
  Try
    Try
      if dm.Conn.Connected then
      begin
        Qry.Connection := dm.Conn;
        With Qry do
        begin
          Qry.SQL.Text := sqlQuery;
          FTransacao.StartTransaction;
          idGerado                                := GerarId('candidato', 'id_candidato');
          Qry.ParamByName('idcandidato').AsInteger:= idgerado;
          Qry.ParamByName('codigo').Asinteger     := GerarId('candidato', 'codigo');
          Qry.ParamByName('nome').AsString        := Trim(nome);
          Qry.ParamByName('cargo').AsString       := Trim(cargo);
          Qry.ParamByName('cpf').Asstring         := cpf;
          Qry.ParamByName('descricao').AsString   := Trim(descricao);
          Qry.ParamByName('idempresa').Asinteger  := idempresa;
          Qry.ParamByName('foto').AsString        := foto;
          Qry.ParamByName('inativo').AsString	    := inativo;

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
    Qry.free;
  End;
end;

Function TModelCandidato.Update(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  sqlQuery := 'UPDATE CANDIDATO SET ' +
                  ' nome= :nome,'+
                  ' cargo= :cargo,'+
                  ' cpf= :cpf,'+
                  ' descricao = :descricao, ' +
                  ' foto= :foto,'+
                  ' inativo = :inativo,'+
                  ' sinc_app= ''S'''+
                  ' WHERE id_candidato = :idcandidato';
  Qry := TUniQuery.Create(nil);
  try
    try
      if dm.Conn.Connected then
      begin
        Qry.Connection := dm.Conn;
        Qry.SQL.Text := sqlQuery;
        // Definindo parâmetros
        Qry.ParamByName('idcandidato').AsInteger  := idcandidato;
        Qry.ParamByName('nome').AsString          := Trim(nome);
        Qry.ParamByName('cargo').AsString         := Trim(cargo);
        Qry.ParamByName('cpf').AsString           := Trim(cpf);
        Qry.ParamByName('descricao').AsString     := Trim(descricao);
        Qry.ParamByName('foto').AsString          := Trim(foto);
        Qry.ParamByName('inativo').AsString       := inativo;

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
    Qry.Free;
  end;
end;

Function TModelCandidato.Delete(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  sqlQuery := 'DELETE FROM CANDIDATO WHERE ID_CANDIDATO = :id';
  //Verificar vinculo
  if TabelaVinculo then
  begin
    msg := 'Candidato vinculado há uma chapa! Verifique.';
    result  := False;
    Exit;
  end;

  Qry := TUniQuery.Create(nil);
  try
    try
      if dm.Conn.Connected then
      begin
        Qry.Connection := dm.Conn;
        Qry.SQL.Text := sqlQuery;
        // Definindo parâmetro
        Qry.ParamByName('id').AsInteger    := idcandidato;

        //if DeleteCandidato(msg) then
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
    Qry.Free;
  end;
end;

Function TModelCandidato.Select(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  sqlQuery := 'SELECT * FROM CANDIDATO WHERE ID_CANDIDATO= :ID';

  try
    try
      if dm.Conn.Connected then
      begin
        Qry.Connection := dm.Conn;
        Qry.SQL.Text := sqlQuery;
        Qry.Params.ParamByName('id').AsInteger  := idcandidato;

        Qry.Open;
        if not Qry.IsEmpty then
        begin

          Idcandidato  := Qry.Fieldbyname('id_candidato').AsInteger;
          codigo       := Qry.Fieldbyname('codigo').AsInteger;
          nome         := Qry.Fieldbyname('nome').AsString;
          cargo        := Qry.Fieldbyname('cargo').AsString;
          cpf          := Qry.Fieldbyname('cpf').AsString;
          descricao    := Qry.Fieldbyname('descricao').AsString;
          foto         := Qry.Fieldbyname('foto').AsString;
          inativo      := Qry.Fieldbyname('inativo').AsString;

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
    Qry.Free;
  end;
end;

Function TModelCandidato.Pesquisa(out msg:string):Boolean;
var
  Qry     :TUniquery;
  sqlQuery :string;
  I:integer;
begin
  Result                := False;
  sqlQuery          := 'SELECT ID_CANDIDATO, CODIGO, NOME, CARGO, CPF, DESCRICAO, INATIVO'+
                           ' FROM CANDIDATO WHERE ID_CANDIDATO > 0';
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
          if dm.TabConsCandidatos.eof then
          begin
            dm.TabConsCandidatos.fieldDefs.clear;
            dm.TabConsCandidatos.fieldDefs.assign(Qry.FieldDefs);
            dm.TabConsCandidatos.createdataset;
          end
          else
          begin
            dm.TabConsCandidatos.EmptyDataSet;
          end;

          while not Qry.Eof do
          begin
            dm.TabConsCandidatos.Append;
            for I := 0 to Qry.FieldCount - 1 do
            begin
              dm.TabConsCandidatos.Fields[I].Value := Qry.Fields[I].Value;
            end;

            dm.TabConsCandidatos.Post;
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
    Qry.Free;
  end;
end;

Function TModelCandidato.ValidarRegistro(out msg:string):boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  sqlQuery := 'SELECT 1 FROM CANDIDATO WHERE cpf= :cpf';
  Qry := TUniQuery.Create(nil);
  try
    try
      if dm.Conn.Connected then
      begin
        Qry.Connection := dm.Conn;
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
    Qry.Free;
  end;
end;

Function TModelCandidato.PopularDataSetFiltragem(out msg:string; Filtro:String;TabAtivo:Integer):Boolean;
var
  Qry     :TUniquery;
  sqlQuery,FiltroQuery :String;
  FiltroAtivo  :string;
begin
  Result                := False;
  sqlQuery          := 'Select id_candidato, codigo, nome, cargo, cpf, descricao,'+
                            ' case' +
                            ' when inativo=''S'' then ''SIM'' '+
                            ' else '+
                            ' ''NÃO'''+
                            ' end as inativo'+
                            ' from candidato where id_candidato >0';
  Qry                   := TUniQuery.Create(nil);
  try
    try
      if dm.Conn.Connected then
      begin
        Qry.Connection    := dm.Conn;



        case TabAtivo of
          1: FiltroAtivo   := ' and inativo=''S'' ';
          2: FiltroAtivo   := ' and inativo=''N'' ';
        end;

        if Filtro <> '' then
        begin
          FiltroQuery :=  ' and (codigo like :filtro or'+
                                ' nome like :filtro or'+
                                ' cargo like :filtro or'+
                                ' cpf like :filtro)';

          SqlQuery  := SqlQuery + FiltroAtivo +FiltroQuery;

        end
        else
        SqlQuery  := sqlQuery +FiltroAtivo;

        Qry.Close;
        Qry.SQL.Clear;
        Qry.SQL.Text := SqlQuery;

        if Filtro <> '' then
        qry.ParamByName('filtro').Value := '%' + filtro + '%';

        Qry.Open;
        Qry.First;

        if not Qry.IsEmpty then
        begin
          //criar campo na tebela temporaria
          if dm.TabConsCandidatos.Active then
          begin
            dm.TabConsCandidatos.Close; // Feche o dataset se estiver ativo
          end;

          dm.TabConsCandidatos.DisableControls;
          if dm.TabConsCandidatos.eof then
          begin
            dm.TabConsCandidatos.fieldDefs.clear;

            dm.TabConsCandidatos.FieldDefs.Add('id_candidato',ftInteger);
            dm.TabConsCandidatos.FieldDefs.Add('codigo',      ftInteger);
            dm.TabConsCandidatos.FieldDefs.Add('nome',        ftString,190);
            dm.TabConsCandidatos.FieldDefs.Add('cargo',       ftString,90);
            dm.TabConsCandidatos.FieldDefs.Add('cpf',         ftString,20);
            dm.TabConsCandidatos.FieldDefs.Add('descricao',   ftString,190);
            dm.TabConsCandidatos.FieldDefs.Add('inativo',     ftString,4);

            dm.TabConsCandidatos.createdataset;
          end
          else
          begin
            dm.TabConsCandidatos.EmptyDataSet;
          end;

          while not Qry.Eof do
          begin
            dm.TabConsCandidatos.Append;

            dm.TabConsCandidatos.FieldByName('id_candidato').Value  :=  Qry.FieldByName('id_candidato').Value;
            dm.TabConsCandidatos.FieldByName('codigo').Value        :=  Qry.FieldByName('codigo').Value;
            dm.TabConsCandidatos.FieldByName('nome').Value          :=  Qry.FieldByName('nome').Value;
            dm.TabConsCandidatos.FieldByName('cargo').Value         :=  Qry.FieldByName('cargo').Value;
            dm.TabConsCandidatos.FieldByName('cpf').Value           :=  Qry.FieldByName('cpf').Value;
            dm.TabConsCandidatos.FieldByName('descricao').Value     :=  Qry.FieldByName('descricao').Value;
            dm.TabConsCandidatos.FieldByName('inativo').Value       :=  Qry.FieldByName('inativo').Value;


            dm.TabConsCandidatos.Post;
            Qry.Next;
          end;
          dm.TabConsCandidatos.EnableControls;
          dm.TabConsCandidatos.First;
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
    Qry.Free;
  end;
end;

Function TModelCandidato.TabelaVinculo:Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
   sqlQuery := 'Select Count(*) as id from chapa where id_candidato= :id';
  Qry := TUniQuery.Create(nil);
  try
    try
      if dm.Conn.Connected then
      begin
        Qry.Connection := dm.Conn;
        Qry.SQL.Text := sqlQuery;
        Qry.Params.ParamByName('id').AsInteger  := idcandidato;

        Qry.Open;
        if Qry.Fields[0].AsInteger > 0 then
        begin
          Result := True;
        end
        else
          Result  := false;

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
    Qry.Free;
  end;
end;

end.
