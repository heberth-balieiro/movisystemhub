unit Model.Avisos;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TModelAvisos = Class

  Private

  Public
    Function AvisoDependente18Anos():Boolean;

  End;


implementation

{ TModelAvisos }

uses UConeSul;

function TModelAvisos.AvisoDependente18Anos: Boolean;
var
Qry :Tuniquery;
QrySTR:string;
begin
  Result  := false;   //buscar no mes
  QrySTR  := 'SELECT sd.id_dependente, sd.codigo, sd.nome, sd.nascimento, sd.cpf, s.matricula, s.nome as nmsocio  '+
             ' FROM sindicato_dependente sd                                       '+
             ' inner join socio s                                               '+
             ' on sd.id_socio = s.id_socio'+
             ' WHERE MONTH(sd.nascimento) = MONTH(DATE_SUB(CURDATE(), INTERVAL 18 YEAR))  '+
             ' AND YEAR(sd.nascimento) = YEAR(DATE_SUB(CURDATE(), INTERVAL 18 YEAR))'+
             ' and sd.ativo=''S'' and s.situacao=''ATIVO'' '+
             '';

             {SELECT *   busca no dia
FROM dependente
WHERE DATE_FORMAT(data_nascimento, '%Y-%m-%d') = DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 18 YEAR), '%Y-%m-%d');
}


  Qry     := TUniquery.Create(nil);

  Try
    Try
      Qry.Connection      := dm.Conn;
      Qry.SQL.Text        := QrySTR;
      Qry.Open;

      if dm.AvisoDependente18.Active then
        dm.AvisoDependente18.EmptyDataSet
      else
        dm.AvisoDependente18.Open;


      if not qry.Eof then
      begin
        while not Qry.Eof do
        begin
          dm.AvisoDependente18.Append;

          dm.AvisoDependente18id_dependente.AsInteger     := Qry.FieldByName('id_dependente').AsInteger;
          dm.AvisoDependente18codigo.AsInteger            := Qry.FieldByName('codigo').AsInteger;
          dm.AvisoDependente18nome.AsString               := Qry.FieldByName('nome').AsString;
          dm.AvisoDependente18nascimento.AsDateTime       := Qry.FieldByName('nascimento').AsDateTime;
          dm.AvisoDependente18cpf.AsString                := Tconesul.AplicarMascaraCPF(Qry.FieldByName('cpf').AsString);
          dm.AvisoDependente18matricula.AsInteger         := Qry.FieldByName('matricula').AsInteger;
          dm.AvisoDependente18nmsocio.AsString            := Qry.FieldByName('nmsocio').AsString;
          dm.AvisoDependente18.Post;

          Qry.Next;
        end;

        Result  := not dm.AvisoDependente18.IsEmpty;

      end;

      Qry.Close;

    Except on e:exception do
      begin
        raise Exception.Create('Erro ao consulta dependente:'+e.Message);
      end;
    End;
  Finally
    FreeAndNil(Qry);
  End;


end;

end.
