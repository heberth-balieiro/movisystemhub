unit Model.SindDependente;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TModelDependente = Class

  Private
    FTransacao  : TUniTransaction;

    FIdEmpresa: Integer;
    Frg: string;
    Fnascimento: Tdate;
    FAtivo: string;
    FIdUsuario: Integer;
    FCodigo: Integer;
    Fcpf: string;
    Ffoto: string;
    Fiddependente: Integer;
    Fidsocio: Integer;
    Fparentesco: string;
    Fsexo: string;
    Fnome: string;
    FAutorizado: string;
    Ffone: String;
    function GerarId(tab, campo: string): integer;

  Public
    constructor Create;
    destructor Destroy;

    property iddependente   : Integer read Fiddependente write Fiddependente;
    property Codigo         : Integer read FCodigo        write FCodigo;
    property idsocio        : Integer read Fidsocio       write Fidsocio;
    property nome           : string  read Fnome          write Fnome;
    property nascimento     : Tdate   read Fnascimento    write Fnascimento;
    property parentesco     : string  read Fparentesco    write Fparentesco;
    property cpf            : string  read Fcpf           write Fcpf;
    property rg             : string  read Frg            write Frg;
    property sexo           : string  read Fsexo          write Fsexo;
    property foto           : string  read Ffoto          write Ffoto;
    property IdEmpresa      : Integer read FIdEmpresa     write FIdEmpresa;
    property IdUsuario      : Integer read FIdUsuario     write FIdUsuario;
    property Ativo          : string  read FAtivo         write FAtivo;
    property Autorizado     : string  read FAutorizado    write FAutorizado;
    property fone           : String  read Ffone          write Ffone;

    Function Novo(out msg:string):Boolean;
    Function Editar(out msg:string):Boolean;
    Function Excluir(out msg:string; iduser:integer):Boolean;

    Function Localizar(out msg:string;TabStatus:integer;campo:string):Boolean;
    Function LocalizarID(out msg:string;i:integer):Boolean;

    procedure IniciarTransacao;
    procedure ConfirmarTransacao;
    procedure DesfazerTransacao;

  End;

implementation

{ TModelMensagem }

uses cxDateUtils,System.Variants, UConeSul;

{$REGION 'CRUD'}

function TModelDependente.Editar(out msg: string): Boolean;
var
  Qry : TUniquery;
  sqlQuery: string;
begin
  Result  := false;
  sqlQuery      := 'UPDATE sindicato_dependente '+
                    'SET                    '+
                    ' nome=         :1,     '+
                    ' nascimento=   :2,     '+
                    ' parentesco=   :3,     '+
                    ' cpf=          :4,     '+
                    ' rg=           :5,     '+
                    ' sexo=         :6,     '+
                    ' foto=         :7,     '+
                    ' ativo=        :8,      '+
                    ' autorizado=   :9,      '+
                    ' fone=         :10,       '+
                    ' sinc_app= ''S''         '+
                    ' WHERE                '+
                    ' id_dependente = :id and id_socio= :idsocio';

  Qry    := TUniquery.Create(nil);

  Try
    Try
      

      Qry.Connection    := dm.Conn;
      Qry.SQL.Clear;
      Qry.SQL.Text      := sqlQuery;

      IniciarTransacao;

      Qry.Params.ParamByName('1').AsString       := nome;
      if nascimento = NullDate then
      Qry.Params.ParamByName('2').Clear
      else
      Qry.Params.ParamByName('2').AsDate         := nascimento;
      Qry.Params.ParamByName('3').AsString       := parentesco;
      Qry.Params.ParamByName('4').AsString       := cpf;
      Qry.Params.ParamByName('5').AsString       := rg;
      Qry.Params.ParamByName('6').AsString       := sexo;
      if foto = '' then
      Qry.Params.ParamByName('7').IsNull
      else
      Qry.Params.ParamByName('7').AsString       := foto;
      Qry.Params.ParamByName('8').AsString       := ativo;
      Qry.Params.ParamByName('9').AsString       := Autorizado;
      Qry.Params.ParamByName('10').AsString      := fone;

      Qry.Params.ParamByName('id').AsInteger     := iddependente;
      Qry.Params.ParamByName('idsocio').AsInteger:= idsocio;

      Try
        Qry.ExecSQL;
        ConfirmarTransacao;
        result  := true;
        msg     := 'Registro atualizado com sucesso!';
      Except on e:exception do
        begin
          DesfazerTransacao;
          msg     := 'Erro ao atualizar os dados!';
          exit;
        end;
      end;
      
    Except on e:exception do
      begin
        DesfazerTransacao;
        msg     := 'Erro ao atualizar os dados!';
        raise Exception.Create(e.message);
      end;
    End;

  Finally
    FreeAndNil(Qry);
  End;

end;

function TModelDependente.Excluir(out msg: string; iduser:integer): Boolean;
var
  Qry             : TUniquery;
  sqlQuery        : string;
  verificarQuery  : string;
begin
  Result        := false;
  sqlQuery      := ' Update sindicato_dependente set ativo=''N'', sinc_app=''S'', excluido=1, data_exc=CURRENT_TIMESTAMP, id_usuario_exc= :iduser '+
                    ' WHERE id_dependente = :id_dependente    ';



  Qry           := TUniquery.Create(nil);
  Try
    Try
      if not dm.Conn.Connected then
        dm.Conn.Connected := True;

      Qry.Connection    := dm.Conn;
      Qry.SQL.Text          := sqlQuery;

      IniciarTransacao;
      qry.Params.ParamByName('iduser').AsInteger      := iduser;
      qry.Params.ParamByName('id_dependente').AsInteger      := iddependente;

      Try
        Qry.ExecSQL;
        ConfirmarTransacao;
        result  := true;
        msg     := 'Registro excluido com sucesso!';
      Except on e:exception do
        begin
          DesfazerTransacao;
          msg     := 'Erro ao excluir os dados!';
          exit;
        end;
      end;

    Except on e:exception do
      begin
        DesfazerTransacao;
        msg     := 'Erro ao excluir os dados!';
        raise Exception.Create(e.message);
      end;
    End;

  Finally
    FreeAndNil(Qry);
  End;
end;

function TModelDependente.Localizar(out msg: string; TabStatus: integer;
                                  campo: string): Boolean;
var
  Qry: TUniQuery;
  sqlQuery, sqlOrdem, sqlCampo: string;
begin
  Result  := False;

  sqlQuery  := 'Select * from sindicato_dependente where id_dependente >0 and id_socio= :id and excluido=0';
  sqlOrdem  := ' order by nome';

  Qry       := TUniQuery.Create(nil);

  Try
    try
      if not dm.Conn.Connected then
        dm.Conn.Connected := True;

      Qry.Connection    := dm.Conn;
      Qry.SQL.Clear;
      Qry.SQL.Text      := sqlQuery + sqlordem;

      Qry.Params.ParamByName('id').AsInteger      := idsocio;

      Try
        Qry.Open;

        dm.TabConsSindDependentes.EmptyDataSet;
        dm.TabConsSindDependentes.Open;

        if not qry.IsEmpty then
        begin
          Result  := True;
          msg     := 'Pesquisa realizada com sucesso!';

          Qry.First;
          dm.TabConsSindDependentes.DisableControls;

          while not Qry.Eof do
          begin
            dm.TabConsSindDependentes.Append;
            dm.TabConsSindDependentesid_dependente.AsInteger  := Qry.FieldByName('id_dependente').AsInteger;
            dm.TabConsSindDependentescodigo.AsInteger         := Qry.FieldByName('codigo').AsInteger;
            dm.TabConsSindDependentesnome.AsString            := Qry.FieldByName('nome').AsString;
            dm.TabConsSindDependentesparentesco.AsString      := Qry.FieldByName('parentesco').AsString;
            dm.TabConsSindDependentescpf.AsString             := TConeSul.AplicarMascaraCPF(Qry.FieldByName('cpf').AsString);
            dm.TabConsSindDependentessexo.AsString            := Qry.FieldByName('sexo').AsString;
            dm.TabConsSindDependentesativo.AsString           := Qry.FieldByName('ativo').AsString;
            dm.TabConsSindDependentesAutorizado.Asstring      := Qry.FieldByName('autorizado').AsString;
            Qry.Next;
          end;
          dm.TabConsSindDependentes.Post;
          dm.TabConsSindDependentes.First;
        end
        else
        begin
          msg     := 'Nenhum registro encontrado!';
          result  := true;
        end;
        dm.TabConsSindDependentes.EnableControls;
        Qry.Close;
      except on e:exception do
        begin
          msg     := 'Erro ao realizar a busca: '+e.Message;
          exit;
        end;
      End;

    Except on e:exception do
      begin
        msg     := 'Erro ao realizar a busca: '+e.Message;
      end;
    end;
  Finally
    FreeAndNil(Qry);
  End;
end;

function TModelDependente.LocalizarID(out msg: string; i: integer): Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result    := False;    // Qry     := modelSql.ConsultarSQL(sqlQuery, [i,idsocio]);
  sqlQuery  := 'Select * from sindicato_dependente where id_dependente= :id and id_socio= :idsocio';

  Qry       := TUniQuery.Create(nil);

  Try
    Try
      if not dm.Conn.Connected then
        dm.Conn.Connected := True;

      Qry.Connection    := dm.Conn;
      Qry.SQL.Clear;
      Qry.SQL.Text      := sqlQuery;

      Qry.Params.ParamByName('id').AsInteger      := i;
      Qry.Params.ParamByName('idsocio').AsInteger := idsocio;

      Qry.Open;

      if not Qry.IsEmpty then
      begin
        iddependente  := Qry.FieldByName('id_dependente').AsInteger;
        codigo        := Qry.FieldByName('codigo').AsInteger;
        nome          := Qry.FieldByName('nome').AsString;
        nascimento    := Qry.FieldByName('nascimento').AsDateTime;
        cpf           := Qry.FieldByName('cpf').AsString;
        rg            := Qry.FieldByName('rg').AsString;
        parentesco    := Qry.FieldByName('parentesco').AsString;
        sexo          := Qry.FieldByName('sexo').AsString;
        foto          := Qry.FieldByName('foto').AsString;
        ativo         := Qry.FieldByName('ativo').AsString;
        Autorizado    := Qry.FieldByName('autorizado').AsString;
        fone          := Qry.FieldByName('fone').AsString;
        Result        := True;
      end;
      Qry.Close;
    except on e:exception do
      begin
        raise Exception.Create('Erro: '+e.Message);
      end;
    End;

  Finally
    FreeAndNil(qry);
  End;
end;

function TModelDependente.Novo(out msg: string): Boolean;
var
  qry         : TUniquery;
  sqlQuery: string;
begin
  Result      := false;
  sqlQuery    := 'INSERT INTO sindicato_dependente (id_dependente, codigo, id_socio, '+
                      'nome, nascimento, parentesco, cpf, rg, sexo, foto, id_empresa, id_usuario, datacadastro, ativo,autorizado, fone, sinc_app)'+
                    'VALUES(:1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :11, :12, :13, :14, :15, :16, ''S'')';

  qry         := TUniquery.Create(nil);

  Try
    Try
      if not dm.Conn.Connected then
        dm.Conn.Connected := True;

      Qry.Connection    := dm.Conn;
      Qry.SQL.Clear;
      Qry.SQL.Text      := sqlQuery;

      IniciarTransacao;
      iddependente := GerarId('sindicato_dependente','id_dependente');
      codigo       := GerarId('sindicato_dependente','codigo');

      Qry.Params.ParamByName('1').AsInteger       := iddependente;
      Qry.Params.ParamByName('2').AsInteger       := codigo;
      Qry.Params.ParamByName('3').AsInteger       := idsocio;
      Qry.Params.ParamByName('4').AsString        := nome;
      if nascimento = NullDate then
      Qry.Params.ParamByName('5').Clear
      else
      Qry.Params.ParamByName('5').AsDate          := nascimento;
      Qry.Params.ParamByName('6').AsString        := parentesco;
      Qry.Params.ParamByName('7').AsString        := cpf;
      Qry.Params.ParamByName('8').AsString        := rg;
      Qry.Params.ParamByName('9').AsString        := sexo;
      if foto = '' then
      Qry.Params.ParamByName('10').IsNull
      else
      Qry.Params.ParamByName('10').AsString       := foto;
      Qry.Params.ParamByName('11').AsInteger      := idempresa;
      Qry.Params.ParamByName('12').AsInteger      := idusuario;
      Qry.Params.ParamByName('13').AsDate         := Now();
      Qry.Params.ParamByName('14').AsString       := ativo;
      Qry.Params.ParamByName('15').AsString       := Autorizado;
      Qry.Params.ParamByName('16').AsString       := fone;

      Try
        Qry.ExecSQL;
        ConfirmarTransacao;
        result  := true;
        msg     := 'Registro inserido com sucesso!';
      Except on e:exception do
        begin
          DesfazerTransacao;
          msg     := 'Erro ao inserir os dados!';
          exit;
        end;
      end;

    Except on e:exception do
      begin
        DesfazerTransacao;
        msg     := 'Erro ao inserir os dados!';
        raise Exception.Create(e.message);
      end;
    End;

  Finally
    FreeAndNil(Qry);
  End;

end;

{$ENDREGION}

{$REGION 'Transação'}

procedure TModelDependente.IniciarTransacao;
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

procedure TModelDependente.ConfirmarTransacao;
begin
  try
    if Assigned(FTransacao) and FTransacao.Active then
      FTransacao.Commit;
  except
    on E: Exception do
      raise Exception.Create('Erro ao confirmar transação: ' + E.Message);
  end;
end;

procedure TModelDependente.DesfazerTransacao;
begin
  try
    if Assigned(FTransacao) and FTransacao.Active then
      FTransacao.Rollback;
  except
    on E: Exception do
      raise Exception.Create('Erro ao desfazer transação: ' + E.Message);
  end;
end;

{$ENDREGION}

{$REGION 'Geral'}

constructor TModelDependente.Create;
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

destructor TModelDependente.Destroy;
begin
  Try
    if Assigned(FTransacao) then
    FreeAndNil(FTransacao);


  except
    on E: Exception do
      raise Exception.Create('Erro ao liberar recursos: ' + E.Message);
  end;
  inherited;
end;

function TModelDependente.GerarId(tab, campo: string): integer;
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
    FreeAndNil(Qry)
  End;
end;

{$ENDREGION}

end.
