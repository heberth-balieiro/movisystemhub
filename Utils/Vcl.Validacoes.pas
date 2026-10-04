unit Vcl.Validacoes;

interface

Uses
  Uni,
  System.SysUtils,
  System.Classes,
  UDm;

Type
  TValidacao = Class

  Private


  Public

    Function ValidarUsoWhatsApp(idemp:integer):Boolean; //se pode enviar oou conectar dispositivo
    Function ValidarUsoApp(idemp:integer):Boolean;   //se pode utilçizar app de vendas
    //Function ValidarMultiEmpresa(idemp:integer):Boolean; //ativar para uso multiempresa;
    Function ObterVersaoBD(out versao:string):Boolean; //obter a versao do banco de dados para verificar se e para atualizar
    Function InstanciaPorFunc(idemp:Integer):Boolean; //Verifiar como vai se a conexao com o whatsapp
    Function LivroCaixaPlanoConfigurado(out idcredito, iddebito, idcusto:integer;idemp:integer):Boolean; //devolver o id_plano de contas configurado
    Function VendedorPadraoPedido(out idFunc:integer;idusuario:integer):boolean; //definir o vendedor pelo usuario logado
    Function VendaGerarLivroCaixa(idemp:integer):Boolean;   // gerar livro caixa caso configurado.
    Function LivroCaixaVenda(out idPlano, idCusto:Integer;idemp:integer):Boolean; //buscar o id do plano configurado e aplicar no lancamento
    //Function RamoEmpresa(id:integer):Boolean;

    function VersaoWhatsapp(out versao:string; idemp: integer): boolean;
    function ApikeyWhatsapp(out key: string; idemp: integer): boolean;
    function TokenWhatsapp(out Token: string; idemp: integer): boolean;
  End;

implementation

{ TValidacao }

function TValidacao.TokenWhatsapp(out Token:string; idemp:integer):boolean;
var
Sqlstr:string;
Qry   :TUniquery;
begin
  Token    := '';     //passando para a confservice
  Result    := False;
  Sqlstr    := 'Select instance_key from temp where id_empresa= :id';
  Qry       := TUniquery.Create(nil);

  Try
    Try

      Qry.Connection    := DM.Conn;//configurar a qry
      Qry.SQL.Text      := Sqlstr;
      qry.Params.ParamByName('id').AsInteger    := idemp;
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        Token  := Qry.FieldByName('instance_key').AsString;
        result  := True;
      end;

      Qry.Close;
    Except on e:exception do
      raise Exception.Create('Erro ao buscar o token da empresa: '+e.Message);
    End;

  Finally
    FreeandNil(Qry);
  End;
end;

function TValidacao.ApikeyWhatsapp(out key:string; idemp:integer):boolean;
var
Sqlstr:string;
Qry   :TUniquery;
begin
  key    := '';
  Result    := False;
  Sqlstr    := 'Select whatsapp_apikey from configuracao_nf where id_empresa= :id';
  Qry       := TUniquery.Create(nil);

  Try
    Try

      Qry.Connection    := DM.Conn;//configurar a qry
      Qry.SQL.Text      := Sqlstr;
      qry.Params.ParamByName('id').AsInteger    := idemp;
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        key  := Qry.FieldByName('whatsapp_apikey').AsString;
        result  := True;
      end;

      Qry.Close;
    Except on e:exception do
      raise Exception.Create('Erro ao buscar a versão da api: '+e.Message);
    End;

  Finally
    FreeandNil(Qry);
  End;
end;

function TValidacao.VersaoWhatsapp(out versao:string; idemp:integer):boolean;
var
Sqlstr:string;
Qry   :TUniquery;
begin
  versao    := '';
  Result    := False;
  Sqlstr    := 'Select whatsapp_versao from configuracao_nf where id_empresa= :id';
  Qry       := TUniquery.Create(nil);

  Try
    Try

      Qry.Connection    := DM.Conn;//configurar a qry
      Qry.SQL.Text      := Sqlstr;
      qry.Params.ParamByName('id').AsInteger    := idemp;
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        versao  := Qry.FieldByName('whatsapp_versao').AsString;
        result  := True;
      end;

      Qry.Close;
    Except on e:exception do
      raise Exception.Create('Erro ao buscar a versão da api: '+e.Message);
    End;

  Finally
    FreeandNil(Qry);
  End;
end;

function TValidacao.ValidarUsoApp(idemp: integer): Boolean;
var
Sqlstr:string;
Qry   :TUniquery;
begin

  Result    := False;
  Sqlstr    := 'Select utilizaapp from configuracao_nf where id_empresa= :id';
  Qry       := TUniquery.Create(nil);

  Try
    Try

      Qry.Connection    := DM.Conn;//configurar a qry
      Qry.SQL.Text      := Sqlstr;
      qry.Params.ParamByName('id').AsInteger    := idemp;
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        result  := Qry.FieldByName('utilizaapp').AsString = 'S';
      end;

      Qry.Close;
    Except on e:exception do
      raise Exception.Create('Erro ao validar uso do app: '+e.Message);
    End;

  Finally
    FreeandNil(Qry);
  End;
end;

function TValidacao.ValidarUsoWhatsApp(idemp: integer): Boolean;
var
Sqlstr:string;
Qry   :TUniquery;

begin
  // criado a funcao em configuracaoservice
  Result    := False;
  Sqlstr    := 'Select utilizawhatsapp from configuracao_nf where id_empresa= :id';

  Qry       := TUniquery.Create(nil);

  Try
    Try
      Qry.Connection    := DM.Conn;
      Qry.SQL.Text      := Sqlstr;
      qry.Params.ParamByName('id').AsInteger    :=idemp;
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        result  := Qry.FieldByName('utilizawhatsapp').AsString = 'S';
      end;

      qry.Close;

    Except on e:exception do
      raise Exception.Create('Erro ao validar uso do whatsapp: '+e.Message);
    End;

  Finally
    FreeAndNil(qry);
  End;

end;

Function TValidacao.ObterVersaoBD(out versao:string):Boolean;
var
Sqlstr:string;
Qry   :TUniquery;
begin
  Result    := False;
  Sqlstr    := 'Select versaobd from empresa limit 1';

  Qry       := TUniquery.Create(nil);

  Try
    Try
      Qry.Connection    := DM.Conn;
      Qry.SQL.Text      := Sqlstr;
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        versao  := Qry.FieldByName('versaobd').AsString;
        result  := True;
      end
      else
      begin
        versao  := '1.24.11.0';
        Result  := True;
      end;
      Qry.Close;

    Except on e:exception do
      raise Exception.Create('Erro ao obter a versão do banco de dados: '+e.Message);
    End;

  Finally
    FreeAndnil(Qry);

  End;
end;

Function TValidacao.InstanciaPorFunc(idemp:Integer):Boolean;
var
Sqlstr:string;
Qry   :TUniquery;
begin
  Result    := False;   //passado para service
  Sqlstr    := 'Select instanciawhatsappfunc from configuracao_nf where id_empresa= :id';
  Qry       := TUniquery.Create(nil);

  Try
    Try


      Qry.Connection    := DM.Conn;
      Qry.SQL.Text      := Sqlstr;
      qry.Params.ParamByName('id').AsInteger    :=idemp;
      Qry.Open;

      if not Qry.IsEmpty then
      begin

        result  := Qry.FieldByName('instanciawhatsappfunc').AsString = 'S';

      end;
      qry.Close;

    Except on e:exception do
      raise Exception.Create('Erro ao validar uso da instancia por funcionário: '+e.Message);
    End;

  Finally
    FreeAndNIl(Qry);

  End;
end;

Function TValidacao.LivroCaixaPlanoConfigurado(out idcredito, iddebito, idcusto:integer;idemp:integer):Boolean;
var
Sqlstr:string;
Qry   :TUniquery;
begin
  Result    := False;
  Sqlstr    := 'Select id_plano_acredito, id_plano_adebito, id_custo_avulso from configuracao_nf where id_empresa= :id';
  Qry       := TUniquery.Create(nil);

  Try
    Try

      Qry.Connection    := DM.Conn;
      Qry.SQL.Text      := Sqlstr;
      qry.Params.ParamByName('id').AsInteger    :=idemp;
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        if (Qry.FieldByName('id_plano_acredito').AsInteger > 0) or
           (Qry.FieldByName('id_plano_adebito').AsInteger > 0)  or
           (Qry.FieldByName('id_custo_avulso').AsInteger > 0)   then
        begin
          idcredito := Qry.FieldByName('id_plano_acredito').AsInteger;
          iddebito  := Qry.FieldByName('id_plano_adebito').AsInteger;
          idcusto   := Qry.FieldByName('id_custo_avulso').AsInteger;
          Result    := True;
        end
        else
          Result    := False;
      end;

      qry.Close;

    Except on e:exception do
     raise Exception.Create('Erro ao localizar o livro caixa: '+e.Message);
    End;

  Finally
    FreeandNil(Qry);

  End;
end;

Function TValidacao.VendedorPadraoPedido(out idFunc:integer;idusuario:integer):boolean;
var
Sqlstr:string;
Qry   :TUniquery;

begin
  Result    := False;
  Sqlstr    := 'Select id_funcionario from usuario where id_usuario= :id';

  Qry       := TUniquery.Create(nil);

  Try
    Try

      Qry.Connection    := DM.Conn;
      Qry.SQL.Text      := Sqlstr;
      qry.Params.ParamByName('id').AsInteger    :=idusuario;
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        if Qry.FieldByName('id_funcionario').AsInteger > 0 then
        begin
          idFunc    := Qry.FieldByName('id_funcionario').AsInteger;
          Result    := True;
        end
        else
          Result    := False;
      end;

      Qry.Close;

    Except on e:exception do
      raise Exception.Create('Erro ao obter o id do funcionário: '+e.Message);
    End;


  Finally
    FreeAndNil(Qry);

  End;
end;

Function TValidacao.VendaGerarLivroCaixa(idemp:integer):Boolean;
var
Sqlstr:string;
Qry   :TUniquery;

begin
  Result    := False;
  Sqlstr    := 'Select vendagerarlivrocaixa from configuracao_nf where id_empresa= :id';

  Qry       := TUniquery.Create(nil);

  Try
    Try

      Qry.Connection    := DM.Conn;
      Qry.SQL.Text      := Sqlstr;
      qry.Params.ParamByName('id').AsInteger    :=idemp;
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        result  := Qry.FieldByName('vendagerarlivrocaixa').AsString = 'S'

      end;
      Qry.Close;

    Except on e:exception do
     raise Exception.Create('Erro validar o livro caixa: '+e.Message);
    End;

  Finally
    FreeAndNil(Qry);

  End;
end;

Function TValidacao.LivroCaixaVenda(out idPlano, idCusto:Integer;idemp:integer):Boolean;
var
Sqlstr:string;
Qry   :TUniquery;

begin
  Result    := False;
  Sqlstr    := 'Select id_plano_venda, id_custo_avulso from configuracao_nf where id_empresa= :id';
  Qry       := TUniquery.Create(nil);

  Try
    Try

      Qry.Connection    := DM.Conn;
      Qry.SQL.Text      := Sqlstr;
      qry.Params.ParamByName('id').AsInteger    :=idemp;
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        if (Qry.FieldByName('id_plano_venda').AsInteger > 0) or
           (Qry.FieldByName('id_custo_avulso').AsInteger > 0) then
        begin
          idPlano := Qry.FieldByName('id_plano_venda').AsInteger;
          idcusto   := Qry.FieldByName('id_custo_avulso').AsInteger;
          Result    := True;
        end
        else
          Result    := False;
      end;
      Qry.Close;

    Except on e:exception do
      raise Exception.Create('Erro ao obter o id do livro caixa: '+e.Message);
    End;

  Finally
    FreeAndNil(qry);

  End;
end;

end.
