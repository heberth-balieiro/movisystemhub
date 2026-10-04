unit Model.Sede_old;

interface

Uses
  Uni,System.SysUtils, System.Classes,UDM, data.DB, datasnap.dbclient;

Type
  TModelSede = Class

  Private
    FTransacao: TUniTransaction;

    Fidsede: Integer;
    Frazao: String;
    Ffantasia: String;
    Fcep: String;
    Fendereco: String;
    Fnumero: String;
    Fcomplemento: String;
    Fbairro: String;
    Fidcidade: Integer;
    Fcnpj: String;
    Fie: String;
    Fim: String;
    Fresponsavel: String;
    Ftelefone: String;
    Fcelular: String;
    Fwhatsapp: String;
    Fsite: String;
    Femail1: String;
    Femail2: String;
    Fsedeprincipal: String;
    Fidempresa: integer;

  public
    constructor Create;
    destructor Destroy; override;

    property idsede        :Integer  read Fidsede        write Fidsede;
    property razao         :String   read Frazao         write Frazao;
    property fantasia      :String   read Ffantasia      write Ffantasia;
    property cep           :String   read Fcep           write Fcep;
    property endereco      :String   read Fendereco      write Fendereco;
    property numero        :String   read Fnumero        write Fnumero;
    property complemento   :String   read Fcomplemento   write Fcomplemento;
    property bairro        :String   read Fbairro        write Fbairro;
    property idcidade      :integer  read Fidcidade      write Fidcidade;
    property cnpj          :String   read Fcnpj          write Fcnpj;
    property ie            :String   read Fie            write Fie;
    property im            :String   read Fim            write Fim;
    property responsavel   :String   read Fresponsavel   write Fresponsavel;
    property telefone      :String   read Ftelefone      write Ftelefone;
    property celular       :String   read Fcelular       write Fcelular;
    property whatsapp      :String   read Fwhatsapp      write Fwhatsapp;
    property site          :String   read Fsite          write Fsite;
    property email1        :String   read Femail1        write Femail1;
    property email2        :String   read Femail2        write Femail2;
    property sedeprincipal :String   read Fsedeprincipal write Fsedeprincipal;
    property idempresa     :integer  read Fidempresa     write Fidempresa;

    Function Insert(out msg:String):Boolean;
    Function Update(out msg:string):Boolean;
    Function Delete(out msg:string):Boolean;
    Function Select(out msg:string):Boolean;
    Function GerarId(tab, campo:string):integer;
    Function Pesquisa(out msg:string; Filtro:String):Boolean;

  End;

implementation

destructor TModelSede.Destroy;
begin
  if Assigned(FTransacao) then
    FreeAndNil(FTransacao);
  inherited Destroy;
end;

Function TModelSede.GerarId(tab, campo:string):integer;
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

Function TModelSede.Insert(out msg:String):Boolean;
var
Qry       : TUniquery;
sqlQuery  : string;
begin
  Result  := False;
  Qry     := TUniquery.create(nil);
  Try
    Try
      FTransacao.StartTransaction;
      Qry.Connection := dm.Conn;
      sqlQuery := 'Insert Into sede (id_sede, razao, fantasia, cep,endereco,'+
                  ' numero, complemento, bairro, id_cidade, cnpj, ie, im, responsavel,'+
                  ' telefone, celular, whatsapp, site, email1, email2, sedeprincipal, datacadastro, id_empresa)'+
                  ' Values'+
                  '(:idsede, :razao, :fantasia, :cep, :endereco, :numero, :complemento, ' +
                  ':bairro, :idcidade, :cnpj, :ie, :im, :responsavel, :telefone, :celular, ' +
                  ':whatsapp, :site, :email1, :email2, :sedeprincipal, :datacadastro, :idempresa)';

      With Qry do
      begin
        Close;
        Sql.clear;
        Qry.SQL.Text := sqlQuery;

        Qry.ParamByName('idsede').AsInteger           := GerarId('sede', 'id_sede');
        Qry.ParamByName('razao').AsString             := Trim(razao);
        Qry.ParamByName('fantasia').AsString          := Trim(fantasia);
        Qry.ParamByName('cep').AsString               := cep;
        Qry.ParamByName('endereco').AsString          := endereco;
        Qry.ParamByName('numero').AsString            := numero;
        Qry.ParamByName('complemento').AsString       := complemento;
        Qry.ParamByName('bairro').AsString            := bairro;
        Qry.ParamByName('idcidade').AsInteger         := idcidade;
        Qry.ParamByName('cnpj').AsString              := cnpj;
        Qry.ParamByName('ie').AsString                := ie;
        Qry.ParamByName('im').AsString                := im;
        Qry.ParamByName('responsavel').AsString       := responsavel;
        Qry.ParamByName('telefone').AsString          := telefone;
        Qry.ParamByName('celular').AsString           := celular;
        Qry.ParamByName('whatsapp').AsString          := whatsapp;
        Qry.ParamByName('site').AsString              := site;
        Qry.ParamByName('email1').AsString            := email1;
        Qry.ParamByName('email2').AsString            := email2;
        Qry.ParamByName('sedeprincipal').AsString     := sedeprincipal;
        Qry.ParamByName('datacadastro').AsDate        := now;
        Qry.ParamByName('idempresa').AsInteger        := idempresa;

        ExecSql;

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

Function TModelSede.Update(out msg:string):Boolean;
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
      sqlQuery := 'UPDATE sede SET ' +
                  'razao = :razao, ' +
                  'fantasia = :fantasia, ' +
                  'cep = :cep, ' +
                  'endereco = :endereco, ' +
                  'numero = :numero, ' +
                  'complemento = :complemento, ' +
                  'bairro = :bairro, ' +
                  'id_cidade = :idcidade, ' +
                  'cnpj = :cnpj, ' +
                  'ie = :ie, ' +
                  'im = :im, ' +
                  'responsavel = :responsavel, ' +
                  'telefone = :telefone, ' +
                  'celular = :celular, ' +
                  'whatsapp = :whatsapp, ' +
                  'site = :site, ' +
                  'email1 = :email1, ' +
                  'email2 = :email2 ' +
                  ' WHERE id_sede = :idsede';
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      // Definindo parâmetros

      Qry.ParamByName('idsede').AsInteger               := idsede;
      Qry.ParamByName('razao').AsString                 := Trim(razao);
      Qry.ParamByName('fantasia').AsString              := Trim(fantasia);
      Qry.ParamByName('cep').AsString                   := cep;
      Qry.ParamByName('endereco').AsString              := endereco;
      Qry.ParamByName('numero').AsString                := numero;
      Qry.ParamByName('complemento').AsString           := complemento;
      Qry.ParamByName('bairro').AsString                := bairro;
      Qry.ParamByName('idcidade').AsInteger             := idcidade;
      Qry.ParamByName('cnpj').AsString                  := cnpj;
      Qry.ParamByName('ie').AsString                    := ie;
      Qry.ParamByName('im').AsString                    := im;
      Qry.ParamByName('responsavel').AsString           := responsavel;
      Qry.ParamByName('telefone').AsString              := telefone;
      Qry.ParamByName('celular').AsString               := celular;
      Qry.ParamByName('whatsapp').AsString              := whatsapp;
      Qry.ParamByName('site').AsString                  := site;
      Qry.ParamByName('email1').AsString                := email1;
      Qry.ParamByName('email2').AsString                := email2;
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

constructor TModelSede.Create;
begin
inherited Create;

  FTransacao                    := TUniTransaction.Create(nil);
  FTransacao.DefaultConnection  := dm.Conn;

end;

Function TModelSede.Delete(out msg:string):Boolean;
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
      sqlQuery := 'DELETE FROM SEDE WHERE ID_SEDE = :id';
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      // Definindo parâmetro
      Qry.ParamByName('id').AsInteger    := idsede;
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

Function TModelSede.Select(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.Conn;
      sqlQuery := 'SELECT * FROM SEDE WHERE ID_SEDE= :ID';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger  := idsede;

      Qry.Open;
      if not Qry.IsEmpty then
      begin

        idsede        := Qry.Fieldbyname('id_sede').AsInteger;
        razao         := Qry.Fieldbyname('razao').AsString;;
        fantasia      := Qry.Fieldbyname('fantasia').AsString;
        cep           := Qry.Fieldbyname('cep').AsString;
        endereco      := Qry.Fieldbyname('endereco').AsString;
        numero        := Qry.Fieldbyname('numero').AsString;
        complemento   := Qry.Fieldbyname('complemento').AsString;
        bairro        := Qry.Fieldbyname('bairro').AsString;
        idcidade      := Qry.Fieldbyname('id_cidade').AsInteger;
        cnpj          := Qry.Fieldbyname('cnpj').AsString;
        ie            := Qry.Fieldbyname('ie').AsString;
        im            := Qry.Fieldbyname('im').AsString;
        responsavel   := Qry.Fieldbyname('responsavel').AsString;
        telefone      := Qry.Fieldbyname('telefone').AsString;
        celular       := Qry.Fieldbyname('celular').AsString;
        whatsapp      := Qry.Fieldbyname('whatsapp').AsString;
        site          := Qry.Fieldbyname('site').AsString;
        email1        := Qry.Fieldbyname('email1').AsString;
        email2        := Qry.Fieldbyname('email2').AsString;

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

Function TModelSede.Pesquisa(out msg:string; Filtro:String):Boolean;
var
  Qry     :TUniquery;
  sqlQuery, FiltroQuery: string;
  I:integer;
begin
  Result                := False;
  FiltroQuery           := '';

  Qry                   := TUniQuery.Create(nil);

  try
    try
      Qry.Connection    := dm.Conn;

      sqlQuery          := 'SELECT id_sede, razao, fantasia, cnpj, telefone, '+
                            'celular, email1, sedeprincipal FROM SEDE where id_sede >0';
      if Filtro <> '' then
      begin
        FiltroQuery     := ' and (razao like :filtro or fantasia like :filtro or cnpj like :filtro)';
        sqlQuery  := sqlQuery+FiltroQuery;
      end
      else
      sqlQuery  := sqlQuery;

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := SqlQuery;

      if Filtro <>'' then
      Qry.Params.ParamByName('filtro').AsString := '%' + Filtro + '%';

      Qry.Open;
      Qry.First;

      if not Qry.IsEmpty then
      begin

        if dm.TabConSede.Active then
        begin
          dm.TabConSede.Close; // Feche o dataset se estiver ativo
        end;

        dm.TabConSede.DisableControls;

        //criar campo na tebela temporaria
        if dm.TabConSede.eof then
        begin
          dm.TabConSede.fieldDefs.clear;
          dm.TabConSede.fieldDefs.assign(Qry.FieldDefs);
          dm.TabConSede.createdataset;
        end
        else
        begin
          dm.TabConSede.EmptyDataSet;
        end;

        while not Qry.Eof do
        begin
          dm.TabConSede.Append;
          for I := 0 to Qry.FieldCount - 1 do
          begin
            dm.TabConSede.Fields[I].Value := Qry.Fields[I].Value;
          end;
          dm.TabConSede.Post;
          Qry.Next;
        end;
        dm.TabConSede.EnableControls;
        dm.TabConSede.First;
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

end.
