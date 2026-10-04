unit UnitHistoricoBancario;

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
  dxSkinXmas2008Blue, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxDateRanges, dxScrollbarAnnotations, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxGridCustomView, cxGrid,
  cxCheckBox, cxGroupBox, cxTextEdit,
  Controller.HistoricoBancario, Model.historicobancario, dxmdaset,System.Generics.Collections,
  uJKDialog, Vcl.Session, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, Datasnap.DBClient, UnitGlobal,
  Controller.LookupHelper;

type
  TFrmHistoricoBancario = class(TFormNovoBaseCadastro)
    Label1: TLabel;
    cxCodigo: TcxTextEdit;
    Label3: TLabel;
    cxNome: TcxTextEdit;
    Btneditar: TStyledBitBtn;
    cxGrid: TcxGrid;
    Grid: TcxGridDBTableView;
    GridRecId: TcxGridDBColumn;
    Gridid_secretaria: TcxGridDBColumn;
    Gridcodigo: TcxGridDBColumn;
    Gridrazao: TcxGridDBColumn;
    Gridativo: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    mdSituacao: TdxMemData;
    cxTipo: TcxComboBox;
    Label2: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    cxplano: TcxLookupComboBox;
    cxcusto: TcxLookupComboBox;
    cxAtivo: TcxCheckBox;
    GridColumn1: TcxGridDBColumn;
    mdSituacaoid_historico: TIntegerField;
    mdSituacaodescricao: TStringField;
    mdSituacaotipo: TStringField;
    mdSituacaoativo: TStringField;
    TabPlano: TClientDataSet;
    TabCusto: TClientDataSet;
    dsPlano: TUniDataSource;
    dsCusto: TUniDataSource;
    TabCustoid_custo: TIntegerField;
    TabCustodescricao: TStringField;
    TabCustocusto: TStringField;
    TabPlanoid_planoconta: TIntegerField;
    TabPlanocodigo: TStringField;
    TabPlanonivel: TIntegerField;
    TabPlanoDESCRICAO_COMPLETA: TStringField;
    procedure BtneditarClick(Sender: TObject);
    procedure cxCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure cxTipoPropertiesChange(Sender: TObject);
  private
    Procedure LimparCampos;
    Procedure CarregarGrid;
    Procedure AcaoBtn;
    Procedure CarregarPlano(AIndex:integer);
    { Private declarations }
  public
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;

    { Public declarations }
  end;

var
  FrmHistoricoBancario: TFrmHistoricoBancario;
  Obj                 : THistoricoBancario;
implementation

{$R *.dfm}

uses Vcl.PermissaoUsuario;


{ TFrmHistoricoBancario }

procedure TFrmHistoricoBancario.AcaoBtn;
begin
  if ParamsStr='E' then
  begin
    BtnEditar.Enabled   := False;
    BtnCancelar.Enabled := False;
    BtnSalvar.Enabled   := true;
  end
  else
  begin
    btnEditar.Enabled   := true;
    BtnCancelar.Enabled := True;
  end;
end;

procedure TFrmHistoricoBancario.CarregarGrid;
var
List    : TObjectList<THistoricoBancario>;
begin
  try
    List    := Nil;
    Try
      List  := THistoricoBancarioController.ListarTodos;
      mdSituacao.Close;
      mdSituacao.FieldDefs.Clear;

      if (List = nil) or (List.Count = 0) then
      begin
        mdSituacao.Close;
        exit;
      end;

      if not mdSituacao.Active then
      mdSituacao.Open;

      mdSituacao.DisableControls;

      for var Item in List do
      begin
        mdSituacao.Append;

        mdSituacaoid_historico.AsInteger  := item.id_historico;
        mdSituacaodescricao.AsString      := item.descricao;
        mdSituacaotipo.AsString           := item.ntipo;
        mdSituacaoativo.AsString          := item.ativo;

        mdSituacao.Post;

      end;
      mdSituacao.First;
      mdSituacao.EnableControls;


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

procedure TFrmHistoricoBancario.CarregarPlano(AIndex: integer);
begin
  case AIndex of
    0:begin
        TLookupHelper.CarregarLookup(
          TabPlano,LookupPlanoContaRecSql);
      end;
    1:begin
        TLookupHelper.CarregarLookup(
          TabPlano,LookupPlanoContaDesSql);
      end;
    2:begin
        TLookupHelper.CarregarLookup(
          TabPlano,LookupPlanoContaAmbosSql);
      end;
  end;
end;

procedure TFrmHistoricoBancario.cxCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0'..'9', #8, ^V, ^C, ^X]) then
        Key := #0;
end;

procedure TFrmHistoricoBancario.cxTipoPropertiesChange(Sender: TObject);
begin
  if (cxtipo.Text <> '') or (cxtipo.ItemIndex <> -1) then
  CarregarPlano(cxtipo.ItemIndex);
end;

procedure TFrmHistoricoBancario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmHistoricoBancario  := nil;
end;

procedure TFrmHistoricoBancario.FormCreate(Sender: TObject);
begin
  inherited;
  ParamsStr := 'N';
  ParamsTela:= 'Histórico Bancário';

   if not mdSituacao.Active then
   begin
    mdSituacao.Open;
   end;
end;

procedure TFrmHistoricoBancario.FormShow(Sender: TObject);
begin
  inherited;
  try
    TLookupHelper.CarregarLookup(
      TabCusto,LookupCustoSql);

    cxtipo.ItemIndex  := 0;
    CarregarPlano(0);

    if ParamsStr = 'N' then
    begin
      TitleText   := 'Histórico Bancário';
      cxNome.SetFocus;
    end;

    CarregarGrid;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmHistoricoBancario.GridCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if not mdSituacao.Eof then
  begin
    ParamsInt := mdSituacaoid_historico.AsInteger;
  end;
end;

procedure TFrmHistoricoBancario.LimparCampos;
begin
  cxCodigo.Clear;
  cxNome.Clear;
  cxtipo.ItemIndex  := -1;
  cxplano.EditValue := 0;
  cxcusto.EditValue := 0;
  cxativo.EditValue := 'S';
end;

procedure TFrmHistoricoBancario.PopularCampos;
begin
  inherited;
  try
    Obj  := nil;
    Obj  := THistoricoBancario.Create;

    try
      Obj  := THistoricoBancarioController.BuscarPorID(ParamsInt);

      cxCodigo.EditValue    := Obj.id_historico;
      cxNome.EditValue      := Obj.descricao;
      cxtipo.ItemIndex      := obj.tipo;
      cxplano.EditValue     := obj.id_planoconta;
      cxcusto.EditValue     := obj.id_custo;
      cxativo.EditValue     := Obj.ativo;
      cxnome.SetFocus;
      ParamsStr := 'E';
    finally
      FreeandNil(Obj);
    end;
  except on E: Exception do
    raise
  end;
end;

function TFrmHistoricoBancario.Salvar(out msg: string): Boolean;
var
AID:Integer;
AStr:String;
begin
  try
    Result  := False;
    Obj     := nil;
    Obj     := THistoricoBancario.Create;

    Try
      if ParamsStr = 'N' then
      begin
        Obj.id_historico          := 0;
        Obj.descricao             := Trim(cxNome.Text);
        obj.tipo                  := cxtipo.ItemIndex;
        obj.id_planoconta         := cxplano.EditValue;
        obj.id_custo              := cxcusto.EditValue;
        Obj.ativo                 := cxAtivo.EditValue;
        Obj.id_empresa            := TSession.idempresa;
        Obj.id_usuario            := Tsession.ID_USUARIO;
      end
      else
      begin
        Obj.id_historico          := ParamsInt;
        Obj.descricao             := Trim(cxNome.Text);
        obj.tipo                  := cxtipo.ItemIndex;
        obj.id_planoconta         := cxplano.EditValue;
        obj.id_custo              := cxcusto.EditValue;
        Obj.ativo                 := cxAtivo.EditValue;
        Obj.id_usuario_alt        := Tsession.ID_USUARIO;
      end;

      if THistoricoBancarioController.Salvar(Obj, AID, AStr) then
      begin
        Result  := true;
        msg:= 'Registro inserido com sucesso.';
        CarregarGrid;
        LimparCampos;
        cxnome.SetFocus;
        ParamsStr       := 'N';
        ParamsCloseTela := 'N';
      end
      else
      begin
        ParamsMsgTela := 'S';
        msg           := AStr;
        Result        := False;
        cxnome.SetFocus;
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

procedure TFrmHistoricoBancario.BtnCancelarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);
    if Permissao.TemPermissao('Permitir Excluir') then
    begin
      if not mdSituacao.Eof then
      begin
        if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
        begin

          Try
            if THistoricoBancarioController.Excluir(mdSituacaoid_historico.AsInteger, Tsession.ID_USUARIO, TSession.idempresa) then
            JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
          Finally
            CarregarGrid;
          End;
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
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmHistoricoBancario.BtneditarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);
    if Permissao.TemPermissao('Permitir Editar') then
    begin
      if not mdSituacao.Eof then
      begin
        if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
        begin
          PopularCampos;
          AcaoBtn;
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
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmHistoricoBancario.BtnSalvarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

  if Permissao.TemPermissao('Permitir Criar Novo') then
  begin
    inherited;
    AcaoBtn;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

function TFrmHistoricoBancario.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if cxNome.text='' then
  begin
    msg     := 'Informe uma descrição!';
    Result  := False;
    exit;
  end;

  if (cxtipo.Text='') or (cxtipo.ItemIndex=-1) then
  begin
    msg     := 'Selecione o tipo do histórico!';
    Result  := False;
    exit;
  end;

  if (cxplano.Text='') or (cxplano.EditValue=0) then
  begin
    msg     := 'Selecione um plano de contas!';
    Result  := False;
    exit;
  end;

  if (cxcusto.Text='') or (cxcusto.EditValue=0) then
  begin
    msg     := 'Selecione um centro de custo!';
    Result  := False;
    exit;
  end;

end;

end.
