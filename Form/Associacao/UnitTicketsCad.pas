unit UnitTicketsCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseCad, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue, ACBrBase, ACBrEnterTab, cxCheckBox, cxTextEdit,
  cxGroupBox, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxCurrencyEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, cxSpinEdit,
  cxBlobEdit, Data.DB, DBAccess, Uni, frxClass, frxDBSet, Vcl.Menus, cxButtons,
  UnitBaseNovoCadastro, Vcl.ButtonStylesAttributes, Vcl.StyledButton, dxBevel,
  cxButtonEdit,Controller.Ticket,Model.Ticket, Datasnap.DBClient;

type
  TFrmTicketsCad = class(TFormNovoBaseCadastro)
    DsConvenio: TUniDataSource;
    frxImpressao: TfrxReport;
    frxImpressaoTicket: TfrxDBDataset;
    Label3: TLabel;
    cxAssociado: TcxLookupComboBox;
    cxMatricula: TcxTextEdit;
    BtnCidade: TcxButtonEdit;
    cxLotacao: TcxTextEdit;
    Label1: TLabel;
    cxLimite: TcxCurrencyEdit;
    cxAberto: TcxCurrencyEdit;
    cxParcial: TcxCurrencyEdit;
    cxValor: TcxCurrencyEdit;
    cxDisponivel: TcxCurrencyEdit;
    cxData: TcxDateEdit;
    Label2: TLabel;
    cxMesDeconto: TcxComboBox;
    cxMesPagamento: TcxComboBox;
    cxAnoDesconto: TcxSpinEdit;
    cxAnoPagamento: TcxSpinEdit;
    cxNumero: TcxTextEdit;
    cxConvenio: TcxLookupComboBox;
    Label4: TLabel;
    cxAnotacao: TcxBlobEdit;
    cxSeguencia: TcxCheckBox;
    cxSegQtde: TcxSpinEdit;
    btnDependente: TcxButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    dsAssociado: TUniDataSource;
    TabCliente: TClientDataSet;
    TabClienteid_socio: TIntegerField;
    TabClientecodigo: TIntegerField;
    TabClientematricula: TIntegerField;
    TabClientenome: TStringField;
    TabClientecpf: TStringField;
    TabClientecliente: TStringField;
    TabClientewhatsapp: TStringField;
    TabClientefoto: TBlobField;
    TabClienteaviso: TStringField;
    TabConvenio: TClientDataSet;
    TabConvenioid_convenio: TIntegerField;
    TabConvenionpesquisa: TStringField;
    TabConveniotelefone: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cxAssociadoPropertiesChange(Sender: TObject);
    procedure cxMesDecontoPropertiesEditValueChanged(Sender: TObject);
    procedure btnDependenteClick(Sender: TObject);
    
  private
    procedure ValidarAssociadoSelecionado;
    procedure CarregarDadosAssociado;
    procedure CalculoDescontoPagamento;
    procedure ImpressaoTicket(idAss, I: integer);

    { Private declarations }
  public
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;
    { Public declarations }
  end;

var
  FrmTicketsCad : TFrmTicketsCad;
  ContTicket    : TTicketController;
  Objticket     : TTicket;
implementation

{$R *.dfm}

uses uJKDialog, System.DateUtils, Vcl.Navigation,
  Vcl.Session, UDMRelatorio, System.IniFiles, UnitAvisoPessoa, Vcl.Validacoes,
  Vcl.PermissaoUsuario, UnitDependentesCad, Controller.LookupHelper,
  TelaFuncoes, UnitGlobal, uConfiguracaoService,UDM;

procedure TFrmTicketsCad.ValidarAssociadoSelecionado;
var
  IdSocio: Variant;
begin
  try
    IdSocio         := cxAssociado.EditValue;

    if not VarIsNull(IdSocio) then
    begin
      if Tabcliente.Locate('id_socio', IdSocio, []) then
      begin

        cxMatricula.EditValue   := TabCliente.FieldByName('matricula').AsInteger;

        if Tabcliente.FieldByName('aviso').AsString <> '' then
        begin
          FrmAvisoPessoa      := TFrmAvisoPessoa.Create(Application);
          FrmAvisoPessoa.msg  := Tabcliente.FieldByName('aviso').AsString;
          FrmAvisoPessoa.ShowModal;
        end;

      end;
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

Procedure TFrmTicketsCad.CarregarDadosAssociado;
var
  vlraberto,vlrparcial,vlrlimite:double;
  DataUltimoDia:Tdate;
  UltimoDia: Integer;
  Lotacao :string;
begin
  Try
    if TConfiguracaoService.CarregarDadosAssociadoTicket(vlrlimite, lotacao, cxAssociado.editvalue) then
    begin
      cxlimite.editvalue  := vlrlimite;
      cxlotacao.EditValue := Lotacao;

      DataUltimoDia       := EndOfTheMonth(EncodeDate(cxAnoDesconto.EditValue, cxMesDeconto.EditValue, 1));  //monta a data
      UltimoDia           := DayOf(DataUltimoDia);

      if TConfiguracaoService.RetornoSaldoAssociadoTicket(vlraberto,
                                                          vlrparcial,
                                                          cxAssociado.editvalue,
                                                          EncodeDate(cxAnoDesconto.EditValue, cxMesDeconto.EditValue, UltimoDia)) then
      begin
        cxAberto.EditValue    := vlraberto;
        cxdisponivel.EditValue:= (cxlimite.editvalue - vlrparcial) - vlraberto;
      end
      else
      begin
        cxaberto.EditValue    := 0;
        cxparcial.EditValue   := 0;
        cxdisponivel.EditValue:= 0;
      end;
    end;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro ao carregar dados:'+#13+e.Message, tderro);
    end;
  End;
end;

procedure TFrmTicketsCad.cxAssociadoPropertiesChange(Sender: TObject);
var
  msgaviso  :String;
begin

  if VarIsNull(cxAssociado.EditValue) then
    Exit;

  if cxAssociado.EditValue <= 0 then
    exit;

  ValidarAssociadoSelecionado;

  CarregarDadosAssociado;
end;

procedure TFrmTicketsCad.cxMesDecontoPropertiesEditValueChanged(
  Sender: TObject);
begin
    CalculoDescontoPagamento;
    CarregarDadosAssociado;
end;

procedure TFrmTicketsCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmTicketsCad := nil;
end;

procedure TFrmTicketsCad.FormShow(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  inherited;
  try
    TLookupHelper.CarregarLookup(
                  TabCliente,LookupAssociadoSql);

    TLookupHelper.CarregarLookup(
                  TabConvenio,LookupConvenioTicketSql);

    if ParamsStr = 'N' then
    begin
      TitleText   := ' Novo Ticket';

      //Validadoes
      if TConfiguracaoService.ValidarTicletSeguencia(TSession.IDEMPRESA) then
      begin
        Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Ticket');
        if Permissao.TemPermissao('Gerar seguência') then
        begin
          if cxSeguencia.Checked then
          cxSegQtde.Visible   := true
        end
        else
          cxSegQtde.Visible   := false;
      end
      else
      cxSegQtde.Visible   := false;

      cxAssociado.SetFocus;
      cxData.EditValue        := Now;
      cxMesDeconto.EditValue  := IntToStr(MonthOf(Now));
      cxAnoDesconto.EditValue := IntToStr(YearOf(Now));
      cxAnoPagamento.EditValue:= IntToStr(YearOf(Now));
    end
    else
    begin
      PopularCampos;
      TitleText   := ' Editar Ticket';
      cxassociado.SetFocus;
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro na linha:257'+#13+e.Message, tderro);
    end;
  end;

end;

procedure TFrmTicketsCad.PopularCampos;
begin
  inherited;

end;

function TFrmTicketsCad.Salvar(out msg: string): Boolean;
var
AId,ACOD:Integer;
UltimoDia: Integer;
DataUltimoDia: TDate;
Permissao: TPermissaoUsuario;
begin
  try
    Result      := False;

    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Ticket');

    if not Permissao.TemPermissao('Permitir Gerar sem Limite') then
    begin
      msg := '';
      ParamsCloseTela := 'N';
      JKDialog('Acesso Negado',
               'O seu perfil não tem permissão para salvar sem limite do associado.' + sLineBreak +
               'Por favor, entre em contato com o administrador do sistema.',
               tdAlerta);
      Exit;
    end;

    ContTicket  := nil;
    Objticket   := nil;

    ContTicket  := TTicketController.create;
    Objticket   := TTicket.create;

    Try
      if ParamsStr='N' then
      Objticket.idticket    := 0
      else
      Objticket.idticket    := ParamsInt;
      Objticket.idsocio     := cxAssociado.EditValue;
      Objticket.idconvenio  := cxConvenio.EditValue;
      Objticket.valorticket := cxValor.EditValue;
      Objticket.dataticket  := cxdata.EditValue;
      DataUltimoDia         := EndOfTheMonth(EncodeDate(cxAnoDesconto.EditValue, cxMesDeconto.EditValue, 1));
      UltimoDia             := DayOf(DataUltimoDia);
      Objticket.datadesconto:= EncodeDate(cxAnoDesconto.EditValue, cxMesDeconto.EditValue, UltimoDia);
      Objticket.datapagamento:= EncodeDate(cxAnoPagamento.EditValue, cxMesPagamento.EditValue, 5);
      Objticket.idusuarioins  := Tsession.ID_USUARIO;
      Objticket.anotacoes   := Trim(cxanotacao.EditValue);
      Objticket.situacao    := 'A';  //Aberto C cancelado P Pago
      Objticket.idempresa   := Tsession.IDEMPRESA;

      if ContTicket.Salvar(Objticket, AId,ACOD) then
      begin
        if AID = 0 then
        AID     := ParamsInt;
        msg     := 'Registro salvo com sucesso, Número: '+IntToStr(ACOD);
        Result  := true;
        ParamsCloseTela := 'S';

        //Chamar o impresso
        FreeAndNil(TPermissaoUsuario.FInstance);
        Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Ticket');

        if Permissao.TemPermissao('Permitir Imprimir') then
        begin
          if AID > 0 then
          ImpressaoTicket(CxAssociado.EditValue, AID);
        end;

        if cxseguencia.Checked then
        begin
          cxValor.EditValue           := 0;
          cxMesDeconto.EditValue      := IntToStr(MonthOf(Now));
          cxAnoDesconto.EditValue     := IntToStr(YearOf(Now));
          CalculoDescontoPagamento;
          CarregarDadosAssociado;
        end;

      end;

    Finally
      FreeAndNil(ContTicket);
      FreeAndNil(Objticket);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmTicketsCad.ValidarCampos(out msg: string): Boolean;
var
Permissao: TPermissaoUsuario;
begin
  Result  := True;

  Try
    if (cxAssociado.Text = '') or (cxassociado.EditValue <=0) then
    begin
      Msg     := 'Selecione um associado!';
      Result  := False;
      exit;
    end;

    if (cxvalor.EditValue <=0) or (cxvalor.Text='0,00') then
    begin
      Msg     := 'Informe um valor do ticket!';
      Result  := False;
      exit;
    end;

    if (cxMesDeconto.ItemIndex=-1) or (cxMesDeconto.Text='') then
    begin
      Msg     := 'Selecione um mês para desconto!';
      Result  := False;
      exit;
    end;

    if (cxanodesconto.EditValue=0) or (cxanodesconto.Text='') then
    begin
      Msg     := 'Informe o ano para desconto!';
      Result  := False;
      exit;
    end;

    if (cxmespagamento.ItemIndex=-1) or (cxmespagamento.Text='') then
    begin
      Msg     := 'Selecione um mês para pagamento!';
      Result  := False;
      exit;
    end;

    if (cxanopagamento.EditValue=0) or (cxanopagamento.Text='') then
    begin
      Msg     := 'Informe o ano para pagamento!';
      Result  := False;
      exit;
    end;

    if (cxconvenio.EditValue=0) or (cxconvenio.Text='') then
    begin
      Msg     := 'Selecione um convênio!';
      Result  := False;
      exit;
    end;

    if cxmespagamento.ItemIndex < cxMesDeconto.ItemIndex then
    begin
      Msg     := 'Mês de pagamento não pode ser menor que o mês de descontos!';
      Result  := False;
      exit;
    end;

  if cxanopagamento.EditValue < cxanodesconto.EditValue then
  begin
    Msg     := 'Ano de pagamento não pode ser menor que o ano de descontos!';
    Result  := False;
    exit;
  end;

    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Ticket');

    if not Permissao.TemPermissao('Gerar sem Limite') then
    begin
      if (cxLimite.EditValue = 0) or (cxLimite.Text='') then
      begin
        Msg     := 'Associado sem limite no cadastro!';
        Result  := False;
        exit;
      end;
    end;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro ao validar:'+#13+e.Message, tderro);
    end;
  End;
end;

procedure TFrmTicketsCad.btnDependenteClick(Sender: TObject);
begin
  Try
    Try
    if cxAssociado.EditValue > 0 then
      begin
        FrmDependentesCad     := TFrmDependentesCad.Create(Application);
        TNavigation.ParamsStr := 'V';
        TNavigation.ParamInt  := cxassociado.EditValue;
        FrmDependentesCad.ShowModal;
      end
      else
      JKDialog('Aviso','Selecione um associado!', tdAlerta);
    Finally
      TNavigation.ParamsStr := 'N';
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  End;
end;

Procedure TFrmTicketsCad.ImpressaoTicket(idAss,I:integer);
var
Config: TIniFile;
vVisualizarTicket, CaminhoImpressora:String;
begin

  Try
    ContTicket  := nil;
    ContTicket  := TTicketController.create;
    Config      := TIniFile.Create(dm.nDir);

    Try
      vVisualizarTicket := Config.ReadString('PEDIDO', 'VisualizarTicket', 'N');
      CaminhoImpressora := Config.ReadString('PEDIDO', 'ImpressoraTicket', '');
    Finally
      FreeAndNil(Config);
    End;

    try
      if ContTicket.ImpressaoTicket(I, idass) then
      begin
        //ajustar depois para imprimir direto na impressora selecionada.
        frxImpressao.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelImpressaoTicket.fr3');
        frxImpressao.Report.PrepareReport();

        if (CaminhoImpressora <> '') then
          frxImpressao.PrintOptions.Printer:= CaminhoImpressora;

        if vVisualizarTicket = 'S' then
        begin
          frxImpressao.PrintOptions.ShowDialog := True;
          frxImpressao.ShowReport;  // Abre a visualização
        end
        else
        begin
          frxImpressao.PrintOptions.ShowDialog := False; // Não exibir a caixa de diálogo de impressão
          frxImpressao.Print; // Imprime direto na impressora configurada
        end;
      end;
    finally
      FreeAndNil(ContTicket);
    end;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  End;

end;


{$REGION 'Calculo'}

procedure TFrmTicketsCad.CalculoDescontoPagamento;
 var
  MesDesconto, AnoDesconto: Integer;
  MesInformado: Integer;
  DataBase, DataPagamento: TDate;
  ModelVal: TValidacao;
  SomaMesPagamento: Integer;
  Hoje: TDate;
 begin
  Try
    Hoje := Date;

    MesDesconto := MonthOf(Hoje);
    AnoDesconto := YearOf(Hoje);

    if TConfiguracaoService.ValidarTicketMesPagMesDesc(TSession.IDEMPRESA) then
      SomaMesPagamento := 0
    else
      SomaMesPagamento := 1;

    MesInformado := MesDesconto;
    if not TryStrToInt(Trim(cxMesDeconto.Text), MesInformado) then
    MesInformado := MesDesconto;

    if (MesInformado < 1) or (MesInformado > 12) then
    MesInformado := MesDesconto;

    DataBase := EncodeDate(AnoDesconto, MesInformado, 1);
    DataPagamento := IncMonth(DataBase, SomaMesPagamento);

    // Atualiza pagamento
    cxMesPagamento.EditValue := IntToStr(MonthOf(DataPagamento));
    cxAnoPagamento.EditValue := IntToStr(YearOf(DataPagamento));

    // Atualiza desconto (sempre mês/ano atual, como no seu código)
    cxMesDeconto.EditValue  := IntToStr(MesDesconto);
    cxAnoDesconto.EditValue := IntToStr(AnoDesconto);

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;

 end;
{$ENDREGION}

end.



