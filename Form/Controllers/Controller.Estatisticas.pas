unit Controller.Estatisticas;

interface

uses
  Model.Estatisticas,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections;

type
  TEstatisticasController = class
  private
    FDAO: TDAOOperacao<TModelEstatisticas>;
  public
    constructor Create;
    destructor Destroy; override;

    Function ListarTotais(): TObjectList<TModelEstatisticas>;
    Function ListarTotaisSecretaria(): TObjectList<TModelEstatisticas>;


  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TEstatisticasController }

constructor TEstatisticasController.Create;
begin
  FDAO := TDAOOperacao<TModelEstatisticas>.Create(dm.Conn);
end;

destructor TEstatisticasController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TEstatisticasController.ListarTotais: TObjectList<TModelEstatisticas>;
var
  SQL: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := ' SELECT             '+
           ' SITUACAO,            '+
           ' SUM(CASE WHEN sexo = ''MASCULINO'' THEN 1 ELSE 0 END) AS homens,'+
           ' SUM(CASE WHEN sexo = ''FEMININO'' THEN 1 ELSE 0 END) AS mulheres,'+
           ' SUM(CASE WHEN sexo = ''CISGÊNERO'' THEN 1 ELSE 0 END) AS cisgenero,'+
           ' SUM(CASE WHEN sexo = ''TRANSGÊNERO'' THEN 1 ELSE 0 END) AS transgenero,'+
           ' SUM(CASE WHEN sexo = ''NÃO BINARIO'' THEN 1 ELSE 0 END) AS binario,'+
           ' SUM(CASE WHEN sexo = ''OUTROS'' THEN 1 ELSE 0 END) AS outros,'+
           ' COUNT(*) AS total '+
           ' FROM socio'+
           ' GROUP BY SITUACAO '+
           ' ORDER BY '+
           ' CASE SITUACAO '+
           '     WHEN ''ATIVO'' THEN 1'+
           '     WHEN ''INADIMPLENTE'' THEN 2'+
           '     WHEN ''SUSPENSO'' THEN 3      '+
           '     WHEN ''AFASTADO'' THEN 4      '+
           '     WHEN ''INATIVO'' THEN 5       '+
           '     WHEN ''CANCELADO'' THEN 6     '+
           '     ELSE 99                        '+
           ' END;';

  Result := FDAO.FindWhere(SQL, Params);
end;

function TEstatisticasController.ListarTotaisSecretaria: TObjectList<TModelEstatisticas>;
var
  SQL: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := ' SELECT                                                                          '+
           ' sec.razao AS secretaria,                                                        '+
           ' SUM(CASE WHEN s.situacao = ''ATIVO''        THEN 1 ELSE 0 END) AS ativo,        '+
           ' SUM(CASE WHEN s.situacao = ''INADIMPLENTE'' THEN 1 ELSE 0 END) AS inadimplente, '+
           ' SUM(CASE WHEN s.situacao = ''SUSPENSO''     THEN 1 ELSE 0 END) AS suspenso,     '+
           ' SUM(CASE WHEN s.situacao = ''AFASTADO''     THEN 1 ELSE 0 END) AS afastado,     '+
           ' SUM(CASE WHEN s.situacao = ''INATIVO''      THEN 1 ELSE 0 END) AS inativo,      '+
           ' SUM(CASE WHEN s.situacao = ''CANCELADO''    THEN 1 ELSE 0 END) AS cancelado,    '+
           ' COUNT(*) AS total                                                               '+
           ' FROM socio s                                                                    '+
           ' INNER JOIN secretaria sec                                                       '+
           ' ON sec.id_secretaria = s.escritorio                                             '+
           ' GROUP BY                                                                        '+
           ' sec.razao                                                                       '+
           ' ORDER BY                                                                        '+
           ' sec.razao;';

  Result := FDAO.FindWhere(SQL, Params);
end;

end.


