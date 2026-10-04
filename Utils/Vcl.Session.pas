unit Vcl.Session;

interface

type
  TSession = class
  private
    class var FID_USUARIO     : integer;
    class var FEMAIL          : string;
    class var FNOME           : string;
    class var Fidempresa      : integer;
    class var Frazao          : String;
    class var Ftipoatividade  : integer;
    class var Fversaosys      : string;
    class var Flocalsys       : string;
    class var FoneSindicado   : String;
    class var FoneLocacao     : String;
    class var FoneGaragem     : String;
    class var FonePedido      : String;
    class var FoneAssociacao  : String;
    class var FoneEstoque: String;
    class var Fidperfiluser: integer;
    class var FoneOrdemServico: String;

  public
     class property ID_USUARIO    : integer read  FID_USUARIO     write FID_USUARIO;
     class property EMAIL         : string  read  FEMAIL          write FEMAIL;
     class property NOME          : string  read  FNOME           write FNOME;
     class property IDEMPRESA     : integer read  Fidempresa      write Fidempresa;
     class property RAZAO         : String  read  Frazao          write Frazao;
     class property tipoatividade : integer read  Ftipoatividade  write Ftipoatividade;
     class property versaosys     : string  read  Fversaosys      write Fversaosys;
     class property localsys      : string  read  Flocalsys       write Flocalsys;
     class property idperfiluser  : integer read  Fidperfiluser   write Fidperfiluser;

     //Ramo da atividade ativado fazer logof para aceitar as configuracoes
     class property oneAssociacao : String  read  FoneAssociacao  write FoneAssociacao;
     class property oneSindicado  : String  read  FoneSindicado   write FoneSindicado;
     class property oneGaragem    : String  read  FoneGaragem     write FoneGaragem;
     class property onePedido     : String  read  FonePedido      write FonePedido;
     class property oneLocacao    : String  read  FoneLocacao     write FoneLocacao;
     class property oneEstoque    : String  read  FoneEstoque     write FoneEstoque;
     class property oneOrdemServico    : String  read  FoneOrdemServico     write FoneOrdemServico;

  end;

implementation

initialization
  TSession.Fidperfiluser := 1;
  TSession.FID_USUARIO   :=1;

end.
