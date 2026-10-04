unit Dao.PlanoContas;

{
    exemplo de uso
// Novo nível 1
  NovoCodigo := GetNextPlanoContasCodigo(FDConnection1, '');
  // Ex: 3
  // Novo filho de 2
  NovoCodigo := GetNextPlanoContasCodigo(FDConnection1, '2');
  // Ex: 2.03
  // Novo filho de 2.01
  NovoCodigo := GetNextPlanoContasCodigo(FDConnection1, '2.01');
  // Ex: 2.01.005


  validacao
  if NivelPai >= 5 then
  raise Exception.Create('Não é permitido cadastrar contas acima do nível 5.');

  if ContaPaiAceitaLancamento = 'S' then
  raise Exception.Create('Não é permitido criar filho para uma conta analítica.');


}


interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TDaoPlanoContas = Class

  Private

  public
    Class Function ValidarRegistroFilho(Const AID:integer):Boolean;
    Class Function Delete(AID,AIDUser:Integer):Boolean;
    Class function GetNextPlanoContasCodigo(const ACodigoPai: string; const ATipo: string): string;
    Class function GetNextPlanoContasCodigoByPai(AIdPai: Integer;const ATipo: string): string;
  End;

implementation

{ TDaoPlanoContas }

class function TDaoPlanoContas.Delete(AID,AIDUser: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Update planoconta set excluido= 1, ativo=''N'', data_excluido= :dt, id_usuario_exc= :iduser where id_planoconta= :id';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection  := dm.conn;
      Qry.SQL.Text    := QryStr;
      Qry.ParamByName('id').AsInteger     := AID;
      Qry.ParamByName('dt').AsDateTime    := now;
      Qry.ParamByName('iduser').AsInteger := AIDUser;
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

function PadSegment(const AValue, ALevel: Integer): string;
begin
  // Nível 1 sem zeros à esquerda
  if ALevel = 1 then
    Result := IntToStr(AValue)
  else if ALevel = 2 then
    Result := Format('%.2d', [AValue])   // 01, 02, 03...
  else
    Result := Format('%.3d', [AValue]);  // 001, 002, 003...
end;

class function TDaoPlanoContas.GetNextPlanoContasCodigo(const ACodigoPai: string; const ATipo: string): string;
var
  Qry: TUniQuery;
  SqlText: string;
  UltimoCodigo: string;
  NovoNumero: Integer;
  UltimoBloco: string;
  NivelNovo: Integer;
begin
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection  := dm.conn;
    // Sem pai = gera nível 1
    if Trim(ACodigoPai) = '' then
    begin
      if SameText(ATipo, 'R') then
        Exit('1')
      else if SameText(ATipo, 'D') then
        Exit('2')
      else
        raise Exception.Create('Tipo inválido para gerar código raiz.');
//      SqlText :=
//        'SELECT MAX(codigo) as codigo ' +
//        'FROM planoconta ' +
//        'WHERE ID_PAI IS NULL';
//
//      Qry.SQL.Text := SqlText;
//      Qry.Open;
//
//      UltimoCodigo := Trim(Qry.FieldByName('codigo').AsString);
//
//      if UltimoCodigo = '' then
//        NovoNumero := 1
//      else
//        NovoNumero := StrToIntDef(UltimoCodigo, 0) + 1;
//
//      Result := IntToStr(NovoNumero);
//      Exit;
    end;
    // Com pai = gera próximo filho direto
    NivelNovo := Length(ACodigoPai) - Length(StringReplace(ACodigoPai, '.', '', [rfReplaceAll])) + 2;
    Qry.SQL.Text :=
      'SELECT MAX(CODIGO) AS CODIGO ' +
      'FROM PLANOCONTA ' +
      'WHERE CODIGO LIKE :P_CODIGO_PAI' +
      '  AND NIVEL = :P_NIVEL';
    Qry.ParamByName('P_CODIGO_PAI').AsString  := ACodigoPai + '.%';
    Qry.ParamByName('P_NIVEL').AsInteger      := NivelNovo;
    Qry.Open;
    UltimoCodigo    := Trim(Qry.FieldByName('CODIGO').AsString);
    if UltimoCodigo = '' then
      NovoNumero := 1
    else
    begin
      UltimoBloco := Copy(
        UltimoCodigo,
        LastDelimiter('.', UltimoCodigo) + 1,
        MaxInt
      );
      NovoNumero := StrToIntDef(UltimoBloco, 0) + 1;
    end;
    Result := ACodigoPai + '.' + PadSegment(NovoNumero, NivelNovo);
  finally
    Qry.Free;
  end;
end;

class function TDaoPlanoContas.GetNextPlanoContasCodigoByPai(AIdPai: Integer;const ATipo: string): string;
var
  Qry: TUniQuery;
  CodigoPai: string;
begin
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection  := dm.conn;
    Qry.SQL.Text := 'SELECT CODIGO FROM planoconta WHERE id_planoconta = :ID';
    Qry.ParamByName('ID').AsInteger := AIdPai;
    Qry.Open;
    if Qry.IsEmpty then
      raise Exception.Create('Conta pai não encontrada.');
    CodigoPai := Qry.FieldByName('codigo').AsString;
  finally
    Qry.Free;
  end;
  Result := GetNextPlanoContasCodigo(CodigoPai,ATipo);
end;

class function TDaoPlanoContas.ValidarRegistroFilho(const AID: integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'SELECT 1 FROM planoconta WHERE id_pai = :id LIMIT 1';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection                  := dm.conn;
      Qry.SQL.Text                    := QryStr;
      Qry.ParamByName('id').AsInteger := AID;
      Qry.Open;
      if not Qry.IsEmpty then
      Result                          := true;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao na função de ValidarRegistroFilho:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;
end;

end.
