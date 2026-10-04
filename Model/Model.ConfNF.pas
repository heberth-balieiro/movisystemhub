unit Model.ConfNF;

interface

Uses
  Uni,System.SysUtils, System.Classes, data.DB, datasnap.dbclient,
  ACBrDFeSSL,blcksock,pcnConversao, pcnConversaoNFe;

Type
  TModelConfNF = Class

  Private
    FTransacao: TUniTransaction;
    FNfeVersao: string;

    FNfeFormaEmissao: string;
    FNfeCertificadoNumero: string;
    FNfeSerie: integer;
    FDataHoraManifesto: Ttime;
    FNfeNumero: integer;
    FNfeTipoEmissao: string;

    FNfeXmlSignLib: string;
    FNfeSenha: string;
    FNfeSsl: string;
    FNfeCryptLib: string;
    FNfeAmbiente: integer;

    FNfeNsu: integer;
    FNfeMaxNsu: integer;

    FIdconfig: integer;

    FNfeCaminhoCertificado: string;
    FNfePathCce: string;
    FNfeHttpLib: string;
    Fpedido: string;
    Fassociacao: string;
    Flocacao: string;
    Fusarapp: string;
    Furlapp: string;
    Furlwhats: string;
    Fgaragem: string;
    Fsindicato: string;
    Fusarwhats: String;
    Fmultiempresa: string;
    Fidplanovenda: Integer;
    Fidplanoacredito: Integer;
    Fidplanocompra: Integer;
    Fidplanoadebito: Integer;
    Fidcustoavulso: Integer;
    Finstanciawhatsappfunc: String;
    Fvendagerarlivrocaixa: String;
    fmoduloestoque: String;
    Fcarteiratoken: string;
    Fcarteirasenha: string;
    Futilizaappcarteira: string;
    Fcarteirausuario: string;
    Fcarteiraapi: string;
    Fidmensagemzap: integer;
    Futilizarvotacaoweb: String;
    Futilizarticket: String;
    Fmespagdesconto: String;
    Fticketseguencia: string;
    Fveiculotoken: string;
    Fveiculosenha: string;
    Futilizaappveiculo: string;
    Fveiculousuario: string;
    Fveiculoapi: string;
    Fveiculotaxapatio: Currency;
    Fveiculotaxaconsignado: Currency;
    Fveiculocomisvendedor: string;
    Fwhatsappapikey: string;
    Fwhatsappversao: string;
    Futilizarordemservico: String;
    Ftipoordemservico: string;
    Fid_msgpadraowhatsappordem: Integer;
    Fid_msgordeminicioexecucao: Integer;
    Fid_msgordemorcamentoenviado: Integer;
    Fid_msgordempecas: Integer;
    Fid_msgordemfinalizada: Integer;
    Fcalculo_vidracaria: string;
    Falterar_preco_pedido: string;
    Ftokensms: String;
    Furlsms: String;
    Futilizasms: String;
    Fprovedorsms: String;
    Fidentificadorsms: String;
    function GerarId(tab, campo: string): integer;
    function StringToTSSLLib(const vlr: string): TSSLLib;
    function StringToTSSLCryptLib(const vlr: string): TSSLCryptLib;
    function StringToTSSLHttpLib(const vlr: string): TSSLHttpLib;
    function StringToTSSLXmlSignLib(const vlr: string): TSSLXmlSignLib;
    function StringToTSSLType(const vlr: string): TSSLType;
    function StringToTpcnVersaoDF(const vlr: string): TpcnVersaoDF;

  Public
    constructor Create;
    destructor Destroy; override;

    property idconfig               : integer read FIdconfig             write FIdconfig;
    property NfeAmbiente            : integer read FNfeAmbiente          write FNfeAmbiente;
    property NfeTipoEmissao         : string read FNfeTipoEmissao       write FNfeTipoEmissao;
    property NfeVersao              : string read FNfeVersao            write FNfeVersao;
    property NfeFormaEmissao        : string read FNfeFormaEmissao      write FNfeFormaEmissao;
    property NfeCaminhoCertificado  : string read FNfeCaminhoCertificado write FNfeCaminhoCertificado;
    property NfeSenha               : string read FNfeSenha             write FNfeSenha;
    property NfeCertificadoNumero   : string read FNfeCertificadoNumero write FNfeCertificadoNumero;
    property NfeNumero              : integer read FNfeNumero            write FNfeNumero;
    property NfeSerie               : integer read FNfeSerie             write FNfeSerie;
    property NfeNsu                 : integer read FNfeNsu               write FNfeNsu;
    property NfeCryptLib            : string read FNfeCryptLib          write FNfeCryptLib;
    property NfeHttpLib             : string read FNfeHttpLib           write FNfeHttpLib;
    property NfeXmlSignLib          : string read FNfeXmlSignLib        write FNfeXmlSignLib;
    property NfeSsl                 : string read FNfeSsl               write FNfeSsl;

    property NfeMaxNsu              : integer read FNfeMaxNsu           write FNfeMaxNsu;
    property DataHoraManifesto      : Ttime read FDataHoraManifesto     write FDataHoraManifesto;

    property urlwhats               : string read Furlwhats     write Furlwhats;
    property urlapp                 : string read Furlapp       write Furlapp;
    property usarwhats              : String read Fusarwhats    write Fusarwhats;
    property usarapp                : string read Fusarapp      write Fusarapp;
    property associacao             : string read Fassociacao   write Fassociacao;
    property sindicato              : string read Fsindicato    write Fsindicato;
    property garagem                : string read Fgaragem      write Fgaragem;
    property pedido                 : string read Fpedido       write Fpedido;
    property locacao                : string read Flocacao      write Flocacao;

    property multiempresa           : string read Fmultiempresa write Fmultiempresa;
    property calculo_vidracaria     : string read Fcalculo_vidracaria write Fcalculo_vidracaria;
    property alterar_preco_pedido   : string read Falterar_preco_pedido write Falterar_preco_pedido;

    Property instanciawhatsappfunc  : String  read Finstanciawhatsappfunc write Finstanciawhatsappfunc;
    Property idplanovenda           : Integer read Fidplanovenda      write Fidplanovenda;
    Property idplanocompra          : Integer read Fidplanocompra     write Fidplanocompra;
    Property idplanoacredito        : Integer read Fidplanoacredito   write Fidplanoacredito;
    Property idplanoadebito         : Integer read Fidplanoadebito    write Fidplanoadebito;
    Property idcustoavulso          : Integer read Fidcustoavulso     write Fidcustoavulso;
    Property vendagerarlivrocaixa   : String  read Fvendagerarlivrocaixa  write  Fvendagerarlivrocaixa;
    Property moduloestoque          : String  read fmoduloestoque     write Fmoduloestoque;

    Property  carteiraapi           : string   read  Fcarteiraapi        write Fcarteiraapi;
    Property  carteirausuario       : string   read  Fcarteirausuario    write Fcarteirausuario;
    Property  carteirasenha         : string   read  Fcarteirasenha      write Fcarteirasenha;
    Property  carteiratoken         : string   read  Fcarteiratoken      write Fcarteiratoken;
    Property  utilizaappcarteira    : string   read  Futilizaappcarteira write Futilizaappcarteira;

    //Dados API Veiculo
    Property  veiculoapi            : string   read Fveiculoapi         write Fveiculoapi;
    Property  veiculousuario        : string   read Fveiculousuario     write Fveiculousuario;
    Property  veiculosenha          : string   read Fveiculosenha       write Fveiculosenha;
    Property  veiculotoken          : string   read Fveiculotoken       write Fveiculotoken;
    Property  utilizaappveiculo     : string   read Futilizaappveiculo  write Futilizaappveiculo;
    Property  veiculocomisvendedor  : string   read Fveiculocomisvendedor   write Fveiculocomisvendedor;
    Property  veiculotaxapatio      : Currency read Fveiculotaxapatio       write Fveiculotaxapatio;
    Property  veiculotaxaconsignado : Currency read Fveiculotaxaconsignado  write Fveiculotaxaconsignado;

    Property  whatsappversao        : string   read Fwhatsappversao     write Fwhatsappversao;
    Property  whatsappapikey        : string   read Fwhatsappapikey     write Fwhatsappapikey;

    Property  utilizarordemservico  : String   read Futilizarordemservico   write Futilizarordemservico;
    Property  tipoordemservico      : string   read Ftipoordemservico       write Ftipoordemservico;

    Property idmensagemzap          : integer read Fidmensagemzap   write Fidmensagemzap;
    Property id_msgpadraowhatsappordem    :Integer  read  Fid_msgpadraowhatsappordem    write Fid_msgpadraowhatsappordem;
    Property id_msgordemorcamentoenviado  :Integer  read  Fid_msgordemorcamentoenviado  write Fid_msgordemorcamentoenviado;
    Property id_msgordeminicioexecucao    :Integer  read  Fid_msgordeminicioexecucao    write Fid_msgordeminicioexecucao;
    Property id_msgordemfinalizada        :Integer  read  Fid_msgordemfinalizada        write Fid_msgordemfinalizada;
    Property id_msgordempecas             :Integer  read  Fid_msgordempecas             write Fid_msgordempecas;



    Property utilizarticket         : String  read  Futilizarticket write Futilizarticket;
    property mespagdesconto         : String  read  Fmespagdesconto write Fmespagdesconto;
    Property utilizarvotacaoweb     : String  read  Futilizarvotacaoweb write Futilizarvotacaoweb;
    Property ticketseguencia        : string  read  Fticketseguencia  write Fticketseguencia;

    Property utilizasms             : String  read  Futilizasms       write Futilizasms;
    Property provedorsms            : String  read  Fprovedorsms      write Fprovedorsms;
    Property tokensms               : String  read  Ftokensms         write Ftokensms;
    Property identificadorsms       : String  read  Fidentificadorsms write Fidentificadorsms;
    Property urlsms                 : String  read  Furlsms           write Furlsms;


    Function Insert(out msg:String; out idconf:integer):Boolean;
    Function Update(out msg:string;id:integer):Boolean;

    Function SelectID(out msg:string):Boolean;
    Function SelectExits(out msg:string; out idconf:integer;id:integer):Boolean;

    Procedure ConfigurarComponenteNFe;

    function ExisteManifesto(out chaveR, nsu, idemp: string;
      chave: string): Boolean;
    function InsertManifesto(out msg: string; numero, chave, serie, nome, cnpj, ie, nsu,
                                      situacao,dirxml,xml,gerou,xmotivo,eventoverapli,eventotpevento,
                                      eventonprot,xmlresumo,protocolo,digval:String;
                                      valor:double;
                                      dtentrada,dtemissao:Tdate;
                                      cstat,modnfe:Integer): Boolean;
    Function UpdateNSU(out msg:string;nsu:string):Boolean;
    Function UpdateXML(chave, xml,impresso,xmotivo:String):Boolean;

    function InsertManifestoResumo(out msg:string;
                                            numero, chave, serie, nome, cnpj, ie, nsu,
                                            xmlresumo, impresso, nfetipo, situacao, xmotivo:String;
                                            valor:double;
                                            dtentrada,dtemissao:Tdate;
                                            cstat:integer
                                            ):Boolean;

    function UpdateEvento(chave, xevento, nprot, tpevento: String;
      dhevento, dhrecebto: tdate; segevento,orgao: Integer): Boolean;


    Function OneRamoEmpresa(out oneAssociacao, oneSindicado, oneGaragem, onePedido,
                          oneLocacao,oneEstoque, oneOrdemServico:string;id:integer):Boolean;//retorna qual a configuracao da empresa seu ramo



    {$REGION 'Manifesto Funcoes'}

    Function LocalizarDFe(out msg: string;
                                  TabStatus, TabNota, Filtro:Integer;
                                  dtini,dtfim:tdate;
                                  campo:string):Boolean;



    {$ENDREGION}


  End;

implementation

uses UConeSul, Vcl.Session, Udm, UnitGlobal, Model.SQLQry;

constructor TModelConfNF.Create;
begin
inherited Create;

  FTransacao                    := TUniTransaction.Create(nil);
  FTransacao.DefaultConnection  := dm.Conn;
end;

destructor TModelConfNF.Destroy;
begin
  if Assigned(FTransacao) then
    FreeAndNil(FTransacao);

  inherited Destroy;
end;

Function TModelConfNF.GerarId(tab, campo:string):integer;
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

function TModelConfNF.Insert(out msg: String; out idconf:integer): Boolean;
var
Qry       : TUniquery;
sqlQuery  : string;
begin
  Result  := False;
  Qry     := TUniquery.create(nil);

  Try
    FTransacao.StartTransaction;
    Qry.Connection  := dm.Conn;
    SqlQuery        := 'Insert into configuracao_nf(id_config, id_empresa, nfe_ambiente, nfe_numero, nfe_serie, nfe_nsu, nfe_maxnsu'+
                                        ')'+
                                        'Values(:1,:2,:3,:4,:5,:6,:7)';

    With Qry do
    begin
      Close;
      Sql.clear;
      Qry.SQL.Text := sqlQuery;

      idconf    := GerarId('configuracao_nf','id_config');

      Qry.ParamByName('1').AsInteger            := idconf;
      Qry.ParamByName('2').AsInteger            := TSession.IDEMPRESA;
      Qry.ParamByName('3').AsInteger            := NfeAmbiente;
      Qry.ParamByName('4').AsInteger            := 0;
      Qry.ParamByName('5').AsInteger            := 0;
      Qry.ParamByName('6').AsString             := '0';
      Qry.ParamByName('7').AsInteger            := 0;
      {Qry.ParamByName('8').AsString            := NfePathCce;
      Qry.ParamByName('9').AsString             := NfePathInutilizacao;
      Qry.ParamByName('10').AsString            := NfePathDpec;
      Qry.ParamByName('11').AsString            := NfePathEvento;
      Qry.ParamByName('12').AsString            := NfePathPdf;}

      ExecSql;
      msg     := 'Registro realizado com sucesso!';
      Result  := True;
      FTransacao.Commit;

    end;

  Finally
    Qry.Free;
  End;

end;

function TModelConfNF.Update(out msg: string;id:integer): Boolean;
var
Qry       : TUniquery;
sqlQuery  : string;
begin
  Result  := False;
  Qry     := TUniquery.create(nil);

  Try
    FTransacao.StartTransaction;
    Qry.Connection  := dm.Conn;
    SqlQuery        := 'UPDATE configuracao_nf '+
                        'SET                          '+
                            'nfe_ambiente = :nfeambiente,                   '+
                            'nfe_tipoemissao = :nfetipoemissao,             '+
                            'nfe_versao = :nfeversao,                       '+
                            'nfe_formaemissao = :nfeformaemissao,           '+
                            'nfe_caminhocertificado = :nfecaminhocertificado,'+
                            'nfe_senha = :nfesenha,                         '+
                            'nfe_certificadonumero = :nfecertificadonumero, '+
                            'nfe_numero = :nfenumero,                       '+
                            'nfe_serie = :nfeserie,                         '+
                            'nfe_nsu = :nfenusu,                            '+
                            'nfe_cryptlib = :nfecryptlib,                   '+
                            'nfe_httplib = :nfehttplib,                     '+
                            'nfe_xmlsignlib = :nfexmlsignlib,               '+
                            'nfe_ssl = :nfessl,                             '+
                            'urlapiwhatsapp=          :urlwhats,            '+
                            'urlapiapp=               :urlapp,              '+
                            'utilizawhatsapp=         :usarwhats,            '+
                            'utilizaapp=              :usarapp,             '+
                            'sistema_associacao=      :associacao,          '+
                            'sistema_sindicato=       :sindicato,           '+
                            'sistema_garagem=         :garagem,             '+
                            'sistema_pedido=          :pedido,              '+
                            'sistema_locacao=         :locacao,             '+
                            'sistema_multiempresa=    :mult,                 '+
                            'instanciawhatsappfunc=   :whatsfunc,             '+
                            'id_plano_venda=          :idplanovenda,          '+
                            'id_plano_compra=         :idplanocompra,          '+
                            'id_plano_acredito=       :idplanoacredito,       '+
                            'id_plano_adebito=        :idplanoadebito,        '+
                            'id_custo_avulso=         :idcustoavulso,          '+
                            'vendagerarlivrocaixa=    :glivro,                 '+
                            'moduloestoque=           :moduloestoque,'+
                            'carteira_api=            :carteiraapi,' +
                            'carteira_usuario=        :carteirausuario,' +
                            'carteira_senha=          :carteirasenha,' +
                            'carteira_token=          :carteiratoken,' +
                            'utilizaappcarteira=      :utilizaappcarteira,' +
                            'id_mensagempadraowhatsapp=  :idmensagempadraowhatsapp,'+
                            'ticket_mespag_mesdesconto= :ticket_mespag_mesdesconto,'+
                            'utilizar_ticket=           :utilizar_ticket,'+
                            'utilizar_votacao_web=      :utilizar_votacao_web,'+
                            'ticket_seguencia=          :ticketseguencia,'+
                            'veiculo_api=               :veiculo_api,'+
                            'veiculo_usuario=           :veiculo_usuario,'+
                            'veiculo_senha=             :veiculo_senha,'+
                            'veiculo_token=             :veiculo_token,'+
                            'veiculo_utilizaapp=        :veiculo_utilizaapp,'+
                            'veiculo_comis_vendedor=    :veiculocomisvendedor, '+
                            'veiculo_taxa_patio=        :veiculotaxapatio,    '+
                            'veiculo_taxa_consignado=   :veiculotaxaconsignado,'+
                            'whatsapp_versao=           :whatsappversao,'+
                            'whatsapp_apikey=           :whatsappapikey,'+
                            'utilizarordemservico=      :utilizarordemservico,'+
                            'tipoordemservico=          :tipoordemservico,'+
                            'id_msgpadraowhatsappordem= :id_msgpadraowhatsappordem,'+
                            'id_msgordemorcamentoenviado= :id_msgordemorcamentoenviado, '+
                            'id_msgordeminicioexecucao=   :id_msgordeminicioexecucao,   '+
                            'id_msgordemfinalizada=       :id_msgordemfinalizada,      '+
                            'id_msgordempecas=            :id_msgordempecas,           '+
                            'calculo_vidracaria=          :calculo_vidracaria,          '+
                            'alterar_preco_pedido=        :alterar_preco_pedido,         '+
                            'utilizasms=                  :utilizasms,  '+
                            'provedorsms=                 :provedorsms, '+
                            'tokensms=                    :tokensms, '+
                            'identificadorsms=            :identificadorsms, '+
                            'urlsms=                      :urlsms   '+
                            ' WHERE                                        '+
                            ' id_config= :idconfig and '+
                            ' id_empresa= :idempresa';

    With Qry do
    begin
      Close;
      Sql.clear;
      Qry.SQL.Text := sqlQuery;

      Qry.ParamByName('nfeambiente').AsInteger            := nfeambiente;
      Qry.ParamByName('nfetipoemissao').AsString          := nfetipoemissao;
      Qry.ParamByName('nfeversao').AsString               := nfeversao;
      Qry.ParamByName('nfeformaemissao').AsString         := nfeformaemissao;
      Qry.ParamByName('nfecaminhocertificado').AsString   := nfecaminhocertificado;
      Qry.ParamByName('nfesenha').AsString                := nfesenha;
      Qry.ParamByName('nfecertificadonumero').AsString    := nfecertificadonumero;
      Qry.ParamByName('nfenumero').AsInteger              := nfenumero;
      Qry.ParamByName('nfeserie').AsInteger               := nfeserie;
      Qry.ParamByName('nfenusu').AsInteger                := NfeNsu;
      Qry.ParamByName('nfecryptlib').AsString             := nfecryptlib;
      Qry.ParamByName('nfehttplib').AsString              := nfehttplib;
      Qry.ParamByName('nfexmlsignlib').AsString           := nfexmlsignlib;
      Qry.ParamByName('nfessl').AsString                  := nfessl;

      Qry.ParamByName('urlwhats').AsString                := urlwhats;
      Qry.ParamByName('urlapp').AsString                  := urlapp;
      Qry.ParamByName('usarwhats').AsString               := usarwhats;
      Qry.ParamByName('usarapp').AsString                 := usarapp;
      Qry.ParamByName('associacao').AsString              := associacao;
      Qry.ParamByName('sindicato').AsString               := sindicato;
      Qry.ParamByName('garagem').AsString                 := garagem;
      Qry.ParamByName('pedido').AsString                  := pedido;
      Qry.ParamByName('locacao').AsString                 := locacao;
      Qry.ParamByName('mult').AsString                    := multiempresa;

      Qry.ParamByName('whatsfunc').AsString               := instanciawhatsappfunc;
      Qry.ParamByName('idplanovenda').AsInteger           := idplanovenda;
      Qry.ParamByName('idplanocompra').AsInteger          := idplanocompra;
      Qry.ParamByName('idplanoacredito').AsInteger        := idplanoacredito;
      Qry.ParamByName('idplanoadebito').AsInteger         := idplanoadebito;
      Qry.ParamByName('idcustoavulso').AsInteger          := idcustoavulso;
      Qry.ParamByName('glivro').AsString                  := vendagerarlivrocaixa;
      Qry.ParamByName('moduloestoque').AsString           := moduloestoque;

      Qry.ParamByName('idconfig').AsInteger               := id;
      Qry.ParamByName('idempresa').AsInteger              := TSession.IDEMPRESA;

      Qry.ParamByName('carteiraapi').AsString             := carteiraapi;
      Qry.ParamByName('carteirausuario').AsString         := carteirausuario;
      Qry.ParamByName('carteirasenha').AsString           := carteirasenha;
      Qry.ParamByName('carteiratoken').AsString           := carteiratoken;
      Qry.ParamByName('utilizaappcarteira').AsString      := utilizaappcarteira;

      Qry.ParamByName('idmensagempadraowhatsapp').AsInteger := idmensagemzap;

      Qry.ParamByName('ticket_mespag_mesdesconto').AsString := mespagdesconto;
      Qry.ParamByName('utilizar_ticket').AsString           := utilizarticket;
      Qry.ParamByName('utilizar_votacao_web').AsString      := utilizarvotacaoweb;
      Qry.ParamByName('ticketseguencia').AsString           := ticketseguencia;

      Qry.ParamByName('veiculo_api').AsString               := veiculoapi;
      Qry.ParamByName('veiculo_usuario').AsString           := veiculousuario;
      Qry.ParamByName('veiculo_senha').AsString             := veiculosenha;
      Qry.ParamByName('veiculo_token').AsString             := veiculotoken;
      Qry.ParamByName('veiculo_utilizaapp').AsString        := utilizaappveiculo;
      Qry.ParamByName('veiculocomisvendedor').AsString      := veiculocomisvendedor;
      Qry.ParamByName('veiculotaxapatio').AsCurrency        := veiculotaxapatio;
      Qry.ParamByName('veiculotaxaconsignado').AsCurrency   := veiculotaxaconsignado;

      Qry.ParamByName('whatsappversao').AsString            := whatsappversao;
      Qry.ParamByName('whatsappapikey').AsString            := whatsappapikey;

      Qry.ParamByName('utilizarordemservico').AsString      := utilizarordemservico;
      Qry.ParamByName('tipoordemservico').AsString          := tipoordemservico;

      Qry.ParamByName('id_msgpadraowhatsappordem').AsInteger    := id_msgpadraowhatsappordem;
      Qry.ParamByName('id_msgordemorcamentoenviado').AsInteger  := id_msgordemorcamentoenviado;
      Qry.ParamByName('id_msgordeminicioexecucao').AsInteger    := id_msgordeminicioexecucao;
      Qry.ParamByName('id_msgordemfinalizada').AsInteger        := id_msgordemfinalizada;
      Qry.ParamByName('id_msgordempecas').AsInteger             := id_msgordempecas;
      Qry.ParamByName('calculo_vidracaria').AsString            := calculo_vidracaria;
      Qry.ParamByName('alterar_preco_pedido').AsString          := alterar_preco_pedido;

      Qry.ParamByName('utilizasms').AsString                := utilizasms;
      Qry.ParamByName('provedorsms').AsString               := provedorsms;
      Qry.ParamByName('tokensms').AsString                  := tokensms;
      Qry.ParamByName('identificadorsms').AsString          := identificadorsms;
      Qry.ParamByName('urlsms').AsString                    := urlsms;

      ExecSql;
      msg     := 'Registro atualizado com sucesso!';
      Result  := True;
      FTransacao.Commit;
    end;

  Finally
    Qry.Free;
  End;
end;

Function TModelConfNF.SelectExits(out msg:string; out idconf:integer;id:integer):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result    := False;
  idconf    := 0;
  Qry := TUniQuery.Create(nil);

  try
    try
      Qry.Connection  := dm.Conn;
      sqlQuery        := 'Select id_config from configuracao_nf where id_empresa= :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger  := id;

      Qry.Open;
      if not Qry.IsEmpty then
      begin
        idconf :=  Qry.Fieldbyname('id_config').AsInteger;
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

Function TModelConfNF.SelectID(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result    := False;

  Qry := TUniQuery.Create(nil);

  try
    try
      Qry.Connection  := dm.Conn;
      sqlQuery        := 'Select * from configuracao_nf where id_config= :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger  := idconfig;

      Qry.Open;
      if not Qry.IsEmpty then
      begin

        nfeambiente         := Qry.Fieldbyname('nfe_ambiente').AsInteger;
        nfetipoemissao      := Qry.Fieldbyname('nfe_tipoemissao').AsString;
        nfeversao           := Qry.Fieldbyname('nfe_versao').AsString;
        nfeformaemissao     := Qry.Fieldbyname('nfe_formaemissao').AsString;
        nfecaminhocertificado := Qry.Fieldbyname('nfe_caminhocertificado').AsString;
        nfesenha            := Qry.Fieldbyname('nfe_senha').AsString;
        nfecertificadonumero:= Qry.Fieldbyname('nfe_certificadonumero').asstring;
        nfenumero           := Qry.Fieldbyname('nfe_numero').AsInteger;
        nfeserie            := Qry.Fieldbyname('nfe_serie').AsInteger;
        NfeNsu              := strtoint(Qry.Fieldbyname('nfe_nsu').Asstring);
        nfecryptlib         := Qry.Fieldbyname('nfe_cryptlib').AsString;
        nfehttplib          := Qry.Fieldbyname('nfe_httplib').AsString;
        nfexmlsignlib       := Qry.Fieldbyname('nfe_xmlsignlib').AsString;
        nfessl              := Qry.Fieldbyname('nfe_ssl').AsString;
        nfemaxnsu           := Qry.Fieldbyname('nfe_maxnsu').AsInteger;

        urlwhats            := Qry.Fieldbyname('urlapiwhatsapp').AsString;
        urlapp              := Qry.Fieldbyname('urlapiapp').AsString;
        usarwhats           := Qry.Fieldbyname('utilizawhatsapp').AsString;
        usarapp             := Qry.Fieldbyname('utilizaapp').AsString;
        associacao          := Qry.Fieldbyname('sistema_associacao').AsString;
        sindicato           := Qry.Fieldbyname('sistema_sindicato').AsString;
        garagem             := Qry.Fieldbyname('sistema_garagem').AsString;
        pedido              := Qry.Fieldbyname('sistema_pedido').AsString;
        locacao             := Qry.Fieldbyname('sistema_locacao').AsString;

        multiempresa        := Qry.Fieldbyname('sistema_multiempresa').AsString;

        instanciawhatsappfunc:= Qry.Fieldbyname('instanciawhatsappfunc').AsString;
        idplanovenda         := Qry.Fieldbyname('id_plano_venda').AsInteger;
        idplanocompra        := Qry.Fieldbyname('id_plano_compra').AsInteger;
        idplanoacredito      := Qry.Fieldbyname('id_plano_acredito').AsInteger;
        idplanoadebito       := Qry.Fieldbyname('id_plano_adebito').AsInteger;
        idcustoavulso        := Qry.Fieldbyname('id_custo_avulso').AsInteger;
        vendagerarlivrocaixa := Qry.Fieldbyname('vendagerarlivrocaixa').AsString;
        moduloestoque        := Qry.FieldByName('moduloestoque').AsString;

        carteiraapi           := Qry.FieldByName('carteira_api').AsString;
        carteirausuario       := Qry.FieldByName('carteira_usuario').AsString;
        carteirasenha         := Qry.FieldByName('carteira_senha').AsString;
        carteiratoken         := Qry.FieldByName('carteira_token').AsString;
        utilizaappcarteira    := Qry.FieldByName('utilizaappcarteira').AsString;

        idmensagemzap         := Qry.FieldByName('id_mensagempadraowhatsapp').AsInteger;

        mespagdesconto        := Qry.FieldByName('ticket_mespag_mesdesconto').AsString;
        utilizarticket        := Qry.FieldByName('utilizar_ticket').AsString;
        utilizarvotacaoweb    := Qry.FieldByName('utilizar_votacao_web').AsString;
        ticketseguencia       := qry.FieldByName('ticket_seguencia').AsString;

        veiculoapi            := Trim(Qry.FieldByName('veiculo_api').AsString);
        veiculousuario        := Trim(Qry.FieldByName('veiculo_usuario').AsString);
        veiculosenha          := Trim(Qry.FieldByName('veiculo_senha').AsString);
        veiculotoken          := Trim(Qry.FieldByName('veiculo_token').AsString);
        utilizaappveiculo     := Qry.FieldByName('veiculo_utilizaapp').AsString;

        veiculocomisvendedor  := Qry.FieldByName('veiculo_comis_vendedor').AsString;
        veiculotaxapatio      := Qry.FieldByName('veiculo_taxa_patio').AsCurrency;
        veiculotaxaconsignado := Qry.FieldByName('veiculo_taxa_consignado').AsCurrency;

        whatsappversao       := Qry.FieldByName('whatsapp_versao').AsString;
        whatsappapikey       := Qry.FieldByName('whatsapp_apikey').AsString;

        utilizarordemservico := Qry.FieldByName('utilizarordemservico').AsString;
        tipoordemservico     := Qry.FieldByName('tipoordemservico').AsString;

        id_msgpadraowhatsappordem   := Qry.FieldByName('id_msgpadraowhatsappordem').AsInteger;
        id_msgordemorcamentoenviado := Qry.FieldByName('id_msgordemorcamentoenviado').AsInteger;
        id_msgordeminicioexecucao   := Qry.FieldByName('id_msgordeminicioexecucao').AsInteger;
        id_msgordemfinalizada       := Qry.FieldByName('id_msgordemfinalizada').AsInteger;
        id_msgordempecas            := Qry.FieldByName('id_msgordempecas').AsInteger;
        calculo_vidracaria          := Qry.FieldByName('calculo_vidracaria').AsString;
        alterar_preco_pedido        := Qry.FieldByName('alterar_preco_pedido').AsString;

        utilizasms                  := Qry.FieldByName('utilizasms').AsString;
        provedorsms                 := Qry.FieldByName('provedorsms').AsString;
        tokensms                    := Qry.FieldByName('tokensms').AsString;
        identificadorsms            := Qry.FieldByName('identificadorsms').AsString;
        urlsms                      := Qry.FieldByName('urlsms').AsString;

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

Procedure TModelConfNF.ConfigurarComponenteNFe;
var
  Qry: TUniQuery;
  sqlQuery: string;
  Ok: Boolean;
begin

  Qry := TUniQuery.Create(nil);

  try
    try
      Qry.Connection  := dm.Conn;
      sqlQuery        := 'Select * from configuracao_nf where id_empresa= :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger  := TSession.IDEMPRESA;

      Qry.Open;

      if not Qry.IsEmpty then
      begin

        nfeambiente         := Qry.Fieldbyname('nfe_ambiente').AsInteger;
        nfetipoemissao      := Qry.Fieldbyname('nfe_tipoemissao').AsString;
        nfeformaemissao     := Qry.Fieldbyname('nfe_formaemissao').AsString;
        nfeversao           := Qry.Fieldbyname('nfe_versao').AsString;
        nfecaminhocertificado := Qry.Fieldbyname('nfe_caminhocertificado').AsString;
        nfecertificadonumero:= Qry.Fieldbyname('nfe_certificadonumero').asstring;
        nfecryptlib         := Qry.Fieldbyname('nfe_cryptlib').AsString;
        nfehttplib          := Qry.Fieldbyname('nfe_httplib').AsString;
        nfexmlsignlib       := Qry.Fieldbyname('nfe_xmlsignlib').AsString;
        nfessl              := Qry.Fieldbyname('nfe_ssl').AsString;
        {nfepathresposta     := Qry.Fieldbyname('nfe_pathresposta').AsString;
        nfepathxsd          := Qry.Fieldbyname('nfe_pathxsd').AsString;
        nfepathenviadas     := Qry.Fieldbyname('nfe_pathenviadas').AsString;
        NfePathCancelada    := Qry.Fieldbyname('nfe_pathcencelada').AsString;
        nfepathcce          := Qry.Fieldbyname('nfe_pathcce').AsString;
        nfepathinutilizacao := Qry.Fieldbyname('nfe_pathinutilizacao').AsString;
        nfepathdpec         := Qry.Fieldbyname('nfe_pathdpec').AsString;
        nfepathevento       := Qry.Fieldbyname('nfe_pathevento').AsString;}


        dm.ACBrNFe1.Configuracoes.Certificados.NumeroSerie  :=nfecertificadonumero;

        dm.ACBrNFe1.SSL.DescarregarCertificado;

        with dm.ACBrNFe1.Configuracoes.Geral do
        begin
          CamposFatObrigatorios := False;
          ExibirErroSchema      := true;
          FormaEmissao          := TpcnTipoEmissao(teNormal);

          SSLLib                := TSSLLib(StringToTSSLLib(nfetipoemissao));
          SSLCryptLib           := TSSLCryptLib(StringToTSSLCryptLib(nfecryptlib));
          SSLHttpLib            := TSSLHttpLib(StringToTSSLHttpLib(nfehttplib));
          SSLXmlSignLib         := TSSLXmlSignLib(StringToTSSLXmlSignLib(nfexmlsignlib));
          dm.ACBrNFe1.SSL.SSLType := TSSLType(StringToTSSLType(nfessl));

          ModeloDF              := moNFe;//TpcnModeloDF(cbModeloDF.ItemIndex);
          VersaoDF              := TpcnVersaoDF(StringToTpcnVersaoDF(nfeversao));
        end;

        with dm.ACBrNFe1.Configuracoes.WebServices do
        begin
          UF                    := 'RO';
          Ambiente              := StrToTpAmb(Ok, Inttostr(nfeambiente));

          //AjustaAguardaConsultaRet := False;


        end;

        with dm.ACBrNFe1.Configuracoes.Arquivos do
        begin
          PathSchemas      := Trim(Dm.nDirArquivo+NfePathXsd);
          PathNFe          := Trim(Dm.nDirArquivo+NfePathEnviadas);
          PathInu          := Trim(dm.nDirArquivo+NfePathInutilizacao);
          PathEvento       := Trim(dm.nDirArquivo+NfePathEvento);
          PathSalvar       := PathNFe;//Trim(dm.nDirArquivo+NfePathResposta);
        end;

      end
      else

      Qry.Close;
    except
      on E: Exception do
      begin

        raise;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

function TModelConfNF.StringToTSSLLib(const vlr: string): TSSLLib;
begin
  if vlr = 'libNone' then
    Result := libNone
  else if vlr = 'libOpenSSL' then
    Result := libOpenSSL
  else if vlr = 'libCapicom' then
    Result := libCapicom
  else if vlr = 'libCapicomDelphiSoap' then
    Result := libCapicomDelphiSoap
  else if vlr = 'libWinCrypt' then
    Result := libWinCrypt
  else if vlr = 'libCustom' then
    Result := libCustom
  else
    raise Exception.Create('Valor de SSLLib inválido: ' + vlr);
end;

function TModelConfNF.StringToTSSLCryptLib(const vlr: string): TSSLCryptLib;
begin
  if vlr = 'cryNone' then
    Result := cryNone
  else if vlr = 'cryOpenSSL' then
    Result := cryOpenSSL
  else if vlr = 'cryCapicom' then
    Result := cryCapicom
  else if vlr = 'cryWinCrypt' then
    Result := cryWinCrypt

  else
    raise Exception.Create('Valor de TSSLCryptLib inválido: ' + vlr);
end;

function TModelConfNF.StringToTSSLHttpLib(const vlr: string): TSSLHttpLib;
begin
  if vlr = 'httpNone' then
    Result := httpNone
  else if vlr = 'httpWinINet' then
    Result := httpWinINet
  else if vlr = 'httpWinHttp' then
    Result := httpWinHttp
  else if vlr = 'httpOpenSSL' then
    Result := httpOpenSSL
  else if vlr = 'httpIndy' then
    Result := httpIndy
  else
    raise Exception.Create('Valor de TSSLHttpLib inválido: ' + vlr);
end;

function TModelConfNF.StringToTSSLXmlSignLib(const vlr: string): TSSLXmlSignLib;
begin
  if vlr = 'xsNone' then
    Result := xsNone
  else if vlr = 'xsXmlSec' then
    Result := xsXmlSec
  else if vlr = 'xsMsXml' then
    Result := xsMsXml
  else if vlr = 'xsMsXmlCapicom' then
    Result := xsMsXmlCapicom
  else if vlr = 'xsLibXml2' then
    Result := xsLibXml2
  else
    raise Exception.Create('Valor de TSSLXmlSignLib inválido: ' + vlr);
end;

function TModelConfNF.StringToTSSLType(const vlr: string): TSSLType;
begin
  if vlr = 'LT_all' then
    Result := LT_all
  else if vlr = 'LT_SSLv2' then
    Result := LT_SSLv2
  else if vlr = 'LT_SSLv3' then
    Result := LT_SSLv3
  else if vlr = 'LT_TLSv1' then
    Result := LT_TLSv1
  else if vlr = 'LT_TLSv1_1' then
    Result := LT_TLSv1_1
  else if vlr = 'LT_TLSv1_2' then
    Result := LT_TLSv1_2
  else if vlr = 'LT_TLSv1_3' then
    Result := LT_TLSv1_3
  else if vlr = 'LT_SSHv2' then
    Result := LT_SSHv2
  else
    raise Exception.Create('Valor de TSSLType inválido: ' + vlr);
end;

function TModelConfNF.StringToTpcnVersaoDF(const vlr: string): TpcnVersaoDF;
begin
  if vlr = 've200' then
    Result := ve200
  else if vlr = 've300' then
    Result := ve300
  else if vlr = 've310' then
    Result := ve310
  else if vlr = 've400' then
    Result := ve400

  else
    raise Exception.Create('Valor de TpcnVersaoDF inválido: ' + vlr);
end;

Function TModelConfNF.ExisteManifesto(out chaveR, nsu, idemp:string; chave:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
  ModelSql : TModelsql;
begin
  Result    := False;
  ModelSql     :=TModelsql.Create;
  try
    try
      sqlQuery  := 'Select chave, nsu, id_empresa from nfe_manifesto where'+
                          ' chave= :chave'+
                          ' order by nsu';

      Qry       :=  ModelSql.ConsultarSQL(dm.Conn,sqlQuery,[chave]);

      if not Qry.IsEmpty then
      begin

        ChaveR    := Qry.Fieldbyname('chave').Asstring;
        nsu       := Qry.Fieldbyname('nsu').Asstring;
        idemp     := inttostr(Qry.Fieldbyname('id_empresa').Asinteger);
        Result := True;
      end;

    except
      on E: Exception do
      begin
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    Qry.Free;
    Modelsql.free;
  end;
end;

Function TModelConfNF.InsertManifesto(out msg:string;
                                      numero, chave, serie, nome, cnpj, ie, nsu,
                                      situacao,dirxml,xml,gerou,xmotivo,eventoverapli,eventotpevento,
                                      eventonprot,xmlresumo,protocolo,digval:String;
                                      valor:double;
                                      dtentrada,dtemissao:Tdate;
                                      cstat,modnfe:Integer
                                      ):Boolean;
var
Qry       : TUniquery;
sqlQuery  : string;
id        :integer;
begin
  Result  := False;
  Qry     := TUniquery.create(nil);

  Try
    FTransacao.StartTransaction;
    Qry.Connection  := dm.Conn;
    SqlQuery        := 'Insert into nfe_manifesto('+
                        'id,numero, chave, serie, nome, cnpj, ie, nsu, valor, dt_entrada,'+
                        'dt_emissao, situacao, id_empresa, id_usuario, dir_xml, xml, gerou,'+
                        'xmotivo, protocolo, digval,'+
                        'evento_verapli,evento_tpevento,'+
                        'evento_nprot, cstat, xml_resumo, modnfe)'+
                        'Values(:id, :numero, :chave, :serie, :nome, :cnpj, :ie, :nsu, :valor, :dtentrada,'+
                        ':dtemissao, :situacao, :idempresa, :idusuario, :dirxml, :xml, :gerou,'+
                        ':xmotivo, :protocolo, :digval,'+
                        ':eventoverapli, :eventotpevento,'+
                        ':eventonprot, :cstat, :xmlresumo, :modnfe)';

    With Qry do
    begin
      Close;
      Sql.clear;
      Qry.SQL.Text := sqlQuery;

      id          := GerarId('nfe_manifesto','id');

      Qry.ParamByName('id').AsInteger               := id;
      Qry.ParamByName('numero').AsString           := numero;
      Qry.ParamByName('chave').AsString            := chave;
      Qry.ParamByName('serie').AsString             := serie;
      Qry.ParamByName('nome').AsString              := nome;
      Qry.ParamByName('cnpj').AsString              := cnpj;
      Qry.ParamByName('ie').AsString                := ie;
      Qry.ParamByName('nsu').AsString               := nsu;
      Qry.ParamByName('valor').asfloat              := valor;
      Qry.ParamByName('dtentrada').AsDateTime         := dtentrada;
      Qry.ParamByName('dtemissao').AsDateTime         := dtemissao;
      Qry.ParamByName('situacao').AsString          := situacao;
      Qry.ParamByName('idempresa').asinteger         := TSession.IDEMPRESA;
      Qry.ParamByName('idusuario').asinteger         := TSession.ID_USUARIO;
      Qry.ParamByName('dirxml').AsString            := dirxml;
      Qry.ParamByName('xml').AsString               := xml;
      Qry.ParamByName('gerou').AsString             := gerou;
      Qry.ParamByName('xmotivo').AsString           := xmotivo;
      Qry.ParamByName('protocolo').AsString         := protocolo;
      Qry.ParamByName('digval').AsString            := digval;
      Qry.ParamByName('eventoverapli').AsString     := eventoverapli;
      Qry.ParamByName('eventotpevento').AsString    := eventotpevento;
      Qry.ParamByName('eventonprot').AsString       := eventonprot;
      Qry.ParamByName('cstat').asinteger            := cstat;
      Qry.ParamByName('xmlresumo').AsString         := xmlresumo;
      Qry.ParamByName('modnfe').AsInteger           := modnfe;

      ExecSql;
      msg     := 'Registro realizado com sucesso!';
      Result  := True;
      FTransacao.Commit;

    end;

  Finally
    Qry.Free;
  End;
end;

Function TModelConfNF.InsertManifestoResumo(out msg:string;
                                            numero, chave, serie, nome, cnpj, ie, nsu,
                                            xmlresumo, impresso, nfetipo, situacao, xmotivo:String;
                                            valor:double;
                                            dtentrada,dtemissao:Tdate;
                                            cstat:integer
                                            ):Boolean;
var
Qry       : TUniquery;
sqlQuery  : string;
id        :integer;
begin
  Result  := False;
  Qry     := TUniquery.create(nil);

  Try
    FTransacao.StartTransaction;
    Qry.Connection  := dm.Conn;

    SqlQuery        := 'Insert into nfe_manifesto('+
                        'id,numero, chave, serie, nome, cnpj, ie, nsu, valor, dt_entrada,'+
                        'dt_emissao, situacao, id_empresa, id_usuario,'+
                        'xml_resumo,impresso,tiponfe, xmotivo, cstat)'+
                        'Values(:id, :numero, :chave, :serie, :nome, :cnpj, :ie, :nsu, :valor, :dtentrada,'+
                        ':dtemissao, :situacao, :idempresa, :idusuario,'+
                        ':xmlresumo, :impresso, :tiponfe, :xmotivo, :cstat)';

    With Qry do
    begin
      Close;
      Sql.clear;
      Qry.SQL.Text := sqlQuery;

      id          := GerarId('nfe_manifesto','id');

      Qry.ParamByName('id').AsInteger              := id;
      Qry.ParamByName('numero').AsString           := numero;
      Qry.ParamByName('chave').AsString            := chave;
      Qry.ParamByName('serie').AsString            := serie;
      Qry.ParamByName('nome').AsString             := nome;
      Qry.ParamByName('cnpj').AsString             := cnpj;
      Qry.ParamByName('ie').AsString               := ie;
      Qry.ParamByName('nsu').AsString              := nsu;
      Qry.ParamByName('valor').asfloat             := valor;
      Qry.ParamByName('dtentrada').AsDateTime      := dtentrada;
      Qry.ParamByName('dtemissao').AsDateTime      := dtemissao;
      Qry.ParamByName('situacao').AsString         := situacao;
      Qry.ParamByName('idempresa').asinteger       := TSession.IDEMPRESA;
      Qry.ParamByName('idusuario').asinteger       := TSession.ID_USUARIO;
      Qry.ParamByName('xmlresumo').AsString        := xmlresumo;
      Qry.ParamByName('impresso').AsString         := impresso;
      Qry.ParamByName('tiponfe').AsString          := nfetipo;
      Qry.ParamByName('xmotivo').AsString          := xmotivo;
      Qry.ParamByName('cstat').AsInteger           := cstat;

      ExecSql;
      msg     := 'Registro realizado com sucesso!';
      Result  := True;
      FTransacao.Commit;
    end;

  Finally
    Qry.Free;
  End;
end;

Function TModelConfNF.UpdateNSU(out msg:string;nsu:string):Boolean;
var
Qry       : TUniquery;
sqlQuery  : string;
begin
  Result  := False;
  Qry     := TUniquery.create(nil);

  Try
    FTransacao.StartTransaction;
    Qry.Connection  := dm.Conn;
    SqlQuery        := 'UPDATE configuracao_nf  '+
                        ' SET                   '+
                        ' nfe_nsu= :nsu         '+
                        ' where id_empresa= :id';

    With Qry do
    begin
      Close;
      Sql.clear;
      Qry.SQL.Text := sqlQuery;

      Qry.ParamByName('nsu').AsString  := nsu;
      Qry.ParamByName('id').AsInteger   := TSession.IDEMPRESA;

      ExecSql;
      msg     := 'Registro atualizado com sucesso!';
      Result  := True;
      FTransacao.Commit;
    end;

  Finally
    Qry.Free;
  End;
end;

Function TModelConfNF.UpdateXML(chave, xml, impresso, xmotivo:String):Boolean;
var
Qry       : TUniquery;
sqlQuery  : string;
begin
  Result  := False;
  Qry     := TUniquery.create(nil);

  Try
    FTransacao.StartTransaction;
    Qry.Connection  := dm.Conn;
    SqlQuery        := 'UPDATE nfe_manifesto  '+
                        ' SET                   '+
                        ' xml= :xml, impresso= :impresso, xmotivo= :x '+
                        ' where id_empresa= :id and chave= :chave';

    With Qry do
    begin
      Close;
      Sql.clear;
      Qry.SQL.Text := sqlQuery;

      Qry.ParamByName('chave').AsString       := trim(chave);
      Qry.ParamByName('xml').AsString         := xml;
      Qry.ParamByName('impresso').AsString    := impresso;
      Qry.ParamByName('id').AsInteger         := TSession.IDEMPRESA;
      Qry.ParamByName('x').AsString           := xmotivo;

      ExecSql;
      Result  := True;
      FTransacao.Commit;
    end;

  Finally
    Qry.Free;
  End;
end;

Function TModelConfNF.UpdateEvento(chave, xevento, nprot, tpevento:String;
                                   dhevento, dhrecebto:tdate;
                                   segevento,orgao:Integer):Boolean;
var
Qry       : TUniquery;
sqlQuery  : string;
begin
  Result  := False;
  Qry     := TUniquery.create(nil);

  Try
    FTransacao.StartTransaction;
    Qry.Connection  := dm.Conn;
    SqlQuery        := 'UPDATE nfe_manifesto  '+
                        ' SET                   '+
                        ' evento_xevento= :1, evento_nprot= :2, evento_tpevento= :3,'+
                        ' data_evento= :4, evento_dhrecebto= :5, evento_nseqevento= :6, evento_corgao= :7 '+
                        ' where id_empresa= :id and chave= :chave';

    With Qry do
    begin
      Close;
      Sql.clear;
      Qry.SQL.Text := sqlQuery;

      Qry.ParamByName('chave').AsString       := trim(chave);
      Qry.ParamByName('1').AsString           := xevento;
      Qry.ParamByName('2').AsString           := nprot;
      Qry.ParamByName('3').AsString           := tpevento;
      Qry.ParamByName('4').AsDateTime         := dhevento;
      Qry.ParamByName('5').AsDateTime         := dhrecebto;
      Qry.ParamByName('6').asinteger          := segevento;
      Qry.ParamByName('7').asinteger          := orgao;
      Qry.ParamByName('id').AsInteger         := TSession.IDEMPRESA;

      ExecSql;
      Result  := True;
      FTransacao.Commit;
    end;

  Finally
    Qry.Free;
  End;
end;


{$REGION 'Manifesto'}

Function TModelConfNF.LocalizarDFe(out msg: string;
                                  TabStatus, TabNota, Filtro:Integer;
                                  dtini,dtfim:tdate;
                                  campo:string
                                  ): Boolean;
var
  Qry     :TUniquery;
  sqlQuery, filtroQuery: string;
  FiltroStatus, FiltroNota, Filtrodate:string;

begin
  //Pesquisa de pedido

  Result                := False;
  FiltroStatus          := '';
  Filtrodate            := '';
  FiltroNota            := '';

  Qry                   := TUniQuery.Create(nil);
  try
    try
      Qry.Connection    := dm.Conn;

      sqlQuery          := 'Select                                '+
                            ' nf.id as id,                        '+
                            ' nf.numero as numero,                '+
                            ' nf.chave as chave,                  '+
                            ' nf.serie as serie,                  '+
                            ' nf.nome as nome,                   '+
                            ' nf.cnpj as cnpj,                    '+
                            ' nf.nsu as nsu,                      '+
                            ' Coalesce(nf.valor,0) as valor,    '+
                            ' nf.dt_entrada as dtentrada,         '+
                            ' nf.dt_emissao as dtemissao,         '+
                            ' nf.situacao as situacao,            '+
                            ' nf.xml as nxml                      '+
                            ' From nfe_manifesto nf where nf.id>0'   ;

      case TabStatus of
        1: FiltroStatus := ' and nf.situacao= ''Não Manifestado'' ';
        2: FiltroStatus := ' and nf.situacao= ''Confirmação da Operação'' ';
        3: FiltroStatus := ' and nf.situacao= ''Ciência da Operação'' ';
        4: FiltroStatus := ' and nf.situacao= ''Desconhecimento da Operação'' ';
        5: FiltroStatus := ' and nf.situacao= ''Operação Não Realizada'' ';
      end;

      case Filtro of
        0:Filtrodate    := ' and nf.dt_emissao between :x and :y ';
        1:Filtrodate    := ' and nf.dt_entrada between :x and :y ';
        2:Filtrodate    := ' and nf.data_evento between :x and :y ';
      end;



      if Campo <> '' then
      begin
        filtroQuery     := ' and (nf.numero like :Filtro or '+
                                 ' nf.cnpj like :filtro or'+
                                 ' nf.nome like :filtro or'+
                                 ' nf.chave like :filtro)';

        sqlQuery  := sqlQuery + FiltroStatus + Filtrodate + filtroQuery;
      end
      else

      sqlQuery  := sqlQuery + FiltroStatus + Filtrodate;

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := SqlQuery;

      if Campo <> '' then
      qry.ParamByName('filtro').Value := '%' + campo + '%';

      qry.ParamByName('x').AsDateTime := dtini;
      qry.ParamByName('y').AsDateTime := dtfim;

      Qry.Open;
      Qry.First;

      if not Qry.IsEmpty then
      begin
        //criar campo na tebela temporaria

        if dm.TabManifesto.Active then
        begin
          dm.TabManifesto.EmptyDataSet;
        end;

        dm.TabManifesto.DisableControls;

        while not Qry.Eof do
        begin
          dm.TabManifesto.Append;

          dm.TabManifesto.FieldByName('id').Value      :=  Qry.FieldByName('id').Value;
          dm.TabManifesto.FieldByName('numero').Value     :=  Qry.FieldByName('numero').Value;
          dm.TabManifesto.FieldByName('chave').Value          :=  Qry.FieldByName('chave').Value;
          dm.TabManifesto.FieldByName('serie').Value          :=  Qry.FieldByName('serie').Value;
          dm.TabManifesto.FieldByName('nome').Value        :=  Qry.FieldByName('nome').Value;
          dm.TabManifesto.FieldByName('cnpj').Value        :=  Qry.FieldByName('cnpj').Value;
          dm.TabManifesto.FieldByName('nsu').Value           :=  Qry.FieldByName('nsu').Value;
          dm.TabManifesto.FieldByName('valor').Value         :=  Qry.FieldByName('valor').Value;
          dm.TabManifesto.FieldByName('dt_entrada').Value      :=  Qry.FieldByName('dtentrada').Value;
          dm.TabManifesto.FieldByName('dt_emissao').Value    :=  Qry.FieldByName('dtemissao').Value;
          dm.TabManifesto.FieldByName('situacao').Value       :=  Qry.FieldByName('situacao').Value;
          dm.TabManifesto.FieldByName('xml').Value     :=  Qry.FieldByName('nxml').Value;

          dm.TabManifesto.Post;
          Qry.Next;
        end;

        dm.TabManifesto.EnableControls;
        dm.TabManifesto.First;
        msg := 'Consulta realizada com sucesso';
        Result := True;
      end
      else
      begin
        dm.TabManifesto.Close;
        msg := 'Nenhum registro encontrado!';
      end;
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

{$ENDREGION}


Function TModelConfNF.OneRamoEmpresa(out oneAssociacao, oneSindicado, oneGaragem,
                                    onePedido, oneLocacao, oneEstoque, oneOrdemServico:string;id:integer):Boolean;
var
Sqlstr:string;
Qry   :TUniquery;
Model :TModelSQL;
begin
  //Tudo que envolve a habilitar o menu principal
  Result    := False;
  Model     := TModelSQL.Create;
                         


  Try
    Sqlstr  := 'Select sistema_associacao, sistema_sindicato, sistema_garagem, '+
                'sistema_pedido,sistema_locacao, moduloestoque, utilizarordemservico from configuracao_nf where id_empresa= :id';

    Qry     := Model.ConsultarSQL(dm.Conn,Sqlstr,[id]);

    Try
      if not Qry.IsEmpty then
      begin
        oneAssociacao := Qry.FieldByName('sistema_associacao').AsString;
        oneSindicado  := Qry.FieldByName('sistema_sindicato').AsString;
        oneGaragem    := Qry.FieldByName('sistema_garagem').AsString;
        onePedido     := Qry.FieldByName('sistema_pedido').AsString;
        oneLocacao    := Qry.FieldByName('sistema_locacao').AsString;
        oneEstoque    := Qry.FieldByName('moduloestoque').AsString;
        oneOrdemServico :=  Qry.FieldByName('utilizarordemservico').AsString;
        Result        := True;
      end;

    Finally
      Qry.Free;
    End;

  Finally
    Model.Free;
  End;
end;


end.
