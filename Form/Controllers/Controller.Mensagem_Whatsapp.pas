unit Controller.Mensagem_Whatsapp;

interface

uses
  Model.Mensagem_Whatsapp,
  Dao.Operacoes,
  System.SysUtils,
  System.Generics.Collections;

type
  TMensagemWhatsappController = class
  private
    FDAO    : TDAOOperacao<TMensagemWhatsapp>;
    FDaoAdd : TDAOOperacao<TPessoaAdicionar>;
  public
    constructor Create;
    destructor Destroy; override;

    Function GravarMensagem(ADoc: TMensagemWhatsapp):boolean;
    Function AdcionarTodos:TObjectList<TPessoaAdicionar>;

    Function BuscarAssociadoEleicao(const AIDEleicao:Integer):TObjectList<TPessoaAdicionar>;

  end;

implementation

uses UDM, cxDateUtils, REST.Json;

{ TMensagemWhatsappController }

function TMensagemWhatsappController.AdcionarTodos:TObjectList<TPessoaAdicionar>;
var
  SQL: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := 'Select                                   '+
           ' s.id_socio as id_socio,                 '+
           ' s.codigo,                               '+
           ' Coalesce(s.matricula,0) as matricula,  '+
           ' s.nome,                                 '+
           ' s.cpf,                                  '+
           ' s.celular,                              '+
           ' s.whatsapp,                             '+
           ' s.email,                                 '+
           ' s.nascimento'+
           ' From Socio s                            '+
           ' where s.excluido=0                      '+
           ' and s.id_socio > 0                      '+
           ' and s.cliente=''S'' order by s.nome     ';


  Result := FDAOadd.FindWhere(SQL,Params);
end;

constructor TMensagemWhatsappController.Create;
begin
  FDAO := TDAOOperacao<TMensagemWhatsapp>.Create(dm.Conn);
  FDAOAdd := TDAOOperacao<TPessoaAdicionar>.Create(dm.Conn);
end;

destructor TMensagemWhatsappController.Destroy;
begin
  FDAO.Free;
  FDAOAdd.Free;
  inherited;
end;

function TMensagemWhatsappController.GravarMensagem(ADoc: TMensagemWhatsapp): boolean;
begin
  Result          :=  False;

  if ADoc.id_zap = 0 then
  begin
    Try
      FDAO.Insert(ADoc);
      Result          :=  True;
    except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;
  end;
end;

{$REGION 'Eleicao'}

function TMensagemWhatsappController.BuscarAssociadoEleicao(const AIDEleicao: Integer): TObjectList<TPessoaAdicionar>;
var
  SQL: string;
  Params: TArray<TPair<string, Variant>>;
begin
  SQL   := 'Select                                   '+
           ' s.id_socio as id_socio,                 '+
           ' s.codigo,                               '+
           ' Coalesce(s.matricula,0) as matricula,  '+
           ' s.nome,                                 '+
           ' s.cpf,                                  '+
           ' s.celular,                              '+
           ' s.whatsapp,                             '+
           ' s.email,                                 '+
           ' s.nascimento'+
           ' From socio s                            '+
           ' Inner Join eleicao_eleitor ee            '+
           ' on ee.id_associado = s.id_socio             '+
           ' where ee.id_eleicao= :id_eleicao        '+
           ' and ee.situacao=''A''                    '+
           ' order by s.nome     ';
  Params := [TPair<string, Variant>.Create('id_eleicao',       AIDEleicao)];

  Result := FDAOadd.FindWhere(SQL,Params);
end;



{$ENDREGION}

end.
