unit Dao.Anexo;

interface

uses
  System.SysUtils,
  System.Classes,
  System.IOUtils,
  Data.DB,
  Uni,
  UDm,
  Model.Anexo;

type
  TDaoAnexo = class
  private
    class procedure LimparPastaAnexosTemp(const APastaTemp: string); static;
  public
    class function Inserir(AAnexo: TModelAnexo; out ARetornoID: Integer): Boolean;
    class function Excluir(const AIDAnexo: Integer; const AIDRef:Integer;
                                      const AIDEmpresa: Integer): Boolean;
    class function Visualizar(const AIDAnexo: Integer; const AIDRef:Integer;
                                      const AIDEmpresa: Integer): Boolean;
  end;

implementation

uses
  Winapi.ShellAPI, Winapi.Windows;

{ TDaoAnexo }

class function TDaoAnexo.Inserir(AAnexo: TModelAnexo; out ARetornoID: Integer): Boolean;
var
  Qry: TUniQuery;
Const
  QryStr= 'INSERT INTO anexo ( ' +
      '  id_referencia, ' +
      '  tipo_referencia, ' +
      '  nome_arquivo, ' +
      '  nome_original, ' +
      '  extensao, ' +
      '  tipo_arquivo, ' +
      '  mime_type, ' +
      '  arquivo_blob, ' +
      '  tamanho_bytes, ' +
      '  observacao, ' +
      '  datainclusao, ' +
      '  id_empresa, ' +
      '  id_usuario ' +

      ') VALUES ( ' +
      '  :id_referencia, ' +
      '  :tipo_referencia, ' +
      '  :nome_arquivo, ' +
      '  :nome_original, ' +
      '  :extensao, ' +
      '  :tipo_arquivo, ' +
      '  :mime_type, ' +
      '  :arquivo_blob, ' +
      '  :tamanho_bytes, ' +
      '  :observacao, ' +
      '  :datainclusao, ' +
      '  :id_empresa, ' +
      '  :id_usuario ' +
      ');';
begin
  Result := False;
  ARetornoID := 0;

  Qry               := TUniQuery.Create(nil);
  try
    Qry.Connection  := dm.conn;
    Qry.SQL.Text    := QryStr;


    Qry.ParamByName('id_referencia').AsInteger      := AAnexo.id_referencia;
    Qry.ParamByName('tipo_referencia').AsString     := AAnexo.tipo_referencia;
    Qry.ParamByName('nome_arquivo').AsString        := AAnexo.nome_arquivo;
    Qry.ParamByName('nome_original').AsString       := AAnexo.nome_original;
    Qry.ParamByName('extensao').AsString            := AAnexo.extensao;
    Qry.ParamByName('tipo_arquivo').AsString        := AAnexo.tipo_arquivo;
    Qry.ParamByName('mime_type').AsString           := AAnexo.mime_type;

    Qry.ParamByName('arquivo_blob').LoadFromFile(AAnexo.nome_arquivo, ftBlob);

    Qry.ParamByName('tamanho_bytes').AsLargeInt     := AAnexo.tamanho_bytes;
    Qry.ParamByName('observacao').AsString          := AAnexo.observacao;
    Qry.ParamByName('datainclusao').AsDateTime      := AAnexo.datainclusao;
    Qry.ParamByName('id_empresa').AsInteger         := AAnexo.id_empresa;
    Qry.ParamByName('id_usuario').AsInteger         := AAnexo.id_usuario;
    Qry.ExecSQL;

    Qry.SQL.Text  := 'SELECT LAST_INSERT_ID() AS id';
    Qry.Open;

    ARetornoID    := Qry.FieldByName('id').AsInteger;
    Result        := True;

  finally
    Qry.Free;
  end;
end;

class function TDaoAnexo.Visualizar(const AIDAnexo, AIDRef,AIDEmpresa: Integer): Boolean;
var
  Qry: TUniQuery;
  BlobStream: TStream;
  FileStream: TFileStream;
  CaminhoTemp: string;
  PastaTemp: string;
  NomeArquivo: string;
const
  QryStr  = 'SELECT nome_original, extensao, arquivo_blob ' +
            'FROM anexo ' +
            ' WHERE id_anexo = :id_anexo ' +
            ' and id_referencia = :id_referencia '+
            ' AND id_empresa = :id_empresa ';

begin
  Result := False;

  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection  := dm.conn;
    Qry.SQL.Text    := QryStr;
    Qry.ParamByName('id_anexo').AsInteger       := AIDAnexo;
    Qry.ParamByName('id_referencia').AsInteger  := AIDRef;
    Qry.ParamByName('id_empresa').AsInteger     := AIDEmpresa;
    Qry.Open;
    if Qry.IsEmpty then
      Exit;

    NomeArquivo         := Qry.FieldByName('nome_original').AsString;

    if Trim(NomeArquivo) = '' then
      NomeArquivo := 'anexo_' + AIDAnexo.ToString + Qry.FieldByName('extensao').AsString;
    PastaTemp     := TPath.Combine(ExtractFilePath(ParamStr(0)), 'Temp\Anexo');
    if not TDirectory.Exists(PastaTemp) then
      TDirectory.CreateDirectory(PastaTemp)
    else
    LimparPastaAnexosTemp(PastaTemp);

    CaminhoTemp := TPath.Combine(
      PastaTemp,
      FormatDateTime('yyyymmddhhnnss_', Now) + NomeArquivo
    );
    BlobStream := Qry.CreateBlobStream(Qry.FieldByName('arquivo_blob'), bmRead);
    try
      FileStream := TFileStream.Create(CaminhoTemp, fmCreate);
      try
        FileStream.CopyFrom(BlobStream, 0);
      finally
        FileStream.Free;
      end;
    finally
      BlobStream.Free;
    end;
    ShellExecute(0, 'open', PChar(CaminhoTemp), nil, nil, SW_SHOWNORMAL);
    Result := True;

  finally
    Qry.Free;
  end;
end;

class procedure TDaoAnexo.LimparPastaAnexosTemp(const APastaTemp: string);
var
  Arquivo: string;
begin
  if not TDirectory.Exists(APastaTemp) then
    Exit;
  for Arquivo in TDirectory.GetFiles(APastaTemp) do
  begin
    try
      TFile.Delete(Arquivo);
    except
    end;
  end;
end;

class function TDaoAnexo.Excluir(const AIDAnexo: Integer; const AIDRef:Integer;
                                      const AIDEmpresa: Integer): Boolean;
var
  Qry: TUniQuery;
const
  QryStr  = 'Delete from anexo ' +
            ' where id_anexo = :id_anexo ' +
            ' and id_referencia= :id_referencia  '+
            ' and id_empresa = :id_empresa';
begin
  Result := False;

  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection  := dm.conn;
    Qry.SQL.Text    :=QryStr;

    Qry.ParamByName('id_anexo').AsInteger       := AIDAnexo;
    Qry.ParamByName('id_referencia').AsInteger  := AIDRef;
    Qry.ParamByName('id_empresa').AsInteger     := AIDEmpresa;

    Qry.ExecSQL;

    Result := Qry.RowsAffected > 0;

  finally
    Qry.Free;
  end;
end;

end.
