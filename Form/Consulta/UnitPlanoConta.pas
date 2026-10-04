unit UnitPlanoConta;

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
  dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Navigation,
  UnitPlanoContaCad, Vcl.Loading, uJKDialog, cxContainer,
  cxGroupBox, UFormNovoBasePesquisa, Vcl.ButtonStylesAttributes,
  System.ImageList, Vcl.ImgList, cxImageList, DBAccess, Uni, Vcl.StyledButton,
  cxMaskEdit, cxDropDownEdit, cxTextEdit, Model.PlanoConta, Controller.PlanoContas,
  dxmdaset, Vcl.Session;

type
  TFrmPlanoContaCons = class(TFormNovoBasePesquisa)
    gCodigo: TcxGridDBColumn;
    gDescricao: TcxGridDBColumn;
    gId: TcxGridDBColumn;
    gSubgrupo: TcxGridDBColumn;
    gtipo: TcxGridDBColumn;
    gGrupo: TcxGridDBColumn;
    frxReport: TfrxReport;
    BtnNovoFilho: TMenuItem;
    mdPesquisa: TdxMemData;
    mdPesquisaid_planoconta: TIntegerField;
    mdPesquisacodigo: TStringField;
    mdPesquisadescricao: TStringField;
    mdPesquisaid_pai: TIntegerField;
    mdPesquisanivel: TIntegerField;
    mdPesquisaaceita_lancamento: TStringField;
    mdPesquisaativo: TStringField;
    mdPesquisaordem: TIntegerField;
    mdPesquisadesnivel: TStringField;
    mdPesquisatipo: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnNovoFilhoClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    
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
  FrmPlanoContaCons: TFrmPlanoContaCons;
  ContPlano :TPlanoContaController;
  ObjPlano  :TModelPlanoconta;
implementation

{$R *.dfm}

uses UnitTipoCad, UnitGrupoPlanoCad, UnitSubGrupoCad, System.Generics.Collections;

{ TFrmPlanoContaCons }

procedure TFrmPlanoContaCons.BtnLimparClick(Sender: TObject);
begin
  inherited;
  mdPesquisa.Close;
end;

procedure TFrmPlanoContaCons.BtnNovoFilhoClick(Sender: TObject);
var
 dados : TDadosRecord;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja criar um registro filho?', tdMensagem)  then
      begin
        if not Assigned(FrmPlanoCad) then
        FrmPlanoCad             := TFrmPlanoCad.Create(Application);
        FrmPlanoCad.ParamsStr   := 'N';
        dados.AIDPai            := mdPesquisaid_planoconta.AsInteger;
        dados.AOrigem           := 'F';
        dados.ANivel            := mdPesquisanivel.AsInteger;
        dados.ATipo             := mdPesquisatipo.AsString;
        FrmPlanoCad.Dados       := Dados;

        if mdPesquisaid_planoconta.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;

        if mdPesquisanivel.AsInteger >= 5 then
        begin
          JKDialog('Aviso','A conta selecionada já está no nível máximo permitido e não pode receber novos filhos.', tdAlerta);
          exit;
        end;
        FrmPlanoCad.ShowModal;
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

procedure TFrmPlanoContaCons.Editar;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
      begin
        if not Assigned(FrmPlanoCad) then
        FrmPlanoCad := TFrmPlanoCad.Create(Application);
        FrmPlanoCad.ParamsStr  := 'E';
        FrmPlanoCad.ParamsInt  := mdPesquisaid_planoconta.AsInteger;
        if mdPesquisaid_planoconta.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;
        FrmPlanoCad.ShowModal;
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

procedure TFrmPlanoContaCons.Excluir;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
      begin
        Try
          ContPlano    := Nil;
          ContPlano    := TPlanoContaController.Create;

          if mdPesquisaid_planoconta.AsInteger = 0 then
          begin
            JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
            exit;
          end;

          if ContPlano.ExcluidoCancelado(mdPesquisaid_planoconta.AsInteger,TSession.ID_USUARIO) then
          begin
            Pesquisa;
            JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
          end;

        Finally
          FreeAndNil(ContPlano);
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

procedure TFrmPlanoContaCons.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmPlanoContaCons := nil;
end;

procedure TFrmPlanoContaCons.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'Plano de Contas';
  TitleText   := 'Pesquisa de Plano de Contas';
end;

procedure TFrmPlanoContaCons.Listagem;
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

procedure TFrmPlanoContaCons.Novo;
begin
  inherited;
  if not Assigned(FrmPlanoCad) then
  FrmPlanoCad := TFrmPlanoCad.Create(Application);
  FrmPlanoCad.ParamsStr  := 'N';
  FrmPlanoCad.ShowModal;
end;

procedure TFrmPlanoContaCons.Pesquisa;
var
List    : TObjectList<TModelPlanoconta>;
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

    ContPlano := TPlanoContaController.Create;


    Try
      List  := ContPlano.ListarTodos(nCampo, nSituacao);

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

        mdPesquisaid_planoconta.AsInteger       := Item.Id_PlanoConta;
        mdPesquisacodigo.AsString               := Item.Codigo;
        mdPesquisadescricao.AsString            := Item.Descricao;
        mdPesquisaid_pai.AsInteger              := Item.id_pai;
        mdPesquisanivel.AsInteger               := Item.nivel;
        mdPesquisaaceita_lancamento.AsString    := Item.aceita;
        mdPesquisaativo.AsString                := Item.Ativo;
        mdPesquisaordem.AsInteger               := Item.ordem;
        mdPesquisadesnivel.AsString             := Item.desnivel;
        mdPesquisatipo.AsString                 := Item.tipo;

        mdPesquisa.Post;
      end;
      mdPesquisa.First;
      mdPesquisa.EnableControls;

    Finally
      FreeAndNil(ContPlano);
      if Assigned(List) then
        List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmPlanoContaCons.Relatorio;
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

