unit DAO.AssociadoAtualizacaoAPI;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient,
  Model.AssociadoAtualizarAPI;

Type
  TDaoAssociadoAtualizacao = Class

  Private

  public
    class function BuscarAssociadoVinculo(ADoc: TAssociadoDadosAtuais; Const AMatricula, AIDEmpresa: Integer; Const ACPF:string): Boolean;
    class function Rejeitar(const AIdSolicitacaoAPI: Int64; const AIdEmpresa: Integer; const AMotivo: string): Boolean;
    class function MarcarErro(const AIdSolicitacaoAPI: Int64; const AIdEmpresa: Integer; const AMotivo: string): Boolean;
    class function ProcessarAtualizacao(ADoc: TAssociadoAtualizacao; const AIdSocio, AIdEmpresa: Integer): Boolean;
    //Class Function Delete(const AIDRegistro: integer; const AIDUser: Integer; const AIDEmpresa: integer):Boolean;
    //Class Function ExisteNome(const AStr: String; const AIDEmpresa: Integer =0; const AIDIgnorar:integer = 0):Boolean;
    //Class Function PossuiVinculo(const AIDRegistro:Integer):boolean;
  End;

implementation

{ TDaoAssociadoAtualizacao }

class function TDaoAssociadoAtualizacao.BuscarAssociadoVinculo(
  ADoc: TAssociadoDadosAtuais;
  const AMatricula, AIDEmpresa: Integer;
  const ACPF: string): Boolean;
var
  Qry: TUniQuery;
const
  QryStr =
    'SELECT ' +
    ' s.id_socio, ' +
    ' s.codigo, ' +
    ' s.matricula, ' +
    ' s.situacao, ' +
    ' s.nome, ' +
    ' s.apelido, ' +
    ' s.cep, ' +
    ' s.endereco, ' +
    ' s.numero, ' +
    ' s.bairro, ' +
    ' s.complemento, ' +
    ' s.celular, ' +
    ' s.whatsapp, ' +
    ' s.cpf, ' +
    ' s.email, ' +
    ' c.cidade '+
    ' FROM socio s ' +
    ' inner join cidade c '+
    ' on s.id_cidade = c.id_cidade  '+
    ' WHERE 1 = 1 ' +
    ' AND s.id_empresa = :id_empresa ' +
    ' AND s.situacao IN (''ATIVO'', ''S'') ';
begin
  Result := False;

  { Evita buscar qualquer associado caso não tenha identificação }
  if (AMatricula <= 0) and (Trim(ACPF) = '') then
    Exit;

  if not Assigned(ADoc) then
    Exit;

  if AIDEmpresa <= 0 then
    Exit;

  if AMatricula <= 0 then
    Exit;

  if Trim(ACPF) = '' then
    Exit;

  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection  := dm.Conn;
    Qry.SQL.Text    := QryStr;

    Qry.ParamByName('id_empresa').AsInteger := AIDEmpresa;

    if AMatricula > 0 then
    begin
      Qry.SQL.Add(' AND s.matricula = :AMatricula ');
      Qry.ParamByName('AMatricula').AsInteger := AMatricula;
    end;

    if Trim(ACPF) <> '' then
    begin
      Qry.SQL.Add(' AND s.cpf = :ACPF ');
      Qry.ParamByName('ACPF').AsString := Trim(ACPF);
    end;

    Qry.SQL.Add(' LIMIT 1');

    Qry.Open;

    if Qry.IsEmpty then
      Exit;

    ADoc.Id_Socio           := Qry.FieldByName('id_socio').AsInteger;
    ADoc.Email_Atual        := Qry.FieldByName('email').AsString;
    ADoc.Celular_Atual      := Qry.FieldByName('celular').AsString;
    ADoc.Whatsapp_Atual     := Qry.FieldByName('whatsapp').AsString;
    ADoc.Cep_Atual          := Qry.FieldByName('cep').AsString;
    ADoc.Endereco_Atual     := Qry.FieldByName('endereco').AsString;
    ADoc.Numero_Atual       := Qry.FieldByName('numero').AsString;
    ADoc.Bairro_Atual       := Qry.FieldByName('bairro').AsString;
    ADoc.Complemento_Atual  := Qry.FieldByName('complemento').AsString;
    ADoc.Situacao_Atual     := Qry.FieldByName('situacao').AsString;
    Adoc.cidade_atual       := Qry.FieldByName('cidade').AsString;
    Result := True;

  finally
    Qry.Free;
  end;
end;

class function TDaoAssociadoAtualizacao.Rejeitar(
  const AIdSolicitacaoAPI: Int64;
  const AIdEmpresa: Integer;
  const AMotivo: string): Boolean;
var
  Qry: TUniQuery;
begin
  Result := False;

  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := dm.Conn;
    Qry.SQL.Text :=
      'UPDATE integracao_atualizacao_cadastral ' +
      'SET situacao = :situacao, ' +
      '    erro = :erro, ' +
      '    processado_em = NOW() ' +
      'WHERE id_solicitacao_api = :id_solicitacao_api ' +
      '  AND id_empresa = :id_empresa ' +
      '  AND situacao = ''PENDENTE'' ';

    Qry.ParamByName('situacao').AsString := 'REJEITADO';
    Qry.ParamByName('erro').AsString := Trim(AMotivo);
    Qry.ParamByName('id_solicitacao_api').AsLargeInt := AIdSolicitacaoAPI;
    Qry.ParamByName('id_empresa').AsInteger := AIdEmpresa;

    Qry.ExecSQL;

    Result := Qry.RowsAffected > 0;
  finally
    Qry.Free;
  end;
end;

class function TDaoAssociadoAtualizacao.MarcarErro(
  const AIdSolicitacaoAPI: Int64;
  const AIdEmpresa: Integer;
  const AMotivo: string): Boolean;
var
  Qry: TUniQuery;
begin
  Result := False;

  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := dm.Conn;
    Qry.SQL.Text :=
      'UPDATE integracao_atualizacao_cadastral ' +
      'SET situacao = :situacao, ' +
      '    erro = :erro, ' +
      '    processado_em = NOW() ' +
      'WHERE id_solicitacao_api = :id_solicitacao_api ' +
      '  AND id_empresa = :id_empresa ' +
      '  AND situacao = ''PENDENTE'' ';

    Qry.ParamByName('situacao').AsString := 'ERRO';
    Qry.ParamByName('erro').AsString := Trim(AMotivo);
    Qry.ParamByName('id_solicitacao_api').AsLargeInt := AIdSolicitacaoAPI;
    Qry.ParamByName('id_empresa').AsInteger := AIdEmpresa;

    Qry.ExecSQL;

    Result := Qry.RowsAffected > 0;
  finally
    Qry.Free;
  end;
end;

class function TDaoAssociadoAtualizacao.ProcessarAtualizacao(
  ADoc: TAssociadoAtualizacao;
  const AIdSocio, AIdEmpresa: Integer): Boolean;
var
  Qry: TUniQuery;
  SQLSet: string;
  IdCidade: Integer;
begin
  Result := False;

  if not Assigned(ADoc) then
    Exit;

  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := dm.Conn;
    dm.Conn.StartTransaction;
    try
      { Bloqueia e valida a solicitação antes de alterar o associado }
      Qry.SQL.Text :=
        'SELECT situacao ' +
        'FROM integracao_atualizacao_cadastral ' +
        'WHERE id_solicitacao_api = :id_solicitacao_api ' +
        '  AND id_empresa = :id_empresa ' +
        'FOR UPDATE';
      Qry.ParamByName('id_solicitacao_api').AsLargeInt := ADoc.Id_Solicitacao_API;
      Qry.ParamByName('id_empresa').AsInteger := AIdEmpresa;
      Qry.Open;

      if Qry.IsEmpty then
        raise Exception.Create('Solicitação de atualização cadastral não localizada.');

      if not SameText(Trim(Qry.FieldByName('situacao').AsString), 'PENDENTE') then
        raise Exception.Create('Somente solicitações pendentes podem ser processadas.');

      Qry.Close;
      Qry.SQL.Text :=
        'SELECT id_socio ' +
        'FROM socio ' +
        'WHERE id_socio = :id_socio ' +
        '  AND id_empresa = :id_empresa ' +
        '  AND situacao IN (''ATIVO'', ''S'') ' +
        'LIMIT 1';
      Qry.ParamByName('id_socio').AsInteger := AIdSocio;
      Qry.ParamByName('id_empresa').AsInteger := AIdEmpresa;
      Qry.Open;

      if Qry.IsEmpty then
        raise Exception.Create('Associado não localizado ou cadastro inativo.');

      IdCidade := 0;
      if Trim(ADoc.cidade_nova) <> '' then
      begin
        Qry.Close;
        Qry.SQL.Text :=
          'SELECT id_cidade ' +
          'FROM cidade ' +
          'WHERE UPPER(TRIM(cidade)) = UPPER(TRIM(:cidade)) ' +
          'LIMIT 2';
        Qry.ParamByName('cidade').AsString := Trim(ADoc.cidade_nova);
        Qry.Open;

        if Qry.IsEmpty then
          raise Exception.Create('Cidade informada não foi localizada no cadastro de cidades.');

        IdCidade := Qry.FieldByName('id_cidade').AsInteger;
        Qry.Next;

        if not Qry.Eof then
          raise Exception.Create('Existe mais de uma cidade com o nome informado. Selecione o cadastro correto antes de processar.');
      end;

      SQLSet := '';

      if Trim(ADoc.email_novo) <> '' then
        SQLSet := SQLSet + 'email = :email, ';

      if Trim(ADoc.telefone_novo) <> '' then
        SQLSet := SQLSet + 'celular = :celular, ';

      if Trim(ADoc.whatsapp_novo) <> '' then
        SQLSet := SQLSet + 'whatsapp = :whatsapp, ';

      if Trim(ADoc.cep_novo) <> '' then
        SQLSet := SQLSet + 'cep = :cep, ';

      if Trim(ADoc.endereco_novo) <> '' then
        SQLSet := SQLSet + 'endereco = :endereco, ';

      if Trim(ADoc.numero_novo) <> '' then
        SQLSet := SQLSet + 'numero = :numero, ';

      if Trim(ADoc.bairro_novo) <> '' then
        SQLSet := SQLSet + 'bairro = :bairro, ';

      if Trim(ADoc.complemento_novo) <> '' then
        SQLSet := SQLSet + 'complemento = :complemento, ';

      if IdCidade > 0 then
        SQLSet := SQLSet + 'id_cidade = :id_cidade, ';

      if SQLSet = '' then
        raise Exception.Create('Não existem dados novos para processar.');

      Delete(SQLSet, Length(SQLSet) - 1, 2);

      Qry.Close;
      Qry.SQL.Text :=
        'UPDATE socio SET ' + SQLSet +
        ' WHERE id_socio = :id_socio ' +
        '   AND id_empresa = :id_empresa ' +
        '   AND situacao IN (''ATIVO'', ''S'') ';

      if Trim(ADoc.email_novo) <> '' then
        Qry.ParamByName('email').AsString := Trim(ADoc.email_novo);

      if Trim(ADoc.telefone_novo) <> '' then
        Qry.ParamByName('celular').AsString := Trim(ADoc.telefone_novo);

      if Trim(ADoc.whatsapp_novo) <> '' then
        Qry.ParamByName('whatsapp').AsString := Trim(ADoc.whatsapp_novo);

      if Trim(ADoc.cep_novo) <> '' then
        Qry.ParamByName('cep').AsString := Trim(ADoc.cep_novo);

      if Trim(ADoc.endereco_novo) <> '' then
        Qry.ParamByName('endereco').AsString := Trim(ADoc.endereco_novo);

      if Trim(ADoc.numero_novo) <> '' then
        Qry.ParamByName('numero').AsString := Trim(ADoc.numero_novo);

      if Trim(ADoc.bairro_novo) <> '' then
        Qry.ParamByName('bairro').AsString := Trim(ADoc.bairro_novo);

      if Trim(ADoc.complemento_novo) <> '' then
        Qry.ParamByName('complemento').AsString := Trim(ADoc.complemento_novo);

      if IdCidade > 0 then
        Qry.ParamByName('id_cidade').AsInteger := IdCidade;

      Qry.ParamByName('id_socio').AsInteger := AIdSocio;
      Qry.ParamByName('id_empresa').AsInteger := AIdEmpresa;
      Qry.ExecSQL;

      Qry.SQL.Text :=
        'UPDATE integracao_atualizacao_cadastral ' +
        'SET situacao = ''PROCESSADO'', ' +
        '    erro = NULL, ' +
        '    processado_em = NOW() ' +
        'WHERE id_solicitacao_api = :id_solicitacao_api ' +
        '  AND id_empresa = :id_empresa ' +
        '  AND situacao = ''PENDENTE'' ';
      Qry.ParamByName('id_solicitacao_api').AsLargeInt := ADoc.Id_Solicitacao_API;
      Qry.ParamByName('id_empresa').AsInteger := AIdEmpresa;
      Qry.ExecSQL;

      if Qry.RowsAffected <= 0 then
        raise Exception.Create('Não foi possível finalizar a solicitação como processada.');

      dm.Conn.Commit;
      Result := True;
    except
      dm.Conn.Rollback;
      raise;
    end;
  finally
    Qry.Free;
  end;
end;

end.
