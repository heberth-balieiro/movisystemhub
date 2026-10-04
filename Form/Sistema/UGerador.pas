unit UGerador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Model.SQLQry,Uni, Vcl.Grids, udm,
  IdSMTP, IdMessage, IdSSLOpenSSL, IdExplicitTLSClientServerBase, IdAttachmentFile,
  ACBrBase, ACBrMail
  ;

type
  TFrmGerador = class(TForm)
    Panel1: TPanel;
    ListBox1: TListBox;
    Memo1: TMemo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Button1: TButton;
    CheckBox1: TCheckBox;
    PropertySet: TCheckBox;
    procedureset: TCheckBox;
    Função: TCheckBox;
    Button2: TButton;
    Button3: TButton;
    StringGrid1: TStringGrid;
    EditPrefixoCampo: TEdit;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    ACBrMail1: TACBrMail;
    procedure Button1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    Procedure CarregaTabelas;
    function ConvertToDelphiType(const SQLType: string): string;
    procedure EnviarEmailOutlook;
    procedure EnviarEmailGmail;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGerador: TFrmGerador;

implementation

{$R *.dfm}

{ TFrmGerador }

procedure TFrmGerador.Button1Click(Sender: TObject);
begin
  CarregaTabelas;
end;

procedure TFrmGerador.Button2Click(Sender: TObject);
var
  Tabela: string;
  Codigo, Campo, Tipo,PropriedadeWrite,Prefixo: string;
  i: Integer;
begin
  Tabela := ListBox1.Items[ListBox1.ItemIndex];
  Prefixo := EditPrefixoCampo.Text;
  //inicio codigo
  Codigo := 'unit ' + Tabela + 'Classes;' + sLineBreak +
            'interface' + sLineBreak +
            'type' + sLineBreak +
            '  T' + Tabela + ' = class' + sLineBreak +
            '  private' + sLineBreak;
  //gerar campo
  for i := 1 to StringGrid1.RowCount - 1 do
  begin
    Campo := StringGrid1.Cells[0, i];
    Tipo := ConvertToDelphiType(StringGrid1.Cells[1, i]);
    Codigo := Codigo + '    F' + Prefixo + Campo + ': ' + Tipo + ';' + sLineBreak;
  end;
  //metodo
  if procedureset.Checked then
  begin
    for i := 1 to StringGrid1.RowCount - 1 do
    begin
      Campo := StringGrid1.Cells[0, i];
      Tipo := ConvertToDelphiType(StringGrid1.Cells[1, i]);
      Codigo := Codigo + '    procedure Set' + Campo + '(const Value: ' + Tipo + ');' + sLineBreak;
    end;
  end;
  //gera propriedade
  Codigo := Codigo + '  public' + sLineBreak;
  for i := 1 to StringGrid1.RowCount - 1 do
  begin
    Campo := StringGrid1.Cells[0, i];
    Tipo := ConvertToDelphiType(StringGrid1.Cells[1, i]);
    if procedureset.Checked then
      PropriedadeWrite := 'Set' + Campo
    else
      PropriedadeWrite := 'F' + Prefixo + Campo;

    Codigo := Codigo + '    property ' + Campo + ': ' + Tipo +
              ' read F' + Prefixo + Campo + ' write ' + PropriedadeWrite + ';' + sLineBreak;
  end;
  if procedureset.Checked then
  begin
    Codigo := Codigo + '  end;' + sLineBreak + 'implementation' + sLineBreak;
    for i := 1 to StringGrid1.RowCount - 1 do
    begin
      Campo := StringGrid1.Cells[0, i];
      Tipo := ConvertToDelphiType(StringGrid1.Cells[1, i]);
      Codigo := Codigo + 'procedure T' + Tabela + '.Set' + Campo + '(const Value: ' + Tipo + ');' + sLineBreak +
                'begin' + sLineBreak +
                '  F' + Prefixo + Campo + ' := Value;' + sLineBreak +
                'end;' + sLineBreak + sLineBreak;
    end;
  end
  else
    Codigo := Codigo + '  end;' + sLineBreak + 'implementation' + sLineBreak;
  Codigo := Codigo + 'end.';
  Memo1.Text := Codigo;
end;

procedure TFrmGerador.Button4Click(Sender: TObject);
var
  Tabela: string;
  Campos, Valores, CodigoInsert: string;
  i: Integer;
begin
  // Nome da tabela
  Tabela := ListBox1.Items[ListBox1.ItemIndex];
  // Montar lista de campos e valores
  Campos := '';
  Valores := '';
  for i := 1 to StringGrid1.RowCount - 1 do
  begin
    if i > 1 then
    begin
      Campos := Campos + ', ';
      Valores := Valores + ', ';
    end;
    Campos := Campos + StringGrid1.Cells[0, i]; // Nome do campo
    Valores := Valores + ':' + StringGrid1.Cells[0, i]; // Parâmetro
  end;
  // Montar código SQL do INSERT
  CodigoInsert := 'INSERT INTO ' + Tabela + ' (' + Campos + ')' + sLineBreak +
                  'VALUES (' + Valores + ');';
  // Exibir o resultado no Memo
  Memo1.Text := CodigoInsert;
end;

procedure TFrmGerador.Button5Click(Sender: TObject);
var
  Tabela: string;
  Campos, Condicoes, CodigoUpdate: string;
  i: Integer;
begin
  // Nome da tabela
  Tabela := ListBox1.Items[ListBox1.ItemIndex];
  // Montar a lista de campos para SET
  Campos := '';
  for i := 1 to StringGrid1.RowCount - 1 do
  begin
    if i > 1 then
      Campos := Campos + ', ';
    Campos := Campos + StringGrid1.Cells[0, i] + ' = :' + StringGrid1.Cells[0, i];
  end;
  // Montar a lista de condições para WHERE
  Condicoes := '';
  for i := 1 to StringGrid1.RowCount - 1 do
  begin
    if StringGrid1.Cells[2, i] = '1' then // Checkbox marcado
    begin
      if Condicoes <> '' then
        Condicoes := Condicoes + ' AND ';
      Condicoes := Condicoes + StringGrid1.Cells[0, i] + ' = :' + StringGrid1.Cells[0, i];
    end;
  end;
  // Verificar se há condições
  if Condicoes = '' then
    Condicoes := '1=1'; // Evitar UPDATE sem WHERE (segurança)
  // Montar o código SQL do UPDATE
  CodigoUpdate := 'UPDATE ' + Tabela + ' SET ' + Campos + sLineBreak +
                  'WHERE ' + Condicoes + ';';
  // Exibir o resultado no Memo
  Memo1.Text := CodigoUpdate;
end;

procedure TFrmGerador.Button6Click(Sender: TObject);
begin
  //Email
 //EnviarEmailOutlook;
 EnviarEmailGmail;
end;

procedure TFrmGerador.Button7Click(Sender: TObject);
begin

  try
    // Configurações do servidor SMTP
    ACBrMail1.Host := 'smtp.office365.com'; // Endereço do servidor SMTP
    ACBrMail1.Port := '587'; // Porta do servidor SMTP (geralmente 587 para TLS)
    ACBrMail1.Username := 'heberthbalieiro@hotmail.com'; // Seu e-mail
    ACBrMail1.Password := 'Heberthd860412'; // Sua senha   vchkbpentkkjsrbt
    ACBrMail1.SetTLS := True; // Usar TLS (True ou False)
    ACBrMail1.SetSSL := False; // Usar SSL (True ou False)

    // Configurações do e-mail
    ACBrMail1.From := 'heberthbalieiro@hotmail.com'; // E-mail do remetente
    ACBrMail1.FromName := 'EasyOne'; // Nome do remetente
    ACBrMail1.AddAddress('diegoheberth@gmail.com'); // E-mail do destinatário
    ACBrMail1.Subject := 'Assunto do E-mail'; // Assunto do e-mail
    ACBrMail1.Body.Text := 'Corpo do e-mail.'; // Corpo do e-mail

    // Adicionar anexo (opcional)
    // ACBrMail1.AddAttachment('C:\caminho\para\arquivo.pdf');

    // Enviar o e-mail
    ACBrMail1.Send;
    ShowMessage('E-mail enviado com sucesso!');
  except
    on E: Exception do
      ShowMessage('Erro ao enviar e-mail: ' + E.Message);
  end;

end;

procedure TFrmGerador.EnviarEmailOutlook;
var
  SMTP: TIdSMTP;
  Msg: TIdMessage;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
begin
  SMTP := TIdSMTP.Create(nil);
  Msg := TIdMessage.Create(nil);
  SSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    SMTP.IOHandler := SSLHandler;
    SMTP.Host := 'smtp.office365.com'; // ou 'smtp-mail.outlook.com'
    SMTP.Port := 587;
    SMTP.Username := 'heberthbalieiro@hotmail.com';
    SMTP.Password := 'jxfsmkhggfnwvhil';  // Não use sua senha normal!
    SMTP.UseTLS := utUseExplicitTLS;
    SMTP.AuthType := satDefault;
    // Configuração SSL
    SSLHandler.SSLOptions.Method := sslvTLSv1_2;
    SSLHandler.SSLOptions.Mode := sslmClient;
    SSLHandler.SSLOptions.VerifyMode := [sslvrfPeer];
    SSLHandler.SSLOptions.VerifyDepth := 1;
    Msg.From.Address := 'diegoheberth@gmail.com';
    Msg.Recipients.EmailAddresses := 'diegoheberth@gmail.com';
    Msg.Subject := 'Teste de E-mail no Delphi';
    Msg.Body.Text := 'Este é um teste de envio de e-mail pelo Delphi usando SMTP do Outlook.';
    SMTP.Connect;
    try
      SMTP.Send(Msg);
    finally
      SMTP.Disconnect;
    end;
    ShowMessage('E-mail enviado com sucesso!');
  except
    on E: Exception do
      ShowMessage('Erro ao enviar e-mail: ' + E.Message);
  end;
  SMTP.Free;
  Msg.Free;
  SSLHandler.Free;
end;

procedure TFrmGerador.EnviarEmailGmail;
var
  SMTP: TIdSMTP;
  Msg: TIdMessage;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
begin
  SMTP := TIdSMTP.Create(nil);
  Msg := TIdMessage.Create(nil);
  SSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    SMTP.IOHandler := SSLHandler;
    SMTP.Host := 'smtp.gmail.com';
    SMTP.Port := 587;
    SMTP.Username := 'diegoheberth@gmail.com';
    SMTP.Password := 'ripb ailu azwl zvlw'; //ripb ailu azwl zvlw
    SMTP.UseTLS := utUseExplicitTLS;
    SMTP.AuthType := satDefault;
    Msg.From.Address := 'diegoheberth@gmail.com';
    Msg.Recipients.EmailAddresses := 'heberthbalieiro@hotmail.com';
    Msg.Subject := 'Teste de E-mail no Delphi com Gmail';
    Msg.Body.Text := 'Este é um teste de envio de e-mail pelo Delphi usando SMTP do Gmail.';
    SMTP.Connect;
    try
      SMTP.Send(Msg);
    finally
      SMTP.Disconnect;
    end;
    ShowMessage('E-mail enviado com sucesso!');
  except
    on E: Exception do
      ShowMessage('Erro ao enviar e-mail: ' + E.Message);
  end;
  SMTP.Free;
  Msg.Free;
  SSLHandler.Free;
end;

function TFrmGerador.ConvertToDelphiType(const SQLType: string): string;
begin
  if SQLType.Contains('int') then
    Result := 'Integer'
  else if SQLType.Contains('varchar') then
    Result := 'string'
  else if SQLType.Contains('date') then
    Result := 'TDate'
  else if SQLType.Contains('time') then
    Result := 'TTime'
  else
    Result := 'string'; // Default
end;

procedure TFrmGerador.FormCreate(Sender: TObject);
begin
   // Configuração inicial da StringGrid
  StringGrid1.ColCount := 3; // Número de colunas
  StringGrid1.RowCount := 5; // Número de linhas (exemplo)
  // Cabeçalhos
  StringGrid1.Cells[0, 0] := 'Campo';
  StringGrid1.Cells[1, 0] := 'Type';
  StringGrid1.Cells[2, 0] := 'Selecionar';
  // Ajustar largura das colunas
  //StringGrid1.ColWidths[0] := 150; // Largura para o nome do campo
  //StringGrid1.ColWidths[1] := 100; // Largura para a checkbox


end;

procedure TFrmGerador.CarregaTabelas;
var
  Query: TUniquery;
  Model:TModelSql;
  QryStr:String;
begin
  ListBox1.Clear;
  Model:=TModelSql.Create;
  QryStr  := 'Show Tables;';
  try
    Query := Model.ConsultarSQL(dm.conn,QryStr,[]);
    while not Query.Eof do
    begin
      ListBox1.Items.Add(Query.Fields[0].AsString);
      Query.Next;
    end;
  finally
    Query.Free;
    Model.Free;
  end;
end;

procedure TFrmGerador.ListBox1Click(Sender: TObject);
var
  Tabela: string;
  Query: TUniQuery;
  i: Integer;
  Model:TModelSql;
  QryStr:String;
begin
  Tabela := ListBox1.Items[ListBox1.ItemIndex];
  StringGrid1.RowCount := 1;
  Model:=TModelSql.Create;
  QryStr    := 'DESCRIBE ' + Tabela;
  try
    Query := Model.ConsultarSQL(dm.conn,QryStr,[]);
    while not Query.Eof do
    begin
      i := StringGrid1.RowCount;
      StringGrid1.RowCount := i + 1;
      StringGrid1.Cells[0, i] := Query.FieldByName('Field').AsString;
      StringGrid1.Cells[1, i] := Query.FieldByName('Type').AsString;
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

procedure TFrmGerador.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  CheckboxRect: TRect;
  CheckboxState: Integer;
begin
  if (ACol = 2) and (ARow > 0) then
  begin
    // Limpar fundo
    StringGrid1.Canvas.FillRect(Rect);
    // Calcular posição da checkbox
    CheckboxRect := Rect;
    InflateRect(CheckboxRect, -10, -10);
    // Determinar estado da checkbox
    if StringGrid1.Cells[ACol, ARow] = '0' then
      CheckboxState := DFCS_CHECKED
    else
      CheckboxState := DFCS_BUTTONCHECK;
    // Desenhar checkbox
    DrawFrameControl(StringGrid1.Canvas.Handle, CheckboxRect, DFC_BUTTON, CheckboxState);
  end
  else
  begin
    // Desenhar o conteúdo padrão
    //StringGrid1.DefaultDrawCell(ACol, ARow, Rect, State);
    StringGrid1.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, StringGrid1.Cells[ACol, ARow]);
  end;
end;

procedure TFrmGerador.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ACol, ARow: Integer;
begin
  StringGrid1.MouseToCell(X, Y, ACol, ARow);
  if (ACol = 2) and (ARow > 0) then
  begin
    // Alternar valor da checkbox
    if StringGrid1.Cells[ACol, ARow] = '1' then
      StringGrid1.Cells[ACol, ARow] := '0'
    else
      StringGrid1.Cells[ACol, ARow] := '1';
    // Redesenhar célula
    //StringGrid1.InvalidateRect(ACol, ARow);
  end;
end;

end.
