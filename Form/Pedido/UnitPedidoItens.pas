unit UnitPedidoItens;

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
  cxCurrencyEdit, cxMemo, ACBrBase, ACBrEnterTab, UnitBaseNovoCadastro,
  Vcl.ButtonStylesAttributes, cxStyles, cxGridTableView, cxClasses, Data.DB,
  DBAccess, Uni, Vcl.StyledButton, dxBevel, dxGDIPlusClasses,
  Controller.PedidoItens, Model.PedidoItens,
  Model.TabProduto,Controller.Produto, UConeSul, uConfiguracaoService;
type
  TFrmPedidoItens = class(TFormNovoBaseCadastro)
    Label26: TLabel;
    cxCodigo: TcxTextEdit;
    cxbarra: TcxTextEdit;
    Label1: TLabel;
    Label31: TLabel;
    cxDescricao: TcxTextEdit;
    dxBevel2: TdxBevel;
    edtFoto: TImage;
    Label38: TLabel;
    cxestatual: TcxCurrencyEdit;
    Label2: TLabel;
    cxqtdeunitario: TcxCurrencyEdit;
    cxqtdequadrado: TcxCurrencyEdit;
    Label3: TLabel;
    cxPrcunitario: TcxCurrencyEdit;
    lbunitario: TLabel;
    cxDesconto: TcxCurrencyEdit;
    Label5: TLabel;
    cxdescontoreais: TcxCurrencyEdit;
    Label6: TLabel;
    cxAnota: TcxMemo;
    Label7: TLabel;
    blTotal: TLabel;
    cxAltura: TcxCurrencyEdit;
    cxLargura: TcxCurrencyEdit;
    Label8: TLabel;
    Label9: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cxqtdeunitarioKeyPress(Sender: TObject; var Key: Char);
    procedure cxqtdeunitarioPropertiesEditValueChanged(Sender: TObject);
    procedure cxDescontoPropertiesEditValueChanged(Sender: TObject);
    procedure cxdescontoreaisPropertiesEditValueChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    
  private
    ProdAceitaFracionado : Boolean;
    FAtualizando         : Boolean;
    ProdPeso             : Currency;
    Calculom2            : string;
    usachapa             : String;
    { Private declarations }
    Procedure PopularCamposInserir;
    procedure CalcularTotaisItem(Origem: string);
    function ObterSubTotal: Currency;
    function ObterTotal: Currency;

  public
    { Public declarations }
    AIDPedido     : Integer;
    IDPedidoItens : integer;
    IDProduto     : Integer;
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;
  end;
var
  FrmPedidoItens: TFrmPedidoItens;
  ContItens :TPedidoItensController;
  ObjItens  :TModelPedidoItens;

  Contproduto : TProdutoController;
  ObjProduto  : TTabProduto;

implementation

{$R *.dfm}

Uses Vcl.Loading, Vcl.Session, uJKDialog;

procedure TFrmPedidoItens.cxDescontoPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalcularTotaisItem('PERC');
end;

procedure TFrmPedidoItens.cxdescontoreaisPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalcularTotaisItem('REAL');
end;

procedure TFrmPedidoItens.cxqtdeunitarioKeyPress(Sender: TObject;var Key: Char);
begin
  inherited;
      if ProdAceitaFracionado = False then
      begin
        if not (Key in ['0'..'9', #8]) then
        begin
          Key := #0;
        end;
      end;
end;

procedure TFrmPedidoItens.cxqtdeunitarioPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalcularTotaisItem('');
end;

procedure TFrmPedidoItens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  usachapa        := '';
  IDProduto       := 0;
  IDPedidoItens   := 0;
  AIDPedido       := 0;
  FrmPedidoItens  := nil;
end;

procedure TFrmPedidoItens.FormCreate(Sender: TObject);
begin
  inherited;

  if TConfiguracaoService.ValidarCalculoMetroPedido(TSession.idempresa) then
  begin
    cxAltura.Enabled        := True;
    cxLargura.Enabled       := True;
    cxqtdequadrado.Enabled  := True;
    Calculom2               := 'S';
  end
  else
  begin
    cxAltura.Enabled        := False;
    cxLargura.Enabled       := False;
    cxqtdequadrado.Enabled  := False;
    Calculom2               := 'N';
  end;

  if TConfiguracaoService.ValidarEditarPrecoProdutoPedido(TSession.idempresa) then
    cxPrcunitario.Properties.ReadOnly := False
  else
    cxPrcunitario.Properties.ReadOnly := True;
end;

procedure TFrmPedidoItens.FormShow(Sender: TObject);
begin
  inherited;
  ProdPeso  := 0;
  usachapa  := '';
  Try
    if ParamsStr = 'N' then
    begin
      TitleText   := 'Inclusão Produto/Serviço';
      PopularCamposInserir;
    end
    else
    begin
      TitleText   := 'Editar Produto/Serviço';
      PopularCampos;
    end;
  except on E: Exception do
    Begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
      Close;
    End;
  End;
end;

procedure TFrmPedidoItens.PopularCampos;
begin
  inherited;
  ContItens       := Nil;
  ObjItens        := Nil;
  try
    ContItens     := TPedidoItensController.Create;
    ObjItens      := TModelPedidoItens.Create;

    Try
      if (IDPedidoItens=0) or (InttoStr(IDPedidoItens) = '') then
      raise Exception.Create('Nenhum ID passado no parâmetro.');
      ObjItens                    := ContItens.BuscarProdutoAlterar(IDPedidoItens);

      if Assigned(ObjItens) then
      begin

        cxCodigo.EditValue        := ObjItens.prodcodproduto;
        cxbarra.EditValue         := ObjItens.prodcodbarra;
        cxDescricao.EditValue     := ObjItens.descricao;
        cxestatual.EditValue      := ObjItens.prodestoque;
        cxqtdeunitario.EditValue  := ObjItens.qtde;
        cxPrcunitario.EditValue   := ObjItens.prc_unitario;
        cxDesconto.EditValue      := ObjItens.desconto_perc;
        cxdescontoreais.EditValue := ObjItens.desconto_reais;
        ProdPeso                  := ObjItens.peso;
        cxanota.EditValue         := ObjItens.complemento;

        if ObjItens.prodfracionado = 'S' then
        cxDescricao.Properties.ReadOnly := False;

        ProdAceitaFracionado      := ObjItens.prodfracionado = 'S';

        Calculom2                 := ObjItens.preco_m2;
        usachapa                  := ObjItens.usa_chapa;

        if ObjItens.proaltdescricao = 'S' then
        cxDescricao.Properties.ReadOnly := False;

        if Calculom2='S' then
        begin
          lbunitario.Caption      := 'Prc. Unitário m²';
          cxAltura.Enabled        := True;
          cxLargura.Enabled       := True;
          cxqtdequadrado.Enabled  := True;
          cxqtdequadrado.Properties.ReadOnly  := False;
          cxAltura.EditValue      := ObjItens.altura;
          cxLargura.EditValue     := ObjItens.largura;
          cxqtdequadrado.EditValue:= ObjItens.qtde_2;
        end
        else
        begin
          lbunitario.Caption      := 'Prc. Unitário';
          cxAltura.Enabled        := False;
          cxLargura.Enabled       := False;
          cxqtdequadrado.Enabled  := False;
        end;

        if ObjItens.ProdFoto <> '' then
        begin
          TConesul.ConvBase64Img(ObjItens.ProdFoto);
          edtFoto.Picture := TConeSul.nfoto;
          TConeSul.nfoto.Free;
        end
        else
        edtFoto.Picture := nil;

        CalcularTotaisItem('');
        cxqtdeunitario.SetFocus;

      end;
    Finally
      FreeAndNil(ContItens);
      FreeAndNil(ObjItens);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmPedidoItens.PopularCamposInserir;
begin
  Contproduto := nil;
  ObjProduto := nil;
  try
    Contproduto := TProdutoController.Create;
    ObjProduto := TTabProduto.Create;

    if IDProduto = 0 then
      raise Exception.Create('Nenhum ID passado no parâmetro.');

    ObjProduto := Contproduto.BuscarPorID(IDProduto);

    if Assigned(ObjProduto) then
    begin
      cxCodigo.EditValue        := ObjProduto.codigo;
      cxbarra.EditValue         := ObjProduto.cod_barras;
      cxDescricao.EditValue     := ObjProduto.descricao;
      cxestatual.EditValue      := ObjProduto.estoque_atual;
      cxqtdeunitario.EditValue  := 1;
      cxqtdequadrado.EditValue  := 0;
      cxPrcunitario.EditValue   := ObjProduto.prc_venda;
      cxDesconto.EditValue      := 0;
      cxdescontoreais.EditValue := 0;
      ProdPeso                  := ObjProduto.peso_kg;

      if ObjProduto.alterar_descricao = 'S' then
        cxDescricao.Properties.ReadOnly := False;

      ProdAceitaFracionado := ObjProduto.fracionado = 'S';
      Calculom2            := ObjProduto.preco_m2;
      usachapa             := ObjProduto.usa_chapa;

      if Calculom2='S' then
      begin
        lbunitario.Caption      := 'Prc. Unitário m²';
        cxAltura.Enabled        := True;
        cxLargura.Enabled       := True;
        cxqtdequadrado.Enabled  := True;
        cxqtdequadrado.Properties.ReadOnly  := False;
      end
      else
      begin
        lbunitario.Caption      := 'Prc. Unitário';
        cxAltura.Enabled        := False;
        cxLargura.Enabled       := False;
        cxqtdequadrado.Enabled  := False;
      end;

      if ObjProduto.foto1 <> '' then
      begin
        TConesul.ConvBase64Img(ObjProduto.foto1);
        edtFoto.Picture := TConeSul.nfoto;
        TConeSul.nfoto.Free;
      end
      else
      edtFoto.Picture := nil;

      CalcularTotaisItem('');
      if Calculom2='S' then
      cxAltura.SetFocus
      else
      cxqtdeunitario.SetFocus;
    end;

  finally
    FreeAndNil(Contproduto);
    FreeAndNil(ObjProduto);
  end;
end;

function TFrmPedidoItens.Salvar(out msg: string): Boolean;
var
AId:Integer;
begin
  try
    Result        := False;
    ContItens     := nil;
    ObjItens      := nil;

    ContItens     := TPedidoItensController.Create;
    ObjItens      := TModelPedidoItens.Create;

    Try
      if ParamsStr='N' then
      ObjItens.id_pedido_itens  := 0
      else
      ObjItens.id_pedido_itens  := IDPedidoItens;

      ObjItens.id_pedido        := AIDPedido;
      ObjItens.id_produto       := IDProduto;
      ObjItens.qtde             := cxqtdeunitario.EditValue;
      ObjItens.qtde_2           := cxqtdequadrado.EditValue;
      ObjItens.prc_unitario     := cxPrcunitario.EditValue;
      ObjItens.desconto_perc    := cxDesconto.EditValue;
      ObjItens.desconto_reais   := cxdescontoreais.EditValue;
      ObjItens.descricao        := Trim(cxDescricao.Text);
      ObjItens.complemento      := Trim(cxAnota.Text);
      ObjItens.prc_total        := ObterTotal;
      ObjItens.prc_subtotal     := ObterSubTotal;
      objitens.peso             := ProdPeso * cxqtdeunitario.EditValue;
      objitens.volume           := cxqtdeunitario.EditValue;
      objitens.altura           := cxaltura.EditValue;
      objitens.largura          := cxlargura.EditValue;
      if Calculom2='S' then
      objitens.prc_unitariom2   := ObjItens.prc_total / cxqtdeunitario.EditValue
      else
      objitens.prc_unitariom2   := cxPrcunitario.EditValue;
      objItens.usa_chapa        := usachapa;

      if ContItens.Salvar(ObjItens, AId) then
      begin
        if AID = 0 then
        AID             := IDProduto;
        msg             := 'Registro salvo com sucesso, ID: '+IntToStr(AID);
        Result          := true;
        ParamsMsgTela   := 'N';
        ParamsCloseTela := 'S';
      end;

    Finally
      FreeAndNil(ContItens);
      FreeAndNil(ObjItens);
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmPedidoItens.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;
  Msg := '';

  if AIDPedido <= 0 then
  begin
    Msg := 'Pedido não informado.';
    Result := False;
    Exit;
  end;

  if IDProduto <= 0 then
  begin
    Msg := 'Produto não informado.';
    Result := False;
    Exit;
  end;

  if Trim(cxDescricao.Text) = '' then
  begin
    Msg := 'Descrição do produto não informada.';
    Result := False;
    Exit;
  end;

  if Calculom2='S' then
  begin
    if cxAltura.Value <= 0 then
    begin
      Msg := 'Altura deve ser informado.';
      cxAltura.SetFocus;
      Result := False;
      Exit;
    end;

    if cxLargura.Value <= 0 then
    begin
      Msg := 'Largura deve ser informado.';
      cxLargura.SetFocus;
      Result := False;
      Exit;
    end;

  end;

  if cxQtdeUnitario.Value <= 0 then
  begin
    Msg := 'Quantidade deve ser maior que zero.';
    cxQtdeUnitario.SetFocus;
    Result := False;
    Exit;
  end;

  if cxPrcUnitario.Value <= 0 then
  begin
    Msg := 'Preço unitário deve ser maior que zero.';
    cxPrcUnitario.SetFocus;
    Result := False;
    Exit;
  end;

  if cxDesconto.Value < 0 then
  begin
    Msg := 'Desconto percentual inválido.';
    cxDesconto.SetFocus;
    Result := False;
    Exit;
  end;

  if cxDescontoReais.Value < 0 then
  begin
    Msg := 'Desconto em reais inválido.';
    cxDescontoReais.SetFocus;
    Result := False;
    Exit;
  end;
end;

//procedure TFrmPedidoItens.CalcularTotaisItem(Origem: string);
//var
//  VSubTotal: Currency;
//  VDescPerc: Currency;
//  VDescReais: Currency;
//  VTotal: Currency;
//
//  VM2Unitario: Double;
//  VM2Total: Double;
//begin
//  if FAtualizando then Exit;
//  FAtualizando := True;
//
//  try
//    if SameText(CalculoM2, 'S') then
//    begin
//      // altura e largura em milímetros
//      VM2Unitario       := (cxaltura.Value / 1000) * (cxlargura.Value / 1000);
//      VM2Total          := VM2Unitario * cxqtdeunitario.Value;
//      // se tiver um campo para mostrar o m² total
//      cxqtdequadrado.EditValue := VM2Total;
//      VSubTotal := VM2Total * cxPrcunitario.Value;
//    end
//    else
//    begin
//      cxqtdequadrado.EditValue := 0;
//      VSubTotal := ObterSubTotal; //cxqtdeunitario.Value * cxPrcunitario.Value;
//    end;
//
//
//    //VSubTotal := ObterSubTotal;
//
//    if Origem = 'PERC' then
//    begin
//      VDescPerc := cxDesconto.Value;
//      VDescReais := (VSubTotal * VDescPerc) / 100;
//      cxdescontoreais.EditValue := VDescReais;
//    end
//    else if Origem = 'REAL' then
//    begin
//      VDescReais := cxdescontoreais.Value;
//
//      if VSubTotal > 0 then
//        VDescPerc := (VDescReais / VSubTotal) * 100
//      else
//        VDescPerc := 0;
//
//      cxDesconto.EditValue := VDescPerc;
//    end;
//
//    VTotal          := VSubTotal - cxdescontoreais.Value;//ObterTotal;
//    blTotal.Caption := FormatFloat('R$ ,0.00', VTotal);
//
//  finally
//    FAtualizando := False;
//  end;
//end;

procedure TFrmPedidoItens.CalcularTotaisItem(Origem: string);
var
  VSubTotal: Currency;
  VDescPerc: Currency;
  VDescReais: Currency;
  VTotal: Currency;
begin
  if FAtualizando then
    Exit;

  FAtualizando := True;
  try
    VSubTotal := ObterSubTotal;

    if Origem = 'PERC' then
    begin
      VDescPerc := cxDesconto.Value;
      VDescReais := (VSubTotal * VDescPerc) / 100;
      cxdescontoreais.EditValue := VDescReais;
    end
    else if Origem = 'REAL' then
    begin
      VDescReais := cxdescontoreais.Value;

      if VSubTotal > 0 then
        VDescPerc := (VDescReais / VSubTotal) * 100
      else
        VDescPerc := 0;

      cxDesconto.EditValue := VDescPerc;
    end;

    VTotal := ObterTotal;
    blTotal.Caption := FormatFloat('Total R$ ,0.00', VTotal);

  finally
    FAtualizando := False;
  end;
end;

//function TFrmPedidoItens.ObterSubTotal: Currency;
//begin
//  Result := cxqtdeunitario.Value * cxPrcunitario.Value;
//end;

function TFrmPedidoItens.ObterSubTotal: Currency;
var
  VM2Unitario: Double;
  VM2Total: Double;
begin
  if SameText(CalculoM2, 'S') then
  begin
    // altura e largura em milímetros
    VM2Unitario := (cxaltura.Value / 1000) * (cxlargura.Value / 1000);
    VM2Total := VM2Unitario * cxqtdeunitario.Value;

    cxqtdequadrado.EditValue := VM2Total;

    // preço por m²
    Result := VM2Total * cxPrcunitario.Value;
  end
  else
  begin
    cxqtdequadrado.EditValue := 0;
    Result := cxqtdeunitario.Value * cxPrcunitario.Value;
  end;
end;

//function TFrmPedidoItens.ObterTotal: Currency;
//begin
//  Result      := ObterSubTotal - cxdescontoreais.Value;
//  if Result < 0 then
//    Result := 0;
//end;

function TFrmPedidoItens.ObterTotal: Currency;
begin
  Result := ObterSubTotal - cxdescontoreais.Value;

  if Result < 0 then
    Result := 0;
end;

End.

