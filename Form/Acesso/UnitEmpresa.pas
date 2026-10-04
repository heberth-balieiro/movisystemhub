unit UnitEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Navigation, cxGraphics,
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
  cxClasses, cxGridCustomView, cxGrid, Vcl.Menus, dxGDIPlusClasses, ACBrBase,
  ACBrEnterTab, cxMaskEdit, UFormNovoBasePesquisa;

type
  TFrmEmpresa = class(TFormNovoBasePesquisa)
    pHeader: TPanel;
    Label4: TLabel;
    Panel2: TPanel;
    btnNovo: TSpeedButton;
    ds: TDataSource;
    pBusca: TPanel;
    Panel7: TPanel;
    btnBusca: TSpeedButton;
    edtBusca: TEdit;
    cxGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    coll1: TcxGridDBColumn;
    coll3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    cxGridDBTableView1Column5: TcxGridDBColumn;
    Popup: TPopupMenu;
    btnvisualizar: TMenuItem;
    N1: TMenuItem;
    btnlistagem: TMenuItem;
    btnrelatorio: TMenuItem;
    PPopPap: TPanel;
    Image1: TImage;
    N2: TMenuItem;
    btnEmail: TMenuItem;
    ConectarDispositivo1: TMenuItem;
    N3: TMenuItem;
    LimparDados1: TMenuItem;
    SincronizarAPP1: TMenuItem;
    N4: TMenuItem;
    btnAtivarApp: TMenuItem;
    btn_ConfigNFe: TMenuItem;
    btneditar: TMenuItem;
    btnexcluir: TMenuItem;
    pLimpar: TPanel;
    btnLimpar: TSpeedButton;
    N5: TMenuItem;
    btnsincronizarempVeiculo: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure btnvisualizarClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure ConectarDispositivo1Click(Sender: TObject);

    procedure FormShow(Sender: TObject);
    procedure cxGridDBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure LimparDados1Click(Sender: TObject);
    procedure SincronizarAPP1Click(Sender: TObject);
    procedure btnAtivarAppClick(Sender: TObject);
    procedure btn_ConfigNFeClick(Sender: TObject);
    procedure btneditarClick(Sender: TObject);
    procedure btnexcluirClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnlistagemClick(Sender: TObject);
    procedure btnrelatorioClick(Sender: TObject);
    procedure btnsincronizarempVeiculoClick(Sender: TObject);
  private
    bookmark: TBookmark;

    procedure OpenCadTela(id: integer;str:string);
    procedure RefreshTela;
    procedure TerminateBusca(Sender: TObject);
    procedure TerminateDelete(Sender: TObject);
    function BuscarConfigEmail(id: integer): Boolean;
    procedure CarregarDadosGrid;
    function BuscarConfigNfe(out idconf: integer; id: integer): Boolean;
    Function CriaRegistroConfig(out msg:string; out idconf:integer):boolean;
    function HabilitarMenus: Boolean;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEmpresa: TFrmEmpresa;

implementation

{$R *.dfm}

uses Vcl.Loading, Model.Empresa, UDM, uJKDialog, Model.Email, UnitEmailcad,
  UnitQrCodeWhatsApp,  AppVendas, UConeSul, Model.ConfNF,
  UnitConfiguracao, UnitGlobal, Vcl.Validacoes, Vcl.PermissaoUsuario,
  Vcl.Session, uConfiguracaoService;

procedure TFrmEmpresa.OpenCadTela(id: integer;str:string);
begin
  TNavigation.ExecuteOnClose    := RefreshTela;
  TNavigation.ParamInt          := id;
  TNavigation.ParamsStr         := Str;
  //TNavigation.OpenModal(TFrmEmpresaCad, FrmEmpresaCad);
end;

procedure TFrmEmpresa.RefreshTela; //1 acao
begin
  CarregarDadosGrid;

  {TLoading.Show;

      TLoading.ExecuteThread(procedure
      begin
          ds.DataSet.Close;
          cxGridDbtableview1.DataController.DataSource := nil;

      end,
      TerminateBusca);}
end;

procedure TFrmEmpresa.SincronizarAPP1Click(Sender: TObject);
var
Model :TModelAppVendas;
ModelVal : TValidacao;
Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Empresa');

  if Permissao.TemPermissao('Permitir Sincronizar APP Pedido') then
  begin
    if not dm.TabConsEmpresa.Eof then
    begin
      if ds.DataSet.FieldByName('id_empresa').AsInteger > 0 then
      begin
        //Validar para ver se está habilitado para usar o app
        ModelVal      := TValidacao.create;
        Try
          if not ModelVal.ValidarUsoApp(ds.DataSet.FieldByName('id_empresa').AsInteger) then
          begin
            JKDialog('Aviso','Função não habilitada!', tdAlerta);
            exit;
          end;
        Finally
          ModelVal.free;
        End;


        //Sincronizar dados com o APP Inserir ou Atualizar

        TLoading.ShowNovo(FrmEmpresa,'Sincronizando empresa...');

        try
          TThread.CreateAnonymousThread(
          procedure
          begin
            Try
              Model := TModelAppVendas.Create;
              Try
                Model.SincronizarEmpresa;
              Finally

              End;
              TThread.Synchronize(TThread.CurrentThread,
              procedure
              begin
                TLoading.Hide;
              end);

            Except on e:exception do
              begin
                TThread.Synchronize(TThread.CurrentThread,
                procedure
                begin
                  TLoading.Hide;
                  ShowMessage('Erro durante a sincronização: ' + E.Message);
                end);
              end;
            End;
          end).Start;

        except
          TLoading.Hide;
        end;





      end
      else
      JKDialog('Aviso','Selecione um registro da lista!', tdAlerta);

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

procedure TFrmEmpresa.CarregarDadosGrid;
var
Empresa : TModelEmpresa;
msg:string;
begin

  Try
    Try
      Empresa    := TModelEmpresa.Create;
      if Empresa.Pesquisa(msg, trim(edtBusca.Text)) then
      else
      JKDialog('Aviso',msg, tdAlerta);
    Except on e:exception do
      begin
      raise
      end;
    End;

  Finally
    Empresa.Free;
  End;

end;

procedure TFrmEmpresa.TerminateBusca(Sender: TObject);
begin
  TLoading.Hide;
  cxGridDbtableview1.DataController.DataSource := ds;


  if Sender is TThread then
  if Assigned(TThread(Sender).FatalException) then
  begin
    JKDialog('Erro',Exception(TThread(sender).FatalException).Message, tdErro);
    exit;
  end;

  if bookmark <> nil then
  try
    cxGridDbtableview1.DataController.DataSource.DataSet.GotoBookmark(bookmark);
    bookmark := nil;
  except
  end;

  cxgrid.SetFocus;

end;

procedure TFrmEmpresa.TerminateDelete(Sender: TObject);
begin
  TLoading.Hide;

  if Sender is TThread then
  if Assigned(TThread(Sender).FatalException) then
  begin
    JKDialog('Erro',Exception(TThread(sender).FatalException).Message, tdErro);
    exit;
  end;

  RefreshTela;
end;

Function TFrmEmpresa.BuscarConfigEmail(id:integer):Boolean;
var
Email : TModelEmail;
smg:string;
begin
  Try
    Email       := Tmodelemail.Create;

    email.idempresa   := id;

    if Email.Select(smg) then
    result  := True
    else
    result  := False;

  Finally
    Email.free;
  End;
end;

Function TFrmEmpresa.BuscarConfigNfe(out idconf:integer; id:integer):Boolean;
var
Model : TModelConfNf;
smg:string;
begin
  Try
    Model       := TModelConfNf.Create;
    if Model.SelectExits(smg, idconf,id) then
    result  := True
    else
    result  := False;

  Finally
    Model.free;
  End;
end;

Function TFrmEmpresa.CriaRegistroConfig(out msg:string; out idconf:integer):boolean;
var
Model : TModelConfNf;
smg:string;
begin
  Try
    Model       := TModelConfNf.Create;

    Model.NfeAmbiente     := 0;

    if Model.Insert(smg, idconf) then
    result  := True
    else
    result  := False;

  Finally
    Model.free;
  End;
end;

{$REGION 'Acao Botoes'}

procedure TFrmEmpresa.btnNovoClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Empresa');

  if Permissao.TemPermissao('Permitir Criar Novo') then
  begin
    JKDialog('Aviso','Função não habilitada!', tdAlerta);
    Exit;
    OpenCadTela(0,'N');
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmEmpresa.btnrelatorioClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Empresa');

  if Permissao.TemPermissao('Permitir Relatório') then
  begin
    JKDialog('Aviso','Em desenvolvimento.', tdAlerta);
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmEmpresa.btnsincronizarempVeiculoClick(Sender: TObject);
var
Model    : TModelAppVendas;
ModelVal : TValidacao;
Permissao: TPermissaoUsuario;
begin
  //funcao para sincronizar dados com API em produção

  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Empresa');

  if Permissao.TemPermissao('Permitir Sincronizar Dados Empresa') then
  begin
    if not dm.TabConsEmpresa.Eof then
    begin
      if ds.DataSet.FieldByName('id_empresa').AsInteger > 0 then
      begin
        //Validar para ver se está habilitado para usar o app
        if not TConfiguracaoService.ValidarUsoAppVeiculo(ds.DataSet.FieldByName('id_empresa').AsInteger) then
        begin
          JKDialog('Aviso','Função não habilitada!', tdAlerta);
          exit;
        end;

        // Enviar a solicitacao para o Bot Service enviar para API.
        TConfiguracaoService.SincronizarGravar(19, ds.DataSet.FieldByName('id_empresa').AsInteger);

      end
      else
      JKDialog('Aviso','Selecione um registro da lista!', tdAlerta);

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

procedure TFrmEmpresa.btneditarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Empresa');

  if Permissao.TemPermissao('Permitir Editar') then
  begin
    if not dm.TabConsEmpresa.Eof then
    begin
      if ds.DataSet.FieldByName('id_empresa').AsInteger > 0 then
      begin
        BookMark  := cxGridDbtableview1.DataController.DataSource.DataSet.GetBookmark;
        OpenCadTela(ds.DataSet.FieldByName('id_empresa').AsInteger,'E');
      end
      else
      JKDialog('Aviso','Selecione um registro da lista!', tdAlerta);

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

procedure TFrmEmpresa.btnexcluirClick(Sender: TObject);
var
Empresa : TModelEmpresa;
msg:string;
Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Empresa');

  if Permissao.TemPermissao('Permitir Excluir') then
  begin
    if JKDialog('Aviso','Empresa não pode ser excluída!', tdAlerta) then
    exit;

    if not dm.TabConsEmpresa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja excluir a empresa selecionada?', tdMensagem)  then
      begin
          TLoading.Show;
          TLoading.ExecuteThread(procedure
          begin
            Try
              Empresa             := TModelEmpresa.Create;
              Empresa.idEmpresa   := ds.DataSet.FieldByName('id_empresa').AsInteger;
              Empresa.Delete(msg);
            Finally
              Empresa.Free;
            End;
          end, TerminateDelete);
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

procedure TFrmEmpresa.btnLimparClick(Sender: TObject);
begin
  edtbusca.Clear;
  dm.TabConsEmpresa.EmptyDataSet;
end;

procedure TFrmEmpresa.btnlistagemClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Empresa');

  if Permissao.TemPermissao('Permitir Imprimir Listagem') then
  begin
    JKDialog('Aviso','Em desenvolvimento.', tdAlerta);
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmEmpresa.btnAtivarAppClick(Sender: TObject);
var
Empresa : TModelEmpresa;
msg:string;
ModelVal: TValidacao;
Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Empresa');

  if Permissao.TemPermissao('Permitir Ativar/Desativar APP Pedido') then
  begin
    //Ativar App

    if not dm.TabConsEmpresa.Eof then
    begin

        //Validar para ver se está habilitado para usar o app
        ModelVal      := TValidacao.create;
        Try
          if not ModelVal.ValidarUsoApp(ds.DataSet.FieldByName('id_empresa').AsInteger) then
          begin
            JKDialog('Aviso','Função não habilitada!', tdAlerta);
            exit;
          end;
        Finally
          ModelVal.free;
        End;

      //verificar se tem guid criado antes

      if JKDialog('Aviso', 'Deseja ativar o APP para essa empresa?', tdMensagem)  then
      begin
          TLoading.Show;
          TLoading.ExecuteThread(procedure
          begin
            Try
              Empresa             := TModelEmpresa.Create;
              Empresa.idEmpresa   := ds.DataSet.FieldByName('id_empresa').AsInteger;
              if ds.DataSet.FieldByName('guid').AsString = '' then
              begin
                Empresa.guid    := TConesul.GerarGuid;
                Empresa.GuidUpdate(msg);
              end;

            Finally
              Empresa.Free;
            End;
          end, TerminateDelete);
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

procedure TFrmEmpresa.btnBuscaClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Empresa');

  if Permissao.TemPermissao('Permitir Pesquisa') then
  begin
    RefreshTela;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);

end;


{$ENDREGION}

{$REGION 'POPPAP'}

procedure TFrmEmpresa.btnvisualizarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Empresa');

  if Permissao.TemPermissao('Permitir Visualizar') then
  begin
    if not dm.TabConsEmpresa.Eof then
    begin
      if ds.DataSet.FieldByName('id_empresa').AsInteger > 0 then
      begin
        BookMark  := cxGridDbtableview1.DataController.DataSource.DataSet.GetBookmark;
        OpenCadTela(ds.DataSet.FieldByName('id_empresa').AsInteger,'V');
      end
      else
      JKDialog('Aviso','Selecione um registro da lista!', tdAlerta);
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

procedure TFrmEmpresa.btn_ConfigNFeClick(Sender: TObject);
var
idconfig:integer;
msg:string;
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Empresa');

  if Permissao.TemPermissao('Permitir Configurar Sistema') then
  begin
    //Configuração de Nfe

    if not dm.TabConsEmpresa.Eof then
    begin
      if ds.DataSet.FieldByName('id_empresa').AsInteger > 0 then
      begin
        //Validar se já contas configuração
        if BuscarConfigNFe(idconfig,ds.DataSet.FieldByName('id_empresa').AsInteger) then
        begin
          TNavigation.ParamInt          := idconfig;
          TNavigation.ParamsStr         := 'E';
          TNavigation.OpenModal(TFrmConfiguracao, FrmConfiguracao);
        end
        else
        begin
          //Criar o registro
          if CriaRegistroConfig(msg,idconfig) then
          begin
            TNavigation.ParamInt          := idconfig;
            TNavigation.ParamsStr         := 'E';
            TNavigation.OpenModal(TFrmConfiguracao, FrmConfiguracao);
          end;

        end;

      end
      else
      JKDialog('Aviso','Selecione um registro da lista!', tdAlerta);
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

procedure TFrmEmpresa.btnEmailClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Empresa');

  if Permissao.TemPermissao('Permitir Configurar Email') then
  begin
    // Configurar email

    if not dm.TabConsEmpresa.Eof then
    begin
      if ds.DataSet.FieldByName('id_empresa').AsInteger > 0 then
      begin
        //Validar se já contas configuração
        if BuscarConfigEmail(ds.DataSet.FieldByName('id_empresa').AsInteger) then
        begin
          TNavigation.ParamInt          := ds.DataSet.FieldByName('id_empresa').AsInteger;
          TNavigation.ParamsStr         := 'E';
          TNavigation.OpenModal(TFrmEmailCad, FrmEmailCad);
        end
        else
        begin
          TNavigation.ParamInt          := ds.DataSet.FieldByName('id_empresa').AsInteger;
          TNavigation.ParamsStr         := 'N';
          TNavigation.OpenModal(TFrmEmailCad, FrmEmailCad);
        end;

      end
      else
      JKDialog('Aviso','Selecione um registro da lista!', tdAlerta);
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

procedure TFrmEmpresa.ConectarDispositivo1Click(Sender: TObject);
var
ModelVal  :TValidacao;
Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Empresa');

  if Permissao.TemPermissao('Permitir Conectar Dispositivo') then
  begin
    //Conectar Whast
    if not dm.TabConsEmpresa.Eof then
    begin
      if ds.DataSet.FieldByName('id_empresa').AsInteger > 0 then
      begin

        //Validar para ver se está habilitado para usar o zap
        ModelVal      := TValidacao.create;
        Try
          if not ModelVal.ValidarUsoWhatsApp(ds.DataSet.FieldByName('id_empresa').AsInteger) then
          begin
            JKDialog('Aviso','Função não habilitada!', tdAlerta);
            exit;
          end;
        Finally
          ModelVal.free;
        End;


        //validar tipo de conexao
        ModelVal      := TValidacao.create;
        Try
          if ModelVal.InstanciaPorFunc(ds.DataSet.FieldByName('id_empresa').AsInteger) then
          begin
            JKDialog('Aviso','Sistema configurado para conectar por funcionário!', tdAlerta);
            exit;
          end;
        Finally
          ModelVal.free;
        End;

        TNavigation.ParamInt          := ds.DataSet.FieldByName('id_empresa').AsInteger;
        TNavigation.ParamsStr         := '';
        TNavigation.OpenModal(TFrmQrCodeWhatsApp, FrmQrCodeWhatsApp);

      end
      else
      JKDialog('Aviso','Selecione um registro da lista!', tdAlerta);
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


procedure TFrmEmpresa.cxGridDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  btneditar.Click;
end;

procedure TFrmEmpresa.cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    btneditar.Click;
  end;
end;

{$ENDREGION}


procedure TFrmEmpresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    FrmEmpresa := nil;
end;

procedure TFrmEmpresa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_F2:btnnovo.Click;
    vk_F3:btneditar.Click;
    vk_F4:btnexcluir.Click;
    vk_f8:btnlimpar.Click;
    vk_f7:btnbusca.Click;
    vk_F9:btnlistagem.Click;
    vk_F10:btnrelatorio.Click;
  end;
end;

procedure TFrmEmpresa.FormShow(Sender: TObject);
begin
  self.SetFocus;
  RefreshTela;

  if HabilitarMenus then
  begin
    btnsincronizarempVeiculo.Visible  := True;
  end;

end;

Function TFrmEmpresa.HabilitarMenus:Boolean;
begin
  Result  := True;

  if not TConfiguracaoService.ValidarUsoAppVeiculo(TSession.IDEMPRESA) then
  Result  := False;

end;

procedure TFrmEmpresa.Image1Click(Sender: TObject);
begin
  PopUp.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TFrmEmpresa.LimparDados1Click(Sender: TObject);
var
senha :String;
SenhaCorreta:String;
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Empresa');

  if Permissao.TemPermissao('Permitir Limpar Dados') then
  begin
    //Limpar dados só com senha
    SenhaCorreta:= 'hd860412';

    if JKDialog('Aviso', 'Confirmar limpar os dados do banco?', tdMensagem)  then
    begin
      Senha   := inputBox('Senha', 'Digite sua senha master:','');
      if (senha <> '') and (senha =SenhaCorreta) then
      begin
        Try
          dm.LimparBancoDados;
        Finally
          JKDialog('Sucesso','Banco limpo. Saia do sistema', tdSucesso);
        End;
      end
      else
      begin
        JKDialog('Alerta','Verifique a senha digitada!', tdAlerta);
      end;
    end;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);



end;

end.
