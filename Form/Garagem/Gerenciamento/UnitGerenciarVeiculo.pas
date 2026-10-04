unit UnitGerenciarVeiculo;

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
  Vcl.StdCtrls, Vcl.Buttons, cxCurrencyEdit, cxContainer, cxGroupBox;

type
  TFrmGerenciarVeiculo = class(TFrmModeloConsulta)
    Visualizar1: TMenuItem;
    N2: TMenuItem;
    RetiradaConsignado1: TMenuItem;
    Fotos1: TMenuItem;
    Anexos1: TMenuItem;
    N3: TMenuItem;
    DespesaAvulsa1: TMenuItem;
    ClienteInteresse1: TMenuItem;
    N4: TMenuItem;
    EnviarFicha1: TMenuItem;
    MensagemMassa1: TMenuItem;
    btnSincronizar: TMenuItem;
    TabFiltroOperacao: TTabSet;
    TabFiltroSituacao: TTabSet;
    pButoon: TPanel;
    TabFiltroDisponivel: TTabSet;
    GridAnexo: TcxGridDBColumn;
    GridFoto: TcxGridDBColumn;
    GridPlaca: TcxGridDBColumn;
    GridVeiculo: TcxGridDBColumn;
    GridModelo: TcxGridDBColumn;
    GridDias: TcxGridDBColumn;
    GridVenda: TcxGridDBColumn;
    GridDespesas: TcxGridDBColumn;
    GridLucro: TcxGridDBColumn;
    GridEstoque: TcxGridDBColumn;
    GridLocalEstoque: TcxGridDBColumn;
    GridColumn1: TcxGridDBColumn;
    GridColumn2: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure btnSincronizarClick(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
    procedure Fotos1Click(Sender: TObject);
    procedure Anexos1Click(Sender: TObject);
  private
    Procedure AbrirFormAnexoFoto;
    procedure AbrirFormAnexoDocumento;
    { Private declarations }
  public
    { Public declarations }
    Procedure Pesquisa;override;
    procedure OpenCadTela(id: integer;str:string);override;
    Procedure editar;override;
    Procedure Excluir;override;
    Procedure VisualizarRegistro;
  end;

var
  FrmGerenciarVeiculo: TFrmGerenciarVeiculo;

implementation

{$R *.dfm}

uses  Vcl.Navigation, UnitCadVeiculo, Model.Produto, Vcl.Loading,
  uJKDialog, UDM, Vcl.Validacoes, Vcl.Session, Vcl.PermissaoUsuario,
  UnitVeiculoFoto, UnitVeiculoAnexoDoc, uConfiguracaoService;

{ TFrmGerenciarVeiculo }

procedure TFrmGerenciarVeiculo.Anexos1Click(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,tela);

  if Permissao.TemPermissao('Permitir Anexar Documento') then
    AbrirFormAnexoDocumento
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmGerenciarVeiculo.btnSincronizarClick(Sender: TObject);
var

msg:string;
Permissao: TPermissaoUsuario;
begin
  inherited;
  {
    * Sincronizar dados com API enviar Bot.
    * Quando enviar tem que colocar todos os veiculos para sincronizar como 'S'. ok
    * Validar se o usuário pode ou não sincronizar veiculo. ok
    * Validar se tem configuração ativa. ok
  }

  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Controle Veículo');

  if Permissao.TemPermissao('Permitir Sincronizar Dados') then
  begin

        if TConfiguracaoService.ValidarUsoAppVeiculo(TSession.idempresa) then
        begin
          try
            if TConfiguracaoService.SincronizarGravar(20, 0) then//veiculo
            dm.VeiculoAtivarSincronizacao('S', TSession.IDEMPRESA);

          except on e:exception do
            begin
              msg   := 'Erro ao gravar registro para sincronizar:'+#13+e.Message;
              raise;
            end;
          end;
        end
        else
        JKDialog('Aviso','Sistema não habilitado para essa função!', tdAlerta);

  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmGerenciarVeiculo.editar;
begin
  inherited;
  if not DM.TabConsultaVeiculo.Eof then
  begin
    if ds.DataSet.FieldByName('id_veiculo').AsInteger > 0 then
    begin
      OpenCadTela(ds.DataSet.FieldByName('id_veiculo').AsInteger,'E');
    end
    else
    JKDialog('Aviso','Selecione um registro da lista!', tdAlerta)
  end
  else
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  end;
end;

procedure TFrmGerenciarVeiculo.Excluir;
var
msg:string;
Model :TModelVeiculo;
begin
  inherited;
  if not DM.TabConsultaVeiculo.Eof then
    begin

      if JKDialog('Aviso', 'Deseja excluir o veículo selecionado?', tdMensagem)  then
      begin

          TLoading.ExecuteThread(procedure
          begin
            Model                   := TModelVeiculo.Create;
            Try
              Model.idempresa   := TSession.IDEMPRESA;
              Model.idusuario   := TSession.ID_USUARIO;
              Model.Excluir(msg,ds.DataSet.FieldByName('id_veiculo').AsInteger);

            Finally
              model.Free;
            End;
          end, TerminateDelete);

      end;

    end
    else
    begin
      JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
    end;
end;

procedure TFrmGerenciarVeiculo.FormShow(Sender: TObject);
begin
  inherited;
  Tela  := 'Controle Veículo';
end;

procedure TFrmGerenciarVeiculo.Fotos1Click(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,tela);

  if Permissao.TemPermissao('Permitir Anexar Foto') then
    AbrirFormAnexoFoto
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

Procedure TFrmGerenciarVeiculo.AbrirFormAnexoFoto;
begin
  if not DM.TabConsultaVeiculo.Eof then
  begin
    if ds.DataSet.FieldByName('id_veiculo').AsInteger > 0 then
    begin

      TNavigation.ParamInt          := ds.DataSet.FieldByName('id_veiculo').AsInteger;
      TNavigation.ParamsStr         := 'E';
      TNavigation.OpenModal(TFrmVeiculoFoto, FrmVeiculoFoto);

    end
    else
    JKDialog('Aviso','Selecione um registro da lista!', tdAlerta)
  end
  else
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  end;
end;

Procedure TFrmGerenciarVeiculo.AbrirFormAnexoDocumento;
begin
  if not DM.TabConsultaVeiculo.Eof then
  begin
    if ds.DataSet.FieldByName('id_veiculo').AsInteger > 0 then
    begin

      TNavigation.ParamInt          := ds.DataSet.FieldByName('id_veiculo').AsInteger;
      TNavigation.ParamsStr         := 'E';
      TNavigation.OpenModal(TFrmVeiculoAnexoDoc, FrmVeiculoAnexoDoc);

    end
    else
    JKDialog('Aviso','Selecione um registro da lista!', tdAlerta)
  end
  else
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  end;
end;

procedure TFrmGerenciarVeiculo.OpenCadTela(id: integer; str: string);
begin
  inherited;
  //TNavigation.ExecuteOnClose    := Pesquisa;
  TNavigation.ParamInt          := id;
  TNavigation.ParamsStr         := str;
  TNavigation.OpenModal(TFrmCadVeiculo, FrmCadVeiculo);
end;

procedure TFrmGerenciarVeiculo.Pesquisa;
var
msg:string;
Model :TModelVeiculo;
begin
  inherited;
    Model   := TModelVeiculo.Create;
    Try
      Try
        if Model.PesquisaVeiculo(msg, TabFiltroSituacao.TabIndex, TabFiltroDisponivel.TabIndex, TabFiltroOperacao.TabIndex, trim(edtBusca.Text)) then

      Except on e:exception do
        begin
          JKDialog('Erro',msg, tdErro);
          raise;
        end;
      end;

    Finally
      FreeAndNIl(Model);
    End;

end;

procedure TFrmGerenciarVeiculo.Visualizar1Click(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,tela);

  if Permissao.TemPermissao('Permitir Visualizar') then
    VisualizarRegistro
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

Procedure TFrmGerenciarVeiculo.VisualizarRegistro;
begin
  if not DM.TabConsultaVeiculo.Eof then
  begin
    if ds.DataSet.FieldByName('id_veiculo').AsInteger > 0 then
    begin
      OpenCadTela(ds.DataSet.FieldByName('id_veiculo').AsInteger,'V');
    end
    else
    JKDialog('Aviso','Selecione um registro da lista!', tdAlerta)
  end
  else
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  end;
end;

end.
