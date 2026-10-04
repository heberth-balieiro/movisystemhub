unit UnitFrmMensagem;

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
  dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  cxContainer, cxGroupBox, UFormNovoBasePesquisa, Vcl.ButtonStylesAttributes,
  System.ImageList, Vcl.ImgList, cxImageList, DBAccess, Uni, Vcl.StyledButton,
  cxMaskEdit, cxDropDownEdit, cxTextEdit,
  Model.Mensagem, Controller_Mensagem, dxmdaset;

type
  TFrmMensagem = class(TFormNovoBasePesquisa)
    gCodigo: TcxGridDBColumn;
    gUso: TcxGridDBColumn;
    gDescricao: TcxGridDBColumn;
    gMensagem: TcxGridDBColumn;
    gid: TcxGridDBColumn;
    frxRelatorio: TfrxReport;
    mdPesquisa: TdxMemData;
    mdPesquisaid_mensagem: TIntegerField;
    mdPesquisacodigo: TIntegerField;
    mdPesquisadescricao: TStringField;
    mdPesquisaativo: TStringField;
    mdPesquisauso: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
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
  FrmMensagem : TFrmMensagem;
  ObjMensagem   : TModelMensagem;
  ContMensagem  : TMensagemController;
implementation

{$R *.dfm}

uses UnitMensagemCad,uJKDialog, Vcl.Session, Vcl.Loading, Vcl.Navigation,
    System.Generics.Collections;

{ TFrmMensagem }

procedure TFrmMensagem.BtnLimparClick(Sender: TObject);
begin
  inherited;
  try
    mdPesquisa.Close;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmMensagem.Editar;
begin
  inherited;
   try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
      begin
        if not Assigned(FrmMensagemCad) then
        FrmMensagemCad := TFrmMensagemCad.Create(Application);
        FrmMensagemCad.ParamsStr  := 'E';
        FrmMensagemCad.ParamsInt  := mdPesquisaid_mensagem.AsInteger;
        if mdPesquisaid_mensagem.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;
        FrmMensagemCad.Showmodal;
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

procedure TFrmMensagem.Excluir;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
      begin
        Try
          ContMensagem    := Nil;
          ContMensagem    := TMensagemController.Create;
          if mdPesquisaid_mensagem.AsInteger = 0 then
          begin
            JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
            exit;
          end;

          if ContMensagem.ExcluidoCancelado(mdPesquisaid_mensagem.AsInteger,0) then
          JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);

        Finally
          FreeAndNil(ContMensagem);
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

procedure TFrmMensagem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmMensagem := nil;
end;

procedure TFrmMensagem.FormCreate(Sender: TObject);
begin
  inherited;
  try
    if not mdPesquisa.Active then
    mdPesquisa.Open;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmMensagem.FormShow(Sender: TObject);
begin
  inherited;
  try
    ParamsTela  := 'Cadastro Mensagem';
    TitleText   := 'Pesquisa de Mensagem';

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmMensagem.Listagem;
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

procedure TFrmMensagem.Novo;
begin
  inherited;
  try
    if not Assigned(FrmMensagemCad) then
    FrmMensagemCad := TFrmMensagemCad.Create(Application);
    FrmMensagemCad.ParamsStr  := 'N';
    FrmMensagemCad.ShowModal;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmMensagem.Pesquisa;
var
List    : TObjectList<TModelMensagem>;
nCampo, nSituacao  : String;
begin
  inherited;
  try
    List          := Nil;
    ContMensagem  := nil;
    nCampo        := '';
    nSituacao     := '';

    if trim(edtBusca.Text) <> '' then
    nCampo     := Trim(edtBusca.Text);

    case cxAtivo.ItemIndex of
      1: nSituacao := 'S';
      2: nSituacao := 'N';
    end;

     ContMensagem  := TMensagemController.Create;

    Try
      List  := ContMensagem.ListarTodos(nCampo, nSituacao);

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

        mdPesquisaid_mensagem.AsInteger   := Item.id_mensagem;
        mdPesquisacodigo.AsInteger        := Item.codigo;
        mdPesquisadescricao.AsString      := Item.descricao;
        mdPesquisaativo.AsString          := Item.ativo;
        mdPesquisauso.AsString            := Item.uso;
        mdPesquisa.Post;
      end;
      mdPesquisa.First;
      mdPesquisa.EnableControls;

    Finally
      FreeAndNil(ContMensagem);
      if Assigned(List) then
        List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmMensagem.Relatorio;
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
