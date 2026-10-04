unit UnitVeiculoEntrada;

{

Altura da tela padrao

Height = 309


PanelIncluir = 205
Panelcancelar= 205

edtatualizarficha = 200
edtTroca          = 200

LabelObs    = top 109
 edtcomplemento = 127


**
LabelObs    = 289
edtcomplemento = 308
 edtatualizarficha = 381
edtTroca = 381

Panelcancelar = 389
PanelIncluir = 389

 FrmEntradaVeiculoSelecionar h 499
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Navigation, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBasic,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Black, dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxButtonEdit, cxMaskEdit, cxDropDownEdit, cxTextEdit,
  cxBlobEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxGroupBox,
  cxCurrencyEdit, cxMemo, ACBrBase, ACBrEnterTab, cxCheckBox, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxCalendar,
  System.Generics.Collections;

type
  TFrmEntradaVeiculoSelecionar = class(TForm)
    lblTitulo: TLabel;
    Paneltitulo: TPanel;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtCodigo: TcxTextEdit;
    edtdescricao: TcxTextEdit;
    edtQtde: TcxCurrencyEdit;
    edtdescpercentual: TcxCurrencyEdit;
    edtvalortotal: TcxCurrencyEdit;
    edtunitario: TcxCurrencyEdit;
    label_unitario: TLabel;
    edtFipe: TcxCurrencyEdit;
    edtdescontoreais: TcxCurrencyEdit;
    LabelObs: TLabel;
    edtcomplemento: TcxMemo;
    ACBrEnter: TACBrEnterTab;
    Panelcancelar: TPanel;
    btnCancelar: TSpeedButton;
    PanelIncluir: TPanel;
    btnIncluir: TSpeedButton;
    edtPlaca: TcxTextEdit;
    Label11: TLabel;
    edtTroca: TcxCheckBox;
    edtatualizarficha: TcxCheckBox;
    btnvalores: TSpeedButton;
    cxValores: TcxGroupBox;
    edttaxaconsignado: TcxCurrencyEdit;
    Label3: TLabel;
    edtDataRetirada: TcxDateEdit;
    Label9: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtQtdeExit(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtvalortotalExit(Sender: TObject);
    procedure edtcomplementoExit(Sender: TObject);
    procedure edtcomplementoKeyPress(Sender: TObject; var Key: Char);
    procedure edtunitarioExit(Sender: TObject);
    procedure edtdescpercentualExit(Sender: TObject);
    procedure edtdescontoreaisExit(Sender: TObject);
    procedure btnvaloresClick(Sender: TObject);

    procedure vlrCustogeraisEnter(Sender: TObject);
    procedure edtperlucroEnter(Sender: TObject);
    procedure edtprcvendaEnter(Sender: TObject);


    procedure edtvalortotalKeyPress(Sender: TObject; var Key: Char);
  private
    UltimoCampoAlterado: string;


    Procedure MudarRotuloCampos(i:integer);
    Procedure PopularTela;
    function ValidarCampos(out msg: string): Boolean;
    function Salvar(out msg: string): Boolean;
    procedure CalcularTotal;
    Procedure AjusteTelaValores;
    Procedure TaxaConsignado;
    //procedure PopularTelaValores;
    Procedure PopularDadosCompraItens;
    //Procedure CalculaLucro;
    { Private declarations }
  public
    idCompra:integer;
    StrOperacao:integer;
    Str:String;
    { Public declarations }
  end;

var
  FrmEntradaVeiculoSelecionar: TFrmEntradaVeiculoSelecionar;

implementation

{$R *.dfm}

Uses Model.Compra, Vcl.Loading, Vcl.Session, uJKDialog, Vcl.Validacoes,
  Model.EntradaVeiculoItens, Controller.EntradaVeiculoItens,
  uConfiguracaoService;

procedure TFrmEntradaVeiculoSelecionar.AjusteTelaValores;
begin
  if cxValores.Visible = False then
  begin
    FrmEntradaVeiculoSelecionar.Height    := 384;
    cxValores.Visible                     := True;
    cxValores.Height                      := 71;
    LabelObs.Top                          := 186;
    edtcomplemento.Top                    := 205;
    edtatualizarficha.Top                 := 278;
    edtTroca.Top                          := 278;
    Panelcancelar.Top                     := 278;
    PanelIncluir.Top                      := 278;
  end
  else
  begin
    FrmEntradaVeiculoSelecionar.Height    := 309;
    cxValores.Visible                     := False;
    LabelObs.Top                          := 109;
    edtcomplemento.Top                    := 128;
    edtatualizarficha.Top                 := 200;
    edtTroca.Top                          := 200;
    Panelcancelar.Top                     := 205;
    PanelIncluir.Top                      := 205;
  end;
end;

procedure TFrmEntradaVeiculoSelecionar.btnCancelarClick(Sender: TObject);
begin
  Close;
  //TNavigation.CloseCamada(Self);
end;

procedure TFrmEntradaVeiculoSelecionar.btnIncluirClick(Sender: TObject);
var
msg :String;
begin
  //

  if ValidarCampos(msg) then
  begin
    Try
       if Salvar(msg) then
        begin
          //JKDialog('Sucesso',msg, tdSucesso);
          Close;
          //TNavigation.CloseCamada(Self);
        end
        else
        JKDialog('Aviso',msg, tdAlerta);


    Except on e:exception do
      begin
        JKDialog('Aviso',msg+' :'+e.Message, tdErro);
        raise
      end;
    End;
  end
  else
  begin
    JKDialog('Aviso',msg, tdAlerta);
    exit;
  end;
end;

procedure TFrmEntradaVeiculoSelecionar.btnvaloresClick(Sender: TObject);
begin
  //Alterar o Formulario para preencher os demais campos disponivel.
  AjusteTelaValores;
  //PopularTelaValores;
end;

function TFrmEntradaVeiculoSelecionar.Salvar(out msg: string): Boolean;
var
  Controller  : TEntradaItensVeiculoController;
  Obj         : TEntradaVeiculoItens;
  idret       : integer;
begin
  Result  := False;

  Controller  := TEntradaItensVeiculoController.Create;
  Obj         := TEntradaVeiculoItens.Create;

  try
      Obj.IdCompraItens          := 0;
      Obj.idcompra               := idcompra;
      Obj.IdProdutoVeiculo       := FrmEntradaVeiculoSelecionar.tag;
      Obj.qtde                   := edtQtde.EditValue;
      Obj.descricao              := Trim(edtdescricao.Text);
      Obj.PrcUnitario            := edtunitario.EditValue;
      Obj.DescPercentual         := edtdescpercentual.EditValue;
      Obj.DescReais              := edtdescontoreais.EditValue;
      Obj.complemento            := Trim(edtcomplemento.Text);
      Obj.subtotal               := (edtQtde.EditValue * edtunitario.EditValue);
      Obj.total                  := edtvalortotal.EditValue;
      Obj.veiculotroca           := edttroca.EditValue;
      Obj.VeiculoPrcFipe         := edtfipe.EditValue;
      Obj.VeiculoPrcVenda        := 0;
      Obj.Data                   := now;
      Obj.idempresa              := TSession.IDEMPRESA;
      Obj.idusuario              := TSession.ID_USUARIO;

      //Valores
      Obj.prccusto               := 0;
      Obj.veiculovalortroca      := 0;
      Obj.veiculoperclucro       := 0;
      Obj.VeiculoLucroValor      := 0;
      Obj.veiculovalorpraticado  := 0;

      Obj.atualizarficha         := edtatualizarficha.EditValue;
      Obj.taxames                := 0;
      Obj.taxadia                := 0;
      Obj.totalpatio             := 0;
      Obj.comissaolojaperc       := 0;
      Obj.comissaolojavalor      := 0;
      Obj.comissaovendperc       := 0;
      Obj.comissaovendvalor      := 0;
      Obj.taxaconsignado         := edttaxaconsignado.EditValue;

      if (edtDataRetirada.Text<>'') then
      Obj.dataretiradaconsi      := edtDataRetirada.EditValue
      else
      Obj.dataretiradaconsi      := nulldate;

      if Str = 'N' then
      begin
        Result := Controller.Salvar(Obj, idRet);
        if not Result then
          msg := 'Erro ao salvar o registro.'
        else
        msg :=  'Registro salvo com sucesso!';
      end
      else
      begin
        Obj.IdCompraItens   := FrmEntradaVeiculoSelecionar.Tag;

        Result := Controller.Salvar(Obj, idRet);
        if not Result then
          msg := 'Erro ao salvar o registro.'
        else
        msg :=  'Registro salvo com sucesso!';
      end;

  finally
    Controller.Free;
    Obj.Free;
  end;

end;

procedure TFrmEntradaVeiculoSelecionar.TaxaConsignado;
begin
    edttaxaconsignado.EditValue   := TConfiguracaoService.TaxaVeiculoConsignado(TSession.IDEMPRESA)

end;

function TFrmEntradaVeiculoSelecionar.ValidarCampos(out msg: string): Boolean;
var
  Modelval  :TValidacao;
begin
  Result  := True;
  //

  if (edtQtde.EditValue=0) or (edtQtde.Text='') then
  begin
    msg := 'Informe uma quantidade!';
    Result  := False;
    exit;
  end;

  if (edtunitario.EditValue=0) or (edtunitario.Text='') then
  begin
    msg := 'Informe o preço unitário!';
    Result  := False;
    exit;
  end;

  if edtvalortotal.EditValue <=0 then
  begin
    msg := 'Verifique o valor total!';
    Result  := False;
    exit;
  end;

  if str = 'N' then
  begin

      if TConfiguracaoService.VeiculoExitsCompra(idcompra,FrmEntradaVeiculoSelecionar.tag) then
      begin
        msg := 'Veículo já consta inserido na lista de entrada!';
        Result  := False;
        exit;
      end;

  end;


end;

procedure TFrmEntradaVeiculoSelecionar.vlrCustogeraisEnter(Sender: TObject);
begin
  UltimoCampoAlterado := 'Custo';
end;

procedure TFrmEntradaVeiculoSelecionar.edtcomplementoExit(Sender: TObject);
begin
  ACBrEnter.EnterAsTab:= True;
end;

procedure TFrmEntradaVeiculoSelecionar.edtcomplementoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    btnIncluir.Click;
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);

  end;

end;

procedure TFrmEntradaVeiculoSelecionar.edtdescontoreaisExit(Sender: TObject);
begin
  if edtdescontoreais.Text='' then
  begin
    edtdescontoreais.EditValue  :=0;
    exit;
  end
  else
  CalcularTotal;

end;

procedure TFrmEntradaVeiculoSelecionar.edtdescpercentualExit(Sender: TObject);
begin
  if edtdescpercentual.Text='' then
  begin
    edtdescpercentual.EditValue :=0;
    exit;
  end
  else
  CalcularTotal;
end;

procedure TFrmEntradaVeiculoSelecionar.edtperlucroEnter(Sender: TObject);
begin
  UltimoCampoAlterado := 'Lucro';
end;

procedure TFrmEntradaVeiculoSelecionar.edtprcvendaEnter(Sender: TObject);
begin
  UltimoCampoAlterado := 'Venda';
end;



procedure TFrmEntradaVeiculoSelecionar.edtQtdeExit(Sender: TObject);

begin
  if edtQtde.Text='' then
  begin
    edtQtde.EditValue := 0;
    exit;
  end;

  CalcularTotal;
end;

{procedure TFrmEntradaVeiculoSelecionar.CalculaLucro;
var
  PrecoPago, DescontoPerc, DescontoValor, DescontoRS, ValorTotalPago: Currency;
  Custo, PrecoCustoTotal, Lucro, PrecoVenda: Currency;
  PercentualLucro: Double;
begin    // calcular sobre o custo
  // Pegando valores da tela
  PrecoPago       := edtunitario.Value;
  DescontoPerc    := edtdescpercentual.Value;
  DescontoRS      := edtdescontoreais.Value;
  Custo           := vlrCustogerais.Value;
  PercentualLucro := edtperlucro.Value;

  // Cálculo do desconto percentual
  DescontoValor   := PrecoPago * (DescontoPerc / 100);
  ValorTotalPago  := PrecoPago - DescontoValor - DescontoRS;

  // Cálculo do custo total
  PrecoCustoTotal := Custo;

  // Verifica qual campo foi alterado
  if UltimoCampoAlterado = 'Lucro' then
  begin

    // Se informou o % de lucro, calcular lucro e preço de venda
    if PercentualLucro > 0 then
    begin
      Lucro               := PrecoCustoTotal * (PercentualLucro / 100);
      PrecoVenda          := PrecoCustoTotal + Lucro;

      // Mostra na tela
      edtValorLucro.Value := Lucro;
      edtprcvenda.Value   := PrecoVenda;
    end;
  end
  else
  if UltimoCampoAlterado = 'Venda' then
  begin
    if edtprcvenda.Value > 0 then
    begin
      // Se informou o preço de venda, calcula o % de lucro
      PrecoVenda          := edtprcvenda.Value;
      Lucro               := PrecoVenda - PrecoCustoTotal;
      PercentualLucro     := (Lucro / PrecoCustoTotal) * 100;

      edtValorLucro.Value := Lucro;
      edtperlucro.Value   := PercentualLucro;
    end;

  end;


   }



  {

  if edtprcvenda.Value > 0 then
    begin
      // Se informou o preço de venda, calcula o % de lucro
      PrecoVenda          := edtprcvenda.Value;
      Lucro               := PrecoVenda - PrecoCustoTotal;
      PercentualLucro     := (Lucro / PrecoCustoTotal) * 100;

      edtValorLucro.Value := Lucro;
      edtperlucro.Value   := PercentualLucro;
    end
    else

  }



     {

end;}

Procedure TFrmEntradaVeiculoSelecionar.CalcularTotal;
var
  prcvenda  :Double;
  qtde      :Double;
  prctotal  :double;
  descontoPerc: Double;
  descontoRais: Double;
  valorDesconto: Double;
  valordesPercentual  :Double;
begin
  Try
    prcvenda  := edtunitario.EditValue;
    Qtde      := edtqtde.EditValue;

    descontoPerc := edtdescpercentual.EditValue;
    descontoRais := edtdescontoreais.EditValue;

    // Calcula sem o desconto
    prctotal  := qtde * prcvenda;

    // Calcular desconto %
    if (descontoPerc > 0) and (descontoRais = 0) then
    begin
      // Calcula o valor do desconto percentual
      valorDesconto := prctotal * (descontoPerc / 100);
      edtdescontoreais.EditValue  := valorDesconto;
    end;

    // Calcular desconto reais
    if (descontoRais > 0) and (descontoPerc = 0) then
    begin
      valordesPercentual    := (descontoRais / prctotal) *100;
      edtdescpercentual.EditValue := valordesPercentual;
    end;


    // Subtrai o desconto em reais
    prctotal := prctotal - valorDesconto - descontoRais;

    // Garante que o valor total não seja negativo
    if prctotal < 0 then
      prctotal := 0;

    // Atualiza o valor total no componente

    edtvalortotal.EditValue := prctotal; //Receber Total
    //vlrCustogerais.EditValue:= prctotal; //Receber total
    //CalculaLucro;
  Except
    edtvalortotal.EditValue := 0;
  End;

end;

procedure TFrmEntradaVeiculoSelecionar.edtunitarioExit(Sender: TObject);
begin
  if edtunitario.Text='' then
  begin
    edtunitario.EditValue := 0;
    exit;
  end;
  CalcularTotal;
end;

procedure TFrmEntradaVeiculoSelecionar.edtvalortotalExit(Sender: TObject);
begin
  if cxValores.Visible = false then
  ACBrEnter.EnterAsTab  := false;
end;

procedure TFrmEntradaVeiculoSelecionar.edtvalortotalKeyPress(Sender: TObject;
  var Key: Char);
begin
  if cxValores.Visible = True then
  edttaxaconsignado.SetFocus
  else
  edtcomplemento.SetFocus;
end;

procedure TFrmEntradaVeiculoSelecionar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action          := TCloseAction.caFree;
    FrmEntradaVeiculoSelecionar  := nil;
end;

procedure TFrmEntradaVeiculoSelecionar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F5 then
  begin
    btnincluir.Click;
    key:=0;
  end;

  if key = vk_escape then
  begin
    btncancelar.Click;
    key:=0;
  end;

end;

procedure TFrmEntradaVeiculoSelecionar.FormShow(Sender: TObject);
begin

  if str = 'N' then
  begin
    AjusteTelaValores;
    PopularTela;
    MudarRotuloCampos(StrOperacao);
  end
  else
  begin
    lblTitulo.Caption := 'Edição de Veículo';
    AjusteTelaValores;
    MudarRotuloCampos(StrOperacao);
    PopularDadosCompraItens;
    btnIncluir.Caption  := 'Salvar | F5';
  end;

end;

Procedure TFrmEntradaVeiculoSelecionar.PopularDadosCompraItens;
var
  Controller    : TEntradaItensVeiculoController;
  Lista         : TObjectList<TEntradaVeiculoItens>;
begin
  //Codigo novo MVC 23/05/2025 Buscar dados para editar
  Lista         := Nil;
  Controller    := Nil;

  Controller    := TEntradaItensVeiculoController.Create;

  Try

    Try
      Lista         := Controller.BuscarPorID(idCompra,FrmEntradaVeiculoSelecionar.tag); // Passa o idcompra e iditem

    Except on e:exception do
      begin
        JKDialog('Erro','Erro ao carregar os dados do veículo!'+#13+e.Message, tdErro);
        exit;
      end;
    End;

    if (Lista = nil) or (Lista.Count = 0) then
    begin
      JKDialog('Aviso','Não foi possivel carregar os dados do veículo!', tdAlerta);
      exit;
    end;

    //Pecorrer a lista
    for var Item in Lista do
    begin
      edtcodigo.EditValue         := Item.codigo;
      edtPlaca.EditValue          := Item.nmplaca;
      edtdescricao.EditValue      := Item.descricao;

      edtqtde.EditValue           := Item.qtde;
      edtFipe.EditValue           := Item.VeiculoPrcFipe;
      edtunitario.EditValue       := Item.PrcUnitario;
      edtdescpercentual.EditValue := Item.DescPercentual;
      edtdescontoreais.EditValue  := Item.DescReais;
      edtvalortotal.EditValue     := Item.total;
      edtcomplemento.Text         := Item.complemento;

      edtTroca.EditValue          := Item.veiculotroca;
      edtatualizarficha.EditValue := Item.atualizarficha;

      {vlrCustogerais.EditValue    := Item.prccusto;
      edtprcvenda.EditValue       := Item.VeiculoPrcVenda;
      edtValorTroca.EditValue     := Item.veiculovalortroca;
      edtperlucro.EditValue       := Item.veiculoperclucro;
      edtValorLucro.EditValue     := Item.VeiculoLucroValor;
      edtValorPraticado.EditValue := Item.veiculovalorpraticado;

      edttaxames.EditValue        := Item.taxames;
      edttaxadia.EditValue        := Item.taxadia;
      edtpatiototal.EditValue     := Item.totalpatio;
      edtljpercentual.EditValue   := Item.comissaolojaperc;
      edtljtotal.EditValue        := Item.comissaolojavalor;
      edtvendpercentual.EditValue := Item.comissaovendperc;
      edtvendtotal.EditValue      := Item.comissaovendvalor;}
      edttaxaconsignado.EditValue := Item.taxaconsignado;
      edtDataRetirada.EditValue   := Item.dataretiradaconsi;

      edtqtde.SetFocus;
    end;

  Finally
   FreeAndNil(lista);
   FreeAndNil(Controller);
  End;

end;

procedure TFrmEntradaVeiculoSelecionar.MudarRotuloCampos(i: integer);
begin
  case i of

    0:begin  //Consiginado
      label_unitario.Caption  := 'Repasse';
      edttaxaconsignado.Enabled := True;
      edtDataRetirada.Enabled   := True;
      TaxaConsignado;
      btnvalores.Visible        := True;
      edtvalortotal.Width       := 98;
    end;

    1:begin  //consignado loja
      label_unitario.Caption  := 'Repasse';
      edttaxaconsignado.Enabled := True;
      edtDataRetirada.Enabled   := True;
      TaxaConsignado;
      btnvalores.Visible        := True;
      edtvalortotal.Width       := 98;
    end;

    2:begin //Proprio
      label_unitario.Caption  := 'Compra';
      edttaxaconsignado.Enabled := False;
      edtDataRetirada.Enabled   := False;
      btnvalores.Visible        := False;
      edtvalortotal.Width       := 129;
    end;

    3:begin // zero
      label_unitario.Caption  := 'Compra';
      edttaxaconsignado.Enabled := False;
      edtDataRetirada.Enabled   := False;
      btnvalores.Visible        := false;
      edtvalortotal.Width       := 129;
    end;

  end;
end;

procedure TFrmEntradaVeiculoSelecionar.PopularTela;
var
  Controller    : TEntradaItensVeiculoController;
  Lista         : TObjectList<TEntradaVeiculoItens>;
begin
  // Quando inserir um registro novo

  Lista         := Nil;
  Controller    := Nil;

  Controller    := TEntradaItensVeiculoController.Create;

  Try

    Try
      Lista         := Controller.BuscarPorIDOBJ(FrmEntradaVeiculoSelecionar.tag); // Passa o idcompra e idveiculo

    Except on e:exception do
      begin
        JKDialog('Erro','Erro ao carregar os dados do veículo!'+#13+e.Message, tdErro);
        exit;
      end;
    End;

    if (Lista = nil) or (Lista.Count = 0) then
    begin
      JKDialog('Aviso','Não foi possivel carregar os dados do veículo!', tdAlerta);
      exit;
    end;

    //Pecorrer a lista
    for var Item in Lista do
    begin
      edtcodigo.EditValue         := Item.codigo;
      edtPlaca.EditValue          := Item.nmplaca;
      edtdescricao.EditValue      := Item.descricao;

      edtqtde.EditValue           := 1;
      edtFipe.EditValue           := Item.VeiculoPrcFipe;
      edtunitario.EditValue       := Item.PrcUnitario;
      edtdescpercentual.EditValue := 0;
      edtdescontoreais.EditValue  := 0;
      edtvalortotal.EditValue     := Item.PrcUnitario;
      edtcomplemento.Clear;
      edtTroca.EditValue          := 'N';
      edtatualizarficha.EditValue := 'S';

      {vlrCustogerais.EditValue    := 0;
      edtprcvenda.EditValue       := Item.VeiculoPrcVenda;
      edtValorTroca.EditValue     := Item.veiculovalortroca;
      edtperlucro.EditValue       := Item.veiculoperclucro;
      edtValorLucro.EditValue     := Item.VeiculoLucroValor;
      edtValorPraticado.EditValue := Item.veiculovalorpraticado;

      edttaxames.EditValue        := Item.taxames;
      edttaxadia.EditValue        := Item.taxadia;
      edtpatiototal.EditValue     := Item.totalpatio;
      edtljpercentual.EditValue   := Item.comissaolojaperc;
      edtljtotal.EditValue        := Item.comissaolojavalor;
      edtvendpercentual.EditValue := Item.comissaovendperc;
      edtvendtotal.EditValue      := Item.comissaovendvalor;}
      edttaxaconsignado.EditValue := 0;

      edtqtde.SetFocus;
    end;

  Finally
   FreeAndNil(lista);
   FreeAndNil(Controller);
  End;

end;

{procedure TFrmEntradaVeiculoSelecionar.PopularTelaValores;
var
ModelCompra  :TModelCompraVeiculo;
msg:string;
begin
  //Retirado 30/07/2025
  ModelCompra            := TModelCompraVeiculo.Create;

  Try
    if ModelCompra.PopularFrmVeiculoEntrada(FrmEntradaVeiculoSelecionar.tag) then
    begin
        vlrCustogerais.EditValue      :=  ModelCompra.prccusto;
        edtprcvenda.EditValue         :=  ModelCompra.prcvenda;
        edtValorTroca.EditValue       :=  ModelCompra.veiculovalortroca;
        edtValorLucro.EditValue       :=  ModelCompra.veiculolucro;
        edtValorPraticado.EditValue   :=  ModelCompra.veiculovalorpraticado;
    end;

  Finally
    FreeAndNil(ModelCompra);
  End;
end;}


end.
