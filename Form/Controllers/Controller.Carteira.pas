unit Controller.Carteira;

interface

uses
  Model.Carteira,
  Dao.Operacoes,
  Dao.Carteira,
  System.SysUtils,
  System.Generics.Collections;

type
  TCarteiraWebController = class
  private
    FDAO: TDAOOperacao<TCarteiraWeb>;
  public
    Constructor Create;
    Destructor Destroy; override;

    Function GravarCarteira(ADoc: TCarteiraWeb; out RetornoID:integer):boolean;
    Function BuscarPorID(AID: Integer): TCarteiraWeb;
    //Function Excluir(AID: Integer): Boolean;
    Function ListarTodos(const FiltroStatus, FiltroDigital, FiltroCampo: string): TObjectList<TCarteiraWeb>;
    Function ListarDependente(const id:integer): TObjectList<TCarteiraWeb>;
    Function CancelarCarteira(ADoc: TCarteiraWeb; Params:string): Boolean;
    Function CancelarDependente(ADoc: TCarteiraWeb; Params:string): Boolean;
    function Reativar(AID: Integer):boolean;
    function ReativarDependente(AID: Integer):boolean;
    function IncluiRegistroSincronizar: boolean;
  end;

implementation

uses UDM, cxDateUtils, REST.Json, Vcl.ExtCtrls, Controllers.Auth, UConeSul;

{ TCarteiraWebController }

function TCarteiraWebController.BuscarPorID(AID: Integer): TCarteiraWeb;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TCarteiraWebController.Create;
begin
  FDAO := TDAOOperacao<TCarteiraWeb>.Create(dm.Conn);
end;

destructor TCarteiraWebController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TCarteiraWebController.GravarCarteira(ADoc: TCarteiraWeb;
  out RetornoID: integer): boolean;
var
img     :Timage;
QrCode  :String;
begin
  Result          :=  False;

  if ADoc.id_carteira = 0 then
  begin
    ADoc.id_carteira   :=  FDAO.GetNextCode('id_carteira');
    Try

      //montar o qrCode da carteira
      QrCode      := GerarToken(ADoc.nomeuser,ADoc.login,inttostr(ADoc.id_carteira));      //Gerar o token

      img         := TImage.Create(nil);
      try
        TConeSul.GerarQRCode(img,QrCode);       //gerar o arcode na minha img
        Qrcode    := TConeSul.ConvImgBase64(img); //Gerar o qrcode em base64 passando minha img criada.
      finally
        img.Free;
      end;

      ADoc.qrcode     :=  Qrcode;

      RetornoID       :=  FDAO.Insert(ADoc);
      Result          :=  True;
    except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;

  end
  else
  begin
    Try
      Result := FDAO.Update(ADoc);
    except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;
  end;
end;

function TCarteiraWebController.IncluiRegistroSincronizar: boolean;
var
Dao :TDaoCarteira;
begin
  Result  := false;
  Dao     := TDaoCarteira.Create;
  try
    if Dao.IncluiRegistroSincronizar then
    result  := True;
  finally
    Dao.Free;
  end;
end;

function TCarteiraWebController.ListarTodos(const FiltroStatus, FiltroDigital,
  FiltroCampo: string): TObjectList<TCarteiraWeb>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := 'Select                                    '+
                ' c.id_carteira,                       '+
                ' c.id_socio,                          '+
                ' c.validade,                          '+
                ' case'+
                ' when c.digital= ''S'' then ''SIM'' else ''NÃO'' end as digital, '+
                ' s.matricula as vMatricula,                         '+
                ' s.codigo as vCodigo,                            '+
                ' s.nome as vNome,                              '+
                ' s.cpf as vCPF,                               '+
                ' e.razao as vRazaosecretaria,                              '+
                ' case                 '+
                ' when c.api= ''S'' then ''SIM'' else ''NÃO'' end as api, '+
                ' c.excluido,'+
                ' s.whatsapp as vWhatsapp,'+
                ' case when c.ativo=''S'' then ''SIM'' ELSE ''NÃO'' end as ativo, c.dataemissao, u.login as nmusuario  '+
                ' from carteira c                      '+
                ' inner join socio s                   '+
                ' on c.id_socio= s.id_socio            '+
                ' inner join secretaria e              '+
                ' on s.escritorio= e.id_secretaria     '+
                ' inner join usuario u                 '+
                ' on c.id_usuario = u.id_usuario       '+
                ' where id_dependente <=0';

  SQLORDER  := ' order by s.nome';

  if FiltroCampo.Trim <> '' then
  begin
    SQL := SQL + ' and (s.matricula like :filtro or s.codigo like :filtro or s.nome like :filtro or s.cpf like :filtro)';
    Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
  end;

  if FiltroStatus.Trim <> '' then
  begin
    SQL := SQL + ' AND c.ativo = :ativo';

    if FiltroStatus = 'N' then
    Sql := Sql + ' AND c.excluido=1'
    else
    Sql := Sql + ' AND c.excluido=0';

    Params := Params + [TPair<string, Variant>.Create('ativo', FiltroStatus)];
  end;

  if FiltroDigital.Trim <> '' then
  begin
    Sql := Sql + ' AND c.digital = :digital';
    Params := Params + [TPair<string, Variant>.Create('digital', FiltroDigital)];
  end;

  Sql := Sql + SQLORDER;

  Result := FDAO.FindWhere(SQL, Params);

end;

function TCarteiraWebController.Reativar(AID: Integer): boolean;
var
Dao :TDaoCarteira;
begin
  Result  := false;
  Dao     := TDaoCarteira.Create;

  try
    if Dao.Reativar(AID) then
    result  := True;
  finally
    Dao.Free;
  end;
end;

function TCarteiraWebController.ReativarDependente(AID: Integer): boolean;
var
Dao :TDaoCarteira;
begin
  Result  := false;
  Dao     := TDaoCarteira.Create;

  try
    if Dao.ReativarDependente(AID) then
    result  := True;
  finally
    Dao.Free;
  end;
end;

Function TCarteiraWebController.ListarDependente(const id:integer): TObjectList<TCarteiraWeb>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := 'Select                '+
               ' c.id_carteira,       '+
               ' case                 '+
               ' when c.digital= ''S'' then ''SIM'' else ''NÃO'' end as digital, '+
               ' c.id_dependente,     '+
               ' d.codigo as vCodigo,            '+
               ' d.nome as vNome,              '+
               ' d.cpf as vCPF,               '+
               ' d.parentesco as vParentesco,        '+
               ' case                 '+
               ' when c.api= ''S'' then ''SIM'' else ''NÃO'' end as api, '+
               ' c.id_socio,                       '+
               ' d.nascimento as vNascimento,'+
               ' case'+
               ' when c.ativo= ''S'' then ''SIM'' else ''NÃO'' end as ativo, c.dataemissao, u.login as nmusuario, '+
               ' c.excluido,                              '+
               ' d.fone as vwhatsapp                      '+
               ' from carteira c                          '+
               ' inner join sindicato_dependente d        '+
               ' on c.id_dependente = d.id_dependente     '+
               ' inner join usuario u                     '+
               ' on c.id_usuario = u.id_usuario           '+
               ' where c.id_dependente >0 ';

  SQLORDER  := ' order by d.nome';

  if id > 0 then
  begin
    SQL := SQL + ' and c.id_socio = :id_socio';
    Params := Params + [TPair<string, Variant>.Create('id_socio', id)];
  end;

  Sql := Sql + SQLORDER;

  Result := FDAO.FindWhere(SQL, Params);
end;

Function TCarteiraWebController.CancelarCarteira(ADoc: TCarteiraWeb; Params:String): Boolean;
begin
  Result  := False;
  //Passa o objeto com os dados para o Dao
  Try
    if FDAO.UpdatePart(Adoc,Params) then
    begin
      Result  := True;
    end;
  except on e:exception do
    begin
      raise Exception.Create(e.Message);
    end;
  End;
end;

Function TCarteiraWebController.CancelarDependente(ADoc: TCarteiraWeb; Params:string): Boolean;
begin
  Result  := False;
  //Passa o objeto com os dados para o Dao
  Try
    if FDAO.UpdatePart(Adoc,Params) then
    begin
      Result  := True;
    end;
  except on e:exception do
    begin
      raise Exception.Create(e.Message);
    end;
  End;
end;

end.
