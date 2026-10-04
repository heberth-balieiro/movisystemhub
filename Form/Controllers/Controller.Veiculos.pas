unit Controller.Veiculos;

interface

uses
  Model.VeiculosAtualizar,
  Dao.Operacoes,
  System.SysUtils, System.Generics.Collections;

type
  TVeiculoAtualizarController = class
  private
    FDAO: TDAOOperacao<TVeiculoAtualizar>;
    function InteirosParaString(const Lista: TArray<Integer>): string;

  public
    constructor Create;
    destructor Destroy; override;

    function Salvar(ADoc: TVeiculoAtualizar): Boolean;
    function BuscarPorID(AID: Integer): TVeiculoAtualizar;

  end;

type
  TVeiculoValoresController = class
  private
    FDAO: TDAOOperacao<TVeiculoValores>;
    function InteirosParaString(const Lista: TArray<Integer>): string;

  public
    constructor Create;
    destructor Destroy; override;

    function Salvar(ADoc: TVeiculoValores): Boolean;

  end;

implementation

uses UDM, cxDateUtils, REST.Json;

{ TVeiculoAtualizarController }

{$REGION 'Atualizar Ficha'}

function TVeiculoAtualizarController.BuscarPorID(AID: Integer): TVeiculoAtualizar;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TVeiculoAtualizarController.Create;
begin
  FDAO := TDAOOperacao<TVeiculoAtualizar>.Create(dm.Conn);
end;

destructor TVeiculoAtualizarController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TVeiculoAtualizarController.InteirosParaString(
  const Lista: TArray<Integer>): string;
var
  StrList: TArray<string>;
  I: Integer;
begin
  SetLength(StrList, Length(Lista));
  for I := 0 to High(Lista) do
    StrList[I] := Lista[I].ToString;

  Result := String.Join(',', StrList);
end;

function TVeiculoAtualizarController.Salvar(ADoc: TVeiculoAtualizar): Boolean;
begin
  Result          :=  False;

  if ADoc.Id = 0 then
  begin
    Try
      FDAO.Insert(ADoc);
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

{$ENDREGION}



{ TVeiculoValoresController }

{$REGION 'Veiculo Valores'}

constructor TVeiculoValoresController.Create;
begin
  FDAO := TDAOOperacao<TVeiculoValores>.Create(dm.Conn);
end;

destructor TVeiculoValoresController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TVeiculoValoresController.InteirosParaString(
  const Lista: TArray<Integer>): string;
var
  StrList: TArray<string>;
  I: Integer;
begin
  SetLength(StrList, Length(Lista));
  for I := 0 to High(Lista) do
    StrList[I] := Lista[I].ToString;

  Result := String.Join(',', StrList);
end;

function TVeiculoValoresController.Salvar(ADoc: TVeiculoValores): Boolean;
begin
  Result          :=  False;

  if ADoc.id_valores = 0 then
  begin
    Try
      FDAO.Insert(ADoc);
      Result          :=  True;
    except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;
  end
  else
  begin
    Result := FDAO.Update(ADoc);
  end;
end;

{$ENDREGION}

end.

