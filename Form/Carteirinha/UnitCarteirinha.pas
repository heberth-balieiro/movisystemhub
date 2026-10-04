{

Cancelar Carteira principal - cancelar todas vinculadas.



}

unit UnitCarteirinha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseCons, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, Vcl.Menus, frxClass, frxDBSet,
  Vcl.Tabs, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxGDIPlusClasses, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Navigation, UDM, Vcl.Loading,
  Model.Carteirinha, uJKDialog, Model.Empresa, Vcl.Session, UConeSul, DBAccess,
  Uni, Vcl.Validacoes, Vcl.ComCtrls, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxGroupBox, Datasnap.DBClient,Controller.Carteira, Model.Carteira,
  System.Generics.Collections, cxButtons, Vcl.Grids, Vcl.DBGrids, ACBRUTIL,
  UFormNovoBasePesquisa, Vcl.ButtonStylesAttributes, System.ImageList,
  Vcl.ImgList, cxImageList, ACBrBase, ACBrEnterTab, Vcl.StyledButton, dxmdaset;

type
  TFrmCarteira = class(TFormNovoBasePesquisa)
    Gmatricula: TcxGridDBColumn;
    gcodigo: TcxGridDBColumn;
    Associado: TcxGridDBColumn;
    cpf: TcxGridDBColumn;
    Secretaria: TcxGridDBColumn;
    digital: TcxGridDBColumn;
    validade: TcxGridDBColumn;
    frxDBCateira: TfrxDBDataset;
    frxRelatorio: TfrxReport;
    dscarteirinha: TUniDataSource;
    dsDependente: TUniDataSource;
    PopupDependente: TPopupMenu;
    Dependente1: TMenuItem;
    btnnovodependente: TMenuItem;
    btneditardepen: TMenuItem;
    btnexcluirdepen: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    EnviarWhatsAppDependente: TMenuItem;
    GridDependente: TcxGridDBTableView;
    GridDependenteDigital: TcxGridDBColumn;
    GridDependenteCodigo: TcxGridDBColumn;
    GridDependentedependente: TcxGridDBColumn;
    GridDependentecpf: TcxGridDBColumn;
    GridDependenteParentesco: TcxGridDBColumn;
    GridDependenteNascimento: TcxGridDBColumn;
    GridDependenteIDSocio: TcxGridDBColumn;
    Grididsocio: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    GridDependenteSituacao: TcxGridDBColumn;
    GridDependenteiddependente: TcxGridDBColumn;
    GridID: TcxGridDBColumn;
    Gridwhatsapp: TcxGridDBColumn;
    GridDependentewhatsapp: TcxGridDBColumn;
    Gridativo: TcxGridDBColumn;
    cxDigital: TcxComboBox;
    Label3: TLabel;
    mdPesquisa: TdxMemData;
    BtnImprimirCart: TMenuItem;
    N7: TMenuItem;
    BtnEnviarMensagem: TMenuItem;
    N8: TMenuItem;
    BtnSincronizarCarteira: TMenuItem;
    mdPesquisaid_carteira: TIntegerField;
    mdPesquisaid_socio: TIntegerField;
    mdPesquisavalidade: TDateField;
    mdPesquisadigital: TStringField;
    mdPesquisavmatricula: TIntegerField;
    mdPesquisavcodigo: TIntegerField;
    mdPesquisavnome: TStringField;
    mdPesquisavcpf: TStringField;
    mdPesquisavrazaosecretaria: TStringField;
    mdPesquisaapi: TStringField;
    mdPesquisaexcluido: TIntegerField;
    mdPesquisavwhatsapp: TStringField;
    mdPesquisaativo: TStringField;
    GridColumn1: TcxGridDBColumn;
    mdPesquisaDependente: TdxMemData;
    mdPesquisaDependenteid_carteira: TIntegerField;
    mdPesquisaDependentedigital: TStringField;
    mdPesquisaDependenteid_dependente: TIntegerField;
    mdPesquisaDependentevcodigo: TIntegerField;
    mdPesquisaDependentevnome: TStringField;
    mdPesquisaDependentevcpf: TStringField;
    mdPesquisaDependentevparentesco: TStringField;
    mdPesquisaDependenteapi: TStringField;
    mdPesquisaDependenteid_socio: TIntegerField;
    mdPesquisaDependentevnascimento: TDateField;
    mdPesquisaDependenteativo: TStringField;
    mdPesquisaDependenteexcluido: TIntegerField;
    mdPesquisaDependentevwhatsapp: TStringField;
    Btnreativar: TMenuItem;
    btnreativarDependente: TMenuItem;
    mdPesquisadataemissao: TDateField;
    mdPesquisanmusuario: TStringField;
    GridColumn2: TcxGridDBColumn;
    GridColumn3: TcxGridDBColumn;
    mdPesquisaDependentedataemissao: TDateField;
    mdPesquisaDependentenmusuario: TStringField;
    GridDependenteColumn1: TcxGridDBColumn;
    GridDependenteColumn2: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure mdPesquisaAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnEnviarMensagemClick(Sender: TObject);
    procedure BtnEnvioLoteClick(Sender: TObject);
    procedure BtnEnvioSelecionadoClick(Sender: TObject);
    procedure BtnreativarClick(Sender: TObject);
    procedure btnnovodependenteClick(Sender: TObject);
    procedure btneditardepenClick(Sender: TObject);
    procedure btnexcluirdepenClick(Sender: TObject);
    procedure btnreativarDependenteClick(Sender: TObject);
    procedure EnviarWhatsAppDependenteClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnSincronizarCarteiraClick(Sender: TObject);
    procedure GridCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);

  private
    procedure Dependente(AID: integer);
    { Private declarations }
  public
    Procedure Novo        ;override;
    Procedure Pesquisa    ;override;
    Procedure Editar      ;override;
    Procedure Excluir     ;override;
    Procedure Listagem    ;override;
    Procedure Relatorio   ;override;
    { Public declarations }
  end;

var
  FrmCarteira     : TFrmCarteira;
  ContCarteira    : TCarteiraWebController;
  ObjCarteira     : TCarteiraWeb;
implementation

{$R *.dfm}

{ TFrmCarteira }

Uses UnitCadCarteira, UnitCadCarteiraDependente, UnitFrmWhatsApp,
  Vcl.PermissaoUsuario, uConfiguracaoService, System.Math, System.StrUtils;

{$REGION 'Associado'}

procedure TFrmCarteira.BtnEnviarMensagemClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
  PreencherDados  : TDadosMensaagem;
  RetTelefone:string;
begin
  Try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Carteira');

    if Permissao.TemPermissao('Permitir Enviar WhatsApp Associado') then
    begin
      if not mdPesquisa.Eof then
      begin
        if mdPesquisaid_carteira.AsInteger > 0 then
        begin
          //Validar pessoa o recebimento de mensagem por whatsapp
          if TConfiguracaoService.ValidarPessoaReceberWhatsApp(mdPesquisaid_socio.AsInteger, RetTelefone) then
          begin
            if mdPesquisaativo.asstring = 'NÃO' then
            begin
              JKDialog('Aviso','Não e possivel enviar para uma carteira inativa/cancelada!', tdAlerta);
              exit;
            end;

            if (mdPesquisavnome.AsString <> '') or (mdPesquisavWhatsApp.AsString <>'') then
            begin
              if not Assigned(FrmEnviarWhatsApp) then
              FrmEnviarWhatsApp                     := TFrmEnviarWhatsApp.Create(Application);
              PreencherDados.Editpara               := Trim( mdPesquisavnome.AsString);
                  PreencherDados.EditTelefone       := tirapontos(mdPesquisavWhatsApp.AsString);
                  PreencherDados.EditVendedor       := '';
                  PreencherDados.EditCPF            := Tirapontos(mdPesquisavcpf.AsString);
                  PreencherDados.EditMatricula      := mdPesquisavmatricula.AsInteger;
                  PreencherDados.EditIDPessoa       := mdPesquisaid_socio.AsInteger;
                  PreencherDados.EditMensagem       := '';
                  PreencherDados.PreencherTela(FrmEnviarWhatsApp.cxPara,FrmEnviarWhatsApp.cxTelefone,FrmEnviarWhatsApp.cxMensagem);
                  FrmEnviarWhatsApp.ShowModal;
            end
            else
              JKDialog('Aviso','Não foi possivel carregar a tela de envio!', tdAlerta);
            end
          else
          JKDialog('Aviso',
                 'O cadastro não está configurado para receber mensagem via whatsapp.' + sLineBreak +
                 'Por favor, entre em contato com o administrador do sistema.',
                 tdAlerta);
        end
        else
        JKDialog('Aviso','Selecione um registro da lista!', tdAlerta)
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

procedure TFrmCarteira.BtnEnvioLoteClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Carteira');

    if Permissao.TemPermissao('Permitir Sincronizar API') then
    begin
      if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
      begin
        try
          TConfiguracaoService.SincronizarGravar(6, 0);
          JKDialog('Sucesso','Sincronização em execução. Você pode continuar usando o sistema, Aguarde!', tdSucesso);
        except on e:exception do
          begin
            raise;
          end;
        end;
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

procedure TFrmCarteira.BtnEnvioSelecionadoClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Carteira');

    if Permissao.TemPermissao('Permitir Sincronizar API') then
    begin
      if not mdPesquisa.Eof then
      begin
        if mdPesquisaid_carteira.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end
        else
        begin
          if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
          begin
            TConfiguracaoService.SincronizarGravar(6, mdPesquisaid_carteira.AsInteger);
            JKDialog('Sucesso','Sincronização em execução. Você pode continuar usando o sistema, Aguarde!', tdSucesso);
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
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmCarteira.BtnreativarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  //Reativar uma carteira
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Carteira');

    if Permissao.TemPermissao('Permitir reativar carteira') then
    begin
      if not mdPesquisa.Eof then
      begin
        if JKDialog('Aviso', 'Deseja reativar o registro selecionado?', tdMensagem)  then
        begin
          if (mdPesquisaativo.AsString='NÃO') or (mdPesquisaexcluido.asinteger = 1) then
          begin
            if mdPesquisaid_carteira.AsInteger > 0 then
            begin
              Try
                ContCarteira    := Nil;
                ContCarteira    := TCarteiraWebController.Create;

                if ContCarteira.Reativar(mdPesquisaid_socio.AsInteger) then
                JKDialog('Sucesso','Registro ativo com sucesso!', tdsucesso);

                if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
                begin
                  TConfiguracaoService.SincronizarGravar(6, mdPesquisaid_carteira.AsInteger);
                end;
              Finally
                FreeAndNil(ContCarteira);
              End;
            end
            else
            JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
            exit;
          end
          else
          begin
            JKDialog('Alerta','Carteira está ativa!'+ #13 +'Função somente para carteira inativa.', tdAlerta);
            exit;
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
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmCarteira.Editar;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
      begin
        if (mdPesquisaativo.AsString='NÃO') or (mdPesquisaexcluido.asinteger = 1) then
        begin
          JKDialog('Alerta','Carteira está inativa ou cancelada!'+ #13 +'Realize a função de reativação.', tdAlerta);
          exit;
        end;

        if mdPesquisaid_carteira.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end
        else
        begin
          if not Assigned(FrmCarteiraCad) then
          FrmCarteiraCad            := TFrmCarteiraCad.Create(Application);
          FrmCarteiraCad.ParamsStr  := 'E';
          FrmCarteiraCad.ParamsInt  := mdPesquisaid_carteira.AsInteger;
          FrmCarteiraCad.ShowModal;
        end;
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



procedure TFrmCarteira.Excluir;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Confirmação', 'Você realmente deseja cancelar esta carteira?' + #13 +
                  'Todos os registros vinculados a ela também serão cancelados de forma permanente.', tdMensagem)  then
      begin
        if (mdPesquisaativo.AsString='NÃO') or (mdPesquisaexcluido.asinteger = 1) then
        begin
          JKDialog('Alerta','Carteira está inativa ou cancelada!', tdAlerta);
          exit;
        end;

        Try
          ContCarteira    := Nil;
          ObjCarteira     := nil;
          ContCarteira    := TCarteiraWebController.Create;
          ObjCarteira     := TCarteiraWeb.Create;

          if mdPesquisaid_carteira.AsInteger = 0 then
          begin
            JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
            exit;
          end;

          ObjCarteira.id_socio         := mdPesquisaid_socio.AsInteger;
          ObjCarteira.sinc_app         := 'S';
          ObjCarteira.ativo            := 'N';
          ObjCarteira.excluido         := 1;
          ObjCarteira.data_exc         := Now;
          ObjCarteira.id_usuario_exc   := TSession.ID_USUARIO;

          if ContCarteira.CancelarCarteira(ObjCarteira,'id_socio') then
          JKDialog('Sucesso','Registro cancelado com sucesso!', tdsucesso);

          if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
          begin
            TConfiguracaoService.SincronizarGravar(6, mdPesquisaid_carteira.AsInteger);
          end;

        Finally
          FreeAndNil(ContCarteira);
          FreeAndNil(ObjCarteira);
        End;
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

procedure TFrmCarteira.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmCarteira := nil;
end;

procedure TFrmCarteira.FormShow(Sender: TObject);
begin
  inherited;
  try
    ParamsTela  := 'Carteira';
    TitleText   := 'Pesquisa de Carteira';
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmCarteira.GridCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  try
    Dependente(mdPesquisaid_socio.AsInteger);
//    mdPesquisaDependente.Filtered := False;
//    mdPesquisaDependente.Filter   := Format('id_socio = %d',[mdPesquisaid_socio.AsInteger]);
//    mdPesquisaDependente.Filtered := True;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmCarteira.Listagem;
begin
  inherited;
  Try
    JKDialog('Aviso','Entre em contato', tdAlerta);
  except on E: Exception do
    JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
  end;
end;

procedure TFrmCarteira.mdPesquisaAfterScroll(DataSet: TDataSet);
begin
//  try
//    mdPesquisaDependente.Filtered := False;
//    mdPesquisaDependente.Filter   := Format('id_socio = %d',[mdPesquisaid_socio.AsInteger]);
//    mdPesquisaDependente.Filtered := True;
//  except on E: Exception do
//    begin
//      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
//    end;
//  end;


//  mdDetail.SetRangeStart;
//  mdDetail.FieldByName('ID_MASTER').AsInteger := mdMaster.FieldByName('ID').AsInteger;
//  mdDetail.SetRangeEnd;
//  mdDetail.FieldByName('ID_MASTER').AsInteger := mdMaster.FieldByName('ID').AsInteger;
//  mdDetail.ApplyRange;


end;

procedure TFrmCarteira.Novo;
begin
  inherited;
  try
    if not Assigned(FrmCarteiraCad) then
    FrmCarteiraCad            := TFrmCarteiraCad.Create(Application);
    FrmCarteiraCad.ParamsStr  := 'N';
    FrmCarteiraCad.ShowModal;
  except on E: Exception do
    JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
  end;
end;

procedure TFrmCarteira.Pesquisa;
var
List, ListaDependente    : TObjectList<TCarteiraWeb>;
nCampo, nSituacao, nDigital  : String;
begin
  inherited;
  try
    List          := Nil;
    ContCarteira  := nil;
    nCampo        := '';
    nSituacao     := '';
    nDigital      := '';

    if trim(edtBusca.Text) <> '' then
    nCampo     := Trim(edtBusca.Text);

    case cxAtivo.ItemIndex of
      1: nSituacao := 'S';
      2: nSituacao := 'N';
    end;

    case cxDigital.ItemIndex of
      1: nDigital := 'S';
      2: nDigital := 'N';
    end;

    ContCarteira      := TCarteiraWebController.Create;

    Try
      List            := ContCarteira.ListarTodos(nSituacao,nDigital,nCampo);
      ListaDependente := ContCarteira.ListarDependente(0);

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
        mdPesquisaid_carteira.AsInteger     := Item.id_carteira;
        mdPesquisaid_socio.AsInteger        := Item.id_socio;
        if (Item.validade = 00/00/0000) or (Item.validade = strtodate('30/12/1899')) then
        mdPesquisavalidade.Clear
        else
        mdPesquisavalidade.AsDateTime       := Item.validade;
        mdPesquisadigital.AsString          := Item.digital;
        mdPesquisavmatricula.AsInteger      := Item.vMatricula;
        mdPesquisavcodigo.AsInteger         := Item.vCodigo;
        mdPesquisavnome.AsString            := Item.vNome;
        mdPesquisavcpf.AsString             := Item.vCPF;
        mdPesquisavrazaosecretaria.AsString := Item.vRazaosecretaria;
        mdPesquisaapi.AsString              := Item.api;
        mdPesquisaexcluido.AsInteger        := Item.excluido;
        mdPesquisavwhatsapp.AsString        := Item.vWhatsapp;
        mdPesquisaativo.AsString            := Item.ativo;
        mdPesquisadataemissao.AsDateTime    := Item.dataemissao;
        mdPesquisanmusuario.AsString        := Item.nmusuario;
        mdPesquisa.Post;
      end;
      mdPesquisa.First;
      mdPesquisa.EnableControls;

      //Carregar Lista de Dependentes
      mdPesquisaDependente.Close;
      mdPesquisaDependente.FieldDefs.Clear;

      if not mdPesquisaDependente.Active then
        mdPesquisaDependente.Open;

      mdPesquisaDependente.DisableControls;
      try
        for var Dep in ListaDependente do
        begin
          mdPesquisaDependente.Append;
          mdPesquisaDependenteid_carteira.AsInteger       := Dep.id_carteira;
          mdPesquisaDependenteid_socio.AsInteger          := Dep.id_socio;
          mdPesquisaDependentedigital.AsString            := Dep.digital;
          mdPesquisaDependentevcodigo.AsInteger           := Dep.vCodigo;
          mdPesquisaDependentevnome.AsString              := Dep.vNome;
          mdPesquisaDependentevcpf.AsString               := Dep.vCPF;
          mdPesquisaDependenteid_dependente.AsInteger     := Dep.id_dependente;
          mdPesquisaDependentevparentesco.AsString        := Dep.vParentesco;
          mdPesquisaDependenteapi.AsString                := Dep.api;
          if (dep.vNascimento = 00/00/0000) or (dep.vNascimento = strtodate('30/12/1899')) then
          mdPesquisaDependentevnascimento.Clear
          else
          mdPesquisaDependentevnascimento.AsDateTime      := Dep.vNascimento;
          mdPesquisaDependenteativo.AsString              := dep.ativo;
          mdPesquisaDependenteexcluido.AsInteger          := dep.excluido;
          mdPesquisaDependentevwhatsapp.AsString          := dep.vWhatsapp;
          mdPesquisaDependentedataemissao.AsDateTime      := dep.dataemissao;
          mdPesquisaDependentenmusuario.AsString          := dep.nmusuario;

          mdPesquisaDependente.Post;
        end;

      finally
        mdPesquisaDependente.EnableControls;
      end;

    Finally
      FreeAndNil(ContCarteira);
      if Assigned(List) then
        List.Free;
      if Assigned(ListaDependente) then
      ListaDependente.Free;
    End;
  except on E: Exception do
    JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
  end;
end;

Procedure TFrmCarteira.Dependente(AID:integer);
var
ListaDependente    : TObjectList<TCarteiraWeb>;
begin
  inherited;
  try
    ContCarteira  := nil;
    ContCarteira  := TCarteiraWebController.Create;

    Try

      ListaDependente := ContCarteira.ListarDependente(AID);

      //Carregar Lista de Dependentes
      mdPesquisaDependente.Close;
      mdPesquisaDependente.FieldDefs.Clear;

      if not mdPesquisaDependente.Active then
        mdPesquisaDependente.Open;

      mdPesquisaDependente.DisableControls;
      try
        for var Dep in ListaDependente do
        begin
          mdPesquisaDependente.Append;
          mdPesquisaDependenteid_carteira.AsInteger  := Dep.id_carteira;
          mdPesquisaDependenteid_socio.AsInteger     := Dep.id_socio;
          mdPesquisaDependentedigital.AsString       := Dep.digital;
          mdPesquisaDependentevcodigo.AsInteger       := Dep.vCodigo;
          mdPesquisaDependentevnome.AsString          := Dep.vNome;
          mdPesquisaDependentevcpf.AsString           := Dep.vCPF;
          mdPesquisaDependenteid_dependente.AsInteger:= Dep.id_dependente;
          mdPesquisaDependentevparentesco.AsString    := Dep.vParentesco;
          mdPesquisaDependenteapi.AsString           := Dep.api;
          if (dep.vNascimento = 00/00/0000) or (dep.vNascimento = strtodate('30/12/1899')) then
          mdPesquisaDependentevnascimento.Clear
          else
          mdPesquisaDependentevnascimento.AsDateTime := Dep.vNascimento;
          mdPesquisaDependenteativo.AsString         :=dep.ativo;
          mdPesquisaDependenteexcluido.AsInteger     := dep.excluido;
          mdPesquisaDependentevwhatsapp.AsString      := dep.vWhatsapp;

          mdPesquisaDependente.Post;
        end;

      finally
        mdPesquisaDependente.EnableControls;
      end;

    Finally
      FreeAndNil(ContCarteira);
      
      if Assigned(ListaDependente) then
      ListaDependente.Free;
    End;
  except on E: Exception do
    JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
  end;
end;

procedure TFrmCarteira.Relatorio;
begin
  inherited;
  try

  except on E: Exception do
    JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
  end;
end;


{$ENDREGION}

{$REGION 'Depedente'}

procedure TFrmCarteira.btnexcluirdepenClick(Sender: TObject);
begin
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Confirmação', 'Você realmente deseja excluir esta carteira?', tdMensagem)  then
      begin
        if (mdPesquisaDependenteativo.AsString='NÃO') or (mdPesquisaDependenteexcluido.asinteger = 1) then
        begin
          JKDialog('Alerta','Carteira está inativa ou cancelada!', tdAlerta);
          exit;
        end;

        Try
          ContCarteira    := Nil;
          ObjCarteira     := nil;
          ContCarteira    := TCarteiraWebController.Create;
          ObjCarteira     := TCarteiraWeb.Create;

          if mdPesquisaDependenteid_carteira.AsInteger = 0 then
          begin
            JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
            exit;
          end;

          ObjCarteira.id_carteira      := mdPesquisaDependenteid_carteira.AsInteger;
          ObjCarteira.sinc_app         := 'S';
          ObjCarteira.ativo            := 'N';
          ObjCarteira.excluido         := 1;
          ObjCarteira.data_exc         := Now;
          ObjCarteira.id_usuario_exc   := TSession.ID_USUARIO;

          if ContCarteira.CancelarCarteira(ObjCarteira,'id_carteira') then
          JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);

          if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
          begin
            TConfiguracaoService.SincronizarGravar(6, mdPesquisaDependenteid_carteira.AsInteger);
          end;
        Finally
          FreeAndNil(ContCarteira);
          FreeAndNil(ObjCarteira);
        End;
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

procedure TFrmCarteira.BtnLimparClick(Sender: TObject);
begin
  inherited;
  try
    mdPesquisa.Close;
    mdPesquisaDependente.Close;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmCarteira.btnnovodependenteClick(Sender: TObject);
var
Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Carteira');
    if Permissao.TemPermissao('Permitir Novo Dependente') then
    begin
      if not mdPesquisa.Eof then
      begin
        if mdPesquisaid_carteira.AsInteger = 0 then
          begin
            JKDialog('Alerta','Nenhuma carteira de associado selecionado.', tdAlerta);
            exit;
          end
          else
          begin
            if not Assigned(FrmCarteiraCadDependente) then
            FrmCarteiraCadDependente            := TFrmCarteiraCadDependente.Create(Application);
            FrmCarteiraCadDependente.ParamsStr  := 'N';
            FrmCarteiraCadDependente.IDSocio    := mdPesquisaid_socio.AsInteger;
            FrmCarteiraCadDependente.ParamsInt  := 0;
            FrmCarteiraCadDependente.ShowModal;
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
    JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
  end;
end;

procedure TFrmCarteira.btneditardepenClick(Sender: TObject);
var
Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Carteira');

    if Permissao.TemPermissao('Permitir Editar Dependente') then
    begin
      if not mdPesquisa.Eof then
      begin
        if mdPesquisaid_carteira.AsInteger = 0 then
          begin
            JKDialog('Alerta','Nenhuma carteira de associado selecionado.', tdAlerta);
            exit;
          end
          else
          begin
            if mdPesquisaDependenteid_dependente.AsInteger = 0 then
            begin
              JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
            exit;
            end
            else
            begin
              if not Assigned(FrmCarteiraCadDependente) then
              FrmCarteiraCadDependente            := TFrmCarteiraCadDependente.Create(Application);
              FrmCarteiraCadDependente.ParamsStr  := 'E';
              FrmCarteiraCadDependente.IDSocio    := mdPesquisaid_socio.AsInteger;
              FrmCarteiraCadDependente.ParamsInt  := mdPesquisaDependenteid_carteira.AsInteger;
              FrmCarteiraCadDependente.ShowModal;
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
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmCarteira.btnreativarDependenteClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  //Reativar uma carteira
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Carteira');

    if Permissao.TemPermissao('Permitir reativar carteira') then
    begin
      if not mdPesquisa.Eof then
      begin
        if JKDialog('Aviso', 'Deseja reativar o registro selecionado?', tdMensagem)  then
        begin
          if (mdPesquisaDependenteativo.AsString='NÃO') or (mdPesquisaDependenteexcluido.asinteger = 1) then
          begin
            if mdPesquisaDependenteid_carteira.AsInteger > 0 then
            begin
              Try
                ContCarteira    := Nil;
                ContCarteira    := TCarteiraWebController.Create;

                if ContCarteira.ReativarDependente(mdPesquisaDependenteid_carteira.AsInteger) then
                JKDialog('Sucesso','Registro ativo com sucesso!', tdsucesso);

                if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
                begin
                  TConfiguracaoService.SincronizarGravar(6, mdPesquisaDependenteid_carteira.AsInteger);
                end;
              Finally
                FreeAndNil(ContCarteira);
              End;
            end
            else
            JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
            exit;
          end
          else
          begin
            JKDialog('Alerta','Carteira está ativa!'+ #13 +'Função somente para carteira inativa.', tdAlerta);
            exit;
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
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmCarteira.BtnSincronizarCarteiraClick(Sender: TObject);
var
Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Carteira');

    if Permissao.TemPermissao('Permitir Sincronizar API') then
    begin
      if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
      begin
        //Incluir os cadastro para sincronizar
        ContCarteira  := nil;
        ContCarteira    := TCarteiraWebController.Create;

        Try
          if ContCarteira.IncluiRegistroSincronizar then
          begin
            TConfiguracaoService.SincronizarGravar(6, 0);
            JKDialog('Sucesso','Sincronização em execução. Você pode continuar usando o sistema!', tdSucesso);
          end
          else
          JKDialog('Aviso','Comando não execultado!', tdAlerta);

        Finally
          FreeAndNil(ContCarteira);
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

procedure TFrmCarteira.EnviarWhatsAppDependenteClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
  PreencherDados  : TDadosMensaagem;
begin
  inherited;
  Try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Carteira');

    if Permissao.TemPermissao('Permitir Enviar WhatsApp Dependente') then
    begin
      //envir whats dependente
      if not mdPesquisaDependente.Eof then
      begin
        if mdPesquisaDependenteid_carteira.asinteger > 0 then
        begin
          if mdPesquisaDependenteativo.asstring = 'Não' then
          begin
            JKDialog('Aviso','Não e possivel enviar para uma carteira inativa/cancelada!', tdAlerta);
            exit;
          end;

          if (mdPesquisaDependentevnome.asstring <> '') or (mdPesquisaDependentevWhatsapp.asstring<>'') then
          begin
            if not Assigned(FrmEnviarWhatsApp) then
            FrmEnviarWhatsApp                       := TFrmEnviarWhatsApp.Create(Application);
                  PreencherDados.Editpara           := Trim(mdPesquisaDependentevNome.asstring);
                  PreencherDados.EditTelefone       := tirapontos(mdPesquisaDependentevWhatsapp.asstring);
                  PreencherDados.EditVendedor       := '';
                  PreencherDados.EditCPF            := Tirapontos(mdPesquisaDependentevcpf.AsString);
                  PreencherDados.EditMatricula      := mdPesquisavmatricula.asinteger;//mdPesquisaDependentevcodigo.AsInteger;
                  PreencherDados.EditIDPessoa       := mdPesquisaDependenteid_dependente.AsInteger;
                  PreencherDados.EditMensagem       := '';
                  PreencherDados.PreencherTela(FrmEnviarWhatsApp.cxPara,FrmEnviarWhatsApp.cxTelefone,FrmEnviarWhatsApp.cxMensagem);
                  FrmEnviarWhatsApp.ShowModal;
          end
          else
          JKDialog('Aviso','Não foi possivel carregar a tela de envio!', tdAlerta);
        end
        else
        JKDialog('Aviso','Selecione um registro da lista!', tdAlerta)
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

{$ENDREGION}



//
//procedure TFrmCarteira.GridCellClick(Sender: TcxCustomGridTableView;
//  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
//  AShift: TShiftState; var AHandled: Boolean);
//var
//  View: TcxGridTableView;
//begin
//  vIdCarteira := 0;
//  vIDPessoa   := 0;
//  vNome       := '';
//  vWhatsapp   := '';
//  vAtivo      := '';
//  vMatricula  := 0;
//
//  View := Sender as TcxGridTableView;
//
//  if not Assigned(View.Controller.FocusedRecord) then
//  Exit;
//
//  vIdCarteira  := VarAsType(View.Controller.FocusedRecord.Values[GridID.Index], varInteger);
//  vIDPessoa    := VarAsType(View.Controller.FocusedRecord.Values[Grididsocio.Index], varInteger);
//  vNome        := VarAsType(View.Controller.FocusedRecord.Values[Associado.Index], varString);
//  vWhatsapp    := VarAsType(View.Controller.FocusedRecord.Values[Gridwhatsapp.Index], varString);
//  vWhatsapp    := tirapontos(vWhatsapp);
//  vAtivo       := VarAsType(View.Controller.FocusedRecord.Values[Gridativo.Index], varString);
//  vMatricula   := VarAsType(View.Controller.FocusedRecord.Values[Gmatricula.Index], varInteger);
//end;
//
//procedure TFrmCarteira.GridCellDblClick(Sender: TcxCustomGridTableView;
//  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
//  AShift: TShiftState; var AHandled: Boolean);
//var
//  View: TcxGridTableView;
//begin
//  View := Sender as TcxGridTableView;
//
//  if not Assigned(View.Controller.FocusedRecord) then
//  Exit;
//
//  vIdCarteira  := VarAsType(View.Controller.FocusedRecord.Values[GridID.Index], varInteger);
//  vIDPessoa    := VarAsType(View.Controller.FocusedRecord.Values[Grididsocio.Index], varInteger);
//
//  editar;
//end;
//
//procedure TFrmCarteira.GridDependenteCellClick(Sender: TcxCustomGridTableView;
//  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
//  AShift: TShiftState; var AHandled: Boolean);
//var
//  View: TcxGridTableView;
//begin
//  vIdCarteiraDep := 0;
//  vIDPessoaDep   := 0;
//  vNomeDep       := '';
//  vWhatsappDep   := '';
//  vAtivoDep      := '';
//
//  View := Sender as TcxGridTableView;
//
//  if not Assigned(View.Controller.FocusedRecord) then
//  Exit;
//
//  vIdCarteiraDep  := VarAsType(View.Controller.FocusedRecord.Values[GridDependenteid.Index], varInteger);
//  vIDPessoaDep    := VarAsType(View.Controller.FocusedRecord.Values[GridDependenteIDSocio.Index], varInteger);
//  vNomedep        := VarAsType(View.Controller.FocusedRecord.Values[GridDependentedependente.Index], varString);
//  vWhatsappDep    := VarAsType(View.Controller.FocusedRecord.Values[GridDependentewhatsapp.Index], varString);
//  vWhatsappDep    := tirapontos(vWhatsapp);
//  vAtivoDep       := VarAsType(View.Controller.FocusedRecord.Values[GridDependenteSituacao.Index], varString);
//end;
//
//procedure TFrmCarteira.GridDependenteCellDblClick(
//  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
//  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
//var
//  View: TcxGridTableView;
//begin
//  View := Sender as TcxGridTableView;
//
//  if not Assigned(View.Controller.FocusedRecord) then
//  Exit;
//
//  vIdCarteiraDep  := VarAsType(View.Controller.FocusedRecord.Values[GridDependenteid.Index], varInteger);
//  vIDPessoaDep    := VarAsType(View.Controller.FocusedRecord.Values[GridDependenteIDSocio.Index], varInteger);
//
//  EditarDependente();
//
//end;

//procedure TFrmCarteira.GridDependenteStylesGetContentStyle(
//  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
//  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
//begin
//  if not ARecord.IsData then Exit;
//
//  if ARecord.Values[GridDependenteSituacao.Index] = 'INATIVO' then
//    AStyle := Frmprincipal.GridInativo;   // estilo que você criou no StyleRepository
//
//end;



//
//{$ENDREGION}
//
//{$REGION 'Impressao e relatorio'}
//
//procedure TFrmCarteira.btnImprimirClick(Sender: TObject);
//var
//Model     :TModelEmpresa;
//Modelcat  :TModelCarteirinha;
//msg:string;
//TempImage: Timage;
//Permissao: TPermissaoUsuario;
//begin
//  inherited;
//  FreeAndNil(TPermissaoUsuario.FInstance);
//  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Carteira');
//
//  if Permissao.TemPermissao('Permitir Imprimir') then
//  begin
//    //Imprimir Carteira
//
//    if not DM.TabConsCarteira.Eof then
//    begin
//
//      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelCarteiras_Modelo1.fr3');
//
//        Model             := TModelEmpresa.Create;
//        Modelcat          := TModelCarteirinha.Create;
//        Try
//           //Buscar dados da carteira
//          Try
//            Modelcat.ImprimirCarteira(ds.DataSet.FieldByName('id_socio').AsInteger);
//          Finally
//            Modelcat.Free;
//          End;
//
//          Model.idempresa   := TSession.IDEMPRESA;
//          Model.SelectCabecalhoReport(msg);
//
//          FrxRelatorio.Variables.Clear;
//          FrxRelatorio.Variables['nrazao']          :=quotedstr(Model.razao);
//          FrxRelatorio.Variables['nfantasia']       :=quotedstr(model.fantasia);
//          FrxRelatorio.Variables['nendereco']       :=quotedstr(model.endereco);
//          FrxRelatorio.Variables['nnumero']         :=quotedstr(model.numero);
//          FrxRelatorio.Variables['nbairro']         :=quotedstr(model.bairro);
//          FrxRelatorio.Variables['ntelefone']       :=quotedstr(model.telefone);
//          FrxRelatorio.Variables['nfone1']          :=quotedstr(model.telefone2);
//          FrxRelatorio.Variables['nfone2']          :=quotedstr(model.celular);
//          FrxRelatorio.Variables['nemail']          :=quotedstr(model.email1);
//          FrxRelatorio.Variables['ncnpj']           :=quotedstr(model.cnpj);
//          FrxRelatorio.Variables['nie']             :=quotedstr(model.ie);
//
//          TempImage   := TImage.Create(nil);
//          try
//            // Decodifica a imagem Base64 e carrega no fluxo de memória  logo da empresa
//
//            TConesul.ConvBase64Img(model.logo);
//            TempImage.Picture    :=TConesul.nfoto;
//            TConesul.nfoto.Free;
//            TempImage.Picture.SaveToFile(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg');
//          finally
//            TempImage.Free;
//          end;
//
//          TempImage   := TImage.Create(nil);
//          try
//            // foto do associado
//            if DM.TabCarteirinhaImpresso.FieldByName('foto').AsString <>'' then
//            begin
//              TConesul.ConvBase64Img(dscarteirinha.dataset.FieldByName('foto').AsString);
//              TempImage.Picture    :=TConesul.nfoto;
//              TConesul.nfoto.Free;
//              TempImage.Picture.SaveToFile(ExtractFilePath(Application.ExeName)+'Temp\Foto.jpeg');
//            end;
//          finally
//            TempImage.Free;
//          end;
//          FrxRelatorio.Variables['nfoto']           :=quotedstr(ExtractFilePath(Application.ExeName)+'Temp\Foto.jpeg');
//          FrxRelatorio.Variables['wlogo']           :=quotedstr(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg');
//          FrxRelatorio.Variables['ncep']            :=quotedstr(model.cep);
//          FrxRelatorio.Variables['ncidade']         :=quotedstr(model.cidade);
//          FrxRelatorio.Variables['filtro']          :=quotedstr('Carteira ASMUV');
//
//        Finally
//          model.Free;
//        End;
//
//        FrxRelatorio.Report.PrepareReport();
//        FrxRelatorio.ShowReport;
//
//
//    end
//    else
//    begin
//      JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
//    end;
//  end
//  else
//    JKDialog('Acesso Negado',
//             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
//             'Por favor, entre em contato com o administrador do sistema.',
//             tdAlerta);
//
//
//
//
//end;
//
//{$ENDREGION}
//



end.
