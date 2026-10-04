unit UController.DistribuicaoDFE;

interface

uses
  Model.DistribuicaoDFE,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections;

type
  TDistribuicaoDFEController = class
  private
    FDAO: TDAOOperacao<TModelDistribuicao>;
  public

    constructor Create;
    destructor Destroy; override;

    function ListarTodos(const FiltroCampo, FiltroStatus: string; AIDEmpresa:integer; const FiltroData1, FiltroData2: TDate): TObjectList<TModelDistribuicao>;
    function BuscarPorID(AID: Integer): TModelDistribuicao;
    function Salvar(ADoc: TModelDistribuicao): Boolean;

  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TDistribuicaoDFEController }

function TDistribuicaoDFEController.BuscarPorID(AID: Integer): TModelDistribuicao;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TDistribuicaoDFEController.Create;
begin
  FDAO := TDAOOperacao<TModelDistribuicao>.Create(dm.Conn);
end;

destructor TDistribuicaoDFEController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TDistribuicaoDFEController.ListarTodos(const FiltroCampo, FiltroStatus: string; AIDEmpresa:integer; const FiltroData1, FiltroData2: TDate): TObjectList<TModelDistribuicao>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   :=  'SELECT                               '+
            ' d.id_doc,                           '+
            ' d.nsu,                              '+
            ' d.schema_name,                      '+
            ' d.tipo_documento,                   '+
            ' d.chave_acesso,                     '+
            ' d.cnpj_emitente,                    '+
            ' d.x_nome_emitente,                  '+
            ' d.numero_nfe,                       '+
            ' d.serie_nfe,                        '+
            ' d.valor_nfe,                        '+
            ' d.dh_emissao,                       '+
            ' d.situacao_manifesto,               '+
            ' d.caminho_arquivo,                  '+
            ' d.dt_cadastro                       '+
            ' FROM distribuicao_dfe_doc d         '+
            ' WHERE d.id_doc >0     ';

  if FiltroCampo.Trim <> '' then
  begin
    SQL := SQL + ' AND (d.x_nome_emitente LIKE :filtro or d.cnpj_emitente LIKE :filtro or d.chave_acesso LIKE :filtro or d.numero_nfe = :filtro)';
    Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
  end;

//  if FiltroStatus.Trim <> '' then
//  begin
//    SQL := SQL + ' AND o.ativo = :ativo';
//    Params := Params + [TPair<string, Variant>.Create('ativo', FiltroStatus)];
//  end;

  if AIDEmpresa > 0 then
  begin
    SQL     := SQL + ' and d.id_empresa= :idempresa';
    Params  := Params + [TPair<string, Variant>.Create('idempresa', AIDEmpresa)];
  end;

  Sql    := Sql + ' AND d.dh_emissao BETWEEN :x and :y';
  Params := Params + [TPair<string, Variant>.Create('x', VarFromDateTime(FiltroData1))];
  Params := Params + [TPair<string, Variant>.Create('y', VarFromDateTime(FiltroData2))];

  SQLORDER  := ' ORDER BY d.dh_emissao';

  Result := FDAO.FindWhere(SQL + SQLORDER, Params);

end;

function TDistribuicaoDFEController.Salvar(ADoc: TModelDistribuicao): Boolean;
begin
  Result          :=  False;
  if ADoc.id_doc  = 0 then
  begin
    Try
      FDAO.Insert(ADoc);
      Result          := True;
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
