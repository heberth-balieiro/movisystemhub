unit UnitQrCodeWhatsApp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
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
  RESTRequest4D,DataSet.Serialize.Adapter.RESTRequest4D,System.JSON, uni, Mensagemzap.v1, uEvolutionAPI,
  Vcl.ButtonStylesAttributes, Vcl.StyledButton;

var
  TempoRestante: Integer = 60;
type

  TFrmQrCodeWhatsApp = class(TForm)
    lblTitulo: TLabel;
    Paneltitulo: TPanel;
    cxGroupBox1: TcxGroupBox;
    ImgQrCode: TImage;
    Tempo: TTimer;
    Label1: TLabel;
    PanelButton: TPanel;
    BtnCriar: TStyledBitBtn;
    BtnLerQrCode: TStyledBitBtn;
    BtnLogoutInstancia: TStyledBitBtn;
    BtnDelete: TStyledBitBtn;
    BtnFechar: TStyledBitBtn;
    lbStatus: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure TempoTimer(Sender: TObject);
    procedure BtnCriarClick(Sender: TObject);
    procedure BtnLerQrCodeClick(Sender: TObject);
    procedure BtnLogoutInstanciaClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    {$REGION 'Evolution'}

      FEvolution: TEvolutionAPI;
      FNomeInstancia: string;
      function InicializarEvolution: Boolean;
      procedure ConsultarStatusInstancia(ExibirErro: Boolean = True);
      procedure AtualizarStatusVisual(const Estado: string);

      function RemoveBase64Prefix(const base64String: string): string;
      function GravarInstanciaWhatsapp(instancia: string): Boolean;
    {$ENDREGION}


    { Private declarations }
    //Function Informacaoinstancia(out msg,Json,UserData:string):Boolean;
    //function IniciarInstancia(out msg:string): Boolean;
    //function QrCodeBase(out msg,qrcode:string): boolean;
    //
    //function ExcluirInstancia(out msg: String): Boolean;
    //
    //function IniciarInstanciaIndividual(out msg: string;
    //  whatsapp: string): Boolean;
    //function InformacaoinstanciaIndividual(out msg, Json,
    //  UserData: string; whatsapp:string): Boolean;
    //function QrCodeBaseFunc(out msg, qrcode: string; whatsapp: string): boolean;
    //function GravarInstanciaWhatsappFunc(instancia: string): Boolean;
    //function ExcluirInstanciaFunc(out msg: String): Boolean;

    //Novo Codigo zap
    //Procedure CriarInstanciaZap;

  public
    StatusWhats:Boolean;
    ParamsStr:String;
    ParamInt:Integer;
    
    { Public declarations }
  end;

var
  FrmQrCodeWhatsApp: TFrmQrCodeWhatsApp;

implementation

{$R *.dfm}

uses UDM, UConeSul, Vcl.Session, uJKDialog,Vcl.Validacoes,Model.SQLQry;

function TFrmQrCodeWhatsApp.RemoveBase64Prefix(const base64String: string): string;
var
  prefix: string;
  base64Data: string;
begin
  prefix := 'data:image/png;base64,';
  base64Data := base64String;
  // Verifica se a string inicia com o prefixo
  if Copy(base64Data, 1, Length(prefix)) = prefix then
    Delete(base64Data, 1, Length(prefix)); // Remove o prefixo
  Result := base64Data;
end;

procedure TFrmQrCodeWhatsApp.TempoTimer(Sender: TObject);
var
  Estado, Msg: string;
begin
  Dec(TempoRestante);
  Label1.Caption := Format('Tempo restante: %d segundos', [TempoRestante]);
  if not Assigned(FEvolution) then Exit;

  if FEvolution.InstanceConnectionState(FNomeInstancia, Estado, Msg) then
  begin
    AtualizarStatusVisual(Estado);
    if SameText(Estado, 'open') then
    begin
      imgQRCode.Picture.Graphic := nil;
      Tempo.Enabled         := False;
      label1.Caption        := '';
      JKDialog('Sucesso', 'WhatsApp conectado com sucesso.', tdSucesso);
    end;
  end;

  if TempoRestante <= 0 then
  begin
    Tempo.Enabled   := False;
    ImgQRCode.Picture := nil;
    label1.Caption := '';
    JKDialog('Tempo expirado', 'O QR Code expirou. Clique para gerar um novo.', tdalerta);
  end;
end;

procedure TFrmQrCodeWhatsApp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FrmQrCodeWhatsApp := nil;
end;

procedure TFrmQrCodeWhatsApp.FormDestroy(Sender: TObject);
begin
  Tempo.Enabled := False;
  FreeAndNil(FEvolution);
end;

procedure TFrmQrCodeWhatsApp.FormShow(Sender: TObject);
var
msg,Json,UserData, versaoapi:string;
ModelVal:TValidacao;
begin
  ImgQrCode.Picture := nil;
  StatusWhats       := False;

  if InicializarEvolution then
  begin
    ConsultarStatusInstancia(False);
    Tempo.Interval := 5000;
  end;

end;

Function TFrmQrCodeWhatsApp.GravarInstanciaWhatsapp(instancia:string):Boolean;
var
  Qry: TUniQuery;
  sqlQuery: string;
begin
  Result := False;

  Qry := TUniQuery.Create(nil);
  try
    try

      Qry.Connection := dm.Conn;

      sqlQuery := 'Update temp set  '+
                  ' instance_key= :key'+
                  ' where id_empresa= :id and id_temp=''1''';

      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text := sqlQuery;

      Qry.ParamByName('key').asstring   := instancia;
      Qry.ParamByName('id').AsInteger   := TSession.IDEMPRESA;

      Qry.ExecSQL;

      Result := True;
    except
      on E: Exception do
      begin
        raise Exception.Create(e.Message);
      end;
    end;
  finally
    Qry.Free;
  end;
end;

{$REGION 'Funções Novas'}

function TFrmQrCodeWhatsApp.InicializarEvolution: Boolean;
var
  URL, APIKey, Msg: string;
  ModelVal:TValidacao;
begin
  Result := Assigned(FEvolution);
  if Result then Exit;

  URL     := '';
  APIKey  := '';
  Msg     := '';

  DM.BuscarURLWhatsApp(Msg, URL);

  ModelVal          := TValidacao.create;

  Try
    ModelVal.ApikeyWhatsapp(APIKey, TSession.IDEMPRESA);
  Finally
    ModelVal.Free;
  End;

  if (Trim(URL) = '') or (Trim(APIKey) = '') then
  begin
    JKDialog('Aviso', 'Sistema sem URL ou API Key da Evolution configurada.', tdAlerta);
    Exit(False);
  end;

  FNomeInstancia := TConeSul.Crypt('C', TSession.RAZAO);

  if Trim(FNomeInstancia) = '' then
  begin
    JKDialog('Aviso', 'Não foi possível definir o nome da instância.', tdAlerta);
    Exit(False);
  end;

  try
    FEvolution := TEvolutionAPI.Create(URL, APIKey);
    Result := True;
  except
    on E: Exception do JKDialog('Aviso', E.Message, tdAlerta);
  end;
end;

procedure TFrmQrCodeWhatsApp.ConsultarStatusInstancia(ExibirErro: Boolean);
var
  Estado, Msg: string;
begin
  if not InicializarEvolution then Exit;

  if FEvolution.InstanceConnectionState(FNomeInstancia, Estado, Msg) then
    AtualizarStatusVisual(Estado)
  else if ExibirErro then
    JKDialog('Aviso', Msg, tdAlerta);
end;

procedure TFrmQrCodeWhatsApp.AtualizarStatusVisual(const Estado: string);
begin
  lbStatus.Caption      := UpperCase(Estado);

  if SameText(Estado, 'open') then
  begin
    lbStatus.Caption := 'CONECTADO';
    lbStatus.Font.Color := clGreen;
    BtnLerQrCode.Enabled := False;
    BtnLogoutInstancia.Enabled := True;
  end
  else if SameText(Estado, 'connecting') then
  begin
    lbStatus.Caption := 'CONECTANDO';
    lbStatus.Font.Color := clOlive;
    BtnLerQrCode.Enabled := True;
    BtnLogoutInstancia.Enabled := False;
  end
  else
  begin
    lbStatus.Caption := 'DESCONECTADO';
    lbStatus.Font.Color := clRed;
    BtnLerQrCode.Enabled := True;
    BtnLogoutInstancia.Enabled := False;
  end;
end;

{$ENDREGION}

{$REGION 'Ações dos botao'}

//Criar Instancia
procedure TFrmQrCodeWhatsApp.BtnCriarClick(Sender: TObject);
var
  TokenGerado, Base64, MsgConversao, Msg: string;
begin
  if not InicializarEvolution then Exit;
  if FEvolution.InstanceCreate(FNomeInstancia, TokenGerado, Base64, Msg) then
  begin
    // Salvar o nome da instância e o token no banco.
    GravarInstanciaWhatsapp(TokenGerado);
    if (Base64 = '') then
      JKDialog('Aviso', 'Instância criada, mas ocorreu um erro no QR Code: ' + MsgConversao, tdAlerta);
    Tconesul.ConvBase64Img(RemoveBase64Prefix(Base64));
    ImgQrCode.Picture	      := Tconesul.nfoto;
    TConesul.nfoto.Free;
    TempoRestante := 60;
    Label1.Caption := 'Tempo restante: 60 segundos';
    Tempo.Enabled := True;
    AtualizarStatusVisual('connecting');
    JKDialog('Sucesso', 'Instância criada com sucesso.', tdSucesso);
  end
  else
    JKDialog('Aviso', Msg, tdAlerta);
end;

//Ler QRCOde
procedure TFrmQrCodeWhatsApp.BtnLerQrCodeClick(Sender: TObject);
var
  Base64, QRCode, PairingCode, Msg: string;
begin
  if not InicializarEvolution then Exit;
  if FEvolution.InstanceConnect(FNomeInstancia, Base64, QRCode, PairingCode, Msg) then
  begin
    if Base64 <> '' then
    begin
      Tconesul.ConvBase64Img(RemoveBase64Prefix(Base64));
      ImgQrCode.Picture	      := Tconesul.nfoto;
      TConesul.nfoto.Free;
      TempoRestante := 60;
      Label1.Caption := 'Tempo restante: 60 segundos';
      Tempo.Enabled := True;
      JKDialog('Aviso', Msg, tdAlerta);
    end
    else
      ConsultarStatusInstancia(True);
  end
  else
    JKDialog('Aviso', Msg, tdAlerta);
end;

//Fazer logout
procedure TFrmQrCodeWhatsApp.BtnLogoutInstanciaClick(Sender: TObject);
var
  Msg: string;
begin
  if not InicializarEvolution then Exit;
  if MessageDlg('Deseja desconectar o WhatsApp desta instância?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;
  if FEvolution.InstanceLogout(FNomeInstancia, Msg) then
  begin
    imgQRCode.Picture.Graphic := nil;
    //tmrInstancia.Enabled := False;
    AtualizarStatusVisual('close');
    JKDialog('Sucesso', Msg, tdSucesso);
  end
  else
    JKDialog('Aviso', Msg, tdAlerta);
end;

//Excluir instancia
procedure TFrmQrCodeWhatsApp.BtnDeleteClick(Sender: TObject);
var
  Msg: string;
begin
  if not InicializarEvolution then Exit;
  if JKDialog('Aviso', 'Deseja excluir definitivamente esta instância?', tdMensagem)  then
  begin
    if FEvolution.InstanceDelete(FNomeInstancia, Msg) then
    begin
      imgQRCode.Picture.Graphic := nil;
      //tmrInstancia.Enabled := False;
      AtualizarStatusVisual('');
      // Remover nome da instância e token do banco.
      JKDialog('Sucesso', Msg, tdSucesso);
    end
    else
      JKDialog('Aviso', Msg, tdAlerta);
  end;
end;

//Fechar
procedure TFrmQrCodeWhatsApp.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

{$ENDREGION}








//{$REGION 'WhatsApp'}
//
////Verificar Instancia
//function TFrmQrCodeWhatsApp.Informacaoinstancia(out msg,Json,UserData:string): Boolean;
//var
//  LResponse : IResponse;
//  url : String;
//  token:string;
//  LJsonResponse : TJSONObject;
//  LInstanceData: TJSONObject;
//  LUserData: TJSONObject;
//begin
//  //Funcao para verificar se tem alguma instancia conectada com a Key
//  result      := False;
//
//  if DM.BuscarURLWhatsApp(msg, url) then
//  begin
//    token       := TConeSul.Crypt('C',TSession.RAZAO);
//
//    LResponse   := TRequest.New.BaseURL(url+'/instance/info?')
//    .AddParam('key', token)
//    .Accept('application/json')
//    .Get;
//
//    Try
//      LJsonResponse := TJSONObject.ParseJSONValue(LResponse.Content) as TJSONObject;
//
//      if LResponse.StatusCode = 200 then
//      begin
//        msg     :=  'Error: '+LJsonResponse.GetValue<string>('error');
//        msg     :=  msg +' Mensagem: '+LJsonResponse.GetValue<string>('message');
//        msg     :=  msg +' Status: '+ Inttostr(LResponse.StatusCode);
//
//        LInstanceData := LJsonResponse.GetValue<TJSONObject>('instance_data');
//
//        if LInstanceData <> nil then
//        begin
//          if LInstanceData.TryGetValue<TJSONObject>('user', LUserData) then
//          begin
//            UserData := LUserData.ToString; //Retorno{}
//          end
//          else
//          begin
//            UserData := LInstanceData.GetValue<string>('user');
//          end;
//        end;
//        Result  :=  True;
//      end
//      else
//      begin
//        //Status 403   "message": "invalid key supplied"
//
//        msg       := LJsonResponse.GetValue<string>('message');// Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
//        UserData  := '';
//        Json      := '';
//        result  := False;
//      end;
//    Finally
//      LJsonResponse.Free;
//    End;
//
//  end;
//end;
//
//function TFrmQrCodeWhatsApp.InformacaoinstanciaIndividual(out msg,Json,UserData:string; whatsapp:string): Boolean;
//var
//  LResponse : IResponse;
//  url : String;
//  token:string;
//  LJsonResponse : TJSONObject;
//  LInstanceData: TJSONObject;
//  LUserData: TJSONObject;
//begin
//  //Funcao para verificar se tem alguma instancia conectada com a Key
//  result      := False;
//
//  if DM.BuscarURLWhatsApp(msg, url) then
//  begin
//    token       := TConeSul.Crypt('C',TSession.RAZAO+whatsapp);
//
//    LResponse   := TRequest.New.BaseURL(url+'/instance/info?')
//    .AddParam('key', token)
//    .Accept('application/json')
//    .Get;
//
//    Try
//      LJsonResponse := TJSONObject.ParseJSONValue(LResponse.Content) as TJSONObject;
//
//      if LResponse.StatusCode = 200 then
//      begin
//        msg     :=  'Error: '+LJsonResponse.GetValue<string>('error');
//        msg     :=  msg +' Mensagem: '+LJsonResponse.GetValue<string>('message');
//        msg     :=  msg +' Status: '+ Inttostr(LResponse.StatusCode);
//
//        LInstanceData := LJsonResponse.GetValue<TJSONObject>('instance_data');
//
//        if LInstanceData <> nil then
//        begin
//          if LInstanceData.TryGetValue<TJSONObject>('user', LUserData) then
//          begin
//            UserData := LUserData.ToString; //Retorno{}
//          end
//          else
//          begin
//            UserData := LInstanceData.GetValue<string>('user');
//          end;
//        end;
//        Result  :=  True;
//      end
//      else
//      begin
//        //Status 403   "message": "invalid key supplied"
//
//        msg       := LJsonResponse.GetValue<string>('message');// Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
//        UserData  := '';
//        Json      := '';
//        result  := False;
//      end;
//    Finally
//      LJsonResponse.Free;
//    End;
//
//  end;
//end;
//
////Subir a Instancia
//Function TFrmQrCodewhatsApp.IniciarInstancia(out msg:string):Boolean;
//var
//  LResponse : IResponse;
//  LJsonResponse :TJSONObject;
//  url : String;
//  token:string;
//begin
//  //Criar instancia  25 segs
//  result  := False;
//
//  if DM.BuscarURLWhatsApp(msg, url) then
//  begin
//    token       := TConeSul.Crypt('C',TSession.RAZAO);
//
//    LResponse   := TRequest.New.BaseURL(url+'/instance/init?')
//    .AddParam('key', token)
//    .AddParam('token', 'RANDOM_STRING_HERE')
//    .Accept('application/json')
//    .Get;
//
//    Try
//      LJsonResponse := TJSONObject.ParseJSONValue(LResponse.Content) as TJSONObject;
//
//      if LResponse.StatusCode = 200 then
//      begin
//        msg     :=  'Error: '+LJsonResponse.GetValue<string>('error');
//        msg     :=  msg +' Mensagem: '+LJsonResponse.GetValue<string>('message');
//        msg     :=  msg +' Status: '+ Inttostr(LResponse.StatusCode);
//        Result  :=  True;
//      end
//      else
//      begin
//        msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
//        result  := False;
//      end;
//    Finally
//      LJsonResponse.Free;
//    End;
//
//  end;
//
//end;
//
//Function TFrmQrCodewhatsApp.IniciarInstanciaIndividual(out msg:string;whatsapp:string):Boolean;
//var
//  LResponse : IResponse;
//  LJsonResponse :TJSONObject;
//  url : String;
//  token:string;
//begin
//  //Criar instancia  25 segs
//  result  := False;
//
//  if DM.BuscarURLWhatsApp(msg, url) then
//  begin
//    token       := TConeSul.Crypt('C',TSession.RAZAO+whatsapp);
//
//    LResponse := TRequest.New.BaseURL(url+'/instance/init?')
//    .AddParam('key', token)
//    .AddParam('token', 'RANDOM_STRING_HERE')
//    .Accept('application/json')
//    .Get;
//
//    Try
//      LJsonResponse := TJSONObject.ParseJSONValue(LResponse.Content) as TJSONObject;
//
//      if LResponse.StatusCode = 200 then
//      begin
//        msg     :=  'Error: '+LJsonResponse.GetValue<string>('error');
//        msg     :=  msg +' Mensagem: '+LJsonResponse.GetValue<string>('message');
//        msg     :=  msg +' Status: '+ Inttostr(LResponse.StatusCode);
//        Result  :=  True;
//      end
//      else
//      begin
//        msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
//        result  := False;
//      end;
//    Finally
//      LJsonResponse.Free;
//    End;
//
//  end;
//
//end;
//
//
//
//procedure TFrmQrCodeWhatsApp.InstanciaOnTimer(Sender: TObject);
//var
//  LResponse : IResponse;
//  url : String;
//  token:string;
//  LJsonResponse : TJSONObject;
//  LInstanceData: TJSONObject;
//
//  MSG:STRING;
//  mensagem:string;
//  phoneconnected:string;
//  ModelVal :TValidacao;
//begin
//  //Verificar se o usuário conectou
//  phoneconnected := '';
//
//  if DM.BuscarURLWhatsApp(msg, url) then
//  begin
//
//    //validar tipo de conexao
//    ModelVal      := TValidacao.create;
//    Try
//      if  ModelVal.InstanciaPorFunc(TSession.IDEMPRESA) then
//      begin
//        //Instancia por funcionario
//
//        token       := TConeSul.Crypt('C',TSession.RAZAO+ParamsStr);
//
//        LResponse   := TRequest.New.BaseURL(url+'/instance/info?')
//        .AddParam('key', token)
//        .Accept('application/json')
//        .Get;
//
//        Try
//          LJsonResponse := TJSONObject.ParseJSONValue(LResponse.Content) as TJSONObject;
//
//          if LResponse.StatusCode = 200 then
//          begin
//            mensagem  := LJsonResponse.GetValue<string>('message');
//
//            if Mensagem = 'Instance fetched successfully' then
//            begin
//              LInstanceData := LJsonResponse.GetValue<TJSONObject>('instance_data');
//
//              if LInstanceData <> nil then
//              begin
//
//                phoneconnected  := LInstanceData.GetValue<string>('phone_connected');
//
//                if phoneconnected ='true' then
//                begin
//                  //Gravar na temp
//
//                  JKDialog('Sucesso','Dispositivo conectado.', tdSucesso);
//                  InstanciaOn.Enabled := False;
//
//                  Try
//                    if GravarInstanciaWhatsappFunc(token) then
//                    begin
//
//                    end;
//                  except on e:exception do
//                    raise Exception.Create(e.Message);
//                  End;
//                end;
//              end;
//            end;
//          end
//          else
//          begin
//            msg  := LJsonResponse.GetValue<string>('message');// Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
//          end;
//        Finally
//          LJsonResponse.Free;
//        End;
//
//
//
//
//      end
//      else
//      begin
//        //Instancia por empresa
//        token       := TConeSul.Crypt('C',TSession.RAZAO);
//
//        LResponse   := TRequest.New.BaseURL(url+'/instance/info?')
//        .AddParam('key', token)
//        .Accept('application/json')
//        .Get;
//
//        Try
//          LJsonResponse := TJSONObject.ParseJSONValue(LResponse.Content) as TJSONObject;
//
//          if LResponse.StatusCode = 200 then
//          begin
//            mensagem  := LJsonResponse.GetValue<string>('message');
//
//            if Mensagem = 'Instance fetched successfully' then
//            begin
//              LInstanceData := LJsonResponse.GetValue<TJSONObject>('instance_data');
//
//              if LInstanceData <> nil then
//              begin
//
//                phoneconnected  := LInstanceData.GetValue<string>('phone_connected');
//
//                if phoneconnected ='true' then
//                begin
//                  //Gravar na temp
//
//                  JKDialog('Sucesso','Dispositivo conectado.', tdSucesso);
//                  InstanciaOn.Enabled := False;
//
//                  Try
//                    if GravarInstanciaWhatsapp(token) then
//                    begin
//
//                    end;
//                  except on e:exception do
//                    raise Exception.Create(e.Message);
//                  End;
//                end;
//              end;
//            end;
//          end
//          else
//          begin
//            msg  := LJsonResponse.GetValue<string>('message');// Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
//          end;
//        Finally
//          LJsonResponse.Free;
//        End;
//
//
//      end;
//    Finally
//      ModelVal.free;
//    End;
//
//  end
//  else
//  JKDialog('Aviso',msg, tdAlerta);
//
//end;
//
////Excluir Instancia
//Function TFrmQrCodeWhatsApp.ExcluirInstancia(out msg:String):Boolean;
//var
//  LResponse : IResponse;
//  LJsonResponse :TJSONObject;
//  url : String;
//  token:string;
//begin
//  //Excluir instancia
//  result  := False;
//
//  if DM.BuscarURLWhatsApp(msg, url) then
//  begin
//    token       := TConeSul.Crypt('C',TSession.RAZAO);
//
//    LResponse := TRequest.New.BaseURL(url+'/instance/delete?')
//    .AddParam('key', token)
//    .Accept('application/json')
//    .Delete;
//
//    try
//      LJsonResponse := TJSONObject.ParseJSONValue(LResponse.Content) as TJSONObject;
//
//      if LResponse.StatusCode = 200 then
//      begin
//        msg     :=  LJsonResponse.GetValue<string>('message'); //Instance deleted successfully
//        GravarInstanciaWhatsapp('');
//        Result  :=  True;
//      end
//      else
//      begin
//        msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
//        result  := False;
//      end;
//    finally
//      LJsonResponse.Free;
//    end;
//
//  end;
//end;
//
//Function TFrmQrCodeWhatsApp.ExcluirInstanciaFunc(out msg:String):Boolean;
//var
//  LResponse : IResponse;
//  LJsonResponse :TJSONObject;
//  url : String;
//  token:string;
//begin
//  //Excluir instancia
//  result  := False;
//
//  if DM.BuscarURLWhatsApp(msg, url) then
//  begin
//    token       := TConeSul.Crypt('C',TSession.RAZAO+ParamsStr);
//
//    LResponse := TRequest.New.BaseURL(url+'/instance/delete?')
//    .AddParam('key', token)
//    .Accept('application/json')
//    .Delete;
//
//    try
//      LJsonResponse := TJSONObject.ParseJSONValue(LResponse.Content) as TJSONObject;
//
//      if LResponse.StatusCode = 200 then
//      begin
//        msg     :=  LJsonResponse.GetValue<string>('message'); //Instance deleted successfully
//        GravarInstanciaWhatsapp('');
//        Result  :=  True;
//      end
//      else
//      begin
//        msg     :=  Format('erro statusCode -> %d - [%s]',[LResponse.StatusCode,LResponse.StatusText]);
//        result  := False;
//      end;
//    finally
//      LJsonResponse.Free;
//    end;
//
//  end;
//end;
//
//
////Solicitar Qr Code
//Function TFrmQrCodewhatsApp.QrCodeBase(out msg,qrcode:string):boolean;
//var
//  LResponse : IResponse;
//  JSONValue: TJSONValue;
//  JSONObj: TJSONObject;
//  url : String;
//  token:string;
//begin
//  //Criar gerar qrcode base 64
//  result  := False;
//
//  if DM.BuscarURLWhatsApp(msg, url) then
//  begin
//    token       := TConeSul.Crypt('C',TSession.RAZAO);
//
//    LResponse := TRequest.New.BaseURL(url+'/instance/qrbase64?')
//    .AddParam('key', token)
//    .Accept('application/json')
//    .Get;
//
//      if LResponse.StatusCode = 403 then
//      begin
//        result  := False;
//        msg     :=  LResponse.Content;
//        exit;
//      end;
//
//      if LResponse.StatusCode = 200 then
//      begin
//
//        try
//          JSONValue := TJSONObject.ParseJSONValue(LResponse.Content);
//
//           if Assigned(JSONValue) and (JSONValue is TJSONObject) then
//           begin
//
//            JSONObj      := TJSONObject(JSONValue);
//
//            if JSONObj.GetValue<string>('error') = 'false' then
//            begin
//              msg          := JSONObj.GetValue<string>('message');
//              QrCode       := RemoveBase64Prefix(JSONObj.GetValue<string>('qrcode'));
//              if QrCode <> '' then
//              Result       := True
//              else
//              Result        := True;
//            end
//            else
//            begin
//              msg          := JSONObj.GetValue<string>('message');
//              QrCode       := RemoveBase64Prefix(JSONObj.GetValue<string>('qrcode'));
//              if QrCode <> '' then
//              Result       := True
//              else
//              Result        := False;
//            end;
//           end;
//        finally
//          JSONValue.Free;
//        end;
//
//      end;
//
//  end;
//
//end;
//
//Function TFrmQrCodewhatsApp.QrCodeBaseFunc(out msg,qrcode:string;whatsapp:string):boolean;
//var
//  LResponse : IResponse;
//  JSONValue: TJSONValue;
//  JSONObj: TJSONObject;
//  url : String;
//  token:string;
//begin
//  //Criar gerar qrcode base 64
//  result  := False;
//
//  if DM.BuscarURLWhatsApp(msg, url) then
//  begin
//    token       := TConeSul.Crypt('C',TSession.RAZAO+whatsapp);
//
//    LResponse := TRequest.New.BaseURL(url+'/instance/qrbase64?')
//    .AddParam('key', token)
//    .Accept('application/json')
//    .Get;
//
//      if LResponse.StatusCode = 403 then
//      begin
//        result  := False;
//        msg     :=  LResponse.Content;
//        exit;
//      end;
//
//      if LResponse.StatusCode = 200 then
//      begin
//
//        try
//          JSONValue := TJSONObject.ParseJSONValue(LResponse.Content);
//
//           if Assigned(JSONValue) and (JSONValue is TJSONObject) then
//           begin
//
//            JSONObj      := TJSONObject(JSONValue);
//
//            if JSONObj.GetValue<string>('error') = 'false' then
//            begin
//              msg          := JSONObj.GetValue<string>('message');
//              QrCode       := RemoveBase64Prefix(JSONObj.GetValue<string>('qrcode'));
//              if QrCode <> '' then
//              Result       := True
//              else
//              Result        := True;
//            end
//            else
//            begin
//              msg          := JSONObj.GetValue<string>('message');
//              QrCode       := RemoveBase64Prefix(JSONObj.GetValue<string>('qrcode'));
//              if QrCode <> '' then
//              Result       := True
//              else
//              Result        := False;
//            end;
//           end;
//        finally
//          JSONValue.Free;
//        end;
//
//      end;
//
//  end;
//
//end;
//
//
//{$ENDREGION}
//

//
//Function TFrmQrCodeWhatsApp.GravarInstanciaWhatsappFunc(instancia:string):Boolean;
//var
//  sqlQuery: string;
//  Model :TModelSQL;
//begin
//  Result := False;
//  Model     := TModelSQL.Create;
//
//  try
//    try
//      SqlQuery := 'Update funcionario set  '+
//                  ' tokenwhatsapp= :key'+
//                  ' where id_empresa= :id and id_funcionario= :idfunc;';
//
//      Model.ExecutarSQL(dm.Conn,SqlQuery,[instancia,TSession.IDEMPRESA,ParamInt]);
//      Result := True;
//    except
//      on E: Exception do
//      begin
//        raise Exception.Create(e.Message);
//      end;
//    end;
//  finally
//    Model.free;
//  end;
//end;
//
//procedure TFrmQrCodeWhatsApp.BitBtn1Click(Sender: TObject);
//var
//str:string;
//begin
//  str:= TConeSul.Crypt('C',TSession.RAZAO);
//  Showmessage(str);
//end;
//
//procedure TFrmQrCodeWhatsApp.BtnCancelarClick(Sender: TObject);
//begin
//  Close;
//end;
//
//procedure TFrmQrCodeWhatsApp.BtnExcluirClick(Sender: TObject);
//var
//msg, versaoapi, NomeInstancia, url, Tokengravado:string;
//ModelVal  : TValidacao;
//begin
//  //Excluir Instancia
//
//  //validar tipo de conexao
//      ModelVal      := TValidacao.create;
//      Try
//        if ModelVal.InstanciaPorFunc(Tsession.IDEMPRESA) then
//        begin
//          //Por funcionario
//          if ExcluirInstanciaFunc(msg) then
//          begin
//            if msg = 'Instance deleted successfully' then
//            JKDialog('Sucesso','Instancia excluida com sucesso!', tdSucesso)
//            else
//            JKDialog('Aviso','Nenhuma instancia encontrada!', tdAlerta);
//          end
//          else
//          begin
//            JKDialog('Aviso',msg, tdErro);
//          end;
//
//
//        end
//        else
//        begin
//          //Por empresa
//
//          if ModelVal.VersaoWhatsapp(versaoapi,Tsession.IDEMPRESA) then
//          begin
//
//            if versaoapi = 'V0' then
//            begin
//              if ExcluirInstancia(msg) then
//              begin
//                if msg = 'Instance deleted successfully' then
//                JKDialog('Sucesso','Instancia excluida com sucesso!', tdSucesso)
//                else
//                JKDialog('Aviso','Nenhuma instancia encontrada!', tdAlerta);
//              end
//              else
//              begin
//                JKDialog('Aviso',msg, tdErro);
//              end;
//            end
//            else
//            begin
//              //versao nova
//
//              NomeInstancia       := TConeSul.Crypt('C',TSession.RAZAO);
//              DM.BuscarURLWhatsApp(msg, url);
//              ModelVal.TokenWhatsapp(Tokengravado,Tsession.IDEMPRESA);
//
//              if (url='') then
//              begin
//                JKDialog('Aviso','Sistema sem URL configurado.', tdAlerta);
//                Exit;
//              end;
//
//              if (Tokengravado='') then
//              begin
//                JKDialog('Aviso','Nenhum Token encontrado.', tdAlerta);
//                Exit;
//              end;
//
//              if InstanceLogout(msg,Tokengravado, URL,NomeInstancia) then
//              begin
//                //GravarInstanciaWhatsapp('');
//                JKDialog('Sucesso',msg, tdSucesso);
//              end
//              else
//              JKDialog('Aviso',msg, tdAlerta);
//
//            end;
//          end;
//
//        end;
//      Finally
//        ModelVal.free;
//      End;
//end;
//
//procedure TFrmQrCodeWhatsApp.btnMediaClick(Sender: TObject);
//var
//NomeInstancia, url, msg, Token :String;
//ModelVal:TValidacao;
//begin
//  NomeInstancia       := TConeSul.Crypt('C',TSession.RAZAO);
//  DM.BuscarURLWhatsApp(msg, url);
//  ModelVal  :=TValidacao.Create;
//  Try
//    modelval.TokenWhatsapp(Token,Tsession.IDEMPRESA);
//
//    if MessageMedia(msg, URl, NomeInstancia,Token,'5569992161179','https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pixelcut.ai%2Fpt-br%2Fmelhorar-qualidade-da-foto&psig=AOvVaw3e_3t3TVvJbJLTLI3pcuVx&ust=1753326067542000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCLjE8ZL_0Y4DFQAAAAAdAAAAABAE','Orçamento','Foto','image') then
//    begin
//      JKDialog('Sucesso',msg, tdSucesso);
//    end
//    else
//    JKDialog('Alerta',msg, tdAlerta);
//
//  Finally
//    Modelval.Free;
//  End;
//end;
//
//procedure TFrmQrCodeWhatsApp.BtnMensagemClick(Sender: TObject);
//var
//NomeInstancia, url, msg, Token :String;
//ModelVal:TValidacao;
//begin
//  NomeInstancia       := TConeSul.Crypt('C',TSession.RAZAO);
//  DM.BuscarURLWhatsApp(msg, url);
//  ModelVal  :=TValidacao.Create;
//  Try
//    modelval.TokenWhatsapp(Token,Tsession.IDEMPRESA);
//
//    if MessageText(msg, URl, NomeInstancia,Token,'5569992161179','Aki vai a mensagem') then
//    begin
//      JKDialog('Sucesso',msg, tdSucesso);
//    end
//    else
//    JKDialog('Alerta',msg, tdAlerta);
//
//  Finally
//    Modelval.Free;
//  End;
//end;
//
//procedure TFrmQrCodeWhatsApp.btnQrCodeClick(Sender: TObject);
//var
//Qrcode, msg,versaoapi,NomeInstancia, url, Tokengravado,Base64Data  :string;
//ModelVal:TValidacao;
//begin
//  //Solicitar arcode;
//
//  if StatusWhats = False then
//  begin
//    //validar tipo de conexao
//    ModelVal      := TValidacao.create;
//    Try
//      if ModelVal.InstanciaPorFunc(Tsession.IDEMPRESA) then
//      begin
//        //Instancia por funcionario
//
//        if QrCodeBaseFunc(msg,qrcode,ParamsStr) then
//        begin
//          if (qrcode='') or (qrcode= ' ') then
//          begin
//            IniciarInstanciaIndividual(msg,ParamsStr);
//          end
//          else
//          begin
//            Tconesul.ConvBase64Img(Qrcode);
//            ImgQrCode.Picture	:= Tconesul.nfoto;
//            TConesul.nfoto.Free;
//
//            TThread.CreateAnonymousThread(
//              procedure
//              begin
//                Sleep(10000); // Aguarda 60 segundos
//
//              TThread.Synchronize(nil,
//                  procedure
//                  begin
//                    // Atualiza a UI (ativar o timer)
//                    InstanciaON.Enabled := True;
//                  end);
//              end).Start;
//
//          end;
//        end
//        else
//        begin
//          JKDialog('Aviso',msg+' QrCode: ', tdAlerta);
//        end;
//
//      end
//      else
//      begin
//        //instancia por empresa
//        //versao nova
//
//        if ModelVal.VersaoWhatsapp(versaoapi,Tsession.IDEMPRESA) then
//        begin
//          if versaoapi = 'V0' then
//          begin
//            if QrCodeBase(msg,qrcode) then
//            begin
//              if (qrcode='') or (qrcode= ' ') then
//              begin
//                IniciarInstancia(msg);
//              end
//              else
//              begin
//                Tconesul.ConvBase64Img(Qrcode);
//                ImgQrCode.Picture	:= Tconesul.nfoto;
//                TConesul.nfoto.Free;
//
//                TThread.CreateAnonymousThread(
//                  procedure
//                  begin
//                    Sleep(10000); // Aguarda 60 segundos
//
//                  TThread.Synchronize(nil,
//                      procedure
//                      begin
//                        // Atualiza a UI (ativar o timer)
//                        InstanciaON.Enabled := True;
//                      end);
//                  end).Start;
//
//              end;
//            end
//            else
//            begin
//              JKDialog('Aviso',msg+' QrCode: ', tdAlerta);
//            end;
//
//          end
//          else
//          begin
//            //versao da api nova
//
//            //Pega Nome da Instancia que e nome da razao
//            NomeInstancia       := TConeSul.Crypt('C',TSession.RAZAO);
//            DM.BuscarURLWhatsApp(msg, url);
//            ModelVal.TokenWhatsapp(Tokengravado,Tsession.IDEMPRESA);
//
//            if (url='') then
//            begin
//              JKDialog('Aviso','Sistema sem URL configurado.', tdAlerta);
//              Exit;
//            end;
//
//            if InstanceConnect(msg, Qrcode, URL, NomeInstancia,Tokengravado) then
//            begin
//              //if Qrcode.StartsWith('data:image') then
//              //Base64Data := Qrcode.Substring(Qrcode.IndexOf(',') + 1);
//
//              Tconesul.ConvBase64Img(RemoveBase64Prefix(Qrcode));
//              ImgQrCode.Picture	      := Tconesul.nfoto;
//              TConesul.nfoto.Free;
//              TempoRestante := 60;
//              Label1.Caption := 'Tempo restante: 60 segundos';
//              Tempo.Enabled := True;
//
//              JKDialog('Ok','Realize a leitura do QrCode.', tdSucesso);
//            end
//            else
//              JKDialog('Aviso',msg, tdAlerta);
//          end;
//        end;
//      end;
//    Finally
//      ModelVal.free;
//    End;
//  end;
//end;
//
//Procedure TFrmQrCodeWhatsApp.CriarInstanciaZap;
//var
//  MessageID, msg, Json,UserData, versaoapi, NomeInstancia, TokenGerado, URL, apikey, Base64:string;
//  ModelVal:TValidacao;
//  Evolution: TEvolutionAPI;
//begin
//  ImgQrCode.Picture := nil;
//  StatusWhats       := False;
//
//  //validar tipo de conexao
//  ModelVal          := TValidacao.create;
//  Try
//    if ModelVal.InstanciaPorFunc(Tsession.IDEMPRESA) then
//    begin
//      //Conexao por funcionario
//      //Se tem instancia conectar
//      if InformacaoinstanciaIndividual(msg,json,Userdata,ParamsStr) then
//      begin
//        if UserData='{}' then //Não tem aparelho conectado
//        StatusWhats:= False;
//      end
//      else
//      begin
//        // se nao em cria uma para o numero solicitado
//        if IniciarInstanciaIndividual(msg,ParamsStr) then
//      end;
//
//    end
//    else
//    begin
//
//      //validar versao
//      if ModelVal.VersaoWhatsapp(versaoapi,Tsession.IDEMPRESA) then
//      begin
//        if versaoapi = 'V0' then
//        begin
//          if Informacaoinstancia(msg,Json,UserData) then //Tem instancia criada e ativa
//          begin
//            if UserData='{}' then //Não tem aparelho conectado
//            StatusWhats:= False;
//          end
//          else
//          begin
//            //Status 403 Subir instancia.
//            if IniciarInstancia(msg) then
//            begin
//
//            end;
//          end;
//        end
//        else
//        begin
//
//          {$REGION 'API Evolution'}
//            //Criar Instancia
//            NomeInstancia     := TConeSul.Crypt('C',TSession.RAZAO);
//            //Busca URL
//            DM.BuscarURLWhatsApp(msg, url);
//            //Busca API Key
//            ModelVal.ApikeyWhatsapp(apikey,Tsession.IDEMPRESA);
//            //Validacao dos dados
//            if (url='') and (apikey='') then
//            begin
//              JKDialog('Aviso','Sistema sem URL ou API Key da Evolution configurada.', tdAlerta);
//              Exit;
//            end;
//
//            if Trim(NomeInstancia) = '' then
//            begin
//              JKDialog('Aviso', 'Não foi possível definir o nome da instância.', tdAlerta);
//              Exit;
//            end;
//
//            Evolution := TEvolutionAPI.Create(url, apikey);
//
//            Try
//              if Evolution.InstanceCreate(NomeInstancia, TokenGerado, Base64, msg) then
//              begin
//                GravarInstanciaWhatsapp(TokenGerado);
//                if Base64 <> '' then
//                begin
//                  Tconesul.ConvBase64Img(RemoveBase64Prefix(Base64));
//                  ImgQrCode.Picture	      := Tconesul.nfoto;
//                  TConesul.nfoto.Free;
//                  TempoRestante := 60;
//                  Label1.Caption := 'Tempo restante: 60 segundos';
//                  Tempo.Enabled := True;
//
//                  JKDialog('Ok','Realize a leitura do QrCode.', tdSucesso);
//                end;
//              end
//              else
//                JKDialog('Aviso', Msg, tdAlerta);
//            Finally
//              Evolution.Free;
//            End;
//
//
//          {$ENDREGION}
//
//
//
//
//
//
//
//
//
//
//
////          //versao nova da API  V1
////
////          //Pega Nome da Instancia que e nome da razao
////          NomeInstancia                     := TConeSul.Crypt('C',TSession.RAZAO); //nome da instancia criada
////          DM.BuscarURLWhatsApp(msg, url);
////          ModelVal.ApikeyWhatsapp(apikey,Tsession.IDEMPRESA);
////
////          if (url='') and (apikey='') then
////          begin
////            JKDialog('Aviso','Sistema sem URL e APIKey configurado.', tdAlerta);
////            Exit;
////          end;
////
////          if InstanceCreate(TokenGerado,msg, URL, apikey, NomeInstancia, 'Instância EasyOne') then
////          begin
////            //Gravar o token gerado
////            GravarInstanciaWhatsapp(TokenGerado);
////            JKDialog('Ok','Instância criada, gere o QRCode.', tdSucesso);
////          end
////          else
////          JKDialog('Aviso',msg, tdAlerta);
//
//        end;
//
//      end;
//
//    end;
//  Finally
//    ModelVal.free;
//  End;
//
//end;


end.
