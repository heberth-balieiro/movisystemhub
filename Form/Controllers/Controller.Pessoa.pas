unit Controller.Pessoa;

interface

uses
  Model.Pessoa,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao.Pessoa, uni,
  Controller.SindicatoHistorico, Model.SindicatoHistorico, Vcl.Session;

//Type
//  TDesfiliarAssociado = Record
//  AIdAssociado:integer;
//  AData:Tdate;
//  ASituacao:String;
//  AIdMotivo:Integer;
//  AObservacao:
//End;

type
  TPessoaController = class
  private
    FDAO: TDAOOperacao<TPessoa>;

  public
    constructor Create;
    destructor Destroy; override;

    function ListarTodos(const FiltroCampo, FiltroStatus:string;
                   const FiltroOrdem: string =' order by s.nome';
                   const FiltroSecretaria: integer = 0;
                   const FiltroLotacao: integer = 0;
                   const FiltroCidade: integer = 0): TObjectList<TPessoa>;

    function BuscarPorID(AID: Integer): TPessoa;
    function Salvar(ADoc: TPessoa; out RetornoID:integer): Boolean;
    function Excluir(AID: Integer): Boolean;
    function ExcluidoCancelado(AID: Integer):boolean;
    function IncluiRegistroSincronizar:boolean;
    function IncluiRegistroDependenteSincronizar:boolean;

    //Filtro para Pessoa
    function ListarPessoas(const FiltroCampo, FiltroStatus,FiltroPessoa: string): TObjectList<TPessoa>;


    //Funcao para relatorio de associado
    Function ImpressaoRelatorioSimples(Qry: TUniquery; Filtro: String): Boolean;


    //Função para desfiliacao
    Function DesfiliarAssociado(ADoc:TSindicatoHistorico):Boolean;
    function RefiliarAssociado(ADoc: TSindicatoHistorico): Boolean;

  end;

  Var
  ObjHistorico  : TSindicatoHistorico;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TPessoaController }

function TPessoaController.ListarPessoas(const FiltroCampo, FiltroStatus, FiltroPessoa: string): TObjectList<TPessoa>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
  Filtro: string;
  NumValor: Integer;
  EhNumero: Boolean;
begin
  Filtro := Trim(FiltroCampo);
  SQL   := ' SELECT                                                            '+
            ' s.id_socio as idsocio,                                                      '+
            ' CASE                                                             '+
            ' WHEN s.cliente = ''S'' AND s.fornecedor = ''S''                      '+
            ' THEN CONCAT(s.codigo, ''/'', s.codfornecedor)                      '+
            ' WHEN s.cliente = ''S'' THEN CAST(s.codigo AS CHAR)                 '+
            ' WHEN s.fornecedor = ''S'' THEN CAST(s.codfornecedor AS CHAR)       '+
            ' ELSE NULL                                                        '+
            ' END AS codigo_exibir,                                            '+
            ' s.situacao, s.nome, s.apelido, s.telefone, s.whatsapp, s.cli_tipo as clitipo, '+
            ' c.cidade,                                                        '+
            ' CASE                                                             '+
            ' WHEN s.cliente=''S'' AND s.fornecedor=''S'' THEN ''CLIENTE / FORNECEDOR'' '+
            ' WHEN s.cliente=''S'' THEN ''CLIENTE''                                '+
            ' WHEN s.fornecedor=''S'' THEN ''FORNECEDOR''                          '+
            ' END AS tipo_pessoa, envemail, envwhats,                                               '+
            ' CASE                                                              '+
            ' WHEN s.cli_tipo = ''FÍSICA'' THEN                                        '+
            ' CONCAT(                                                           '+
            ' SUBSTRING(s.cpf,1,3),''.'',                                         '+
            ' SUBSTRING(s.cpf,4,3),''.'',                                         '+
            ' SUBSTRING(s.cpf,7,3),''-'',                                         '+
            ' SUBSTRING(s.cpf,10,2)                                             '+
            ' )                                                                 '+
            ' WHEN s.cli_tipo = ''JURÍDICA'' THEN                                        '+
            ' CONCAT(                                                           '+
            ' SUBSTRING(s.cpf,1,2),''.'',                                        '+
            ' SUBSTRING(s.cpf,3,3),''.'',                                        '+
            ' SUBSTRING(s.cpf,6,3),''/'',                                        '+
            ' SUBSTRING(s.cpf,9,4),''-'',                                        '+
            ' SUBSTRING(s.cpf,13,2)                                            '+
            ' )                                                                 '+
            ' END AS cpf                                                   '+
            ' FROM socio s                                                     '+
            ' INNER JOIN cidade c ON s.id_cidade = c.id_cidade                 '+
            ' WHERE s.excluido = 0';

  if Filtro <> '' then
  begin
    EhNumero := TryStrToInt(Filtro, NumValor);
    if EhNumero then
    begin
      SQL := SQL +
        ' and (s.codigo= :codigo )';
      //Params := Params + [TPair<string, Variant>.Create('matricula', NumValor)];
      Params := Params + [TPair<string, Variant>.Create('codigo', NumValor)];
    end
    else
    begin
      SQL       := SQL + ' and (s.nome LIKE :filtroTexto or s.apelido LIKE :filtroTexto or s.cpf like :filtroTexto or s.endereco like :filtroTexto )';
      Params    := Params + [TPair<string, Variant>.Create('filtroTexto', '%' + Filtro + '%')];
    end;
  end;

  if FiltroStatus.Trim <> '' then
  begin
    SQL := SQL + ' and s.situacao = :ativo';
    Params := Params + [TPair<string, Variant>.Create('ativo', FiltroStatus)];
  end;

  if FiltroPessoa.Trim <> '' then
  begin
    if FiltroPessoa = 'C' then
    begin
      SQL := SQL + ' and s.cliente = :cliente';
      Params := Params + [TPair<string, Variant>.Create('cliente', 'S')];
    end;
    if FiltroPessoa = 'F' then
    begin
      SQL := SQL + ' and s.fornecedor = :fornecedor';
      Params := Params + [TPair<string, Variant>.Create('fornecedor', 'S')];
    end;
  end;

  SQLORDER  := ' order by s.nome';

  Result := FDAO.FindWhere(SQL + SQLORDER, Params);
end;

function TPessoaController.ListarTodos(const FiltroCampo, FiltroStatus:String;
                                        const FiltroOrdem: string = ' order by s.nome';
                                        const FiltroSecretaria: integer = 0;
                                        const FiltroLotacao: integer = 0;
                                        const FiltroCidade: integer = 0): TObjectList<TPessoa>;
var
  SQL: string;
  Params: TArray<TPair<string, Variant>>;
  Filtro: string;
  NumValor: Integer;
  EhNumero: Boolean;
begin
  Filtro := Trim(FiltroCampo);

  SQL   := 'Select                                   '+
           ' s.id_socio as idsocio,                             '+
           ' s.codigo,                               '+
           ' Coalesce(s.matricula,0) as matricula,  '+
           ' s.situacao,                              '+
           ' s.nome,                                 '+
           ' s.apelido,                              '+
           ' s.telefone,                             '+
           ' s.celular,                              '+
           ' s.whatsapp,                             '+
           ' s.cpf,                                  '+
           ' s.email,                                 '+
           ' sc.razao as socio_secretaria,  '+
           ' s.socio_deste as sociodeste, '+
           ' s.nascimento  '+
           ' From Socio s                            '+
           ' Left Join secretaria sc '+
           ' on s.escritorio = sc.id_secretaria    '+
           ' where s.excluido= 0                      '+
           ' and s.id_socio > 0                      '+
           ' and s.cliente=''S'' ';

  if Filtro <> '' then
  begin
    EhNumero      := TryStrToInt(Filtro, NumValor);
    if EhNumero then
    begin
      SQL := SQL +
        ' and (s.matricula= :matricula or s.codigo= :codigo)';
      Params := Params +
        [TPair<string, Variant>.Create('matricula', NumValor)];
      Params := Params +
        [TPair<string, Variant>.Create('codigo', NumValor)];
    end
    else
    begin
      SQL := SQL +
        ' and (s.nome    LIKE :filtroTexto '+
        '  or s.apelido LIKE :filtroTexto or s.cpf like :filtroTexto) ';

      Params := Params +
        [TPair<string, Variant>.Create('filtroTexto', '%' + Filtro + '%')];
    end;
  end;

  if FiltroStatus.Trim <> '' then
  begin
    SQL := SQL + ' and s.situacao = :ativo ';
    Params := Params + [TPair<string, Variant>.Create('ativo', FiltroStatus)];
  end;

  if FiltroSecretaria > 0 then
  begin
    SQL := SQL + ' and s.id_secretaria = :AID ';
    Params := Params + [TPair<string, Variant>.Create('AID', FiltroSecretaria)];
  end;

  if FiltroLotacao > 0 then
  begin
    SQL := SQL + ' and s.id_lotacao = :idlotacao ';
    Params := Params + [TPair<string, Variant>.Create('idlotacao', FiltroLotacao)];
  end;

  if FiltroCidade > 0 then
  begin
    SQL     := SQL + ' and s.id_cidade = :idcidade ';
    Params  := Params + [TPair<string, Variant>.Create('idcidade', FiltroCidade)];
  end;

  Result := FDAO.FindWhere(SQL + FiltroOrdem, Params);
end;

function TPessoaController.BuscarPorID(AID: Integer): TPessoa;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TPessoaController.Create;
begin
  FDAO := TDAOOperacao<TPessoa>.Create(dm.Conn);
end;

destructor TPessoaController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TPessoaController.ExcluidoCancelado(AID: Integer): boolean;
var
Dao :TDaoPessoa;
begin
  Result  := false;
  Dao     := TDaoPessoa.Create;
  try
    if Dao.Delete(AID) then
    result  := True;
  finally
    Dao.Free;
  end;
end;

function TPessoaController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TPessoaController.ImpressaoRelatorioSimples(Qry: TUniquery; Filtro: String): Boolean;
var
Dao :TDaoPessoa;
begin
  Dao     := TDaoPessoa.Create;
  try
    Qry.Connection  := dm.Conn;
    Result  := dao.ImpressaoRelatorioSimples(Qry, Filtro);
  finally
    Dao.Free;
  end;
end;

function TPessoaController.IncluiRegistroDependenteSincronizar: boolean;
var
Dao :TDaoPessoa;
begin
  Result  := false;
  Dao     := TDaoPessoa.Create;
  try
    if Dao.IncluiRegistroDependenteSincronizar then
    result  := True;
  finally
    Dao.Free;
  end;
end;

function TPessoaController.IncluiRegistroSincronizar: boolean;
var
Dao :TDaoPessoa;
begin
  Result  := false;
  Dao     := TDaoPessoa.Create;
  try
    if Dao.IncluiRegistroSincronizar then
    result  := True;
  finally
    Dao.Free;
  end;
end;

function TPessoaController.Salvar(ADoc: TPessoa; out RetornoID: integer): Boolean;
begin
  Result          :=  False;

  if ADoc.idsocio = 0 then
  begin
    ADoc.Codigo       := FDao.GetNextCode('codigo');
    Try
      RetornoID       :=  FDAO.Insert(ADoc);
      Result          :=  True;

      //Implementar o historico
      if (TSession.oneAssociacao='S') or (TSession.oneSindicado='S') then
      begin
        ObjHistorico    := nil;
        ObjHistorico    := TSindicatoHistorico.create;
        Try
          ObjHistorico.id_historico         := 0;
          ObjHistorico.id_associado         := RetornoID;
          ObjHistorico.data_filiacao        := ADoc.sociodeste;
          ObjHistorico.situacao_nova        := ADoc.situacao;
          ObjHistorico.id_motivo            := 10;
          ObjHistorico.observacao           := 'Novo cadastro';
          ObjHistorico.id_usuario           := ADoc.idusuario;
          ObjHistorico.documento_protocolo  := '';
          ObjHistorico.id_empresa_nova      := ADoc.sindidempresa;
          ObjHistorico.id_secretaria_nova   := ADoc.idescritorio;
          ObjHistorico.id_lotacao_nova      := ADoc.idlotacao;
          ObjHistorico.id_profissao_nova    := ADoc.idprofissao;
          ObjHistorico.matricula_nova       := ADoc.matricula;
          ObjHistorico.id_empresa           := ADoc.idempresa;
          ObjHistorico.tipo                 := 'CADASTRO DE ASSOCIADO';
          ObjHistorico.cor                  := 'clGreen';

          TSindicatoHistoricoController.Incluir(ObjHistorico);
        Finally
          ObjHistorico.Free;
        End;
      end;

    except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;

  end
  else
  begin
    Try
      Result := FDAO.Update(ADoc);
    except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;
  end;
end;

function TPessoaController.DesfiliarAssociado(ADoc: TSindicatoHistorico): Boolean;
begin
  Result  := False;
  //Inativar cadastro e desfiliar
  if TDaoPessoa.DesfiliarAssociado(ADoc.situacao_nova, ADoc.id_associado, ADoc.id_empresa) then
  begin
    //Inativar dependente
    TDaoPessoa.DesfiliarAssociadoDependente(ADoc.id_usuario, ADoc.id_associado, ADoc.id_empresa);

    //Inativar carteira
    if Adoc.inativar_carteira='S' then
    TDaoPessoa.DesfiliarAssociadoInativarCarteira(ADoc.id_usuario,ADoc.id_associado,ADoc.id_empresa);

    //Incluir no historico
    Result  := TSindicatoHistoricoController.Incluir(ADoc);
  end;
end;

Function TPessoaController.RefiliarAssociado(ADoc:TSindicatoHistorico):Boolean;
begin
  Result  := False;

  Result  := TSindicatoHistoricoController.Incluir(ADoc);

end;


end.
