unit Model.Grupo;

interface

Uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('grupo')]
  TModelGrupo = class

  Private
    Fid_grupo: integer;
    Fdata_alteracao: tdate;
    Fativo: string;
    Fdata_cadastro: tdate;
    Fcodigo: integer;
    Fplaca_obrigatoria: string;
    Fdata_excluido: Tdate;
    Fid_empresa: integer;
    Fid_usuario_exc: integer;
    Ftipo: String;
    Fexcluido: integer;
    Fid_usuario_alt: integer;
    Fid_usuario: integer;
    Fgrupo: string;

  public
    [FieldName('id_grupo', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_grupo           :integer  read  Fid_grupo           write Fid_grupo;

    [FieldName('codigo')]
    [FieldOptions([foInsert,foSelect])]
    property codigo             :integer  read  Fcodigo             write Fcodigo;

    [FieldName('grupo')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property grupo              :string   read  Fgrupo              write Fgrupo;

    [FieldName('ativo')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ativo              :string   read  Fativo              write Fativo;

    [FieldName('data_cadastro')]
    [FieldOptions([foInsert])]
    property data_cadastro      :tdate    read  Fdata_cadastro      write Fdata_cadastro;

    [FieldName('data_alteracao')]
    [FieldOptions([foupdate])]
    property data_alteracao     :tdate    read  Fdata_alteracao     write fdata_alteracao;

    [FieldName('excluido')]
    [FieldOptions([foInsert])]
    property excluido           :integer  read  Fexcluido           write fexcluido;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert])]
    property id_empresa         :integer  read  Fid_empresa         write Fid_empresa;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert])]
    property id_usuario         :integer  read  Fid_usuario         write Fid_usuario;

    [FieldName('tipo')]
    [FieldOptions([foInsert,foSelect])]
    property tipo               :String   read  Ftipo               write ftipo;

    [FieldName('placa_obrigatorio')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property placa_obrigatoria  :string   read  Fplaca_obrigatoria  write Fplaca_obrigatoria;

    [FieldName('id_usuario_alt')]
    [FieldOptions([foUpdate])]
    property id_usuario_alt     :integer  read  Fid_usuario_alt     write Fid_usuario_alt;

    [FieldName('data_excluido')]
    [FieldOptions([foUpdate])]
    property data_excluido      :Tdate    read  Fdata_excluido      write Fdata_excluido;

    [FieldName('id_usuario_exc')]
    [FieldOptions([foUpdate])]
    property id_usuario_exc     :integer  read  Fid_usuario_exc     write Fid_usuario_exc;

  End;

implementation
{
uses
  System.Math, cxControls;

destructor TModelGrupo.Destroy;
begin
  Try
    if Assigned(FTransacao) then
    FreeAndNil(FTransacao);


  except
    on E: Exception do
      raise Exception.Create('Erro ao liberar recursos: ' + E.Message);
  end;
  inherited Destroy;
end;

constructor TModelGrupo.Create;
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

Function TModelGrupo.GerarId(tab, campo:string):integer;
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

Function TModelgrupo.Insert(out msg:String;out id:integer):Boolean;
var
Qry       : TUniquery;
sqlQuery  : string;
idGerado  : Integer;
begin
  Result  := False;
  Qry     := TUniquery.create(nil);

  Try
    Try
      Qry.Connection := dm.Conn;
      sqlQuery := 'Insert Into grupo (id_grupo, codigo, grupo, ativo, data_cadastro, excluido, id_empresa, id_usuario, tipo, placa_obrigatorio)'+
                  ' Values'+
                  '(:1,:2,:3,:4,:5,:6,:7,:8,:9, :10)';
      With Qry do
      begin
        Close;
        Sql.clear;
        Qry.SQL.Text := sqlQuery;
        IniciarTransacao;
        idGerado                        := GerarId('grupo', 'id_grupo');
        id:= idgerado;
        Qry.ParamByName('1').AsInteger  := idgerado;
        Qry.ParamByName('2').Asinteger  := GerarId('grupo', 'codigo');
        Qry.ParamByName('3').AsString   := Trim(grupo);
        Qry.ParamByName('4').AsString   := Trim(inativo);
        Qry.ParamByName('5').AsDateTime := now;
        Qry.ParamByName('6').AsInteger  := 0;
        Qry.ParamByName('7').AsInteger  := idempresa;
        Qry.ParamByName('8').AsInteger  := idusuario;
        Qry.ParamByName('9').AsString   := tipo;
        qry.ParamByName('10').AsString  := placa;

        Try
          Qry.ExecSQL;
          ConfirmarTransacao;
          result  := true;
          msg     := 'Registro realizado com sucesso';
        Except on e:exception do
          begin
            DesfazerTransacao;
            raise Exception.Create('Erro ao inserir tipo: ' + e.Message);
          end;
        end;

      end;

    Except on e:exception do
      begin
        DesfazerTransacao;
        msg := 'Erro ao inserir:' +e.message;
        raise;
      end;
    End;

  Finally
    FreeandNil(Qry);
  End;
end;

Function TModelgrupo.Update(out msg:string):Boolean;
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
      sqlQuery := 'Update grupo set ' +
                  ' grupo= :grupo,'+
                  ' ativo= :inativo,'+
                  ' placa_obrigatorio= :placa'+
                  ' WHERE id_grupo = :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      IniciarTransacao;
      Qry.ParamByName('id').AsInteger       := idgrupo;
      Qry.ParamByName('grupo').AsString     := Trim(grupo);
      Qry.ParamByName('inativo').AsString   := inativo;
      Qry.ParamByName('placa').AsString     := placa;
      
      Try
          Qry.ExecSQL;
          ConfirmarTransacao;
          result  := true;
         msg := 'Registro atualizado com sucesso';
        Except on e:exception do
          begin
            DesfazerTransacao;
            raise Exception.Create('Erro ao atualizar tipo: ' + e.Message);
          end;
        end;
    except
      on E: Exception do
      begin
        DesfazerTransacao;
        msg := 'Erro ao atualizar: ' + E.Message;
        raise;
      end;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

Function TModelgrupo.Delete(out msg:string):Boolean;
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
      sqlQuery := 'Delete from grupo where id_grupo= :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      IniciarTransacao;
      Qry.ParamByName('id').AsInteger    := idgrupo;

      //if DeleteCandidato(msg) then
      Try
          Qry.ExecSQL;
          ConfirmarTransacao;
          result  := true;
          msg := 'Registro deletado com sucesso';
        Except on e:exception do
          begin
            DesfazerTransacao;
            raise Exception.Create('Erro ao inserir tipo: ' + e.Message);
          end;
        end;

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
        DesfazerTransacao;
        msg := 'Erro ao deletar: ' + E.Message;
        raise;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

Function TModelgrupo.Select(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.Conn;
      sqlQuery := 'SELECT id_grupo, codigo, grupo, ativo, placa_obrigatorio FROM grupo WHERE ID_grupo= :ID';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger  := idgrupo;

      Qry.Open;
      if not Qry.IsEmpty then
      begin

        IdGrupo    := Qry.Fieldbyname('id_grupo').AsInteger;
        codigo     := Qry.Fieldbyname('codigo').AsInteger;
        grupo      := Qry.Fieldbyname('grupo').AsString;
        inativo    := Qry.Fieldbyname('ativo').AsString;
        placa      := Qry.FieldByName('placa_obrigatorio').AsString;

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

Function TModelgrupo.Pesquisa(out msg:string;filtro:string;TabInativo:integer; tipo:string):Boolean;
var
  Qry     :TUniquery;
  sqlQuery, filtroquery,FiltroInativo, sqlTipo:string;
begin
  Result                := False;
  sqlQuery          := 'SELECT ID_grupo, CODIGO, grupo, case when ativo=''S'' then ''SIM'' else ''NÃO'' end as ativo, tipo, placa_obrigatorio'+
                           ' FROM grupo WHERE ID_grupo > 0';

  case TabInativo of
    1:FiltroInativo      := FiltroInativo + ' and ativo=''S''';
    2:FiltroInativo      := FiltroInativo + ' and ativo=''N''';
  end;

  if tipo = 'V' then
    sqlTipo     := ' and tipo = ''V'''
  else
    SqlTipo     := ' and tipo = ''G''';

  if filtro <> '' then
  begin
    filtroquery   := ' and (codigo like :filtro or grupo like :filtro)';
    sqlQuery  := sqlQuery + FiltroInativo + filtroquery + SqlTipo;
  end
  else
  sqlQuery  := sqlQuery +FiltroInativo + SqlTipo;

  Qry                   := TUniQuery.Create(nil);
  try
    try
      Qry.Connection    := dm.Conn;
      Qry.Params.Clear;
      Qry.SQL.Text := SqlQuery;

      if Filtro <> '' then
      qry.ParamByName('filtro').Value := '%' + filtro + '%';

      Qry.Open;
      Qry.First;

      if not Qry.IsEmpty then
      begin
        //criar campo na tebela temporaria
        dm.TabConsgrupo.disablecontrols;

        dm.TabConsgrupo.EmptyDataSet;
        dm.TabConsgrupo.Open;

        while not Qry.Eof do
        begin
          dm.TabConsgrupo.Append;

          dm.TabConsgrupo.FieldByName('ID_grupo').Value   :=  Qry.FieldByName('id_grupo').Value;
          dm.TabConsgrupo.FieldByName('CODIGO').Value     :=  Qry.FieldByName('codigo').Value;
          dm.TabConsgrupo.FieldByName('grupo').Value      :=  Qry.FieldByName('grupo').Value;
          dm.TabConsgrupo.FieldByName('ativo').Value      :=  Qry.FieldByName('ativo').Value;
          dm.TabConsgrupo.FieldByName('tipo').Value       :=  Qry.FieldByName('tipo').Value;

          dm.TabConsgrupo.Post;
          Qry.Next;
        end;
        dm.TabConsgrupo.First;
        dm.TabConsgrupo.EnableControls;
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


function TModelGrupo.PesquisaTipoVeiculo(out msg: string;
  filtro: string): Boolean;
  var
  isNumeric: Integer;
  begin
  Result  := False;
  // Definir se a pesquisa será por ID ou Nome
   dm.TabConsgrupo.Filtered  := False;
   if TryStrToInt(filtro, isNumeric) then
      dm.TabConsgrupo.Filter := 'codigo = ' + Quotedstr(Filtro)  // Se for número, pesquisa por ID
    else
      dm.TabConsgrupo.Filter := 'grupo like '+Quotedstr('%'+Filtro+'%');  // Caso contrário, pesquisa por Nome

    // Realiza a pesquisa no ClientDataSet
    dm.TabConsgrupo.Filtered  := True;

    if dm.TabConsgrupo.RecordCount > 0  then
    begin
      msg := 'Registro encontrado';
      result  := true;
    end
    else
    msg:= 'Registro não encontrado!';


end;

{$REGION 'Transações'}

{procedure TModelgrupo.IniciarTransacao;
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

procedure TModelgrupo.ConfirmarTransacao;
begin
  try
    if Assigned(FTransacao) and FTransacao.Active then
      FTransacao.Commit;
  except
    on E: Exception do
      raise Exception.Create('Erro ao confirmar transação: ' + E.Message);
  end;
end;

procedure TModelgrupo.DesfazerTransacao;
begin
  try
    if Assigned(FTransacao) and FTransacao.Active then
      FTransacao.Rollback;
  except
    on E: Exception do
      raise Exception.Create('Erro ao desfazer transação: ' + E.Message);
  end;
end;

{$ENDREGION}


end.
