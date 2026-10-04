unit Dao.Pessoa;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TDaoPessoa = Class

  Private


  public
    Class Function Delete(AID:Integer):Boolean;
    Class Function IncluiRegistroSincronizar:Boolean;
    Class Function IncluiRegistroDependenteSincronizar:Boolean;
    Class Function DesfiliarAssociado(const ASituacao:String; const AIdRegistro:integer; const AIdEmpresa:integer):Boolean;
    Class Function DesfiliarAssociadoDependente(const AIDUsuario:Integer; const AIdRegistro:integer; const AIdEmpresa:integer): Boolean;
    Class Function DesfiliarAssociadoInativarCarteira(const AIDUsuario:Integer; const AIdRegistro:integer; const AIdEmpresa:integer): Boolean;

    //Function para relatorio de associado
    Class Function ImpressaoRelatorioSimples(Qry:TUniquery; Filtro:String):Boolean;
    Class Function ImpressaoRelatorioData(Qry:TUniquery; Filtro:String; ndata1,ndata2:TDate):Boolean;//para buscar por data
    Class Function ImpressaoRelatorioAniversariante(Qry:TUniquery; Filtro:String):Boolean;

  End;

implementation

{ TDaoPessoa }

uses Vcl.Session;

class function TDaoPessoa.Delete(AID: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update socio set excluido= 1, situacao=''EXCLUIDO'', data_exc= :dt, id_usuario_exc= :iduser, sinc_app=''S'' where id_socio= :id';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;
      Qry.ParamByName('id').AsInteger     := AID;
      Qry.ParamByName('dt').AsDateTime    := now;
      qry.ParamByName('iduser').AsInteger := TSession.id_usuario;
      Qry.ExecSQL;
      Result          := true;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao na função de Delete:'+sLineBreak+e.Message);
      end;
    End;

  finally
    Qry.Free;
  end;
end;

class function TDaoPessoa.IncluiRegistroDependenteSincronizar: Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update sindicato_dependente set sinc_app=''S'' where id_dependente > 0 and excluido=0';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;

      Qry.ExecSQL;
      Result          := true;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao na função de IncluiRegistroSincronizar:'+sLineBreak+e.Message);
      end;
    End;

  finally
    Qry.Free;
  end;
end;

class function TDaoPessoa.IncluiRegistroSincronizar: Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update socio set sinc_app=''S'' where id_socio > 0 and excluido=0';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;

      Qry.ExecSQL;
      Result          := true;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao na função de IncluiRegistroSincronizar:'+sLineBreak+e.Message);
      end;
    End;

  finally
    Qry.Free;
  end;
end;

class function TDaoPessoa.DesfiliarAssociado(const ASituacao:String; const AIdRegistro:integer; const AIdEmpresa:integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update socio set situacao= :situacao, mostrarapp= :mostrarapp, '+
            ' sinc_app= :sinc_app where id_socio= :id_socio and id_empresa= :id_empresa ';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;

      Qry.ParamByName('situacao').AsString      := ASituacao;
      Qry.ParamByName('mostrarapp').AsString    := 'N';
      Qry.ParamByName('sinc_app').AsString      := 'S';
      Qry.ParamByName('id_socio').AsInteger     := AIdRegistro;
      Qry.ParamByName('id_empresa').AsInteger   := AIDEmpresa;

      Qry.ExecSQL;
      Result     := Qry.RowsAffected > 0;

    except on e:Exception do
      begin
        raise Exception.Create('Erro ao na função de Desfiliar:'+sLineBreak+e.Message);
      end;
    End;

  finally
    Qry.Free;
  end;
end;

class function TDaoPessoa.DesfiliarAssociadoDependente(const AIDUsuario, AIdRegistro, AIdEmpresa: integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update sindicato_dependente set ativo= ''N'', autorizado=''N'', '+
            ' sinc_app= :sinc_app, data_desfiliacao= :dt, id_usuario_desfiliacao= :iduser '+
            ' where id_socio= :id_socio and id_empresa= :id_empresa ';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;

      Qry.ParamByName('sinc_app').AsString      := 'S';
      Qry.ParamByName('dt').AsDateTime          := Date;
      Qry.ParamByName('iduser').AsInteger       := AIDUsuario;
      Qry.ParamByName('id_socio').AsInteger     := AIdRegistro;
      Qry.ParamByName('id_empresa').AsInteger   := AIDEmpresa;

      Qry.ExecSQL;
      Result     := Qry.RowsAffected > 0;

    except on e:Exception do
      begin
        raise Exception.Create('Erro ao na função de DesfiliarAssociadoDependente:'+sLineBreak+e.Message);
      end;
    End;

  finally
    Qry.Free;
  end;
end;

class function TDaoPessoa.DesfiliarAssociadoInativarCarteira(const AIDUsuario,
                                    AIdRegistro, AIdEmpresa: integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update carteira set ativo= ''N'', '+
            ' sinc_app= :sinc_app, data_desfiliacao= :dt, id_usuario_desfiliacao= :iduser '+
            ' where id_socio= :id_socio and id_empresa= :id_empresa ';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;

      Qry.ParamByName('sinc_app').AsString      := 'S';
      Qry.ParamByName('dt').AsDateTime          := Date;
      Qry.ParamByName('iduser').AsInteger       := AIDUsuario;
      Qry.ParamByName('id_socio').AsInteger     := AIdRegistro;
      Qry.ParamByName('id_empresa').AsInteger   := AIDEmpresa;

      Qry.ExecSQL;
      Result     := Qry.RowsAffected > 0;

    except on e:Exception do
      begin
        raise Exception.Create('Erro ao na função de DesfiliarAssociadoInativarCarteira:'+sLineBreak+e.Message);
      end;
    End;

  finally
    Qry.Free;
  end;
end;

{$REGION 'Função para relatorio associado'}

class function TDaoPessoa.ImpressaoRelatorioAniversariante(Qry: TUniquery; Filtro: String): Boolean;
Const
  QryStr = ' Select                                  '+
           ' s.id_socio,                  '+
           ' s.codigo,                               '+
           ' s.matricula,                             '+
           ' s.situacao,                              '+
           ' s.nome,                                 '+
           ' s.apelido,                              '+
           ' s.telefone,                             '+
           ' s.celular,                              '+
           ' s.whatsapp,                             '+
           ' s.cpf,                                  '+
           ' s.email,                                 '+
           ' s.socio_deste,                           '+
           ' s.sexo,                                  '+
           ' s.nascimento,                            '+
           ' ss.razao as nomesecretaria,              '+
           ' sl.descricao as nomelotacao,             '+
           ' c.cidade as nomecidade                   '+
           ' From Socio s                            '+
           ' Left Join secretaria ss '+
           ' on s.escritorio = ss.id_secretaria    '+
           ' Left Join sindicato_lotacao sl '+
           ' on s.id_lotacao = sl.id_lotacao'+
           ' Left join cidade c '+
           ' on s.id_cidade = c.id_cidade';

begin
  Result  := False;
  try
    Qry.SQL.Text := QryStr + Filtro;

//    if Trim(ACampo) <> '' then
//      AQuery.SQL.Add('AND codigo_vaga LIKE :filtro');
//
//    if Trim(ASituacao) <> '' then
//      AQuery.SQL.Add('AND ativo=:ativo');
//
//    AQuery.SQL.Add('ORDER BY codigo_vaga');
//
//    if Trim(ACampo) <> '' then
//      AQuery.ParamByName('filtro').AsString := '%' + ACampo + '%';
//
//    if Trim(ASituacao) <> '' then
//      AQuery.ParamByName('ativo').AsString := ASituacao;

    Qry.Open;
    Result  := True;

  Except on e:exception do
   raise Exception.Create(e.message);
  end;
end;

class function TDaoPessoa.ImpressaoRelatorioData(Qry: TUniquery; Filtro: String; ndata1, ndata2: TDate): Boolean;
begin

end;

class function TDaoPessoa.ImpressaoRelatorioSimples(Qry: TUniquery; Filtro: String): Boolean;
Const
  QryStr = ' Select                                  '+
           ' s.id_socio,                  '+
           ' s.codigo,                               '+
           ' s.matricula,                             '+
           ' s.situacao,                              '+
           ' s.nome,                                 '+
           ' s.apelido,                              '+
           ' s.telefone,                             '+
           ' s.celular,                              '+
           ' s.whatsapp,                             '+
           ' s.cpf,                                  '+
           ' s.email,                                 '+
           ' s.socio_deste,                           '+
           ' s.sexo,                                  '+
           ' s.nascimento,                            '+
           ' ss.razao as nomesecretaria,              '+
           ' sl.descricao as nomelotacao,             '+
           ' c.cidade as nomecidade                   '+
           ' From Socio s                            '+
           ' Left Join secretaria ss '+
           ' on s.escritorio = ss.id_secretaria    '+
           ' Left Join sindicato_lotacao sl '+
           ' on s.id_lotacao = sl.id_lotacao'+
           ' Left join cidade c '+
           ' on s.id_cidade = c.id_cidade ';

begin
  Result  := False;
  try
    Qry.SQL.Text := QryStr + Filtro;

//    if Trim(ACampo) <> '' then
//      AQuery.SQL.Add('AND codigo_vaga LIKE :filtro');
//
//    if Trim(ASituacao) <> '' then
//      AQuery.SQL.Add('AND ativo=:ativo');
//
//    AQuery.SQL.Add('ORDER BY codigo_vaga');
//
//    if Trim(ACampo) <> '' then
//      AQuery.ParamByName('filtro').AsString := '%' + ACampo + '%';
//
//    if Trim(ASituacao) <> '' then
//      AQuery.ParamByName('ativo').AsString := ASituacao;

    Qry.Open;
    Result  := True;

  Except on e:exception do
   raise Exception.Create(e.message);
  end;
end;

{$ENDREGION}

end.
