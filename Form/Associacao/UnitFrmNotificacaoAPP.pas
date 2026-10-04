unit UnitFrmNotificacaoAPP;

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
  cxCustomListBox, cxListBox, cxMemo,
  RESTRequest4D,DataSet.Serialize.Adapter.RESTRequest4D,System.JSON, ACBRUtil,
  ACBrBase, ACBrEnterTab, REST.Types, Data.DB, DBAccess, Uni, cxCheckBox,
  dxBevel, UnitBaseNovoCadastro, Vcl.ButtonStylesAttributes, Vcl.StyledButton,
  model.Notificacao, Controller.notificacaoAPP, dxGDIPlusClasses;

type
  TFrmEnviarNotificacao = class(TFormNovoBaseCadastro)
    Label20: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cxTitulo: TcxTextEdit;
    cxPublico: TcxCheckBox;
    cxMensagem: TcxBlobEdit;
    cxFoto: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cxFotoDblClick(Sender: TObject);

  private
    Procedure carregarIMG;
    { Private declarations }
  public
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    { Public declarations }
  end;

var
  FrmEnviarNotificacao: TFrmEnviarNotificacao;
  ContNot : TNotificacaoController;
  ObjNot  : TNotificacao;
implementation

{$R *.dfm}

uses uJKDialog, UConeSul, Vcl.Session, Vcl.Validacoes, uConfiguracaoService;

procedure TFrmEnviarNotificacao.carregarIMG;
var
OpenDialog: TOpenDialog;
begin
  Try
    OpenDialog := TOpenDialog.Create(nil);
    Try
      OpenDialog.Filter := 'Imagens JPEG|*.jpg;*.jpeg|Imagens PNG|*.png;*.png';
      OpenDialog.Title := 'Selecione uma foto';

      if OpenDialog.Execute then
      begin
        cxfoto.Picture.LoadFromFile(OpenDialog.FileName);
        cxfoto.Tag :=1;
      end;
    Finally
      OpenDialog.Free
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  End;
end;

procedure TFrmEnviarNotificacao.cxFotoDblClick(Sender: TObject);
begin
  inherited;
  carregarIMG;
end;

procedure TFrmEnviarNotificacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmEnviarNotificacao  := Nil;
end;

procedure TFrmEnviarNotificacao.FormShow(Sender: TObject);
begin
  inherited;
  try
    if ParamsStr = 'N' then
    begin
      TitleText   := ' Enviar Notificação WebApp';
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmEnviarNotificacao.Salvar(out msg: string): Boolean;
Var
AId:Integer;
vFotoBase:string;
begin
  Result   := False;
  ContNot  := nil;
  ObjNot   := nil;

  Try
    ContNot := TNotificacaoController.create;
    ObjNot  := TNotificacao.create;

    Try
      if ParamsStr='N' then
      ObjNot.id_notificacao     := 0
      else
      ObjNot.id_notificacao     := ParamsInt;

      ObjNot.tipo               := 0;
      ObjNot.titulo             := Trim(cxTitulo.Text);
      ObjNot.mensagem           := Trim(cxMensagem.Text);
      ObjNot.publico            := cxPublico.EditValue;
      if cxFoto.Picture.Graphic <> nil then
      begin
        if cxfoto.Tag=1 then
        begin
          vFotoBase                 := TConeSul.ConvImgBase64(cxfoto);
          ObjNot.foto               := vFotoBase;
        end
        else
        ObjNot.foto := NullAsStringValue;
      end;
      ObjNot.sinc_app           := 'S';

      if ContNot.Salvar(ObjNot, AId) then
      begin
        if AID = 0 then
        AID     := ParamsInt;
        msg     := 'Registro salvo com sucesso';
        Result  := true;
        if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
        TConfiguracaoService.SincronizarGravar(14, AID);
        ParamsCloseTela := 'S';
      end;

    Finally
      FreeAndNil(ContNot);
      FreeAndNil(ObjNot);
    End;

  Except on e:exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  End;
end;

function TFrmEnviarNotificacao.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  Try
    if (cxTitulo.Text = '') or (cxtitulo.EditValue = null) then
    begin
      msg := 'Informe uma descrição para o título!';
      Result  := False;
      exit;
    end;

    if (cxMensagem.Text = '') or (cxMensagem.EditValue = null) then
    begin
      msg := 'Informe uma mensagem!';
      Result  := False;
      exit;
    end;

  Except on e:exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  End;
end;

end.
