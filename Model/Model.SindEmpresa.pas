unit Model.SindEmpresa;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient,
  Model.SQLQry;

Type
  TModelSindEmpresa = Class

  Private
    FIdEmpresa: Integer;
    FAtivo: string;
    FIdUsuario: Integer;
    FDescricao: string;
    FCodigo: Integer;
    FSindIdEmpresa: Integer;
    FIdSede: Integer;

  Public

    property SindIdEmpresa  : Integer read FSindIdEmpresa write FSindIdEmpresa;
    property Codigo         : Integer read FCodigo        write FCodigo;
    property Descricao      : string  read FDescricao     write FDescricao;
    property IdSede         : Integer read FIdSede        write FIdSede;
    property IdEmpresa      : Integer read FIdEmpresa     write FIdEmpresa;
    property IdUsuario      : Integer read FIdUsuario     write FIdUsuario;
    property Ativo          : string  read FAtivo         write FAtivo;

    Function Novo(out msg:string):Boolean;
    Function Editar(out msg:string):Boolean;
    Function Excluir(out msg:string):Boolean;

    Function Localizar(out msg:string;TabStatus:integer;campo:string):Boolean;
    Function LocalizarID(out msg:string;i:integer):Boolean;

  End;

  var
  ModelSql   :TModelSql;

implementation

{ TModelMensagem }

function TModelSindEmpresa.Editar(out msg: string): Boolean;
var
  sqlQuery: string;
begin
  Result  := false;
  sqlQuery      := 'UPDATE sindicato_empresa '+
                    'SET                     '+
                    '  descricao = :1,       '+
                    '  id_sede= :2,          '+
                    '  ativo = :3,            '+
                    ' sinc_app=''S''          '+
                    '  WHERE                 '+
                    '  sind_id_empresa = :id     ';

  ModelSql    := TModelSQL.Create;

  Try
    Try
      if ModelSql.ExecutarSQL(DM.Conn,sqlQuery, [Descricao, IdSede, Ativo, SindIdEmpresa]) then
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

function TModelSindEmpresa.Excluir(out msg: string): Boolean;
var
  sqlQuery: string;
begin
  Result        := false;
  sqlQuery      := 'Delete from sindicato_empresa where sind_id_empresa= :id';

  ModelSql      := TModelSQL.Create;
  Try
    Try
      if Modelsql.ExecutarSQL(DM.Conn,sqlQuery, [SindIdEmpresa]) then
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

function TModelSindEmpresa.Localizar(out msg: string; TabStatus: integer;
                                  campo: string): Boolean;
var
  Qry: TUniQuery;
  sqlQuery, sqlOrdem, sqlCampo: string;
begin
  Result  := False;

  sqlQuery  := 'Select * from sindicato_empresa where sind_id_empresa >0';

  sqlOrdem  := ' order by descricao';

  ModelSql     := TModelsql.Create;

  Try
    Qry := ModelSql.ConsultarSQL(DM.Conn,sqlQuery+sqlordem, []);

    try

      if dm.TabConsSindEmpresa.Active then //se estiver ativo limpar tabelas
        begin
          dm.TabConsSindEmpresa.EmptyDataSet;
        end
        else
        begin
          dm.TabConsSindEmpresa.Open;
          dm.TabConsSindEmpresa.EmptyDataSet;
        end;

      if not qry.IsEmpty then
      begin
        Result  := True;
        msg     := 'Pesquisa realizada com sucesso!';

        Qry.First;
        dm.TabConsSindEmpresa.DisableControls;

        while not Qry.Eof do
        begin
          dm.TabConsSindEmpresa.Append;
          dm.TabConsSindEmpresasind_id_empresa.AsInteger  := Qry.FieldByName('sind_id_empresa').AsInteger;
          dm.TabConsSindEmpresacodigo.AsInteger           := Qry.FieldByName('codigo').AsInteger;
          dm.TabConsSindEmpresadescricao.AsString         := Qry.FieldByName('descricao').AsString;
          dm.TabConsSindEmpresaativo.AsString             := Qry.FieldByName('ativo').AsString;
          dm.TabConsSindEmpresaid_sede.AsInteger          := Qry.FieldByName('id_sede').AsInteger;

          dm.TabConsSindEmpresa.Post;
          Qry.Next;
        end;

        dm.TabConsSindEmpresa.First;
        dm.TabConsSindEmpresa.EnableControls;
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

function TModelSindEmpresa.LocalizarID(out msg: string; i: integer): Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result    := False;
  sqlQuery  := 'Select sind_id_empresa, codigo, descricao, id_sede, ativo from sindicato_empresa where sind_id_empresa= :id';

  ModelSql  := TModelsql.Create;
  Try
    Qry     := modelSql.ConsultarSQL(DM.Conn,sqlQuery, [i]);

    try
      if not Qry.IsEmpty then
      begin
        SindIdEmpresa := Qry.FieldByName('sind_id_empresa').AsInteger;
        codigo        := Qry.FieldByName('codigo').AsInteger;
        descricao     := Qry.FieldByName('descricao').AsString;
        ativo         := Qry.FieldByName('ativo').AsString;
        idsede        := Qry.FieldByName('id_sede').AsInteger;
        Result        := True;
      end;

    finally
      Qry.Free;
    end;
  Finally
    ModelSql.Free;
  End;
end;

function TModelSindEmpresa.Novo(out msg: string): Boolean;
var
  sqlQuery: string;
begin
  Result  := false;
  sqlQuery      := 'INSERT INTO sindicato_empresa (sind_id_empresa, codigo, '+
                      'descricao, id_sede, id_empresa, id_usuario, datacadastro,  ativo, sinc_app)'+
                    'VALUES(:1, :2, :3, :4, :5, :6, :7, :8, ''S'')';

  ModelSql      := TModelSQL.Create;

  Try

    Try
      SindIdEmpresa   := ModelSql.GerarId(dm.Conn,'sindicato_empresa','sind_id_empresa');
      codigo          := ModelSql.GerarId(dm.Conn,'sindicato_empresa','codigo');

      if modelSql.ExecutarSQL(DM.Conn,sqlQuery, [SindIdEmpresa,codigo,Descricao,IdSede,IdEmpresa,IdUsuario,now,Ativo]) then
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
