{  ************   Tarefa da Tela *************

 1 -ok Criar funcao de retorno do uf, cnpj e razao da empresa logada.
 2 -ok onshow aplicar a funcao de preenchimento de dados.
 3 -OK onshow passar nome da tela e titulo.
 4 -OK ajutar ordenação dos campos
 5 -OK mudar nome dos campos
 6 - gravar no banco apos a consulta o nsu
 7 -OK Criar a funcao para buscar numero da nsu e ultima nsu no banco
 8 - Buscar na sefaz criar a funcao
 9 -


 O que depois muda para usar ACBr real

Quando você for trocar da simulação para a consulta real, praticamente só muda a origem do XML.

Hoje:

XMLRetorno := TFile.ReadAllText(AArquivoXML, TEncoding.UTF8);

Depois com ACBr:

ACBrNFe1.DistribuicaoDFePorUltNSU(ACNPJ, UltNSU);
XMLRetorno := ACBrNFe1.WebServices.DistribuicaoDFe.RetWS;

ou por chave:

ACBrNFe1.DistribuicaoDFePorChaveNFe(ACNPJ, Chave);
XMLRetorno := ACBrNFe1.WebServices.DistribuicaoDFe.RetWS;

ou por NSU:

ACBrNFe1.DistribuicaoDFePorNSU(ACNPJ, NSU);
XMLRetorno := ACBrNFe1.WebServices.DistribuicaoDFe.RetWS;



}

unit UBuscarSefaz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormNovoBaseDiversos, cxStyles,
  cxGridTableView, cxClasses, Data.DB, DBAccess, Uni, ACBrBase, ACBrEnterTab,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ButtonStylesAttributes,
  Vcl.StyledButton, cxGraphics, cxControls, cxLookAndFeels,
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
  dxSkinXmas2008Blue, cxGroupBox, dxGDIPlusClasses, cxImage, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, uConfiguracaoService, Vcl.Session, uJKDialog,
  Service.DistribuicaoDFe.Importacao;

type
  TFrmBuscarSefaz = class(TFormNovoBaseDiversos)
    BtnBuscar: TStyledBitBtn;
    BtnCancelar: TStyledBitBtn;
    cxGroupBox1: TcxGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cxImg: TcxImage;
    Label5: TLabel;
    Label6: TLabel;
    cxcnpj: TcxButtonEdit;
    cxrazao: TcxTextEdit;
    Label7: TLabel;
    Label8: TLabel;
    cxchave: TcxTextEdit;
    cxnsunfe: TcxTextEdit;
    cxnsucte: TcxTextEdit;
    Label9: TLabel;
    Label10: TLabel;
    cxuf: TcxTextEdit;
    Label11: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure cxnsunfeKeyPress(Sender: TObject; var Key: Char);
    procedure BtnBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscarSefaz: TFrmBuscarSefaz;

implementation

Uses UDM;

{$R *.dfm}

procedure TFrmBuscarSefaz.BtnBuscarClick(Sender: TObject);
var
  Ret: TImportacaoDistribuicaoResultado;
begin
  Ret := TDistribuicaoDFeImportacaoService.ImportarArquivoSimulado(
    dm.conn,
    'D:\Projeto2024\ProjetoAsmuv\Aplicacao\Bin\NFe\Xml\20241125192119-dist-dfe.xml',
    cxCNPJ.Text,
    'C:\EasyPedido',
    Tsession.idempresa
  );

  if Ret.Sucesso then
    ShowMessage(Format('Importação concluída. Log: %d | Docs: %d', [Ret.IdLog, Ret.TotalDocs]))
  else
    ShowMessage(Ret.Mensagem);
end;

procedure TFrmBuscarSefaz.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmBuscarSefaz.cxnsunfeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0'..'9', #8, ^V, ^C, ^X]) then
        Key := #0;
end;

procedure TFrmBuscarSefaz.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmBuscarSefaz  := nil;
end;

procedure TFrmBuscarSefaz.FormShow(Sender: TObject);
var
  Auf, acnpj, arazao:string;
  Ansu, Ansumax:integer;
begin
  inherited;
  ParamsTela  := 'Consulta SEFAZ';
  TitleText   := 'Distribuição de DF-e - Consulta na SEFAZ';

  Try
    if TConfiguracaoService.RetornoDadosConsultaSefazEmpresa(Auf,acnpj, arazao, Tsession.idempresa) then
    begin
      cxuf.EditValue    := Auf;
      cxcnpj.EditValue  := acnpj;
      cxrazao.EditValue := arazao;
      FrmBuscarSefaz.SetFocus;
    end
    else
    begin
      cxuf.Clear;
      cxcnpj.Clear;
      cxrazao.Clear;
    end;

    if TConfiguracaoService.RetornoNSUConsultaSefazEmpresa(Ansu, Ansumax, Tsession.idempresa) then
    begin
      cxnsunfe.EditValue  := Ansu;
      cxnsucte.EditValue  := Ansumax;
    end
    else
    begin
      cxnsunfe.EditValue  :=0;
      cxnsucte.EditValue  :=0;
    end;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  End;

end;

end.
