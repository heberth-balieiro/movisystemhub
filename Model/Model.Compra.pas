unit Model.Compra;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,

  UDM,
  data.DB,
  datasnap.dbclient;

Type
  TModelCompra = Class
    Private
      FTransacao  : TUniTransaction;
      function GerarId(tab, campo: string): integer;
    Public
      constructor Create;
      destructor Destroy;
  End;

Type
  TModelCompraVeiculo = Class (TModelCompra)
    Private
      Fgerarfinanceiro: String;
      Fobs: String;
      Fidempresa: Integer;
      Fhora: TTime;
      Fidusuario: Integer;
      Fnumero: Integer;
      Fidpessoa: Integer;
      Fsituacao: String;
      Fidcompra: Integer;
      Fidresponsavel: Integer;
      Ftipo: String;
      Fdata: TDate;
      Fgerarestoque: String;
    Fprccompra: double;
    Fidveiculo: Integer;
    Fdescricao: String;
    Fcodigo: Integer;
    Ffipe: Double;
    Fplaca: string;
    Fprcvenda: Double;
    Fprcsubtotal: Double;
    Fveiculotroca: string;
    Fprctotal: double;
    Fprcdescpercentual: Double;
    Fcomplemento: String;
    Fquantidade: Double;
    Fprcdescreais: double;
    Fdataent: TDate;
    Fveiculolucro: Currency;
    Fveiculovalortroca: Currency;
    Fprccusto: Currency;
    Fveiculovalorpraticado: Currency;
    Fdataretiradaconsi: TDate;
    Fatualizarficha: String;
    Fveiculoperclucro: Currency;
    Fcomissaolojavalor: Currency;
    Fcomissaolojaperc: Currency;
    Ftaxames: Currency;
    Fcomissaovendvalor: Currency;
    Fcomissaovendperc: Currency;
    Ftotalpatio: Currency;
    Ftaxaconsignado: Currency;
    Ftaxadia: Currency;
    Fstatusfin: String;
    Fvalor: Currency;
    Fnumeroparcelas: integer;
    Fprazo: String;
    Fdatapagamento: Tdate;
    Fparcelado: String;
    Fidprazo: Integer;






    Public
      Property  idcompra        : Integer read  Fidcompra         Write Fidcompra;
      Property  idempresa       : Integer read  Fidempresa        Write Fidempresa;
      Property  idusuario       : Integer read  Fidusuario        Write Fidusuario;
      Property  numero          : Integer read  Fnumero           Write Fnumero;
      Property  data            : TDate   read  Fdata             Write Fdata;
      Property  hora            : TTime   read  Fhora             Write Fhora;
      Property  tipo            : String  read  Ftipo             Write Ftipo;
      Property  idpessoa        : Integer read  Fidpessoa         Write Fidpessoa;
      Property  idresponsavel   : Integer read  Fidresponsavel    Write Fidresponsavel;
      Property  obs             : String  read  Fobs              Write Fobs;
      Property  situacao        : String  read  Fsituacao         Write Fsituacao;
      Property  gerarfinanceiro : String  read  Fgerarfinanceiro  Write Fgerarfinanceiro;
      Property  gerarestoque    : String  read  Fgerarestoque     Write Fgerarestoque;

      //Property popular Form entrada Veiculo
      Property idveiculo        : Integer read  Fidveiculo        write Fidveiculo;
      Property codigo           : Integer read  Fcodigo           write Fcodigo;
      Property descricao        : String  read  Fdescricao        write Fdescricao;
      Property prccompra        : double  read  Fprccompra        write Fprccompra;
      Property prcvenda         : Double  read  Fprcvenda         write Fprcvenda;
      Property placa            : string  read  Fplaca            Write Fplaca;
      Property fipe             : Double  read  Ffipe             write Ffipe;
      Property quantidade       : Double  read  Fquantidade       write Fquantidade;
      Property prcdescpercentual: Double  read  Fprcdescpercentual write Fprcdescpercentual;
      Property prcdescreais     : double  read  Fprcdescreais     write Fprcdescreais;
      Property complemento      : String  read  Fcomplemento      write Fcomplemento;
      Property prcsubtotal      : Double  read  Fprcsubtotal      write Fprcsubtotal;
      Property prctotal         : double  read  Fprctotal         write Fprctotal;
      Property veiculotroca     : string  read  Fveiculotroca     write Fveiculotroca;
      Property dataent          : TDate   read  Fdataent         write Fdataent;

      Property prccusto               : Currency  read  Fprccusto               write Fprccusto;
      Property veiculovalortroca      : Currency  read  Fveiculovalortroca      write Fveiculovalortroca;
      Property veiculolucro           : Currency  read  Fveiculolucro           write Fveiculolucro;
      Property veiculovalorpraticado  : Currency  read  Fveiculovalorpraticado  write Fveiculovalorpraticado;

      Property  veiculoperclucro      : Currency  read  Fveiculoperclucro     write Fveiculoperclucro;
      Property  atualizarficha        : String    read  Fatualizarficha       write Fatualizarficha;
      Property  taxames               : Currency  read  Ftaxames              write Ftaxames;
      Property  taxadia               : Currency  read  Ftaxadia              write Ftaxadia;
      Property  totalpatio            : Currency  read  Ftotalpatio           write Ftotalpatio;
      Property  comissaolojaperc      : Currency  read  Fcomissaolojaperc     write Fcomissaolojaperc;
      Property  comissaolojavalor     : Currency  read  Fcomissaolojavalor    write Fcomissaolojavalor;
      Property  comissaovendperc      : Currency  read  Fcomissaovendperc     write Fcomissaovendperc;
      Property  comissaovendvalor     : Currency  read  Fcomissaovendvalor    write Fcomissaovendvalor;
      Property  taxaconsignado        : Currency  read  Ftaxaconsignado       write Ftaxaconsignado;
      Property  dataretiradaconsi     : TDate     read  Fdataretiradaconsi    write Fdataretiradaconsi;

      //Property Pagamento

      Property  idprazo               : Integer   read  Fidprazo             write  Fidprazo;
      Property  prazo                 : String    read  Fprazo               write  Fprazo;
      Property  valor                 : Currency  read  Fvalor               write  Fvalor;
      Property  datapagamento         : Tdate     read  Fdatapagamento       write  Fdatapagamento;
      Property  parcelado             : String    read  Fparcelado           write  Fparcelado;
      Property  numeroparcelas        : integer   read  Fnumeroparcelas      write  Fnumeroparcelas;
      Property  statusfin             : String    read  Fstatusfin           write  Fstatusfin;


      Function GravarDados(out msg: string; Out NumContrato :integer; compraid:integer; edicao:string):Boolean;
      Function GravarVeiculo(out msg:string):Boolean;
      function GravarVeiculoUpdate(out msg: string; id:integer): Boolean;
      Function Editar(out msg:string; i:integer):Boolean;
      Function Estornar(out msg:string; i:integer):boolean;
      Function Excluir(out msg:string; i:integer):boolean;
      Function Pesquisar():boolean;
      Function PopularFrmVeiculoEntrada(i:integer):boolean;
      //function InserirCompraNova(out compraid: integer; out msg: string): Boolean;
      //function ExcluirCompraRascunho(out msg: string; compraid: integer): boolean;
      //function CarregarDadosTela(const compraid: integer): boolean;
      function ExcluirVeiculoCompra(const compraid, idveic: integer): Boolean;
      function PopularFrmVeiculoEntradaEdicao(idcomp, idveic: integer): boolean;



      Function AtualizarFichaVeiculo(compraid:integer):Boolean;
      Procedure GravaLogVeiculoProduto(compraid, num, iduser, idemp:integer; str:string);
      Procedure GravarVeiculoEstoque(const compraid, iduser, idemp,numcontrato:integer);

      procedure IniciarTransacao;
      procedure ConfirmarTransacao;
      procedure DesfazerTransacao;
  End;



implementation

{$REGION 'Veiculo'}

uses Model.Produto, cxDateUtils, Model.Geral, Vcl.Session, Vcl.Validacoes,
  Model.Estoque, uConfiguracaoService;

{ TModelCompraVeiculo }

{Function TModelCompraVeiculo.InserirCompraNova(out compraid:integer; out msg:string):Boolean;
var
  Qry       : TUniquery;
  idGerado  : Integer;
const
  sqlQuery  = 'Insert Into compra ('+
                  'id_compra,'+
                  'id_empresa,'+
                  'id_usuario,'+
                  'data,'+
                  'hora,'+
                  'tipo,'+
                  'id_pessoa,'+
                  'id_responsavel,'+
                  'situacao,'+
                  'gerar_financeiro,'+
                  'gerar_estoque,'+
                  'data_criado'+
                  ')'+
                  ' Values'+
                  '(  '+
                  ':id_compra,'+
                  ':id_empresa,'+
                  ':id_usuario,'+
                  ':data,'+
                  ':hora,'+
                  ':tipo,'+
                  ':id_pessoa,'+
                  ':id_responsavel,'+
                  ':situacao,'+
                  ':gerar_financeiro,'+
                  ':gerar_estoque,'+
                  ':data_criado'+
                  ')';
begin
  Result    := False;
  Qry       := TUniquery.create(nil);

  Try
    Try
      Qry.Connection := dm.Conn;

      With Qry do
      begin
        Params.Clear;
        Qry.SQL.Text                                        := sqlQuery;
        IniciarTransacao;

        idGerado                                            := GerarId('compra', 'id_compra');

        Qry.Params.ParamByName('id_compra').Asinteger       := idgerado;
        Qry.Params.ParamByName('id_empresa').AsInteger      := idempresa;
        Qry.Params.ParamByName('id_usuario').AsInteger      := idusuario;
        Qry.Params.ParamByName('data').AsDateTime           := data;
        Qry.Params.ParamByName('hora').AsDateTime           := hora;
        Qry.Params.ParamByName('tipo').AsString             := tipo;
        Qry.Params.ParamByName('id_pessoa').AsInteger       := idpessoa;
        Qry.Params.ParamByName('id_responsavel').AsInteger  := idresponsavel;
        Qry.Params.ParamByName('situacao').AsString         := 'R';//situacao;  Rascunho caso não for salvo e excluida
        Qry.Params.ParamByName('gerar_financeiro').AsString := gerarfinanceiro;
        Qry.Params.ParamByName('gerar_estoque').AsString    := gerarestoque;
        Qry.Params.ParamByName('data_criado').AsDateTime    := Now;

        Try
          Qry.ExecSQL;
          ConfirmarTransacao;
          compraid    := idGerado;
          result      := true;
          msg         := 'Registro realizado com sucesso';
        Except on e:exception do
          begin
            DesfazerTransacao;
            raise Exception.Create('Erro ao inserir entrada de veículo: ' + e.Message);
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
    FreeAndNil(Qry);
  End;
end;}

{Function TModelcompraVeiculo.ExcluirCompraRascunho(out msg:string; compraid:integer):boolean;
var
  Qry       : TUniquery;
const
  QryStr    = 'Delete from compra where id_compra= :id and situacao=''R'' and id_empresa= :idemp';
begin
  Result    := False;
  Qry       := TuniQuery.Create(nil);

  Try
    Qry.Connection := dm.Conn;
    qry.Params.Clear;
    Qry.SQL.Text                                := QryStr;
    Qry.Params.ParamByName('id').AsInteger      := compraid;
    Qry.Params.ParamByName('idemp').AsInteger   := idempresa;
    IniciarTransacao;

    Try
      Qry.ExecSQL;
      ConfirmarTransacao;
      Result := true;
    Except on e:exception do
      begin
        msg := 'Erro ao deletar processo de compra: '+e.Message;
        raise Exception.Create(msg);
      end;
    End;
  Finally
    FreeAndNil(Qry);
  End;

end; }

{Function TModelCompraVeiculo.CarregarDadosTela(const compraid:integer):boolean;
var
  Qry       : TUniquery;
const
  QryStr    = 'Select * from compra where id_compra= :id';
begin
  Result    := False;
  Qry       := TuniQuery.Create(nil);

  Try
    Qry.Connection := dm.Conn;
    qry.Params.Clear;
    Qry.SQL.Text                                := QryStr;
    Qry.Params.ParamByName('id').AsInteger      := compraid;

    Try
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        numero                := Qry.FieldByName('numero').AsInteger;
        data                  := Qry.FieldByName('data').AsDateTime;
        hora                  := Qry.FieldByName('hora').AsDateTime;
        tipo                  := Qry.FieldByName('tipo').AsString;
        idpessoa              := Qry.FieldByName('id_pessoa').AsInteger;
        idresponsavel         := Qry.FieldByName('id_responsavel').AsInteger;
        obs                   := Qry.FieldByName('obs').AsString;
        situacao              := Qry.FieldByName('situacao').AsString;
        gerarfinanceiro       := Qry.FieldByName('gerar_financeiro').AsString;
        gerarestoque          := Qry.FieldByName('gerar_estoque').AsString;

      end;
      Result := true;
      Qry.Close;
    Except on e:exception do
      begin
        raise Exception.Create('Erro co carregar dados da compra: '+#13+e.Message);
      end;
    End;
  Finally
    FreeAndNil(Qry);
  End;
end;}

Procedure TModelCompraVeiculo.GravarVeiculoEstoque(const compraid, iduser, idemp, numcontrato:integer);
{var
  Qry   : Tuniquery;
  ModelEstoque  :TModelEstoque;  //repassando funcao para o controller estoque geral 16/07/2025
Const
  QryStr         = 'Select id_produto_veiculo, total, veiculo_prcvenda from compra_itens where id_compra= :idcompra';
}begin
  {Qry         := TUniquery.Create(nil);
  ModelEstoque:= TModelEstoque.Create;

  Try
    Qry.Connection    := dm.Conn;
    Qry.Params.Clear;
    Qry.SQL.Text      := QryStr;
    Qry.Params.ParamByName('idcompra').AsInteger      := compraid;

    Try
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        Qry.First;

        while not qry.Eof do
        begin
          //Validar primeito
          if TConfiguracaoService.VeiculoControlaEstoque(Qry.FieldByName('id_produto_veiculo').AsInteger) then
          begin

            ModelEstoque.idproduto        := Qry.FieldByName('id_produto_veiculo').AsInteger;
            ModelEstoque.movimentacao     := 'Entrada';
            ModelEstoque.qtdenova         := 1;
            ModelEstoque.qtdeantes        := 0;
            ModelEstoque.prccompra        := Qry.FieldByName('total').AsCurrency;
            ModelEstoque.prcvenda         := Qry.FieldByName('veiculo_prcvenda').AsCurrency;
            ModelEstoque.data             := Now;
            ModelEstoque.idusuario        := iduser;
            ModelEstoque.obs              := 'Entrada de Veículo';
            ModelEstoque.idempresa        := idemp;
            ModelEstoque.numoperacao      := numcontrato;
            ModelEstoque.idpedido         := -1;
            ModelEstoque.idcompra         := compraid;

            if ModelEstoque.GravarProdutoEstoque then
            begin

            end;
          end;

          Qry.Next;
        end;

      end;
      Qry.Close;
    Except on e:exception do
      begin
        raise Exception.Create(e.message);
      end;
    End;

  Finally
    ModelEstoque.Free;
    Qry.Free;
  End; }









        // Validar para estoque
        {if (controlaestoque='S') and (servico='N') then
        begin
          if not InserirEstoque(idGerado,idempresa,estoqueatual) then
          raise Exception.Create('Error ao inserir o estoque.');
        end;
        }
end;

procedure TModelCompraVeiculo.GravaLogVeiculoProduto(compraid, num, iduser,
  idemp: integer; str: string);
{var
  ModelGeral     : TModelGeral;
  Qry            : TUniquery;
Const
  QryStr         = 'Select id_produto_veiculo from compra_itens where id_compra= :idcompra';
}begin
 { Qry         := TUniquery.Create(nil);
  ModelGeral  := TModelGeral.Create;

  Try
    Qry.Connection    := dm.Conn;
    Qry.Params.Clear;
    Qry.SQL.Text      := QryStr;
    Qry.Params.ParamByName('idcompra').AsInteger      := compraid;

    Try
      Qry.Open;

      if not Qry.IsEmpty then
      begin
        Qry.First;

        while not qry.Eof do
        begin
          //Gravar Log de registro
          ModelGeral.GravarHistoricoProdutoVeiculo(Qry.FieldByName('id_produto_veiculo').AsInteger,
                                                      iduser,
                                                      idemp,
                                                      num,
                                                      str
                                                    );
          Qry.Next;
        end;

      end;
      Qry.Close;
    Except on e:exception do
      begin
        raise Exception.Create(e.message);
      end;
    End;

  Finally
    Qry.Free;
  End;}

end;

function TModelCompraVeiculo.GravarDados(out msg: string; Out NumContrato :integer; compraid:integer; edicao:string): Boolean;
{var
  Qry       : TUniquery;
  vHistorico: TModelVeiculo;
const
  Qrystr    = 'Update compra set '+
                  'numero= :1,'+
                  'data= :2,'+
                  'hora= :3,'+
                  'tipo= :4,'+
                  'id_pessoa= :5,'+
                  'id_responsavel= :6,'+
                  'obs= :7,'+
                  'situacao= :8,'+
                  'gerar_financeiro= :9,'+
                  'gerar_estoque= :10 where id_compra= :id and id_empresa= :idemp';
}begin
 { Result    := False;
  Qry       := TUniquery.create(nil);

  Try
    Try
      Qry.Connection := dm.Conn;

      With Qry do
      begin
        Params.Clear;
        Qry.SQL.Text := Qrystr;
        IniciarTransacao;

        if edicao='Rascunho' then
        begin
          NumContrato                                   := GerarId('compra', 'numero');
          Qry.Params.ParamByName('1').Asinteger         := NumContrato;
        end
        else
        Qry.Params.ParamByName('1').Asinteger           := numero;
        Qry.Params.ParamByName('2').AsDateTime          := data;
        Qry.Params.ParamByName('3').AsDateTime          := hora;
        Qry.Params.ParamByName('4').AsString            := tipo;
        Qry.Params.ParamByName('5').AsInteger           := idpessoa;
        Qry.Params.ParamByName('6').AsInteger           := idresponsavel;
        Qry.Params.ParamByName('7').AsString            := obs;
        Qry.Params.ParamByName('8').AsString            := situacao;
        Qry.Params.ParamByName('9').AsString            := gerarfinanceiro;
        Qry.Params.ParamByName('10').AsString           := gerarestoque;
        Qry.Params.ParamByName('id').Asinteger          := compraid;
        Qry.Params.ParamByName('idemp').Asinteger       := idempresa;

        Try
          Qry.ExecSQL;
          ConfirmarTransacao;
          result  := true;
          msg     := 'Registro realizado com sucesso';
        Except on e:exception do
          begin
            DesfazerTransacao;
            raise Exception.Create('Erro ao inserir entrada de veículo: ' + e.Message);
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
    FreeAndNil(Qry);
  End;}
end;

Function TModelCompraVeiculo.GravarVeiculo(out msg:string):Boolean;
{var
  Qry       : TUniquery;
  idGerado  : Integer;
Const
  sqlQuery  = 'INSERT INTO compra_itens (' +
            '  id_compra_itens, id_compra, id_produto_veiculo, qtde, prc_unitario, desc_percentual, desc_reais, ' +
            '  descricao, complemento, subtotal, total, veiculo_troca, veiculo_prcfipe, veiculo_prcvenda, ' +
            '  data, data_criado, id_empresa, id_usuario, veiculoperclucro, atualizarficha, ' +
            '  taxames, taxadia, totalpatio, comissaolojaperc, comissaolojavalor, comissaovendperc, ' +
            '  comissaovendvalor, taxaconsignado, dataretiradaconsi, veiculolucrovalor, ' +
            '  veiculo_valorpraticado, prc_custo, veiculo_valortroca) ' +
            'VALUES (' +
            '  :idcompraitens, :id_compra, :id_produto_veiculo, :qtde, :prc_unitario, :desc_percentual, :desc_reais, ' +
            '  :descricao, :complemento, :subtotal, :total, :veiculo_troca, :veiculo_prcfipe, :veiculo_prcvenda, ' +
            '  :data, :data_criado, :id_empresa, :id_usuario, :veiculoperclucro, :atualizarficha, ' +
            '  :taxames, :taxadia, :totalpatio, :comissaolojaperc, :comissaolojavalor, :comissaovendperc, ' +
            '  :comissaovendvalor, :taxaconsignado, :dataretiradaconsi, :veiculolucrovalor, ' +
            '  :veiculo_valorpraticado, :prc_custo, :veiculo_valortroca' +
            ')';
}begin
  {Result    := False;



  Qry       := TUniquery.create(nil);

  Try
    Try
      Qry.Connection := dm.Conn;

      With Qry do
      begin
        Params.Clear;
        Qry.SQL.Text := sqlQuery;
        IniciarTransacao;

        idGerado                                                := GerarId('compra_itens', 'id_compra_itens');
        Qry.Params.ParamByName('idcompraitens').AsInteger       := idGerado;
        Qry.Params.ParamByName('id_compra').AsInteger           := idcompra;
        Qry.Params.ParamByName('id_produto_veiculo').AsInteger  := idveiculo;
        Qry.Params.ParamByName('qtde').AsCurrency               := quantidade;
        Qry.Params.ParamByName('prc_unitario').AsCurrency       := prccompra;
        Qry.Params.ParamByName('desc_percentual').AsCurrency    := prcdescpercentual;
        Qry.Params.ParamByName('desc_reais').AsCurrency         := prcdescreais;
        Qry.Params.ParamByName('descricao').AsString            := descricao;
        Qry.Params.ParamByName('complemento').AsString          := complemento;
        Qry.Params.ParamByName('subtotal').AsCurrency           := prcsubtotal;
        Qry.Params.ParamByName('total').AsCurrency              := prctotal;
        Qry.Params.ParamByName('veiculo_troca').AsString        := veiculotroca; // 'S' ou 'N'
        Qry.Params.ParamByName('veiculo_prcfipe').AsCurrency    := fipe;
        Qry.Params.ParamByName('veiculo_prcvenda').AsCurrency   := prcvenda;
        Qry.Params.ParamByName('data').AsDate                   := dataent;
        Qry.Params.ParamByName('data_criado').AsDateTime        := Now;
        Qry.Params.ParamByName('id_empresa').AsInteger          := idempresa;
        Qry.Params.ParamByName('id_usuario').AsInteger          := idusuario;
        Qry.Params.ParamByName('veiculoperclucro').AsCurrency   := veiculoperclucro;
        Qry.Params.ParamByName('atualizarficha').AsString       := atualizarficha; // 'S' ou 'N'
        Qry.Params.ParamByName('taxames').AsCurrency            := taxames;
        Qry.Params.ParamByName('taxadia').AsCurrency            := taxadia;
        Qry.Params.ParamByName('totalpatio').AsCurrency         := totalpatio;
        Qry.Params.ParamByName('comissaolojaperc').AsCurrency   := comissaolojaperc;
        Qry.Params.ParamByName('comissaolojavalor').AsCurrency  := comissaolojavalor;
        Qry.Params.ParamByName('comissaovendperc').AsCurrency   := comissaovendperc;
        Qry.Params.ParamByName('comissaovendvalor').AsCurrency  := comissaovendvalor;
        Qry.Params.ParamByName('taxaconsignado').AsCurrency     := taxaconsignado;
        if dataretiradaconsi = nullDate then
        Qry.Params.ParamByName('dataretiradaconsi').Clear
        else
        Qry.Params.ParamByName('dataretiradaconsi').AsDateTime  := dataretiradaconsi;
        Qry.Params.ParamByName('veiculolucrovalor').AsCurrency  := veiculolucro;
        Qry.Params.ParamByName('veiculo_valorpraticado').AsCurrency := veiculovalorpraticado;
        Qry.Params.ParamByName('prc_custo').AsCurrency          := prccusto;
        Qry.Params.ParamByName('veiculo_valortroca').AsCurrency := veiculovalortroca;

        Try
          Qry.ExecSQL;
          ConfirmarTransacao;
          result  := true;
          msg     := 'Registro realizado com sucesso';
        Except on e:exception do
          begin
            DesfazerTransacao;
            msg:= 'Erro ao inserir entrada de veículo: ' + e.Message;
            raise Exception.Create(msg);
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
    FreeAndNil(Qry);
  End; }
end;

Function TModelCompraVeiculo.GravarVeiculoUpdate(out msg:string; id:integer):Boolean;
{var
  Qry       : TUniquery;
Const
  QryStr    = 'UPDATE compra_itens SET                       '+
              'prc_unitario = :prc_unitario,                 '+
              'desc_percentual = :desc_percentual,           '+
              'desc_reais = :desc_reais,                     '+
              'descricao = :descricao,                       '+
              'complemento = :complemento,                   '+
              'subtotal = :subtotal,                         '+
              'total = :total,                               '+
              'veiculo_troca = :veiculo_troca,               '+
              'veiculo_prcfipe = :veiculo_prcfipe,           '+
              'veiculo_prcvenda = :veiculo_prcvenda,         '+
              'veiculoperclucro = :veiculoperclucro,         '+
              'atualizarficha = :atualizarficha,             '+
              'taxames = :taxames,                           '+
              'taxadia = :taxadia,                           '+
              'totalpatio = :totalpatio,                     '+
              'comissaolojaperc = :comissaolojaperc,         '+
              'comissaolojavalor = :comissaolojavalor,       '+
              'comissaovendperc = :comissaovendperc,         '+
              'comissaovendvalor = :comissaovendvalor,       '+
              'taxaconsignado = :taxaconsignado,             '+
              'dataretiradaconsi = :dataretiradaconsi,       '+
              'veiculolucrovalor = :veiculolucrovalor,       '+
              'veiculo_valorpraticado = :veiculo_valorpraticado, '+
              'prc_custo = :prc_custo,                       '+
              'veiculo_valortroca = :veiculo_valortroca      '+
              'WHERE id_compra = :idcompra and id_produto_veiculo= :idveiculo;     '+
              '';

}begin
  {Result    := False;
  Qry       := TUniquery.create(nil);

  Try
    Try
      Qry.Connection := dm.Conn;

      With Qry do
      begin
        Params.Clear;
        Qry.SQL.Text := QryStr;
        IniciarTransacao;

        Qry.Params.ParamByName('prc_unitario').AsFloat          := prccompra;
        Qry.Params.ParamByName('desc_percentual').AsFloat       := prcdescpercentual;
        Qry.Params.ParamByName('desc_reais').AsFloat            := prcdescreais;
        Qry.Params.ParamByName('descricao').AsString            := descricao;
        Qry.Params.ParamByName('complemento').AsString          := complemento;

        // cálculo em Delphi
        Qry.Params.ParamByName('subtotal').AsFloat              := prcsubtotal;
        Qry.Params.ParamByName('total').AsFloat                 := prctotal;

        Qry.Params.ParamByName('veiculo_troca').AsString        := veiculotroca;
        Qry.Params.ParamByName('veiculo_prcfipe').AsFloat       := fipe;
        Qry.Params.ParamByName('veiculo_prcvenda').AsFloat      := prcvenda;

        Qry.Params.ParamByName('veiculoperclucro').AsCurrency   :=veiculoperclucro;
        Qry.Params.ParamByName('atualizarficha').Asstring       :=atualizarficha;
        Qry.Params.ParamByName('taxames').AsCurrency            :=taxames;
        Qry.Params.ParamByName('taxadia').AsCurrency            :=taxadia;
        Qry.Params.ParamByName('totalpatio').AsCurrency         :=totalpatio;
        Qry.Params.ParamByName('comissaolojaperc').AsCurrency   :=comissaolojaperc;
        Qry.Params.ParamByName('comissaolojavalor').AsCurrency  :=comissaolojavalor;
        Qry.Params.ParamByName('comissaovendperc').AsCurrency   :=comissaovendperc;
        Qry.Params.ParamByName('comissaovendvalor').AsCurrency  :=comissaovendvalor;
        Qry.Params.ParamByName('taxaconsignado').AsCurrency     :=taxaconsignado;
        if dataretiradaconsi = nullDate then
        Qry.Params.ParamByName('dataretiradaconsi').Clear
        else
        Qry.Params.ParamByName('dataretiradaconsi').AsDateTime      := dataretiradaconsi;
        Qry.Params.ParamByName('veiculolucrovalor').AsCurrency      := veiculolucro;
        Qry.Params.ParamByName('veiculo_valorpraticado').AsCurrency := veiculovalorpraticado;
        Qry.Params.ParamByName('prc_custo').AsCurrency              := prccusto;
        Qry.Params.ParamByName('veiculo_valortroca').AsCurrency     := veiculovalortroca;
        Qry.Params.ParamByName('idcompra').AsInteger                := idcompra;
        Qry.Params.ParamByName('idveiculo').AsInteger               := id;


        Try
          Qry.ExecSQL;
          ConfirmarTransacao;

          result  := true;
          msg     := 'Registro realizado com sucesso';
        Except on e:exception do
          begin
            DesfazerTransacao;
            msg:= 'Erro ao atualizar entrada de veículo: ' + e.Message;
            raise Exception.Create(msg);
          end;
        end;

      end;

    Except on e:exception do
      begin
        DesfazerTransacao;
        msg := 'Erro ao atualizar:' +e.message;
        raise;
      end;
    End;

  Finally
    FreeAndNil(Qry);
  End; }
end;

Function TModelCompraveiculo.ExcluirVeiculoCompra(const compraid, idveic:integer):Boolean;
var
  Qry       : TUniquery;
const
  QryStr    = 'Delete from compra_itens where id_compra= :id and id_produto_veiculo= :idveic';
begin
  Result    := False;
  Qry       := TuniQuery.Create(nil);

  Try
    Qry.Connection := dm.Conn;
    qry.Params.Clear;
    Qry.SQL.Text                                := QryStr;
    Qry.Params.ParamByName('id').AsInteger      := compraid;
    Qry.Params.ParamByName('idveic').AsInteger  := idveic;
    IniciarTransacao;

    Try
      Qry.ExecSQL;
      ConfirmarTransacao;
      Result := true;
    Except on e:exception do
      begin
        raise Exception.Create('Erro ao deletar processo de compra: '+e.Message);
      end;
    End;
  Finally
    FreeAndNil(Qry);
  End;
end;

Function TModelCompraVeiculo.PopularFrmVeiculoEntrada(i:integer):boolean;
var
StrSql:string;
Qry:Tuniquery;
begin
  //codigo sera inutilizado passado para MVC RTTi
  Result    := False;
  StrSql    := 'Select                                         '+
                ' id_produto,                                  '+
                ' codigo,                                      '+
                ' descricao,                                   '+
                ' descricao_fiscal,                            '+
                ' prc_compra,                                  '+
                ' prc_venda,                                   '+
                ' veiculo_placa,                               '+
                ' veiculo_fipe,                                 '+
                ' prc_custo,                     '+
                ' veiculo_valortroca,            '+
                ' veiculo_lucro,                 '+
                ' veiculo_valorpraticado        '+
                ' From produto where id_produto= :id limit 1;  ';

  Qry       := TUniquery.Create(nil);

  Try
    Try
      if dm.conn.Connected then
        begin
          Qry.Connection    := dm.conn;
          Qry.SQL.Text      := StrSql;
          Qry.Params.ParamByName('id').AsInteger   := i;
          Qry.Open;

          if not Qry.IsEmpty then
          begin
            idveiculo   := Qry.FieldByName('id_produto').AsInteger;
            codigo      := Qry.FieldByName('codigo').AsInteger;
            descricao   := Qry.FieldByName('descricao_fiscal').AsString;
            prccompra   := Qry.FieldByName('prc_compra').AsFloat;
            prcvenda    := Qry.FieldByName('prc_venda').AsFloat;
            placa       := Qry.FieldByName('veiculo_placa').AsString;
            fipe        := Qry.FieldByName('veiculo_fipe').AsFloat;

            prccusto              := Qry.FieldByName('prc_custo').AsCurrency;
            veiculovalortroca     := Qry.FieldByName('veiculo_valortroca').AsCurrency;
            veiculolucro          := Qry.FieldByName('veiculo_lucro').AsCurrency;
            veiculovalorpraticado := Qry.FieldByName('veiculo_valorpraticado').AsCurrency;

            Result  := True;
          end;
          Qry.Close;
        end
        else
        begin
          raise Exception.Create('Falha na conexão com o banco de dados.');
        end;

    Except on e:exception do
      raise Exception.Create('Erro ao popular veículo: '+e.Message);
    End;

  Finally
    Freeandnil(qry);
  End;
end;

Function TModelCompraVeiculo.PopularFrmVeiculoEntradaEdicao(idcomp, idveic:integer):boolean;
var
  Qry:Tuniquery;
Const
  //funcao vai ser excluida
  QryStr  =   'Select                                  '+
               ' p.codigo,                              '+
               ' p.descricao,                           '+
               ' p.descricao_fiscal,                    '+
               ' p.veiculo_placa,                       '+

               ' c.qtde,                                '+
               ' c.prc_unitario,                        '+
               ' c.desc_percentual,                    '+
               ' c.desc_reais,                          '+
               ' c.complemento,                         '+
               ' c.total,                               '+
               ' c.veiculo_troca,                       '+
               ' c.veiculo_prcfipe,                     '+
               ' c.veiculo_prcvenda,                    '+
               ' c.veiculoperclucro,                    '+
               ' c.atualizarficha,                      '+
               ' c.taxames,                             '+
               ' c.taxadia,                             '+
               ' c.totalpatio,                          '+
               ' c.comissaolojaperc,                    '+
               ' c.comissaolojavalor,                   '+
               ' c.comissaovendperc,                    '+
               ' c.comissaovendvalor,                   '+
               ' c.taxaconsignado,                      '+
               ' c.dataretiradaconsi,                   '+
               ' c.veiculolucrovalor,                   '+
               ' c.veiculo_valorpraticado,              '+
               ' c.prc_custo,                           '+
               ' c.veiculo_valortroca                   '+
               ' From Compra_itens c                    '+
               ' inner Join Produto p                   '+
               ' On c.id_produto_veiculo = p.id_produto '+
               ' where c.id_compra= :idcompra and c.id_produto_veiculo= :idveiculo'+
               '';
begin
  Result    := False;
  //Qry       := TUniquery.Create(nil);

  Try
    Try
      if dm.conn.Connected then
        begin
          Qry.Connection    := dm.conn;
          Qry.SQL.Text      := QryStr;
          Qry.Params.ParamByName('idcompra').AsInteger   := idcomp;
          Qry.Params.ParamByName('idveiculo').AsInteger  := idveic;
          Qry.Open;

          if not Qry.IsEmpty then
          begin
            codigo                := Qry.FieldByName('codigo').AsInteger;
            descricao             := Qry.FieldByName('descricao_fiscal').AsString;
            placa                 := Qry.FieldByName('veiculo_placa').AsString;

            quantidade            := Qry.FieldByName('qtde').AsCurrency;
            fipe                  := Qry.FieldByName('veiculo_prcfipe').AsCurrency;
            prccompra             := Qry.FieldByName('prc_unitario').AsFloat;
            prcdescpercentual     := Qry.FieldByName('desc_percentual').AsCurrency;
            prcdescreais          := Qry.FieldByName('desc_reais').AsCurrency;
            prctotal              := Qry.FieldByName('total').AsCurrency;
            complemento           := Qry.FieldByName('complemento').AsString;
            veiculotroca          := Qry.FieldByName('veiculo_troca').AsString;
            atualizarficha        := Qry.FieldByName('atualizarficha').AsString;

            prccusto              := Qry.FieldByName('prc_custo').AsCurrency;
            prcvenda              := Qry.FieldByName('veiculo_prcvenda').AsFloat;
            veiculovalortroca     := Qry.FieldByName('veiculo_valortroca').AsCurrency;
            veiculoperclucro      := Qry.FieldByName('veiculoperclucro').AsCurrency;
            veiculolucro          := Qry.FieldByName('veiculolucrovalor').AsCurrency;
            veiculovalorpraticado := Qry.FieldByName('veiculo_valorpraticado').AsCurrency;

            taxames               := Qry.FieldByName('taxames').AsCurrency;
            taxadia               := Qry.FieldByName('taxadia').AsCurrency;
            totalpatio            := Qry.FieldByName('totalpatio').AsCurrency;
            comissaolojaperc      := Qry.FieldByName('comissaolojaperc').AsCurrency;
            comissaolojavalor     := Qry.FieldByName('comissaolojavalor').AsCurrency;
            comissaovendperc      := Qry.FieldByName('comissaovendperc').AsCurrency;
            comissaovendvalor     := Qry.FieldByName('comissaovendvalor').AsCurrency;
            taxaconsignado        := Qry.FieldByName('taxaconsignado').AsCurrency;
            dataretiradaconsi     := Qry.FieldByName('dataretiradaconsi').AsDateTime;

            Result  := True;
          end;
          Qry.Close;
        end
        else
        begin
          raise Exception.Create('Falha na conexão com o banco de dados.');
        end;

    Except on e:exception do
      raise Exception.Create('Erro ao popular veículo: '+e.Message);
    End;

  Finally
    Freeandnil(qry);
  End;
end;



function TModelCompraVeiculo.Editar(out msg: string; i: integer): Boolean;
begin

end;

function TModelCompraVeiculo.Estornar(out msg: string; i: integer): boolean;
begin

end;

function TModelCompraVeiculo.Excluir(out msg: string; i: integer): boolean;
begin

end;

function TModelCompraVeiculo.Pesquisar: boolean;
begin

end;

Function TModelCompraVeiculo.AtualizarFichaVeiculo(compraid:integer):Boolean;
{var
  Qry, QrySelect : TUniquery;
  ModelGeral  :TmodelGeral;    //função desativada e passado para model veiculos atualizar
Const
  QryStr  = 'Update Produto set prc_compra= :prc_compra, prc_custo= :prc_custo, '+
            'per_lucro= :per_lucro, prc_venda= :prc_venda, veiculo_fipe= :veiculo_fipe,'+
            'veiculo_valortroca= :veiculo_valortroca, veiculo_valorpraticado= :veiculo_valorpraticado,'+
            'veiculo_patiotaxames= :veiculo_patiotaxames, veiculo_patiotaxadia= :veiculo_patiotaxadia,'+
            'veiculo_patiototal= :veiculo_patiototal, veiculo_comissaoljpercentual= :veiculo_comissaoljpercentual,'+
            'veiculo_comissaoljtotal= :veiculo_comissaoljtotal, veiculo_comissaovendpercentual= :veiculo_comissaovendpercentual,'+
            'veiculo_comissaovendtotal= :veiculo_comissaovendtotal, veiculo_lucro= :veiculo_lucro where id_produto= :idproduto';

  QryStrSelect = 'Select id_produto_veiculo, prc_unitario, total, veiculo_prcfipe, veiculo_prcvenda, veiculoperclucro,   '+
            'taxames, taxadia, totalpatio, comissaolojaperc, comissaolojavalor, comissaovendperc,                        '+
            'comissaovendvalor, taxaconsignado, veiculolucrovalor, veiculo_valorpraticado,             '+
            'prc_custo, veiculo_valortroca                                                                               '+
            'from compra_itens where id_compra= :idcompra and atualizarficha=''S'' and veiculo_troca=''N'' order by id_produto_veiculo';  }
begin
 { Result    := False;
  Qry       := TUniquery.Create(nil);
  QrySelect := TUniquery.Create(nil);
  Modelgeral  := tModelGeral.Create;
  Try

    QrySelect.Connection    := dm.Conn;
    QrySelect.Params.Clear;
    QrySelect.SQL.Text      := QryStrSelect;
    QrySelect.Params.ParamByName('idcompra').AsInteger      := compraid;
    QrySelect.Open;

    if not QrySelect.IsEmpty then
    begin
      QrySelect.First;

      Qry.Connection    := dm.Conn;
      Qry.Params.Clear;
      Qry.SQL.Text      := QryStr;
      IniciarTransacao;

      while not QrySelect.Eof do
      begin

        if ModelGeral.BuscarFichaVeiculo(QrySelect.FieldByName('id_produto_veiculo').AsInteger,
                                        compraid) then
        begin

          Qry.Params.ParamByName('prc_compra').AsCurrency                       :=  QrySelect.FieldByName('total').AsCurrency;
          Qry.Params.ParamByName('prc_custo').AsCurrency                        :=  QrySelect.FieldByName('prc_custo').AsCurrency;
          Qry.Params.ParamByName('per_lucro').AsCurrency                        :=  QrySelect.FieldByName('veiculoperclucro').AsCurrency;
          Qry.Params.ParamByName('prc_venda').AsCurrency                        :=  QrySelect.FieldByName('veiculo_prcvenda').AsCurrency;
          Qry.Params.ParamByName('veiculo_fipe').AsCurrency                     :=  QrySelect.FieldByName('veiculo_prcfipe').AsCurrency;
          Qry.Params.ParamByName('veiculo_valortroca').AsCurrency               :=  QrySelect.FieldByName('veiculo_valortroca').AsCurrency;
          Qry.Params.ParamByName('veiculo_valorpraticado').AsCurrency           :=  QrySelect.FieldByName('veiculo_valorpraticado').AsCurrency;
          Qry.Params.ParamByName('veiculo_patiotaxames').AsCurrency             :=  QrySelect.FieldByName('taxames').AsCurrency;
          Qry.Params.ParamByName('veiculo_patiotaxadia').AsCurrency             :=  QrySelect.FieldByName('taxadia').AsCurrency;
          Qry.Params.ParamByName('veiculo_patiototal').AsCurrency               :=  QrySelect.FieldByName('totalpatio').AsCurrency;
          Qry.Params.ParamByName('veiculo_comissaoljpercentual').AsCurrency     :=  QrySelect.FieldByName('comissaolojaperc').AsCurrency;
          Qry.Params.ParamByName('veiculo_comissaoljtotal').AsCurrency          :=  QrySelect.FieldByName('comissaolojavalor').AsCurrency;
          Qry.Params.ParamByName('veiculo_comissaovendpercentual').AsCurrency   :=  QrySelect.FieldByName('comissaovendperc').AsCurrency;
          Qry.Params.ParamByName('veiculo_comissaovendtotal').AsCurrency        :=  QrySelect.FieldByName('comissaovendvalor').AsCurrency;
          Qry.Params.ParamByName('veiculo_lucro').AsCurrency                    :=  QrySelect.FieldByName('veiculolucrovalor').AsCurrency;

          Qry.Params.ParamByName('idproduto').AsInteger                         :=  QrySelect.FieldByName('id_produto_veiculo').AsInteger;

          try
            Qry.ExecSQL;
          Except on e:exception do
            begin
              DesfazerTransacao;
              raise Exception.Create(e.Message);
            end;
          end;

        end;
          QrySelect.Next;
      end;

      ConfirmarTransacao;
      Result  := true;

    end;

  Finally
    FreeAndNil(Qry);
    FreeandNil(Modelgeral);
  End;}

end;


{$ENDREGION}





{$REGION 'Funcoes'}

procedure TModelCompraVeiculo.ConfirmarTransacao;
begin
  try
    if Assigned(FTransacao) and FTransacao.Active then
      FTransacao.Commit;
  except
    on E: Exception do
      raise Exception.Create('Erro ao confirmar transação: ' + E.Message);
  end;
end;

procedure TModelCompraVeiculo.IniciarTransacao;
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

procedure TModelCompraVeiculo.DesfazerTransacao;
begin
  try
    if Assigned(FTransacao) and FTransacao.Active then
      FTransacao.Rollback;
  except
    on E: Exception do
      raise Exception.Create('Erro ao desfazer transação: ' + E.Message);
  end;
end;

constructor TModelCompra.Create;
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

destructor TModelCompra.Destroy;
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

Function TModelCompra.GerarId(tab, campo:string):integer;
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


{$ENDREGION}



end.
