unit Model.Perfil;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,

  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TModelPerfil = Class

  Private
    FTransacao: TUniTransaction;
    Fidempresa: integer;
    Fdescricao: string;
    Fcodigo: integer;
    Fsistema: integer;
    Finativo: string;
    Fidperfil: integer;
    Fidnivel: integer;
    Fliberado: string;
    

    Function DeleteNivel(out msg:string):Boolean;


  public
    constructor Create;
    destructor Destroy; override;
    Function InserirNivel(out msg:String; id:integer):Boolean;
    property idperfil     :integer  read Fidperfil    write Fidperfil;
    property codigo       :integer  read Fcodigo      write Fcodigo;
    property descricao    :string   read Fdescricao   write Fdescricao;
    property inativo      :string   read Finativo     write Finativo;
    property idempresa    :integer  read Fidempresa   write Fidempresa;
    property sistema      :integer   read Fsistema     write Fsistema;
    property idnivel      :integer  read Fidnivel     write Fidnivel;
    property liberado     :string   read Fliberado    write Fliberado;

    Function Insert(out msg:String;out id:integer):Boolean;
    Function Update(out msg:string):Boolean;
    Function Delete(out msg:string):Boolean;
    Function Select(out msg:string):Boolean;
    Function GerarId(tab, campo:string):integer;
    Function Pesquisa(out msg:string; Par1,Par2, Par3:String):Boolean;
    function SelectPermissoes(out msg: string): Boolean;
    function UpdateNivel(out msg: string): boolean;
    function InserirTela(modulo,tela, descricao: String): Boolean;

  End;

implementation

uses
  System.Math;

destructor TModelPerfil.Destroy;
begin
  if Assigned(FTransacao) then
    FreeAndNil(FTransacao);

  inherited Destroy;
end;

constructor TModelPerfil.Create;
begin
inherited Create;

  FTransacao                    := TUniTransaction.Create(nil);
  FTransacao.DefaultConnection  := dm.Conn;

end;

Function TModelPerfil.GerarId(tab, campo:string):integer;
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

Function TModelPerfil.Insert(out msg:String;out id:integer):Boolean;
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
      sqlQuery := 'Insert Into perfil (id_perfil, codigo, descricao, inativo, id_empresa, sistema)'+
                  ' Values'+
                  '(:idperfil, :codigo, :descricao, :inativo, :idempresa, :sistema);'+
                  ' Select last_insert_id() as id;';

      With Qry do
      begin
        Close;
        Sql.clear;
        Qry.SQL.Text := sqlQuery;

        idGerado                                := GerarId('perfil', 'id_perfil');
        id:= idgerado;
        Qry.ParamByName('idperfil').AsInteger   := idgerado;
        Qry.ParamByName('codigo').Asinteger     := GerarId('perfil', 'codigo');
        Qry.ParamByName('descricao').AsString   := Trim(descricao);
        Qry.ParamByName('inativo').Asstring     := inativo;
        Qry.ParamByName('idempresa').AsInteger  := idempresa;
        Qry.ParamByName('sistema').AsInteger    := sistema;

        Open;

        if not isempty then
        InserirNivel(msg, idGerado);

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
    FreeAndnil(qry);
  End;
end;

Function TModelPerfil.Update(out msg:string):Boolean;
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
      sqlQuery := 'UPDATE perfil SET ' +
                  ' descricao = :descricao, ' +
                  ' inativo = :inativo'+
                  ' WHERE id_perfil = :idperfil';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      // Definindo parâmetros
      Qry.ParamByName('idperfil').AsInteger    := idperfil;
      Qry.ParamByName('descricao').AsString    := Trim(descricao);
      Qry.ParamByName('inativo').AsString      := inativo;

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

Function TModelPerfil.Delete(out msg:string):Boolean;
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
      sqlQuery := 'DELETE FROM PERFIL WHERE ID_PERFIL = :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      // Definindo parâmetro
      Qry.ParamByName('id').AsInteger    := idperfil;

      if DeleteNivel(msg) then
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

Function TModelPerfil.Select(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.Conn;
      sqlQuery := 'SELECT * FROM PERFIL WHERE ID_PERFIL= :ID';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger  := idperfil;

      Qry.Open;
      if not Qry.IsEmpty then
      begin

        Idperfil     := Qry.Fieldbyname('id_perfil').AsInteger;
        codigo       := Qry.Fieldbyname('codigo').AsInteger;
        descricao    := Qry.Fieldbyname('descricao').AsString;;
        inativo      := Qry.Fieldbyname('inativo').AsString;

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

Function TModelPerfil.Pesquisa(out msg:string; Par1,Par2, Par3:String):Boolean;
var
  Qry     :TUniquery;
  sqlQuery, Filtro1, Ordem: string;
  I:integer;
begin
  Result                := False;
  Filtro1               := '';
  Ordem                 := '';
  Qry                   := TUniQuery.Create(nil);
  try
    try
      Qry.Connection    := dm.Conn;

      sqlQuery          := 'SELECT ID_PERFIL, CODIGO, DESCRICAO, INATIVO'+
                           ' FROM PERFIL WHERE ID_PERFIL > 0';

      if Par2 <> '' then
      begin
        if Par1 = 'CÓDIGO' then
        Filtro1 := ' and CODIGO = '+ Par2;

        if Par1 = 'PERFIL' then
        Filtro1 := ' and descricao like ''%'+Par2+'%''';

      end;

      if Par3 = 'CÓDIGO' then
      Ordem   := ' order by codigo';

      if Par3 = 'PERFIL' then
      Ordem   := ' order by descricao';


      sqlQuery  := sqlQuery + filtro1 + ordem;


      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := SqlQuery;

      Qry.Open;
      Qry.First;

      if not Qry.IsEmpty then
      begin
        //criar campo na tebela temporaria
        if dm.TabConsPerfil.eof then
        begin
          dm.TabConsPerfil.fieldDefs.clear;
          dm.TabConsPerfil.fieldDefs.assign(Qry.FieldDefs);
          dm.TabConsPerfil.createdataset;
        end
        else
        begin
          dm.TabConsPerfil.EmptyDataSet;
        end;

        while not Qry.Eof do
        begin
          dm.TabConsPerfil.Append;
          for I := 0 to Qry.FieldCount - 1 do
          begin
            dm.TabConsPerfil.Fields[I].Value := Qry.Fields[I].Value;
          end;

          dm.TabConsPerfil.Post;
          Qry.Next;
        end;

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

{$REGION 'Nivel'}

Function TModelPerfil.InserirNivel(out msg:String;id:integer):Boolean;
var
Qry, QryTela, Qrynivel : TUniquery;
sqlQuery, SqlQueryTela,SqlQryNivel: string;
I:integer;
begin
  Result  := False;
  sqlQuery      := 'Insert Into nivel '+
          '( id_nivel, id_perfil,id_empresa, tela, nome, liberado, modulo '+
          ')'+
          ' Values'+
          '(:idnivel, :idperfil, :idempresa, :tela, :nome, :liberado, :modulo)';
  SqlQueryTela  := 'Select * from tela where id_tela > 0 order by tela';
  SqlQryNivel   := 'Select tela, nome from nivel where id_perfil= :idperfil and tela= :tela and nome= :nome';

  Qry     := TUniquery.create(nil);
  QryTela := TUniquery.create(nil);
  Qrynivel:= TUniquery.create(nil);

  Try
    Try
      Qry.Connection      := dm.Conn;
      QryTela.Connection  := dm.Conn;
      Qrynivel.Connection := dm.Conn;

      //Qry Buscar telas tabela telas
      QryTela.SQL.Text    := sqlQuerytela;
      QryTela.Open;
      QryTela.First;

      While not QryTela.Eof do
      begin

        Qrynivel.Params.Clear;
        Qrynivel.SQL.Text   := SqlQryNivel;
        Qrynivel.Params.ParamByName('idperfil').AsInteger   := id;
        Qrynivel.Params.ParamByName('tela').AsString        := QryTela.FieldByName('tela').AsString;
        Qrynivel.Params.ParamByName('nome').AsString        := QryTela.FieldByName('nome').AsString;

        Qrynivel.Open;

        if Qrynivel.Eof then
        begin
          //Inserir na tabela do nivel
          Qry.Params.Clear;
          Qry.SQL.Text                            := sqlQuery;
          Qry.ParamByName('idnivel').AsInteger    := GerarId('nivel', 'id_nivel');
          Qry.ParamByName('idperfil').Asinteger   := id;
          Qry.ParamByName('idempresa').AsInteger  := idempresa;
          Qry.ParamByName('tela').AsString        := QryTela.FieldByName('tela').AsString;
          Qry.ParamByName('nome').Asstring        := QryTela.FieldByName('nome').AsString;
          Qry.ParamByName('liberado').AsString    := 'S';
          Qry.ParamByName('modulo').Asstring      := QryTela.FieldByName('modulo').AsString;

          Qry.ExecSql;
        end;

        QryTela.Next;
        msg     := 'Dados Inserido no Banco de Dados';
        Result  := True;
      end;

      QryTela.Close;
      Qrynivel.Close;

    Except on e:exception do
      begin
        msg := 'Erro ao inserir:' +e.message;
        raise;
      end;
    End;

  Finally
    FreeAndNil(Qry);
    FreeAndNil(QryTela);
    FreeAndNil(Qrynivel);
  End;
end;

Function TModelPerfil.DeleteNivel(out msg:string):Boolean;
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
      sqlQuery := 'DELETE FROM NIVEL WHERE ID_PERFIL = :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      // Definindo parâmetro
      Qry.ParamByName('id').AsInteger    := idperfil;
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

Function TModelPerfil.SelectPermissoes(out msg:string):Boolean;
var
  Qry     :TUniquery;
  sqlQuery:string;
  I:integer;
  s:String;
begin
  Result                := False;

  //Atualizar lista novas telas
  InserirNivel(s,idperfil);

  Qry                   := TUniQuery.Create(nil);
  try
    try
      Qry.Connection    := dm.Conn;

      sqlQuery          := 'Select id_nivel, id_perfil, tela, nome, liberado, modulo'+
                           ' FROM nivel WHERE ID_PERFIL= :id order by modulo, tela';

      sqlQuery  := sqlQuery;


      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := SqlQuery;
      Qry.Params.ParamByName('id').AsInteger  := idperfil;

      Qry.Open;
      Qry.First;

      if not Qry.IsEmpty then
      begin
        //criar campo na tebela temporaria
        if dm.TabPermissoes.eof then
        begin
          dm.TabPermissoes.fieldDefs.clear;
          dm.TabPermissoes.fieldDefs.assign(Qry.FieldDefs);
          dm.TabPermissoes.createdataset;
        end
        else
        begin
          dm.TabPermissoes.EmptyDataSet;
        end;

        while not Qry.Eof do
        begin
          dm.TabPermissoes.Append;
          for I := 0 to Qry.FieldCount - 1 do
          begin
            dm.TabPermissoes.Fields[I].Value := Qry.Fields[I].Value;
          end;

          dm.TabPermissoes.Post;
          Qry.Next;
        end;
        dm.TabPermissoes.First;
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

Function TModelPerfil.UpdateNivel(out msg:string):boolean;
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
      sqlQuery := 'UPDATE nivel SET ' +
                  ' liberado = :liberado' +
                  ' WHERE id_perfil = :idperfil and id_nivel= :idnivel';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      // Definindo parâmetros
      Qry.ParamByName('idperfil').AsInteger   := idperfil;
      Qry.ParamByName('liberado').AsString    := Trim(liberado);
      Qry.ParamByName('idnivel').Asinteger    := idnivel;

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

{$ENDREGION}

{$REGION 'Tela'}

Function TModelPerfil.InserirTela(modulo, tela, descricao:String):Boolean;
var
Qry, QryTela       : TUniquery;
sqlQuery, SqlQueryTela  : string;
I:integer;
begin
  Result    := False;
  sqlQuery  := 'Insert Into tela'+
                '(id_tela, tela, nome, modulo)'+
                'Values'+
                '(0, :tela, :nome, :modulo)';

  SqlQueryTela  := 'Select id_tela from tela where id_tela > 0 and tela= :tela and nome= :nome';

  Qry     := TUniquery.create(nil);
  QryTela := TUniquery.create(nil);

  Try
    Try
      Qry.Connection      := dm.Conn;
      QryTela.Connection  := dm.Conn;

      QryTela.Params.Clear;
      QryTela.SQL.Text    := SqlQueryTela;
      QryTela.Params.ParamByName('tela').AsString   := tela;
      QryTela.Params.ParamByName('nome').AsString   := Trim(descricao);
      QryTela.Open;

      if QryTela.Eof then
      begin
        Qry.Params.Clear;
        Qry.SQL.Text      := sqlQuery;
        Qry.Params.ParamByName('tela').AsString     := tela;
        Qry.Params.ParamByName('nome').AsString     := Trim(descricao);
        Qry.Params.ParamByName('modulo').AsString     := Trim(modulo);

        Qry.ExecSql;
        Result  := True;
      end;

    Except on e:exception do
      begin
        raise Exception.Create('Error: '+e.Message);
      end;
    End;

  Finally
    FreeAndNil(Qry);
    FreeAndNil(QryTela);
  End;

end;

{$ENDREGION}

end.
