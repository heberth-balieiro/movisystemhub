unit Controller_Sincronizar;

interface

uses
  Model.Sincronizar,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections;
type
  TSincronizarController = class
  private
    FDAO: TDAOOperacao<TSincronizar>;
  public
    constructor Create;
    destructor Destroy; override;
    function ListarTodos: TObjectList<TSincronizar>;
  end;
implementation
uses UDM, cxDateUtils, System.Variants;


{ TSincronizarController }

constructor TSincronizarController.Create;
begin
  FDAO := TDAOOperacao<TSincronizar>.Create(dm.Conn);
end;

destructor TSincronizarController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TSincronizarController.ListarTodos: TObjectList<TSincronizar>;
var
  SQL: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   :=  'SELECT                                                                              '+

            ' s.id_sincronizar,                                                                  '+
            ' s.cod_tabela,                                                                      '+
            ' s.id_registro,                                                                     '+
            ' CASE When s.status=''S'' then ''Pendente'' else ''Sincronizado'' end as nsituacao, '+
            ' CASE s.cod_tabela                                                                  '+
            '  WHEN 5 then ''DEPENDENTE''             '+
            '  WHEN 6 THEN ''CARTEIRA''    '+
            '  WHEN 4 THEN ''ASSOCIADO''  '+
            '  WHEN 7 THEN ''CONVÊNIO''                                                          '+
            '  WHEN 8 THEN ''CLIENTE''                                                           '+
            '  WHEN 9 THEN ''PRODUTO''                                                           '+
            '  WHEN 14 THEN ''NOTIFICAÇÃO''                                                      '+
            '  ELSE CONCAT(''TAB_'', s.cod_tabela)                                               '+
            ' END AS tabela,                                                                     '+
            ' CASE s.cod_tabela                                                                  '+
            '  WHEN 5 THEN d.nome  '+
            '  WHEN 6 THEN cc.nomeuser   '+
            '  WHEN 4 THEN ss.nome                                                               '+
            '  WHEN 7 THEN c.nome                                                                '+
            '  WHEN 8 THEN ss.nome                                                               '+
            '  WHEN 14 THEN n.titulo                                                           '+
            '  ELSE ''Sem registro vinculado''                                                  '+
            ' END AS descricao                                                                   '+
            ' FROM sincronizar s                                                                 '+
            ' LEFT JOIN convenio c ON (s.cod_tabela = 7 AND c.id_convenio = s.id_registro)       '+
            ' LEFT JOIN socio  ss ON (s.cod_tabela in (4,8) AND ss.id_socio = s.id_registro)     '+
            ' LEFT JOIN notificacao n ON (s.cod_tabela = 14 AND n.id_notificacao = s.id_registro) '+
            ' LEFT JOIN sindicato_dependente d on (s.cod_tabela = 1 and d.id_dependente = s.id_registro) '+
            ' LEFT JOIN carteira cc on (s.cod_tabela=6 and cc.id_carteira = s.id_registro)  '+
            ' Where s.Status=''S'' ORDER BY s.id_sincronizar DESC';
  Result := FDAO.FindWhere(SQL, Params);

end;

end.
