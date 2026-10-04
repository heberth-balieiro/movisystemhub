unit Model.Pessoa;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('SOCIO')]
  TPESSOA = class
  private
    Ffin_parcela4: double;
    Fref_telefone5: String;
    Fsincapp: string;
    Fnacionalidade: String;
    FProfCNPJ: string;
    Fdesconto: double;
    Faviso: string;
    fobs: string;
    Frg: String;
    Fidempresa: integer;
    FProfBairro: string;
    Fref_pessoal2: String;
    Fpai: string;
    Femail: string;
    Fbairro: String;
    Ffin_financio2: String;
    Ffin_financio3: String;
    Fnascimento: TdateTime;
    Fref_pessoal1: String;
    Fenvwhats: string;
    Fsociodeste: Tdate;
    Ffin_financio1: String;
    Fref_afinidade2: String;
    Fref_tempo2: String;
    Fnaturalde: integer;
    Fapelido: String;
    FProfIDCidade: Integer;
    Fref_comercial2: String;
    Fcliente: string;
    Fclitipo: string;
    Fidcidade: integer;
    Fcodigo: integer;
    Ffin_financio4: String;
    Ffin_ano2: String;
    Fref_afinidade1: String;
    Fref_tempo1: String;
    Fcnh: String;
    Fcivil: String;
    Fcpf: String;
    Ffin_ano3: String;
    Ftiporesidencia: String;
    Fsindidempresa: integer;
    Fresponsavel: string;
    Fserie: String;
    Fref_comercial1: String;
    FProfCEP: string;
    Fidprofissao: integer;
    Fsalario: double;
    Fcodfornecedor: integer;
    Ffin_ano1: String;
    FProfNumero: string;
    Fcep: String;
    Ffoto: string;
    Fnumero: String;
    Fidsede: integer;
    Fref_conta2: String;
    Fbloqueado: string;
    Fenvemail: string;
    Ffin_ano4: String;
    Fmensalidade: String;
    FProfTempoServico: string;
    Fpis: String;
    Fref_conta1: String;
    Fidescritorio: Integer;
    Ffin_veiculo2: String;
    FProfComplemento: string;
    Fidlotacao: integer;
    Ftelefone2: String;
    Ffornecedor: string;
    Forgao: String;
    Fsituacao: string;
    Ffin_outros: String;
    Ffin_veiculo3: String;
    Fref_agencia2: String;
    Fcelular2: String;
    Fctps: String;
    Fcomplemento: String;
    Femissaorg: Tdate;
    Ffin_veiculo1: String;
    Fwhatsapp: String;
    Fref_telefone2: String;
    Fref_agencia1: String;
    Fidsocio: Integer;
    Ffin_parcela2: double;
    Fref_telefone3: String;
    Flimite: Double;
    Ffin_parcela3: double;
    Ffin_veiculo4: String;
    Fref_banco2: String;
    Fsexo: String;
    Fnome: String;
    Fmatricula: integer;
    Fref_telefone1: String;
    FProfEndereco: string;
    Fapp: string;
    Fdtdesativado: tdate;
    FExcluido: integer;
    Ffin_parcela1: double;
    Fref_telefone6: String;
    FProfTelefone: string;
    FProfRazao: string;
    fadmissao: tdateTime;
    Fendereco: String;
    Fref_banco1: String;
    Fmae: string;
    Ftelefone: String;
    Fref_telefone4: String;
    Ftemporesidencia: String;
    Fprofissao: string;
    Fcelular: String;
    Fcodigo_exibir: String;
    Ftipo_pessoa: String;
    Fcidade: String;
    Fid_tiposituacao: integer;
    Fid_localtrabalho: integer;
    Fidusuario: Integer;
    Fsocio_secretaria: String;


  public
    [FieldName('id_socio', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property idsocio        :Integer  read  Fidsocio        write Fidsocio;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert,foSelect])]
    property idempresa      :integer  read  Fidempresa      write Fidempresa;

    [FieldName('id_sede')]
    [FieldOptions([foInsert,foSelect])]
    property idsede         :integer  read  Fidsede         write Fidsede;

    [FieldName('codigo')]
    [FieldOptions([foInsert,foSelect])]
    property codigo         :integer  read  Fcodigo         write FCodigo;

    [FieldName('matricula')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property matricula      :integer  read  Fmatricula      write Fmatricula;

    [FieldName('socio_deste')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property sociodeste     :Tdate    read  Fsociodeste     write Fsociodeste;

    [FieldName('situacao')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property situacao       :string   read  Fsituacao       write Fsituacao;

    [FieldName('nome')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property nome           :String   read  Fnome           write Fnome;

    [FieldName('apelido')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property apelido        :String   read  Fapelido        write Fapelido;

    [FieldName('cep')]
    [FieldOptions([foInsert,foupdate, foSelect])]
    property cep            :String   read  Fcep            write Fcep;

    [FieldName('endereco')]
    [FieldOptions([foInsert, foupdate, foSelect])]
    property endereco       :String   read  Fendereco       write Fendereco;

    [FieldName('numero')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property numero         :String   read  Fnumero         write Fnumero;

    [FieldName('complemento')]
    [FieldOptions([foInsert,foupdate, foSelect])]
    property complemento    :String   read  Fcomplemento    write Fcomplemento;

    [FieldName('bairro')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property bairro         :String   read  Fbairro         write Fbairro;

    [FieldName('id_cidade')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property idcidade       :integer  read  Fidcidade       write Fidcidade;

    [FieldName('telefone')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property telefone       :String   read  Ftelefone       write Ftelefone;

    [FieldName('celular')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property celular        :String   read  Fcelular        write Fcelular;

    [FieldName('whatsapp')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property whatsapp       :String   read  Fwhatsapp       write Fwhatsapp;

    [FieldName('cpf')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property cpf            :String   read  Fcpf            write Fcpf;

    [FieldName('rg')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property rg             :String   read  Frg             write Frg;

    [FieldName('orgao')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property orgao          :String   read  Forgao          write Forgao;

    [FieldName('ctps')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ctps           :String   read  Fctps           write Fctps;

    [FieldName('serie')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property serie          :String   read  Fserie          write Fserie;

    [FieldName('pis')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property pis            :String   read  Fpis            write Fpis;

    [FieldName('sexo')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property sexo           :String   read  Fsexo           write Fsexo;

    [FieldName('estado_civil')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property civil          :String   read  Fcivil          write Fcivil;

    [FieldName('nascimento')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property nascimento     :TdateTime    read  Fnascimento     write Fnascimento;

    [FieldName('natural_cidade')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property naturalde      :integer  read  Fnaturalde      write Fnaturalde;

    [FieldName('email')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property email          :string   read  Femail          write Femail;

    [FieldName('pai')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property pai            :string   read  Fpai            write Fpai;

    [FieldName('mae')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property mae            :string   read  Fmae            write Fmae;

    [FieldName('profissao')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property profissao      :string   read  Fprofissao      write Fprofissao;

    [FieldName('admissao')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property admissao       :tdateTime    read  fadmissao       write Fadmissao;

    [FieldName('data_desativacao')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property dtdesativado   :tdate    read  Fdtdesativado   write Fdtdesativado;

    [FieldName('obs')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property obs            :string   read  fobs            write Fobs;

    [FieldName('cli_tipo')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property clitipo        :string   read  Fclitipo        write Fclitipo;

    [FieldName('cli_responsavel')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property responsavel    :string   read  Fresponsavel    write Fresponsavel;

    [FieldName('cliente')]
    [FieldOptions([foInsert,foSelect])]
    property cliente        :string   read  Fcliente        write Fcliente;

    [FieldName('fornecedor')]
    [FieldOptions([foInsert,foSelect])]
    property fornecedor     :string   read  Ffornecedor     write Ffornecedor;

    [FieldName('envemail')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property envemail       :string   read  Fenvemail       write Fenvemail;

    [FieldName('envwhats')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property envwhats       :string   read  Fenvwhats       write Fenvwhats;

    [FieldName('codfornecedor')]
    [FieldOptions([foInsert,foSelect])]
    property codfornecedor  :integer  read  Fcodfornecedor  write Fcodfornecedor;

    [FieldName('telefone2')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property telefone2      :String   read  Ftelefone2      write Ftelefone2;

    [FieldName('celular2')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property celular2       :String   read  Fcelular2       write Fcelular2;

    [FieldName('aviso')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property aviso          :string   read  Faviso          write FAviso;

    [FieldName('foto')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property foto           :string   read  Ffoto           write Ffoto;

    [FieldName('escritorio')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property idescritorio   :Integer  read  Fidescritorio   write Fidescritorio;

    [FieldName('mostrarapp')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property app            :string   read  Fapp            write Fapp;

    [FieldName('sindicato_perc_desconto')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property desconto       :double   read  Fdesconto       write Fdesconto;

    [FieldName('sindicato_salario')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property salario        :double   read  Fsalario        write Fsalario;

    [FieldName('tipo_mensalidade')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property mensalidade    :String   read  Fmensalidade    write Fmensalidade;

    [FieldName('bloqueado')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property bloqueado      :string   read  Fbloqueado      write Fbloqueado;

    [FieldName('sind_id_empresa')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property sindidempresa  :integer  read  Fsindidempresa  write Fsindidempresa;

    [FieldName('id_profissao')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property idprofissao    :integer  read  Fidprofissao    write Fidprofissao;

    [FieldName('id_lotacao')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property idlotacao      :integer  read  Fidlotacao      write Fidlotacao;

    [FieldName('limite')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property limite         :Double   read  Flimite         write Flimite;

    [FieldName('prof_cnpj')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ProfCNPJ       : string  read  FProfCNPJ       write FProfCNPJ;

    [FieldName('prof_razao')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ProfRazao      : string  read  FProfRazao      write FProfRazao;

    [FieldName('prof_telefone')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ProfTelefone   : string  read  FProfTelefone   write FProfTelefone;

    [FieldName('prof_cep')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ProfCEP        : string  read  FProfCEP        write FProfCEP;

    [FieldName('prof_endereco')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ProfEndereco   : string  read  FProfEndereco   write FProfEndereco;

    [FieldName('prof_numero')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ProfNumero     : string  read  FProfNumero     write FProfNumero;

    [FieldName('prof_complemento')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ProfComplemento: string  read  FProfComplemento write FProfComplemento;

    [FieldName('prof_bairro')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ProfBairro     : string  read  FProfBairro     write FProfBairro;

    [FieldName('prof_idcidade')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ProfIDCidade   : Integer read  FProfIDCidade   write FProfIDCidade;

    [FieldName('prof_temposervico')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ProfTempoServico: string read  FProfTempoServico write FProfTempoServico;

    [FieldName('cnh')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property cnh            : String  read  Fcnh             write  Fcnh;

    [FieldName('tiporesidencia')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property tiporesidencia : String  read  Ftiporesidencia  write  Ftiporesidencia;

    [FieldName('temporesidencia')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property temporesidencia: String  read  Ftemporesidencia write  Ftemporesidencia;

    [FieldName('emissaorg')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property emissaorg      : Tdate   read  Femissaorg       write  Femissaorg;

    [FieldName('nacionalidade')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property nacionalidade  : String  read  Fnacionalidade   write  Fnacionalidade;

    [FieldName('ref_banco1')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ref_banco1     : String  read  Fref_banco1      write Fref_banco1;

    [FieldName('ref_banco2')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ref_banco2     : String  read  Fref_banco2      write Fref_banco2;

    [FieldName('ref_agencia1')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ref_agencia1   : String  read  Fref_agencia1    write Fref_agencia1;

    [FieldName('ref_agencia2')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ref_agencia2   : String  read  Fref_agencia2    write Fref_agencia2;

    [FieldName('ref_conta1')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ref_conta1     : String  read  Fref_conta1      write Fref_conta1;

    [FieldName('ref_conta2')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ref_conta2     : String  read  Fref_conta2      write Fref_conta2;

    [FieldName('ref_telefone1')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ref_telefone1  : String  read  Fref_telefone1   write Fref_telefone1;

    [FieldName('ref_telefone2')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ref_telefone2  : String  read  Fref_telefone2   write Fref_telefone2;

    [FieldName('ref_tempo1')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ref_tempo1     : String  read  Fref_tempo1      write Fref_tempo1;

    [FieldName('ref_tempo2')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ref_tempo2     : String  read  Fref_tempo2      write Fref_tempo2;

    [FieldName('ref_pessoal1')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ref_pessoal1   : String  read  Fref_pessoal1    write Fref_pessoal1;

    [FieldName('ref_pessoal2')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ref_pessoal2   : String  read  Fref_pessoal2    write Fref_pessoal2;

    [FieldName('ref_telefone3')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ref_telefone3  : String  read  Fref_telefone3   write Fref_telefone3;

    [FieldName('ref_telefone4')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ref_telefone4  : String  read  Fref_telefone4   write Fref_telefone4;

    [FieldName('ref_afinidade1')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ref_afinidade1 : String  read  Fref_afinidade1  write Fref_afinidade1;

    [FieldName('ref_afinidade2')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ref_afinidade2 : String  read  Fref_afinidade2  write Fref_afinidade2;

    [FieldName('ref_comercial1')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ref_comercial1 : String  read  Fref_comercial1  write Fref_comercial1;

    [FieldName('ref_comercial2')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ref_comercial2 : String  read  Fref_comercial2  write Fref_comercial2;

    [FieldName('ref_telefone5')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ref_telefone5  : String  read  Fref_telefone5   write Fref_telefone5;

    [FieldName('ref_telefone6')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property ref_telefone6  : String  read  Fref_telefone6   write Fref_telefone6;

    [FieldName('fin_veiculo1')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property fin_veiculo1   : String  read  Ffin_veiculo1    write Ffin_veiculo1;

    [FieldName('fin_veiculo2')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property fin_veiculo2   : String  read  Ffin_veiculo2    write Ffin_veiculo2;

    [FieldName('fin_veiculo3')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property fin_veiculo3   : String  read  Ffin_veiculo3    write Ffin_veiculo3;

    [FieldName('fin_veiculo4')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property fin_veiculo4   : String  read  Ffin_veiculo4    write Ffin_veiculo4;

    [FieldName('fin_ano1')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property fin_ano1       : String  read  Ffin_ano1        write Ffin_ano1;

    [FieldName('fin_ano2')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property fin_ano2       : String  read  Ffin_ano2        write Ffin_ano2;

    [FieldName('fin_ano3')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property fin_ano3       : String  read  Ffin_ano3        write Ffin_ano3;

    [FieldName('fin_ano4')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property fin_ano4       : String  read  Ffin_ano4        write Ffin_ano4;

    [FieldName('fin_financiou1')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property fin_financio1  : String  read  Ffin_financio1   write Ffin_financio1;

    [FieldName('fin_financiou2')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property fin_financio2  : String  read  Ffin_financio2   write Ffin_financio2;

    [FieldName('fin_financiou3')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property fin_financio3  : String  read  Ffin_financio3   write Ffin_financio3;

    [FieldName('fin_financiou4')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property fin_financio4  : String  read  Ffin_financio4   write Ffin_financio4;

    [FieldName('fin_parcela1')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property fin_parcela1   : double  read  Ffin_parcela1    write Ffin_parcela1;

    [FieldName('fin_parcela2')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property fin_parcela2   : double  read  Ffin_parcela2    write Ffin_parcela2;

    [FieldName('fin_parcela3')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property fin_parcela3   : double  read  Ffin_parcela3    write Ffin_parcela3;

    [FieldName('fin_parcela4')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property fin_parcela4   : double  read  Ffin_parcela4    write Ffin_parcela4;

    [FieldName('fin_outros')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property fin_outros     : String  read  Ffin_outros      write Ffin_outros;

    [FieldName('excluido')]
    [FieldOptions([foInsert,foSelect])]
    property excluido       : integer read  FExcluido        write Fexcluido;

    [FieldName('sinc_app')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property sincapp        : string  read  Fsincapp         write Fsincapp;

    [FieldName('id_tiposituacao')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property id_tiposituacao      :integer  read  Fid_tiposituacao      write Fid_tiposituacao;

    [FieldName('id_localtrabalho')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property id_localtrabalho      :integer  read  Fid_localtrabalho      write Fid_localtrabalho;



    //variavel avulsa
    [FieldName('codigo_exibir')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property codigo_exibir: String read Fcodigo_exibir write Fcodigo_exibir;

    [FieldName('tipo_pessoa')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property tipo_pessoa: String read Ftipo_pessoa write Ftipo_pessoa;

    [FieldName('cidade')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property cidade: String read Fcidade write Fcidade;

    [FieldName('idusuario')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property idusuario: Integer read Fidusuario write Fidusuario;

    [FieldName('socio_secretaria')]
    [FieldOptions([foSelect])]
    [Editable(False)]
    property socio_secretaria: String read Fsocio_secretaria write Fsocio_secretaria;

  end;

implementation

end.
