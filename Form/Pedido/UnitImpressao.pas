unit UnitImpressao;
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
  cxBlobEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxGroupBox, unitPedidocad,
  frxExportCSV, frxClass, frxExportBaseDialog, frxExportPDF, frxDBSet, Data.DB,
  Datasnap.DBClient, UFormNovoBaseDiversos, cxStyles, cxGridTableView,
  cxClasses, DBAccess, Uni, ACBrBase, ACBrEnterTab, Vcl.ButtonStylesAttributes,
  Vcl.StyledButton, uConfiguracaoService, ACBRUTil;
type
  TFrmImpressao = class(TFormNovoBaseDiversos)
    frxRelatorio: TfrxReport;
    frxPDF: TfrxPDFExport;
    frxCSV: TfrxCSVExport;
    FrxPedido: TfrxDBDataset;
    FrxPedidoItens: TfrxDBDataset;
    BtnCancelar: TStyledBitBtn;
    BtnImprimir: TStyledBitBtn;
    btnPDF: TStyledBitBtn;
    btnEmail: TStyledBitBtn;
    btnwhatsapp: TStyledBitBtn;
    lbrodape: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure btnPDFClick(Sender: TObject);
    procedure btnEmailClick(Sender: Tobject);
    procedure btnwhatsappclick(Sender: Tobject);
    procedure BtnImprimirMouseEnter(Sender: TObject);
    procedure btnPDFMouseEnter(Sender: TObject);
    procedure btnEmailMouseEnter(Sender: TObject);
    procedure btnwhatsappMouseEnter(Sender: TObject);
    procedure BtnImprimirMouseLeave(Sender: TObject);
    procedure btnPDFMouseLeave(Sender: TObject);
    procedure btnEmailMouseLeave(Sender: TObject);
    procedure btnwhatsappMouseLeave(Sender: TObject);
    procedure BtnCancelarMouseEnter(Sender: TObject);
    procedure BtnCancelarMouseLeave(Sender: TObject);
  private
    { Private declarations }
    procedure MostrarDescricao(const ATexto: string);
    procedure LimparDescricao;
  public
    varParamsStr  :String;
    IDPedido      :Integer;
    { Public declarations }
  end;
var
  FrmImpressao: TFrmImpressao;

implementation

{$R *.dfm}

uses UnitFrmEmail, UnitFrmWhatsApp, Model.Relatorio, Vcl.Loading, UDMRelatorio,
  uJKDialog, Vcl.Validacoes, Vcl.Session;

procedure TFrmImpressao.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmImpressao.BtnCancelarMouseEnter(Sender: TObject);
begin
  inherited;
  MostrarDescricao('Cancelar/Fechar tela');
end;

procedure TFrmImpressao.BtnCancelarMouseLeave(Sender: TObject);
begin
  inherited;
  LimparDescricao;
end;

procedure TFrmImpressao.btnEmailClick(Sender: Tobject);
var
  Relatorio :TModelRelatorio;
  msg:string;
  Email: string;
  idPessoa  : Integer;
begin
  Try
   Relatorio       := TModelRelatorio.Create;
    try
      Relatorio.RelPedido(msg, idPedido);
      Relatorio.RelPedidoItens(msg,idpedido);
      if not TConfiguracaoService.RetornoIDPessoaPedido(idPessoa, idpedido) then
      exit;
      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelPedidoNew.fr3');
      frxPDF.FileName               := 'PEDIDO_'+Inttostr(DMRelatorio.ClientPedido.FieldByName('numPedido').Value)+'.PDF';
      frxPDF.DefaultPath            := ExtractFilePath(Application.ExeName) + '\Temp';
      frxPDF.ShowDialog             := False;
      frxPDF.ShowProgress           := False;
      frxPDF.OverwritePrompt        := False;
      FrxRelatorio.PrepareReport();
      FrxRelatorio.Export(frxPDF);
      if not TConfiguracaoService.ValidarPessoaReceberemail(idPessoa, Email) then
      begin
        JKDialog('Aviso','Cliente não configurado para enviar email!', tdAlerta);
        exit;
      end;
      FrmEnviarEmail                      := TFrmEnviarEmail.Create(Application);
      FrmEnviarEmail.nmPessoa             := DMRelatorio.ClientPedido.FieldByName('nome').Value;
      FrmEnviarEmail.vTituloAnexo         := 'Pedido/Orçamento';
      FrmEnviarEmail.AnexaArquivo         := True;
      FrmEnviarEmail.edtemail.EditValue   := email;
      FrmEnviarEmail.edtAssunto.EditValue := 'Pedido Nº '+Inttostr(DMRelatorio.ClientPedido.FieldByName('numPedido').Value);
      FrmEnviarEmail.edtMensagem.EditValue:= 'Segue em anexo Pedido/Orçamento';
      FrmEnviarEmail.EdtAnexo.items.Add(ExtractFilePath(Application.ExeName) + 'Temp\PEDIDO_'+Inttostr(DMRelatorio.ClientPedido.FieldByName('numPedido').Value)+'.PDF');
      FrmEnviarEmail.ShowModal;

    finally
      Relatorio.Free;
    end;
  except on E: Exception do
    Begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    End;
  End;
end;

procedure TFrmImpressao.btnEmailMouseEnter(Sender: TObject);
begin
  inherited;
  MostrarDescricao('Enviar por e-mail');
end;

procedure TFrmImpressao.btnEmailMouseLeave(Sender: TObject);
begin
  inherited;
  LimparDescricao;
end;

procedure TFrmImpressao.BtnImprimirClick(Sender: TObject);
var
  Relatorio :TModelRelatorio;
  msg:string;
begin
  Try
    Relatorio       := TModelRelatorio.Create;
    try
      Relatorio.RelPedido(msg, idPedido);
      Relatorio.RelPedidoItens(msg,idpedido);
      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelPedidoNew.fr3');
      FrxRelatorio.Report.PrepareReport();
      FrxRelatorio.ShowReport;
    finally
      Relatorio.Free;
    end;

  except on E: Exception do
    Begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    End;
  End;

end;

procedure TFrmImpressao.BtnImprimirMouseEnter(Sender: TObject);
begin
  inherited;
  MostrarDescricao('Imprimir o pedido');
end;

procedure TFrmImpressao.BtnImprimirMouseLeave(Sender: TObject);
begin
  inherited;
  LimparDescricao;
end;

procedure TFrmImpressao.btnPDFClick(Sender: TObject);
var
  Relatorio :TModelRelatorio;
  msg:string;
begin
  try
    Relatorio       := TModelRelatorio.Create;
    try
      Relatorio.RelPedido(msg, idPedido);
      Relatorio.RelPedidoItens(msg,idpedido);
      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelPedidoNew.fr3');
      frxPDF.FileName       := 'PEDIDO.PDF';
      frxPDF.DefaultPath    := ExtractFilePath(Application.ExeName) + '\Temp';
      frxPDF.ShowDialog     := True;
      frxPDF.ShowProgress   := false;
      frxPDF.OverwritePrompt:= false;
      FrxRelatorio.PrepareReport();
      FrxRelatorio.Export(frxPDF);
    finally
      Relatorio.Free;
    end;
  except on E: Exception do
    Begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    End;
  End;
end;

procedure TFrmImpressao.btnPDFMouseEnter(Sender: TObject);
begin
  inherited;
  MostrarDescricao('Gerar PDF do pedido');
end;

procedure TFrmImpressao.btnPDFMouseLeave(Sender: TObject);
begin
  inherited;
  LimparDescricao;
end;

procedure TFrmImpressao.btnwhatsappclick(Sender: Tobject);
var
  Relatorio :TModelRelatorio;
  msg:string;
  Telefone: string;
  idPessoa  : Integer;
  PreencherDados  : TDadosMensaagem;
begin
  Try
    if not TConfiguracaoService.ValidarUsoWhatsApp(TSession.IDEMPRESA) then
    begin
      JKDialog('Aviso','Função não habilitada!', tdAlerta);
      exit;
    end;

    Relatorio       := TModelRelatorio.Create;
    try
      Relatorio.RelPedido(msg, idPedido);
      Relatorio.RelPedidoItens(msg,idpedido);
      if not TConfiguracaoService.RetornoIDPessoaPedido(idPessoa, idpedido) then
      exit;
      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelPedidoNew.fr3');
      frxPDF.FileName               := 'PEDIDO_'+Inttostr(DMRelatorio.ClientPedido.FieldByName('numPedido').Value)+'.PDF';
      frxPDF.DefaultPath            := ExtractFilePath(Application.ExeName) + '\Temp';
      frxPDF.ShowDialog             := False;
      frxPDF.ShowProgress           := False;
      frxPDF.OverwritePrompt        := False;
      FrxRelatorio.PrepareReport();
      FrxRelatorio.Export(frxPDF);
      if not TConfiguracaoService.ValidarPessoaReceberWhatsApp(idPessoa, Telefone) then
      begin
        JKDialog('Aviso','Cliente não configurado para enviar whatsapp!', tdAlerta);
        exit;
      end;
      FrmEnviarWhatsApp                         := TFrmEnviarWhatsApp.Create(Application);
      PreencherDados.Editpara                   := Trim(DMRelatorio.ClientPedido.FieldByName('nome').Value);
                  PreencherDados.EditTelefone   := Tirapontos(telefone);
                  PreencherDados.EditVendedor   := 'Vendedor';
                  PreencherDados.EditCPF        := DMRelatorio.ClientPedido.FieldByName('cpf').Value;
                  PreencherDados.EditDataPedido := DMRelatorio.ClientPedido.FieldByName('data').Value;
                  PreencherDados.EditHoraPedido := DMRelatorio.ClientPedido.FieldByName('hora').Value;
                  PreencherDados.EditPedido     := 1;
                  PreencherDados.EditTotal      := DMRelatorio.ClientPedido.FieldByName('total').Value;
                  PreencherDados.EditIDPessoa   := idPessoa;
                  PreencherDados.EditMensagem   := 'Segue seu Pedido/Orçamento';

                  PreencherDados.PreencherTela(FrmEnviarWhatsApp.cxPara, FrmEnviarWhatsApp.cxTelefone, FrmEnviarWhatsApp.cxMensagem);
      FrmEnviarWhatsApp.cxListAnexo.items.Add(ExtractFilePath(Application.ExeName) + 'Temp\PEDIDO_'+Inttostr(DMRelatorio.ClientPedido.FieldByName('numPedido').Value)+'.PDF');
      FrmEnviarWhatsApp.ShowModal;
    finally
      Relatorio.Free;
    end;
  except on E: Exception do
    Begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    End;
  End;
end;

procedure TFrmImpressao.btnwhatsappMouseEnter(Sender: TObject);
begin
  inherited;
  MostrarDescricao('Enviar via WhatsApp');
end;

procedure TFrmImpressao.btnwhatsappMouseLeave(Sender: TObject);
begin
  inherited;
  LimparDescricao;
end;

procedure TFrmImpressao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmImpressao:=nil;
end;
procedure TFrmImpressao.FormShow(Sender: TObject);
begin
  inherited;
  Try
    if varParamsStr = 'F' then
    begin
      TitleText   := 'Opções após fechamento';
    end;

  except on E: Exception do
    Begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
      Close;
    End;
  End;
end;

procedure TFrmImpressao.MostrarDescricao(const ATexto: string);
begin
  lbrodape.Caption  := ATexto;
end;

procedure TFrmImpressao.LimparDescricao;
begin
  lbrodape.Caption := '';
end;

end.

