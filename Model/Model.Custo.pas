unit Model.Custo;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient,
  Model.SQLQry;

Type
  TModelCusto = Class

  Private
    FAtivo: String;
    FDescricao: string;
    Fcodigo: Integer;
    Fidcusto: Integer;

  Public
    property IdCusto    : Integer read Fidcusto   write FIdCusto;
    property Codigo     : Integer read Fcodigo    write FCodigo;
    property Descricao  : string  read FDescricao write FDescricao;
    property Ativo      : String  read FAtivo     write FAtivo;

    Function Novo(out msg:string):Boolean;
    Function Editar(out msg:string):Boolean;
    Function Excluir(out msg:string):Boolean;

    Function Localizar(out msg:string;TabStatus:integer;campo:string):Boolean;
    Function LocalizarID(out msg:string;i:integer):Boolean;

  End;

  var
  ModelSql : TModelSQL;

implementation

{ TModelCusto }

uses Vcl.Session;

function TModelCusto.Editar(out msg: string): Boolean;
var
  sqlQuery: string;
begin
  Result  := false;
  sqlQuery      := 'UPDATE custo SET ' +
                         ' descricao = :descricao, ' +
                         ' ativo = :ativo, ' +
                         ' WHERE id_custo = :id_custo';

  ModelSql       := TModelSQL.Create;

  Try

    Try
      if Modelsql.ExecutarSQL(DM.Conn,sqlQuery, [descricao, ativo, idcusto])  then
      begin
        Result  := True;
        msg     := 'Registro atualizado com sucesso!';
      end
      else
        msg     := 'Erro ao atualizar os dados!';
    Except on e:exception do
      begin
        msg := 'Erro ao atualizar os dados:'+#13+e.Message;
      end;
    End;
  Finally
    Modelsql.Free;
  End;
end;

function TModelCusto.Excluir(out msg: string): Boolean;
var
  sqlQuery: string;
begin
  Result  := false;
  sqlQuery      := 'Delete from custo where id_custo= :id and id_empresa= :idemp';

  ModelSql      := TModelSQL.Create;
  Try
    Try
      if ModelSql.ExecutarSQL(DM.Conn,sqlQuery, [idcusto, Tsession.IDEMPRESA]) then
      begin
        Result  := True;
        msg     := 'Registro excluido com sucesso!';
      end
      else
        msg     := 'Erro ao excluir os dados!';
    Except on e:exception do
      begin
        msg := 'Erro ao excluir os dados:'+#13+e.Message;
      end;
    End;
  Finally
    Modelsql.Free;
  End;
end;

function TModelCusto.Localizar(out msg: string; TabStatus: integer;
  campo: string): Boolean;
begin

end;

function TModelCusto.LocalizarID(out msg: string; i: integer): Boolean;
begin

end;

function TModelCusto.Novo(out msg: string): Boolean;
var
  sqlQuery: string;
  id, cod:Integer;

begin
  Result  := False;
  sqlQuery      := 'INSERT INTO custo ' +
                         '(id_custo, codigo, descricao, ativo, data_cadastro, id_usuario, id_empresa) ' +
                         'VALUES (:id_custo, :codigo, :descricao, :ativo, :data_cadastro, :id_usuario, :id_empresa)';

  ModelSql       := TModelSQL.Create;

  Try
    id    := ModelSql.GerarId(dm.Conn,'custo','id_custo');
    cod   := ModelSql.GerarId(dm.Conn,'custo','codigo');

    Try

      if Modelsql.ExecutarSQL(DM.Conn,sqlQuery, [id, cod, descricao, ativo, now, TSession.ID_USUARIO, TSession.IDEMPRESA]) then
      begin
        Result  := True;
        msg     := 'Registro inserido com sucesso!';
      end
      else
        msg     := 'Erro ao inserir os dados!';
    Except on e:exception do
      begin
        msg := 'Erro ao inserir os dados:'+#13+e.Message;
      end;
    End;
  Finally
    Modelsql.Free;
  End;
end;

end.
