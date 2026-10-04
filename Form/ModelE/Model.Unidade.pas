unit Model.Unidade;

interface

Uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('unidade')]
  TModelUnidade = class

  Private
    FData_Alteracao: TDate;
    FUni: string;
    FAtivo: string;
    FData_Cadastro: TDate;
    FCodigo: Integer;
    FData_Excluido: TDate;
    FUnidade: string;
    FId_Empresa: Integer;
    FId_Unidade: Integer;
    FId_Usuario_Exc: Integer;
    FExcluido: Integer;
    FId_Usuario_Alt: Integer;
    FId_Usuario: Integer;


  public
    [FieldName('id_unidade', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property Id_Unidade: Integer read FId_Unidade write FId_Unidade;

    [FieldName('codigo')]
    [FieldOptions([foInsert,foSelect])]
    property Codigo: Integer read FCodigo write FCodigo;

    [FieldName('uni')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property Uni: string read FUni write FUni;

    [FieldName('unidade')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property Unidade: string read FUnidade write FUnidade;

    [FieldName('ativo')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property Ativo: string read FAtivo write FAtivo;

    [FieldName('data_cadastro')]
    [FieldOptions([foInsert])]
    property Data_Cadastro: TDate read FData_Cadastro write FData_Cadastro;

    [FieldName('data_alteracao')]
    [FieldOptions([foupdate])]
    property Data_Alteracao: TDate read FData_Alteracao write FData_Alteracao;

    [FieldName('excluido')]
    [FieldOptions([foInsert,foupdate])]
    property Excluido: Integer read FExcluido write FExcluido;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert])]
    property Id_Empresa: Integer read FId_Empresa write FId_Empresa;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert])]
    property Id_Usuario: Integer read FId_Usuario write FId_Usuario;

    [FieldName('data_excluido')]
    [FieldOptions([foUpdate])]
    property Data_Excluido: TDate read FData_Excluido write FData_Excluido;

    [FieldName('id_usuario_exc')]
    [FieldOptions([foUpdate])]
    property Id_Usuario_Exc: Integer read FId_Usuario_Exc write FId_Usuario_Exc;

    [FieldName('id_usuario_alt')]
    [FieldOptions([foUpdate])]
    property Id_Usuario_Alt: Integer read FId_Usuario_Alt write FId_Usuario_Alt;

  End;

implementation
{
uses
  System.Math;

destructor TModelUnidade.Destroy;
begin
  if Assigned(FTransacao) then
    FreeAndNil(FTransacao);

  inherited Destroy;
end;

constructor TModelUnidade.Create;
begin
inherited Create;

  FTransacao                    := TUniTransaction.Create(nil);
  FTransacao.DefaultConnection  := dm.Conn;

end;

Function TModelUnidade.GerarId(tab, campo:string):integer;
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

Function TModelUnidade.Insert(out msg:String;out id:integer):Boolean;
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
      sqlQuery := 'Insert Into unidade (id_unidade, codigo, uni, unidade, ativo, data_cadastro, excluido, id_empresa, id_usuario)'+
                  ' Values'+
                  '(:1,:2,:3,:4,:5,:6,:7,:8,:9)';
      With Qry do
      begin
        Close;
        Sql.clear;
        Qry.SQL.Text := sqlQuery;

        idGerado                        := GerarId('unidade', 'id_unidade');
        id:= idgerado;
        Qry.ParamByName('1').AsInteger  := idgerado;
        Qry.ParamByName('2').Asinteger  := GerarId('unidade', 'codigo');
        Qry.ParamByName('3').AsString   := Trim(uni);
        Qry.ParamByName('4').AsString   := Trim(unidade);
        Qry.ParamByName('5').AsString   := Trim(inativo);
        Qry.ParamByName('6').AsDateTime := now;
        Qry.ParamByName('7').AsInteger  := 0;
        Qry.ParamByName('8').AsInteger  := idempresa;
        Qry.ParamByName('9').AsInteger  := idusuario;

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

Function TModelUnidade.Update(out msg:string):Boolean;
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
      sqlQuery := 'Update unidade set ' +
                  ' uni= :uni,'+
                  ' unidade= :unidade,'+
                  ' ativo= :inativo'+
                  ' WHERE id_unidade = :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      // Definindo parâmetros
      Qry.ParamByName('id').AsInteger       := idunidade;
      Qry.ParamByName('uni').AsString     := Trim(uni);
      Qry.ParamByName('unidade').AsString     := Trim(unidade);
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

Function TModelUnidade.Delete(out msg:string):Boolean;
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
      sqlQuery := 'Delete from unidade where id_unidade= :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      // Definindo parâmetro
      Qry.ParamByName('id').AsInteger    := idunidade;

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

Function TModelUnidade.Select(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.Conn;
      sqlQuery := 'SELECT id_unidade, codigo, uni, unidade, ativo FROM unidade WHERE ID_unidade= :ID';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger  := idunidade;

      Qry.Open;
      if not Qry.IsEmpty then
      begin

        Idunidade   := Qry.Fieldbyname('id_unidade').AsInteger;
        codigo      := Qry.Fieldbyname('codigo').AsInteger;
        uni         := Qry.Fieldbyname('uni').AsString;
        unidade     := Qry.Fieldbyname('unidade').AsString;
        inativo     := Qry.Fieldbyname('ativo').AsString;


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

Function TModelUnidade.Pesquisa(out msg:string;filtro:string;TabInativo:Integer):Boolean;
var
  Qry     :TUniquery;
  sqlQuery, FiltroQuery,FiltroInativo:String;
begin
  Result                := False;
  
  Qry                   := TUniQuery.Create(nil);
  try
    try
      Qry.Connection    := dm.Conn;

      sqlQuery          := 'SELECT ID_unidade, CODIGO, uni, unidade, ativo'+
                           ' FROM unidade WHERE ID_unidade > 0';

      case TabInativo of
        1:FiltroInativo      := FiltroInativo + ' and ativo=''S''';
        2:FiltroInativo      := FiltroInativo + ' and ativo=''N''';
      end;


      if Filtro <> '' then
      begin
        FiltroQuery := ' and (codigo like :filtro or uni like :filtro or unidade like :filtro)';
        sqlQuery  := sqlQuery + FiltroInativo+ FiltroQuery;
      end
      else
      sqlQuery  := sqlQuery+FiltroInativo;


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

        if dm.TabConsUnidade.Active then
        begin
          dm.TabConsUnidade.Close; // Feche o dataset se estiver ativo
        end;

        dm.TabConsUnidade.disablecontrols;

        if dm.TabConsUnidade.eof then
        begin
          dm.TabConsUnidade.fieldDefs.clear;

          dm.TabConsUnidade.FieldDefs.Add('ID_unidade',   ftInteger);
          dm.TabConsUnidade.FieldDefs.Add('CODIGO',   ftInteger);
          dm.TabConsUnidade.FieldDefs.Add('uni',   ftString,6);
          dm.TabConsUnidade.FieldDefs.Add('unidade',   ftstring,60);
          dm.TabConsUnidade.FieldDefs.Add('ativo',   ftString,10);

          dm.TabConsUnidade.createdataset;
        end
        else
        begin
          dm.TabConsUnidade.EmptyDataSet;
        end;

        while not Qry.Eof do
        begin
          dm.TabConsUnidade.Append;

          dm.TabConsUnidade.FieldByName('ID_unidade').Value       :=  Qry.FieldByName('ID_unidade').Value;
          dm.TabConsUnidade.FieldByName('CODIGO').Value       :=  Qry.FieldByName('CODIGO').Value;
          dm.TabConsUnidade.FieldByName('uni').Value       :=  Qry.FieldByName('uni').Value;
          dm.TabConsUnidade.FieldByName('unidade').Value       :=  Qry.FieldByName('unidade').Value;
          dm.TabConsUnidade.FieldByName('ativo').Value       :=  Qry.FieldByName('ativo').Value;

          dm.TabConsUnidade.Post;
          Qry.Next;
        end;
        dm.TabConsUnidade.EnableControls;
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
