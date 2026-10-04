{

Descrição da tabela produto
campo cad_produto

P = Produto
V= Veiculo
E = Equipamento

}

unit Model.Produto;

interface

Uses
  Uni,System.SysUtils,
  System.Classes,

  UDM,
  data.DB,
  datasnap.dbclient, Model.Estoque;


Type
  TModelProduto = Class

  Private
    FTransacao  : TUniTransaction;
    Fidlocalizacao: integer;
    Festoqueatual: Double;
    Fcodbarra: String;
    Faviso: String;
    Fobs: String;
    Fidempresa: integer;
    Faltedescricao: String;
    Festoqueminimo: Double;
    Fperlucro: Double;
    Fprccompra: Double;
    Fidunidade: integer;
    Fservico: String;
    Fidmarca: integer;
    Fidusuario: integer;
    Fdescricao: String;
    Fcodigo: integer;
    Fprcpromocao: Double;
    Festoqueinicial: Double;
    Finativo: String;
    Fidgrupo: integer;
    Fpesokg: Double;
    Fdesfiscal: String;
    FidProduto: integer;
    Fmostrarapp: String;
    Fprccusto: Double;
    Freferencia: String;
    Ftipoproduto: String;
    Fexcluido: integer;
    Fpercusto: Double;
    Fprcvenda: double;
    Ffoto2: string;
    Ffoto3: string;
    Ffoto1: string;
    Fcontrolaestoque: string;
    Ffracionado: string;
    function InserirEstoque(idproduto, idempresa: integer;
      qtde: double): boolean;
    

  public
    constructor Create;
    destructor Destroy; override;

    property idProduto        :integer  read FidProduto       write FidProduto;
    property codigo           :integer  read Fcodigo          write Fcodigo;
    property idmarca          :integer  read Fidmarca         write Fidmarca;
    property idgrupo          :integer  read Fidgrupo         write Fidgrupo;
    property idunidade        :integer  read Fidunidade       write Fidunidade;
    property idlocalizacao    :integer  read Fidlocalizacao   write Fidlocalizacao;
    property idempresa        :integer  read Fidempresa       write Fidempresa;
    property codbarra         :String   read Fcodbarra        write Fcodbarra;
    property referencia       :String   read Freferencia      write Freferencia;
    property tipoproduto      :String   read Ftipoproduto     write Ftipoproduto;
    property descricao        :String   read Fdescricao       write Fdescricao;
    property desfiscal        :String   read Fdesfiscal       write Fdesfiscal;
    property servico          :String   read Fservico         write Fservico;
    property inativo          :String   read Finativo         write Finativo;
    property prccompra        :Double   read Fprccompra       write Fprccompra;
    property percusto         :Double   read Fpercusto        write Fpercusto;
    property prccusto         :Double   read Fprccusto        write Fprccusto;
    property perlucro         :Double   read Fperlucro        write Fperlucro;
    property prcvenda         :double   read Fprcvenda        write Fprcvenda;
    property estoqueminimo    :Double   read Festoqueminimo   write Festoqueminimo;
    property estoqueinicial   :Double   read Festoqueinicial  write Festoqueinicial;
    property estoqueatual     :Double   read Festoqueatual    write Festoqueatual;
    property pesokg           :Double   read Fpesokg          write Fpesokg;
    property prcpromocao      :Double   read Fprcpromocao     write Fprcpromocao;
    property obs              :String   read Fobs             write Fobs;
    property aviso            :String   read Faviso           write Faviso;
    property mostrarapp       :String   read Fmostrarapp      write Fmostrarapp;
    property altedescricao    :String   read Faltedescricao   write Faltedescricao;
    property idusuario        :integer  read Fidusuario       write Fidusuario;
    property excluido         :integer  read Fexcluido        write Fexcluido;
    property foto1            :string   read Ffoto1           write Ffoto1;
    property foto2            :string   read Ffoto2           write Ffoto2;
    property foto3            :string   read Ffoto3           write Ffoto3;
    property fracionado       :string   read Ffracionado      write Ffracionado;
    property controlaestoque  :string   read Fcontrolaestoque write Fcontrolaestoque;



    Function Insert(out msg:String):Boolean;
    Function Update(out msg:string):Boolean;
    Function Delete(out msg:string):Boolean;
    Function Select(out msg:string):Boolean;
    Function GerarId(tab, campo:string):integer;
    Function Pesquisa(out msg:string; Par1,Par2, Par3:String):Boolean;
    Function PopularDataSet(out msg:string;Filtro:string;TabInativo,TabProduto:Integer):Boolean;

  End;

Type
  TModelVeiculo = class(TModelProduto)

    Private
      Fcv: String;
      Fcor: String;
      Fvencprocuracao: TDate;
      Fchassi: String;
      Fcambio: String;
      Fkm: String;
      Fuf: String;
      Fprocuracao: String;
      Fano: String;
      Fidespecie: Integer;
      Fcrv: String;
      Frenavan: String;
      Fplaca: String;
      Fporta: Integer;
      Fcombustivel: String;
      Forigem: String;
      Fidmodelo: Integer;
      Fanomodelo: String;
      Fveiculolucro: double;
      Fveiculocomissaovendpercentual: double;
      Fveiculocustototal: double;
      Fveiculovalortroca: double;
      Fveiculopatiototal: double;
      Fveiculopatiotaxames: double;
      Fveiculofipe: double;
      Fveiculocomissaoljpercentual: double;
      Fveiculopatiogerar: String;
      Fveiculocomissaovendtotal: double;
      Fveiculopatiotaxadia: double;
      Fveiculovalorpraticado: double;
      Fveiculocomissaoljtotal: double;
      Fveiculocodigoseguranca: String;
      Fveiculonumeromotor: String;
      Fveiculotipocrv: String;
      Fveiculodatahodometro: Tdate;
      fveiculoplacamercosul: String;
      Fveiculointencaovenda: String;
      Fveiculofinanciamentoativo: String;
      FveiculoipvaPago: String;
      Fveiculolicpago: String;
      fveiculotaxabombeiro: String;



    Public

      Property  idespecie       : Integer read Fidespecie         Write Fidespecie;
      Property  idmodelo        : Integer read Fidmodelo          Write Fidmodelo;
      Property  origem          : String  read Forigem            Write Forigem;
      Property  ano             : String  read Fano               Write Fano;
      Property  anomodelo       : String  read Fanomodelo         Write Fanomodelo;
      Property  combustivel     : String  read Fcombustivel       Write Fcombustivel;
      Property  cambio          : String  read Fcambio            Write Fcambio;
      Property  cor             : String  read Fcor               Write Fcor;
      Property  porta           : Integer read Fporta             Write Fporta;
      Property  km              : String  read Fkm                Write Fkm;
      Property  cv              : String  read Fcv                Write Fcv;
      Property  placa           : String  read Fplaca             Write Fplaca;
      Property  uf              : String  read Fuf                Write Fuf;
      Property  renavan         : String  read Frenavan           Write Frenavan;
      Property  chassi          : String  read Fchassi            Write Fchassi;
      Property  crv             : String  read Fcrv               Write Fcrv;
      Property  procuracao      : String  read Fprocuracao        Write Fprocuracao;
      Property  vencprocuracao  : TDate   read Fvencprocuracao    Write Fvencprocuracao;

      Property  veiculofipe                     :double read Fveiculofipe         Write Fveiculofipe;
      Property  veiculocustototal               :double read Fveiculocustototal   write Fveiculocustototal;
      Property  veiculovalortroca               :double read Fveiculovalortroca   Write Fveiculovalortroca;
      Property  veiculolucro                    :double read Fveiculolucro        Write Fveiculolucro;
      Property  veiculovalorpraticado           :double read Fveiculovalorpraticado write Fveiculovalorpraticado;
      Property  veiculopatiotaxames             :double read Fveiculopatiotaxames Write Fveiculopatiotaxames;
      Property  veiculopatiotaxadia             :double read Fveiculopatiotaxadia write fveiculopatiotaxadia;
      Property  veiculopatiototal               :double read Fveiculopatiototal   write Fveiculopatiototal;
      Property  veiculocomissaoljpercentual     :double read Fveiculocomissaoljpercentual write Fveiculocomissaoljpercentual;
      Property  veiculocomissaoljtotal          :double read Fveiculocomissaoljtotal  write Fveiculocomissaoljtotal;
      Property  veiculocomissaovendpercentual   :double read Fveiculocomissaovendpercentual Write Fveiculocomissaovendpercentual;
      Property  veiculocomissaovendtotal        :double read Fveiculocomissaovendtotal  write Fveiculocomissaovendtotal;
      Property  veiculopatiogerar               :String read Fveiculopatiogerar   write Fveiculopatiogerar;

      Property  veiculodatahodometro            :Tdate    read  Fveiculodatahodometro   Write Fveiculodatahodometro;
      Property  veiculonumeromotor              :String   read  Fveiculonumeromotor     write Fveiculonumeromotor;
      Property  veiculocodigoseguranca          :String   read  Fveiculocodigoseguranca Write Fveiculocodigoseguranca;
      Property  veiculotipocrv                  :String   read  Fveiculotipocrv         Write Fveiculotipocrv;

      Property  veiculoipvaPago                 :String   read  FveiculoipvaPago        write FveiculoipvaPago;
      Property  veiculointencaovenda            :String   read  Fveiculointencaovenda   write Fveiculointencaovenda;
      Property  veiculoplacamercosul            :String   read  fveiculoplacamercosul   write Fveiculoplacamercosul;
      Property  veiculolicpago                  :String   read  Fveiculolicpago         write Fveiculolicpago;
      Property  veiculotaxabombeiro             :String   read  fveiculotaxabombeiro    write Fveiculotaxabombeiro;
      Property  veiculofinanciamentoativo       :String   read  Fveiculofinanciamentoativo  write Fveiculofinanciamentoativo;


      Function Novo(out msg:String):Boolean;
      Function SalvarAlteracoes(out msg:String):Boolean;
      Function Excluir(out msg:string; i:integer):Boolean;
      Function SelecionarEditar(out msg:string;id:integer):Boolean;
      Function PesquisaVeiculo(out msg:string; Filtro1, Filtro2, Filtro3:integer; FiltroStr:String):Boolean;
      //Function GravarHistorico(id,iduser, idemp:integer; desc:string):Boolean;

      function GravarFotoVeiculo(out idretfoto:integer;base64, url, formato: String): Boolean;
      function CarregardadosVeiculoFoto(out rcodigo: integer; out rdescricao,
      rplaca: String; out rprcvenda, rvlrfipe: double;
      idveic: integer): Boolean;
      Function ExcluirFotoVeiculoSelecionado(idfoto, idveic:integer):Boolean;
      Function VisualizarFotoSelecionada(idfoto, idveic:integer; Out Base64,extft:String):Boolean;

      procedure IniciarTransacao;
      procedure ConfirmarTransacao;
      procedure DesfazerTransacao;

  end;

implementation

uses
  System.Math, Model.Geral;

  {$REGION 'Produto'}

destructor TModelProduto.Destroy;
begin
  if Assigned(FTransacao) then
    FreeAndNil(FTransacao);

  inherited Destroy;
end;

constructor TModelProduto.Create;
begin
inherited Create;

  FTransacao                    := TUniTransaction.Create(nil);
  FTransacao.DefaultConnection  := dm.Conn;
end;

Function TModelProduto.GerarId(tab, campo:string):integer;
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

Function TModelProduto.Insert(out msg:String):Boolean;
var
Qry       : TUniquery;
sqlQuery  : string;
idGerado  : Integer;
begin
  //desativar codigo
  Result  := False;
  Qry     := TUniquery.create(nil);
  Try
    Try
      FTransacao.StartTransaction;
      Qry.Connection := dm.Conn;
      sqlQuery := 'Insert Into produto ('+
                  'id_produto,'+
                  'codigo,    '+
                  'id_marca,  '+
                  'id_grupo,  '+
                  'id_unidade,'+
                  'id_localizacao,'+
                  'id_empresa, '+
                  'cod_barras, '+
                  'referencia, '+
                  'tipo_produto, '+
                  'descricao,   '+
                  'descricao_fiscal, '+
                  'servico,   '+
                  'ativo,   '+
                  'prc_compra, '+
                  'per_custo,  '+
                  'prc_custo,  '+
                  'per_lucro,  '+
                  'prc_venda,  '+
                  'estoque_minimo, '+
                  'estoque_inicial, '+
                  'estoque_atual,  '+
                  'peso_kg,     '+
                  'prc_promocao, '+
                  'observacao,    '+
                  'avisos,        '+
                  'mostrar_app,   '+
                  'alterar_descricao, '+
                  'data_cadastro,   '+
                  'id_usuario,      '+
                  'excluido,         '+
                  'foto1,'+
                  'foto2,'+
                  'foto3,'+
                  'fracionado,'+
                  'controlaestoque,'+

                  ')'+
                  ' Values'+
                  '(  '+
                  ':idproduto,'+
                  ':codigo,    '+
                  ':idmarca,  '+
                  ':idgrupo,  '+
                  ':idunidade,'+
                  ':idlocalizacao,'+
                  ':idempresa, '+
                  ':codbarras, '+
                  ':referencia, '+
                  ':tipoproduto, '+
                  ':descricao,   '+
                  ':descricaofiscal, '+
                  ':servico,   '+
                  ':inativo,   '+
                  ':prccompra, '+
                  ':percusto,  '+
                  ':prccusto,  '+
                  ':perlucro,  '+
                  ':prcvenda,  '+
                  ':estoqueminimo, '+
                  ':estoqueinicial, '+
                  ':estoqueatual,  '+
                  ':pesokg,     '+
                  ':prcpromocao, '+
                  ':observacao,    '+
                  ':avisos,        '+
                  ':mostrarapp,   '+
                  ':alterardescricao, '+
                  ':datacadastro,   '+
                  ':idusuario,      '+
                  ':excluido,         '+
                  ':foto1,'+
                  ':foto2,'+
                  ':foto3,'+
                  ':fracionado,'+
                  ':controlaestoque'+
                  ')';
      With Qry do
      begin
        Close;
        Sql.clear;
        Qry.SQL.Text := sqlQuery;

        idGerado                                  := GerarId('produto', 'id_produto');

        Qry.ParamByName('idproduto').Value        := idgerado;
        Qry.ParamByName('codigo').Value           := GerarId('produto', 'codigo');
        Qry.ParamByName('idmarca').Value          := idmarca;
        Qry.ParamByName('idgrupo').Value          := idgrupo;
        Qry.ParamByName('idunidade').Value        := idunidade;
        Qry.ParamByName('idlocalizacao').Value    := idlocalizacao;
        Qry.ParamByName('idempresa').Value        := idempresa;
        Qry.ParamByName('codbarras').Value        := Trim(codbarra);
        Qry.ParamByName('referencia').Value       := Trim(referencia);
        Qry.ParamByName('tipoproduto').Value      := tipoproduto;
        Qry.ParamByName('descricao').Value        := Trim(descricao);
        Qry.ParamByName('descricaofiscal').Value  := trim(desfiscal);
        Qry.ParamByName('servico').Value          := servico;
        Qry.ParamByName('inativo').Value          := inativo;
        Qry.ParamByName('prccompra').Value        := (prccompra);
        Qry.ParamByName('percusto').Value         := (percusto);
        Qry.ParamByName('prccusto').Value         := (prccusto);
        Qry.ParamByName('perlucro').Value         := (perlucro);
        Qry.ParamByName('prcvenda').Value         := (prcvenda);
        Qry.ParamByName('estoqueminimo').Value    := estoqueminimo;
        Qry.ParamByName('estoqueinicial').Value   := estoqueinicial;//sera usando para atacado
        Qry.ParamByName('estoqueatual').Value     := estoqueatual;
        Qry.ParamByName('pesokg').Value           := pesokg;
        Qry.ParamByName('prcpromocao').Value      := (prcpromocao);
        Qry.ParamByName('observacao').Value       := Trim(obs);
        Qry.ParamByName('avisos').Value           := Trim(aviso);
        Qry.ParamByName('mostrarapp').Value       := mostrarapp;
        Qry.ParamByName('alterardescricao').Value := altedescricao;
        Qry.ParamByName('datacadastro').Value     := now;
        Qry.ParamByName('idusuario').Value        := idusuario;
        Qry.ParamByName('excluido').Value         := 0;
        if foto1<> '' then
        Qry.ParamByName('foto1').Value            := foto1
        else
        Qry.ParamByName('foto1').IsNull;

        if foto2 <> '' then
        Qry.ParamByName('foto2').Value            := foto2
        else
        Qry.ParamByName('foto2').IsNull;

        if foto3 <> '' then
        Qry.ParamByName('foto3').Value            := foto3
        else
        Qry.ParamByName('foto3').IsNull;

        Qry.ParamByName('fracionado').Value       := fracionado;
        qry.ParamByName('controlaestoque').Value  := controlaestoque;

        execsql;

        msg     := 'Registro realizado com sucesso';
        Result  := True;

        // Validar para estoque
        if (controlaestoque='S') and (servico='N') then
        begin
          if not InserirEstoque(idGerado,idempresa,estoqueatual) then
          raise Exception.Create('Error ao inserir o estoque.');
        end;

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

Function TModelProduto.InserirEstoque(idproduto, idempresa:integer; qtde:double):boolean;
var
Model:TModelEstoque;
begin
//  Result  := false;
//  Model   :=TModelEstoque.Create;
//  try
//    Model.idproduto   := idproduto;
//    Model.idempresa   := idempresa;
//    Model.qtdenova    := qtde;
//
//    if not Model.IncluirProdutoEstoqueNovo then
//    raise Exception.Create('Error ao inserir no estoque.');
//
//    Result  := True;
//  finally
//    Model.free;
//  end;
end;

Function TModelProduto.Update(out msg:string):Boolean;
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
      sqlQuery := 'Update produto set ' +
                  'id_marca         = :idmarca,'+
                  'id_grupo         = :idgrupo,'+
                  'id_unidade       = :idunidade,'+
                  'id_localizacao   = :idlocalizacao,'+
                  'cod_barras       = :codbarras,'+
                  'referencia       = :referencia,'+
                  'tipo_produto     = :tipoproduto,'+
                  'descricao        = :descricao,'+
                  'descricao_fiscal = :descricaofiscal,'+
                  'servico          = :servico,'+
                  'ativo            = :inativo,'+
                  'prc_compra       = :prccompra,'+
                  'per_custo        = :percusto,'+
                  'prc_custo        = :prccusto,'+
                  'per_lucro        = :perlucro,'+
                  'prc_venda        = :prcvenda,'+
                  'estoque_minimo   = :estoqueminimo,'+
                  'peso_kg          = :pesokg,'+
                  'prc_promocao     = :prcpromocao,'+
                  'observacao       = :observacao,'+
                  'avisos           = :avisos,'+
                  'mostrar_app      = :mostrarapp,'+
                  'alterar_descricao= :alterardescricao,'+
                  'data_alteracao   = :dtalteracao,'+
                  'id_usuario_alt   = :idusuario,'+
                  'foto1            = :foto1,'+
                  'foto2            = :foto2,'+
                  'foto3            = :foto3,'+
                  'fracionado       = :fracionado,'+
                  'controlaestoque  = :controlaestoque'+

                  ' WHERE id_produto = :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      // Definindo parâmetros
        Qry.ParamByName('idmarca').Value          := idmarca;
        Qry.ParamByName('idgrupo').Value          := idgrupo;
        Qry.ParamByName('idunidade').Value        := idunidade;
        Qry.ParamByName('idlocalizacao').Value    := idlocalizacao;
        Qry.ParamByName('codbarras').Value        := Trim(codbarra);
        Qry.ParamByName('referencia').Value       := Trim(referencia);
        Qry.ParamByName('tipoproduto').Value      := tipoproduto;
        Qry.ParamByName('descricao').Value        := Trim(descricao);
        Qry.ParamByName('descricaofiscal').Value  := trim(desfiscal);
        Qry.ParamByName('servico').Value          := servico;
        Qry.ParamByName('inativo').Value          := inativo;
        Qry.ParamByName('prccompra').Value        := Round(prccompra);
        Qry.ParamByName('percusto').Value         := round(percusto);
        Qry.ParamByName('prccusto').Value         := Round(prccusto);
        Qry.ParamByName('perlucro').Value         := round(perlucro);
        Qry.ParamByName('prcvenda').Value         := round(prcvenda);
        Qry.ParamByName('estoqueminimo').Value    := estoqueminimo;
        Qry.ParamByName('pesokg').Value           := pesokg;
        Qry.ParamByName('prcpromocao').Value      := Round(prcpromocao);
        Qry.ParamByName('observacao').Value       := Trim(obs);
        Qry.ParamByName('avisos').Value           := Trim(aviso);
        Qry.ParamByName('mostrarapp').Value       := mostrarapp;
        Qry.ParamByName('alterardescricao').Value := altedescricao;
        Qry.ParamByName('dtalteracao').Value      := now;
        Qry.ParamByName('idusuario').Value        := idusuario;
        Qry.ParamByName('foto1').Value            := foto1;
        Qry.ParamByName('foto2').Value            := foto2;
        Qry.ParamByName('foto3').Value            := foto3;
        qry.ParamByName('fracionado').Value       := fracionado;
        Qry.ParamByName('controlaestoque').Value  := controlaestoque;
        Qry.ParamByName('id').Value               := idProduto;

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

Function TModelProduto.Delete(out msg:string):Boolean;
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
      sqlQuery := 'Delete from produto where id_produto= :id';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      // Definindo parâmetro
      Qry.ParamByName('id').AsInteger    := idproduto;

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

Function TModelProduto.Select(out msg:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
  blobFoto1, blobFoto2, blobFoto3: TBlobField;
begin
  Result := False;
  Qry := TUniQuery.Create(nil);

  try
    try
      Qry.Connection := dm.Conn;
      sqlQuery := 'Select * from produto where id_produto= :ID';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;
      Qry.Params.ParamByName('id').AsInteger  := idproduto;

      Qry.Open;
      if not Qry.IsEmpty then
      begin

        idproduto           := Qry.FieldByName('id_produto').Asinteger;
        codigo              := Qry.FieldByName('codigo').Asinteger;
        idmarca             := Qry.FieldByName('id_marca').Asinteger;
        idgrupo             := Qry.FieldByName('id_grupo').Asinteger;
        idunidade           := Qry.FieldByName('id_unidade').Asinteger;
        idlocalizacao       := Qry.FieldByName('id_localizacao').Asinteger;
        if not Qry.FieldByName('cod_barras').IsNull then
        codbarra            := Qry.FieldByName('cod_barras').AsString
        else
        codbarra            := '';
        if not Qry.FieldByName('referencia').IsNull then
        referencia          := Qry.FieldByName('referencia').AsString
        else
        referencia          := '';
        tipoproduto         := Qry.FieldByName('tipo_produto').Value;
        if not Qry.FieldByName('descricao').IsNull then
        descricao           := Qry.FieldByName('descricao').Asstring
        else
        descricao           := '';
        if not Qry.FieldByName('descricao_fiscal').IsNull then
        desfiscal           := Qry.FieldByName('descricao_fiscal').AsString
        else
        desfiscal           := '';
        if not Qry.FieldByName('servico').IsNull then
        servico             := Qry.FieldByName('servico').AsString
        else
        servico             := 'N';
        if not Qry.FieldByName('ativo').IsNull then
        inativo             := Qry.FieldByName('ativo').AsString
        else
        inativo             := 'S';
        prccompra           := Qry.FieldByName('prc_compra').AsFloat;
        percusto            := Qry.FieldByName('per_custo').AsFloat;
        prccusto            := Qry.FieldByName('prc_custo').AsFloat;
        perlucro            := Qry.FieldByName('per_lucro').AsFloat;
        prcvenda            := Qry.FieldByName('prc_venda').AsFloat;
        estoqueminimo       := Qry.FieldByName('estoque_minimo').AsFloat;
        estoqueinicial      := Qry.FieldByName('estoque_inicial').AsFloat;
        estoqueatual        := Qry.FieldByName('estoque_atual').AsFloat;
        pesokg              := Qry.FieldByName('peso_kg').AsFloat;
        prcpromocao         := Qry.FieldByName('prc_promocao').AsFloat;
        obs                 := Qry.FieldByName('observacao').AsString;
        aviso               := Qry.FieldByName('avisos').AsString;
        mostrarapp          := Qry.FieldByName('mostrar_app').AsString;
        altedescricao       := Qry.FieldByName('alterar_descricao').AsString;

        blobFoto1           := Qry.FieldByName('foto1') as TBlobField;
        if blobFoto1.IsNull then
        Foto1               := ''
        else
        Foto1               := Qry.FieldByName('foto1').AsString;

        blobFoto2           := Qry.FieldByName('foto2') as TBlobField;
        if blobFoto2.IsNull then
        Foto2               := ''
        else
        if not Qry.FieldByName('foto2').IsNull then
        Foto2               := ''
        else
        Foto2               := Qry.FieldByName('foto2').AsString;


        blobFoto3           := Qry.FieldByName('foto3') as TBlobField;
        if blobFoto3.IsNull then
        Foto3               := ''
        else
        if not Qry.FieldByName('foto3').IsNull then
        Foto3               := ''
        else
        Foto3               := Qry.FieldByName('foto3').AsString;

        if not qry.FieldByName('fracionado').IsNull then
        fracionado          := qry.FieldByName('fracionado').Asstring
        else
        fracionado          := 'N';
        if not Qry.FieldByName('controlaestoque').IsNull then
        controlaestoque     := Qry.FieldByName('controlaestoque').Asstring
        else
        controlaestoque     := 'N';

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

Function TModelProduto.Pesquisa(out msg:string; Par1,Par2, Par3:String):Boolean;
var
  Qry     :TUniquery;
  sqlQuery, Filtro1, Ordem: string;
  I:integer;
begin
  Result                := False;
  Filtro1               := '';
  Ordem                 := '';
  Qry                   := TUniQuery.Create(nil);
  try
    try
      Qry.Connection    := dm.Conn;

      sqlQuery          := 'Select                                '+
                           ' p.id_produto,                        '+
                           ' p.codigo,                             '+
                           ' p.cod_barras,                         '+
                           ' p.referencia,                         '+
                           ' p.descricao,                          '+
                           ' case'+
                           ' when p.servico= ''N'' then ''NÃO''    '+
                           ' else ''SIM'''+
                           ' end as servico,'+
                           ' p.prc_venda,                          '+
                           ' p.estoque_atual,                     '+
                           ' p.prc_promocao,                      '+
                           ' m.marca,                             '+
                           ' g.grupo,                             '+
                           ' u.uni                                '+
                           ' from produto p                       '+
                           ' inner join marca m                   '+
                           ' on p.id_marca = m.id_marca           '+
                           ' inner join grupo g                   '+
                           ' on p.id_grupo = g.id_grupo           '+
                           ' inner join unidade u                '+
                           ' on p.id_unidade = u.id_unidade      '+
                           ' where p.id_produto >0;              ';

      if Par2 <> '' then
      begin
        if Par1 = 'CÓDIGO' then
        Filtro1 := ' and CODIGO = '+ Par2;

        if Par1 = 'NOME' then
        Filtro1 := ' and grupo like ''%'+Par2+'%''';

      end;

      if Par3 = 'CÓDIGO' then
      Ordem   := ' order by codigo';

      if Par3 = 'NOME' then
      Ordem   := ' order by grupo';


      sqlQuery  := sqlQuery + filtro1 + ordem;


      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := SqlQuery;

      Qry.Open;
      Qry.First;

      if not Qry.IsEmpty then
      begin
        //criar campo na tebela temporaria
        if dm.TabConsProduto.eof then
        begin
          dm.TabConsProduto.fieldDefs.clear;
          dm.TabConsProduto.FieldDefs.Add('id_produto', ftInteger);
          dm.TabConsProduto.FieldDefs.Add('codigo', ftInteger);
          dm.TabConsProduto.FieldDefs.Add('cod_barras',   ftString, 45);
          dm.TabConsProduto.FieldDefs.Add('referencia',   ftString, 50);
          dm.TabConsProduto.FieldDefs.Add('descricao',   ftString, 200);
          dm.TabConsProduto.FieldDefs.Add('servico',   ftString, 3);
          dm.TabConsProduto.FieldDefs.Add('prc_venda',   ftFloat);
          dm.TabConsProduto.FieldDefs.Add('estoque_atual',   ftFloat);
          dm.TabConsProduto.FieldDefs.Add('prc_promocao',   ftFloat);
          dm.TabConsProduto.FieldDefs.Add('marca',   ftString, 60);
          dm.TabConsProduto.FieldDefs.Add('grupo',   ftString, 60);
          dm.TabConsProduto.FieldDefs.Add('uni',   ftString, 5);


          //dm.TabConsProduto.fieldDefs.assign(Qry.FieldDefs);
          dm.TabConsProduto.createdataset;
        end
        else
        begin
          dm.TabConsProduto.EmptyDataSet;
        end;

        while not Qry.Eof do
        begin
          dm.TabConsProduto.Append;
          for I := 0 to Qry.FieldCount - 1 do
          begin
            dm.TabConsProduto.FieldByName('id_produto').Value   := Qry.FieldByName('id_produto').Value;
            dm.TabConsProduto.FieldByName('codigo').Value       := Qry.FieldByName('codigo').Value;
            dm.TabConsProduto.FieldByName('cod_barras').Value   := Qry.FieldByName('cod_barras').Value;
            dm.TabConsProduto.FieldByName('referencia').Value   := Qry.FieldByName('referencia').Value;
            dm.TabConsProduto.FieldByName('descricao').Value    := Qry.FieldByName('descricao').Value;
            dm.TabConsProduto.FieldByName('servico').Value      := Qry.FieldByName('servico').Value;
            dm.TabConsProduto.FieldByName('prc_venda').Value    := Qry.FieldByName('prc_venda').Value;
            dm.TabConsProduto.FieldByName('estoque_atual').Value:= Qry.FieldByName('estoque_atual').Value;
            dm.TabConsProduto.FieldByName('prc_promocao').Value := Qry.FieldByName('prc_promocao').Value;
            dm.TabConsProduto.FieldByName('marca').Value        := Qry.FieldByName('marca').Value;
            dm.TabConsProduto.FieldByName('grupo').Value        := Qry.FieldByName('grupo').Value;
            dm.TabConsProduto.FieldByName('uni').Value          := Qry.FieldByName('uni').Value;



            //dm.TabConsProduto.Fields[I].Value := Qry.Fields[I].Value;
          end;

          dm.TabConsProduto.Post;
          Qry.Next;
        end;

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

Function TModelProduto.PopularDataSet(out msg:string;Filtro:string;TabInativo,TabProduto:Integer):Boolean;
var
  Qry     :TUniquery;
  sqlQuery, FiltroQuery,FiltroInativo, FiltroProduto:String;
begin
  Result                := False;

  Qry                   := TUniQuery.Create(nil);
  try
    try
      Qry.Connection    := dm.Conn;

      sqlQuery          := 'Select                                '+
                           ' p.id_produto,                        '+
                           ' p.codigo,                             '+
                           ' p.cod_barras,                         '+
                           ' p.referencia,                         '+
                           ' p.descricao,                          '+
                           ' case'+
                           ' when p.servico= ''N'' then ''NÃO''    '+
                           ' else ''SIM'''+
                           ' end as servico,'+
                           ' p.prc_venda,                          '+
                           ' p.estoque_atual,                     '+
                           ' p.prc_promocao,                      '+
                           ' m.marca,                             '+
                           ' g.grupo,                             '+
                           ' u.uni,                                '+
                           ' l.localizacao                        '+
                           ' from produto p                       '+
                           ' inner join marca m                   '+
                           ' on p.id_marca = m.id_marca           '+
                           ' inner join grupo g                   '+
                           ' on p.id_grupo = g.id_grupo           '+
                           ' inner join unidade u                '+
                           ' on p.id_unidade = u.id_unidade      '+
                           ' inner join localizacao l             '+
                           ' on p.id_localizacao = l.id_localizacao'+
                           ' where p.id_produto >0              ';

      case TabProduto of
        0:FiltroProduto     := FiltroProduto +' and servico= ''N'' ';
        1:FiltroProduto     := FiltroProduto +' and servico= ''S'' ';
      end;


      case TabInativo of
        1:FiltroInativo      := FiltroInativo + ' and p.ativo=''S'' ';
        2:FiltroInativo      := FiltroInativo + ' and p.ativo=''N'' ';
      end;

      if Filtro <> '' then
      begin
        FiltroQuery := ' and (p.codigo like :filtro or'+
                             ' p.cod_barras like :filtro or'+
                             ' p.referencia like :filtro or'+
                             ' p.descricao like :filtro or'+
                             ' m.marca like :filtro or'+
                             ' g.grupo like :filtro)';
        sqlQuery  := sqlQuery + FiltroInativo+ FiltroProduto+ FiltroQuery;
      end
      else
      sqlQuery    := sqlQuery+ FiltroInativo +FiltroProduto;


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
        if dm.TabConsProduto.Active then
        begin
          dm.TabConsProduto.Close; // Feche o dataset se estiver ativo
        end;

        dm.TabConsProduto.disablecontrols;

        if dm.TabConsProduto.eof then
        begin
          dm.TabConsProduto.fieldDefs.clear;
          dm.TabConsProduto.FieldDefs.Add('id_produto', ftInteger);
          dm.TabConsProduto.FieldDefs.Add('codigo', ftInteger);
          dm.TabConsProduto.FieldDefs.Add('cod_barras',   ftString, 45);
          dm.TabConsProduto.FieldDefs.Add('referencia',   ftString, 50);
          dm.TabConsProduto.FieldDefs.Add('descricao',   ftString, 200);
          dm.TabConsProduto.FieldDefs.Add('servico',   ftString, 3);
          dm.TabConsProduto.FieldDefs.Add('prc_venda',   ftFloat);
          dm.TabConsProduto.FieldDefs.Add('estoque_atual',   ftFloat);
          dm.TabConsProduto.FieldDefs.Add('prc_promocao',   ftFloat);
          dm.TabConsProduto.FieldDefs.Add('marca',   ftString, 60);
          dm.TabConsProduto.FieldDefs.Add('grupo',   ftString, 60);
          dm.TabConsProduto.FieldDefs.Add('uni',   ftString, 5);
          dm.TabConsProduto.FieldDefs.Add('localizacao',   ftString, 60);


          //dm.TabConsProduto.fieldDefs.assign(Qry.FieldDefs);
          dm.TabConsProduto.createdataset;
        end
        else
        begin
          dm.TabConsProduto.EmptyDataSet;
        end;

        while not Qry.Eof do
        begin
          dm.TabConsProduto.Append;

            dm.TabConsProduto.FieldByName('id_produto').Value   := Qry.FieldByName('id_produto').Value;
            dm.TabConsProduto.FieldByName('codigo').Value       := Qry.FieldByName('codigo').Value;
            dm.TabConsProduto.FieldByName('cod_barras').Value   := Qry.FieldByName('cod_barras').Value;
            dm.TabConsProduto.FieldByName('referencia').Value   := Qry.FieldByName('referencia').Value;
            dm.TabConsProduto.FieldByName('descricao').Value    := Qry.FieldByName('descricao').Value;
            dm.TabConsProduto.FieldByName('servico').Value      := Qry.FieldByName('servico').Value;
            dm.TabConsProduto.FieldByName('prc_venda').Value    := Qry.FieldByName('prc_venda').Value;
            dm.TabConsProduto.FieldByName('estoque_atual').Value:= Qry.FieldByName('estoque_atual').Value;
            dm.TabConsProduto.FieldByName('prc_promocao').Value := Qry.FieldByName('prc_promocao').Value;
            dm.TabConsProduto.FieldByName('marca').Value        := Qry.FieldByName('marca').Value;
            dm.TabConsProduto.FieldByName('grupo').Value        := Qry.FieldByName('grupo').Value;
            dm.TabConsProduto.FieldByName('uni').Value          := Qry.FieldByName('uni').Value;
            dm.TabConsProduto.FieldByName('localizacao').Value  := Qry.FieldByName('localizacao').Value;


          dm.TabConsProduto.Post;
          Qry.Next;
        end;
        dm.TabConsProduto.First;
        dm.TabConsProduto.EnableControls;
        msg := 'Consulta realizada com sucesso';
        Result := True;
      end
      else
      begin
        dm.TabConsProduto.Close;
        msg := 'Nenhum registro encontrado!';
      end;
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

  {$ENDREGION}


{ TModelVeiculo }

  {$REGION 'Veiculo'}

function TModelVeiculo.Novo(out msg: String): Boolean;
var
Qry       : TUniquery;
sqlQuery  : string;
idGerado  : Integer;
sData     : String;
ModelGeral: TModelGeral;
begin
  Result    := False;
  Qry       := TUniquery.create(nil);
  ModelGeral:= TModelGeral.Create;
  sqlQuery  := 'Insert Into produto ('+
                  'id_produto,'+
                  'codigo,    '+
                  'id_marca,  '+
                  'id_grupo,  '+
                  'id_unidade,'+
                  'id_localizacao,'+
                  'id_empresa, '+
                  'cod_barras,'+
                  'referencia,'+
                  'tipo_produto, '+
                  'descricao,   '+
                  'descricao_fiscal, '+
                  'servico,   '+
                  'ativo,   '+
                  'prc_compra, '+
                  'per_custo,  '+
                  'prc_custo,  '+
                  'per_lucro,  '+
                  'prc_venda,  '+
                  'estoque_minimo, '+
                  'estoque_inicial, '+
                  'estoque_atual,  '+
                  'peso_kg,     '+
                  'prc_promocao, '+
                  'observacao,    '+
                  'avisos,        '+
                  'mostrar_app,   '+
                  'alterar_descricao,'+
                  'data_cadastro,   '+
                  'id_usuario,      '+
                  'excluido,         '+
                  'foto1,'+
                  'foto2,'+
                  'foto3,'+
                  'fracionado,'+
                  'controlaestoque,'+
                  'id_veiculo_especie,'+
                  'id_veiculo_modelo,'+
                  'veiculo_origem,'+
                  'veiculo_ano,'+
                  'veiculo_ano_modelo,'+
                  'veiculo_combustivel,'+
                  'veiculo_cambio,'+
                  'veiculo_cor,'+
                  'veiculo_porta,'+
                  'veiculo_km,'+
                  'veiculo_cv,'+
                  'veiculo_placa,'+
                  'veiculo_uf,'+
                  'veiculo_renavan,'+
                  'veiculo_chassi,'+
                  'veiculo_crv,'+
                  'veiculo_procuracao,'+
                  'veiculo_venc_procuracao,'+
                  'veiculo_fipe,'+
                  'veiculo_custototal,'+
                  'veiculo_valortroca,'+
                  'veiculo_lucro,'+
                  'veiculo_valorpraticado,'+
                  'veiculo_patiotaxames,'+
                  'veiculo_patiotaxadia,'+
                  'veiculo_patiototal,'+
                  'veiculo_comissaoljpercentual,'+
                  'veiculo_comissaoljtotal,'+
                  'veiculo_comissaovendpercentual,'+
                  'veiculo_comissaovendtotal,'+
                  'veiculo_patio_gerar,'+
                  'veiculo_data_hodometro,'+
                  'veiculo_numero_motor,'+
                  'veiculo_codigo_seguranca,'+
                  'veiculo_tipo_crv,'+
                  'veiculo_ipvapago,'+
                  'veiculo_intencaovenda,'+
                  'veiculo_placamercosul,'+
                  'veiculo_licpago,'+
                  'veiculo_taxabombeiro,'+
                  'veiculo_financiamentoativo'+


                  ')'+
                  ' Values'+
                  '(  '+
                  ':idproduto,'+
                  ':codigo,    '+
                  ':idmarca,  '+
                  ':idgrupo,  '+
                  ':idunidade,'+
                  ':idlocalizacao,'+
                  ':idempresa, '+
                  'null,'+
                  'null,'+
                  ':tipoproduto, '+
                  ':descricao,   '+
                  ':descricaofiscal, '+
                  ':servico,   '+
                  ':ativo,   '+
                  ':prccompra, '+
                  ':percusto,  '+
                  ':prccusto,  '+
                  ':perlucro,  '+
                  ':prcvenda,  '+
                  ':estoqueminimo, '+
                  ':estoqueinicial, '+
                  ':estoqueatual,  '+
                  ':pesokg,     '+
                  ':prcpromocao, '+
                  ':observacao,    '+
                  ':avisos,        '+
                  ':mostrarapp,   '+
                  ':alterardescricao,'+
                  ':datacadastro,   '+
                  ':idusuario,      '+
                  ':excluido,         '+
                  ':foto1,'+
                  ':foto2,'+
                  ':foto3,'+
                  ':fracionado,'+
                  ':controlaestoque,'+
                  ':idveiculoespecie,'+
                  ':idveiculomodelo,'+
                  ':veiculoorigem,'+
                  ':veiculoano,'+
                  ':veiculoanomodelo,'+
                  ':veiculocombustivel,'+
                  ':veiculocambio,'+
                  ':veiculocor,'+
                  ':veiculoporta,'+
                  ':veiculokm,'+
                  ':veiculocv,'+
                  ':veiculoplaca,'+
                  ':veiculouf,'+
                  ':veiculorenavan,'+
                  ':veiculochassi,'+
                  ':veiculocrv,'+
                  ':veiculoprocuracao,'+
                  ':veiculovencprocuracao,'+
                  ':veiculofipe,'+
                  ':veiculocustototal,'+
                  ':veiculovalortroca,'+
                  ':veiculolucro,'+
                  ':veiculovalorpraticado,'+
                  ':veiculopatiotaxames,'+
                  ':veiculopatiotaxadia,'+
                  ':veiculopatiototal,'+
                  ':veiculocomissaoljpercentual,'+
                  ':veiculocomissaoljtotal,'+
                  ':veiculocomissaovendpercentual,'+
                  ':veiculocomissaovendtotal,'+
                  ':veiculopatiogerar,'+
                  ':veiculodatahodometro,'+
                  ':veiculonumeromotor,'+
                  ':veiculocodigoseguranca,'+
                  ':veiculotipocrv,'+
                  ':veiculoipvapago,'+
                  ':veiculointencaovenda,'+
                  ':veiculoplacamercosul,'+
                  ':veiculolicpago,'+
                  ':veiculotaxabombeiro,'+
                  ':veiculofinanciamentoativo'+
                  ')';
  Try
    Try
      Qry.Connection := dm.Conn;

      With Qry do
      begin
        Params.Clear;
        Qry.SQL.Text := sqlQuery;
        IniciarTransacao;

        idGerado                                       := GerarId('produto', 'id_produto');

        Qry.ParamByName('idproduto').Asinteger         := idgerado;
        Qry.ParamByName('codigo').Asinteger            := GerarId('produto', 'codigo');
        Qry.ParamByName('idmarca').Asinteger           := idmarca;
        Qry.ParamByName('idgrupo').Asinteger           := idgrupo;
        Qry.ParamByName('idunidade').Asinteger         := idunidade;
        Qry.ParamByName('idlocalizacao').Asinteger     := idlocalizacao;
        Qry.ParamByName('idempresa').Asinteger         := idempresa;
        Qry.ParamByName('tipoproduto').Asstring        := tipoproduto;
        Qry.ParamByName('descricao').Asstring          := Trim(descricao);
        Qry.ParamByName('descricaofiscal').Asstring    := trim(desfiscal);
        Qry.ParamByName('servico').Asstring            := servico;
        Qry.ParamByName('ativo').Asstring              := inativo;
        Qry.ParamByName('prccompra').Asfloat           := (prccompra);
        Qry.ParamByName('percusto').Asfloat            := (percusto);
        Qry.ParamByName('prccusto').Asfloat            := (prccusto);
        Qry.ParamByName('perlucro').Asfloat            := (perlucro);
        Qry.ParamByName('prcvenda').Asfloat            := (prcvenda);
        Qry.ParamByName('estoqueminimo').Asfloat       := estoqueminimo;
        Qry.ParamByName('estoqueinicial').Asfloat      := estoqueinicial;//sera usando para atacado
        Qry.ParamByName('estoqueatual').Asfloat        := estoqueatual;
        Qry.ParamByName('pesokg').Asfloat              := pesokg;
        Qry.ParamByName('prcpromocao').Asfloat         := (prcpromocao);
        Qry.ParamByName('observacao').Asstring         := Trim(obs);
        Qry.ParamByName('avisos').Asstring             := Trim(aviso);
        Qry.ParamByName('mostrarapp').Asstring         := mostrarapp;
        Qry.ParamByName('alterardescricao').Asstring   := altedescricao;
        Qry.ParamByName('datacadastro').AsDateTime     := now;
        Qry.ParamByName('idusuario').Asinteger         := idusuario;
        Qry.ParamByName('excluido').Asinteger          := 0;

        if foto1<> '' then
        Qry.ParamByName('foto1').AsString              := foto1
        else
        Qry.ParamByName('foto1').IsNull;

        if foto2 <> '' then
        Qry.ParamByName('foto2').AsString              := foto2
        else
        Qry.ParamByName('foto2').IsNull;

        if foto3 <> '' then
        Qry.ParamByName('foto3').AsString              := foto3
        else
        Qry.ParamByName('foto3').IsNull;

        Qry.ParamByName('fracionado').Asstring         := fracionado;
        qry.ParamByName('controlaestoque').AsString    := controlaestoque;

        qry.ParamByName('idveiculoespecie').AsInteger  := idespecie;
        qry.ParamByName('idveiculomodelo').AsInteger   := idmodelo;
        qry.ParamByName('veiculoorigem').AsString      := origem;
        qry.ParamByName('veiculoano').AsString         := ano;
        qry.ParamByName('veiculoanomodelo').AsString   := anomodelo;
        qry.ParamByName('veiculocombustivel').AsString := combustivel;
        qry.ParamByName('veiculocambio').AsString      := cambio;
        qry.ParamByName('veiculocor').AsString         := cor;
        qry.ParamByName('veiculoporta').AsInteger      := porta;
        qry.ParamByName('veiculokm').AsString          := km;
        qry.ParamByName('veiculocv').AsString          := cv;
        qry.ParamByName('veiculoplaca').AsString       := placa;
        qry.ParamByName('veiculouf').AsString          := uf;
        qry.ParamByName('veiculorenavan').AsString     := renavan;
        qry.ParamByName('veiculochassi').AsString      := chassi;
        qry.ParamByName('veiculocrv').AsString         := crv;
        qry.ParamByName('veiculoprocuracao').AsString  := procuracao;

        sData := datetostr(vencprocuracao);

        if sData = '00/00/0000'  then
        qry.ParamByName('veiculovencprocuracao').IsNull
        else
        qry.ParamByName('veiculovencprocuracao').AsDateTime := vencprocuracao;

        qry.ParamByName('veiculofipe').AsFloat                  := veiculofipe;
        qry.ParamByName('veiculocustototal').AsFloat            := veiculocustototal;
        qry.ParamByName('veiculovalortroca').AsFloat            := veiculovalortroca;
        qry.ParamByName('veiculolucro').AsFloat                 := veiculolucro;
        qry.ParamByName('veiculovalorpraticado').AsFloat        := veiculovalorpraticado;
        qry.ParamByName('veiculopatiotaxames').AsFloat          := veiculopatiotaxames;
        qry.ParamByName('veiculopatiotaxadia').AsFloat          := veiculopatiotaxadia;
        qry.ParamByName('veiculopatiototal').AsFloat            := veiculopatiototal;
        qry.ParamByName('veiculocomissaoljpercentual').AsFloat  := veiculocomissaoljpercentual;
        qry.ParamByName('veiculocomissaoljtotal').AsFloat       := veiculocomissaoljtotal;
        qry.ParamByName('veiculocomissaovendpercentual').AsFloat:= veiculocomissaovendpercentual;
        qry.ParamByName('veiculocomissaovendtotal').AsFloat     := veiculocomissaovendtotal;
        qry.ParamByName('veiculopatiogerar').AsString           := veiculopatiogerar;

        sData := datetostr(veiculodatahodometro);
        if sData = '00/00/0000' then
        qry.ParamByName('veiculodatahodometro').IsNull
        else
        qry.ParamByName('veiculodatahodometro').AsDateTime      := veiculodatahodometro;
        qry.ParamByName('veiculonumeromotor').AsString          := veiculonumeromotor;
        qry.ParamByName('veiculocodigoseguranca').AsString      := trim(veiculocodigoseguranca);
        qry.ParamByName('veiculotipocrv').AsString              := veiculotipocrv;

        qry.ParamByName('veiculoipvaPago').AsString             := veiculoipvaPago;
        qry.ParamByName('veiculointencaovenda').AsString        := veiculointencaovenda;
        qry.ParamByName('veiculoplacamercosul').AsString        := veiculoplacamercosul;
        qry.ParamByName('veiculolicpago').AsString              := veiculolicpago;
        qry.ParamByName('veiculotaxabombeiro').AsString         := veiculotaxabombeiro;
        qry.ParamByName('veiculofinanciamentoativo').AsString   := veiculofinanciamentoativo;


        Try
          Qry.ExecSQL;
          ConfirmarTransacao;
          ModelGeral.GravarHistoricoProdutoVeiculo(idGerado, idusuario, idempresa,0, 'Cadastro Novo');
          result  := true;
          msg     := 'Registro realizado com sucesso';
        Except on e:exception do
          begin
            DesfazerTransacao;
            raise Exception.Create('Erro ao inserir veículo: ' + e.Message);
          end;
        end;

        // Validar para estoque
        if not InserirEstoque(idGerado,idempresa,0) then

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
    FreeAndNil(ModelGeral);
  End;
end;

function TModelVeiculo.Excluir(out msg: string; i:integer): Boolean;
var
  Qry: TUniQuery;
  ModelGeral: TModelGeral;
Const
  sqlQuery = 'Update produto set excluido=1, ativo=''N'' where id_produto= :id';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  ModelGeral:= TModelGeral.Create;
  try
    try
      Qry.Connection                      := dm.Conn;
      Qry.Close;
      Qry.SQL.Text                        := sqlQuery;
      IniciarTransacao;
      Qry.ParamByName('id').AsInteger     := i;

      Try
        Qry.ExecSQL;
        ConfirmarTransacao;
        Result  := True;
        msg := 'Registro deletado com sucesso';
        ModelGeral.GravarHistoricoProdutoVeiculo(i, idusuario, idempresa,0, 'Registro excluido');
      Except on e:exception do
        begin
          DesfazerTransacao;
          msg := 'Erro ao excluir:' +e.message;
          raise;
        end;
      End;

    except
      on E: Exception do
      begin
        msg := 'Erro ao conexão: ' + E.Message;
        raise;
      end;
    end;

  finally
    ModelGeral.free;
    Qry.Free;
  end;
end;

function TModelVeiculo.PesquisaVeiculo(out msg: string; Filtro1, Filtro2,
  Filtro3: integer; FiltroStr: String): Boolean;
var
  Qry: TUniQuery;
  sqlQuery, sqlOrdem, sqlCampo, SqlStatus, SqlEstoque, SqlTipo: string;
begin
  Result  := False;

  sqlQuery  := 'Select p.id_produto, p.codigo, p.veiculo_placa as placa, p.descricao, p.descricao_fiscal, COALESCE(p.prc_venda,0) as prc_venda, '+
                ' COALESCE(p.veiculo_fipe,0) as veiculo_fipe, COALESCE(p.veiculo_lucro,0) as veiculo_lucro, COALESCE(p.veiculo_custototal,0) as veiculo_custototal,'+
                ' concat(p.veiculo_ano,''/'',p.veiculo_ano_modelo) as nmanomodelo, '+
                ' case when p.estoque_atual =1 then ''SIM'' else ''NÃO'' end as estoque,'+
                ' case when p.foto1 is not null and p.foto1 <> '''' then ''SIM'' else ''NÃO'' end as nmtemfoto,  '+
                ' vm.descricao as nmmodelo, l.localizacao as nmlocalizacao'+
                ' from produto p '+
                ' inner join veiculo_modelo vm'+
                ' on p.id_veiculo_modelo = vm.id_veiculo_modelo'+
                ' inner join localizacao l'+
                ' on p.id_localizacao = l.id_localizacao'+
                ' where p.id_produto >0 and p.id_veiculo_especie >0';

  sqlOrdem  := ' order by p.veiculo_placa';

  case Filtro1 of
    1:SqlStatus   := ' and p.ativo=''S''';
    2:SqlStatus   := ' and p.ativo=''N''';
  end;

  case Filtro2 of
    1:SqlEstoque  := ' and p.estoque_atual >= 1 ';
    2:SqlEstoque  := ' and p.estoque_atual = 0 ';
  end;

  case Filtro3 of
    1:SqlTipo     := ' and p.tipo_produto=''CONSIGNADO'' ';
    2:SqlTipo     := ' and p.tipo_produto=''CONSIGNADO LOJA'' ';
    3:SqlTipo     := ' and p.tipo_produto=''PRÓPRIO'' ';
    4:SqlTipo     := ' and p.tipo_produto=''REFINANCIAMENTO'' ';
    5:SqlTipo     := ' and p.tipo_produto=''REPASSE'' ';
    6:SqlTipo     := ' and p.tipo_produto=''ZERO'' ';
  end;

  if FiltroStr <>'' then
  begin
    sqlCampo  := sqlCampo + ' and (p.codigo= :filtro  '+
                              ' or p.descricao like :filtro or '+
                              ' p.descricao_fiscal like :filtro or'+
                              ' p.veiculo_placa like :filtro or '+
                              ' p.veiculo_ano like :filtro or '+
                              ' p.veiculo_ano_modelo like :filtro '+
                              '                      )';
    sqlQuery  := sqlQuery + sqlCampo + SqlStatus + SqlEstoque + SqlTipo + sqlOrdem;
  end
  else
    sqlQuery  := sqlQuery + SqlStatus + SqlEstoque + SqlTipo + sqlOrdem;

  Qry       := TUniQuery.Create(nil);
  Try
    Qry.SQL.Clear;
    Qry.Connection    := dm.Conn;
    Qry.SQL.Text      := sqlQuery;

    if FiltroStr <>'' then
    Qry.Params.ParamByName('filtro').AsString         := Trim(FiltroStr);

    try
      Qry.Open;

      if dm.TabConsultaVeiculo.Active then
      begin
        dm.TabConsultaVeiculo.EmptyDataSet;
      end
      else
      begin
        dm.TabConsultaVeiculo.Open;
        dm.TabConsultaVeiculo.EmptyDataSet;
      end;

      if not qry.IsEmpty then
      begin
        Result  := True;
        msg     := 'Pesquisa realizada com sucesso!';

        Qry.First;
        dm.TabConsultaVeiculo.DisableControls;

        while not Qry.Eof do
        begin
          dm.TabConsultaVeiculo.Append;

          dm.TabConsultaVeiculoplaca.AsString             := trim(Qry.FieldByName('placa').AsString);
          dm.TabConsultaVeiculodescricao.AsString         := trim(Qry.FieldByName('descricao').AsString);
          dm.TabConsultaVeiculodescricao_fiscal.AsString  := trim(Qry.FieldByName('descricao_fiscal').AsString);
          dm.TabConsultaVeiculoprc_venda.AsFloat          := Qry.FieldByName('prc_venda').AsFloat;
          dm.TabConsultaVeiculoveiculo_fipe.AsFloat       := Qry.FieldByName('veiculo_fipe').AsFloat;
          dm.TabConsultaVeiculoveiculo_lucro.AsFloat      := Qry.FieldByName('veiculo_lucro').AsFloat;
          dm.TabConsultaVeiculoveiculo_custototal.AsFloat := Qry.FieldByName('veiculo_custototal').AsFloat;
          dm.TabConsultaVeiculoestoque.AsString           := Qry.FieldByName('estoque').asstring;
          dm.TabConsultaVeiculonmmodelo.AsString          := trim(Qry.FieldByName('nmmodelo').AsString);
          dm.TabConsultaVeiculolocal.AsString             := trim(Qry.FieldByName('nmlocalizacao').AsString);
          dm.TabConsultaveiculoid_veiculo.AsInteger       := Qry.FieldByName('id_produto').AsInteger;
          dm.TabConsultaVeiculoanomodelo.AsString         := Qry.FieldByName('nmanomodelo').AsString;
          dm.TabConsultaVeiculocodigo.AsInteger           := Qry.FieldByName('codigo').AsInteger;
          dm.TabConsultaVeiculotemfoto.asstring           := Qry.FieldByName('nmtemfoto').AsString;
          dm.TabConsultaVeiculotemanexo.asstring          := 'NÃO';//Qry.FieldByName('nmtemfoto').AsString;
          dm.TabConsultaVeiculo.Post;
          Qry.Next;
        end;

        dm.TabConsultaVeiculo.First;
        dm.TabConsultaVeiculo.EnableControls;
      end
      else
      msg := 'Nenhum registro encontrado!';

    except on e:exception do
      begin
        msg := 'Erro ao executar consulta: ' + E.Message;
        raise;
      end;
    end;
  Finally
    FreeAndNil(Qry);
  End;
end;

function TModelVeiculo.SelecionarEditar(out msg: string;id:integer): Boolean;
var
  Qry: TUniQuery;
const
  sqlQuery  = 'SELECT                           '+
              'id_produto,                      '+
              'codigo,                          '+
              'id_marca,                        '+
              'id_grupo,                        '+
              'id_localizacao,                  '+
              'id_empresa,                      '+
              'tipo_produto,                    '+
              'descricao,                       '+
              'descricao_fiscal,                '+
              'servico,                         '+
              'ativo,                           '+
              'prc_compra,                      '+
              'per_custo,                       '+
              'prc_custo,                       '+
              'per_lucro,                       '+
              'prc_venda,                       '+
              'estoque_atual,                   '+
              'observacao,                      '+
              'avisos,                          '+
              'mostrar_app,                     '+
              'foto1,                           '+
              'controlaestoque,                 '+
              'id_veiculo_especie,              '+
              'id_veiculo_modelo,               '+
              'veiculo_origem,                  '+
              'veiculo_ano,                     '+
              'veiculo_ano_modelo,              '+
              'veiculo_combustivel,             '+
              'veiculo_cambio,                  '+
              'veiculo_cor,                     '+
              'veiculo_porta,                   '+
              'veiculo_km,                      '+
              'veiculo_cv,                      '+
              'veiculo_placa,                   '+
              'veiculo_uf,                      '+
              'veiculo_renavan,                 '+
              'veiculo_chassi,                  '+
              'veiculo_crv,                     '+
              'veiculo_procuracao,              '+
              'veiculo_venc_procuracao,         '+
              'veiculo_fipe,                    '+
              'veiculo_custototal,              '+
              'veiculo_valortroca,              '+
              'veiculo_lucro,                   '+
              'veiculo_valorpraticado,          '+
              'veiculo_patiotaxames,            '+
              'veiculo_patiotaxadia,            '+
              'veiculo_patiototal,              '+
              'veiculo_comissaoljpercentual,    '+
              'veiculo_comissaoljtotal,         '+
              'veiculo_comissaovendpercentual,  '+
              'veiculo_comissaovendtotal,       '+
              'veiculo_patio_gerar,             '+
              'veiculo_data_hodometro,          '+
              'veiculo_numero_motor,            '+
              'veiculo_codigo_seguranca,        '+
              'veiculo_tipo_crv,                '+
              'veiculo_ipvapago,                '+
              'veiculo_intencaovenda,           '+
              'veiculo_placamercosul,           '+
              'veiculo_licpago,                 '+
              'veiculo_taxabombeiro,            '+
              'veiculo_financiamentoativo       '+
              ' FROM                            '+
              ' produto                         '+
              ' WHERE id_produto= :id           ';

begin
  Result  := False;


  Qry       := TUniQuery.Create(nil);
  Try
    Qry.Connection                            := dm.Conn;
    Qry.SQL.Text                              := sqlQuery;
    Qry.params.parambyname('id').asinteger    := id;

    try
      Qry.Open;

      if not qry.IsEmpty then
      begin
        Result  := True;
        msg     := 'Pesquisa realizada com sucesso!';

        idProduto                      := qry.FieldByName('id_produto').AsInteger;
        idmarca                        := qry.FieldByName('id_marca').AsInteger;
        idgrupo                        := qry.FieldByName('id_grupo').AsInteger;
        idlocalizacao                  := qry.FieldByName('id_localizacao').AsInteger;
        tipoproduto                    := qry.FieldByName('tipo_produto').AsString;
        descricao                      := qry.FieldByName('descricao').AsString;
        desfiscal                      := qry.FieldByName('descricao_fiscal').AsString;
        inativo                        := qry.FieldByName('ativo').AsString;
        prccompra                      := qry.FieldByName('prc_compra').AsFloat;
        percusto                       := qry.FieldByName('per_custo').AsFloat;
        prccusto                       := qry.FieldByName('prc_custo').AsFloat;
        perlucro                       := qry.FieldByName('per_lucro').AsFloat;
        prcvenda                       := qry.FieldByName('prc_venda').AsFloat;
        estoqueatual                   := qry.FieldByName('estoque_atual').AsFloat;
        obs                            := qry.FieldByName('observacao').AsString;
        aviso                          := qry.FieldByName('avisos').AsString;
        mostrarapp                     := qry.FieldByName('mostrar_app').AsString;
        foto1                          := qry.FieldByName('foto1').AsString;
        controlaestoque                := qry.FieldByName('controlaestoque').AsString;
        idespecie                      := qry.FieldByName('id_veiculo_especie').AsInteger;
        idmodelo                       := qry.FieldByName('id_veiculo_modelo').AsInteger;
        origem                         := qry.FieldByName('veiculo_origem').AsString;
        ano                            := qry.FieldByName('veiculo_ano').AsString;
        anomodelo                      := qry.FieldByName('veiculo_ano_modelo').AsString;
        combustivel                    := qry.FieldByName('veiculo_combustivel').AsString;
        cambio                         := qry.FieldByName('veiculo_cambio').AsString;
        cor                            := qry.FieldByName('veiculo_cor').AsString;
        porta                          := qry.FieldByName('veiculo_porta').AsInteger;
        km                             := qry.FieldByName('veiculo_km').AsString;
        cv                             := qry.FieldByName('veiculo_cv').AsString;
        placa                          := qry.FieldByName('veiculo_placa').AsString;
        uf                             := qry.FieldByName('veiculo_uf').AsString;
        renavan                        := qry.FieldByName('veiculo_renavan').AsString;
        chassi                         := qry.FieldByName('veiculo_chassi').AsString;
        crv                            := qry.FieldByName('veiculo_crv').AsString;
        procuracao                     := qry.FieldByName('veiculo_procuracao').AsString;
        vencprocuracao                 := qry.FieldByName('veiculo_venc_procuracao').AsDateTime;
        veiculofipe                    := qry.FieldByName('veiculo_fipe').AsFloat;
        veiculocustototal              := qry.FieldByName('veiculo_custototal').AsFloat;
        veiculovalortroca              := qry.FieldByName('veiculo_valortroca').AsFloat;
        veiculolucro                   := qry.FieldByName('veiculo_lucro').AsFloat;
        veiculovalorpraticado          := qry.FieldByName('veiculo_valorpraticado').AsFloat;
        veiculopatiotaxames            := qry.FieldByName('veiculo_patiotaxames').AsFloat;
        veiculopatiotaxadia            := qry.FieldByName('veiculo_patiotaxadia').AsFloat;
        veiculopatiototal              := qry.FieldByName('veiculo_patiototal').AsFloat;
        veiculocomissaoljpercentual    := qry.FieldByName('veiculo_comissaoljpercentual').AsFloat;
        veiculocomissaoljtotal         := qry.FieldByName('veiculo_comissaoljtotal').AsFloat;
        veiculocomissaovendpercentual  := qry.FieldByName('veiculo_comissaovendpercentual').AsFloat;
        veiculocomissaovendtotal       := qry.FieldByName('veiculo_comissaovendtotal').AsFloat;
        veiculopatiogerar              := qry.FieldByName('veiculo_patio_gerar').AsString;
        veiculodatahodometro           := qry.FieldByName('veiculo_data_hodometro').AsDateTime;
        veiculonumeromotor             := qry.FieldByName('veiculo_numero_motor').AsString;
        veiculocodigoseguranca         := qry.FieldByName('veiculo_codigo_seguranca').AsString;
        veiculotipocrv                 := qry.FieldByName('veiculo_tipo_crv').AsString;
        veiculoipvaPago                := qry.FieldByName('veiculo_ipvapago').AsString;
        veiculointencaovenda           := qry.FieldByName('veiculo_intencaovenda').AsString;
        veiculoplacamercosul           := qry.FieldByName('veiculo_placamercosul').AsString;
        veiculolicpago                 := qry.FieldByName('veiculo_licpago').AsString;
        veiculotaxabombeiro            := qry.FieldByName('veiculo_taxabombeiro').AsString;
        veiculofinanciamentoativo      := qry.FieldByName('veiculo_financiamentoativo').AsString;

        
      end
      else
      msg := 'Nenhum registro encontrado!';

    except on e:exception do
      begin
        msg := 'Erro ao executar consulta: ' + E.Message;
        raise;
      end;
    end;
  Finally
    FreeAndNil(Qry);
  End;
end;

Function TModelVeiculo.SalvarAlteracoes(out msg:String):Boolean;
var
Qry       : TUniquery;
sData     : String;
ModelGeral:Tmodelgeral;
Const
  QryStr  = 'UPDATE produto SET   ' +
            'id_marca = :idmarca, ' +
            'id_grupo = :idgrupo, ' +
            'id_localizacao = :idlocalizacao, ' +
            'tipo_produto = :tipoproduto, ' +
            'descricao = :descricao, ' +
            'descricao_fiscal = :descricaofiscal, ' +
            'ativo = :ativo, ' +
            'prc_compra = :prccompra, ' +
            'per_custo = :percusto, ' +
            'prc_custo = :prccusto, ' +
            'per_lucro = :perlucro, ' +
            'prc_venda = :prcvenda, ' +
            'observacao = :observacao, ' +
            'avisos = :avisos, ' +
            'mostrar_app = :mostrarapp, ' +
            'data_alteracao= :dataalteracao,'+
            'id_usuario_alt= :idusuarioalt,'+
            'foto1 = :foto1, ' +
            'controlaestoque = :controlaestoque, ' +
            'id_veiculo_especie = :idveiculoespecie, ' +
            'id_veiculo_modelo = :idveiculomodelo, ' +
            'veiculo_origem = :veiculoorigem, ' +
            'veiculo_ano = :veiculoano, ' +
            'veiculo_ano_modelo = :veiculoanomodelo, ' +
            'veiculo_combustivel = :veiculocombustivel, ' +
            'veiculo_cambio = :veiculocambio, ' +
            'veiculo_cor = :veiculocor, ' +
            'veiculo_porta = :veiculoporta, ' +
            'veiculo_km = :veiculokm, ' +
            'veiculo_cv = :veiculocv, ' +
            'veiculo_placa = :veiculoplaca, ' +
            'veiculo_uf = :veiculouf, ' +
            'veiculo_renavan = :veiculorenavan, ' +
            'veiculo_chassi = :veiculochassi, ' +
            'veiculo_crv = :veiculocrv, ' +
            'veiculo_procuracao = :veiculoprocuracao, ' +
            'veiculo_venc_procuracao = :veiculovencprocuracao, ' +
            'veiculo_fipe = :veiculofipe, ' +
            'veiculo_custototal = :veiculocustototal, ' +
            'veiculo_valortroca = :veiculovalortroca, ' +
            'veiculo_lucro = :veiculolucro, ' +
            'veiculo_valorpraticado = :veiculovalorpraticado, ' +
            'veiculo_patiotaxames = :veiculopatiotaxames, ' +
            'veiculo_patiotaxadia = :veiculopatiotaxadia, ' +
            'veiculo_patiototal = :veiculopatiototal, ' +
            'veiculo_comissaoljpercentual = :veiculocomissaoljpercentual, ' +
            'veiculo_comissaoljtotal = :veiculocomissaoljtotal, ' +
            'veiculo_comissaovendpercentual = :veiculocomissaovendpercentual, ' +
            'veiculo_comissaovendtotal = :veiculocomissaovendtotal, ' +
            'veiculo_patio_gerar = :veiculopatiogerar, ' +
            'veiculo_data_hodometro = :veiculodatahodometro, ' +
            'veiculo_numero_motor = :veiculonumeromotor, ' +
            'veiculo_codigo_seguranca = :veiculocodigoseguranca, ' +
            'veiculo_tipo_crv = :veiculotipocrv, ' +
            'veiculo_ipvapago = :veiculoipvapago, ' +
            'veiculo_intencaovenda = :veiculointencaovenda, ' +
            'veiculo_placamercosul = :veiculoplacamercosul, ' +
            'veiculo_licpago = :veiculolicpago, ' +
            'veiculo_taxabombeiro = :veiculotaxabombeiro, ' +
            'veiculo_financiamentoativo = :veiculofinanciamentoativo ' +
            'WHERE id_produto = :idproduto';


begin
  Result    := False;
  Qry       := TUniquery.create(nil);
  ModelGeral:=Tmodelgeral.create;
  Try
    Try
      Qry.Connection := dm.Conn;

      With Qry do
      begin
        Params.Clear;
        Qry.SQL.Text := QryStr;
        IniciarTransacao;

        Qry.ParamByName('idmarca').Asinteger           := idmarca;
        Qry.ParamByName('idgrupo').Asinteger           := idgrupo;
        Qry.ParamByName('idlocalizacao').Asinteger     := idlocalizacao;
        Qry.ParamByName('tipoproduto').Asstring        := tipoproduto;
        Qry.ParamByName('descricao').Asstring          := Trim(descricao);
        Qry.ParamByName('descricaofiscal').Asstring    := trim(desfiscal);
        Qry.ParamByName('ativo').Asstring              := inativo;
        Qry.ParamByName('prccompra').Asfloat           := (prccompra);
        Qry.ParamByName('percusto').Asfloat            := (percusto);
        Qry.ParamByName('prccusto').Asfloat            := (prccusto);
        Qry.ParamByName('perlucro').Asfloat            := (perlucro);
        Qry.ParamByName('prcvenda').Asfloat            := (prcvenda);
        Qry.ParamByName('observacao').Asstring         := Trim(obs);
        Qry.ParamByName('avisos').Asstring             := Trim(aviso);
        Qry.ParamByName('mostrarapp').Asstring         := mostrarapp;
        Qry.ParamByName('dataalteracao').AsDateTime    := now;
        Qry.ParamByName('idusuarioalt').Asinteger      := idusuario;
        if foto1<> '' then
        Qry.ParamByName('foto1').AsString              := foto1
        else
        Qry.ParamByName('foto1').IsNull;
        qry.ParamByName('controlaestoque').AsString    := controlaestoque;
        qry.ParamByName('idveiculoespecie').AsInteger  := idespecie;
        qry.ParamByName('idveiculomodelo').AsInteger   := idmodelo;
        qry.ParamByName('veiculoorigem').AsString      := origem;
        qry.ParamByName('veiculoano').AsString         := ano;
        qry.ParamByName('veiculoanomodelo').AsString   := anomodelo;
        qry.ParamByName('veiculocombustivel').AsString := combustivel;
        qry.ParamByName('veiculocambio').AsString      := cambio;
        qry.ParamByName('veiculocor').AsString         := cor;
        qry.ParamByName('veiculoporta').AsInteger      := porta;
        qry.ParamByName('veiculokm').AsString          := km;
        qry.ParamByName('veiculocv').AsString          := cv;
        qry.ParamByName('veiculoplaca').AsString       := placa;
        qry.ParamByName('veiculouf').AsString          := uf;
        qry.ParamByName('veiculorenavan').AsString     := renavan;
        qry.ParamByName('veiculochassi').AsString      := chassi;
        qry.ParamByName('veiculocrv').AsString         := crv;
        qry.ParamByName('veiculoprocuracao').AsString  := procuracao;
        sData := datetostr(vencprocuracao);
        if sData = '00/00/0000'  then
        qry.ParamByName('veiculovencprocuracao').IsNull
        else
        qry.ParamByName('veiculovencprocuracao').AsDateTime := vencprocuracao;
        qry.ParamByName('veiculofipe').AsFloat                  := veiculofipe;
        qry.ParamByName('veiculocustototal').AsFloat            := veiculocustototal;
        qry.ParamByName('veiculovalortroca').AsFloat            := veiculovalortroca;
        qry.ParamByName('veiculolucro').AsFloat                 := veiculolucro;
        qry.ParamByName('veiculovalorpraticado').AsFloat        := veiculovalorpraticado;
        qry.ParamByName('veiculopatiotaxames').AsFloat          := veiculopatiotaxames;
        qry.ParamByName('veiculopatiotaxadia').AsFloat          := veiculopatiotaxadia;
        qry.ParamByName('veiculopatiototal').AsFloat            := veiculopatiototal;
        qry.ParamByName('veiculocomissaoljpercentual').AsFloat  := veiculocomissaoljpercentual;
        qry.ParamByName('veiculocomissaoljtotal').AsFloat       := veiculocomissaoljtotal;
        qry.ParamByName('veiculocomissaovendpercentual').AsFloat:= veiculocomissaovendpercentual;
        qry.ParamByName('veiculocomissaovendtotal').AsFloat     := veiculocomissaovendtotal;
        qry.ParamByName('veiculopatiogerar').AsString           := veiculopatiogerar;
        sData := datetostr(veiculodatahodometro);
        if sData = '00/00/0000' then
        qry.ParamByName('veiculodatahodometro').IsNull
        else
        qry.ParamByName('veiculodatahodometro').AsDateTime      := veiculodatahodometro;
        qry.ParamByName('veiculonumeromotor').AsString          := veiculonumeromotor;
        qry.ParamByName('veiculocodigoseguranca').AsString      := veiculocodigoseguranca;
        qry.ParamByName('veiculotipocrv').AsString              := veiculotipocrv;

        qry.ParamByName('veiculoipvaPago').AsString             := veiculoipvaPago;
        qry.ParamByName('veiculointencaovenda').AsString        := veiculointencaovenda;
        qry.ParamByName('veiculoplacamercosul').AsString        := veiculoplacamercosul;
        qry.ParamByName('veiculolicpago').AsString              := veiculolicpago;
        qry.ParamByName('veiculotaxabombeiro').AsString         := veiculotaxabombeiro;
        qry.ParamByName('veiculofinanciamentoativo').AsString   := veiculofinanciamentoativo;
        Qry.ParamByName('idproduto').Asinteger                  := idproduto;


        Try
          Qry.ExecSQL;
          ConfirmarTransacao;
          ModelGeral.GravarHistoricoProdutoVeiculo(idproduto, idusuario, idempresa,0, 'Cadastro Alterado');
          result  := true;
          msg     := 'Registro realizado com sucesso';
        Except on e:exception do
          begin
            DesfazerTransacao;
            raise Exception.Create('Erro ao salvar alteração do veículo: ' + e.Message);
          end;
        end;

      end;

    Except on e:exception do
      begin
        DesfazerTransacao;
        msg := 'Erro ao salvar:' +e.message;
        raise;
      end;
    End;

  Finally
    ModelGeral.free;
    FreeAndNil(Qry);
  End;
end;


  {$REGION 'Foto Veiculo'}

Function TModelVeiculo.GravarFotoVeiculo(out idretfoto:integer; base64,url,formato:String):Boolean;
var
  Qry    : TUniquery;
Const
  Sqlstr = 'Insert into veiculo_foto(id_foto, id_veiculo, id_empresa, base64, url, formato,sinc_app)'+
                                    'Values(:0, :1,:2,:3,:4,:5,''S'')';
begin
  Result    := False;
  Qry       := TUniquery.Create(nil);

  Try
      Qry.Connection    := DM.Conn;
      Qry.SQL.Text      := Sqlstr;
      IniciarTransacao;
      idretfoto                                := GerarId('veiculo_foto', 'id_foto');
      qry.Params.ParamByName('0').AsInteger    := idretfoto;
      qry.Params.ParamByName('1').AsInteger    := idproduto;
      qry.Params.ParamByName('2').AsInteger    := idempresa;
      qry.Params.ParamByName('3').Asstring     := Base64;
      qry.Params.ParamByName('4').Asstring     := url;
      qry.Params.ParamByName('5').Asstring     := formato;
      try
        Qry.ExecSQL;
        ConfirmarTransacao;
        result  := True;
      Except on e:exception do
        begin
          DesfazerTransacao;
          raise Exception.Create('Erro ao gravar foto: '+e.Message);
        end;
      End;

  Finally
    FreeandNil(Qry);
  End;
end;

Function TModelVeiculo.CarregardadosVeiculoFoto(out rcodigo:integer; out rdescricao, rplaca:String; out rprcvenda, rvlrfipe: double; idveic:integer):Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'Select codigo, descricao_fiscal, prc_venda, veiculo_placa, veiculo_fipe from produto where id_produto= :id';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection                          := dm.Conn;
      Qry.SQL.Text                            := QryStr;
      Qry.Params.ParamByName('id').AsInteger  := idveic;

      Qry.Open;
      if not Qry.IsEmpty then
      begin
        rcodigo        := Qry.Fieldbyname('codigo').AsInteger;
        rdescricao     := Qry.Fieldbyname('descricao_fiscal').AsString;
        rprcvenda      := Qry.Fieldbyname('prc_venda').AsFloat;
        rvlrfipe       := Qry.Fieldbyname('veiculo_fipe').AsFloat;
        rplaca          := Qry.Fieldbyname('veiculo_placa').AsString;
        Result := True;
      end;
    except
      on E: Exception do
      begin
        raise;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

Function TModelVeiculo.ExcluirFotoVeiculoSelecionado(idfoto, idveic:integer):Boolean;
var
  Qry: TUniQuery;
Const
  sqlQuery = 'Delete from veiculo_foto where id_foto= :id and id_veiculo= :idveic';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection                      := dm.Conn;
      Qry.Close;
      Qry.SQL.Text                        := sqlQuery;
      IniciarTransacao;
      Qry.ParamByName('id').AsInteger     := idfoto;
      Qry.ParamByName('idveic').AsInteger := idveic;

      Try
        Qry.ExecSQL;
        ConfirmarTransacao;
        Result  := True;
      Except on e:exception do
        begin
          DesfazerTransacao;
          raise;
        end;
      End;

    except
      on E: Exception do
      begin
        raise;
      end;
    end;

  finally
    Qry.Free;
  end;
end;

Function TModelVeiculo.VisualizarFotoSelecionada(idfoto, idveic:integer; Out Base64, extft:String):Boolean;
var
  Qry: TUniQuery;
Const
  QryStr  = 'SELECT base64, formato FROM veiculo_foto WHERE id_foto= :id and id_veiculo = :idveic';
begin
  Result := False;
  Qry := TUniQuery.Create(nil);
  try
    try
      Qry.Connection                          := dm.Conn;
      Qry.SQL.Text                            := QryStr;
      Qry.Params.ParamByName('id').AsInteger  := idfoto;
      Qry.Params.ParamByName('idveic').AsInteger  := idveic;

      Qry.Open;
      if not Qry.IsEmpty then
      begin
        Base64        := Qry.Fieldbyname('base64').AsString;
        extft         := Qry.Fieldbyname('formato').AsString;
        Result := True;
      end;
    except
      on E: Exception do
      begin
        raise;
      end;
    end;
  finally
    Qry.Free;
  end;
end;

  {$ENDREGION}

  {$REGION 'Anexo Documento'}









  {$ENDREGION}


  {$REGION 'Transações'}

procedure TModelVeiculo.IniciarTransacao;
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

procedure TModelVeiculo.ConfirmarTransacao;
begin
  try
    if Assigned(FTransacao) and FTransacao.Active then
      FTransacao.Commit;
  except
    on E: Exception do
      raise Exception.Create('Erro ao confirmar transação: ' + E.Message);
  end;
end;

procedure TModelVeiculo.DesfazerTransacao;
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

  {$ENDREGION}




end.
