unit UnitEleicaoEleitor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic,
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
  dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Vcl.Menus, dxGDIPlusClasses, Vcl.ComCtrls,
  cxContainer, Vcl.ButtonStylesAttributes,
  System.ImageList, Vcl.ImgList, cxImageList, DBAccess, Uni, ACBrBase,
  ACBrEnterTab, Vcl.StyledButton, cxMaskEdit, cxDropDownEdit, cxTextEdit,
  cxGroupBox, UFormNovoBaseGerenciamento, dxCore, cxDateUtils, cxCalendar,
  dxmdaset,Controller.EleicaoEleitor, Model.EleicaoEleitor, UnitEleicaoConfiguracao,
  UnitEleicaoChapa, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Datasnap.DBClient, UnitGlobal, UnitPessoaAdicionar, uConfiguracaoService,
  UnitFrmWhatsAppMassa;

type
  TFrmEleicaoEleitores = class(TFormNovoBaseGerenciamento)
    Btnsincronizar: TMenuItem;
    Relatrios1: TMenuItem;
    cxAtivo: TcxComboBox;
    Label5: TLabel;
    Grid1RecId: TcxGridDBColumn;
    Grid1id_eleicao: TcxGridDBColumn;
    Grid1codigo: TcxGridDBColumn;
    Grid1nome: TcxGridDBColumn;
    Grid1nexercicio: TcxGridDBColumn;
    Grid1tipo: TcxGridDBColumn;
    Grid1situacao: TcxGridDBColumn;
    Grid1ativo: TcxGridDBColumn;
    Label6: TLabel;
    edtSecretaria: TcxLookupComboBox;
    Label7: TLabel;
    EdtCidade: TcxLookupComboBox;
    edtlotacao: TcxLookupComboBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    cxEleicao: TcxLookupComboBox;
    Label12: TLabel;
    TabSecretaria: TClientDataSet;
    TabSecretariaid_secretaria: TIntegerField;
    TabSecretariacodigo: TIntegerField;
    TabSecretariarazao: TStringField;
    TabSecretariansecretaria: TStringField;
    dsSecretaria: TUniDataSource;
    TabSindLotacao: TClientDataSet;
    TabSindLotacaoid_lotacao: TIntegerField;
    TabSindLotacaocodigo: TIntegerField;
    TabSindLotacaodescricao: TStringField;
    TabSindLotacaoativo: TStringField;
    TabSindLotacaonlotacao: TStringField;
    dsLotacao: TUniDataSource;
    TabCidade: TClientDataSet;
    TabCidadeid_cidade: TIntegerField;
    TabCidadecidade: TStringField;
    TabCidadeuf: TStringField;
    TabCidadencidade: TStringField;
    dsCidade: TUniDataSource;
    TabEleicao: TClientDataSet;
    TabEleicaoid_eleicao: TIntegerField;
    TabEleicaocodigo: TIntegerField;
    TabEleicaonome: TStringField;
    TabEleicaonpesquisa: TStringField;
    dsEleicao: TUniDataSource;
    mdPesquisaid_eleitor: TIntegerField;
    mdPesquisaid_eleicao: TIntegerField;
    mdPesquisaid_associado: TIntegerField;
    mdPesquisasinc_app: TStringField;
    mdPesquisasituacao: TStringField;
    mdPesquisasocio_codigo: TIntegerField;
    mdPesquisasocio_matricula: TIntegerField;
    mdPesquisasocio_nome: TStringField;
    mdPesquisasocio_secretaria: TStringField;
    btnexcluir: TMenuItem;
    mdPesquisasocio_telefone: TStringField;
    Grid1Column1: TcxGridDBColumn;
    mdPesquisasincronizacao: TStringField;
    N1: TMenuItem;
    N2: TMenuItem;
    btn_enviarcampanha: TMenuItem;
    procedure btnLimparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnsincronizarClick(Sender: TObject);
    procedure btnexcluirClick(Sender: TObject);
    procedure btn_enviarcampanhaClick(Sender: TObject);

  private

    { Private declarations }
  public
    AIDEleicao    :Integer;
    Procedure Novo    ; override;
    Procedure Pesquisa; override;
    { Public declarations }
  end;

var
  FrmEleicaoEleitores  : TFrmEleicaoEleitores;
  Obj   : TModelEleicaoEleitor;
implementation

{$R *.dfm}

uses Vcl.Loading, uJKDialog, Vcl.PermissaoUsuario, Vcl.Session, System.Generics.Collections,
  System.DateUtils,Controller.LookupHelper;

procedure TFrmEleicaoEleitores.BtnsincronizarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  //sincronizar registro todos
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

  if Permissao.TemPermissao('Permitir sincronizar eleitores') then
  begin
    if TEleicaoEleitorController.MarcarSincronizar(AIDEleicao) then
    begin
      JKDialog('Sucesso','Registro marcado para sincronizar.', tdsucesso);
    end;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmEleicaoEleitores.btn_enviarcampanhaClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  //enviar campanha via whatsapp
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Associados/Dependentes');

  if Permissao.TemPermissao('Permitir Enviar WhatsApp Massa') then
  begin
    if not mdPesquisa.Eof then
    begin
      if not Assigned(FrmEnviarWhatsAppMassa) then
      FrmEnviarWhatsAppMassa            := TFrmEnviarWhatsAppMassa.Create(Application);
      FrmEnviarWhatsAppMassa.AIdCampanha:= AIDEleicao;
      FrmEnviarWhatsAppMassa.ShowModal;
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
end;

procedure TFrmEleicaoEleitores.btnexcluirClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  //excluir
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

  if Permissao.TemPermissao('Permitir excluir eleitores') then
  begin
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
      begin
        if mdPesquisaid_eleitor.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;

        if TEleicaoEleitorController.Excluir(mdPesquisaid_eleitor.AsInteger) then
        begin
          Pesquisa;
          JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
        end;
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
end;

procedure TFrmEleicaoEleitores.btnLimparClick(Sender: TObject);
begin
  edtSecretaria.EditValue := 0;
  edtlotacao.EditValue    := 0;
  edtcidade.EditValue     := 0;
  EdtFiltropor.ItemIndex  := 0;
  cxAtivo.ItemIndex       := 0;
  mdPesquisa.Close;
end;

procedure TFrmEleicaoEleitores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmEleicaoEleitores  := nil;
end;

procedure TFrmEleicaoEleitores.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;
end;

procedure TFrmEleicaoEleitores.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'Eleição';
  TitleText   := 'Eleitores/Participantes da Eleição/Assembleia';

  Try
    TLookupHelper.CarregarLookup(
            Tabeleicao,LookupEleicaoSql);
    Tabeleicao.First;

    TLookupHelper.CarregarLookup(
            TabSecretaria,LookupSecretariaSql);
    TabSecretaria.First;

    TLookupHelper.CarregarLookup(
            TabSindLotacao,LookupLotacaoSql);
    TabSindLotacao.First;

    TLookupHelper.CarregarLookup(
            TabCidade,LookupCidadeSql);
    TabCidade.First;

    if AIDEleicao > 0 then
      cxeleicao.EditValue := AIDEleicao;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;

end;

procedure TFrmEleicaoEleitores.Novo;
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

  if Permissao.TemPermissao('Permitir adicionar eleitores') then
  begin
    try
      if not Assigned(FrmPessoaAdicionar) then
      FrmPessoaAdicionar            := TFrmPessoaAdicionar.Create(Application);
      FrmPessoaAdicionar.AOrigem    := 'E';
      FrmPessoaAdicionar.AIDEleicao := AIDEleicao;
      FrmPessoaAdicionar.ShowModal;
      Pesquisa;
    except on E: Exception do
      begin
        JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
      end;
    end;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);

end;

procedure TFrmEleicaoEleitores.Pesquisa;
var
List    : TObjectList<TModelEleicaoEleitor>;
FiltroCampo, FiltroSituacao, FiltroSincronizacao  : String;
FiltroSecretaria, FiltroLotacao, FiltroCidade: Integer;
begin
  inherited;
  try
    List                := Nil;
    FiltroCampo         := '';
    FiltroSituacao      := '';
    FiltroSincronizacao := '';

    FiltroSecretaria    := 0;
    FiltroLotacao       := 0;
    FiltroCidade        := 0;

    if trim(edtBusca.Text) <> '' then
      FiltroCampo       := Trim(edtBusca.Text);// buscar pelo nome, cpf, codigo, matricula, cpf

    case EdtFiltropor.ItemIndex of
      1: FiltroSituacao := 'A';
      2: FiltroSituacao := 'C';
      3: FiltroSituacao := 'B';
    end;

    case cxAtivo.ItemIndex of
      1: FiltroSincronizacao := 'S';
      2: FiltroSincronizacao := 'N';
    end;

    if edtsecretaria.Text <> '' then
      FiltroSecretaria  := edtsecretaria.EditValue;

    if edtlotacao.Text <> '' then
      FiltroLotacao  := edtlotacao.EditValue;

    if edtcidade.Text <> '' then
      FiltroCidade  := edtcidade.EditValue;

    Try
      List  := TEleicaoEleitorController.ListarTodos(AIDEleicao,
                                FiltroCampo,
                                FiltroSituacao,
                                FiltroSincronizacao,
                                FiltroSecretaria,
                                FiltroLotacao,
                                FiltroCidade);

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

        mdPesquisaid_eleitor.AsInteger      := Item.id_eleitor;
        mdPesquisaid_eleicao.AsInteger      := Item.id_eleicao;
        mdPesquisaid_associado.AsInteger    := Item.id_associado;
        mdPesquisasinc_app.AsString         := Item.sinc_app;
        mdPesquisasituacao.AsString         := Item.situacao;
        mdPesquisasocio_codigo.AsInteger    := Item.socio_codigo;
        mdPesquisasocio_matricula.AsInteger := Item.socio_matricula;
        mdPesquisasocio_nome.AsString       := Item.socio_nome;
        if Item.socio_secretaria ='' then
        mdPesquisasocio_secretaria.AsString := 'Não Informado'
        else
        mdPesquisasocio_secretaria.AsString := Item.socio_secretaria;
        mdPesquisasocio_telefone.AsString   := Item.socio_telefone;
        mdPesquisasincronizacao.AsString    := Item.sincronizacao;

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

end.



