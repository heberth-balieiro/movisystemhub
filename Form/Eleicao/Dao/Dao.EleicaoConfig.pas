unit Dao.EleicaoConfig;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient,
  Model.EleicaoConfig,
  Model.EleicaoChapa, uConfiguracaoService,
  System.StrUtils;

Type
  TDaoEleicaoConfig = Class
  Private

  public
    Class Function BuscarPorIDEleicao(AID: Integer): TModelEleicaoConfig;
    Class Function ExisteChapa(const AStr: String; const AIDRegistro:Integer; const AIDEmpresa: Integer =0; const AIDIgnorar:integer = 0):Boolean;
    Class Function ExisteChapaNumero(const AStr: Integer; const AIDRegistro:Integer; const AIDEmpresa: Integer =0; const AIDIgnorar:integer = 0):Boolean;
    Class Function SalvarHomologacao(ADoc:TModelEleicaoChapaHomologacao):Boolean;
    Class Function SalvarDeferimento(ADoc:TModelEleicaoChapaHomologacao):Boolean;
    Class Function ExisteHomologado(Const AIDRegistro, AIDEmpresa, AIdEleicao:Integer):Boolean;
    Class Function ExisteDeferido(Const AIDRegistro, AIDEmpresa, AIdEleicao:Integer):Boolean;


    Class Function ExisteMembro(Const AIDEleicao, AIDChapa, AIDempresa: Integer; Const AStr:String):Boolean;
    class function ExistePresidente(const AIDEleicao, AIDChapa,AIDEmpresa: Integer): Boolean; static;
    class function ExisteVicePresidente(const AIDEleicao, AIDChapa, AIDEmpresa: Integer): Boolean; static;

    class function JaExisteNaEleicao(AIDEleicao,AIDAssociado: Integer): Boolean; static;
    class function MarcarEleitorSincronizacao(Const AIDEleicao: Integer):boolean; static;
    class function MarcarTabelaSincronizacao(Const AIDEleicao, AIDEmpresa: Integer; const ATabela:string):boolean; static;
    class function MarcarTabelaAssociadoSinc(Const AIDSocio, AIDEmpresa: Integer):boolean; static;
    class function BuscarEleicaoConfiguracoes(const AIDEleicao,AIDEmpresa:integer):TArray<integer>; static;
    class function BuscarEleicaoComissao(const AIDEleicao,AIDEmpresa:integer):TArray<integer>; static;
    class function BuscarEleicaoChapas(const AIDEleicao,AIDEmpresa:integer):TArray<integer>; static;
    class function BuscarEleicaoMembros(const AIDEleicao,AIDEmpresa:integer):TArray<integer>; static;
    class function BuscarEleicaoEleitores(const AIDEleicao,AIDEmpresa:integer):TArray<integer>; static;
    class function BuscarAssociadoEleitor(const AIDEleicao, AIDEmpresa:integer):TArray<integer>; static;

    class function RetornoURlEleicao(AIDeleicao:integer; out AURL:String):Boolean; Static;

    class function AlterarSituacaoEleicao(Const AIDEleicao: integer):boolean;
    class function ValidarEleicaoAbrir(const AIDEleicao, AIDEmpresa:integer; out AAlerta: String):boolean;

    //Funcao para assembleia
    class function ExisteQuestao(const ATitulo: string; const AOrdem, AIDEleicao, AIDEmpresa, AIDIgnorar: Integer; out AMensagem: string): Boolean;
  End;

implementation

{ TDaoEleicaoConfig }

{$REGION 'Eleicao Publicar para sincronizar'}

class function TDaoEleicaoConfig.AlterarSituacaoEleicao(const AIDEleicao: integer): boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update eleicao set situacao= ''AGENDADA'' where id_eleicao= :ideleicao';
begin
  Result  := False;
  Qry     := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;

      Qry.ParamByName('ideleicao').AsInteger  := AIDEleicao;
      Qry.ExecSQL;
      Result          := Qry.RowsAffected > 0;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao na função de AlterarSituacaoEleicao:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TDaoEleicaoConfig.MarcarTabelaAssociadoSinc(const AIDSocio,AIDEmpresa: Integer): boolean;
var
  Qry: TUniQuery;
  QryStr :String;
begin
  Result  := False;
  QryStr  := '';

  QryStr  := 'Update socio set sinc_app=''S'' where id_socio= :id and id_empresa= :idempresa';
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection  := dm.Conn;
    Qry.SQL.Text    := QryStr;
    Qry.ParamByName('id').AsInteger         := AIDSocio;
    Qry.ParamByName('idempresa').AsInteger  := AIDEmpresa;
    Qry.ExecSQL;
    Result  := True;
  finally
    Qry.Free;
  end;
end;

class function TDaoEleicaoConfig.MarcarTabelaSincronizacao(Const AIDEleicao, AIDEmpresa: Integer; const ATabela:string):boolean;
var
  Qry: TUniQuery;
  QryStr :String;
begin
  Result  := False;
  QryStr  := '';
  if not MatchText(
    LowerCase(Trim(ATabela)),
    [
      'eleicao',
      'eleicao_configuracao',
      'eleicao_comissao',
      'eleicao_chapa',
      'eleicao_chapa_membro',
      'eleicao_eleitor'
    ]
  ) then
    raise Exception.Create('Tabela inválida para sincronização.');

  QryStr  := 'Update '+ATabela+' set sinc_app=''S'' where id_eleicao= :ideleicao and id_empresa= :idempresa';
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection  := dm.Conn;
    Qry.SQL.Text    := QryStr;
    Qry.ParamByName('ideleicao').AsInteger := AIDeleicao;
    Qry.ParamByName('idempresa').AsInteger := AIDEmpresa;
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

class function TDaoEleicaoConfig.BuscarEleicaoConfiguracoes(const AIDEleicao, AIDEmpresa: integer): TArray<integer>;
var
  Qry:TUniquery;
  I:Integer;
const
  QryStr = 'Select id from eleicao_configuracao where id_eleicao= :ideleicao and id_empresa= :idempresa';
begin
  SetLength(Result,0);
  Qry := TUniQuery.Create(nil);

  Try
    Qry.Connection  := dm.Conn;
    Qry.SQL.Text    := QryStr;
    Qry.ParamByName('ideleicao').AsInteger     := AIDEleicao;
    Qry.ParamByName('idempresa').AsInteger     := AIDEmpresa;
    Qry.Open;

    I := 0;

    while not Qry.Eof do
    begin
      SetLength(Result,I + 1);
      Result[I] := Qry.FieldByName('id').AsInteger;
      Inc(I);
      Qry.Next;
    end;

  Finally
    Qry.Free;
  End;

end;

class function TDaoEleicaoConfig.BuscarEleicaoComissao(const AIDEleicao,AIDEmpresa:integer):TArray<integer>;
var
  Qry:TUniquery;
  I:Integer;
const
  QryStr = 'Select id_comissao from eleicao_comissao where id_eleicao= :ideleicao and id_empresa= :idempresa';
begin
  SetLength(Result,0);
  Qry := TUniQuery.Create(nil);

  Try
    Qry.Connection  := dm.Conn;
    Qry.SQL.Text    := QryStr;
    Qry.ParamByName('ideleicao').AsInteger     := AIDEleicao;
    Qry.ParamByName('idempresa').AsInteger     := AIDEmpresa;
    Qry.Open;

    I := 0;

    while not Qry.Eof do
    begin
      SetLength(Result,I + 1);
      Result[I] := Qry.FieldByName('id_comissao').AsInteger;
      Inc(I);
      Qry.Next;
    end;

  Finally
    Qry.Free;
  End;
end;

class function TDaoEleicaoConfig.BuscarAssociadoEleitor(const AIDEleicao,AIDEmpresa: integer): TArray<integer>;
var
  Qry:TUniquery;
  I:Integer;
const
  QryStr = 'Select id_associado from eleicao_eleitor where id_eleicao= :ideleicao and id_empresa= :idempresa';
begin
  SetLength(Result,0);
  Qry := TUniQuery.Create(nil);

  Try
    Qry.Connection  := dm.Conn;
    Qry.SQL.Text    := QryStr;
    Qry.ParamByName('ideleicao').AsInteger     := AIDEleicao;
    Qry.ParamByName('idempresa').AsInteger     := AIDEmpresa;
    Qry.Open;

    I := 0;

    while not Qry.Eof do
    begin
      SetLength(Result,I + 1);
      Result[I] := Qry.FieldByName('id_associado').AsInteger;
      Inc(I);
      Qry.Next;
    end;

  Finally
    Qry.Free;
  End;
end;

class function TDaoEleicaoConfig.BuscarEleicaoChapas(const AIDEleicao,AIDEmpresa:integer):TArray<integer>;
var
  Qry:TUniquery;
  I:Integer;
const
  QryStr = 'Select id from eleicao_chapa where id_eleicao= :ideleicao and id_empresa= :idempresa';
begin
  SetLength(Result,0);
  Qry := TUniQuery.Create(nil);

  Try
    Qry.Connection  := dm.Conn;
    Qry.SQL.Text    := QryStr;
    Qry.ParamByName('ideleicao').AsInteger     := AIDEleicao;
    Qry.ParamByName('idempresa').AsInteger     := AIDEmpresa;
    Qry.Open;

    I := 0;

    while not Qry.Eof do
    begin
      SetLength(Result,I + 1);
      Result[I] := Qry.FieldByName('id').AsInteger;
      Inc(I);
      Qry.Next;
    end;

  Finally
    Qry.Free;
  End;
end;

class function TDaoEleicaoConfig.BuscarEleicaoMembros(const AIDEleicao,AIDEmpresa:integer):TArray<integer>;
var
  Qry:TUniquery;
  I:Integer;
const
  QryStr = 'Select id from eleicao_chapa_membro where id_eleicao= :ideleicao and id_empresa= :idempresa';
begin
  SetLength(Result,0);
  Qry := TUniQuery.Create(nil);

  Try
    Qry.Connection  := dm.Conn;
    Qry.SQL.Text    := QryStr;
    Qry.ParamByName('ideleicao').AsInteger     := AIDEleicao;
    Qry.ParamByName('idempresa').AsInteger     := AIDEmpresa;
    Qry.Open;

    I := 0;

    while not Qry.Eof do
    begin
      SetLength(Result,I + 1);
      Result[I] := Qry.FieldByName('id').AsInteger;
      Inc(I);
      Qry.Next;
    end;

  Finally
    Qry.Free;
  End;
end;

class function TDaoEleicaoConfig.BuscarEleicaoEleitores(const AIDEleicao,AIDEmpresa:integer):TArray<integer>;
var
  Qry:TUniquery;
  I:Integer;
const
  QryStr = 'Select id_eleitor from eleicao_eleitor where id_eleicao= :ideleicao and id_empresa= :idempresa';
begin
  SetLength(Result,0);
  Qry := TUniQuery.Create(nil);

  Try
    Qry.Connection  := dm.Conn;
    Qry.SQL.Text    := QryStr;
    Qry.ParamByName('ideleicao').AsInteger     := AIDEleicao;
    Qry.ParamByName('idempresa').AsInteger     := AIDEmpresa;
    Qry.Open;

    I := 0;

    while not Qry.Eof do
    begin
      SetLength(Result,I + 1);
      Result[I] := Qry.FieldByName('id_eleitor').AsInteger;
      Inc(I);
      Qry.Next;
    end;

  Finally
    Qry.Free;
  End;
end;

{$ENDREGION}

class function TDaoEleicaoConfig.BuscarPorIDEleicao(AID: Integer): TModelEleicaoConfig;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Try
    Qry := TUniQuery.Create(nil);
    try
      Qry.Connection := dm.Conn;
      SqlQuery := 'Select * from eleicao_configuracao where id_eleicao = :AID';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
        // Definindo parâmetros
      Qry.ParamByName('AID').AsInteger   := AID;
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        Result  := TModelEleicaoConfig.Create;
        Result.IdConfig                       := Qry.FieldByName('id').AsInteger;
        Result.IdEleicao                      := Qry.FieldByName('id_eleicao').AsInteger;
        Result.SituacaoInicial                := Qry.FieldByName('situacao_inicial').AsString;
        Result.ExigeHomologacaoFinal          := Qry.FieldByName('exige_homologacao_final').AsString;
        Result.PublicacaoAutomatica           := Qry.FieldByName('publicacao_automatica').AsString;
        Result.ExigeAssociadoAtivo            := Qry.FieldByName('exige_associado_ativo').AsString;
        Result.ExigeAssociadoAdimplente       := Qry.FieldByName('exige_associado_adimplente').AsString;
        Result.exige_tempo_minimo             := Qry.FieldByName('exige_tempo_minimo').AsString;
        Result.TempoMinimoFiliacao            := Qry.FieldByName('tempo_minimo_filiacao').AsInteger;
        Result.BloqueiaPendenciaFinanceira    := Qry.FieldByName('bloqueia_pendencia_financeira').AsString;
        Result.BloqueiaAssociadoSuspenso      := Qry.FieldByName('bloqueia_associado_suspenso').AsString;
        Result.gerar_eleitores_aptos          := Qry.FieldByName('gerar_eleitores_aptos').AsString;

        Result.Slug                           := Qry.FieldByName('slug').AsString;
        Result.NomeExibicao                   := Qry.FieldByName('nome_exibicao').AsString;
        Result.Logo                           := Qry.FieldByName('logo').AsString;
        Result.Banner                         := Qry.FieldByName('banner').AsString;
        Result.MensagemBoasVindas             := Qry.FieldByName('mensagem_boas_vindas').AsString;
        Result.UrlPublica                     := Qry.FieldByName('url_publica').AsString;
        Result.Email                          := Qry.FieldByName('email').AsString;
        Result.Telefone                       := Qry.FieldByName('telefone').AsString;
        Result.CorPrimaria                    := Qry.FieldByName('cor_primaria').AsString;
        Result.CorSecundaria                  := Qry.FieldByName('cor_secundaria').AsString;
        Result.UrlInstagram                   := Qry.FieldByName('url_instagram').AsString;
        Result.UrlFacebook                    := Qry.FieldByName('url_facebook').AsString;
        Result.UrlYoutube                     := Qry.FieldByName('url_youtube').AsString;
        Result.pagina_publicar                := Qry.FieldByName('pagina_publicar').AsString;

        Result.data_hora_inicio               := Qry.FieldByName('data_hora_inicio').AsDateTime;
        Result.data_hora_fim                  := Qry.FieldByName('data_hora_fim').AsDateTime;

        Result.abertura_automatica            := Qry.FieldByName('abertura_automatica').AsString;
        Result.encerramento_automatico        := Qry.FieldByName('encerramento_automatico').AsString;
        Result.votacao_secreta                := Qry.FieldByName('votacao_secreta').AsString;
        Result.exibir_resultado_parcial       := Qry.FieldByName('exibir_resultado_parcial').AsString;
        Result.publicacao_resultado           := Qry.FieldByName('publicacao_resultado').AsString;
        Result.controlar_quorum               := Qry.FieldByName('controlar_quorum').AsString;
        Result.tipo_quorum                    := Qry.FieldByName('tipo_quorum').AsString;
        Result.quorum_minimo                  := Qry.FieldByName('quorum_minimo').AsInteger;
        Result.quorum_percentual              := Qry.FieldByName('quorum_percentual').AsFloat;
        Result.quorum_base                    := Qry.FieldByName('quorum_base').AsString;
        Result.controlar_presenca             := Qry.FieldByName('controlar_presenca').AsString;
        Result.exigir_presenca_votacao        := Qry.FieldByName('exigir_presenca_votacao').AsString;
      end
      else
      Result  := nil;

    finally
      Qry.Free;
    end;
  except
    on E: Exception do
    begin
      raise Exception.Create(e.Message);
    end;
  end;

end;

class function TDaoEleicaoConfig.ExisteChapa(const AStr: String; const AIDRegistro:Integer; const AIDEmpresa, AIDIgnorar: integer): Boolean;
var
  Qry: TUniQuery;
  Const
  QryStr  = ' Select count(*) as total from eleicao_chapa where Upper(nome_chapa) = Upper(:nome_chapa) and id_eleicao= :id_eleicao ';
begin
  Result := False;

  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection  := dm.conn;
    Qry.SQL.Text    := QryStr;

    if AIDIgnorar > 0 then
      Qry.SQL.Add(' AND id <> :id ');


    if AIDEmpresa > 0 then
    begin
      Qry.SQL.Add(' and id_empresa = :id_empresa');
      Qry.ParamByName('id_empresa').AsInteger   := AIdEmpresa;
    end;

    Qry.ParamByName('nome_chapa').AsString     := Trim(AStr);

    if AIDIgnorar > 0 then
      Qry.ParamByName('id').AsInteger         := AIDIgnorar;

    Qry.ParamByName('id_eleicao').AsInteger             := AIDRegistro;

    Qry.Open;

    Result := Qry.FieldByName('total').AsInteger > 0;

  finally
    Qry.Free;
  end;
end;

class function TDaoEleicaoConfig.ExisteChapaNumero(const AStr: Integer; const AIDRegistro:Integer;
  const AIDEmpresa, AIDIgnorar: integer): Boolean;
var
  Qry: TUniQuery;
  Const
  QryStr  = ' Select count(*) as total from eleicao_chapa where num_chapa = :num_chapa and id_eleicao= :id_eleicao ';
begin
  Result := False;

  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection  := dm.conn;
    Qry.SQL.Text    := QryStr;

    if AIDIgnorar > 0 then
      Qry.SQL.Add(' AND id <> :id ');


    if AIDEmpresa > 0 then
    begin
      Qry.SQL.Add(' and id_empresa = :id_empresa');
      Qry.ParamByName('id_empresa').AsInteger   := AIdEmpresa;
    end;

    Qry.ParamByName('num_chapa').AsInteger     := AStr;

    if AIDIgnorar > 0 then
      Qry.ParamByName('id').AsInteger         := AIDIgnorar;

    Qry.ParamByName('id_eleicao').AsInteger             := AIDRegistro;

    Qry.Open;

    Result := Qry.FieldByName('total').AsInteger > 0;

  finally
    Qry.Free;
  end;
end;

class function TDaoEleicaoConfig.ExisteDeferido(const AIDRegistro, AIDEmpresa,
                                                      AIdEleicao: Integer): Boolean;
var
  Qry: TUniQuery;
  Const
  QryStr  = ' Select count(*) as total from eleicao_chapa where situacao=''INDEFERIDA'' '+
            ' and id =:id and id_eleicao= :id_eleicao and id_empresa = :idempresa ';
begin
  Result := False;

  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection  := dm.conn;
    Qry.SQL.Text    := QryStr;

    Qry.ParamByName('id').AsInteger             := AIDRegistro;
    Qry.ParamByName('id_eleicao').AsInteger     := AIdEleicao;
    Qry.ParamByName('idempresa').AsInteger      := AIDEmpresa;

    Qry.Open;

    Result := Qry.FieldByName('total').AsInteger > 0;

  finally
    Qry.Free;
  end;
end;

class function TDaoEleicaoConfig.ExisteHomologado(const AIDRegistro,AIDEmpresa, AIdEleicao: Integer): Boolean;
var
  Qry: TUniQuery;
  Const
  QryStr  = ' Select count(*) as total from eleicao_chapa where situacao=''HOMOLOGADA'' and id =:id and id_eleicao= :id_eleicao and id_empresa = :idempresa ';
begin
  Result := False;

  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection  := dm.conn;
    Qry.SQL.Text    := QryStr;

    Qry.ParamByName('id').AsInteger             := AIDRegistro;
    Qry.ParamByName('id_eleicao').AsInteger     := AIdEleicao;
    Qry.ParamByName('idempresa').AsInteger      := AIDEmpresa;

    Qry.Open;

    Result := Qry.FieldByName('total').AsInteger > 0;

  finally
    Qry.Free;
  end;
end;

class function TDaoEleicaoConfig.SalvarDeferimento(ADoc: TModelEleicaoChapaHomologacao): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update eleicao_chapa set data_indeferimento= :1, motivo_indeferimento= :2, '+
            ' id_usuario_defe= :3, situacao=''INDEFERIDA'', sinc_app= :sinc_app where id= :id and id_empresa= :idempresa';
begin
  Result  := False;
  Qry     := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;

      Qry.ParamByName('1').AsDateTime         := Adoc.data_indeferimento;
      Qry.ParamByName('2').Asstring           := Adoc.motivo_indeferimento;
      Qry.ParamByName('3').AsInteger          := Adoc.id_usuario_defe;
      Qry.ParamByName('sinc_app').AsString    := Adoc.sinc_app;
      Qry.ParamByName('idempresa').AsInteger  := Adoc.idempresa;
      Qry.ParamByName('id').AsInteger         := Adoc.id;

      Qry.ExecSQL;
      Result          := Qry.RowsAffected > 0;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao na função de SalvarDeferimento:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TDaoEleicaoConfig.SalvarHomologacao(ADoc: TModelEleicaoChapaHomologacao): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update eleicao_chapa set data_homologacao= :1, id_usuario_homol= :2, '+
            'situacao=''HOMOLOGADA'', sinc_app= :sinc_app where id= :id and id_empresa= :idempresa';
begin
  Result  := False;
  Qry     := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;

      Qry.ParamByName('1').AsDateTime         := Adoc.data_homologacao;
      Qry.ParamByName('2').AsInteger          := Adoc.id_usuario_homol;
      Qry.ParamByName('sinc_app').AsString    := Adoc.sinc_app;
      Qry.ParamByName('id').AsInteger         := Adoc.id;
      Qry.ParamByName('idempresa').AsInteger  := Adoc.idempresa;
      Qry.ExecSQL;
      Result          := Qry.RowsAffected > 0;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao na função de SalvarHomologacao:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;


class function TDaoEleicaoConfig.ValidarEleicaoAbrir(const AIDEleicao,
                                                  AIDEmpresa: integer;
                                                  out AAlerta:String): boolean;
const
  QryStrC = 'Select Count(id) as total from eleicao_configuracao where id_eleicao= :ideleicao and id_empresa= :idempresa';
  QryStrCS = 'Select slug from eleicao_configuracao where id_eleicao= :ideleicao and id_empresa= :idempresa';
  QryStrP = 'Select Count(id) as total from eleicao_chapa where id_eleicao= :ideleicao and id_empresa= :idempresa ';
  QryStrM = 'Select Count(id) as total from eleicao_chapa_membro where id_eleicao= :ideleicao and id_empresa= :idempresa';
  QryStrE = 'Select Count(id_eleitor) as total from eleicao_eleitor where id_eleicao= :ideleicao and id_empresa= :idempresa';
  QryStrS = 'Select count(id_comissao) as total from eleicao_comissao where id_eleicao= :ideleicao and id_empresa= :idempresa';
var
  Qry: TUniQuery;
  ATemConfig, ATemChapa, ATemMembros, ATemEleitor, ATemComissao:Boolean;
begin
  Result      := False;
  ATemConfig  := False;
  ATemChapa   := False;
  ATemMembros := False;
  ATemEleitor := False;
  ATemComissao:= False;
  AAlerta     := '';
  Qry         := TUniQuery.Create(nil);

  try
    Qry.Connection := dm.Conn;

    {$REGION 'Verificar Comissao'}

      Qry.SQL.Text      := QryStrS;
      Qry.ParamByName('ideleicao').AsInteger := AIDEleicao;
      Qry.ParamByName('idempresa').AsInteger := AIDEmpresa;
      Qry.Open;
      ATemComissao  := Qry.FieldByName('total').AsInteger > 0;

      if not ATemComissao then
      begin
       AAlerta := 'Nenhuma comissão cadastrada para essa eleição';
       Exit;
      end;

    {$ENDREGION}

    {$Region 'Verifica configuracao'}
      Qry.Close;
      Qry.SQL.Text      := QryStrC;
      Qry.ParamByName('ideleicao').AsInteger := AIDEleicao;
      Qry.ParamByName('idempresa').AsInteger := AIDEmpresa;
      Qry.Open;
      ATemConfig  := Qry.FieldByName('total').AsInteger > 0;

      if not ATemConfig then
      begin
       AAlerta := 'Nenhuma configuração realizada para essa eleição';
       Exit;
      end;
    {$ENDREGION}

    {$Region 'Verifica eleicao slug'}
      Qry.Close;
      Qry.SQL.Text      := QryStrCS;
      Qry.ParamByName('ideleicao').AsInteger := AIDEleicao;
      Qry.ParamByName('idempresa').AsInteger := AIDEmpresa;
      Qry.Open;

      if Qry.IsEmpty or Trim(Qry.FieldByName('slug').AsString).IsEmpty then
      begin
        AAlerta := 'Slug não configurado para essa eleição.';
        Exit;
      end;
    {$ENDREGION}

    {$Region 'Verifica chapa'}
      Qry.Close;
      Qry.SQL.Text      := QryStrP;
      Qry.ParamByName('ideleicao').AsInteger := AIDEleicao;
      Qry.ParamByName('idempresa').AsInteger := AIDEmpresa;
      Qry.Open;
      ATemChapa  := Qry.FieldByName('total').AsInteger > 0;

      if not ATemChapa then
      begin
       AAlerta := 'Nenhuma chapa cadastrada para essa eleição';
       exit;
      end;
    {$ENDREGION}

    {$Region 'Verifica membro'}
      Qry.Close;
      Qry.SQL.Text      := QryStrM;
      Qry.ParamByName('ideleicao').AsInteger := AIDEleicao;
      Qry.ParamByName('idempresa').AsInteger := AIDEmpresa;
      Qry.Open;
      ATemMembros  := Qry.FieldByName('total').AsInteger > 0;

      if not ATemMembros then
      begin
       AAlerta := 'Nenhum membro cadastrado na chapa para essa eleição';
       exit;
      end;
    {$ENDREGION}

    {$Region 'Verifica eleitor'}
      Qry.Close;
      Qry.SQL.Text      := QryStrM;
      Qry.ParamByName('ideleicao').AsInteger := AIDEleicao;
      Qry.ParamByName('idempresa').AsInteger := AIDEmpresa;
      Qry.Open;
      ATemEleitor  := Qry.FieldByName('total').AsInteger > 0;

      if not ATemEleitor then
      begin
       AAlerta  := 'Nenhum eleitor cadastrado para essa eleição';
       exit;
      end;
    {$ENDREGION}

    Result  := ATemComissao and ATemConfig and ATemChapa and ATemMembros and ATemEleitor;

  finally
    Qry.Free;
  end;
end;

class function TDaoEleicaoConfig.ExisteMembro(const AIDEleicao, AIDChapa, AIDEmpresa: Integer;
                                                      const AStr: string): Boolean;
const
  QryStr =
    'SELECT COUNT(*) AS total                         ' +
    'FROM eleicao_chapa_membro                        ' +
    'WHERE (UPPER(TRIM(nome)) = UPPER(TRIM(:valor))   ' +
    '       OR cpf = :cpf)                            ' +
    '  AND id_eleicao = :id_eleicao                   ' +
    '  AND id_chapa = :id_chapa                       ';
var
  Qry: TUniQuery;
  LCpf: string;
begin
  Result := False;

  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := dm.Conn;
    Qry.SQL.Text := QryStr;

    if AIDEmpresa > 0 then
      Qry.SQL.Add(' AND id_empresa = :id_empresa');

    LCpf := Trim(AStr);

    Qry.ParamByName('valor').AsString         := Trim(AStr);
    Qry.ParamByName('cpf').AsString           := LCpf;
    Qry.ParamByName('id_eleicao').AsInteger   := AIDEleicao;
    Qry.ParamByName('id_chapa').AsInteger     := AIDChapa;

    if AIDEmpresa > 0 then
      Qry.ParamByName('id_empresa').AsInteger := AIDEmpresa;

    Qry.Open;

    Result    := Qry.FieldByName('total').AsInteger > 0;
  finally
    Qry.Free;
  end;
end;

class function TDaoEleicaoConfig.ExistePresidente(const AIDEleicao, AIDChapa, AIDEmpresa: Integer): Boolean;
const
  QryStr =
    'SELECT COUNT(*) AS total               ' +
    ' FROM eleicao_chapa_membro              ' +
    ' WHERE UPPER(TRIM(cargo)) = ''PRESIDENTE'' ' +
    ' AND id_eleicao = :id_eleicao         ' +
    ' AND id_chapa = :id_chapa             ' +
    ' AND ativo   = ''S''                    ';
var
  Qry: TUniQuery;
begin
  Result := False;

  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := dm.Conn;
    Qry.SQL.Text := QryStr;

    if AIDEmpresa > 0 then
      Qry.SQL.Add(' AND id_empresa = :id_empresa');

    Qry.ParamByName('id_eleicao').AsInteger := AIDEleicao;
    Qry.ParamByName('id_chapa').AsInteger := AIDChapa;

    if AIDEmpresa > 0 then
      Qry.ParamByName('id_empresa').AsInteger := AIDEmpresa;

    Qry.Open;

    Result := Qry.FieldByName('total').AsInteger > 0;
  finally
    Qry.Free;
  end;
end;



class function TDaoEleicaoConfig.ExisteVicePresidente(const AIDEleicao, AIDChapa, AIDEmpresa: Integer): Boolean;
const
  QryStr =
    'SELECT COUNT(*) AS total               ' +
    ' FROM eleicao_chapa_membro              ' +
    ' WHERE UPPER(TRIM(cargo)) = ''VICE-PRESIDENTE'' ' +
    ' AND id_eleicao = :id_eleicao         ' +
    ' AND id_chapa = :id_chapa             ' +
    ' AND ativo   = ''S''                    ';
var
  Qry: TUniQuery;
begin
  Result := False;

  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := dm.Conn;
    Qry.SQL.Text := QryStr;

    if AIDEmpresa > 0 then
      Qry.SQL.Add(' AND id_empresa = :id_empresa');

    Qry.ParamByName('id_eleicao').AsInteger := AIDEleicao;
    Qry.ParamByName('id_chapa').AsInteger := AIDChapa;

    if AIDEmpresa > 0 then
      Qry.ParamByName('id_empresa').AsInteger := AIDEmpresa;

    Qry.Open;

    Result := Qry.FieldByName('total').AsInteger > 0;
  finally
    Qry.Free;
  end;
end;

class function TDaoEleicaoConfig.JaExisteNaEleicao(AIDEleicao,AIDAssociado:Integer):Boolean;
var
  Qry:TUniQuery;
begin
  Result:=False;
  Qry:=TUniQuery.Create(nil);
  try
    Qry.Connection:=dm.Conn;
    Qry.SQL.Text:='SELECT 1 FROM eleicao_eleitor WHERE id_eleicao=:id_eleicao AND id_associado=:id_associado LIMIT 1';
    Qry.ParamByName('id_eleicao').AsInteger   :=  AIDEleicao;
    Qry.ParamByName('id_associado').AsInteger :=  AIDAssociado;
    Qry.Open;
    Result:=not Qry.IsEmpty;
  finally
    Qry.Free;
  end;
end;

class function TDaoEleicaoConfig.MarcarEleitorSincronizacao(const AIDEleicao:Integer):Boolean;
var
  Qry:TUniQuery;
begin
  Result:=False;
  Qry:=TUniQuery.Create(nil);
  try
    Qry.Connection:=dm.Conn;

    Qry.SQL.Text:='UPDATE eleicao_eleitor SET sinc_app=''S'' WHERE id_eleicao=:id_eleicao AND sinc_app=''N''';
    Qry.ParamByName('id_eleicao').AsInteger:=AIDEleicao;
    Qry.ExecSQL;

    Qry.Close;
    Qry.SQL.Text:='SELECT id_eleitor,id_empresa FROM eleicao_eleitor WHERE sinc_app=''S'' AND id_eleicao=:id_eleicao';
    Qry.ParamByName('id_eleicao').AsInteger:=AIDEleicao;
    Qry.Open;

    while not Qry.Eof do
    begin
      if TConfiguracaoService.ValidarUsoAppEleicao(Qry.FieldByName('id_empresa').AsInteger) then
        TConfiguracaoService.SincronizarGravar(104,Qry.FieldByName('id_eleitor').AsInteger);
      Qry.Next;
    end;

    Result:=True;
  finally
    Qry.Free;
  end;
end;

class function TDaoEleicaoConfig.RetornoURlEleicao(AIDeleicao: integer; out AURL: String): Boolean;
var
  Qry:TUniQuery;
begin
  Result:=False;
  Qry:=TUniQuery.Create(nil);

  try
    Qry.Connection  := dm.Conn;
    Qry.SQL.Text    := 'SELECT url_publica FROM eleicao_configuracao WHERE id_eleicao= :id_eleicao LIMIT 1';
    Qry.ParamByName('id_eleicao').AsInteger   :=  AIDEleicao;
    Qry.Open;

    AURL  :=  Qry.FieldByName('url_publica').AsString;
    Result:=  not Qry.IsEmpty;

  finally
    Qry.Free;
  end;

end;

{$REGION 'Assembleia'}

class function TDaoEleicaoConfig.ExisteQuestao(const ATitulo: string;
  const AOrdem, AIDEleicao, AIDEmpresa, AIDIgnorar: Integer; out AMensagem: string): Boolean;
var
  Qry: TUniQuery;
const
  QryStr =
    'SELECT '+
    ' SUM(CASE WHEN UPPER(titulo)=UPPER(:titulo) THEN 1 ELSE 0 END) AS total_titulo, '+
    ' SUM(CASE WHEN ordem=:ordem THEN 1 ELSE 0 END) AS total_ordem '+
    'FROM eleicao_questao '+
    'WHERE id_eleicao=:ideleicao '+
    'AND id_empresa=:idempresa ';
begin
  Result := False;
  AMensagem := '';
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := dm.Conn;
    Qry.SQL.Text := QryStr;
    if AIDIgnorar > 0 then
      Qry.SQL.Add('AND id_questao<>:idignorar');
    Qry.ParamByName('titulo').AsString := Trim(ATitulo);
    Qry.ParamByName('ordem').AsInteger := AOrdem;
    Qry.ParamByName('ideleicao').AsInteger := AIDEleicao;
    Qry.ParamByName('idempresa').AsInteger := AIDEmpresa;
    if AIDIgnorar > 0 then
      Qry.ParamByName('idignorar').AsInteger := AIDIgnorar;
    Qry.Open;
    if Qry.FieldByName('total_titulo').AsInteger > 0 then
    begin
      AMensagem := 'Já existe uma questão/pauta com esse título.';
      Exit(True);
    end;
    if Qry.FieldByName('total_ordem').AsInteger > 0 then
    begin
      AMensagem := 'Já existe uma questão/pauta com essa ordem.';
      Exit(True);
    end;
  finally
    Qry.Free;
  end;
end;


{$ENDREGION}

end.
