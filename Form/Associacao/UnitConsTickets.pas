unit UnitConsTickets;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseCons, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, Vcl.Menus, frxClass, frxDBSet,
  Vcl.Tabs, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxGDIPlusClasses, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxBlobEdit, cxCurrencyEdit,
  cxGroupBox, UFormNovoBasePesquisa, Vcl.ButtonStylesAttributes,
  System.ImageList, Vcl.ImgList, cxImageList, DBAccess, Uni, ACBrBase,
  ACBrEnterTab, Vcl.StyledButton, dxmdaset,Controller.Ticket,Model.Ticket;

type
  TFrmConsTickets = class(TFormNovoBasePesquisa)
    frxImpressao: TfrxReport;
    frxImpressaoTicket: TfrxDBDataset;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxData1: TcxDateEdit;
    cxdata2: TcxDateEdit;
    cxpesquisarpor: TcxComboBox;
    Label3: TLabel;
    Label4: TLabel;
    SolicitarCancelamento1: TMenuItem;
    ImprimirTicket1: TMenuItem;
    AnexarDocumento1: TMenuItem;
    Baixar1: TMenuItem;
    Cancelar1: TMenuItem;
    mdPesquisa: TdxMemData;
    mdPesquisaid_ticket: TIntegerField;
    mdPesquisavalor_ticket: TFloatField;
    mdPesquisadata_ticket: TDateField;
    mdPesquisadata_desconto: TDateField;
    mdPesquisadata_pagamento: TDateField;
    mdPesquisaanotacoes: TStringField;
    mdPesquisacodigo: TIntegerField;
    mdPesquisausuario: TStringField;
    mdPesquisaconvenio: TStringField;
    mdPesquisasituacao: TStringField;
    mdPesquisamotivo: TStringField;
    mdPesquisaobs_cancelamento: TStringField;
    GridRecId: TcxGridDBColumn;
    Gridid_ticket: TcxGridDBColumn;
    Gridvalor_ticket: TcxGridDBColumn;
    Griddata_ticket: TcxGridDBColumn;
    Griddata_desconto: TcxGridDBColumn;
    Griddata_pagamento: TcxGridDBColumn;
    Gridanotacoes: TcxGridDBColumn;
    Gridcodigo: TcxGridDBColumn;
    Gridusuario: TcxGridDBColumn;
    Gridconvenio: TcxGridDBColumn;
    Gridsituacao: TcxGridDBColumn;
    Gridmotivo: TcxGridDBColumn;
    Gridobs_cancelamento: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    
  private
//    procedure ImpressaoTicket(I: integer);
//    Procedure Permissoes;
    { Private declarations }
  public
    Procedure Novo        ;override;
    Procedure Pesquisa    ;override;
    Procedure Editar      ;override;
    Procedure Excluir     ;override;
    Procedure Listagem    ;override;
    Procedure Relatorio   ;override;
    { Public declarations }
  end;

var
  FrmConsTickets: TFrmConsTickets;
  ContTicket    : TTicketController;
  Objticket     : TTicket;
implementation

{$R *.dfm}

uses Vcl.Navigation, UnitTicketsCad, UnitPrincipalNew,
  uJKDialog, System.DateUtils, Vcl.Session, System.IniFiles, UDMRelatorio,
  UnitRelatorioTicket, Vcl.PermissaoUsuario, UnitBaixaTicket,System.Generics.Collections;

{ TFrmConsTickets }

procedure TFrmConsTickets.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmConsTickets  := Nil;
end;

procedure TFrmConsTickets.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;
end;

procedure TFrmConsTickets.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'Ticket';
  TitleText   := 'Pesquisa de Ticket';
end;

procedure TFrmConsTickets.Novo;
begin
  inherited;
  if not Assigned(FrmTicketsCad) then
  FrmTicketsCad := TFrmTicketsCad.Create(Application);
  FrmTicketsCad.ParamsStr  := 'N';
  FrmTicketsCad.ShowModal;
end;

procedure TFrmConsTickets.Pesquisa;
var
List    : TObjectList<TTicket>;
nCampo, pespor, situacao : String;
begin
  inherited;
  try
    List    := Nil;
    nCampo  := '';

    if trim(edtBusca.Text) <> '' then
    nCampo     := Trim(edtBusca.Text);

    ContTicket   := TTicketController.Create;

    Try
      List  := ContTicket.ListarTodos(nCampo, '');

      mdPesquisa.Close;
      mdPesquisa.FieldDefs.Clear;

      if (List = nil) or (List.Count = 0) then
      begin
        mdPesquisa.Close;
        exit;
      end;

      if not mdPesquisa.Active then
        mdPesquisa.Open;

      mdPesquisa.DisableControls;

      for var Item in List do
      begin
        mdPesquisa.Append;



        mdPesquisa.Post;
      end;
      mdPesquisa.First;
      mdPesquisa.EnableControls;

    Finally
      FreeAndNil(ContTicket);
      if Assigned(List) then
        List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmConsTickets.Editar;
begin
  inherited;

end;

procedure TFrmConsTickets.Excluir;
begin
  inherited;

end;

procedure TFrmConsTickets.Listagem;
begin
  inherited;

end;

procedure TFrmConsTickets.Relatorio;
begin
  inherited;

end;

end.



//procedure TFrmConsTickets.btnBaixarClick(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  inherited;
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Ticket');
//
//  if Permissao.TemPermissao('Permitir Baixar') then
//  begin
//
//    TNavigation.ExecuteOnClose    := Pesquisa;
//    //TNavigation.ParamInt          := 0;
//    //TNavigation.ParamsStr         := 'V';
//    TNavigation.OpenModal(TFrmBaixaTicket, FrmBaixaTicket);
//
//  end
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//end;
//
//procedure TFrmConsTickets.btnAnexoClick(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  inherited;
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Ticket');
//
//  if Permissao.TemPermissao('Permitir Anexar Documento') then
//    JKDialog('Aviso',
//             'Em Desenvolvimento.',
//             tdAlerta)
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//
//end;
//
//procedure TFrmConsTickets.btnConfCancelarClick(Sender: TObject);
//var
//Model :TModelTicket;
//Motivo  :string;
//Permissao: TPermissaoUsuario;
//begin
//  inherited;
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Ticket');
//
//  if Permissao.TemPermissao('Permitir Cancelar') then
//  begin
//    if not DM.TabConsTicket.Eof then
//    begin
//      if ds.DataSet.FieldByName('id_ticket').AsInteger <= 0 then
//      JKDialog('Aviso','Realize uma pesquisa para realizar essa operação!', tdAlerta);
//    end
//    else
//    begin
//      JKDialog('Aviso','Realize uma pesquisa para realizar essa operação!', tdAlerta);
//      Exit;
//    end;
//
//    //so solicitar com a situacao Aberto
//    if ds.DataSet.FieldByName('situacao').AsString <> 'Sol. Cancel.' then
//    begin
//      JKDialog('Aviso','Opção somente para ticket com solicitação de cancelamento!', tdAlerta);
//      exit;
//    end;
//
//
//    Model     := TModelTicket.Create;
//    Try
//      Try
//        if Model.Cancela(ds.DataSet.FieldByName('id_ticket').AsInteger, Tsession.id_usuario, Trim(Motivo)) then
//        JKDialog('Sucesso','Ticket cancelado com sucesso.', tdSucesso);
//        Pesquisa;
//      Except on e:exception do
//        begin
//          JKDialog('Erro','Ocorreu um erro ao realizar o cancelamento do ticket: '+#13+e.Message, tdErro);
//          raise;
//        end;
//      End;
//
//    Finally
//      FreeAndNil(Model);
//    End;
//  end
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//
//end;
//
//Procedure TFrmConsTickets.ImpressaoTicket(I:integer);
//var
//Model :TModelTicket;
//Config: TIniFile;
//vVisualizarTicket, CaminhoImpressora:String;
//Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Ticket');
//
//  if Permissao.TemPermissao('Permitir Imprimir') then
//  begin
//    Config := TIniFile.Create(dm.nDirArquivo + '\Config.ini');
//
//    Try
//      vVisualizarTicket := Config.ReadString('PEDIDO', 'VisualizarTicket', 'N');
//      CaminhoImpressora := Config.ReadString('PEDIDO', 'ImpressoraTicket', '');
//    Finally
//      FreeAndNil(Config);
//    End;
//
//    if ds.DataSet.FieldByName('situacao').AsString <> 'Aberto' then
//    begin
//      JKDialog('Aviso','Opção somente para ticket em Aberto!', tdAlerta);
//      exit;
//    end;
//
//    Model         := TModelTicket.Create;
//
//    try
//      if Model.ImpressaoTicket(i,0) then
//      begin
//        //ajustar depois para imprimir direto na impressora selecionada.
//        frxImpressao.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelImpressaoTicket.fr3');
//        frxImpressao.Report.PrepareReport();
//
//        if (CaminhoImpressora <> '') then
//          frxImpressao.PrintOptions.Printer:= CaminhoImpressora;
//
//        // Verificar se deve visualizar ou imprimir direto
//        if vVisualizarTicket = 'S' then
//        begin
//          frxImpressao.PrintOptions.ShowDialog := True;
//          frxImpressao.ShowReport;  // Abre a visualização
//        end
//        else
//        begin
//          frxImpressao.PrintOptions.ShowDialog := False; // Não exibir a caixa de diálogo de impressão
//          frxImpressao.Print; // Imprime direto na impressora configurada
//        end;
//
//        //frxImpressao.ShowReport;
//      end;
//
//    finally
//      FreeAndNil(Model);
//    end;
//  end
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//
//
//end;
//
//procedure TFrmConsTickets.ImprimirTicket1Click(Sender: TObject);
//var
//Model :TModelTicket;
//Permissao: TPermissaoUsuario;
//begin
//  inherited;
//  //Impressao de ticket
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Ticket');
//
//  if Permissao.TemPermissao('Permitir Reimprimir') then
//  begin
//     if not DM.TabConsTicket.Eof then
//    begin
//      if ds.DataSet.FieldByName('id_ticket').AsInteger <= 0 then
//      JKDialog('Aviso','Realize uma pesquisa para realizar essa operação!', tdAlerta);
//    end
//    else
//    begin
//      JKDialog('Aviso','Realize uma pesquisa para realizar essa operação!', tdAlerta);
//      Exit;
//    end;
//
//    if ds.DataSet.FieldByName('situacao').AsString <> 'Aberto' then
//    begin
//      JKDialog('Aviso','Esta operação só pode ser realizada em tickets em aberto.', tdAlerta);
//      Exit;
//    end;
//
//    Try
//      ImpressaoTicket(ds.DataSet.FieldByName('id_ticket').AsInteger);
//    Except on e:exception do
//      begin
//        JKDialog('Erro','Ocorreu um erro ao realizar a impressão do ticket: '+#13+e.Message, tdErro);
//        raise;
//      end;
//    End;
//  end
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//
//end;
//
//procedure TFrmConsTickets.Listagem;
//begin
//
//end;
//
//procedure TFrmConsTickets.btnrelatorioClick(Sender: TObject);
//var
//  Permissao: TPermissaoUsuario;
//begin
//  inherited;
//  //Chamar tela de relatório
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Ticket');
//
//  if Permissao.TemPermissao('Permitir Relatório') then
//  begin
//    FrmRelatorioTicket      := TFrmRelatorioTicket.Create(application);
//    FrmRelatorioTicket.ShowModal;
//  end
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//end;
//
//procedure TFrmConsTickets.btnSolicitarcancelamentoClick(Sender: TObject);
//var
//Model :TModelTicket;
//Motivo  :string;
//Permissao: TPermissaoUsuario;
//begin
//  inherited;
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Ticket');
//
//  if Permissao.TemPermissao('Permitir Solicitar Cancelamento') then
//  begin
//    //Solicitacao de cancelamento de ticket.
//
//    if not DM.TabConsTicket.Eof then
//    begin
//      if ds.DataSet.FieldByName('id_ticket').AsInteger <= 0 then
//      JKDialog('Aviso','Realize uma pesquisa para realizar essa operação!', tdAlerta);
//    end
//    else
//    begin
//      JKDialog('Aviso','Realize uma pesquisa para realizar essa operação!', tdAlerta);
//      Exit;
//    end;
//
//    //so solicitar com a situacao Aberto
//    if ds.DataSet.FieldByName('situacao').AsString <> 'Aberto' then
//    begin
//      JKDialog('Aviso','Opção somente para ticket em Aberto!', tdAlerta);
//      exit;
//    end;
//
//    while (Length(Motivo) < 10) do
//    begin
//      if not InputQuery('Solicitação de Cancelamento: ', 'Digite o motivo do cancelamento (mínimo 10 caracteres):', Motivo) then
//        Exit; // Se o usuário cancelar, sai da função
//
//      if Length(Motivo) < 10 then
//        ShowMessage('O motivo deve ter pelo menos 10 caracteres!');
//    end;
//
//    Model     := TModelTicket.Create;
//    Try
//      Try
//        if Model.SolicitarCancela(ds.DataSet.FieldByName('id_ticket').AsInteger, Tsession.id_usuario, Trim(Motivo)) then
//        JKDialog('Sucesso','Solicitação enviado.', tdSucesso);
//        Pesquisa;
//      Except on e:exception do
//        begin
//          JKDialog('Erro','Ocorreu um erro ao realizar a solicitação cancelamento do ticket: '+#13+e.Message, tdErro);
//          raise;
//        end;
//      End;
//
//    Finally
//      FreeAndNil(Model);
//    End;
//  end
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//
//end;
//
//procedure TFrmConsTickets.data1KeyPress(Sender: TObject; var Key: Char);
//begin
//  inherited;
//   if Key = #13 then
//    begin
//      Key := #0;
//      Perform(WM_NEXTDLGCTL, 0, 0);
//      data2.SetFocus;
//    end;
//end;
//
//procedure TFrmConsTickets.data2KeyPress(Sender: TObject; var Key: Char);
//begin
//  inherited;
//  if Key = #13 then
//    begin
//      Key := #0;
//      Perform(WM_NEXTDLGCTL, 0, 0);
//      edtfiltro.SetFocus;
//    end;
//end;
//
//procedure TFrmConsTickets.editar;
//begin
//  inherited;
//
//end;
//
//procedure TFrmConsTickets.edtBuscaKeyPress(Sender: TObject; var Key: Char);
//begin
//  inherited;
//  if Key = #13 then
//    begin
//      Key := #0;
//      Perform(WM_NEXTDLGCTL, 0, 0);
//      btnbusca.Click;
//    end;
//end;
//
//procedure TFrmConsTickets.EdtFiltroKeyPress(Sender: TObject; var Key: Char);
//begin
//  inherited;
//  if Key = #13 then
//    begin
//      Key := #0;
//      Perform(WM_NEXTDLGCTL, 0, 0);
//      edtbusca.SetFocus;
//    end;
//end;
//
//procedure TFrmConsTickets.Excluir;
//begin
//  inherited;
//
//end;
//
//procedure TFrmConsTickets.FormShow(Sender: TObject);
//var
//nsituacao :string;
//Config: TIniFile;
//begin
//  inherited;
//  Tela  := 'Ticket';
//  self.SetFocus;
//  data1.EditValue := StartOfTheMonth(date);
//  data2.EditValue := EndOfTheMonth(date);
//  gridsituacao.Visible  := True;
//  edtbusca.SetFocus;
//  Permissoes;
//
//  Config := TIniFile.Create(dm.nDirArquivo + '\Config.ini');
//
//  Try
//    nsituacao := Config.ReadString('PEDIDO', 'SituacaoTicket', 'TODOS');
//
//    if nSituacao = 'TODOS' then
//    TabSituacao.TabIndex  := 0;
//    if nSituacao = 'ABERTO' then
//    TabSituacao.TabIndex  := 1;
//    if nSituacao = 'CANCELADO' then
//    TabSituacao.TabIndex  := 2;
//    if nSituacao = 'FECHADO' then
//    TabSituacao.TabIndex  := 3;
//    if nSituacao = 'SOLICITAÇÃO CANCELAMENTO' then
//    TabSituacao.TabIndex  := 4;
//
//  Finally
//    FreeAndNil(Config);
//  End;
//
//
//end;
//
//procedure TFrmConsTickets.GridStylesGetContentStyle(
//  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
//  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
//begin
//  inherited;
//  if ARecord = nil then Exit;
//
//  // Verifica se o registro tem a situação "Cancelado"
//  if VarToStr(ARecord.Values[Gridsituacao.Index]) = 'Cancelado' then
//  begin
//    AStyle := Frmprincipal.GridCancelado; // Aplica o estilo criado no TcxStyleRepository
//  end;
//
//  if VarToStr(ARecord.Values[Gridsituacao.Index]) = 'Sol. Cancel.' then
//  begin
//    AStyle := Frmprincipal.GridSolicitacao; // Aplica o estilo criado no TcxStyleRepository
//  end;
//
//  if VarToStr(ARecord.Values[Gridsituacao.Index]) = 'Pago' then
//  begin
//    AStyle := Frmprincipal.GridPago; // Aplica o estilo criado no TcxStyleRepository
//  end;
//
//end;
//
//procedure TFrmConsTickets.OpenCadTela(id: integer; str: string);
//begin
//  inherited;
//  TNavigation.ExecuteOnClose    := Pesquisa;
//  TNavigation.ParamInt          := id;
//  TNavigation.ParamsStr         := str;
//  TNavigation.OpenModal(TFrmTicketsCad, FrmTicketsCad);
//end;
//
//procedure TFrmConsTickets.Permissoes;
//var
//  Permissao: TPermissaoUsuario;
//begin
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Ticket');
//
//  Tabsituacao.Tabs.Clear;
//  Tabsituacao.Tabs.Add('Todos');
//  Tabsituacao.Tabs.Add('Aberto');
//  Tabsituacao.Tabs.Add('Cancelado');
//
//  if Permissao.TemPermissao('Permitir Visualizar Fechado') then
//  Tabsituacao.Tabs.Add('Fechado');
//
//  if Permissao.TemPermissao('Permitir Visualizar Solicitação') then
//  Tabsituacao.Tabs.Add('Solicitação Cancelamento');
//
//
//end;
//
//procedure TFrmConsTickets.Pesquisa;
//var
//Model :TModelticket;
//begin
//  inherited;
//  Model   := TModelticket.Create;
//    Try
//      Try
//        if Model.Localizar(Tabsituacao.TabIndex, trim(edtBusca.Text),EdtFiltro.ItemIndex, data1.date, data2.date) then
//      Except on e:exception do
//        begin
//          JKDialog('Erro','Erro ao pesquisar ticket: '+e.Message, tdErro);
//          raise;
//        end;
//      End;
//
//    Finally
//      FreeAndNil(Model);
//    End;
//
//end;
//
//procedure TFrmConsTickets.TabSituacaoChange(Sender: TObject; NewTab: Integer;
//  var AllowChange: Boolean);
//var
//SummaryItem1 : TcxGridDBTableSummaryItem;
//  begin
//  inherited;
//  //Montar dados na grid
//  case NewTab of
//    0:begin
//        gridsituacao.Visible        := True;
//        GridMotivoSoli.Visible      := false;
//        GridMoticoCancelar.Visible  := False;
//        Gridvalor.Caption           := 'Valor';
//        Gridvalor.DataBinding.FieldName:='valor_ticket';
//
//        SummaryItem1 := Grid.DataController.Summary.FooterSummaryItems[0] as TcxGridDBTableSummaryItem;
//        SummaryItem1.FieldName      := 'valor_ticket';
//        Grid.DataController.Summary.Recalculate;
//      end;
//
//    1:begin
//        gridsituacao.Visible        := false;
//        GridMotivoSoli.Visible      := false;
//        Gridvalor.Caption           := 'Valor';
//        Gridvalor.DataBinding.FieldName:='valor_ticket';
//
//        SummaryItem1 := Grid.DataController.Summary.FooterSummaryItems[0] as TcxGridDBTableSummaryItem;
//        SummaryItem1.FieldName      := 'valor_ticket';
//        Grid.DataController.Summary.Recalculate;
//      end;
//    2:begin
//        gridsituacao.Visible        := false;
//        GridMotivoSoli.Visible      := false;
//        GridMoticoCancelar.Visible  := True;
//        Gridvalor.Caption           := 'Valor';
//        Gridvalor.DataBinding.FieldName:='valor_ticket';
//
//        SummaryItem1 := Grid.DataController.Summary.FooterSummaryItems[0] as TcxGridDBTableSummaryItem;
//        SummaryItem1.FieldName      := 'valor_ticket';
//        Grid.DataController.Summary.Recalculate;
//      end;
//    3:begin
//        gridsituacao.Visible        := false;
//        GridMotivoSoli.Visible      := false;
//        Gridvalor.Caption           := 'Vlr.Pago';
//        Gridvalor.DataBinding.FieldName:='vlrpago';
//
//        SummaryItem1 := Grid.DataController.Summary.FooterSummaryItems[0] as TcxGridDBTableSummaryItem;
//        SummaryItem1.FieldName      := 'vlrpago';
//        Grid.DataController.Summary.Recalculate;
//      end;
//    4:begin
//        GridMoticoCancelar.Visible  := False;
//        gridsituacao.Visible        := false;
//        GridMotivoSoli.Visible      := True;
//        Gridvalor.Caption           := 'Valor';
//        Gridvalor.DataBinding.FieldName:='valor_ticket';
//
//        SummaryItem1 := Grid.DataController.Summary.FooterSummaryItems[0] as TcxGridDBTableSummaryItem;
//        SummaryItem1.FieldName      := 'valor_ticket';
//        Grid.DataController.Summary.Recalculate;
//      end;
//  end;
//end;


