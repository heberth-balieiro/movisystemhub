unit Service.OFXReader;

interface

uses
  System.SysUtils,
  System.Classes,
  System.DateUtils,
  System.Generics.Collections,
  System.IOUtils,
  System.StrUtils,
  System.Math;

type
  TTipoMovimentoOFX = (
    tmTodos,
    tmCredito,
    tmDebito
  );

  TBancoOFX = (
    boDesconhecido,
    boBancoBrasil,
    boCaixa,
    boSicoob,
    boBradesco,
    boBancoAmazonia,
    boInter,
    boNubank,
    boSantander
  );

  TTransacaoOFX = class
  private
    FDataMovimento: TDateTime;
    FDataDisponivel: TDateTime;
    FValor: Currency;
    FTipoOFX: string;
    FTipoMovimento: string;
    FDocumento: string;
    FFitID: string;
    FHistorico: string;
    FMemo: string;
    FNome: string;
    FCodigoBanco: string;
    FAgencia: string;
    FConta: string;
    FBanco: TBancoOFX;
    FSelecionado: Boolean;
    FConciliado: Boolean;
  public
    property DataMovimento: TDateTime
      read FDataMovimento write FDataMovimento;

    property DataDisponivel: TDateTime
      read FDataDisponivel write FDataDisponivel;

    property Valor: Currency
      read FValor write FValor;

    property TipoOFX: string
      read FTipoOFX write FTipoOFX;

    // C = Crédito / D = Débito
    property TipoMovimento: string
      read FTipoMovimento write FTipoMovimento;

    property Documento: string
      read FDocumento write FDocumento;

    property FitID: string
      read FFitID write FFitID;

    property Historico: string
      read FHistorico write FHistorico;

    property Memo: string
      read FMemo write FMemo;

    property Nome: string
      read FNome write FNome;

    property CodigoBanco: string
      read FCodigoBanco write FCodigoBanco;

    property Agencia: string
      read FAgencia write FAgencia;

    property Conta: string
      read FConta write FConta;

    property Banco: TBancoOFX
      read FBanco write FBanco;

    property Selecionado: Boolean
      read FSelecionado write FSelecionado;

    property Conciliado: Boolean
      read FConciliado write FConciliado;
  end;

  TDocumentoOFX = class
  private
    FBanco: TBancoOFX;
    FNomeBanco: string;
    FCodigoBanco: string;
    FAgencia: string;
    FConta: string;
    FTipoConta: string;
    FDataInicial: TDateTime;
    FDataFinal: TDateTime;
    FSaldoFinal: Currency;
    FTransacoes: TObjectList<TTransacaoOFX>;
  public
    constructor Create;
    destructor Destroy; override;

    property Banco: TBancoOFX
      read FBanco write FBanco;

    property NomeBanco: string
      read FNomeBanco write FNomeBanco;

    property CodigoBanco: string
      read FCodigoBanco write FCodigoBanco;

    property Agencia: string
      read FAgencia write FAgencia;

    property Conta: string
      read FConta write FConta;

    property TipoConta: string
      read FTipoConta write FTipoConta;

    property DataInicial: TDateTime
      read FDataInicial write FDataInicial;

    property DataFinal: TDateTime
      read FDataFinal write FDataFinal;

    property SaldoFinal: Currency
      read FSaldoFinal write FSaldoFinal;

    property Transacoes: TObjectList<TTransacaoOFX>
      read FTransacoes;
  end;

  TOFXReader = class
  private
    class function LerArquivoTexto(
      const AArquivo: string
    ): string; static;

    class function ExtrairTag(
      const ATexto: string;
      const ATag: string
    ): string; static;

    class function ExtrairBlocos(
      const ATexto: string;
      const ATag: string
    ): TArray<string>; static;

    class function ConverterDataOFX(
      const AValor: string
    ): TDateTime; static;

    class function ConverterValorOFX(
      const AValor: string
    ): Currency; static;

    class function LimparTexto(
      const AValor: string
    ): string; static;

    class function IdentificarBanco(
      const ACodigoBanco: string;
      const AOrganizacao: string
    ): TBancoOFX; static;

    class function ObterNomeBanco(
      const ABanco: TBancoOFX
    ): string; static;

    class function DefinirTipoMovimento(
      const AValor: Currency
    ): string; static;

    class function MontarHistorico(
      const ANome: string;
      const AMemo: string
    ): string; static;

  public
    class function LerArquivo(
      const AArquivo: string
    ): TDocumentoOFX; static;

    class function FiltrarTransacoes(
      const ADocumento: TDocumentoOFX;
      const ADataInicial: TDateTime;
      const ADataFinal: TDateTime;
      const ATipo: TTipoMovimentoOFX
    ): TList<TTransacaoOFX>; static;
  end;

implementation

{ TDocumentoOFX }

constructor TDocumentoOFX.Create;
begin
  inherited Create;

  FTransacoes := TObjectList<TTransacaoOFX>.Create(True);
end;

destructor TDocumentoOFX.Destroy;
begin
  FTransacoes.Free;

  inherited;
end;

{ TOFXReader }

class function TOFXReader.LerArquivoTexto(
  const AArquivo: string
): string;
var
  Bytes: TBytes;
  ConteudoInicial: string;
  Encoding: TEncoding;
  LiberarEncoding: Boolean;
begin
  if not FileExists(AArquivo) then
    raise Exception.CreateFmt(
      'O arquivo OFX não foi encontrado:%s%s',
      [sLineBreak, AArquivo]
    );

  Bytes := TFile.ReadAllBytes(AArquivo);

  if Length(Bytes) = 0 then
    raise Exception.Create('O arquivo OFX está vazio.');

  Encoding := nil;
  LiberarEncoding := False;

  try
    // UTF-8 com BOM
    if (Length(Bytes) >= 3) and
       (Bytes[0] = $EF) and
       (Bytes[1] = $BB) and
       (Bytes[2] = $BF) then
    begin
      Encoding := TEncoding.UTF8;
    end
    // UTF-16 LE
    else if (Length(Bytes) >= 2) and
            (Bytes[0] = $FF) and
            (Bytes[1] = $FE) then
    begin
      Encoding := TEncoding.Unicode;
    end
    // UTF-16 BE
    else if (Length(Bytes) >= 2) and
            (Bytes[0] = $FE) and
            (Bytes[1] = $FF) then
    begin
      Encoding := TEncoding.BigEndianUnicode;
    end
    else
    begin
      // Primeiro tenta identificar o cabeçalho em ANSI.
      ConteudoInicial := TEncoding.ANSI.GetString(Bytes);

      if ContainsText(ConteudoInicial, 'ENCODING:UTF-8') or
         ContainsText(ConteudoInicial, 'CHARSET:UTF-8') or
         ContainsText(ConteudoInicial, 'CHARSET:65001') then
      begin
        Encoding := TEncoding.UTF8;
      end
      else if ContainsText(ConteudoInicial, 'CHARSET:1252') or
              ContainsText(ConteudoInicial, 'CHARSET:WINDOWS-1252') then
      begin
        Encoding := TEncoding.GetEncoding(1252);
        LiberarEncoding := True;
      end
      else
      begin
        Encoding := TEncoding.ANSI;
      end;
    end;

    Result := Encoding.GetString(Bytes);
  finally
    if LiberarEncoding then
      Encoding.Free;
  end;
end;

class function TOFXReader.ExtrairTag(
  const ATexto: string;
  const ATag: string
): string;
var
  TextoUpper: string;
  TagUpper: string;
  MarcadorInicial: string;
  MarcadorFinal: string;
  PosInicial: Integer;
  PosFinal: Integer;
  PosQuebra: Integer;
  PosProximaTag: Integer;
begin
  Result := '';

  TextoUpper := UpperCase(ATexto);
  TagUpper := UpperCase(ATag);

  MarcadorInicial := '<' + TagUpper + '>';
  MarcadorFinal := '</' + TagUpper + '>';

  PosInicial := Pos(MarcadorInicial, TextoUpper);

  if PosInicial = 0 then
    Exit;

  Inc(PosInicial, Length(MarcadorInicial));

  PosFinal := PosEx(MarcadorFinal, TextoUpper, PosInicial);

  // OFX XML: possui tag de fechamento.
  if PosFinal > 0 then
  begin
    Result := Copy(
      ATexto,
      PosInicial,
      PosFinal - PosInicial
    );

    Exit(LimparTexto(Result));
  end;

  // OFX SGML: muitas tags não possuem fechamento.
  PosQuebra := PosEx(#10, ATexto, PosInicial);
  PosProximaTag := PosEx('<', ATexto, PosInicial);

  if (PosQuebra = 0) and (PosProximaTag = 0) then
    PosFinal := Length(ATexto) + 1
  else if PosQuebra = 0 then
    PosFinal := PosProximaTag
  else if PosProximaTag = 0 then
    PosFinal := PosQuebra
  else
    PosFinal := Min(PosQuebra, PosProximaTag);

  Result := Copy(
    ATexto,
    PosInicial,
    PosFinal - PosInicial
  );

  Result := LimparTexto(Result);
end;

class function TOFXReader.ExtrairBlocos(
  const ATexto: string;
  const ATag: string
): TArray<string>;
var
  Lista: TList<string>;
  TextoUpper: string;
  MarcadorInicial: string;
  MarcadorFinal: string;
  PosInicial: Integer;
  PosFinal: Integer;
  ProximoInicio: Integer;
  InicioBusca: Integer;
begin
  Lista := TList<string>.Create;
  try
    TextoUpper := UpperCase(ATexto);

    MarcadorInicial := '<' + UpperCase(ATag) + '>';
    MarcadorFinal := '</' + UpperCase(ATag) + '>';

    InicioBusca := 1;

    while True do
    begin
      PosInicial := PosEx(
        MarcadorInicial,
        TextoUpper,
        InicioBusca
      );

      if PosInicial = 0 then
        Break;

      PosFinal := PosEx(
        MarcadorFinal,
        TextoUpper,
        PosInicial + Length(MarcadorInicial)
      );

      if PosFinal > 0 then
      begin
        Lista.Add(
          Copy(
            ATexto,
            PosInicial,
            PosFinal + Length(MarcadorFinal) - PosInicial
          )
        );

        InicioBusca := PosFinal + Length(MarcadorFinal);
      end
      else
      begin
        // Suporte para alguns arquivos SGML sem </STMTTRN>.
        ProximoInicio := PosEx(
          MarcadorInicial,
          TextoUpper,
          PosInicial + Length(MarcadorInicial)
        );

        if ProximoInicio = 0 then
        begin
          Lista.Add(
            Copy(
              ATexto,
              PosInicial,
              Length(ATexto) - PosInicial + 1
            )
          );

          Break;
        end;

        Lista.Add(
          Copy(
            ATexto,
            PosInicial,
            ProximoInicio - PosInicial
          )
        );

        InicioBusca := ProximoInicio;
      end;
    end;

    Result := Lista.ToArray;
  finally
    Lista.Free;
  end;
end;

class function TOFXReader.ConverterDataOFX(
  const AValor: string
): TDateTime;
var
  Valor: string;
  Ano: Word;
  Mes: Word;
  Dia: Word;
  Hora: Word;
  Minuto: Word;
  Segundo: Word;
begin
  Result := 0;

  Valor := Trim(AValor);

  if Length(Valor) < 8 then
    Exit;

  Ano := StrToIntDef(Copy(Valor, 1, 4), 0);
  Mes := StrToIntDef(Copy(Valor, 5, 2), 0);
  Dia := StrToIntDef(Copy(Valor, 7, 2), 0);

  Hora := 0;
  Minuto := 0;
  Segundo := 0;

  if Length(Valor) >= 10 then
    Hora := StrToIntDef(Copy(Valor, 9, 2), 0);

  if Length(Valor) >= 12 then
    Minuto := StrToIntDef(Copy(Valor, 11, 2), 0);

  if Length(Valor) >= 14 then
    Segundo := StrToIntDef(Copy(Valor, 13, 2), 0);

  if not TryEncodeDateTime(
    Ano,
    Mes,
    Dia,
    Hora,
    Minuto,
    Segundo,
    0,
    Result
  ) then
    Result := 0;
end;

class function TOFXReader.ConverterValorOFX(
  const AValor: string
): Currency;
var
  Valor: string;
  FormatSettings: TFormatSettings;
begin
  Result := 0;

  Valor := Trim(AValor);

  if Valor = '' then
    Exit;

  FormatSettings := TFormatSettings.Create;
  FormatSettings.DecimalSeparator := '.';
  FormatSettings.ThousandSeparator := ',';

  if not TryStrToCurr(Valor, Result, FormatSettings) then
  begin
    Valor := StringReplace(Valor, ',', '.', [rfReplaceAll]);

    TryStrToCurr(Valor, Result, FormatSettings);
  end;
end;

class function TOFXReader.LimparTexto(
  const AValor: string
): string;
begin
  Result := Trim(AValor);

  Result := StringReplace(
    Result,
    '&AMP;',
    '&',
    [rfReplaceAll, rfIgnoreCase]
  );

  Result := StringReplace(
    Result,
    '&LT;',
    '<',
    [rfReplaceAll, rfIgnoreCase]
  );

  Result := StringReplace(
    Result,
    '&GT;',
    '>',
    [rfReplaceAll, rfIgnoreCase]
  );

  Result := StringReplace(
    Result,
    '&QUOT;',
    '"',
    [rfReplaceAll, rfIgnoreCase]
  );

  Result := StringReplace(
    Result,
    '&#39;',
    '''',
    [rfReplaceAll, rfIgnoreCase]
  );

  Result := StringReplace(
    Result,
    #13,
    ' ',
    [rfReplaceAll]
  );

  Result := StringReplace(
    Result,
    #10,
    ' ',
    [rfReplaceAll]
  );

  while Pos('  ', Result) > 0 do
  begin
    Result := StringReplace(
      Result,
      '  ',
      ' ',
      [rfReplaceAll]
    );
  end;
end;

class function TOFXReader.IdentificarBanco(
  const ACodigoBanco: string;
  const AOrganizacao: string
): TBancoOFX;
var
  Codigo: string;
  Organizacao: string;
begin
  Codigo := Trim(ACodigoBanco);
  Organizacao := UpperCase(Trim(AOrganizacao));

  if Codigo = '001' then
    Exit(boBancoBrasil);

  if Codigo = '003' then
    Exit(boBancoAmazonia);

  if Codigo = '033' then
    Exit(boSantander);

  if Codigo = '077' then
    Exit(boInter);

  if Codigo = '104' then
    Exit(boCaixa);

  if Codigo = '237' then
    Exit(boBradesco);

  if Codigo = '260' then
    Exit(boNubank);

  if Codigo = '756' then
    Exit(boSicoob);

  // Identificação alternativa pelo nome da instituição.
  if ContainsText(Organizacao, 'BANCO DO BRASIL') then
    Exit(boBancoBrasil);

  if ContainsText(Organizacao, 'AMAZONIA') or
     ContainsText(Organizacao, 'AMAZÔNIA') then
    Exit(boBancoAmazonia);

  if ContainsText(Organizacao, 'SANTANDER') then
    Exit(boSantander);

  if ContainsText(Organizacao, 'INTER') then
    Exit(boInter);

  if ContainsText(Organizacao, 'CAIXA') then
    Exit(boCaixa);

  if ContainsText(Organizacao, 'BRADESCO') then
    Exit(boBradesco);

  if ContainsText(Organizacao, 'NUBANK') or
     ContainsText(Organizacao, 'NU PAGAMENTOS') then
    Exit(boNubank);

  if ContainsText(Organizacao, 'SICOOB') then
    Exit(boSicoob);

  Result := boDesconhecido;
end;

class function TOFXReader.ObterNomeBanco(
  const ABanco: TBancoOFX
): string;
begin
  case ABanco of
    boBancoBrasil:
      Result := 'Banco do Brasil';

    boCaixa:
      Result := 'Caixa Econômica Federal';

    boSicoob:
      Result := 'Sicoob';

    boBradesco:
      Result := 'Bradesco';

    boBancoAmazonia:
      Result := 'Banco da Amazônia';

    boInter:
      Result := 'Banco Inter';

    boNubank:
      Result := 'Nubank';

    boSantander:
      Result := 'Santander';
  else
    Result := 'Banco não identificado';
  end;
end;

class function TOFXReader.DefinirTipoMovimento(
  const AValor: Currency
): string;
begin
  if AValor < 0 then
    Result := 'D'
  else
    Result := 'C';
end;

class function TOFXReader.MontarHistorico(
  const ANome: string;
  const AMemo: string
): string;
begin
  if (Trim(ANome) <> '') and (Trim(AMemo) <> '') then
  begin
    if SameText(Trim(ANome), Trim(AMemo)) then
      Result := Trim(ANome)
    else
      Result := Trim(ANome) + ' | ' + Trim(AMemo);
  end
  else if Trim(ANome) <> '' then
    Result := Trim(ANome)
  else
    Result := Trim(AMemo);

  Result := LimparTexto(Result);
end;

class function TOFXReader.LerArquivo(
  const AArquivo: string
): TDocumentoOFX;
var
  Conteudo: string;
  Blocos: TArray<string>;
  Bloco: string;
  Transacao: TTransacaoOFX;
  Organizacao: string;
  ValorOriginal: Currency;
begin
  Result := TDocumentoOFX.Create;

  try
    Conteudo := LerArquivoTexto(AArquivo);

    if not ContainsText(Conteudo, '<OFX>') then
      raise Exception.Create(
        'O arquivo selecionado não possui uma estrutura OFX válida.'
      );

    Result.CodigoBanco := ExtrairTag(Conteudo, 'BANKID');
    Result.Agencia := ExtrairTag(Conteudo, 'BRANCHID');
    Result.Conta := ExtrairTag(Conteudo, 'ACCTID');
    Result.TipoConta := ExtrairTag(Conteudo, 'ACCTTYPE');

    Organizacao := ExtrairTag(Conteudo, 'ORG');

    Result.Banco := IdentificarBanco(
      Result.CodigoBanco,
      Organizacao
    );

    Result.NomeBanco := ObterNomeBanco(Result.Banco);

    Result.DataInicial := ConverterDataOFX(
      ExtrairTag(Conteudo, 'DTSTART')
    );

    Result.DataFinal := ConverterDataOFX(
      ExtrairTag(Conteudo, 'DTEND')
    );

    Result.SaldoFinal := ConverterValorOFX(
      ExtrairTag(Conteudo, 'BALAMT')
    );

    Blocos := ExtrairBlocos(
      Conteudo,
      'STMTTRN'
    );

    if Length(Blocos) = 0 then
      raise Exception.Create(
        'Nenhum lançamento foi encontrado no arquivo OFX.'
      );

    for Bloco in Blocos do
    begin
      Transacao := TTransacaoOFX.Create;

      try
        Transacao.DataMovimento := ConverterDataOFX(
          ExtrairTag(Bloco, 'DTPOSTED')
        );

        Transacao.DataDisponivel := ConverterDataOFX(
          ExtrairTag(Bloco, 'DTAVAIL')
        );

        ValorOriginal := ConverterValorOFX(
          ExtrairTag(Bloco, 'TRNAMT')
        );

        Transacao.Valor := Abs(ValorOriginal);

        Transacao.TipoMovimento :=
          DefinirTipoMovimento(ValorOriginal);

        Transacao.TipoOFX := UpperCase(
          ExtrairTag(Bloco, 'TRNTYPE')
        );

        Transacao.Documento := ExtrairTag(
          Bloco,
          'CHECKNUM'
        );

        Transacao.FitID := ExtrairTag(
          Bloco,
          'FITID'
        );

        // Quando não existe CHECKNUM, usa FITID como documento.
        if Trim(Transacao.Documento) = '' then
          Transacao.Documento := Transacao.FitID;

        Transacao.Nome := ExtrairTag(
          Bloco,
          'NAME'
        );

        Transacao.Memo := ExtrairTag(
          Bloco,
          'MEMO'
        );

        Transacao.Historico := MontarHistorico(
          Transacao.Nome,
          Transacao.Memo
        );

        Transacao.CodigoBanco := Result.CodigoBanco;
        Transacao.Agencia := Result.Agencia;
        Transacao.Conta := Result.Conta;
        Transacao.Banco := Result.Banco;

        Transacao.Selecionado := True;
        Transacao.Conciliado := False;

        Result.Transacoes.Add(Transacao);
        Transacao := nil;
      finally
        Transacao.Free;
      end;
    end;

  except
    Result.Free;
    raise;
  end;
end;

class function TOFXReader.FiltrarTransacoes(
  const ADocumento: TDocumentoOFX;
  const ADataInicial: TDateTime;
  const ADataFinal: TDateTime;
  const ATipo: TTipoMovimentoOFX
): TList<TTransacaoOFX>;
var
  Transacao: TTransacaoOFX;
  DataMovimento: TDateTime;
begin
  Result := TList<TTransacaoOFX>.Create;

  if not Assigned(ADocumento) then
    Exit;

  for Transacao in ADocumento.Transacoes do
  begin
    DataMovimento := DateOf(Transacao.DataMovimento);

    if (ADataInicial > 0) and
       (DataMovimento < DateOf(ADataInicial)) then
      Continue;

    if (ADataFinal > 0) and
       (DataMovimento > DateOf(ADataFinal)) then
      Continue;

    case ATipo of
      tmCredito:
        if Transacao.TipoMovimento <> 'C' then
          Continue;

      tmDebito:
        if Transacao.TipoMovimento <> 'D' then
          Continue;
    end;

    // A lista não será proprietária dos objetos.
    Result.Add(Transacao);
  end;
end;

end.
