unit Controller.LancamentoBancario;

interface

uses
  Model.LancamentoBancario,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections,
  Dao.LancamentoBancario;
type
  TLancamentoBancarioController = class
  private

  public

    class function ListarTodos(const FiltroPor, FiltroNumero:String; const FiltroSituacao: string; const FiltroTipo: String;
                              const FiltroCheque: String; const FiltroData1:Tdate; const FiltroData2:TDate;
                              const FiltroIDConta:Integer =0; const FiltroIDHistorico:integer =0;
                              const FiltroIDCusto:integer=0): TObjectList<TLancamentoBancario>;
    class function BuscarPorID(AID: Integer): TLancamentoBancario;
    class function Salvar(ADoc: TLancamentoBancario; out RetornoID:integer; out AStr:String): Boolean;
    class function Excluir(const AIDRegistro: integer; const AIDUser: Integer; const AIDEmpresa:integer;AOrigem:string): Boolean;
    class function Desconciliar(const AIDEmpresa,AIDRegistro, AIDUser: integer): Boolean;
    //class function Conciliar(const ADoc: TRecDados):Boolean;
    Class function ExisteFITID(const AFitID: string; const AIDEmpresa, AIDConta: Integer): Boolean; static;
  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TLancamentoBancarioController }

class function TLancamentoBancarioController.BuscarPorID(
                                              AID: Integer): TLancamentoBancario;
var
  FDAO: TDAOOperacao<TLancamentoBancario>;
begin

  if AID <=0 then
    raise Exception.Create('Registro inválido para editar.');

  FDAO := TDAOOperacao<TLancamentoBancario>.Create(dm.Conn);

  Try
    Try
      Result := FDAO.FindById(AID);
    except
      raise;
    end;
  Finally
    FDAO.Free;
  End;
end;

class function TLancamentoBancarioController.Desconciliar(const AIDEmpresa,
                                            AIDRegistro, AIDUser: integer): Boolean;
begin
  Result  := False;
  if AIDEmpresa <= 0 then
    raise Exception.Create('Empresa inválida.');

  if AIDRegistro <= 0 then
    raise Exception.Create('Lançamento bancário inválido.');

  if AIDUser <= 0 then
    raise Exception.Create('Usuário inválido.');

  Result  := TDaoLancamentoBancario.Desconciliar(AIDEmpresa,AIDRegistro,AIDUser);
  if not result then
  raise Exception.Create('Não foi possível desconciliar o lançamento bancário.');

end;

class function TLancamentoBancarioController.Excluir(const AIDRegistro, AIDUser,
  AIDEmpresa: integer; AOrigem:string): Boolean;
var
FDAO: TDAOOperacao<TLancamentoBancario>;
begin
  Result  := False;

  if AIDRegistro <=0 then
    raise Exception.Create('Registro inválido para exclusão.');

  if AIDEmpresa <= 0 then
    raise Exception.Create('Empresa inválida para realizar a exclusão.');

  if Trim(AOrigem) = '' then
    raise Exception.Create('Origem do lançamento não informada.');

  if TDaoLancamentoBancario.ExisteVinculoAnexo(AOrigem, AIDEmpresa, AIDRegistro) then
  begin
    raise Exception.Create(
      'Não foi possível excluir o lançamento bancário, pois existem anexos vinculados.');
  end;

  FDAO    := TDAOOperacao<TLancamentoBancario>.Create(dm.Conn);

  Try
    Result  := FDAO.Delete(AIDRegistro);
    if not Result then
    raise Exception.Create('Não foi possível excluir o lançamento bancário.');
  Finally
    FDAO.Free;
  End;

end;

class function TLancamentoBancarioController.ExisteFITID(const AFitID: string;
                                            const AIDEmpresa, AIDConta: Integer): Boolean;
begin
  Result  := False;

  if Trim(AFitID) = '' then
    Exit;

  if AIDEmpresa <= 0 then
    raise Exception.Create('Empresa inválida.');

  if AIDConta <= 0 then
    raise Exception.Create('Conta inválida.');

  Result  := TDaoLancamentoBancario.ExisteFITID(AFitID,AIDEmpresa,AIDConta);
end;

class function TLancamentoBancarioController.ListarTodos(const FiltroPor,FiltroNumero,
  FiltroSituacao, FiltroTipo, FiltroCheque: String; const FiltroData1,
  FiltroData2: TDate; const FiltroIDConta, FiltroIDHistorico,
  FiltroIDCusto: integer): TObjectList<TLancamentoBancario>;
var
  Sql, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
  FDAO: TDAOOperacao<TLancamentoBancario>;
Const
  QryStr =  'Select                                                                                                '+
            ' l.id_lancamento_bancario, l.data_emissao, l.data_competencia, l.numero, Coalesce(valor,0) as valor,  '+
            ' l.tipo_movimento, l.situacao, l.historico, l.conciliado, l.cheque, h.descricao as nhistorico,        '+
            ' Concat(c.conta,'' | '',c.correntista,'' | '',c.banco) as nbanco,                                     '+
            ' case when exists (                                                                                   '+
            '   select 1                                                                                           '+
            '   from anexo a                                                                                       '+
            '   where a.id_referencia = l.id_lancamento_bancario                                                   '+
            '     and a.id_empresa = l.id_empresa                                                                  '+
            ' ) then 1 else 0 end as tem_anexo                                                                     '+
            ' From lancamento_bancario l                                                                           '+
            ' Inner join historico_bancario h                                                                      '+
            ' on l.id_historico = h.id_historico                                                                   '+
            ' Inner join contas c                                                                                  '+
            ' on l.id_conta = c.id_conta                                                                           '+
            ' where id_lancamento_bancario = id_lancamento_bancario ';
begin
  FDAO    := TDAOOperacao<TLancamentoBancario>.Create(dm.Conn);

  Try
    if FiltroNumero.Trim <> '' then
    begin
      SQL := SQL + ' and (l.numero LIKE :filtro)';
      Params := Params + [TPair<string, Variant>.Create('filtro', '%' + FiltroNumero + '%')];
    end;

    if FiltroSituacao.Trim <> '' then
    begin
      SQL := SQL + ' and l.situacao = :situacao';
      Params := Params + [TPair<string, Variant>.Create('situacao', FiltroSituacao)];
    end;

    if FiltroTipo.Trim <> '' then
    begin
      SQL := SQL + ' and l.tipo_movimento = :tipo';
      Params := Params + [TPair<string, Variant>.Create('tipo', FiltroTipo)];
    end;

    if FiltroCheque.Trim <> '' then
    begin
      SQL := SQL + ' and l.cheque = :cheque';
      Params := Params + [TPair<string, Variant>.Create('cheque', FiltroCheque)];
    end;

    if SameText(FiltroPor, 'Emissão') then
    begin
      Sql    := Sql + ' AND l.data_emissao BETWEEN :x and :y';
      Params := Params + [TPair<string, Variant>.Create('x', VarFromDateTime(FiltroData1))];
      Params := Params + [TPair<string, Variant>.Create('y', VarFromDateTime(FiltroData2))];
    end;

    if SameText(FiltroPor, 'Competência') then
    begin
      Sql    := Sql + ' AND l.data_competencia BETWEEN :x and :y';
      Params := Params + [TPair<string, Variant>.Create('x', VarFromDateTime(FiltroData1))];
      Params := Params + [TPair<string, Variant>.Create('y', VarFromDateTime(FiltroData2))];
    end;

    if SameText(FiltroPor, 'Conciliado') then
    begin
      Sql    := Sql + ' AND l.data_conciliacao BETWEEN :x and :y';
      Params := Params + [TPair<string, Variant>.Create('x', VarFromDateTime(FiltroData1))];
      Params := Params + [TPair<string, Variant>.Create('y', VarFromDateTime(FiltroData2))];
    end;

    if FiltroIDConta > 0 then
    begin
      SQL := SQL + ' and l.id_conta= :idconta';
      Params := Params + [TPair<string, Variant>.Create('idconta', FiltroIDConta)];
    end;

    if FiltroIDHistorico > 0 then
    begin
      SQL := SQL + ' and l.id_historico= :idhistorico';
      Params := Params + [TPair<string, Variant>.Create('idhistorico', FiltroIDHistorico)];
    end;

    if FiltroIDCusto > 0 then
    begin
      SQL := SQL + ' and l.id_custo= :idcusto';
      Params := Params + [TPair<string, Variant>.Create('idcusto', FiltroIDCusto )];
    end;

    SQLORDER  := ' order by l.data_emissao';

    Result := FDAO.FindWhere(QryStr + SQL + SQLORDER, Params);

  Finally
    FDAO.Free;
  End;
end;

class function TLancamentoBancarioController.Salvar(ADoc: TLancamentoBancario;
  out RetornoID: integer; out AStr: String): Boolean;
var
FDAO: TDAOOperacao<TLancamentoBancario>;
begin
  Result    := False;
  FDAO      := TDAOOperacao<TLancamentoBancario>.Create(dm.Conn);

  Try
    if ADoc.id_lancamento_bancario = 0 then
    begin
      Adoc.Data_Cadastro  := Now;

      if Adoc.situacao='CONCLUIDO' then
      begin
        Adoc.conciliado := 'S';
        Adoc.origem     := 'Manual';
        Adoc.data_conciliacao := Adoc.data_emissao;
      end
      else
      begin
        Adoc.conciliado := 'N';
        Adoc.data_conciliacao := Nulldate;
        Adoc.origem     := 'Manual';
      end;

      Try
        RetornoID       :=  FDAO.Insert(ADoc);
        Result          :=  True;
      except
        begin
          raise;
        end;
      End;
    end
    else
    begin
      Try
        ADoc.data_alteracao   := Now;

        if Adoc.situacao='PENDENTE' then
        begin
          Adoc.conciliado       := 'N';
          Adoc.data_conciliacao := Nulldate;
        end
        else
        begin
          if Adoc.conciliado = '' then
          begin
            Adoc.conciliado       := 'S';
            Adoc.data_conciliacao := Adoc.data_emissao;
          end;
        end;

        Result := FDAO.Update(ADoc);
      except
        begin
          raise
        end;

      End;
    end;
  Finally
    FDAO.Free;
  End;
end;

end.
