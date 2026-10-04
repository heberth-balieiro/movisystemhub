unit UnitTipoSituacaoCad;

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
  Controller.TipoSituacao, Model.TipoSituacao, dxmdaset,System.Generics.Collections,
  uJKDialog, Vcl.Session;

type
  TFrmTipoSituacaoCad = class(TFormNovoBaseCadastro)
    Label1: TLabel;
    cxCodigo: TcxTextEdit;
    Label3: TLabel;
    cxNome: TcxTextEdit;
    gbAtivo: TcxGroupBox;
    cxAtivo: TcxCheckBox;
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
    mdSituacaoid_situacao: TIntegerField;
    mdSituacaodescricao: TStringField;
    mdSituacaoativo: TStringField;
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
  private
    Procedure LimparCampos;
    Procedure CarregarGrid;
    Procedure AcaoBtn;

    { Private declarations }
  public
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;

    { Public declarations }
  end;

var
  FrmTipoSituacaoCad: TFrmTipoSituacaoCad;
  ObjSituacao       : TTipoSituacao;
implementation

{$R *.dfm}

uses Vcl.PermissaoUsuario;


{ TFrmTipoSituacaoCad }

procedure TFrmTipoSituacaoCad.AcaoBtn;
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

procedure TFrmTipoSituacaoCad.CarregarGrid;
var
List    : TObjectList<TTipoSituacao>;
begin
  try
    List    := Nil;
    Try
      List  := TTipoSituacaoController.ListarTodos('', '');
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

        mdSituacaoid_situacao.AsInteger   := item.id_situacao;
        mdSituacaodescricao.AsString      := item.descricao;
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

procedure TFrmTipoSituacaoCad.cxCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0'..'9', #8, ^V, ^C, ^X]) then
        Key := #0;
end;

procedure TFrmTipoSituacaoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmTipoSituacaoCad  := nil;
end;

procedure TFrmTipoSituacaoCad.FormCreate(Sender: TObject);
begin
  inherited;
  ParamsStr := 'N';
  ParamsTela:= 'Tipo Situação';

   if not mdSituacao.Active then
   begin
    mdSituacao.Open;
   end;
end;

procedure TFrmTipoSituacaoCad.FormShow(Sender: TObject);
begin
  inherited;
  try

    if ParamsStr = 'N' then
    begin
      TitleText   := 'Nova Situação';
      cxNome.SetFocus;
    end;

    CarregarGrid;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmTipoSituacaoCad.GridCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if not mdSituacao.Eof then
  begin
    ParamsInt := mdSituacaoid_situacao.AsInteger;
  end;
end;

procedure TFrmTipoSituacaoCad.LimparCampos;
begin
  cxCodigo.Clear;
  cxNome.Clear;
  cxativo.EditValue := 'S';
end;

procedure TFrmTipoSituacaoCad.PopularCampos;
begin
  inherited;
  try
    ObjSituacao  := nil;
    ObjSituacao  := TTipoSituacao.Create;

    try
      ObjSituacao  := TTipoSituacaoController.BuscarPorID(ParamsInt);

      cxCodigo.EditValue    := ObjSituacao.id_situacao;
      cxNome.EditValue      := ObjSituacao.descricao;
      cxativo.EditValue     := ObjSituacao.ativo;
      cxnome.SetFocus;
      ParamsStr := 'E';
    finally
      FreeandNil(ObjSituacao);
    end;
  except on E: Exception do
    raise
  end;
end;

function TFrmTipoSituacaoCad.Salvar(out msg: string): Boolean;
var
AID:Integer;
AStr:String;
begin
  try
    Result        := False;
    ObjSituacao   := nil;
    ObjSituacao   := TTipoSituacao.Create;

    Try
      if ParamsStr = 'N' then
      begin
        ObjSituacao.id_situacao   := 0;
        ObjSituacao.descricao     := Trim(cxNome.Text);
        ObjSituacao.ativo         := cxAtivo.EditValue;
        ObjSituacao.id_empresa    := TSession.idempresa;
        ObjSituacao.id_usuario    := Tsession.ID_USUARIO;
      end
      else
      begin
        ObjSituacao.id_situacao   := ParamsInt;
        ObjSituacao.descricao     := Trim(cxNome.Text);
        ObjSituacao.ativo         := cxAtivo.EditValue;
        ObjSituacao.id_usuario_alt:= Tsession.ID_USUARIO;
      end;

      if TTipoSituacaoController.Salvar(ObjSituacao, AID, AStr) then
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
      FreeAndNil(ObjSituacao);
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmTipoSituacaoCad.BtnCancelarClick(Sender: TObject);
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
            if TTipoSituacaoController.Excluir(mdSituacaoid_situacao.AsInteger, Tsession.ID_USUARIO, TSession.idempresa) then
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

procedure TFrmTipoSituacaoCad.BtneditarClick(Sender: TObject);
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





procedure TFrmTipoSituacaoCad.BtnSalvarClick(Sender: TObject);
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

function TFrmTipoSituacaoCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if cxNome.text='' then
  begin
    msg     := 'Informe um nome!';
    Result  := False;
    exit;
  end;
end;

end.
