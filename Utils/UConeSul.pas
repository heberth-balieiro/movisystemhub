unit UConeSul;

interface

Uses classes, sysUtils, EncdDecd, Vcl.Graphics, Winapi.ActiveX,
  jpeg,pngimage,DelphiZXingQRCode, Winapi.Windows,
  System.NetEncoding,System.Math, Vcl.ExtCtrls,
  System.IOUtils, uni, IdIPWatch,cxImage,frxClass,System.IniFiles,ACBrCEP,
  System.Generics.Collections,
  System.Rtti,
  cxMaskEdit, ACBRUtil;

Type
  TConeSul  = class

    Private
    class var Fhistorico: string;
    class var Fiddespesa: integer;
    class var Fnumero: string;
    class var Fvlr: double;
    class var Fidplano: integer;
    class var Fdata: Tdate;
    class var Fidpessoa: integer;
    class var Fdataven: Tdate;
    class var Fqtdeparcel: integer;
    class var Fidconta: integer;
    class var Fidveiculo: Integer;
    class var Fpercpatio:double;
    class var Fdesloja:double;
    class var fdesprop:double;
    class var FComloja:double;
    class var Fhorasaida:Ttime;
    class var Fgerfinan:string;
    class var Fhistreceber:String;
    class var Fidpagcompra: integer;
    class var Ftipodoc: string;
    class var Fidrecvenda: integer;
    class var Fidpedido: integer;
    class var Fntelefone: string;
    class var Fnrg: string;
    class var Fncpf: string;
    class var Fnnome: string;
    class var Fnidvendedor: integer;
    class var Fndatavenda: Tdate;
    class var Fnidanexoveic: integer;
    class var FnStatus: String;

    class function RemoverChaves(const AString: string): string; static;
    class function PartePorExtenso(Parte, Nivel: Integer): string;

    Public
    class var ndir    :String;
    class var nFiles  :TBytesStream;
    class var nfoto   :TPicture;

    class constructor Create;
    //class destructor Destroy;
    class function ConvImgTCXBase64(const IMG: Tcximage): String; static; //Tcximage
    class Function ConvImgBase64(const Img :Timage):String;
    class Function ConvBase64Img(const Str64 :string):Boolean;
    class Function ConvPDFBase64(const PDF : TFileStream):String;
    class Function ConvBase64PDF(const Str64 :String):String;
    class function ConvBase64ImgDir(const Str64, Extensao: string): string;

    class function ArquivoParaBase64(const CaminhoArquivo: string): string; static; // passar o caminho do arquivo e gerar a base64
    class function SalvarBase64Temporario(const Base64, Extensao: string): string;

    class function CapturarExtensaoArquivo(const nomeArquivo: string): string; static;
    class function LimparPasta(const caminhoPasta: string): Boolean; static;
    class function CopiarStringAntesDoIgual(const texto: string): string; static;


    class function ObterNomeDaMaquina: string; static;
    class function ObterEnderecoIPDaMaquina: string; static;

    class function SaveFastReportToBase64(report: TfrxReport): string; static;
    class function LoadFastReportBase64(const base64data:String):TFrxReport;

    class function Crypt(Action, Src: String): String;

    class Function PortaRota(out porta:integer):string;

    //Funcao Ler e gravar Ini
    class Function LerValorIni(const ArquivoIni, Seccao, Chave, ValorPadrao: string): string;
    class Procedure GravarValorIni(const ArquivoIni, Seccao, Chave, Valor: string);

    Class Function GenerateRandomCode(CodeLength: Integer): string;


    Class Function GerarGuid:String;

    class function GetAppVersion: string; static;

    class function NumeroPorExtenso(Numero: Int64): string; static;

    //função para reduzir imagen

    //GerarQrCode
    class procedure GerarQRCode(imgQrCode: TImage; Str: string);

    //Mascara CPF
    class function AplicarMascaraCPF(const CPF: string): string; static;

    class function MesAnoFormatado(data:TDatetime):string;

    class function valorPorExtenso(vlr: real): string; static;

    class function BuscarURLAPI(out url, usuario, senha: string): Boolean;

    class function SubstituirVariaveisMensagem(const Template: string; const Vars: TDictionary<string, string>): string;

    class Function GravarLogErroRtti(obj: TObject; msgErro:String): String;
    class procedure GravarLogErroTXT(const Texto: string); static;

    class Function IntervaloData(Str:String):Integer; static;

    class Function ValidarDataNull(Const ADate: TDatetime): Variant;
    class function ValidarTelefonePreenchido(AMaskEdit: TcxMaskEdit): Boolean;


  end;

implementation

uses
  System.Types, Vcl.StdCtrls, System.Variants;

{ TConeSul }


{$REGION 'Funcoes'}

class Function TConeSul.IntervaloData(Str:String):Integer;
var
Ret:  String;
begin
  Ret     := LerValorIni(nDir, 'PARAMETRO', Str,'');
  Result  := StrtoInt(Ret);
end;

class function TConeSul.SubstituirVariaveisMensagem(const Template: string; const Vars: TDictionary<string, string>): string;
var
  Key: string;
begin
  Result := Template;
  for Key in Vars.Keys do
    Result := StringReplace(Result, Key , Vars.Items[Key], [rfReplaceAll]);
end;

class function TConeSul.AplicarMascaraCPF(const CPF: string): string;
begin
  // Remove qualquer caracter não numérico (caso o CPF tenha sido digitado com outros caracteres)
  Result := CPF;
  Result := StringReplace(Result, '.', '', [rfReplaceAll]);
  Result := StringReplace(Result, '-', '', [rfReplaceAll]);
  // Verifica se a string tem 11 caracteres numéricos
  if Length(Result) = 11 then
    // Aplica a máscara
    Result := Copy(Result, 1, 3) + '.' + Copy(Result, 4, 3) + '.' + Copy(Result, 7, 3) + '-' + Copy(Result, 10, 2)
  else
    Result := ''; // Retorna uma string vazia se o CPF não tiver 11 caracteres
end;

class function TConeSul.ObterEnderecoIPDaMaquina: string;
var
  r: TIdIPWatch;
begin

          r := TIdIPWatch.Create(nil);
          Result  := r.LocalIP;
          r.Free;
end;

class function TConeSul.ObterNomeDaMaquina: string;
var
  NomeMaquina: array[0..MAX_COMPUTERNAME_LENGTH] of Char;
  TamanhoNome: DWORD;
begin
  // Inicializa o tamanho da variável NomeMaquina
  TamanhoNome := MAX_COMPUTERNAME_LENGTH + 1;

  // Obtém o nome da máquina
  if GetComputerName(NomeMaquina, TamanhoNome) then
    Result := NomeMaquina
  else
    Result := 'Erro ao obter o nome da máquina';
end;

class function TConeSul.PortaRota(out Porta:integer): String;
var
arq_ini :string;
ini :tInifile;
begin
  try
        try
            arq_ini := GetCurrentDir + '\ServerEasyFiat.ini';

            // Verifica se INI existe...
            if NOT FileExists(arq_ini) then
            begin
                Result := 'Arquivo INI não encontrado: ' + arq_ini;
                exit;
            end;

            // Instanciar arquivo INI...
            ini := TIniFile.Create(arq_ini);

            Porta := ini.Readinteger('DADOS', 'PortRota', 0);

            Result := 'OK';
        except on ex:exception do
            Result := 'Erro ler a porta: ' + ex.Message;
        end;

    finally
        if Assigned(ini) then
            ini.DisposeOf;
    end;
end;

Class function TConeSul.CopiarStringAntesDoIgual(const texto: string): string;
var
  posIgual: Integer;
begin
  // Encontrar a posição do sinal de igual
  posIgual := Pos('=', texto);

  // Se o sinal de igual não for encontrado, retornar a string original
  if posIgual = 0 then
    Result := TrimRight(texto)
  else
    // Caso contrário, copiar os dados antes do sinal de igual
    Result := TrimRight(Copy(texto, 1, posIgual - 1));
end;

class constructor TConeSul.Create;
begin
  nDir  := GetCurrentDir + '\Config.ini';
end;

class function TConeSul.Crypt(Action, Src: String): String;
Label Fim;
var
  KeyLen: Integer;
  KeyPos: Integer;
  OffSet: Integer;
  Dest, Key, KeyNew: String;
  SrcPos: Integer;
  SrcAsc: Integer;
  TmpSrcAsc: Integer;
  Range: Integer;
begin
  if (Src = '') Then
  begin
    Result := '';
    Goto Fim;
  end;
  Key := 'XNGREXCPAJHKQWERYTUIOP98756LKJHASFGMNBVCAXZ13450';
  KeyNew := 'PRODOXCPAJHKQWERYTUIOP98765LKJHASFGMNBVCAXZ01234';
  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 128;
  if (Action = UpperCase('C')) then
  begin
    // Randomize;
    OffSet := Range;
    Dest := Format('%1.2x', [OffSet]);
    for SrcPos := 1 to Length(Src) do
    begin
      //Application.ProcessMessages;
      SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
      if KeyPos < KeyLen then
        KeyPos := KeyPos + 1
      else
        KeyPos := 1;
      SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      Dest := Dest + Format('%1.2x', [SrcAsc]);
      OffSet := SrcAsc;
    end;
  end
  Else if (Action = UpperCase('D')) then
  begin
    OffSet := StrToInt('$' + copy(Src, 1, 2));
    // <--------------- adiciona o $ entra as aspas simples
    SrcPos := 3;
    repeat
      SrcAsc := StrToInt('$' + copy(Src, SrcPos, 2));
      // <--------------- adiciona o $ entra as aspas simples
      if (KeyPos < KeyLen) Then
        KeyPos := KeyPos + 1
      else
        KeyPos := 1;
      TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      if TmpSrcAsc <= OffSet then
        TmpSrcAsc := 255 + TmpSrcAsc - OffSet
      else
        TmpSrcAsc := TmpSrcAsc - OffSet;
      Dest := Dest + Chr(TmpSrcAsc);
      OffSet := SrcAsc;
      SrcPos := SrcPos + 2;
    until (SrcPos >= Length(Src));
  end;
  Result := Dest;
Fim:
end;



class procedure TConeSul.GravarValorIni(const ArquivoIni, Seccao, Chave,
  Valor: string);
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ArquivoIni);
  try
    IniFile.WriteString(Seccao, Chave, Valor);
  finally
    IniFile.Free;
  end;
end;

class function TConeSul.LerValorIni(const ArquivoIni, Seccao, Chave,
  ValorPadrao: string): string;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ArquivoIni);
  try
    Result := IniFile.ReadString(Seccao, Chave, ValorPadrao);
  finally
    IniFile.Free;
  end;
end;

class function TConeSul.LimparPasta(const caminhoPasta: string): Boolean;
var
  arquivos: TStringDynArray;
  arquivo: string;
begin
  try
    arquivos := TDirectory.GetFiles(caminhoPasta);

    for arquivo in arquivos do
    begin
      // Exclui cada arquivo na pasta
      TFile.Delete(arquivo);
    end;

    // Pasta foi limpa com sucesso
    Result := True;
  except
    // Ocorreu um erro ao limpar a pasta
    Result := False;
  end;
end;

class function TConeSul.CapturarExtensaoArquivo(const nomeArquivo: string): string;
begin
  Result := ExtractFileExt(nomeArquivo);
end;

class Function TConeSul.BuscarURLAPI(out url, usuario, senha:string):Boolean;
var
  LeIni: TIniFile;
  //arquivo:String;
begin
  result  := False;
  try
    //arquivo := ExtractFilePath(Application.ExeName) + 'Config.ini';
    if FileExists(nDir) then
    begin
      LeIni     := TIniFile.Create(nDir);
      url       := LeIni.ReadString('API', 'Servidor', '');
      senha     := LeIni.ReadString('API', 'Senha', '');
      usuario   := LeIni.ReadString('API', 'Usuario', '');
      Result    := True;
    end;
  finally
    LeIni.Free;
  end;

end;


{$ENDREGION}

{$REGION 'Converte'}
//funcao para converter e salvar em uma pasta
class function TConeSul.ConvBase64ImgDir(const Str64: string; const Extensao: string): String;
var
  Input, Output: TMemoryStream;
  FilePath: string;
begin
  // Inicializa
  Result := '';
  nFoto := TPicture.Create;

  // Caminho completo com extensão
  FilePath := IncludeTrailingPathDelimiter(ndir) + 'foto_' + FormatDateTime('yyyymmdd_hhnnsszzz', Now) + Extensao;

  Input := TStringStream.Create(Str64, TEncoding.UTF8);
  Output := TMemoryStream.Create;
  try
    // Decodifica Base64 para Stream
    Input.Position := 0;
    TNetEncoding.Base64.Decode(Input, Output);
    Output.Position := 0;

    // Carrega no nFoto
    nFoto.LoadFromStream(Output);

    // Salva o arquivo no caminho especificado
    nFoto.SaveToFile(FilePath);

    Result := FilePath;
  finally
    Input.Free;
    Output.Free;
  end;
end;


class function TConeSul.ConvBase64Img(const Str64: string): boolean;
var
 Input,Output : TMemoryStream;
begin
 //Base64 para foto
 Result := False;
 Input    := TStringStream.Create(Str64);
 Output   := TStringStream.Create;
 nFoto    := TPicture.Create;

 Try
  Input.Position  :=0;
  TNetEncoding.Base64.Decode(Input, Output);
  Output.Position :=0;
  nFoto.LoadFromStream(Output);
  Result:=True;
 Finally
  Input.Free;
  Output.Free;
 End;
end;

class function TConeSul.ConvBase64PDF(const Str64: String): String;
var
 Input,Output : TMemoryStream;
begin
 //Base64 para PDF
 Input  := TStringStream.Create(Str64);
 Output := TStringStream.Create;

 Try
  Input.Position  :=0;
  nFiles  := TbytesStream.Create(TNetEncoding.Base64.DecodeStringToBytes(Str64));
  nFiles.SaveToFile(ndir);

 Finally
  Input.Free;
  Output.Free;
  nFiles.Free;
 End;
end;

class function TConeSul.ConvImgBase64(const IMG:Timage): String;
var
  Input, Output : TStringStream;
begin
  Input     := TStringStream.Create;
  Output    := TStringStream.create;

  Try
    IMG.Picture.SaveToStream(Input);
    Input.Position    :=0;
    TNetEncoding.Base64.Encode(Input,OutPut);
    Output.Position   :=0;
    Result            := Output.DataString;
  Finally
    Input.Free;
    Output.Free;
  End;

end;

class function TConeSul.ConvImgTCXBase64(const IMG:Tcximage): String;
var
  Input, Output : TStringStream;
begin
  Input     := TStringStream.Create;
  Output    := TStringStream.create;

  Try
    IMG.Picture.SaveToStream(Input);
    Input.Position    :=0;
    TNetEncoding.Base64.Encode(Input,OutPut);
    Output.Position   :=0;
    Result            := Output.DataString;
  Finally
    Input.Free;
    Output.Free;
  End;

end;

class function TConeSul.ConvPDFBase64(const PDF: TFileStream): String;
var
  Output : TStringStream;
begin
  //Converter de PDF para Base64
  Output              := TStringStream.Create;
  Try
    PDF.Position      := 0;
    TNetEncoding.Base64.Encode(PDF,Output);
    Output.Position   := 0;
    Result            := Output.DataString;
  Finally
    Output.Free;
  End;
end;

class function TConeSul.ArquivoParaBase64(const CaminhoArquivo: string): string;
var
  FileStream: TFileStream;
begin
  Result := '';
  if not FileExists(CaminhoArquivo) then
    Exit;

  FileStream := TFileStream.Create(CaminhoArquivo, fmOpenRead or fmShareDenyWrite);
  try
    Result := TConeSul.ConvPDFBase64(FileStream);  // Usa sua função existente
  finally
    FileStream.Free;
  end;
end;

class function TConeSul.SalvarBase64Temporario(const Base64, Extensao: string): string;
var
  Base64Limpo, ExtensaoLimpa, NomeArquivo: string;
  Bytes: TBytes;
  GUID: TGUID;
  P, I: Integer;
begin
  Result := '';
  Base64Limpo := Trim(Base64);
  ExtensaoLimpa := LowerCase(Trim(Extensao));

  if Base64Limpo = '' then
    raise Exception.Create('Base64 não informado.');

  { Aceita "pdf" ou ".pdf" }
  if Copy(ExtensaoLimpa, 1, 1) = '.' then
    Delete(ExtensaoLimpa, 1, 1);

  if ExtensaoLimpa = '' then
    raise Exception.Create('Extensão do arquivo não informada.');

  { Impede caracteres inválidos na extensão }
  for I := 1 to Length(ExtensaoLimpa) do
    if not CharInSet(ExtensaoLimpa[I], ['a'..'z', '0'..'9']) then
      raise Exception.Create('Extensão do arquivo inválida.');

  { Remove prefixo como: data:image/png;base64, }
  P := Pos('base64,', LowerCase(Base64Limpo));
  if P > 0 then
    Base64Limpo := Copy(Base64Limpo, P + Length('base64,'), MaxInt);

  Base64Limpo := StringReplace(Base64Limpo, #13, '', [rfReplaceAll]);
  Base64Limpo := StringReplace(Base64Limpo, #10, '', [rfReplaceAll]);
  Base64Limpo := StringReplace(Base64Limpo, #9, '', [rfReplaceAll]);
  Base64Limpo := StringReplace(Base64Limpo, ' ', '', [rfReplaceAll]);

  Bytes := TNetEncoding.Base64.DecodeStringToBytes(Base64Limpo);

  if Length(Bytes) = 0 then
    raise Exception.Create('O Base64 não possui conteúdo.');

  CreateGUID(GUID);
  NomeArquivo := GUIDToString(GUID);
  NomeArquivo := StringReplace(NomeArquivo, '{', '', [rfReplaceAll]);
  NomeArquivo := StringReplace(NomeArquivo, '}', '', [rfReplaceAll]);
  NomeArquivo := StringReplace(NomeArquivo, '-', '', [rfReplaceAll]);

  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) +
            'Temp_' + NomeArquivo + '.' + ExtensaoLimpa;

  try
    TFile.WriteAllBytes(Result, Bytes);
  except
    Result := '';
    raise;
  end;
end;

class function TConeSul.SaveFastReportToBase64(report: TfrxReport): string;
var
  ms: TMemoryStream;
begin
  // Crie um MemoryStream para armazenar o relatório
  ms := TMemoryStream.Create;
  try
    // Salve o relatório no MemoryStream
    report.SaveToStream(ms);

    // Converta os dados do MemoryStream para uma string Base64
    Result := EncodeBase64(ms.Memory, ms.Size);
  finally
    ms.Free;
  end;
end;

class function TConeSul.LoadFastReportBase64(const base64data:String):TFrxReport;
var
  ms: TMemoryStream;
  decoder: TBase64Encoding;
  decodedBytes: TBytes;
begin
  Result  := nil;

  // Crie um MemoryStream e carregue os dados Base64 nele
  ms := TMemoryStream.Create;
  try
    // Converta a string Base64 de volta para dados binários
    decoder     := TBase64Encoding.Create;
    try
      decodedBytes  := decoder.DecodeStringToBytes(base64data);

    finally
      decoder.Free;
    end;
     ms.WriteBuffer(decodedBytes[0], Length(decodedBytes));

    // Volte para o início do MemoryStream
    ms.Position := 0;

    // Crie um objeto TfrxReport e carregue os dados do MemoryStream nele
    Result := TfrxReport.Create(nil);
    Result.LoadFromStream(ms);
  finally
    ms.Free;
  end;


end;

class function TConeSul.MesAnoFormatado(data: TDatetime): string;
const
  Meses: array[1..12] of string = ('Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
                                   'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro');
var
  dia, Mes, Ano: Word;
begin
  DecodeDate(Data, Ano, Mes, dia);
  Result := Meses[Mes] + ' de ' + IntToStr(Ano);
end;

{$ENDREGION}

class Function TConeSul.ValidarDataNull(Const ADate: TDatetime): Variant;
begin
  if (ADate <= 0) or (Trunc(ADate) = 0) then
    Result := Null
  else
    Result := ADate;
end;

class function TConeSul.ValidarTelefonePreenchido(AMaskEdit: TcxMaskEdit): Boolean;
begin
  Result := Trim(StringReplace(TiraPontos(AMaskEdit.Text), '_', '', [rfReplaceAll])) = '';
end;

class function TConeSul.GetAppVersion: string;
var
  Size, Handle: DWORD;
  Buffer: Pointer;
  FileInfo: PVSFixedFileInfo;
  FileInfoSize: UINT;
  Major, Minor, Release, Build: Word;
begin
  Result := '1.0.0.0';

  // Obter o tamanho das informações da versão
  Size := GetFileVersionInfoSize(PChar(ParamStr(0)), Handle);
  if Size > 0 then
  begin
    GetMem(Buffer, Size);
    try
      // Obter as informações da versão
      if GetFileVersionInfo(PChar(ParamStr(0)), Handle, Size, Buffer) then
      begin
        if VerQueryValue(Buffer, '\', Pointer(FileInfo), FileInfoSize) then
        begin
          // Extrair os números de versão
          Major := HiWord(FileInfo.dwFileVersionMS);
          Minor := LoWord(FileInfo.dwFileVersionMS);
          Release := HiWord(FileInfo.dwFileVersionLS);
          Build := LoWord(FileInfo.dwFileVersionLS);

          // Formatar a versão como string
          Result := Format('Versão %d.%d.%d.%d', [Major, Minor, Release, Build]);
        end;
      end;
    finally
      FreeMem(Buffer);
    end;
  end;
end;

Class Function TConeSul.GenerateRandomCode(CodeLength: Integer): string;
const
  Chars = '0123456789';//ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789
var
  i: Integer;
begin
  Randomize;
  Result := '';
  for i := 1 to CodeLength do
    Result := Result + Chars[Random(System.Length(Chars)) + 1];
end;

Class Function TConeSul.GerarGuid:String;
var
  NewGUID: TGUID;
  GuidFormatada:string;
begin
  Result  := '';
  CoInitialize(nil);
  Try

    //Criar a Guid
    CreateGUID(NewGUID);

    //Devolver em string
    GuidFormatada   := GuidTostring(NewGUID);
    Result          := RemoverChaves(GuidFormatada);

  Finally
    CoUninitialize;
  End;
end;

class procedure TConeSul.GerarQRCode(imgQrCode: TImage; Str: string);
var
  QRCode: TDelphiZXingQRCode;
  Row, Column: Integer;
  pixelColor: TColor;
  Bitmap: Vcl.Graphics.TBitmap;
begin
  QRCode := TDelphiZXingQRCode.Create;

  try
    // Configurando os parâmetros do QR Code
    QRCode.Data     := Trim(Str);
    QRCode.Encoding := TQRCodeEncoding.qrAuto;
    QRCode.QuietZone:= 4;

    // Criando um bitmap para desenhar o QR Code
    Bitmap := Vcl.Graphics.TBitmap.Create;

    try
      Bitmap.PixelFormat := pf24bit; // Configurando o formato do bitmap
      Bitmap.SetSize(QRCode.Rows, QRCode.Columns);

      // Desenhando os pixels do QR Code no bitmap
      for Row := 0 to QRCode.Rows - 1 do
      begin
        for Column := 0 to QRCode.Columns - 1 do
        begin
          if QRCode.IsBlack[Row, Column] then
            pixelColor := clBlack
          else
            pixelColor := clWhite;

          // Definindo a cor do pixel no bitmap
          Bitmap.Canvas.Pixels[Column, Row] := pixelColor;
        end;
      end;

      // Carregando o bitmap no TImage
      imgQRCode.Picture.Assign(Bitmap);
    finally
      Bitmap.Free; // Liberando o bitmap
    end;
  finally
    QRCode.Free; // Liberando o objeto QRCode
  end;
end;

class function TConeSul.RemoverChaves(const AString: string): string;
begin
  Result := StringReplace(AString, '{', '', [rfReplaceAll]);
  Result := StringReplace(Result, '}', '', [rfReplaceAll]);
end;

class function TConeSul.PartePorExtenso(Parte, Nivel: Integer): string;
const
  Unidade: array[1..19] of string = ('Um', 'Dois', 'Três', 'Quatro', 'Cinco',
                                     'Seis', 'Sete', 'Oito', 'Nove', 'Dez',
                                     'Onze', 'Doze', 'Treze', 'Quatorze',
                                     'Quinze', 'Dezesseis', 'Dezessete',
                                     'Dezoito', 'Dezenove');
  Dezena: array[2..9] of string = ('Vinte', 'Trinta', 'Quarenta', 'Cinquenta',
                                   'Sessenta', 'Setenta', 'Oitenta', 'Noventa');
  Centena: array[1..9] of string = ('Cento', 'Duzentos', 'Trezentos', 'Quatrocentos',
                                    'Quinhentos', 'Seiscentos', 'Setecentos',
                                    'Oitocentos', 'Novecentos');
  Milhares: array[1..4] of string = ('Mil', 'Milhão', 'Milhões', 'Bilhão');
var
  Extenso: string;
begin
  Extenso := '';

  if Parte = 100 then
    Extenso := 'Cem'
  else if Parte > 100 then
    Extenso := Centena[Parte div 100] + ' ';

  Parte := Parte mod 100;

  if Parte > 19 then
  begin
    Extenso := Extenso + Dezena[Parte div 10];
    if Parte mod 10 > 0 then
      Extenso := Extenso + ' e ' + Unidade[Parte mod 10];
  end
  else if Parte > 0 then
    Extenso := Extenso + Unidade[Parte];

  if (Nivel > 0) and (Parte > 0) then
    Extenso := Extenso + ' ' + Milhares[Nivel];

  Result := Trim(Extenso);
end;

class function TConeSul.NumeroPorExtenso(Numero: Int64): string;
var
  Parte: array[1..4] of Integer;
  Extenso: string;
begin
  if Numero = 0 then
    Exit('Zero');

  if Numero < 0 then
    Exit('Menos ' + NumeroPorExtenso(-Numero));

  Parte[1] := Numero mod 1000;
  Parte[2] := (Numero div 1000) mod 1000;
  Parte[3] := (Numero div 1000000) mod 1000;
  Parte[4] := (Numero div 1000000000) mod 1000;

  Extenso := '';

  if Parte[4] > 0 then
    Extenso := Extenso + PartePorExtenso(Parte[4], 3) + ', ';

  if Parte[3] > 0 then
    Extenso := Extenso + PartePorExtenso(Parte[3], 2) + ', ';

  if Parte[2] > 0 then
    Extenso := Extenso + PartePorExtenso(Parte[2], 1) + ', ';

  Extenso := Extenso + PartePorExtenso(Parte[1], 0);

  // Limpeza de vírgulas extras
  Result := StringReplace(Extenso, ', ,', ',', [rfReplaceAll]);
  Result := Trim(Result);
end;

class function TConeSul.valorPorExtenso(vlr: real): string;
const
  UNIDADE: array[1..19] of string = ('UM', 'DOIS', 'TRÊS', 'QUATRO', 'CINCO',
             'SEIS', 'SETE', 'OITO', 'NOVE', 'DEZ', 'ONZE',
             'DOZE', 'TREZE', 'QUATORZE', 'QUINZE', 'DEZESSEIS',
             'DEZESSETE', 'DEZOITO', 'DEZENOVE');
  CENTENA: array[1..9] of string = ('CENTO', 'DUZENTOS', 'TREZENTOS',
             'QUATROCENTOS', 'QUINHENTOS', 'SEISCENTOS',
             'SETECENTOS', 'OITOCENTOS', 'NOVECENTOS');
  DEZENA: array[2..9] of string = ('VINTE', 'TRINTA', 'QUARENTA', 'CINQUENTA',
             'SESSENTA', 'SETENTA', 'OITENTA', 'NOVENTA');
  QUALIFICAS: array[0..4] of string = ('', 'MIL', 'MILHÃO', 'BILHÃO', 'TRILHÃO');
  QUALIFICAP: array[0..4] of string = ('', 'MIL', 'MILHÕES', 'BILHÕES', 'TRILHÕES');
var
                        inteiro: Int64;
                          resto: real;
  vlrS, s, saux, vlrP, centavos: string;
     n, unid, dez, cent, tam, i: integer;
                    umReal, tem: boolean;
begin
  if (vlr = 0)
     then begin
            valorPorExtenso := 'ZERO';
            exit;
          end;
  inteiro := trunc(vlr); // parte inteira do valor
  resto := vlr - inteiro; // parte fracionária do valor
  vlrS := inttostr(inteiro);
  if (length(vlrS) > 15)
     then begin
            valorPorExtenso := 'Erro: valor superior a 999 trilhões.';
            exit;
          end;
  s := '';
  centavos := inttostr(round(resto * 100));
// definindo o extenso da parte inteira do valor
  i := 0;
  umReal := false; tem := false;
  while (vlrS <> '0') do
  begin
    tam := length(vlrS);
// retira do valor a 1a. parte, 2a. parte, por exemplo, para 123456789:
// 1a. parte = 789 (centena)
// 2a. parte = 456 (mil)
// 3a. parte = 123 (milhões)
    if (tam > 3)
       then begin
              vlrP := copy(vlrS, tam-2, tam);
              vlrS := copy(vlrS, 1, tam-3);
            end
    else begin // última parte do valor
           vlrP := vlrS;
           vlrS := '0';
         end;
    if (vlrP <> '000')
       then begin
              saux := '';
              if (vlrP = '100')
                 then saux := 'CEM'
              else begin
                     n := strtoint(vlrP);        // para n = 371, tem-se:
                     cent := n div 100;          // cent = 3 (centena trezentos)
                     dez := (n mod 100) div 10;  // dez  = 7 (dezena setenta)
                     unid := (n mod 100) mod 10; // unid = 1 (unidade um)
                     if (cent <> 0)
                        then saux := centena[cent];
                     if ((dez <> 0) or (unid <> 0))
                        then begin
                               if ((n mod 100) <= 19)
                                  then begin
                                         if (length(saux) <> 0)
                                            then saux := saux + ' E ' + unidade[n mod 100]
                                         else saux := unidade[n mod 100];
                                       end
                               else begin
                                      if (length(saux) <> 0)
                                         then saux := saux + ' E ' + dezena[dez]
                                      else saux := dezena[dez];
                                      if (unid <> 0)
                                         then if (length(saux) <> 0)
                                                 then saux := saux + ' E ' + unidade[unid]
                                              else saux := unidade[unid];
                                    end;
                             end;
                   end;
              if ((vlrP = '1') or (vlrP = '001'))
                 then begin
                        if (i = 0) // 1a. parte do valor (um real)
                           then umReal := true
                        else saux := saux + ' ' + qualificaS[i];
                      end
              else if (i <> 0)
                      then saux := saux + ' ' + qualificaP[i];
              if (length(s) <> 0)
                 then s := saux + ', ' + s
              else s := saux;
            end;
    if (((i = 0) or (i = 1)) and (length(s) <> 0))
       then tem := true; // tem centena ou mil no valor
    i := i + 1; // próximo qualificador: 1- mil, 2- milhão, 3- bilhão, ...
  end;
  if (length(s) <> 0)
     then begin
            if (umReal)
               then s := s + ' REAL'
            else if (tem)
                    then s := s + ' REAIS'
                 else s := s + ' DE REAIS';
          end;
// definindo o extenso dos centavos do valor
  if (centavos <> '0') // valor com centavos
     then begin
            if (length(s) <> 0) // se não é valor somente com centavos
               then s := s + ' E ';
            if (centavos = '1')
               then s := s + 'UM CENTAVO'
            else begin
                   n := strtoint(centavos);
                   if (n <= 19)
                      then s := s + unidade[n]
                   else begin                 // para n = 37, tem-se:
                          unid := n mod 10;   // unid = 37 % 10 = 7 (unidade sete)
                          dez := n div 10;    // dez  = 37 / 10 = 3 (dezena trinta)
                          s := s + dezena[dez];
                          if (unid <> 0)
                             then s := s + ' E ' + unidade[unid];
                       end;
                   s := s + ' CENTAVOS';
                 end;
          end;
  valorPorExtenso := s;
end;

class Function TConeSul.GravarLogErroRtti(obj: TObject; msgErro:String): String;
var
  lContexto : TRttiContext;
  lTipo     : TRttitype;
  lProperty : TRttiProperty;
  lLog      : TStringList;
begin

  lLog  := TStringlist.Create;

  Try
    lLog.Add('Mensagem de erro: ' + msgErro);
    lLog.Add('Class: ' + obj.ClassName);
    lLog.Add('Data e Hora do erro: ' + DateTimeToStr(now));
    lLog.Add('Máquina: '+ ObterNomeDaMaquina);
    lLog.Add('IP: ' + ObterEnderecoIPDaMaquina);
    lLog.Add('');
    lLog.Add('***********************************************');
    lLog.Add('**** Dados do Objeto ****');

    lTipo   := lContexto.GetType(obj.ClassType);

    for lProperty in lTipo.GetProperties do
    begin
      lLog.Add(lProperty.Name + ' = ' + lProperty.GetValue(obj).ToString);
    end;

    Result  := lLog.Text;

  Finally
    lLog.Free;
  End;

end;

class procedure TConeSul.GravarLogErroTXT(const Texto: string);
var
  NomeArquivo, PastaLogs: string;
  Arquivo: TextFile;
  DataHoraAtual: TDateTime;
begin
  DataHoraAtual := Now;

  // Define a pasta "Logs" no mesmo diretório do exe
  PastaLogs := TPath.Combine(ExtractFilePath(ParamStr(0)), 'Logs');

  // Cria a pasta se não existir
  if not TDirectory.Exists(PastaLogs) then
    TDirectory.CreateDirectory(PastaLogs);

  // Monta o nome do arquivo com data e hora
  NomeArquivo := TPath.Combine(PastaLogs,
    Format('LogErro_%s.txt', [FormatDateTime('yyyy_mm_dd_hh_nn', DataHoraAtual)]));

  // Cria/abre o arquivo para escrita
  AssignFile(Arquivo, NomeArquivo);

  if FileExists(NomeArquivo) then
    Append(Arquivo)   // se já existir, adiciona ao final
  else
    Rewrite(Arquivo); // se não existir, cria novo

  try
    Writeln(Arquivo, Texto);
  finally
    CloseFile(Arquivo);
  end;
end;

end.
