unit Model.Ticket;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;
type
  [TableName('TICKET')]
  TTicket = class
  private
    Fdatasoli: Tdate;
    Fdatadesconto: TDate;
    Fidticket: Integer;
    Fidempresa: Integer;
    Fdatapagamentoreal: TDate;
    Fidticketpai: integer;
    Fidusuarioins: Integer;
    Fmotivo: string;
    Fhorasoli: TTime;
    Fvlrpago: Double;
    Fanotacoes: string;
    Fcodigo: Integer;
    Fidusuariosoli: integer;
    Fidusuarioaut: Integer;
    Fdatapagamento: TDate;
    Fdatacancelamento: TDate;
    Fdataticket: TDate;
    Fidconvenio: Integer;
    Fobsbaixa: string;
    Fhorabaixa: TTime;
    Fobscancelamento: string;
    Fsituacao: string;
    Fvalorticket: Double;
    Fidusuariobaixa: integer;
    Fhoracancelamento: TTime;
    Fidsocio: Integer;
    Ftipo: string;
    Fcodigolote: integer;
    Fidusuariocan: Integer;

  public
    [FieldName('id_ticket', True)]
    [FieldOptions([foInsert, foSelect])]
    property idticket         : Integer   read Fidticket          write Fidticket;

    [FieldName('id_socio')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property idsocio          : Integer   read Fidsocio           write Fidsocio;

    [FieldName('id_convenio')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property idconvenio       : Integer   read Fidconvenio        write Fidconvenio;

    [FieldName('valor_ticket')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property valorticket      : Double    read Fvalorticket       write Fvalorticket;

    [FieldName('data_ticket')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property dataticket       : TDate     read Fdataticket        write Fdataticket;

    [FieldName('data_desconto')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property datadesconto     : TDate     read Fdatadesconto      write Fdatadesconto;

    [FieldName('data_pagamento')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property datapagamento    : TDate     read Fdatapagamento     write Fdatapagamento;

    [FieldName('id_usuario_ins')]
    [FieldOptions([foInsert,foSelect])]
    property idusuarioins     : Integer   read Fidusuarioins      write Fidusuarioins;

    [FieldName('id_usuario_aut')]
    [FieldOptions([foUpdate, foSelect])]
    property idusuarioaut     : Integer   read Fidusuarioaut      write Fidusuarioaut;

    [FieldName('anotacoes')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property anotacoes        : string    read Fanotacoes         write Fanotacoes;

    [FieldName('situacao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property situacao         : string    read Fsituacao          write Fsituacao;

    [FieldName('data_pagamento_real')]
    [FieldOptions([foUpdate, foSelect])]
    property datapagamentoreal: TDate     read Fdatapagamentoreal write Fdatapagamentoreal;

    [FieldName('data_cancelamento')]
    [FieldOptions([foUpdate, foSelect])]
    property datacancelamento : TDate     read Fdatacancelamento  write Fdatacancelamento;

    [FieldName('hora_cancelamento')]
    [FieldOptions([foUpdate, foSelect])]
    property horacancelamento : TTime     read Fhoracancelamento  write Fhoracancelamento;

    [FieldName('id_usuario_can')]
    [FieldOptions([foUpdate, foSelect])]
    property idusuariocan     : Integer   read Fidusuariocan      write Fidusuariocan;

    [FieldName('obs_cancelamento')]
    [FieldOptions([foUpdate, foSelect])]
    property obscancelamento  : string    read Fobscancelamento   write Fobscancelamento;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert,foSelect])]
    property idempresa        : Integer   read Fidempresa         write Fidempresa;

    [FieldName('codigo')]
    [FieldOptions([foInsert,foSelect])]
    property codigo           : Integer   read Fcodigo            write Fcodigo;

    [FieldName('codigolote')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property codigolote       : integer   read Fcodigolote        write Fcodigolote;

    [FieldName('id_usuario_soli')]
    [FieldOptions([foUpdate, foSelect])]
    property idusuariosoli    : integer   read Fidusuariosoli     write Fidusuariosoli;

    [FieldName('data_soli')]
    [FieldOptions([foUpdate, foSelect])]
    property datasoli         : Tdate     read Fdatasoli          write Fdatasoli;

    [FieldName('motivo')]
    [FieldOptions([foUpdate, foSelect])]
    property motivo           : string    read Fmotivo            write Fmotivo;

    [FieldName('hora_soli')]
    [FieldOptions([foUpdate, foSelect])]
    property horasoli         : TTime     read Fhorasoli          write Fhorasoli;

    [FieldName('obs_baixa')]
    [FieldOptions([foUpdate, foSelect])]
    property obsbaixa         : string    read Fobsbaixa          write Fobsbaixa;

    [FieldName('vlrpago')]
    [FieldOptions([foUpdate, foSelect])]
    property vlrpago          : Double    read Fvlrpago           write FvlrPago;

    [FieldName('id_ticketpai')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property idticketpai      : integer   read Fidticketpai       write Fidticketpai;

    [FieldName('hora_baixa')]
    [FieldOptions([foUpdate, foSelect])]
    property horabaixa        : TTime     read Fhorabaixa         write Fhorabaixa;

    [FieldName('id_usuario_baixa')]
    [FieldOptions([foUpdate, foSelect])]
    property idusuariobaixa   : integer   read Fidusuariobaixa    write Fidusuariobaixa;

    [FieldName('tipo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property tipo             : string    read Ftipo              write Ftipo;

  end;

implementation

end.
