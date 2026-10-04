unit UnitPesqCFOP;

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
  cxContainer, dxGDIPlusClasses, Vcl.ExtCtrls, cxTextEdit, cxGroupBox,
  Vcl.Buttons, Vcl.StdCtrls, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, ACBrBase,
  ACBrEnterTab, DBAccess, Uni, dxmdaset,
  Controller.CFOP, Model.CFOP, cxMaskEdit, cxDropDownEdit, System.ImageList,
  Vcl.ImgList, cxImageList, Vcl.Menus, Vcl.ButtonStylesAttributes,
  Vcl.StyledButton;

type
  TFrmPesqCFOP = class(TFormNovoBasePesquisa)
    mdPesquisa: TdxMemData;
    mdPesquisaid_cfop: TIntegerField;
    mdPesquisacodigo: TIntegerField;
    mdPesquisanatureza: TStringField;
    mdPesquisaoperacao: TStringField;
    mdPesquisatipo: TStringField;
    mdPesquisaativo: TStringField;
    mdPesquisacfop: TStringField;
    GridRecId: TcxGridDBColumn;
    Gridid_cfop: TcxGridDBColumn;
    Gridcodigo: TcxGridDBColumn;
    Gridnatureza: TcxGridDBColumn;
    Gridoperacao: TcxGridDBColumn;
    Gridtipo: TcxGridDBColumn;
    Gridativo: TcxGridDBColumn;
    Gridcfop: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
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
  FrmPesqCFOP : TFrmPesqCFOP;
  ContCFOP    : TCFOPController;
implementation

{$R *.dfm}

uses UnitCadCFOP, System.Generics.Collections, uJKDialog;

procedure TFrmPesqCFOP.btnLimparClick(Sender: TObject);
begin
  inherited;
  mdPesquisa.Close;
end;

procedure TFrmPesqCFOP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmPesqCFOP   := Nil;
end;

procedure TFrmPesqCFOP.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;
end;

procedure TFrmPesqCFOP.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'CFOP';
  TitleText   := 'Pesquisa de CFOP';
end;

procedure TFrmPesqCFOP.Listagem;
begin
  inherited;
  JKDialog('Alerta','Funcionalidade em desenvolvimento.', tdAlerta);
end;

procedure TFrmPesqCFOP.Novo;
begin
  if not Assigned(FrmCadCFOP) then
    FrmCadCFOP := TFrmCadCFOP.Create(Application);
  FrmCadCFOP.ParamsStr  := 'N';
  FrmCadCFOP.ShowModal;
end;

Procedure TFrmPesqCFOP.Editar;
begin
  if not mdPesquisa.Eof then
  begin
    if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
    begin
      Try
        if not Assigned(FrmCadCFOP) then
        FrmCadCFOP := TFrmCadCFOP.Create(Application);
        FrmCadCFOP.ParamsStr  := 'E';
        FrmCadCFOP.ParamsInt  := mdPesquisaid_cfop.AsInteger;
        FrmCadCFOP.Show;

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

procedure TFrmPesqCFOP.Excluir;
begin
  inherited;
  if not mdPesquisa.Eof then
  begin
    if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
    begin
      Try
        ContCFOP    := Nil;
        ContCFOP    := TCFOPController.Create;

        Try
          if ContCFOP.ExcluidoCancelado(mdPesquisaid_cfop.AsInteger) then
          JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
        Finally
          FreeAndNil(ContCFOP);
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

procedure TFrmPesqCFOP.Pesquisa;
var
List    : TObjectList<TCFOP>;
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

  ContCFOP      := TCFOPController.Create;

  Try
    List  := ContCFOP.ListarTodos(nCampo, nSituacao);

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
      mdPesquisaid_cfop.AsInteger     := Item.id_cfop;
      mdPesquisacodigo.AsInteger      := ITem.Codigo;
      mdPesquisanatureza.AsString     := Item.natureza;
      mdPesquisaoperacao.AsString     := Item.operacao;
      mdPesquisatipo.AsString         := Item.tipo;
      mdPesquisacfop.AsString         := Item.cfop;
      if Item.ativo='S' then
      mdPesquisaativo.AsString        := 'Sim'
      else
      mdPesquisaativo.AsString        := 'Não';
      mdPesquisa.Post;

    end;
    mdPesquisa.First;
    mdPesquisa.EnableControls;

  Finally
    FreeAndNil(ContCFOP);
    if Assigned(List) then
      List.Free;
  End;

end;

procedure TFrmPesqCFOP.Relatorio;
begin
  inherited;
  JKDialog('Alerta','Funcionalidade em desenvolvimento.', tdAlerta);
end;

end.
