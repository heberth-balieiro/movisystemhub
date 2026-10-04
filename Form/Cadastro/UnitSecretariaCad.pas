unit UnitSecretariaCad;

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
  cxCheckBox, ACBrBase, ACBrEnterTab;

type
  TFrmsecretariaCad = class(TForm)
    lblTitulo: TLabel;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    Paneltitulo: TPanel;
    Label27: TLabel;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    edtcodigo: TcxTextEdit;
    edtrazao: TcxTextEdit;
    edtativo: TcxCheckBox;
    edtFantasia: TcxTextEdit;
    Label2: TLabel;
    ACBrEnterTab1: TACBrEnterTab;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    Function Salvar(out msg:string):Boolean;
    Function ValidarCampos(out msg:string):Boolean;
    Procedure CarregarDados;
    { Public declarations }
  end;

var
  FrmsecretariaCad: TFrmsecretariaCad;

implementation

{$R *.dfm}

Uses Udm, model.secretaria, Vcl.Session, uJKDialog;

procedure TFrmsecretariaCad.btnCancelarClick(Sender: TObject);
begin
    TNavigation.Close(Self);
end;

procedure TFrmsecretariaCad.btnSalvarClick(Sender: TObject);
var
msg :String;
begin
  //

  if ValidarCampos(msg) then
  begin
    Try
       if Salvar(msg) then
        begin
          JKDialog('Sucesso',msg, tdSucesso);
          TNavigation.Close(Self);
        end
        else
        JKDialog('Aviso',msg, tdAlerta);


    Except on e:exception do
      begin
        JKDialog('Aviso',msg+' :'+e.Message, tdErro);
        raise
      end;
    End;
  end
  else
  begin
    JKDialog('Aviso',msg, tdAlerta);
    exit;
  end;
end;

procedure TFrmsecretariaCad.CarregarDados;
var
Model : TModelsecretaria;
msg:string;
begin

  Try
    try
      Model                   := TModelSecretaria.Create;
      Model.idSecretaria      := TNavigation.ParamInt;

      if Model.Select(msg) then
      begin
        edtcodigo.EditValue     := model.codigo;
        edtrazao.EditValue      := model.razao;
        edtfantasia.EditValue   := model.fantasia;
        edtativo.EditValue      := model.ativo;
      end;

    Except on e:exception do
      begin
        msg := msg+' :'+e.Message;
        raise;
      end;
    end;
  Finally
    model.Free;
  End;
end;

procedure TFrmsecretariaCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    FrmSecretariaCad := nil;
end;

procedure TFrmsecretariaCad.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_f5 then
  begin
    btnsalvar.Click;
    key:=0;
  end;

  if key = VK_ESCAPE then
  begin
    btncancelar.Click;
    key:=0;
  end;
end;

procedure TFrmsecretariaCad.FormShow(Sender: TObject);
begin
  if TNavigation.ParamsStr='V' then
  begin
    lblTitulo.Caption := 'Visualizando Secretaria';
    CarregarDados;
    cxGroupBox1.Enabled := False;
    btnSalvar.Enabled   := false;
  end;

  if TNavigation.ParamsStr='E' then
  begin
    lblTitulo.Caption := 'Editando Secretaria';
    CarregarDados;
    edtrazao.SetFocus;
  end;

  if TNavigation.ParamsStr = 'N' then
  begin
    edtrazao.SetFocus;
    edtativo.Checked    := true;
  end;
end;

function TFrmsecretariaCad.Salvar(out msg: string): Boolean;
var
model : TModelSecretaria;
id:integer;
begin
  Result  := False;
  Try
    try
      model             :=  TModelSecretaria.Create;
      
      model.razao       := Trim(edtrazao.Text);
      model.fantasia    := Trim(edtfantasia.Text);
      model.ativo       := edtativo.EditValue;
      model.idempresa  := TSession.IDEMPRESA;
      model.idusuario  := TSession.ID_USUARIO;

      if TNavigation.ParamsStr='N' then
      begin
        if model.Insert(msg) then;
        Result  := True;
      end
      else
      begin
        model.idsecretaria := TNavigation.ParamInt;
        if model.Update(msg) then;
        Result  := True;
      end;

    Except on e:exception do
      begin
        msg := msg+' :'+e.Message;
        raise;
      end;
    end;
  Finally
    model.Free;
  End;
end;

function TFrmsecretariaCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if (edtrazao.Text ='') or (Length(edtrazao.Text) < 2) then
  begin
    msg     := 'Informe a descrição da secretaria acima de 2 caracteres!';
    Result  := False;
    Exit;
  end;

end;

end.
