unit UnitLerOFX;

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
  dxSkinXmas2008Blue, Vcl.ComCtrls, dxCore, cxDateUtils, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxMaskEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxGroupBox, cxButtonEdit, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, dxDateRanges, dxScrollbarAnnotations, cxDBData,
  cxImageComboBox, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, cxMemo, dxmdaset, UConeSul,
  Controller.LookupHelper, UnitGlobal, Datasnap.DBClient, Service.OFXReader,
  uJKDialog,System.Generics.Collections, System.ImageList, Vcl.ImgList,
  cxImageList, cxCheckBox, cxBlobEdit, Model.LancamentoBancario, System.StrUtils,
  Vcl.Session, Controller.LancamentoBancario, Vcl.Grids, Vcl.DBGrids,
  UnitHistoricoBancario, UnitPrazoCad, UnitPlanoContaCad, UnitPessoaCad,
  UnitDepartamentoCad;

type
  TFrmOFX = class(TFormNovoBaseCadastro)
    GBFiltro: TcxGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    BtnPesquisar: TStyledBitBtn;
    BtnLimpar: TStyledBitBtn;
    cxConta: TcxLookupComboBox;
    EdtDataInicial: TcxDateEdit;
    edtDataFinal: TcxDateEdit;
    cxtipo: TcxComboBox;
    cxarquivo: TcxButtonEdit;
    cxGrid: TcxGrid;
    Grid: TcxGridDBTableView;
    GridRecId: TcxGridDBColumn;
    Gridid_ticket: TcxGridDBColumn;
    GridAnexo: TcxGridDBColumn;
    GridTipo: TcxGridDBColumn;
    GridConciliado: TcxGridDBColumn;
    GridEmissao: TcxGridDBColumn;
    GridNumero: TcxGridDBColumn;
    Gridsituacao: TcxGridDBColumn;
    GridHistorico: TcxGridDBColumn;
    Gridobs: TcxGridDBColumn;
    GridValorcredito: TcxGridDBColumn;
    Gridmotivo: TcxGridDBColumn;
    Gridobs_cancelamento: TcxGridDBColumn;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGrupConciliacao: TcxGroupBox;
    Label3: TLabel;
    cxemissao: TcxDateEdit;
    Label6: TLabel;
    cxcompetencia: TcxDateEdit;
    Label8: TLabel;
    cxnumero: TcxTextEdit;
    Label9: TLabel;
    cxhistorico: TcxLookupComboBox;
    btnHistorico: TcxButtonEdit;
    Label11: TLabel;
    cxprazo: TcxLookupComboBox;
    btnprazo: TcxButtonEdit;
    Label12: TLabel;
    cxcheque: TcxComboBox;
    Label10: TLabel;
    mdPesquisa: TdxMemData;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    cxGroupBox5: TcxGroupBox;
    cxGroupBox6: TcxGroupBox;
    cxGroupBox7: TcxGroupBox;
    cxGroupBox8: TcxGroupBox;
    TabHistorico: TClientDataSet;
    TabHistoricoid_historico: TIntegerField;
    TabHistoricodescricao: TStringField;
    TabHistoriconpesquisa: TStringField;
    dsHistorico: TUniDataSource;
    TabCusto: TClientDataSet;
    TabCustoid_custo: TIntegerField;
    TabCustodescricao: TStringField;
    TabCustocusto: TStringField;
    dsCusto: TUniDataSource;
    TabConta: TClientDataSet;
    TabContaid_conta: TIntegerField;
    TabContacodigo: TIntegerField;
    TabContaagencia: TStringField;
    TabContaconta: TStringField;
    TabContacorrentista: TStringField;
    TabContabanco: TStringField;
    TabContanpesquisa: TStringField;
    dsconta: TUniDataSource;
    dsdepartamento: TUniDataSource;
    TabDepartamento: TClientDataSet;
    TabDepartamentoid_departamento: TIntegerField;
    TabDepartamentodescricao: TStringField;
    TabDepartamentonpesquisa: TStringField;
    TabPlano: TClientDataSet;
    TabPlanoid_planoconta: TIntegerField;
    TabPlanocodigo: TStringField;
    TabPlanonivel: TIntegerField;
    TabPlanoDESCRICAO_COMPLETA: TStringField;
    dsPlano: TUniDataSource;
    TabPessoa: TClientDataSet;
    TabPessoaid_socio: TIntegerField;
    TabPessoanome: TStringField;
    TabPessoacpf: TStringField;
    TabPessoacliente: TStringField;
    TabPessoawhatsapp: TStringField;
    TabPessoaaviso: TStringField;
    dspessoa: TUniDataSource;
    TabPrazo: TClientDataSet;
    TabPrazoid_prazo: TIntegerField;
    TabPrazocodigo: TIntegerField;
    TabPrazonprazopag: TStringField;
    dsprazo: TUniDataSource;
    mdPesquisaselecionado: TBooleanField;
    mdPesquisadata_movimento: TDateField;
    mdPesquisadocumento: TStringField;
    mdPesquisahistorico: TStringField;
    mdPesquisatipo_movimento: TStringField;
    mdPesquisatipo_descricao: TStringField;
    mdPesquisacredito: TCurrencyField;
    mdPesquisasituacao: TStringField;
    mdPesquisaconciliado: TBooleanField;
    mdPesquisafitid: TStringField;
    mdPesquisatipo_ofx: TStringField;
    mdPesquisanome: TStringField;
    mdPesquisamemo: TStringField;
    mdPesquisacompetencia: TDateField;
    mdPesquisacheque: TStringField;
    mdPesquisaobservacao: TStringField;
    mdPesquisaid_historico: TIntegerField;
    mdPesquisaid_prazo: TIntegerField;
    mdPesquisaid_planoconta: TIntegerField;
    mdPesquisaid_custo: TIntegerField;
    mdPesquisaid_pessoa: TIntegerField;
    mdPesquisaid_departamento: TIntegerField;
    Gridvalordebito: TcxGridDBColumn;
    mdPesquisadebito: TCurrencyField;
    cxIMGMenu: TcxImageList;
    stConciliado: TcxStyle;
    stIgnorado: TcxStyle;
    stErro: TcxStyle;
    BtnAnterior: TStyledBitBtn;
    btnProximo: TStyledBitBtn;
    lblRegistrosImportados: TLabel;
    lblSelecionados: TLabel;
    lblConciliados: TLabel;
    lblPendentes: TLabel;
    lblTotalCredito: TLabel;
    lblTotalDebito: TLabel;
    cxConciliacao: TcxCheckBox;
    cxobs: TcxBlobEdit;
    Label13: TLabel;
    cxplano: TcxLookupComboBox;
    btnplano: TcxButtonEdit;
    Label14: TLabel;
    cxcusto: TcxLookupComboBox;
    btncusto: TcxButtonEdit;
    Label15: TLabel;
    cxfavorecido: TcxLookupComboBox;
    btnfavorecido: TcxButtonEdit;
    Label16: TLabel;
    cxdepartamento: TcxLookupComboBox;
    btndepartamento: TcxButtonEdit;
    btnaplicar: TStyledBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure cxarquivoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure GridCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure GridStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure mdPesquisaAfterScroll(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnaplicarClick(Sender: TObject);
    procedure cxhistoricoPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnLimparClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
    FDocumentoOFX: TDocumentoOFX;
    procedure CarregarHistoricoportipo(AIndex: Integer);
    procedure CarregarGrid;
    procedure AtualizarBotoesNavegacao;
    procedure CarregarDadosRegistroAtual;
    procedure SalvarDadosRegistroAtual;
    procedure LimparCamposConciliacao;
    procedure AtualizarResumoImportacao;
    function VerificarRegistrosParaGravacao(
      out ATotalRegistros: Integer): Boolean;
    { Private declarations }
  public
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    { Public declarations }
  end;

var
  FrmOFX: TFrmOFX;
  Obj   :TLancamentoBancario;
implementation

uses
  System.DateUtils;

{$R *.dfm}

procedure TFrmOFX.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmOFX  := nil;
end;

procedure TFrmOFX.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;
end;

procedure TFrmOFX.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FDocumentoOFX);
end;

procedure TFrmOFX.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  //
  if key = vk_f2 then
  begin
    BtnAnterior.Click;
    key:=0;
  end;

  if key = vk_f3 then
  begin
    btnProximo.Click;
    key:=0;
  end;

  if key = vk_f7 then
  begin
    BtnPesquisar.Click;
    key:=0;
  end;

  if key = vk_f8 then
  begin
    BtnLimpar.Click;
    key:=0;
  end;
end;

procedure TFrmOFX.FormShow(Sender: TObject);
var
IntervaloData :integer;
begin
  inherited;
  ParamsTela  := 'Controle Bancário';
  TitleText   := 'Leitura OFX / Conciliação Bancária';

  IntervaloData           := 0;
  IntervaloData           := StrToINt(TConeSul.LerValorIni(TConeSul.ndir, 'PARAMETRO', 'IntervaloData',''));

  EdtDataInicial.Date     := IncDay(Date, -IntervaloData);
  edtDataFinal.Date       := IncDay(Date, IntervaloData);
  cxtipo.ItemIndex        := 0;

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

  EdtDataInicial.SetFocus;

  cxGrupConciliacao.Enabled     := False;
end;

procedure TFrmOFX.GridCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  TipoMovimento: string;
begin
  if not Assigned(AViewInfo.GridRecord) then
    Exit;
  TipoMovimento :=
    VarToStr(
      AViewInfo.GridRecord.Values[
        GridTipo.Index
      ]
    );
    if AViewInfo.Item = GridValorcredito then
    ACanvas.Font.Color := clGreen
    else
    if AViewInfo.Item = Gridvalordebito then
    ACanvas.Font.Color := clRed;

//  if AViewInfo.Item = GridValorcredito then
//  begin
//    if SameText(TipoMovimento, 'C') then
//      ACanvas.Font.Color := clGreen
//    else if SameText(TipoMovimento, 'D') then
//      ACanvas.Font.Color := clRed;
//  end;

end;


procedure TFrmOFX.GridStylesGetContentStyle(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
  var AStyle: TcxStyle);
var
  Situacao: string;
begin
  if not Assigned(ARecord) then
    Exit;
  Situacao :=
    VarToStr(
      ARecord.Values[GridConciliado.Index]
    );
  if SameText(Situacao, 'CONCILIADO') then
    AStyle := stConciliado
  else if SameText(Situacao, 'IGNORADO') then
    AStyle := stIgnorado
  else if SameText(Situacao, 'ERRO') then
    AStyle := stErro;
end;

procedure TFrmOFX.mdPesquisaAfterScroll(DataSet: TDataSet);
begin
  //Navegar pelos registro e exibir os dados em tela

  if mdPesquisa.IsEmpty then
  begin
    LimparCamposConciliacao;
    AtualizarBotoesNavegacao;
    exit;
  end;

  Try
    CarregarDadosRegistroAtual;
  Finally
    AtualizarBotoesNavegacao;
  End;

end;

Procedure TFrmOFX.LimparCamposConciliacao;
begin
  cxemissao.Clear;
  cxcompetencia.Clear;
  cxnumero.Clear;
  cxcheque.ItemIndex        := 1;
  cxhistorico.EditValue     := 0;
  cxprazo.EditValue         := 0;
  cxobs.Clear;
  cxplano.EditValue         := 0;
  cxcusto.EditValue         := 0;
  cxfavorecido.EditValue    :=0;
  cxdepartamento.EditValue  :=0;
  cxConciliacao.Checked     := False;
end;

Procedure TFrmOFX.CarregarDadosRegistroAtual;
begin
  if mdPesquisa.IsEmpty then
    Exit;

  if mdPesquisatipo_movimento.AsString = 'C' then
  CarregarHistoricoportipo(0)
  else
  CarregarHistoricoportipo(1);

  cxemissao.EditValue     := mdPesquisadata_movimento.AsDateTime;
  cxcompetencia.EditValue := mdPesquisadata_movimento.AsDateTime;
  cxnumero.EditValue      := mdPesquisadocumento.AsString;
  cxobs.Text              := mdPesquisahistorico.AsString;

  //Outros dados
  cxcheque.Text           := mdPesquisacheque.AsString;
  cxhistorico.EditValue   := mdPesquisaid_historico.AsInteger;
  cxprazo.EditValue       := mdPesquisaid_prazo.AsInteger;
  cxplano.EditValue       := mdPesquisaid_planoconta.AsInteger;
  cxcusto.EditValue       := mdPesquisaid_custo.AsInteger;
  cxfavorecido.EditValue  := mdPesquisaid_pessoa.AsInteger;
  cxdepartamento.EditValue:= mdPesquisaid_departamento.AsInteger;

  cxConciliacao.EditValue := mdPesquisaconciliado.AsBoolean;

end;

Procedure TFrmOFX.AtualizarBotoesNavegacao;
begin
  BtnAnterior.Enabled :=
    not mdPesquisa.IsEmpty and
    (mdPesquisa.RecNo > 1);
  btnProximo.Enabled :=
    not mdPesquisa.IsEmpty and
    (mdPesquisa.RecNo < mdPesquisa.RecordCount);
end;

function TFrmOFX.Salvar(out msg: string): Boolean;
var
  TotalRegistros: Integer;
  Bookmark      : TBookmark;
  StatusRegistro: string;
  AId           :integer;
begin
  Obj          := nil;
  try
    if not VerificarRegistrosParaGravacao(TotalRegistros) then
      Exit;
    Bookmark := mdPesquisa.GetBookmark;
    mdPesquisa.DisableControls;
    try
      mdPesquisa.First;
      while not mdPesquisa.Eof do
      begin
        StatusRegistro := UpperCase(Trim(mdPesquisasituacao.AsString));
        if StatusRegistro = 'CONCILIADO' then
        begin
          Obj        := TLancamentoBancario.Create;
          try
            Obj.id_lancamento_bancario    := 0;
            Obj.id_conta                  := cxConta.EditValue;
            Obj.data_emissao              := mdPesquisadata_movimento.AsDateTime;
            Obj.data_competencia          := mdPesquisadata_movimento.AsDateTime;
            Obj.data_vencimento           := Nulldate;
            Obj.numero                    := Trim(mdPesquisadocumento.AsString);
            if mdPesquisatipo_movimento.asstring='C' then
            Obj.valor                     := mdPesquisacredito.AsCurrency
            else
            Obj.valor                     := mdPesquisadebito.AsCurrency;
            Obj.tipo_movimento            := mdPesquisatipo_movimento.asstring;
            Obj.situacao                  := 'CONCLUIDO';
            Obj.cheque                    := mdPesquisacheque.AsString;
            Obj.previsao                  := 'NÃO';
            Obj.id_historico              := mdPesquisaid_historico.AsInteger;
            Obj.id_prazo                  := mdPesquisaid_prazo.AsInteger;
            Obj.historico                 := Trim(mdPesquisahistorico.AsString);
            Obj.id_planoconta             := mdPesquisaid_planoconta.AsInteger;
            Obj.id_custo                  := mdPesquisaid_custo.AsInteger;
            Obj.id_pessoa                 := mdPesquisaid_pessoa.AsInteger;
            Obj.id_departamento           := mdPesquisaid_departamento.AsInteger;
            Obj.id_usuario                := TSession.id_usuario;
            Obj.id_empresa                := TSession.IDEMPRESA;
            Obj.conciliado                := 'S';
            Obj.data_conciliacao          := mdPesquisadata_movimento.AsDateTime;
            obj.id_usuario_conci          := Tsession.ID_USUARIO;
            obj.fitid                     := mdPesquisafitid.AsString;
            if not TLancamentoBancarioController.Salvar(Obj, AId, msg) then
            begin
              msg := 'Não foi possível gravar o lançamento do documento ' + Obj.numero;
              Exit;
            end;
            //Inc(Result);
          finally
            obj.Free;
          end;
        end;
        mdPesquisa.Next;
      end;
    finally
      if mdPesquisa.BookmarkValid(Bookmark) then
        mdPesquisa.GotoBookmark(Bookmark);
      mdPesquisa.FreeBookmark(Bookmark);
      mdPesquisa.EnableControls;
    end;
    msg := Format('%d registro(s) validado(s) e gravado com sucesso.', [TotalRegistros]);
    Result  := true;
    ParamsCloseTela := 'S';
  except
    on E: Exception do
      JKDialog(
        'Erro',
        'Não foi possível finalizar a importação:' +
        sLineBreak + E.Message,
        tdErro
      );
  end;

end;

function TFrmOFX.VerificarRegistrosParaGravacao(out ATotalRegistros: Integer): Boolean;
var
  Bookmark: TBookmark;
  NumeroRegistro: Integer;
  StatusRegistro: string;
begin
  Result := False;
  ATotalRegistros := 0;

  // Salva possíveis alterações feitas no registro atual.
  SalvarDadosRegistroAtual;

  Bookmark      := mdPesquisa.GetBookmark;
  mdPesquisa.DisableControls;

  try
    NumeroRegistro          := 0;
    mdPesquisa.First;

    while not mdPesquisa.Eof do
    begin
      Inc(NumeroRegistro);

      StatusRegistro := UpperCase(Trim(mdPesquisasituacao.AsString));

      // Registro ignorado não será gravado.
      if StatusRegistro = 'IGNORADO' then
      begin
        mdPesquisa.Next;
        Continue;
      end;

      if StatusRegistro = 'IMPORTADO' then
      begin
        mdPesquisa.Next;
        Continue;
      end;

      // Registros com erro impedem a finalização.
      if StatusRegistro = 'ERRO' then
      begin
        raise Exception.CreateFmt('O registro %d está com erro e precisa ser corrigido ou ignorado.',
          [NumeroRegistro]);
      end;

      // Registros pendentes ainda não estão prontos.
      if StatusRegistro = 'PENDENTE' then
      begin
        raise Exception.CreateFmt(
          'O registro %d ainda está pendente de conciliação.',
          [NumeroRegistro]
        );
      end;

      if StatusRegistro = 'CONCILIADO' then
      begin

        if mdPesquisadata_movimento.AsDateTime <= 0 then
        begin
          raise Exception.CreateFmt(
            'Informe a data de emissão do registro %d.',
            [NumeroRegistro]);
        end;

        if mdPesquisatipo_movimento.AsString = 'C' then
        begin
          if mdPesquisacredito.AsCurrency <= 0 then
          begin
            raise Exception.CreateFmt(
              'O valor do registro %d deve ser maior que zero.',
              [NumeroRegistro]
            );
          end;
        end
        else
        begin
          if mdPesquisadebito.AsCurrency <= 0 then
          begin
            raise Exception.CreateFmt(
              'O valor do registro %d deve ser maior que zero.',
              [NumeroRegistro]
            );
          end;
        end;

        if not MatchText(UpperCase(Trim(mdPesquisatipo_movimento.AsString)),['C', 'D']) then
        begin
          raise Exception.CreateFmt(
            'O tipo de movimento do registro %d é inválido.',
            [NumeroRegistro]
          );
        end;

        if mdPesquisaid_historico.AsInteger <= 0 then
        begin
          raise Exception.CreateFmt(
            'Informe o histórico bancário do registro %d.',
            [NumeroRegistro]
          );
        end;

        if mdPesquisaid_prazo.AsInteger <= 0 then
        begin
          raise Exception.CreateFmt(
            'Informe a forma de pagamento ou recebimento do registro %d.',
            [NumeroRegistro]
          );
        end;

        if mdPesquisaid_planoconta.AsInteger <= 0 then
        begin
          raise Exception.CreateFmt(
            'Informe o plano de contas do registro %d.',
            [NumeroRegistro]
          );
        end;

        if mdPesquisaid_custo.AsInteger <= 0 then
        begin
          raise Exception.CreateFmt(
            'Informe o centro de custo do registro %d.',
            [NumeroRegistro]
          );
        end;


        Inc(ATotalRegistros);

        {
          Ponto para montar a model e chamar o Controller:

          Lancamento := MontarLancamentoAtual;

          TLancamentoBancarioController.Inserir(Lancamento);
        }
      end;

      mdPesquisa.Next;
    end;

    if ATotalRegistros = 0 then
      raise Exception.Create(
        'Nenhum registro conciliado foi encontrado para gravação.'
      );

    Result := True;
  finally
    if mdPesquisa.BookmarkValid(Bookmark) then
      mdPesquisa.GotoBookmark(Bookmark);

    mdPesquisa.FreeBookmark(Bookmark);
    mdPesquisa.EnableControls;
  end;
end;

Procedure TFrmOFX.SalvarDadosRegistroAtual;
begin
  if mdPesquisa.IsEmpty then
    Exit;
  mdPesquisa.Edit;

  mdPesquisacheque.asstring         := cxcheque.Text;
  mdPesquisahistorico.asstring      := Trim(cxobs.text);
  mdPesquisaid_historico.asinteger  := cxhistorico.editvalue;
  mdPesquisaid_prazo.asinteger      := cxprazo.editvalue;
  mdPesquisaid_planoconta.asinteger := cxplano.editvalue;
  mdPesquisaid_custo.asinteger      := cxcusto.editvalue;
  mdPesquisaid_pessoa.asinteger     := cxfavorecido.editvalue;
  mdPesquisaid_departamento.asinteger := cxdepartamento.editvalue;

  if cxConciliacao.Checked then
  begin
    mdPesquisaselecionado.AsBoolean   := True;
    mdPesquisaconciliado.AsBoolean    := True;
  end
  else
  begin
    mdPesquisaselecionado.AsBoolean   := False;
    mdPesquisaconciliado.AsBoolean    := False;
  end;

  mdPesquisasituacao.AsString         := 'CONCILIADO';

  mdPesquisa.Post;
end;

function TFrmOFX.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  Try

    if not mdPesquisa.Active then
    begin
      msg   := 'Os dados do arquivo OFX não foram carregados.';
      result:= False;
      exit;
    end;

    if mdPesquisa.IsEmpty then
    begin
      msg   := 'Não existem registros do arquivo OFX para processar.';
      result:= False;
      exit;
    end;

   except on E: Exception do
    Begin
      JKDialog('Erro','Ocorreu um erro ao validar os campos:'+#13+e.Message, tderro);
    End;
  End;

end;

procedure TFrmOFX.BtnAnteriorClick(Sender: TObject);
begin
  inherited;
  if mdPesquisa.IsEmpty then
    Exit;
  SalvarDadosRegistroAtual;
  AtualizarResumoImportacao;
  if mdPesquisa.RecNo > 1 then
    mdPesquisa.Prior;
end;

procedure TFrmOFX.btnaplicarClick(Sender: TObject);
begin

  //Validar campos
  if (cxhistorico.Text='') or (cxhistorico.EditValue=0) then
  begin
    JKDialog('Aviso','Selecione um histórico!', tdAlerta);
    cxhistorico.SetFocus;
    exit;
  end;

  if (cxprazo.Text='') or (cxprazo.EditValue=0) then
  begin
    JKDialog('Aviso','Selecione um pagamento/recebimento!', tdAlerta);
    cxprazo.SetFocus;
    exit;
  end;

  if (cxplano.Text='') or (cxplano.EditValue=0) then
  begin
    JKDialog('Aviso','Selecione um plano de contas!', tdAlerta);
    exit;
  end;

  if (cxcusto.Text ='') or (cxcusto.ItemIndex=-1) then
  begin
    JKDialog('Aviso','Selecione um centro de custo!', tdAlerta);
    cxplano.SetFocus;
    exit;
  end;

  if cxConciliacao.Checked=false then
  begin
    JKDialog('Aviso','Marque a opção para conciliar o registro!', tdAlerta);
    cxConciliacao.SetFocus;
    exit;
  end;
  Try
    SalvarDadosRegistroAtual;
  Finally
    JKDialog('Aviso','Dados aplicado.', tdSucesso);
  End;

  BtnProximo.Click;
  AtualizarResumoImportacao;
  cxcheque.SetFocus;
end;

procedure TFrmOFX.btncustoPropertiesButtonClick(Sender: TObject;
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
//      if mdPesquisatipo_movimento.AsString = 'C' then
//      CarregarHistoricoportipo(0)
//      else
//      CarregarHistoricoportipo(1);
//    end;
//  except on E: Exception do
//    begin
//      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
//    end;
//  end;
end;

procedure TFrmOFX.btndepartamentoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
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

procedure TFrmOFX.btnfavorecidoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
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

procedure TFrmOFX.btnHistoricoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  try
    try
      if not Assigned(FrmHistoricoBancario) then
      FrmHistoricoBancario := TFrmHistoricoBancario.Create(Application);
      FrmHistoricoBancario.ParamsStr  := 'N';
      FrmHistoricoBancario.ShowModal;
    finally
      if mdPesquisatipo_movimento.AsString = 'C' then
      CarregarHistoricoportipo(0)
      else
      CarregarHistoricoportipo(1);
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmOFX.BtnLimparClick(Sender: TObject);
begin
  inherited;
    cxGrupConciliacao.Enabled           := False;
    EdtDataInicial.Properties.ReadOnly  := False;
    edtDataFinal.Properties.ReadOnly    := False;
    cxtipo.Properties.ReadOnly          := False;
    cxConta.Properties.ReadOnly         := False;
    cxConta.EditValue                   := 0;
    cxarquivo.Properties.ReadOnly       := False;
    cxarquivo.Clear;
    BtnPesquisar.Enabled                := True;
    mdPesquisa.Close;
    mdPesquisa.FieldDefs.Clear;
    LimparCamposConciliacao;
    AtualizarResumoImportacao;
    EdtDataInicial.SetFocus;
end;

procedure TFrmOFX.BtnPesquisarClick(Sender: TObject);
begin
  try
    CarregarGrid;
    AtualizarResumoImportacao;
    if mdPesquisa.RecordCount > 0 then
      JKDialog('Sucesso',Format('%d registro(s) carregado(s) do arquivo OFX.',[mdPesquisa.RecordCount]),tdSucesso)
    else
    JKDialog('Aviso',Format('%d registro(s) carregado(s) do arquivo OFX.',[mdPesquisa.RecordCount]),tdAlerta);

    cxGrupConciliacao.Enabled           := True;
    EdtDataInicial.Properties.ReadOnly  := True;
    edtDataFinal.Properties.ReadOnly    := true;
    cxtipo.Properties.ReadOnly          := true;
    cxConta.Properties.ReadOnly         := true;
    cxarquivo.Properties.ReadOnly       := true;
    BtnPesquisar.Enabled                := False;
  except
    on E: Exception do
    begin
      JKDialog('Erro','Não foi possível carregar o arquivo OFX.' + sLineBreak +E.Message,tdErro);
    end;
  end;

end;

procedure TFrmOFX.btnplanoPropertiesButtonClick(Sender: TObject;
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
      if mdPesquisatipo_movimento.AsString = 'C' then
      CarregarHistoricoportipo(0)
      else
      CarregarHistoricoportipo(1);
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmOFX.btnprazoPropertiesButtonClick(Sender: TObject;
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
      if mdPesquisatipo_movimento.AsString = 'C' then
      CarregarHistoricoportipo(0)
      else
      CarregarHistoricoportipo(1);
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmOFX.btnProximoClick(Sender: TObject);
begin
  inherited;
  if mdPesquisa.IsEmpty then
    Exit;
  SalvarDadosRegistroAtual;
  if not mdPesquisa.RecNo < mdPesquisa.RecordCount then
    mdPesquisa.Next;
end;

procedure TFrmOFX.CarregarGrid;
var
  Lista: TList<TTransacaoOFX>;
  Transacao: TTransacaoOFX;
  TipoFiltro: TTipoMovimentoOFX;
begin
  if Trim(cxarquivo.Text) = '' then
  begin
    JKDialog('Aviso','Selecione o arquivo OFX.', tdAlerta);
    exit;
  end;

  if (cxconta.Text='' ) or (cxConta.EditValue = Null) or (cxconta.EditValue=0) then
  begin
    JKDialog('Aviso','Informe a conta bancária.', tdAlerta);
    exit;
  end;

  if EdtDataInicial.Date = 0 then
  begin
    JKDialog('Aviso','Informe a data inicial.', tdAlerta);
    exit;
  end;

  if EdtDataFinal.Date = 0 then
  begin
    JKDialog('Aviso','Informe a data final.', tdAlerta);
    exit;
  end;

  if EdtDataInicial.Date > EdtDataFinal.Date then
  begin
    JKDialog('Aviso','A data inicial não pode ser maior que a data final.', tdAlerta);
    exit;
  end;

  case cxtipo.ItemIndex of
    1:
      TipoFiltro := tmCredito;

    2:
      TipoFiltro := tmDebito;
  else
    TipoFiltro := tmTodos;
  end;

  FreeAndNil(FDocumentoOFX);

  FDocumentoOFX := TOFXReader.LerArquivo(cxarquivo.Text);

  Lista := TOFXReader.FiltrarTransacoes(FDocumentoOFX,EdtDataInicial.Date,EdtDataFinal.Date,TipoFiltro);

  try
    mdPesquisa.Close;
      mdPesquisa.FieldDefs.Clear;

    if not mdPesquisa.Active then
      mdPesquisa.Open;

    mdPesquisa.DisableControls;
    try

      for Transacao in Lista do
      begin

        if TLancamentoBancarioController.ExisteFITID(Transacao.FitID, TSession.IDEMPRESA, cxconta.EditValue) then
        Continue;


        mdPesquisa.Append;

        mdPesquisaselecionado.AsBoolean             := False;//Transacao.Selecionado;
        mdPesquisadata_movimento.AsDateTime         := DateOf(Transacao.DataMovimento);
        mdPesquisadocumento.AsString                := Transacao.Documento;
        mdPesquisahistorico.AsString                := Transacao.Historico;
        mdPesquisatipo_movimento.AsString           := Transacao.TipoMovimento;
        if Transacao.TipoMovimento = 'C' then
        mdPesquisatipo_descricao.AsString           := 'CRÉDITO'
        else
        mdPesquisatipo_descricao.AsString           := 'DÉBITO';
        if Transacao.TipoMovimento = 'C' then
        begin
          mdPesquisacredito.AsCurrency              := Transacao.Valor;
          mdPesquisadebito.AsCurrency               := 0;
        end
        else
        begin
          mdPesquisadebito.AsCurrency               := Transacao.Valor;
          mdPesquisacredito.AsCurrency              := 0;
        end;
        mdPesquisasituacao.AsString                 := 'IMPORTADO';
        mdPesquisaconciliado.AsBoolean              := False;
        mdPesquisafitid.AsString                    := Transacao.FitID;
        mdPesquisatipo_ofx.AsString                 := Transacao.TipoOFX;
        mdPesquisanome.AsString                     := Transacao.Nome;
        mdPesquisamemo.AsString                     := Transacao.Memo;

        mdPesquisacheque.AsString                   := 'NÃO';
        mdPesquisaid_historico.AsInteger            := 0;
        mdPesquisaid_prazo.AsInteger                := 0;
        mdPesquisaid_planoconta.AsInteger           := 0;
        mdPesquisaid_custo.AsInteger                := 0;
        mdPesquisaid_pessoa.AsInteger               := 0;
        mdPesquisaid_departamento.AsInteger         := 0;

        mdPesquisa.Post;
      end;

      mdPesquisa.First;
    finally
      mdPesquisa.EnableControls;
    end;
  finally
    Lista.Free;
  end;
end;

procedure TFrmOFX.CarregarHistoricoportipo(AIndex: Integer);
begin
  case AIndex of
    0:begin
        TLookupHelper.CarregarLookup(
            TabHistorico,LookupHistoricoBancarioReceita);
        TabHistorico.First;

        if cxhistorico.Text<>'' then
        begin
          TLookupHelper.CarregarLookup(
            TabPlano,LookupPlanoContaRecSql);
          TabPlano.First;


          TLookupHelper.CarregarLookup(
            TabPrazo,LookupPrazoPagSql);
          TabPrazo.First;
        end;
      end;
    1:begin
        TLookupHelper.CarregarLookup(
            TabHistorico,LookupHistoricoBancarioDespesa);
        TabHistorico.First;

        if cxhistorico.Text<>'' then
        begin

          TLookupHelper.CarregarLookup(
            TabPlano,LookupPlanoContaDesSql);
          TabPlano.First;

          TLookupHelper.CarregarLookup(
            TabPrazo,LookupPrazoPagCompraSql);
          TabPrazo.First;

        end;
      end;
  end;
end;

procedure TFrmOFX.cxarquivoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  OpenDialog: TOpenDialog;
begin
  OpenDialog := TOpenDialog.Create(nil);
  try
    OpenDialog.Title := 'Selecionar arquivo OFX';
    OpenDialog.Filter :=
      'Arquivo OFX (*.ofx)|*.ofx|' +
      'Todos os arquivos (*.*)|*.*';
    OpenDialog.FilterIndex := 1;
    OpenDialog.DefaultExt := 'ofx';
    OpenDialog.Options      := [ofFileMustExist, ofPathMustExist, ofEnableSizing];
    if OpenDialog.Execute then
    begin
      if not SameText(ExtractFileExt(OpenDialog.FileName), '.ofx') then
        raise Exception.Create(
          'O arquivo selecionado não possui a extensão OFX.'
        );
      cxArquivo.Text := OpenDialog.FileName;
    end;
  finally
    OpenDialog.Free;
  end;
end;

procedure TFrmOFX.cxhistoricoPropertiesChange(Sender: TObject);
begin
  inherited;
  if mdPesquisatipo_movimento.AsString = 'C' then
  CarregarHistoricoportipo(0)
  else
  CarregarHistoricoportipo(1);
end;

procedure TFrmOFX.AtualizarResumoImportacao;
var
  Bookmark: TBookmark;

  TotalRegistros: Integer;
  TotalSelecionados: Integer;
  TotalConciliados: Integer;
  TotalPendentes: Integer;

  TotalCredito: Currency;
  TotalDebito: Currency;
begin
  TotalRegistros := 0;
  TotalSelecionados := 0;
  TotalConciliados := 0;
  TotalPendentes := 0;

  TotalCredito := 0;
  TotalDebito := 0;

  if not mdPesquisa.Active then
  begin
    lblRegistrosImportados.Caption := '0';
    lblSelecionados.Caption := '0';
    lblConciliados.Caption := '0';
    lblPendentes.Caption := '0';
    lblTotalCredito.Caption := FormatCurr('R$ #,##0.00', 0);
    lblTotalDebito.Caption := FormatCurr('R$ #,##0.00', 0);
    Exit;
  end;

  if mdPesquisa.IsEmpty then
  begin
    lblRegistrosImportados.Caption := '0';
    lblSelecionados.Caption := '0';
    lblConciliados.Caption := '0';
    lblPendentes.Caption := '0';
    lblTotalCredito.Caption := FormatCurr('R$ #,##0.00', 0);
    lblTotalDebito.Caption := FormatCurr('R$ #,##0.00', 0);
    Exit;
  end;

  Bookmark := mdPesquisa.GetBookmark;
  mdPesquisa.DisableControls;

  try
    mdPesquisa.First;

    while not mdPesquisa.Eof do
    begin
      Inc(TotalRegistros);

      if mdPesquisaselecionado.AsBoolean then
        Inc(TotalSelecionados);

      if mdPesquisaconciliado.AsBoolean then
        Inc(TotalConciliados)
      else
        Inc(TotalPendentes);

      TotalCredito :=
        TotalCredito +
        mdPesquisacredito.AsCurrency;

      TotalDebito :=
        TotalDebito +
        mdPesquisadebito.AsCurrency;

      mdPesquisa.Next;
    end;

  finally
    if mdPesquisa.BookmarkValid(Bookmark) then
      mdPesquisa.GotoBookmark(Bookmark);

    mdPesquisa.FreeBookmark(Bookmark);
    mdPesquisa.EnableControls;
  end;

  lblRegistrosImportados.Caption :=
    TotalRegistros.ToString;

  lblSelecionados.Caption :=
    TotalSelecionados.ToString;

  lblConciliados.Caption :=
    TotalConciliados.ToString;

  lblPendentes.Caption :=
    TotalPendentes.ToString;

  lblTotalCredito.Caption :=
    FormatCurr('R$ #,##0.00', TotalCredito);

  lblTotalDebito.Caption :=
    FormatCurr('R$ #,##0.00', TotalDebito);
end;

end.
