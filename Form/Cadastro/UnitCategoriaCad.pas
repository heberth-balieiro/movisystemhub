unit UnitCategoriaCad;

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
  Controller.Categoria, Model.categoria, dxmdaset,System.Generics.Collections,
  uJKDialog, Vcl.Session;

type
  TFrmCategoriaCad = class(TFormNovoBaseCadastro)
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
    mdSituacaoid_categoria: TIntegerField;
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
  FrmCategoriaCad: TFrmCategoriaCad;
  ObjSituacao       : TCategoria;
implementation

{$R *.dfm}

uses Vcl.PermissaoUsuario;


{ TFrmTipoSituacaoCad }

procedure TFrmCategoriaCad.AcaoBtn;
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

procedure TFrmCategoriaCad.CarregarGrid;
var
List    : TObjectList<TCategoria>;
begin
  try
    List    := Nil;
    Try
      List  := TCategoriaController.ListarTodos('', '');
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

        mdSituacaoid_categoria.AsInteger  := item.id_categoria;
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

procedure TFrmCategoriaCad.cxCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0'..'9', #8, ^V, ^C, ^X]) then
        Key := #0;
end;

procedure TFrmCategoriaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmCategoriaCad  := nil;
end;

procedure TFrmCategoriaCad.FormCreate(Sender: TObject);
begin
  inherited;
  ParamsStr := 'N';
  ParamsTela:= 'Categoria';

   if not mdSituacao.Active then
   begin
    mdSituacao.Open;
   end;
end;

procedure TFrmCategoriaCad.FormShow(Sender: TObject);
begin
  inherited;
  try

    if ParamsStr = 'N' then
    begin
      TitleText   := 'Nova Categoria';
      cxNome.SetFocus;
    end;

    CarregarGrid;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmCategoriaCad.GridCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if not mdSituacao.Eof then
  begin
    ParamsInt := mdSituacaoid_categoria.AsInteger;
  end;
end;

procedure TFrmCategoriaCad.LimparCampos;
begin
  cxCodigo.Clear;
  cxNome.Clear;
  cxativo.EditValue := 'S';
end;

procedure TFrmCategoriaCad.PopularCampos;
begin
  inherited;
  try
    ObjSituacao  := nil;
    ObjSituacao  := TCategoria.Create;

    try
      ObjSituacao  := TCategoriaController.BuscarPorID(ParamsInt);

      cxCodigo.EditValue    := ObjSituacao.id_categoria;
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

function TFrmCategoriaCad.Salvar(out msg: string): Boolean;
var
AID:Integer;
AStr:String;
begin
  try
    Result        := False;
    ObjSituacao   := nil;
    ObjSituacao   := TCategoria.Create;

    Try
      if ParamsStr = 'N' then
      begin
        ObjSituacao.id_categoria   := 0;
        ObjSituacao.descricao     := Trim(cxNome.Text);
        ObjSituacao.ativo         := cxAtivo.EditValue;
        ObjSituacao.id_empresa    := TSession.idempresa;
        ObjSituacao.id_usuario    := Tsession.ID_USUARIO;
      end
      else
      begin
        ObjSituacao.id_categoria  := ParamsInt;
        ObjSituacao.descricao     := Trim(cxNome.Text);
        ObjSituacao.ativo         := cxAtivo.EditValue;
        ObjSituacao.id_usuario_alt:= Tsession.ID_USUARIO;
      end;

      if TCategoriaController.Salvar(ObjSituacao, AID, AStr) then
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

procedure TFrmCategoriaCad.BtnCancelarClick(Sender: TObject);
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
            if TCategoriaController.Excluir(mdSituacaoid_categoria.AsInteger, Tsession.ID_USUARIO, TSession.idempresa) then
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

procedure TFrmCategoriaCad.BtneditarClick(Sender: TObject);
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


procedure TFrmCategoriaCad.BtnSalvarClick(Sender: TObject);
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

function TFrmCategoriaCad.ValidarCampos(out msg: string): Boolean;
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
