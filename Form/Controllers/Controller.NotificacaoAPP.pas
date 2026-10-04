unit Controller.NotificacaoAPP;

interface

uses
  Model.Notificacao,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections;

type
  TNotificacaoController = class
  private
    FDAO: TDAOOperacao<TNotificacao>;
  public
    constructor Create;
    destructor Destroy; override;

    function Salvar(ADoc: TNotificacao; out RetornoID:integer): Boolean;
  end;

implementation

uses UDM, cxDateUtils, System.Variants;

{ TNotificacaoController }

constructor TNotificacaoController.Create;
begin
  FDAO := TDAOOperacao<TNotificacao>.Create(dm.Conn);
end;

destructor TNotificacaoController.Destroy;
begin
  FDAO.Free;
  inherited;
end;

function TNotificacaoController.Salvar(ADoc: TNotificacao;
  out RetornoID: integer): Boolean;
begin
  Result          :=  False;
   if ADoc.id_Notificacao = 0 then
  begin
    ADoc.datacriacao      := Now;
    Try
      RetornoID           :=  FDAO.Insert(ADoc);
      Result              :=  True;
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
end;

end.
