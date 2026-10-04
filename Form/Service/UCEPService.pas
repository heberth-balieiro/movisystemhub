unit UCEPService;

interface

uses
  SysUtils, Classes, ACBrCEP, Uni, Udm;

type
  TCEPResultado = record
    CEP: string;
    Logradouro: string;
    Complemento: string;
    Bairro: string;
    Municipio: string;
    UF: string;
    IBGE: string;
    DDD: string;
    Gia: string;
    IdCidade :integer;
  end;

  ICEPService = interface
    ['{17AC23C6-7E9E-4FF6-A3DE-6B7C7E7BAF91}']// 1STa9eKhhfKvc7Ljh6W6CO5Kr/bFOl.
    function Buscar(const ACEP: string; out AResult: TCEPResultado; out AErro: string): Boolean;
  end;

  TCEPService = class(TInterfacedObject, ICEPService)
  private
    FCEP: TACBrCEP;
    FLastResult: TCEPResultado;
    FLastError: string;
    FHasResult: Boolean;

    procedure CEPBuscaEfetuada(Sender: TObject);
    function OnlyDigits(const S: string): string;
    Function BuscarCidadeMunicipio(aibge,acidade:string):Integer;

    procedure ResetState;
  public
    constructor Create(AWebService: TACBrCEPWebService = wsViaCEP; ATimeoutMS: Integer = 8000);
    destructor Destroy; override;

    function Buscar(const ACEP: string; out AResult: TCEPResultado; out AErro: string): Boolean;

    property ACBrCEP: TACBrCEP read FCEP;
  end;

implementation

{ TCEPService }

Function TCEPService.BuscarCidadeMunicipio(aibge,acidade:string):Integer;
var
  Qry: TUniQuery;
Const
  QryStr  = 'SELECT id_cidade FROM cidade WHERE (                           '+
              ' NULLIF(:ibge, '') IS NOT NULL  AND ibge = :ibge) OR (       '+
              ' NULLIF(:ibge, '') IS NULL AND UPPER(TRIM(cidade)) = UPPER(TRIM(:cidade)))'+
              ' LIMIT 1;';
begin
  Result := 0;
  Qry    := TUniQuery.Create(nil);
  try
    Try
      Qry.Connection := dm.conn;
      Qry.SQL.Text := QryStr;
      if aibge = '' then
      Qry.ParamByName('ibge').AsInteger     := 0
      else
      Qry.ParamByName('ibge').AsInteger     := StrToInt(aibge);
      Qry.ParamByName('cidade').AsString    := Acidade;
      Qry.Open;
      if not Qry.IsEmpty then
      begin
        Result := Qry.Fields[0].AsInteger;
      end;
    except on e:Exception do
      begin
        raise Exception.Create('Erro ao verificar BuscarCidadeMunicipio:'+sLineBreak+e.Message);
      end;
    End;
  finally
    Qry.Free;
  end;

end;

constructor TCEPService.Create(AWebService: TACBrCEPWebService; ATimeoutMS: Integer);
begin
  inherited Create;
  FCEP := TACBrCEP.Create(nil);
  FCEP.WebService := AWebService;
  FCEP.TimeOut := ATimeoutMS; // ms
  // Ex.: FCEP.ProxyHost := '...'; FCEP.ChaveAcesso := '...';
end;

destructor TCEPService.Destroy;
begin
  FCEP.Free;
  inherited;
end;

function TCEPService.OnlyDigits(const S: string): string;
var
  C: Char;
begin
  Result := '';
  for C in S do
    if CharInSet(C, ['0'..'9']) then
      Result := Result + C;
end;

procedure TCEPService.ResetState;
begin
  FLastResult := Default(TCEPResultado);
  FLastError  := '';
  FHasResult  := False;
end;

procedure TCEPService.CEPBuscaEfetuada(Sender: TObject);
begin
  // Este handler é disparado pelo componente após a busca
  if (FCEP.Enderecos.Count = 0) then
  begin
    FLastError := 'CEP não encontrado.';
    Exit;
  end;

  with FCEP.Enderecos[0] do
  begin
    FLastResult.CEP := CEP;

    {$IF Declared(TipoLogradouro)}
    FLastResult.Logradouro := Trim(TipoLogradouro + ' ' + Logradouro);
    {$ELSEIF Declared(Tipo_Logradouro)}
    FLastResult.Logradouro := Trim(Tipo_Logradouro + ' ' + Logradouro);
    {$ELSE}
    FLastResult.Logradouro := Logradouro;
    {$IFEND}

    FLastResult.Complemento := Complemento;
    FLastResult.Bairro      := Bairro;
    FLastResult.Municipio   := Municipio;
    FLastResult.UF          := UF;

    {$IF Declared(CodigoIBGE)}
    FLastResult.IBGE        := CodigoIBGE;
    {$ELSEIF Declared(IBGE)}
    FLastResult.IBGE        := IBGE;
    {$IFEND}

    {$IF Declared(DDD)}
    FLastResult.DDD         := DDD;
    {$IFEND}
    {$IF Declared(GIA)}
    FLastResult.Gia         := GIA;
    {$IFEND}
  end;

  FHasResult := True;
end;

function TCEPService.Buscar(const ACEP: string; out AResult: TCEPResultado; out AErro: string): Boolean;
var
  C: string;
begin
  ResetState;
  Result := False;
  AResult := Default(TCEPResultado);
  AErro   := '';

  C := OnlyDigits(ACEP);
  if Length(C) <> 8 then
  begin
    AErro := 'CEP inválido. Informe 8 dígitos.';
    Exit;
  end;

  // Hooka o evento, chama a busca (o handler preenche FLastResult/FHasResult)
  FCEP.OnBuscaEfetuada := CEPBuscaEfetuada;
  try
    // Em algumas versões o método pode ser BuscarPorCEP; ajuste se necessário.
    FCEP.BuscarPorCEP(C);

    if FHasResult then
    begin
      AResult           := FLastResult;
      AResult.IdCidade  := BuscarCidadeMunicipio(FlastResult.IBGE,FlastResult.Municipio);
      Result  := True;
    end
    else
    begin
      if FLastError = '' then
        FLastError := 'CEP não encontrado ou sem retorno do provedor.';
      AErro := FLastError;
    end;
  except
    on E: Exception do
    begin
      AErro := 'Erro ao consultar CEP: ' + E.Message;
      Result := False;
    end;
  end;
  // (Opcional) desliga o evento
  FCEP.OnBuscaEfetuada := nil;
end;

end.

