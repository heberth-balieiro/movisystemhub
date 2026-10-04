unit Controller.TipoDocumento;

interface

uses
  Model.TipoDocumento,
  DAO.Generico,
  System.SysUtils, System.Generics.Collections;

type
  TTipoDocumentoController = class
  private
    FDAO: TDAO<TTipoDocumento>;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarTodos(const FiltroDescricao: string; const FiltroAtivo: string): TObjectList<TTipoDocumento>;
    function BuscarPorID(AID: Integer): TTipoDocumento;
    function Salvar(ADoc: TTipoDocumento): Boolean;
    function Excluir(AID: Integer): Boolean;
  end;

implementation

uses UDM, cxDateUtils;

{ TTipoDocumentoController }

constructor TTipoDocumentoController.Create;
begin
  FDAO := TDAO<TTipoDocumento>.Create(dm.Conn);
end;

destructor TTipoDocumentoController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TTipoDocumentoController.ListarTodos(const FiltroDescricao: string; const FiltroAtivo: string): TObjectList<TTipoDocumento>;
var
  SQL: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL := 'SELECT * FROM tipo_documento WHERE excluido = 0';

  if FiltroDescricao.Trim <> '' then
  begin
    SQL := SQL + ' AND descricao LIKE :descricao';
    Params := Params + [TPair<string, Variant>.Create('descricao', '%' + FiltroDescricao + '%')];
  end;

  if FiltroAtivo = 'S' then
  begin
    SQL := SQL + ' AND ativo = :ativo';
    Params := Params + [TPair<string, Variant>.Create('ativo', 'S')];
  end
  else if FiltroAtivo = 'N' then
  begin
    SQL := SQL + ' AND ativo = :ativo';
    Params := Params + [TPair<string, Variant>.Create('ativo', 'N')];
  end;

  Result := FDAO.FindWhere(SQL, Params);
  //Result := FDAO.FindAll;
end;

function TTipoDocumentoController.BuscarPorID(AID: Integer): TTipoDocumento;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

function TTipoDocumentoController.Salvar(ADoc: TTipoDocumento): Boolean;
begin
  if ADoc.Id_documento = 0 then
  begin
    ADoc.Data_Criacao   := Now;
    ADoc.Codigo         := FDAO.GetNextCode('codigo');
    ADoc.Tipo           := 'N';
    Adoc.Data_alteracao := NullDate;
    Adoc.Data_exclusao  := NullDate;
    Adoc.Excluido       := 0;
    Result := FDAO.Insert(ADoc);
  end
  else
  begin
    Result := FDAO.Update(ADoc);
  end;
end;

function TTipoDocumentoController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

end.

