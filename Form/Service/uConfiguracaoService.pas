unit uConfiguracaoService;

interface

uses
  System.SysUtils, Controller_Perfil, Model.Perfil;

type
  TEmpresaRelatorio = record
    razao :string;
    fantasia:string;
    endereco:string;
    numero:string;
    bairro:string;
    telefone:string;
    telefone2:string;
    celular:string;
    email1:string;
    cnpj:string;
    ie:string;
    logo:string;
    cep:string;
    cidade:string;
  end;

type
  TConfiguracaoService = class
  private


  public
    class Function ObterDadosEmpresaRelatorio(AID:Integer):TEmpresaRelatorio;

    class Function ValidarUsoWhatsApp(idemp: integer): Boolean;
    class Function ValidarUsoSMS(idemp: integer): Boolean;
    class function ValidarUsoAppCarteira(IdEmpresa: Integer): Boolean;
    class function ValidarUsoAppEleicao(IdEmpresa: Integer): Boolean; static;
    class function ValidarUsoAppVeiculo(idemp: integer): Boolean;

    class Function ValidarCampoPlaca(i:integer): Boolean;
    class Function ValidarPessoaReceberemail(i:integer; out RetEmail:String):Boolean;
    class Function ValidarPessoaReceberWhatsApp(i:integer; out RetTelefone:String):Boolean;
    class Function ValidarPessoaCarteiraWeb(i:integer):Boolean;
    class function ValidarPessoaDependenteCarteiraWeb(i: integer): Boolean;
    class function ValidarEmpresaExits(Out CodEmp:Integer; CNPJ:String):boolean;
    class function ValidarFuncionarioExits(Out CodFunc:Integer; CPF:String):boolean;
    class function ValidarInstanciaWhatsappFuncionario(idemp: integer):Boolean;
    class Function ValidarCadastroExitAssociado(out cod:integer; CPF:String):Boolean;
    class function ValidarCadastroExitDependente(out cod: integer; cpf: string; AID:Integer): boolean; static;
    class function ValidarCadastroExitProduto(out cod: integer;Barra: String): Boolean; static;
    class function ValidarUsuarioLoginExit(const ALogin: string; const AIdUsuarioIgnorar: Integer = 0): Boolean;
    class function ValidarEmpresaAtivaWeb(const AIDEmpresa:Integer):Boolean;


    class function ValidarCalculoMetroPedido(AID: Integer):Boolean;
    class function ValidarEditarPrecoProdutoPedido(AID:Integer):Boolean;
    class function ValidarControleEstoque(AID:Integer):Boolean;
    class function ValidarProdutoEstoqueNegativo(AID:Integer):Boolean;

    class function TaxaVeiculoConsignado(IdEmpresa: Integer): Currency;
    class function TaxaVeiculoPatio(IdEmpresa: Integer): Currency;
    class Function VeiculoExitsCompra(icomp, idveic:Integer):Boolean;
    class Function VeiculoControlaEstoque(idveiculo:integer):Boolean;


    class Function RetornoMensagemPadraoWhatsApp(out Msg:String; Campo:String; idEmpresa:integer):Boolean;
    class Function RetornoMensagemWhatsApp(out Msg:String; AID:integer):Boolean;
    class Function RetornoDadosClienteMensagem(Out vNome, vApelido,  vCodigo, vMatricula, vWhatsapp, vCpf:string; idPessoa:Integer):Boolean;
    class Function RetornoDescricaoEquipamento(Out DesEquipamento:String; idProduto: Integer): boolean;
    class Function RetornoIDConfig(out Aid:Integer; AIDEmp:Integer):Boolean;
    class Function RetornoInstanciaWhatsAppFuncionario(Out AInstancia:String; AID:Integer):Boolean;
    class Function RetornoInstanciaWhatsAppEmpresa(Out AInstancia:String; AID:Integer):Boolean;
    class Function RetornoIDPessoaPedido(Out IdPessoa:integer; AID:Integer):Boolean;
    class Function RetornoImagemProduto(Out AImg:String; AID:Integer):boolean;
    class Function RetornoImagemPessoa(Out Aimg:string; AID:integer):boolean;
    class Function RetornoImagemDependente(Out Aimg:string; AID:integer):boolean;
    class Function RetornoURLSlugCampanha(Const AID:integer; Out AURL:String):boolean;


    //Compra
    class Function RetornoDadosConsultaSefazEmpresa(Out AUF, ACNPJ, ARazao: String; AID: Integer):Boolean;
    class Function RetornoNSUConsultaSefazEmpresa(Out Ansunfe, Ansumaznfe:integer; AID:Integer):Boolean;

    class Function CriarAcesso(Aid :Integer):Boolean;

    class Function SincronizarGravar(codtabela, idregistro: integer): boolean;
    class function CampoVisivelGrid(const ACampo: string): Boolean;

//=====>>> Ticket
{$REGION 'Ticket'}
    class function CarregarDadosAssociadoTicket(out vlimite: Double;
      out vSecretaria: String; AID: integer): Boolean;
    class function RetornoSaldoAssociadoTicket(out aberto, parcial: Double;
      AID: integer; mesdesconto: TDate): Boolean; static;
    class function ValidarTicketMesPagMesDesc(i: integer): Boolean;
    class function ValidarTicletSeguencia(i: integer): Boolean;
    class function UsarSubModTicket(AID:Integer):Boolean;
    class function UsarSubModVotacao(AID:Integer):Boolean;
    class function UsarSubModCarteira(AID:integer):Boolean;


{$ENDREGION}

{$REGION 'Sindicato'}

    class function usarSubModSindicato(AID:integer):boolean;


{$ENDREGION}


  end;
  var
  ObjPerfil   : TModelPerfil;
  ContPerfil  : TPerfilController;

implementation

uses
  Uni,
  System.Variants, UDM, System.DateUtils;

{ TConfiguracaoService }

class function TConfiguracaoService.TaxaVeiculoConsignado(IdEmpresa: Integer): Currency;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Select veiculo_taxa_consignado from configuracao_nf where id_empresa= :id';
begin
  Result := 0;
  Qry := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection := dm.conn;
      Qry.SQL.Text := QryStr;
      Qry.ParamByName('id').AsInteger := IdEmpresa;
      Qry.Open;
      if not Qry.IsEmpty then
        Result := Qry.FieldByName('veiculo_taxa_consignado').AsCurrency;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar configuração TaxaVeiculoConsignado:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.TaxaVeiculoPatio(IdEmpresa: Integer): Currency;
var
  Qry: TUniQuery;
Const
  QryStr = 'Select veiculo_taxa_patio from configuracao_nf where id_empresa= :id';
begin
  Result := 0;
  Qry := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection := dm.conn;
      Qry.SQL.Text := QryStr;
      Qry.ParamByName('id').AsInteger := IdEmpresa;
      Qry.Open;
      if not Qry.IsEmpty then
        Result := Qry.FieldByName('veiculo_taxa_patio').AsCurrency;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar configuração TaxaVeiculoPatio:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.ValidarCadastroExitAssociado(out cod: integer; CPF: String): Boolean;
var
  Qry : Tuniquery;
Const
  QryStr  = 'Select Count(*) as cpf, codigo from socio where cpf= :cpf group by cpf, codigo';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection                      := dm.conn;
      Qry.SQL.Text                        := QryStr;
      Qry.ParamByName('cpf').AsString     := Trim(CPF);
      Qry.Open;
      if not Qry.IsEmpty then
      begin
        Cod     := Qry.FieldByName('codigo').AsInteger;
        Result  := True;
      end;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar ValidarEmpresaExits:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

Class function TConfiguracaoService.ValidarCadastroExitDependente(out cod:integer; cpf:string; AID:Integer):boolean;
var
  Qry : Tuniquery;
Const
  QryStr  = 'Select Count(*) as cpf, codigo from sindicato_dependente where cpf= :cpf and id_socio= :AID and excluido=0 group by cpf, codigo';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection                      := dm.conn;
      Qry.SQL.Text                        := QryStr;
      Qry.ParamByName('cpf').AsString     := Trim(CPF);
      Qry.ParamByName('AID').AsInteger    := AID;
      Qry.Open;
      if not Qry.IsEmpty then
      begin
        Cod     := Qry.FieldByName('codigo').AsInteger;
        Result  := True;
      end;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar ValidarCadastroExitDependente:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.ValidarCampoPlaca(i: integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Select placa_obrigatorio as placa from grupo where id_grupo= :id and tipo=''V''';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.conn;
      Qry.SQL.Text := QryStr;
      Qry.ParamByName('id').AsInteger := i;
      Qry.Open;
      if not Qry.IsEmpty then
        Result := SameText(Qry.FieldByName('placa_obrigatorio').AsString, 'S');
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar configuração ValidarCampoPlaca:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.ValidarControleEstoque(AID: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Select moduloestoque from configuracao_nf where id_empresa= :id';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.conn;
      Qry.SQL.Text := QryStr;
      Qry.ParamByName('id').AsInteger := AId;
      Qry.Open;

      if not Qry.IsEmpty then
        Result := SameText(Qry.FieldByName('moduloestoque').AsString, 'S');
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar configuração ValidarControleEstoque:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.ValidarEditarPrecoProdutoPedido(AID: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Select alterar_preco_pedido from configuracao_nf where id_empresa= :id';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.conn;
      Qry.SQL.Text := QryStr;
      Qry.ParamByName('id').AsInteger := AId;
      Qry.Open;

      if not Qry.IsEmpty then
        Result := SameText(Qry.FieldByName('alterar_preco_pedido').AsString, 'S');
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar configuração ValidarEditarPrecoProdutoPedido:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.ValidarEmpresaAtivaWeb(const AIDEmpresa: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Select guid, habilitadoweb from empresa where id_empresa= :id limit 1';
begin
  Result := False;

  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection                      := dm.conn;
      Qry.SQL.Text                        := QryStr;
      Qry.ParamByName('id').AsInteger     := AIDEmpresa;
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        if Qry.FieldByName('habilitadoweb').AsString = 'S' then
        Result  := True;
      end;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar ValidarEmpresaAtivaWeb:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.ValidarEmpresaExits(out CodEmp: Integer;
  CNPJ: String): boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Select id_empresa from empresa where cnpj= :cnpj limit 1';
begin
  Result := False;
  Codemp := 0;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection                      := dm.conn;
      Qry.SQL.Text                        := QryStr;
      Qry.ParamByName('cnpj').AsString    := Trim(cnpj);
      Qry.Open;
      if not Qry.IsEmpty then
      begin
        Codemp := Qry.FieldByName('id_empresa').AsInteger;
        Result  := True;
      end;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar ValidarEmpresaExits:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.ValidarFuncionarioExits(Out CodFunc: Integer; CPF: String): boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Select id_funcionario, codigo from funcionario where cpf= :cpf limit 1';
begin
  Result := False;
  CodFunc := 0;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection                      := dm.conn;
      Qry.SQL.Text                        := QryStr;
      Qry.ParamByName('cpf').AsString    := Trim(cpf);
      Qry.Open;
      if not Qry.IsEmpty then
      begin
        CodFunc := Qry.FieldByName('codigo').AsInteger;
        Result  := True;
      end;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar ValidarFuncionarioExits:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.ValidarPessoaReceberemail(i: integer; out RetEmail:String): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Select envemail, email from socio where id_socio= :id';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.conn;
      Qry.SQL.Text := QryStr;
      Qry.ParamByName('id').AsInteger := i;
      Qry.Open;

      if not Qry.IsEmpty then
        Result    := SameText(Qry.FieldByName('envemail').AsString, 'S');

      if Result then
        RetEmail  :=  Qry.FieldByName('email').AsString;

    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar configuração ValidarPessoaReceberemail:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.ValidarPessoaReceberWhatsApp(i: integer; out RetTelefone:String): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Select envwhats, whatsapp from socio where id_socio= :id';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.conn;
      Qry.SQL.Text := QryStr;
      Qry.ParamByName('id').AsInteger := i;
      Qry.Open;

      if not Qry.IsEmpty then
        Result := SameText(Trim(Qry.FieldByName('envwhats').AsString), 'S');

      if Result then
        RetTelefone := Qry.FieldByName('whatsapp').AsString;

    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar configuração ValidarPessoaReceberWhatsApp:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.ValidarProdutoEstoqueNegativo(AID: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Select prod_estoque_per_negativo from produto where id_produto= :id';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection    := dm.conn;
      Qry.SQL.Text      := QryStr;
      Qry.ParamByName('id').AsInteger := AID;
      Qry.Open;

      if not Qry.IsEmpty then
        Result := SameText(Qry.FieldByName('prod_estoque_per_negativo').AsString, 'S');

    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar ValidarProdutoEstoqueNegativo:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.ValidarUsoAppCarteira(IdEmpresa: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Select utilizaappcarteira from configuracao_nf where id_empresa= :id';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection    := dm.conn;
      Qry.SQL.Text      := QryStr;
      Qry.ParamByName('id').AsInteger := IdEmpresa;
      Qry.Open;

      if not Qry.IsEmpty then
        Result := SameText(Qry.FieldByName('utilizaappcarteira').AsString, 'S');

    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar configuração ValidarUsoAppCarteira:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.ValidarUsoAppEleicao(IdEmpresa: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Select utilizar_votacao_web from configuracao_nf where id_empresa= :id';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection    := dm.conn;
      Qry.SQL.Text      := QryStr;
      Qry.ParamByName('id').AsInteger := IdEmpresa;
      Qry.Open;

      if not Qry.IsEmpty then
        Result := SameText(Qry.FieldByName('utilizar_votacao_web').AsString, 'S');

    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar configuração ValidarUsoAppCarteira:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.ValidarUsoAppVeiculo(idemp: integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Select veiculo_utilizaapp from configuracao_nf where id_empresa= :id';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.conn;
      Qry.SQL.Text := QryStr;
      Qry.ParamByName('id').AsInteger := idemp;
      Qry.Open;

      if not Qry.IsEmpty then
        Result := SameText(Qry.FieldByName('veiculo_utilizaapp').AsString, 'S');
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar configuração ValidarUsoAppVeiculo:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.ValidarUsoSMS(idemp: integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Select utilizasms from configuracao_nf where id_empresa= :id';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.conn;
      Qry.SQL.Text := QryStr;
      Qry.ParamByName('id').AsInteger := idemp;
      Qry.Open;

      if not Qry.IsEmpty then
        Result := SameText(Qry.FieldByName('utilizasms').AsString, 'S');
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar configuração ValidarUsoSMS:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.VeiculoControlaEstoque(idveiculo: integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Select controlaestoque from produto where id_produto= :id';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.conn;
      Qry.SQL.Text := QryStr;
      Qry.ParamByName('id').AsInteger := idveiculo;
      Qry.Open;

      if not Qry.IsEmpty then
        Result := SameText(Qry.FieldByName('controlaestoque').AsString, 'S');
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar configuração VeiculoControlaEstoque:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.VeiculoExitsCompra(icomp, idveic: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Select count(*) as total from compra_itens where id_compra= :id and id_produto_veiculo= :idveic';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.conn;
      Qry.SQL.Text := QryStr;
      Qry.ParamByName('id').AsInteger     := icomp;
      Qry.ParamByName('idveic').AsInteger := idveic;
      Qry.Open;


      if not Qry.IsEmpty then
        Result := Qry.FieldByName('total').AsInteger > 0;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar a função VeiculoExitsCompra:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.RetornoURLSlugCampanha(const AID: integer;out AURL: String): boolean;
var
qry:TUniquery;
Qrystr:string;
begin
  Result  := False;
  AURL    := '';
  Qrystr  := 'SELECT url_publica FROM eleicao_configuracao where id_eleicao= :id';

  Qry     := TUniquery.Create(nil);

  Try
    Try
      if not Dm.Conn.Connected then
        dm.Conn.Connected := True;

      Qry.Connection          := dm.conn;;
      Qry.SQL.Clear;

      Qry.SQL.Text            := Qrystr;
      Qry.Params.ParamByName('id').AsInteger    := AID;
      Qry.Open;

      if not qry.Eof then
      begin
        Result  := True;
        AURL    := Qry.FieldByName('url_publica').asstring;
      end;


      Qry.Close;
    except on e:exception do
      raise Exception.Create('Error ao buscar a RetornoURLSlugCampanha'+e.Message);
    End;
  Finally
    FreeAndNil(Qry);
  End;
end;

class Function TConfiguracaoService.RetornoMensagemPadraoWhatsApp(out Msg:String; Campo:String; idEmpresa:integer):Boolean;
var
qry:TUniquery;
Qrystr:string;
begin
  Result  := False;
  Qrystr  := 'Select mensagem from mensagem m where id_mensagem = '+
              '(Select '+Trim(Campo)+' from configuracao_nf where id_empresa= :id)';

  Qry     := TUniquery.Create(nil);

  Try
    Try
      if not Dm.Conn.Connected then
        dm.Conn.Connected := True;

      Qry.Connection          := dm.conn;;
      Qry.SQL.Clear;

      Qry.SQL.Text            := Qrystr;
      Qry.Params.ParamByName('id').AsInteger    := idEmpresa;
      Qry.Open;

      if not qry.Eof then
      begin
        Result  := True;
        msg     := Qry.FieldByName('mensagem').asstring;
      end;


      Qry.Close;
    except on e:exception do
      raise Exception.Create('Error ao buscar a mensagem'+e.Message);
    End;
  Finally
    FreeAndNil(Qry);
  End;
end;

class function TConfiguracaoService.RetornoMensagemWhatsApp(out Msg: String; AID: integer): Boolean;
var
qry:TUniquery;
Qrystr:string;
begin
  Result  := False;
  Qrystr  := 'Select mensagem from mensagem m where id_mensagem = :AID';

  Qry     := TUniquery.Create(nil);

  Try
    Try
      if not Dm.Conn.Connected then
        dm.Conn.Connected := True;

      Qry.Connection          := dm.conn;;
      Qry.SQL.Clear;

      Qry.SQL.Text            := Qrystr;
      Qry.Params.ParamByName('AID').AsInteger    := AID;
      Qry.Open;

      if not qry.Eof then
      begin
        Result  := True;
        msg     := Qry.FieldByName('mensagem').asstring;
      end;

      Qry.Close;
    except on e:exception do
      raise Exception.Create('Error ao buscar a mensagem'+e.Message);
    End;
  Finally
    FreeAndNil(Qry);
  End;
end;

class function TConfiguracaoService.RetornoNSUConsultaSefazEmpresa(out Ansunfe,Ansumaznfe: integer; AID: Integer): Boolean;
var
  Qry: TUniQuery;
  QryStr: string;
begin
  Result      := False;
  Ansunfe     := 0;
  Ansumaznfe  := 0;

  QryStr := 'Select nfe_nsu, nfe_maxnsu from configuracao_nf '+
            ' where id_empresa= :AID';

  Qry := TUniQuery.Create(nil);
  try
    try
      if not dm.Conn.Connected then
        dm.Conn.Connected := True;

      Qry.Connection  := dm.Conn;
      Qry.SQL.Text    := QryStr;
      Qry.ParamByName('AID').AsInteger := AID;
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        if not Qry.FieldByName('nfe_nsu').IsNull then
        begin
          Ansunfe       := Qry.FieldByName('nfe_nsu').AsInteger;
          Ansumaznfe    := Qry.FieldByName('nfe_maxnsu').AsInteger;
          Result        := Ansunfe <> 0;
        end;
      end;
    except
      on E: Exception do
        raise Exception.Create(
          'Erro ao buscar RetornoNSUConsultaSefazEmpresa: ' + E.Message);
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

class Function TConfiguracaoService.RetornoDadosClienteMensagem(Out vNome, vApelido,  vCodigo, vMatricula, vWhatsapp, vCPF:string; idPessoa:Integer):Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Select codigo, matricula, nome, apelido, whatsapp, cpf from socio where id_socio= :id';
begin
  Result := False;
  vNome     := '';
  vApelido  := '';
  vCodigo   := '';
  vMatricula:= '';
  vWhatsapp := '';
  vCpf      := '';

  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.conn;
      Qry.SQL.Text := QryStr;
      Qry.ParamByName('id').AsInteger := idPessoa;
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        vNome     := trim(Qry.FieldByName('nome').AsString);
        vApelido  := trim(Qry.FieldByName('apelido').AsString);
        vCodigo   := Qry.FieldByName('codigo').AsString;
        vMatricula:= Qry.FieldByName('matricula').AsString;
        vWhatsapp := trim(Qry.FieldByName('whatsapp').AsString);
        vCpf      := trim(Qry.FieldByName('cpf').AsString);
        Result    := True;
      end;

    except on e:Exception do
      begin
        raise Exception.Create('Erro ao buscar dados do cliente na função RetornoDadosClienteMensagem:' + sLineBreak + e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.RetornoDadosConsultaSefazEmpresa(out AUF, ACNPJ, ARazao: String; AID: Integer): Boolean;
var
  Qry: TUniQuery;
  QryStr: string;
begin
  Result  := False;
  AUF     := '';
  ACNPJ   := '';
  ARazao  := '';

  QryStr := 'Select e.razao, e.cnpj, c.UF from empresa e     '+
            ' inner join cidade c                            '+
            ' on e.id_cidade = c.ID_CIDADE where e.id_empresa= :AID';

  Qry := TUniQuery.Create(nil);
  try
    try
      if not dm.Conn.Connected then
        dm.Conn.Connected := True;

      Qry.Connection  := dm.Conn;
      Qry.SQL.Text    := QryStr;
      Qry.ParamByName('AID').AsInteger := AID;
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        if not Qry.FieldByName('cnpj').IsNull then
        begin
          AUF     := Trim(Qry.FieldByName('UF').AsString);
          ACNPJ   := Trim(Qry.FieldByName('cnpj').AsString);
          ARazao  := Trim(Qry.FieldByName('razao').AsString);
          Result  := ARazao <> '';
        end;
      end;
    except
      on E: Exception do
        raise Exception.Create(
          'Erro ao buscar RetornoDadosConsultaSefazEmpresa: ' + E.Message);
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

class Function TConfiguracaoService.RetornoDescricaoEquipamento(Out DesEquipamento:String; idProduto: Integer): boolean;
var
  Qry: TUniQuery;
  Str: String;
Const
  QryStr  = 'Select p.codigo, p.referencia, p.descricao,    '+
            ' e.tipo_equipamento, e.numero_serie,           '+
            ' g.grupo as nmmodelo,                           '+
            ' m.marca as nmmarca                            '+
            ' from Produto p                                '+
            ' Inner Join marca m                            '+
            ' on p.id_marca = m.id_marca                    '+
            ' Inner join produto_equipamento e              '+
            ' On p.id_produto = e.id_produto                '+
            ' LEFT join grupo g                            '+
            ' on e.id_modelo = g.id_grupo where p.id_produto= :id';
begin
  Result := False;


  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.conn;
      Qry.SQL.Text := QryStr;
      Qry.ParamByName('id').AsInteger := idProduto;
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        Str     := 'Descrição: '+
                   Qry.FieldByName('descricao').AsString+', Tipo: '+
                   Qry.FieldByName('tipo_equipamento').AsString+', Série: '+
                   Qry.FieldByName('numero_serie').AsString+', Modelo: '+
                   Qry.FieldByName('nmmodelo').AsString+', Marca: '+
                   Qry.FieldByName('nmmarca').AsString;

        DesEquipamento  := Str;
        Result    := True;
      end;

    except on e:Exception do
      begin
        raise Exception.Create('Erro ao buscar dados do equipamento na função RetornoDescricaoEquipamento:' + sLineBreak + e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.RetornoIDConfig(out Aid: Integer;AIDEmp: Integer): Boolean;
var
  Qry: TUniQuery;
  Str: String;
Const
  QryStr  = 'Select id_config from configuracao_nf where id_empresa= :id limit 1';
begin
  Result := False;
  AID    := 0;

  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;
      Qry.ParamByName('id').AsInteger := AIDEmp;
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        AID     := Qry.FieldByName('id_config').AsInteger;
        Result  := True;
      end;

    except on e:Exception do
      begin
        raise Exception.Create('Erro ao buscar dados função RetornoIDConfig:' + sLineBreak + e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.RetornoIDPessoaPedido(out IdPessoa: integer;AID: Integer): Boolean;
var
  Qry : Tuniquery;
Const
  QryStr  = 'Select id_cliente from pedido where id_pedido= :id';
begin
  Result    := False;
  IdPessoa  := 0;
  Qry       := TUniQuery.Create(nil);

  try
    try
      Qry.Connection                      := dm.conn;
      Qry.SQL.Text                        := QryStr;
      Qry.ParamByName('id').AsInteger     := AID;
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        IdPessoa    := Qry.FieldByName('id_cliente').AsInteger;
        Result      := IDPessoa > 0;
      end;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar RetornoIDPessoaPedido:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.RetornoImagemDependente(out Aimg: string;AID: integer): boolean;
var
  Qry : Tuniquery;
Const
  QryStr  = 'Select foto from sindicato_dependente where id_dependente= :id';
begin
  Result    := False;
  AImg      := '';
  Qry       := TUniQuery.Create(nil);

  try
    try
      Qry.Connection                      := dm.conn;
      Qry.SQL.Text                        := QryStr;
      Qry.ParamByName('id').AsInteger     := AID;
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        AImg      := Qry.FieldByName('foto').AsString;
        Result    := AImg <> '';
      end;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar RetornoImagemDependente:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.RetornoImagemPessoa(out Aimg: string;AID: integer): boolean;
var
  Qry : Tuniquery;
Const
  QryStr  = 'Select foto from socio where id_socio= :id';
begin
  Result    := False;
  AImg      := '';
  Qry       := TUniQuery.Create(nil);

  try
    try
      Qry.Connection                      := dm.conn;
      Qry.SQL.Text                        := QryStr;
      Qry.ParamByName('id').AsInteger     := AID;
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        AImg      := Qry.FieldByName('foto').AsString;
        Result    := AImg <> '';
      end;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar RetornoImagemPessoa:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.RetornoImagemProduto(out AImg: String; AID: Integer): boolean;
var
  Qry : Tuniquery;
Const
  QryStr  = 'Select foto1 from produto where id_produto= :id';
begin
  Result    := False;
  AImg      := '';
  Qry       := TUniQuery.Create(nil);

  try
    try
      Qry.Connection                      := dm.conn;
      Qry.SQL.Text                        := QryStr;
      Qry.ParamByName('id').AsInteger     := AID;
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        AImg      := Qry.FieldByName('foto1').AsString;
        Result    := AImg <> '';
      end;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar RetornoImagemProduto:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.RetornoInstanciaWhatsAppEmpresa(out AInstancia: String; AID: Integer): Boolean;
var
  Qry: TUniQuery;
  QryStr: string;
begin
  Result := False;
  AInstancia := '';

  QryStr := 'Select instance_key from temp where id_empresa= :AID';

  Qry := TUniQuery.Create(nil);
  try
    try
      if not dm.Conn.Connected then
        dm.Conn.Connected := True;

      Qry.Connection  := dm.Conn;
      Qry.SQL.Text    := QryStr;
      Qry.ParamByName('AID').AsInteger := AID;
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        if not Qry.FieldByName('instance_key').IsNull then
        begin
          AInstancia := Trim(Qry.FieldByName('instance_key').AsString);
          Result := AInstancia <> '';
        end;
      end;
    except
      on E: Exception do
        raise Exception.Create(
          'Erro ao buscar RetornoInstanciaWhatsAppEmpresa: ' + E.Message);
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

class function TConfiguracaoService.RetornoInstanciaWhatsAppFuncionario(out AInstancia: String; AID: Integer): Boolean;
var
  Qry: TUniQuery;
  QryStr: string;
begin
  Result := False;
  AInstancia := '';

  QryStr :=
          'Select f.tokenwhatsapp ' +
          ' from usuario u ' +
          ' inner join funcionario f on u.id_funcionario = f.id_funcionario ' +
          ' where u.id_usuario = :AID';

  Qry := TUniQuery.Create(nil);
  try
    try
      if not dm.Conn.Connected then
        dm.Conn.Connected := True;

      Qry.Connection  := dm.Conn;
      Qry.SQL.Text    := QryStr;
      Qry.ParamByName('AID').AsInteger := AID;
      Qry.Open;


      if not Qry.IsEmpty then
      begin
        if not Qry.FieldByName('tokenwhatsapp').IsNull then
        begin
          AInstancia := Trim(Qry.FieldByName('tokenwhatsapp').AsString);
          Result := AInstancia <> '';
        end;
      end;
      //Result := not Qry.FieldByName('tokenwhatsapp').AsString.Trim.IsEmpty;
    except
      on E: Exception do
        raise Exception.Create(
          'Erro ao buscar RetornoInstanciaWhatsAppFuncionario: ' + E.Message);
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

class Function TConfiguracaoService.ValidarUsoWhatsApp(idemp: integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Select utilizawhatsapp from configuracao_nf where id_empresa= :id';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.conn;
      Qry.SQL.Text := QryStr;
      Qry.ParamByName('id').AsInteger := idemp;
      Qry.Open;

      if not Qry.IsEmpty then
        Result := SameText(Qry.FieldByName('utilizawhatsapp').AsString, 'S');
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar configuração ValidarUsoWhatsApp:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;

end;

class function TConfiguracaoService.ValidarUsuarioLoginExit(const ALogin: string; const AIdUsuarioIgnorar: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'SELECT 1 ' +
            ' FROM usuario ' +
            ' WHERE LOWER(login) = LOWER(:login) ' +
            ' AND ativo = ''S'' AND excluido= 0 ' +
            ' AND (:id = 0 OR id_usuario <> :id) ' +
            ' LIMIT 1';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection                      := dm.conn;
      Qry.SQL.Text                        := QryStr;
      Qry.ParamByName('login').AsString   := trim(ALogin);
      Qry.ParamByName('id').AsInteger     := AIdUsuarioIgnorar;
      Qry.Open;
      Result        := Not qry.IsEmpty;


    except on e:Exception do
      begin
        raise Exception.Create('Erro ao validar a ValidarUsuarioLoginExit:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.ValidarInstanciaWhatsappFuncionario(idemp: integer):Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Select instanciawhatsappfunc from configuracao_nf where id_empresa= :id';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.conn;
      Qry.SQL.Text := QryStr;
      Qry.ParamByName('id').AsInteger := idemp;
      Qry.Open;

      if not Qry.IsEmpty then
        Result := SameText(Qry.FieldByName('instanciawhatsappfunc').AsString, 'S');
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar configuração ValidarInstanciaWhatsappFuncionario:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class Function TConfiguracaoService.ValidarPessoaCarteiraWeb(i:integer):Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Select Count(*) as total from carteira where id_socio= :id and excluido=0';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection                  := dm.conn;
      Qry.SQL.Text                    := QryStr;
      Qry.ParamByName('id').AsInteger := i;
      Qry.Open;

      Result  := Qry.FieldByName('total').AsInteger > 0;

    except on e:Exception do
      begin
        raise Exception.Create('Erro ao validar a ValidarPessoaCarteiraWeb:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class Function TConfiguracaoService.ValidarPessoaDependenteCarteiraWeb(i:integer):Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Select Count(*) as total from carteira where id_dependente= :id and excluido=0';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection                  := dm.conn;
      Qry.SQL.Text                    := QryStr;
      Qry.ParamByName('id').AsInteger := i;
      Qry.Open;

      Result  := Qry.FieldByName('total').AsInteger > 0;

    except on e:Exception do
      begin
        raise Exception.Create('Erro ao validar a ValidarPessoaDependenteCarteiraWeb:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.ValidarCadastroExitProduto(out cod: integer; Barra: String): Boolean;
var
  Qry : Tuniquery;
Const
  QryStr  = 'Select Count(*) as cod_barras, codigo from produto where cod_barras= :barra group by cod_barras, codigo';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection                      := dm.conn;
      Qry.SQL.Text                        := QryStr;
      Qry.ParamByName('barra').AsString     := Trim(barra);
      Qry.Open;
      if not Qry.IsEmpty then
      begin
        Cod     := Qry.FieldByName('codigo').AsInteger;
        Result  := True;
      end;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar ValidarCadastroExitProduto:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;


{$REGION 'Ticket'}

class function TConfiguracaoService.CampoVisivelGrid(const ACampo: string): Boolean;
var
  Qry: TUniQuery;
const
  QryStr = 'SELECT visivel FROM parametros_grid WHERE campo = :campo';
begin
  Result := True;
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := dm.conn;
    Qry.SQL.Text := QryStr;
    Qry.ParamByName('campo').AsString := ACampo;
    Qry.Open;
    if not Qry.IsEmpty then
      Result := SameText(Qry.FieldByName('visivel').AsString, 'S');
  finally
    Qry.Free;
  end;
end;

class function TConfiguracaoService.CarregarDadosAssociadoTicket(
  out vlimite: Double; out vSecretaria: String; AID: integer): Boolean;
var
  qry         : TUniquery;
  sqlQuery: string;
begin
  Result      := false;

  Try
    sqlQuery    := 'Select                                                 '+
                  ' s.matricula, Coalesce(s.limite,0) limite,            '+
                  ' concat(sc.razao,'' / '',sl.descricao) as secretaria  '+
                  ' from socio s                                         '+
                  ' inner join secretaria sc                             '+
                  ' on s.escritorio = sc.id_secretaria                   '+
                  ' inner join sindicato_lotacao sl                      '+
                  '  on s.id_lotacao = sl.id_lotacao                     '+
                  ' where s.id_socio= :id';

    Qry         := TUniquery.Create(nil);

    Try
      Qry.Connection    := dm.Conn;
      Qry.SQL.Text      := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger        := AID;
      Qry.open;

      if not Qry.Eof then
      begin
        vlimite         := qry.FieldByName('limite').AsFloat;
        vSecretaria     := Qry.FieldByName('secretaria').AsString;
        result  := true;
      end
      else
      begin
        vlimite         := 0;
        vSecretaria     := '';
      end;

      Qry.Close;

    Finally
      FreeAndNil(Qry);
    end;

  Except on e:exception do
    begin
      raise Exception.Create(e.Message);
    end;
  end;
end;

class function TConfiguracaoService.RetornoSaldoAssociadoTicket(out aberto, parcial: Double;
  AID: integer; mesdesconto: TDate): Boolean;
var
  qry         : TUniquery;
  sqlQuery: string;
begin
  Result      := false;

  Try
    sqlQuery    := 'Select                         '+
                 ' sum(Coalesce(valor_ticket,0)) as vlr      '+
                 ' from ticket                   '+
                 ' where situacao=''A''            '+
                 ' and id_socio= :idsocio             '+
                 ' and data_desconto >=:x and data_desconto <=:y';

    Qry         := TUniquery.Create(nil);

    Try
      Qry.Connection    := dm.Conn;
      Qry.SQL.Text      := sqlQuery;
      Qry.Params.ParamByName('idsocio').AsInteger        := AID;
      Qry.Params.ParamByName('x').AsDateTime             := StartOfTheMonth(mesdesconto);
      Qry.Params.ParamByName('y').AsDateTime             := mesdesconto;

      Qry.open;

      if not Qry.Eof then
      begin
        aberto    := Qry.FieldByName('vlr').AsFloat;
        parcial   := 0;
        result    := true;
      end
      else
      begin
        aberto    := 0;
        parcial   := 0;
      end;

      Qry.Close;
    Finally
      FreeAndNIl(Qry);
    End;

  Except on e:exception do
    begin
      raise Exception.Create(e.Message);
    end;
  End;
end;

class function TConfiguracaoService.ValidarTicketMesPagMesDesc(i: integer): Boolean;
var
QrySrt:String;
Qry   :TUniquery;
begin
  Result    := False;
  QrySrt    := 'Select ticket_mespag_mesdesconto from configuracao_nf where id_empresa= :id';
  Qry       := Tuniquery.Create(nil);

  Try
    Try
      Qry.Connection    := Dm.Conn;
      Qry.SQL.Text      := QrySrt;
      qry.Params.ParamByName('id').AsInteger    := i;
      Qry.Open;

      if not Qry.IsEmpty then
      Result  := Qry.FieldByName('ticket_mespag_mesdesconto').AsString = 'S';

      Qry.Close;
    Except on e:exception do
      raise Exception.Create('Erro Qry: '+e.Message);
    End;

  Finally
    FreeAndNil(Qry);
  End;

end;

class function TConfiguracaoService.ValidarTicletSeguencia(i: integer): Boolean;
var
QrySrt:String;
Qry   :TUniquery;
begin
  Result    := False;
  QrySrt    := 'Select ticket_seguencia from configuracao_nf where id_empresa= :id';
  Qry       := Tuniquery.Create(nil);

  Try
    Try
      Qry.Connection    := Dm.Conn;
      Qry.SQL.Text      := QrySrt;
      qry.Params.ParamByName('id').AsInteger    := i;
      Qry.Open;

      if not Qry.IsEmpty then
      Result  := Qry.FieldByName('ticket_seguencia').AsString = 'S';

      Qry.Close;
    Except on e:exception do
      raise Exception.Create('Erro Qry: '+e.Message);
    End;

  Finally
    FreeAndNil(Qry);
  End;
end;

class function TConfiguracaoService.UsarSubModTicket(AID:Integer):Boolean;
var
QrySrt:String;
Qry   :TUniquery;
begin
  Result    := False;
  QrySrt    := 'Select utilizar_ticket from configuracao_nf where id_empresa= :id';
  Qry       := Tuniquery.Create(nil);

  Try
    Try
      Qry.Connection    := Dm.Conn;
      Qry.SQL.Text      := QrySrt;
      qry.Params.ParamByName('id').AsInteger    := AID;
      Qry.Open;

      if not Qry.IsEmpty then
      Result  := Qry.FieldByName('utilizar_ticket').AsString = 'S';

      Qry.Close;
    Except on e:exception do
      raise Exception.Create('Erro Qry: '+e.Message);
    End;

  Finally
    FreeAndNil(Qry);
  End;
end;

class function TConfiguracaoService.UsarSubModVotacao(AID:Integer):Boolean;
var
QrySrt:String;
Qry   :TUniquery;
begin
  Result    := False;
  QrySrt    := 'Select utilizar_votacao_web from configuracao_nf where id_empresa= :id';
  Qry       := Tuniquery.Create(nil);

  Try
    Try
      Qry.Connection    := Dm.Conn;
      Qry.SQL.Text      := QrySrt;
      qry.Params.ParamByName('id').AsInteger    := AID;
      Qry.Open;

      if not Qry.IsEmpty then
      Result  := Qry.FieldByName('utilizar_votacao_web').AsString = 'S';

      Qry.Close;
    Except on e:exception do
      raise Exception.Create('Erro Qry: '+e.Message);
    End;

  Finally
    FreeAndNil(Qry);
  End;
end;

class function TConfiguracaoService.UsarSubModCarteira(AID:integer):Boolean;
var
QrySrt:String;
Qry   :TUniquery;
begin
  Result    := False;
  QrySrt    := 'Select utilizaappcarteira from configuracao_nf where id_empresa= :id';
  Qry       := Tuniquery.Create(nil);

  Try
    Try
      Qry.Connection    := Dm.Conn;
      Qry.SQL.Text      := QrySrt;
      qry.Params.ParamByName('id').AsInteger    := AID;
      Qry.Open;

      if not Qry.IsEmpty then
      Result  := Qry.FieldByName('utilizaappcarteira').AsString = 'S';

      Qry.Close;
    Except on e:exception do
      raise Exception.Create('Erro Qry: '+e.Message);
    End;

  Finally
    FreeAndNil(Qry);
  End;
end;

{$ENDREGION}

class function TConfiguracaoService.usarSubModSindicato(AID: integer): boolean;
var
QrySrt:String;
Qry   :TUniquery;
begin
  Result    := False;
  QrySrt    := 'Select sistema_sindicato from configuracao_nf where id_empresa= :id';
  Qry       := Tuniquery.Create(nil);

  Try
    Try
      Qry.Connection    := Dm.Conn;
      Qry.SQL.Text      := QrySrt;
      qry.Params.ParamByName('id').AsInteger    := AID;
      Qry.Open;

      if not Qry.IsEmpty then
      Result  := Qry.FieldByName('sistema_sindicato').AsString = 'S';

      Qry.Close;
    Except on e:exception do
      raise Exception.Create('Erro Qry: '+e.Message);
    End;

  Finally
    FreeAndNil(Qry);
  End;
end;



class Function TConfiguracaoService.CriarAcesso(Aid :Integer):Boolean;
var
msg:string;
Qry   :Tuniquery;
I:integer;
begin
    //Criar nivel dos usuarios
    Result        := False;
    ContPerfil    := TPerfilController.create;
    qry           := Tuniquery.Create(nil);
    Try
      try
        Qry.Connection    := dm.Conn;
        Qry.SQL.Text      := 'Select id_perfil from perfil where id_perfil >0';
        Qry.Open;
        Qry.First;

        if not Qry.Eof then
        begin
          for I := 0 to Qry.RecordCount -1 do
          begin
            ContPerfil.InserirNivel(msg, Qry.FieldByName('id_perfil').AsInteger, AId);
            qry.Next;
          end;
          Result  := True;
        end;
        Qry.Close;

      Except on e:exception do
        begin
          raise Exception.Create(e.Message);
        end;
      end;
    Finally
      FreeAndNIl(ContPerfil);
    End;

end;

class function TConfiguracaoService.ObterDadosEmpresaRelatorio(AID: Integer): TEmpresaRelatorio;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Select e.razao, e.fantasia, e.cep, e.endereco, e.numero, e.complemento, e.bairro,e.cnpj, '+
            'e.ie, e.telefone, e.celular, e.whatsapp, e.email1, e.logo,                        '+
            '    Concat(c.cidade,''/'',c.uf) as cidade                                           '+
            '    from empresa e                                                                '+
            '    inner join cidade c                                                           '+
            '    on e.id_cidade = c.id_cidade                                                  '+
            '    where id_empresa= :Aid';
begin

  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection                      := dm.conn;
      Qry.SQL.Text                        := QryStr;
      Qry.ParamByName('Aid').AsInteger    := AID;
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        Result.razao    :=  Qry.FieldByName('razao').AsString;
        Result.fantasia :=  Qry.FieldByName('fantasia').AsString;
        Result.endereco :=  Qry.FieldByName('endereco').AsString;
        Result.numero   :=  Qry.FieldByName('numero').AsString;
        Result.bairro   :=  Qry.FieldByName('bairro').AsString;
        Result.telefone :=  Qry.FieldByName('telefone').AsString;
        Result.telefone2:=  Qry.FieldByName('whatsapp').AsString;
        Result.celular  :=  Qry.FieldByName('celular').AsString;
        Result.email1   :=  Qry.FieldByName('email1').AsString;
        Result.cnpj     :=  Qry.FieldByName('cnpj').AsString;
        Result.ie       :=  Qry.FieldByName('ie').AsString;
        Result.logo     :=  Qry.FieldByName('logo').AsString;
        Result.cep      :=  Qry.FieldByName('cep').AsString;
        Result.cidade   :=  Qry.FieldByName('cidade').AsString;

      end;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar cValidarEmpresaExits:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

{$REGION 'Pedido'}

class function TConfiguracaoService.ValidarCalculoMetroPedido(AID: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Select calculo_vidracaria from configuracao_nf where id_empresa= :id';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.conn;
      Qry.SQL.Text := QryStr;
      Qry.ParamByName('id').AsInteger := AId;
      Qry.Open;

      if not Qry.IsEmpty then
        Result := SameText(Qry.FieldByName('calculo_vidracaria').AsString, 'S');
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar configuração ValidarCalculoMetroPedido:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

{$ENDREGION}

class function TConfiguracaoService.SincronizarGravar(
  codtabela, idregistro: Integer): Boolean;
var
  Qry: TUniQuery;
const
  QryStr =
    'INSERT INTO sincronizar (id_sincronizar,cod_tabela,status,id_registro) '+
    'SELECT 0,:codigo,''S'',:idregistro '+
    'WHERE NOT EXISTS ( '+
    ' SELECT 1 FROM sincronizar '+
    ' WHERE cod_tabela=:codigo2 '+
    ' AND id_registro=:idregistro2 '+
    ' AND status=''S'' '+
    ')';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);

  try
    try
      Qry.Connection := dm.Conn;
      Qry.SQL.Text := QryStr;

      Qry.ParamByName('codigo').AsInteger := codtabela;
      Qry.ParamByName('idregistro').AsInteger := idregistro;
      Qry.ParamByName('codigo2').AsInteger := codtabela;
      Qry.ParamByName('idregistro2').AsInteger := idregistro;

      Qry.ExecSQL;

      Result := True;

    except
      on E: Exception do
        raise Exception.Create(E.Message);
    end;
  finally
    FreeAndNil(Qry);
  end;
end;



//class Function TConfiguracaoService.SincronizarGravar(codtabela, idregistro: integer): boolean;
//var
//msg:string;
//Qry   :Tuniquery;
//Const QryStr = 'Insert into sincronizar(id_sincronizar, cod_tabela, status, id_registro)'+
//              'Values(0,:1, :2, :3)';
//begin
//    //Sincronizar
//    Result        := False;
//    Qry           := Tuniquery.Create(nil);
//    Try
//      try
//        Qry.Connection    := dm.Conn;
//        Qry.SQL.Text      := QryStr;
//        Qry.Params.ParamByName('1').AsInteger        := codtabela;
//        Qry.Params.ParamByName('2').AsString         := 'S';
//        Qry.Params.ParamByName('3').AsInteger        := idregistro;
//        Qry.ExecSQL;
//        Result  := True;
//        Qry.Close;
//      Except on e:exception do
//        begin
//          raise Exception.Create(e.Message);
//        end;
//      end;
//    Finally
//      FreeAndNIl(Qry);
//    End;
//end;

end.

