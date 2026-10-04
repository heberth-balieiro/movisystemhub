unit Model.Socio;

interface

Uses
  Uni,System.SysUtils, System.Classes, UDM, data.DB,
  datasnap.dbclient,System.JSON, Vcl.Session;

Type

  TModelSocio = Class

  Private
    FTransacao  : TUniTransaction;

    fobs: string;
    Frg: String;
    Fidempresa: integer;
    Fpai: string;
    Femail: string;
    Fbairro: String;
    Fnascimento: Tdatetime;
    Fsociodeste: Tdate;
    Fnaturalde: integer;
    Fapelido: String;
    Fidcidade: integer;
    Fcodigo: integer;
    Fcivil: String;
    Fcpf: String;
    Fserie: String;
    Fcep: String;
    Fnumero: String;
    Fidsede: integer;
    Fpis: String;
    Forgao: String;
    Fsituacao: string;
    Fctps: String;
    Fcomplemento: String;
    Fwhatsapp: String;
    Fidsocio: Integer;
    Fsexo: String;
    Fnome: String;
    Fmatricula: integer;
    Fdtdesativado: tdate;
    fadmissao: tdatetime;
    Fendereco: String;
    Fmae: string;
    Ftelefone: String;
    Fprofissao: string;
    Fcelular: String;
    Fclitipo: string;
    Fresponsavel: string;
    Fenvwhats: string;
    Fcliente: string;
    Fenvemail: string;
    Ffornecedor: string;
    Fcodfornecedor: integer;
    Faviso: string;
    Ftelefone2: String;
    Fcelular2: String;
    Ffoto: string;
    Fidescritorio: Integer;
    Fapp: string;
    Fdesconto: double;
    Fsindidempresa: integer;
    Fidprofissao: integer;
    Fsalario: double;
    Fbloqueado: string;
    Fmensalidade: String;
    Fidlotacao: integer;
    Flimite: Double;
    FProfCNPJ: string;
    FProfBairro: string;
    FProfIDCidade: Integer;
    FProfCEP: string;
    FProfNumero: string;
    FProfTempoServico: string;
    FProfComplemento: string;
    FProfEndereco: string;
    FProfTelefone: string;
    FProfRazao: string;
    Fnacionalidade: String;
    Ftiporesidencia: String;
    Fcnh: String;
    Femissaorg: Tdate;
    Ftemporesidencia: String;
    Fref_telefone5: String;
    Fref_pessoal2: String;
    Fref_pessoal1: String;
    Fref_afinidade2: String;
    Fref_tempo2: String;
    Fref_comercial2: String;
    Fref_afinidade1: String;
    Fref_tempo1: String;
    Fref_comercial1: String;
    Fref_conta2: String;
    Fref_conta1: String;
    Fref_agencia2: String;
    Fref_telefone2: String;
    Fref_agencia1: String;
    Fref_telefone3: String;
    Fref_banco2: String;
    Fref_telefone1: String;
    Fref_telefone6: String;
    Fref_banco1: String;
    Fref_telefone4: String;
    Ffin_parcela4: double;
    Ffin_financio2: String;
    Ffin_financio3: String;
    Ffin_financio1: String;
    Ffin_financio4: String;
    Ffin_ano2: String;
    Ffin_ano3: String;
    Ffin_ano1: String;
    Ffin_ano4: String;
    Ffin_veiculo2: String;
    Ffin_outros: String;
    Ffin_veiculo3: String;
    Ffin_veiculo1: String;
    Ffin_parcela2: double;
    Ffin_parcela3: double;
    Ffin_veiculo4: String;
    Ffin_parcela1: double;
    function InativarCarteiraExcluida(iduser, i: integer): Boolean;


  public
    constructor Create;
    destructor Destroy; override;

    property idsocio        :Integer  read  Fidsocio        write Fidsocio;
    property idempresa      :integer  read  Fidempresa      write Fidempresa;
    property idsede         :integer  read  Fidsede         write Fidsede;
    property codigo         :integer  read  Fcodigo         write FCodigo;
    property matricula      :integer  read  Fmatricula      write Fmatricula;
    property sociodeste     :Tdate    read  Fsociodeste     write Fsociodeste;
    property situacao       :string   read  Fsituacao       write Fsituacao;
    property nome           :String   read  Fnome           write Fnome;
    property apelido        :String   read  Fapelido        write Fapelido;
    property cep            :String   read  Fcep            write Fcep;
    property endereco       :String   read  Fendereco       write Fendereco;
    property numero         :String   read  Fnumero         write Fnumero;
    property complemento    :String   read  Fcomplemento    write Fcomplemento;
    property bairro         :String   read  Fbairro         write Fbairro;
    property idcidade       :integer  read  Fidcidade       write Fidcidade;
    property telefone       :String   read  Ftelefone       write Ftelefone;
    property celular        :String   read  Fcelular        write Fcelular;
    property whatsapp       :String   read  Fwhatsapp       write Fwhatsapp;
    property cpf            :String   read  Fcpf            write Fcpf;
    property rg             :String   read  Frg             write Frg;
    property orgao          :String   read  Forgao          write Forgao;
    property ctps           :String   read  Fctps           write Fctps;
    property serie          :String   read  Fserie          write Fserie;
    property pis            :String   read  Fpis            write Fpis;
    property sexo           :String   read  Fsexo           write Fsexo;
    property civil          :String   read  Fcivil          write Fcivil;
    property nascimento     :TdateTime    read  Fnascimento     write Fnascimento;
    property naturalde      :integer  read  Fnaturalde      write Fnaturalde;
    property email          :string   read  Femail          write Femail;
    property pai            :string   read  Fpai            write Fpai;
    property mae            :string   read  Fmae            write Fmae;
    property profissao      :string   read  Fprofissao      write Fprofissao;
    property admissao       :tdateTime    read  fadmissao       write Fadmissao;
    property dtdesativado   :tdate    read  Fdtdesativado   write Fdtdesativado;
    property obs            :string   read  fobs            write Fobs;
    property clitipo        :string   read  Fclitipo        write Fclitipo;
    property responsavel    :string   read  Fresponsavel    write Fresponsavel;
    property cliente        :string   read  Fcliente        write Fcliente;
    property fornecedor     :string   read  Ffornecedor     write Ffornecedor;
    property envemail       :string   read  Fenvemail       write Fenvemail;
    property envwhats       :string   read  Fenvwhats       write Fenvwhats;
    property codfornecedor  :integer  read  Fcodfornecedor  write Fcodfornecedor;
    property telefone2      :String   read  Ftelefone2      write Ftelefone2;
    property celular2       :String   read  Fcelular2       write Fcelular2;
    property aviso          :string   read  Faviso          write FAviso;
    property foto           :string   read  Ffoto           write Ffoto;
    property idescritorio   :Integer  read  Fidescritorio   write Fidescritorio;
    property app            :string   read  Fapp            write Fapp;
    property desconto       :double   read  Fdesconto       write Fdesconto;
    property salario        :double   read  Fsalario        write Fsalario;
    property mensalidade    :String   read  Fmensalidade    write Fmensalidade;
    property bloqueado      :string   read  Fbloqueado      write Fbloqueado;
    property sindidempresa  :integer  read  Fsindidempresa  write Fsindidempresa;
    property idprofissao    :integer  read  Fidprofissao    write Fidprofissao;
    property idlotacao      :integer  read  Fidlotacao      write Fidlotacao;
    property limite         :Double   read  Flimite         write Flimite;
    property ProfCNPJ       : string  read  FProfCNPJ       write FProfCNPJ;
    property ProfRazao      : string  read  FProfRazao      write FProfRazao;
    property ProfTelefone   : string  read  FProfTelefone   write FProfTelefone;
    property ProfCEP        : string  read  FProfCEP        write FProfCEP;
    property ProfEndereco   : string  read  FProfEndereco   write FProfEndereco;
    property ProfNumero     : string  read  FProfNumero     write FProfNumero;
    property ProfComplemento: string  read  FProfComplemento write FProfComplemento;
    property ProfBairro     : string  read  FProfBairro     write FProfBairro;
    property ProfIDCidade   : Integer read  FProfIDCidade   write FProfIDCidade;
    property ProfTempoServico: string read  FProfTempoServico write FProfTempoServico;
    property cnh            : String  read  Fcnh             write  Fcnh;
    property tiporesidencia : String  read  Ftiporesidencia  write  Ftiporesidencia;
    property temporesidencia: String  read  Ftemporesidencia write  Ftemporesidencia;
    property emissaorg      : Tdate   read  Femissaorg       write  Femissaorg;
    property nacionalidade  : String  read  Fnacionalidade   write  Fnacionalidade;

    property ref_banco1     : String  read  Fref_banco1      write Fref_banco1;
    property ref_banco2     : String  read  Fref_banco2      write Fref_banco2;
    property ref_agencia1   : String  read  Fref_agencia1    write Fref_agencia1;
    property ref_agencia2   : String  read  Fref_agencia2    write Fref_agencia2;
    property ref_conta1     : String  read  Fref_conta1      write Fref_conta1;
    property ref_conta2     : String  read  Fref_conta2      write Fref_conta2;
    property ref_telefone1  : String  read  Fref_telefone1   write Fref_telefone1;
    property ref_telefone2  : String  read  Fref_telefone2   write Fref_telefone2;
    property ref_tempo1     : String  read  Fref_tempo1      write Fref_tempo1;
    property ref_tempo2     : String  read  Fref_tempo2      write Fref_tempo2;
    property ref_pessoal1   : String  read  Fref_pessoal1    write Fref_pessoal1;
    property ref_pessoal2   : String  read  Fref_pessoal2    write Fref_pessoal2;
    property ref_telefone3  : String  read  Fref_telefone3   write Fref_telefone3;
    property ref_telefone4  : String  read  Fref_telefone4   write Fref_telefone4;
    property ref_afinidade1 : String  read  Fref_afinidade1  write Fref_afinidade1;
    property ref_afinidade2 : String  read  Fref_afinidade2  write Fref_afinidade2;
    property ref_comercial1 : String  read  Fref_comercial1  write Fref_comercial1;
    property ref_comercial2 : String  read  Fref_comercial2  write Fref_comercial2;
    property ref_telefone5  : String  read  Fref_telefone5   write Fref_telefone5;
    property ref_telefone6  : String  read  Fref_telefone6   write Fref_telefone6;

    property fin_veiculo1   : String  read  Ffin_veiculo1    write Ffin_veiculo1;
    property fin_veiculo2   : String  read  Ffin_veiculo2    write Ffin_veiculo2;
    property fin_veiculo3   : String  read  Ffin_veiculo3    write Ffin_veiculo3;
    property fin_veiculo4   : String  read  Ffin_veiculo4    write Ffin_veiculo4;
    property fin_ano1       : String  read  Ffin_ano1        write Ffin_ano1;
    property fin_ano2       : String  read  Ffin_ano2        write Ffin_ano2;
    property fin_ano3       : String  read  Ffin_ano3        write Ffin_ano3;
    property fin_ano4       : String  read  Ffin_ano4        write Ffin_ano4;
    property fin_financio1  : String  read  Ffin_financio1   write Ffin_financio1;
    property fin_financio2  : String  read  Ffin_financio2   write Ffin_financio2;
    property fin_financio3  : String  read  Ffin_financio3   write Ffin_financio3;
    property fin_financio4  : String  read  Ffin_financio4   write Ffin_financio4;
    property fin_parcela1   : double  read  Ffin_parcela1    write Ffin_parcela1;
    property fin_parcela2   : double  read  Ffin_parcela2    write Ffin_parcela2;
    property fin_parcela3   : double  read  Ffin_parcela3    write Ffin_parcela3;
    property fin_parcela4   : double  read  Ffin_parcela4    write Ffin_parcela4;
    property fin_outros     : String  read  Ffin_outros      write Ffin_outros;


    Function Insert(out msg:String; out id:integer):Boolean;
    Function Update(out msg:string):Boolean;
    Function Delete(out msg:string;iduser:integer):Boolean;
    Function Select(out msg:string):Boolean;
    Function GerarId(tab, campo:string):integer;
    Function Pesquisa(out msg:string; Par1,Par2, Par3:String):Boolean;
    Function PopularDataSet(out msg:string; Tab, TabAtivo:integer; Filtro:String):Boolean;

    function PopularDataSetWhatsApp(out msg: string; Tab, TabAtivo,idSecretaria: integer;
      Filtro: String): Boolean;

    Function RelacaoAniversariante(out msg:string; Dia1,Dia2,Mes1,Mes2,ordem:Integer):Boolean;

    procedure IniciarTransacao;
    procedure ConfirmarTransacao;
    procedure DesfazerTransacao;

  End;

implementation

uses
  cxDateUtils, Model.SQLQry;

Function TModelSocio.RelacaoAniversariante(out msg:string; Dia1,Dia2,Mes1,Mes2,ordem:Integer):Boolean;
var
Sqlstr,sqlordem:string;
Qry   :TUniquery;
Model : TModelSQL;
begin
  Result    := False;
  Model     := TModelSQL.Create;

  Try
    Sqlstr  := 'SELECT s.id_socio, s.codigo, s.nome, s.apelido, s.celular, s.whatsapp, s.nascimento '+
                ' FROM socio s                                                          '+
                ' WHERE EXTRACT(DAY FROM s.nascimento)  >= :DIA1  AND                   '+
                '               EXTRACT(DAY FROM s.nascimento) <=  :DIA2  AND           '+
                '               EXTRACT(MONTH FROM s.nascimento) >= :MES1 AND           '+
                '               EXTRACT(MONTH FROM s.nascimento) <= :MES2';

    case ordem of
      0:sqlordem  := ' order by codigo';
      1:sqlordem  := ' order by nome';
      2:sqlordem  := ' order by nascimento';
    end;

    Qry     := Model.ConsultarSQL(dm.Conn,Sqlstr+sqlordem,[Dia1,Dia2,Mes1,Mes2]);

    Qry.First;
    if dm.TabRelacaoAniversariante.Active then
    begin
      dm.TabRelacaoAniversariante.EmptyDataSet;
    end
    else
    begin
      dm.TabRelacaoAniversariante.Open;
      dm.TabRelacaoAniversariante.EmptyDataSet;
    end;

    dm.TabRelacaoAniversariante.DisableControls;
    Try
      if not Qry.IsEmpty then
      begin
        while not Qry.Eof do
        begin
          dm.TabRelacaoAniversariante.Append;
          dm.TabRelacaoAniversarianteid_socio.AsInteger     := Qry.FieldByName('id_socio').AsInteger;
          dm.TabRelacaoAniversariantecodigo.AsInteger       := Qry.FieldByName('codigo').AsInteger;
          dm.TabRelacaoAniversariantenome.AsString          := Qry.FieldByName('nome').AsString;
          dm.TabRelacaoAniversarianteapelido.AsString       := Qry.FieldByName('apelido').AsString;
          dm.TabRelacaoAniversariantecelular.AsString       := Qry.FieldByName('celular').AsString;
          dm.TabRelacaoAniversariantewhatsapp.AsString      := Qry.FieldByName('whatsapp').AsString;
          dm.TabRelacaoAniversariantenascimento.AsDateTime  := Qry.FieldByName('nascimento').AsDateTime;
          dm.TabRelacaoAniversariante.Post;
          Qry.Next;
        end;
        Result  := True;
        dm.TabRelacaoAniversariante.EnableControls;
        dm.TabRelacaoAniversariante.First;
      end;

    Finally
      Qry.Free;
    End;

  Finally
    Model.Free;
  End;
end;

procedure TModelSocio.DesfazerTransacao;
begin
  try
    if Assigned(FTransacao) and FTransacao.Active then
      FTransacao.Rollback;
  except
    on E: Exception do
      raise Exception.Create('Erro ao desfazer transação: ' + E.Message);
  end;
end;

destructor TModelSocio.Destroy;
begin
Try
    if Assigned(FTransacao) then
    FreeAndNil(FTransacao);

  except
    on E: Exception do
      raise Exception.Create('Erro ao liberar recursos: ' + E.Message);
  end;
end;

Function TModelSocio.GerarId(tab, campo:string):integer;
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

procedure TModelSocio.IniciarTransacao;
begin
  try
    if not Assigned(FTransacao) then
      raise Exception.Create('Transação não inicializada.');

    if not FTransacao.Active then
      FTransacao.StartTransaction;
  except
    on E: Exception do
      raise Exception.Create('Erro ao iniciar transação: ' + E.Message);
  end;
end;

Function TModelSocio.Insert(out msg:String; out id:integer):Boolean;
var
Qry       : TUniquery;
sqlQuery  : string;
begin
  Result  := False;

  sqlQuery := 'Insert Into socio ('+
                  'id_socio,'+
                  'id_empresa,'+
                  'id_sede,'+
                  'codigo,'+
                  'matricula,'+
                  'socio_deste,'+
                  'situacao,'+
                  'nome,'+
                  'apelido,'+
                  'cep,'+
                  'endereco,'+
                  'numero,'+
                  'bairro,'+
                  'complemento,'+
                  'id_cidade,'+
                  'telefone,'+
                  'celular,'+
                  'whatsapp,'+
                  'cpf,'+
                  'rg,'+
                  'orgao,'+
                  'ctps,'+
                  'serie,'+
                  'pis,'+
                  'sexo,'+
                  'estado_civil,'+
                  'nascimento,'+
                  'natural_cidade,'+
                  'email,'+
                  'pai,'+
                  'mae,'+
                  'profissao,'+
                  'admissao,'+
                  'obs,'+
                  'cli_tipo,'+
                  'cli_responsavel,'+
                  'cliente,'+
                  'fornecedor,'+
                  'envemail,'+
                  'envwhats,'+
                  'codfornecedor,'+
                  'telefone2,'+
                  'celular2,'+
                  'aviso,'+
                  'foto,'+
                  'escritorio,'+
                  'mostrarapp,'+
                  'sindicato_perc_desconto,'+
                  'sindicato_salario,'+
                  'tipo_mensalidade,'+
                  'bloqueado,'+
                  'sind_id_empresa,'+
                  'id_profissao,'+
                  'id_lotacao,'+
                  'limite,'+
                  'prof_cnpj,'+
                  'prof_razao,'+
                  'prof_telefone,'+
                  'prof_cep,'+
                  'prof_endereco,'+
                  'prof_numero,'+
                  'prof_complemento,'+
                  'prof_bairro,'+
                  'prof_idcidade,'+
                  'prof_temposervico,'+
                  'cnh,'+
                  'tiporesidencia,'+
                  'temporesidencia,'+
                  'emissaorg,'+
                  'nacionalidade,'+
                  'ref_banco1,'+
                  'ref_banco2,'+
                  'ref_agencia1,'+
                  'ref_agencia2,'+
                  'ref_conta1,'+
                  'ref_conta2,'+
                  'ref_telefone1,'+
                  'ref_telefone2,'+
                  'ref_tempo1,'+
                  'ref_tempo2,'+
                  'ref_pessoal1,'+
                  'ref_pessoal2,'+
                  'ref_telefone3,'+
                  'ref_telefone4,'+
                  'ref_afinidade1,'+
                  'ref_afinidade2,'+
                  'ref_comercial1,'+
                  'ref_comercial2,'+
                  'ref_telefone5,'+
                  'ref_telefone6,'+
                  'fin_veiculo1,'+
                  'fin_veiculo2,'+
                  'fin_veiculo3,'+
                  'fin_veiculo4,'+
                  'fin_ano1,'+
                  'fin_ano2,'+
                  'fin_ano3,'+
                  'fin_ano4,'+
                  'fin_financiou1,'+
                  'fin_financiou2,'+
                  'fin_financiou3,'+
                  'fin_financiou4,'+
                  'fin_parcela1,'+
                  'fin_parcela2,'+
                  'fin_parcela3,'+
                  'fin_parcela4,'+
                  'fin_outros,'+
                  'sinc_app'+

                  ')'+
                  ' Values'+
                  '(:idsocio,'+
                  ':idempresa,'+
                  ':idsede,'+
                  ':codigo,'+
                  ':matricula,'+
                  ':sociodeste,'+
                  ':situacao,'+
                  ':nome,'+
                  ':apelido,'+
                  ':cep,'+
                  ':endereco,'+
                  ':numero,'+
                  ':bairro,'+
                  ':complemento,'+
                  ':idcidade,'+
                  ':telefone,'+
                  ':celular,'+
                  ':whatsapp,'+
                  ':cpf,'+
                  ':rg,'+
                  ':orgao,'+
                  ':ctps,'+
                  ':serie,'+
                  ':pis,'+
                  ':sexo,'+
                  ':estadocivil,'+
                  ':nascimento,'+
                  ':naturalcidade,'+
                  ':email,'+
                  ':pai,'+
                  ':mae,'+
                  ':profissao,'+
                  ':admissao,'+
                  ':obs,'+
                  ':clitipo,'+
                  ':cliresponsavel,'+
                  ':cliente,'+
                  ':fornecedor,'+
                  ':envemail,'+
                  ':envwhats,'+
                  ':codfor,'+
                  ':telefone2,'+
                  ':celular2,'+
                  ':aviso,'+
                  ':foto,'+
                  ':escritorio,'+
                  ':app,'+
                  ':desconto,'+
                  ':salario,'+
                  ':mensalidade,'+
                  ':bloqueado,'+
                  ':sindidempresa,'+
                  ':idprofissao,'+
                  ':idlotacao,'+
                  ':limite,'+
                  ':prof_cnpj,'+
                  ':prof_razao,'+
                  ':prof_telefone,'+
                  ':prof_cep,'+
                  ':prof_endereco,'+
                  ':prof_numero,'+
                  ':prof_complemento,'+
                  ':prof_bairro,'+
                  ':prof_idcidade,'+
                  ':prof_temposervico,'+
                  ':cnh,'+
                  ':tiporesidencia,'+
                  ':temporesidencia,'+
                  ':emissaorg,'+
                  ':nacionalidade,'+
                  ':ref_banco1,'+
                  ':ref_banco2,'+
                  ':ref_agencia1,'+
                  ':ref_agencia2,'+
                  ':ref_conta1,'+
                  ':ref_conta2,'+
                  ':ref_telefone1,'+
                  ':ref_telefone2,'+
                  ':ref_tempo1,'+
                  ':ref_tempo2,'+
                  ':ref_pessoal1,'+
                  ':ref_pessoal2,'+
                  ':ref_telefone3,'+
                  ':ref_telefone4,'+
                  ':ref_afinidade1,'+
                  ':ref_afinidade2,'+
                  ':ref_comercial1,'+
                  ':ref_comercial2,'+
                  ':ref_telefone5,'+
                  ':ref_telefone6,'+
                  ':fin_veiculo1,'+
                  ':fin_veiculo2,'+
                  ':fin_veiculo3,'+
                  ':fin_veiculo4,'+
                  ':fin_ano1,'+
                  ':fin_ano2,'+
                  ':fin_ano3,'+
                  ':fin_ano4,'+
                  ':fin_financio1,'+
                  ':fin_financio2,'+
                  ':fin_financio3,'+
                  ':fin_financio4,'+
                  ':fin_parcela1,'+
                  ':fin_parcela2,'+
                  ':fin_parcela3,'+
                  ':fin_parcela4,'+
                  ':fin_outros,'+
                  ' ''S''        '+

                  ')';

  Qry     := TUniquery.create(nil);

  Try
    Try
      if not dm.Conn.Connected then
        dm.Conn.Connected := True;


      Qry.Connection      := dm.Conn;


      With Qry do
      begin
        Close;
        Sql.clear;
        Qry.SQL.Text := sqlQuery;
        IniciarTransacao;

        id                                          := GerarId('socio', 'id_socio');
        Qry.ParamByName('idsocio').AsInteger        := id;
        Qry.ParamByName('idempresa').AsInteger      := idempresa;
        Qry.ParamByName('idsede').AsInteger         := idsede;
        if cliente= 'S' then
        Qry.ParamByName('codigo').AsInteger         := GerarId('socio', 'codigo')
        else
        Qry.ParamByName('codigo').IsNull;
        Qry.ParamByName('matricula').AsInteger      := matricula;
        if sociodeste >0 then
        Qry.ParamByName('sociodeste').AsDateTime    := sociodeste
        else
        Qry.ParamByName('sociodeste').Clear;
        Qry.ParamByName('situacao').AsString        := situacao;
        Qry.ParamByName('nome').AsString            := Trim(nome);
        Qry.ParamByName('apelido').AsString         := Trim(apelido);
        Qry.ParamByName('cep').AsString             := cep;
        Qry.ParamByName('endereco').AsString        := Trim(endereco);
        Qry.ParamByName('numero').AsString          := trim(numero);
        Qry.ParamByName('bairro').AsString          := trim(bairro);
        Qry.ParamByName('complemento').AsString     := Trim(complemento);
        Qry.ParamByName('idcidade').AsInteger       := idcidade;
        Qry.ParamByName('telefone').AsString        := telefone;
        Qry.ParamByName('celular').AsString         := celular;
        Qry.ParamByName('whatsapp').AsString        := whatsapp;
        Qry.ParamByName('cpf').AsString             := cpf;
        Qry.ParamByName('rg').AsString              := trim(rg);
        Qry.ParamByName('orgao').AsString           := trim(orgao);
        Qry.ParamByName('ctps').AsString            := ctps;
        Qry.ParamByName('serie').AsString           := serie;
        Qry.ParamByName('pis').AsString             := pis;
        Qry.ParamByName('sexo').AsString            := sexo;
        Qry.ParamByName('estadocivil').AsString     := civil;

        if nascimento > 0 then
        Qry.ParamByName('nascimento').AsDate        := nascimento
        else
        Qry.ParamByName('nascimento').Clear;

        Qry.ParamByName('naturalcidade').AsInteger  := naturalde;
        Qry.ParamByName('email').AsString           := trim(email);
        Qry.ParamByName('pai').AsString             := Trim(pai);
        Qry.ParamByName('mae').AsString             := Trim(mae);
        Qry.ParamByName('profissao').AsString       := trim(profissao);

        if admissao > 0 then
        Qry.ParamByName('admissao').AsDateTime      := admissao
        else
        Qry.ParamByName('admissao').Clear;

        Qry.ParamByName('obs').AsString             := trim(obs);
        if clitipo = '' then
        Qry.ParamByName('clitipo').AsString         := Trim('FÍSICA')
        else
        Qry.ParamByName('clitipo').AsString         := Trim(clitipo);
        Qry.ParamByName('cliresponsavel').AsString  := Trim(responsavel);

        Qry.ParamByName('cliente').AsString         := cliente;
        Qry.ParamByName('fornecedor').AsString      := fornecedor;
        Qry.ParamByName('envemail').AsString        := envemail;
        Qry.ParamByName('envwhats').AsString        := envwhats;

        if fornecedor='S' then
        Qry.ParamByName('codfor').AsInteger         := GerarId('socio', 'codfornecedor')
        else
        Qry.ParamByName('codfor').IsNull;

        Qry.ParamByName('telefone2').AsString        := telefone2;
        Qry.ParamByName('celular2').AsString         := celular2;
        Qry.ParamByName('aviso').AsString            := aviso;
        Qry.ParamByName('foto').AsString             := foto;
        Qry.ParamByName('escritorio').AsInteger      := idescritorio;
        if app='' then
        qry.ParamByName('app').AsString              := 'N'
        else
        qry.ParamByName('app').AsString              := app;

        qry.ParamByName('desconto').AsFloat          := desconto;
        qry.ParamByName('salario').AsFloat           := salario;
        qry.ParamByName('mensalidade').AsString      := mensalidade;
        if (bloqueado='') or (bloqueado.Empty='') then
        qry.ParamByName('bloqueado').AsString        := 'N'
        else
        qry.ParamByName('bloqueado').AsString        := bloqueado;
        qry.ParamByName('sindidempresa').AsInteger   := sindidempresa;
        qry.ParamByName('idprofissao').AsInteger     := idprofissao;
        qry.ParamByName('idlotacao').AsInteger       := idlotacao;
        qry.ParamByName('limite').AsFloat            := limite;

        qry.ParamByName('prof_cnpj').AsString        := ProfCNPJ;
        qry.ParamByName('prof_razao').AsString       := Trim(ProfRazao);
        qry.ParamByName('prof_telefone').AsString    := ProfTelefone;
        qry.ParamByName('prof_cep').AsString         := ProfCEP;
        qry.ParamByName('prof_endereco').AsString    := trim(ProfEndereco);
        qry.ParamByName('prof_numero').AsString      := trim(ProfNumero);
        qry.ParamByName('prof_complemento').AsString := Trim(ProfComplemento);
        qry.ParamByName('prof_bairro').AsString      := trim(ProfBairro);
        qry.ParamByName('prof_idcidade').AsInteger   := ProfIDCidade;
        qry.ParamByName('prof_temposervico').AsString  := ProfTempoServico;

        qry.ParamByName('cnh').AsString               := cnh;
        qry.ParamByName('tiporesidencia').AsString    := tiporesidencia;
        qry.ParamByName('temporesidencia').AsString   := temporesidencia;
        if emissaorg > 0 then
        Qry.ParamByName('emissaorg').AsDateTime       := emissaorg
        else
        Qry.ParamByName('emissaorg').Clear;

        qry.ParamByName('nacionalidade').AsString     := nacionalidade;

        qry.ParamByName('ref_banco1').AsString        := ref_banco1;
        qry.ParamByName('ref_banco2').AsString        := ref_banco2;
        qry.ParamByName('ref_agencia1').AsString      := ref_agencia1;
        qry.ParamByName('ref_agencia2').AsString      := ref_agencia2;
        qry.ParamByName('ref_conta1').AsString        := ref_conta1;
        qry.ParamByName('ref_conta2').AsString        := ref_conta2;
        qry.ParamByName('ref_telefone1').AsString     := ref_telefone1;
        qry.ParamByName('ref_telefone2').AsString     := ref_telefone2;
        qry.ParamByName('ref_tempo1').AsString        := ref_tempo1;
        qry.ParamByName('ref_tempo2').AsString        := ref_tempo2;
        qry.ParamByName('ref_pessoal1').AsString      := ref_pessoal1;
        qry.ParamByName('ref_pessoal2').AsString      := ref_pessoal2;
        qry.ParamByName('ref_telefone3').AsString     := ref_telefone3;
        qry.ParamByName('ref_telefone4').AsString     := ref_telefone4;
        qry.ParamByName('ref_afinidade1').AsString    := ref_afinidade1;
        qry.ParamByName('ref_afinidade2').AsString    := ref_afinidade2;
        qry.ParamByName('ref_comercial1').AsString    := ref_comercial1;
        qry.ParamByName('ref_comercial2').AsString    := ref_comercial2;
        qry.ParamByName('ref_telefone5').AsString     := ref_telefone5;
        qry.ParamByName('ref_telefone6').AsString     := ref_telefone6;

        qry.ParamByName('fin_veiculo1').AsString     := fin_veiculo1;
        qry.ParamByName('fin_veiculo2').AsString     := fin_veiculo2;
        qry.ParamByName('fin_veiculo3').AsString     := fin_veiculo3;
        qry.ParamByName('fin_veiculo4').AsString     := fin_veiculo4;
        qry.ParamByName('fin_ano1').AsString         := fin_ano1;
        qry.ParamByName('fin_ano2').AsString         := fin_ano2;
        qry.ParamByName('fin_ano3').AsString         := fin_ano3;
        qry.ParamByName('fin_ano4').AsString         := fin_ano4;
        qry.ParamByName('fin_financio1').AsString    := fin_financio1;
        qry.ParamByName('fin_financio2').AsString    := fin_financio2;
        qry.ParamByName('fin_financio3').AsString    := fin_financio3;
        qry.ParamByName('fin_financio4').AsString    := fin_financio4;
        qry.ParamByName('fin_parcela1').AsFloat     := fin_parcela1;
        qry.ParamByName('fin_parcela2').AsFloat     := fin_parcela2;
        qry.ParamByName('fin_parcela3').AsFloat     := fin_parcela3;
        qry.ParamByName('fin_parcela4').AsFloat     := fin_parcela4;
        qry.ParamByName('fin_outros').AsString       := fin_outros;

        Try
          ExecSQL;
          ConfirmarTransacao;
          result  := true;
          msg     := 'Registro realizado com sucesso';
        Except on e:exception do
          begin
            DesfazerTransacao;
            exit;
          end;
        end;

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

Function TModelSocio.Update(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;

  sqlQuery := 'UPDATE SOCIO SET ' +
                  'id_empresa   = :idempresa,'+
                  'id_sede      = :idsede, ' +
                  'matricula    = :matricula, ' +
                  'socio_deste  = :sociodeste, ' +
                  'situacao     = :situacao, ' +
                  'nome         = :nome, ' +
                  'apelido      = :apelido, ' +
                  'cep          = :cep, ' +
                  'endereco     = :endereco, ' +
                  'numero       = :numero, ' +
                  'bairro       = :bairro, ' +
                  'complemento  = :complemento, ' +
                  'id_cidade    = :idcidade, ' +
                  'telefone     = :telefone, ' +
                  'celular      = :celular, ' +
                  'whatsapp     = :whatsapp, ' +
                  'cpf          = :cpf, ' +
                  'rg           = :rg, ' +
                  'orgao        = :orgao, ' +
                  'ctps         = :ctps, ' +
                  'serie        = :serie, ' +
                  'pis          = :pis, ' +
                  'sexo         = :sexo, ' +
                  'estado_civil = :estadocivil, ' +
                  'nascimento   = :nascimento, ' +
                  'natural_cidade = :naturalcidade, ' +
                  'email        = :email, ' +
                  'pai          = :pai, ' +
                  'mae          = :mae, ' +
                  'profissao    = :profissao, ' +
                  'admissao     = :admissao, ' +
                  'data_desativacao=    :desativacao,'+
                  'obs          = :obs,' +
                  'cli_tipo     = :clitipo,'+
                  'cli_responsavel= :responsavel,'+
                  'cliente      = :cliente,'+
                  'fornecedor   = :fornecedor,'+
                  'envemail     = :envemail,'+
                  'envwhats     = :envwhats,'+
                  'telefone2    = :telefone2,'+
                  'celular2     = :celular2,'+
                  'aviso        = :aviso,'+
                  'foto         = :foto,'+
                  'escritorio   = :escritorio,'+
                  'mostrarapp   = :app,'+
                  'sindicato_perc_desconto= :desconto,'+
                  'sindicato_salario=       :salario,'+
                  'tipo_mensalidade=        :mensalidade,'+
                  'bloqueado=               :bloqueado,'+
                  'sind_id_empresa=         :sindidempresa,'+
                  'id_profissao=            :idprofissao,'+
                  'id_lotacao=              :idlotacao,'+
                  'limite=                  :limite,'+
                  'prof_cnpj=               :prof_cnpj,'+
                  'prof_razao=              :prof_razao,'+
                  'prof_telefone=           :prof_telefone,'+
                  'prof_cep=                :prof_cep,'+
                  'prof_endereco=           :prof_endereco,'+
                  'prof_numero=             :prof_numero,'+
                  'prof_complemento=        :prof_complemento,'+
                  'prof_bairro=             :prof_bairro,'+
                  'prof_idcidade=           :prof_idcidade,'+
                  'prof_temposervico=       :prof_temposervico,'+
                  'cnh=                     :cnh,'+
                  'tiporesidencia=          :tiporesidencia,'+
                  'temporesidencia=         :temporesidencia,'+
                  'emissaorg=               :emissaorg,'+
                  'nacionalidade=           :nacionalidade,'+
                  'ref_banco1=              :ref_banco1,'+
                  'ref_banco2=              :ref_banco2,'+
                  'ref_agencia1=            :ref_agencia1,'+
                  'ref_agencia2=            :ref_agencia2,'+
                  'ref_conta1=              :ref_conta1,'+
                  'ref_conta2=              :ref_conta2,'+
                  'ref_telefone1=           :ref_telefone1,'+
                  'ref_telefone2=           :ref_telefone2,'+
                  'ref_tempo1=              :ref_tempo1,'+
                  'ref_tempo2=              :ref_tempo2,'+
                  'ref_pessoal1=            :ref_pessoal1,'+
                  'ref_pessoal2=            :ref_pessoal2,'+
                  'ref_telefone3=           :ref_telefone3,'+
                  'ref_telefone4=           :ref_telefone4,'+
                  'ref_afinidade1=          :ref_afinidade1,'+
                  'ref_afinidade2=          :ref_afinidade2,'+
                  'ref_comercial1=          :ref_comercial1,'+
                  'ref_comercial2=          :ref_comercial2,'+
                  'ref_telefone5=           :ref_telefone5,'+
                  'ref_telefone6=           :ref_telefone6,'+
                  'fin_veiculo1=            :fin_veiculo1,'+
                  'fin_veiculo2=            :fin_veiculo2,'+
                  'fin_veiculo3=            :fin_veiculo3,'+
                  'fin_veiculo4=            :fin_veiculo4,'+
                  'fin_ano1=                :fin_ano1,'+
                  'fin_ano2=                :fin_ano2,'+
                  'fin_ano3=                :fin_ano3,'+
                  'fin_ano4=                :fin_ano4,'+
                  'fin_financiou1=           :fin_financio1,'+
                  'fin_financiou2=           :fin_financio2,'+
                  'fin_financiou3=           :fin_financio3,'+
                  'fin_financiou4=           :fin_financio4,'+
                  'fin_parcela1=            :fin_parcela1,'+
                  'fin_parcela2=            :fin_parcela2,'+
                  'fin_parcela3=            :fin_parcela3,'+
                  'fin_parcela4=            :fin_parcela4,'+
                  'fin_outros=              :fin_outros,'+
                  'sinc_app=''S'''+
                  ' WHERE id_socio = :idsocio';

  Qry := TUniQuery.Create(nil);

  try
    try
      if not dm.Conn.Connected then
        dm.Conn.Connected := True;

      Qry.Connection := dm.Conn;
      // Consulta SQL para atualização
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;

      IniciarTransacao;
      // Definindo parâmetros
        Qry.ParamByName('idsocio').AsInteger        := idsocio;
        Qry.ParamByName('idempresa').AsInteger      := idempresa;
        Qry.ParamByName('idsede').AsInteger         := idsede;
        Qry.ParamByName('matricula').AsInteger      := matricula;
        Qry.ParamByName('sociodeste').AsDateTime    := sociodeste;
        Qry.ParamByName('situacao').AsString        := situacao;
        Qry.ParamByName('nome').AsString            := Trim(nome);
        Qry.ParamByName('apelido').AsString         := Trim(apelido);
        Qry.ParamByName('cep').AsString             := cep;
        Qry.ParamByName('endereco').AsString        := Trim(endereco);
        Qry.ParamByName('numero').AsString          := trim(numero);
        Qry.ParamByName('bairro').AsString          := trim(bairro);
        Qry.ParamByName('complemento').AsString     := Trim(complemento);
        Qry.ParamByName('idcidade').AsInteger       := idcidade;
        Qry.ParamByName('telefone').AsString        := telefone;
        Qry.ParamByName('celular').AsString         := celular;
        Qry.ParamByName('whatsapp').AsString        := whatsapp;
        Qry.ParamByName('cpf').AsString             := cpf;
        Qry.ParamByName('rg').AsString              := trim(rg);
        Qry.ParamByName('orgao').AsString           := trim(orgao);
        Qry.ParamByName('ctps').AsString            := ctps;
        Qry.ParamByName('serie').AsString           := serie;
        Qry.ParamByName('pis').AsString             := pis;
        Qry.ParamByName('sexo').AsString            := sexo;
        Qry.ParamByName('estadocivil').AsString     := civil;
        if nascimento = Nulldate then
        Qry.ParamByName('nascimento').Clear
        else
        Qry.ParamByName('nascimento').AsDate        := nascimento;
        Qry.ParamByName('naturalcidade').AsInteger  := naturalde;
        Qry.ParamByName('email').AsString           := trim(email);
        Qry.ParamByName('pai').AsString             := Trim(pai);
        Qry.ParamByName('mae').AsString             := Trim(mae);
        Qry.ParamByName('profissao').AsString       := trim(profissao);

        if admissao = Nulldate then
        Qry.ParamByName('admissao').Clear
        else
        Qry.ParamByName('admissao').AsDateTime      := admissao;

        if dtdesativado = Nulldate then
        Qry.ParamByName('desativacao').Clear
        else
        Qry.ParamByName('desativacao').AsDateTime   := dtdesativado;

        Qry.ParamByName('obs').AsString             := trim(obs);
        if clitipo='' then
        Qry.ParamByName('clitipo').AsString         := trim('FÍSICA')
        else
        Qry.ParamByName('clitipo').AsString         := trim(clitipo);
        Qry.ParamByName('responsavel').AsString  := trim(responsavel);

        Qry.ParamByName('cliente').AsString         := cliente;
        Qry.ParamByName('fornecedor').AsString      := fornecedor;
        Qry.ParamByName('envemail').AsString        := envemail;
        Qry.ParamByName('envwhats').AsString        := envwhats;

        Qry.ParamByName('telefone2').AsString       := telefone2;
        Qry.ParamByName('celular2').AsString        := celular2;
        Qry.ParamByName('aviso').AsString           := aviso;
        Qry.ParamByName('foto').AsString            := foto;
        qry.ParamByName('escritorio').AsInteger     := idescritorio;
        if app='' then
        qry.ParamByName('app').AsString              := 'N'
        else
        qry.ParamByName('app').AsString              := app;

        qry.ParamByName('desconto').AsCurrency          := desconto;
        qry.ParamByName('salario').AsCurrency           := salario;
        qry.ParamByName('mensalidade').AsString      := mensalidade;
        qry.ParamByName('bloqueado').AsString        := bloqueado;
        qry.ParamByName('sindidempresa').AsInteger   := sindidempresa;
        qry.ParamByName('idprofissao').AsInteger     := idprofissao;
        qry.ParamByName('idlotacao').AsInteger       := idlotacao;
        Qry.ParamByName('limite').AsCurrency            := limite;

        qry.ParamByName('prof_cnpj').AsString        := ProfCNPJ;
        qry.ParamByName('prof_razao').AsString       := Trim(ProfRazao);
        qry.ParamByName('prof_telefone').AsString    := ProfTelefone;
        qry.ParamByName('prof_cep').AsString         := ProfCEP;
        qry.ParamByName('prof_endereco').AsString    := trim(ProfEndereco);
        qry.ParamByName('prof_numero').AsString      := trim(ProfNumero);
        qry.ParamByName('prof_complemento').AsString := Trim(ProfComplemento);
        qry.ParamByName('prof_bairro').AsString      := trim(ProfBairro);
        qry.ParamByName('prof_idcidade').AsInteger   := ProfIDCidade;
        qry.ParamByName('prof_temposervico').AsString  := ProfTempoServico;

        qry.ParamByName('cnh').AsString               := cnh;
        qry.ParamByName('tiporesidencia').AsString    := tiporesidencia;
        qry.ParamByName('temporesidencia').AsString   := temporesidencia;
        if emissaorg = NullDate then
        Qry.ParamByName('emissaorg').Clear
        else
        Qry.ParamByName('emissaorg').AsDateTime       := emissaorg;
        qry.ParamByName('nacionalidade').AsString     := nacionalidade;

        qry.ParamByName('ref_banco1').AsString        := ref_banco1;
        qry.ParamByName('ref_banco2').AsString        := ref_banco2;
        qry.ParamByName('ref_agencia1').AsString      := ref_agencia1;
        qry.ParamByName('ref_agencia2').AsString      := ref_agencia2;
        qry.ParamByName('ref_conta1').AsString        := ref_conta1;
        qry.ParamByName('ref_conta2').AsString        := ref_conta2;
        qry.ParamByName('ref_telefone1').AsString     := ref_telefone1;
        qry.ParamByName('ref_telefone2').AsString     := ref_telefone2;
        qry.ParamByName('ref_tempo1').AsString        := ref_tempo1;
        qry.ParamByName('ref_tempo2').AsString        := ref_tempo2;
        qry.ParamByName('ref_pessoal1').AsString      := ref_pessoal1;
        qry.ParamByName('ref_pessoal2').AsString      := ref_pessoal2;
        qry.ParamByName('ref_telefone3').AsString     := ref_telefone3;
        qry.ParamByName('ref_telefone4').AsString     := ref_telefone4;
        qry.ParamByName('ref_afinidade1').AsString    := ref_afinidade1;
        qry.ParamByName('ref_afinidade2').AsString    := ref_afinidade2;
        qry.ParamByName('ref_comercial1').AsString    := ref_comercial1;
        qry.ParamByName('ref_comercial2').AsString    := ref_comercial2;
        qry.ParamByName('ref_telefone5').AsString     := ref_telefone5;
        qry.ParamByName('ref_telefone6').AsString     := ref_telefone6;

        qry.ParamByName('fin_veiculo1').AsString     := fin_veiculo1;
        qry.ParamByName('fin_veiculo2').AsString     := fin_veiculo2;
        qry.ParamByName('fin_veiculo3').AsString     := fin_veiculo3;
        qry.ParamByName('fin_veiculo4').AsString     := fin_veiculo4;
        qry.ParamByName('fin_ano1').AsString         := fin_ano1;
        qry.ParamByName('fin_ano2').AsString         := fin_ano2;
        qry.ParamByName('fin_ano3').AsString         := fin_ano3;
        qry.ParamByName('fin_ano4').AsString         := fin_ano4;
        qry.ParamByName('fin_financio1').AsString    := fin_financio1;
        qry.ParamByName('fin_financio2').AsString    := fin_financio2;
        qry.ParamByName('fin_financio3').AsString    := fin_financio3;
        qry.ParamByName('fin_financio4').AsString    := fin_financio4;
        qry.ParamByName('fin_parcela1').AsCurrency     := fin_parcela1;
        qry.ParamByName('fin_parcela2').AsCurrency     := fin_parcela2;
        qry.ParamByName('fin_parcela3').AsCurrency     := fin_parcela3;
        qry.ParamByName('fin_parcela4').AsCurrency  := fin_parcela4;
        qry.ParamByName('fin_outros').AsString       := fin_outros;

        Try
          Qry.ExecSQL;
          ConfirmarTransacao;
          result  := true;
          msg := 'Registro atualizado com sucesso';
        Except on e:exception do
          begin
            DesfazerTransacao;
            exit;
          end;
        end;
    except
      on E: Exception do
      begin
        msg := 'Erro ao atualizar a ficha: ' + E.Message;
        raise;
      end;
    end;
  finally
    Freeandnil(Qry);
  end;
end;

procedure TModelSocio.ConfirmarTransacao;
begin
  try
    if Assigned(FTransacao) and FTransacao.Active then
      FTransacao.Commit;
  except
    on E: Exception do
      raise Exception.Create('Erro ao confirmar transação: ' + E.Message);
  end;
end;

constructor TModelSocio.Create;
begin
inherited Create;

  FTransacao                    := TUniTransaction.Create(nil);
  FTransacao.DefaultConnection  := dm.Conn;
end;

Function TModelSocio.Delete(out msg:string;iduser:integer):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  sqlQuery := 'Update SOCIO SET situacao=''INATIVO'', excluido=1, sinc_app=''S'', data_exc=CURRENT_TIMESTAMP, id_usuario_exc= :iduser WHERE ID_SOCIO = :id';

  Qry := TUniQuery.Create(nil);

  try
    try
      Qry.Connection := dm.Conn;
      Qry.Params.Clear;
      Qry.SQL.Text := sqlQuery;

      // Definindo parâmetro
      Qry.ParamByName('iduser').AsInteger    :=iduser;
      Qry.ParamByName('id').AsInteger        := idsocio;
      Qry.ExecSQL;
      InativarCarteiraExcluida(iduser, idsocio);

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
    FreeAndNil(Qry);
  end;
end;

Function TModelSocio.Select(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.Conn;
      sqlQuery := 'SELECT * FROM SOCIO WHERE ID_SOCIO= :ID and excluido=0';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger  := idsocio;

      Qry.Open;
      if not Qry.IsEmpty then
      begin

        idsocio     := Qry.Fieldbyname('id_socio').AsInteger;
        idsede      := Qry.Fieldbyname('id_sede').AsInteger;
        codigo      := Qry.Fieldbyname('codigo').AsInteger;
        matricula   := Qry.Fieldbyname('matricula').AsInteger;
        sociodeste  := Qry.Fieldbyname('socio_deste').AsDateTime;
        situacao    := Qry.Fieldbyname('situacao').AsString;
        nome        := Qry.Fieldbyname('nome').AsString;
        apelido     := Qry.Fieldbyname('apelido').AsString;
        cep         := Qry.Fieldbyname('cep').AsString;
        endereco    := Qry.Fieldbyname('endereco').AsString;
        numero      := Qry.Fieldbyname('numero').AsString;
        bairro      := Qry.Fieldbyname('bairro').AsString;
        complemento := Qry.Fieldbyname('complemento').AsString;
        idcidade    := Qry.Fieldbyname('id_cidade').AsInteger;
        telefone    := Qry.Fieldbyname('telefone').AsString;
        celular     := Qry.Fieldbyname('celular').AsString;
        whatsapp    := Qry.Fieldbyname('whatsapp').AsString;
        cpf         := Qry.Fieldbyname('cpf').AsString;
        rg          := Qry.Fieldbyname('rg').AsString;
        orgao       := Qry.Fieldbyname('orgao').AsString;
        ctps        := Qry.Fieldbyname('ctps').AsString;
        serie       := Qry.Fieldbyname('serie').AsString;
        pis         := Qry.Fieldbyname('pis').AsString;
        sexo        := Qry.Fieldbyname('sexo').AsString;
        civil       := Qry.Fieldbyname('estado_civil').AsString;
        nascimento  := Qry.Fieldbyname('nascimento').AsDateTime;
        naturalde   := Qry.Fieldbyname('natural_cidade').AsInteger;
        email       := Qry.Fieldbyname('email').AsString;
        pai         := Qry.Fieldbyname('pai').AsString;
        mae         := Qry.Fieldbyname('mae').AsString;
        profissao   := Qry.Fieldbyname('profissao').AsString;
        admissao    := Qry.Fieldbyname('admissao').AsDateTime;
        dtdesativado:= Qry.Fieldbyname('data_desativacao').AsDateTime;
        obs         := Qry.Fieldbyname('obs').AsString;
        clitipo     := Qry.FieldByName('cli_tipo').AsString;
        responsavel := Qry.FieldByName('cli_responsavel').AsString;
        cliente     := Qry.FieldByName('cliente').AsString;
        fornecedor  := Qry.FieldByName('fornecedor').AsString;
        envemail    := Qry.FieldByName('envemail').AsString;
        envwhats    := Qry.FieldByName('envwhats').AsString;
        codfornecedor := Qry.FieldByName('codfornecedor').AsInteger;
        telefone2   := Qry.FieldByName('telefone2').AsString;
        celular2    := Qry.FieldByName('celular2').AsString;
        aviso       := Qry.FieldByName('aviso').AsString;
        foto        := Qry.FieldByName('foto').AsString;
        idescritorio:= Qry.FieldByName('escritorio').AsInteger;
        app         := Qry.FieldByName('mostrarapp').AsString;

        desconto    :=Qry.FieldByName('sindicato_perc_desconto').AsFloat;
        salario     :=Qry.FieldByName('sindicato_salario').AsFloat;
        mensalidade :=Qry.FieldByName('tipo_mensalidade').AsString;
        bloqueado   :=Qry.FieldByName('bloqueado').AsString;
        sindidempresa:=Qry.FieldByName('sind_id_empresa').AsInteger;
        idprofissao :=Qry.FieldByName('id_profissao').AsInteger;
        idlotacao   :=Qry.FieldByName('id_lotacao').AsInteger;
        limite      :=Qry.FieldByName('limite').AsFloat;

        //dados profissionais
        if TSession.oneGaragem='S' then
        begin
          ProfCNPJ                :=qry.FieldByName('prof_cnpj').AsString;
          ProfRazao               :=qry.FieldByName('prof_razao').AsString;
          ProfTelefone            :=qry.FieldByName('prof_telefone').AsString;
          ProfCEP                 :=qry.FieldByName('prof_cep').AsString;
          ProfEndereco            :=qry.FieldByName('prof_endereco').AsString;
          ProfNumero              :=qry.FieldByName('prof_numero').AsString;
          ProfComplemento         :=qry.FieldByName('prof_complemento').AsString;
          ProfBairro              :=qry.FieldByName('prof_bairro').AsString;
          ProfIDCidade            :=qry.FieldByName('prof_idcidade').AsInteger;
          ProfTempoServico        :=qry.FieldByName('prof_temposervico').AsString;

          //dados referencia
          ref_banco1                 := qry.FieldByName('ref_banco1').AsString;
          ref_banco2                 := qry.FieldByName('ref_banco2').AsString;
          ref_agencia1               := qry.FieldByName('ref_agencia1').AsString;
          ref_agencia2               := qry.FieldByName('ref_agencia2').AsString;
          ref_conta1                 := qry.FieldByName('ref_conta1').AsString;
          ref_conta2                 := qry.FieldByName('ref_conta2').AsString;
          ref_telefone1              := qry.FieldByName('ref_telefone1').AsString;
          ref_telefone2              := qry.FieldByName('ref_telefone2').AsString;
          ref_tempo1                 := qry.FieldByName('ref_tempo1').AsString;
          ref_tempo2                 := qry.FieldByName('ref_tempo2').AsString;
          ref_pessoal1               := qry.FieldByName('ref_pessoal1').AsString;
          ref_pessoal2               := qry.FieldByName('ref_pessoal2').AsString;
          ref_telefone3              := qry.FieldByName('ref_telefone3').AsString;
          ref_telefone4              := qry.FieldByName('ref_telefone4').AsString;
          ref_afinidade1             := qry.FieldByName('ref_afinidade1').AsString;
          ref_afinidade2             := qry.FieldByName('ref_afinidade2').AsString;
          ref_comercial1             := qry.FieldByName('ref_comercial1').AsString;
          ref_comercial2             := qry.FieldByName('ref_comercial2').AsString;
          ref_telefone5              := qry.FieldByName('ref_telefone5').AsString;
          ref_telefone6              := qry.FieldByName('ref_telefone6').AsString;

          fin_veiculo1               := qry.FieldByName('fin_veiculo1').AsString;
          fin_veiculo2               := qry.FieldByName('fin_veiculo2').AsString;
          fin_veiculo3               := qry.FieldByName('fin_veiculo3').AsString;
          fin_veiculo4               := qry.FieldByName('fin_veiculo4').AsString;
          fin_ano1                   := qry.FieldByName('fin_ano1').AsString;
          fin_ano2                   := qry.FieldByName('fin_ano2').AsString;
          fin_ano3                   := qry.FieldByName('fin_ano3').AsString;
          fin_ano4                   := qry.FieldByName('fin_ano4').AsString;
          fin_financio1              := qry.FieldByName('fin_financiou1').AsString;
          fin_financio2              := qry.FieldByName('fin_financiou2').AsString;
          fin_financio3              := qry.FieldByName('fin_financiou3').AsString;
          fin_financio4              := qry.FieldByName('fin_financiou4').AsString;
          fin_parcela1               := qry.FieldByName('fin_parcela1').AsFloat;
          fin_parcela2               := qry.FieldByName('fin_parcela2').AsFloat;
          fin_parcela3               := qry.FieldByName('fin_parcela3').AsFloat;
          fin_parcela4               := qry.FieldByName('fin_parcela4').AsFloat;
          fin_outros                 := qry.FieldByName('fin_outros').AsString;

        end;

        cnh                       := qry.FieldByName('cnh').AsString;
        tiporesidencia            := qry.FieldByName('tiporesidencia').AsString;
        temporesidencia           := qry.FieldByName('temporesidencia').AsString;
        emissaorg                 := Qry.FieldByName('emissaorg').AsDateTime;
        nacionalidade             := qry.FieldByName('nacionalidade').AsString;


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

Function TModelSocio.Pesquisa(out msg:string; Par1,Par2, Par3:String):Boolean;
var
  Qry     :TUniquery;
  sqlQuery, Filtro1, Ordem: string;
  I:integer;
begin
  Result                := False;
  Filtro1               := '';
  Ordem                 := '';
  Qry                   := TUniQuery.Create(nil);
  try
    try
      Qry.Connection    := dm.Conn;

      sqlQuery          := 'SELECT id_socio, codigo, matricula, situacao, nome, apelido, cpf, '+
                            'telefone, celular,whatsapp, email, cli_tipo, codfornecedor FROM SOCIO where id_socio >0 and excluido=0';
      if Par1 <> '' then
      begin

        if Par1 = 'C' then
        Filtro1 := ' and cliente = ''S'' ';

        if Par1 = 'F' then
        Filtro1 := ' and fornecedor = ''S'' ';

      end;

      if Par2 <> '' then
      begin
        Filtro1 := Filtro1 + 'and (codigo like :filtro or'+
                                  ' nome like :filtro or'+
                                  ' apelido like :filtro or'+
                                  ' cpf like :filtro'+
                                  ') ';

      end;

      sqlQuery  := sqlQuery + filtro1;


      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := SqlQuery;

      if Par2<>'' then
      Qry.Params.ParamByName('filtro').AsString := '%' + Par2 + '%';

      Qry.Open;
      Qry.First;

      if not Qry.IsEmpty then
      begin
        //criar campo na tebela temporaria
        if dm.TabConsSocio.eof then
        begin
          dm.TabConsSocio.fieldDefs.clear;
          dm.TabConsSocio.fieldDefs.assign(Qry.FieldDefs);
          dm.TabConsSocio.createdataset;
        end
        else
        begin
          dm.TabConsSocio.EmptyDataSet;
        end;

        while not Qry.Eof do
        begin
          dm.TabConsSocio.Append;
          for I := 0 to Qry.FieldCount - 1 do
          begin
            dm.TabConsSocio.Fields[I].Value := Qry.Fields[I].Value;
          end;
          dm.TabConsSocio.Post;
          Qry.Next;
        end;

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

Function TModelSocio.PopularDataSet(out msg:string; Tab, TabAtivo:integer; Filtro:String):Boolean;
var
  Qry     :TUniquery;
  sqlQuery,FiltroQuery :String;
  FiltroPessoa, SqlOrder:String;
begin
  Result     := False;
  SqlOrder   := ' order by nome ASC';
  sqlQuery          := 'SELECT id_socio, codigo, matricula, '+
                            ' case    '+
                            ' when situacao in(''S'',''ATIVO'') then ''SIM'' '+
                            ' when situacao in(''N'',''INATIVO'') then ''NÃO'' '+
                            ' when situacao=''INADIMPLENTE'' then ''INADIMPLENTE'' '+
                            ' when situacao=''SUSPENSO'' then ''SUSPENSO'' '+
                            ' when situacao=''CANCELADO'' then ''CANCELADO'' '+
                            ' when situacao=''AFASTADO'' then ''AFASTADO'' '+
                            ' end as situacao, '+
                            ' nome, apelido, cpf, '+
                            ' telefone, celular,whatsapp, email, cli_tipo, codfornecedor, '+
                            ' cliente, fornecedor, nascimento FROM SOCIO where id_socio >0 and excluido=0 ';


                            case Tab of
                              0:FiltroPessoa      := ' and cliente=''S'' ';
                              1:FiltroPessoa      := ' and fornecedor=''S'' ';
                            end;

                            case Tabativo of
                              1: FiltroPessoa     := FiltroPessoa + ' and situacao in (''S'',''ATIVO'') ';
                              2: FiltroPessoa     := FiltroPessoa + ' and situacao in (''N'',''INATIVO'') ';
                              3: FiltroPessoa     := FiltroPessoa + ' and situacao =''INADIMPLENTE'' ';
                              4: FiltroPessoa     := FiltroPessoa + ' and situacao =''SUSPENSO'' ';
                              5: FiltroPessoa     := FiltroPessoa + ' and situacao =''CANCELADO'' ';
                              6: FiltroPessoa     := FiltroPessoa + ' and situacao =''AFASTADO'' ';
                            end;

                            if Filtro <> '' then
                            begin
                              FiltroQuery :=  ' and (codigo like :filtro or'+
                                                    ' nome like :filtro or'+
                                                    ' apelido like :filtro or'+
                                                    ' cpf like :filtro or'+
                                                    ' matricula like :filtro or'+
                                                    ' codfornecedor like :filtro)';

                              SqlQuery  := SqlQuery +FiltroPessoa+ FiltroQuery + SqlOrder;

                            end
                            else
                            SqlQuery  := sqlQuery+FiltroPessoa + SqlOrder;


  Qry       := Tuniquery.Create(nil);

  Try
    try
      if not dm.Conn.Connected then
        dm.Conn.Connected := True;

      Qry.Connection          := dm.Conn;

      Qry.SQL.Clear;
      Qry.SQL.Text            := SqlQuery;
      if Filtro <> '' then
      Qry.Params.ParamByName('filtro').AsString   := '%'+filtro+'%';

      Qry.Open;

      Try
        dm.TabConsSocio.EmptyDataSet;
        dm.TabConsSocio.Open;

        if not Qry.IsEmpty then
        begin
          Qry.First;
          dm.TabConsSocio.DisableControls;

          while not Qry.Eof do
          begin
            dm.TabConsSocio.Append;

            dm.TabConsSocio.FieldByName('id_socio').AsInteger       :=  Qry.FieldByName('id_socio').AsInteger;
            dm.TabConsSocio.FieldByName('codigo').AsInteger         :=  Qry.FieldByName('codigo').AsInteger;
            dm.TabConsSocio.FieldByName('matricula').AsInteger      :=  Qry.FieldByName('matricula').AsInteger;
            dm.TabConsSocio.FieldByName('situacao').AsString        :=  Qry.FieldByName('situacao').AsString;
            dm.TabConsSocio.FieldByName('nome').AsString            :=  Qry.FieldByName('nome').AsString;
            dm.TabConsSocio.FieldByName('apelido').AsString         :=  Qry.FieldByName('apelido').AsString;
            dm.TabConsSocio.FieldByName('cpf').AsString             :=  Qry.FieldByName('cpf').AsString;
            dm.TabConsSocio.FieldByName('telefone').AsString        :=  Qry.FieldByName('telefone').AsString;
            dm.TabConsSocio.FieldByName('celular').AsString         :=  Qry.FieldByName('celular').AsString;
            dm.TabConsSocio.FieldByName('whatsapp').AsString        :=  Qry.FieldByName('whatsapp').AsString;
            dm.TabConsSocio.FieldByName('email').AsString           :=  Qry.FieldByName('email').AsString;
            dm.TabConsSocio.FieldByName('cli_tipo').AsString        :=  Qry.FieldByName('cli_tipo').AsString;
            dm.TabConsSocio.FieldByName('codfornecedor').AsInteger  :=  Qry.FieldByName('codfornecedor').AsInteger;
            dm.TabConsSocio.FieldByName('cliente').AsString         :=  Qry.FieldByName('cliente').AsString;
            dm.TabConsSocio.FieldByName('fornecedor').AsString      :=  Qry.FieldByName('fornecedor').AsString;
            dm.TabConsSocio.FieldByName('nascimento').AsDateTime    :=  Qry.FieldByName('nascimento').AsDateTime;

            Qry.Next;
          end;

          dm.TabConsSocio.Post;
          dm.TabConsSocio.First;
          msg := 'Consulta realizada com sucesso';
          Result := True;
        end
        else
        msg := 'Nenhum registro encontrado!';
      Finally
        dm.TabConsSocio.EnableControls;
      End;
      Qry.Close;
    except on e:exception do
      begin
       raise Exception.Create(e.Message);
      end;
    end;
  Finally
    FreeAndNil(Qry);
  End;
end;

Function TModelSocio.PopularDataSetWhatsApp(out msg:string; Tab, TabAtivo, idSecretaria:integer; Filtro:String):Boolean;
var
  Qry     :TUniquery;
  sqlQuery,FiltroQuery :String;
  FiltroPessoa, FiltroSecretaria:String;
begin
  Result                := False;

  Qry                   := TUniQuery.Create(nil);
  try
    try
      Qry.Connection    := dm.Conn;

      sqlQuery          := 'SELECT id_socio, codigo, matricula, '+
                            ' case                                '+
                            ' when situacao in(''S'',''ATIVO'') then ''SIM'' '+
                            ' when situacao in(''N'',''INATIVO'') then ''NÃO'' '+
                            ' when situacao=''INADIMPLENTE'' then ''INADIMPLENTE'' '+
                            ' when situacao=''SUSPENSO'' then ''SUSPENSO'' '+
                            ' when situacao=''CANCELADO'' then ''CANCELADO'' '+
                            ' when situacao=''AFASTADO'' then ''AFASTADO'' '+
                            ' end as situacao, '+
                            ' nome, apelido, cpf, '+
                            ' telefone, celular,whatsapp, email, cli_tipo, codfornecedor, '+
                            ' cliente, fornecedor, nascimento FROM SOCIO where id_socio >0 and excluido=0 ';

      if idSecretaria > 0 then
      FiltroSecretaria    := ' and escritorio='+inttostr(idsecretaria);

      case Tab of
        0:FiltroPessoa      := ' and cliente=''S'' ';
        1:FiltroPessoa      := ' and fornecedor=''S'' ';
        2:FiltroPessoa      := '';
      end;

      case Tabativo of
        1: FiltroPessoa     := FiltroPessoa + ' and situacao in(''S'',''ATIVO'') ';
        2: FiltroPessoa     := FiltroPessoa + ' and situacao in(''N'',''INATIVO'') ';
        3: FiltroPessoa     := FiltroPessoa + ' and situacao =''INADIMPLENTE'' ';
        4: FiltroPessoa     := FiltroPessoa + ' and situacao =''SUSPENSO'' ';
        5: FiltroPessoa     := FiltroPessoa + ' and situacao =''CANCELADO'' ';
        6: FiltroPessoa     := FiltroPessoa + ' and situacao =''AFASTADO'' ';
      end;

      if Filtro <> '' then
      begin
        FiltroQuery :=  ' and (codigo like :filtro or'+
                              ' nome like :filtro or'+
                              ' apelido like :filtro or'+
                              ' cpf like :filtro or'+
                              ' matricula like :filtro or'+
                              ' codfornecedor like :filtro)';

        SqlQuery  := SqlQuery +FiltroPessoa+FiltroSecretaria+ FiltroQuery;

      end
      else
      SqlQuery  := sqlQuery+FiltroPessoa+FiltroSecretaria;

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

        if dm.TabConsSocioWhats.Active then
        begin
          dm.TabConsSocioWhats.EmptyDataSet; // Feche o dataset se estiver ativo
        end
        else
        begin
          dm.TabConsSocioWhats.Open;
          dm.TabConsSocioWhats.EmptyDataSet;
        end;

        dm.TabConsSocioWhats.DisableControls;

        while not Qry.Eof do
        begin
          dm.TabConsSocioWhats.Append;

          dm.TabConsSocioWhats.FieldByName('id_socio').AsInteger        :=  Qry.FieldByName('id_socio').AsInteger;
          dm.TabConsSocioWhats.FieldByName('codigo').AsInteger          :=  Qry.FieldByName('codigo').AsInteger;
          dm.TabConsSocioWhats.FieldByName('matricula').AsInteger       :=  Qry.FieldByName('matricula').AsInteger;
          dm.TabConsSocioWhats.FieldByName('situacao').AsString         :=  Qry.FieldByName('situacao').AsString;
          dm.TabConsSocioWhats.FieldByName('nome').AsString             :=  Qry.FieldByName('nome').AsString;
          dm.TabConsSocioWhats.FieldByName('apelido').AsString          :=  Qry.FieldByName('apelido').AsString;
          dm.TabConsSocioWhats.FieldByName('cpf').AsString              :=  Qry.FieldByName('cpf').AsString;
          dm.TabConsSocioWhats.FieldByName('telefone').AsString         :=  Qry.FieldByName('telefone').AsString;
          dm.TabConsSocioWhats.FieldByName('celular').AsString          :=  Qry.FieldByName('celular').AsString;
          dm.TabConsSocioWhats.FieldByName('whatsapp').AsString         :=  Qry.FieldByName('whatsapp').AsString;
          dm.TabConsSocioWhats.FieldByName('email').AsString            :=  Qry.FieldByName('email').AsString;
          dm.TabConsSocioWhats.FieldByName('cli_tipo').AsString         :=  Qry.FieldByName('cli_tipo').AsString;
          dm.TabConsSocioWhats.FieldByName('codfornecedor').AsInteger   :=  Qry.FieldByName('codfornecedor').AsInteger;
          dm.TabConsSocioWhats.FieldByName('cliente').AsString          :=  Qry.FieldByName('cliente').AsString;
          dm.TabConsSocioWhats.FieldByName('fornecedor').AsString       :=  Qry.FieldByName('fornecedor').AsString;
          dm.TabConsSocioWhats.FieldByName('nascimento').AsDateTime     :=  Qry.FieldByName('nascimento').AsDateTime;

          dm.TabConsSocioWhats.Post;
          Qry.Next;
        end;
        dm.TabConsSocioWhats.EnableControls;
        dm.TabConsSocioWhats.First;
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

Function TModelsocio.InativarCarteiraExcluida(iduser, i:integer):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  sqlQuery := 'Update carteira SET ativo=''N'', excluido=1, sinc_app=''S'', data_exc=CURRENT_TIMESTAMP, id_usuario_exc= :iduser WHERE id_socio = :id';

  Qry := TUniQuery.Create(nil);

  try
    try
      Qry.Connection := dm.Conn;
      Qry.Params.Clear;
      Qry.SQL.Text := sqlQuery;

      // Definindo parâmetro
      Qry.ParamByName('iduser').AsInteger    :=iduser;
      Qry.ParamByName('id').AsInteger        := i;
      Qry.ExecSQL;

      if Qry.RowsAffected > 0 then
      begin

        Result := True;
      end;
    except
      on E: Exception do
      begin

        raise;
      end;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

{$REGION 'Importar Dados JSON'}


{$ENDREGION}

end.
