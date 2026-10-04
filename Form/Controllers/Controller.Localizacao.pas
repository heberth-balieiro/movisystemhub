unit Controller.Localizacao;

interface

uses
  Model.Localizacao,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao.Localizacao;

type
  TLocalizacaoController = class
  private
    FDAO: TDAOOperacao<TModelLocalizacao>;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TModelLocalizacao>;
    function BuscarPorID(AID: Integer): TModelLocalizacao;
    function Salvar(ADoc: TModelLocalizacao; out RetornoID:integer): Boolean;
    function Excluir(AID: Integer): Boolean;
    function ExcluidoCancelado(AID, AIDUser: Integer):boolean;
  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TLocalizacaoController }

function TLocalizacaoController.BuscarPorID(AID: Integer): TModelLocalizacao;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TLocalizacaoController.Create;
begin
  FDAO := TDAOOperacao<TModelLocalizacao>.Create(dm.Conn);
end;

destructor TLocalizacaoController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TLocalizacaoController.ExcluidoCancelado(AID, AIDUser: Integer): boolean;
var
Dao :TDaoLocalizacao;
begin
  Result  := false;
  Dao     := TDaoLocalizacao.Create;

  try
    if Dao.Delete(AID, AIDUser) then
    result  := True;
  finally
    Dao.Free;
  end;

end;

function TLocalizacaoController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TLocalizacaoController.ListarTodos(const FiltroCampo,
  FiltroStatus: string): TObjectList<TModelLocalizacao>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := 'Select id_localizacao, codigo, localizacao, '+
            'case when ativo=''S'' then ''Ativo'' else ''Inativo'' end as ativo '+
            ' from localizacao where excluido=0';

  if FiltroCampo.Trim <> '' then
  begin
    SQL := SQL + ' AND (localizacao LIKE :filtro or codigo = :filtro)';
    Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
  end;

  if FiltroStatus.Trim <> '' then
  begin
    SQL := SQL + ' AND ativo = :ativo';
    Params := Params + [TPair<string, Variant>.Create('ativo', FiltroStatus)];
  end;

  SQLORDER  := ' order by localizacao';

  Result := FDAO.FindWhere(SQL + SQLORDER, Params);
end;

function TLocalizacaoController.Salvar(ADoc: TModelLocalizacao; out RetornoID: integer): Boolean;
begin
  Result          :=  False;

   if ADoc.id_localizacao = 0 then
  begin
    ADoc.Codigo       := FDao.GetNextCode('codigo');
    Adoc.data_cadastro:= now();
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
      ADoc.data_alteracao   := Now;

      Result := FDAO.Update(ADoc);
    except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;
  end;
end;

end.
