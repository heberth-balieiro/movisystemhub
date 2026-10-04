unit OAuth2.Gmail;

interface

uses
   OAuth2;

type
   TGMailOAuth = class(TOAuth2)
   public
      constructor Create(const pConfig: TConfigOAuth); reintroduce;
   end;

implementation

{ TGMailOAuth }

constructor TGMailOAuth.Create(const pConfig: TConfigOAuth);
begin
   inherited Create(pConfig);
   fOAuth2.AuthorizationEndpoint := 'https://accounts.google.com/o/oauth2/auth';
   fOAuth2.AccessTokenEndpoint := 'https://accounts.google.com/o/oauth2/token';
   fOAuth2.Scope := 'https://mail.google.com/ openid'
end;

end.

