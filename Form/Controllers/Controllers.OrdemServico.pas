unit Controllers.OrdemServico;

interface

uses
  Model.OrdemServico,
  Dao.Operacoes,
  System.SysUtils, System.Generics.Collections;

type
  TOrdemServicoController = class
  private
    FDAO: TDAOOperacao<TOrdemServico>;


  public
    constructor Create;
    destructor Destroy; override;

    Function GravarOrdem(ADoc: TOrdemServico; out RetornoID:integer):boolean;
    function BuscarPorID(AID: Integer): TOrdemServico;
    function Excluir(AID: Integer): Boolean;
    function ListarTodos(const FiltroStatus, FiltroTipo, FiltroCampo: string; Dtini, Dtfim:TDate): TObjectList<TOrdemServico>;
  end;


type
  TOrdemServicoequipamentoController = class
  private
    FDAO: TDAOOperacao<TOrdemServicoEquipamento>;
  public
    constructor Create;
    destructor Destroy; override;

    Function GravarEquipamento(ADoc: TOrdemServicoEquipamento):boolean;
    function BuscarPorID(AID: Integer): TOrdemServicoEquipamento;
  end;

type
  TOrdemServicoFotoController = class
  private
    FDAO: TDAOOperacao<TOrdemServicoFoto>;
  public
    constructor Create;
    destructor Destroy; override;

    Function GravarFoto(ADoc: TOrdemServicoFoto):boolean;
    function BuscarPorID(AID: Integer): TOrdemServicoFoto;
  end;




implementation

uses UDM, cxDateUtils, REST.Json;

{ TOrdemServicoController }

constructor TOrdemServicoController.Create;
begin
  FDAO := TDAOOperacao<TOrdemServico>.Create(dm.Conn);
end;

destructor TOrdemServicoController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TOrdemServicoController.GravarOrdem(ADoc: TOrdemServico; out RetornoID:integer): boolean;
begin
  Result          :=  False;

   if ADoc.Id_os = 0 then
  begin
    ADoc.os_Numero     :=  FDAO.GetNextCode('os_numero');
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
      Result := FDAO.Update(ADoc);
    except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;
  end;

end;

function TOrdemServicoController.ListarTodos(const FiltroStatus, FiltroTipo,
  FiltroCampo: string; Dtini, Dtfim: TDate): TObjectList<TOrdemServico>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  //Função para Listar as ordem de serviço na tela de gerenciamento
  SQL   := 'Select                                      '+
           ' os.id_os,                                  '+
           ' os.os_numero,                              '+
           ' os_data,                                   '+
           ' os_hora,                                  '+
           ' os_status,                                '+
           ' os_prioridade,                            '+
           ' os_garantia,                              '+
           ' os_tipo,                                  '+
           ' os_obs,                                   '+
           ' os_previsao,                              '+
           ' s.nome,                                   '+
           ' s.telefone,                               '+
           ' s.celular,                                '+
           ' s.whatsapp                                '+
           ' from ordem_servico os                     '+
           ' Inner Join socio s                        '+
           ' On os_id_cliente = s.id_socio             ';

  SQLORDER  := ' order by os.os_numero, os_data;';

  if FiltroCampo.Trim <> '' then
  begin
    SQL := SQL + ' AND (c.numero LIKE :filtro or s.nome like :filtro or f.nome like :filtro)';
    Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
  end;

  if FiltroStatus.Trim <> '' then
  begin
    SQL := SQL + ' AND c.situacao = :situacao';
    Params := Params + [TPair<string, Variant>.Create('situacao', FiltroStatus)];
  end;

  if FiltroTipo.Trim <> '' then
  begin
    Sql := Sql + ' AND c.tipo = :tipo';
    Params := Params + [TPair<string, Variant>.Create('tipo', FiltroTipo)];
  end;

  Result := FDAO.FindWhere(SQL+SQLORDER, Params);

end;

function TOrdemServicoController.BuscarPorID(AID: Integer): TOrdemServico;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

function TOrdemServicoController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;



{ TOrdemServicoequipamentoController }

function TOrdemServicoequipamentoController.BuscarPorID(
  AID: Integer): TOrdemServicoEquipamento;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TOrdemServicoequipamentoController.Create;
begin
  FDAO := TDAOOperacao<TOrdemServicoEquipamento>.Create(dm.Conn);
end;

destructor TOrdemServicoequipamentoController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TOrdemServicoequipamentoController.GravarEquipamento(
  ADoc: TOrdemServicoEquipamento): boolean;
var
RetornoID:integer;
begin
  Result          :=  False;

   if ADoc.Id = 0 then
  begin

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
      Result := FDAO.Update(ADoc);
    except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;
  end;
end;




{ TOrdemServicoFotoController }

function TOrdemServicoFotoController.BuscarPorID(
  AID: Integer): TOrdemServicoFoto;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TOrdemServicoFotoController.Create;
begin
  FDAO := TDAOOperacao<TOrdemServicoFoto>.Create(dm.Conn);
end;

destructor TOrdemServicoFotoController.Destroy;
begin
FDAO.Free;
  inherited;
end;

function TOrdemServicoFotoController.GravarFoto(
  ADoc: TOrdemServicoFoto): boolean;
var
RetornoID:integer;
begin
  Result          :=  False;

   if ADoc.Id = 0 then
  begin

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
      Result := FDAO.Update(ADoc);
    except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;
  end;
end;

end.
