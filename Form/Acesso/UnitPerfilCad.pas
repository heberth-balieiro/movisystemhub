unit UnitPerfilCad;

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
  ACBrBase, ACBrEnterTab, cxCheckBox, UnitBaseNovoCadastro,
  Vcl.ButtonStylesAttributes, Data.DB, DBAccess, Uni, Vcl.StyledButton, dxBevel,
  Controller_Perfil, Model.Perfil;

type
  TFrmPerfilCad = class(TFormNovoBaseCadastro)
    Label5: TLabel;
    cxcodigo: TcxTextEdit;
    Label22: TLabel;
    cxnome: TcxTextEdit;
    cxativo: TcxCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;
    { Public declarations }
  end;

var
  FrmPerfilCad: TFrmPerfilCad;
  ObjPerfil   : TModelPerfil;
  ContPerfil  : TPerfilController;
implementation

{$R *.dfm}

Uses Vcl.Session, uJKDialog;

procedure TFrmPerfilCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmPerfilCad  := nil;
end;

procedure TFrmPerfilCad.FormShow(Sender: TObject);
begin
  inherited;
  Try

    if ParamsStr = 'N' then
    begin
      TitleText   := 'Novo Perfil';
      cxNome.SetFocus;
    end
    else
    begin
      TitleText   := 'Editar Perfil';
      PopularCampos;
    end;

  Except on e:exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  End;
end;

procedure TFrmPerfilCad.PopularCampos;
begin
  inherited;
  try
    ObjPerfil        := Nil;
    ContPerfil       := Nil;

    ObjPerfil   := TModelPerfil.Create;
    ContPerfil  := TPerfilController.Create;
    Try

        ObjPerfil    := ContPerfil.BuscarPorID(ParamsInt);
        if Assigned(ObjPerfil) then
        begin
          cxcodigo.EditValue        := ObjPerfil.codigo;
          cxnome.EditValue          := ObjPerfil.descricao;
          cxativo.EditValue         := ObjPerfil.inativo;
          cxnome.SetFocus;
        end
        else
        begin
          JKDialog('Aviso','Não foi possivel carregar os dados.', tdAlerta);
          exit;
        end;

    Finally
      FreeAndNil(ObjPerfil);
      FreeAndNil(ContPerfil);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmPerfilCad.Salvar(out msg: string): Boolean;
var
AId:Integer;
begin
  try
    Result            := False;
    ObjPerfil        := Nil;
    ContPerfil       := Nil;

    ObjPerfil   := TModelPerfil.Create;
    ContPerfil  := TPerfilController.Create;

    Try
      if ParamsStr='N' then
      ObjPerfil.id_perfil      := 0
      else
      ObjPerfil.id_perfil      := ParamsInt;

      ObjPerfil.descricao       := Trim(cxnome.Text);
      ObjPerfil.inativo         := cxativo.EditValue;
      ObjPerfil.id_empresa      := TSession.IDEMPRESA;

      if ContPerfil.Salvar(ObjPerfil, AId) then
      begin
        if AID = 0 then
        AID     := ParamsInt;
        msg     := 'Registro salvo com sucesso, ID: '+IntToStr(AId);
        Result  := true;
        ParamsCloseTela := 'S';
      end;
    Finally
      FreeAndNil(ContPerfil);
      FreeAndNil(ObjPerfil);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmPerfilCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;
  try
    if (cxnome.Text='') then
    begin
      msg     := 'Informe um perfil!';
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
