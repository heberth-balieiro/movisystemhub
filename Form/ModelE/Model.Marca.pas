unit Model.Marca;

interface

Uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('marca')]
  TModelMarca = class
  private
    FData_Alteracao: TDate;
    FAtivo: string;
    FData_Cadastro: TDate;
    FCodigo: Integer;
    FId_Empresa: Integer;
    FId_Usuario_Exc: Integer;
    FMarca: string;
    FTipo: string;
    FId_Marca: Integer;
    FExcluido: Integer;
    FId_Usuario_Alt: Integer;
    FId_Usuario: Integer;

  public
    [FieldName('id_marca', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property Id_Marca: Integer read FId_Marca write FId_Marca;

    [FieldName('codigo')]
    [FieldOptions([foInsert,foSelect])]
    property Codigo: Integer read FCodigo write FCodigo;

    [FieldName('marca')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property Marca: string read FMarca write FMarca;

    [FieldName('ativo')]
    [FieldOptions([foInsert,foupdate,foSelect])]
    property Ativo: string read FAtivo write FAtivo;

    [FieldName('data_cadastro')]
    [FieldOptions([foInsert])]
    property Data_Cadastro: TDate read FData_Cadastro write FData_Cadastro;

    [FieldName('data_alteracao')]
    [FieldOptions([foupdate])]
    property Data_Alteracao: TDate read FData_Alteracao write FData_Alteracao;

    [FieldName('excluido')]
    [FieldOptions([foInsert,foupdate])]
    property Excluido: Integer read FExcluido write FExcluido;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert])]
    property Id_Empresa: Integer read FId_Empresa write FId_Empresa;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert])]
    property Id_Usuario: Integer read FId_Usuario write FId_Usuario;

    [FieldName('tipo')]
    [FieldOptions([foInsert,foSelect])]
    property Tipo: string read FTipo write FTipo;

    [FieldName('id_usuario_alt')]
    [FieldOptions([foupdate])]
    property Id_Usuario_Alt: Integer read FId_Usuario_Alt write FId_Usuario_Alt;

    [FieldName('id_usuario_exc')]
    [FieldOptions([foupdate])]
    property Id_Usuario_Exc: Integer read FId_Usuario_Exc write FId_Usuario_Exc;
  end;

implementation

end.



{
Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TModelEspecie = Class

    Private
      FTransacao        : TUniTransaction;
      Fidempresaespecie : Integer;
      Fativo            : String;
      Fdescricao        : String;
      Fcodigo           : Integer;
      Fidusuarioespecie : Integer;
      Fidespecie        : Integer;
    Fidtipo: integer;

    Public
      constructor Create;
      destructor Destroy; override;

      Property idespecie          :Integer  read  Fidespecie          write Fidespecie;
      Property codigo             :Integer  read  Fcodigo             write Fcodigo;
      Property descricao          :String   read  Fdescricao          write Fdescricao;
      Property ativo              :String   read  Fativo              write Fativo;
      Property idempresaespecie   :Integer  read  Fidempresaespecie   write Fidempresaespecie;
      Property idusuarioespecie   :Integer  read  Fidusuarioespecie   write Fidusuarioespecie;
      Property idtipo             :integer  read  Fidtipo             write Fidtipo;

      Function Novo(out msg:String):Boolean;
      Function Editar(out msg:string):Boolean;
      Function Excluir(out msg:string):Boolean;
      Function Selecionarid(out msg:string):Boolean;
      Function GerarId(tab, campo:string):integer;
      Function Pesquisa(out msg:string;Filtro:String;TabInativo:integer):Boolean;

      procedure IniciarTransacao;
      procedure ConfirmarTransacao;
      procedure DesfazerTransacao;

  End;

type
  TModelModelo = Class

    Private
      FTransacao  : TUniTransaction;
      Fidempresa: integer;
      Fidmarca: integer;
      Fativo: String;
      Fidusuario: integer;
      Fdescricao: String;
      Fcodigo: integer;
      Fidveiculomodelo: integer;

    Public
      constructor Create;
      destructor Destroy; override;

      Property idveiculomodelo  :integer read Fidveiculomodelo  write Fidveiculomodelo;
      Property codigo           :integer read Fcodigo           write Fcodigo;
      Property descricao        :String  read Fdescricao        write Fdescricao;
      Property ativo            :String  read Fativo            write Fativo;
      Property idempresa        :integer read Fidempresa        write Fidempresa;
      Property idmarca          :integer read Fidmarca          write Fidmarca;
      Property idusuario        :integer read Fidusuario        write Fidusuario;

      Function Novo(out msg:String):Boolean;
      Function Editar(out msg:string):Boolean;
      Function Excluir(out msg:string):Boolean;
      Function Selecionarid(out msg:string):Boolean;
      Function GerarId(tab, campo:string):integer;
      Function Pesquisa(out msg:string;Filtro:String;TabInativo:integer):Boolean;

      procedure IniciarTransacao;
      procedure ConfirmarTransacao;
      procedure DesfazerTransacao;
  End;

Type
  TModelMarca = Class

  Private
    FTransacao  : TUniTransaction;
    Fidempresa  : integer;
    Fidmarca    : integer;
    Fidusuario  : integer;
    Fcodigo     : integer;
    FInativo    : string;
    Fmarca      : string;
    Ftipo       : String;

  public
    constructor Create;
    destructor Destroy; override;

    property idmarca        :integer  read Fidmarca     write Fidmarca;
    property codigo         :integer  read Fcodigo      write Fcodigo;
    property marca          :string   read Fmarca       write Fmarca;
    property inativo        :string   read FInativo     write Finativo;
    property idempresa      :integer  read Fidempresa   write Fidempresa;
    property idusuario      :integer  read Fidusuario   write Fidusuario;
    Property tipo           :String   read Ftipo        Write Ftipo;

    Function Insert(out msg:String):Boolean;
    Function Update(out msg:string):Boolean;
    Function Delete(out msg:string):Boolean;
    Function Select(out msg:string):Boolean;
    Function GerarId(tab, campo:string):integer;
    Function Pesquisa(out msg:string;Filtro:String;TabInativo:integer):Boolean;
    Function PesquisaMarcaVeiculo(out msg:string; filtro:string):Boolean;

    procedure IniciarTransacao;
    procedure ConfirmarTransacao;
    procedure DesfazerTransacao;

  End;

implementation

uses
  System.Math;

{ TModelMarca }

{$REGION 'Operações Marca'}
{
Function TModelMarca.GerarId(tab, campo:string):integer;
var
Qry       : TUniquery;
sqlQuery  : string;
begin
  Result  := 0;
  Qry     := TUniquery.create(nil);
  Try
    Try
      Qry.Connection := dm.Conn;
      sqlQuery := 'SELECT MAX(' + campo + ') AS id FROM ' + tab;

      With Qry do
      begin
        Close;
        Sql.clear;
        Qry.SQL.Text := sqlQuery;
        Open;

        if not Qry.IsEmpty then
        Result := Qry.FieldByName('id').AsInteger + 1
        else
        Result  := 1;

        Close;
      end;

    Except on e:exception do
      raise Exception.Create('Erro ao gerar ID:' + e.message);
    End;

  Finally
    Qry.free;
  End;
end;

Function TModelMarca.Insert(out msg:String):Boolean;
var
Qry       : TUniquery;
sqlQuery  : string;
idGerado  : Integer;
begin
  Result  := False;
  Qry     := TUniquery.create(nil);
  Try
    Try

      Qry.Connection := dm.Conn;
      sqlQuery := 'Insert Into marca (id_marca, codigo, marca, ativo, data_cadastro, excluido, id_empresa, id_usuario, tipo)'+
                  ' Values'+
                  '(:1,:2,:3,:4,:5,:6,:7,:8,:9)';
      With Qry do
      begin
        Close;
        Sql.clear;
        Qry.SQL.Text := sqlQuery;
        IniciarTransacao;
        idGerado                        := GerarId('marca', 'id_marca');

        Qry.ParamByName('1').AsInteger  := idgerado;
        Qry.ParamByName('2').Asinteger  := GerarId('marca', 'codigo');
        Qry.ParamByName('3').AsString   := Trim(marca);
        Qry.ParamByName('4').AsString   := Trim(inativo);
        Qry.ParamByName('5').AsDateTime := now;
        Qry.ParamByName('6').AsInteger  := 0;
        Qry.ParamByName('7').AsInteger  := idempresa;
        Qry.ParamByName('8').AsInteger  := idusuario;
        Qry.ParamByName('9').AsString   := tipo;

        Try
          Qry.ExecSQL;
          ConfirmarTransacao;
          result  := true;
          msg     := 'Registro realizado com sucesso';
        Except on e:exception do
          begin
            DesfazerTransacao;
            raise Exception.Create('Erro ao inserir marca: ' + e.Message);
          end;
        end;
      end;

    Except on e:exception do
      begin
        DesfazerTransacao;
        msg := 'Erro ao inserir:' +e.message;
        raise;
      end;
    End;

  Finally
    Qry.free;
  End;
end;

Function TModelMarca.Update(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.Conn;
      // Consulta SQL para atualização
      sqlQuery := 'Update marca set ' +
                  ' marca= :marca,'+
                  ' ativo= :ativo'+
                  ' WHERE id_marca = :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      IniciarTransacao;
      // Definindo parâmetros
      Qry.ParamByName('id').AsInteger       := idmarca;
      Qry.ParamByName('marca').AsString     := Trim(marca);
      Qry.ParamByName('ativo').AsString     := inativo;
      
        Try
          Qry.ExecSQL;
          ConfirmarTransacao;
          result  := true;
         msg := 'Registro atualizado com sucesso';
        Except on e:exception do
          begin
            DesfazerTransacao;
            raise Exception.Create('Erro ao inserir ticket: ' + e.Message);
          end;
        end;

    except
      on E: Exception do
      begin
        DesfazerTransacao;
        msg := 'Erro ao atualizar: ' + E.Message;
        raise;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

Function TModelMarca.Delete(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.Conn;
      // Consulta SQL para deletar o registro da tabela empresa
      sqlQuery := 'Delete from marca where id_marca= :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      IniciarTransacao;
      // Definindo parâmetro
      Qry.ParamByName('id').AsInteger    := idmarca;

      //if DeleteCandidato(msg) then
      Try
          Qry.ExecSQL;
          ConfirmarTransacao;
          result  := true;
         msg := 'Registro deletado com sucesso';
        Except on e:exception do
          begin
            DesfazerTransacao;
            raise Exception.Create('Erro ao inserir ticket: ' + e.Message);
          end;
        end;

      if Qry.RowsAffected > 0 then
      begin
        msg := 'Registro deletado com sucesso';
        Result := True;
      end
      else
        msg := 'Nenhum registro encontrado para deletar';
    except
      on E: Exception do
      begin
        DesfazerTransacao;
        msg := 'Erro ao deletar: ' + E.Message;
        raise;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

Function TModelMarca.Select(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.Conn;
      sqlQuery := 'SELECT id_marca, codigo, marca, ativo FROM MARCA WHERE ID_MARCA= :ID';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger  := idmarca;

      Qry.Open;
      if not Qry.IsEmpty then
      begin

        IdMarca    := Qry.Fieldbyname('id_marca').AsInteger;
        codigo     := Qry.Fieldbyname('codigo').AsInteger;
        marca      := Qry.Fieldbyname('marca').AsString;
        inativo    := Qry.Fieldbyname('ativo').AsString;


        msg := 'Consulta realizada com sucesso';
        Result := True;
      end
      else
        msg := 'Nenhum registro encontrado!';
    except
      on E: Exception do
      begin
        msg := 'Erro ao executar consulta: ' + E.Message;
        raise;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

Function TModelMarca.Pesquisa(out msg:string;Filtro:String;TabInativo:integer):Boolean;
var
  Qry     :TUniquery;
  sqlQuery,FiltroQuery,FiltroInativo: string;
begin
  Result                := False;

  Qry                   := TUniQuery.Create(nil);
  try
    try
      Qry.Connection    := dm.Conn;

      sqlQuery          := 'SELECT ID_MARCA, CODIGO, MARCA, case when ativo=''S'' then ''SIM'' else ''NÃO'' end as ativo '+
                           ' FROM MARCA WHERE ID_MARCA > 0';

      case TabInativo of
        1:FiltroInativo      := FiltroInativo + ' and ativo=''S''';
        2:FiltroInativo      := FiltroInativo + ' and ativo=''N''';
      end;

      if filtro <> '' then
      begin
        FiltroQuery   := ' and (codigo like :filtro or marca like :filtro)';
        sqlQuery      := sqlQuery + FiltroInativo + FiltroQuery;
      end
      else
      sqlQuery  := sqlQuery +FiltroInativo;

      dm.TabConsMarca.EmptyDataSet;
      dm.TabConsMarca.Open;

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := SqlQuery;

      if Filtro <> '' then
      qry.ParamByName('filtro').Value := '%' + filtro + '%';

      Qry.Open;
      Qry.First;

      if not Qry.IsEmpty then
      begin
        //criar campo na tebela temporaria
        dm.TabConsMarca.DisableControls;


        while not Qry.Eof do
        begin
          dm.TabConsMarca.Append;

          dm.TabConsMarca.FieldByName('ID_MARCA').Value    :=  Qry.FieldByName('ID_MARCA').Value;
          dm.TabConsMarca.FieldByName('CODIGO').Value      :=  Qry.FieldByName('CODIGO').Value;
          dm.TabConsMarca.FieldByName('MARCA').Value       :=  Qry.FieldByName('MARCA').Value;
          dm.TabConsMarca.FieldByName('ativo').Value       :=  Qry.FieldByName('ativo').Value;

          dm.TabConsMarca.Post;
          Qry.Next;
        end;
        dm.TabConsMarca.First;
        dm.TabConsMarca.EnableControls;
        msg := 'Consulta realizada com sucesso';
        Result := True;
      end
      else
        msg := 'Nenhum registro encontrado!';

      Qry.Close;
    except
      on E: Exception do
      begin
        msg := 'Erro ao executar consulta: ' + E.Message;
        raise;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

function TModelMarca.PesquisaMarcaVeiculo(out msg: string;
  filtro: string): Boolean;
var
  isNumeric: Integer;
begin
  Result  := False;
  // Definir se a pesquisa será por ID ou Nome
   DM.TabConsMarca.Filtered  := False;
   if TryStrToInt(filtro, isNumeric) then
      DM.TabConsMarca.Filter := 'codigo = ' + Quotedstr(Filtro)  // Se for número, pesquisa por ID
    else
      DM.TabConsMarca.Filter := 'marca like '+Quotedstr('%'+Filtro+'%');  // Caso contrário, pesquisa por Nome

    // Realiza a pesquisa no ClientDataSet
    DM.TabConsMarca.Filtered  := True;

    if DM.TabConsMarca.RecordCount > 0  then
    begin
      msg := 'Registro encontrado';
      result  := true;
    end
    else
    msg:= 'Registro não encontrado!';
end;
}
{$REGION 'Transações'}
{
procedure TModelMarca.IniciarTransacao;
begin
  try
    if not Assigned(FTransacao) then
      raise Exception.Create('Transação não inicializada.');

    if not FTransacao.Active then
      FTransacao.StartTransaction;
  except
    on E: Exception do
      raise Exception.Create('Erro ao iniciar transação: ' + E.Message);
  end;
end;

procedure TModelMarca.ConfirmarTransacao;
begin
  try
    if Assigned(FTransacao) and FTransacao.Active then
      FTransacao.Commit;
  except
    on E: Exception do
      raise Exception.Create('Erro ao confirmar transação: ' + E.Message);
  end;
end;

procedure TModelMarca.DesfazerTransacao;
begin
  try
    if Assigned(FTransacao) and FTransacao.Active then
      FTransacao.Rollback;
  except
    on E: Exception do
      raise Exception.Create('Erro ao desfazer transação: ' + E.Message);
  end;
end;

destructor TModelMarca.Destroy;
begin
 Try
    if Assigned(FTransacao) then
    FreeAndNil(FTransacao);


  except
    on E: Exception do
      raise Exception.Create('Erro ao liberar recursos: ' + E.Message);
  end;
  inherited Destroy;
end;

constructor TModelMarca.Create;
procedure LogErro(const Mensagem: String);
  var
    LogFile: TextFile;
    LogPath: String;
  begin
    LogPath := ExtractFilePath(ParamStr(0)) + 'Log_banco'+FormatDateTime('yyyy-mm-dd hh:nn:ss', Now)+'.txt';
    AssignFile(LogFile, LogPath);
    try
      Rewrite(LogFile);
      Writeln(LogFile, FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) + ' - ' + Mensagem);
    finally
      CloseFile(LogFile);
    end;
  end;

begin
  Try

    FTransacao                    := TUniTransaction.Create(nil);
    FTransacao.DefaultConnection  := dm.Conn;
    //LogErro('Conexão com banco de dados realizado com sucesso.');
  except on E: Exception do
    begin
      LogErro(Format('Erro ao processar conexão index %d: %s - %s', [E.ClassName, E.Message]));
      raise Exception.Create('Erro ao criar conexão: ' + E.Message);
    end;
  end;
end;


{$ENDREGION}


{$ENDREGION}

{ TModelEspecie }

{$REGION 'Operações Especie Veiculo'}
{
function TModelEspecie.Editar(out msg: string): Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.Conn;
      // Consulta SQL para atualização
      sqlQuery := 'Update veiculo_especie set ' +
                  ' descricao= :desc,'+
                  ' ativo= :ativo,'+
                  ' dataalteracao= now(),'+
                  ' id_usuario_alt= :iduser'+
                  ' WHERE id_veiculo_especie= :id';

      Qry.Params.Clear;
      Qry.SQL.Text                                  := sqlQuery;
      IniciarTransacao;
      // Definindo parâmetros
      Qry.Params.ParamByName('id').AsInteger        := idespecie;
      Qry.Params.ParamByName('desc').AsString       := Trim(descricao);
      Qry.Params.ParamByName('ativo').AsString      := ativo;
      Qry.Params.ParamByName('iduser').AsInteger    := idusuarioespecie;

      Try
        Qry.ExecSQL;
        ConfirmarTransacao;
        result  := true;
        msg := 'Registro atualizado com sucesso';
      Except on e:exception do
        begin
          DesfazerTransacao;
          raise Exception.Create('Erro ao atualizar espécie: ' + e.Message);
        end;
      end;

    except
      on E: Exception do
      begin
        DesfazerTransacao;
        msg := 'Erro ao atualizar: ' + E.Message;
        raise;
      end;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

function TModelEspecie.Excluir(out msg: string): Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.Conn;
      // Consulta SQL para deletar o registro da tabela empresa
      sqlQuery := 'Delete from veiculo_especie where id_veiculo_especie= :id';

      Qry.Params.Clear;
      Qry.SQL.Text                        := sqlQuery;
      IniciarTransacao;
      // Definindo parâmetro
      Qry.ParamByName('id').AsInteger     := idespecie;

      //if DeleteCandidato(msg) then
      Try
        Qry.ExecSQL;
        ConfirmarTransacao;
        result  := true;
        msg := 'Registro deletado com sucesso';
      Except on e:exception do
        begin
          DesfazerTransacao;
          raise Exception.Create('Erro ao deleta espécie: ' + e.Message);
        end;
      end;

    except
      on E: Exception do
      begin
        DesfazerTransacao;
        msg := 'Erro ao deletar: ' + E.Message;
        raise;
      end;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

function TModelEspecie.GerarId(tab, campo: string): integer;
var
Qry       : TUniquery;
sqlQuery  : string;
begin
  Result  := 0;
  Qry     := TUniquery.create(nil);
  Try
    Try
      Qry.Connection := dm.Conn;
      sqlQuery := 'SELECT MAX(' + campo + ') AS id FROM ' + tab;

      With Qry do
      begin
        Close;
        Sql.clear;
        Qry.SQL.Text := sqlQuery;
        Open;

        if not Qry.IsEmpty then
        Result := Qry.FieldByName('id').AsInteger + 1
        else
        Result  := 1;

        Close;
      end;

    Except on e:exception do
      raise Exception.Create('Erro ao gerar ID:' + e.message);
    End;

  Finally
    Qry.free;
  End;
end;

function TModelEspecie.Novo(out msg: String): Boolean;
var
Qry       : TUniquery;
sqlQuery  : string;
idGerado  : Integer;
begin
  Result  := False;
  Qry     := TUniquery.create(nil);
  Try
    Try
      Qry.Connection := dm.Conn;
      sqlQuery := 'Insert Into veiculo_especie (id_veiculo_especie, codigo, descricao,'+
                ' ativo, datacadastro, id_empresa, id_usuario_cad, id_tipo)'+
                  ' Values'+
                  '(:1,:2,:3,:4,:5,:6,:7, :8)';
      With Qry do
      begin
        Params.Clear;
        Qry.SQL.Text                    := sqlQuery;
        IniciarTransacao;
        idGerado                        := GerarId('veiculo_especie', 'id_veiculo_especie');

        Qry.Params.ParamByName('1').AsInteger  := idgerado;
        Qry.Params.ParamByName('2').Asinteger  := GerarId('veiculo_especie', 'codigo');
        Qry.Params.ParamByName('3').AsString   := Trim(descricao);
        Qry.Params.ParamByName('4').AsString   := Trim(ativo);
        Qry.Params.ParamByName('5').AsDateTime := now;
        Qry.Params.ParamByName('6').AsInteger  := idempresaespecie;
        Qry.Params.ParamByName('7').AsInteger  := idusuarioespecie;
        qry.Params.ParamByName('8').AsInteger  := idtipo;

        Try
          Qry.ExecSQL;
          ConfirmarTransacao;
          result  := true;
          msg     := 'Registro realizado com sucesso';
        Except on e:exception do
          begin
            DesfazerTransacao;
            raise Exception.Create('Erro ao inserir espécie veículo: ' + e.Message);
          end;
        end;
      end;

    Except on e:exception do
      begin
        DesfazerTransacao;
        msg := 'Erro ao inserir:' +e.message;
        raise;
      end;
    End;

  Finally
    FreeAndNIl(Qry);
  End;
end;

function TModelEspecie.Pesquisa(out msg: string; Filtro: String;
  TabInativo: integer): Boolean;
var
  Qry     :TUniquery;
  sqlQuery,FiltroQuery,FiltroInativo: string;
begin
  Result                := False;
  sqlQuery              := 'SELECT id_veiculo_especie, codigo, descricao, case when ativo=''S'' then ''SIM'' else ''NÃO'' end as ativo'+
                           ' FROM veiculo_especie WHERE id_veiculo_especie > 0';

  case TabInativo of
    1: FiltroInativo      := FiltroInativo + ' and ativo=''S''';
    2: FiltroInativo      := FiltroInativo + ' and ativo=''N''';
  end;

  if filtro <> '' then
  begin
    FiltroQuery   := ' and (codigo like :filtro or descricao like :filtro)';
    sqlQuery      := sqlQuery + FiltroInativo + FiltroQuery;
  end
  else
    sqlQuery  := sqlQuery +FiltroInativo;

  Qry                   := TUniQuery.Create(nil);
  try
    try
      Qry.Connection    := dm.Conn;
      Qry.Params.Clear;
      Qry.SQL.Text      := SqlQuery;

      if Filtro <> '' then
      qry.ParamByName('filtro').Value := '%' + filtro + '%';

      Qry.Open;
      Qry.First;

      dm.TabConsVeiculoEspecie.EmptyDataSet;
      dm.TabConsVeiculoEspecie.Open;

      if not Qry.IsEmpty then
      begin
        //criar campo na tebela temporaria
        dm.TabConsVeiculoEspecie.DisableControls;

        while not Qry.Eof do
        begin
          dm.TabConsVeiculoEspecie.Append;

          dm.TabConsVeiculoEspecie.FieldByName('idespecie').Value   :=  Qry.FieldByName('id_veiculo_especie').Value;
          dm.TabConsVeiculoEspecie.FieldByName('codigo').Value      :=  Qry.FieldByName('codigo').Value;
          dm.TabConsVeiculoEspecie.FieldByName('descricao').Value   :=  Qry.FieldByName('descricao').Value;
          dm.TabConsVeiculoEspecie.FieldByName('ativo').Value       :=  Qry.FieldByName('ativo').Value;

          dm.TabConsVeiculoEspecie.Post;
          Qry.Next;
        end;
        dm.TabConsVeiculoEspecie.First;
        dm.TabConsVeiculoEspecie.EnableControls;
        msg := 'Consulta realizada com sucesso';
        Result := True;
      end
      else
        msg := 'Nenhum registro encontrado!';

      Qry.Close;
    except
      on E: Exception do
      begin
        msg := 'Erro ao executar consulta: ' + E.Message;
        raise;
      end;
    end;
  finally
    FreeAndNIl(Qry);
  end;
end;

function TModelEspecie.Selecionarid(out msg: string): Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result        := False;
  sqlQuery      := 'SELECT id_veiculo_especie, codigo, descricao, ativo, id_tipo FROM veiculo_especie WHERE id_veiculo_especie= :ID';

  Qry := TUniQuery.Create(nil);

  try
    try
      Qry.Connection      := dm.Conn;
      Qry.Params.Clear;
      Qry.SQL.Text        := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger  := idespecie;

      Qry.Open;
      if not Qry.IsEmpty then
      begin
        idespecie := Qry.Fieldbyname('id_veiculo_especie').AsInteger;
        codigo    := Qry.Fieldbyname('codigo').AsInteger;
        descricao := Qry.Fieldbyname('descricao').AsString;
        ativo     := Qry.Fieldbyname('ativo').AsString;
        idtipo    := Qry.FieldByName('id_tipo').AsInteger;
        msg := 'Consulta realizada com sucesso';
        Result := True;
      end
      else
        msg := 'Nenhum registro encontrado!';
      Qry.Close;
    except
      on E: Exception do
      begin
        msg := 'Erro ao executar consulta: ' + E.Message;
        raise;
      end;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;
}
{$REGION 'Transação'}
{
procedure TModelEspecie.IniciarTransacao;
begin
   try
    if not Assigned(FTransacao) then
      raise Exception.Create('Transação não inicializada.');

    if not FTransacao.Active then
      FTransacao.StartTransaction;
  except
    on E: Exception do
      raise Exception.Create('Erro ao iniciar transação: ' + E.Message);
  end;
end;

procedure TModelEspecie.ConfirmarTransacao;
begin
  try
    if Assigned(FTransacao) and FTransacao.Active then
      FTransacao.Commit;
  except
    on E: Exception do
      raise Exception.Create('Erro ao confirmar transação: ' + E.Message);
  end;
end;

procedure TModelEspecie.DesfazerTransacao;
begin
  try
    if Assigned(FTransacao) and FTransacao.Active then
      FTransacao.Rollback;
  except
    on E: Exception do
      raise Exception.Create('Erro ao desfazer transação: ' + E.Message);
  end;
end;

constructor TModelEspecie.Create;
procedure LogErro(const Mensagem: String);
  var
    LogFile: TextFile;
    LogPath: String;
  begin
    LogPath := ExtractFilePath(ParamStr(0)) + 'Log_banco'+FormatDateTime('yyyy-mm-dd hh:nn:ss', Now)+'.txt';
    AssignFile(LogFile, LogPath);
    try
      Rewrite(LogFile);
      Writeln(LogFile, FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) + ' - ' + Mensagem);
    finally
      CloseFile(LogFile);
    end;
  end;

begin
  Try

    FTransacao                    := TUniTransaction.Create(nil);
    FTransacao.DefaultConnection  := dm.Conn;
    //LogErro('Conexão com banco de dados realizado com sucesso.');
  except on E: Exception do
    begin
      LogErro(Format('Erro ao processar conexão index %d: %s - %s', [E.ClassName, E.Message]));
      raise Exception.Create('Erro ao criar conexão: ' + E.Message);
    end;
  end;
end;

destructor TModelEspecie.Destroy;
begin
  Try
      if Assigned(FTransacao) then
      FreeAndNil(FTransacao);


  except
      on E: Exception do
      raise Exception.Create('Erro ao liberar recursos: ' + E.Message);
  end;
    inherited Destroy;
end;

{$ENDREGION}


{$ENDREGION}

{ TModelModelo }

{$REGION 'Operações Modelo Veiculo'}
{
function TModelModelo.Editar(out msg: string): Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);

  try
    try
      Qry.Connection := dm.Conn;
      // Consulta SQL para atualização
      sqlQuery := 'Update veiculo_modelo set ' +
                  ' descricao= :desc,'+
                  ' ativo= :ativo,'+
                  ' dataalteracao= now(),'+
                  ' id_usuario_alt= :iduser,'+
                  ' id_marca= :idmarca'+
                  ' WHERE id_veiculo_modelo= :id';

      Qry.Params.Clear;
      Qry.SQL.Text                                  := sqlQuery;
      IniciarTransacao;
      // Definindo parâmetros
      Qry.Params.ParamByName('id').AsInteger        := idveiculomodelo;
      Qry.Params.ParamByName('desc').AsString       := Trim(descricao);
      Qry.Params.ParamByName('ativo').AsString      := ativo;
      Qry.Params.ParamByName('iduser').AsInteger    := idusuario;
      Qry.Params.ParamByName('idmarca').AsInteger   := idmarca;

      Try
        Qry.ExecSQL;
        ConfirmarTransacao;
        result  := true;
        msg := 'Registro atualizado com sucesso';
      Except on e:exception do
        begin
          DesfazerTransacao;
          raise Exception.Create('Erro ao atualizar modelos: ' + e.Message);
        end;
      end;

    except
      on E: Exception do
      begin
        DesfazerTransacao;
        msg := 'Erro ao atualizar: ' + E.Message;
        raise;
      end;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

function TModelModelo.Excluir(out msg: string): Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);

  try
    try
      Qry.Connection := dm.Conn;
      // Consulta SQL para deletar o registro da tabela empresa
      sqlQuery := 'Delete from veiculo_modelo where id_veiculo_modelo= :id';

      Qry.Params.Clear;
      Qry.SQL.Text                        := sqlQuery;
      IniciarTransacao;
      // Definindo parâmetro
      Qry.ParamByName('id').AsInteger     := idveiculomodelo;

      //if DeleteCandidato(msg) then
      Try
        Qry.ExecSQL;
        ConfirmarTransacao;
        result  := true;
        msg := 'Registro deletado com sucesso';
      Except on e:exception do
        begin
          DesfazerTransacao;
          raise Exception.Create('Erro ao deleta modelo: ' + e.Message);
        end;
      end;

    except
      on E: Exception do
      begin
        DesfazerTransacao;
        msg := 'Erro ao deletar: ' + E.Message;
        raise;
      end;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

function TModelModelo.GerarId(tab, campo: string): integer;
var
Qry       : TUniquery;
sqlQuery  : string;
begin
  Result  := 0;
  Qry     := TUniquery.create(nil);
  Try
    Try
      Qry.Connection := dm.Conn;
      sqlQuery := 'SELECT MAX(' + campo + ') AS id FROM ' + tab;

      With Qry do
      begin
        Close;
        Sql.clear;
        Qry.SQL.Text := sqlQuery;
        Open;

        if not Qry.IsEmpty then
        Result := Qry.FieldByName('id').AsInteger + 1
        else
        Result  := 1;

        Close;
      end;

    Except on e:exception do
      raise Exception.Create('Erro ao gerar ID:' + e.message);
    End;

  Finally
    Qry.free;
  End;
end;

function TModelModelo.Novo(out msg: String): Boolean;
var
Qry       : TUniquery;
sqlQuery  : string;
idGerado  : Integer;
begin
  Result  := False;
  Qry     := TUniquery.create(nil);

  Try
    Try
      Qry.Connection := dm.Conn;
      sqlQuery := 'Insert Into veiculo_modelo (id_veiculo_modelo, codigo, descricao,'+
                ' ativo, datacadastro, id_empresa, id_marca, id_usuario_cad)'+
                  ' Values'+
                  '(:1,:2,:3,:4,:5,:6,:7,:8)';
      With Qry do
      begin
        Params.Clear;
        Qry.SQL.Text                    := sqlQuery;
        IniciarTransacao;
        idGerado                        := GerarId('veiculo_modelo', 'id_veiculo_modelo');

        Qry.Params.ParamByName('1').AsInteger  := idgerado;
        Qry.Params.ParamByName('2').Asinteger  := GerarId('veiculo_modelo', 'codigo');
        Qry.Params.ParamByName('3').AsString   := Trim(descricao);
        Qry.Params.ParamByName('4').AsString   := Trim(ativo);
        Qry.Params.ParamByName('5').AsDateTime := now;
        Qry.Params.ParamByName('6').AsInteger  := idempresa;
        Qry.Params.ParamByName('7').AsInteger  := idmarca;
        Qry.Params.ParamByName('8').AsInteger  := idusuario;

        Try
          Qry.ExecSQL;
          ConfirmarTransacao;
          result  := true;
          msg     := 'Registro realizado com sucesso';
        Except on e:exception do
          begin
            DesfazerTransacao;
            raise Exception.Create('Erro ao inserir modelo veículo: ' + e.Message);
          end;
        end;
      end;

    Except on e:exception do
      begin
        DesfazerTransacao;
        msg := 'Erro ao inserir:' +e.message;
        raise;
      end;
    End;

  Finally
    FreeAndNIl(Qry);
  End;
end;

function TModelModelo.Pesquisa(out msg: string; Filtro: String;
  TabInativo: integer): Boolean;
var
  Qry     :TUniquery;
  sqlQuery,FiltroQuery,FiltroInativo: string;
begin
  Result                := False;
  sqlQuery              := 'SELECT vm.id_veiculo_modelo, vm.codigo, vm.descricao, '+
                            'case when vm.ativo=''S'' then ''SIM'' else ''NÃO'' end as ativo,'+
                            'vm.id_marca, m.marca as nmmarca'+
                           ' FROM veiculo_modelo vm '+
                           ' inner join marca m'+
                           ' on vm.id_marca = m.id_marca'+
                           ' WHERE vm.id_veiculo_modelo > 0';

  case TabInativo of
    1: FiltroInativo      := FiltroInativo + ' and ativo=''S''';
    2: FiltroInativo      := FiltroInativo + ' and ativo=''N''';
  end;

  if filtro <> '' then
  begin
    FiltroQuery   := ' and (vm.codigo like :filtro or vm.descricao like :filtro)';
    sqlQuery      := sqlQuery + FiltroInativo + FiltroQuery;
  end
  else
    sqlQuery  := sqlQuery +FiltroInativo;

  Qry                   := TUniQuery.Create(nil);
  try
    try
      Qry.Connection    := dm.Conn;
      Qry.Params.Clear;
      Qry.SQL.Text      := SqlQuery;

      if Filtro <> '' then
      qry.ParamByName('filtro').Value := '%' + filtro + '%';

      Qry.Open;
      Qry.First;

      dm.TabConsModeloVeiculo.EmptyDataSet;
      dm.TabConsModeloVeiculo.Open;

      if not Qry.IsEmpty then
      begin
        //criar campo na tebela temporaria
        dm.TabConsModeloVeiculo.DisableControls;

        while not Qry.Eof do
        begin
          dm.TabConsModeloVeiculo.Append;

          dm.TabConsModeloVeiculo.FieldByName('idmodelo').AsInteger   :=  Qry.FieldByName('id_veiculo_modelo').AsInteger;
          dm.TabConsModeloVeiculo.FieldByName('codigo').AsInteger     :=  Qry.FieldByName('codigo').AsInteger;
          dm.TabConsModeloVeiculo.FieldByName('descricao').AsString   :=  Qry.FieldByName('descricao').AsString;
          dm.TabConsModeloVeiculo.FieldByName('ativo').AsString       :=  Qry.FieldByName('ativo').AsString;
          dm.TabConsModeloVeiculo.FieldByName('idmarca').AsInteger    :=  Qry.FieldByName('id_marca').AsInteger;
          dm.TabConsModeloVeiculo.FieldByName('nmmarca').AsString     :=  Qry.FieldByName('nmmarca').AsString;

          dm.TabConsModeloVeiculo.Post;
          Qry.Next;
        end;
        dm.TabConsModeloVeiculo.First;
        dm.TabConsModeloVeiculo.EnableControls;
        msg := 'Consulta realizada com sucesso';
        Result := True;
      end
      else
        msg := 'Nenhum registro encontrado!';

      Qry.Close;
    except
      on E: Exception do
      begin
        msg := 'Erro ao executar consulta: ' + E.Message;
        raise;
      end;
    end;
  finally
    FreeAndNIl(Qry);
  end;
end;

function TModelModelo.Selecionarid(out msg: string): Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result        := False;
  sqlQuery      := 'SELECT id_veiculo_modelo, codigo, descricao, ativo, id_marca FROM veiculo_modelo WHERE id_veiculo_modelo= :ID';

  Qry := TUniQuery.Create(nil);

  try
    try
      Qry.Connection      := dm.Conn;
      Qry.Params.Clear;
      Qry.SQL.Text        := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger  := idveiculomodelo;

      Qry.Open;
      if not Qry.IsEmpty then
      begin
        idveiculomodelo := Qry.Fieldbyname('id_veiculo_modelo').AsInteger;
        codigo          := Qry.Fieldbyname('codigo').AsInteger;
        descricao       := Qry.Fieldbyname('descricao').AsString;
        ativo           := Qry.Fieldbyname('ativo').AsString;
        idmarca         := Qry.Fieldbyname('id_marca').AsInteger;

        msg := 'Consulta realizada com sucesso';
        Result := True;
      end
      else
        msg := 'Nenhum registro encontrado!';
      Qry.Close;
    except
      on E: Exception do
      begin
        msg := 'Erro ao executar consulta: ' + E.Message;
        raise;
      end;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

}
{$REGION 'Transações'}
{
procedure TModelModelo.IniciarTransacao;
begin
   try
    if not Assigned(FTransacao) then
      raise Exception.Create('Transação não inicializada.');

    if not FTransacao.Active then
      FTransacao.StartTransaction;
  except
    on E: Exception do
      raise Exception.Create('Erro ao iniciar transação: ' + E.Message);
  end;
end;

procedure TModelModelo.ConfirmarTransacao;
begin
  try
    if Assigned(FTransacao) and FTransacao.Active then
      FTransacao.Commit;
  except
    on E: Exception do
      raise Exception.Create('Erro ao confirmar transação: ' + E.Message);
  end;
end;

constructor TModelModelo.Create;
procedure LogErro(const Mensagem: String);
  var
    LogFile: TextFile;
    LogPath: String;
  begin
    LogPath := ExtractFilePath(ParamStr(0)) + 'Log_banco'+FormatDateTime('yyyy-mm-dd hh:nn:ss', Now)+'.txt';
    AssignFile(LogFile, LogPath);
    try
      Rewrite(LogFile);
      Writeln(LogFile, FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) + ' - ' + Mensagem);
    finally
      CloseFile(LogFile);
    end;
  end;

begin
  Try

    FTransacao                    := TUniTransaction.Create(nil);
    FTransacao.DefaultConnection  := dm.Conn;
    //LogErro('Conexão com banco de dados realizado com sucesso.');
  except on E: Exception do
    begin
      LogErro(Format('Erro ao processar conexão index %d: %s - %s', [E.ClassName, E.Message]));
      raise Exception.Create('Erro ao criar conexão: ' + E.Message);
    end;
  end;
end;

procedure TModelModelo.DesfazerTransacao;
begin
  try
    if Assigned(FTransacao) and FTransacao.Active then
      FTransacao.Rollback;
  except
    on E: Exception do
      raise Exception.Create('Erro ao desfazer transação: ' + E.Message);
  end;
end;

destructor TModelModelo.Destroy;
begin
  Try
      if Assigned(FTransacao) then
      FreeAndNil(FTransacao);
  except
      on E: Exception do
      raise Exception.Create('Erro ao liberar recursos: ' + E.Message);
  end;
    inherited Destroy;
end;

{$ENDREGION}

{$ENDREGION}



