unit Model.Convenio_olld;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient,
  Model.SQLQry;

type
  TModelConvenio = class

  private
    Fid_convenio: Integer;
    Fcodigo: Integer;
    Fnome: string;
    Ftipo: string;
    Ftermos: string;
    Finformacao_contrato: string;
    Fvalores: double;
    Ftelefone: string;
    Fativo: string;
    Fid_empresa: Integer;
    Fdatacriacao: TDate;
    Fid_usuario: Integer;
    Fbanco: String;
    Faviso: String;
    Fobs: String;
    Frg: String;
    Femail: String;
    Fbairro: String;
    Fchavepix: String;
    Fcorrentista: String;
    Fapelido: String;
    Fidcidade: Integer;
    Fcpf: String;
    Fresponsavel: String;
    Fcep: String;
    Fnumero: String;
    Fconta: String;
    Fcomplemento: String;
    Fcontato: String;
    Fcelular1: String;
    Fagencia: String;
    Ftipocad: String;
    Fendereco: String;
    Fcelular: String;

    procedure Setid_convenio(const Value: Integer);
    procedure Setcodigo(const Value: Integer);
    procedure Setnome(const Value: string);
    procedure Settipo(const Value: string);
    procedure Settermos(const Value: string);
    procedure Setinformacao_contrato(const Value: string);
    procedure Setvalores(const Value: double);
    procedure Settelefone(const Value: string);
    procedure Setativo(const Value: string);
    procedure Setid_empresa(const Value: Integer);
    procedure Setdatacriacao(const Value: TDate);
    procedure Setid_usuario(const Value: Integer);
    procedure Setagencia(const Value: String);
    procedure Setapelido(const Value: String);
    procedure Setaviso(const Value: String);
    procedure Setbairro(const Value: String);
    procedure Setbanco(const Value: String);
    procedure Setcelular(const Value: String);
    procedure Setcelular1(const Value: String);
    procedure Setcep(const Value: String);
    procedure Setchavepix(const Value: String);
    procedure Setcomplemento(const Value: String);
    procedure Setconta(const Value: String);
    procedure Setcontato(const Value: String);
    procedure Setcorrentista(const Value: String);
    procedure Setcpf(const Value: String);
    procedure Setemail(const Value: String);
    procedure Setendereco(const Value: String);
    procedure Setidcidade(const Value: Integer);
    procedure Setnumero(const Value: String);
    procedure Setobs(const Value: String);
    procedure Setresponsavel(const Value: String);
    procedure Setrg(const Value: String);
    procedure Settipocad(const Value: String);

  public

    property id_convenio: Integer read Fid_convenio write Setid_convenio;
    property codigo: Integer read Fcodigo write Setcodigo;
    property nome: string read Fnome write Setnome;
    property tipo: string read Ftipo write Settipo;
    property termos: string read Ftermos write Settermos;
    property informacao_contrato: string read Finformacao_contrato write Setinformacao_contrato;
    property valores: Double read Fvalores write Setvalores;
    property telefone: string read Ftelefone write Settelefone;
    property ativo: string read Fativo write Setativo;
    property id_empresa: Integer read Fid_empresa write Setid_empresa;
    property datacriacao: TDate read Fdatacriacao write Setdatacriacao;
    property id_usuario: Integer read Fid_usuario write Setid_usuario;

    property tipocad      :String read Ftipocad        write Settipocad;
    property apelido      :String read Fapelido        write Setapelido;
    property cpf          :String read Fcpf            write Setcpf;
    property rg           :String read Frg             write Setrg;
    property cep          :String read Fcep            write Setcep;
    property endereco     :String read Fendereco       write Setendereco;
    property numero       :String read Fnumero         write Setnumero;
    property bairro       :String read Fbairro         write Setbairro;
    property complemento  :String read Fcomplemento    write Setcomplemento;
    property idcidade     :Integer read Fidcidade      write Setidcidade;
    property obs          :String read Fobs            write Setobs;
    property aviso        :String read Faviso          write Setaviso;
    property email        :String read Femail          write Setemail;
    property chavepix     :String read Fchavepix       write Setchavepix;
    property banco        :String read Fbanco          write Setbanco;
    property conta        :String read Fconta          write Setconta;
    property agencia      :String read Fagencia        write Setagencia;
    property correntista  :String read Fcorrentista    write Setcorrentista;
    property responsavel  :String read Fresponsavel    write Setresponsavel;
    property contato      :String read Fcontato        write Setcontato;
    property celular      :String read Fcelular        write Setcelular;
    property celular1     :String read Fcelular1       write Setcelular1;


    Function Novo(out msg:string):Boolean;
    Function Editar(out msg:string):Boolean;
    Function Excluir(out msg:string; i:integer):Boolean;

    Function Localizar(out msg:string;TabStatus:integer;campo:string):Boolean;
    Function LocalizarID(out msg:string;i:integer):Boolean;

  end;

  var
  ModelSql   :TModelSql;

implementation

{$REGION 'Funções'}

Function TModelConvenio.Novo(out msg:string):Boolean;
var
  sqlQuery: string;
begin
  Result  := false;
  sqlQuery      := 'INSERT INTO convenio (id_convenio, codigo, nome, tipo, termos,'+
                  ' informacao_contrato, valores, telefone, ativo, id_empresa, datacriacao, id_usuario,'+
                  ' tipocad, apelido, cpf, rg, cep, endereco, numero, bairro, complemento, id_cidade,'+
                  ' obs, aviso, email, chave_pix, banco, conta, agencia, correntista, responsavel, contato, '+
                  ' celular, celular1, sinc_app'+
                               ')  '+
                  ' VALUES (:id_convenio, :codigo, :nome, :tipo, :termos, :informacao_contrato,'+
                  ' :valores, :telefone, :ativo, :id_empresa, :datacriacao, :id_usuario,'+
                  ' :tipocad, :apelido, :cpf, :rg, :cep, :endereco, :numero, :bairro, :complemento, :idcidade,'+
                  ' :obs, :aviso, :email, :chavepix, :banco, :conta, :agencia, :correntista, :responsavel, :contato, '+
                  ' :celular, :celular1, ''S'''+
                  ');';

  ModelSql      := TModelSQL.Create;

  Try

    Try
      id_convenio  := ModelSql.GerarId(dm.Conn,'convenio','id_convenio');
      codigo       := ModelSql.GerarId(dm.Conn,'convenio','codigo');

      if modelSql.ExecutarSQL(DM.Conn,sqlQuery, [id_convenio, codigo, Fnome, FTipo, FTermos,
                          Finformacao_contrato, FValores, FTelefone, Fativo, FID_empresa,Date, Fid_usuario,
                          tipocad, apelido, cpf, rg, cep, endereco, numero, bairro, complemento, idcidade,
                          obs, aviso, email, chavepix, banco, conta, agencia, correntista, responsavel, contato,
                          celular, celular1
                          ]) then
      begin
        Result  := True;
        msg     := 'Registro inserido com sucesso!';
      end
      else
        msg     := 'Erro ao inserir os dados!';
    Except on e:exception do
      begin
        msg := 'Erro ao inserir os dados:'+#13+e.Message;
      end;
    End;

  Finally
    ModelSql.Free;
  End;
end;

Function TModelConvenio.Editar(out msg:string):Boolean;
var
  sqlQuery: string;
begin
  Result  := false;
  sqlQuery      := 'UPDATE convenio SET nome = :nome, tipo = :tipo, termos = :termos, '+
                  'informacao_contrato = :informacao_contrato, valores = :valores, telefone = :telefone, '+
                  'ativo = :ativo,'+
                  'tipocad= :tipocad, apelido= :apelido, cpf= :cpf, rg= :rg, cep= :cep, '+
                  'endereco= :endereco, numero= :numero, bairro= :bairro, complemento =:complemento, id_cidade= :idcidade,'+
                  'obs= :obs, aviso= :aviso, email= :email, chave_pix= :chavepix, '+
                  'banco= :banco, conta= :conta, agencia= :agencia, correntista= :correntista, responsavel= :responsavel, contato= :contato, '+
                  'celular= :celular, celular1= :celular1, sinc_app= ''S''   '+
                  ' WHERE id_convenio= :id;';

  ModelSql    := TModelSQL.Create;

  Try
    Try
      if ModelSql.ExecutarSQL(DM.Conn,sqlQuery, [Fnome, Ftipo, Ftermos, Finformacao_contrato, FValores, Ftelefone, Fativo,
                              tipocad, apelido, cpf, rg, cep, endereco, numero, bairro, complemento, idcidade,
                              obs, aviso, email, chavepix, banco, conta, agencia, correntista, responsavel, contato,
                              celular, celular1, Fid_convenio]) then
      begin
        Result  := True;
        msg     := 'Registro atualizado com sucesso!';
      end
      else
        msg     := 'Erro ao atualizar os dados!';
    Except on e:exception do
      begin
        msg := 'Erro ao atualizar os dados:'+#13+e.Message;
      end;
    End;
  Finally
    ModelSql.Free;
  End;
end;

Function TModelConvenio.Excluir(out msg:string; i:integer):Boolean;
var
  sqlQuery: string;
begin
  Result        := false;
  sqlQuery      := 'Update convenio set sinc_app=''S'', ativo=''N'', excluido= :ex, data_exc= CURRENT_TIMESTAMP, id_usuario_exc= :iduser where id_convenio= :id';

  Try
    ModelSql      := TModelSQL.Create;
    Try
      Try
        //Antes de excluir verificar na API.

        if Modelsql.ExecutarSQL(DM.Conn,sqlQuery, [1, i, Fid_convenio]) then
        begin
          Result  := True;
          msg     := 'Registro excluido com sucesso!';
        end
        else
          msg     := 'Erro ao excluir os dados!';
      Except on e:exception do
        begin
          msg := 'Erro ao excluir os dados:'+#13+e.Message;
        end;
      End;
    Finally
      ModelSql.Free;
    End;
  except on e:exception do
    raise Exception.Create(e.Message);
  End;
end;

{$ENDREGION}


{$REGION 'Pesquisa'}

Function TModelConvenio.Localizar(out msg:string;TabStatus:integer;campo:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery, sqlOrdem, sqlCampo, SqlStatus: string;
begin
  Result  := False;

  sqlQuery  := 'Select * from convenio where id_convenio >0 and excluido=0';

  sqlOrdem  := ' order by codigo, nome';

  case TabStatus of
    1:SqlStatus := ' and ativo=''S''';
    2:SqlStatus := ' and ativo=''N''';
  end;

  if Campo <>'' then
  begin
    sqlCampo  := sqlCampo + ' and (codigo= :filtro or nome like :filtro or telefone like :filtro)';
    sqlQuery  := sqlQuery + SqlStatus +  sqlCampo + sqlOrdem;
  end
  else
    sqlQuery  := sqlQuery + SqlStatus + sqlOrdem;

  ModelSql     := TModelsql.Create;

  Try
    if campo <>'' then
    Qry := ModelSql.ConsultarSQL(DM.Conn,sqlQuery, [Campo])
    else
    Qry := ModelSql.ConsultarSQL(DM.Conn,sqlQuery, []);

    try

      if dm.TabConsConvenio.Active then //se estiver ativo limpar tabelas
        begin
          dm.TabConsConvenio.EmptyDataSet;
        end
        else
        begin
          dm.TabConsConvenio.Open;
          dm.TabConsConvenio.EmptyDataSet;
        end;

      if not qry.IsEmpty then
      begin
        Result  := True;
        msg     := 'Pesquisa realizada com sucesso!';

        Qry.First;
        dm.TabConsConvenio.DisableControls;

        while not Qry.Eof do
        begin
          dm.TabConsConvenio.Append;
          dm.TabConsConvenioid_convenio.AsInteger   := Qry.FieldByName('id_convenio').AsInteger;
          dm.TabConsConveniocodigo.AsInteger        := Qry.FieldByName('codigo').AsInteger;
          dm.TabConsConvenionome.AsString           := Qry.FieldByName('nome').AsString;
          dm.TabConsConveniotipo.AsString           := Qry.FieldByName('tipo').AsString;
          dm.TabConsConveniotelefone.AsString       := Qry.FieldByName('telefone').AsString;

          dm.TabConsConvenio.Post;
          Qry.Next;
        end;

        dm.TabConsConvenio.First;
        dm.TabConsConvenio.EnableControls;
      end
      else
      msg := 'Nenhum registro encontrado!';

    finally
      Qry.Free;
    end;
  Finally
    ModelSql.Free;
  End;
end;

Function TModelConvenio.LocalizarID(out msg:string;i:integer):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result    := False;
  sqlQuery  := 'Select * from convenio where id_convenio= :id';

  ModelSql  := TModelsql.Create;
  Try
    Qry     := modelSql.ConsultarSQL(DM.Conn,sqlQuery, [i]);

    try
      if not Qry.IsEmpty then
      begin
        id_convenio           := Qry.FieldByName('id_convenio').AsInteger;
        codigo                := Qry.FieldByName('codigo').AsInteger;
        nome                  := Qry.FieldByName('nome').AsString;
        tipo                  := Qry.FieldByName('tipo').AsString;
        termos                := Qry.FieldByName('termos').AsString;
        informacao_contrato   := Qry.FieldByName('informacao_contrato').AsString;
        valores               := Qry.FieldByName('valores').AsFloat;
        telefone              := Qry.FieldByName('telefone').AsString;
        ativo                 := Qry.FieldByName('ativo').AsString;
        tipocad               := Qry.FieldByName('tipocad').AsString;
        apelido               := Qry.FieldByName('apelido').AsString;
        cpf                   := Qry.FieldByName('cpf').AsString;
        rg                    := Qry.FieldByName('rg').AsString;
        cep                   := Qry.FieldByName('cep').AsString;
        endereco              := Qry.FieldByName('endereco').AsString;
        numero                := Qry.FieldByName('numero').AsString;
        bairro                := Qry.FieldByName('bairro').AsString;
        complemento           := Qry.FieldByName('complemento').AsString;
        idcidade              := Qry.FieldByName('id_cidade').AsInteger;
        obs                   := Qry.FieldByName('obs').AsString;
        aviso                 := Qry.FieldByName('aviso').AsString;
        email                 := Qry.FieldByName('email').AsString;
        chavepix              := Qry.FieldByName('chave_pix').AsString;
        banco                 := Qry.FieldByName('banco').AsString;
        conta                 := Qry.FieldByName('conta').AsString;
        agencia               := Qry.FieldByName('agencia').AsString;
        correntista           := Qry.FieldByName('correntista').AsString;
        responsavel           := Qry.FieldByName('responsavel').AsString;
        contato               := Qry.FieldByName('contato').AsString;
        celular               := Qry.FieldByName('celular').AsString;
        celular1              := Qry.FieldByName('celular1').AsString;
        Result                := True;
      end;

    finally
      Qry.Free;
    end;
  Finally
    ModelSql.Free;
  End;
end;

{$ENDREGION}

{$REGION 'Set'}

procedure TModelConvenio.Setidcidade(const Value: Integer);
begin
  Fidcidade := Value;
end;

procedure TModelConvenio.Setid_convenio(const Value: Integer);
begin
  Fid_convenio := Value;
end;

procedure TModelConvenio.Setcelular(const Value: String);
begin
  Fcelular := Value;
end;

procedure TModelConvenio.Setcelular1(const Value: String);
begin
  Fcelular1 := Value;
end;

procedure TModelConvenio.Setcep(const Value: String);
begin
  Fcep := Value;
end;

procedure TModelConvenio.Setchavepix(const Value: String);
begin
  Fchavepix := Value;
end;

procedure TModelConvenio.Setcodigo(const Value: Integer);
begin
  Fcodigo := Value;
end;

procedure TModelConvenio.Setcomplemento(const Value: String);
begin
  Fcomplemento := Value;
end;

procedure TModelConvenio.Setconta(const Value: String);
begin
  Fconta := Value;
end;

procedure TModelConvenio.Setcontato(const Value: String);
begin
  Fcontato := Value;
end;

procedure TModelConvenio.Setcorrentista(const Value: String);
begin
  Fcorrentista := Value;
end;

procedure TModelConvenio.Setcpf(const Value: String);
begin
  Fcpf := Value;
end;

procedure TModelConvenio.Setnome(const Value: string);
begin
  if value='' then
  raise Exception.Create('Preencha o nome do convênio');
  Fnome := Value;
end;

procedure TModelConvenio.Setnumero(const Value: String);
begin
  Fnumero := Value;
end;

procedure TModelConvenio.Setobs(const Value: String);
begin
  Fobs := Value;
end;

procedure TModelConvenio.Setresponsavel(const Value: String);
begin
  Fresponsavel := Value;
end;

procedure TModelConvenio.Setrg(const Value: String);
begin
  Frg := Value;
end;

procedure TModelConvenio.Settipo(const Value: string);
begin
  Ftipo := Value;
end;

procedure TModelConvenio.Settipocad(const Value: String);
begin
  Ftipocad := Value;
end;

procedure TModelConvenio.Settermos(const Value: string);
begin
  Ftermos := Value;
end;

procedure TModelConvenio.Setinformacao_contrato(const Value: string);
begin
  Finformacao_contrato := Value;
end;

procedure TModelConvenio.Setvalores(const Value: double);
begin
  Fvalores := Value;
end;

procedure TModelConvenio.Settelefone(const Value: string);
begin
  Ftelefone := Value;
end;

procedure TModelConvenio.Setagencia(const Value: String);
begin
  Fagencia := Value;
end;

procedure TModelConvenio.Setapelido(const Value: String);
begin
  Fapelido := Value;
end;

procedure TModelConvenio.Setativo(const Value: string);
begin
  Fativo := Value;
end;

procedure TModelConvenio.Setaviso(const Value: String);
begin
  Faviso := Value;
end;

procedure TModelConvenio.Setbairro(const Value: String);
begin
  Fbairro := Value;
end;

procedure TModelConvenio.Setbanco(const Value: String);
begin
  Fbanco := Value;
end;

procedure TModelConvenio.Setid_empresa(const Value: Integer);
begin
  Fid_empresa := Value;
end;

procedure TModelConvenio.Setdatacriacao(const Value: TDate);
begin
  Fdatacriacao := Value;
end;

procedure TModelConvenio.Setemail(const Value: String);
begin
  Femail := Value;
end;

procedure TModelConvenio.Setendereco(const Value: String);
begin
  Fendereco := Value;
end;

procedure TModelConvenio.Setid_usuario(const Value: Integer);
begin
  Fid_usuario := Value;
end;

{$ENDREGION}

end.
