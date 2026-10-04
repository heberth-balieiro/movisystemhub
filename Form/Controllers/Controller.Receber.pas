unit Controller.Receber;

interface

uses
  Model.Receber,
  Dao.Operacoes,
  System.SysUtils, System.Generics.Collections;

type
  TReceberController = class
  private
    FDAO: TDAOOperacao<TReceber>;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarTodos(const FiltroTipoData, FiltroCampo, FiltroSituacao: string; Const DataInicial, DataFinal:Tdate): TObjectList<TReceber>;
    function BuscarPorID(AID: Integer): TReceber;
    function Salvar(ADoc: TReceber; out RetornoID:integer): Boolean;
    function Excluir(AID: Integer): Boolean;
    Function ListarBaixa(ALista: TList<Integer>):TObjectList<TReceber>;

  end;

implementation

uses UDM, cxDateUtils, System.Variants;


{ TTipoDocumentoController }


Function TReceberController.ListarBaixa(ALista: TList<Integer>):TObjectList<TReceber>;
begin
  //Receber uma lista com os dados
  Try
    Result := FDAO.FindByIdIn(ALista);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

function TReceberController.BuscarPorID(AID: Integer): TReceber;
begin
  Try
    Result := FDAO.FindById(AID);
  except
  on E: Exception do
    raise Exception.Create(e.Message);
  end;
end;

constructor TReceberController.Create;
begin
  FDAO := TDAOOperacao<TReceber>.Create(dm.Conn);
end;

destructor TReceberController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TReceberController.Excluir(AID: Integer): Boolean;
begin
  Result := FDAO.Delete(AID);
end;

function TReceberController.ListarTodos(const FiltroTipoData, FiltroCampo, FiltroSituacao: string; Const DataInicial, DataFinal:Tdate): TObjectList<TReceber>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  //Função para Listar
  SQL   := 'Select                                                    '+
            ' r.id_receber,                                           '+
            ' r.data_lancamento,                                      '+
            ' r.data_vencimento,                                      '+
            ' r.data_recebimento,                                     '+
            ' r.data_competencia,                                     '+
            ' r.numero_titulo,                                        '+
            ' Concat(                                                 '+
            ' r.numero_titulo,''/'',r.parcela                           '+
            ' ) as numparcela,                                        '+
            ' Coalesce(r.valor_original,0) as valor_original,                             '+
            ' Coalesce(r.valor_recebido,0) as valor_recebido,                             '+
            ' r.historico,                                            '+
            ' case                                                    '+
            ' when r.recebido = ''A'' then ''Aberto''                     '+
            ' when r.recebido = ''R'' then ''Recebido''                   '+
            ' when r.recebido = ''C'' then ''Cancelado''                  '+
            ' when r.recebido = ''F'' then ''Faturado''                   '+
            ' else r.recebido end as recebido,                       '+
            ' r.parcela,                                              '+
            ' s.nome as nmpessoa,                                     '+
            ' s.apelido as nmapelido,                                 '+
            ' Concat(s.codigo,'' - '',s.nome) as nmpessoacompleto,      '+
            ' s.whatsapp,                                             '+
            ' r.id_pessoa,                                            '+
            ' t.descricao nmdocumento                                 '+
            '                                                          '+
            ' From Receber R                                          '+
            ' Inner join socio s                                      '+
            ' on r.id_pessoa = s.id_socio                             '+
            ' Inner Join tipo_documento t                             '+
            ' on r.id_documento = t.id_documento where id_receber>0';

  if FiltroSituacao = 'A' then
  SQLORDER  := ' order by s.nome, r.data_vencimento;';

  if FiltroSituacao = 'C' then
  SQLORDER  := ' order by s.nome, r.data_vencimento;';

  if FiltroSituacao = 'R' then
  SQLORDER  := ' order by s.nome, r.data_recebimento;';

  if FiltroSituacao = 'F' then
  SQLORDER  := ' order by s.nome, r.data_vencimento;';


  if FiltroCampo.Trim <> '' then
  begin
    SQL := SQL + ' AND (r.numero_titulo LIKE :filtro or s.nome like :filtro or s.apelido like :filtro or s.codigo = :filtro or t.descricao like :filtro or r.historico like :filtro)';
    Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
  end;

  if FiltroSituacao.Trim <> '' then
  begin
    SQL := SQL + ' AND r.recebido = :rec';
    Params := Params + [TPair<string, Variant>.Create('rec', FiltroSituacao)];
  end;


  if FiltroTipoData.Trim <> '' then
  begin
    Sql := Sql + ' AND r.'+FiltroTipoData+' BETWEEN :x and :y';
    Params := Params + [TPair<string, Variant>.Create('x', VarFromDateTime(DataInicial))];
    Params := Params + [TPair<string, Variant>.Create('y', VarFromDateTime(DataFinal))];
  end;

  Result := FDAO.FindWhere(SQL+SQLORDER, Params);
end;

function TReceberController.Salvar(ADoc: TReceber; out RetornoID:integer): Boolean;
begin
  Result          :=  False;

   if ADoc.Id_receber = 0 then
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
