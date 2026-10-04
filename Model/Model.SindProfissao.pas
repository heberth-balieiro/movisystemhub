unit Model.SindProfissao;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient,
  Model.SQLQry;

Type
  TModelSindProfissao = Class

  Private
    FIdEmpresa: Integer;
    FAtivo: string;
    FIdUsuario: Integer;
    FDescricao: string;
    FCodigo: Integer;
    FIdprofissao: Integer;

  Public

    property Idprofissao    : Integer read FIdprofissao   write FIdprofissao;
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

{ TModelMensagem }

function TModelSindProfissao.Editar(out msg: string): Boolean;
var
  sqlQuery: string;
begin
  Result  := false;
  sqlQuery      := 'UPDATE sindicato_profissao '+
                    ' SET                     '+
                    '  descricao  = :1,       '+
                    '  ativo      = :2,            '+
                    '  sinc_app   =''S''       '+
                    '  WHERE                 '+
                    '  id_profissao = :id     ';

  ModelSql    := TModelSQL.Create;

  Try
    Try
      if ModelSql.ExecutarSQL(DM.Conn,sqlQuery, [Descricao, Ativo, Idprofissao]) then
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

function TModelSindProfissao.Excluir(out msg: string;id:integer): Boolean;
var
  sqlQuery: string;
begin
  Result        := false;
  sqlQuery      := 'Update sindicato_profissao set ativo=''N'', sinc_app=''S'', '+
              'excluido=1, data_exc= CURRENT_TIMESTAMP, id_usuario_exc= :iduser where id_profissao= :id';

  ModelSql      := TModelSQL.Create;
  Try
    Try
      if Modelsql.ExecutarSQL(DM.Conn,sqlQuery, [id,Idprofissao]) then
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

function TModelSindProfissao.Localizar(out msg: string; TabStatus: integer;
                                  campo: string): Boolean;
var
  Qry: TUniQuery;
  sqlQuery, sqlOrdem, sqlCampo: string;
begin
  Result  := False;

  sqlQuery  := 'Select * from sindicato_profissao where id_profissao >0 and excluido=0';

  sqlOrdem  := ' order by descricao';

  ModelSql     := TModelsql.Create;

  Try
    Qry := ModelSql.ConsultarSQL(DM.Conn,sqlQuery+sqlordem, []);

    try

      if dm.TabConsSindProfissao.Active then //se estiver ativo limpar tabelas
        begin
          dm.TabConsSindProfissao.EmptyDataSet;
        end
        else
        begin
          dm.TabConsSindProfissao.Open;
          dm.TabConsSindProfissao.EmptyDataSet;
        end;

      if not qry.IsEmpty then
      begin
        Result  := True;
        msg     := 'Pesquisa realizada com sucesso!';

        Qry.First;
        dm.TabConsSindProfissao.DisableControls;

        while not Qry.Eof do
        begin
          dm.TabConsSindProfissao.Append;
          dm.TabConsSindProfissaoid_profissao.AsInteger     := Qry.FieldByName('id_profissao').AsInteger;
          dm.TabConsSindProfissaocodigo.AsInteger           := Qry.FieldByName('codigo').AsInteger;
          dm.TabConsSindProfissaodescricao.AsString         := Qry.FieldByName('descricao').AsString;
          dm.TabConsSindProfissaoativo.AsString             := Qry.FieldByName('ativo').AsString;
          
          dm.TabConsSindProfissao.Post;
          Qry.Next;
        end;

        dm.TabConsSindProfissao.First;
        dm.TabConsSindProfissao.EnableControls;
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

function TModelSindProfissao.LocalizarID(out msg: string; i: integer): Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result    := False;
  sqlQuery  := 'Select id_profissao, codigo, descricao, ativo from sindicato_profissao where id_profissao= :id';

  ModelSql  := TModelsql.Create;
  Try
    Qry     := modelSql.ConsultarSQL(DM.Conn,sqlQuery, [i]);

    try
      if not Qry.IsEmpty then
      begin
        idprofissao   := Qry.FieldByName('id_profissao').AsInteger;
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

function TModelSindProfissao.Novo(out msg: string): Boolean;
var
  sqlQuery: string;
begin
  Result  := false;
  sqlQuery      := 'INSERT INTO sindicato_profissao (id_profissao, codigo, '+
                      'descricao, id_empresa, id_usuario, datacadastro,  ativo, sinc_app)'+
                    'VALUES(:1, :2, :3, :4, :5, :6, :7, ''S'')';

  ModelSql      := TModelSQL.Create;

  Try

    Try
      idprofissao   := ModelSql.GerarId(dm.Conn,'sindicato_profissao','id_profissao');
      codigo          := ModelSql.GerarId(dm.Conn,'sindicato_profissao','codigo');

      if modelSql.ExecutarSQL(DM.Conn,sqlQuery, [idprofissao,codigo,Descricao,IdEmpresa,IdUsuario,now,Ativo]) then
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
