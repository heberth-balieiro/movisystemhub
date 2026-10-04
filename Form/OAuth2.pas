unit OAuth2;

interface

uses
   Classes,
   SysUtils,
   DateUtils,
   Types,
   Winapi.ShellAPI,
   REST.Authenticator.OAuth,
   REST.Client,
   REST.Types,
   IdHTTPServer,
   IdURI,
   IdContext,
   IdCustomHTTPServer,
   IdSASL,
   IPPeerClient;

type
   TEnhancedOAuth2Authenticator = class(TOAuth2Authenticator)
   private
      procedure RequestNewAcessToken;
   end;

   TOnGenerateToken = procedure(const pAcessToken, pRefreshToken: string; const pDataExpiracao: TDateTime) of object;

   TConfigOAuth = record
      ClientID: string;
      ClientSecret: string;
      AccessToken: string;
      RefreshToken: string;
      RedirectionEndpoint: string;
      TokenExpiry: TDateTime;
      OnGenerateToken: TOnGenerateToken;
   end;

   TOAuth2 = class
   protected
      fOAuth2: TEnhancedOAuth2Authenticator;
      fHTTPServer: TIdHTTPServer;
      fOnGenerateToken: TOnGenerateToken;
      procedure OnHTTPServerCommandGet(AContext: TIdContext; ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
   public
      constructor Create(const pConfig: TConfigOAuth); reintroduce;
      destructor Destroy; override;

      function Authenticate(const OpenUrl: Boolean = true): string;
      function RefreshNewToken: Boolean;
      function getAccessToken: string;
      function getTokenExpiry: TDateTime;
   end;

implementation

uses
   REST.Utils,
   System.Net.URLClient;

{ TOAuth2 }

constructor TOAuth2.Create(const pConfig: TConfigOAuth);
begin
   inherited Create;

   fOAuth2                        := TEnhancedOAuth2Authenticator.Create(nil);
   fOAuth2.ClientID               := pConfig.ClientId;
   fOAuth2.ClientSecret           := pConfig.ClientSecret;
   fOAuth2.AccessToken            := pConfig.AccessToken;
   fOAuth2.RefreshToken           := pConfig.RefreshToken;
   fOAuth2.AccessTokenExpiry      := pConfig.TokenExpiry;
   fOAuth2.RedirectionEndpoint    := pConfig.RedirectionEndpoint;
   if fOAuth2.RedirectionEndpoint = '' then
      fOAuth2.RedirectionEndpoint := 'http://localhost:3000';

   fHTTPServer := TIdHTTPServer.Create(nil);
   fHTTPServer.OnCommandGet := OnHTTPServerCommandGet;
   fHTTPServer.DefaultPort := 3000;

   fOnGenerateToken := pConfig.OnGenerateToken;
end;

destructor TOAuth2.Destroy;
begin
   fOAuth2.free;
   fHTTPServer.free;
   inherited Destroy;
end;

function TOAuth2.Authenticate(const OpenUrl: Boolean): string;
var
   uri: TURI;
begin
   Result := fOAuth2.AuthorizationRequestURI + '&access_type=offline';

   if fOAuth2.AccessToken = '' then
   begin
      if OpenUrl then
      begin
         fHTTPServer.Active := True;
         uri := TURI.Create(Result);
         ShellExecute(0, 'open', PWideChar(uri.ToString), nil, nil, 0);
      end;
   end;
end;

function TOAuth2.getAccessToken: string;
begin
   Result := fOAuth2.AccessToken;
end;

function TOAuth2.getTokenExpiry: TDateTime;
begin
   Result := fOAuth2.AccessTokenExpiry;
end;

procedure TOAuth2.OnHTTPServerCommandGet(AContext: TIdContext; ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
   Code, msg: string;
   uri: TURI;
begin
   msg := 'Ocorreu um problema na autenticação.';

   if ARequestInfo.QueryParams = '' then
      Exit;

   uri := TURI.Create(fOAuth2.RedirectionEndpoint + '?' + ARequestInfo.QueryParams);
   try
      Code := uri.ParameterByName['code'];

      fOAuth2.AuthCode := Code;
      fOAuth2.ChangeAuthCodeToAccesToken;

      if Assigned(fOnGenerateToken) then
         fOnGenerateToken(fOAuth2.AccessToken, fOAuth2.RefreshToken, fOAuth2.AccessTokenExpiry);

      msg := 'Autenticação realizada com sucesso.';
   except
      Exit;
   end;

   AResponseInfo.ContentText := Format('<!DOCTYPE html><html lang="en"><head><title>Autenticação</title>'
      + '</head><body><h2>%s</h2></body></html>', [msg]);
end;

function TOAuth2.RefreshNewToken: Boolean;
begin
   Result := False;
   if CompareTime(fOAuth2.AccessTokenExpiry, now) = LessThanValue then
   begin
      fOAuth2.RequestNewAcessToken;
      Result := true;
   end;
end;

{ TEnhancedOAuth2Authenticator }

procedure TEnhancedOAuth2Authenticator.RequestNewAcessToken;
var
   LClient: TRestClient;
   LRequest: TRESTRequest;
   LToken: string;
   LIntValue: int64;
begin
   if ClientID = '' then
      raise EOAuth2Exception.Create('Client ID vazio.');

   if RefreshToken = '' then
      raise EOAuth2Exception.Create('Token vazio.');

   LClient := TRestClient.Create(AccessTokenEndpoint);
   LRequest := TRESTRequest.Create(LClient);
   try
      LRequest.Method := TRESTRequestMethod.rmPOST;
      LRequest.AddAuthParameter('refresh_token', RefreshToken, TRESTRequestParameterKind.pkGETorPOST);
      LRequest.AddAuthParameter('client_id', ClientID, TRESTRequestParameterKind.pkGETorPOST);
      LRequest.AddAuthParameter('client_secret', ClientSecret, TRESTRequestParameterKind.pkGETorPOST);
      LRequest.AddAuthParameter('grant_type', 'refresh_token', TRESTRequestParameterKind.pkGETorPOST);

      LRequest.Execute;

      if LRequest.Response.GetSimpleValue('access_token', LToken) then
         AccessToken := LToken;
      if LRequest.Response.GetSimpleValue('refresh_token', LToken) then
         RefreshToken := LToken;

      if LRequest.Response.GetSimpleValue('token_type', LToken) then
         TokenType := OAuth2TokenTypeFromString(LToken);

      if LRequest.Response.GetSimpleValue('expires_in', LToken) then
      begin
         LIntValue := StrToIntdef(LToken, -1);
         if (LIntValue > -1) then
            AccessTokenExpiry := IncSecond(now, LIntValue)
         else
            AccessTokenExpiry := 0.0;
      end;

      if (AccessToken <> '') then
      begin
         AuthCode := '';
      end;
   finally
      FreeAndNil(LClient);
   end;
end;

end.