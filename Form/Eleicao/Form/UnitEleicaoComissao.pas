unit UnitEleicaoComissao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Navigation, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBasic,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue, cxButtonEdit, cxMaskEdit, cxDropDownEdit, cxTextEdit,
  cxBlobEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxGroupBox,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, Vcl.Menus, cxButtons,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, DBAccess, Uni, ACBrBase, ACBrEnterTab, ACBRUTIL,
  cxCheckBox, Vcl.Validacoes, UnitBaseNovoCadastro, Vcl.ButtonStylesAttributes,
  Vcl.StyledButton, dxBevel, dxmdaset, System.Generics.Collections,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, model.EleicaoChapa,
  Datasnap.DBClient, Controller.LookupHelper, UnitGlobal, Vcl.PermissaoUsuario,
  UConeSul, System.ImageList, Vcl.ImgList, cxImageList, Controller.EleicaoComissao;

type
  TFrmEleicaoComissao = class(TFormNovoBaseCadastro)
    cxnome: TcxTextEdit;
    cxGrid: TcxGrid;
    Grid: TcxGridDBTableView;
    GridRecId: TcxGridDBColumn;
    Gridid_depedente: TcxGridDBColumn;
    Gridcodigo: TcxGridDBColumn;
    Gridnome: TcxGridDBColumn;
    Gridparentesco: TcxGridDBColumn;
    Gridativo: TcxGridDBColumn;
    Gridid_socio: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Btneditar: TStyledBitBtn;
    cxobservacao: TcxBlobEdit;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cxEleicao: TcxLookupComboBox;
    cxAtivo: TcxCheckBox;
    cxCelular: TcxMaskEdit;
    cxemail: TcxTextEdit;
    Label9: TLabel;
    Label12: TLabel;
    TabEleicao: TClientDataSet;
    dsEleicao: TUniDataSource;
    TabEleicaoid_eleicao: TIntegerField;
    TabEleicaocodigo: TIntegerField;
    TabEleicaonome: TStringField;
    TabEleicaonpesquisa: TStringField;
    cxIMGMenu: TcxImageList;
    mdPesquisa: TdxMemData;
    edtcpf: TcxButtonEdit;
    Label1: TLabel;
    Label6: TLabel;
    cxCargo: TcxComboBox;
    GridColumn1: TcxGridDBColumn;
    mdPesquisaid_comissao: TIntegerField;
    mdPesquisaid_eleicao: TIntegerField;
    mdPesquisanome: TStringField;
    mdPesquisacpf: TStringField;
    mdPesquisacargo: TStringField;
    mdPesquisaativo: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtneditarClick(Sender: TObject);
    procedure GridCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);

  private
    Procedure LimparCampos;
    Procedure CarregarGrid;
    Procedure AcaoBtn;

    { Private declarations }
  public
    AIDEleicao :Integer;
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;
    { Public declarations }
  end;

var
  FrmEleicaoComissao: TFrmEleicaoComissao;
  Obj  : TModelEleicaoComissao;
implementation

{$R *.dfm}

uses Vcl.Session, uJKDialog;

procedure TFrmEleicaoComissao.AcaoBtn;
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

procedure TFrmEleicaoComissao.BtnCancelarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);
    if Permissao.TemPermissao('Permitir Excluir Comissão') then
    begin
      if not mdPesquisa.Eof then
      begin
        if mdPesquisaid_comissao.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;

        if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
        begin

          Try
            if TEleicaoComissaoController.Excluir(mdPesquisaid_comissao.AsInteger) then
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

procedure TFrmEleicaoComissao.BtneditarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);
    if Permissao.TemPermissao('Permitir Editar Comissão') then
    begin
      if not mdPesquisa.Eof then
      begin

        if mdPesquisaid_comissao.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;

        if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
        begin
          ParamsStr       := 'E';
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

procedure TFrmEleicaoComissao.CarregarGrid;
var
  List    : TObjectList<TModelEleicaoComissao>;
begin
  try
    List    := Nil;
    Try
      List  := TEleicaoComissaoController.ListarTodos(AIDEleicao, TSession.IDEMPRESA);

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

        mdPesquisaid_comissao.AsInteger     := Item.id_comissao;
        mdPesquisaid_eleicao.AsInteger      := Item.id_eleicao;
        mdPesquisanome.AsString             := Item.nome;
        mdPesquisacpf.AsString              := Item.cpf;
        mdPesquisacargo.AsString            := Item.cargo;
        mdPesquisaativo.AsString            := Item.ativo;

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

procedure TFrmEleicaoComissao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmEleicaoComissao := nil;
end;

procedure TFrmEleicaoComissao.FormCreate(Sender: TObject);
begin
  inherited;
  ParamsStr := 'N';
  ParamsTela:= 'Eleição';

   if not mdPesquisa.Active then
   begin
    mdPesquisa.Open;
   end;
end;

procedure TFrmEleicaoComissao.FormShow(Sender: TObject);
begin
  inherited;
  try
    TLookupHelper.CarregarLookup(
            Tabeleicao,LookupEleicaoSql);
    Tabeleicao.First;

    if ParamsStr = 'N' then
    begin
      TitleText                 := 'Comissão Eleitoral';
      cxeleicao.EditValue       := AidEleicao;
      cxnome.SetFocus;
    end;

    CarregarGrid;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmEleicaoComissao.GridCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if not mdpesquisa.Eof then
  begin
    ParamsInt := mdpesquisaid_comissao.AsInteger;
  end;
end;

procedure TFrmEleicaoComissao.LimparCampos;
begin
  cxnome.Clear;
  edtcpf.Clear;
  cxCelular.Clear;
  cxemail.Clear;
  cxobservacao.Clear;
  cxativo.EditValue := 'S';
  cxcargo.ItemIndex := 0;
end;

procedure TFrmEleicaoComissao.PopularCampos;
begin
  inherited;
  try
    Obj  := nil;
    Obj  := TModelEleicaoComissao.Create;

    try
      Obj  := TEleicaoComissaoController.BuscarPorID(ParamsInt);

      cxnome.EditValue          := Obj.nome;
      edtcpf.EditValue          := Obj.cpf;
      cxCelular.EditValue       := Obj.telefone;
      cxemail.EditValue         := Obj.email;
      cxcargo.Text              := obj.cargo;
      cxobservacao.EditValue    := Obj.obs;
      cxAtivo.EditValue         := Obj.ativo;
    finally
      FreeandNil(Obj);
    end;
  except on E: Exception do
    raise
  end;
end;

function TFrmEleicaoComissao.Salvar(out msg: string): Boolean;
var
AID:Integer;
AStr:String;
begin
  Result        := False;

  try
    //popular os campos conforme registro

    Obj           := nil;
    Obj           := TModelEleicaoComissao.Create;

    if ParamsStr = 'N' then
    Obj.id_comissao  := 0
    else
    Obj.id_comissao := ParamsInt;
    obj.id_eleicao  := AIdeleicao;
    Obj.nome        := trim(cxnome.Text);
    obj.cpf         := Tirapontos(edtcpf.Text);
    obj.telefone    := Tirapontos(cxcelular.Text);
    obj.email       := Trim(cxemail.Text);
    obj.cargo       := cxcargo.Text;
    obj.ativo       := cxativo.EditValue;
    obj.obs         := cxobservacao.Text;
    obj.id_empresa  := TSession.IDEMPRESA;
    obj.id_usuario  := TSession.ID_USUARIO;

    Try
      //salvar os dados

        if TEleicaoComissaoController.Salvar(Obj, AID, AStr) then
        begin
          Result  := true;
          msg     := 'Registro inserido com sucesso.';
          CarregarGrid;
          LimparCampos;
          cxnome.SetFocus;
          ParamsStr       := 'N';
          ParamsCloseTela := 'N';
          AcaoBtn;
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

function TFrmEleicaoComissao.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if cxnome.Text='' then
  begin
    msg     := 'Informe um nome.';
    Result  := False;
    exit;
  end;

  if cxemail.Text='' then
  begin
    msg     := 'Informe um E-mail.';
    Result  := False;
    exit;
  end;

end;

end.



