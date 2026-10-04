unit UnitContas;

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
  ACBrBase, ACBrEnterTab, Vcl.Tabs, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, UnitContaCad,Model.Contas,
  cxContainer, cxGroupBox, UFormNovoBasePesquisa, System.ImageList, Vcl.ImgList,
  cxImageList, DBAccess, Uni, cxMaskEdit, cxDropDownEdit, cxTextEdit, dxmdaset,
  Model.ContasBancaria, Controller.ContaBancaria, Vcl.ButtonStylesAttributes,
  Vcl.StyledButton;

type
  TFrmContas = class(TFormNovoBasePesquisa)
    mdPesquisa: TdxMemData;
    mdPesquisaid_conta: TIntegerField;
    mdPesquisacodigo: TIntegerField;
    mdPesquisabanco: TStringField;
    mdPesquisaagencia: TStringField;
    mdPesquisaconta: TStringField;
    mdPesquisacorrentista: TStringField;
    mdPesquisaativo: TStringField;
    Gridid: TcxGridDBColumn;
    Gridcodigo: TcxGridDBColumn;
    Gridagencia: TcxGridDBColumn;
    Gridconta: TcxGridDBColumn;
    Gridcorrentista: TcxGridDBColumn;
    GridBanco: TcxGridDBColumn;
    GridAtivo: TcxGridDBColumn;
    procedure btnLimparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

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
  FrmContas: TFrmContas;
  ContConta: TContaController;
implementation

{$R *.dfm}

uses System.Generics.Collections, uJKDialog, UnitPrincipalNew;

{ TFrmContas }

procedure TFrmContas.btnLimparClick(Sender: TObject);
begin
  inherited;
  mdPesquisa.Close;
end;

procedure TFrmContas.editar;
begin
  inherited;
  if not mdPesquisa.Eof then
  begin
    if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
    begin
      Try
        if not Assigned(FrmContasCad) then
        FrmContasCad := TFrmContasCad.Create(Application);
        FrmContasCad.ParamsStr  := 'E';
        FrmContasCad.ParamsInt  := mdPesquisaid_conta.AsInteger;
        FrmContasCad.Show;

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

procedure TFrmContas.Excluir;

begin
  inherited;
  if not mdPesquisa.Eof then
  begin
    if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
    begin
      Try
        ContConta    := Nil;
        ContConta    := TContaController.Create;

        Try
          if ContConta.ExcluidoCancelado(mdPesquisaid_conta.AsInteger) then
          JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
        Finally
          FreeAndNil(ContConta);
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

procedure TFrmContas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmContas := nil;
end;

procedure TFrmContas.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;
end;

procedure TFrmContas.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'CONTAS';
  TitleText   := 'Pesquisa de Conta Bancária';
end;

procedure TFrmContas.Listagem;
begin
  inherited;
  JKDialog('Alerta','Funcionalidade em desenvolvimento.', tdAlerta);
end;

procedure TFrmContas.Novo;
begin
  inherited;
  if not Assigned(FrmContasCad) then
    FrmContasCad := TFrmContasCad.Create(Application);
  FrmContasCad.ParamsStr  := 'N';
  FrmContasCad.Show;
end;

procedure TFrmContas.Pesquisa;
var
List    : TObjectList<TContas>;
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

  ContConta      := TContaController.Create;

  Try
    List  := ContConta.ListarTodos(nCampo, nSituacao);

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

      mdPesquisaid_conta.AsInteger      := Item.id_conta;
      mdPesquisacodigo.AsInteger        := Item.Codigo;
      mdPesquisabanco.AsString          := Item.banco;
      mdPesquisaagencia.AsString        := Item.agencia;
      mdPesquisaconta.AsString          := Item.conta;
      mdPesquisacorrentista.AsString    := Item.correntista;
      if Item.ativo='S' then
      mdPesquisaativo.AsString          := 'Sim'
      else
      mdPesquisaativo.AsString          := 'Não';

      mdPesquisa.Post;

    end;
    mdPesquisa.First;
    mdPesquisa.EnableControls;

  Finally
    FreeAndNil(ContConta);
    if Assigned(List) then
      List.Free;
  End;
end;

procedure TFrmContas.Relatorio;
begin
  inherited;
  JKDialog('Alerta','Funcionalidade em desenvolvimento.', tdAlerta);
end;

end.
