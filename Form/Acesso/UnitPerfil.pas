unit UnitPerfil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Navigation, Vcl.Menus,
  dxGDIPlusClasses, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxScrollbarAnnotations, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView,
  Controller_Perfil, Model.Perfil, UFormNovoBasePesquisa, cxContainer,
  Vcl.ButtonStylesAttributes, System.ImageList, Vcl.ImgList, cxImageList,
  DBAccess, Uni, ACBrBase, ACBrEnterTab, Vcl.StyledButton, cxMaskEdit,
  cxDropDownEdit, cxTextEdit, cxGroupBox, cxGrid, dxmdaset;

type
  TFrmPerfil = class(TFormNovoBasePesquisa)
    mdPesquisa: TdxMemData;
    mdPesquisaid_perfil: TIntegerField;
    mdPesquisacodigo: TIntegerField;
    mdPesquisadescricao: TStringField;
    mdPesquisainativo: TStringField;
    GridRecId: TcxGridDBColumn;
    Gridid_perfil: TcxGridDBColumn;
    Gridcodigo: TcxGridDBColumn;
    Griddescricao: TcxGridDBColumn;
    BtnPermissao: TMenuItem;
    N2: TMenuItem;
    GridColumn1: TcxGridDBColumn;
    procedure BtnLimparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnPermissaoClick(Sender: TObject);

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
  FrmPerfil: TFrmPerfil;
  ObjPerfil   : TModelPerfil;
  ContPerfil  : TPerfilController;
implementation

{$R *.dfm}

uses UnitPerfilCad,Vcl.Loading, UnitPermissao, uJKDialog,UnitPrincipalNew,
     Vcl.PermissaoUsuario, Vcl.Session,System.Generics.Collections;

procedure TFrmPerfil.BtnLimparClick(Sender: TObject);
begin
  inherited;
  mdPesquisa.Close;
end;

procedure TFrmPerfil.BtnPermissaoClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  inherited;
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);

  if Permissao.TemPermissao('Permitir Editar Permissões') then
  begin
    if not Assigned(FrmPermissao) then
    FrmPermissao            := TFrmPermissao.Create(Application);
    FrmPermissao.AIDPerfil  := mdPesquisaid_perfil.AsInteger;

    if mdPesquisaid_perfil.AsInteger = 0 then
    begin
      JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
      exit;
    end;
    FrmPermissao.ShowModal;
  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmPerfil.Editar;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
      begin
        if not Assigned(FrmPerfilCad) then
        FrmPerfilCad := TFrmPerfilCad.Create(Application);
        FrmPerfilCad.ParamsStr  := 'E';
        FrmPerfilCad.ParamsInt  := mdPesquisaid_perfil.AsInteger;

        if mdPesquisaid_perfil.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;

        FrmPerfilCad.ShowModal;
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

procedure TFrmPerfil.Excluir;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
      begin
        Try
          ContPerfil    := Nil;
          ContPerfil    := TPerfilController.create;

          if mdPesquisaid_perfil.AsInteger = 0 then
          begin
            JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
            exit;
          end;

          if ContPerfil.ExcluidoCancelado(mdPesquisaid_perfil.AsInteger, 0) then
          begin
            Pesquisa;
            JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
          end;

        Finally
          FreeAndNil(ContPerfil);
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

procedure TFrmPerfil.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmPerfil := nil;
end;

procedure TFrmPerfil.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;
end;

procedure TFrmPerfil.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'Perfil';
  TitleText   := 'Pesquisa de Perfil';
end;

procedure TFrmPerfil.Listagem;
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

procedure TFrmPerfil.Novo;
begin
  inherited;
  if not Assigned(FrmPerfilCad) then
  FrmPerfilCad := TFrmPerfilCad.Create(Application);
  FrmPerfilCad.ParamsStr  := 'N';
  FrmPerfilCad.ShowModal;
end;

procedure TFrmPerfil.Pesquisa;
var
List    : TObjectList<TModelPerfil>;
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

    ContPerfil  := TPerfilController.Create;

    Try
      List  := ContPerfil.ListarTodos(nCampo, nSituacao);

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

        mdPesquisaid_perfil.AsInteger     := Item.id_perfil;
        mdPesquisacodigo.AsInteger        := Item.codigo;
        mdPesquisadescricao.AsString      := Item.descricao;
        mdPesquisainativo.AsString        := Item.inativo;

        mdPesquisa.Post;
      end;
      mdPesquisa.First;
      mdPesquisa.EnableControls;

    Finally
      FreeAndNil(ContPerfil);
      if Assigned(List) then
        List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmPerfil.Relatorio;
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

