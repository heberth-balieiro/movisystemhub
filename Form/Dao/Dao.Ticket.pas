unit Dao.Ticket;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  UDMRelatorio,
  data.DB,
  datasnap.dbclient,
  UConeSul;

Type
  TDaoTicket = Class
  Private
  public
    Class Function Delete(AID, AIDUser:Integer):Boolean;
    Class Function ImpressaoTicket(AID,IDAssociado:integer):Boolean;
  End;

implementation

{ TDaoTicket }

class function TDaoTicket.Delete(AID, AIDUser: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = '';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;
      Qry.ParamByName('').AsInteger := AID;
      Qry.ExecSQL;
      Result          := true;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao na função de Delete:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

class function TDaoTicket.ImpressaoTicket(AID, IDAssociado: integer): Boolean;
var
  Qry         : TUniquery;
  SqlQuery    : string;
  Sqlparams   : String;
begin
  Result      := False;
  SqlQuery    := '';
  sqlQuery    := 'Select                                          '+
                  ' t.id_ticket,                                  '+
                  ' t.data_ticket,                                '+
                  ' t.codigo as codticket,                        '+
                  ' t.data_desconto,                              '+
                  ' t.data_pagamento,                             '+
                  ' Coalesce(t.valor_ticket,0) as valor_ticket,   '+
                  ' s.nome as nmassociado,                        '+
                  ' s.matricula,                                  '+
                  ' s.codigo as codassociado,                     '+
                  ' c.nome as nmconvenio,                         '+
                  ' sc.razao as nmsecretaria,                     '+
                  ' u.nome as nmusuario                           '+
                  ' from ticket t                                 '+
                  ' inner join convenio c                         '+
                  ' on t.id_convenio = c.id_convenio              '+
                  ' inner join socio s                            '+
                  ' on t.id_socio = s.id_socio                    '+
                  ' inner join secretaria sc                      '+
                  ' on s.escritorio = sc.id_secretaria            '+
                  ' inner join usuario u                          '+
                  ' on t.id_usuario_ins = u.id_usuario';

  Try
    if IDAssociado = 0 then
    Sqlparams       := ' where t.id_ticket= :cod'
    else
    Sqlparams       := ' where t.codigolote= :cod and t.id_socio= :idass';

    Qry         := TUniquery.Create(nil);

    Try
      Qry.Connection    := dm.Conn;
      qry.Params.Clear;
      Qry.SQL.Text      := Sqlquery + sqlparams;

      Qry.Params.ParamByName('cod').AsInteger      := AID;
      if IDAssociado > 0 then
      Qry.Params.ParamByName('idass').AsInteger    := IDAssociado;

      Qry.Open;
      Qry.First;

      if dmRelatorio.RelImpressaoTicket.Active then
      begin
        dmRelatorio.RelImpressaoTicket.EmptyDataSet;
      end
      else
      begin
        dmRelatorio.RelImpressaoTicket.Open;
        if dmRelatorio.RelImpressaoTicket.RecordCount >0 then
        dmRelatorio.RelImpressaoTicket.EmptyDataSet;
      end;

      while not qry.Eof do
      begin
        Result  := true;
        dmRelatorio.RelImpressaoTicket.Append;

        dmRelatorio.RelImpressaoTicketid_ticket.asinteger	  := Qry.FieldByName('id_ticket').AsInteger;
        dmRelatorio.RelImpressaoTicketvalor.asfloat         := Qry.FieldByName('valor_ticket').AsFloat;
        dmRelatorio.RelImpressaoTicketvalor_real.asstring   := TConeSul.valorPorExtenso(Qry.FieldByName('valor_ticket').AsFloat);
        dmRelatorio.RelImpressaoTicketcodigointerno.asinteger := Qry.FieldByName('codassociado').AsInteger;
        dmRelatorio.RelImpressaoTicketmatricula.asinteger   := Qry.FieldByName('matricula').AsInteger;
        dmRelatorio.RelImpressaoTicketsecretaria.asstring   := Qry.FieldByName('nmsecretaria').AsString;
        dmRelatorio.RelImpressaoTicketdataemissao.asdatetime:= Qry.FieldByName('data_ticket').AsDateTime;

        dmRelatorio.RelImpressaoTicketmesdesconto.asstring  := TConeSul.MesAnoFormatado(Qry.FieldByName('data_desconto').AsDateTime);
        dmRelatorio.RelImpressaoTicketmespagamento.asstring := TConeSul.MesAnoFormatado(Qry.FieldByName('data_pagamento').AsDateTime);
        dmRelatorio.RelImpressaoTicketfornecedor.asstring   := Qry.FieldByName('nmconvenio').AsString;
        dmRelatorio.RelImpressaoTicketcodigo_ticket.asinteger	:= Qry.FieldByName('codticket').AsInteger;
        dmRelatorio.RelImpressaoTicketassociado.asstring    := Qry.FieldByName('nmassociado').AsString;

        dmRelatorio.RelImpressaoTicketnmusuario.asstring    := Qry.FieldByName('nmusuario').AsString;

        dmRelatorio.RelImpressaoTicket.Post;
        Qry.Next;
      end;

        Qry.Close;


    Finally
      FreeAndNil(Qry);
    End;

  Except on e:exception do
    begin
      raise Exception.Create(e.Message);
    end;
  End;
end;

end.
