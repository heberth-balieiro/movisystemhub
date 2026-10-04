unit UnitAssociadoCad;

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
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, Data.DB, DBAccess, Uni,
  ACBrBase, ACBrEnterTab, ACBrValidador, cxCheckBox, ACBRUTIL, dxBarBuiltInMenu,
  cxPC, dxBevel, cxCurrencyEdit, UConeSul, Vcl.Menus, Model.SindEmpresa,
  UniProfissaoCad, UnitLotacaoCad, UnitSecretariaCadn, UnitBaseNovoCadastro,
  Vcl.ButtonStylesAttributes, Vcl.StyledButton, dxGDIPlusClasses,
  Model.Pessoa, Controller.Pessoa, Datasnap.DBClient, ACBRCEP, cxStyles,
  cxGridTableView, cxClasses, UnitTipoSituacaoCad, UnitLocalTrabalhoCad,Model.SindicatoHistorico;

type
  TFrmAssociadoCad = class(TFormNovoBaseCadastro)
    Label27: TLabel;
    dsCidade: TUniDataSource;
    dsSede: TUniDataSource;
    ACBrValidador1: TACBrValidador;
    dsLotacao: TUniDataSource;
    dsSecretaria: TUniDataSource;
    dsEmpresa: TUniDataSource;
    dsProfissao: TUniDataSource;
    PopCadastro: TPopupMenu;
    Cidade1: TMenuItem;
    Empresa1: TMenuItem;
    Secretria1: TMenuItem;
    Profisso1: TMenuItem;
    Lotao1: TMenuItem;
    Sede1: TMenuItem;
    cxPageControl: TcxPageControl;
    TabDados: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    Label34: TLabel;
    edtFoto: TImage;
    Label36: TLabel;
    edtCodigo: TcxTextEdit;
    edtnome: TcxTextEdit;
    edtapelido: TcxTextEdit;
    edttelefone: TcxMaskEdit;
    edtCelular: TcxMaskEdit;
    edtzap: TcxMaskEdit;
    edtendereco: TcxTextEdit;
    edtNumero: TcxTextEdit;
    edtBairro: TcxTextEdit;
    edtcomplemento: TcxTextEdit;
    edtrg: TcxTextEdit;
    edtctps: TcxTextEdit;
    edtpai: TcxTextEdit;
    edtemail: TcxTextEdit;
    edtmae: TcxTextEdit;
    edtmatricula: TcxTextEdit;
    edtorgao: TcxTextEdit;
    edtserie: TcxTextEdit;
    edtpis: TcxTextEdit;
    edtsexo: TcxComboBox;
    edtcivil: TcxComboBox;
    edtobs: TcxBlobEdit;
    edtsituacao: TcxComboBox;
    edtdata: TcxDateEdit;
    BtnSede: TcxButtonEdit;
    edtcep: TcxButtonEdit;
    BtnCidade: TcxButtonEdit;
    edtcpf: TcxButtonEdit;
    edtnascimento: TcxDateEdit;
    TabAdicionais: TcxTabSheet;
    cxGroupBox2: TcxGroupBox;
    Label32: TLabel;
    Label33: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label21: TLabel;
    Label30: TLabel;
    Label35: TLabel;
    Label39: TLabel;
    Label43: TLabel;
    edtdesativacao: TcxDateEdit;
    edtpercdesconto: TcxCurrencyEdit;
    edtsalario: TcxCurrencyEdit;
    edtmensalidade: TcxComboBox;
    edtSecretaria: TcxLookupComboBox;
    edtProfissao: TcxLookupComboBox;
    edtEmpresa: TcxLookupComboBox;
    edtlotacao: TcxLookupComboBox;
    edtLimite: TcxCurrencyEdit;
    edtFuncao: TcxTextEdit;
    Label42: TLabel;
    edtAviso: TcxBlobEdit;
    edtbloqueado: TcxCheckBox;
    edtenviaremail: TcxCheckBox;
    edtenviarwhats: TcxCheckBox;
    BtnSecretaria: TcxButtonEdit;
    BtnEmpresaSind: TcxButtonEdit;
    BtnProfissao: TcxButtonEdit;
    BtnLotacao: TcxButtonEdit;
    edtadmissao: TcxDateEdit;
    dxBevel2: TdxBevel;
    TabSede: TClientDataSet;
    TabCidade: TClientDataSet;
    TabCidadeid_cidade: TIntegerField;
    TabCidadecidade: TStringField;
    TabCidadeuf: TStringField;
    TabCidadencidade: TStringField;
    TabSindEmpresa: TClientDataSet;
    TabSindEmpresasind_id_empresa: TIntegerField;
    TabSindEmpresacodigo: TIntegerField;
    TabSindEmpresadescricao: TStringField;
    TabSindEmpresaid_sede: TIntegerField;
    TabSindEmpresaativo: TStringField;
    TabSindEmpresanempresa: TStringField;
    TabSecretaria: TClientDataSet;
    TabSecretariaid_secretaria: TIntegerField;
    TabSecretariacodigo: TIntegerField;
    TabSecretariarazao: TStringField;
    TabSecretariansecretaria: TStringField;
    TabSindProfissao: TClientDataSet;
    TabSindProfissaoid_profissao: TIntegerField;
    TabSindProfissaocodigo: TIntegerField;
    TabSindProfissaodescricao: TStringField;
    TabSindProfissaoativo: TStringField;
    TabSindProfissaonprofissao: TStringField;
    TabSindLotacao: TClientDataSet;
    TabSindLotacaoid_lotacao: TIntegerField;
    TabSindLotacaocodigo: TIntegerField;
    TabSindLotacaodescricao: TStringField;
    TabSindLotacaoativo: TStringField;
    TabSindLotacaonlotacao: TStringField;
    TabSedeid_sede: TIntegerField;
    TabSederazao: TStringField;
    TabSedefantasia: TStringField;
    TabSedecnpj: TStringField;
    TabSedecelular: TStringField;
    TabSedesedeprincipal: TStringField;
    TabSedensede: TStringField;
    edtSede: TcxLookupComboBox;
    EdtCidade: TcxLookupComboBox;
    edtnatural: TcxLookupComboBox;
    cxTipoSituacao: TcxLookupComboBox;
    BtnTiposituacao: TcxButtonEdit;
    Label44: TLabel;
    cxLocalTrabalho: TcxLookupComboBox;
    btnLocalTrabalho: TcxButtonEdit;
    Label45: TLabel;
    TabTipoSituacao: TClientDataSet;
    TabLocalTrabalho: TClientDataSet;
    dsTipoSituacao: TUniDataSource;
    dsLocalTrabalho: TUniDataSource;
    TabTipoSituacaoid_situacao: TIntegerField;
    TabTipoSituacaodescricao: TStringField;
    TabTipoSituacaonpesquisa: TStringField;
    TabLocalTrabalhoid_local: TIntegerField;
    TabLocalTrabalhodescricao: TStringField;
    TabLocalTrabalhonpesquisa: TStringField;
    Label46: TLabel;
    cxCepProf: TcxButtonEdit;
    Label47: TLabel;
    cxEnderecoProf: TcxTextEdit;
    Label48: TLabel;
    cxNumeroProf: TcxTextEdit;
    Label49: TLabel;
    cxBairroProf: TcxTextEdit;
    Label50: TLabel;
    cxComplementoProf: TcxTextEdit;
    Label51: TLabel;
    cxCidadeProf: TcxLookupComboBox;
    Label52: TLabel;
    cxTelefoneProf: TcxMaskEdit;
    Label53: TLabel;
    cxCelularProf: TcxMaskEdit;
    Label54: TLabel;
    GrupoRefiliacao: TcxGroupBox;
    Label55: TLabel;
    cxDatadesfiliar: TcxDateEdit;
    Label56: TLabel;
    cxmotivo: TcxLookupComboBox;
    Label57: TLabel;
    cxresponsavel: TcxLookupComboBox;
    Label58: TLabel;
    cxdocumento: TcxTextEdit;
    cxobsrefiliacao: TcxBlobEdit;
    Label59: TLabel;
    TabMotivo: TClientDataSet;
    TabMotivoid_motivo: TIntegerField;
    TabMotivodescricao: TStringField;
    TabMotivonpesquisa: TStringField;
    TabResponsavel: TClientDataSet;
    TabResponsavelid_usuario: TIntegerField;
    TabResponsavelnome: TStringField;
    TabResponsavelid_funcionario: TIntegerField;
    dsresponsavel: TUniDataSource;
    dsmotivo: TUniDataSource;
    procedure edtmatriculaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtFotoDblClick(Sender: TObject);
    procedure BtnSedePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BtnCidadePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BtnEmpresaSindPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BtnSecretariaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BtnProfissaoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BtnLotacaoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtcepPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure BtnTiposituacaoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnLocalTrabalhoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCepProfPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);

  private
    procedure Permissao;
    procedure GravarHistorico(const AIDRegistro:integer);

    { Private declarations }
  public
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;
    { Public declarations }
  end;

var
  FrmAssociadoCad : TFrmAssociadoCad;
  ContPessoa      : TPessoaController;
  ObjPessoa       : TPESSOA;
  ObjHistorico    : TSindicatoHistorico;
implementation

{$R *.dfm}

Uses uJKDialog, Vcl.Validacoes,Vcl.Session, Vcl.PermissaoUsuario, uConfiguracaoService,
  Controller.LookupHelper, UnitGlobal, UnitSedeCad, UnitCadCidade, UnitEmpCad,
  UCEPService;

{TODO -oOwner -cGeneral : ActionItem}

procedure TFrmAssociadoCad.BtnCidadePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  try
    try
      if not Assigned(FrmCadCidade) then
      FrmCadCidade := TFrmCadCidade.Create(Application);
      FrmCadCidade.ParamsStr  := 'N';
      FrmCadCidade.ShowModal;
    finally
      TLookupHelper.CarregarLookup(
                  TabCidade,LookupCidadeSql);
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAssociadoCad.BtnEmpresaSindPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  try
    Try
      if not Assigned(FrmEmpCad) then
      FrmEmpCad := TFrmEmpCad.Create(Application);
      //FrmEmpCad.ParamsStr  := 'N';
      FrmEmpCad.ShowModal;
    Finally
      TLookupHelper.CarregarLookup(
                  TabSindEmpresa,LookupEmpresaSindsql);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAssociadoCad.btnLocalTrabalhoPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  try
    try
      if not Assigned(FrmLocalTrabalhoCad) then
      FrmLocalTrabalhoCad := TFrmLocalTrabalhoCad.Create(Application);
      FrmLocalTrabalhoCad.ShowModal;
    finally
      TLookupHelper.CarregarLookup(
                  TabLocalTrabalho,LookupsindicatoLocalTrabalho);
    end;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;

end;

procedure TFrmAssociadoCad.BtnLotacaoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  try
    Try
      if not Assigned(FrmLotacaoCad) then
      FrmLotacaoCad := TFrmLotacaoCad.Create(Application);
      //FrmLotacaoCad.ParamsStr  := 'N';
      FrmLotacaoCad.ShowModal;
    Finally
      TLookupHelper.CarregarLookup(
                  TabsindLotacao,LookupLotacaoSql);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAssociadoCad.BtnProfissaoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  try
    Try
      if not Assigned(FrmProfissaoCad) then
      FrmProfissaoCad := TFrmProfissaoCad.Create(Application);
      //FrmProfissaoCad.ParamsStr  := 'N';
      FrmProfissaoCad.ShowModal;
    Finally
      TLookupHelper.CarregarLookup(
                  TabsindProfissao,LookupProfissaoSql);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAssociadoCad.BtnSecretariaPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  try
    try
      if not Assigned(FrmSecretariaCadN) then
      FrmSecretariaCadN := TFrmSecretariaCadN.Create(Application);
      //FrmSecretariaCadN.ParamsStr  := 'N';
      FrmSecretariaCadN.ShowModal;
    finally
      TLookupHelper.CarregarLookup(
                  TabSecretaria,LookupSecretariaSql);
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmAssociadoCad.BtnSedePropertiesButtonClick(Sender: TObject;
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

procedure TFrmAssociadoCad.BtnTiposituacaoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  try
    try
      if not Assigned(FrmTipoSituacaoCad) then
      FrmTipoSituacaoCad := TFrmTipoSituacaoCad.Create(Application);
      FrmTipoSituacaoCad.ShowModal;
    finally
      TLookupHelper.CarregarLookup(
                  TabTipoSituacao,LookupSindicatoTipoSituacao);
    end;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;

end;

procedure TFrmAssociadoCad.cxCepProfPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Svc: ICEPService;
  R: TCEPResultado;
  Err: string;
begin
  try
      Svc       := TCEPService.Create(wsRepublicaVirtual);
      if Svc.Buscar(Tirapontos(cxcepprof.Text), R, Err) then
      begin
        cxenderecoprof.Text    := R.Logradouro;
        cxBairroprof.Text      := R.Bairro;
        cxCidadeprof.EditValue := R.IdCidade;
        cxcomplementoprof.Text := R.Complemento;
      end
      else
        JKDialog('Aviso',err, tdAlerta);

  except on E: Exception do
    Begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    End;
  end;
end;

procedure TFrmAssociadoCad.edtcepPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Svc: ICEPService;
  R: TCEPResultado;
  Err: string;
begin
  try
      Svc       := TCEPService.Create(wsRepublicaVirtual);
      if Svc.Buscar(Tirapontos(edtcep.Text), R, Err) then
      begin
        edtendereco.Text    := R.Logradouro;
        edtBairro.Text      := R.Bairro;
        EdtCidade.EditValue := R.IdCidade;
        edtcomplemento.Text := R.Complemento;
      end
      else
        JKDialog('Aviso',err, tdAlerta);

  except on E: Exception do
    Begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    End;
  end;
end;

procedure TFrmAssociadoCad.edtFotoDblClick(Sender: TObject);
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

procedure TFrmAssociadoCad.edtmatriculaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Exit;

  if not CharInSet(Key, ['0'..'9', #8]) then
    Key := #0;
end;

procedure TFrmAssociadoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  TConeSul.nfoto:=nil;
  FrmAssociadoCad := Nil;
end;

procedure TFrmAssociadoCad.FormCreate(Sender: TObject);
begin
  inherited;
  if TConfiguracaoService.usarSubModSindicato(TSession.IDEMPRESA) then
    begin
      cxTipoSituacao.Enabled  := True;
      BtnTiposituacao.Enabled := true;
      cxLocalTrabalho.Enabled := true;
      btnLocalTrabalho.Enabled:= true;
      cxCepProf.Enabled       := true;
      cxenderecoprof.Enabled  := true;
      cxnumeroprof.Enabled    := true;
      cxbairroprof.Enabled    := true;
      cxcomplementoprof.Enabled := true;
      cxcidadeprof.Enabled    := true;
      cxtelefoneprof.Enabled  := true;
      cxcelularprof.Enabled   := true;

    end
    else
    begin
      cxTipoSituacao.Enabled  := false;
      BtnTiposituacao.Enabled := false;
      cxLocalTrabalho.Enabled := false;
      btnLocalTrabalho.Enabled:= false;
      cxCepProf.Enabled       := false;
      cxenderecoprof.Enabled  := false;
      cxnumeroprof.Enabled    := false;
      cxbairroprof.Enabled    := false;
      cxcomplementoprof.Enabled := false;
      cxcidadeprof.Enabled    := false;
      cxtelefoneprof.Enabled  := false;
      cxcelularprof.Enabled   := false;
    end;
end;

procedure TFrmAssociadoCad.FormShow(Sender: TObject);
begin
  inherited;
  Try
    TLookupHelper.CarregarLookup(
                  TabSede,LookupSedeSql);

    TLookupHelper.CarregarLookup(
                  TabCidade,LookupCidadeSql);

    TLookupHelper.CarregarLookup(
                  TabSindEmpresa,LookupEmpresaSindsql);

    TLookupHelper.CarregarLookup(
                  TabsindProfissao,LookupProfissaoSql);

    TLookupHelper.CarregarLookup(
                  TabsindLotacao,LookupLotacaoSql);

    TLookupHelper.CarregarLookup(
                  TabSecretaria,LookupSecretariaSql);

    if TConfiguracaoService.usarSubModSindicato(TSession.IDEMPRESA) then
    begin
      TLookupHelper.CarregarLookup(
                  TabTipoSituacao,LookupSindicatoTipoSituacao);

      TLookupHelper.CarregarLookup(
                  TabLocalTrabalho,LookupsindicatoLocalTrabalho);
    end;


    cxPageControl.ActivePage  := TabDados;
    Permissao;
    if ParamsStr = 'N' then
    begin
      TitleText   := 'Novo Associado';
      edtsituacao.Properties.ReadOnly := True;
      edtmatricula.SetFocus;
    end;
    if ParamsStr = 'E' then
    begin
      TitleText   := 'Editar Associado';
      PopularCampos;
      edtsituacao.Properties.ReadOnly := True;
      edtcpf.Properties.ReadOnly  := True;
    end;

    if ParamsStr = 'R' then
    begin
      TLookupHelper.CarregarLookup(
                  TabResponsavel,LookupUsuarioLoginSql);

      TLookupHelper.CarregarLookup(
                  TabMotivo,LookupSindicatoMotivoAfiliar);

      TitleText   := 'Refiliar Associado';
      GrupoRefiliacao.Visible := True;
      edtcpf.Properties.ReadOnly  := True;
      PopularCampos;
    end;

  Except on e:exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  End;
end;

procedure TFrmAssociadoCad.PopularCampos;
begin
  inherited;
  try
    ObjPessoa        := Nil;
    ContPessoa       := Nil;

    ObjPessoa        := TPESSOA.Create;
    ContPessoa       := TPessoaController.Create;
    Try

        ObjPessoa    := ContPessoa.BuscarPorID(ParamsInt);
        if Assigned(ObjPessoa) then
        begin
          edtCodigo.EditValue       := ObjPessoa.codigo;
          edtmatricula.EditValue    := ObjPessoa.matricula;
          edtdata.EditValue         := TConeSul.ValidarDataNull(ObjPessoa.sociodeste);
          edtsede.EditValue         := ObjPessoa.idsede;
          edtnome.EditValue         := ObjPessoa.nome;
          edtapelido.EditValue      := ObjPessoa.apelido;
          edtcep.EditValue          := ObjPessoa.cep;
          edtendereco.EditValue     := ObjPessoa.endereco;
          edtNumero.EditValue       := ObjPessoa.numero;
          edtBairro.EditValue       := ObjPessoa.bairro;
          edtcomplemento.EditValue  := ObjPessoa.complemento;
          edtcidade.EditValue       := ObjPessoa.idcidade;
          edttelefone.EditValue     := ObjPessoa.telefone;
          edtCelular.EditValue      := ObjPessoa.celular;
          edtzap.EditValue          := ObjPessoa.whatsapp;
          edtcpf.EditValue          := ObjPessoa.cpf;
          edtrg.EditValue           := ObjPessoa.rg;
          edtorgao.EditValue        := ObjPessoa.orgao;
          edtctps.EditValue         := ObjPessoa.ctps;
          edtserie.EditValue        := ObjPessoa.serie;
          edtpis.EditValue          := ObjPessoa.pis;
          edtsexo.EditValue         := ObjPessoa.sexo;
          edtcivil.EditValue        := ObjPessoa.civil;
          edtnascimento.EditValue   := TConeSul.ValidarDataNull(ObjPessoa.nascimento);
          edtnatural.EditValue      := ObjPessoa.naturalde;
          edtemail.EditValue        := ObjPessoa.email;
          edtpai.EditValue          := ObjPessoa.pai;
          edtmae.EditValue          := ObjPessoa.mae;
          edtsituacao.EditValue     := ObjPessoa.situacao;
          edtobs.EditValue          := ObjPessoa.obs;
          edtAviso.EditValue        := ObjPessoa.aviso;
          edtbloqueado.EditValue    := ObjPessoa.bloqueado;
          edtenviaremail.EditValue  := ObjPessoa.envemail;
          edtenviarwhats.EditValue  := ObjPessoa.envwhats;
          edtEmpresa.EditValue      := ObjPessoa.sindidempresa;
          edtSecretaria.EditValue   := ObjPessoa.idescritorio;
          edtProfissao.EditValue    := ObjPessoa.idprofissao;
          edtlotacao.EditValue      := ObjPessoa.idlotacao;
          edtpercdesconto.EditValue := ObjPessoa.desconto;
          edtsalario.EditValue      := ObjPessoa.salario;
          edtLimite.EditValue       := ObjPessoa.limite;
          edtmensalidade.EditValue  := ObjPessoa.mensalidade;
          edtadmissao.EditValue     := TConeSul.ValidarDataNull(ObjPessoa.admissao);
          edtFuncao.EditValue       := ObjPessoa.profissao;
          cxTipoSituacao.EditValue  := objPessoa.id_tiposituacao;
          cxLocalTrabalho.EditValue := ObjPessoa.id_localtrabalho;

          cxCepProf.EditValue       := ObjPessoa.ProfCEP;
          cxenderecoprof.EditValue  := ObjPessoa.ProfEndereco;
          cxnumeroprof.EditValue    := ObjPessoa.ProfNumero;
          cxbairroprof.EditValue    := ObjPessoa.ProfBairro;
          cxcomplementoprof.EditValue:= ObjPessoa.ProfComplemento;
          cxcidadeprof.EditValue    := ObjPessoa.ProfIDCidade;
          cxtelefoneprof.EditValue  := ObjPessoa.ProfTelefone;
          cxcelularprof.EditValue   := ObjPessoa.celular2;


          if ObjPessoa.foto <> '' then
          begin
            TConesul.ConvBase64Img(ObjPessoa.foto);
            edtFoto.Picture         := TConeSul.nfoto;
            TConeSul.nfoto.Free;
          end;
          edtmatricula.SetFocus;
        end
        else
        begin
          JKDialog('Aviso','Não foi possivel carregar os dados.', tdAlerta);
          exit;
        end;

    Finally
      ObjPessoa.Free;
      ContPessoa.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmAssociadoCad.Salvar(out msg: string): Boolean;
var
AId:Integer;
begin
  try
    Result      := False;
    ContPessoa  := nil;
    ObjPessoa   := nil;

    ContPessoa  := TPessoaController.Create;
    ObjPessoa   := TPESSOA.Create;

    Try
      if ParamsStr='N' then
      ObjPessoa.idsocio     := 0
      else
      ObjPessoa.idsocio     := ParamsInt;
      ObjPessoa.matricula   := edtmatricula.EditValue;
      if edtdata.EditValue = Null then
      ObjPessoa.sociodeste  := Nulldate
      else
      ObjPessoa.sociodeste  := edtdata.EditValue;
      ObjPessoa.idsede      := edtsede.EditValue;
      ObjPessoa.nome        := Trim(edtnome.Text);
      ObjPessoa.apelido     := Trim(edtapelido.Text);
      ObjPessoa.cep         := TiraPontos(edtcep.Text);
      ObjPessoa.endereco    := Trim(edtendereco.Text);
      ObjPessoa.numero      := Trim(edtNumero.Text);
      ObjPessoa.bairro      := Trim(edtBairro.Text);
      ObjPessoa.complemento := trim(edtcomplemento.Text);
      ObjPessoa.idcidade    := edtcidade.EditValue;
      ObjPessoa.telefone    := TiraPontos(edttelefone.Text);
      ObjPessoa.celular     := TiraPontos(edtCelular.Text);
      ObjPessoa.whatsapp    := TiraPontos(edtzap.Text);
      ObjPessoa.cpf         := TiraPontos(edtcpf.Text);
      ObjPessoa.rg          := Trim(edtrg.Text);
      ObjPessoa.orgao       := Trim(edtorgao.Text);
      ObjPessoa.ctps        := Trim(edtctps.Text);
      ObjPessoa.serie       := Trim(edtserie.Text);
      ObjPessoa.pis         := Trim(edtpis.Text);
      ObjPessoa.sexo        := edtsexo.Text;
      ObjPessoa.civil       := edtcivil.Text;
      if edtnascimento.EditValue = Null then
      ObjPessoa.nascimento  := NullDate
      else
      ObjPessoa.nascimento  := edtnascimento.EditValue;
      ObjPessoa.naturalde   := edtnatural.EditValue;
      ObjPessoa.email       := Trim(edtemail.Text);
      ObjPessoa.pai         := Trim(edtpai.Text);
      ObjPessoa.mae         := Trim(edtmae.Text);
      ObjPessoa.situacao    := edtsituacao.Text;
      ObjPessoa.obs         := Trim(edtobs.Text);
      ObjPessoa.aviso       := Trim(edtAviso.Text);
      ObjPessoa.bloqueado   := edtbloqueado.EditValue;
      ObjPessoa.envemail    := edtenviaremail.EditValue;
      ObjPessoa.envwhats    := edtenviarwhats.EditValue;
      ObjPessoa.sindidempresa := edtEmpresa.EditValue;
      ObjPessoa.idescritorio  := edtSecretaria.EditValue;
      ObjPessoa.idprofissao   := edtProfissao.EditValue;
      ObjPessoa.idlotacao     := edtlotacao.EditValue;
      ObjPessoa.desconto      := edtpercdesconto.EditValue;
      ObjPessoa.salario       := edtsalario.EditValue;
      ObjPessoa.limite        := edtLimite.EditValue;
      ObjPessoa.mensalidade   := edtmensalidade.Text;
      if edtadmissao.EditValue = Null then
      ObjPessoa.admissao      := NullDate
      else
      ObjPessoa.admissao      := edtadmissao.EditValue;
      ObjPessoa.profissao     := Trim(edtFuncao.Text);
      ObjPessoa.cliente		    := 'S';
      ObjPessoa.app			      := 'N';
      ObjPessoa.fornecedor    := 'N';
      ObjPessoa.dtdesativado  := NullDate;
      ObjPessoa.idempresa	    := TSession.IDEMPRESA;
      ObjPessoa.emissaorg     := NullDate;
      ObjPessoa.sincapp       := 'S';
      ObjPessoa.clitipo       := 'Física';

      ObjPessoa.id_tiposituacao	:= cxTipoSituacao.EditValue;
      ObjPessoa.id_localtrabalho:= cxLocalTrabalho.EditValue;
      ObjPessoa.ProfCEP         := TiraPontos(cxCepProf.Text);
      ObjPessoa.ProfEndereco    := Trim(cxenderecoprof.Text);
      ObjPessoa.ProfNumero      := Trim(cxnumeroprof.Text);
      ObjPessoa.ProfBairro      := Trim(cxbairroprof.Text);
      ObjPessoa.ProfComplemento := Trim(cxcomplementoprof.Text);
      ObjPessoa.ProfIDCidade    := cxcidadeprof.EditValue;
      ObjPessoa.ProfTelefone    := TiraPontos(cxtelefoneprof.Text);
      ObjPessoa.celular2        := TiraPontos(cxcelularprof.Text);
      objpessoa.idusuario       := TSession.ID_USUARIO;

      if edtFoto.Picture.Graphic <> nil then
      begin
        ObjPessoa.foto      := TConeSul.ConvImgBase64(edtfoto);
        TConeSul.nfoto:= nil;
      end;

      if ContPessoa.Salvar(ObjPessoa, AId) then
      begin
        if AID = 0 then
        AID     := ParamsInt;
        msg     := 'Registro salvo com sucesso, ID: '+IntToStr(AId);

        if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
        begin
          TConfiguracaoService.SincronizarGravar(4, AId);
        end;

        //Refiliar
        if ParamsStr = 'R' then
        GravarHistorico(ParamsInt);

        Result  := true;
        ParamsCloseTela := 'S';
      end;
    Finally
      FreeAndNil(ContPessoa);
      FreeAndNil(ObjPessoa);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmAssociadoCad.ValidarCampos(out msg: string): Boolean;
var
cod:integer;
begin
  try
    Result  := True;

    if (edtmatricula.Text='') then
    begin
      msg     := 'Informe a matricula!';
      result  := False;
      Exit;
    end;

    if (edtsede.Text= '') or (edtsede.EditValue=0) then
    begin
      msg     := 'Selecione uma sede!';
      result  := False;
      Exit;
    end;

    if (edtnome.Text ='') or (Length(edtnome.Text) < 5) then
    begin
      msg     := 'Informe o nome completo!';
      Result  := False;
      Exit;
    end;

    if (edtcidade.Text='') or (edtcidade.EditValue=0) then
    begin
      msg     := 'Informe uma cidade!';
      Result  := False;
      exit;
    end;


    if (edtcpf.Text='') then
    begin
      msg     := 'Informe um CPF!';
      result  := False;
      Exit;
    end;

    if (edtsexo.Text='') or (edtsexo.ItemIndex =-1) then
    begin
      msg     := 'Informe o sexo!';
      Result  := False;
      exit;
    end;

    if (edtcivil.Text='') or (edtcivil.ItemIndex =-1) then
    begin
      msg     := 'Informe o estado cívil!';
      Result  := False;
      exit;
    end;

    if (edtnatural.Text='') or (edtnatural.EditValue=0) then
    begin
      msg     := 'Informe a naturalidade!';
      Result  := False;
      exit;
    end;

    if (edtcpf.Text <>'') or  (edtcpf.Text<> '000.000.000-00') then
    begin
      ACBrValidador1.TipoDocto := docCPF;
      ACBrValidador1.Documento := edtcpf.EditValue;
      if not ACBrValidador1.Validar then
      msg     := ACBrValidador1.MsgErro;
      if msg = '' then
      Result  := True
      else
      Result  := False;
      exit;
    end;

    //Validar se o cadastro já existe.
    if ParamsStr ='N' then
    begin
      if (TiraPontos(edtcpf.Text) <> '') then
      begin
        if TConfiguracaoService.ValidarCadastroExitAssociado(cod,TiraPontos(edtcpf.Text)) then
        begin
          Result  := False;
          msg     := 'Associado já tem um cadastro!'+#13+'Código: '+inttostr(cod);
          exit;
        end;
      end;
    end;

    if (edtsecretaria.Text='') or (edtsecretaria.EditValue = 0) then
    begin
      msg     := 'Informe a secretaria!';
      Result  := False;
      exit;
    end;

    if (edtprofissao.Text='') or (edtprofissao.EditValue = 0) then
    begin
      msg     := 'Informe a profissão!';
      Result  := False;
      exit;
    end;

    //validar refiliação
    if cxDatadesfiliar.text='' then
    begin
      msg     := 'Informe uma data!';
      Result  := False;
      exit;
    end;

    if edtsituacao.text='' then
    begin
      msg     := 'Informe uma situação!';
      Result  := False;
      exit;
    end;

    if (cxmotivo.text='') or (cxmotivo.EditValue=0) then
    begin
      msg     := 'Informe um motivo!';
      Result  := False;
      exit;
    end;

    if (cxresponsavel.text='') or (cxresponsavel.EditValue=0) then
    begin
      msg     := 'Informe um responsável!';
      Result  := False;
      exit;
    end;


  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

Procedure TFrmAssociadocad.Permissao;
var
  Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Associados/Dependentes');

    if Permissao.TemPermissao('Permitir Bloquear') then
    begin
      edtbloqueado.Enabled  := True;
    end
    else
    begin
      edtbloqueado.Enabled  := False;
    end;

    if Permissao.TemPermissao('Permitir Alterar Matrícula') then
    begin
      edtmatricula.Enabled  := True;
    end
    else
    begin
      edtmatricula.Enabled  := False;
    end;

   if Permissao.TemPermissao('Permitir Alterar Limite') then
    begin
      edtLimite.Enabled  := True;
    end
    else
    begin
      edtLimite.Enabled  := False;
    end;

    if Permissao.TemPermissao('Permitir Alterar % de Desconto') then
    begin
      edtpercdesconto.Enabled  := True;
    end
    else
    begin
      edtpercdesconto.Enabled  := False;
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

Procedure TFrmAssociadoCad.GravarHistorico(const AIDRegistro:integer);
begin
  try

    ObjHistorico  := nil;
    ObjHistorico  := TSindicatoHistorico.Create;

    Try
      ObjHistorico.id_historico           := 0;
      ObjHistorico.id_associado           := AIDRegistro;
      ObjHistorico.data_filiacao          := edtdata.EditValue;
      ObjHistorico.situacao_nova          := edtsituacao.Text;
      ObjHistorico.id_motivo              := cxmotivo.EditValue;
      ObjHistorico.observacao             := Trim(cxobsrefiliacao.Text);
      ObjHistorico.id_usuario             := cxresponsavel.EditValue;
      ObjHistorico.documento_protocolo    := Trim(cxdocumento.Text);
      ObjHistorico.id_empresa_nova        := edtEmpresa.EditValue;
      ObjHistorico.id_secretaria_nova     := edtSecretaria.EditValue;
      ObjHistorico.id_lotacao_nova        := edtlotacao.EditValue;
      ObjHistorico.id_profissao_nova      := edtProfissao.EditValue;
      ObjHistorico.matricula_nova         := edtmatricula.EditValue;
      ObjHistorico.bloqueou_desconto      := 'N';
      ObjHistorico.inativar_cadastro      := 'N';
      ObjHistorico.inativar_carteira      := 'N';
      ObjHistorico.id_empresa             := TSession.idempresa;
      ObjHistorico.data_criacao           := Now;
      ObjHistorico.cor                    := 'clNavy';
      ObjHistorico.tipo                   := 'REFILIAÇÃO';

      ContPessoa.RefiliarAssociado(ObjHistorico);

    Finally
      FreeAndNil(ObjHistorico);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

end.



