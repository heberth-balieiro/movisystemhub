unit Controller.EleicaoConfig;

interface

uses
  Model.EleicaoConfig,
  Dao.Operacoes,
  Dao.EleicaoConfig,
  System.SysUtils,
  System.Generics.Collections, UDM;

type
  TEleicaoConfigController = class
  private

  public
    Class function BuscarPorID(AID: Integer): TModelEleicaoConfig;
    Class function Salvar(ADoc: TModelEleicaoConfig; Out AID:integer): Boolean;
    Class function BuscarPorIDEleicao(Aid:integer):TModelEleicaoConfig;
  end;

implementation

{ TEleicaoConfigController }

Class function TEleicaoConfigController.BuscarPorID(AID: Integer): TModelEleicaoConfig;
var
  FDAO: TDAOOperacao<TModelEleicaoConfig>;
begin
  FDAO := TDAOOperacao<TModelEleicaoConfig>.Create(dm.Conn);
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

Class function TEleicaoConfigController.BuscarPorIDEleicao(Aid: integer): TModelEleicaoConfig;
var
Dao :TDaoEleicaoConfig;
begin
  try
    Dao     := TDaoEleicaoConfig.Create;
    try
      Result  := Dao.BuscarPorIDEleicao(Aid);
    finally
      Dao.Free;
    end;

  except on e:exception do
   begin
    raise Exception.Create(e.Message);
   end;
  End;
end;

Class function TEleicaoConfigController.Salvar(ADoc: TModelEleicaoConfig; Out AID:integer): Boolean;
Var
  FDAO: TDAOOperacao<TModelEleicaoConfig>;

begin
  Result    :=  False;
  FDAO      := TDAOOperacao<TModelEleicaoConfig>.Create(dm.Conn);
  Try
    if ADoc.IdConfig = 0 then
    begin
      Try
        AID           := FDAO.Insert(ADoc);
        Result        := True;
      except on e:exception do
        begin
          raise Exception.Create(e.Message);
        end;
      End;
    end
    else
    begin
      Try
        Result := FDAO.Update(ADoc);
      
      except on e:exception do
        begin
          raise Exception.Create(e.Message);
        end;
      End;
    end;
  Finally
    FDao.Free;
  End;
end;

end.
