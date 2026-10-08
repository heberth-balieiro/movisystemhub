unit Controller.AssociadoAtualizacaoAPI;

interface

uses
  Model.AssociadoAtualizarAPI,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections;
type
  TAssociadoAtualizacaoController = class
  private

  public

    class function ListarTodos(const FiltroCampo, FiltroSituacao, FiltroOrdem: string): TObjectList<TAssociadoAtualizacao>;
    class function BuscarPorID(AID: Integer): TAssociadoAtualizacao;
    //class function Salvar(ADoc: TAssociadoAtualizacao; out RetornoID:integer; out AStr:String): Boolean;
    //class function Excluir(const AIDRegistro: integer; const AIDUser: Integer; const AIDEmpresa:integer): Boolean;

  end;

implementation

{ TAssociadoAtualizacaoController }

uses UDM, cxDateUtils, System.Variants;

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
