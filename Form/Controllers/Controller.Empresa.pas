unit Controller.Empresa;

interface

uses
  Model.Empresas,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao.Empresa, uConfiguracaoService;

type
  TEmpresaController = class
  private
    FDAO: TDAOOperacao<TEmpresa>;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TEmpresa>;
    function BuscarPorID(AID: Integer): TEmpresa;
    function Salvar(ADoc: TEmpresa; out RetornoID:integer): Boolean;
    function Excluir(AID: Integer): Boolean;
    function ExcluidoCancelado(AID: Integer):boolean;

    function HabilitarDesabilitarWeb(Const AIDEmpresa:Integer):Boolean;
  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TEmpresaController }

function TEmpresaController.BuscarPorID(AID: Integer): TEmpresa;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TEmpresaController.Create;
begin
  FDAO := TDAOOperacao<TEmpresa>.Create(dm.Conn);
end;

destructor TEmpresaController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TEmpresaController.ExcluidoCancelado(AID: Integer): boolean;
var
Dao :TDaoEmpresa;
begin
  Result  := false;
  Dao     := TDaoEmpresa.Create;

  try
    if Dao.Delete(AID) then
    result  := True;
  finally
    Dao.Free;
  end;

end;

function TEmpresaController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TEmpresaController.HabilitarDesabilitarWeb(const AIDEmpresa: Integer): Boolean;
begin
  Result  := False;

  if TDaoEmpresa.HabilitarDesabilitarWeb(AIDEmpresa) then
  begin
    Result  := TConfiguracaoService.SincronizarGravar(19, AIDEmpresa);
  end;

end;

function TEmpresaController.ListarTodos(const FiltroCampo,
  FiltroStatus: string): TObjectList<TEmpresa>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := 'Select id_empresa, razao, fantasia, cep, endereco, numero, bairro, cnpj,'+
            ' ie, telefone, celular, whatsapp from empresa where id_empresa >0';

  if FiltroCampo.Trim <> '' then
  begin
    SQL := SQL + ' AND (razao LIKE :filtro or fantasia like :filtro or cnpj like :filtro or id_empresa = :filtro)';
    Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
  end;

  {if FiltroStatus.Trim <> '' then
  begin
    SQL := SQL + ' AND ativo = :ativo';
    Params := Params + [TPair<string, Variant>.Create('ativo', FiltroStatus)];
  end;
  }
  SQLORDER  := ' order by razao';

  Result := FDAO.FindWhere(SQL + SQLORDER, Params);
end;

function TEmpresaController.Salvar(ADoc: TEmpresa; out RetornoID: integer): Boolean;
begin
  Result          :=  False;

   if ADoc.id_empresa = 0 then
  begin
    //ADoc.Codigo       := FDao.GetNextCode('codigo');

    Try
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
      //ADoc.data_alteracao   := Now;

      Result := FDAO.Update(ADoc);
    except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;
  end;
end;

end.
