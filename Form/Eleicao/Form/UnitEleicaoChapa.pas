unit UnitEleicaoChapa;

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
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, model.EleicaoChapa, Controller.EleicaoChapa,
  Datasnap.DBClient, Controller.LookupHelper, UnitGlobal, Vcl.PermissaoUsuario,
  UConeSul, System.ImageList, Vcl.ImgList, cxImageList, UnitMembroCad;

type
  TFrmEleicaoChapa = class(TFormNovoBaseCadastro)
    cxchapa: TcxTextEdit;
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
    Label6: TLabel;
    cxnumero: TcxTextEdit;
    cxresponsavel: TcxTextEdit;
    Label7: TLabel;
    cxAtivo: TcxCheckBox;
    Label3: TLabel;
    cxdatacriacao: TcxDateEdit;
    Label8: TLabel;
    cxstatus: TcxComboBox;
    Label20: TLabel;
    cxCodigo: TcxTextEdit;
    cxslogan: TcxTextEdit;
    Label1: TLabel;
    cxCelular: TcxMaskEdit;
    cxemail: TcxTextEdit;
    Label10: TLabel;
    cxDatahomologacao: TcxDateEdit;
    cxDataindeferimento: TcxDateEdit;
    Label11: TLabel;
    cxmotivo: TcxBlobEdit;
    Label13: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    TabEleicao: TClientDataSet;
    dsEleicao: TUniDataSource;
    TabEleicaoid_eleicao: TIntegerField;
    TabEleicaocodigo: TIntegerField;
    TabEleicaonome: TStringField;
    TabEleicaonpesquisa: TStringField;
    GridColumn1: TcxGridDBColumn;
    cxIMGMenu: TcxImageList;
    PopupMenu: TPopupMenu;
    BtnHomologar: TMenuItem;
    Btndeferir: TMenuItem;
    N1: TMenuItem;
    btnMembros: TMenuItem;
    mdPesquisa: TdxMemData;
    mdPesquisaid: TIntegerField;
    mdPesquisacodigo: TIntegerField;
    mdPesquisasituacao: TStringField;
    mdPesquisanum_chapa: TIntegerField;
    mdPesquisaativo: TStringField;
    mdPesquisaid_eleicao: TIntegerField;
    mdPesquisanome_chapa: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtneditarClick(Sender: TObject);
    procedure GridCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure BtnHomologarClick(Sender: TObject);
    procedure BtndeferirClick(Sender: TObject);
    procedure btnMembrosClick(Sender: TObject);

  private
    Procedure LimparCampos;
    Procedure CarregarGrid;
    Procedure AcaoBtn;
    procedure HomologacaoRegistro(ATipo: Integer);
    { Private declarations }
  public
    AIDEleicao :Integer;
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;
    { Public declarations }
  end;

var
  FrmEleicaoChapa: TFrmEleicaoChapa;
  Obj   : TModelEleicaoChapa;
  ObjH  : TModelEleicaoChapaHomologacao;
implementation

{$R *.dfm}

uses Vcl.Session, uJKDialog, uConfiguracaoService;

procedure TFrmEleicaoChapa.AcaoBtn;
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

procedure TFrmEleicaoChapa.HomologacaoRegistro(ATipo: Integer);
begin
  case Atipo of
  0:begin //homologacao
          cxnumero.Properties.ReadOnly        := True;
          cxchapa.Properties.ReadOnly         := True;
          cxslogan.Properties.ReadOnly        := True;
          cxresponsavel.Properties.ReadOnly   := True;
          cxCelular.Properties.ReadOnly       := True;
          cxemail.Properties.ReadOnly         := True;
          cxobservacao.Properties.ReadOnly    := True;
          cxDatahomologacao.Properties.ReadOnly  := False;
          cxDatahomologacao.EditValue         := Date;
          cxAtivo.Properties.ReadOnly         := true;
    end;
  1:begin
          cxnumero.Properties.ReadOnly        := false;
          cxchapa.Properties.ReadOnly         := false;
          cxslogan.Properties.ReadOnly        := false;
          cxresponsavel.Properties.ReadOnly   := false;
          cxCelular.Properties.ReadOnly       := false;
          cxemail.Properties.ReadOnly         := false;
          cxobservacao.Properties.ReadOnly    := false;
          cxDatahomologacao.Properties.ReadOnly  := True;
          cxAtivo.Properties.ReadOnly         := false;
    end;
  2:begin//deferido
          cxnumero.Properties.ReadOnly        := True;
          cxchapa.Properties.ReadOnly         := True;
          cxslogan.Properties.ReadOnly        := True;
          cxresponsavel.Properties.ReadOnly   := True;
          cxCelular.Properties.ReadOnly       := True;
          cxemail.Properties.ReadOnly         := True;
          cxobservacao.Properties.ReadOnly    := True;
          cxAtivo.Properties.ReadOnly         := true;

          cxDataindeferimento.Properties.ReadOnly := False;
          cxmotivo.Properties.ReadOnly            := False;
          cxDataindeferimento.EditValue           := Date;
    end;
  end;
end;

procedure TFrmEleicaoChapa.BtnCancelarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);
    if Permissao.TemPermissao('Permitir Excluir Chapa') then
    begin
      if not mdPesquisa.Eof then
      begin
        if mdPesquisaid.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;

        if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
        begin

          Try
            if TEleicaoChapaController.Excluir(mdPesquisaid.AsInteger) then
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

procedure TFrmEleicaoChapa.BtndeferirClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);
    if Permissao.TemPermissao('Permitir Indeferir Chapa') then
    begin
      if not mdPesquisa.Eof then
      begin

        if mdPesquisaid.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;

        if TEleicaoChapaController.ExisteDeferido(mdPesquisaid.AsInteger, TSession.IDEMPRESA, AIDEleicao) then
        begin
          JKDialog('Alerta','Registro já indeferido.', tdAlerta);
          exit;
        end;

        if JKDialog('Aviso', 'Deseja indeferir o registro selecionado?', tdMensagem)  then
        begin
          PopularCampos;
          AcaoBtn;
          ParamsStr := 'D';
          HomologacaoRegistro(2);
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

procedure TFrmEleicaoChapa.BtneditarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);
    if Permissao.TemPermissao('Permitir Editar Chapa') then
    begin
      if not mdPesquisa.Eof then
      begin

        if mdPesquisaid.AsInteger = 0 then
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

procedure TFrmEleicaoChapa.BtnHomologarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);
    if Permissao.TemPermissao('Permitir Homologar Chapa') then
    begin
      if not mdPesquisa.Eof then
      begin

        if mdPesquisaid.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;

        if TEleicaoChapaController.ExisteHomologado(mdPesquisaid.AsInteger, TSession.IDEMPRESA, AIDEleicao) then
        begin
          JKDialog('Alerta','Registro já homologado.', tdAlerta);
          exit;
        end;

        if JKDialog('Aviso', 'Deseja homologar o registro selecionado?', tdMensagem)  then
        begin
          PopularCampos;
          AcaoBtn;
          ParamsStr := 'H';
          HomologacaoRegistro(0);
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

procedure TFrmEleicaoChapa.btnMembrosClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin //membros
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);
    if Permissao.TemPermissao('Permitir Cadastrar Membros') then
    begin
      if not mdPesquisa.Eof then
      begin
        if mdPesquisaid.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;

        if not Assigned(FrmMembroCad) then
        FrmMembroCad            := TFrmMembroCad.Create(Application);
        FrmMembroCad.ParamsStr  := 'N';
        FrmMembroCad.AidEleicao := AIDEleicao;
        FrmMembroCad.AIDChapa   := mdPesquisaid.AsInteger;
        FrmMembroCad.ParamsInt  := 0;
        FrmMembroCad.ShowModal;
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

procedure TFrmEleicaoChapa.CarregarGrid;
var
List    : TObjectList<TModelEleicaoChapa>;
begin
  try
    List    := Nil;
    Try
      List  := TEleicaoChapaController.ListarTodos(TSession.IDEMPRESA, AIDEleicao);

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

        mdPesquisaid.AsInteger        := Item.id;
        mdPesquisacodigo.AsInteger    := Item.codigo;
        mdPesquisasituacao.AsString   := Item.situacao;
        mdPesquisanum_chapa.AsInteger := Item.num_chapa;
        mdPesquisanome_chapa.AsString := Item.nome_chapa;
        mdPesquisaativo.AsString      := Item.ativo;
        mdPesquisaid_eleicao.AsInteger:= Item.id_eleicao;

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

procedure TFrmEleicaoChapa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmEleicaoChapa := nil;
end;

procedure TFrmEleicaoChapa.FormCreate(Sender: TObject);
begin
  inherited;
  ParamsStr := 'N';
  ParamsTela:= 'Eleição';

   if not mdPesquisa.Active then
   begin
    mdPesquisa.Open;
   end;
end;

procedure TFrmEleicaoChapa.FormShow(Sender: TObject);
begin
  inherited;
  try
    TLookupHelper.CarregarLookup(
            Tabeleicao,LookupEleicaoSql);
    Tabeleicao.First;

    if ParamsStr = 'N' then
    begin
      TitleText                 := 'Inscrição de Chapa';
      cxdatacriacao.EditValue   := Date;
      cxstatus.ItemIndex        := 0;
      cxeleicao.EditValue       := AidEleicao;
      cxnumero.SetFocus;
    end;

    CarregarGrid;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmEleicaoChapa.GridCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if not mdpesquisa.Eof then
  begin
    ParamsInt := mdpesquisaid.AsInteger;
  end;
end;

procedure TFrmEleicaoChapa.LimparCampos;
begin
  cxCodigo.Clear;
  cxstatus.ItemIndex  := 0;
  cxnumero.Clear;
  cxchapa.Clear;
  cxdatacriacao.Date  := date;
  cxslogan.Clear;
  cxresponsavel.Clear;
  cxCelular.Clear;
  cxemail.Clear;
  cxobservacao.Clear;
  cxDatahomologacao.Clear;
  cxDataindeferimento.Clear;
  cxmotivo.Clear;
  cxativo.EditValue := 'S';
end;

procedure TFrmEleicaoChapa.PopularCampos;
begin
  inherited;
  try
    Obj  := nil;
    Obj  := TModelEleicaoChapa.Create;

    try
      Obj  := TEleicaoChapaController.BuscarPorID(ParamsInt);

      cxCodigo.EditValue            := Obj.codigo;
      cxstatus.Text                 := Obj.situacao;
      cxnumero.EditValue            := Obj.num_chapa;
      cxchapa.EditValue             := Obj.nome_chapa;
      cxdatacriacao.EditValue       := Obj.data_criacao;
      cxslogan.EditValue            := Obj.slogan;
      cxresponsavel.EditValue       := Obj.representante_chapa;
      cxCelular.EditValue           := Obj.repres_telefone;
      cxemail.EditValue             := Obj.repres_email;
      cxobservacao.EditValue        := Obj.obs;

      cxDatahomologacao.EditValue   := TConeSul.ValidarDataNull(Obj.data_homologacao);
      cxDataindeferimento.EditValue := TConeSul.ValidarDataNull(Obj.data_indeferimento);
      cxmotivo.EditValue            := Obj.motivo_indeferimento;
      cxAtivo.EditValue             := Obj.ativo;
    finally
      FreeandNil(Obj);
    end;
  except on E: Exception do
    raise
  end;
end;

function TFrmEleicaoChapa.Salvar(out msg: string): Boolean;
var
AID:Integer;
AStr:String;
begin
  Result        := False;

  try
    //popular os campos conforme registro
    if ParamsStr = 'N' then
    begin
      Obj           := nil;
      Obj           := TModelEleicaoChapa.Create;

      Obj.id                  := 0;
      Obj.id_eleicao          := cxeleicao.EditValue;
      Obj.situacao            := cxstatus.Text;
      Obj.num_chapa           := Strtoint(cxnumero.Text);
      Obj.nome_chapa          := Trim(cxchapa.Text);
      Obj.data_criacao        := cxdatacriacao.EditValue;
      Obj.slogan              := Trim(cxslogan.Text);
      Obj.representante_chapa := trim(cxresponsavel.Text);
      Obj.repres_telefone     := TiraPontos(cxCelular.Text);
      Obj.repres_email        := Trim(cxemail.Text);
      Obj.obs                 := trim(cxobservacao.Text);
      Obj.ativo               := cxAtivo.EditValue;
      Obj.id_usuario          := TSession.ID_USUARIO;
      Obj.idempresa           := TSession.IDEMPRESA;
      Obj.sinc_app            := 'N';
    end;

    if ParamsStr = 'E' then
    begin
      Obj           := nil;
      Obj           := TModelEleicaoChapa.Create;

      Obj.id                  := ParamsInt;
      Obj.situacao            := cxstatus.Text;
      Obj.num_chapa           := Strtoint(cxnumero.Text);
      Obj.nome_chapa          := Trim(cxchapa.Text);
      Obj.slogan              := Trim(cxslogan.Text);
      Obj.representante_chapa := trim(cxresponsavel.Text);
      Obj.repres_telefone     := TiraPontos(cxCelular.Text);
      Obj.repres_email        := Trim(cxemail.Text);
      Obj.obs                 := trim(cxobservacao.Text);
      Obj.ativo               := cxAtivo.EditValue;
      Obj.sinc_app            := 'N';
    end;

    if ParamsStr = 'H' then
    begin
      Obj                    := nil;
      ObjH                   := TModelEleicaoChapaHomologacao.Create;

      ObjH.id                := ParamsInt;
      ObjH.data_homologacao  := cxDatahomologacao.EditValue;
      ObjH.id_usuario_homol  := TSession.ID_USUARIO;
      ObjH.idempresa         := TSession.IDEMPRESA;
      ObjH.sinc_app           := 'N';
    end;

    if ParamsStr = 'D' then
    begin
      ObjH           := nil;
      ObjH           := TModelEleicaoChapaHomologacao.Create;

      ObjH.id                   := ParamsInt;
      ObjH.data_indeferimento   := cxDataindeferimento.EditValue;
      ObjH.motivo_indeferimento := Trim(cxmotivo.Text);
      ObjH.id_usuario_defe      := TSession.ID_USUARIO;
      ObjH.idempresa            := TSession.IDEMPRESA;
      ObjH.sinc_app              := 'N';
    end;

    Try
      //salvar os dados
      if ParamsStr ='N' then
      begin
        if TEleicaoChapaController.Salvar(Obj, AID, AStr) then
        begin
          Result  := true;
          msg     := 'Registro inserido com sucesso.';
          CarregarGrid;
          LimparCampos;
          cxnumero.SetFocus;
          ParamsStr       := 'N';
          ParamsCloseTela := 'N';
          AcaoBtn;

//          if TConfiguracaoService.ValidarUsoAppEleicao(TSession.idempresa) then
//          begin
//            TConfiguracaoService.SincronizarGravar(102, AID);
//          end;

        end
        else
        begin
          ParamsMsgTela := 'S';
          msg           := AStr;
          Result        := False;
          cxnumero.SetFocus;
        end;
      end;

      if ParamsStr ='E' then
      begin

        if TEleicaoChapaController.Salvar(Obj, AID, AStr) then
        begin
          AID   := ParamsInt;
          Result  := true;
          msg:= 'Registro inserido com sucesso.';
          CarregarGrid;
          LimparCampos;
          cxnumero.SetFocus;
          ParamsStr       := 'N';
          ParamsCloseTela := 'N';
          AcaoBtn;

//          if TConfiguracaoService.ValidarUsoAppEleicao(TSession.idempresa) then
//          begin
//            TConfiguracaoService.SincronizarGravar(102, AID);
//          end;

        end
        else
        begin
          ParamsMsgTela := 'S';
          msg           := AStr;
          Result        := False;
          cxnumero.SetFocus;
        end;
      end;

      if ParamsStr ='H' then
      begin
        if TEleicaoChapaController.SalvarHomologacao(ObjH) then
         begin
          HomologacaoRegistro(1);
          Result  := true;
          msg:= 'Registro homologado com sucesso.';
          CarregarGrid;
          LimparCampos;
          cxnumero.SetFocus;
          ParamsStr       := 'N';
          ParamsCloseTela := 'N';
          AcaoBtn;
         end;
      end;

      if ParamsStr ='D' then
      begin
        if TEleicaoChapaController.SalvarDeferimento(ObjH) then
         begin
          HomologacaoRegistro(1);
          Result  := true;
          msg:= 'Registro indeferido com sucesso.';
          CarregarGrid;
          LimparCampos;
          cxnumero.SetFocus;
          ParamsStr       := 'N';
          ParamsCloseTela := 'N';
          AcaoBtn;
         end;
      end;

    Finally
      FreeAndNil(Obj);
      FreeAndNil(ObjH);
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmEleicaoChapa.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if (cxnumero.text= '') or (cxnumero.EditValue=0) then
  begin
    msg     := 'Informe o número da chapa.';
    Result  := False;
    exit;
  end;

  if (cxchapa.Text='') then
  begin
    msg     := 'Informe o nome da chapa.';
    Result  := False;
    exit;
  end;

  if (cxslogan.Text='') then
  begin
    msg     := 'Informe um slogan.';
    Result  := False;
    exit;
  end;

  if (cxresponsavel.Text='') then
  begin
    msg     := 'Informe um representante.';
    Result  := False;
    exit;
  end;

end;

end.



