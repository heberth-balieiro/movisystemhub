unit Model.Tipoplano;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient,
  Model.SQLQry;

Type
  TModelTipoPlano = Class

  Private
    FDescricao: string;
    FCodigo: Integer;
    FIdTipo: Integer;
    FInativo: String;
    FTipo: string;


  Public
    property IdTipo       : Integer read FIdTipo    write FIdTipo;
    property Codigo       : Integer read FCodigo    write FCodigo;
    property Tipo         : string  read FTipo      write FTipo;
    property Descricao    : string  read FDescricao write FDescricao;
    property Inativo      : String  read FInativo   write FInativo;

    Function Novo(out msg:string):Boolean;
    Function Editar(out msg:string):Boolean;
    Function Excluir(out msg:string):Boolean;

    Function Localizar(out msg:string;TabStatus:integer;campo:string):Boolean;
    Function LocalizarID(out msg:string;i:integer):Boolean;

  End;

  var
  Model  :TModelSql;

implementation

{ TModelTipoPlano }

uses Vcl.Session;

{$REGION 'Funcoes'}

function TModelTipoPlano.Editar(out msg: string): Boolean;
var
  sqlQuery: string;
begin
  Result  := false;
  sqlQuery      := 'Update plano_tipo set tipo= :tipo, descricao= :descricao, '+
                    'ativo= :ativo where id_tipo= :id and id_empresa= :idemp';

  Model     :=TModelSql.Create;
  Try
    Try
      if Model.ExecutarSQL(DM.Conn,sqlQuery, [Tipo, descricao, inativo, IdTipo, Tsession.IDEMPRESA]) then
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

function TModelTipoPlano.Excluir(out msg: string): Boolean;
var
  sqlQuery: string;
begin
  Result  := false;
  sqlQuery      := 'Delete from plano_tipo where id_tipo= :id and id_empresa= :idemp';

  model     :=TModelsql.Create;
  Try
    Try
      if Model.ExecutarSQL(DM.Conn,sqlQuery, [IdTipo, Tsession.IDEMPRESA]) then
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
    model.Free;
  End;
end;

function TModelTipoPlano.Localizar(out msg: string;TabStatus:integer; campo:string): Boolean;
var
  Qry: TUniQuery;
  sqlQuery, sqlOrdem, sqlstatus, sqlCampo: string;
begin
  Result  := False;

  sqlQuery  := 'Select * from plano_tipo '+
                ' where id_tipo > 0';
  sqlOrdem  := ' order by descricao';

  case TabStatus of
    1: sqlstatus  := ' and ativo=''S'' ';
    2: sqlstatus  := ' and ativo=''N'' ';
  end;

  Model     :=TModelsql.Create;
  Try
    if campo <> '' then
    begin
      sqlCampo  := ' and (codigo like :campo or '+
                        ' descricao like :campo)';
      Qry := Model.ConsultarSQL(DM.Conn,sqlQuery+Sqlstatus+sqlcampo+sqlordem, ['%'+campo+'%']);

    end
    else
    Qry := Model.ConsultarSQL(DM.Conn,sqlQuery+sqlstatus+sqlordem, []);

    try

      if not qry.IsEmpty then
      begin
        Result  := True;
        msg     := 'Pesquisa realizada com sucesso!';
        if dm.TabConsTipoPlano.Active then
        begin
          dm.TabConsTipoPlano.EmptyDataSet;
        end;

        Qry.First;
        dm.TabConsTipoPlano.DisableControls;

        while not Qry.Eof do
        begin
          dm.TabConsTipoPlano.Append;
          dm.TabConsTipoPlanoid_tipo.AsInteger    := Qry.FieldByName('id_tipo').Value;
          dm.TabConsTipoPlanocodigo.AsInteger     := Qry.FieldByName('codigo').Value;
          dm.TabConsTipoPlanotipo.AsString        := Qry.FieldByName('tipo').Value;
          dm.TabConsTipoPlanodescricao.AsString   := Qry.FieldByName('descricao').Value;
          dm.TabConsTipoPlanoativo.AsString       := Qry.FieldByName('ativo').Value;
          dm.TabConsTipoPlano.Post;
          Qry.Next;
        end;

        dm.TabConsTipoPlano.First;
        dm.TabConsTipoPlano.EnableControls;
      end
      else
      msg := 'Nenhum registro encontrado!';

    finally
      Qry.Free;
    end;
  Finally
    Model.Free;
  End;
end;

function TModelTipoPlano.LocalizarID(out msg: string; i: integer): Boolean;
var
  Qry: TUniQuery;
  sqlQuery, sqlOrdem, sqlstatus, sqlCampo: string;
begin
  Result  := False;

  sqlQuery  := 'Select * from plano_tipo where id_tipo= :idtipo and id_empresa= :idemp';

  Model     := TModelsql.Create;
  Try
    Qry     := Model.ConsultarSQL(DM.Conn,sqlQuery, [i,TSession.IDEMPRESA]);

    try

      if not qry.IsEmpty then
      begin
        Descricao   := Qry.FieldByName('descricao').AsString;
        Codigo      := Qry.FieldByName('codigo').AsInteger;
        IdTipo      := Qry.FieldByName('id_tipo').AsInteger;
        Inativo     := Qry.FieldByName('ativo').AsString;
        Tipo        := Qry.FieldByName('tipo').AsString;
        Result      := True;
      end;
    finally
      Qry.Free;
    end;
  Finally
    Model.Free;
  End;
end;

function TModelTipoPlano.Novo(out msg: string): Boolean;
var
  sqlQuery: string;
  id, cod:Integer;
begin
  Result  := false;
  sqlQuery      := 'Insert into plano_tipo(id_tipo, codigo, tipo, descricao, '+
                    'datacriacao,ativo,id_usuario,id_empresa)'+
                    'values(:idtipo, :codigo, :tipo, :descricao, '+
                    ':datacriacao, :ativo, :id_usuario, :id_empresa)';


  model       := Tmodelsql.Create;
  Try
    id    := Model.GerarId(dm.Conn,'plano_tipo','id_tipo');
    cod   := Model.GerarId(dm.Conn,'plano_tipo','codigo');
    Try
      if Model.ExecutarSQL(DM.Conn,sqlQuery, [id, cod, Tipo, descricao, now, inativo, TSession.ID_USUARIO, Tsession.IDEMPRESA]) then
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

{$ENDREGION}


end.
