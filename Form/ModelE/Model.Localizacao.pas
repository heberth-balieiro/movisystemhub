unit Model.Localizacao;

interface

Uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('localizacao')]
  TModelLocalizacao = class

  Private
    Fdata_alteracao: tdate;
    Fativo: string;
    Fdata_cadastro: TDate;
    Fcodigo: integer;
    Fdata_excluido: Tdate;
    Flocalizacao: String;
    Fid_localizacao: Integer;
    Fid_empresa: integer;
    Fid_usuario_exc: integer;
    Fexcluido: integer;
    Fid_usuario_alt: integer;
    Fid_usuario: integer;

  public
    [FieldName('id_localizacao', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    Property id_localizacao  :Integer  read  Fid_localizacao write Fid_localizacao;

    [FieldName('codigo')]
    [FieldOptions([foInsert,foSelect])]
    Property codigo :integer  read  Fcodigo write Fcodigo;

    [FieldName('localizacao')]
    [FieldOptions([foInsert,foUpdate,foSelect])]
    Property localizacao  :String read  Flocalizacao  write Flocalizacao;

    [FieldName('ativo')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    Property ativo  :string read  Fativo  write Fativo;

    [FieldName('data_cadastro')]
    [FieldOptions([foInsert])]
    Property data_cadastro  :TDate  read  Fdata_cadastro  write Fdata_cadastro;

    [FieldName('data_alteracao')]
    [FieldOptions([foUpdate])]
    Property data_alteracao :tdate  read  Fdata_alteracao write Fdata_alteracao;

    [FieldName('excluido')]
    [FieldOptions([foinsert,foupdate])]
    Property excluido :integer  read  Fexcluido write Fexcluido;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert])]
    Property id_empresa : integer read  Fid_empresa write Fid_empresa;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert])]
    Property id_usuario :integer  read  Fid_usuario write Fid_usuario;

    [FieldName('data_excluido')]
    [FieldOptions([foupdate])]
    Property data_excluido  :Tdate  read  Fdata_excluido  write Fdata_excluido;

    [FieldName('id_usuario_exc')]
    [FieldOptions([foUpdate])]
    Property id_usuario_exc :integer  read  Fid_usuario_exc write Fid_usuario_exc;

    [FieldName('id_usuario_alt')]
    [FieldOptions([foupdate])]
    Property id_usuario_alt :integer  read  Fid_usuario_alt write Fid_usuario_alt;


  End;

implementation





{
destructor TModelLocalizacao.Destroy;
begin
  if Assigned(FTransacao) then
    FreeAndNil(FTransacao);

  inherited Destroy;
end;

constructor TModelLocalizacao.Create;
begin
inherited Create;

  FTransacao                    := TUniTransaction.Create(nil);
  FTransacao.DefaultConnection  := dm.Conn;

end;

Function TModelLocalizacao.GerarId(tab, campo:string):integer;
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

Function TModelLocalizacao.Insert(out msg:String):Boolean;
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
      sqlQuery := 'Insert Into localizacao (id_localizacao, codigo, localizacao, ativo, data_cadastro, excluido, id_empresa, id_usuario)'+
                  ' Values'+
                  '(:1,:2,:3,:4,:5,:6,:7,:8)';
      With Qry do
      begin
        Close;
        Sql.clear;
        Qry.SQL.Text := sqlQuery;

        idGerado                        := GerarId('localizacao', 'id_localizacao');
        Qry.ParamByName('1').AsInteger  := idgerado;
        Qry.ParamByName('2').Asinteger  := GerarId('localizacao', 'codigo');
        Qry.ParamByName('3').AsString   := Trim(local);
        Qry.ParamByName('4').AsString   := Trim(inativo);
        Qry.ParamByName('5').AsDateTime := now;
        Qry.ParamByName('6').AsInteger  := 0;
        Qry.ParamByName('7').AsInteger  := idempresa;
        Qry.ParamByName('8').AsInteger  := idusuario;

        execsql;

        msg     := 'Registro realizado com sucesso';
        Result  := True;
        FTransacao.Commit;
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

Function TModelLocalizacao.Update(out msg:string):Boolean;
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
      sqlQuery := 'Update localizacao set ' +
                  ' localizacao= :local,'+
                  ' ativo= :inativo'+
                  ' WHERE id_localizacao = :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      // Definindo parâmetros
      Qry.ParamByName('id').AsInteger       := idlocalizacao;
      Qry.ParamByName('local').AsString     := Trim(local);
      Qry.ParamByName('inativo').AsString   := inativo;
      
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

Function TModelLocalizacao.Delete(out msg:string):Boolean;
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
      sqlQuery := 'Delete from localizacao where id_localizacao= :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      // Definindo parâmetro
      Qry.ParamByName('id').AsInteger    := idlocalizacao;

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

Function TModelLocalizacao.Select(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.Conn;
      sqlQuery := 'SELECT id_localizacao, codigo, localizacao, ativo FROM localizacao WHERE ID_localizacao= :ID';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger  := idlocalizacao;

      Qry.Open;
      if not Qry.IsEmpty then
      begin

        IdLocalizacao    := Qry.Fieldbyname('id_localizacao').AsInteger;
        codigo     := Qry.Fieldbyname('codigo').AsInteger;
        local      := Qry.Fieldbyname('localizacao').AsString;
        inativo    := Qry.Fieldbyname('ativo').AsString;


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

Function TModelLocalizacao.Pesquisa(out msg:string;Filtro:String;TabInativo:integer):Boolean;
var
  Qry     :TUniquery;
  sqlQuery,filtroQuery,FiltroInativo:String;
begin
  Result                := False;

  Qry                   := TUniQuery.Create(nil);
  try
    try
      Qry.Connection    := dm.Conn;

      sqlQuery          := 'SELECT ID_localizacao, CODIGO, localizacao, ativo'+
                           ' FROM localizacao WHERE ID_localizacao > 0';

      case TabInativo of
        1:FiltroInativo      := FiltroInativo + ' and ativo=''S''';
        2:FiltroInativo      := FiltroInativo + ' and ativo=''N''';
      end;

      if Filtro <> '' then
      begin
        filtroQuery   := ' and (codigo like :filtro or localizacao like :filtro)';
        sqlQuery      := sqlQuery + FiltroInativo+  FiltroQuery;
      end
      else
      sqlQuery  := sqlQuery +FiltroInativo;


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

        if dm.TabConsLocalizacao.Active then
        begin
          dm.TabConsLocalizacao.Close; // Feche o dataset se estiver ativo
        end;

        dm.TabConsLocalizacao.disablecontrols;

        if dm.TabConsLocalizacao.eof then
        begin
          dm.TabConsLocalizacao.fieldDefs.clear;

          dm.TabConsLocalizacao.FieldDefs.Add('ID_localizacao',   ftInteger);
          dm.TabConsLocalizacao.FieldDefs.Add('CODIGO',   ftInteger);
          dm.TabConsLocalizacao.FieldDefs.Add('localizacao',   ftstring,60);
          dm.TabConsLocalizacao.FieldDefs.Add('ativo',   ftstring,6);

          dm.TabConsLocalizacao.createdataset;
        end
        else
        begin
          dm.TabConsLocalizacao.EmptyDataSet;
        end;

        while not Qry.Eof do
        begin
          dm.TabConsLocalizacao.Append;

          dm.TabConsLocalizacao.FieldByName('ID_localizacao').Value       :=  Qry.FieldByName('ID_localizacao').Value;
          dm.TabConsLocalizacao.FieldByName('CODIGO').Value       :=  Qry.FieldByName('CODIGO').Value;
          dm.TabConsLocalizacao.FieldByName('localizacao').Value       :=  Qry.FieldByName('localizacao').Value;
          dm.TabConsLocalizacao.FieldByName('ativo').Value       :=  Qry.FieldByName('ativo').Value;

          dm.TabConsLocalizacao.Post;
          Qry.Next;
        end;
        dm.TabConsLocalizacao.First;
        dm.TabConsLocalizacao.EnableControls;
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
}
end.
