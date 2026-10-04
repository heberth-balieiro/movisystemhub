unit UnitFrmWhatsApp;

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
  cxCustomListBox, cxListBox, cxMemo,
  RESTRequest4D,DataSet.Serialize.Adapter.RESTRequest4D,System.JSON, ACBRUtil,
  ACBrBase, ACBrEnterTab, REST.Types, Data.DB, DBAccess, Uni,
  UFormNovoBaseDiversos, Vcl.ButtonStylesAttributes, Vcl.StyledButton,
  Model.Mensagem_Whatsapp, Controller.Mensagem_Whatsapp, Datasnap.DBClient,
  Controller.LookupHelper, UnitGlobal, uConfiguracaoService, UnitMensagemCad,
  cxStyles, cxGridTableView, cxClasses;

type
  TDadosMensaagem = record
    Editpara: string;
    EditTelefone: string;
    EditVendedor:string;
    EditMensagem:string;
    EditPedido:Integer;
    EditTotal:Double;
    EditDataPedido:TDate;
    EditHoraPedido:TTime;
    EditCPF:String;
    EditMatricula:Integer;
    EditIDPessoa:Integer;
    procedure PreencherTela(AEditPara: TcxTextEdit; AeditTelefone: TcxMaskEdit; AeditMensagem: TcxMemo);
  end;

type
  TFrmEnviarWhatsApp = class(TFormNovoBaseDiversos)
    Label6: TLabel;
    Label7: TLabel;
    cxTelefone: TcxMaskEdit;
    cxPara: TcxTextEdit;
    cxMsgpronta: TcxLookupComboBox;
    Label8: TLabel;
    BtnMensagem: TcxButtonEdit;
    BtnAplicar: TSpeedButton;
    Label9: TLabel;
    cxMensagem: TcxMemo;
    btnParams: TSpeedButton;
    BtnSalvar: TStyledBitBtn;
    BtnCancelar1: TStyledBitBtn;
    TabMensagem: TClientDataSet;
    TabMensagemid_mensagem: TIntegerField;
    TabMensagemcodigo: TIntegerField;
    TabMensagemdescricao: TStringField;
    TabMensagemnpesquisa: TStringField;
    cxListAnexo: TcxListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnCancelar1Click(Sender: TObject);
    procedure BtnAplicarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnParamsClick(Sender: TObject);
    procedure BtnMensagemPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);

  private
    ACPF:String;
    AMatricula:Integer;
    AIDPessoa:Integer;
    AVendedor:string;
    APedido:Integer;
    ATotal:Double;
    ADataPedido:TDate;
    AHoraPedido:TTime;
    function RecuperarToken: string;
    { Private declarations }
  public
    Function ValidarCampos(Out Msg: String):Boolean;
    Function Salvar(Out Msg: String):Boolean;
    { Public declarations }
  end;

var
  FrmEnviarWhatsApp: TFrmEnviarWhatsApp;
  ContrMensagem : TMensagemWhatsappController;
  ObjMensagem   : TMensagemWhatsapp;
implementation

{$R *.dfm}

uses uJKDialog, UConeSul, Vcl.Session, UVariaveisMensagem;

procedure TFrmEnviarWhatsApp.BtnAplicarClick(Sender: TObject);
var
 RetStr: String;
begin
  inherited;
  //Aplicar
  if (cxMsgpronta.Text <> '') or (cxMsgpronta.EditValue >0) then
  begin
    cxMensagem.Clear;
    if TConfiguracaoService.RetornoMensagemWhatsApp(RetStr,cxMsgpronta.editvalue) then
    cxMensagem.Lines.Add(RetStr);
  end;
end;

procedure TFrmEnviarWhatsApp.BtnCancelar1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmEnviarWhatsApp.BtnMensagemPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  try
    try
      if not Assigned(FrmMensagemCad) then
      FrmMensagemCad := TFrmMensagemCad.Create(Application);
      //FrmMensagemCad.ParamsStr  := 'N';
      FrmMensagemCad.ShowModal;
    finally
      TLookupHelper.CarregarLookup(
                  TabMensagem,LookupMensagemtabConfigsql);
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmEnviarWhatsApp.btnParamsClick(Sender: TObject);
begin
  inherited;
  ShowMessage('Variáveis disponíveis:' + sLineBreak + GetVariaveisMensagem);
end;

procedure TFrmEnviarWhatsApp.BtnSalvarClick(Sender: TObject);
var
msg:String;
begin
  if ValidarCampos(msg) then
  begin
    Try
       if Salvar(msg) then
        begin
          JKDialog('Sucesso',msg, tdSucesso);
          Close;
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

procedure TFrmEnviarWhatsApp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmEnviarWhatsApp := nil;
end;

procedure TFrmEnviarWhatsApp.FormCreate(Sender: TObject);
begin
  inherited;
  //
end;

procedure TFrmEnviarWhatsApp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = vk_f5 then
  begin
    btnsalvar.Click;
    key:=0;
  end;

  if key = VK_ESCAPE then
  begin
    btncancelar1.Click;
    key:=0;
  end;
end;

procedure TFrmEnviarWhatsApp.FormShow(Sender: TObject);
begin
  inherited;
  TitleText    := 'Enviar WhatsApp';
  Try
    TLookupHelper.CarregarLookup(
                  TabMensagem,LookupMensagemtabConfigsql);
    cxpara.SetFocus;
  Except on e:exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  End;
end;

function TFrmEnviarWhatsApp.Salvar(out Msg: String): Boolean;
Var
  telefone      : String;
  Mensagem      : String;
  MensagemFormatada : String;
  Anexo,Extensao         : String;
  I:Integer;
  RecMensagem   : TDadosMensaagem;
begin
  Result        := False;
  ContrMensagem := Nil;
  ObjMensagem   := nil;
  Telefone      := TiraPontos(cxTelefone.Text);
  Mensagem      := Trim(cxMensagem.Text);

  Try
    ContrMensagem := TMensagemWhatsappController.Create;
    ObjMensagem   := TMensagemWhatsapp.Create;

    //Preparar Formatacao da mensagem
    MensagemFormatada       := Mensagem;
    MensagemFormatada := StringReplace(MensagemFormatada,'[Nome]'     ,trim(cxPara.Text), [rfReplaceAll]);
    MensagemFormatada := StringReplace(MensagemFormatada,'[Vendedor]' ,Trim(AVendedor), [rfReplaceAll]);
    MensagemFormatada := StringReplace(MensagemFormatada,'[Pedido]'   ,IntTostr(APedido), [rfReplaceAll]);
    MensagemFormatada := StringReplace(MensagemFormatada,'[Total]'    ,FormatFloat('#,##0.00',ATotal), [rfReplaceAll]);
    MensagemFormatada := StringReplace(MensagemFormatada,'[Data]'     ,FormatDateTime('dd/mm/yyyy', ADataPedido)+' - '+FormatDateTime('hh:mm', AHoraPedido), [rfReplaceAll]);
    MensagemFormatada := StringReplace(MensagemFormatada,'[Empresa]'  ,TSession.RAZAO,[rfReplaceAll]);
    MensagemFormatada := StringReplace(MensagemFormatada,'[CPF]'      , ACPF,[rfReplaceAll]);
    MensagemFormatada := StringReplace(MensagemFormatada,'[Matricula]',Inttostr(AMatricula),[rfReplaceAll]);

    //Primeiro Grava a mensagem
    Try
      //Montar os dados no objeto
      ObjMensagem.id_zap            := 0;
      ObjMensagem.mensagem          := MensagemFormatada;
      ObjMensagem.url               := '';
      ObjMensagem.nomepessoa        := Trim(cxPara.Text);
      ObjMensagem.id_pessoa         := AIDPessoa;
      ObjMensagem.fone              := Telefone;
      ObjMensagem.status            := 'A';
      ObjMensagem.anexobase         := '';
      ObjMensagem.ext               := '';
      ObjMensagem.tipo              := 'M';  //mensagem apenas
      ObjMensagem.token             := RecuperarToken;
      ObjMensagem.nomeinstancia     := TConeSul.Crypt('C',TSession.RAZAO);

      if ContrMensagem.GravarMensagem(ObjMensagem) then
      begin

        //enviar o anexo
        if cxListAnexo.Items.Count > 0 then
        begin
          for i := 0 to cxListAnexo.Items.Count - 1 do
          begin
            Anexo   := cxListAnexo.Items.Strings[i];
            Extensao:= ExtractFileExt(anexo);
            ObjMensagem.anexobase         := Anexo;
            ObjMensagem.ext               := Extensao;
            ObjMensagem.tipo              := 'A';
            ContrMensagem.GravarMensagem(ObjMensagem);
          end;

        end;

        msg := 'Sua mensagem foi salva e será enviada automaticamente pelo WhatsApp.';
        Result  := True;
      end;
    Finally
      FreeAndNil(ContrMensagem);
      FreeAndNil(ObjMensagem);
    End;

  Except on e:exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  End;
end;

function TFrmEnviarWhatsApp.ValidarCampos(out Msg: String): Boolean;
var
Token : String;
begin
  Result  := True;

  if cxpara.Text='' then
  begin
    msg     := 'Informe o nome da pessoa a ser enviada!';
    Result  := false;
    exit;
  end;

  if TConeSul.ValidarTelefonePreenchido(cxTelefone) then
  begin
    msg   := 'Informe um telefone!';
    Result:= False;
    exit;
  end;

  if cxmensagem.Text ='' then
  begin
    msg   := 'Nenhuma mensagem informada!';
    Result:= False;
    exit;
  end;

  //Validar se tem algum token criado
  Token := RecuperarToken;
  if Token = '' then
  begin
    msg   := 'Nenhuma instância do WhatsApp criada!';
    Result:= False;
    exit;
  end;

end;

Function TFrmEnviarWhatsApp.RecuperarToken:string;
var
Token    : String;
begin
    Result  := '';
    Token   := '';

    Try
      //Por Funcionario
      if TConfiguracaoService.ValidarInstanciaWhatsappFuncionario(TSession.IDEMPRESA) then
      begin
        if TConfiguracaoService.RetornoInstanciaWhatsAppFuncionario(token,TSession.ID_USUARIO) then
        begin
          Result  := token;
        end
        else
        Result  := '';
      end
      else
      begin
        //Instancia por empresa
        if TConfiguracaoService.RetornoInstanciaWhatsAppEmpresa(token,TSession.IDEMPRESA) then
        begin
          Result  := token;
        end
        else
        Result  := '';
      end;
      Except on e:exception do
      begin
        JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
      end;
    End;
end;


{ TDadosMensaagem }

procedure TDadosMensaagem.PreencherTela(AEditPara: TcxTextEdit; AeditTelefone: TcxMaskEdit; AeditMensagem: TcxMemo);
begin
  FrmEnviarWhatsApp.cxpara.editvalue      := Editpara;
  FrmEnviarWhatsApp.cxTelefone.editvalue  := EditTelefone;
  FrmEnviarWhatsApp.cxmensagem.editvalue  := EditMensagem;
  FrmEnviarWhatsApp.ACPF                  := EditCPF;
  FrmEnviarWhatsApp.AMatricula            := EditMatricula;
  FrmEnviarWhatsApp.AIDPessoa             := EditIDPessoa;
  FrmEnviarWhatsApp.AVendedor             := EditVendedor;
  FrmEnviarWhatsApp.APedido               := EditPedido;
  FrmEnviarWhatsApp.ATotal                := EditTotal;
  FrmEnviarWhatsApp.ADataPedido           := EditDataPedido;
  FrmEnviarWhatsApp.AHoraPedido           := EditHoraPedido;

end;

end.


