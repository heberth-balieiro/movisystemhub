unit Model.Secretaria;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient,
  Model.SQLQry;

Type
  TModelSecretaria = Class

  Private
    FIdEmpresa: Integer;
    FAtivo: string;
    FIdUsuario: Integer;
    FDescricao: string;
    FCodigo: Integer;
    Fidsecretaria: Integer;

  Public

    property idsecretaria   : Integer read Fidsecretaria  write Fidsecretaria;
    property Codigo         : Integer read FCodigo        write FCodigo;
    property Descricao      : string  read FDescricao     write FDescricao;
    property IdEmpresa      : Integer read FIdEmpresa     write FIdEmpresa;
    property IdUsuario      : Integer read FIdUsuario     write FIdUsuario;
    property Ativo          : string  read FAtivo         write FAtivo;

    Function Novo(out msg:string):Boolean;
    Function Editar(out msg:string):Boolean;
    Function Excluir(out msg:string;id:integer):Boolean;

    Function Localizar(out msg:string;TabStatus:integer;campo:string):Boolean;
    Function LocalizarID(out msg:string;i:integer):Boolean;

  End;

  var
  ModelSql   :TModelSql;

implementation

{ TModelSecretaria }

function TModelSecretaria.Editar(out msg: string): Boolean;
var
  sqlQuery: string;
begin
  Result  := false;
  sqlQuery      := 'UPDATE secretaria '+
                    'SET                     '+
                    '  razao = :1,       '+
                    '  ativo = :2,            '+
                    ' sinc_app= ''S'''+
                    '  WHERE                 '+
                    '  id_secretaria = :id     ';

  ModelSql    := TModelSQL.Create;

  Try
    Try
      if ModelSql.ExecutarSQL(DM.Conn,sqlQuery, [Descricao, Ativo, idsecretaria]) then
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
    ModelSql.Free;
  End;

end;

function TModelSecretaria.Excluir(out msg: string;id:integer): Boolean;
var
  sqlQuery: string;
begin
  Result        := false;
  sqlQuery      := 'Update secretaria set ativo=''N'', sinc_app=''S'', excluido=1, data_exc= CURRENT_TIMESTAMP, id_usuario_exc= :iduser where id_secretaria= :id';

  ModelSql      := TModelSQL.Create;
  Try
    Try
      if Modelsql.ExecutarSQL(DM.Conn,sqlQuery, [id, idsecretaria]) then
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
    ModelSql.Free;
  End;
end;

function TModelSecretaria.Localizar(out msg: string; TabStatus: integer;
                                  campo: string): Boolean;
var
  Qry: TUniQuery;
  sqlQuery, sqlOrdem, sqlCampo: string;
begin
  Result  := False;

  sqlQuery  := 'Select * from secretaria where id_secretaria >0 and excluido=0';

  sqlOrdem  := ' order by razao';

  ModelSql     := TModelsql.Create;

  Try

    dm.TabConsSecretaria.EmptyDataSet;
    dm.TabConsSecretaria.Open;

    Try

      Qry := ModelSql.ConsultarSQL(DM.Conn,sqlQuery+sqlordem, []);

      try

        Qry.First;
        dm.TabConsSecretaria.DisableControls;

        if not qry.IsEmpty then
        begin
          Result  := True;
          msg     := 'Pesquisa realizada com sucesso!';

          while not Qry.Eof do
          begin

            dm.TabConsSecretaria.Append;
            dm.TabConsSecretariaid_secretaria.AsInteger   := Qry.FieldByName('id_secretaria').AsInteger;
            dm.TabConsSecretariacodigo.AsInteger          := Qry.FieldByName('codigo').AsInteger;
            dm.TabConsSecretariarazao.AsString            := Qry.FieldByName('razao').AsString;
            dm.TabConsSecretariaativo.AsString            := Qry.FieldByName('ativo').AsString;

            Qry.Next;
          end;

          dm.TabConsSecretaria.Post;
          dm.TabConsSecretaria.First;

        end
        else
        msg := 'Nenhum registro encontrado!';

      finally
        Qry.Free;
        dm.TabConsSecretaria.EnableControls;
      end;
    except on e:exception do
      begin
        msg := 'Erro: '+e.Message;
      end;
    End;
  Finally
    ModelSql.Free;
  End;
end;

function TModelSecretaria.LocalizarID(out msg: string; i: integer): Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result    := False;
  sqlQuery  := 'Select id_secretaria, codigo, razao, ativo from secretaria where id_secretaria= :id';

  ModelSql  := TModelsql.Create;
  Try
    try
      Qry     := modelSql.ConsultarSQL(DM.Conn,sqlQuery, [i]);

      try
        if not Qry.IsEmpty then
        begin
          idsecretaria  := Qry.FieldByName('id_secretaria').AsInteger;
          codigo        := Qry.FieldByName('codigo').AsInteger;
          descricao     := Qry.FieldByName('razao').AsString;
          ativo         := Qry.FieldByName('ativo').AsString;
          Result        := True;
        end;

      finally
        Qry.Free;
      end;

    except on e:exception do
      begin
        msg := 'Erro: '+e.Message;
      end;
    end;
  Finally
    ModelSql.Free;
  End;
end;

function TModelSecretaria.Novo(out msg: string): Boolean;
var
  sqlQuery: string;
begin
  Result  := false;
  sqlQuery      := 'INSERT INTO secretaria (id_secretaria, codigo, '+
                      'razao, ativo, id_empresa, id_usuario,sinc_app)'+
                    'VALUES(:1, :2, :3, :4, :5, :6,''S'')';

  ModelSql      := TModelSQL.Create;

  Try

    Try
      idsecretaria   := ModelSql.GerarId(dm.Conn,'secretaria','id_secretaria');
      codigo         := ModelSql.GerarId(dm.Conn,'secretaria','codigo');

      if modelSql.ExecutarSQL(DM.Conn,sqlQuery, [idsecretaria,codigo,Descricao, Ativo,IdEmpresa,IdUsuario]) then
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
    ModelSql.Free;
  End;

end;

end.
