unit UnitTransportadora;

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
  dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Model.Transportadora,
  cxContainer, cxGroupBox, UFormNovoBasePesquisa, Vcl.ButtonStylesAttributes,
  System.ImageList, Vcl.ImgList, cxImageList, DBAccess, Uni, Vcl.StyledButton,
  cxMaskEdit, cxDropDownEdit, cxTextEdit, dxmdaset, Controller.Transportadora,
  Vcl.Session;

type
  TFrmTransportadoraConsulta = class(TFormNovoBasePesquisa)
    gcodigo: TcxGridDBColumn;
    grazao: TcxGridDBColumn;
    gCnpj: TcxGridDBColumn;
    gCidade: TcxGridDBColumn;
    frxReport: TfrxReport;
    mdPesquisa: TdxMemData;
    mdPesquisaid_transportadora: TIntegerField;
    mdPesquisacodigo: TIntegerField;
    mdPesquisacnpj: TStringField;
    mdPesquisarazao: TStringField;
    mdPesquisafantasia: TStringField;
    mdPesquisaie: TStringField;
    mdPesquisaantt: TStringField;
    mdPesquisaemail: TStringField;
    mdPesquisatelefone: TStringField;
    mdPesquisaativo: TStringField;
    mdPesquisanmcidade: TStringField;
    GridColumn1: TcxGridDBColumn;
    GridColumn2: TcxGridDBColumn;
    procedure BtnLimparClick(Sender: TObject);
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
  FrmTransportadoraConsulta: TFrmTransportadoraConsulta;
  ContTra : TTransportadoraController;
  ObjTra  : TModelTransportadora;
implementation

{$R *.dfm}

uses uJKDialog, Vcl.Loading, Vcl.Navigation, UnitTransportadoraCad,System.Generics.Collections;
{ TFrmTransportadoraConsulta }

procedure TFrmTransportadoraConsulta.BtnLimparClick(Sender: TObject);
begin
  inherited;
  mdPesquisa.Close;
end;

procedure TFrmTransportadoraConsulta.Editar;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
      begin
        if not Assigned(FrmTransportadoraCad) then
        FrmTransportadoraCad := TFrmTransportadoraCad.Create(Application);
        FrmTransportadoraCad.ParamsStr  := 'E';
        FrmTransportadoraCad.ParamsInt  := mdPesquisaid_transportadora.AsInteger;
        if mdPesquisaid_transportadora.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;
        FrmTransportadoraCad.ShowModal;
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

procedure TFrmTransportadoraConsulta.Excluir;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
      begin
        Try
          ContTra     := Nil;
          ContTra     := TTransportadoraController.Create;

          if mdPesquisaid_transportadora.AsInteger = 0 then
          begin
            JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
            exit;
          end;

          if ContTra.ExcluidoCancelado(mdPesquisaid_transportadora.AsInteger,TSession.id_usuario) then
          begin
            Pesquisa;
            JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
          end;

        Finally
          FreeAndNil(ContTra);
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

procedure TFrmTransportadoraConsulta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmTransportadoraConsulta := nil;
end;

procedure TFrmTransportadoraConsulta.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;
end;

procedure TFrmTransportadoraConsulta.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'Transportadora';
  TitleText   := 'Pesquisa de Transportadora';
end;

procedure TFrmTransportadoraConsulta.Listagem;
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

procedure TFrmTransportadoraConsulta.Novo;
begin
  inherited;
  if not Assigned(FrmTransportadoraCad) then
  FrmTransportadoraCad := TFrmTransportadoraCad.Create(Application);
  FrmTransportadoraCad.ParamsStr  := 'N';
  FrmTransportadoraCad.ShowModal;
end;

procedure TFrmTransportadoraConsulta.Pesquisa;
var
List    : TObjectList<TModelTransportadora>;
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

    ContTra := nil;
    ContTra := TTransportadoraController.Create;

    Try
      List  := ContTra.ListarTodos(nCampo, nSituacao);

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

        mdPesquisaid_transportadora.AsInteger :=Item.id_transportadora;
        mdPesquisacodigo.AsInteger            :=Item.codigo;
        mdPesquisacnpj.AsString               :=Item.cnpj;
        mdPesquisarazao.AsString              :=Item.razao;
        mdPesquisafantasia.AsString           :=Item.fantasia;
        mdPesquisaie.AsString                 :=Item.ie;
        mdPesquisaantt.AsString               :=Item.antt;
        mdPesquisaemail.AsString              :=Item.email;
        mdPesquisatelefone.AsString           :=Item.telefone;
        mdPesquisaativo.AsString              :=Item.ativo;
        mdPesquisanmcidade.AsString           :=Item.nmcidade;

        mdPesquisa.Post;
      end;
      mdPesquisa.First;
      mdPesquisa.EnableControls;

    Finally
      FreeAndNil(ContTra);
      if Assigned(List) then
        List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmTransportadoraConsulta.Relatorio;
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

