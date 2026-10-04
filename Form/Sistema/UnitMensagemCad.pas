unit UnitMensagemCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseCad, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
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
  dxSkinXmas2008Blue, ACBrBase, ACBrEnterTab, cxCheckBox, cxTextEdit,
  cxGroupBox, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, cxMaskEdit,
  cxDropDownEdit, cxMemo, cxRichEdit,Model.Mensagem, Controller_Mensagem, UnitBaseNovoCadastro,
  Vcl.ButtonStylesAttributes, Data.DB, DBAccess, Uni, Vcl.StyledButton, dxBevel,
  uJKDialog, cxStyles, cxGridTableView, cxClasses;

type
  TFrmMensagemCad = class(TFormNovoBaseCadastro)
    btnParams: TSpeedButton;
    Label1: TLabel;
    cxcodigo: TcxTextEdit;
    Label22: TLabel;
    cxdescricao: TcxTextEdit;
    cxutilizar: TcxComboBox;
    Label2: TLabel;
    cxassunto: TcxTextEdit;
    Label3: TLabel;
    cxmensagem: TcxMemo;
    Label4: TLabel;
    cxAtivo: TcxCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnParamsClick(Sender: TObject);
  private

    { Private declarations }
  public
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;
    { Public declarations }
  end;

var
  FrmMensagemCad: TFrmMensagemCad;
  ObjMensagem   : TModelMensagem;
  ContMensagem  : TMensagemController;
implementation

{$R *.dfm}

uses Vcl.Navigation, UVariaveisMensagem;

{ TFrmMensagemCad }

procedure TFrmMensagemCad.btnParamsClick(Sender: TObject);
begin
  inherited;
  ShowMessage('Variáveis disponíveis:' + sLineBreak + GetVariaveisMensagem);
end;

procedure TFrmMensagemCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmMensagemCad  := nil;
end;

procedure TFrmMensagemCad.FormShow(Sender: TObject);
begin
  inherited;
  Try
    if ParamsStr = 'N' then
    begin
      TitleText   := 'Novo Cadastro de Mensagem';
      cxativo.Checked := true;
      cxdescricao.SetFocus;
    end
    else
    begin
      TitleText   := 'Editar Mensagem';
      PopularCampos;
      cxdescricao.SetFocus;
    end;

  Except on e:exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  End;
end;

procedure TFrmMensagemCad.PopularCampos;
begin
  inherited;
  try
    ObjMensagem   := Nil;
    ContMensagem  := Nil;

    ObjMensagem   := TModelMensagem.Create;
    ContMensagem  := TMensagemController.Create;
    Try
      ObjMensagem    := ContMensagem.BuscarPorID(ParamsInt);
      if Assigned(ObjMensagem) then
      begin
        cxcodigo.EditValue      := ObjMensagem.codigo;
        cxdescricao.EditValue   := ObjMensagem.descricao;
        cxutilizar.EditValue    := ObjMensagem.uso;
        cxassunto.EditValue     := ObjMensagem.assunto_email;
        cxmensagem.EditValue    := ObjMensagem.mensagem;
        cxativo.EditValue       := ObjMensagem.ativo;
      end
      else
      begin
        JKDialog('Aviso','Não foi possivel carregar os dados.', tdAlerta);
        exit;
      end;

    Finally
      FreeAndNil(ObjMensagem);
      FreeAndNIl(ContMensagem);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmMensagemCad.Salvar(out msg: string): Boolean;
var
AId:Integer;
begin
  try
    Result        := False;
    ObjMensagem   := Nil;
    ContMensagem  := Nil;

    ObjMensagem   := TModelMensagem.Create;
    ContMensagem  := TMensagemController.Create;

    Try
      if ParamsStr='N' then
      ObjMensagem.id_mensagem     := 0
      else
      ObjMensagem.id_mensagem     := ParamsInt;
      ObjMensagem.descricao       := Trim(cxdescricao.Text);
      ObjMensagem.ativo           := cxativo.EditValue;
      ObjMensagem.uso             := cxutilizar.Text;
      ObjMensagem.assunto_email   := Trim(cxassunto.Text);
      ObjMensagem.mensagem        := Trim(cxmensagem.Text);

      if ContMensagem.Salvar(ObjMensagem, AId) then
      begin
        if AID = 0 then
        AID     := ParamsInt;
        msg     := 'Registro salvo com sucesso, ID: '+IntToStr(AId);
        Result  := true;
        ParamsCloseTela := 'S';
      end;
    Finally
      FreeAndNil(ContMensagem);
      FreeAndNil(ObjMensagem);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmMensagemCad.ValidarCampos(out msg: string): Boolean;
begin
  try
    Result  := True;

    if cxdescricao.Text='' then
    begin
      msg     := 'Informe uma descrição para a mensagem!';
      result  := False;
      Exit;
    end;

    if cxutilizar.ItemIndex =-1 then
    begin
      msg     := 'Selecione onde será utilizado!';
      result  := False;
      Exit;
    end;

    if cxmensagem.Text='' then
    begin
      msg     := 'Informe uma mensagem!';
      result  := False;
      Exit;
    end;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

end.

