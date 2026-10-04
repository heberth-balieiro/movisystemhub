unit Model.PrazoPag;

interface

uses
  System.SysUtils, System.Classes, uAtributosRTTI;

type
  [TableName('prazopagamento')]
  TModelPrazoPag = class
  private
    Fdata_alteracao: TDate;
    Fpedido: string;
    Fativo: string;
    Fdescricao: string;
    Fdata_cadastro: TDate;
    Fcodigo: Integer;
    Fsistema: string;
    Fdata_excluido: TDate;
    Fid_empresa: Integer;
    Fid_prazo: Integer;
    Fid_usuario_exc: Integer;
    Ftipo: string;
    Fexcluido: Integer;
    Fexibirapp: string;
    Fid_usuario_alt: Integer;
    Fid_usuario: Integer;

  public
    [FieldName('id_prazo', True)]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property id_prazo: Integer read Fid_prazo write Fid_prazo;

    [FieldName('codigo')]
    [FieldOptions([foInsert,foSelect])]
    property Codigo: Integer read Fcodigo write Fcodigo;

    [FieldName('id_empresa')]
    [FieldOptions([foInsert,foSelect])]
    property id_empressa: Integer read Fid_empresa write Fid_empresa;

    [FieldName('tipo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property tipo: string read Ftipo write Ftipo;

    [FieldName('descricao')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property descricao: string read Fdescricao write Fdescricao;

    [FieldName('ativo')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property ativo: string read Fativo write Fativo;

    [FieldName('data_cadastro')]
    [FieldOptions([foInsert])]
    property data_cadastro: TDate read Fdata_cadastro write Fdata_cadastro;

    [FieldName('id_usuario')]
    [FieldOptions([foInsert,foSelect])]
    property id_usuario: Integer read Fid_usuario write Fid_usuario;

    [FieldName('pedido')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property pedido: string read Fpedido write Fpedido;

    [FieldName('sistema')]
    [FieldOptions([foInsert, foSelect])]
    property sistema: string read Fsistema write Fsistema;

    [FieldName('exibirapp')]
    [FieldOptions([foInsert, foUpdate, foSelect])]
    property exibirapp: string read Fexibirapp write Fexibirapp;

    [FieldName('excluido')]
    [FieldOptions([foUpdate, foSelect])]
    property excluido: Integer read Fexcluido write Fexcluido;

    [FieldName('data_excluido')]
    [FieldOptions([foUpdate])]
    property data_excluido: TDate read Fdata_excluido write Fdata_excluido;

    [FieldName('id_usuario_exc')]
    [FieldOptions([foUpdate])]
    property id_usuario_exc: Integer read Fid_usuario_exc write Fid_usuario_exc;

    [FieldName('data_alteracao')]
    [FieldOptions([foUpdate])]
    property data_alteracao: TDate read Fdata_alteracao write Fdata_alteracao;

    [FieldName('id_usuario_alt')]
    [FieldOptions([foUpdate])]
    property id_usuario_alt: Integer read Fid_usuario_alt write Fid_usuario_alt;


  end;

implementation








{
interface

Uses
  Uni,System.SysUtils,
  System.Classes,
  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TModelPrazo = Class

  Private
    FTransacao  : TUniTransaction;
    Fidempresa: integer;
    Fpedido: string;
    Fativo: string;
    Fidusuario: integer;
    Fdescricao: string;
    Fcodigo: integer;
    FTipo: string;
    FidPrazo: integer;
    Fsistema: string;
    Fapp: string;


  public
    constructor Create;
    destructor Destroy; override;

    property idPrazo        :integer  read FidPrazo       write FidPrazo;
    property codigo         :integer  read Fcodigo        write Fcodigo;
    property idempresa      :integer  read Fidempresa     write Fidempresa;
    property tipo           :string   read FTipo          write Ftipo;
    property descricao      :string   read Fdescricao     write Fdescricao;
    property ativo          :string   read Fativo         write Fativo;
    property idusuario      :integer  read Fidusuario     write Fidusuario;
    property pedido         :string   read Fpedido        write Fpedido;
    property sistema        :string   read Fsistema       write Fsistema;
    property app            :string   read Fapp           write Fapp;

    Function Insert(out msg:String):Boolean;
    Function Update(out msg:string):Boolean;
    Function Delete(out msg:string):Boolean;
    Function Select(out msg:string):Boolean;
    Function GerarId(tab, campo:string):integer;
    Function Pesquisa(out msg:string;Filtro:string;TabInativo:Integer):Boolean;
    
    Procedure FormapagamentoSistema;
  End;

implementation

uses
  System.Math;

destructor TModelPrazo.Destroy;
begin
  if Assigned(FTransacao) then
    FreeAndNil(FTransacao);

  inherited Destroy;
end;

procedure TModelPrazo.FormapagamentoSistema;
var
msg:string;
PrazoArray  : Array[0..6] of string;
I:integer;
begin
  //Realizar essa acao quando for criado a conta no sistema

  PrazoArray[0]  := 'PIX';
  PrazoArray[1]  := 'DINHEIRO';
  PrazoArray[2]  := 'CARTÃO CRÉDITO';
  PrazoArray[3]  := 'CARTÃO DÉBITO';
  PrazoArray[4]  := 'BOLETO';
  PrazoArray[5]  := 'DEPOSITO';
  PrazoArray[6]  := 'CHEQUE';

  for I := 0 to 6 do
  begin
    idempresa := 1;
    tipo      := 'C';
    descricao := PrazoArray[i];
    ativo     := 'S';
    idusuario := 1;
    pedido    := 'S';
    sistema   := 'S';
    Insert(msg);
  end;

end;

constructor TModelPrazo.Create;
begin
inherited Create;

  FTransacao                    := TUniTransaction.Create(nil);
  FTransacao.DefaultConnection  := dm.Conn;

end;

Function TModelPrazo.GerarId(tab, campo:string):integer;
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

Function TModelPrazo.Insert(out msg:String):Boolean;
var
Qry       : TUniquery;
sqlQuery  : string;
idGerado  : Integer;
begin
  Result  := False;
  Qry     := TUniquery.create(nil);
  Try
    Try
      FTransacao.StartTransaction;
      Qry.Connection := dm.Conn;
      sqlQuery := 'Insert Into prazopagamento ('+
                        'id_prazo,'+
                        'codigo,'+
                        'id_empresa,'+
                        'tipo,'+
                        'descricao,'+
                        'ativo,'+
                        'data_cadastro,'+
                        'id_usuario,'+
                        'pedido,'+
                        'sistema,'+
                        'exibirapp'+

                        ')'+
                        ' Values'+
                        '( '+
                        ':idprazo,'+
                        ':codigo,'+
                        ':idempresa,'+
                        ':tipo,'+
                        ':descricao,'+
                        ':ativo,'+
                        ':datacad,'+
                        ':idusuario,'+
                        ':pedido,'+
                        ':sistema,'+
                        ':app'+
                        ')';
      With Qry do
      begin
        Close;
        Sql.clear;
        Qry.SQL.Text := sqlQuery;

        idGerado                        := GerarId('prazopagamento', 'id_prazo');

        Qry.ParamByName('idprazo').AsInteger      := idgerado;
        Qry.ParamByName('codigo').Asinteger       := GerarId('prazopagamento', 'codigo');
        Qry.ParamByName('idempresa').AsInteger    := idempresa;
        Qry.ParamByName('tipo').AsString          := Trim(tipo);
        Qry.ParamByName('descricao').AsString     := trim(descricao);
        Qry.ParamByName('ativo').Asstring         := ativo;
        Qry.ParamByName('datacad').AsDateTime     := Now;
        Qry.ParamByName('idusuario').AsInteger    := idusuario;
        Qry.ParamByName('pedido').AsString        := pedido;
        Qry.ParamByName('sistema').AsString        := sistema;
        Qry.ParamByName('app').AsString           := app;

        execsql;

        msg     := 'Registro realizado com sucesso';
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

Function TModelPrazo.Update(out msg:string):Boolean;
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
      sqlQuery := 'Update prazopagamento set '+
                            ' tipo=            :tipo,'+
                            ' descricao=       :desc,'+
                            ' ativo=           :ativo,'+
                            ' pedido=          :pedido,'+
                            ' exibirapp=       :app'+
                            ' where id_prazo= :idprazo';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      // Definindo parâmetros
      Qry.ParamByName('idprazo').AsInteger      := idprazo;
      Qry.ParamByName('tipo').AsString          := Trim(tipo);
      Qry.ParamByName('desc').AsString     := trim(descricao);
      Qry.ParamByName('ativo').Asstring         := ativo;
      Qry.ParamByName('pedido').AsString        := pedido;
      Qry.ParamByName('app').AsString           := app;

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

Function TModelPrazo.Delete(out msg:string):Boolean;
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
      sqlQuery := 'Delete from prazopagamento where id_prazo= :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      // Definindo parâmetro
      Qry.ParamByName('id').AsInteger    := idPrazo;

      //if DeleteCandidato(msg) then
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

Function TModelPrazo.Select(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection := dm.Conn;
      sqlQuery := 'Select * from prazopagamento where id_prazo= :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger  := idprazo;

      Qry.Open;
      if not Qry.IsEmpty then
      begin

        IdPrazo     := Qry.Fieldbyname('id_prazo').AsInteger;
        codigo      := Qry.Fieldbyname('codigo').AsInteger;
        tipo        := Qry.Fieldbyname('tipo').AsString;
        descricao   := Qry.Fieldbyname('descricao').AsString;
        ativo       := Qry.Fieldbyname('ativo').AsString;
        pedido      := Qry.Fieldbyname('pedido').AsString;
        app         := Qry.FieldByName('exibirapp').AsString;

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

Function TModelPrazo.Pesquisa(out msg:string;Filtro:string;TabInativo:integer):Boolean;
var
  Qry     :TUniquery;
  sqlQuery, FiltroQuery,FiltroInativo: string;
begin
  Result                := False;
  Qry                   := TUniQuery.Create(nil);
  try
    try
      Qry.Connection    := dm.Conn;

      sqlQuery          := 'Select                                   '+
                            ' p.id_prazo,                            '+
                            '  p.codigo,                             '+
                            '  case                                  '+
                            '  when p.tipo = ''C'' then ''CRÉDITO''      '+
                            '  else                                  '+
                            '  ''DÉBITO''                              '+
                            '  end as tipo,                          '+
                            '  p.descricao,                          '+
                            '  case                                  '+
                            '  when p.ativo = ''S'' then ''SIM''         '+
                            '  else                                  '+
                            '  ''NÃO''                                 '+
                            '  end as ativo,                         '+
                            '  case                                  '+
                            '  when p.pedido = ''S'' then ''SIM''        '+
                            '  else                                  '+
                            '  ''NÃO''                                 '+
                            '  end as pedido                         '+
                            '  From PrazoPagamento p                 '+
                            '  where id_prazo >0';

      case TabInativo of
        1:FiltroInativo      := FiltroInativo + ' and p.ativo=''S''';
        2:FiltroInativo      := FiltroInativo + ' and p.ativo=''N''';
      end;

      if filtro <>'' then
      begin
        FiltroQuery := ' and (codigo like :filtro or descricao like :filtro)';
        sqlQuery    := sqlQuery + FiltroInativo+ FiltroQuery;

      end
      else
      sqlQuery  := sqlQuery+FiltroInativo;

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
        if dm.TabConsPrazoPag.Active then
        begin
          dm.TabConsPrazoPag.Close; // Feche o dataset se estiver ativo
        end;

        dm.TabConsPrazoPag.DisableControls;
        if dm.TabConsPrazoPag.eof then
        begin
          dm.TabConsPrazoPag.fieldDefs.clear;

          dm.TabConsPrazoPag.FieldDefs.Add('id_prazo',    ftInteger);
          dm.TabConsPrazoPag.FieldDefs.Add('codigo',      ftInteger);
          dm.TabConsPrazoPag.FieldDefs.Add('tipo',        ftstring,20);
          dm.TabConsPrazoPag.FieldDefs.Add('descricao',   ftString,180);
          dm.TabConsPrazoPag.FieldDefs.Add('ativo',       ftString,3);
          dm.TabConsPrazoPag.FieldDefs.Add('pedido',      ftstring,3);

          dm.TabConsPrazoPag.createdataset;
        end
        else
        begin
          dm.TabConsPrazoPag.EmptyDataSet;
        end;

        while not Qry.Eof do
        begin
          dm.TabConsPrazoPag.Append;

          dm.TabConsPrazoPag.FieldByName('id_prazo').Value     :=  Qry.FieldByName('id_prazo').Value;
          dm.TabConsPrazoPag.FieldByName('codigo').Value       :=  Qry.FieldByName('codigo').Value;
          dm.TabConsPrazoPag.FieldByName('tipo').Value         :=  Qry.FieldByName('tipo').Value;
          dm.TabConsPrazoPag.FieldByName('descricao').Value    :=  Qry.FieldByName('descricao').Value;
          dm.TabConsPrazoPag.FieldByName('ativo').Value        :=  Qry.FieldByName('ativo').Value;
          dm.TabConsPrazoPag.FieldByName('pedido').Value       :=  Qry.FieldByName('pedido').Value;

          dm.TabConsPrazoPag.Post;
          Qry.Next;
        end;
        dm.TabConsPrazoPag.First;
        dm.TabConsPrazoPag.EnableControls;
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
}
end.
