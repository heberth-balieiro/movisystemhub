unit UnitProdutoEstoque;

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
  cxCurrencyEdit, cxMemo, ACBrBase, ACBrEnterTab, dxBevel, UConeSul,
  Model.Estoque;

type
  TFrmProdutoEstoque = class(TForm)
    lblTitulo: TLabel;
    Paneltitulo: TPanel;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtCodigo: TcxTextEdit;
    edtdescricao: TcxTextEdit;
    edtestoqueatual: TcxCurrencyEdit;
    edtQtde: TcxCurrencyEdit;
    edtprccompra: TcxCurrencyEdit;
    Label9: TLabel;
    ACBrEnter: TACBrEnterTab;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    btnIncluir: TSpeedButton;
    edtunidade: TcxTextEdit;
    Label5: TLabel;
    edtprcvenda: TcxCurrencyEdit;
    Label6: TLabel;
    cxGroupBox2: TcxGroupBox;
    dxBevel1: TdxBevel;
    edtFoto: TImage;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtQtdeExit(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtvalortotalExit(Sender: TObject);
    procedure edtcomplementoExit(Sender: TObject);
    procedure edtcomplementoKeyPress(Sender: TObject; var Key: Char);
    procedure edtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure edtprccompraExit(Sender: TObject);
    procedure edtprcvendaKeyPress(Sender: TObject; var Key: Char);
  private
    prodFrancionado:String;
    prodAlQtde:String;
    prodAltDesc:string;
    Procedure PopularTela;
    function ValidarCampos(out msg: string): Boolean;
    //function Salvar(out msg: string): Boolean;

    { Private declarations }
  public
    operacao:String;
    { Public declarations }
  end;

var
  FrmProdutoEstoque: TFrmProdutoEstoque;

implementation

{$R *.dfm}

Uses Vcl.Loading, Vcl.Session, uJKDialog;

procedure TFrmProdutoEstoque.btnCancelarClick(Sender: TObject);
begin
  Close;
  //TNavigation.CloseCamada(Self);
end;

procedure TFrmProdutoEstoque.btnIncluirClick(Sender: TObject);
var
msg :String;
begin
  //

//  if ValidarCampos(msg) then
//  begin
//    Try
//       if Salvar(msg) then
//        begin
//          //JKDialog('Sucesso',msg, tdSucesso);
//          Close;
//          //TNavigation.CloseCamada(Self);
//        end
//        else
//        JKDialog('Aviso',msg, tdAlerta);
//
//
//    Except on e:exception do
//      begin
//        JKDialog('Aviso',msg+' :'+e.Message, tdErro);
//        raise
//      end;
//    End;
//  end
//  else
//  begin
//    JKDialog('Aviso',msg, tdAlerta);
//    exit;
//  end;
end;

//function TFrmProdutoEstoque.Salvar(out msg: string): Boolean;
//var
//Model : TModelEstoque;
//begin
//  Result  := False;
//  Model   := TModelEstoque.Create;
//
//  Try
//    try
//
//      Model.idproduto       := FrmProdutoEstoque.tag;
//      Model.qtdeantes       := edtestoqueatual.EditValue;
//      Model.prccompra       := edtprccompra.EditValue;
//      Model.prcvenda        := edtprcvenda.EditValue;
//      Model.qtdenova        := edtQtde.EditValue;
//      Model.codigo          := strtoint(edtCodigo.text);
//      Model.descricao       := edtdescricao.Text;
//      model.und             := edtunidade.Text;
//
//      if Model.ProdutoIncluirLista(operacao) then
//      Result  := True;
//
//    Except on e:exception do
//      begin
//        raise Exception.Create('Error:'+e.Message);
//      end;
//    end;
//  Finally
//    Model.Free;
//  End;
//end;

function TFrmProdutoEstoque.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;
  //

  if (edtQtde.EditValue=0) or (edtQtde.Text='') then
  begin
    msg := 'Informe uma quantidade!';
    Result  := False;
    exit;
  end;


end;

procedure TFrmProdutoEstoque.edtcomplementoExit(Sender: TObject);
begin
  ACBrEnter.EnterAsTab:= True;
end;

procedure TFrmProdutoEstoque.edtcomplementoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    btnIncluir.Click;
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);

  end;

end;

procedure TFrmProdutoEstoque.edtQtdeExit(Sender: TObject);

begin
  if edtQtde.Text='' then
  begin
    edtQtde.EditValue := 0;
    exit;
  end;

end;


procedure TFrmProdutoEstoque.edtQtdeKeyPress(Sender: TObject; var Key: Char);
begin
  //Validar se aceita fracionado
  if prodFrancionado = 'N' then
  begin
    if not (Key in ['0'..'9', #8]) then // Permite apenas números e Backspace
    begin
      Key := #0; // Cancela a entrada de outros caracteres
    end;
  end;
end;

procedure TFrmProdutoEstoque.edtprccompraExit(Sender: TObject);
begin
  if edtprccompra.Text='' then
  begin
    edtprccompra.EditValue := 0;
    exit;
  end;
  ACBrEnter.EnterAsTab  := False;
end;

procedure TFrmProdutoEstoque.edtprcvendaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    btnIncluir.Click;
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;

end;

procedure TFrmProdutoEstoque.edtvalortotalExit(Sender: TObject);
begin
  ACBrEnter.EnterAsTab:= False;
end;

procedure TFrmProdutoEstoque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action          := TCloseAction.caFree;
    FrmProdutoEstoque  := nil;
end;

procedure TFrmProdutoEstoque.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmProdutoEstoque.FormShow(Sender: TObject);
begin

  if operacao= 'Entrada' then
  lbltitulo.Caption := 'Entrada de produto'
  else
  lbltitulo.Caption := 'Saída de produto';

  PopularTela;


end;

procedure TFrmProdutoEstoque.PopularTela;
var
//Pedido  :TModelPedido;
msg:string;
begin
//  Pedido            := TModelPedido.Create;
//  Try
//    Pedido.idProduto  := FrmProdutoEstoque.tag;
//    Try
//      if Pedido.SelectProdutoPedido(msg) then
//      begin
//
//        edtcodigo.EditValue         := Pedido.prodcodproduto;
//        edtdescricao.EditValue      := Pedido.proddescricao;
//        edtunidade.EditValue        := Pedido.ProdUND;
//        edtqtde.EditValue           := 0;
//        edtestoqueatual.EditValue   := Pedido.prodestoque;
//        edtprccompra.EditValue      := Pedido.ProdCompra;
//        edtprcvenda.EditValue       := Pedido.prodvenda;
//        if Pedido.ProdFoto <> '' then
//        TConesul.ConvBase64Img(Pedido.ProdFoto);
//        edtfoto.Picture             := TConeSul.nfoto;
//        prodFrancionado             := Pedido.prodfracionado;
//
//        edtqtde.SetFocus;
//      end;
//    Except on e:exception do
//      raise Exception.Create('Error:'+e.Message);
//    End;
//
//  Finally
//    Pedido.Free;
//  End;
end;

end.
