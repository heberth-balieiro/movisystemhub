unit UnitEntradaVeiculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseOperacoes, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, ACBrBase, ACBrEnterTab, cxGroupBox,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCheckBox, cxBlobEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxSpinEdit, cxTimeEdit, cxMaskEdit, cxCalendar, cxTextEdit,
  Data.DB, DBAccess, Uni, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, dxDateRanges, dxScrollbarAnnotations, cxDBData,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.Menus, cxButtons,
  cxButtonEdit, Datasnap.DBClient, frxClass, frxDBSet;

type
  TFrmEntradaVeiculo = class(TFrmBaseOperacoes)
    cxGroupBox2: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    edtPedido: TcxTextEdit;
    edtData: TcxDateEdit;
    edtHora: TcxTimeEdit;
    edtCliente: TcxLookupComboBox;
    edtObs: TcxBlobEdit;
    edtVendedor: TcxLookupComboBox;
    edtStatus: TcxCheckBox;
    Label6: TLabel;
    edttipo: TcxComboBox;
    edtGerarEstoque: TcxCheckBox;
    edtGerarFinanceiro: TcxCheckBox;
    dsPessoa: TUniDataSource;
    dsResponsavel: TUniDataSource;
    PageControl1: TPageControl;
    TabCarrinho: TTabSheet;
    cxGrid1: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBTableView2Column2: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    TabLista: TTabSheet;
    Panel3: TPanel;
    cxGroupBox11: TcxGroupBox;
    edtPesquisa: TcxTextEdit;
    cxGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    idproduto: TcxGridDBColumn;
    coll1: TcxGridDBColumn;
    coll3: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    cxGridDBTableView1Column8: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    dsVeiculoLista: TUniDataSource;
    lbrascunho: TLabel;
    dsCarrinho: TUniDataSource;
    btncarrinho: TcxButton;
    btncadveiculo: TcxButton;
    btnexcluir: TcxButton;
    btnEditar: TcxButton;
    cxGridDBTableView2Column1: TcxGridDBColumn;
    veictroca: TcxGridDBColumn;
    Label12: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    EdtTotal: TcxCurrencyEdit;
    edttroca: TcxCurrencyEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    edtsubtotal: TcxCurrencyEdit;
    edtDesconto: TcxCurrencyEdit;
    Label14: TLabel;
    edtCadPessoa: TcxButtonEdit;
    edtCadResposavel: TcxButtonEdit;
    TabCliente: TClientDataSet;
    TabClienteid_socio: TIntegerField;
    TabClientecliente: TStringField;
    TabClientecpf: TStringField;
    TabVendedor: TClientDataSet;
    TabVendedorid_funcionario: TIntegerField;
    TabVendedorfunc: TStringField;
    TabVendedorcpf: TStringField;
    TabEntradaVeiculoLista: TClientDataSet;
    TabEntradaVeiculoListaplaca: TStringField;
    TabEntradaVeiculoListadescricao: TStringField;
    TabEntradaVeiculoListadescricao_fiscal: TStringField;
    TabEntradaVeiculoListaprc_venda: TFloatField;
    TabEntradaVeiculoListaveiculo_fipe: TFloatField;
    TabEntradaVeiculoListaestoque: TStringField;
    TabEntradaVeiculoListanmmodelo: TStringField;
    TabEntradaVeiculoListalocal: TStringField;
    TabEntradaVeiculoListaid_veiculo: TIntegerField;
    TabEntradaVeiculoListaanomodelo: TStringField;
    TabEntradaVeiculoListacodigo: TIntegerField;
    TabEntradaVeiculoListatemfoto: TStringField;
    TabVeiculoCompraLista: TClientDataSet;
    TabVeiculoCompraListaid: TIntegerField;
    TabVeiculoCompraListacodigo: TIntegerField;
    TabVeiculoCompraListadescricao: TStringField;
    TabVeiculoCompraListaplaca: TStringField;
    TabVeiculoCompraListacor: TStringField;
    TabVeiculoCompraListaanomodelo: TStringField;
    TabVeiculoCompraListaqtde: TCurrencyField;
    TabVeiculoCompraListasubtotal: TCurrencyField;
    TabVeiculoCompraListatotal: TCurrencyField;
    TabVeiculoCompraListaveiculotroca: TStringField;
    TabVeiculoCompraListavlrunitario: TCurrencyField;
    TabVeiculoCompraListaidveiculo: TIntegerField;
    TabVeiculoCompraListadesconto: TCurrencyField;
    Label15: TLabel;
    TabVeiculoCompraListavlrfipe: TFloatField;
    TabVeiculoCompraListavlrvenda: TFloatField;
    TabVeiculoCompraListavlrperclucro: TFloatField;
    TabVeiculoCompraListaatualizarficha: TStringField;
    TabVeiculoCompraListavlrtaxames: TFloatField;
    TabVeiculoCompraListavlrtaxadia: TFloatField;
    TabVeiculoCompraListavlrtotalpatio: TFloatField;
    TabVeiculoCompraListavlrcomissaolojaperc: TFloatField;
    TabVeiculoCompraListavlrcomissaoloja: TFloatField;
    TabVeiculoCompraListavlrcomissaovendperc: TFloatField;
    TabVeiculoCompraListavlrcomissaovend: TFloatField;
    TabVeiculoCompraListavlrtaxaconsignado: TFloatField;
    TabVeiculoCompraListadataretiradaconsignado: TDateField;
    TabVeiculoCompraListavlrlucro: TFloatField;
    TabVeiculoCompraListavlrpraticado: TFloatField;
    TabVeiculoCompraListavlrcusto: TFloatField;
    TabVeiculoCompraListavlrtroca: TFloatField;
    Tab_RelEntrada: TClientDataSet;
    Tab_RelEntradaVeiculos: TClientDataSet;
    frxRelatorio: TfrxReport;
    Tab_RelEntradaid_compra: TIntegerField;
    Tab_RelEntradancontrato: TIntegerField;
    Tab_RelEntradadata: TDateField;
    Tab_RelEntradahora: TStringField;
    Tab_RelEntradatipo: TStringField;
    Tab_RelEntradaobs: TStringField;
    Tab_RelEntradavlrTroca: TCurrencyField;
    Tab_RelEntradavlrsubtotal: TCurrencyField;
    Tab_RelEntradavlrtotal: TCurrencyField;
    Tab_RelEntradavlrdesconto: TCurrencyField;
    Tab_RelEntradapessoacodigo: TIntegerField;
    Tab_RelEntradapessoanome: TStringField;
    Tab_RelEntradapessoaapelido: TStringField;
    Tab_RelEntradapessoacep: TStringField;
    Tab_RelEntradapessoaendereco: TStringField;
    Tab_RelEntradapessoanumero: TStringField;
    Tab_RelEntradapessoabairro: TStringField;
    Tab_RelEntradapessoacomp: TStringField;
    Tab_RelEntradapessoatelefone: TStringField;
    Tab_RelEntradapessoacelular: TStringField;
    Tab_RelEntradapessoawhatsapp: TStringField;
    Tab_RelEntradapessoacpf: TStringField;
    Tab_RelEntradapessoarg: TStringField;
    Tab_RelEntradapessoaorgao: TStringField;
    Tab_RelEntradapessoasexo: TStringField;
    Tab_RelEntradapessoacivil: TStringField;
    Tab_RelEntradapessoanascimento: TDateField;
    Tab_RelEntradapessoaemail: TStringField;
    Tab_RelEntradapessoanacionalidade: TStringField;
    Tab_RelEntradapessoacidade: TStringField;
    Tab_RelEntradaVeiculosqtde: TFloatField;
    Tab_RelEntradaVeiculosvlrunitario: TCurrencyField;
    Tab_RelEntradaVeiculosvlrdescontoperc: TCurrencyField;
    Tab_RelEntradaVeiculosvlrdesconto: TCurrencyField;
    Tab_RelEntradaVeiculoscomplemento: TStringField;
    Tab_RelEntradaVeiculosvlrsubtotal: TCurrencyField;
    Tab_RelEntradaVeiculosvlrtotal: TCurrencyField;
    Tab_RelEntradaVeiculostroca: TStringField;
    Tab_RelEntradaVeiculosveiccodigo: TIntegerField;
    Tab_RelEntradaVeiculosveicdescricao: TStringField;
    Tab_RelEntradaVeiculosveicfiscal: TStringField;
    Tab_RelEntradaVeiculosveiculo_origem: TStringField;
    Tab_RelEntradaVeiculosveiculo_ano: TStringField;
    Tab_RelEntradaVeiculosveiculo_ano_modelo: TStringField;
    Tab_RelEntradaVeiculosveiculo_combustivel: TStringField;
    Tab_RelEntradaVeiculosveiculo_cambio: TStringField;
    Tab_RelEntradaVeiculosveiculo_cor: TStringField;
    Tab_RelEntradaVeiculosveiculo_porta: TIntegerField;
    Tab_RelEntradaVeiculosveiculo_km: TCurrencyField;
    Tab_RelEntradaVeiculosveiculo_placa: TStringField;
    Tab_RelEntradaVeiculosveiculo_uf: TStringField;
    Tab_RelEntradaVeiculosveiculo_renavan: TStringField;
    Tab_RelEntradaVeiculosveiculo_chassi: TStringField;
    Tab_RelEntradaVeiculosveiculo_crv: TStringField;
    Tab_RelEntradaVeiculosveiculo_tipo_crv: TStringField;
    Tab_RelEntradaVeiculosmarca: TStringField;
    Tab_RelEntradaVeiculosgrupo: TStringField;
    Tab_RelEntradaVeiculosveiculoespecie: TStringField;
    Tab_RelEntradaVeiculosveiculomodelo: TStringField;
    frxDBDadosEntrada: TfrxDBDataset;
    frxDBDadosVeiculo: TfrxDBDataset;
    procedure FormShow(Sender: TObject);
    procedure edtPesquisaPropertiesChange(Sender: TObject);
    procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure btncarrinhoClick(Sender: TObject);
    procedure btncadveiculoClick(Sender: TObject);
    procedure cxGridDBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnexcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure edtCadPessoaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtCadResposavelPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxGridDBTableView2CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    idCompra:Integer;
    { Private declarations }
    Procedure Localizar;
    procedure AbrirFormVeiculoIncluir;
    function InserirRegistro: Boolean;
    Procedure CarregarVeiculoCarrinho;
    Procedure CalcularValores;
    function SomarTotalVeiculos: Double;
    function SomarTotalVeiculosTroca: Double;
    function SomarTotalVeiculosDesconto: Double;
    procedure CarregarVeiculoLista;
    procedure CarregarCLookupListaFuncionario;
    procedure CarregarCLookupListaPessoa;
    procedure GerarFinanceiro;
    procedure ImpressoConsignado;
    procedure ImpressoConsignadoLoja;
    procedure ImpressoProprio;
  public
    { Public declarations }
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure CarregarDados; override;
  end;

var
  FrmEntradaVeiculo: TFrmEntradaVeiculo;

implementation

{$R *.dfm}

uses UDM, Model.Compra, Vcl.Navigation, Vcl.Validacoes, Vcl.Session,
  UnitCadVeiculo, uJKDialog, UnitVeiculoEntrada, Vcl.PermissaoUsuario,
  UnitVeiculoEntradaPagamento, UnitPessoaCad, UnitFuncionarioCad,
  Controller.LookupHelper, Model.Socio, Controller.EntradaVeiculo,
  Model.EntradaVeiculo, Model.LogVeiculo, Controller.LogVeiculo,
  Model.VeiculosAtualizar, Controller.Veiculos;


{$REGION 'Procedure'}

procedure TFrmEntradaVeiculo.CalcularValores;
var
  VlrTroca, VlrSub, VlrDesc, VlrTotal:currency;
begin
  VlrTroca    := 0;
  Vlrsub      := 0;
  VlrDesc     := 0;
  VlrTotal    := 0;

  VlrTroca    := SomarTotalVeiculosTroca;
  Vlrsub      := SomarTotalVeiculos;
  VlrDesc     := SomarTotalVeiculosDesconto;

  VlrTotal    := (Vlrsub - VlrDesc) - VlrTroca;

  edttroca.EditValue    := VlrTroca;
  edtsubtotal.EditValue := Vlrsub;
  edtDesconto.EditValue := VlrDesc;

  EdtTotal.EditValue    := VlrTotal;

end;

procedure TFrmEntradaVeiculo.CarregarVeiculoCarrinho;
begin
  //ListarVeiculoTela

  TLookupHelper.CarregarLookup(TabVeiculoCompraLista, 'Select                                             '+
            ' ci.id_compra_itens as id,                         '+
            ' p.codigo,                                         '+
            ' ci.descricao,                                     '+
            ' p.veiculo_placa as placa,                         '+
            ' p.veiculo_cor as cor,                             '+
            ' concat(p.veiculo_ano,''/'',p.veiculo_ano_modelo) as anomodelo,   '+
            ' ci.qtde,                                          '+
            ' coalesce(ci.subtotal,0) as subtotal,              '+
            ' coalesce(ci.total,0) as total,                    '+
            ' case                                              '+
            ' when ci.veiculo_troca=''N'' then ''Não''          '+
            ' else ''Sim''                                      '+
            ' end as veiculotroca,                              '+
            ' coalesce(ci.prc_unitario,0) as vlrunitario,       '+
            ' ci.id_produto_veiculo as idveiculo,               '+
            ' ci.desc_reais as desconto,                        '+
            ' ci.veiculo_prcfipe as vlrfipe,                    '+
            ' ci.veiculo_prcvenda as vlrvenda,                  '+
            ' ci.veiculoperclucro as vlrperclucro,              '+
            ' ci.atualizarficha,                                '+
            ' ci.taxames as vlrtaxames,                         '+
            ' ci.taxadia as vlrtaxadia,                         '+
            ' ci.totalpatio as vlrtotalpatio,                   '+
            ' ci.comissaolojaperc as vlrcomissaolojaperc,       '+
            ' ci.comissaolojavalor as vlrcomissaoloja,          '+
            ' ci.comissaovendperc as vlrcomissaovendperc,       '+
            ' ci.comissaovendvalor as vlrcomissaovend,          '+
            ' ci.taxaconsignado as vlrtaxaconsignado,           '+
            ' ci.dataretiradaconsi as dataretiradaconsignado,   '+
            ' ci.veiculolucrovalor as vlrlucro,                 '+
            ' ci.veiculo_valorpraticado as vlrpraticado,        '+
            ' ci.prc_custo as vlrcusto,                         '+
            ' ci.veiculo_valortroca as vlrtroca                 '+
            ' From compra_itens ci                                          '+
            ' Inner join produto p                                          '+
            ' on ci.id_produto_veiculo = p.id_produto where ci.id_compra= '+IntToStr(idcompra)+' order by p.veiculo_placa');


end;

Procedure TFrmEntradaVeiculo.CarregarVeiculoLista;
begin
  TLookupHelper.CarregarLookup(TabEntradaVeiculoLista, 'Select '+
                ' p.veiculo_placa as placa, p.descricao, '+
                ' p.descricao_fiscal, COALESCE(p.prc_venda,0) as prc_venda, '+
                ' COALESCE(p.veiculo_fipe,0) as veiculo_fipe, '+
                ' case when p.estoque_atual =1 then ''SIM'' else ''NÃO'' end as estoque,'+
                ' vm.descricao as nmmodelo,'+
                ' l.localizacao as local,'+
                ' p.id_produto as id_veiculo,'+
                ' concat(p.veiculo_ano,''/'',p.veiculo_ano_modelo) as anomodelo, '+
                ' p.codigo, '+
                ' case when p.foto1 is not null and p.foto1 <> '''' then ''SIM'' else ''NÃO'' end as temfoto'+
                ' from produto p '+
                ' inner join veiculo_modelo vm'+
                ' on p.id_veiculo_modelo = vm.id_veiculo_modelo'+
                ' inner join localizacao l'+
                ' on p.id_localizacao = l.id_localizacao'+
                ' where p.id_produto >0 and p.id_veiculo_especie >0 and p.ativo=''S'' order by p.veiculo_placa');
    TabEntradaVeiculoLista.First;
end;

procedure TFrmEntradaVeiculo.cxGridDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if TabEntradaVeiculoLista.Active then
  begin
    if TabEntradaVeiculoLista.RecordCount >0 then
    begin
      AbrirFormVeiculoIncluir;
    end;
  end;

end;

procedure TFrmEntradaVeiculo.cxGridDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    AbrirFormVeiculoIncluir;
  end;
end;

procedure TFrmEntradaVeiculo.cxGridDBTableView2CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  //Ao clicar duas vezes no veiculo chamar a funcao para editar.
  btnEditar.Click;

end;

procedure TFrmEntradaVeiculo.edtCadPessoaPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
msg:string;
Permissao   : TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Pessoa');

  if Permissao.TemPermissao('Permitir Criar Novo') then
  begin
    Try

      //15/05/2025 Abrir cadastro de pessoa
      Try
        FrmPessoaCad            := TFrmPessoaCad.Create(Application);
        TNavigation.ParamInt    := 0;
        TNavigation.ParamsStr   := 'N';

        FrmPessoaCad.ShowModal;
      Finally
        CarregarCLookupListaPessoa;
      End;

    Finally
      CarregarCLookupListaPessoa;
    End;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmEntradaVeiculo.edtCadResposavelPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
msg:string;
Permissao   : TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Funcionário');

  if Permissao.TemPermissao('Permitir Criar Novo') then
  begin
    Try

      //15/05/2025 Abrir cadastro de funcionario
      Try
        FrmFuncionarioCad      := TFrmFuncionarioCad.Create(Application);
        TNavigation.ParamInt   := 0;
        TNavigation.ParamsStr  := 'N';

        FrmFuncionarioCad.ShowModal;
      Finally
        CarregarCLookupListaFuncionario
      End;

    Finally
      CarregarCLookupListaFuncionario
    End;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmEntradaVeiculo.edtPesquisaPropertiesChange(Sender: TObject);
begin
  inherited;
  Localizar;
end;

Procedure TFrmEntradaVeiculo.CarregarCLookupListaPessoa;
begin
  TLookupHelper.CarregarLookup(
                TabCliente,'Select                                              '+
                           ' s.id_socio,                                        '+
                           ' Concat(s.codfornecedor,'' | '',s.nome) as cliente, '+
                           ' s.cpf                                              '+
                           ' from socio s                                       '+
                           ' where situacao=''ATIVO''                           '+
                           ' and s.fornecedor in (''S'',''N'') and s.excluido=0 ');
end;

Procedure TFrmEntradaVeiculo.CarregarCLookupListaFuncionario;
begin


  TLookupHelper.CarregarLookup(TabVendedor, 'Select                                      '+
                           ' F.id_funcionario,                          '+
                           ' Concat(F.codigo,'' | '',F.nome) as Func,   '+
                           ' F.cpf                                      '+
                           ' From funcionario f                         '+
                           ' where id_funcionario >0                    '+
                           ' and ativo=''S''                          '+
                           ' and vendedor=''S'' order by Func');
end;

procedure TFrmEntradaVeiculo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
  Permissao   : TPermissaoUsuario;
begin
  inherited;

  if key = vk_F2 then
  begin
    btncadveiculo.Click;
    key:=0;
  end;

  if key = vk_F3 then
  begin
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Pessoa');

    if Permissao.TemPermissao('Permitir Criar Novo') then
    begin
      Try

        //15/05/2025 Abrir cadastro de pessoa
        Try
          FrmPessoaCad            := TFrmPessoaCad.Create(Application);
          TNavigation.ParamInt    := 0;
          TNavigation.ParamsStr   := 'N';

          FrmPessoaCad.ShowModal;
        Finally
          CarregarCLookupListaPessoa;
        End;

      Finally
        CarregarCLookupListaPessoa;
      End;
    end
    else
      JKDialog('Acesso Negado',
               'O seu perfil não tem permissão para utilizar.' + sLineBreak +
               'Por favor, entre em contato com o administrador do sistema.',
               tdAlerta);
    key:=0;
  end;

  if key = vk_F4 then
  begin
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Funcionário');

    if Permissao.TemPermissao('Permitir Criar Novo') then
    begin
      Try

        //15/05/2025 Abrir cadastro de funcionario
        Try
          FrmFuncionarioCad      := TFrmFuncionarioCad.Create(Application);
          TNavigation.ParamInt   := 0;
          TNavigation.ParamsStr  := 'N';

          FrmFuncionarioCad.ShowModal;
        Finally
          CarregarCLookupListaFuncionario
        End;

      Finally
        CarregarCLookupListaFuncionario
      End;
    end
    else
      JKDialog('Acesso Negado',
               'O seu perfil não tem permissão para utilizar.' + sLineBreak +
               'Por favor, entre em contato com o administrador do sistema.',
               tdAlerta);
    key:=0;
  end;

  if key = vk_F1 then
  begin
    if edtStatus.Checked=False then
    edtStatus.Checked := True
    else
    edtStatus.Checked := False;
    key:=0;
  end;

end;

procedure TFrmEntradaVeiculo.FormShow(Sender: TObject);
var
msg:string;
Val :TValidacao;
idfunc:integer;
begin
  inherited;
  idcompra    := 0;
  CarregarCLookupListaPessoa;
  CarregarCLookupListaFuncionario;

  CarregarVeiculoLista;

  if TNavigation.ParamsStr='N' then
  begin
    lbrascunho.Hint             := 'Rascunho';
    lbrascunho.Visible          := True;

    Val   := TValidacao.Create;
    Try
      if Val.VendedorPadraoPedido(idfunc,TSession.ID_USUARIO) then
      edtVendedor.EditValue       := idfunc;
    Finally
      FreeAndNil(Val);
    End;

    //Inserir no banco
    if not InserirRegistro then
    begin
      JKDialog('Erro','Erro ao iniciar uma nova entrada de veículo!', tderro);
      btncancelar.Click;
    end;

    edttipo.SetFocus;
  end
  else
  if TNavigation.ParamsStr='E' then
  begin
    idcompra                    := TNavigation.ParamInt;
    lbrascunho.Hint             := 'Editando';
    lbrascunho.Caption          := 'Editando';
    lbrascunho.Visible          := True;
    PageControl1.ActivePage     := TabCarrinho;
    //CarregarVeiculoLista;
    btnEditar.Visible           := True;
    btnexcluir.Visible          := True;

    CarregarDados;
    CalcularValores;
    edttipo.SetFocus;
  end;

end;

procedure TFrmEntradaVeiculo.CarregarDados;
var
  Controller  : TEntradaVeiculoController;
  Documento   : TEntradaVeiculo;
begin
  inherited;

  Controller := TEntradaVeiculoController.Create;
  try
    Documento := Controller.BuscarPorId(TNavigation.ParamInt);

    if Assigned(Documento) then
    begin
      // Preencher os campos da tela

      edtPedido.EditValue           := Documento.numero;
      edtdata.EditValue             := Documento.data;
      edthora.EditValue             := Documento.hora;
      edttipo.Text                  := Documento.tipo;
      edtcliente.EditValue          := Documento.id_pessoa;
      edtVendedor.EditValue         := Documento.id_responsavel;
      edtobs.EditValue              := Documento.obs;
      if Documento.situacao <>'R' then
      edtstatus.EditValue           := Documento.situacao;
      edtGerarFinanceiro.EditValue  := Documento.gerar_financeiro;
      edtGerarEstoque.EditValue     := Documento.gerar_estoque;

      Documento.Free;
      CarregarVeiculoCarrinho;
    end
    else
      JKDialog('Aviso','Não foi possivel carregar os dados.', tdAlerta);

  finally
    Controller.Free;
  end;

end;

procedure TFrmEntradaVeiculo.Localizar;
var
  Texto: string;
  Codigo: string;
  Filtro: string;
begin
  //Pesquisa Veiculo

  Texto := edtpesquisa.Text;

  // Verifica se o texto começa com um dos filtros
  if Texto.StartsWith('//') then
    Filtro := '//'
  else if Texto.StartsWith('**') then
    Filtro := '**'
  else if Texto.StartsWith('--') then
    Filtro := '--'
  else
    Filtro := ''; // Se não começa com nenhum filtro, não faz nada
  // Extrai o texto (ou termo de pesquisa) após o filtro

  Codigo := Copy(Texto, Length(Filtro) + 1, MaxInt);
  try

    TabEntradaVeiculoLista.Filtered := False; // Desativa o filtro atual

    if Filtro = '//' then
    begin
      if codigo <> '' then  //por codigo
        TabEntradaVeiculoLista.Filter := 'codigo = ' + IntToStr(StrToInt(Codigo))
      else
        TabEntradaVeiculoLista.Filter := '';
    end
    else
    if Filtro = '**' then  //ano/modelo
    begin
      if codigo <> '' then
        TabEntradaVeiculoLista.Filter := 'descricao_fiscal like ' + QuotedStr('%' + Codigo + '%')
      else
        TabEntradaVeiculoLista.Filter := '';
    end
    else
    if Filtro = '--' then  //ano/modelo ano
    begin
      if codigo <> '' then
        TabEntradaVeiculoLista.Filter := 'anomodelo like ' + QuotedStr('%' + Codigo + '%')
      else
        TabEntradaVeiculoLista.Filter := '';
    end
    else
    if Filtro = '' then
    begin
      TabEntradaVeiculoLista.Filter := 'placa like ' + QuotedStr('%' + Codigo + '%');
    end;
    TabEntradaVeiculoLista.Filtered := True; // Ativa o novo filtro
  except
    on E: Exception do
      ShowMessage('Erro ao filtrar os dados: ' + E.Message);
  end;
end;

procedure TFrmEntradaVeiculo.PageControl1Change(Sender: TObject);
begin
  inherited;
  if PageControl1.ActivePage  = TabCarrinho then
  begin
    btnEditar.Visible       := True;
    btnexcluir.Visible      := True;
  end
  else
  begin
    btnEditar.Visible       := False;
    btnexcluir.Visible      := False;
  end;
end;

Procedure TFrmEntradaVeiculo.AbrirFormVeiculoIncluir;
begin
  //Form para Incluir Veiculo

  if edttipo.ItemIndex=-1 then
  begin
    EdtTipo.SetFocus;
    JKDialog('Aviso','Selecione o tipo de operação para iniciar a entrada do veículo!', tdAlerta);
    Exit;
  end;

  if (edtcliente.EditValue=0) or (edtCliente.Text='') then
  begin
    EdtCliente.SetFocus;
    JKDialog('Aviso','Informe uma pessoa para iniciar essa operação!', tdAlerta);
    Exit;
  end;


  with cxGridDBTableView1.controller do
    begin
      if SelectedRowCount <=0 then
      begin
        JKDialog('Aviso','Nenhum veículo selecionado!', tdAlerta);
        Exit;
      end;

        Try
          FrmEntradaVeiculoSelecionar          := TFrmEntradaVeiculoSelecionar.Create(Application);

          FrmEntradaVeiculoSelecionar.Tag      := dsVeiculoLista.DataSet.FieldByName('id_veiculo').AsInteger;
          FrmEntradaVeiculoSelecionar.StrOperacao	:= edtTipo.ItemIndex;
          FrmEntradaVeiculoSelecionar.IdCompra := idCompra;
          FrmEntradaVeiculoSelecionar.str      := 'N';
          FrmEntradaVeiculoSelecionar.ShowModal;
        Finally
          CarregarVeiculoCarrinho;
          CalcularValores;
        End;
    end;
end;

Procedure TFrmEntradaVeiculo.ImpressoConsignado;
begin

end;

Procedure TFrmEntradaVeiculo.ImpressoConsignadoLoja;
begin

end;

Procedure TFrmEntradaVeiculo.ImpressoProprio;
begin
  TLookupHelper.CarregarLookup(
                Tab_RelEntrada,'Select                                         '+
               ' c.id_compra,                                                  '+
               ' c.numero as ncontrato,                                        '+
               ' c.data,                                                       '+
               ' c.hora,                                                       '+
               ' c.tipo,                                                       '+
               ' c.obs,                                                        '+
               ' coalesce(c.vlr_troca,0) as vlrTroca,                          '+
               ' coalesce(c.vlr_subtotal,0) as vlrsubtotal,                    '+
               ' coalesce(c.vlr_total,0) as vlrtotal,                          '+
               ' coalesce(c.vlr_desconto,0) as vlrdesconto,                    '+
               ' s.codigo as pessoacodigo,                                     '+
               ' s.nome as pessoanome,                                         '+
               ' s.apelido as pessoaapelido,                                   '+
               ' s.cep as pessoacep,                                           '+
               ' s.endereco as pessoaendereco,                                 '+
               ' s.numero as pessoanumero,                                     '+
               ' s.bairro as pessoabairro,                                     '+
               ' s.complemento as pessoacomp,                                  '+
               ' s.telefone as pessoatelefone,                                 '+
               ' s.celular as pessoacelular,                                   '+
               ' s.whatsapp as pessoawhatsapp,                                 '+
               ' s.cpf as pessoacpf,                                           '+
               ' s.rg as pessoarg,                                             '+
               ' s.orgao as pessoaorgao,                                       '+
               ' s.sexo as pessoasexo,                                         '+
               ' s.estado_civil as pessoacivil,                                '+
               ' s.nascimento as pessoanascimento,                             '+
               ' s.email as pessoaemail,                                       '+
               ' s.nacionalidade as pessoanacionalidade,                       '+
               ' e.cidade as pessoacidade                                      '+
               ' From Compra c, Socio s, Funcionario f, cidade e               '+
               ' where c.id_pessoa = s.id_socio                                '+
               ' and c.id_responsavel = f.id_funcionario                       '+
               ' and s.id_cidade = e.cidade                                    '+
               ' and c.id_compra='+intToStr(idcompra)+';');

  TLookupHelper.CarregarLookup(
                Tab_RelEntradaVeiculos,'Select                                 '+
               ' i.qtde,                                                       '+
               ' Coalesce(i.prc_unitario,0) as vlrunitario,                    '+
               ' coalesce(i.desc_percentual,0) as vlrdescontoperc,             '+
               ' coalesce(i.desc_reais,0) as vlrdesconto,                      '+
               ' i.complemento,                                                '+
               ' Coalesce(i.subtotal,0) as vlrsubtotal,                        '+
               ' coalesce(i.total,0) as vlrtotal,                              '+
               ' i.veiculo_troca as troca,                                     '+
               ' p.codigo as veiccodigo,                                       '+
               ' p.descricao as veicdescricao,                                 '+
               ' p.descricao_fiscal as veicfiscal,                             '+
               ' p.veiculo_origem,                                             '+
               ' p.veiculo_ano,                                                '+
               ' p.veiculo_ano_modelo,                                         '+
               ' p.veiculo_combustivel,                                        '+
               ' p.veiculo_cambio,                                             '+
               ' p.veiculo_cor,                                                '+
               ' p.veiculo_porta,                                              '+
               ' p.veiculo_km,                                                 '+
               ' p.veiculo_placa,                                              '+
               ' p.veiculo_uf,                                                 '+
               ' p.veiculo_renavan,                                            '+
               ' p.veiculo_chassi,                                             '+
               ' p.veiculo_crv,                                                '+
               ' p.veiculo_tipo_crv,                                           '+
               ' m.marca,                                                      '+
               ' g.grupo,                                                      '+
               ' e.descricao as veiculoespecie,                                '+
               ' vm.descricao as veiculomodelo                                 '+
               ' From Compra_itens i, produto p, marca m, grupo g,             '+
               ' veiculo_especie e, veiculo_modelo vm                          '+
               ' where                                                         '+
               ' i.id_produto_veiculo = p.id_produto                           '+
               ' and p.id_marca = m.id_marca                                   '+
               ' and p.id_grupo = g.id_grupo                                   '+
               ' and p.id_veiculo_especie  = e.id_veiculo_especie              '+
               ' and p.id_veiculo_modelo  = vm.id_veiculo_modelo               '+
               ' and i.id_compra='+Inttostr(idcompra)+';');

  FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelContratoEntradaProprio.fr3');
  FrxRelatorio.Report.PrepareReport();
  FrxRelatorio.ShowReport;
end;


{$ENDREGION}


{$REGION 'Botoes'}

procedure TFrmEntradaVeiculo.btncadveiculoClick(Sender: TObject);
var
msg:string;
Permissao   : TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Controle Veículo');

  if Permissao.TemPermissao('Permitir Criar Novo') then
  begin
    Try

      //15/05/2025 Abrir cadastro de veiculo
      Try
        FrmCadVeiculo                 := TFrmCadVeiculo.Create(Application);
        TNavigation.ParamInt          := 0;
        TNavigation.ParamsStr         := 'N';
        TNavigation.ParamsStrCompraOP := Trim(edttipo.Text);

        FrmCadVeiculo.ShowModal;
      Finally
        CarregarVeiculoLista;
      End;

    Finally
      CarregarVeiculoLista;
    End;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);

end;

procedure TFrmEntradaVeiculo.btnCancelarClick(Sender: TObject);
var
Controller  : TEntradaVeiculoController;
msg:string;
begin
  //Aqui vamos chegar se a compra esta ainda em rascunho e alertar o usuario

  if lbrascunho.Hint= 'Rascunho' then
  begin
    if JKDialog('Aviso', 'Registro de entrada não foi salvo!'+#13+'Confirmar sair sem salvar os dados?', tdMensagem)  then
    begin
      Controller     := TEntradaVeiculoController.Create;
      Try

        Try
          if Controller.Excluir(idcompra) then
          begin
            inherited;
          end;
        except on e:exception do
          begin
          JKDialog('Erro','Erro ao exclui o registro.'+#13+e.Message, tdAlerta);
          end;
        end;

      Finally
        Controller.free;
      End;
    end;
  end
  else
  if lbrascunho.Hint= '' then
  inherited
  else
  if lbrascunho.Hint= 'Editando' then
  inherited;

end;

procedure TFrmEntradaVeiculo.btncarrinhoClick(Sender: TObject);
begin

  if PageControl1.ActivePage  = TabLista then
  begin
    PageControl1.ActivePage := TabCarrinho;
    btnEditar.Visible       := True;
    btnexcluir.Visible      := True;
  end
  else
  begin
    PageControl1.ActivePage := TabLista;
    btnEditar.Visible       := False;
    btnexcluir.Visible      := False;
  end;
end;

procedure TFrmEntradaVeiculo.btnEditarClick(Sender: TObject);
var
Permissao   : TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Entrada Veículo');

  if Permissao.TemPermissao('Permitir Editar Veículo Compra') then
  begin
    if TabVeiculoCompraLista.RecordCount <=0 then
    begin
      JKDialog('Aviso','Nenhum veículo selecionado!', tdAlerta);
      exit;
    end;

    if JKDialog('Aviso', 'Confirma editar o veículo selecionado?', tdMensagem)  then
    begin
      with cxGridDBTableView2.controller do
      begin
        if SelectedRowCount <=0 then
        begin
          JKDialog('Aviso','Nenhum veículo selecionado!', tdAlerta);
          Exit;
        end;

        Try
          FrmEntradaVeiculoSelecionar             := TFrmEntradaVeiculoSelecionar.Create(Application);
          FrmEntradaVeiculoSelecionar.Tag         := dscarrinho.DataSet.FieldByName('id').AsInteger;  //id do id_compra_itens
          FrmEntradaVeiculoSelecionar.StrOperacao	:= edtTipo.ItemIndex;
          FrmEntradaVeiculoSelecionar.IdCompra    := idCompra;
          FrmEntradaVeiculoSelecionar.str         := 'E';
          FrmEntradaVeiculoSelecionar.ShowModal;
        Finally
          CarregarVeiculoCarrinho;
          CalcularValores;
        End;
      end;
    end;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmEntradaVeiculo.btnexcluirClick(Sender: TObject);
var
ModelCompra : TModelCompraVeiculo;
Permissao   : TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Entrada Veículo');

  if Permissao.TemPermissao('Excluir Veículo Compra') then
  begin

    if TabVeiculoCompraLista.RecordCount <=0 then
    begin
      JKDialog('Aviso','Nenhum veículo selecionado para excluir!', tdAlerta);
      exit;
    end;

    if JKDialog('Aviso', 'Confirma excluir o veículo selecionado?', tdMensagem)  then
    begin
      ModelCompra := TModelCompraVeiculo.Create;
      Try
        if ModelCompra.ExcluirVeiculoCompra(idcompra,dsCarrinho.DataSet.FieldByName('idveiculo').AsInteger) then
        begin
          CarregarVeiculocarrinho;
          CalcularValores;
        end;
      Finally
        FreeAndNil(ModelCompra);
      End;
    end;

  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);

end;


{$ENDREGION}


{$REGION 'Funcoes'}

function TFrmEntradaVeiculo.Salvar(out msg: string): Boolean;
var
I             : Integer;
Controller    : TEntradaVeiculoController;
Obj           : TEntradaVeiculo;

ContrLog      : TLogVeiculoController;
ObjLog        : TLogVeiculo;

ContrAtualizar: TVeiculoAtualizarController;
ObjAtualizar, ObjDoc: TVeiculoAtualizar;

ContrValores  : TVeiculoValoresController;
ObjValores    : TVeiculoValores;

//ContrEstoqueM : TEstoqueMovimentacaoController;
//ObjEstoqueM   : Testoquemovimentacao;
//
//ContrEstoqueG : TEstoqueGeralController;
//ObjEstoqueG   : Testoquegeral;
//
//ContrProduto  : TProdutoEstoqueController;
//ObjProduto    : TProdutoEstoque;

NumContrato   : integer;
idRet         : integer;

begin
  Result          := False;
  Controller      := nil;
  Obj             := Nil;
  ObjLog          := Nil;
  ContrAtualizar  := Nil;
  ObjAtualizar    := Nil;
  ContrValores    := Nil;
  ObjValores      := Nil;
//  ContrEstoqueM   := Nil;
//  ObjEstoqueM     := Nil;
//  ContrEstoqueG   := Nil;
//  ObjEstoqueG     := Nil;
//  ContrProduto    := nil;
//  ObjProduto      := Nil;


  Controller    := TEntradaVeiculoController.Create;
  Obj           := TEntradaVeiculo.Create;

  ContrLog      := TLogVeiculoController.Create;
  ObjLog        := TLogVeiculo.Create;

  ContrAtualizar:= TVeiculoAtualizarController.Create;
  ObjAtualizar  := TVeiculoAtualizar.Create;

  ContrValores  := TVeiculoValoresController.Create;
  ObjValores    := TVeiculoValores.Create;

//  ContrEstoqueM := TEstoqueMovimentacaoController.Create;
//  ObjEstoqueM   := Testoquemovimentacao.Create;
//
//  ContrEstoqueG := TEstoqueGeralController.Create;
//  ObjEstoqueG   := Testoquegeral.Create;
//
//  ContrProduto  := TProdutoEstoqueController.Create;
//  ObjProduto    := TProdutoEstoque.Create;

  Try
    //Passar os dados para model.
    Obj.Id_compra         := idCompra;
    Obj.Numero            := edtPedido.EditValue;
    Obj.Data              := edtData.EditValue;
    Obj.Hora              := edtHora.EditValue;
    Obj.Tipo              := edttipo.Text;
    Obj.Id_pessoa         := edtCliente.EditValue;
    Obj.Id_responsavel    := edtVendedor.EditValue;
    Obj.Situacao          := edtStatus.EditValue;
    Obj.Gerar_financeiro  := edtGerarFinanceiro.EditValue;
    Obj.Gerar_estoque     := edtGerarEstoque.EditValue;
    Obj.Obs               := Trim(edtObs.Text);
    Obj.vlr_troca         := edttroca.EditValue;
    Obj.vlr_subtotal      := edtsubtotal.EditValue;
    Obj.vlr_total         := EdtTotal.EditValue;
    Obj.vlr_desconto      := edtDesconto.EditValue;
    Obj.id_usuario_cancelado  := 0;
    Obj.data_cancelado    := NullDate;

    Try
      //Salvar Operacao
      if Controller.Salvar(Obj, idret) then
      begin
        Result  := True;

        //validar se esta concluindo ou nao
        if not edtStatus.Checked then
        begin
          {$REGION 'Atualizar Ficha veiculo'}

            //Atualizar ficha caso esteja marcado, Percorrer lista

            TabVeiculoCompraLista.First;
            TabVeiculoCompraLista.DisableControls;
            For I := 0 to TabVeiculoCompraLista.RecordCount -1 do
            begin
              if TabVeiculoCompraLista.FieldByName('veiculotroca').AsString = 'Não' then
              begin

                {$REGION 'Criar Log'}
                //Criar Log de Entrada pecorrendo a lista de veiculo
                  ObjLog.Id           := 0;
                  ObjLog.Idveiculo    := TabVeiculoCompraLista.FieldByName('idveiculo').AsInteger;
                  ObjLog.Idusuario    := TSession.ID_USUARIO;
                  ObjLog.Idempresa    := TSession.IDEMPRESA;
                  ObjLog.ndescricao   := 'Entrada de veículo '+edttipo.Text+' contrato nº '+IntTostr(Obj.Numero);
                  ContrLog.Salvar(ObjLog);
                {$ENDREGION}

                {$REGION 'Gravar Estoque'}

                if edtGerarEstoque.Checked=True then
                begin
//                  ObjEstoqueM.id_movimentacao       := 0;
//                  ObjEstoqueM.id_produto            := TabVeiculoCompraLista.FieldByName('idveiculo').AsInteger;
//                  ObjEstoqueM.tipo                  := 'Entrada';
//                  ObjEstoqueM.quantidade            := 1;
//                  ObjEstoqueM.quantidade_anterior   := 0;
//                  ObjEstoqueM.preco_compra          := TabVeiculoCompraLista.FieldByName('total').AsFloat;
//                  ObjEstoqueM.preco_venda           := TabVeiculoCompraLista.FieldByName('vlrvenda').AsFloat;
//                  ObjEstoqueM.data_movimentacao     := now;
//                  ObjEstoqueM.id_usuario            := TSession.ID_USUARIO;
//                  ObjEstoqueM.observacao            := 'Registro de Entrada de Veículo';
//                  ObjEstoqueM.id_empresa            := TSession.IDEMPRESA;
//                  ObjEstoqueM.num_operacao          := Obj.Numero;
//                  ObjEstoqueM.id_pedido             := -1;
//                  ObjEstoqueM.id_compra             := idcompra;
//
//                  if ContrEstoqueM.GravarMovimentacao(ObjEstoqueM) then
//                  begin
//                    //Atualizar tabela estoque.
//
//                    ObjEstoqueG.id_produto          := TabVeiculoCompraLista.FieldByName('idveiculo').AsInteger;
//                    ObjEstoqueG.qtde                := 1;
//                    ObjEstoqueG.id_empresa          := TSession.IDEMPRESA;
//
//                    if ContrEstoqueG.GravarEstoque(ObjEstoqueG) then
//                    begin
//                      //atualiza a ficha do produto.
//                      ObjProduto.id_produto         := TabVeiculoCompraLista.FieldByName('idveiculo').AsInteger;
//                      ObjProduto.estoque_atual      := 1;
//                      ObjProduto.qtdenova           := 1;
//                      ContrProduto.GravarProduto(ObjProduto);
//                    end;
//
//                  end;

                end;

                {$ENDREGION}

                {$REGION 'Buscar Ficha veiculo e atualiza'}

                if TabVeiculoCompraLista.FieldByName('atualizarficha').AsString = 'S' then
                begin
                    ObjDoc  := ContrAtualizar.BuscarPorID(TabVeiculoCompraLista.FieldByName('idveiculo').AsInteger);

                    {$REGION 'Inserir Produto Valores'}
                      if Assigned(ObjDoc) then
                      begin
                        //Inserir registro na tabela de produto valores antes de atualizar a ficha do veiculo
                        ObjValores.id_valores                 := 0;
                        ObjValores.id_produto                 := ObjDoc.Id ;
                        ObjValores.id_compra                  := idCompra;
                        ObjValores.id_pedido                  := -999;
                        ObjValores.historico                  := 'Entrada de Veículo';
                        ObjValores.data_movimentacao          := Now;
                        ObjValores.vlr_fipe                   := ObjDoc.veiculo_fipe;
                        ObjValores.vlr_compra                 := ObjDoc.prc_compra;
                        ObjValores.vlr_lucro                  := ObjDoc.veiculo_lucro;
                        ObjValores.perc_lucro                 := ObjDoc.per_lucro ;
                        ObjValores.vlr_venda                  := ObjDoc.prc_venda;
                        ObjValores.vlr_troca                  := ObjDoc.veiculo_valortroca;
                        ObjValores.vlr_praticado              := ObjDoc.veiculo_valorpraticado;
                        ObjValores.taxames                    := ObjDoc.veiculo_patiotaxames;
                        ObjValores.taxadia                    := ObjDoc.veiculo_patiotaxadia;
                        ObjValores.totalpatio                 := ObjDoc.veiculo_patiototal;
                        ObjValores.lojacomissaopercentual     := ObjDoc.veiculo_comissaoljpercentual;
                        ObjValores.lojacomissaovelor          := ObjDoc.veiculo_comissaoljtotal;
                        ObjValores.vendedorcomissaopercentual := ObjDoc.veiculo_comissaovendpercentual;
                        ObjValores.vendedorcomissaovalor      := ObjDoc.veiculo_comissaovendtotal;
                      end;


                      if ContrValores.Salvar(ObjValores) then
                      begin
                        //Atualizar a ficha caso gravado na produtovalores
                        ObjAtualizar.Id                             := TabVeiculoCompraLista.FieldByName('idveiculo').AsInteger;
                        ObjAtualizar.prc_compra                     := TabVeiculoCompraLista.FieldByName('total').AsFloat;
                        ObjAtualizar.veiculo_fipe                   := TabVeiculoCompraLista.FieldByName('vlrfipe').AsFloat;
                        //ObjAtualizar.prc_venda                      := TabVeiculoCompraLista.FieldByName('vlrvenda').AsFloat;
                        //ObjAtualizar.per_lucro                      := TabVeiculoCompraLista.FieldByName('vlrperclucro').AsFloat;
                        //ObjAtualizar.veiculo_patiotaxames           := TabVeiculoCompraLista.FieldByName('vlrtaxames').AsFloat;
                        //ObjAtualizar.veiculo_patiotaxadia           := TabVeiculoCompraLista.FieldByName('vlrtaxadia').AsFloat;
                        //ObjAtualizar.veiculo_patiototal             := TabVeiculoCompraLista.FieldByName('vlrtotalpatio').AsFloat;
                        //ObjAtualizar.veiculo_comissaoljpercentual   := TabVeiculoCompraLista.FieldByName('vlrcomissaolojaperc').AsFloat;
                        //ObjAtualizar.veiculo_comissaoljtotal        := TabVeiculoCompraLista.FieldByName('vlrcomissaoloja').AsFloat;
                        //ObjAtualizar.veiculo_comissaovendpercentual := TabVeiculoCompraLista.FieldByName('vlrcomissaovendperc').AsFloat;
                        //ObjAtualizar.veiculo_comissaovendtotal      := TabVeiculoCompraLista.FieldByName('vlrcomissaovend').AsFloat;
                        //ObjAtualizar.veiculo_lucro                  := TabVeiculoCompraLista.FieldByName('vlrlucro').AsFloat;
                        //ObjAtualizar.veiculo_valorpraticado         := TabVeiculoCompraLista.FieldByName('vlrpraticado').AsFloat;
                        ObjAtualizar.prc_custo                      := TabVeiculoCompraLista.FieldByName('vlrunitario').AsFloat;
                        //ObjAtualizar.veiculo_valortroca             := TabVeiculoCompraLista.FieldByName('vlrtroca').AsFloat;
                        ObjAtualizar.veiculo_custototal             := ObjAtualizar.prc_custo;

                        ContrAtualizar.Salvar(ObjAtualizar);

                      end;

                      TabVeiculoCompraLista.Next;

                    {$ENDREGION}
                end;

                {$ENDREGION}

              end
              else
              begin
                //Veiculo Troca remover do estoque e da a saida.
                {$REGION 'Criar Log'}
                //Criar Log de Entrada pecorrendo a lista de veiculo
                  ObjLog.Id           := 0;
                  ObjLog.Idveiculo    := TabVeiculoCompraLista.FieldByName('idveiculo').AsInteger;
                  ObjLog.Idusuario    := TSession.ID_USUARIO;
                  ObjLog.Idempresa    := TSession.IDEMPRESA;
                  ObjLog.ndescricao   := 'Saída de veículo '+edttipo.Text+' contrato nº '+IntTostr(Obj.Numero);
                  ContrLog.Salvar(ObjLog);
                {$ENDREGION}

                {$REGION 'Gravar Estoque saida'}

//                  ObjEstoqueM.id_movimentacao       := 0;
//                  ObjEstoqueM.id_produto            := TabVeiculoCompraLista.FieldByName('idveiculo').AsInteger;
//                  ObjEstoqueM.tipo                  := 'Saída';
//                  ObjEstoqueM.quantidade            := -1;
//                  ObjEstoqueM.quantidade_anterior   := 1;
//                  ObjEstoqueM.preco_compra          := TabVeiculoCompraLista.FieldByName('total').AsFloat;
//                  ObjEstoqueM.preco_venda           := TabVeiculoCompraLista.FieldByName('vlrvenda').AsFloat;
//                  ObjEstoqueM.data_movimentacao     := now;
//                  ObjEstoqueM.id_usuario            := TSession.ID_USUARIO;
//                  ObjEstoqueM.observacao            := 'Registro de Saída de Veículo negociação base de troca';
//                  ObjEstoqueM.id_empresa            := TSession.IDEMPRESA;
//                  ObjEstoqueM.num_operacao          := Obj.Numero;
//                  ObjEstoqueM.id_pedido             := -1;
//                  ObjEstoqueM.id_compra             := idcompra;
//
//                  if ContrEstoqueM.GravarMovimentacao(ObjEstoqueM) then
//                  begin
//                    //Atualizar tabela estoque.
//                    ObjEstoqueG.id_produto          := TabVeiculoCompraLista.FieldByName('idveiculo').AsInteger;
//                    ObjEstoqueG.qtde                := -1;
//                    ObjEstoqueG.id_empresa          := TSession.IDEMPRESA;
//
//                    if ContrEstoqueG.GravarEstoque(ObjEstoqueG) then
//                    begin
//                      //atualiza a ficha do produto.
//                      ObjProduto.id_produto         := TabVeiculoCompraLista.FieldByName('idveiculo').AsInteger;
//                      ObjProduto.estoque_atual      := 1;
//                      ObjProduto.qtdenova           := -1;
//                      ContrProduto.GravarProduto(ObjProduto);
//                    end;
//                  end;

                {$ENDREGION}

              end;
            end;

            TabVeiculoCompraLista.EnableControls;


          {$ENDREGION}

          {$REGION 'Financeiro'}
            case edttipo.ItemIndex of
              0:begin //Consignado

              end;
              1:begin //Consignado Loja

              end;
              2:begin //Próprio
                GerarFinanceiro;
              end;
              3:begin  //Zero
                GerarFinanceiro;
              end;
            end;

          {$ENDREGION}

          {$REGION 'Impresso Contrato'}

          //Modelo de Contrato
          if edttipo.ItemIndex <> 3 then
          begin
            if JKDialog('Aviso', 'Deseja imprimir o contrato?', tdMensagem)  then
            begin
              case edttipo.ItemIndex of
                0: ImpressoConsignado;
                1: ImpressoConsignadoLoja;
                2: ImpressoProprio;
              end;
            end;
          end;

          {$ENDREGION}

          Msg := 'Registro salvo com sucesso!';
        end
        else
        begin
          Msg := 'Registro salvo com sucesso!';
        end;
      end;

    except on e:exception do
      begin
        raise Exception.Create(e.Message);
      end;
    End;

  Finally
    FreeAndNil(Controller);
    FreeAndNil(Obj);
    FreeAndNil(ContrLog);
    FreeAndNil(ObjLog);
    FreeAndNil(ContrAtualizar);
    FreeAndNil(ObjAtualizar);
    FreeAndNil(ContrValores);
    FreeAndNil(ObjValores);
//    FreeAndNil(ContrEstoqueM);
//    FreeAndNil(ObjEstoqueM);
//    FreeAndNil(ContrEstoqueG);
//    FreeAndNil(ObjEstoqueG);
//    FreeAndNil(ContrProduto);
//    FreeAndNil(ObjProduto);
  End;

end;

Procedure TFrmEntradaVeiculo.GerarFinanceiro;
begin
            if edtGerarFinanceiro.Checked then
            begin
              FrmEntradaVeiculoPagamento          := TFrmEntradaVeiculoPagamento.Create(Application);
              FrmEntradaVeiculoPagamento.Tag      := idCompra;
              FrmEntradaVeiculoPagamento.IdCompra := idCompra;
              FrmEntradaVeiculoPagamento.numerocontrato := edtPedido.EditValue;
              FrmEntradaVeiculoPagamento.Subtotal := edtsubtotal.EditValue;
              FrmEntradaVeiculoPagamento.Total    := EdtTotal.EditValue;
              FrmEntradaVeiculoPagamento.ShowModal;
            end;
end;

Function TFrmEntradaVeiculo.InserirRegistro():Boolean;
var
Controller  : TEntradaVeiculoController;
Obj         : TEntradaVeiculo;
begin
  Result      := False;

  Controller  := TEntradaVeiculoController.Create;
  Obj         := TEntradaVeiculo.Create;

  try
    Obj.Id_compra         := 0;
    Obj.Id_empresa        := TSession.IDEMPRESA;
    Obj.Id_usuario        := TSession.ID_USUARIO;
    Obj.Numero            := 0;
    Obj.Data              := Now;
    Obj.Hora              := Now;
    Obj.Tipo              := 'PRÓPRIO';
    Obj.Id_pessoa         := -9999;
    Obj.Id_responsavel    := -9999;
    Obj.Situacao          := 'R';
    Obj.Gerar_financeiro  := 'S';
    Obj.Gerar_estoque     := 'S';
    Obj.Data_criado       := Now;

    Result := Controller.Salvar(Obj, idcompra);
    if not Result then
      Result  := False
    else
    result  := True;
  finally
    Controller.Free;
    Obj.Free;
    TNavigation.ParamInt    := idcompra;
    CarregarDados;
  end;

end;

function TFrmEntradaVeiculo.SomarTotalVeiculos: Double;
var
  Total: Double;
begin
  Total := 0;
  with TabVeiculoCompraLista do
  begin
    First;
    while not Eof do
    begin
      if FieldByName('veiculotroca').AsString = 'Não' then
      Total := Total + FieldByName('subtotal').AsFloat;
      Next;
    end;
  end;
  Result := Total;
end;

function TFrmEntradaVeiculo.SomarTotalVeiculosTroca: Double;
var
  Total: Double;
begin
  Total := 0;
  with TabVeiculoCompraLista do
  begin
    First;
    while not Eof do
    begin
      if FieldByName('veiculotroca').AsString = 'Sim' then
      Total := Total + FieldByName('total').AsFloat;
      Next;
    end;
  end;
  Result := Total;
end;

function TFrmEntradaVeiculo.SomarTotalVeiculosDesconto: Double;
var
  Total: Double;
begin
  Total := 0;
  with TabVeiculoCompraLista do
  begin
    First;
    while not Eof do
    begin
      if FieldByName('veiculotroca').AsString = 'Não' then
      Total := Total + FieldByName('desconto').AsFloat;
      Next;
    end;
  end;
  Result := Total;
end;

function TFrmEntradaVeiculo.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if (edtData.Text='') then
  begin
    msg     := 'Informe a data de entrada!';
    Result  := False;
    exit;
  end;

  if (edttipo.ItemIndex = -1) then
  begin
    msg     := 'Informe o tipo de operação!';
    Result  := False;
    exit;
  end;

  if (edtcliente.EditValue=0) or (edtcliente.Text='') then
  begin
    msg     := 'Selecione uma pessoa!';
    Result  := False;
    exit;
  end;

  if (edtvendedor.EditValue=0) or (edtvendedor.Text='') then
  begin
    msg     := 'Selecione o responsável!';
    Result  := False;
    exit;
  end;

end;


{$ENDREGION}


end.
