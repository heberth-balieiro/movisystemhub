unit Controllers.SindRegistro;

interface

uses
  Model.Sindicato_Registro,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections;

type
  TRegistroEntradaController = class
  private
    FDAO: TDAOOperacao<TModelSindRegistro>;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarTodos(const FiltroCampo, FiltroStatus: string; FiltroData1, FiltroData2:TDate): TObjectList<TModelSindRegistro>;
  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TRegistroEntradaController }

constructor TRegistroEntradaController.Create;
begin
  FDAO := TDAOOperacao<TModelSindRegistro>.Create(dm.Conn);
end;

destructor TRegistroEntradaController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TRegistroEntradaController.ListarTodos(const FiltroCampo,FiltroStatus: string; FiltroData1,
  FiltroData2: TDate): TObjectList<TModelSindRegistro>;
var
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   :=   'SELECT                                                    '+
              ' s.id_registro,'+
              ' s.data AS data,                                  '+
              ' s.hora AS hora,                                    '+
              ' ss.matricula AS matricula,'+
              ' COALESCE(ss.nome, d.nome) AS nome,                    '+
              ' COALESCE(ss.whatsapp, d.fone) AS whatsapp,             '+
              ' u.nome as nmusuario                                     '+
              ' FROM                                                     '+
              ' sindicato_registro s                                      '+
              ' INNER JOIN                                                 '+
              ' carteira c ON s.id_carteira = c.id_carteira                 '+
              ' LEFT JOIN                                                    '+
              ' socio ss ON c.id_socio = ss.id_socio                          '+
              ' LEFT JOIN                                                    '+
              ' sindicato_dependente d ON c.id_dependente = d.id_dependente   '+
              ' INNER JOIN                                                     '+
              ' usuario u on s.id_usuario = u.id_usuario                       '+
              ' where s.id_registro > 0 ';

  if FiltroCampo.Trim <> '' then
  begin
    SQL := SQL + ' AND (ss.nome LIKE :filtro or d.nome LIKE :Filtro or ss.matricula like :Filtro)';
    Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroCampo + '%')];
  end;

//  if FiltroStatus.Trim <> '' then
//  begin
//    SQL := SQL + ' AND status = :status';
//    Params := Params + [TPair<string, Variant>.Create('status', FiltroStatus)];
//  end;

  Sql := Sql + ' AND s.data BETWEEN :x and :y';
  Params := Params + [TPair<string, Variant>.Create('x', VarFromDateTime(FiltroData1))];
  Params := Params + [TPair<string, Variant>.Create('y', VarFromDateTime(FiltroData2))];

  SQLORDER  := ' order by s.data';
  Result := FDAO.FindWhere(SQL + SQLORDER, Params);

end;

end.
