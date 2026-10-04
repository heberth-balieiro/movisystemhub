unit UDMRelatorio;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient;

type
  TDMRelatorio = class(TDataModule)
    ClientPedido: TClientDataSet;
    ClientPedidoItens: TClientDataSet;
    RelListagemAptos: TClientDataSet;
    RelListagemAptoscodigo: TIntegerField;
    RelListagemAptosmatricula: TIntegerField;
    RelListagemAptosnome: TStringField;
    RelListagemAptosrazao: TStringField;
    RelListagemAptoscpf: TStringField;
    RelListagemVotantes: TClientDataSet;
    RelListagemVotantescodigo: TIntegerField;
    RelListagemVotantesmatricula: TIntegerField;
    RelListagemVotantesnome: TStringField;
    RelListagemVotantescpf: TStringField;
    RelListagemVotantesrg: TStringField;
    RelListagemVotantesorgao: TStringField;
    RelListagemVotantesordem: TIntegerField;
    RelListagemVotantesip: TStringField;
    RelListagemVotanteschave: TStringField;
    RelListagemVotantesdata: TDateField;
    RelListagemVotanteshora: TTimeField;
    RelCabechalhoVotantes: TClientDataSet;
    RelCabechalhoVotantesdescricao: TStringField;
    RelCabechalhoVotantesnome: TStringField;
    RelCabechalhoVotantesdata_ini: TDateField;
    RelCabechalhoVotanteshora_ini: TTimeField;
    RelCabechalhoVotantesdata_final: TDateField;
    RelCabechalhoVotanteshora_final: TTimeField;
    RelListagemNaoVotantes: TClientDataSet;
    RelListagemNaoVotantescodigo: TIntegerField;
    RelListagemNaoVotantesmatricula: TIntegerField;
    RelListagemNaoVotantesnome: TStringField;
    RelListagemNaoVotantescpf: TStringField;
    RelListagemNaoVotantesrg: TStringField;
    RelListagemNaoVotantesorgao: TStringField;
    RelListagemNaoVotantesemail: TStringField;
    RelListagemPessoa: TClientDataSet;
    RelATA: TClientDataSet;
    RelATAqtde_votantes: TIntegerField;
    RelATAqtde_votantes_chapa1: TIntegerField;
    RelATAqtde_votantes_branco: TIntegerField;
    RelATAid_chapa: TIntegerField;
    RelATApessoa: TStringField;
    RelATAnchapa: TStringField;
    RelATAqtde_votos: TIntegerField;
    RelATAvotantesstr: TStringField;
    RelATAchapastr: TStringField;
    RelATAbrancostr: TStringField;
    RelATAvotosstr: TStringField;
    RelImpressaoTicket: TClientDataSet;
    RelImpressaoTicketid_ticket: TIntegerField;
    RelImpressaoTicketvalor: TFloatField;
    RelImpressaoTicketvalor_real: TStringField;
    RelImpressaoTicketcodigointerno: TIntegerField;
    RelImpressaoTicketmatricula: TIntegerField;
    RelImpressaoTicketsecretaria: TStringField;
    RelImpressaoTicketdataemissao: TDateField;
    RelImpressaoTicketmesdesconto: TStringField;
    RelImpressaoTicketmespagamento: TStringField;
    RelImpressaoTicketfornecedor: TStringField;
    RelImpressaoTicketcodigo_ticket: TIntegerField;
    RelImpressaoTicketassociado: TStringField;
    RelImpressaoTicketnmusuario: TStringField;
    RelTicket: TClientDataSet;
    RelTicketTotalizado: TClientDataSet;
    RelTicketid_ticket: TIntegerField;
    RelTicketdtemissao: TDateField;
    RelTicketnumeroticket: TIntegerField;
    RelTicketdtdesconto: TDateField;
    RelTicketdtpagamento: TDateField;
    RelTicketvlrticket: TFloatField;
    RelTicketsituacao: TStringField;
    RelTicketobs: TStringField;
    RelTicketassnome: TStringField;
    RelTicketassmatricula: TIntegerField;
    RelTicketasscodigo: TIntegerField;
    RelTicketconnome: TStringField;
    RelTicketsecnome: TStringField;
    RelTicketTotalizadoasscodigo: TIntegerField;
    RelTicketTotalizadoassmatricula: TIntegerField;
    RelTicketTotalizadoassnome: TStringField;
    RelTicketTotalizadosecnome: TStringField;
    RelTicketTotalizadototal: TFloatField;
    RelTicketTotalizadoconnome: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRelatorio: TDMRelatorio;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
