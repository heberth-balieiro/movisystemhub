unit UnitPermissao;

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
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, cxCheckBox,
  cxGridLevel, dxLayoutContainer, cxGridViewLayoutContainer, cxGridLayoutView,
  cxGridDBLayoutView, cxGridCustomLayoutView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  ACBrBase, ACBrEnterTab, DBAccess, Uni, UFormNovoBaseDiversos,
  Vcl.ButtonStylesAttributes, Vcl.StyledButton, dxmdaset,
  Controller_Perfil, Model.Perfil, uJKDialog;

type
  TFrmPermissao = class(TFormNovoBaseDiversos)
    cxGridPermissao: TcxGrid;
    cxGridPermissaoDBTableView1: TcxGridDBTableView;
    Tela: TcxGridDBColumn;
    nome: TcxGridDBColumn;
    liberado: TcxGridDBColumn;
    nmodulo: TcxGridDBColumn;
    cxGridPermissaoDBLayoutView1: TcxGridDBLayoutView;
    cxGridPermissaoDBLayoutView1Item1: TcxGridDBLayoutViewItem;
    cxGridPermissaoDBLayoutView1Group_Root: TdxLayoutGroup;
    cxGridPermissaoDBLayoutView1LayoutItem1: TcxGridLayoutItem;
    cxGridPermissaoLevel1: TcxGridLevel;
    BtnCancelar: TStyledBitBtn;
    mdPesquisa: TdxMemData;
    mdPesquisaid_nivel: TIntegerField;
    mdPesquisaid_perfil: TIntegerField;
    mdPesquisatela: TStringField;
    mdPesquisanome: TStringField;
    mdPesquisaliberado: TStringField;
    mdPesquisamodulo: TStringField;
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure liberadoPropertiesEditValueChanged(Sender: TObject);
  private
    procedure PopularCampos;
    { Private declarations }
  public
    AIDPerfil :Integer;
    { Public declarations }
  end;

var
  FrmPermissao: TFrmPermissao;
  ContNivel : TPerfilController;
implementation

{$R *.dfm}

Uses Vcl.Session, System.Generics.Collections;

procedure TFrmPermissao.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmPermissao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  AIDPerfil     := 0;
  FrmPermissao  := nil;
end;

procedure TFrmPermissao.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;
end;

procedure TFrmPermissao.FormShow(Sender: TObject);
begin
  inherited;
  Try
    TitleText   := 'Permissão';
    PopularCampos;
  Except on e:exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  End;
end;

procedure TFrmPermissao.liberadoPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  try
    ContNivel       := Nil;
    ContNivel := TPerfilController.Create;

    Try
      ContNivel.UpdateNivel(AIDPerfil, mdPesquisaid_nivel.AsInteger, mdPesquisaliberado.AsString);
    Finally
      FreeAndNil(ContNivel);
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmPermissao.PopularCampos;
var
List    : TObjectList<TModelNivel>;
begin
  inherited;
  try
    List      := Nil;

    ContNivel := TPerfilController.Create;

    Try
      List  := ContNivel.ListarNivelPerfil(AIDPerfil, TSession.IDEMPRESA);

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

        mdPesquisaid_nivel.AsInteger    := Item.id_nivel;
        mdPesquisaid_perfil.AsInteger   := Item.id_perfil;
        mdPesquisatela.AsString         := Item.tela;
        mdPesquisanome.AsString         := Item.nome;
        mdPesquisaliberado.AsString     := Item.liberado;
        mdPesquisamodulo.AsString       := Item.modulo;

        mdPesquisa.Post;
      end;
      mdPesquisa.First;
      mdPesquisa.EnableControls;

    Finally
      FreeAndNil(ContNivel);
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





