unit UnitEleicao;

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
  dxmdaset,Model.Eleicao, Controller.Eleicao, UnitEleicaoConfiguracao,
  UnitEleicaoChapa, UnitEleicaoEleitor, UnitEleicaoComissao, UnitAssembleiaPauta,
  UnitAnexo, uConfiguracaoService;

type
  TFrmEleicao = class(TFormNovoBaseGerenciamento)
    Btneditar: TMenuItem;
    BtnConfigurar: TMenuItem;
    BtnChapas: TMenuItem;
    BtnLeitor: TMenuItem;
    BtnAbrirVotacao: TMenuItem;
    btncomissao: TMenuItem;
    BtnSincronizar: TMenuItem;
    btnAnexo: TMenuItem;
    Auditoria1: TMenuItem;
    Relatrios1: TMenuItem;
    mdPesquisaid_eleicao: TIntegerField;
    cxAtivo: TcxComboBox;
    Label5: TLabel;
    mdPesquisacodigo: TIntegerField;
    mdPesquisanome: TStringField;
    mdPesquisanexercicio: TStringField;
    mdPesquisatipo: TStringField;
    mdPesquisasituacao: TStringField;
    Grid1RecId: TcxGridDBColumn;
    Grid1id_eleicao: TcxGridDBColumn;
    Grid1codigo: TcxGridDBColumn;
    Grid1nome: TcxGridDBColumn;
    Grid1nexercicio: TcxGridDBColumn;
    Grid1tipo: TcxGridDBColumn;
    Grid1situacao: TcxGridDBColumn;
    Grid1ativo: TcxGridDBColumn;
    mdPesquisaativo: TStringField;
    mdPesquisadata: TDateField;
    Grid1Column1: TcxGridDBColumn;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Grid1Column2: TcxGridDBColumn;
    btnPauta: TMenuItem;
    mdPesquisaoperacao: TStringField;
    btnAbrirPagina: TMenuItem;
    procedure btnLimparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtneditarClick(Sender: TObject);
    procedure BtnConfigurarClick(Sender: TObject);
    procedure BtnChapasClick(Sender: TObject);
    procedure BtnLeitorClick(Sender: TObject);
    procedure BtnAbrirVotacaoClick(Sender: TObject);
    procedure btncomissaoClick(Sender: TObject);
    procedure BtnSincronizarClick(Sender: TObject);
    procedure btnPautaClick(Sender: TObject);
    procedure btnAnexoClick(Sender: TObject);
    procedure btnAbrirPaginaClick(Sender: TObject);

  private
    { Private declarations }
  public
    Procedure Novo    ; override;
    Procedure Pesquisa; override;
    Procedure Editar  ; override;

    { Public declarations }
  end;

var
  FrmEleicao  : TFrmEleicao;
  ObjEleicao  : TModelEleicao;
  Conteleicao : TEleicaoController;
implementation

{$R *.dfm}

uses Vcl.Loading, UniteleicaoCad, uJKDialog, Vcl.PermissaoUsuario, Vcl.Session, System.Generics.Collections,
  System.DateUtils, Winapi.ShellAPI;

procedure TFrmEleicao.btnAbrirPaginaClick(Sender: TObject);
var
 AURL :String;
begin
  //Abrir pagina na Web     AbrirURL('https://asmuv.conesulsistemas.com.br')
  AURL:= '';

  if mdPesquisaid_eleicao.AsInteger = 0 then
  begin
    JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
    exit;
  end;

  if TConfiguracaoService.RetornoURLSlugCampanha(mdPesquisaid_eleicao.AsInteger, AURL) then
  begin
    ShellExecute(0, 'open', PChar(AURL), nil, nil, SW_SHOWNORMAL);
  end;

end;

procedure TFrmEleicao.BtnAbrirVotacaoClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
  AAlerta:string;
begin
  //Abrir Votação pra registro selecionado
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

  if Permissao.TemPermissao('Permitir Abrir Eleição') then
  begin
    if mdPesquisaid_eleicao.AsInteger = 0 then
    begin
      JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
      exit;
    end;

    if mdPesquisasituacao.AsString<>'RASCUNHO' then
    begin
      JKDialog('Alerta','Opção válida somente para registro em rascunho', tdAlerta);
      Exit;
    end;

    if JKDialog('Aviso', 'Deseja agendar a eleição selecionada?', tdMensagem)  then
    begin
      Try
        //validar os dados
        if TEleicaoController.AbrirEleicao(mdPesquisaid_eleicao.AsInteger, TSession.IDEMPRESA,AAlerta) then
        begin
          //mudar de status e marcar para sincronizar
          if TEleicaoController.LiberarSincronizacao(mdPesquisaid_eleicao.AsInteger, TSession.IDEMPRESA) then
          JKDialog('Sucesso','Registro marcado para sincronizar', tdSucesso);
          Pesquisa;
        end
        else
        JKDialog('Alerta',AAlerta, tdAlerta);
      Except
        on E: Exception do
        JKDialog('Alerta',AAlerta, tdAlerta);
      End;
    end;

  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);

end;

procedure TFrmEleicao.btnAnexoClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  //anexo
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

  if Permissao.TemPermissao('Permitir Utilizar Anexo') then
  begin
    if mdPesquisaid_eleicao.AsInteger = 0 then
    begin
      JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
      exit;
    end;

    if not Assigned(FrmAnexo) then
    FrmAnexo                  := TFrmAnexo.Create(Application);
    FrmAnexo.ParamsStr        := 'N';
    FrmAnexo.ATipoReferencia  := FrmEleicao.Name;//mdPesquisaid_eleicao.AsInteger;
    FrmAnexo.ARefTela         := ParamsTela;
    FrmAnexo.ParamsInt        := mdPesquisaid_eleicao.AsInteger;

    FrmAnexo.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);

end;

procedure TFrmEleicao.BtnChapasClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  inherited;
  //FrmEleicaoChapa
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

  if Permissao.TemPermissao('Permitir cadastrar chapa') then
  begin
    if mdPesquisaid_eleicao.AsInteger = 0 then
    begin
      JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
      exit;
    end;

    //validar tipo de registro
    if mdPesquisaoperacao.AsString='ASSEMBLEIA' then
    begin
      JKDialog('Alerta','Registro selecionado não e uma eleição.', tdAlerta);
      exit;
    end;

    if not Assigned(FrmEleicaoChapa) then
    FrmEleicaoChapa            := TFrmEleicaoChapa.Create(Application);
    FrmEleicaoChapa.ParamsStr  := 'N';
    FrmEleicaoChapa.AidEleicao := mdPesquisaid_eleicao.AsInteger;
    FrmEleicaoChapa.ParamsInt  := 0;

    FrmEleicaoChapa.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmEleicao.btncomissaoClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  //comissao
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

  if Permissao.TemPermissao('Permitir Cadastrar Comissão') then
  begin
    if mdPesquisaid_eleicao.AsInteger = 0 then
    begin
      JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
      exit;
    end;

    if not Assigned(FrmEleicaoComissao) then
    FrmEleicaoComissao            := TFrmEleicaoComissao.Create(Application);
    FrmEleicaoComissao.ParamsStr  := 'N';
    FrmEleicaoComissao.AidEleicao := mdPesquisaid_eleicao.AsInteger;
    FrmEleicaoComissao.ParamsInt  := 0;

    FrmEleicaoComissao.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmEleicao.BtnConfigurarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  inherited;
  //Configuracao
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

  if Permissao.TemPermissao('Permitir Configurar') then
  begin
    if not Assigned(FrmEleicaoConfiguracao) then
    FrmEleicaoConfiguracao := TFrmEleicaoConfiguracao.Create(Application);
    FrmEleicaoConfiguracao.ParamsStr  := 'E';
    FrmEleicaoConfiguracao.ParamsInt  := mdPesquisaid_eleicao.AsInteger;

    if mdPesquisaid_eleicao.AsInteger = 0 then
    begin
      JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
      exit;
    end;
    FrmEleicaoConfiguracao.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmEleicao.BtneditarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  inherited;

  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

  if Permissao.TemPermissao('Permitir Editar') then
    Editar
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmEleicao.btnLimparClick(Sender: TObject);
begin
  inherited;

  mdPesquisa.Close;
end;

procedure TFrmEleicao.btnPautaClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin  //FrmAssembleiaPauta
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

  if Permissao.TemPermissao('Permitir Cadastrar Questão') then
  begin
    if mdPesquisaid_eleicao.AsInteger = 0 then
    begin
      JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
      exit;
    end;

    //Validar Operacao
    if mdPesquisaOperacao.AsString='ELEIÇÃO' then
    begin
      JKDialog('Alerta','Inválida para a operação selecionada.', tdAlerta);
      exit;
    end;

    if not Assigned(FrmAssembleiaPauta) then
    FrmAssembleiaPauta            := TFrmAssembleiaPauta.Create(Application);
    FrmAssembleiaPauta.ParamsStr  := 'N';
    FrmAssembleiaPauta.AidEleicao := mdPesquisaid_eleicao.AsInteger;
    FrmAssembleiaPauta.ParamsInt  := 0;

    FrmAssembleiaPauta.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);

end;

procedure TFrmEleicao.BtnSincronizarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
  AAlerta:string;
begin
  //Sincronizar dados
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

  if Permissao.TemPermissao('Permitir Sincronizar') then
  begin
    if mdPesquisaid_eleicao.AsInteger = 0 then
    begin
      JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
      exit;
    end;

    if mdPesquisasituacao.AsString='ABERTA' then
    begin
      JKDialog('Alerta','Opção válida somente para registro em rascunho/agendado', tdAlerta);
      Exit;
    end;

    if JKDialog('Aviso', 'Deseja sincronizar a eleição selecionada?', tdMensagem)  then
    begin
      Try
        //validar os dados
        if TEleicaoController.AbrirEleicao(mdPesquisaid_eleicao.AsInteger, TSession.IDEMPRESA,AAlerta) then
        begin
          //mudar de status e marcar para sincronizar
          if TEleicaoController.LiberarSincronizacao(mdPesquisaid_eleicao.AsInteger, TSession.IDEMPRESA) then
          JKDialog('Sucesso','Registro marcado para sincronizar', tdSucesso);
          Pesquisa;
        end
        else
        JKDialog('Alerta',AAlerta, tdAlerta);
      Except
        on E: Exception do
        JKDialog('Alerta',AAlerta, tdAlerta);
      End;
    end;

  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmEleicao.Editar;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
      begin
        if not Assigned(FrmEleicaoCad) then
        FrmEleicaoCad := TFrmEleicaoCad.Create(Application);
        FrmEleicaoCad.ParamsStr  := 'E';
        FrmEleicaoCad.ParamsInt  := mdPesquisaid_eleicao.AsInteger;
        if mdPesquisaid_eleicao.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;
        FrmEleicaoCad.Show;
      end;
    end
    else
    begin
      JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmEleicao.BtnLeitorClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  inherited;
  //leitor
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

  if Permissao.TemPermissao('Permitir visualizar eleitores') then
  begin
    if not Assigned(FrmEleicaoEleitores) then
    FrmEleicaoEleitores             := TFrmEleicaoEleitores.Create(Application);
    FrmEleicaoEleitores.AIDEleicao  := mdPesquisaid_eleicao.AsInteger;

    if mdPesquisaid_eleicao.AsInteger = 0 then
    begin
      JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
      exit;
    end;
    FrmEleicaoEleitores.Show;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmEleicao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmEleicao  := nil;
end;

procedure TFrmEleicao.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;
end;

procedure TFrmEleicao.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'Eleição';
  TitleText   := 'Gerenciar Eleições e Assembleias';
end;

procedure TFrmEleicao.Novo;
begin
  inherited;
   try
    if not Assigned(FrmEleicaoCad) then
    FrmEleicaoCad := TFrmEleicaoCad.Create(Application);
    FrmEleicaoCad.ParamsStr  := 'N';
    FrmEleicaoCad.ShowModal;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmEleicao.Pesquisa;
var
List    : TObjectList<TModelEleicao>;
nCampo, nSituacao, nFiltrarpor  : String;
begin
  inherited;
  try
    List    := Nil;
    nCampo  := '';

    if trim(edtBusca.Text) <> '' then
    nCampo     := Trim(edtBusca.Text);

    case EdtFiltropor.ItemIndex of
      1: nFiltrarpor := 'Rascunho';
      2: nFiltrarpor := 'Não Iniciada';
      3: nFiltrarpor := 'Iniciada';
    end;

    case cxAtivo.ItemIndex of
      1: nSituacao := 'S';
      2: nSituacao := 'N';
    end;

    Conteleicao := TEleicaoController.Create;

    Try
      List  := Conteleicao.ListarTodos(nCampo, nSituacao, LowerCase(nFiltrarpor), EdtDataInicial.EditValue, EdtDataFinal.EditValue);

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

        mdPesquisaid_eleicao.AsInteger    :=Item.id_eleicao;
        mdPesquisacodigo.AsInteger        :=Item.codigo;
        mdPesquisanome.AsString           :=Item.nome;
        mdPesquisanexercicio.AsString     :=Item.nexercicio;
        mdPesquisatipo.AsString           :=Item.tipo;
        mdPesquisasituacao.AsString       :=Item.situacao;
        mdPesquisaativo.AsString          :=Item.ativo;
        mdPesquisadata.AsDateTime         :=item.data;
        mdPesquisaoperacao.AsString       :=item.operacao;

        mdPesquisa.Post;
      end;
      mdPesquisa.First;
      mdPesquisa.EnableControls;

    Finally
      FreeAndNil(Conteleicao);
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



