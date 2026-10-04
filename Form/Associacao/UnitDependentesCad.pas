unit UnitDependentesCad;

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
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Navigation, UConeSul, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxMaskEdit, cxDropDownEdit, cxCalendar, dxBevel, cxButtonEdit,
  UDM,Model.SindDependente, ACBRUTIL, Vcl.Validacoes,
  UnitBaseNovoCadastro, Vcl.ButtonStylesAttributes, Vcl.StyledButton,
  dxGDIPlusClasses, dxmdaset,
  Model.Sindicato_Dependentes, Controller_sindicato_dependente, ACBrValidador;

type
  TFrmDependentesCad = class(TFormNovoBaseCadastro)
    edtFoto: TImage;
    dxBevel2: TdxBevel;
    Label1: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    cxCodigo: TcxTextEdit;
    cxNome: TcxTextEdit;
    cxNascimento: TcxDateEdit;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cxcpf: TcxButtonEdit;
    cxRg: TcxTextEdit;
    cxParentesco: TcxComboBox;
    cxSexo: TcxComboBox;
    Label7: TLabel;
    cxTelefone: TcxMaskEdit;
    cxAtivo: TcxCheckBox;
    cxAutorizado: TcxCheckBox;
    cxGrid: TcxGrid;
    Grid: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    Btneditar: TStyledBitBtn;
    mdDependente: TdxMemData;
    mdDependenteid_depedente: TIntegerField;
    mdDependentenome: TStringField;
    mdDependentecpf: TStringField;
    mdDependenteparentesco: TStringField;
    mdDependenteativo: TStringField;
    mdDependenteautorizado: TStringField;
    mdDependenteid_socio: TIntegerField;
    mdDependentecodigo: TIntegerField;
    GridRecId: TcxGridDBColumn;
    Gridid_depedente: TcxGridDBColumn;
    Gridnome: TcxGridDBColumn;
    Gridcpf: TcxGridDBColumn;
    Gridparentesco: TcxGridDBColumn;
    Gridativo: TcxGridDBColumn;
    Gridautorizado: TcxGridDBColumn;
    Gridid_socio: TcxGridDBColumn;
    Gridcodigo: TcxGridDBColumn;
    ACBrValidador1: TACBrValidador;
    mdDependentedatacadastro: TDateField;
    mdDependentenmusuaro: TStringField;
    GridColumn1: TcxGridDBColumn;
    GridColumn2: TcxGridDBColumn;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtneditarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure cxRgKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure edtFotoDblClick(Sender: TObject);

  private
    AIDDepend : Integer;
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
  FrmDependentesCad: TFrmDependentesCad;
  ContDependente      : TSindicato_DependentesController;
  ObjDependente       : TSindicato_Dependentes;

implementation

{$R *.dfm}

uses uJKDialog, Vcl.Session, uConfiguracaoService,System.Generics.Collections,
  Vcl.PermissaoUsuario;

{ TFrmDependentesCad }

procedure TFrmDependentesCad.AcaoBtn;
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

procedure TFrmDependentesCad.BtnCancelarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

    if Permissao.TemPermissao('Permitir Excluir') then
    begin
      if not mdDependente.Eof then
      begin
        if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
        begin

          if TConfiguracaoService.ValidarPessoaDependenteCarteiraWeb(mdDependenteid_depedente.AsInteger) then
          begin
            JKDialog('Alerta','Exist uma carteira web vinculada!', tdAlerta);
            Exit;
          end;

          ContDependente    := Nil;
          ContDependente    := TSindicato_DependentesController.Create;

          Try
            if ContDependente.ExcluidoCancelado(mdDependenteid_depedente.AsInteger, Tsession.ID_USUARIO) then
            JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
            CarregarGrid;

            if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
            begin
              TConfiguracaoService.SincronizarGravar(1, mdDependenteid_depedente.AsInteger);
            end;

          Finally
            FreeAndNil(ContDependente);
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

procedure TFrmDependentesCad.BtneditarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);
    if Permissao.TemPermissao('Permitir Editar') then
    begin
      if not mdDependente.Eof then
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

procedure TFrmDependentesCad.BtnSalvarClick(Sender: TObject);
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

procedure TFrmDependentesCad.CarregarGrid;
var
List    : TObjectList<TSindicato_Dependentes>;
begin
  try
    List    := Nil;
    ContDependente := TSindicato_DependentesController.Create;

    Try
      List  := ContDependente.ListarTodos(ParamsInt);
      mdDependente.Close;
      mdDependente.FieldDefs.Clear;

      if (List = nil) or (List.Count = 0) then
      begin
        mdDependente.Close;
        exit;
      end;

      if not mdDependente.Active then
      mdDependente.Open;

      mdDependente.DisableControls;

      for var Item in List do
      begin
        mdDependente.Append;

        mdDependenteid_depedente.AsInteger  := Item.id_dependente;
        mdDependentenome.AsString           := Item.nome;
        mdDependentecpf.AsString            := Item.cpf;
        mdDependenteparentesco.AsString     := Item.parentesco;
        mdDependenteativo.AsString          := Item.ativo;
        mdDependenteautorizado.AsString     := Item.autorizado;
        mdDependenteid_socio.AsInteger      := Item.id_socio;
        mdDependentecodigo.AsInteger        := Item.codigo;
        mdDependentedatacadastro.AsDateTime := Item.datacadastro;
        mdDependentenmusuaro.AsString       := Item.nmusuario;

        mdDependente.Post;

      end;
      mdDependente.First;
      mdDependente.EnableControls;
    Finally
      FreeAndNil(ContDependente);
      if Assigned(List) then
      List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmDependentesCad.cxRgKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0'..'9', #8, ^V, ^C, ^X]) then
        Key := #0;
end;

procedure TFrmDependentesCad.edtFotoDblClick(Sender: TObject);
var
  OpenDialog: TOpenDialog;
begin
  try
    OpenDialog := TOpenDialog.Create(nil);
    try
      OpenDialog.Filter := 'Imagens JPEG|*.jpg;*.jpeg|Imagens PNG|*.png;*.png';
      OpenDialog.Title := 'Selecione uma foto';

      if OpenDialog.Execute then
      begin
        edtfoto.Picture.LoadFromFile(OpenDialog.FileName);
        edtfoto.Tag := 1;
      end;
    finally
      OpenDialog.Free;
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmDependentesCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmDependentesCad:=nil;
end;

procedure TFrmDependentesCad.FormCreate(Sender: TObject);
begin
  inherited;
  ParamsStr := 'N';
  ParamsTela:= 'Dependentes';
  if not mdDependente.Active then
  begin
    mdDependente.Open;
  end;
end;

procedure TFrmDependentesCad.FormShow(Sender: TObject);
begin
  inherited;
  try
    if ParamsStr = 'N' then
    begin
      TitleText   := 'Novo Dependente';
      cxNome.SetFocus;
    end;

    CarregarGrid;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmDependentesCad.GridCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if not mdDependente.Eof then
  begin
    AIDDepend := mdDependenteid_depedente.AsInteger;
  end;
end;

procedure TFrmDependentesCad.LimparCampos;
begin
  cxCodigo.Clear;
  cxNome.Clear;
  cxnascimento.Clear;
  cxcpf.Clear;
  cxrg.Clear;
  cxparentesco.ItemIndex:=-1;
  cxsexo.ItemIndex:=-1;
  cxtelefone.Clear;
  cxativo.EditValue := 'S';
  cxautorizado.EditValue:='N';
  edtFoto.Picture:=nil;
end;

procedure TFrmDependentesCad.PopularCampos;
begin
  inherited;
  try
    ContDependente := nil;
    ObjDependente  := nil;

    ContDependente := TSindicato_DependentesController.Create;
    ObjDependente  := TSindicato_Dependentes.Create;

    try
      ObjDependente           := ContDependente.BuscarPorID(AIDDepend);

      cxCodigo.EditValue      := ObjDependente.codigo;
      cxNome.EditValue        := ObjDependente.nome;
      cxnascimento.EditValue  := TConeSul.ValidarDataNull(ObjDependente.nascimento);
      cxcpf.EditValue         := ObjDependente.cpf;
      cxrg.EditValue          := ObjDependente.rg;
      cxparentesco.EditValue  := ObjDependente.parentesco;
      cxsexo.EditValue        := ObjDependente.sexo;
      cxtelefone.EditValue    := ObjDependente.fone;
      cxativo.EditValue       := ObjDependente.ativo;
      cxautorizado.EditValue  := ObjDependente.autorizado;

      if ObjDependente.foto <> '' then
      begin
        TConesul.ConvBase64Img(ObjDependente.foto);
        edtFoto.Picture         := TConeSul.nfoto;
        edtFoto.Tag             := 1;
        TConeSul.nfoto.Free;
      end;

      cxnome.SetFocus;
      ParamsStr := 'E';
    finally
      FreeAndNil(ContDependente);
      FreeandNil(ObjDependente);
    end;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmDependentesCad.Salvar(out msg: string): Boolean;
var
AID:Integer;
begin
  try
    Result  := False;
    ContDependente := nil;
    ObjDependente  := nil;

    ContDependente := TSindicato_DependentesController.Create;
    ObjDependente  := TSindicato_Dependentes.Create;

    Try
      if ParamsStr = 'N' then
      ObjDependente.id_dependente   := 0
      else
      ObjDependente.id_dependente   := AIDDepend;
      ObjDependente.codigo          := 0;
      ObjDependente.id_socio        := ParamsInt;
      ObjDependente.nome            := Trim(cxnome.Text);
      if cxnascimento.EditValue = Null then
      ObjDependente.nascimento      := Nulldate
      else
      ObjDependente.nascimento      := cxnascimento.EditValue;
      ObjDependente.parentesco      := cxparentesco.Text;
      ObjDependente.cpf             := Tirapontos(cxcpf.Text);
      ObjDependente.rg              := Trim(cxrg.Text);
      ObjDependente.sexo            := cxsexo.Text;
      ObjDependente.id_empresa      := TSession.IDEMPRESA;
      ObjDependente.id_usuario      := TSession.ID_USUARIO;
      ObjDependente.datacadastro    := Now();
      ObjDependente.ativo           := cxativo.EditValue;
      ObjDependente.autorizado      := cxautorizado.EditValue;
      ObjDependente.fone            := Tirapontos(cxtelefone.Text);
      ObjDependente.sinc_app        := 'S';
      ObjDependente.excluido        := 0;

      if edtFoto.Picture.Graphic <> nil then
      if edtFoto.Tag = 1 then
      begin
        ObjDependente.foto          := TConeSul.ConvImgBase64(edtfoto);
        TConeSul.nfoto              :=nil;
      end;

      if ContDependente.Salvar(ObjDependente, AID) then
      begin
        if AID = 0 then
        AID     := AIDDepend;
        msg     := 'Registro salvo com sucesso, ID: '+IntToStr(AId);
        Result  := true;
        CarregarGrid;
        LimparCampos;
        cxnome.SetFocus;
        ParamsStr       := 'N';
        ParamsCloseTela := 'N';

        if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
        begin
          TConfiguracaoService.SincronizarGravar(5, AID);
        end;
      end;

    Finally
      FreeAndNil(ContDependente);
      FreeAndNil(ObjDependente);
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmDependentesCad.ValidarCampos(out msg: string): Boolean;
var
  Permissao: TPermissaoUsuario;
  ACod:integer;
begin
  Result  := True;

  Try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

    if Permissao.TemPermissao('Required: Nome') then
    begin
      if (Trim(cxNome.Text)='') then
      begin
        msg     := 'Informe nome do dependente!';
        result  := False;
        Exit;
      end;
    end;

    if Permissao.TemPermissao('Required: Nascimento') then
    begin
      if (CxNascimento.EditValue = null) or (CxNascimento.EditValue < 0) then
      begin
        msg  := 'Informe a data de nascimento!';
        result  := false;
        exit;
      end;
    end;

    if Permissao.TemPermissao('Required: CPF') then
    begin
      if (Tirapontos(cxcpf.Text)='') or (cxcpf.EditValue=null) then
      begin
        msg     := 'Informe o CPF do dependente!';
        result  := False;
        Exit;
      end;

      //Validar se o cpf e valido
      if (Tirapontos(cxcpf.Text) <>'') or  (cxcpf.Text<> '000.000.000-00') then
      begin
        ACBrValidador1.TipoDocto := docCPF;
        ACBrValidador1.Documento := cxcpf.EditValue;
        if not ACBrValidador1.Validar then
        begin
          msg     := ACBrValidador1.MsgErro;
          Result  := False;
          exit;
        end;
      end;

      //Validar se dependente exits com o mesmo CPF.
      if ParamsStr='N' then
      begin
        if Tirapontos(cxcpf.Text) <> '' then
        if TConfiguracaoService.ValidarCadastroExitDependente(Acod, Tirapontos(cxcpf.Text), ParamsInt) then
        begin
          msg     := 'Já exit um cadastro com esse CPF registrado!'+#13+'Código: '+inttostr(ACOD);
          result  := False;
          Exit;
        end;
      end;

    end;

    if Permissao.TemPermissao('Required: Parentesco') then
    begin
      if (CxParentesco.ItemIndex=-1) or (CxParentesco.Text='') then
      begin
        msg := 'Informe o grau de parentesco!';
        result  := false;
        exit;
      end;
    end;

    if Permissao.TemPermissao('Required: Telefone') then
    begin
      if TConeSul.ValidarTelefonePreenchido(Cxtelefone) then
      begin
        msg := 'Informe um número de telefone!';
        result  := false;
        exit;
      end;
    end;

    if Permissao.TemPermissao('Required: Foto') then
    begin
      if (edtfoto.Tag=0) then
      begin
        msg := 'Inclua uma foto!';
        result  := false;
        exit;
      end;
    end;

  Except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;

end;

end.
