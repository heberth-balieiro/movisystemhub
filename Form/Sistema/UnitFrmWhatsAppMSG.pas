unit UnitFrmWhatsAppMSG;

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
  uConfiguracaoService;

type
  TFrmEnviarWhatsAppMSG = class(TForm)
    lblTitulo: TLabel;
    Paneltitulo: TPanel;
    cxGroupBox1: TcxGroupBox;
    _BtnPanelCancelar: TPanel;
    btnCancelar: TSpeedButton;
    _PanelEnviar: TPanel;
    btnEnviar: TSpeedButton;
    Label4: TLabel;
    EdtAnexo: TcxListBox;
    Label3: TLabel;
    edtMensagem: TcxMemo;
    ACBrEnterTab1: TACBrEnterTab;
    ds: TUniDataSource;
    Label5: TLabel;
    edtpagamento: TcxLookupComboBox;
    BtnAplicar: TSpeedButton;
    btnParams: TSpeedButton;
    btnAddAnexo: TSpeedButton;
    btnDelanexo: TSpeedButton;
    OpenDialog: TOpenDialog;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEnviarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAplicarClick(Sender: TObject);
    procedure btnParamsClick(Sender: TObject);
    procedure btnAddAnexoClick(Sender: TObject);
    procedure btnDelanexoClick(Sender: TObject);
  private
    Function ValidarCampos(out msg: string):Boolean;
    Function Enviar(out msg:string;Envio:String):boolean;

    Procedure PopularMensagemWhatsEmail;

    function EnviarMSG(out msg:string;telefone, mensagem:string): boolean;
    function EnviarMSGArquivo(out msg: string; telefone,
      mensagem,anexo: string): boolean;

    { Private declarations }
  public
    nmVendedor, nmPedido:String;
    nmData:Tdate;
    nmHora:Ttime;
    nmTotal:Double;
    { Public declarations }
  end;

var
  FrmEnviarWhatsAppMSG: TFrmEnviarWhatsAppMSG;

implementation

{$R *.dfm}

uses uJKDialog, UDM, UConeSul, Vcl.Session, Vcl.Validacoes, Model.Usuario;

procedure TFrmEnviarWhatsAppMSG.btnAddAnexoClick(Sender: TObject);
begin
  OpenDialog.Filter := 'Imagens PNG (*.png)|*.png|PDFs (*.pdf)|*.pdf| Video mp4 (*.mp4)|*.mp4|';
  OpenDialog.Title  := 'Carregar Anexo';

  if OpenDialog.Execute then
  begin   //ExtractFilePath(Application.ExeName) + 'Temp\PEDIDO_'+Inttostr(nmPedido)+'.PDF'
    EdtAnexo.items.Add(Opendialog.FileName);
  end;
end;

procedure TFrmEnviarWhatsAppMSG.BtnAplicarClick(Sender: TObject);
var
msg:string;
begin
  //Criar a funcao para buscar a mensagem e popupar os o cammpo

  if edtPagamento.Text<>'' then
  begin
    edtmensagem.Clear;
    if DM.AplicarMensagemWhatsEmail(msg,edtPagamento.EditValue) then
    edtmensagem.Lines.Add(msg);
  end;

end;

procedure TFrmEnviarWhatsAppMSG.btnCancelarClick(Sender: TObject);
begin
  Close;
    //TNavigation.Close(Self);
end;

procedure TFrmEnviarWhatsAppMSG.btnDelanexoClick(Sender: TObject);
begin
  if EdtAnexo.ItemIndex <> -1 then
    EdtAnexo.Items.Delete(EdtAnexo.ItemIndex);
end;

procedure TFrmEnviarWhatsAppMSG.btnEnviarClick(Sender: TObject);
var
msg:string;
begin
  if ValidarCampos(msg) then
  begin
    Try
       if Enviar(msg,'') then
        begin
          JKDialog('Sucesso','WhatsApp enviada.', tdSucesso);
          FrmEnviarWhatsAppMSG.Close;
          //TNavigation.Close(Self);
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

procedure TFrmEnviarWhatsAppMSG.btnParamsClick(Sender: TObject);
begin
    Showmessage('Variaveis:'+#13+
              '[Empresa]'+#13+
              '[Nome]'+#13+
              '');
end;

function TFrmEnviarWhatsAppMSG.Enviar(out msg: string;Envio:String): boolean;
var
telefone, mensagem, DDD, celular,CellSemDDD  :string;
I,A:integer;
Anexo:String;
MensagemFormatada:String;
begin
  Result  := False;

  //Preparar envio
  DM.TabRelacaoAniversariante.DisableControls;
  DM.TabRelacaoAniversariante.First;

  Mensagem        := Trim(edtMensagem.Text);


  for I := 1 to DM.TabRelacaoAniversariante.RecordCount do
  begin
    Telefone      := TiraPontos(DM.TabRelacaoAniversariantewhatsapp.AsString);
    DDD           := copy(TiraPontos(telefone), 1, 2);
    CellSemDDD    := copy(TiraPontos(telefone),3,11);

    if Length(CellSemDDD) = 9 then
    Celular := '55' + DDD + trim(copy(telefone, 4, 11));

    if Length(CellSemDDD) = 8 then
    Celular := '55' + DDD + trim(copy(telefone, 3, 10));

    //Preparar Mensagem

    MensagemFormatada       := Mensagem;
          MensagemFormatada := StringReplace(MensagemFormatada,'[Nome]',trim(DM.TabRelacaoAniversariantenome.AsString), [rfReplaceAll]);
          MensagemFormatada := StringReplace(MensagemFormatada,'[Empresa]',TSession.RAZAO,[rfReplaceAll]);


    for A := 0 to EdtAnexo.Items.Count - 1 do
    begin
      Anexo   := EdtAnexo.Items.Strings[a];
    end;

    if EnviarMSG(msg,Celular, MensagemFormatada) then
      Result  := True
    else
      Result  := False;

    Sleep(1000);

    if EdtAnexo.Items.Count > 0 then
    begin
      if EnviarMSGArquivo(msg,Celular, mensagem, anexo) then
      Result  := True
      else
      result  :=False;
    end;
    DM.TabRelacaoAniversariante.Next;
  end;
  DM.TabRelacaoAniversariante.First;
  DM.TabRelacaoAniversariante.EnableControls;

end;

procedure TFrmEnviarWhatsAppMSG.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    FrmEnviarWhatsAppMSG := nil;
end;

procedure TFrmEnviarWhatsAppMSG.FormShow(Sender: TObject);
begin
  PopularMensagemWhatsEmail;
end;

procedure TFrmEnviarWhatsAppMSG.PopularMensagemWhatsEmail;
begin
  Try
   // DM.PopularMensagemWhatsEmail('ENVIO WHATSAPP');
  Except on e:exception do
    raise Exception.Create(e.Message);
  End;
end;

function TFrmEnviarWhatsAppMSG.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if (edtMensagem.Text='') then
  begin
    msg := 'Informe uma mensagem!';
    result  := False;
    exit;
  end;

end;

{$REGION 'Função de Envio'}

Function TFrmEnviarWhatsAppMSG.EnviarMSG(out msg:string;telefone, mensagem:string):boolean;
var
  LResponse : IResponse;
  JsonBody  : TJsonObject;
  token     : string;
  url       : string;
  ModelVal  : TValidacao;
  ModelUser : TModelUsuario;
begin
  //Chamada de envio de mensagem
  Result  := False;

  if DM.BuscarURLWhatsApp(msg, url) then
  begin
    //Tipo de configuracao aplicada para o envio
    ModelVal      := TValidacao.create;
    Try
      if ModelVal.InstanciaPorFunc(TSession.IDEMPRESA) then
      begin
        //Por Funcionario

        //Buscar token do cadastro do usuario
        ModelUser := TModelUsuario.Create;
        Try
          if not TConfiguracaoService.RetornoInstanciaWhatsAppFuncionario(token, TSession.ID_USUARIO) then
          begin
            msg     := 'Usuário sem instancia iniciada!';
            result  := False;
            exit;
          end;
        Finally
          ModelUser.Free;
        End;

        LResponse := TRequest.New.BaseURL(url)
                .Resource('/message/text?')
                .AddParam('key',token)
                .AddField('id',telefone)
                .AddField('message',Mensagem)
                .Post;

        if LResponse.StatusCode = 201 then
        begin
          msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
          Result  := True
        end
        else
        begin
          msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
          result  := False;
        end;

      end
      else
      begin
        //por empresa
        token       := TConeSul.Crypt('C',TSession.RAZAO);

        LResponse := TRequest.New.BaseURL(url)
                .Resource('/message/text?')
                .AddParam('key',token)
                .AddField('id',telefone)
                .AddField('message',Mensagem)
                .Post;

        if LResponse.StatusCode = 201 then
        begin
          msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
          Result  := True
        end
        else
        begin
          msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
          result  := False;
        end;

      end;

    Finally
      ModelVal.free;
    End;
  end;

end;

Function TFrmEnviarWhatsAppMSG.EnviarMSGArquivo(out msg:string;telefone, mensagem, anexo:string):boolean;
var
  LResponse : IResponse;
  token     : string;
  url       : string;
  ModelVal  : TValidacao;
  ModelUser : TModelUsuario;
begin
  //Chamada de envio de mensagem
  Result  := False;

  if DM.BuscarURLWhatsApp(msg, url) then
  begin

    ModelVal      := TValidacao.create;
    Try
      if ModelVal.InstanciaPorFunc(TSession.IDEMPRESA) then
      begin
        //Por Funcionario

        //Buscar token do cadastro do usuario
        ModelUser := TModelUsuario.Create;
        Try
          if not TConfiguracaoService.RetornoInstanciaWhatsAppFuncionario(token, TSession.ID_USUARIO) then
          begin
            msg     := 'Usuário sem instancia iniciada!';
            result  := False;
            exit;
          end;
        Finally
          ModelUser.Free;
        End;

        LResponse := TRequest.New.BaseURL(url)
                .Resource('/message/doc?')
                .AddParam('key',token)
                .AddFile('file',anexo)
                .AddField('id',telefone)
                .AddField('filename','')
                .Post;

        if LResponse.StatusCode = 201 then
        begin
          msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
          Result  := True
        end
        else
        begin
          msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
          result  := False;
        end;

      end
      else
      begin
        //por empresa
        token       := TConeSul.Crypt('C',TSession.RAZAO);

        LResponse := TRequest.New.BaseURL(url)
                .Resource('/message/doc?')
                .AddParam('key',token)
                .AddFile('file',anexo)
                .AddField('id',telefone)
                .AddField('filename','')
                .Post;

        if LResponse.StatusCode = 201 then
        begin
          msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
          Result  := True
        end
        else
        begin
          msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
          result  := False;
        end;
      end;
    Finally
      ModelVal.Free;
    End;

  end

end;

{$ENDREGION}

end.
