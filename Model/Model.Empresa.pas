unit Model.Empresa;

interface

Uses
  Uni,System.SysUtils, System.Classes, data.DB, datasnap.dbclient,
  ACBRUTIL, Model.Atualizacao;

Type
  TModelEmpresa = Class

  Private
    FTransacao: TUniTransaction;

    Fidempresa: Integer;
    Frazao: String;
    Ffantasia: String;
    Fcep: String;
    Fendereco: String;
    Fnumero: String;
    Fcomplemento: String;
    Fbairro: String;
    Fidcidade: Integer;
    Fcnpj: String;
    Fie: String;
    Fim: String;
    Fresponsavel: String;
    Ftelefone: String;
    Fcelular: String;
    Fwhatsapp: String;
    Fsite: String;
    Femail1: String;
    Femail2: String;
    Ftipoatividade: integer;
    Fcnae: String;
    Fregime: integer;
    Ftelefone2: String;
    Fcelular2: String;
    Flogo: string;
    Fcidade: string;
    Fguid: string;



  public
    constructor Create;
    destructor Destroy; override;

    property idempresa     :Integer  read Fidempresa     write Fidempresa;
    property razao         :String   read Frazao         write Frazao;
    property fantasia      :String   read Ffantasia      write Ffantasia;
    property cep           :String   read Fcep           write Fcep;
    property endereco      :String   read Fendereco      write Fendereco;
    property numero        :String   read Fnumero        write Fnumero;
    property complemento   :String   read Fcomplemento   write Fcomplemento;
    property bairro        :String   read Fbairro        write Fbairro;
    property idcidade      :integer  read Fidcidade      write Fidcidade;
    property cnpj          :String   read Fcnpj          write Fcnpj;
    property ie            :String   read Fie            write Fie;
    property im            :String   read Fim            write Fim;
    property responsavel   :String   read Fresponsavel   write Fresponsavel;
    property telefone      :String   read Ftelefone      write Ftelefone;
    property telefone2     :String   read Ftelefone2     write Ftelefone2;
    property celular       :String   read Fcelular       write Fcelular;
    property celular2      :String   read Fcelular2      write Fcelular2;
    property whatsapp      :String   read Fwhatsapp      write Fwhatsapp;
    property site          :String   read Fsite          write Fsite;
    property email1        :String   read Femail1        write Femail1;
    property email2        :String   read Femail2        write Femail2;
    property tipoatividade :integer  read Ftipoatividade write Ftipoatividade;
    property cnae          :String   read Fcnae          write Fcnae;
    property regime        :integer  read Fregime        write Fregime;
    property logo          :string   read Flogo          write Flogo;
    property cidade        :string   read Fcidade        write Fcidade;
    property guid          :string   read Fguid          write Fguid;

    Function Insert(out msg:String; out id:integer):Boolean;
    Function Update(out msg:string):Boolean;
    Function Delete(out msg:string):Boolean;
    Function Select(out msg:string):Boolean;
    Function GerarId(tab, campo:string):integer;
    Function Registrada(out msg:string):Boolean;
    function RegistroTemp(out msg: string): boolean;
    function Pesquisa(out msg: string; filtro:String): Boolean;
    function SelectCabecalhoReport(out msg: string): Boolean;
    Function SelectDadosNFe(out cnpj:String; out IdUF:integer):Boolean;

    //App
    Function GuidUpdate(out msg:string):Boolean;

  End;
implementation

uses UConeSul, Vcl.Session, Udm;

destructor TModelEmpresa.Destroy;
begin
  if Assigned(FTransacao) then
    FreeAndNil(FTransacao);

  inherited Destroy;
end;

Function TModelEmpresa.GerarId(tab, campo:string):integer;
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

function TModelEmpresa.GuidUpdate(out msg: string): Boolean;
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
      sqlQuery := 'UPDATE empresa SET ' +
                  ' guid = :guid' +
                  ' WHERE id_empresa = :idempresa';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      // Definindo parâmetros
      Qry.ParamByName('idempresa').AsInteger           := idempresa;
      Qry.ParamByName('guid').AsString                 := Trim(guid);


      Qry.ExecSQL;

      msg := 'Registro atualizado com sucesso';
      Result := True;
    except
      on E: Exception do
      begin
        msg := 'Erro ao atualizar: ' + E.Message;
        raise;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

Function TModelEmpresa.Insert(out msg:String; out id:integer):Boolean;
var
Qry       : TUniquery;
sqlQuery  : string;
idEmp     : Integer;
VersaoEXE : string;
begin
  Result  := False;
  Qry     := TUniquery.create(nil);
  Try
    Try
      FTransacao.StartTransaction;
      Qry.Connection := dm.Conn;
      sqlQuery := 'Insert Into empresa (id_empresa, razao, fantasia, cep,endereco,'+
                  ' numero, complemento, bairro, id_cidade, cnpj, ie, im, responsavel,'+
                  ' telefone, celular, whatsapp, site, email1, email2, datacadastro, cnae, fone2, celular2, logo)'+
                  ' Values'+
                  '(:idempresa, :razao, :fantasia, :cep, :endereco, :numero, :complemento, ' +
                  ':bairro, :idcidade, :cnpj, :ie, :im, :responsavel, :telefone, :celular, ' +
                  ':whatsapp, :site, :email1, :email2, :datacadastro, :cnae, :fone2, :celular2, :logo)';

      With Qry do
      begin
        Close;
        Sql.clear;
        Qry.SQL.Text := sqlQuery;

        idEmp                                         := GerarId('empresa', 'id_empresa');
        Qry.ParamByName('idempresa').AsInteger        := idemp;
        Qry.ParamByName('razao').AsString             := Trim(razao);
        Qry.ParamByName('fantasia').AsString          := Trim(fantasia);
        Qry.ParamByName('cep').AsString               := cep;
        Qry.ParamByName('endereco').AsString          := endereco;
        Qry.ParamByName('numero').AsString            := numero;
        Qry.ParamByName('complemento').AsString       := complemento;
        Qry.ParamByName('bairro').AsString            := bairro;
        Qry.ParamByName('idcidade').AsInteger         := idcidade;
        Qry.ParamByName('cnpj').AsString              := cnpj;
        Qry.ParamByName('ie').AsString                := ie;
        Qry.ParamByName('im').AsString                := im;
        Qry.ParamByName('responsavel').AsString       := responsavel;
        Qry.ParamByName('telefone').AsString          := telefone;
        Qry.ParamByName('celular').AsString           := celular;
        Qry.ParamByName('whatsapp').AsString          := whatsapp;
        Qry.ParamByName('site').AsString              := site;
        Qry.ParamByName('email1').AsString            := email1;
        Qry.ParamByName('email2').AsString            := email2;
        Qry.ParamByName('datacadastro').AsDate        := now;
        Qry.ParamByName('cnae').AsString              := cnae;
        Qry.ParamByName('fone2').AsString             := telefone2;
        Qry.ParamByName('celular2').AsString          := celular2;
        Qry.ParamByName('logo').AsString              := logo;

        ExecSql;
        msg     := 'Registro realizado com sucesso!';
        id      := idEmp;
        //atualizar com a versao
        VersaoEXE   := TConesul.GetAppVersion;
        VersaoExe   := Copy(VersaoEXE,8, 14);
        //TModelAtualizacao.GravarVersao(VersaoExe);

        Result  := True;
        FTransacao.Commit;
        Close;
      end;

    Except on e:exception do
      begin
        FTransacao.Rollback;
        msg := 'Erro ao inserir:' +e.message;
        raise;
      end;
    End;

  Finally
    Qry.free;
  End;
end;

Function TModelEmpresa.Update(out msg:string):Boolean;
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
      sqlQuery := 'UPDATE empresa SET ' +
                  ' razao = :razao, ' +
                  ' fantasia = :fantasia, ' +
                  ' cep = :cep, ' +
                  ' endereco = :endereco, ' +
                  ' numero = :numero, ' +
                  ' complemento = :complemento, ' +
                  ' bairro = :bairro, ' +
                  ' id_cidade = :idcidade, ' +
                  ' cnpj = :cnpj, ' +
                  ' ie = :ie, ' +
                  ' im = :im, ' +
                  ' responsavel = :responsavel, ' +
                  ' telefone = :telefone, ' +
                  ' celular = :celular, ' +
                  ' whatsapp = :whatsapp, ' +
                  ' site = :site, ' +
                  ' email1 = :email1, ' +
                  ' email2 = :email2, ' +
                  ' cnae= :cnae,'+
                  ' fone2= :fone2,'+
                  ' celular2= :celular2,'+
                  ' logo= :logo'+
                  ' WHERE id_empresa = :idempresa';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      // Definindo parâmetros
      Qry.ParamByName('idempresa').AsInteger            := idempresa;
      Qry.ParamByName('razao').AsString                 := Trim(razao);
      Qry.ParamByName('fantasia').AsString              := Trim(fantasia);
      Qry.ParamByName('cep').AsString                   := cep;
      Qry.ParamByName('endereco').AsString              := endereco;
      Qry.ParamByName('numero').AsString                := numero;
      Qry.ParamByName('complemento').AsString           := complemento;
      Qry.ParamByName('bairro').AsString                := bairro;
      Qry.ParamByName('idcidade').AsInteger             := idcidade;
      Qry.ParamByName('cnpj').AsString                  := cnpj;
      Qry.ParamByName('ie').AsString                    := ie;
      Qry.ParamByName('im').AsString                    := im;
      Qry.ParamByName('responsavel').AsString           := responsavel;
      Qry.ParamByName('telefone').AsString              := telefone;
      Qry.ParamByName('celular').AsString               := celular;
      Qry.ParamByName('whatsapp').AsString              := whatsapp;
      Qry.ParamByName('site').AsString                  := site;
      Qry.ParamByName('email1').AsString                := email1;
      Qry.ParamByName('email2').AsString                := email2;
      Qry.ParamByName('cnae').AsString                  := cnae;
      Qry.ParamByName('fone2').AsString                 := telefone2;
      Qry.ParamByName('celular2').AsString              := celular2;
      Qry.ParamByName('logo').AsString                  := logo;

      Qry.ExecSQL;

      msg := 'Registro atualizado com sucesso';
      Result := True;
    except
      on E: Exception do
      begin
        msg := 'Erro ao atualizar: ' + E.Message;
        raise;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

constructor TModelEmpresa.Create;
begin
inherited Create;

  FTransacao                    := TUniTransaction.Create(nil);
  FTransacao.DefaultConnection  := dm.Conn;

end;

Function TModelEmpresa.Delete(out msg:string):Boolean;
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
      sqlQuery := 'DELETE FROM empresa WHERE id_empresa = :idempresa';
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      // Definindo parâmetro
      Qry.ParamByName('idempresa').AsInteger    := idempresa;
      Qry.ExecSQL;
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
        msg := 'Erro ao deletar: ' + E.Message;
        raise;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

Function TModelEmpresa.Select(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.Conn;
      sqlQuery := 'SELECT * FROM EMPRESA limit 1';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;

      Qry.Open;
      if not Qry.IsEmpty then
      begin

        idempresa     := Qry.Fieldbyname('id_empresa').AsInteger;
        razao         := Qry.Fieldbyname('razao').AsString;;
        fantasia      := Qry.Fieldbyname('fantasia').AsString;
        cep           := Qry.Fieldbyname('cep').AsString;
        endereco      := Qry.Fieldbyname('endereco').AsString;
        numero        := Qry.Fieldbyname('numero').AsString;
        complemento   := Qry.Fieldbyname('complemento').AsString;
        bairro        := Qry.Fieldbyname('bairro').AsString;
        idcidade      := Qry.Fieldbyname('id_cidade').AsInteger;
        cnpj          := Qry.Fieldbyname('cnpj').AsString;
        ie            := Qry.Fieldbyname('ie').AsString;
        im            := Qry.Fieldbyname('im').AsString;
        responsavel   := Qry.Fieldbyname('responsavel').AsString;
        telefone      := Qry.Fieldbyname('telefone').AsString;
        celular       := Qry.Fieldbyname('celular').AsString;
        whatsapp      := Qry.Fieldbyname('whatsapp').AsString;
        site          := Qry.Fieldbyname('site').AsString;
        email1        := Qry.Fieldbyname('email1').AsString;
        email2        := Qry.Fieldbyname('email2').AsString;
        cnae          := Qry.Fieldbyname('cnae').AsString;
        telefone2     := Qry.Fieldbyname('fone2').AsString;
        celular2      := Qry.Fieldbyname('celular2').AsString;
        logo          := Qry.Fieldbyname('logo').AsString;
        guid          := Qry.FieldByName('guid').AsString;

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

Function TModelEmpresa.Registrada(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.Conn;
      sqlQuery := 'SELECT ID_EMPRESA, razao, tipo_atividade FROM EMPRESA limit 1';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;

      Qry.Open;

      if not Qry.IsEmpty then
      begin
        TSession.idempresa      := Qry.fieldbyname('id_empresa').AsInteger;
        TSession.RAZAO          := Qry.FieldByName('razao').AsString;
        TSession.tipoatividade  := Qry.FieldByName('tipo_atividade').AsInteger;

        msg := 'OK';
        Result := True;
      end
      else
        msg := 'Nenhum registro encontrado!';
      Qry.close;
    except
      on E: Exception do
      begin
        msg := 'Erro ao válidar empresa: ' + E.Message;
        raise;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

Function TModelEmpresa.RegistroTemp(out msg:string):boolean;
var
Qry       : TUniquery;
sqlQuery  : string;
dt:tdatetime;
begin
  Result  := False;
  Qry     := TUniquery.create(nil);
  Try
    Try
      FTransacao.StartTransaction;
      Qry.Connection := dm.Conn;
      sqlQuery := 'Insert Into temp (id_temp, id_empresa, nome, data_cadastro, data_expiracao)'+
                  ' Values'+
                  '(:idtemp, :idempresa, :nome, :dt, :dtexp)';

      With Qry do
      begin
        Close;
        Sql.clear;
        Qry.SQL.Text := sqlQuery;

        Qry.ParamByName('idtemp').AsInteger           := GerarId('temp', 'id_temp');
        Qry.ParamByName('idempresa').AsInteger        := idempresa;
        Qry.ParamByName('nome').AsString              := Trim(razao);
        Qry.ParamByName('dt').AsString                := TConeSul.Crypt('C',datetostr(Now));
        dt  := now+7;
        Qry.ParamByName('dtexp').AsString             := TConeSul.Crypt('C',datetostr(dt));

        ExecSql;
        msg     := 'Registro realizado com sucesso!';
        Result  := True;
        FTransacao.Commit;
        Close;
      end;

    Except on e:exception do
      begin
        FTransacao.Rollback;
        msg := 'Erro ao inserir:' +e.message;
        raise;
      end;
    End;

  Finally
    Qry.free;
  End;
end;

Function TModelEmpresa.Pesquisa(out msg: string; filtro:String): Boolean;
var
  Qry     :TUniquery;
  sqlQuery,SqlFiltro: string;
begin
  Result                := False;

  Qry                   := TUniQuery.Create(nil);
  try
    try
      Qry.Connection    := dm.Conn;

      sqlQuery          := 'Select id_empresa, razao, fantasia, cnpj, ie, '+
                          ' telefone, celular, email1, guid from empresa'+
                            ' where id_empresa >0';

      if Filtro <> '' then
      begin
        SqlFiltro := ' and (id_empresa like :filtro or '+
                           ' razao like :filtro or'+
                           ' fantasia like :filtro or'+
                           ' cnpj like :filtro'+
                          ')';

      SqlQuery  := sqlQuery + SqlFiltro;


      end
      else

      sqlQuery  := sqlQuery;


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

        if dm.TabConsEmpresa.Active then
        begin
          dm.TabConsEmpresa.Close; // Feche o dataset se estiver ativo
        end;

        dm.TabConsEmpresa.disablecontrols;

        if dm.TabConsEmpresa.eof then
        begin
          dm.TabConsEmpresa.fieldDefs.clear;

          dm.TabConsEmpresa.FieldDefs.Add('id_empresa',   ftInteger);
          dm.TabConsEmpresa.FieldDefs.Add('razao',        ftString,120);
          dm.TabConsEmpresa.FieldDefs.Add('fantasia',     ftString,100);
          dm.TabConsEmpresa.FieldDefs.Add('cnpj',         ftstring,20);
          dm.TabConsEmpresa.FieldDefs.Add('ie',           ftstring,20);
          dm.TabConsEmpresa.FieldDefs.Add('telefone',     ftstring,20);
          dm.TabConsEmpresa.FieldDefs.Add('celular',      ftstring,20);
          dm.TabConsEmpresa.FieldDefs.Add('email1',       ftstring,150);
          dm.TabConsEmpresa.FieldDefs.Add('guid',         ftstring,250);
          dm.TabConsEmpresa.createdataset;
        end
        else
        begin
          dm.TabConsEmpresa.EmptyDataSet;
        end;

        while not Qry.Eof do
        begin
          dm.TabConsEmpresa.Append;

          dm.TabConsEmpresa.FieldByName('id_empresa').Value       :=  Qry.FieldByName('id_empresa').Value;
          dm.TabConsEmpresa.FieldByName('razao').Value       :=  Qry.FieldByName('razao').Value;
          dm.TabConsEmpresa.FieldByName('fantasia').Value       :=  Qry.FieldByName('fantasia').Value;
          dm.TabConsEmpresa.FieldByName('cnpj').Value       :=  Qry.FieldByName('cnpj').Value;
          dm.TabConsEmpresa.FieldByName('ie').Value       :=  Qry.FieldByName('ie').Value;
          dm.TabConsEmpresa.FieldByName('telefone').Value       :=  Qry.FieldByName('telefone').Value;
          dm.TabConsEmpresa.FieldByName('celular').Value       :=  Qry.FieldByName('celular').Value;
          dm.TabConsEmpresa.FieldByName('email1').Value       :=  Qry.FieldByName('email1').Value;
          dm.TabConsEmpresa.FieldByName('guid').Value       :=  Qry.FieldByName('guid').Value;
          dm.TabConsEmpresa.Post;
          Qry.Next;
        end;
        dm.TabConsEmpresa.EnableControls;
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

Function TModelEmpresa.SelectCabecalhoReport(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.Conn;
      sqlQuery := 'Select                  '+
                  ' e.razao,               '+
                  ' e.fantasia,            '+
                  ' e.cep,                 '+
                  '  e.endereco,           '+
                  '  e.numero,             '+
                  '  e.bairro,             '+
                  '  e.cnpj,               '+
                  '  e.ie,                 '+
                  '  e.telefone,           '+
                  '  e.celular,            '+
                  '  e.whatsapp,           '+
                  '  e.email1,             '+
                  '  e.fone2,              '+
                  '  e.celular2,           '+
                  '  e.logo,               '+
                  '  c.CIDADE              '+
                  ' from empresa e         '+
                  ' inner join cidade c    '+
                  ' on e.id_cidade = c.ID_CIDADE'+
                  ' where id_empresa= :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;

      Qry.Params.ParamByName('id').AsInteger    := idempresa;

      Qry.Open;
      if not Qry.IsEmpty then
      begin

        razao         := Qry.Fieldbyname('razao').AsString;;
        fantasia      := Qry.Fieldbyname('fantasia').AsString;
        cep           := Qry.Fieldbyname('cep').AsString;
        endereco      := Qry.Fieldbyname('endereco').AsString;
        numero        := Qry.Fieldbyname('numero').AsString;
        bairro        := Qry.Fieldbyname('bairro').AsString;
        cidade        := Qry.Fieldbyname('cidade').AsString;
        cnpj          := Qry.Fieldbyname('cnpj').AsString;
        ie            := Qry.Fieldbyname('ie').AsString;
        telefone      := Qry.Fieldbyname('telefone').AsString;
        celular       := Qry.Fieldbyname('celular').AsString;
        whatsapp      := Qry.Fieldbyname('whatsapp').AsString;
        email1        := Qry.Fieldbyname('email1').AsString;
        telefone2     := Qry.Fieldbyname('fone2').AsString;
        celular2      := Qry.Fieldbyname('celular2').AsString;
        logo          := Qry.Fieldbyname('logo').AsString;

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

Function TModelEmpresa.SelectDadosNFe(out cnpj:String; out IdUF:integer):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.Conn;
      sqlQuery := 'Select e.cnpj, c.uf_ibge from empresa e '+
                    ' inner join cidade c'+
                    ' on e.id_cidade= c.id_cidade'+
                    ' where id_empresa= :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger      := TSession.IDEMPRESA;

      Qry.Open;
      if not Qry.IsEmpty then
      begin

        CNPJ     := TiraPontos(Qry.Fieldbyname('cnpj').AsString);
        IDUF     := Qry.Fieldbyname('uf_ibge').asinteger;

        Result := True;
      end
      else
      Qry.Close;
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro: Model.Empresa linha 752'+#13+e.Message);
      end;
    end;
  finally
    Qry.Free;
  end;
end;

end.
