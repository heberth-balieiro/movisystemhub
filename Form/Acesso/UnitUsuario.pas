unit UnitUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Navigation, dxGDIPlusClasses,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  cxClasses, cxGridCustomView, cxGrid, Vcl.Menus, Vcl.Tabs,
  UFormNovoBasePesquisa, cxContainer, Vcl.ButtonStylesAttributes,
  System.ImageList, Vcl.ImgList, cxImageList, DBAccess, Uni, ACBrBase,
  ACBrEnterTab, Vcl.StyledButton, cxMaskEdit, cxDropDownEdit, cxTextEdit,
  cxGroupBox, dxmdaset,
  Controller_usuario, Model.Usuario, uConfiguracaoService;

type
  TFrmUsuario = class(TFormNovoBasePesquisa)
    mdPesquisa: TdxMemData;
    mdPesquisaid_usuario: TIntegerField;
    mdPesquisanome: TStringField;
    mdPesquisalogin: TStringField;
    mdPesquisaemail: TStringField;
    mdPesquisadescricao: TStringField;
    mdPesquisaativo: TStringField;
    GridRecId: TcxGridDBColumn;
    Gridid_usuario: TcxGridDBColumn;
    Gridnome: TcxGridDBColumn;
    Gridlogin: TcxGridDBColumn;
    Gridemail: TcxGridDBColumn;
    Griddescricao: TcxGridDBColumn;
    Gridativo: TcxGridDBColumn;
    N2: TMenuItem;
    BtnSincronizar: TMenuItem;
    procedure BtnLimparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSincronizarClick(Sender: TObject);

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
  FrmUsuario: TFrmUsuario;
  ContUsuario : TUsuarioController;
  ObjUsuario  : TModelUsuario;
implementation

{$R *.dfm}

uses UnitUsuarioCad,Vcl.Loading, UnitPrincipalNew, uJKDialog,Vcl.PermissaoUsuario, Vcl.Session,
System.Generics.Collections;


procedure TFrmUsuario.BtnLimparClick(Sender: TObject);
begin
  inherited;
  mdPesquisa.Close;
end;

procedure TFrmUsuario.BtnSincronizarClick(Sender: TObject);
var
Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Usuário');

    if Permissao.TemPermissao('Permitir Sincronizar API') then
    begin
      if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
      begin
        //Incluir os cadastro para sincronizar
        Contusuario    := TUsuarioController.Create;

        Try
          if Contusuario.IncluiRegistroSincronizar then
          begin
            TConfiguracaoService.SincronizarGravar(15, 0);
            JKDialog('Sucesso','Sincronização em execução. Você pode continuar usando o sistema!', tdSucesso);
          end
          else
          JKDialog('Aviso','Comando não execultado!', tdAlerta);

        Finally
          FreeAndNil(Contusuario);
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

procedure TFrmUsuario.Editar;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
      begin
        if not Assigned(FrmUsuarioCad) then
        FrmUsuarioCad := TFrmUsuarioCad.Create(Application);
        FrmUsuarioCad.ParamsStr  := 'E';
        FrmUsuarioCad.ParamsInt  := mdPesquisaid_usuario.AsInteger;

        if mdPesquisaid_usuario.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;

        FrmUsuarioCad.ShowModal;
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

procedure TFrmUsuario.Excluir;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
      begin
        Try
          ContUsuario    := Nil;
          Contusuario    := TUsuarioController.Create;

          if mdPesquisaid_usuario.AsInteger = 0 then
          begin
            JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
            exit;
          end;

          if Contusuario.ExcluidoCancelado(mdPesquisaid_usuario.AsInteger, 0) then
          begin
            Pesquisa;
            JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
          end;

        Finally
          FreeAndNil(Contusuario);
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

procedure TFrmUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmUsuario  := nil;
end;

procedure TFrmUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;
end;

procedure TFrmUsuario.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'Usuário';
  TitleText   := 'Pesquisa de Usuário';
end;

procedure TFrmUsuario.Listagem;
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

procedure TFrmUsuario.Novo;
begin
  inherited;
  if not Assigned(FrmUsuarioCad) then
  FrmUsuarioCad := TFrmUsuarioCad.Create(Application);
  FrmUsuarioCad.ParamsStr  := 'N';
  FrmUsuarioCad.ShowModal;
end;

procedure TFrmUsuario.Pesquisa;
var
List    : TObjectList<TModelUsuario>;
nCampo, nSituacao : String;
begin
  inherited;
  try
    List      := Nil;
    nCampo    := '';
    nSituacao := '';

    if trim(edtBusca.Text) <> '' then
    nCampo     := Trim(edtBusca.Text);

    case cxativo.ItemIndex of
      1: nsituacao   := 'S';
      2: nsituacao   := 'N';
    end;

    ContUsuario   := TUsuarioController.Create;

    Try
      List  := ContUsuario.ListarTodos(nCampo, nSituacao);

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

        mdPesquisaid_usuario.AsInteger      := Item.idusuario;
        mdPesquisanome.AsString             := Item.nome;
        mdPesquisalogin.AsString            := Item.login;
        mdPesquisaemail.AsString            := Item.email;
        mdPesquisadescricao.AsString        := Item.descricao;
        mdPesquisaativo.AsString            := Item.ativo;

        mdPesquisa.Post;
      end;
      mdPesquisa.First;
      mdPesquisa.EnableControls;

    Finally
      FreeAndNil(ContUsuario);
      if Assigned(List) then
        List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmUsuario.Relatorio;
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

end.
