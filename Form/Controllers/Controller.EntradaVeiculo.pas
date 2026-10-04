unit Controller.EntradaVeiculo;

interface

uses
  Model.EntradaVeiculo,
  Dao.Operacoes,
  System.SysUtils, System.Generics.Collections;

type
  TEntradaVeiculoController = class
  private
    FDAO: TDAOOperacao<TEntradaVeiculo>;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarTodos(const FiltroStatus, FiltroTipo, FiltroCampo: string): TObjectList<TEntradaVeiculo>;
    function BuscarPorID(AID: Integer): TEntradaVeiculo;
    function Salvar(ADoc: TEntradaVeiculo; out RetornoID:integer): Boolean;
    function Excluir(AID: Integer): Boolean;
    function SalvarOperacao(ADoc: TEntradaVeiculo; Params:string):Boolean;

  end;

implementation

uses UDM, cxDateUtils;

{ TEntradaVeiculoController }

function TEntradaVeiculoController.SalvarOperacao(ADoc: TEntradaVeiculo; Params:string): Boolean;
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

constructor TEntradaVeiculoController.Create;
begin
  FDAO := TDAOOperacao<TEntradaVeiculo>.Create(dm.Conn);
end;

destructor TEntradaVeiculoController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TEntradaVeiculoController.ListarTodos(const FiltroStatus, FiltroTipo, FiltroCampo: string): TObjectList<TEntradaVeiculo>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := 'Select                                              '+
          ' c.id_compra,                                      '+
          ' c.numero,                                         '+
          ' c.data,                                           '+
          ' c.hora,                                           '+
          ' c.tipo,                                           '+
          ' c.situacao,                                       '+
          ' c.gerar_financeiro,                               '+
          ' c.gerar_estoque,                                  '+
          ' Concat(s.codfornecedor,'' | '',s.nome) as nmpessoa, '+
          ' Concat(f.codigo,'' | '',f.nome) as nmresponsavel,    '+
          ' Coalesce(c.vlr_total,0) as vlr_total'+
          ' From Compra c                                     '+
          ' Inner Join Socio S                                '+
          ' on c.id_pessoa = S.id_socio                       '+
          ' Inner Join Funcionario F                          '+
          ' on c.id_responsavel = f.id_funcionario            ';
  SQLORDER  := ' order by c.id_compra, c.data, c.numero';

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
  //Result := FDAO.FindAll;
end;

function TEntradaVeiculoController.BuscarPorID(AID: Integer): TEntradaVeiculo;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

function TEntradaVeiculoController.Salvar(ADoc: TEntradaVeiculo; out RetornoID:integer): Boolean;
begin
  Result          :=  False;

  if ADoc.Id_compra = 0 then
  begin
    ADoc.Numero     :=  FDAO.GetNextCode('numero');
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
    Result := FDAO.Update(ADoc);
  end;
end;

function TEntradaVeiculoController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

end.

