unit Vcl.PermissaoUsuario;

interface

uses
  System.SysUtils, System.Classes, Uni, UDM, Data.DB;

type
  TPermissaoUsuario = class
  private
    FPerfilID : Integer;
    FTela     : String;
    FPermissoes: TStringList;

    function BuscarPermissoes: Boolean;
  public
    class var FInstance: TPermissaoUsuario;
    constructor Create(APerfilID: Integer; Atela: String);
    destructor Destroy; override;
    function TemPermissao(const NomePermissao: string): Boolean;
    class function GetInstance(APerfilID: Integer; ATela: string): TPermissaoUsuario;
  end;

implementation

{ TPermissaoUsuario }

class function TPermissaoUsuario.GetInstance(APerfilID: Integer; ATela: string): TPermissaoUsuario;
begin
  //etapa 1
  if not Assigned(FInstance) then                              //Verificar se ja tem uma instancia
    FInstance := TPermissaoUsuario.Create(APerfilID, Atela)    // se não ele criar uma nova
  else
  if FInstance.FPerfilID <> APerfilID then
  begin
    FreeAndNil(FInstance);
    FInstance := TPermissaoUsuario.Create(APerfilID, ATela);
  end;

  Result := FInstance;
end;

constructor TPermissaoUsuario.Create(APerfilID: Integer; Atela: String);
begin
  //etapa 2
  FPerfilID         := APerfilID;
  FTela             := ATela;
  FPermissoes       := TStringList.Create;
  BuscarPermissoes; // Carrega as permissões do banco de dados
end;

function TPermissaoUsuario.BuscarPermissoes: Boolean;
var
  Qry: TUniQuery;
begin
  //etapa 3
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    Qry.Connection := dm.Conn;
    Qry.SQL.Text := 'SELECT nome, liberado FROM nivel WHERE id_perfil= :id and tela= :tela';
    Qry.ParamByName('id').AsInteger   := FPerfilID;
    Qry.ParamByName('tela').AsString  := FTela;

    Qry.Open;
    Qry.First;

    FPermissoes.Clear;
    while not Qry.Eof do
    begin
      if Qry.FieldByName('liberado').AsString = 'S' then
      FPermissoes.Add(Qry.FieldByName('nome').AsString);
      Qry.Next;
    end;

    Result := not FPermissoes.Text.IsEmpty;
  finally
    Freeandnil(qry);
  end;
end;


destructor TPermissaoUsuario.Destroy;
begin
  FPermissoes.Free;
  inherited;
end;


function TPermissaoUsuario.TemPermissao(const NomePermissao: string): Boolean;
begin
  Result := FPermissoes.IndexOf(NomePermissao) <> -1;
end;



initialization
  TPermissaoUsuario.FInstance := nil;

finalization
  FreeAndNil(TPermissaoUsuario.FInstance);

end.

