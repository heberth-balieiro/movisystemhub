unit Controllers.Auth;

interface

uses Horse,
     Horse.JWT,
     JOSE.Core.JWT,
     JOSE.Types.JSON,
     JOSE.Core.Builder,
     System.JSON,
     System.SysUtils;

const
    SECRET  = 'PASS@Balieiro86';

    Function GerarToken(const Issuer, subj, id:String):String;
    function DecodeJWT(const Token: String): String;
    Function extrairDados(out nome, cpf:string; out id:integer; out validade:Int64; const token:string):boolean;

implementation

Function GerarToken(const Issuer, subj, id:String):String;
var
  LJWT: TJWT;
begin
  LJWT := TJWT.Create;
  try
    LJWT.Claims.Issuer        := Issuer;
    LJWT.Claims.Subject       := subj;
    LJWT.Claims.JWTId         := id;
    LJWT.Claims.Expiration    := Now + (1 / 24); // Expira em 1 hora
    Result := TJOSE.SHA256CompactToken(SECRET, LJWT);
  finally
    LJWT.Free;
  end;
end;

function DecodeJWT(const Token: String): String;
var
  LToken: TJWT;
begin
  Result := '';

  LToken := TJOSE.DeserializeCompact(SECRET,Token);
  try
    if Assigned(LToken) then
      Result  := LToken.Claims.JSON.ToJSON;
  finally
    LToken.Free;
  end;

end;

Function Extrairdados(out nome, cpf:string; out id:integer; out validade:Int64; const token:string):Boolean;
var
JsonObject: TJSONObject;
DecodedToken: String;
begin

  result  := False;

  DecodedToken := DecodeJWT(Token);
  if DecodedToken = '' then
    Exit;


  Try
    JsonObject := TJSONObject.ParseJSONValue(DecodedToken) as TJSONObject;
    Try
      if Assigned(JsonObject) then
      begin
        Nome  := JsonObject.GetValue<string>('iss');
        CPF      := JsonObject.GetValue<string>('sub');
        Id       := JsonObject.GetValue<Integer>('jti');
        Validade := JsonObject.GetValue<int64>('exp');
        Result := True;
      end;
    Finally
      JsonObject.Free;
    End;
  except on e:exception do
    raise Exception.Create(e.Message);
  End;
end;

end.
