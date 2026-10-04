unit UnitConfiguracaoTerminal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.FileCtrl,
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
  cxCheckBox, Vcl.Menus, cxButtons, ACBrBase, ACBrEnterTab, dxBarBuiltInMenu,
  cxPC, ACBRUTIL, ACBrDFe, ACBrNFe,ACBrDFeSSL, Data.DB, DBAccess, Uni,System.IniFiles,
  ACBrECF, Vcl.Printers, UFormNovoBaseDiversos, Vcl.ButtonStylesAttributes,
  Vcl.StyledButton, Datasnap.DBClient, Controller.LookupHelper, UnitGlobal,
  cxStyles, cxGridTableView, cxClasses, cxSpinEdit;

type
  TFrmConfiguracaoTerminal = class(TFormNovoBaseDiversos)
    OpenDialog: TOpenDialog;
    ACBrECF1: TACBrECF;
    Label4: TLabel;
    cxCliente: TcxLookupComboBox;
    Label6: TLabel;
    cxVendedor: TcxLookupComboBox;
    Label8: TLabel;
    cxPrazo: TcxLookupComboBox;
    cxImpressora: TcxComboBox;
    Label9: TLabel;
    cxvisualizarticket: TcxCheckBox;
    Label10: TLabel;
    cxSituacaoticket: TcxComboBox;
    cxsalvaraberto: TcxCheckBox;
    cxorcamento: TcxCheckBox;
    cxtelaimpressao: TcxCheckBox;
    BtnCancelar: TStyledBitBtn;
    BtnSalvar: TStyledBitBtn;
    TabCliente: TClientDataSet;
    TabVendedor: TClientDataSet;
    TabPrazo: TClientDataSet;
    dsVendedor: TUniDataSource;
    dsPrazo: TUniDataSource;
    cxavisodependente: TcxCheckBox;
    TabClienteid_socio: TIntegerField;
    TabClientecliente: TStringField;
    TabClientecpf: TStringField;
    TabClientewhatsapp: TStringField;
    TabClienteaviso: TStringField;
    TabVendedorid_funcionario: TIntegerField;
    TabVendedorfunc: TStringField;
    TabVendedorcpf: TStringField;
    TabPrazoid_prazo: TIntegerField;
    TabPrazocodigo: TIntegerField;
    TabPrazotipo: TStringField;
    TabPrazodescricao: TStringField;
    TabPrazonprazopag: TStringField;
    cxintervado: TcxSpinEdit;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
  private
    function Salvar(out msg: string): Boolean;
    function ValidarCampos(out msg: string): Boolean;
    procedure PopularCampos;
    procedure ListaImpressora;
    procedure Permissoes;
    { Private declarations }
  public

    { Public declarations }
  end;

var
  FrmConfiguracaoTerminal: TFrmConfiguracaoTerminal;

implementation

{$R *.dfm}

Uses Vcl.Loading, Udm, Vcl.Session, uJKDialog, UConeSul, Vcl.PermissaoUsuario;


procedure TFrmConfiguracaoTerminal.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConfiguracaoTerminal.BtnSalvarClick(Sender: TObject);
var
msg :String;
begin
  //Salvar e validar dados
  if ValidarCampos(msg) then
  begin
    Try
       if Salvar(msg) then
        begin
          JKDialog('Sucesso',msg, tdSucesso);
          close;
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

procedure TFrmConfiguracaoTerminal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmConfiguracaoTerminal := nil;
end;

procedure TFrmConfiguracaoTerminal.FormShow(Sender: TObject);
begin
  inherited;
  TitleText   := 'Configuração por Terminal';

  Try
    TLookupHelper.CarregarLookup(
                  TabCliente,LookupAssociadoSql);

    TLookupHelper.CarregarLookup(
                  TabVendedor,LookupVendedorSql);

    TLookupHelper.CarregarLookup(
                  TabPrazo,LookupPrazoPagSql);

    ListaImpressora;
    Permissoes;
    PopularCampos;
  Except on e:exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  End;

end;

procedure TFrmConfiguracaoTerminal.ListaImpressora;
var
  I: Integer;
begin
  cxImpressora.Properties.Items.Clear;
  ACBrECF1.Device.AcharPortasSeriais(cxImpressora.Properties.Items);
  for I := 0 to Printer.Printers.Count - 1 do
    cxImpressora.Properties.Items.Add('RAW:' + Printer.Printers[I]);
    cxImpressora.Properties.Items.Add('/Dev/ttyS0');
    cxImpressora.Properties.Items.Add('/Dev/ttyS1');
    cxImpressora.Properties.Items.Add('/Dev/USB0');
    cxImpressora.Properties.Items.Add('/Dev/USB1');
end;

procedure TFrmConfiguracaoTerminal.Permissoes;
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Terminal');

  if Permissao.TemPermissao('Permitir Alterar Cliente') then
  else
  cxCliente.Enabled  := False;

  if Permissao.TemPermissao('Permitir Alterar Vendedor') then
  else
  cxVendedor.Enabled  := False;

  if Permissao.TemPermissao('Permitir Alterar Prazo de Pagamento') then
  else
  cxprazo.Enabled  := False;

  if Permissao.TemPermissao('Permitir Alterar Caminho Impressora Ticket') then
  else
  cxImpressora.Enabled  := False;

  if Permissao.TemPermissao('Permitir Alterar Visualizar Ticket') then
  else
  cxVisualizarTicket.Enabled  := False;

  if Permissao.TemPermissao('Permitir Alterar Situação Ticket') then
  else
  cxSituacaoTicket.Enabled  := False;

  if Permissao.TemPermissao('Permitir Alterar Salvar Pedido em Aberto') then
  else
  cxsalvarAberto.Enabled  := False;

  if Permissao.TemPermissao('Permitir Alterar Iníciar Operação com Orçamento') then
  else
  cxOrcamento.Enabled  := False;

  if Permissao.TemPermissao('Permitir Alterar Tela de Impressão') then
  else
  cxtelaimpressao.Enabled  := False;

  if Permissao.TemPermissao('Permitir Alterar Aviso Dependente') then
  else
  cxavisodependente.Enabled  := False;
end;

procedure TFrmConfiguracaoTerminal.PopularCampos;
var
  Config: TIniFile;
begin
  Try
    Config := TIniFile.Create(dm.nDirArquivo + '\Config.ini');
    try
      cxCliente.EditValue         := Config.ReadInteger('PEDIDO', 'Pessoa', -1);
      cxVendedor.EditValue        := Config.ReadInteger('PEDIDO', 'Vendedor', -1);
      cxprazo.EditValue           := Config.ReadInteger('PEDIDO', 'Pagamento', -1);
      cxsalvarAberto.EditValue    := Config.ReadString('PEDIDO', 'Aberto', 'A');
      cxtelaimpressao.EditValue   := Config.ReadString('PEDIDO', 'TelaImpressao', 'S');
      cxOrcamento.EditValue       := Config.ReadString('PEDIDO', 'Orcamento', 'N');
      cxavisodependente.EditValue := Config.ReadString('PEDIDO', 'Avisodependente', 'N');
      cxImpressora.Text           := Config.ReadString('PEDIDO', 'ImpressoraTicket', '');
      cxVisualizarTicket.EditValue:= Config.ReadString('PEDIDO', 'VisualizarTicket', 'N');
      cxSituacaoTicket.EditValue  := Config.ReadString('PEDIDO', 'SituacaoTicket', 'Todos');

      cxintervado.EditValue       := Config.ReadInteger('PARAMETRO', 'IntervaloData', 30);

    Finally
      Config.Free;
    end;

  Except on e:exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  End;
end;

function TFrmConfiguracaoTerminal.Salvar(out msg: string): Boolean;
var
  Config: TIniFile;
begin
  Result  := False;
  Try
    Config := TIniFile.Create(dm.nDirArquivo+'\Config.ini');
    Try
      Config.WriteInteger('PEDIDO', 'Pessoa', cxCliente.EditValue);
      Config.WriteInteger('PEDIDO', 'Vendedor', cxVendedor.EditValue);
      Config.WriteInteger('PEDIDO', 'Pagamento', cxprazo.EditValue);
      Config.WriteString('PEDIDO', 'Aberto', cxsalvarAberto.EditValue);
      Config.WriteString('PEDIDO', 'TelaImpressao', cxtelaimpressao.EditValue);
      Config.WriteString('PEDIDO', 'Orcamento', cxOrcamento.EditValue);
      Config.WriteString('PEDIDO', 'Avisodependente', cxavisodependente.EditValue);

      Config.WriteString('PEDIDO', 'ImpressoraTicket', cxImpressora.Text);
      Config.WriteString('PEDIDO', 'VisualizarTicket', cxVisualizarTicket.EditValue);
      Config.WriteString('PEDIDO', 'SituacaoTicket',  cxSituacaoTicket.EditValue);

      Config.WriteString('PARAMETRO', 'IntervaloData',  cxintervado.EditValue);



      Result  := True;
      Msg := 'Dados salvo com sucesso!';
    Finally
      Config.Free;
    End;
  Except on e:exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  End;
end;

function TFrmConfiguracaoTerminal.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

end;

end.


