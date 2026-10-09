unit DAO.AssociadoAtualizacaoAPI;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient,
  Model.AssociadoAtualizarAPI;

Type
  TDaoAssociadoAtualizacao = Class

  Private

  public
    class function BuscarAssociadoVinculo(ADoc: TAssociadoDadosAtuais; Const AMatricula, AIDEmpresa: Integer; Const ACPF:string): Boolean;
    //Class Function Delete(const AIDRegistro: integer; const AIDUser: Integer; const AIDEmpresa: integer):Boolean;
    //Class Function ExisteNome(const AStr: String; const AIDEmpresa: Integer =0; const AIDIgnorar:integer = 0):Boolean;
    //Class Function PossuiVinculo(const AIDRegistro:Integer):boolean;
  End;

implementation

{ TDaoAssociadoAtualizacao }

class function TDaoAssociadoAtualizacao.BuscarAssociadoVinculo(
  ADoc: TAssociadoDadosAtuais;
  const AMatricula, AIDEmpresa: Integer;
  const ACPF: string): Boolean;
var
  Qry: TUniQuery;
const
  QryStr =
    'SELECT ' +
    ' s.id_socio, ' +
    ' s.codigo, ' +
    ' s.matricula, ' +
    ' s.situacao, ' +
    ' s.nome, ' +
    ' s.apelido, ' +
    ' s.cep, ' +
    ' s.endereco, ' +
    ' s.numero, ' +
    ' s.bairro, ' +
    ' s.complemento, ' +
    ' s.celular, ' +
    ' s.whatsapp, ' +
    ' s.cpf, ' +
    ' s.email, ' +
    ' c.cidade '+
    ' FROM socio s ' +
    ' inner join cidade c '+
    ' on s.id_cidade = c.id_cidade  '+
    ' WHERE 1 = 1 ' +
    ' AND s.id_empresa = :id_empresa ' +
    ' AND s.situacao IN (''ATIVO'', ''S'') ';
begin
  Result := False;

  { Evita buscar qualquer associado caso não tenha identificação }
  if (AMatricula <= 0) and (Trim(ACPF) = '') then
    Exit;

  if not Assigned(ADoc) then
    Exit;

  if AIDEmpresa <= 0 then
    Exit;

  if AMatricula <= 0 then
    Exit;

  if Trim(ACPF) = '' then
    Exit;




  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection  := dm.Conn;
    Qry.SQL.Text    := QryStr;

    Qry.ParamByName('id_empresa').AsInteger := AIDEmpresa;

    if AMatricula > 0 then
    begin
      Qry.SQL.Add(' AND s.matricula = :AMatricula ');
      Qry.ParamByName('AMatricula').AsInteger := AMatricula;
    end;

    if Trim(ACPF) <> '' then
    begin
      Qry.SQL.Add(' AND s.cpf = :ACPF ');
      Qry.ParamByName('ACPF').AsString := Trim(ACPF);
    end;

    Qry.SQL.Add(' LIMIT 1');

    Qry.Open;

    if Qry.IsEmpty then
      Exit;

    ADoc.Id_Socio           := Qry.FieldByName('id_socio').AsInteger;
    ADoc.Email_Atual        := Qry.FieldByName('email').AsString;
    ADoc.Celular_Atual      := Qry.FieldByName('celular').AsString;
    ADoc.Whatsapp_Atual     := Qry.FieldByName('whatsapp').AsString;
    ADoc.Cep_Atual          := Qry.FieldByName('cep').AsString;
    ADoc.Endereco_Atual     := Qry.FieldByName('endereco').AsString;
    ADoc.Numero_Atual       := Qry.FieldByName('numero').AsString;
    ADoc.Bairro_Atual       := Qry.FieldByName('bairro').AsString;
    ADoc.Complemento_Atual  := Qry.FieldByName('complemento').AsString;
    ADoc.Situacao_Atual     := Qry.FieldByName('situacao').AsString;
    Adoc.cidade_atual       := Qry.FieldByName('cidade').AsString;
    Result := True;

  finally
    Qry.Free;
  end;
end;

end.
