unit Controller.AssociadoAtualizacaoAPI;

interface

uses
  Model.AssociadoAtualizarAPI,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  DAO.AssociadoAtualizacaoAPI;
type
  TAssociadoAtualizacaoController = class
  private

  public

    class function ListarTodos(const FiltroCampo, FiltroSituacao, FiltroOrdem: string): TObjectList<TAssociadoAtualizacao>;
    class function BuscarPorID(AID: Integer): TAssociadoAtualizacao;
    class function BuscarAssociadoVinculo(ADoc: TAssociadoDadosAtuais; Const AMatricula, AIDEmpresa: Integer; Const ACPF:string): Boolean;
    class function Rejeitar(const AIdSolicitacaoAPI: Int64; const AIdEmpresa: Integer; const AMotivo: string): Boolean;
    class function MarcarErro(const AIdSolicitacaoAPI: Int64; const AIdEmpresa: Integer; const AMotivo: string): Boolean;
    class function ProcessarAtualizacao(ADoc: TAssociadoAtualizacao; const AIdSocio, AIdEmpresa: Integer): Boolean;
    //class function Excluir(const AIDRegistro: integer; const AIDUser: Integer; const AIDEmpresa:integer): Boolean;

  end;

implementation

{ TAssociadoAtualizacaoController }

uses UDM, cxDateUtils, System.Variants;

class function TAssociadoAtualizacaoController.BuscarAssociadoVinculo(ADoc: TAssociadoDadosAtuais; const AMatricula, AIDEmpresa: Integer;
                                const ACPF: string): Boolean;
begin
  Result := TDaoAssociadoAtualizacao.BuscarAssociadoVinculo(
    ADoc,
    AMatricula,
    AIDEmpresa,
    ACPF);
end;

class function TAssociadoAtualizacaoController.BuscarPorID(AID: Integer): TAssociadoAtualizacao;
var
  FDAO: TDAOOperacao<TAssociadoAtualizacao>;
begin
  FDAO := TDAOOperacao<TAssociadoAtualizacao>.Create(dm.Conn);

  Try
    Try
      Result := FDAO.FindById(AID);
    except
      raise;
    end;
  Finally
    FDAO.Free;
  End;
end;

class function TAssociadoAtualizacaoController.Rejeitar(
  const AIdSolicitacaoAPI: Int64;
  const AIdEmpresa: Integer;
  const AMotivo: string): Boolean;
begin
  if AIdSolicitacaoAPI <= 0 then
    raise Exception.Create('ID da solicitação inválido.');

  if AIdEmpresa <= 0 then
    raise Exception.Create('Empresa inválida.');

  if Trim(AMotivo) = '' then
    raise Exception.Create('Informe o motivo da rejeição.');

  Result := TDaoAssociadoAtualizacao.Rejeitar(
    AIdSolicitacaoAPI,
    AIdEmpresa,
    Trim(AMotivo)
  );
end;

class function TAssociadoAtualizacaoController.MarcarErro(
  const AIdSolicitacaoAPI: Int64;
  const AIdEmpresa: Integer;
  const AMotivo: string): Boolean;
begin
  if AIdSolicitacaoAPI <= 0 then
    raise Exception.Create('ID da solicitação inválido.');

  if AIdEmpresa <= 0 then
    raise Exception.Create('Empresa inválida.');

  if Trim(AMotivo) = '' then
    raise Exception.Create('Informe o motivo do erro.');

  Result := TDaoAssociadoAtualizacao.MarcarErro(
    AIdSolicitacaoAPI,
    AIdEmpresa,
    Trim(AMotivo)
  );
end;

class function TAssociadoAtualizacaoController.ProcessarAtualizacao(
  ADoc: TAssociadoAtualizacao;
  const AIdSocio, AIdEmpresa: Integer): Boolean;
begin
  if not Assigned(ADoc) then
    raise Exception.Create('Dados da atualização cadastral não informados.');

  if ADoc.Id_Solicitacao_API <= 0 then
    raise Exception.Create('ID da solicitação inválido.');

  if AIdSocio <= 0 then
    raise Exception.Create('Associado não localizado para processamento.');

  if AIdEmpresa <= 0 then
    raise Exception.Create('Empresa inválida.');

  if (Trim(ADoc.email_novo) = '') and
     (Trim(ADoc.telefone_novo) = '') and
     (Trim(ADoc.whatsapp_novo) = '') and
     (Trim(ADoc.cep_novo) = '') and
     (Trim(ADoc.endereco_novo) = '') and
     (Trim(ADoc.numero_novo) = '') and
     (Trim(ADoc.bairro_novo) = '') and
     (Trim(ADoc.complemento_novo) = '') and
     (Trim(ADoc.cidade_nova) = '') then
    raise Exception.Create('Não existem dados novos para processar.');

  Result := TDaoAssociadoAtualizacao.ProcessarAtualizacao(
    ADoc,
    AIdSocio,
    AIdEmpresa
  );
end;

class function TAssociadoAtualizacaoController.ListarTodos(
  const FiltroCampo, FiltroSituacao, FiltroOrdem: string
): TObjectList<TAssociadoAtualizacao>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
  FDAO: TDAOOperacao<TAssociadoAtualizacao>;
const
  QryStr =
    'SELECT ' +
    ' id_solicitacao_api, ' +
    ' id_empresa, ' +
    ' pessoa_id_api, ' +
    ' nome, ' +
    ' cpf, ' +
    ' matricula, ' +
    ' email_novo, ' +
    ' telefone_novo, ' +
    ' whatsapp_novo, ' +
    ' situacao, ' +
    ' criado_em_api, ' +
    ' recebido_em, ' +
    ' processado_em, ' +
    ' erro, ' +
    ' cep_novo, ' +
    ' endereco_novo, ' +
    ' numero_novo, ' +
    ' bairro_novo, ' +
    ' complemento_novo, ' +
    ' cidade_nova ' +
    'FROM integracao_atualizacao_cadastral ' +
    'WHERE 1 = 1 ';
begin
  SQL := '';
  SQLORDER := '';
  Params := [];

  FDAO := TDAOOperacao<TAssociadoAtualizacao>.Create(dm.Conn);
  try
    if FiltroCampo.Trim <> '' then
    begin
      SQL := SQL +
        ' AND (' +
        'nome LIKE :filtro ' +
        'OR cpf LIKE :filtro ' +
        'OR matricula LIKE :filtro' +
        ')';

      Params := Params +
        [TPair<string, Variant>.Create(
          'filtro',
          '%' + FiltroCampo.Trim + '%'
        )];
    end;

    if FiltroSituacao.Trim <> '' then
    begin
      SQL := SQL + ' AND situacao = :situacao';

      Params := Params +
        [TPair<string, Variant>.Create(
          'situacao',
          FiltroSituacao.Trim
        )];
    end;

    if SameText(FiltroOrdem, 'Nome') then
      SQLORDER := ' ORDER BY nome'
    else if SameText(FiltroOrdem, 'Matricula') then
      SQLORDER := ' ORDER BY matricula'
    else if SameText(FiltroOrdem, 'CPF') then
      SQLORDER := ' ORDER BY cpf'
    else if SameText(FiltroOrdem, 'Situacao') then
      SQLORDER := ' ORDER BY situacao'
    else if SameText(FiltroOrdem, 'Recebimento') then
      SQLORDER := ' ORDER BY recebido_em'
    else
      SQLORDER := ' ORDER BY recebido_em DESC';

    Result := FDAO.FindWhere(
      QryStr + SQL + SQLORDER,
      Params
    );
  finally
    FDAO.Free;
  end;
end;

end.
