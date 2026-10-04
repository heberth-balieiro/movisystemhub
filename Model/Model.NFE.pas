unit Model.NFE;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient,
  Model.SQLQry;

Type
  TModelNFE = Class

  Private

  Public

  Function ValidacoesPessoa(out msg:String; idpessoa:integer;ConsFinal:String):Boolean; //Validar tipo da pessoa e IE
  Procedure DadosCombustivel(Codigo: Integer; out pGLP, pGnn, pGNi, vPart: Extended); //carregar dados de combustivel do produto
  End;

implementation

{ TModelNFE }

procedure TModelNFE.DadosCombustivel(Codigo: Integer; out pGLP, pGnn, pGNi,
  vPart: Extended);
var
ModelSql  :TModelSQL;
StrQry    :String;
Qry       :TUniquery;
begin
  ModelSql  := TModelSQL.Create;
  pGLP      := 0;
  pGnn      := 0;
  pGNi      := 0;
  vPart     := 0;
  StrQry    := 'select p.glp, p.gnn, p.gni, p.peso_liq from produto p where p.codigo= :id';

  Try
    Try
      Qry   := ModelSql.ConsultarSQL(DM.Conn,StrQry,[Codigo]);

      Try
        if not qry.IsEmpty then
        begin

        end;

      Finally
        Qry.Free;
      End;

    Except on e:exception do
      raise Exception.Create('Error: '+e.Message);
    End;
  Finally
    ModelSql.Free;
  End;
end;

function TModelNFE.ValidacoesPessoa(out msg: String; idpessoa: integer;ConsFinal:String): Boolean;
var
ModelSql  :TModelSQL;
StrQry    :String;
Qry       :TUniquery;
begin
  Result    := True;
  ModelSql  := TModelSQL.Create;

  StrQry    := 'Select codigo, cli_tipo, tipocontribuinte, rg from socio where id_socio= :id';

  Try
    Try
      Qry   := ModelSql.ConsultarSQL(DM.Conn,StrQry,[idpessoa]);

      Try
        if not qry.IsEmpty then
        begin
          if qry.FieldByName('cli_tipo').AsString = 'JURÍDICA' then
          begin
            if Trim(qry.FieldByName('rg').AsString) = EmptyStr then
            begin
              msg :='Destinatario Sem Inscrição Estadual!';
              Result  :=  False;
              Exit;
            end
            else
            begin
              try
                if qry.FieldByName('rg').AsInteger <> 0 then
                begin
                  msg :='Destinatario não cadastrado como Contribuinte!';
                  Result  :=  False;
                  Exit;
                end;
              except
                msg :='Informação de Contribuinte invalida! Por Favor verificar no cadastro do Contribuinte!';
                Result  :=  False;
              end;
            end;
          end
          else
          if qry.FieldByName('tipo').AsString = 'FÍSICA' then
          begin
            if ConsFinal <> 'S' then
            begin
              msg:='Destinatario está como Consumidor Final!';
              Result  :=  False;
              Exit;
            end;
          end;
        end;
      Finally
        Qry.Free;
      End;

    Except on e:exception do
      raise Exception.Create('Error: '+e.Message);
    End;
  Finally
    ModelSql.Free;
  End;

end;




{


var
ModelSql  :TModelSQL;
StrQry    :String;
Qry       :TUniquery;
begin
  ModelSql  := TModelSQL.Create;

  StrQry    := '';

  Try
    Try
      Qry   := ModelSql.ConsultarSQL(StrQry,[Codigo]);

      Try
        if not qry.IsEmpty then
        begin

        end;

      Finally
        Qry.Free;
      End;

    Except on e:exception do
      raise Exception.Create('Error: '+e.Message);
    End;
  Finally
    ModelSql.Free;
  End;


}
end.
