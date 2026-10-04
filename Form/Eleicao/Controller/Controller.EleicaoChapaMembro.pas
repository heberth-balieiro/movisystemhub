unit Controller.EleicaoChapaMembro;

interface

Uses
  Model.EleicaoChapaMembro,
  Dao.Operacoes,
  Dao.EleicaoConfig,
  System.SysUtils,
  System.Generics.Collections, UDM;

type
  TEleicaoChapaMembroController = class
  private
    class function ArquivoParaBytes(const ACaminhoArquivo: string): TBytes; static;

  public
    class function ListarTodos(const AIDEmpresa, AIDRegistro, AIDEleicao:Integer): TObjectList<TModelChapaMembro>;
    class function BuscarPorID(AID: Integer): TModelChapaMembro;
    class function Salvar(ADoc: TModelChapaMembro; RetornoID:integer; out AStr:String): Boolean;
    class function Excluir(AID: Integer): Boolean;
    class function BuscarPorIDEleicaoChapa(Aid:integer):TModelChapaMembro;

  end;

implementation

uses
  System.AnsiStrings, System.Classes, System.IOUtils;

{ TEleicaoChapaMembroController }

class function TEleicaoChapaMembroController.BuscarPorID(AID: Integer): TModelChapaMembro;
var
  FDAO: TDAOOperacao<TModelChapaMembro>;
begin
  FDAO := TDAOOperacao<TModelChapaMembro>.Create(dm.Conn);
  Try
    Try
      Result := FDAO.FindById(AID);
    except
    on E: Exception do
      raise Exception.Create(e.Message);
    end;
  Finally
    FDao.Free;
  End;
end;

class function TEleicaoChapaMembroController.BuscarPorIDEleicaoChapa(Aid: integer): TModelChapaMembro;
begin

end;

class function TEleicaoChapaMembroController.Excluir(AID: Integer): Boolean;
var
  FDAO: TDAOOperacao<TModelChapaMembro>;
begin
  FDAO := TDAOOperacao<TModelChapaMembro>.Create(dm.Conn);
  Try
    Try
      Result := FDAO.Delete(AID);
    except
    on E: Exception do
      raise Exception.Create(e.Message);
    end;
  Finally
    FDao.Free;
  End;
end;

class function TEleicaoChapaMembroController.ListarTodos(const AIDEmpresa, AIDRegistro, AIDEleicao:Integer): TObjectList<TModelChapaMembro>;
var
  FDAO: TDAOOperacao<TModelChapaMembro>;
  SQL, SQLORDER: string;
  Params: TArray<TPair<string, Variant>>;
  Const
  QryStr = 'Select                                                               '+
              'id, codigo, nome, cpf, telefone,        '+
              ' case when ativo=''S'' then ''Ativo'' else ''Inativo'' end as ativo, '+
              ' id_eleicao, id_chapa, cargo, tipo'+
              ' From eleicao_chapa_membro where id >0 ';
begin

  if AIDEmpresa <=0 then
    raise Exception.Create('Dados da empresa inválido.');

  if AIDRegistro <=0 then
    raise Exception.Create('Registro selecionado inválido.');

  if AIDEleicao <=0 then
    raise Exception.Create('Registro selecionado inválido (Eleição).');


  FDAO  := TDAOOperacao<TModelChapaMembro>.Create(dm.Conn);

  Try
    if AIDEmpresa > 0 then
    begin
      SQL := SQL + ' and id_empresa= :idempresa';
      Params := Params + [TPair<string, Variant>.Create('idempresa', AIDEmpresa)];
    end;

    if AIDEleicao > 0 then
    begin
      SQL := SQL + ' and id_eleicao= :ideleicao';
      Params := Params + [TPair<string, Variant>.Create('ideleicao', AIDEleicao)];
    end;

    if AIDRegistro > 0 then
    begin
      SQL := SQL + ' and id_chapa= :id';
      Params := Params + [TPair<string, Variant>.Create('id', AIDRegistro)];
    end;

    SQLORDER  := ' order by id, nome';

    Result  := FDAO.FindWhere(QryStr + SQL + SQLORDER, Params);
 Finally
    FDao.Free;
  End;
end;

class function TEleicaoChapaMembroController.ArquivoParaBytes(const ACaminhoArquivo: string): TBytes;
var
  Stream: TFileStream;
begin
  if not TFile.Exists(ACaminhoArquivo) then
    raise Exception.Create('Arquivo não encontrado: ' + ACaminhoArquivo);

  Stream := TFileStream.Create(ACaminhoArquivo, fmOpenRead or fmShareDenyWrite);
  try
    SetLength(Result, Stream.Size);

    if Stream.Size > 0 then
      Stream.ReadBuffer(Result[0], Stream.Size);
  finally
    Stream.Free;
  end;
end;

class function TEleicaoChapaMembroController.Salvar(ADoc: TModelChapaMembro; RetornoID:integer; out AStr:String): Boolean;
var
FDAO: TDAOOperacao<TModelChapaMembro>;
begin
  Result    := False;
  FDAO      := TDAOOperacao<TModelChapaMembro>.Create(dm.Conn);

  Try
    if ADoc.id = 0 then
    begin

      Try
        if TDaoEleicaoConfig.ExisteMembro(Adoc.id_eleicao, Adoc.id_chapa, Adoc.id_empresa, Adoc.nome) then
        begin
          AStr  :='Já existe um membro cadastrado com esse nome.';
          exit;
        end;

        if TDaoEleicaoConfig.ExisteMembro(Adoc.id_eleicao, Adoc.id_chapa, Adoc.id_empresa, Adoc.cpf) then
        begin
          AStr  :='Já existe um membro cadastrado com esse CPF.';
          exit;
        end;

        if SameText(Trim(Adoc.cargo), 'PRESIDENTE') then
        begin
          if TDaoEleicaoConfig.ExistePresidente(Adoc.id_eleicao, Adoc.id_chapa, Adoc.id_empresa) then
          begin
            AStr  :='Já existe um membro com o cargo de Presidente nesta composição da chapa.';
            exit;
          end;
        end;

        if SameText(Trim(Adoc.cargo), 'VICE-PRESIDENTE') then
        begin
          if TDaoEleicaoConfig.ExisteVicePresidente(Adoc.id_eleicao, Adoc.id_chapa, Adoc.id_empresa) then
          begin
            AStr  :='Já existe um membro com o cargo de Vice-Presidente nesta composição da chapa.';
            exit;
          end;
        end;

        //Foto
        if Adoc.caminho_foto <> '' then
        begin
          ADoc.extensao_foto    := LowerCase(ExtractFileExt(Adoc.caminho_foto));
          ADoc.arquivo_foto     := ArquivoParaBytes(Adoc.caminho_foto);
        end;

        ADoc.codigo     :=  FDao.GetNextCode('codigo');
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

        //Foto
        if Adoc.caminho_foto <> '' then
        begin
          ADoc.extensao_foto    := LowerCase(ExtractFileExt(Adoc.caminho_foto));
          ADoc.arquivo_foto     := ArquivoParaBytes(Adoc.caminho_foto);
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
