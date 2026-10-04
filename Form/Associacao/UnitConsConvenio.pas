unit UnitConsConvenio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,System.MaskUtils,
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
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Navigation, UnitCadConvenio, uJKDialog, UDM,
  Vcl.Loading, Model.Convenio, UnitPrincipalNew, cxMaskEdit, Vcl.Validacoes,
  Vcl.Session, APP.Asmuv, cxContainer, cxGroupBox, UFormNovoBasePesquisa,
  Vcl.ButtonStylesAttributes, System.ImageList, Vcl.ImgList, cxImageList,
  DBAccess, Uni, ACBrBase, ACBrEnterTab, Vcl.StyledButton, cxDropDownEdit,
  cxTextEdit, dxmdaset, Controller_convenio;
type
  TFrmConConveio = class(TFormNovoBasePesquisa)
    mdPesquisa: TdxMemData;
    mdPesquisaid_convenio: TIntegerField;
    mdPesquisacodigo: TIntegerField;
    mdPesquisacpf: TStringField;
    mdPesquisanome: TStringField;
    mdPesquisaapelido: TStringField;
    mdPesquisancidade: TStringField;
    mdPesquisatelefone: TStringField;
    mdPesquisacelular: TStringField;
    mdPesquisawhatsapp: TStringField;
    mdPesquisasituacao: TStringField;
    GridRecId: TcxGridDBColumn;
    Gridid_convenio: TcxGridDBColumn;
    Gridcodigo: TcxGridDBColumn;
    Gridcpf: TcxGridDBColumn;
    Gridnome: TcxGridDBColumn;
    Gridapelido: TcxGridDBColumn;
    Gridncidade: TcxGridDBColumn;
    Gridtelefone: TcxGridDBColumn;
    Gridcelular: TcxGridDBColumn;
    Gridwhatsapp: TcxGridDBColumn;
    Gridsituacao: TcxGridDBColumn;
    N2: TMenuItem;
    BtnSincronizar: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnSincronizarClick(Sender: TObject);
    procedure GridcpfGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);

  private
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
  FrmConConveio: TFrmConConveio;
  ContConvenio  : TConvenioController;
  ObjConvenio   : TConvenio;
implementation

{$R *.dfm}

uses Vcl.PermissaoUsuario, uConfiguracaoService,System.Generics.Collections;

{ TFrmConConveio }

{$REGION 'Crud'}

procedure TFrmConConveio.Novo;
begin
  inherited;
  if not Assigned(FrmCadConvenio) then
  FrmCadConvenio := TFrmCadConvenio.Create(Application);
  FrmCadConvenio.ParamsStr  := 'N';
  FrmCadConvenio.ShowModal;
end;

procedure TFrmConConveio.BtnLimparClick(Sender: TObject);
begin
  inherited;
  mdPesquisa.Close;
end;

procedure TFrmConConveio.BtnSincronizarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  inherited;
  Try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

    if Permissao.TemPermissao('Permitir Sincronizar API') then
    begin
      if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
      begin
        //Incluir os cadastro para sincronizar
        ContConvenio  := nil;
        ContConvenio    := TConvenioController.Create;

        Try
          if ContConvenio.IncluiRegistroSincronizar then
          begin
            TConfiguracaoService.SincronizarGravar(7, 0);
            JKDialog('Sucesso','Sincronização em execução. Você pode continuar usando o sistema!', tdSucesso);
          end
          else
          JKDialog('Aviso','Comando não execultado!', tdAlerta);

        Finally
          FreeAndNil(ContConvenio);
        End;
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
  End;
end;

procedure TFrmConConveio.Editar;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
      begin
        if not Assigned(FrmCadConvenio) then
        FrmCadConvenio := TFrmCadConvenio.Create(Application);
        FrmCadConvenio.ParamsStr  := 'E';
        FrmCadConvenio.ParamsInt  := mdPesquisaid_convenio.AsInteger;
        if mdPesquisaid_convenio.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;
        FrmCadConvenio.Show;
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

procedure TFrmConConveio.Excluir;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
      begin
        Try
          ContConvenio    := Nil;
          ContConvenio    := TConvenioController.Create;

          if mdPesquisaid_Convenio.AsInteger = 0 then
          begin
            JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
            exit;
          end;

          if ContConvenio.Excluir(mdPesquisaid_convenio.AsInteger) then
          begin
            Pesquisa;
            JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
          end;

        Finally
          FreeAndNil(ContConvenio);
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

procedure TFrmConConveio.Listagem;
begin
  inherited;
  try
    JKDialog('Alerta','Funcionalidade em desenvolvimento.', tdAlerta);
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmConConveio.Pesquisa;
var
List    : TObjectList<TConvenio>;
nCampo, nSituacao  : String;
begin
  inherited;
  try
    List    := Nil;
    nCampo  := '';

    if trim(edtBusca.Text) <> '' then
    nCampo     := Trim(edtBusca.Text);

    case cxAtivo.ItemIndex of
      1: nSituacao := 'S';
      2: nSituacao := 'N';
    end;

    ContConvenio   := TConvenioController.Create;

    Try
      List  := ContConvenio.ListarTodos(nCampo, nSituacao);

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

        mdPesquisaid_convenio.AsInteger     := Item.id_convenio;
        mdPesquisacodigo.AsInteger          := Item.codigo;
        mdPesquisacpf.AsString              := Item.cpf;
        mdPesquisanome.AsString             := Item.nome;
        mdPesquisaapelido.AsString          := Item.apelido;
        mdPesquisancidade.AsString          := Item.ncidade;
        mdPesquisatelefone.AsString         := Item.telefone;
        mdPesquisacelular.AsString          := Item.celular;
        mdPesquisawhatsapp.AsString         := Item.celular1;
        mdPesquisasituacao.AsString         := Item.ativo;

        mdPesquisa.Post;
      end;
      mdPesquisa.First;
      mdPesquisa.EnableControls;

    Finally
      FreeAndNil(ContConvenio);
      if Assigned(List) then
        List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmConConveio.Relatorio;
begin
  inherited;
  try
    JKDialog('Alerta','Funcionalidade em desenvolvimento.', tdAlerta);
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

{$ENDREGION}


{$REGION 'Chamadas'}

procedure TFrmConConveio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmConConveio := nil;
end;

procedure TFrmConConveio.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;
end;

procedure TFrmConConveio.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'Convênio';
  TitleText   := 'Pesquisa de Convênio';
end;

procedure TFrmConConveio.GridcpfGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  Try
    if AText = '' then Exit;

    // remove caracteres
    AText := StringReplace(AText, '.', '', [rfReplaceAll]);
    AText := StringReplace(AText, '-', '', [rfReplaceAll]);
    AText := StringReplace(AText, '/', '', [rfReplaceAll]);

    if Length(AText) = 11 then
      AText := FormatMaskText('000\.000\.000\-00;0', AText)
    else
    if Length(AText) = 14 then
      AText := FormatMaskText('00\.000\.000\/0000\-00;0', AText);
    except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  End;

end;

{$ENDREGION}

end.





