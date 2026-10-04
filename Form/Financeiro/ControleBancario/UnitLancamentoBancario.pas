unit UnitLancamentoBancario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseNovoCadastro,
  Vcl.ButtonStylesAttributes, cxStyles, cxGridTableView, cxClasses, Data.DB,
  DBAccess, Uni, ACBrBase, ACBrEnterTab, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.StyledButton, dxBevel, Vcl.ExtCtrls, cxGraphics, cxControls,
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
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxButtonEdit, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxCalendar, cxCurrencyEdit, cxMemo, cxGroupBox, uJKDialog,
  Vcl.Session,
  Model.LancamentoBancario, Controller.LancamentoBancario, UConeSul,
  Datasnap.DBClient, Controller.LookupHelper, UnitGlobal, cxCheckBox,
  UnitContaCad, UnitHistoricoBancario, UnitPrazoCad, UnitPlanoContaCad,
  UnitPessoaCad, UnitDepartamentoCad;

type
  TFrmLancamentoBancario = class(TFormNovoBaseCadastro)
    cxconta: TcxLookupComboBox;
    Label7: TLabel;
    BtnSede: TcxButtonEdit;
    cxemissao: TcxDateEdit;
    cxcompetencia: TcxDateEdit;
    cxvencimento: TcxDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxnumero: TcxTextEdit;
    Label4: TLabel;
    cxvalor: TcxCurrencyEdit;
    Label5: TLabel;
    cxtipo: TcxComboBox;
    Label6: TLabel;
    cxsituacao: TcxComboBox;
    Label8: TLabel;
    cxhistorico: TcxLookupComboBox;
    btnHistorico: TcxButtonEdit;
    Label9: TLabel;
    cxobs: TcxMemo;
    Label10: TLabel;
    Label11: TLabel;
    cxprazo: TcxLookupComboBox;
    btnprazo: TcxButtonEdit;
    cxcheque: TcxComboBox;
    Label12: TLabel;
    cxGroupBox1: TcxGroupBox;
    cxplano: TcxLookupComboBox;
    Label13: TLabel;
    btnplano: TcxButtonEdit;
    cxcusto: TcxLookupComboBox;
    btncusto: TcxButtonEdit;
    Label14: TLabel;
    Label15: TLabel;
    cxfavorecido: TcxLookupComboBox;
    btnfavorecido: TcxButtonEdit;
    cxdepartamento: TcxLookupComboBox;
    btndepartamento: TcxButtonEdit;
    Label16: TLabel;
    cxprevisao: TcxComboBox;
    Label17: TLabel;
    TabConta: TClientDataSet;
    TabContaid_conta: TIntegerField;
    TabContacodigo: TIntegerField;
    TabContaagencia: TStringField;
    TabContaconta: TStringField;
    TabContacorrentista: TStringField;
    TabContabanco: TStringField;
    TabContanpesquisa: TStringField;
    dsPlano: TUniDataSource;
    TabPlano: TClientDataSet;
    TabPlanoid_planoconta: TIntegerField;
    TabPlanocodigo: TStringField;
    TabPlanonivel: TIntegerField;
    TabPlanoDESCRICAO_COMPLETA: TStringField;
    TabCusto: TClientDataSet;
    TabCustoid_custo: TIntegerField;
    TabCustodescricao: TStringField;
    TabCustocusto: TStringField;
    dsCusto: TUniDataSource;
    TabHistorico: TClientDataSet;
    dsHistorico: TUniDataSource;
    TabHistoricoid_historico: TIntegerField;
    TabHistoricodescricao: TStringField;
    TabHistoriconpesquisa: TStringField;
    dsprazo: TUniDataSource;
    dspessoa: TUniDataSource;
    dsdepartamento: TUniDataSource;
    TabPrazo: TClientDataSet;
    TabPessoa: TClientDataSet;
    TabDepartamento: TClientDataSet;
    TabDepartamentoid_departamento: TIntegerField;
    TabDepartamentodescricao: TStringField;
    TabDepartamentonpesquisa: TStringField;
    TabPessoaid_socio: TIntegerField;
    TabPessoanome: TStringField;
    TabPessoacpf: TStringField;
    TabPessoacliente: TStringField;
    TabPessoawhatsapp: TStringField;
    TabPessoaaviso: TStringField;
    TabPrazoid_prazo: TIntegerField;
    TabPrazocodigo: TIntegerField;
    TabPrazonprazopag: TStringField;
    cxGrupConciliacao: TcxGroupBox;
    Label18: TLabel;
    cxDataConciliacao: TcxDateEdit;
    cxConciliacao: TcxCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxtipoPropertiesChange(Sender: TObject);
    procedure BtnSedePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnHistoricoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnprazoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnplanoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btncustoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnfavorecidoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btndepartamentoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    Procedure CarregarHistoricoportipo(AIndex:Integer);
    { Private declarations }
  public
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;
    { Public declarations }
  end;

var
  FrmLancamentoBancario: TFrmLancamentoBancario;
  Obj   :TLancamentoBancario;
implementation

{$R *.dfm}

procedure TFrmLancamentoBancario.btncustoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
//  try
//    try
//      if not Assigned(FrmPlanoCad) then
//      FrmPlanoCad             := TFrmPlanoCad.Create(Application);
//      FrmPlanoCad.ParamsStr   := 'N';
//      FrmPlanoCad.ShowModal;
//    finally
//      if (cxtipo.Text<>'') or (cxtipo.ItemIndex <>-1) then
//      CarregarHistoricoportipo(cxtipo.ItemIndex);
//    end;
//  except on E: Exception do
//    begin
//      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
//    end;
//  end;
end;

procedure TFrmLancamentoBancario.btndepartamentoPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  try
    try
      if not Assigned(FrmdepartamentoCad) then
      FrmdepartamentoCad             := TFrmdepartamentoCad.Create(Application);
      FrmdepartamentoCad.ParamsStr   := 'N';
      FrmdepartamentoCad.ShowModal;
    finally
      TLookupHelper.CarregarLookup(
                    TabDepartamento,LookupDepartamento);
    TabDepartamento.First;
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmLancamentoBancario.btnfavorecidoPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  try
    try
      if not Assigned(FrmPessoaCad) then
      FrmPessoaCad             := TFrmPessoaCad.Create(Application);
      FrmPessoaCad.ParamsStr   := 'N';
      FrmPessoaCad.ShowModal;
    finally
      TLookupHelper.CarregarLookup(
                    TabPessoa,LookupPessoaSql);
      TabPessoa.First;
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmLancamentoBancario.btnHistoricoPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  try
    try
      if not Assigned(FrmHistoricoBancario) then
      FrmHistoricoBancario             := TFrmHistoricoBancario.Create(Application);
      FrmHistoricoBancario.ParamsStr   := 'N';
      FrmHistoricoBancario.ShowModal;
    finally
      if (cxtipo.Text<>'') or (cxtipo.ItemIndex <>-1) then
      CarregarHistoricoportipo(cxtipo.ItemIndex);
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmLancamentoBancario.btnplanoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  try
    try
      if not Assigned(FrmPlanoCad) then
      FrmPlanoCad             := TFrmPlanoCad.Create(Application);
      FrmPlanoCad.ParamsStr   := 'N';
      FrmPlanoCad.ShowModal;
    finally
      if (cxtipo.Text<>'') or (cxtipo.ItemIndex <>-1) then
      CarregarHistoricoportipo(cxtipo.ItemIndex);
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmLancamentoBancario.btnprazoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  try
    try
      if not Assigned(FrmPrazoCad) then
      FrmPrazoCad             := TFrmPrazoCad.Create(Application);
      FrmPrazoCad.ParamsStr   := 'N';
      FrmPrazoCad.ShowModal;
    finally
      if (cxtipo.Text<>'') or (cxtipo.ItemIndex <>-1) then
      CarregarHistoricoportipo(cxtipo.ItemIndex);
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmLancamentoBancario.BtnSedePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  try
    try
      if not Assigned(FrmContasCad) then
      FrmContasCad             := TFrmContasCad.Create(Application);
      FrmContasCad.ParamsStr   := 'N';
      FrmContasCad.ShowModal;
    finally
      TLookupHelper.CarregarLookup(
                    TabConta,LookupContaBanco);
      TabConta.First;
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmLancamentoBancario.CarregarHistoricoportipo(AIndex: Integer);
begin
  case AIndex of
    0:begin
        TLookupHelper.CarregarLookup(
            TabHistorico,LookupHistoricoBancarioReceita);
        TabHistorico.First;

        TLookupHelper.CarregarLookup(
          TabPlano,LookupPlanoContaRecSql);
        TabPlano.First;

        TLookupHelper.CarregarLookup(
          TabPrazo,LookupPrazoPagSql);
        TabPrazo.First;

      end;
    1:begin
        TLookupHelper.CarregarLookup(
            TabHistorico,LookupHistoricoBancarioDespesa);
        TabHistorico.First;

        TLookupHelper.CarregarLookup(
          TabPlano,LookupPlanoContaDesSql);
        TabPlano.First;

        TLookupHelper.CarregarLookup(
          TabPrazo,LookupPrazoPagCompraSql);
        TabPrazo.First;

      end;
  end;
end;

procedure TFrmLancamentoBancario.cxtipoPropertiesChange(Sender: TObject);
begin
  if (cxtipo.Text<>'') or (cxtipo.ItemIndex <>-1) then
  CarregarHistoricoportipo(cxtipo.ItemIndex);
end;

procedure TFrmLancamentoBancario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmLancamentoBancario := nil;
end;

procedure TFrmLancamentoBancario.FormCreate(Sender: TObject);
begin
  inherited;
  //
end;

procedure TFrmLancamentoBancario.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'Controle Bancário';
  Try
    TLookupHelper.CarregarLookup(
                    TabConta,LookupContaBanco);
    TabConta.First;

    TLookupHelper.CarregarLookup(
                    TabCusto,LookupCustoSql);
    TabCusto.First;

    TLookupHelper.CarregarLookup(
                    TabDepartamento,LookupDepartamento);
    TabDepartamento.First;

    TLookupHelper.CarregarLookup(
                    TabPessoa,LookupPessoaSql);
    TabPessoa.First;

    if ParamsStr = 'N' then
    begin
      FrmLancamentoBancario.Height  := 511;
      BtnSalvar.Top                 := 395;
      BtnCancelar.Top               := 395;
      cxGrupConciliacao.Visible     := False;
      TitleText                     := ParamsTela +' - Novo';
      cxemissao.EditValue           := Date;
      cxsituacao.ItemIndex          := 0;
      cxcheque.ItemIndex            := 1;
      cxprevisao.ItemIndex          := 1;
      cxcompetencia.EditValue := Date;
      cxconta.SetFocus;
    end
    else
    begin
      FrmLancamentoBancario.Height  := 511;
      BtnSalvar.Top                 := 395;
      BtnCancelar.Top               := 395;
      cxGrupConciliacao.Visible     := False;
      TitleText                     := ParamsTela +' - Edição';
      cxconta.Properties.ReadOnly   := True;
      cxtipo.Properties.ReadOnly    := True;
      PopularCampos;
    end;

    if ParamsStr = 'C' then
    begin
      FrmLancamentoBancario.Height      := 585;
      BtnSalvar.Top                     := 471;
      BtnCancelar.Top                   := 471;
      BtnSalvar.Caption                 := 'Conciliar | F5';
      cxGrupConciliacao.Visible         := True;
      TitleText                         := ParamsTela +' - Conciliação';
      cxconta.Properties.ReadOnly       := True;
      cxtipo.Properties.ReadOnly        := True;
      cxemissao.Properties.ReadOnly     := true;
      cxcompetencia.Properties.ReadOnly := true;
      cxvencimento.Properties.ReadOnly  := true;
      cxnumero.Properties.ReadOnly      := true;
      cxvalor.Properties.ReadOnly       := true;
      cxtipo.Properties.ReadOnly        := true;
      cxsituacao.Properties.ReadOnly    := true;
      cxcheque.Properties.ReadOnly      := true;
      cxprevisao.Properties.ReadOnly    := true;
      cxhistorico.Properties.ReadOnly   := true;
      cxprazo.Properties.ReadOnly       := true;
      cxobs.Properties.ReadOnly         := true;
      BtnSede.Enabled                   := False;
      btnprazo.Enabled                  := False;
      btnHistorico.Enabled              := False;
      PopularCampos;
      cxsituacao.ItemIndex              := 1;
      cxDataConciliacao.SetFocus;
    end;


  except on E: Exception do
    Begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    End;
  End;
end;

procedure TFrmLancamentoBancario.PopularCampos;
begin
  inherited;
  Obj      := Nil;
  try
    Obj    := TLancamentoBancario.Create;
    Try
      if (ParamsInt=0) or (InttoStr(ParamsInt) = '') then
      raise Exception.Create('Nenhum ID passado no parâmetro.');

      Obj     := TLancamentoBancarioController.BuscarPorID(ParamsInt);
      if Assigned(Obj) then
      begin
        cxconta.EditValue       := obj.id_conta;
        cxemissao.EditValue     := TConesul.ValidarDataNull(obj.data_emissao);
        cxcompetencia.EditValue := TConesul.ValidarDataNull(obj.data_competencia);
        cxvencimento.EditValue  := TConesul.ValidarDataNull(obj.data_vencimento);
        cxnumero.EditValue      := obj.numero;
        cxvalor.EditValue       := obj.valor;
        if obj.tipo_movimento='C' then
        cxtipo.ItemIndex        := 0
        else
        cxtipo.ItemIndex        := 1;
        cxsituacao.Text         := obj.situacao;
        cxcheque.Text           := obj.cheque;
        cxprevisao.Text         := obj.previsao;
        cxhistorico.EditValue   := obj.id_historico;
        cxprazo.EditValue       := obj.id_prazo;
        cxobs.Text              := obj.historico;
        cxplano.EditValue       := obj.id_planoconta;
        cxcusto.EditValue       := obj.id_custo;
        cxfavorecido.EditValue  := obj.id_pessoa;
        cxdepartamento.EditValue:= obj.id_departamento;
      end;

    Finally
      FreeAndNil(Obj);
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmLancamentoBancario.Salvar(out msg: string): Boolean;
var
AId:Integer;
begin
  Result       := False;
  Obj          := nil;

  try
    Obj        := TLancamentoBancario.Create;
    Try
      if ParamsStr='N' then
      Obj.id_lancamento_bancario    := 0
      else
      Obj.id_lancamento_bancario    := ParamsInt;

      Obj.id_conta                  := cxconta.EditValue;
      Obj.data_emissao              := TConesul.ValidarDataNull(cxemissao.EditValue);
      Obj.data_competencia          := TConesul.ValidarDataNull(cxcompetencia.EditValue);
      if cxvencimento.EditValue = null then
      Obj.data_vencimento           := Nulldate
      else
      Obj.data_vencimento           := TConesul.ValidarDataNull(cxvencimento.EditValue);
      Obj.numero                    := Trim(cxnumero.Text);
      Obj.valor                     := cxvalor.EditValue;
      if cxtipo.ItemIndex=0 then
      Obj.tipo_movimento            := 'C'
      else
      Obj.tipo_movimento            := 'D';
      Obj.situacao                  := cxsituacao.Text;
      Obj.cheque                    := cxcheque.Text;
      Obj.previsao                  := cxprevisao.Text;
      Obj.id_historico              := cxhistorico.EditValue;
      Obj.id_prazo                  := cxprazo.EditValue;
      Obj.historico                 := trim(cxobs.Text);
      Obj.id_planoconta             := cxplano.EditValue;
      Obj.id_custo                  := cxcusto.EditValue;
      Obj.id_pessoa                 := cxfavorecido.EditValue;
      Obj.id_departamento           := cxdepartamento.EditValue;
      Obj.id_usuario                := Tsession.ID_USUARIO;
      Obj.id_empresa                := Tsession.IDEMPRESA;

      if ParamsStr='E' then
      begin
        obj.id_usuario_alt          := Tsession.ID_USUARIO;
      end;

      //conciliacao
      if ParamsStr='C' then
      begin
        obj.id_usuario_alt          := Tsession.ID_USUARIO;
        Obj.conciliado              := cxConciliacao.EditValue;
        Obj.data_conciliacao        := cxDataConciliacao.EditValue;
        Obj.situacao                := 'CONCLUIDO';
        obj.id_usuario_conci        := Tsession.ID_USUARIO;
      end;

      if TLancamentoBancarioController.Salvar(Obj, AId, msg) then
      begin
        if AID = 0 then
        AID     := ParamsInt;
        msg     := 'Registro salvo com sucesso, ID: '+IntToStr(AID);
        Result  := true;
        ParamsCloseTela := 'S';
      end;

    Finally
      FreeAndNil(Obj);
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmLancamentoBancario.ValidarCampos(out msg: string): Boolean;
begin
  Result  := true;

  Try
    if (cxConta.Text = '') or (cxconta.EditValue =0) then
    begin
      msg   := 'Selecione uma conta!';
      result:= False;
      exit;
    end;

    if cxemissao.Date=0 then
    begin
      msg   := 'Informe a data de emissão!';
      result:= False;
      exit;
    end;

    if cxcompetencia.date=0 then
    begin
      msg   := 'Informe a data de competência!';
      result:= False;
      exit;
    end;

    if cxnumero.Text='' then
    begin
      msg   := 'Informe um número de documento!';
      result:= False;
      exit;
    end;

    if (cxvalor.EditValue=0) or (cxvalor.EditValue<=0) then
    begin
      msg   := 'Informe um valor válido!';
      result:= False;
      exit;
    end;

    if (cxtipo.Text='') or (cxtipo.ItemIndex=-1) then
    begin
      msg   := 'Selecione tipo de lançamento!';
      result:= False;
      exit;
    end;

    if (cxhistorico.Text='') or (cxhistorico.EditValue=0) then
    begin
      msg   := 'Selecione um histórico!';
      result:= False;
      exit;
    end;

    if (cxprazo.Text='') or (cxprazo.EditValue=0) then
    begin
      msg   := 'Selecione um pagamento/recebimento!';
      result:= False;
      exit;
    end;

    if cxobs.Text='' then
    begin
      msg   := 'Informe uma observação!';
      result:= False;
      exit;
    end;

    if (cxplano.Text='') or (cxplano.EditValue=0) then
    begin
      msg   := 'Selecione um plano de contas!';
      result:= False;
      exit;
    end;

    if (cxcusto.Text ='') or (cxcusto.ItemIndex=-1) then
    begin
      msg   := 'Selecione um centro de custo!';
      result:= False;
      exit;
    end;

    if cxprevisao.ItemIndex=0 then
    begin
      if cxvencimento.Date = 0 then
      begin
        msg   := 'Informe a data de vencimento!';
        result:= False;
        exit;
      end;

      if (cxvencimento.date < cxemissao.Date) then
      begin
        msg   := 'Data de vencimento não pode ser menor que a data de emissão!';
        result:= False;
        exit;
      end;

    end;

    if cxcheque.ItemIndex=0 then
    begin
      if cxvencimento.Date = 0 then
      begin
        msg   := 'Informe a data de vencimento!';
        result:= False;
        exit;
      end;

      if (cxvencimento.Date < cxemissao.Date) then
      begin
        msg   := 'Data de vencimento não pode ser menor que a data de emissão!';
        result:= False;
        exit;
      end;

    end;

    if cxvencimento.Date > 0 then
    if cxemissao.Date > cxvencimento.Date then
    begin
      msg   := 'Data de emissão não pode ser maior que a data de vencimento!';
      result:= False;
      exit;
    end;

    if ParamsStr = 'C' then
    begin
      if cxDataConciliacao.Date <= 0 then
      begin
        msg   := 'Informe uma data valida para a conciliação!';
        result:= False;
        exit;
      end;
    end;

  except on E: Exception do
    Begin
      JKDialog('Erro','Ocorreu um erro ao validar os campos:'+#13+e.Message, tderro);
    End;
  End;

end;

end.
