unit Service.DistribuicaoDFe.Importacao;

interface

uses
  System.SysUtils,
  System.Classes,
  System.StrUtils,
  System.NetEncoding,
  System.IOUtils,
  Xml.XMLIntf,
  Xml.XMLDoc,
  Data.DB,
  MemDS,
  DBAccess,
  Uni,
  IdBaseComponent,
  IdComponent,
  IdCompressorZLib,
  IdGlobal;

type
  TImportacaoDistribuicaoResultado = record
    Sucesso: Boolean;
    Mensagem: string;
    IdLog: Integer;
    TotalDocs: Integer;
    UltNSU: string;
    MaxNSU: string;
    class function Ok(const AIdLog: Integer; const ATotal: Integer;
      const AUltNSU, AMaxNSU, AMensagem: string): TImportacaoDistribuicaoResultado; static;
    class function Erro(const AMensagem: string): TImportacaoDistribuicaoResultado; static;
  end;

  TDistribuicaoDFeImportacaoService = class
  private
    class function LoadXMLDocumentFromString(const AXML: string): IXMLDocument; static;
    class function GetNodeText(const ANode: IXMLNode; const AChildName: string): string; static;
    class function GetNodeAttr(const ANode: IXMLNode; const AAttrName: string): string; static;
    class function FindChildIgnoreNS(const AParent: IXMLNode; const ANodeName: string): IXMLNode; static;
    class function FindNodesIgnoreNS(const AParent: IXMLNode; const ANodeName: string): TInterfaceList; static;
    class function RemoveNamespacePrefix(const ANodeName: string): string; static;
    class function DecodeAndUnzipDocZip(const ABase64GZip: string): string; static;
    class function SaveXMLToDisk(const ABasePath, ANSU, ASchema, AXML: string): string; static;
    class function DetectTipoDocumento(const ASchema: string): string; static;
    class procedure ExtrairDadosResNFe(const AXML: string;
      out AChave, ACNPJEmit, AXNomeEmit, ANumero, ASerie: string;
      out AValor: Currency; out ADhEmi: TDateTime); static;
    class function StrToDateTimeSafe(const AValue: string): TDateTime; static;
    class function SomenteNumeros(const AValue: string): string; static;
    class function InsertLog(ACnn: TUniConnection; AIdEmpresa: Integer; const ACNPJConsulta,
      AArquivoOrigem, ATpAmb, AVerAplic, ACStat, AXMotivo, ADhResp,
      AUltNSU, AMaxNSU, AXMLRetorno: string): Integer; static;
    class procedure InsertDoc(ACnn: TUniConnection; AIdLog, AIdEmpresa: Integer;
      const ANSU, ASchema, AXMLDescompactado, ACaminhoArquivo, ATipoDocumento,
      AChaveAcesso, ACNPJEmitente, AXNomeEmitente, ANumeroNFe, ASerieNFe: string;
      AValorNFe: Currency; ADhEmissao: TDateTime); static;
    class function ExtrairNumeroSerieDaChaveNFe(out ASerie, ANumero: String;
      const AChave: string): Boolean; static;
  public
    class function ImportarArquivoSimulado(ACnn: TUniConnection;
      const AArquivoXML, ACNPJConsulta, APastaDestino: string;
      AIdEmpresa: Integer): TImportacaoDistribuicaoResultado; static;
  end;

implementation

uses
  System.Variants, System.DateUtils;

{ TImportacaoDistribuicaoResultado }

class function TImportacaoDistribuicaoResultado.Ok(const AIdLog: Integer;
  const ATotal: Integer; const AUltNSU, AMaxNSU,
  AMensagem: string): TImportacaoDistribuicaoResultado;
begin
  Result.Sucesso  := True;
  Result.Mensagem := AMensagem;
  Result.IdLog    := AIdLog;
  Result.TotalDocs := ATotal;
  Result.UltNSU   := AUltNSU;
  Result.MaxNSU   := AMaxNSU;
end;

class function TImportacaoDistribuicaoResultado.Erro(
  const AMensagem: string): TImportacaoDistribuicaoResultado;
begin
  Result.Sucesso   := False;
  Result.Mensagem  := AMensagem;
  Result.IdLog     := 0;
  Result.TotalDocs := 0;
  Result.UltNSU    := '';
  Result.MaxNSU    := '';
end;

{ TDistribuicaoDFeImportacaoService }

class function TDistribuicaoDFeImportacaoService.ImportarArquivoSimulado(
  ACnn: TUniConnection; const AArquivoXML, ACNPJConsulta, APastaDestino: string;
  AIdEmpresa: Integer): TImportacaoDistribuicaoResultado;
var
  XMLRetorno: string;
  Doc: IXMLDocument;
  Root: IXMLNode;
  NodesDocZip: TInterfaceList;
  I: Integer;
  NodeDocZip: IXMLNode;
  NSU, SchemaName, XmlDescompactado, CaminhoArquivo: string;
  TpAmb, VerAplic, CStat, XMotivo, DhResp, UltNSU, MaxNSU: string;
  IdLog: Integer;
  TipoDocumento: string;
  ChaveAcesso, CNPJEmitente, XNomeEmitente, NumeroNFe, SerieNFe: string;
  ValorNFe: Currency;
  DhEmissao: TDateTime;
begin
  Result := TImportacaoDistribuicaoResultado.Erro('Falha ao importar distribuição DF-e.');

  if not Assigned(ACnn) then
    Exit(TImportacaoDistribuicaoResultado.Erro('Conexão com banco não informada.'));

  if not FileExists(AArquivoXML) then
    Exit(TImportacaoDistribuicaoResultado.Erro('Arquivo XML não encontrado: ' + AArquivoXML));

  XMLRetorno := TFile.ReadAllText(AArquivoXML, TEncoding.UTF8);
  Doc := LoadXMLDocumentFromString(XMLRetorno);

  if not Assigned(Doc) or not Assigned(Doc.DocumentElement) then
    Exit(TImportacaoDistribuicaoResultado.Erro('Não foi possível carregar o XML de distribuição.'));

  Root := Doc.DocumentElement;

  TpAmb    := GetNodeText(Root, 'tpAmb');
  VerAplic := GetNodeText(Root, 'verAplic');
  CStat    := GetNodeText(Root, 'cStat');
  XMotivo  := GetNodeText(Root, 'xMotivo');
  DhResp   := GetNodeText(Root, 'dhResp');
  UltNSU   := GetNodeText(Root, 'ultNSU');
  MaxNSU   := GetNodeText(Root, 'maxNSU');

  if not MatchText(CStat, ['138', '137']) then
    Exit(TImportacaoDistribuicaoResultado.Erro(
      Format('Retorno inválido da distribuição. cStat=%s / %s', [CStat, XMotivo])));

  ACnn.StartTransaction;
  try
    IdLog := InsertLog(
      ACnn,
      AIdEmpresa,
      SomenteNumeros(ACNPJConsulta),
      AArquivoXML,
      TpAmb,
      VerAplic,
      CStat,
      XMotivo,
      DhResp,
      UltNSU,
      MaxNSU,
      XMLRetorno
    );

    NodesDocZip := FindNodesIgnoreNS(FindChildIgnoreNS(Root, 'loteDistDFeInt'), 'docZip');

    try
      for I := 0 to NodesDocZip.Count - 1 do
      begin
        NodeDocZip        := NodesDocZip[I] as IXMLNode;

        NSU               := GetNodeAttr(NodeDocZip, 'NSU');
        SchemaName        := GetNodeAttr(NodeDocZip, 'schema');

        XmlDescompactado  := DecodeAndUnzipDocZip(NodeDocZip.Text);
        CaminhoArquivo    := SaveXMLToDisk(APastaDestino, NSU, SchemaName, XmlDescompactado);
        TipoDocumento     := DetectTipoDocumento(SchemaName);

        ChaveAcesso       := '';
        CNPJEmitente      := '';
        XNomeEmitente     := '';
        NumeroNFe         := '';
        SerieNFe          := '';
        ValorNFe          := 0;
        DhEmissao         := 0;

        if SameText(SchemaName, 'resNFe_v1.01.xsd') then
          ExtrairDadosResNFe(
            XmlDescompactado,
            ChaveAcesso,
            CNPJEmitente,
            XNomeEmitente,
            NumeroNFe,
            SerieNFe,
            ValorNFe,
            DhEmissao
          );

        InsertDoc(
          ACnn,
          IdLog,
          AIdEmpresa,
          NSU,
          SchemaName,
          XmlDescompactado,
          CaminhoArquivo,
          TipoDocumento,
          ChaveAcesso,
          CNPJEmitente,
          XNomeEmitente,
          NumeroNFe,
          SerieNFe,
          ValorNFe,
          DhEmissao
        );
      end;
    finally
      NodesDocZip.Free;
    end;

    ACnn.Commit;

    Result := TImportacaoDistribuicaoResultado.Ok(
      IdLog,
      FindNodesIgnoreNS(FindChildIgnoreNS(Root, 'loteDistDFeInt'), 'docZip').Count,
      UltNSU,
      MaxNSU,
      Format('Importação concluída com sucesso. UltNSU: %s / MaxNSU: %s', [UltNSU, MaxNSU])
    );
  except
    on E: Exception do
    begin
      if ACnn.InTransaction then
        ACnn.Rollback;

      Result := TImportacaoDistribuicaoResultado.Erro('Erro ao importar XML simulado: ' + E.Message);
    end;
  end;
end;

class function TDistribuicaoDFeImportacaoService.LoadXMLDocumentFromString(
  const AXML: string): IXMLDocument;
begin
  Result := TXMLDocument.Create(nil);
  Result.Options := [doNodeAutoCreate, doNodeAutoIndent];
  Result.ParseOptions := [poPreserveWhiteSpace];
  Result.LoadFromXML(AXML);
  Result.Active := True;
end;

class function TDistribuicaoDFeImportacaoService.GetNodeText(
  const ANode: IXMLNode; const AChildName: string): string;
var
  N: IXMLNode;
begin
  Result := '';
  if not Assigned(ANode) then
    Exit;

  N := FindChildIgnoreNS(ANode, AChildName);
  if Assigned(N) then
    Result := Trim(N.Text);
end;

class function TDistribuicaoDFeImportacaoService.GetNodeAttr(
  const ANode: IXMLNode; const AAttrName: string): string;
var
  I: Integer;
begin
  Result := '';
  if not Assigned(ANode) then
    Exit;

  for I := 0 to ANode.AttributeNodes.Count - 1 do
  begin
    if SameText(RemoveNamespacePrefix(ANode.AttributeNodes[I].NodeName), AAttrName) then
      Exit(VarToStr(ANode.Attributes[ANode.AttributeNodes[I].NodeName]));
  end;
end;

class function TDistribuicaoDFeImportacaoService.FindChildIgnoreNS(
  const AParent: IXMLNode; const ANodeName: string): IXMLNode;
var
  I: Integer;
begin
  Result := nil;
  if not Assigned(AParent) then
    Exit;

  for I := 0 to AParent.ChildNodes.Count - 1 do
  begin
    if SameText(RemoveNamespacePrefix(AParent.ChildNodes[I].NodeName), ANodeName) then
      Exit(AParent.ChildNodes[I]);
  end;
end;

class function TDistribuicaoDFeImportacaoService.FindNodesIgnoreNS(
  const AParent: IXMLNode; const ANodeName: string): TInterfaceList;
var
  I: Integer;
begin
  Result := TInterfaceList.Create;
  if not Assigned(AParent) then
    Exit;

  for I := 0 to AParent.ChildNodes.Count - 1 do
  begin
    if SameText(RemoveNamespacePrefix(AParent.ChildNodes[I].NodeName), ANodeName) then
      Result.Add(AParent.ChildNodes[I]);
  end;
end;

class function TDistribuicaoDFeImportacaoService.RemoveNamespacePrefix(
  const ANodeName: string): string;
var
  P: Integer;
begin
  Result := ANodeName;
  P := Pos(':', Result);
  if P > 0 then
    Result := Copy(Result, P + 1, MaxInt);
end;

class function TDistribuicaoDFeImportacaoService.DecodeAndUnzipDocZip(
  const ABase64GZip: string): string;
var
  Bytes: TBytes;
  InStream, OutStream: TMemoryStream;
  Z: TIdCompressorZLib;
  Utf8: UTF8String;
begin
  Result := '';

  Bytes := TNetEncoding.Base64.DecodeStringToBytes(Trim(ABase64GZip));

  InStream := TMemoryStream.Create;
  OutStream := TMemoryStream.Create;
  Z := TIdCompressorZLib.Create(nil);
  try
    InStream.WriteBuffer(Bytes, Length(Bytes));
    InStream.Position := 0;

    Z.DecompressGZipStream(InStream, OutStream);

    OutStream.Position := 0;
    SetLength(Utf8, OutStream.Size);
    if OutStream.Size > 0 then
      OutStream.ReadBuffer(Utf8[1], OutStream.Size);

    Result := string(Utf8);
  finally
    Z.Free;
    OutStream.Free;
    InStream.Free;
  end;
end;

class function TDistribuicaoDFeImportacaoService.SaveXMLToDisk(
  const ABasePath, ANSU, ASchema, AXML: string): string;
var
  Pasta, NomeArquivo: string;
begin
  Pasta := TPath.Combine(ABasePath, FormatDateTime('yyyymmdd', Date));
  ForceDirectories(Pasta);

  NomeArquivo := Format('%s-%s.xml', [ANSU, ChangeFileExt(ASchema, '')]);
  Result := TPath.Combine(Pasta, NomeArquivo);

  TFile.WriteAllText(Result, AXML, TEncoding.UTF8);
end;

class function TDistribuicaoDFeImportacaoService.DetectTipoDocumento(
  const ASchema: string): string;
begin
  if ContainsText(ASchema, 'resNFe') then
    Exit('Resumo NFe');

  if ContainsText(ASchema, 'procNFe') then
    Exit('Proc NFe');

  if ContainsText(ASchema, 'procEventoNFe') then
    Exit('Evento NFe');

  if ContainsText(ASchema, 'resEvento') then
    Exit('Resumo Evento');

  if ContainsText(ASchema, 'resCTe') then
    Exit('Resumo CTe');

  Result := 'Outro';
end;

class procedure TDistribuicaoDFeImportacaoService.ExtrairDadosResNFe(
  const AXML: string; out AChave, ACNPJEmit, AXNomeEmit, ANumero, ASerie: string;
  out AValor: Currency; out ADhEmi: TDateTime);
var
  Doc: IXMLDocument;
  Root, InfNFe: IXMLNode;
  VStr: string;
begin
  AChave      := '';
  ACNPJEmit   := '';
  AXNomeEmit  := '';
  ANumero     := '';
  ASerie      := '';
  AValor      := 0;
  ADhEmi      := 0;

  Doc := LoadXMLDocumentFromString(AXML);
  Root := Doc.DocumentElement;
  if not Assigned(Root) then
    Exit;

  InfNFe := FindChildIgnoreNS(Root, 'resNFe');
  if not Assigned(InfNFe) then
    InfNFe := Root;

  AChave     := GetNodeText(InfNFe, 'chNFe');
  ACNPJEmit  := SomenteNumeros(GetNodeText(InfNFe, 'CNPJ'));
  AXNomeEmit := GetNodeText(InfNFe, 'xNome');
  //ANumero    := //GetNodeText(InfNFe, 'nNF');
  //ASerie     := GetNodeText(InfNFe, 'serie');
  ExtrairNumeroSerieDaChaveNFe(ASerie,ANumero,AChave);


  VStr       := StringReplace(GetNodeText(InfNFe, 'vNF'), '.', FormatSettings.DecimalSeparator, []);
  if VStr <> '' then
    AValor := StrToCurrDef(VStr, 0);

  ADhEmi := StrToDateTimeSafe(GetNodeText(InfNFe, 'dhEmi'));
end;

class function TDistribuicaoDFeImportacaoService.SomenteNumeros(const AValue: string): string;
var
  C: Char;
begin
  Result := '';
  for C in AValue do
    if CharInSet(C, ['0'..'9']) then
      Result := Result + C;
end;

class function TDistribuicaoDFeImportacaoService.ExtrairNumeroSerieDaChaveNFe(out ASerie,ANumero:String; const AChave: string):Boolean;
var
  Chave: string;
begin
  Result  := False;
  ASerie  := '';
  ANumero := '';

  Chave := SomenteNumeros(AChave);

  if Length(Chave) <> 44 then
    raise Exception.Create('Chave de acesso da NF-e deve conter 44 dígitos.');

  ASerie  := Copy(Chave, 23, 3);
  ANumero := Copy(Chave, 26, 9);
  Result  := Chave <>'';
end;

class function TDistribuicaoDFeImportacaoService.StrToDateTimeSafe(
  const AValue: string): TDateTime;
begin
  Result := 0;
  try
    if AValue <> '' then
      Result := ISO8601ToDate(AValue, False);
  except
    Result := 0;
  end;
end;


class function TDistribuicaoDFeImportacaoService.InsertLog(
  ACnn: TUniConnection; AIdEmpresa: Integer; const ACNPJConsulta, AArquivoOrigem,
  ATpAmb, AVerAplic, ACStat, AXMotivo, ADhResp, AUltNSU, AMaxNSU,
  AXMLRetorno: string): Integer;
var
  Qry: TUniQuery;
  Dh: TDateTime;
begin
  Result := 0;
  Dh := StrToDateTimeSafe(ADhResp);

  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := ACnn;
    Qry.SQL.Text :=
      'insert into distribuicao_dfe_log (               ' +
      '  id_empresa, cnpj_consulta, arquivo_origem,     ' +
      '  tp_amb, ver_aplic, c_stat, x_motivo,           ' +
      '  dh_resp, ult_nsu, max_nsu, xml_retorno,        ' +
      '  dt_cadastro                                    ' +
      ') values (                                       ' +
      '  :id_empresa, :cnpj_consulta, :arquivo_origem,  ' +
      '  :tp_amb, :ver_aplic, :c_stat, :x_motivo,       ' +
      '  :dh_resp, :ult_nsu, :max_nsu, :xml_retorno,    ' +
      '  :dt_cadastro                                   ' +
      ')';

    Qry.ParamByName('id_empresa').AsInteger := AIdEmpresa;
    Qry.ParamByName('cnpj_consulta').AsString := ACNPJConsulta;
    Qry.ParamByName('arquivo_origem').AsString := AArquivoOrigem;
    Qry.ParamByName('tp_amb').AsInteger := StrToIntDef(ATpAmb, 0);
    Qry.ParamByName('ver_aplic').AsString := AVerAplic;
    Qry.ParamByName('c_stat').AsInteger := StrToIntDef(ACStat, 0);
    Qry.ParamByName('x_motivo').AsString := AXMotivo;

    if Dh > 0 then
      Qry.ParamByName('dh_resp').AsDateTime := Dh
    else
      Qry.ParamByName('dh_resp').Clear;

    Qry.ParamByName('ult_nsu').AsString := AUltNSU;
    Qry.ParamByName('max_nsu').AsString := AMaxNSU;
    Qry.ParamByName('xml_retorno').AsMemo := AXMLRetorno;
    Qry.ParamByName('dt_cadastro').AsDateTime := Now;
    Qry.ExecSQL;

    Qry.SQL.Text := 'select last_insert_id() as id';
    Qry.Open;
    Result := Qry.FieldByName('id').AsInteger;
  finally
    Qry.Free;
  end;
end;

class procedure TDistribuicaoDFeImportacaoService.InsertDoc(
  ACnn: TUniConnection; AIdLog, AIdEmpresa: Integer; const ANSU, ASchema,
  AXMLDescompactado, ACaminhoArquivo, ATipoDocumento, AChaveAcesso,
  ACNPJEmitente, AXNomeEmitente, ANumeroNFe, ASerieNFe: string;
  AValorNFe: Currency; ADhEmissao: TDateTime);
var
  Qry: TUniQuery;
begin
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := ACnn;
    Qry.SQL.Text :=
      'insert into distribuicao_dfe_doc (               ' +
      '  id_log, id_empresa, nsu, schema_name,          ' +
      '  xml_descompactado, caminho_arquivo,            ' +
      '  tipo_documento, chave_acesso, cnpj_emitente,   ' +
      '  x_nome_emitente, numero_nfe, serie_nfe,        ' +
      '  valor_nfe, dh_emissao, situacao_manifesto,     ' +
      '  dt_cadastro                                    ' +
      ') values (                                       ' +
      '  :id_log, :id_empresa, :nsu, :schema_name,      ' +
      '  :xml_descompactado, :caminho_arquivo,          ' +
      '  :tipo_documento, :chave_acesso, :cnpj_emitente,' +
      '  :x_nome_emitente, :numero_nfe, :serie_nfe,     ' +
      '  :valor_nfe, :dh_emissao, :situacao_manifesto,  ' +
      '  :dt_cadastro                                   ' +
      ')';

    Qry.ParamByName('id_log').AsInteger := AIdLog;
    Qry.ParamByName('id_empresa').AsInteger := AIdEmpresa;
    Qry.ParamByName('nsu').AsString := ANSU;
    Qry.ParamByName('schema_name').AsString := ASchema;
    Qry.ParamByName('xml_descompactado').AsMemo := AXMLDescompactado;
    Qry.ParamByName('caminho_arquivo').AsString := ACaminhoArquivo;
    Qry.ParamByName('tipo_documento').AsString := ATipoDocumento;
    Qry.ParamByName('chave_acesso').AsString := AChaveAcesso;
    Qry.ParamByName('cnpj_emitente').AsString := ACNPJEmitente;
    Qry.ParamByName('x_nome_emitente').AsString := AXNomeEmitente;
    Qry.ParamByName('numero_nfe').AsString := ANumeroNFe;
    Qry.ParamByName('serie_nfe').AsString := ASerieNFe;
    Qry.ParamByName('valor_nfe').AsCurrency := AValorNFe;

    //possui_xml_completo

    if ADhEmissao > 0 then
      Qry.ParamByName('dh_emissao').AsDateTime := ADhEmissao
    else
      Qry.ParamByName('dh_emissao').Clear;

    Qry.ParamByName('situacao_manifesto').AsString := 'Pendente';
    Qry.ParamByName('dt_cadastro').AsDateTime := Now;

    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

end.
