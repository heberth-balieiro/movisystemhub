unit Controller.Anexo;

interface

uses
  Model.Anexo,
  Dao.Operacoes,
  System.SysUtils,
  System.Classes,
  System.IOUtils,
  System.Generics.Collections,
  Dao.Anexo;

type
  TAnexoController = class
  private
    class function ObterTipoArquivo(const AExtensao: string): string; static;
    class function ObterMimeType(const AExtensao: string): string; static;
    class function ArquivoParaBytes(const ACaminhoArquivo: string): TBytes; static;

  public
    class function ListarPorReferencia(const AIDEmpresa: Integer;const ATipoReferencia: string;
      const AIDReferencia: Integer): TObjectList<TModelAnexo>;
    class function Visualizar(const AIDAnexo: Integer; const AIDRef:integer; const AIDEmpresa: Integer): Boolean;
    class function BuscarPorID(AID: Integer): TModelAnexo;
    class function Incluir(ADoc: TModelAnexo; out RetornoID: integer; out AStr:String): Boolean;
    class function Excluir(const AIDAnexo: Integer; const AIDRef:Integer;
                                      const AIDEmpresa: Integer): Boolean;
  end;

implementation

uses
  UDM,
  System.Variants, System.AnsiStrings;

{ TAnexoController }

class function TAnexoController.ArquivoParaBytes(const ACaminhoArquivo: string): TBytes;
var
  Stream: TFileStream;
begin
  if not TFile.Exists(ACaminhoArquivo) then
    raise Exception.Create('Arquivo não encontrado: ' + ACaminhoArquivo);

  Stream := TFileStream.Create(ACaminhoArquivo, fmOpenRead or fmShareDenyWrite);
  try
    SetLength(Result, Stream.Size);

    if Stream.Size > 0 then
      Stream.ReadBuffer(Result[0], Stream.Size);
  finally
    Stream.Free;
  end;
end;

class function TAnexoController.BuscarPorID(AID: Integer): TModelAnexo;
var
  FDAO: TDAOOperacao<TModelAnexo>;
begin
  FDAO := TDAOOperacao<TModelAnexo>.Create(dm.Conn);
  try
    Result := FDAO.FindById(AID);
  finally
    FDAO.Free;
  end;
end;

class function TAnexoController.Excluir(const AIDAnexo: Integer; const AIDRef:Integer;
                                      const AIDEmpresa: Integer): Boolean;
begin
  Result := False;

  if AIDAnexo <=0 then
  exit;

  if AIDRef<=0 then
  exit;

  if AIDEmpresa<=0 then
  exit;

  Result  := TDaoAnexo.Excluir(AIDAnexo, AIDRef, AIDEmpresa);


end;

class function TAnexoController.Incluir(ADoc: TModelAnexo; out RetornoID: integer; out AStr: String): Boolean;
var
FDAO: TDAOOperacao<TModelAnexo>;
Ext: string;
begin
  Result    := False;
  RetornoID := 0;
  AStr      := '';

  if not TFile.Exists(Adoc.nome_arquivo) then
  begin
    AStr := 'Arquivo não encontrado.';
    Exit;
  end;

  Ext     := LowerCase(ExtractFileExt(Adoc.nome_arquivo));
  FDAO    := TDAOOperacao<TModelAnexo>.Create(dm.Conn);

  Try
    if ADoc.id_anexo = 0 then
    begin

      Adoc.tipo_arquivo := ObterTipoArquivo(Ext);
      Adoc.mime_type    := ObterMimeType(Ext);
      Adoc.arquivo_blob := ArquivoParaBytes(Adoc.nome_arquivo);
      Adoc.tamanho_bytes:= TFile.GetSize(Adoc.nome_arquivo);
      Adoc.extensao     := Ext;

      Try
        Result          :=  TDaoAnexo.Inserir(ADoc, RetornoID);
      except
        begin
          raise;
        end;
      End;
    end;

  Finally
    FDAO.Free;
  End;
end;

class function TAnexoController.ListarPorReferencia(const AIDEmpresa: Integer;const ATipoReferencia: string;
                          const AIDReferencia: Integer): TObjectList<TModelAnexo>;
var
  SQL: string;
  Params: TArray<TPair<string, Variant>>;
  FDAO: TDAOOperacao<TModelAnexo>;
begin
  FDAO := TDAOOperacao<TModelAnexo>.Create(dm.Conn);
  try
    SQL :=
      'Select a.id_anexo, a.nome_original, a.extensao, a.tipo_arquivo, '+
      ' a.observacao, a.datainclusao, u.nome                           '+
      ' from anexo a                                                   '+
      ' inner join usuario u                                           '+
      ' on a.id_usuario = u.id_usuario                                 '+
      ' where a.id_empresa = :id_empresa ' +
      ' and a.tipo_referencia = :tipo_referencia ' +
      ' and id_referencia = :id_referencia ' +
      ' order by a.datainclusao DESC';
    Params := [
      TPair<string, Variant>.Create('id_empresa',       AIDEmpresa),
      TPair<string, Variant>.Create('tipo_referencia',  ATipoReferencia),
      TPair<string, Variant>.Create('id_referencia',    AIDReferencia)
    ];

    Result := FDAO.FindWhere(SQL, Params);
  finally
    FDAO.Free;
  end;
end;

class function TAnexoController.ObterMimeType(const AExtensao: string): string;
begin
  if AExtensao = '.pdf' then
    Result := 'application/pdf'
  else if (AExtensao = '.jpg') or (AExtensao = '.jpeg') then
    Result := 'image/jpeg'
  else if AExtensao = '.png' then
    Result := 'image/png'
  else if AExtensao = '.bmp' then
    Result := 'image/bmp'
  else
    Result := 'application/octet-stream';
end;

class function TAnexoController.ObterTipoArquivo(const AExtensao: string): string;
begin
  if AExtensao = '.pdf' then
    Result := 'PDF'
  else if MatchText(AExtensao, ['.jpg', '.jpeg', '.png', '.bmp']) then
    Result := 'IMAGEM'
  else
    Result := 'OUTRO';
end;

class function TAnexoController.Visualizar(const AIDAnexo, AIDRef,AIDEmpresa: Integer): Boolean;
begin
   Result := TDaoAnexo.Visualizar(AIDAnexo, AIDRef, AIDEmpresa);
end;

end.
