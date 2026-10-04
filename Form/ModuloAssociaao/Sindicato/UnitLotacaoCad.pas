unit UnitLotacaoCad;

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
  Vcl.Buttons, Vcl.ExtCtrls, UDM, uJKDialog, Vcl.Session, Vcl.Navigation,
  Model.SindLotacao, Vcl.Validacoes, UnitBaseNovoCadastro,
  Vcl.ButtonStylesAttributes, Vcl.StyledButton, dxBevel, dxmdaset,
  Model.Sindicato_Lotacao,Controller_Sindicato_Lotacao,System.Generics.Collections;

type
  TFrmLotacaoCad = class(TFormNovoBaseCadastro)
    gbAtivo: TcxGroupBox;
    cxAtivo: TcxCheckBox;
    cxNome: TcxTextEdit;
    Label3: TLabel;
    cxCodigo: TcxTextEdit;
    Label1: TLabel;
    Btneditar: TStyledBitBtn;
    cxGrid: TcxGrid;
    Grid: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    mdDados: TdxMemData;
    mdDadosid_lotacao: TIntegerField;
    mdDadoscodigo: TIntegerField;
    mdDadosdescricao: TStringField;
    mdDadosativo: TStringField;
    GridRecId: TcxGridDBColumn;
    Gridid_lotacao: TcxGridDBColumn;
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
  FrmLotacaoCad: TFrmLotacaoCad;
  ContLoc     : TSindicato_LotacaoController;
  ObjLoc      : TSindicato_Lotacao;
implementation

{$R *.dfm}

uses uConfiguracaoService, Vcl.PermissaoUsuario;

{ TFrmLotacaoCad }

procedure TFrmLotacaoCad.AcaoBtn;
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

procedure TFrmLotacaoCad.BtnCancelarClick(Sender: TObject);
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

          ContLoc    := Nil;
          ContLoc    := TSindicato_LotacaoController.Create;
          Try
            if ContLoc.ExcluidoCancelado(mdDadosid_lotacao.AsInteger, Tsession.ID_USUARIO) then
            JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
            CarregarGrid;
            if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
            begin
              TConfiguracaoService.SincronizarGravar(2, mdDadosid_lotacao.AsInteger);
            end;
          Finally
            FreeAndNil(ContLoc);
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

procedure TFrmLotacaoCad.BtneditarClick(Sender: TObject);
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

procedure TFrmLotacaoCad.BtnSalvarClick(Sender: TObject);
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

procedure TFrmLotacaoCad.btnSincronizarClick(Sender: TObject);
var
Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Lotação');

    if Permissao.TemPermissao('Permitir Sincronizar API') then
    begin
      if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
      begin
        //Incluir os cadastro para sincronizar
        ContLoc := TSindicato_LotacaoController.Create;

        Try
          if ContLoc.IncluiRegistroSincronizar then
          begin
            TConfiguracaoService.SincronizarGravar(2, 0);
            JKDialog('Sucesso','Sincronização em execução. Você pode continuar usando o sistema!', tdSucesso);
          end
          else
          JKDialog('Aviso','Comando não execultado!', tdAlerta);

        Finally
          FreeAndNil(ContLoc);
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

procedure TFrmLotacaoCad.CarregarGrid;
var
List    : TObjectList<TSindicato_Lotacao>;
begin
  try
    List    := Nil;
    ContLoc := TSindicato_LotacaoController.Create;
    Try
      List  := ContLoc.ListarTodos('', '');
      mdDados.Close;
      mdDados.FieldDefs.Clear;

      if (List = nil) or (List.Count = 0) then
      begin
        mdDados.Close;

        exit;
      end;

      if not mdDados.Active then
      mdDados.Open;

      mdDados.DisableControls;

      for var Item in List do
      begin
        mdDados.Append;
        mdDadosid_lotacao.AsInteger := Item.id_lotacao;
        mdDadoscodigo.AsInteger       := Item.codigo;
        mdDadosdescricao.AsString     := Item.descricao;
        mdDadosativo.AsString         := Item.ativo;
        mdDados.Post;

      end;
      mdDados.First;
      mdDados.EnableControls;
    Finally
      FreeAndNil(ContLoc);
      if Assigned(List) then
      List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmLotacaoCad.cxCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0'..'9', #8, ^V, ^C, ^X]) then
        Key := #0;
end;

procedure TFrmLotacaoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmLotacaoCad :=nil;
end;

procedure TFrmLotacaoCad.FormCreate(Sender: TObject);
begin
  inherited;
  ParamsStr := 'N';
  ParamsTela:= 'Lotação';

   if not mddados.Active then
   begin
    mddados.Open;
   end;
end;

procedure TFrmLotacaoCad.FormShow(Sender: TObject);
begin
  inherited;
  try

    if ParamsStr = 'N' then
    begin
      TitleText   := 'Nova Lotação';
      cxNome.SetFocus;
    end;

    CarregarGrid;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmLotacaoCad.GridCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if not mdDados.Eof then
  begin
    ParamsInt := mddadosid_lotacao.AsInteger;
  end;
end;

procedure TFrmLotacaoCad.LimparCampos;
begin
  cxCodigo.Clear;
  cxNome.Clear;
  cxativo.EditValue := 'S';
end;

procedure TFrmLotacaoCad.PopularCampos;
begin
  inherited;
  try
    Contloc := nil;
    Objloc  := nil;

    Contloc := TSindicato_LotacaoController.Create;
    Objloc  := TSindicato_Lotacao.Create;

    try
      Objloc     := Contloc.BuscarPorID(ParamsInt);

      cxCodigo.EditValue    := Objloc.codigo;
      cxNome.EditValue      := Objloc.descricao;
      cxativo.EditValue     := Objloc.ativo;
      cxnome.SetFocus;
      ParamsStr := 'E';
    finally
      FreeAndNil(Contloc);
      FreeandNil(Objloc);
    end;
  except on E: Exception do
    raise
  end;
end;

function TFrmLotacaoCad.Salvar(out msg: string): Boolean;
var
AID:Integer;
begin
  try
    Result  := False;
    ContLoc := nil;
    Objloc  := nil;

    ContLoc := TSindicato_LotacaoController.Create;
    ObjLoc  := TSindicato_Lotacao.Create;

    Try
      if ParamsStr = 'N' then
      ObjLoc.id_lotacao    := 0
      else
      ObjLoc.id_lotacao       := ParamsInt;
      ObjLoc.descricao          := Trim(cxNome.Text);
      ObjLoc.id_empresa         := TSession.IDEMPRESA;
      ObjLoc.id_usuario         := Tsession.ID_USUARIO;
      ObjLoc.ativo              := cxAtivo.EditValue;
      ObjLoc.sinc_app           := 'S';

      if ContLoc.Salvar(ObjLoc,AID) then
      begin
        Result  := true;
        msg:= 'Registro inserido com sucesso.';
        CarregarGrid;
        LimparCampos;
        cxnome.SetFocus;
        ParamsStr:= 'N';
        if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
        begin
          TConfiguracaoService.SincronizarGravar(2, AID);
        end;
        ParamsCloseTela := 'N';
      end;
    Finally
      FreeAndNil(ContLoc);
      FreeAndNil(Objloc);
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmLotacaoCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if cxNome.text='' then
  begin
    msg     := 'Informe a descrição da lotação!';
    Result  := False;
    exit;
  end;
end;

end.
