unit UnitControleBancario;

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
  ACBrEnterTab, Vcl.StyledButton, dxmdaset,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Datasnap.DBClient, Controller.LookupHelper, UnitGlobal, UnitAnexo,
  cxImageComboBox, UnitLancamentoBancario, Model.LancamentoBancario, UConeSul,
  Controller.LancamentoBancario, UnitLerOFX;

type
  TFrmControleBancario = class(TFormNovoBasePesquisa)
    frxImpressao: TfrxReport;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    btnAnexo: TMenuItem;
    mdPesquisa: TdxMemData;
    GridRecId: TcxGridDBColumn;
    Gridid_ticket: TcxGridDBColumn;
    GridValor: TcxGridDBColumn;
    GridEmissao: TcxGridDBColumn;
    GridConta: TcxGridDBColumn;
    GridNumero: TcxGridDBColumn;
    Gridsituacao: TcxGridDBColumn;
    GridHistorico: TcxGridDBColumn;
    Gridobs: TcxGridDBColumn;
    Gridmotivo: TcxGridDBColumn;
    Gridobs_cancelamento: TcxGridDBColumn;
    cxConta: TcxLookupComboBox;
    cxhistorico: TcxLookupComboBox;
    mdPesquisatem_anexo: TIntegerField;
    GridAnexo: TcxGridDBColumn;
    EdtDataInicial: TcxDateEdit;
    edtDataFinal: TcxDateEdit;
    Label5: TLabel;
    Label3: TLabel;
    EdtFiltropor: TcxComboBox;
    cxSituacao: TcxComboBox;
    cxtipo: TcxComboBox;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cxCusto: TcxLookupComboBox;
    Label9: TLabel;
    Label10: TLabel;
    TabConta: TClientDataSet;
    TabContaid_conta: TIntegerField;
    TabContacodigo: TIntegerField;
    TabContaagencia: TStringField;
    TabContaconta: TStringField;
    TabContacorrentista: TStringField;
    TabContabanco: TStringField;
    TabContanpesquisa: TStringField;
    dsconta: TUniDataSource;
    TabCusto: TClientDataSet;
    TabCustoid_custo: TIntegerField;
    TabCustodescricao: TStringField;
    TabCustocusto: TStringField;
    dsCusto: TUniDataSource;
    TabHistorico: TClientDataSet;
    TabHistoricoid_historico: TIntegerField;
    TabHistoricodescricao: TStringField;
    TabHistoriconpesquisa: TStringField;
    dsHistorico: TUniDataSource;
    mdPesquisaid_lancamento_bancario: TIntegerField;
    mdPesquisadata_emissao: TDateField;
    mdPesquisadata_competencia: TDateField;
    mdPesquisanumero: TStringField;
    mdPesquisavalor: TFloatField;
    mdPesquisatipo_movimento: TStringField;
    mdPesquisasituacao: TStringField;
    mdPesquisahistorico: TStringField;
    mdPesquisaconciliado: TStringField;
    mdPesquisacheque: TStringField;
    mdPesquisanhistorico: TStringField;
    mdPesquisanbanco: TStringField;
    GridTipo: TcxGridDBColumn;
    GridConciliado: TcxGridDBColumn;
    LerOFX1: TMenuItem;
    btnConciliar: TMenuItem;
    btnDesconciliar: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxtipoPropertiesChange(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure btnAnexoClick(Sender: TObject);
    procedure btnDesconciliarClick(Sender: TObject);
    procedure btnConciliarClick(Sender: TObject);
    procedure LerOFX1Click(Sender: TObject);
//    procedure btnAnexoClick(Sender: TObject);
    
  private
    procedure CarregarHistoricoportipo(AIndex: Integer);

    { Private declarations }
  public
    Procedure Novo        ;override;
    Procedure Pesquisa    ;override;
    Procedure Editar      ;override;
    Procedure Excluir     ;override;
//    Procedure Listagem    ;override;
//    Procedure Relatorio   ;override;
    { Public declarations }
  end;

var
  FrmControleBancario: TFrmControleBancario;
  Obj     : TLancamentoBancario;
implementation

{$R *.dfm}

uses Vcl.Navigation, UnitPrincipalNew,
  uJKDialog, System.DateUtils, Vcl.Session, System.IniFiles,
  Vcl.PermissaoUsuario, System.Generics.Collections;

{ TFrmControleBancario }

procedure TFrmControleBancario.cxtipoPropertiesChange(Sender: TObject);
begin
  inherited;
  if (cxtipo.Text<>'') or (cxtipo.ItemIndex <>-1) then
  CarregarHistoricoportipo(cxtipo.ItemIndex);
end;

procedure TFrmControleBancario.CarregarHistoricoportipo(AIndex: Integer);
begin
  case AIndex of
    0:begin
        TLookupHelper.CarregarLookup(
            TabHistorico,LookupHistoricoBancarioReceita);
        TabHistorico.First;
      end;
    1:begin
        TLookupHelper.CarregarLookup(
            TabHistorico,LookupHistoricoBancarioDespesa);
        TabHistorico.First;
      end;
  end;
end;

procedure TFrmControleBancario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmControleBancario  := Nil;
end;

procedure TFrmControleBancario.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;
end;

procedure TFrmControleBancario.FormShow(Sender: TObject);
var
IntervaloData :integer;
begin
  inherited;
  ParamsTela  := 'Controle Bancário';
  TitleText   := 'Controle Bancário';

  IntervaloData           := 0;
  IntervaloData           := StrToINt(TConeSul.LerValorIni(TConeSul.ndir, 'PARAMETRO', 'IntervaloData',''));

  EdtDataInicial.Date     := IncDay(Date, -IntervaloData);
  edtDataFinal.Date       := IncDay(Date, IntervaloData);
  EdtFiltropor.ItemIndex  := 0;
  cxSituacao.ItemIndex    := 0;
  cxtipo.ItemIndex        := 0;
  EdtBusca.Clear;
  cxConta.EditValue       := 0;
  cxhistorico.EditValue   := 0;
  cxCusto.EditValue       := 0;
  cxAtivo.ItemIndex       := 0;

  TLookupHelper.CarregarLookup(
                    TabConta,LookupContaBanco);
    TabConta.First;

  TLookupHelper.CarregarLookup(
                    TabCusto,LookupCustoSql);
    TabCusto.First;

end;

procedure TFrmControleBancario.LerOFX1Click(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  //ler ofx
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);
    if Permissao.TemPermissao('Permitir Ler OFX') then
    begin
      if not Assigned(FrmOFX) then
      FrmOFX := TFrmOFX.Create(Application);
      FrmOFX.ParamsStr  := 'N';
      FrmOFX.Show;
    end
    else
      JKDialog('Acesso Negado',
               'O seu perfil não tem permissão para utilizar.' + sLineBreak +
               'Por favor, entre em contato com o administrador do sistema.',
               tdAlerta);
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+sLineBreak+e.Message, tderro);
    end;
  end;
end;

procedure TFrmControleBancario.Novo;
begin
  inherited;
  if not Assigned(FrmLancamentoBancario) then
  FrmLancamentoBancario := TFrmLancamentoBancario.Create(Application);
  FrmLancamentoBancario.ParamsStr  := 'N';
  FrmLancamentoBancario.ShowModal;
end;

procedure TFrmControleBancario.Pesquisa;
var
List    : TObjectList<TLancamentoBancario>;
nNumero, nSituacao, nTipo, nCheque  : String;
AIdConta, AIdHistorico, AIdCusto    :Integer;
begin
  inherited;
  try
    List              := Nil;
    nNumero           := '';
    nSituacao         := '';
    nTipo             := '';
    nCheque           := '';
    AIdConta          := 0;
    AIdHistorico      := 0;
    AIdCusto          := 0;

    if trim(edtBusca.Text) <> '' then
    nNumero           := Trim(edtBusca.Text);

    case cxSituacao.ItemIndex of
      1:nSituacao := 'PENDENTE';
      2:nSituacao := 'CONCLUIDO';
    end;

    case cxtipo.ItemIndex of
      1:nTipo := 'C';
      2:nTipo := 'D';
    end;

    if cxconta.EditValue >0 then
    AIdConta    := cxconta.EditValue;

    if cxhistorico.EditValue >0 then
    AIdHistorico:= cxhistorico.EditValue;

    if cxcusto.EditValue >0 then
    AIdCusto    := cxcusto.EditValue;

    case cxativo.ItemIndex of
      1:nCheque:= 'SIM';
      2:nCheque:= 'NÃO';
    end;

    Try
      List  := TLancamentoBancarioController.ListarTodos(EdtFiltropor.Text, nNumero,nSituacao,nTipo,nCheque,
                                            EdtDataInicial.Date,edtDataFinal.Date,AIdConta,AIdHistorico,AIdCusto);

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

        mdPesquisaid_lancamento_bancario.AsInteger    := Item.id_lancamento_bancario;
        mdPesquisadata_emissao.AsDateTime             := Item.data_emissao;
        mdPesquisadata_competencia.AsDateTime         := Item.data_competencia;
        mdPesquisanumero.AsString                     := Item.numero;
        mdPesquisavalor.AsFloat                       := Item.valor;
        mdPesquisatipo_movimento.AsString             := Item.tipo_movimento;
        mdPesquisasituacao.AsString                   := Item.situacao;
        mdPesquisahistorico.AsString                  := Item.historico;
        mdPesquisaconciliado.AsString                 := Item.conciliado;
        mdPesquisacheque.AsString                     := Item.cheque;
        mdPesquisanhistorico.AsString                 := Item.nhistorico;
        mdPesquisanbanco.AsString                     := Item.nbanco;
        mdPesquisatem_anexo.AsInteger                 := Item.tem_anexo;

        mdPesquisa.Post;
      end;
      mdPesquisa.First;
      mdPesquisa.EnableControls;

    Finally
      if Assigned(List) then
        List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmControleBancario.btnAnexoClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);
    if Permissao.TemPermissao('Permitir Anexar') then
    begin
      if not mdPesquisa.Eof then
      begin

        if mdPesquisaid_lancamento_bancario.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;

        if JKDialog('Aviso', 'Deseja anexar no registro selecionado?', tdMensagem)  then
        begin
          if not Assigned(FrmAnexo) then
          FrmAnexo                  := TFrmAnexo.Create(Application);
          FrmAnexo.ParamsStr        := 'N';
          FrmAnexo.ATipoReferencia  := FrmControleBancario.Name;
          FrmAnexo.ARefTela         := ParamsTela;
          FrmAnexo.ParamsInt        := mdPesquisaid_lancamento_bancario.AsInteger;
          FrmAnexo.ShowModal;
        end;
      end
      else
      begin
        JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
      end;
    end
    else
      JKDialog('Acesso Negado',
               'O seu perfil não tem permissão para utilizar.' + sLineBreak +
               'Por favor, entre em contato com o administrador do sistema.',
               tdAlerta);
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+sLineBreak+e.Message, tderro);
    end;
  end;

end;

procedure TFrmControleBancario.btnConciliarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  //Conciliar registro
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);
    if Permissao.TemPermissao('Permitir Conciliar') then
    begin
      if not mdPesquisa.Eof then
      begin

        if mdPesquisaid_lancamento_bancario.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;

        if (SameText(mdPesquisaconciliado.AsString, 'S')) and SameText(mdPesquisasituacao.AsString, 'CONCLUIDO') then
        begin
          JKDialog('Alerta','Não é permitido conciliar um lançamento concluido.', tdAlerta);
          exit;
        end;

        if JKDialog('Aviso', 'Deseja conciliar o registro selecionado?', tdMensagem)  then
        begin
          if not Assigned(FrmLancamentoBancario) then
          FrmLancamentoBancario := TFrmLancamentoBancario.Create(Application);
          FrmLancamentoBancario.ParamsStr  := 'C';
          FrmLancamentoBancario.ParamsInt  := mdPesquisaid_lancamento_bancario.AsInteger;
          FrmLancamentoBancario.Show;
          Pesquisa;
        end;
      end
      else
      begin
        JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
      end;
    end
    else
      JKDialog('Acesso Negado',
               'O seu perfil não tem permissão para utilizar.' + sLineBreak +
               'Por favor, entre em contato com o administrador do sistema.',
               tdAlerta);
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+sLineBreak+e.Message, tderro);
    end;
  end;
end;

procedure TFrmControleBancario.btnDesconciliarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  //desconciliar registro
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);
    if Permissao.TemPermissao('Permitir Desconciliar') then
    begin
      if not mdPesquisa.Eof then
      begin

        if mdPesquisaid_lancamento_bancario.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;

        if (SameText(mdPesquisaconciliado.AsString, 'N')) and SameText(mdPesquisasituacao.AsString, 'PENDENTE') then
        begin
          JKDialog('Alerta','Não é permitido desconciliar um lançamento pendente.', tdAlerta);
          exit;
        end;

        if JKDialog('Aviso', 'Deseja desconciliar o registro selecionado?', tdMensagem)  then
        begin
          if TLancamentoBancarioController.Desconciliar(TSession.IDEMPRESA,
                                                    mdPesquisaid_lancamento_bancario.AsInteger,
                                                    TSession.ID_USUARIO) then
          begin
            Pesquisa;
            JKDialog('Sucesso','Registro desconciliado com sucesso!', tdsucesso);
          end;

        end;
      end
      else
      begin
        JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
      end;
    end
    else
      JKDialog('Acesso Negado',
               'O seu perfil não tem permissão para utilizar.' + sLineBreak +
               'Por favor, entre em contato com o administrador do sistema.',
               tdAlerta);
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+sLineBreak+e.Message, tderro);
    end;
  end;

end;

procedure TFrmControleBancario.BtnLimparClick(Sender: TObject);
var
IntervaloData:Integer;
begin
  inherited;
  IntervaloData := 0;
  IntervaloData := StrToINt(TConeSul.LerValorIni(TConeSul.ndir, 'PEDIDO', 'IntervaloData',''));

  EdtDataInicial.Date     := IncDay(Date, -IntervaloData);
  edtDataFinal.Date       := IncDay(Date, IntervaloData);
  EdtFiltropor.ItemIndex  := 0;
  cxSituacao.ItemIndex    := 0;
  cxtipo.ItemIndex        := 0;
  EdtBusca.Clear;
  cxConta.EditValue       := 0;
  cxhistorico.EditValue   := 0;
  cxCusto.EditValue       := 0;
  cxAtivo.ItemIndex       := 0;
end;

procedure TFrmControleBancario.Editar;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if mdPesquisaid_lancamento_bancario.AsInteger = 0 then
      begin
        JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
        exit;
      end;

      if (SameText(mdPesquisaconciliado.AsString, 'S')) and SameText(mdPesquisasituacao.AsString, 'CONCLUIDO') then
      begin
        JKDialog('Alerta','Não é permitido editar um lançamento concluido/conciliado.', tdAlerta);
        exit;
      end;

      if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
      begin
        if not Assigned(FrmLancamentoBancario) then
        FrmLancamentoBancario := TFrmLancamentoBancario.Create(Application);
        FrmLancamentoBancario.ParamsStr  := 'E';
        FrmLancamentoBancario.ParamsInt  := mdPesquisaid_lancamento_bancario.AsInteger;

        FrmLancamentoBancario.Show;
        Pesquisa;
      end;
    end
    else
    begin
      JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+sLineBreak+e.Message, tderro);
    end;
  end;
end;

procedure TFrmControleBancario.Excluir;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin

      if mdPesquisaid_lancamento_bancario.AsInteger = 0 then
      begin
        JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
        exit;
      end;

      if (SameText(mdPesquisaconciliado.AsString, 'S')) and SameText(mdPesquisasituacao.AsString, 'CONCLUIDO') then
      begin
        JKDialog('Alerta','Não é permitido excluir um lançamento concluido/conciliado.', tdAlerta);
        exit;
      end;

      if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
      begin
        if TLancamentoBancarioController.Excluir(mdPesquisaid_lancamento_bancario.AsInteger,
                                                 Tsession.ID_USUARIO, TSession.IDEMPRESA,
                                                 FrmControleBancario.Name) then
        begin
          Pesquisa;
          JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
        end;
      end;
    end
    else
    begin
      JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+sLineBreak +e.Message, tderro);
    end;
  end;
end;

//procedure TFrmControleBancario.Listagem;
//begin
//  inherited;
//
//end;
//
//procedure TFrmControleBancario.Relatorio;
//begin
//  inherited;
//
//end;

end.


