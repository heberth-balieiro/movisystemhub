unit UniProfissaoCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseCadCons, cxGraphics, cxControls,
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
  dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData,
  DBAccess, Uni, Vcl.Menus, ACBrBase, ACBrEnterTab, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxCheckBox, cxTextEdit, cxGroupBox, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, uJKDialog, UDM, Vcl.Session,
  Vcl.Navigation, Model.SindProfissao, Vcl.Validacoes, APP.Asmuv, Vcl.Loading,
  UnitBaseNovoCadastro, Vcl.ButtonStylesAttributes, Vcl.StyledButton, dxBevel,Controller_Sindicato_profissao,
  Model.Sindicato_Profissao,System.Generics.Collections, dxmdaset;

type
  TFrmProfissaoCad = class(TFormNovoBaseCadastro)
    Label1: TLabel;
    cxCodigo: TcxTextEdit;
    Label3: TLabel;
    cxNome: TcxTextEdit;
    Btneditar: TStyledBitBtn;
    cxGrid: TcxGrid;
    Grid: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    gbAtivo: TcxGroupBox;
    cxAtivo: TcxCheckBox;
    mdDados: TdxMemData;
    mdDadosid_profissao: TIntegerField;
    mdDadoscodigo: TIntegerField;
    mdDadosdescricao: TStringField;
    mdDadosativo: TStringField;
    GridRecId: TcxGridDBColumn;
    Gridid_profissao: TcxGridDBColumn;
    Gridcodigo: TcxGridDBColumn;
    Griddescricao: TcxGridDBColumn;
    Gridativo: TcxGridDBColumn;
    btnSincronizar: TSpeedButton;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtneditarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure cxCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnSincronizarClick(Sender: TObject);
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
  FrmProfissaoCad: TFrmProfissaoCad;
  ContPro         : TSindicato_profissaoController;
  ObjPro          : TSindicato_Profissao;
implementation

{$R *.dfm}

uses uConfiguracaoService, Vcl.PermissaoUsuario;

{ TFrmProfissaoCad }

procedure TFrmProfissaoCad.AcaoBtn;
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

procedure TFrmProfissaoCad.BtnCancelarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);
    if Permissao.TemPermissao('Permitir Excluir') then
    begin
      if not mdDados.Eof then
      begin
        if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
        begin

          ContPro    := Nil;
          ContPro    := TSindicato_profissaoController.Create;
          Try
            if ContPro.ExcluidoCancelado(mdDadosid_profissao.AsInteger, Tsession.ID_USUARIO) then
            JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
            CarregarGrid;
            if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
            begin
              TConfiguracaoService.SincronizarGravar(3, mdDadosid_profissao.AsInteger);
            end;
          Finally
            FreeAndNil(ContPro);
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

procedure TFrmProfissaoCad.BtneditarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);
    if Permissao.TemPermissao('Permitir Editar') then
    begin
      if not mdDados.Eof then
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

procedure TFrmProfissaoCad.BtnSalvarClick(Sender: TObject);
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

procedure TFrmProfissaoCad.btnSincronizarClick(Sender: TObject);
var
Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Profissão');

    if Permissao.TemPermissao('Permitir Sincronizar API') then
    begin
      if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
      begin
        //Incluir os cadastro para sincronizar
        ContPro := TSindicato_profissaoController.Create;

        Try
          if ContPro.IncluiRegistroSincronizar then
          begin
            TConfiguracaoService.SincronizarGravar(3, 0);
            JKDialog('Sucesso','Sincronização em execução. Você pode continuar usando o sistema!', tdSucesso);
          end
          else
          JKDialog('Aviso','Comando não execultado!', tdAlerta);

        Finally
          FreeAndNil(ContPro);
        End;

      end;
    end
    else
      JKDialog('Acesso Negado',
               'O seu perfil não tem permissão para utilizar.' + sLineBreak +
               'Por favor, entre em contato com o administrador do sistema.',
               tdAlerta);
  except on E: Exception do
    JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
  end;
end;

procedure TFrmProfissaoCad.CarregarGrid;
var
List    : TObjectList<TSindicato_Profissao>;
begin
  try
    List    := Nil;
    ContPro := TSindicato_profissaoController.Create;
    Try
      List  := ContPro.ListarTodos('', '');
      mdDados.Close;
      mdDados.FieldDefs.Clear;

      if (List = nil) or (List.Count = 0) then
      begin
        mdDados.Close;
        JKDialog('Aviso','Nenhum registro encontrado!', tdAlerta);
        exit;
      end;

      if not mdDados.Active then
      mdDados.Open;

      mdDados.DisableControls;

      for var Item in List do
      begin
        mdDados.Append;
        mdDadosid_profissao.AsInteger := Item.id_profissao;
        mdDadoscodigo.AsInteger       := Item.codigo;
        mdDadosdescricao.AsString     := Item.descricao;
        mdDadosativo.AsString         := Item.ativo;
        mdDados.Post;

      end;
      mdDados.First;
      mdDados.EnableControls;
    Finally
      FreeAndNil(ContPro);
      if Assigned(List) then
      List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmProfissaoCad.cxCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0'..'9', #8, ^V, ^C, ^X]) then
        Key := #0;
end;

procedure TFrmProfissaoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmProfissaoCad := nil;
end;

procedure TFrmProfissaoCad.FormCreate(Sender: TObject);
begin
  inherited;
  ParamsStr := 'N';
  ParamsTela:= 'Profissão';

   if not mddados.Active then
   begin
    mddados.Open;
   end;
end;

procedure TFrmProfissaoCad.FormShow(Sender: TObject);
begin
  inherited;
  try

    if ParamsStr = 'N' then
    begin
      TitleText   := 'Nova Profissão';
      cxNome.SetFocus;
    end;

    CarregarGrid;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmProfissaoCad.GridCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if not mdDados.Eof then
  begin
    ParamsInt := mddadosid_profissao.AsInteger;
  end;
end;

procedure TFrmProfissaoCad.LimparCampos;
begin
  cxCodigo.Clear;
  cxNome.Clear;
  cxativo.EditValue := 'S';
end;

procedure TFrmProfissaoCad.PopularCampos;
begin
  inherited;
  try
    ContPro := nil;
    ObjPro  := nil;

    ContPro := TSindicato_profissaoController.Create;
    ObjPro  := TSindicato_Profissao.Create;

    try
      ObjPro     := ContPro.BuscarPorID(ParamsInt);

      cxCodigo.EditValue    := ObjPro.codigo;
      cxNome.EditValue      := ObjPro.descricao;
      cxativo.EditValue     := ObjPro.ativo;
      cxnome.SetFocus;
      ParamsStr := 'E';
    finally
      FreeAndNil(ContPro);
      FreeandNil(ObjPro);
    end;
  except on E: Exception do
    raise
  end;
end;

function TFrmProfissaoCad.Salvar(out msg: string): Boolean;
var
AID:Integer;
begin
  try
    Result  := False;
    ContPro := nil;
    ObjPro  := nil;

    ContPro := TSindicato_profissaoController.Create;
    ObjPro  := TSindicato_Profissao.Create;

    Try
      if ParamsStr = 'N' then
      ObjPro.id_profissao    := 0
      else
      ObjPro.id_profissao       := ParamsInt;
      ObjPro.descricao          := Trim(cxNome.Text);
      ObjPro.id_empresa         := TSession.IDEMPRESA;
      ObjPro.id_usuario         := Tsession.ID_USUARIO;
      ObjPro.ativo              := cxAtivo.EditValue;
      ObjPro.sinc_app           := 'S';

      if ContPro.Salvar(ObjPro,AID) then
      begin
        Result  := true;
        msg:= 'Registro inserido com sucesso.';
        CarregarGrid;
        LimparCampos;
        cxnome.SetFocus;
        ParamsStr:= 'N';
        if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
        begin
          TConfiguracaoService.SincronizarGravar(3, AID);
        end;
        ParamsCloseTela := 'N';
      end;
    Finally
      FreeAndNil(ContPro);
      FreeAndNil(ObjPro);
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmProfissaoCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if cxNome.text='' then
  begin
    msg     := 'Informe o nome da empresa!';
    Result  := False;
    exit;
  end;
end;

end.
