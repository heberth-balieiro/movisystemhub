unit UnitTipoCad;

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
  TFrmTipoCad = class(TForm)
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
    edtperfil: TcxTextEdit;
    edtativo: TcxCheckBox;
    Label2: TLabel;
    edttipo: TcxComboBox;
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
  FrmTipoCad: TFrmTipoCad;

implementation

{$R *.dfm}

Uses Udm, model.Tipoplano, Vcl.Session, uJKDialog;

procedure TFrmTipoCad.btnCancelarClick(Sender: TObject);
begin
    TNavigation.Close(Self);
end;

procedure TFrmTipoCad.btnSalvarClick(Sender: TObject);
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

procedure TFrmTipoCad.CarregarDados;
var
Model : TModelTipoplano;
msg:string;
begin
  Model             := TModelTipoplano.Create;
  Try
    try
      if Model.LocalizarID(msg, TNavigation.ParamInt) then
      begin

        edtcodigo.EditValue     := Model.codigo;
        edtperfil.EditValue     := Model.descricao;
        edtativo.EditValue      := Model.inativo;
        edttipo.EditValue       := Model.Tipo;
      end;

    Except on e:exception do
      begin
        msg := msg+' :'+e.Message;
        raise;
      end;
    end;
  Finally
    Model.Free;
  End;
end;

procedure TFrmTipoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    FrmTipoCad := nil;
end;

procedure TFrmTipoCad.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmTipoCad.FormShow(Sender: TObject);
begin
  if TNavigation.ParamsStr='V' then
  begin
    lblTitulo.Caption := 'Visualizando Tipo de Plano';
    CarregarDados;
    cxGroupBox1.Enabled := False;
    btnSalvar.Enabled   := false;
  end;

  if TNavigation.ParamsStr='E' then
  begin
    lblTitulo.Caption := 'Editando Tipo de Plano';
    CarregarDados;
    edtperfil.SetFocus;
  end;

  if TNavigation.ParamsStr = 'N' then
  begin
    edtperfil.SetFocus;
    edtativo.Checked    := true;
  end;
end;

function TFrmTipoCad.Salvar(out msg: string): Boolean;
var
Model : TModeltipoplano;
begin
  Result  := False;
  Model             :=  TModeltipoplano.Create;
  Try
    try
      Model.Descricao   := Trim(edtperfil.Text);
      Model.inativo     := edtativo.EditValue;
      Model.Tipo        := edttipo.Text;


      if TNavigation.ParamsStr='N' then
      begin
        if Model.Novo(msg) then;
        Result  := True;
      end
      else
      begin
        Model.idtipo  := TNavigation.ParamInt;
        if Model.editar(msg) then;
        Result  := True;
      end;

    Except on e:exception do
      begin
        msg := msg+' :'+e.Message;
        raise;
      end;
    end;
  Finally
    Model.Free;
  End;
end;

function TFrmTipoCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if (edtperfil.Text ='') or (Length(edtperfil.Text) < 3) then
  begin
    msg     := 'Informe a descrição do tipo acima de 3 caracteres!';
    Result  := False;
    Exit;
  end;

  if (edttipo.ItemIndex=-1) or (edttipo.Text='') then
  begin
    msg     := 'Informe o tipo de lançamento!';
    Result  := False;
    Exit;
  end;
end;

end.
