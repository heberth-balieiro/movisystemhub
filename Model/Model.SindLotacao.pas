unit Model.SindLotacao;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient,
  Model.SQLQry;

Type
  TModelSindLotacao = Class

  Private
    FIdEmpresa: Integer;
    FAtivo: string;
    FIdUsuario: Integer;
    FDescricao: string;
    FCodigo: Integer;
    FIdLotacao: Integer;
  Public

    property IdLotacao      : Integer read FIdLotacao     write FIdLotacao;
    property Codigo         : Integer read FCodigo        write FCodigo;
    property Descricao      : string  read FDescricao     write FDescricao;
    property IdEmpresa      : Integer read FIdEmpresa     write FIdEmpresa;
    property IdUsuario      : Integer read FIdUsuario     write FIdUsuario;
    property Ativo          : string  read FAtivo         write FAtivo;

    Function Novo(out msg:string):Boolean;
    Function Editar(out msg:string):Boolean;
    Function Excluir(out msg:string; id:integer):Boolean;

    Function Localizar(out msg:string;TabStatus:integer;campo:string):Boolean;
    Function LocalizarID(out msg:string;i:integer):Boolean;

  End;

  var
  ModelSql   :TModelSql;

implementation

{ TModelMensagem }

function TModelSindLotacao.Editar(out msg: string): Boolean;
var
  sqlQuery: string;
begin
  Result  := false;
  sqlQuery      := 'UPDATE sindicato_lotacao '+
                    'SET                     '+
                    '  descricao = :1,       '+
                    '  ativo = :2,            '+
                    ' sinc_app=''S''          '+
                    '  WHERE                 '+
                    '  id_lotacao = :id     ';

  ModelSql    := TModelSQL.Create;

  Try
    Try
      if ModelSql.ExecutarSQL(DM.Conn,sqlQuery, [Descricao, Ativo, idlotacao]) then
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

function TModelSindLotacao.Excluir(out msg: string; id:integer): Boolean;
var
  sqlQuery: string;
begin
  Result        := false;
  sqlQuery      := 'Update sindicato_lotacao set ativo=''N'', sinc_app=''S'', excluido=1, data_exc= CURRENT_TIMESTAMP, id_usuario_exc= :iduser where id_lotacao= :id';

  ModelSql      := TModelSQL.Create;
  Try
    Try
      if Modelsql.ExecutarSQL(DM.Conn,sqlQuery, [id, idlotacao]) then
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

function TModelSindLotacao.Localizar(out msg: string; TabStatus: integer;
                                  campo: string): Boolean;
var
  Qry: TUniQuery;
  sqlQuery, sqlOrdem, sqlCampo: string;
begin
  Result  := False;

  sqlQuery  := 'Select * from sindicato_lotacao where id_lotacao >0 and excluido=0';

  sqlOrdem  := ' order by descricao';

  ModelSql     := TModelsql.Create;

  Try
    Qry := ModelSql.ConsultarSQL(DM.Conn,sqlQuery+sqlordem, []);

    try

      if dm.TabConsSindLotacao.Active then //se estiver ativo limpar tabelas
        begin
          dm.TabConsSindLotacao.EmptyDataSet;
        end
        else
        begin
          dm.TabConsSindLotacao.Open;
          dm.TabConsSindLotacao.EmptyDataSet;
        end;

      if not qry.IsEmpty then
      begin
        Result  := True;
        msg     := 'Pesquisa realizada com sucesso!';

        Qry.First;
        dm.TabConsSindLotacao.DisableControls;

        while not Qry.Eof do
        begin
          dm.TabConsSindLotacao.Append;
          dm.TabConsSindLotacaoid_lotacao.AsInteger     := Qry.FieldByName('id_lotacao').AsInteger;
          dm.TabConsSindLotacaocodigo.AsInteger           := Qry.FieldByName('codigo').AsInteger;
          dm.TabConsSindLotacaodescricao.AsString         := Qry.FieldByName('descricao').AsString;
          dm.TabConsSindLotacaoativo.AsString             := Qry.FieldByName('ativo').AsString;
          
          dm.TabConsSindLotacao.Post;
          Qry.Next;
        end;

        dm.TabConsSindLotacao.First;
        dm.TabConsSindLotacao.EnableControls;
      end
      else
      msg := 'Nenhum registro encontrado!';

    finally
      Qry.Free;
    end;
  Finally
    ModelSql.Free;
  End;
end;

function TModelSindLotacao.LocalizarID(out msg: string; i: integer): Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result    := False;
  sqlQuery  := 'Select id_lotacao, codigo, descricao, ativo from sindicato_lotacao where id_lotacao= :id';

  ModelSql  := TModelsql.Create;
  Try
    Qry     := modelSql.ConsultarSQL(DM.Conn,sqlQuery, [i]);

    try
      if not Qry.IsEmpty then
      begin
        idlotacao     := Qry.FieldByName('id_lotacao').AsInteger;
        codigo        := Qry.FieldByName('codigo').AsInteger;
        descricao     := Qry.FieldByName('descricao').AsString;
        ativo         := Qry.FieldByName('ativo').AsString;
        Result        := True;
      end;

    finally
      Qry.Free;
    end;
  Finally
    ModelSql.Free;
  End;
end;

function TModelSindLotacao.Novo(out msg: string): Boolean;
var
  sqlQuery: string;
begin
  Result  := false;
  sqlQuery      := 'INSERT INTO sindicato_lotacao (id_lotacao, codigo, '+
                      'descricao, id_empresa, id_usuario, datacadastro,  ativo, sinc_app)'+
                    'VALUES(:1, :2, :3, :4, :5, :6, :7, ''S'')';

  ModelSql      := TModelSQL.Create;

  Try

    Try
      idlotacao    := ModelSql.GerarId(dm.Conn,'sindicato_lotacao','id_lotacao');
      codigo       := ModelSql.GerarId(dm.Conn,'sindicato_lotacao','codigo');

      if modelSql.ExecutarSQL(DM.Conn,sqlQuery, [idlotacao,codigo,Descricao,IdEmpresa,IdUsuario,now,Ativo]) then
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
