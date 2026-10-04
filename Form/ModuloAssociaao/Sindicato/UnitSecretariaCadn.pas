unit UnitSecretariaCadn;

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
  Model.Secretaria, Vcl.Validacoes,  UnitBaseNovoCadastro,
  Vcl.ButtonStylesAttributes, Vcl.StyledButton, dxBevel, dxmdaset,Controller_Secretaria,
  System.Generics.Collections;

type
  TFrmSecretariaCadN = class(TFormNovoBaseCadastro)
    Label1: TLabel;
    Label3: TLabel;
    cxCodigo: TcxTextEdit;
    cxNome: TcxTextEdit;
    Btneditar: TStyledBitBtn;
    cxGrid: TcxGrid;
    Grid: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    gbAtivo: TcxGroupBox;
    cxAtivo: TcxCheckBox;
    mdSecretaria: TdxMemData;
    mdSecretariaid_secretaria: TIntegerField;
    mdSecretariacodigo: TIntegerField;
    mdSecretariarazao: TStringField;
    mdSecretariafantasia: TStringField;
    mdSecretariaativo: TStringField;
    GridRecId: TcxGridDBColumn;
    Gridid_secretaria: TcxGridDBColumn;
    Gridcodigo: TcxGridDBColumn;
    Gridrazao: TcxGridDBColumn;
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
  FrmSecretariaCadN: TFrmSecretariaCadN;
  ContSec   : TSecretariaController;
  ObjSec    : TSecretaria;
implementation

{$R *.dfm}

uses uConfiguracaoService, Vcl.PermissaoUsuario;

{ TFrmSecretariaCadN }

procedure TFrmSecretariaCadN.AcaoBtn;
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

procedure TFrmSecretariaCadN.BtnCancelarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Secretaria');
    if Permissao.TemPermissao('Permitir Excluir') then
    begin
      if not mdSecretaria.Eof then
      begin
        if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
        begin

          ContSec    := Nil;
          ContSec    := TSecretariaController.Create;
          Try
            if ContSec.ExcluidoCancelado(mdSecretariaid_secretaria.AsInteger, Tsession.ID_USUARIO) then
            JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
            CarregarGrid;
            if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
            begin
              TConfiguracaoService.SincronizarGravar(1, mdSecretariaid_secretaria.AsInteger);
            end;
          Finally
            FreeAndNil(ContSec);
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

procedure TFrmSecretariaCadN.BtneditarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Secretaria');
    if Permissao.TemPermissao('Permitir Editar') then
    begin
      if not mdSecretaria.Eof then
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

procedure TFrmSecretariaCadN.BtnSalvarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Secretaria');

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

procedure TFrmSecretariaCadN.btnSincronizarClick(Sender: TObject);
var
Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Secretaria');

    if Permissao.TemPermissao('Permitir Sincronizar API') then
    begin
      if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
      begin
        //Incluir os cadastro para sincronizar
        ContSec    := TSecretariaController.Create;

        Try
          if ContSec.IncluiRegistroSincronizar then
          begin
            TConfiguracaoService.SincronizarGravar(1, 0);
            JKDialog('Sucesso','Sincronização em execução. Você pode continuar usando o sistema!', tdSucesso);
          end
          else
          JKDialog('Aviso','Comando não execultado!', tdAlerta);

        Finally
          FreeAndNil(ContSec);
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

procedure TFrmSecretariaCadN.CarregarGrid;
var
List    : TObjectList<TSecretaria>;
begin
  try
    List    := Nil;
    ContSec := TSecretariaController.Create;
    Try
      List  := ContSec.ListarTodos('', '');
      mdSecretaria.Close;
      mdSecretaria.FieldDefs.Clear;

      if (List = nil) or (List.Count = 0) then
      begin
        mdSecretaria.Close;
        exit;
      end;

      if not mdSecretaria.Active then
      mdSecretaria.Open;

      mdSecretaria.DisableControls;

      for var Item in List do
      begin
        mdSecretaria.Append;

        mdSecretariaid_secretaria.AsInteger   := item.id_secretaria;
        mdSecretariacodigo.AsInteger          := item.codigo;
        mdSecretariarazao.AsString            := item.razao;
        mdSecretariaativo.AsString            := item.ativo;
        mdSecretaria.Post;

      end;
      mdSecretaria.First;
      mdSecretaria.EnableControls;
    Finally
      FreeAndNil(ContSec);
      if Assigned(List) then
      List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmSecretariaCadN.cxCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0'..'9', #8, ^V, ^C, ^X]) then
        Key := #0;
end;

procedure TFrmSecretariaCadN.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmSecretariaCadN := nil;
end;

procedure TFrmSecretariaCadN.FormCreate(Sender: TObject);
begin
  inherited;
  ParamsStr := 'N';
  ParamsTela:= 'Secretaria';

   if not mdSecretaria.Active then
   begin
    mdSecretaria.Open;
   end;
end;

procedure TFrmSecretariaCadN.FormShow(Sender: TObject);
begin
  inherited;
  try

    if ParamsStr = 'N' then
    begin
      TitleText   := 'Nova Secretaria';
      cxNome.SetFocus;
    end;

    CarregarGrid;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmSecretariaCadN.GridCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if not mdSecretaria.Eof then
  begin
    ParamsInt := mdSecretariaid_secretaria.AsInteger;
  end;
end;

procedure TFrmSecretariaCadN.LimparCampos;
begin
  cxCodigo.Clear;
  cxNome.Clear;
  cxativo.EditValue := 'S';
end;

procedure TFrmSecretariaCadN.PopularCampos;
begin
  try
    ContSec := nil;
    ObjSec  := nil;

    ContSec := TSecretariaController.Create;
    ObjSec  := TSecretaria.Create;

    try
      ObjSec     := ContSec.BuscarPorID(ParamsInt);

      cxCodigo.EditValue    := ObjSec.codigo;
      cxNome.EditValue      := ObjSec.razao;
      cxativo.EditValue     := ObjSec.ativo;
      cxnome.SetFocus;
      ParamsStr := 'E';
    finally
      FreeAndNil(ContSec);
      FreeandNil(ObjSec);
    end;
  except on E: Exception do
    raise
  end;
end;

function TFrmSecretariaCadN.Salvar(out msg: string): Boolean;
var
AID:Integer;
begin
  try
    Result  := False;
    ContSec := nil;
    ObjSec  := nil;

    ContSec := TSecretariaController.Create;
    ObjSec  := TSecretaria.Create;

    Try
      if ParamsStr = 'N' then
      ObjSec.id_secretaria      := 0
      else
      ObjSec.id_secretaria      := ParamsInt;
      ObjSec.razao              := Trim(cxNome.Text);
      ObjSec.id_empresa         := TSession.IDEMPRESA;
      ObjSec.id_usuario         := Tsession.ID_USUARIO;
      ObjSec.ativo              := cxAtivo.EditValue;
      ObjSec.sinc_app           := 'S';

      if ContSec.Salvar(ObjSec,AID) then
      begin
        Result  := true;
        msg:= 'Registro inserido com sucesso.';
        CarregarGrid;
        LimparCampos;
        cxnome.SetFocus;
        ParamsStr:= 'N';
        if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
        begin
          TConfiguracaoService.SincronizarGravar(1, AID);
        end;
        ParamsCloseTela := 'N';
      end;

    Finally
      FreeAndNil(ContSec);
      FreeAndNil(ObjSec);
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmSecretariaCadN.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if cxNome.text='' then
  begin
    msg     := 'Informe o nome da secretarias!';
    Result  := False;
    exit;
  end;
end;

end.

