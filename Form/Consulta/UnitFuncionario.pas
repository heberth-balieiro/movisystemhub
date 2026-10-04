unit UnitFuncionario;

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
  cxClasses, cxGridCustomView, cxGrid, Vcl.Menus, dxGDIPlusClasses, Vcl.ComCtrls,
  ACBrBase, ACBrEnterTab, Vcl.Tabs, frxClass, frxDBSet, ACBRUTIL,
  UFormNovoBasePesquisa, cxContainer, System.ImageList, Vcl.ImgList,
  cxImageList, DBAccess, Uni, cxMaskEdit, cxDropDownEdit, cxTextEdit, cxGroupBox,
  dxmdaset, Controller.Funcionario, Model.Funcionario,
  Vcl.ButtonStylesAttributes, Vcl.StyledButton;

type
  TFrmFuncionario = class(TFormNovoBasePesquisa)
    frxRelatorio: TfrxReport;
    frxDBListagemFunc: TfrxDBDataset;
    mdPesquisa: TdxMemData;
    mdPesquisaid_funcionario: TIntegerField;
    mdPesquisacodigo: TIntegerField;
    mdPesquisanome: TStringField;
    mdPesquisaapelido: TStringField;
    mdPesquisacpf: TStringField;
    mdPesquisafuncao: TStringField;
    mdPesquisavendedor: TStringField;
    mdPesquisacidade: TStringField;
    GridRecId: TcxGridDBColumn;
    Gridid_funcionario: TcxGridDBColumn;
    Gridcodigo: TcxGridDBColumn;
    Gridnome: TcxGridDBColumn;
    Gridapelido: TcxGridDBColumn;
    Gridcpf: TcxGridDBColumn;
    Gridfuncao: TcxGridDBColumn;
    Gridvendedor: TcxGridDBColumn;
    Gridcidade: TcxGridDBColumn;
    N3: TMenuItem;
    BtnSincronizar: TMenuItem;
    N4: TMenuItem;
    BtnDispositivo: TMenuItem;
    mdPesquisawhatsapp: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnListagemClick(Sender: TObject);
    procedure BtnDispositivoClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
    Procedure Novo        ;override;
    Procedure Pesquisa    ;override;
    Procedure Editar      ;override;
    Procedure Excluir     ;override;
    Procedure Listagem    ;override;
    Procedure Relatorio   ;override;
  end;

var
  FrmFuncionario  : TFrmFuncionario;
  //ObjFuncionario  : TModelFuncionario;
  ContFuncionario : TFuncionarioController;
implementation

{$R *.dfm}

uses UnitFuncionarioCad, UDM, Vcl.Loading, Vcl.Session, uJKDialog,
  UnitPrincipalNew, Model.Empresa, UConeSul, AppVendas, Vcl.Validacoes,
  UnitQrCodeWhatsApp, Vcl.PermissaoUsuario, System.Generics.Collections,
  uConfiguracaoService;

{$REGION 'Botoes'}

procedure TFrmFuncionario.BtnDispositivoClick(Sender: TObject);
var
Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Funcionário');

  if Permissao.TemPermissao('Permitir Conectar Instância WhatsApp') then
  begin
    //Validar para ver se está habilitado para usar o zap
    if not TConfiguracaoService.ValidarUsoWhatsApp(TSession.IDEMPRESA) then
    begin
      JKDialog('Aviso','Função não habilitada!', tdAlerta);
      exit;
    end;

    if not TConfiguracaoService.ValidarInstanciaWhatsappFuncionario(TSession.IDEMPRESA) then
    begin
      JKDialog('Aviso','Sistema configurado para conectar por empresa!', tdAlerta);
      exit;
    end
    else
    begin
      if not mdPesquisa.Eof then
      begin
        Try
          if not Assigned(FrmQrCodeWhatsApp) then
          FrmQrCodeWhatsApp            := TFrmQrCodeWhatsApp.Create(Application);
          FrmQrCodeWhatsApp.ParamInt   := mdPesquisaid_funcionario.AsInteger;
          FrmQrCodeWhatsApp.ParamsStr  := TiraPontos(mdPesquisawhatsapp.AsString);
          FrmQrCodeWhatsApp.ShowModal;

        except on e:exception do
          begin
            JKDialog('Erro','Erro ao chamar a tela de QrCode.'+#13+e.Message, tdErro);
            exit;
          end;
        end;
      end
      else
      begin
        JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
      end;
    end;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmFuncionario.btnLimparClick(Sender: TObject);
begin
  inherited;
  mdPesquisa.Close;
end;

procedure TFrmFuncionario.btnListagemClick(Sender: TObject);
var
Model :TModelEmpresa;
msg:String;
TempImage: Timage;

begin
  inherited;
    Try
      if not DM.TabConsFuncionario.Eof then
      begin
        FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelListagemFuncionario.fr3');
        Try
          DM.TabConsFuncionario.DisableControls;

          Model               := TModelEmpresa.Create;
          Try
            Model.idempresa   := TSession.IDEMPRESA;
            Model.SelectCabecalhoReport(msg);

            FrxRelatorio.Variables.Clear;
            FrxRelatorio.Variables['nrazao']          :=quotedstr(Model.razao);
            FrxRelatorio.Variables['nfantasia']       :=quotedstr(model.fantasia);
            FrxRelatorio.Variables['nendereco']       :=quotedstr(model.endereco);
            FrxRelatorio.Variables['nnumero']         :=quotedstr(model.numero);
            FrxRelatorio.Variables['nbairro']         :=quotedstr(model.bairro);
            FrxRelatorio.Variables['ntelefone']       :=quotedstr(model.telefone);
            FrxRelatorio.Variables['nfone1']          :=quotedstr(model.telefone2);
            FrxRelatorio.Variables['nfone2']          :=quotedstr(model.celular);
            FrxRelatorio.Variables['nemail']          :=quotedstr(model.email1);
            FrxRelatorio.Variables['ncnpj']           :=quotedstr(model.cnpj);
            FrxRelatorio.Variables['nie']             :=quotedstr(model.ie);

            try
              // Decodifica a imagem Base64 e carrega no fluxo de memória
              TempImage             := TImage.Create(nil);
              TConesul.ConvBase64Img(model.logo);
              TempImage.Picture     :=TConesul.nfoto;
              TConesul.nfoto.Free;
              TempImage.Picture.SaveToFile(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg')
            finally
              TempImage.Free;
            end;

            FrxRelatorio.Variables['wlogo']           :=quotedstr(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg');
            FrxRelatorio.Variables['ncep']            :=quotedstr(model.cep);
            FrxRelatorio.Variables['ncidade']         :=quotedstr(model.cidade);
            FrxRelatorio.Variables['filtro']          :=quotedstr('Listagem de Funcionário');

          Finally
            model.Free;
          End;

          FrxRelatorio.Report.PrepareReport();
          FrxRelatorio.ShowReport;
        Finally
          DM.TabConsFuncionario.First;
          DM.TabConsFuncionario.EnableControls;
        End;

      end
      else
      begin
        JKDialog('Aviso','Nenhum registro encontrato!', tdAlerta);
      end;

    Except

    End;

end;

procedure TFrmFuncionario.BtnPesquisarClick(Sender: TObject);
begin
  inherited;

end;

{$ENDREGION}

{$REGION 'Form'}

procedure TFrmFuncionario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmFuncionario := nil;
end;

procedure TFrmFuncionario.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;
end;

procedure TFrmFuncionario.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'Funcionário';
  TitleText   := 'Pesquisa de Funciónário';
end;

{$ENDREGION}

{$REGION 'Procedimento'}

procedure TFrmFuncionario.Novo;
begin
  if not Assigned(FrmFuncionarioCad) then
    FrmFuncionarioCad           := TFrmFuncionarioCad.Create(Application);
    FrmFuncionarioCad.ParamsStr := 'N';
    FrmFuncionarioCad.Show;
end;

Procedure TFrmFuncionario.Editar;
begin
  if not mdPesquisa.Eof then
  begin
    if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
    begin
      Try
        if not Assigned(FrmFuncionarioCad) then
        FrmFuncionarioCad            := TFrmFuncionarioCad.Create(Application);
        FrmFuncionarioCad.ParamsStr  := 'E';
        FrmFuncionarioCad.ParamsInt  := mdPesquisaid_funcionario.AsInteger;
        Try
        FrmFuncionarioCad.Show;
        Finally
          Pesquisa;;
        End;
      except on e:exception do
        begin
          JKDialog('Erro','Erro ao editar o registro.'+#13+e.Message, tdErro);
          exit;
        end;
      end;

    end;

  end
  else
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  end;
end;

procedure TFrmFuncionario.Excluir;
begin
  inherited;
  if not mdPesquisa.Eof then
  begin
    if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
    begin
      Try
        ContFuncionario := Nil;
        ContFuncionario := TFuncionarioController.Create;

        Try
          if ContFuncionario.Excluir(mdPesquisaid_funcionario.AsInteger) then
          JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
        Finally
          Pesquisa;
          FreeAndNil(ContFuncionario);
        End;

      except on e:exception do
        begin
          JKDialog('Erro','Erro ao excluir o registro.'+#13+e.Message, tdErro);
          exit;
        end;
      end;

    end;

  end
  else
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  end;
end;

procedure TFrmFuncionario.Pesquisa;
var
List    : TObjectList<TModelFuncionario>;
nCampo, nSituacao  : String;
begin
  inherited;
  List    := Nil;
  nCampo  := '';

  if trim(edtBusca.Text) <> '' then
  begin
    nCampo     := Trim(edtBusca.Text);
  end;

  case cxAtivo.ItemIndex of
    1: nSituacao := 'S';
    2: nSituacao := 'N';
  end;

  ContFuncionario      := TFuncionarioController.Create;

  Try
    List  := ContFuncionario.ListarTodos(nCampo, nSituacao);

    mdPesquisa.Close;
    mdPesquisa.FieldDefs.Clear;

    if (List = nil) or (List.Count = 0) then
    begin
      mdPesquisa.Close;
      JKDialog('Aviso','Nenhum registro encontrado!', tdAlerta);
      exit;
    end;

    if not mdPesquisa.Active then
      mdPesquisa.Open;

    mdPesquisa.DisableControls;

    for var Item in List do
    begin
      mdPesquisa.Append;

      mdPesquisaid_funcionario.AsInteger      := Item.id_funcionario;
      mdPesquisacodigo.AsInteger              := Item.Codigo;
      mdPesquisanome.AsString                 := Item.nome;
      mdPesquisaapelido.AsString              := Item.apelido;
      mdPesquisacpf.AsString                  := Item.cpf;
      mdPesquisafuncao.AsString               := Item.funcao;
      mdPesquisavendedor.AsString             := Item.vendedor;
      mdPesquisacidade.AsString               := Item.cidade;
      mdPesquisawhatsapp.AsString             := Item.whatsapp;

      mdPesquisa.Post;

    end;
    mdPesquisa.First;
    mdPesquisa.EnableControls;

  Finally
    FreeAndNil(ContFuncionario);
    if Assigned(List) then
      List.Free;
  End;

end;

Procedure TFrmFuncionario.Listagem;
begin
  inherited;
  JKDialog('Alerta','Funcionalidade em desenvolvimento.', tdAlerta);
end;

Procedure TFrmFuncionario.Relatorio;
begin
  inherited;
  JKDialog('Alerta','Funcionalidade em desenvolvimento.', tdAlerta);
end;

{$ENDREGION}




 {
procedure TFrmFuncionario.SincronizarAPP1Click(Sender: TObject);
var
Model :TModelAppVendas;
ModelVal  :TValidacao;
Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Funcionário');

  if Permissao.TemPermissao('Permitir Sincronizar APP Pedido') then
  begin
    //Sincronizar dados com o APP Inserir ou Atualizar
    ModelVal      := TValidacao.create;
    Try
      if not ModelVal.ValidarUsoWhatsApp(TSession.idempresa) then
      begin
        JKDialog('Aviso','Função não habilitada!', tdAlerta);
        exit;
      end;
    Finally
      ModelVal.free;
    End;
    TLoading.ShowNovo(FrmFuncionario,'Sincronizando funcionário...');

    try
      TThread.CreateAnonymousThread(
      procedure
      begin
        Try
          Model := TModelAppVendas.Create;
          Try
            Model.SincronizarVendedor;
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
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);





end;}

{
procedure TFrmFuncionario.btn_conectarClick(Sender: TObject);
var
ModelVal :TValidacao;
Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Funcionário');

  if Permissao.TemPermissao('Permitir Conectar Instância WhatsApp') then
  begin
    //Validar para ver se está habilitado para usar o zap
      ModelVal      := TValidacao.create;
      Try
        if not ModelVal.ValidarUsoWhatsApp(TSession.IDEMPRESA) then
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
        if ModelVal.InstanciaPorFunc(TSession.IDEMPRESA) then
        begin
          if not dm.TabConsFuncionario.Eof then
          begin
            if ds.DataSet.FieldByName('idFunc').AsInteger > 0 then
            begin
              TNavigation.ParamInt          := ds.DataSet.FieldByName('idfunc').AsInteger;
              TNavigation.ParamsStr         := TiraPontos(ds.DataSet.FieldByName('whatsapp').AsString);
              TNavigation.OpenModal(TFrmQrCodeWhatsApp, FrmQrCodeWhatsApp);

            end
            else
            JKDialog('Aviso','Selecione um registro da lista!', tdAlerta);
          end
          else
          JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
        end
        else
        begin
          JKDialog('Aviso','Sistema configurado para conectar por empresa!', tdAlerta);
          exit;
        end;
      Finally
        ModelVal.free;
      End;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);

end;}


end.
