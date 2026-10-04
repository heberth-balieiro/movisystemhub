unit Controller.Produto;

interface

uses
  Model.TabProduto,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao.Produto;

type
  TProdutoController = class
  private
    FDAO: TDAOOperacao<TTabProduto>;
    function SoDigitos(const S: string): Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    Function GravarProduto(ADoc: TTabProduto; out RetornoID:integer):boolean;
    function BuscarPorID(AID: Integer): TTabProduto;
    function Excluir(AID: Integer): Boolean;

    function ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TTabProduto>;
    function ExcluidoCancelado(AID, AIDUser: Integer):boolean;

  end;

type
  TProdutoEquipamentoController = class
  private
    FDAO: TDAOOperacao<TTabProdutoEquipamento>;

  public
    constructor Create;
    destructor Destroy; override;

    Function GravarEquipamento(ADoc: TTabProdutoEquipamento; out RetornoID:integer):boolean;
    function BuscarEPorID(AID: Integer): TTabProdutoEquipamento;

end;

implementation

uses UDM, cxDateUtils, REST.Json;

{ TProdutoController }

function TProdutoController.BuscarPorID(AID: Integer): TTabProduto;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TProdutoController.Create;
begin
  FDAO := TDAOOperacao<TTabProduto>.Create(dm.Conn);
end;

destructor TProdutoController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TProdutoController.Excluir(AID: Integer): Boolean;
begin
  Try
    Result := FDAO.Delete(AID);
  except on e:exception do
    begin
      Raise Exception.Create(e.Message);
    end;
  End;
end;

function TProdutoController.GravarProduto(ADoc: TTabProduto;
  out RetornoID: integer): boolean;
begin
  Result          :=  False;

   if ADoc.Id_Produto = 0 then
  begin
    ADoc.codigo       :=  FDAO.GetNextCode('codigo');
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

function TProdutoController.SoDigitos(const S: string): Boolean;
var
  I: Integer;
begin
  Result := S <> '';
  for I := 1 to Length(S) do
    if not CharInSet(S[I], ['0'..'9']) then
      Exit(False);
end;

function TProdutoController.ListarTodos(const FiltroCampo, FiltroStatus: string): TObjectList<TTabProduto>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
  Filtro: string;
  NumValor: Integer;
  EhNumero: Boolean;
begin
  Filtro := Trim(FiltroCampo);
  SQL   := 'Select p.id_produto, p.codigo,p.cod_barras,p.referencia,p.descricao,                 '+
            '  case when p.servico= ''N'' then ''NÃO'' else ''SIM'' end as servico,                    '+
            '  case when p.ativo=''S'' then ''Ativo'' else ''Inativo'' end as ativo,                   '+
            '  case when p.prod_equipamento=''S'' then ''Sim'' else ''Não'' end as prod_equipamento,        '+
            '  p.prc_venda,p.estoque_atual,p.prc_promocao,m.marca,g.grupo,u.uni,l.localizacao    '+
            '  from produto p                                                                    '+
            '  inner join marca m                                                                '+
            '  on p.id_marca = m.id_marca                                                        '+
            '  inner join grupo g                                                                '+
            '  on p.id_grupo = g.id_grupo                                                        '+
            '  inner join unidade u                                                              '+
            '  on p.id_unidade = u.id_unidade                                                    '+
            '  inner join localizacao l                                                          '+
            '  on p.id_localizacao = l.id_localizacao                                            '+
            '  where p.id_produto >0 and p.excluido=0';

  if Filtro <> '' then
  begin
    if SoDigitos(Filtro) then
    begin
      if Length(Filtro) >= 8 then
      begin
        SQL := SQL + ' and (p.cod_barras like :cod_barras)';
        Params := Params + [TPair<string, Variant>.Create('cod_barras', '%'+Filtro)];
      end
      else
      begin
        SQL := SQL + ' and (p.codigo = :codigo OR p.cod_barras = :cod_barras)';
        Params := Params + [TPair<string, Variant>.Create('codigo', StrToIntDef(Filtro, 0))];
        Params := Params + [TPair<string, Variant>.Create('cod_barras', Filtro)];
      end;
    end
    else
    begin
      SQL       := SQL + ' and (p.descricao LIKE :filtroTexto or p.referencia LIKE :filtroTexto '+
                          'or m.marca like :filtroTexto or g.grupo like :filtroTexto or p.cod_barras like :filtroTexto )';
      Params    := Params + [TPair<string, Variant>.Create('filtroTexto', '%' + Filtro + '%')];
    end;



//    EhNumero := TryStrToInt(Filtro, NumValor);
//    if EhNumero then
//    begin
//      SQL := SQL + ' and (p.codigo= :codigo)';
//      Params := Params + [TPair<string, Variant>.Create('codigo', NumValor)];
//      //Params := Params + [TPair<string, Variant>.Create('barra', NumValor)];
//    end
//    else
//    begin
//      SQL       := SQL + ' and (p.descricao LIKE :filtroTexto or p.referencia LIKE :filtroTexto '+
//                          'or m.marca like :filtroTexto or g.grupo like :filtroTexto or p.cod_barras like :filtroTexto )';
//      Params    := Params + [TPair<string, Variant>.Create('filtroTexto', '%' + Filtro + '%')];
//    end;
  end;

  if FiltroStatus.Trim <> '' then
  begin
    SQL := SQL + ' and p.ativo = :ativo';
    if FiltroStatus='Ativo' then
    Params := Params + [TPair<string, Variant>.Create('ativo', 'S')];
    if FiltroStatus='Inativo' then
    Params := Params + [TPair<string, Variant>.Create('ativo', 'N')];
  end;

  SQLORDER  := ' order by p.codigo, p.descricao';

  Result := FDAO.FindWhere(SQL + SQLORDER, Params);
end;

function TProdutoController.ExcluidoCancelado(AID, AIDUser: Integer):boolean;
var
Dao :TDaoProduto;
begin
  Result  := false;
  Dao     := TDaoProduto.Create;
  try
    if Dao.Delete(AID) then
    result  := True;
  finally
    Dao.Free;
  end;
end;


{ TProdutoEquipamentoController }

function TProdutoEquipamentoController.BuscarEPorID(
  AID: Integer): TTabProdutoEquipamento;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TProdutoEquipamentoController.Create;
begin
  FDAO := TDAOOperacao<TTabProdutoEquipamento>.Create(dm.Conn);
end;

destructor TProdutoEquipamentoController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TProdutoEquipamentoController.GravarEquipamento(
  ADoc: TTabProdutoEquipamento; out RetornoID: integer): boolean;
begin
  Result          :=  False;

   if ADoc.id_equipamento = 0 then
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
