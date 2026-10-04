unit UnitPesqCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormNovoBasePesquisa, cxGraphics,
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
  cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData,
  cxContainer, System.ImageList, Vcl.ImgList, cxImageList, Vcl.Menus, DBAccess,
  Uni, ACBrBase, ACBrEnterTab, cxMaskEdit, cxDropDownEdit, dxGDIPlusClasses,
  Vcl.ExtCtrls, cxTextEdit, cxGroupBox, Vcl.Buttons, Vcl.StdCtrls, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxmdaset, Controller.Cidade, model.cidade,
  Vcl.ButtonStylesAttributes, Vcl.StyledButton;

type
  TFrmPesCidade = class(TFormNovoBasePesquisa)
    mdPesquisa: TdxMemData;
    mdPesquisaid_cidade: TIntegerField;
    mdPesquisacidade: TStringField;
    mdPesquisauf: TStringField;
    mdPesquisainativo: TStringField;
    mdPesquisacid_ibge: TIntegerField;
    GridRecId: TcxGridDBColumn;
    Gridid_cidade: TcxGridDBColumn;
    Gridcidade: TcxGridDBColumn;
    Griduf: TcxGridDBColumn;
    GridSituacao: TcxGridDBColumn;
    procedure btnLimparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  FrmPesCidade: TFrmPesCidade;
  ContCidade  : TCidadeController;
implementation

uses UnitCadCidade, System.Generics.Collections, uJKDialog;

{$R *.dfm}

{ TFrmPesCidade }

procedure TFrmPesCidade.btnLimparClick(Sender: TObject);
begin
  inherited;
  mdPesquisa.Close;
end;

procedure TFrmPesCidade.Editar;
begin
  inherited;
  if not mdPesquisa.Eof then
  begin
    if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
    begin
      Try
        if not Assigned(FrmCadCidade) then
        FrmCadCidade            := TFrmCadCidade.Create(Application);
        FrmCadCidade.ParamsStr  := 'E';
        FrmCadCidade.ParamsInt  := mdPesquisaid_cidade.AsInteger;
        FrmCadCidade.Show;

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

procedure TFrmPesCidade.Excluir;
begin
  inherited;
  JKDialog('Alerta','Opção não disponivel.', tdAlerta);
end;

procedure TFrmPesCidade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmPesCidade  := Nil;
end;

procedure TFrmPesCidade.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;
end;

procedure TFrmPesCidade.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'CIDADE';
  TitleText   := 'Pesquisa de Cidade';
end;

procedure TFrmPesCidade.Listagem;
begin
  inherited;
  JKDialog('Alerta','Funcionalidade em desenvolvimento.', tdAlerta);
end;

procedure TFrmPesCidade.Novo;
begin
  inherited;
  if not Assigned(FrmCadCidade) then
    FrmCadCidade := TFrmCadCidade.Create(Application);
  FrmCadCidade.ParamsStr  := 'N';
  FrmCadCidade.Show;
end;

procedure TFrmPesCidade.Pesquisa;
var
List    : TObjectList<TCidade>;
nCampo, nSituacao  : String;
begin
  inherited;
  List        := Nil;
  ContCidade  := Nil;
  nCampo      := '';

  if trim(edtBusca.Text) <> '' then
  begin
    nCampo     := Trim(edtBusca.Text);
  end;

  case cxAtivo.ItemIndex of
    1: nSituacao := 'S';
    2: nSituacao := 'N';
  end;

  ContCidade      := TCidadeController.Create;

  Try
    List  := ContCidade.ListarTodos(nCampo, nSituacao);

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
      mdPesquisaid_cidade.AsInteger     := Item.id_cidade;
      mdPesquisacidade.AsString         := Item.cidade;
      mdPesquisauf.AsString             := Item.uf;
      mdPesquisacid_ibge.AsInteger      := Item.cid_ibge;
      if Item.inativo= 0 then
      mdPesquisainativo.AsString        := 'Sim'
      else
      mdPesquisainativo.AsString        := 'Não';
      mdPesquisa.Post;

    end;
    mdPesquisa.First;
    mdPesquisa.EnableControls;

  Finally
    FreeAndNil(ContCidade);
    if Assigned(List) then
      List.Free;
  End;
end;

procedure TFrmPesCidade.Relatorio;
begin
  inherited;
  JKDialog('Alerta','Funcionalidade em desenvolvimento.', tdAlerta);
end;

end.
