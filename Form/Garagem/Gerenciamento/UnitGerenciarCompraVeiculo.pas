unit UnitGerenciarCompraVeiculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseCons, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, Vcl.Menus, frxClass, frxDBSet,
  Vcl.Tabs, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxGDIPlusClasses, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Datasnap.DBClient,
  System.Generics.Collections, cxCurrencyEdit, Vcl.Grids, Vcl.DBGrids,
  Data.FMTBcd, Data.SqlExpr, Datasnap.Provider, MemDS, DBAccess, Uni,
  cxContainer, cxGroupBox;

type
  TFrmGerenciarCompraVeiculo = class(TFrmModeloConsulta)
    pButoon: TPanel;
    TabFiltroStatus: TTabSet;
    TabFiltroTipo: TTabSet;
    TabConsEntrada: TClientDataSet;
    TabConsEntradaid_compra: TIntegerField;
    TabConsEntradaid_empresa: TIntegerField;
    TabConsEntradaid_usuario: TIntegerField;
    TabConsEntradanumero: TIntegerField;
    TabConsEntradadata: TDateField;
    TabConsEntradahora: TTimeField;
    TabConsEntradatipo: TStringField;
    TabConsEntradaid_pessoa: TIntegerField;
    TabConsEntradaid_responsavel: TIntegerField;
    TabConsEntradaobs: TStringField;
    TabConsEntradasituacao: TStringField;
    TabConsEntradagerar_financeiro: TStringField;
    TabConsEntradagerar_estoque: TStringField;
    TabConsEntradadata_criado: TDateTimeField;
    GridContrato: TcxGridDBColumn;
    GridData: TcxGridDBColumn;
    GridPessoa: TcxGridDBColumn;
    GridTota: TcxGridDBColumn;
    GridResponsavel: TcxGridDBColumn;
    GridHora: TcxGridDBColumn;
    TabConsEntradanmpessoa: TStringField;
    TabConsEntradanmresponsavel: TStringField;
    TabConsEntradatotal: TCurrencyField;
    TabConsVeiculosEntrada: TClientDataSet;
    TabConsVeiculosEntradaid_compra_itens: TIntegerField;
    TabConsVeiculosEntradaid_compra: TIntegerField;
    TabConsVeiculosEntradaid_produto_veiculo: TIntegerField;
    TabConsVeiculosEntradaqtde: TFloatField;
    TabConsVeiculosEntradaprc_unitario: TFloatField;
    TabConsVeiculosEntradadesc_percentual: TFloatField;
    TabConsVeiculosEntradadesc_reais: TFloatField;
    TabConsVeiculosEntradadescricao: TStringField;
    TabConsVeiculosEntradacomplemento: TStringField;
    TabConsVeiculosEntradasubtotal: TFloatField;
    TabConsVeiculosEntradatotal: TFloatField;
    TabConsVeiculosEntradaveiculo_troca: TStringField;
    TabConsVeiculosEntradaveiculo_prcfipe: TFloatField;
    TabConsVeiculosEntradaveiculo_prcvenda: TFloatField;
    TabConsVeiculosEntradadata: TDateField;
    TabConsVeiculosEntradadata_criado: TDateTimeField;
    TabConsVeiculosEntradaid_empresa: TIntegerField;
    TabConsVeiculosEntradaid_usuario: TIntegerField;
    TabConsVeiculosEntradaveiculoperclucro: TFloatField;
    TabConsVeiculosEntradaatualizarficha: TStringField;
    TabConsVeiculosEntradataxames: TFloatField;
    TabConsVeiculosEntradataxadia: TFloatField;
    TabConsVeiculosEntradatotalpatio: TFloatField;
    TabConsVeiculosEntradacomissaolojaperc: TFloatField;
    TabConsVeiculosEntradacomissaolojavalor: TFloatField;
    TabConsVeiculosEntradacomissaovendperc: TFloatField;
    TabConsVeiculosEntradacomissaovendvalor: TFloatField;
    TabConsVeiculosEntradataxaconsignado: TFloatField;
    TabConsVeiculosEntradadataretiradaconsi: TDateField;
    TabConsVeiculosEntradaveiculolucrovalor: TFloatField;
    TabConsVeiculosEntradaveiculo_valorpraticado: TFloatField;
    TabConsVeiculosEntradaprc_custo: TFloatField;
    TabConsVeiculosEntradaveiculo_valortroca: TFloatField;
    dsVeiculosItens: TDataSource;
    TabSetDetalhes: TTabSet;
    cxGridDetalhes: TcxGrid;
    cxGridDetalhesLevel: TcxGridLevel;
    Vw_Veiculo: TcxGridDBTableView;
    Vw_Troca: TcxGridDBTableView;
    Vw_Financeiro: TcxGridDBTableView;
    Vw_VeiculoCodigo: TcxGridDBColumn;
    Vw_VeiculoPlaca: TcxGridDBColumn;
    Vw_VeiculoMarcaModelo: TcxGridDBColumn;
    Vw_VeiculoAnoModelo: TcxGridDBColumn;
    Vw_VeiculoValorTota: TcxGridDBColumn;
    TabConsVeiculosEntradacodigo: TIntegerField;
    TabConsVeiculosEntradadescricao_fiscal: TStringField;
    TabConsVeiculosEntradanmplaca: TStringField;
    TabConsVeiculosEntradaanomodelo: TStringField;
    Vw_TrocaCodigo: TcxGridDBColumn;
    Vw_TrocaPlaca: TcxGridDBColumn;
    Vw_TrocaMarcaModelo: TcxGridDBColumn;
    Vw_TrocaAnoModelo: TcxGridDBColumn;
    Vw_TrocaValor: TcxGridDBColumn;
    TabConsVeiculoTroca: TClientDataSet;
    TabConsVeiculoTrocaid_compra_itens: TIntegerField;
    TabConsVeiculoTrocaid_compra: TIntegerField;
    TabConsVeiculoTrocaid_produto_veiculo: TIntegerField;
    TabConsVeiculoTrocaqtde: TFloatField;
    TabConsVeiculoTrocaprc_unitario: TFloatField;
    TabConsVeiculoTrocadesc_percentual: TFloatField;
    TabConsVeiculoTrocadesc_reais: TFloatField;
    TabConsVeiculoTrocadescricao: TStringField;
    TabConsVeiculoTrocacomplemento: TStringField;
    TabConsVeiculoTrocasubtotal: TFloatField;
    TabConsVeiculoTrocatotal: TFloatField;
    TabConsVeiculoTrocaveiculo_troca: TStringField;
    TabConsVeiculoTrocaveiculo_prcfipe: TFloatField;
    TabConsVeiculoTrocaveiculo_prcvenda: TFloatField;
    TabConsVeiculoTrocadata: TDateField;
    TabConsVeiculoTrocadata_criado: TDateTimeField;
    TabConsVeiculoTrocaid_empresa: TIntegerField;
    TabConsVeiculoTrocaid_usuario: TIntegerField;
    TabConsVeiculoTrocaveiculoperclucro: TFloatField;
    TabConsVeiculoTrocaatualizarficha: TStringField;
    TabConsVeiculoTrocataxames: TFloatField;
    TabConsVeiculoTrocataxadia: TFloatField;
    TabConsVeiculoTrocatotalpatio: TFloatField;
    TabConsVeiculoTrocacomissaolojaperc: TFloatField;
    TabConsVeiculoTrocacomissaolojavalor: TFloatField;
    TabConsVeiculoTrocacomissaovendperc: TFloatField;
    TabConsVeiculoTrocacomissaovendvalor: TFloatField;
    TabConsVeiculoTrocataxaconsignado: TFloatField;
    TabConsVeiculoTrocadataretiradaconsi: TDateField;
    TabConsVeiculoTrocaveiculolucrovalor: TFloatField;
    TabConsVeiculoTrocaveiculo_valorpraticado: TFloatField;
    TabConsVeiculoTrocaprc_custo: TFloatField;
    TabConsVeiculoTrocaveiculo_valortroca: TFloatField;
    TabConsVeiculoTrocacodigo: TIntegerField;
    TabConsVeiculoTrocadescricao_fiscal: TStringField;
    TabConsVeiculoTrocanmplaca: TStringField;
    TabConsVeiculoTrocaanomodelo: TStringField;
    dsTroca: TDataSource;
    TabFinanceiroEntrada: TClientDataSet;
    dsFinanceiro: TDataSource;
    TabFinanceiroEntradaid_pagamento: TIntegerField;
    TabFinanceiroEntradaforma_pagamento: TStringField;
    TabFinanceiroEntradaparcelado: TStringField;
    TabFinanceiroEntradanumero_parcelas: TIntegerField;
    TabFinanceiroEntradaobservacao: TStringField;
    TabFinanceiroEntradavalor: TCurrencyField;
    TabFinanceiroEntradaid_compra: TIntegerField;
    Vw_FinanceiroData: TcxGridDBColumn;
    Vw_FinanceiroPrazo: TcxGridDBColumn;
    Vw_FinanceiroObs: TcxGridDBColumn;
    Vw_Financeirovalor: TcxGridDBColumn;
    TabFinanceiroEntradadata_pagamento: TDateField;
    Btncancelar: TMenuItem;
    N2: TMenuItem;
    btnReabrir: TMenuItem;
    Reabriroperao2: TMenuItem;
    GerarEstoque1: TMenuItem;
    N3: TMenuItem;
    Envio1: TMenuItem;
    Envio2: TMenuItem;
    Impresso1: TMenuItem;
    N4: TMenuItem;
    EnviarContrato1: TMenuItem;
    ReceberContrato1: TMenuItem;
    ReceberContrato2: TMenuItem;
    PginaWeb1: TMenuItem;
    WhatsApp1: TMenuItem;
    Email1: TMenuItem;
    Contrato1: TMenuItem;
    CheckList1: TMenuItem;
    Vw_VeiculoCor: TcxGridDBColumn;
    TabConsVeiculosEntradacor: TStringField;
    TabConsVeiculoTrocacor: TStringField;
    Vw_TrocaCor: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure TabSetDetalhesClick(Sender: TObject);
    procedure BtncancelarClick(Sender: TObject);
    procedure btnReabrirClick(Sender: TObject);
  private
    { Private declarations }
  public
    Procedure Pesquisa;override;
    procedure OpenCadTela(id: integer;str:string);override;
    Procedure editar;override;
    Procedure Excluir;override;

    { Public declarations }
  end;

var
  FrmGerenciarCompraVeiculo: TFrmGerenciarCompraVeiculo;

implementation

{$R *.dfm}

uses uJKDialog, Vcl.Navigation, UnitEntradaVeiculo, Vcl.Validacoes,
  Controller.EntradaVeiculo,  Model.EntradaVeiculo,
  Controller.EntradaVeiculoItens, Model.EntradaVeiculoItens, UDM,
  Controller.EntradaVeiculoFinanceiro, Model.EntradaVeiculoFinanceiro,
  Vcl.PermissaoUsuario, Vcl.Session, Model.LogVeiculo, Controller.LogVeiculo
  ;

{ TFrmGerenciarCompraVeiculo }

procedure TFrmGerenciarCompraVeiculo.BtncancelarClick(Sender: TObject);
var
Controller  : TEntradaVeiculoController;
Permissao   : TPermissaoUsuario;
obj         : TEntradaVeiculo;
begin
  //Cancelar operação e validar se tem acesso
  Controller  := Nil;

  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Entrada Veículo');

  if Permissao.TemPermissao('Permitir Cancelar') then
  begin
    if not TabConsEntrada.Eof then
    begin

      if ds.DataSet.FieldByName('situacao').AsString <> 'F' then
      begin
        JKDialog('Aviso','Operação valída somente para lançamento fechado.', tdAlerta);
        exit;
      end;

      if JKDialog('Aviso', 'Deseja cancelar o registro selecionado?', tdMensagem)  then
      begin
        Controller  := TEntradaVeiculoController.Create;
        obj         := TEntradaVeiculo.Create;
        try
          Try
            obj.Id_compra                 := ds.DataSet.FieldByName('id_compra').AsInteger;
            obj.id_usuario_cancelado      := Tsession.ID_USUARIO;
            obj.data_cancelado            := Now;
            obj.Situacao                  := 'C';

            if Controller.SalvarOperacao(obj, 'id_compra') then
            begin
              Pesquisa;
            end;
          except on e:exception do
            begin
              JKDialog('Erro','Erro ao cancelar o registro.'+#13+e.Message, tderro);
            end;
          end;
        Finally
          Controller.Free;
          obj.Free;
        End;
      end;
    end
    else
    begin
      JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
    end;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);

end;

procedure TFrmGerenciarCompraVeiculo.btnReabrirClick(Sender: TObject);
var
Controller  : TEntradaVeiculoController;
Permissao   : TPermissaoUsuario;
obj         : TEntradaVeiculo;

ContrLog    : TLogVeiculoController;
ObjLog      : TLogVeiculo;

I           : Integer;

//ContrEstoqueM : TEstoqueMovimentacaoController;
//ObjEstoqueM   : Testoquemovimentacao;
//
//ContrEstoqueG : TEstoqueGeralController;
//ObjEstoqueG   : Testoquegeral;
//
//ContrProduto  : TProdutoEstoqueController;
//ObjProduto    : TProdutoEstoque;

begin
  //Reabrir uma operacao fechada
  Controller  := Nil;
  Obj         := Nil;

  ContrLog    := Nil;
  ObjLog      := Nil;

//  ContrEstoqueM   := Nil;
//  ObjEstoqueM     := Nil;
//  ContrEstoqueG   := Nil;
//  ObjEstoqueG     := Nil;
//  ContrProduto    := nil;
//  ObjProduto      := Nil;



  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Entrada Veículo');

  if Permissao.TemPermissao('Permitir reabrir') then
  begin
    if not TabConsEntrada.Eof then
    begin

      if ds.DataSet.FieldByName('situacao').AsString <> 'F' then
      begin
        JKDialog('Aviso','Operação valída somente para lançamento fechado.', tdAlerta);
        exit;
      end;

      if JKDialog('Aviso', 'Deseja reabrir o registro selecionado?', tdMensagem)  then
      begin

        {$REGION 'Operacao'}

        Controller  := TEntradaVeiculoController.Create;
        obj         := TEntradaVeiculo.Create;

        ContrLog    := TLogVeiculoController.Create;
        ObjLog      := TLogVeiculo.Create;

        try
          Try
            obj.Id_compra                 := ds.DataSet.FieldByName('id_compra').AsInteger;
            obj.Numero                    := ds.DataSet.FieldByName('numero').AsInteger;
            obj.Situacao                  := 'A';

            if Controller.SalvarOperacao(obj, 'id_compra') then
            begin //se gravou com sucesso

              {$REGION 'LOGS'}
              //** Registrar log na ficha do veiculo   **
              TabConsVeiculosEntrada.First;
              TabConsVeiculosEntrada.DisableControls;
              For I := 0 to TabConsVeiculosEntrada.RecordCount -1 do
              begin
                ObjLog.Id           := 0;
                ObjLog.Idveiculo    := TabConsVeiculosEntrada.FieldByName('id_produto_veiculo').AsInteger;
                ObjLog.Idusuario    := TSession.ID_USUARIO;
                ObjLog.Idempresa    := TSession.IDEMPRESA;
                ObjLog.ndescricao   := 'Entrada de veículo contrato nº '+IntTostr(Obj.Numero)+' operação reaberta.';
                ContrLog.Salvar(ObjLog);
                TabConsVeiculosEntrada.Next;
              end;

              TabConsVeiculosEntrada.EnableControls;

              {$ENDREGION}

              {$REGION 'Estoque'}
              //** Atualizando Ficha do Veiculo estoque_atual para 0 zero **
              if ds.DataSet.FieldByName('gerar_estoque').AsString = 'S'  then
              begin
//                ContrEstoqueM := TEstoqueMovimentacaoController.Create;
//                ObjEstoqueM   := Testoquemovimentacao.Create;
//
//                ContrEstoqueG := TEstoqueGeralController.Create;
//                ObjEstoqueG   := Testoquegeral.Create;
//
//                ContrProduto  := TProdutoEstoqueController.Create;
//                ObjProduto    := TProdutoEstoque.Create;

                Try
                  TabConsVeiculosEntrada.First;
                  TabConsVeiculosEntrada.DisableControls;

//                  For I := 0 to TabConsVeiculosEntrada.RecordCount -1 do
//                  begin //Pecorrer os veiculos da entrada
//                    if not ContrEstoqueM.DeletarMovimentacaoCompra(ds.DataSet.FieldByName('id_compra').AsInteger,
//                                      TabConsVeiculosEntrada.FieldByName('id_produto_veiculo').AsInteger) then
//                    begin
//                      JKDialog('Erro','Erro ao excluir a movimentação de estoque.'+ sLineBreak +
//                       'Por favor, entre em contato com o administrador do sistema.', tdAlerta);
//                        Exit;
//                      Exit;
//                    end
//                    else
//                    begin
//                      //Atualizar tabela estoque.
//
//                      ObjEstoqueG.id_produto          := TabConsVeiculosEntrada.FieldByName('id_produto_veiculo').AsInteger;
//                      ObjEstoqueG.qtde                := 0;
//                      ObjEstoqueG.id_empresa          := TSession.IDEMPRESA;
//
//                      if ContrEstoqueG.GravarEstoque(ObjEstoqueG) then
//                      begin
//                        //atualiza a ficha do produto.
//                        ObjProduto.id_produto         := TabConsVeiculosEntrada.FieldByName('id_produto_veiculo').AsInteger;
//                        ObjProduto.estoque_atual      := TabConsVeiculosEntrada.FieldByName('qtde').AsFloat;
//                        ObjProduto.qtdenova           := -1;
//                        ContrProduto.GravarProduto(ObjProduto);
//                      end
//                      else
//                      begin
//                        JKDialog('Erro','Erro ao atualizar o estoque.'+ sLineBreak +
//                       'Por favor, entre em contato com o administrador do sistema.', tdAlerta);
//                        Exit;
//                      end;
//                    end;
//                    TabConsVeiculosEntrada.Next;
//                  end;

                  TabConsVeiculosEntrada.EnableControls;

                Finally
//                  FreeAndNIl(ContrEstoqueM);
//                  FreeAndNIl(ObjEstoqueM);
//                  FreeAndNIl(ContrEstoqueG);
//                  FreeAndNIl(ObjEstoqueG);
//                  FreeAndNIl(ContrProduto);
//                  FreeAndNIl(ObjProduto);
                End;

              end;

              {$ENDREGION}

              {$REGION 'Financeiro'}

              {$ENDREGION}

            end
            else
            begin
              JKDialog('Erro','Erro ao reabrir o registro.'+ sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.', tdAlerta);
              Exit;
            end;

          except on e:exception do
            begin
              JKDialog('Erro','Erro ao reabrir o registro.'+#13+e.Message, tdAlerta);
            end;

          end;

        Finally
          FreeAndnil(Controller);
          Freeandnil(obj);
          FreeAndNil(ContrLog);
          FreeandNil(ObjLog);
        End;

        {$ENDREGION}

        JKDialog('Sucesso','Registro de entrada aberto com sucesso.', tdSucesso);
        Pesquisa;

      end;

    end
    else
    begin
      JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
    end;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmGerenciarCompraVeiculo.editar;
begin
  //Editar Compra Aberta.
  inherited;

  if not TabConsEntrada.Eof then
  begin

    if ds.DataSet.FieldByName('situacao').AsString <> 'A' then
    begin
      JKDialog('Aviso','Entrada já está finalizada.'+#13+'Estorne para realizar a edição!', tdAlerta);
      exit;
    end;

    if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
    begin
      Try
        OpenCadTela(ds.DataSet.FieldByName('id_compra').AsInteger,'E');
      except on e:exception do
        begin
          JKDialog('Erro','Erro ao editar o registro.'+#13+e.Message, tdErro);
        end;
      end;

    end;

  end
  else
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  end;
end;

procedure TFrmGerenciarCompraVeiculo.Excluir;
var
Controller  : TEntradaVeiculoController;
begin
  inherited;
  Controller  := Nil;

  if not TabConsEntrada.Eof then
  begin
    if ds.DataSet.FieldByName('situacao').AsString <> 'A' then
    begin
      JKDialog('Aviso','Entrada já está finalizada.'+#13+'Estorne para realizar a exclusão!', tdAlerta);
      exit;
    end;

    if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
    begin
      Controller  := TEntradaVeiculoController.Create;
      try
        Try
          if Controller.Excluir(ds.DataSet.FieldByName('id_compra').AsInteger) then
          begin
            Pesquisa;
          end;
        except on e:exception do
          begin
          JKDialog('Erro','Erro ao exclui o registro.'+#13+e.Message, tdAlerta);
          end;
        end;

      Finally
        Controller.Free;
      End;

    end;

  end
  else
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  end;
end;

procedure TFrmGerenciarCompraVeiculo.FormShow(Sender: TObject);
begin
  inherited;
  Tela  := 'Entrada Veículo';
end;

procedure TFrmGerenciarCompraVeiculo.OpenCadTela(id: integer; str: string);
begin
  inherited;
  TNavigation.ParamInt          := id;
  TNavigation.ParamsStr         := str;
  TNavigation.OpenModal(TFrmEntradaVeiculo, FrmEntradaVeiculo);
end;

procedure TFrmGerenciarCompraVeiculo.Pesquisa;
var
FiltroStatus,FiltroTipo, FiltroCampo :string;

Controller  : TEntradaVeiculoController;
Lista       : TObjectList<TEntradaVeiculo>;

ListaIds    : TArray<Integer>;
ControllerItens : TEntradaItensVeiculoController;
ListaVeiculo: TObjectList<TEntradaVeiculoItens>;

controllerFinanceiro  : TEntradaFinanceiroVeiculoController;
ListaFinanceiro       : TObjectList<TEntradaVeiculoFinanceiro>;

begin
  inherited;

  Lista                 := nil;
  ListaVeiculo          := nil;
  ListaFinanceiro       := nil;
  Controller            := nil;
  ControllerItens       := nil;
  controllerFinanceiro  := nil;


  FiltroStatus  := '';
  FiltroTipo    := '';
  FiltroCampo   := '';

  case TabFiltroTipo.TabIndex of
    1:  FiltroTipo  := 'CONSIGNADO';
    2:  FiltroTipo  := 'CONSIGNADO LOJA';
    3:  FiltroTipo  := 'PRÓPRIO';
    4:  FiltroTipo  := 'ZERO';
  end;

  case TabFiltroStatus.TabIndex of
    1:FiltroStatus := 'A';
    2:FiltroStatus := 'F';
    3:FiltroStatus := 'C';
  end;

  if trim(edtBusca.Text) <> '' then
  begin
    FiltroCampo     := trim(edtBusca.Text);
  end;

  Controller            := TEntradaVeiculoController.Create;
  ControllerItens       := TEntradaItensVeiculoController.Create;
  controllerFinanceiro  := TEntradaFinanceiroVeiculoController.Create;

  Try
    Lista   := Controller.ListarTodos(FiltroStatus,FiltroTipo, FiltroCampo);
    TabConsEntrada.EmptyDataSet;
    //Se nao tem compra nem avanca
    if (Lista = nil) or (Lista.Count = 0) then
    begin
      JKDialog('Aviso','Nenhum registro de entrada encontrado!', tdAlerta);
      exit;
    end;

    //popular Tab
    TabConsEntrada.DisableControls;

    try
      //TabConsEntrada.EmptyDataSet;

      //Pega os id da compra
      SetLength(ListaIds, Lista.Count);
      for var I := 0 to Lista.Count - 1 do
        ListaIds[I] := Lista[I].Id_Compra;


      //Buscar os veiculos Itens
      ListaVeiculo  := ControllerItens.ListarPorIdsCompra(ListaIds);


      for var Item in Lista do
      begin
        TabConsEntrada.Append;
        TabConsEntrada.FieldByName('id_compra').AsInteger         := Item.Id_compra;
        TabConsEntrada.FieldByName('numero').Asinteger            := Item.Numero;
        TabConsEntrada.FieldByName('data').AsDateTime             := Item.Data;
        TabConsEntrada.FieldByName('hora').AsDateTime             := Item.Hora;
        TabConsEntrada.FieldByName('tipo').AsString               := Item.Tipo;
        TabConsEntrada.FieldByName('situacao').AsString           := Item.Situacao;
        TabConsEntrada.FieldByName('gerar_financeiro').AsString   := Item.Gerar_financeiro;
        TabConsEntrada.FieldByName('gerar_estoque').AsString      := Item.Gerar_estoque;
        TabConsEntrada.FieldByName('nmpessoa').AsString           := Item.nmpessoa;
        TabConsEntrada.FieldByName('nmresponsavel').AsString      := Item.nmresponsavel;
        TabConsEntrada.FieldByName('total').AsFloat               := Item.vlr_total;

        TabConsEntrada.Post;
      end;
      TabConsVeiculosEntrada.EmptyDataSet;

      //Listar veiculo que nao e troca
      for var Item in ListaVeiculo do
      begin
        TabConsVeiculosEntrada.Append;
        TabConsVeiculosEntradaid_compra_itens.AsInteger           := Item.IdCompraItens;
        TabConsVeiculosEntradaid_compra.AsInteger                 := Item.IdCompra;
        TabConsVeiculosEntradaid_produto_veiculo.AsInteger        := Item.IdProdutoVeiculo;
        TabConsVeiculosEntradaqtde.AsFloat                        := Item.Qtde;
        TabConsVeiculosEntradaPrc_Unitario.AsCurrency             := Item.PrcUnitario;
        TabConsVeiculosEntradasubtotal.AsCurrency                 := Item.Subtotal;
        TabConsVeiculosEntradatotal.AsCurrency                    := Item.Total;
        TabConsVeiculosEntradaveiculo_prcfipe.AsCurrency          := Item.VeiculoPrcFipe;
        TabConsVeiculosEntradaprc_custo.AsCurrency                := Item.PrcCusto;
        TabConsVeiculosEntradacodigo.AsInteger                    := Item.codigo;
        TabConsVeiculosEntradaDescricao.AsString                  := Item.Descricao;
        TabConsVeiculosEntradadescricao_fiscal.AsString           := Item.descricao_fiscal;
        TabConsVeiculosEntradanmplaca.AsString                    := Item.nmplaca;
        TabConsVeiculosEntradaanomodelo.AsString                  := Item.anomodelo;
        TabConsVeiculosEntradacor.AsString                        := Item.cor;
        TabConsVeiculosEntrada.Post;
      end;

      //Listar os veiculos troca
      ListaVeiculo  := ControllerItens.ListarPorIdsCompraTroca(ListaIds);

      TabConsVeiculoTroca.EmptyDataSet;
      for var Item in ListaVeiculo do
      begin
        TabConsVeiculoTroca.Append;
        TabConsVeiculoTrocaid_compra_itens.AsInteger           := Item.IdCompraItens;
        TabConsVeiculoTrocaid_compra.AsInteger                 := Item.IdCompra;
        TabConsVeiculoTrocaid_produto_veiculo.AsInteger        := Item.IdProdutoVeiculo;
        TabConsVeiculoTrocaqtde.AsFloat                        := Item.Qtde;
        TabConsVeiculoTrocaPrc_Unitario.AsCurrency             := Item.PrcUnitario;
        TabConsVeiculoTrocasubtotal.AsCurrency                 := Item.Subtotal;
        TabConsVeiculoTrocatotal.AsCurrency                    := Item.Total;
        TabConsVeiculoTrocaveiculo_prcfipe.AsCurrency          := Item.VeiculoPrcFipe;
        TabConsVeiculoTrocaprc_custo.AsCurrency                := Item.PrcCusto;
        TabConsVeiculoTrocacodigo.AsInteger                    := Item.codigo;
        TabConsVeiculoTrocaDescricao.AsString                  := Item.Descricao;
        TabConsVeiculoTrocadescricao_fiscal.AsString           := Item.descricao_fiscal;
        TabConsVeiculoTrocanmplaca.AsString                    := Item.nmplaca;
        TabConsVeiculoTrocaanomodelo.AsString                  := Item.anomodelo;

        TabConsVeiculoTroca.Post;
      end;

      //Carregar Financeiro

      ListaFinanceiro   := controllerFinanceiro.ListarPorIdsCompra(ListaIds);

      TabFinanceiroEntrada.EmptyDataSet;

      for var Item in ListaFinanceiro do
      begin
        TabFinanceiroEntrada.Append;

        TabFinanceiroEntradaid_pagamento.AsInteger    :=  Item.id_pagamento;
        TabFinanceiroEntradaid_compra.AsInteger       :=  Item.id_compra;
        TabFinanceiroEntradaforma_pagamento.AsString  :=  Item.forma_pagamento;
        TabFinanceiroEntradaparcelado.AsString        :=  Item.parcelado;
        TabFinanceiroEntradanumero_parcelas.AsInteger :=  Item.numero_parcelas;
        TabFinanceiroEntradaobservacao.AsString       :=  Item.observacao;
        TabFinanceiroEntradavalor.AsCurrency          :=  Item.valor;
        TabFinanceiroEntradadata_pagamento.AsDateTime :=  Item.data_pagamento;

        TabFinanceiroEntrada.Post;
      end;

    finally
      TabConsEntrada.EnableControls;
      TabConsEntrada.First;
      TabConsVeiculosEntrada.First;
      TabConsVeiculoTroca.First;
      TabFinanceiroEntrada.First;
    end;

  Finally
    FreeAndNil(Lista);
    FreeAndNil(ListaVeiculo);
    FreeAndNil(ListaFinanceiro);
    FreeAndNil(ControllerItens);
    FreeAndNil(controllerFinanceiro);
    FreeAndNil(Controller);
  End;
end;

procedure TFrmGerenciarCompraVeiculo.TabSetDetalhesClick(Sender: TObject);
begin
  inherited;
  //Troca de Grid

  case TabSetDetalhes.TabIndex of
    0:begin
        cxGridDetalhesLevel.GridView    := Vw_veiculo;
      end;
    1:begin
        cxGridDetalhesLevel.GridView    := Vw_troca;
      end;
    2:begin
        cxGridDetalhesLevel.GridView    := Vw_Financeiro;
      end;
  end;
end;

end.
