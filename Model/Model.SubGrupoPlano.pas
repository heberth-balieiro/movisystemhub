unit Model.SubGrupoPlano;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient, Model.SQLQry;

Type
  TModelSubGrupoPlano = Class

  Private

    Fativo: string;
    Fdescricao: string;
    fcodigo: integer;
    Fidsubgrupo: integer;
    Fidgrupo: integer;

  Public

    property idsubgrupo   :integer read Fidsubgrupo   write Fidsubgrupo;
    property codigo       :integer read fcodigo       write Fcodigo;
    property descricao    :string  read Fdescricao    write Fdescricao;
    property idgrupo      :integer read Fidgrupo      write Fidgrupo;
    property ativo        :string  read Fativo        write Fativo;

    Function Novo(out msg:string):Boolean;
    Function Editar(out msg:string):Boolean;
    Function Excluir(out msg:string):Boolean;

    Function Localizar(out msg:string;TabStatus:integer;campo:string):Boolean;
    Function LocalizarID(out msg:string;i:integer):Boolean;


  End;

  var
   Model :TModelSQL;

implementation

{ TModelSubGrupoPlano }

uses Vcl.Session;

function TModelSubGrupoPlano.Novo(out msg: string): Boolean;
var
  sqlQuery: string;
  id, cod:Integer;
begin
  Result  := false;
  sqlQuery      := 'Insert into plano_subgrupo(id_subgrupo, codigo, descricao, '+
                    'id_grupo, datacriacao, id_usuario, id_empresa, ativo)'+
                    'values(:idsubgrupo, :codigo, :descricao, '+
                    ':idgrupo, :datacriacao, :idusuario, :idempresa, :ativo)';


  //cod   := //GerarId('plano_grupo','codigo');

  Model    := TModelSQL.Create;
  Try
    id    := Model.GerarId(dm.Conn,'plano_subgrupo','id_subgrupo');
    Try
      if model.ExecutarSQL(DM.Conn,sqlQuery, [id, 1, descricao, idgrupo, now, TSession.ID_USUARIO, Tsession.IDEMPRESA, ativo]) then
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
    Model.Free;
  End;

end;

function TModelSubGrupoPlano.Editar(out msg: string): Boolean;
var
  sqlQuery: string;
begin
  Result  := false;
  sqlQuery      := 'Update plano_subgrupo set descricao= :descricao, id_grupo= :idgrupo '+
                    'ativo= :ativo where id_subgrupo= :id and id_empresa= :idemp';

  Model    := TModelSQL.Create;
  try
    Try
      if Model.ExecutarSQL(DM.Conn,sqlQuery, [descricao, idgrupo, ativo, idsubgrupo, Tsession.IDEMPRESA]) then
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
  finally
    Model.Free;
  end;

end;

function TModelSubGrupoPlano.Excluir(out msg: string): Boolean;
var
  sqlQuery: string;
begin
  Result  := false;
  sqlQuery      := 'Delete from plano_subgrupo where id_subgrupo= :id and id_empresa= :idemp';

  Model    := TModelSQL.Create;
  Try
    Try
      if Model.ExecutarSQL(DM.Conn,sqlQuery, [idsubgrupo, Tsession.IDEMPRESA]) then
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
    Model.Free;
  End;
end;

function TModelSubGrupoPlano.Localizar(out msg: string; TabStatus: integer;
                                    campo: string): Boolean;
var
  Qry: TUniQuery;
  sqlQuery, sqlOrdem, sqlstatus, sqlCampo: string;
begin

  sqlQuery  := 'Select * from plano_subgrupo '+
                ' where id_subgrupo > 0';
  sqlOrdem  := ' order by descricao';

  case TabStatus of
    0: sqlstatus  := ' and ativo=''S'' ';
    1: sqlstatus  := ' and ativo=''N'' ';
  end;

  Model    := TModelSQL.Create;
  Try
    if campo <> '' then
    begin
      sqlCampo  := ' and (codigo like :campo or '+
                        ' descricao like :campo)';
      Qry := model.ConsultarSQL(DM.Conn,sqlQuery+Sqlstatus+sqlcampo+sqlordem, ['%'+campo+'%']);

    end
    else
      Qry := model.ConsultarSQL(DM.Conn,sqlQuery+sqlstatus+sqlordem, ['']);

    try
      while not Qry.Eof do
      begin
        //Resultado da consulta
      end;
    finally
      Qry.Free;
    end;
  Finally
    Model.Free;
  End;
end;

function TModelSubGrupoPlano.LocalizarID(out msg: string; i: integer): Boolean;
var
  Qry: TUniQuery;
  sqlQuery, sqlOrdem, sqlstatus, sqlCampo: string;
begin

  sqlQuery  := 'Select * from plano_subgrupo where id_subgrupo= :id and id_empresa= :idemp';

  Model    := TModelSQL.Create;
  Try
    Qry := model.ConsultarSQL(DM.Conn,sqlQuery, [i,TSession.IDEMPRESA]);

    try
      while not Qry.Eof do
      begin
        idsubgrupo    := Qry.FieldByName('id_subgrupo').AsInteger;
        Codigo        := Qry.FieldByName('codigo').AsInteger;
        Descricao     := Qry.FieldByName('descricao').AsString;
        idgrupo       := Qry.FieldByName('id_grupo').AsInteger;
        ativo         := Qry.FieldByName('ativo').AsString;
      end;
    finally
      Qry.Free;
    end;

  Finally
    Model.Free;
  End;
end;

end.
