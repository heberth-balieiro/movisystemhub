unit OAuth2.Outlook;

interface

uses
   OAuth2;

type
   TOutlookOAuth = class(TOAuth2)
   public
      constructor Create(const pConfig: TConfigOAuth); reintroduce;
   end;

implementation

{ TOutlookOAuth }

constructor TOutlookOAuth.Create(const pConfig: TConfigOAuth);
begin
   inherited Create(pConfig);
   fOAuth2.AuthorizationEndpoint := 'https://login.microsoftonline.com/common/oauth2/v2.0/authorize';
   fOAuth2.AccessTokenEndpoint := 'https://login.microsoftonline.com/common/oauth2/v2.0/token';
   fOAuth2.Scope := 'https://outlook.office.com/SMTP.Send offline_access';
   fOAuth2.RedirectionEndpoint := 'http://localhost:3000/oauth';
end;

end.

