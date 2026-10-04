unit UnitEmpCad;

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
  Vcl.Buttons, Vcl.ExtCtrls, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, UDM,  Model.SindEmpresa,
  Vcl.Session, Vcl.Navigation, uJKDialog, UnitBaseNovoCadastro,
  Vcl.ButtonStylesAttributes, Vcl.StyledButton, dxBevel, dxmdaset, cxButtonEdit,
  Datasnap.DBClient, Model.Sindicato_Empresa,Controller_Sindicato_Empresa,System.Generics.Collections;

type
  TFrmEmpCad = class(TFormNovoBaseCadastro)
    dsSede: TUniDataSource;
    mdEmpresa: TdxMemData;
    Label1: TLabel;
    cxCodigo: TcxTextEdit;
    Label3: TLabel;
    cxNome: TcxTextEdit;
    cxSede: TcxLookupComboBox;
    BtnSede: TcxButtonEdit;
    Label2: TLabel;
    gbAtivo: TcxGroupBox;
    cxAtivo: TcxCheckBox;
    Btneditar: TStyledBitBtn;
    cxGrid: TcxGrid;
    Grid: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    TabSede: TClientDataSet;
    TabSedeid_sede: TIntegerField;
    TabSederazao: TStringField;
    TabSedefantasia: TStringField;
    TabSedecnpj: TStringField;
    TabSedecelular: TStringField;
    TabSedesedeprincipal: TStringField;
    TabSedensede: TStringField;
    mdEmpresasind_id_empresa: TIntegerField;
    mdEmpresacodigo: TIntegerField;
    mdEmpresadescricao: TStringField;
    mdEmpresaativo: TStringField;
    mdEmpresarazao: TStringField;
    GridRecId: TcxGridDBColumn;
    Gridsind_id_empresa: TcxGridDBColumn;
    Gridcodigo: TcxGridDBColumn;
    Griddescricao: TcxGridDBColumn;
    Gridativo: TcxGridDBColumn;
    Gridrazao: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtneditarClick(Sender: TObject);
    procedure GridCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSedePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
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
  FrmEmpCad : TFrmEmpCad;
  ContEmp   : TSindicato_EmpresaController;
  ObjEmp    : TSindicato_Empresa;
implementation

{$R *.dfm}

uses Controller.LookupHelper, UnitGlobal, Vcl.PermissaoUsuario, UnitSedeCad;


procedure TFrmEmpCad.AcaoBtn;
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

procedure TFrmEmpCad.BtnCancelarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Empresa Associação');
    if Permissao.TemPermissao('Permitir Excluir') then
    begin
      if not mdempresa.Eof then
      begin
        if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
        begin

          ContEmp    := Nil;
          ContEmp    := TSindicato_EmpresaController.Create;
          Try
            if ContEmp.ExcluidoCancelado(mdEmpresasind_id_empresa.AsInteger, Tsession.ID_USUARIO) then
            JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
            CarregarGrid;
          Finally
            FreeAndNil(ContEmp);
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

procedure TFrmEmpCad.BtneditarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Empresa Associação');
    if Permissao.TemPermissao('Permitir Editar') then
    begin
      if not mdempresa.Eof then
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

procedure TFrmEmpCad.BtnSalvarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Empresa Associação');

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

procedure TFrmEmpCad.BtnSedePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  try
    try
      if not Assigned(FrmSedeCad) then
      FrmSedeCad := TFrmSedeCad.Create(Application);
      //FrmSedeCad.ParamsStr  := 'N';
      FrmSedeCad.ShowModal;
    finally
      TLookupHelper.CarregarLookup(
                  TabSede,LookupSedeSql);
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmEmpCad.CarregarGrid;
var
List    : TObjectList<TSindicato_Empresa>;
begin
  try
    List    := Nil;
    ContEmp := TSindicato_EmpresaController.Create;
    Try
      List  := ContEmp.ListarTodos('', '');
      mdEmpresa.Close;
      mdEmpresa.FieldDefs.Clear;

      if (List = nil) or (List.Count = 0) then
      begin
        mdEmpresa.Close;
        exit;
      end;

      if not mdEmpresa.Active then
      mdEmpresa.Open;

      mdEmpresa.DisableControls;

      for var Item in List do
      begin
        mdEmpresa.Append;
        mdEmpresasind_id_empresa.AsInteger  := item.sind_id_empresa;
        mdEmpresacodigo.AsInteger           := item.codigo;
        mdEmpresadescricao.AsString         := item.descricao;
        mdEmpresaativo.AsString             := item.ativo;
        mdEmpresarazao.AsString             := item.vrazao;

        mdEmpresa.Post;

      end;
      mdEmpresa.First;
      mdEmpresa.EnableControls;
    Finally
      FreeAndNil(ContEmp);
      if Assigned(List) then
      List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmEmpCad.cxCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0'..'9', #8, ^V, ^C, ^X]) then
        Key := #0;
end;

procedure TFrmEmpCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmEmpCad := Nil;
end;

procedure TFrmEmpCad.FormCreate(Sender: TObject);
begin
  inherited;
  ParamsStr := 'N';
  ParamsTela:= 'Empresa Associação';

   if not mdEmpresa.Active then
   begin
    mdEmpresa.Open;
   end;
end;

procedure TFrmEmpCad.FormShow(Sender: TObject);
begin
  inherited;
  try
    TLookupHelper.CarregarLookup(
                  TabSede,LookupSedeSql);

    if ParamsStr = 'N' then
    begin
      TitleText   := 'Nova Empresa';
      cxNome.SetFocus;
    end;

    CarregarGrid;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmEmpCad.GridCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if not mdEmpresa.Eof then
  begin
    ParamsInt := mdEmpresasind_id_empresa.AsInteger;
  end;
end;

procedure TFrmEmpCad.LimparCampos;
begin
  cxCodigo.Clear;
  cxNome.Clear;
  cxsede.EditValue  :=0;
  cxativo.EditValue := 'S';
end;

procedure TFrmEmpCad.PopularCampos;
begin
  inherited;
  try
    ContEmp := nil;
    ObjEmp  := nil;

    ContEmp := TSindicato_EmpresaController.Create;
    ObjEmp  := TSindicato_Empresa.Create;

    try
      ObjEmp     := ContEmp.BuscarPorID(ParamsInt);

      cxCodigo.EditValue    := Objemp.codigo;
      cxNome.EditValue      := Objemp.descricao;
      cxsede.EditValue      := objemp.id_sede;
      cxativo.EditValue     := objemp.ativo;
      cxnome.SetFocus;
      ParamsStr := 'E';
    finally
      FreeAndNil(Contemp);
      FreeandNil(Objemp);
    end;
  except on E: Exception do
    raise
  end;
end;

function TFrmEmpCad.Salvar(out msg: string): Boolean;
var
AID:Integer;
begin
  try
    Result  := False;
    ContEmp := nil;
    ObjEmp  := nil;

    ContEmp := TSindicato_EmpresaController.Create;
    ObjEmp  := TSindicato_Empresa.Create;

    Try
      if ParamsStr = 'N' then
      ObjEmp.sind_id_empresa    := 0
      else
      ObjEmp.sind_id_empresa    := ParamsInt;
      ObjEmp.descricao          := Trim(cxNome.Text);
      ObjEmp.id_sede            := cxSede.EditValue;
      ObjEmp.id_empresa         := TSession.IDEMPRESA;
      ObjEmp.id_usuario         := Tsession.ID_USUARIO;
      ObjEmp.ativo              := cxAtivo.EditValue;
      ObjEmp.sinc_app           := 'S';

      if ContEmp.Salvar(ObjEmp,AID) then
      begin
        Result  := true;
        msg:= 'Registro inserido com sucesso.';
        CarregarGrid;
        LimparCampos;
        cxnome.SetFocus;
        ParamsStr:= 'N';
        ParamsCloseTela := 'N';
      end;

    Finally
      FreeAndNil(ContEmp);
      FreeAndNil(Objemp);
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmEmpCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if cxNome.text='' then
  begin
    msg     := 'Informe o nome da empresa!';
    Result  := False;
    exit;
  end;

  if (cxSede.Text='') or (cxSede.EditValue=0) then
  begin
    msg     := 'Selecione uma sede!';
    Result  := False;
    exit;
  end;

end;

end.
