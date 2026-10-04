unit Model.GrupoPlano;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient, Model.SQLQry;

Type
  TModelGrupoPlano = Class

  Private

    Fativo: string;
    Fdescricao: string;
    fcodigo: integer;
    Fidtipoplano: integer;
    Fidgrupoplano: integer;

  Public

    property idgrupoplano :integer read Fidgrupoplano write Fidgrupoplano;
    property codigo       :integer read fcodigo       write Fcodigo;
    property descricao    :string  read Fdescricao    write Fdescricao;
    property idtipoplano  :integer read Fidtipoplano  write Fidtipoplano;
    property ativo        :string  read Fativo        write Fativo;

    Function Novo(out msg:string):Boolean;
    Function Editar(out msg:string):Boolean;
    Function Excluir(out msg:string):Boolean;

    Function Localizar(out msg:string;TabStatus:integer;campo:string):Boolean;
    Function LocalizarID(out msg:string;i:integer):Boolean;


  End;

  var
  model : TModelSQL;

implementation

{ TModelGrupoPlano }

uses Vcl.Session;

function TModelGrupoPlano.Novo(out msg: string): Boolean;
var
  sqlQuery: string;
  id, cod:Integer;
begin
  Result  := false;
  sqlQuery      := 'Insert into plano_grupo(id_grupoplano, codigo, descricao, '+
                    'id_tipoplano, datacriacao, id_usuario, id_empresa, ativo)'+
                    'values(:idgrupoplano, :codigo, :descricao, '+
                    ':idtipoplano, :datacriacao, :idusuario, :idempresa, :ativo)';


  //cod   := //GerarId('plano_grupo','codigo');

  Model       := TModelSQL.Create;
  Try
    id    := Model.GerarId(dm.Conn,'plano_grupo','id_grupoplano');
    Try
      if Model.ExecutarSQL(DM.Conn,sqlQuery, [id, 1, descricao, idtipoplano, now, TSession.ID_USUARIO, Tsession.IDEMPRESA, ativo]) then
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

function TModelGrupoPlano.Editar(out msg: string): Boolean;
var
  sqlQuery: string;
begin
  Result  := false;
  sqlQuery      := 'Update plano_grupo set descricao= :descricao, id_tipoplano= :idtipo '+
                    'ativo= :ativo where id_grupoplano= :id and id_empresa= :idemp';

  Model       := TModelSQL.Create;
  Try
    Try
      if model.ExecutarSQL(DM.Conn,sqlQuery, [descricao, idtipoplano, ativo, idgrupoplano, Tsession.IDEMPRESA]) then
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
    Model.Free;
  End;

end;

function TModelGrupoPlano.Excluir(out msg: string): Boolean;
var
  sqlQuery: string;
begin
  Result  := false;
  sqlQuery      := 'Delete from plano_grupo where id_grupoplano= :id and id_empresa= :idemp';

  Model       := TModelSQL.Create;
  Try
    Try
      if Model.ExecutarSQL(DM.Conn,sqlQuery, [idgrupoplano, Tsession.IDEMPRESA]) then
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

function TModelGrupoPlano.Localizar(out msg: string; TabStatus: integer;
                                    campo: string): Boolean;
var
  Qry: TUniQuery;
  sqlQuery, sqlOrdem, sqlstatus, sqlCampo: string;
begin

  sqlQuery  := 'Select * from plano_grupo '+
                ' where id_grupoplano > 0';
  sqlOrdem  := ' order by descricao';

  case TabStatus of
    0: sqlstatus  := ' and ativo=''S'' ';
    1: sqlstatus  := ' and ativo=''N'' ';
  end;

  Model       := TModelSQL.Create;
  try
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
  finally
    Model.Free;
  end;
end;

function TModelGrupoPlano.LocalizarID(out msg: string; i: integer): Boolean;
var
  Qry: TUniQuery;
  sqlQuery, sqlOrdem, sqlstatus, sqlCampo: string;
begin

  sqlQuery  := 'Select * from plano_grupo where id_grupoplano= :id and id_empresa= :idemp';
  Model       := TModelSQL.Create;
  try
    Qry := Model.ConsultarSQL(DM.Conn,sqlQuery, [i,TSession.IDEMPRESA]);

    try
      while not Qry.Eof do
      begin
        idgrupoplano  := Qry.FieldByName('id_grupoplano').AsInteger;
        Codigo        := Qry.FieldByName('codigo').AsInteger;
        Descricao     := Qry.FieldByName('descricao').AsString;
        idtipoplano   := Qry.FieldByName('id_tipoplano').AsInteger;
        ativo         := Qry.FieldByName('ativo').AsString;

      end;
    finally
      Qry.Free;
    end;
  finally
    Model.Free;
  end;
end;


end.
