unit Model.Carteirinha;

interface

Uses
  Uni,System.SysUtils,Vcl.Graphics,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient,
  UConeSul,
  Vcl.ExtCtrls, DelphiZXingQRCode, System.UITypes, Vcl.Controls;

Type
  TModelCarteirinha = Class

  Private
    FTransacao  : TUniTransaction;

    FIdEmpresa: Integer;
    Fidcarteira: Integer;
    FAtivo: string;
    Fdigital: string;
    FIdUsuario: Integer;
    Fimpdependente: string;
    Fsenha: string;
    Fidsocio: Integer;
    Fvalidade: Tdate;
    Fdataemissao: Tdate;
    FQrCode: String;
    Fiddependente: Integer;
    Flogincpf: String;
    Fnomeuser: String;
    function GerarId(tab, campo: string): integer;

  Public
    constructor Create;
    destructor Destroy;

    property idcarteira     : Integer read Fidcarteira    write Fidcarteira;
    property idsocio        : Integer read Fidsocio       write Fidsocio;
    property validade       : Tdate   read Fvalidade      write Fvalidade;
    property Ativo          : string  read FAtivo         write FAtivo;
    property impdependente  : string  read Fimpdependente write Fimpdependente;
    property digital        : string  read Fdigital       write Fdigital;
    property senha          : string  read Fsenha         write Fsenha;
    property IdEmpresa      : Integer read FIdEmpresa     write FIdEmpresa;
    property IdUsuario      : Integer read FIdUsuario     write FIdUsuario;
    property dataemissao    : Tdate   read Fdataemissao   write Fdataemissao;
    Property QrCode         : String  read FQrCode        write FQrCode;
    Property iddependente   : Integer read Fiddependente  write Fiddependente;
    property logincpf       : String  read Flogincpf      write Flogincpf;
    property nomeuser       : String  read Fnomeuser      write Fnomeuser;

    Function Novo(out msg:string):Boolean;
    Function Editar(out msg:string):Boolean;
    Function Excluir(idc, ids:integer):Boolean;
    function ExcluirDependente(id: integer): Boolean;

    Function Localizar(out msg:string;TabStatus:integer;campo:string):Boolean;
    Function LocalizarID(out msg:string;i:integer):Boolean;
    Function ValidarExitsAssociado(out msg:string;id:integer):Boolean;//antes de salvar verificar se ja tem algum cadastro ativo
    function ValidarExitsDependente(out msg: string; id: integer): Boolean;

    function LocalizarIDDependente(i: integer): Boolean;

    Function ExibirFoto(i:integer):String;
    function ExibirFotoDependente(i: integer): String;

    Function ImprimirCarteira(i:integer):Boolean;
    function CarregarDependente(TabStatus, IDS: integer): Boolean;

    procedure IniciarTransacao;
    procedure ConfirmarTransacao;
    procedure DesfazerTransacao;
  End;

implementation

{ TModelMensagem }

uses cxDateUtils,System.Variants,
  Controllers.Auth, Winapi.Windows, UnitCadCarteira;

{$REGION 'Associado cat'}

function TModelCarteirinha.Editar(out msg: string): Boolean;
var
  Qry     :TUniquery;
  sqlQuery: string;
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
  Result        := false;
  sqlQuery      := 'UPDATE carteira '+
                    'SET                        '+
                    ' validade=   :2,           '+
                    ' ativo=      :3,           '+
                    ' impresso_dependente=  :4, '+
                    ' digital=    :5,           '+
                    ' senha=      :6,            '+
                    ' login=      :7,            '+
                    ' nomeuser=   :8,            '+
                    ' sinc_app= ''S''           '+
                    ' WHERE                     '+
                    ' id_carteira= :id';

  Qry           := Tuniquery.Create(nil);

  Try
    try


      Qry.Connection          := dm.Conn;
      Qry.SQL.Text            := sqlQuery;
      IniciarTransacao;

      if (validade = NullDate) or (validade= 00/00/0000) then
      Qry.Params.ParamByName('2').Clear
      else
      Qry.Params.ParamByName('2').AsDate          := validade;
      Qry.Params.ParamByName('3').AsString        := ativo;
      Qry.Params.ParamByName('4').AsString        := impdependente;
      Qry.Params.ParamByName('5').AsString        := digital;
      Qry.Params.ParamByName('6').AsString        := TConesul.Crypt('C',senha);
      Qry.Params.ParamByName('7').AsString        := logincpf;
      Qry.Params.ParamByName('8').AsString        := nomeuser;
      Qry.Params.ParamByName('id').AsInteger      := idcarteira;

      Try
        Qry.ExecSQL;
        ConfirmarTransacao;
        result  := true;
        msg     := 'Dados salvo com sucesso';
      Except on e:exception do
        begin
          DesfazerTransacao;
          LogErro('Erro ao processar dados carteira: ' + E.Message);
          msg   := 'Erro ao salvar:'+e.Message;
          exit;
        end;
      end;

    Except on e:exception do
      begin
        DesfazerTransacao;
        msg   := 'Erro ao salvar:'+e.Message;
        raise Exception.Create(e.message);
      end;
    end;
  Finally
    freeandnil(Qry);
  End;

end;

function TModelCarteirinha.Excluir(idc, ids:integer): Boolean;
var
  Qry, QryDep :Tuniquery;
  sqlQuery, sqlQueryDepen: string;
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
  Result        := false;
  sqlQuery      := 'Delete from carteira where id_carteira= :id';
  sqlQueryDepen := 'Delete from carteira where id_socio= :ids';

  Qry           := TUniquery.Create(nil);
  QryDep        := TUniquery.Create(nil);

  Try
    Try
      if not dm.Conn.Connected then
        dm.Conn.Connected := True;

      Qry.Connection          := dm.Conn;
      QryDep.Connection       := dm.Conn;
      Qry.SQL.Clear;
      QryDep.SQL.Clear;

      Qry.SQL.Text            := sqlQuery;
      QryDep.SQL.Text         := sqlQueryDepen;

      Qry.Params.ParamByName('id').AsInteger      := idc;
      QryDep.Params.ParamByName('ids').AsInteger  := ids;

      IniciarTransacao;

      //Criar uma função para excluir carteira na web se ouver.

      Try
        QryDep.ExecSQL;
        Qry.ExecSQL;
        ConfirmarTransacao;
        result  := true;
      Except on e:exception do
        begin
          DesfazerTransacao;
          LogErro('Erro ao excluir carteira: ' + E.Message);
          exit;
        end;
      end;

    except on e:exception do
      begin
        DesfazerTransacao;
        raise Exception.Create('Error ao excluir carteira'+e.Message);
      end;
    End;
  Finally
    freeAndNil(Qry);
    freeandnil(QryDep);
  End;

end;

function TModelCarteirinha.Localizar(out msg: string; TabStatus: integer;
                                  campo: string): Boolean;
var
  Qry: TUniQuery;
  sqlQuery, sqlOrdem, sqlCampo, sqlTab: string;
begin
  Result  := False;

  sqlQuery  := 'Select                                 '+
                ' c.id_carteira,                       '+
                ' s.id_socio,                          '+
                ' c.validade,                          '+
                ' c.ativo,                             '+
                ' case'+
                ' when c.digital= ''S'' then ''SIM'' else ''NÃO'' end as digital, '+
                ' s.matricula,                         '+
                ' s.codigo,                            '+
                ' s.nome,                              '+
                ' s.cpf,                               '+
                ' e.razao,                              '+
                ' case                 '+
                ' when c.api= ''S'' then ''SIM'' else ''NÃO'' end as api '+
                ' from carteira c                      '+
                ' inner join socio s                   '+
                ' on c.id_socio= s.id_socio            '+
                ' inner join secretaria e              '+
                ' on s.escritorio= e.id_secretaria     '+
                ' where id_dependente <=0';

  sqlOrdem  := ' order by s.nome';


  case TabStatus of
    0: sqlTab := ' and c.ativo= ''S'' ';
    1: sqlTab := ' and c.ativo= ''N'' ';
  end;

  if campo <> '' then
  begin
    sqlCampo  := ' and (s.matricula like :filtro or s.codigo like :filtro or s.nome like :filtro or s.cpf like :filtro)';
    sqlQuery  := sqlQuery + sqlTab + sqlCampo + sqlOrdem;
  end
  else
  sqlQuery  := sqlQuery + sqlTab +sqlOrdem;

  Qry       := TUniQuery.Create(nil);

  Try
    Try
      if not dm.Conn.Connected then
        dm.Conn.Connected := True;

      Qry.Connection    := dm.Conn;
      Qry.SQL.Clear;
      Qry.SQL.Text      := sqlQuery;

      if campo <> '' then
      Qry.Params.ParamByName('filtro').AsString := '%' + campo + '%';

      qry.Open;

      dm.TabConsCarteira.EmptyDataSet;
      dm.TabConsCarteira.Open;

      if not qry.IsEmpty then
      begin
        Result  := True;
        msg     := 'Pesquisa realizada com sucesso!';

        Qry.First;
        dm.TabConsCarteira.DisableControls;

        while not Qry.Eof do
        begin
          dm.TabConsCarteira.Append;

          dm.TabConsCarteiraid_carteira.AsInteger   := Qry.FieldByName('id_carteira').AsInteger;
          dm.TabConsCarteiraid_socio.AsInteger      := Qry.FieldByName('id_socio').AsInteger;
          if (Qry.FieldByName('validade').AsDateTime = 00/00/0000) or (Qry.FieldByName('validade').AsDateTime = strtodate('30/12/1899')) then
          dm.TabConsCarteiravalidade.Clear
          else
          dm.TabConsCarteiravalidade.AsDateTime     := Qry.FieldByName('validade').AsDateTime;
          dm.TabConsCarteiraativo.AsString          := Qry.FieldByName('ativo').AsString;
          dm.TabConsCarteiradigital.AsString        := Qry.FieldByName('digital').AsString;
          dm.TabConsCarteiramatricula.AsInteger     := Qry.FieldByName('matricula').AsInteger;
          dm.TabConsCarteiracodigo.AsInteger        := Qry.FieldByName('codigo').AsInteger;
          dm.TabConsCarteiranome.AsString           := Qry.FieldByName('nome').AsString;
          dm.TabConsCarteiracpf.AsString            := TConeSul.AplicarMascaraCPF(Qry.FieldByName('cpf').AsString);
          dm.TabConsCarteirarazao.AsString          := Qry.FieldByName('razao').AsString;
          dm.TabConsCarteiraapi.AsString            := Qry.FieldByName('api').AsString;
          Qry.Next;
        end;

        dm.TabConsCarteira.Post;
        dm.TabConsCarteira.First;
      end
      else
      begin
        msg := 'Nenhum registro encontrado!';
      end;
      dm.TabConsCarteira.EnableControls;
      Qry.Close;
    Except on e:exception do
      begin
        msg := 'Erro ao realizar a pesquisa: '+e.Message;
      end;
    End;

  Finally
    FreeAndNil(Qry);
  End;

end;

function TModelCarteirinha.LocalizarID(out msg: string; i: integer): Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result    := False;
  sqlQuery  := 'Select * from carteira where id_carteira= :idcat';

  Qry       := TUniQuery.Create(nil);
  Try
    Try
      //Qry     := modelSql.ConsultarSQL(sqlQuery, [i]);
      if not dm.Conn.Connected then
        dm.Conn.Connected := True;

      Qry.Connection    := dm.Conn;
      Qry.SQL.Clear;
      Qry.SQL.Text      := sqlQuery;
      Qry.Params.ParamByName('idcat').AsInteger   := i;

      Qry.Open;

        if not Qry.IsEmpty then
        begin

          idcarteira    := Qry.FieldByName('id_carteira').AsInteger;
          idsocio       := Qry.FieldByName('id_socio').AsInteger;
          validade      := Qry.FieldByName('validade').AsDateTime;
          Ativo         := Qry.FieldByName('ativo').AsString;
          impdependente := Qry.FieldByName('impresso_dependente').AsString;
          digital       := Qry.FieldByName('digital').AsString;
          senha         := Tconesul.Crypt('D',Qry.FieldByName('senha').AsString);
          dataemissao   := Qry.FieldByName('dataemissao').AsDateTime;

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

function TModelCarteirinha.Novo(out msg: string): Boolean;
var
  Qry :TuniQuery;
  sqlQuery: string;
  idgerado:integer;
  img:Timage;
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
  Result  := false;
  sqlQuery      := 'INSERT INTO carteira (id_carteira, id_socio, validade, ativo, '+
                    'impresso_dependente, digital, senha, id_usuario, id_empresa, dataemissao, qrcde, id_dependente, login, nomeuser,sinc_app)'+
                    'VALUES(:1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :11, :12, :13, :14,''S'')';

  Qry           := TuniQuery.Create(nil);

  Try
    try
      if not dm.Conn.Connected then
        dm.Conn.Connected := True;

      Qry.Connection          := dm.Conn;
      Qry.SQL.Clear;

      IniciarTransacao;
      Qry.SQL.Text                             := sqlQuery;

      idgerado                                 := GerarId('carteira','id_carteira');
      Qry.Params.ParamByName('1').AsInteger    := idgerado;
      Qry.Params.ParamByName('2').AsInteger    := idsocio;
      if validade = NullDate then
      Qry.Params.ParamByName('3').Clear
      else
      Qry.Params.ParamByName('3').AsDateTime   := validade;
      Qry.Params.ParamByName('4').AsString     := ativo;
      Qry.Params.ParamByName('5').AsString     := impdependente;
      Qry.Params.ParamByName('6').AsString     := digital;
      Qry.Params.ParamByName('7').AsString     := TConesul.Crypt('C',senha);
      Qry.Params.ParamByName('8').AsInteger    := idusuario;
      Qry.Params.ParamByName('9').AsInteger    := idempresa;
      Qry.Params.ParamByName('10').AsDate      := date;

      //montar o qrCode da carteira
      QrCode      := GerarToken(nomeuser,logincpf,inttostr(idgerado));      //Gerar o token
      img         := TImage.Create(nil);
      try
        TConeSul.GerarQRCode(img,QrCode);       //gerar o arcode na minha img
        Qrcode        := TConeSul.ConvImgBase64(img); //Gerar o qrcode em base64 passando minha img criada.
      finally
        img.Free;
      end;

      Qry.Params.ParamByName('11').AsString    := QrCode; //string com a base64 do qrcode gerado.
      Qry.Params.ParamByName('12').AsInteger   := iddependente;
      Qry.Params.ParamByName('13').AsString    := logincpf;
      qry.Params.ParamByName('14').AsString    := nomeuser;

      Try
        Qry.ExecSQL;
        ConfirmarTransacao;
        result  := true;
        msg     := 'Carteira salvo com sucesso';
      Except on e:exception do
        begin
          DesfazerTransacao;
          LogErro('Erro ao processar dados carteira: ' + E.Message);
          msg   := 'Erro ao processar dados carteira: ' + E.Message;
          exit;
        end;
      end;

    except on e:exception do
      begin
        DesfazerTransacao;
        raise Exception.Create(e.message);
      end;
    end;
  Finally
    freeAndNil(qry);
  End;

end;

function TModelCarteirinha.GerarId(tab, campo: string): integer;
var
Qry       : TUniquery;
sqlQuery  : string;
begin
  Result  := 0;
  sqlQuery := 'SELECT MAX(' + campo + ') AS id FROM ' + tab;

  Qry     := TUniquery.create(nil);
  Try
    Try
      if not dm.Conn.Connected then
        dm.Conn.Connected := True;
      Qry.Connection          := dm.Conn;

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
    FreeAndNil(qry);
  End;
end;

Function TModelCarteirinha.ValidarExitsAssociado(out msg:string;id:integer):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;  //passado para o service
begin
  Result    := False;
  sqlQuery  := 'Select id_socio from carteira where id_socio= :id and ativo=''S'' ';

  Qry       := TUniQuery.Create(nil);

  Try
    Try

      if not dm.Conn.Connected then
        dm.Conn.Connected := True;

      Qry.Connection    := dm.Conn;
      Qry.SQL.Text      := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger   := id;

      Qry.Open;

      if not Qry.IsEmpty then
        begin
          msg := 'Associado já contas uma carteirinha ativa!';
          Result        := True;
        end
        else
        msg := '';
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

Function TModelCarteirinha.ExibirFoto(i:integer):String;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result    := '';  //remover e passa para area certa de validacao
  sqlQuery  := 'Select foto from socio where id_socio= :id';

  Qry       := TUniQuery.Create(nil);
  Try
    Try
      //Qry     := modelSql.ConsultarSQL(sqlQuery, [i]);
      if not dm.Conn.Connected then
        dm.Conn.Connected := True;

      Qry.Connection    := dm.Conn;
      Qry.SQL.Clear;
      Qry.SQL.Text      := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger   := i;

      Qry.Open;

      if not Qry.IsEmpty then
        begin
          Result  := Qry.FieldByName('foto').AsString;
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

Function TModelCarteirinha.ImprimirCarteira(i:integer):Boolean;
var
  Qry: TUniQuery;
  sqlQuery, sqlOrdem, sqlCampo, sqlTab: string;
begin
  Result  := False;

  sqlQuery  := 'WITH DependentesCTE AS (                                      '+
               ' SELECT                                                       '+
               '   dep.id_socio,                                              '+
               '   dep.nome,                                                  '+
               '   dep.nascimento,                                            '+
               '   dep.parentesco,                                            '+
               '   dep.cpf,                                                   '+
               '   ROW_NUMBER() OVER (PARTITION BY dep.id_socio ORDER BY dep.nome) AS row_num   '+
               ' FROM sindicato_dependente dep                                '+
               ' )                                                            '+
               ' SELECT                                                       '+
               ' c.id_carteira,                                               '+
               ' s.id_socio,                                                  '+
               ' c.validade,                                                  '+
               ' c.ativo,                                                     '+
               ' c.digital,                                                   '+
               ' s.matricula,                                                  '+
               ' s.codigo,                                                    '+
               ' s.nome,                                                      '+
               ' s.cpf,                                                       '+
               ' s.rg,                                                         '+
               ' s.pis,                                                        '+
               ' s.serie,                                                     '+
               ' s.nascimento,                                                '+
               ' s.admissao,                                                  '+
               ' p.descricao AS profissao,                                     '+
               ' ci.cidade AS naturalcidade,                                  '+
               ' s.foto,                                                      '+
               ' s.mae,                                                       '+
               ' s.pai,                                                       '+
               ' s.socio_deste,                                               '+
               ' s.ctps,                                                       '+
               ' MAX(CASE WHEN d.row_num = 1 THEN d.nome ELSE NULL END) AS depnome1,      '+
               ' MAX(CASE WHEN d.row_num = 1 THEN d.nascimento ELSE NULL END) AS depnascimento1, '+
               ' MAX(CASE WHEN d.row_num = 1 THEN d.parentesco ELSE NULL END) AS depparentesco1,'+
               ' MAX(CASE WHEN d.row_num = 1 THEN d.cpf ELSE NULL END) AS depcpf1,             '+
               ' MAX(CASE WHEN d.row_num = 2 THEN d.nome ELSE NULL END) AS depnome2,            '+
               ' MAX(CASE WHEN d.row_num = 2 THEN d.nascimento ELSE NULL END) AS depnascimento2, '+
               ' MAX(CASE WHEN d.row_num = 2 THEN d.parentesco ELSE NULL END) AS depparentesco2, '+
               ' MAX(CASE WHEN d.row_num = 2 THEN d.cpf ELSE NULL END) AS depcpf2,               '+
               ' MAX(CASE WHEN d.row_num = 3 THEN d.nome ELSE NULL END) AS depnome3,             '+
               ' MAX(CASE WHEN d.row_num = 3 THEN d.nascimento ELSE NULL END) AS depnascimento3, '+
               ' MAX(CASE WHEN d.row_num = 3 THEN d.parentesco ELSE NULL END) AS depparentesco3,  '+
               ' MAX(CASE WHEN d.row_num = 3 THEN d.cpf ELSE NULL END) AS depcpf3,                '+
               ' MAX(CASE WHEN d.row_num = 4 THEN d.nome ELSE NULL END) AS depnome4,              '+
               ' MAX(CASE WHEN d.row_num = 4 THEN d.nascimento ELSE NULL END) AS depnascimento4,  '+
               ' MAX(CASE WHEN d.row_num = 4 THEN d.parentesco ELSE NULL END) AS depparentesco4,  '+
               ' MAX(CASE WHEN d.row_num = 4 THEN d.cpf ELSE NULL END) AS depcpf4,               '+
               ' MAX(CASE WHEN d.row_num = 5 THEN d.nome ELSE NULL END) AS depnome5,              '+
               ' MAX(CASE WHEN d.row_num = 5 THEN d.nascimento ELSE NULL END) AS depnascimento5,   '+
               ' MAX(CASE WHEN d.row_num = 5 THEN d.parentesco ELSE NULL END) AS depparentesco5,   '+
               ' MAX(CASE WHEN d.row_num = 5 THEN d.cpf ELSE NULL END) AS depcpf5,                 '+
               ' MAX(CASE WHEN d.row_num = 6 THEN d.nome ELSE NULL END) AS depnome6,               '+
               ' MAX(CASE WHEN d.row_num = 6 THEN d.nascimento ELSE NULL END) AS depnascimento6,    '+
               ' MAX(CASE WHEN d.row_num = 6 THEN d.parentesco ELSE NULL END) AS depparentesco6,   '+
               ' MAX(CASE WHEN d.row_num = 6 THEN d.cpf ELSE NULL END) AS depcpf6               '+
               ' FROM carteira c                                                        '+
               ' INNER JOIN easydev.socio s ON c.id_socio = s.id_socio                   '+
               ' INNER JOIN easydev.sindicato_profissao p ON s.id_profissao = p.id_profissao    '+
               ' INNER JOIN easydev.cidade ci ON s.natural_cidade = ci.id_cidade               '+
               ' LEFT JOIN DependentesCTE d ON s.id_socio = d.id_socio                        '+
               ' WHERE s.id_socio = :id                                                     '+
               ' GROUP BY                                                      '+
               ' c.id_carteira,   '+
               ' s.id_socio,                                                         '+
               ' c.validade,      '+
               ' c.ativo,         '+
               ' c.digital,       '+
               ' s.matricula,     '+
               ' s.codigo,         '+
               ' s.nome,          '+
               ' s.cpf,            '+
               ' s.rg,             '+
               ' s.pis,            '+
               ' s.serie,          '+
               ' s.nascimento,     '+
               ' s.admissao,      '+
               ' p.descricao,      '+
               ' ci.cidade,        '+
               ' s.foto,           '+
               ' s.mae,            '+
               ' s.pai,             '+
               ' s.socio_deste,     '+
               ' s.ctps;           '+
               '';

  Qry     := TUniQuery.Create(nil);

  Try
    //Qry := ModelSql.ConsultarSQL(sqlQuery, [i]);
    try
      if not dm.Conn.Connected then
        dm.Conn.Connected := True;

      Qry.Connection    := dm.Conn;
      Qry.SQL.Clear;
      Qry.SQL.Text      := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger   := i;

      Qry.Open;

      dm.TabCarteirinhaImpresso.EmptyDataSet;
      dm.TabCarteirinhaImpresso.Open;

      if not qry.IsEmpty then
      begin
        Result  := True;

        Qry.First;
        dm.TabCarteirinhaImpresso.DisableControls;

        while not Qry.Eof do
        begin
          dm.TabCarteirinhaImpresso.Append;

          dm.TabCarteirinhaImpressoid_carteira.AsInteger        := Qry.FieldByName('id_carteira').AsInteger;
          dm.TabCarteirinhaImpressoid_socio.AsInteger           := Qry.FieldByName('id_socio').AsInteger;
          dm.TabCarteirinhaImpressovalidade.AsDateTime          := Qry.FieldByName('validade').AsDateTime;
          dm.TabCarteirinhaImpressoativo.AsString               := Qry.FieldByName('ativo').AsString;
          dm.TabCarteirinhaImpressodigital.AsString             := Qry.FieldByName('digital').AsString;
          dm.TabCarteirinhaImpressomatricula.AsInteger          := Qry.FieldByName('matricula').AsInteger;
          dm.TabCarteirinhaImpressocodigo.AsInteger             := Qry.FieldByName('codigo').AsInteger;
          dm.TabCarteirinhaImpressonome.AsString                := Qry.FieldByName('nome').AsString;
          dm.TabCarteirinhaImpressocpf.AsString                 := Qry.FieldByName('cpf').AsString;
          dm.TabCarteirinhaImpressorg.AsString                  := Qry.FieldByName('rg').AsString;
          dm.TabCarteirinhaImpressopis.AsString                 := Qry.FieldByName('pis').AsString;
          dm.TabCarteirinhaImpressoserie.AsString               := Qry.FieldByName('serie').AsString;
          dm.TabCarteirinhaImpressonascimento.AsDateTime        := Qry.FieldByName('nascimento').AsDateTime;
          dm.TabCarteirinhaImpressoadmissao.AsDateTime          := Qry.FieldByName('admissao').AsDateTime;
          dm.TabCarteirinhaImpressoprofissao.AsString           := Qry.FieldByName('profissao').AsString;
          dm.TabCarteirinhaImpressonaturalidade.AsString        := Qry.FieldByName('naturalcidade').AsString;
          dm.TabCarteirinhaImpressofoto.AsString                := Qry.FieldByName('foto').AsString;
          dm.TabCarteirinhaImpressomae.AsString                 := Qry.FieldByName('mae').AsString;
          dm.TabCarteirinhaImpressopai.AsString                 := Qry.FieldByName('pai').AsString;
          dm.TabCarteirinhaImpressosocio_deste.AsDateTime       := Qry.FieldByName('socio_deste').AsDateTime;
          dm.TabCarteirinhaImpressoctps.AsInteger               := Qry.FieldByName('ctps').AsInteger;
          dm.TabCarteirinhaImpressodepnome1.AsString            := Qry.FieldByName('depnome1').AsString;
          dm.TabCarteirinhaImpressodepnascimento1.AsDateTime    := Qry.FieldByName('depnascimento1').AsDateTime;
          dm.TabCarteirinhaImpressodepparentesco1.AsString      := Qry.FieldByName('depparentesco1').AsString;
          dm.TabCarteirinhaImpressodepcpf1.AsString             := Qry.FieldByName('depcpf1').AsString;
          dm.TabCarteirinhaImpressodepnome2.AsString            := Qry.FieldByName('depnome2').AsString;
          dm.TabCarteirinhaImpressodepnascimento2.AsDateTime    := Qry.FieldByName('depnascimento2').AsDateTime;
          dm.TabCarteirinhaImpressodepparentesco2.AsString      := Qry.FieldByName('depparentesco2').AsString;
          dm.TabCarteirinhaImpressodepcpf2.AsString             := Qry.FieldByName('depcpf2').AsString;
          dm.TabCarteirinhaImpressodepnome3.AsString            := Qry.FieldByName('depnome3').AsString;
          dm.TabCarteirinhaImpressodepnascimento3.AsDateTime    := Qry.FieldByName('depnascimento3').AsDateTime;
          dm.TabCarteirinhaImpressodepparentesco3.AsString      := Qry.FieldByName('depparentesco3').AsString;
          dm.TabCarteirinhaImpressodepcpf3.AsString             := Qry.FieldByName('depcpf3').AsString;
          dm.TabCarteirinhaImpressodepnome4.AsString            := Qry.FieldByName('depnome4').AsString;
          dm.TabCarteirinhaImpressodepnascimento4.AsDateTime    := Qry.FieldByName('depnascimento4').AsDateTime;
          dm.TabCarteirinhaImpressodepparentesco4.AsString      := Qry.FieldByName('depparentesco4').AsString;
          dm.TabCarteirinhaImpressodepcpf4.AsString             := Qry.FieldByName('depcpf4').AsString;
          dm.TabCarteirinhaImpressodepnome5.AsString            := Qry.FieldByName('depnome5').AsString;
          dm.TabCarteirinhaImpressodepnascimento5.AsDateTime    := Qry.FieldByName('depnascimento5').AsDateTime;
          dm.TabCarteirinhaImpressodepparentesco5.AsString      := Qry.FieldByName('depparentesco5').AsString;
          dm.TabCarteirinhaImpressodepcpf5.AsString             := Qry.FieldByName('depcpf5').AsString;
          dm.TabCarteirinhaImpressodepnome6.AsString            := Qry.FieldByName('depnome6').AsString;
          dm.TabCarteirinhaImpressodepnascimento6.AsDateTime    := Qry.FieldByName('depnascimento6').AsDateTime;
          dm.TabCarteirinhaImpressodepparentesco6.AsString      := Qry.FieldByName('depparentesco6').AsString;
          dm.TabCarteirinhaImpressodepcpf6.AsString             := Qry.FieldByName('depcpf5').AsString;

          Qry.Next;
        end;
        dm.TabCarteirinhaImpresso.Post;

      end;
      Qry.Close;
    finally
      dm.TabCarteirinhaImpresso.EnableControls;
    end;
  Finally
    FreeAndNIl(Qry);
  End;
end;

{$ENDREGION}

{$REGION 'Dependente'}

function TModelCarteirinha.CarregarDependente(TabStatus, IDS: integer): Boolean;
var
  Qry: TUniQuery;
  sqlQuery, sqlStatus, sqlOrdem: string;
begin
  Result  := False;

  sqlQuery  := ' Select                '+
               ' c.id_carteira,       '+
               ' case                 '+
               ' when c.digital= ''S'' then ''SIM'' else ''NÃO'' end as digital, '+
               ' c.id_dependente,     '+
               ' d.codigo,            '+
               ' d.nome,              '+
               ' d.cpf,               '+
               ' d.parentesco,        '+
               ' case                 '+
               ' when c.api= ''S'' then ''SIM'' else ''NÃO'' end as api '+
               ' from carteira c      '+
               ' inner join sindicato_dependente d     '+
               ' on c.id_dependente = d.id_dependente  '+
               ' where c.id_socio= :id                 '+
               ' ';

  case TabStatus of
    0: sqlStatus  := ' and c.ativo=''S''';
    1: sqlStatus  := ' and c.ativo=''N''';
  end;

  sqlOrdem  := ' order by d.codigo, d.nome';

  Qry             := TUniquery.Create(nil);

  Try
    Try
      if not dm.Conn.Connected then
        dm.Conn.Connected := True;

      Qry.Connection          := dm.Conn;
      Qry.SQL.Clear;

      Qry.SQL.Text            := sqlQuery + SqlStatus + Sqlordem;
      Qry.Params.ParamByName('id').AsInteger    := ids;
      Qry.Open;

      Qry.First;
      dm.TabConsCarteiraDependente.EmptyDataSet;
      dm.TabConsCarteiraDependente.Open;

      if not Qry.Eof then
      begin
        while not Qry.Eof do
        begin
          dm.TabConsCarteiraDependente.Append;
          dm.TabConsCarteiraDependenteid_carteira.AsInteger     :=  Qry.FieldByName('id_carteira').AsInteger;
          dm.TabConsCarteiraDependentedigital.AsString          :=  Qry.FieldByName('digital').AsString;
          dm.TabConsCarteiraDependentecodigo.AsInteger          :=  Qry.FieldByName('codigo').AsInteger;
          dm.TabConsCarteiraDependentenome.AsString             :=  Qry.FieldByName('nome').AsString;
          dm.TabConsCarteiraDependentecpf.AsString              :=  Qry.FieldByName('cpf').AsString;
          dm.TabConsCarteiraDependenteid_dependente.AsInteger   :=  Qry.FieldByName('id_dependente').AsInteger;
          dm.TabConsCarteiraDependenteparentesco.AsString       :=  Qry.FieldByName('parentesco').AsString;
          dm.TabConsCarteiraDependenteapi.AsString              :=  Qry.FieldByName('api').AsString;
          Qry.Next;
        end;
        dm.TabConsCarteiraDependente.Post;
      end;
      Qry.Close;
    Except on e:exception do
      raise Exception.Create('Error carregar dependente'+e.Message);
    End;

  Finally
    FreeAndNil(Qry);
  End;

end;

function TModelCarteirinha.LocalizarIDDependente(i: integer): Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result    := False;
  sqlQuery  := 'Select * from carteira where id_carteira= :idcat';

  Qry       := TUniquery.Create(nil);

  Try
    Try
      if not dm.Conn.Connected then
        dm.Conn.Connected := True;

      Qry.Connection          := dm.Conn;
      Qry.SQL.Clear;

      Qry.SQL.Text            := sqlQuery;
      Qry.Params.ParamByName('idcat').AsInteger    := i;
      Qry.Open;

      if not Qry.IsEmpty then
        begin
          idcarteira    := Qry.FieldByName('id_carteira').AsInteger;
          iddependente  := Qry.FieldByName('id_dependente').AsInteger;
          validade      := Qry.FieldByName('validade').AsDateTime;
          Ativo         := Qry.FieldByName('ativo').AsString;
          digital       := Qry.FieldByName('digital').AsString;
          senha         := Tconesul.Crypt('D',Qry.FieldByName('senha').AsString);
          Result        := True;
        end;
      Qry.Close;
    Except on E:exception do
      raise Exception.Create(e.Message);
    End;
  Finally
    FreeAndNil(Qry);
  End;

end;

Function TModelCarteirinha.ExibirFotoDependente(i:integer):String;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result    := '';
  sqlQuery  := 'Select foto from sindicato_dependente where id_dependente= :id';

  Qry       := TUniquery.Create(nil);

  Try
    Try
      if not dm.Conn.Connected then
        dm.Conn.Connected := True;

      Qry.Connection          := dm.Conn;
      Qry.SQL.Clear;

      Qry.SQL.Text            := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger    := i;
      Qry.Open;

      if not Qry.Eof then
      Result  := Qry.FieldByName('foto').AsString
      else
      Result  := '';
      Qry.Close;
    except on e:exception do
      raise Exception.Create('Error ao carregar foto'+e.Message);
    End;

  Finally
    FreeAndNil(qry);
  End;

end;

function TModelCarteirinha.ExcluirDependente(id:integer): Boolean;
var
  Qry :Tuniquery;
  sqlQuery: string;
  procedure LogErro(const Mensagem: String);
  var
    LogFile: TextFile;
    LogPath: String;
  begin
    LogPath := ExtractFilePath(ParamStr(0)) + 'Log_banco.txt';
    AssignFile(LogFile, LogPath);
    try
      if FileExists(LogPath) then
        Append(LogFile)
      else
        Rewrite(LogFile);
      Writeln(LogFile, FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) + ' - ' + Mensagem);
    finally
      CloseFile(LogFile);
    end;
  end;
begin
  Result        := false;
  sqlQuery      := 'Delete from carteira where id_carteira= :id';

  Qry           := TUniquery.Create(nil);

  Try
    Try
      if not dm.Conn.Connected then
        dm.Conn.Connected := True;

      Qry.Connection          := dm.Conn;
      Qry.SQL.Clear;

      Qry.SQL.Text            := sqlQuery;

      Qry.Params.ParamByName('id').AsInteger      := id;

      IniciarTransacao;

      Try

        Qry.ExecSQL;
        ConfirmarTransacao;
        result  := true;
      Except on e:exception do
        begin
          DesfazerTransacao;
          LogErro('Erro ao excluir carteira: ' + E.Message);
          exit;
        end;
      end;

    except on e:exception do
      begin
        DesfazerTransacao;
        raise Exception.Create('Error ao excluir carteira'+e.Message);
      end;
    End;
  Finally
    freeAndNil(Qry);
  End;

end;

Function TModelCarteirinha.ValidarExitsDependente(out msg:string;id:integer):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result    := False;  //desativar 18/08
  sqlQuery  := 'Select id_dependente from carteira where id_dependente= :id and ativo=''S'' ';

  Qry  := TUniQuery.Create(nil);

  Try
    Try
      //Qry     := modelSql.ConsultarSQL(sqlQuery, [id]);
      if not dm.Conn.Connected then
        dm.Conn.Connected := True;

      Qry.Connection    := dm.Conn;
      Qry.SQL.Clear;
      Qry.SQL.Text      := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger   := id;

      Qry.Open;

      if not Qry.IsEmpty then
        begin
          msg := 'Dependente já contas uma carteirinha ativa!';
          Result        := True;
        end
        else
          msg := '';
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

{$ENDREGION}

{$REGION 'Transacao'}

procedure TModelCarteirinha.IniciarTransacao;
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

procedure TModelCarteirinha.ConfirmarTransacao;
begin
  try
    if Assigned(FTransacao) and FTransacao.Active then
      FTransacao.Commit;
  except
    on E: Exception do
      raise Exception.Create('Erro ao confirmar transação: ' + E.Message);
  end;
end;

constructor TModelCarteirinha.Create;
procedure LogErro(const Mensagem: String);
  var
    LogFile: TextFile;
    LogPath: String;
  begin
    LogPath := ExtractFilePath(ParamStr(0)) + 'Log_banco.txt';
    AssignFile(LogFile, LogPath);
    try
      if FileExists(LogPath) then
        Append(LogFile)
      else
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

procedure TModelCarteirinha.DesfazerTransacao;
begin
try
    if Assigned(FTransacao) and FTransacao.Active then
      FTransacao.Rollback;
  except
    on E: Exception do
      raise Exception.Create('Erro ao desfazer transação: ' + E.Message);
  end;
end;

destructor TModelCarteirinha.Destroy;
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


{$ENDREGION}


end.
