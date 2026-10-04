unit UnitGrupoCad;

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
  cxCheckBox, UnitBaseNovoCadastro, Data.DB, DBAccess, Uni, ACBrBase,
  ACBrEnterTab, dxBevel,
  model.Grupo,Controller.Grupo, Vcl.ButtonStylesAttributes, Vcl.StyledButton,
  cxStyles, cxGridTableView, cxClasses;

type
  TFrmGrupoCad = class(TFormNovoBaseCadastro)
    Label1: TLabel;
    cxCodigo: TcxTextEdit;
    Label3: TLabel;
    cxGrupo: TcxTextEdit;
    cxAtivo: TcxCheckBox;
    procedure cxCodigoKeyPress(Sender: TObject; var Key: Char);
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
  FrmGrupoCad: TFrmGrupoCad;
  ObjGrupo   : TModelGrupo;
  ContGrupo  : TGrupoController;
implementation

{$R *.dfm}

Uses Vcl.Session, uJKDialog;

procedure TFrmGrupoCad.cxCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0'..'9', #8, ^V, ^C, ^X]) then
        Key := #0;
end;

procedure TFrmGrupoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmGrupoCad := Nil;
end;

procedure TFrmGrupoCad.FormShow(Sender: TObject);
begin
  inherited;
  if ParamsStr = 'N' then
  begin
    TitleText   := 'Novo Grupo';
    cxGrupo.SetFocus;
  end
  else
  begin
    TitleText   := 'Editar Grupo';
    PopularCampos;
  end;
end;

procedure TFrmGrupoCad.PopularCampos;
begin
  inherited;
  ObjGrupo  := Nil;
  ContGrupo := Nil;

  ObjGrupo      := TModelGrupo.Create	;
  ContGrupo     := TGrupoController.Create;
  Try
    try
      ObjGrupo     := ContGrupo.BuscarPorID(ParamsInt);

      if Assigned(ObjGrupo) then
      begin
        cxcodigo.EditValue   := ObjGrupo.codigo;
        cxgrupo.EditValue    := ObjGrupo.grupo;
        cxativo.EditValue    := ObjGrupo.ativo;
        cxGrupo.SetFocus;
      end
      else
      begin
        JKDialog('Aviso','Não foi possivel carregar os dados.', tdAlerta);
        exit;
      end;

    Except on e:exception do
      begin
        msg := msg+' :'+e.Message;
        raise;
      end;
    end;
  Finally
    ObjGrupo.Free;
    ContGrupo.Free;
  End;

end;

function TFrmGrupoCad.Salvar(out msg: string): Boolean;
var
AId:Integer;
begin
  Result        := False;

  ObjGrupo      := nil;
  ContGrupo     := nil;

  ObjGrupo      := TModelGrupo.Create	;
  ContGrupo     := TGrupoController.Create;

  Try
    if ParamsStr='N' then
    ObjGrupo.id_grupo       := 0
    else
    ObjGrupo.id_grupo       := ParamsInt;
    ObjGrupo.grupo          := cxGrupo.EditValue;
    ObjGrupo.ativo          := cxativo.EditValue;
    ObjGrupo.id_empresa     := TSession.idempresa;
    ObjGrupo.id_usuario     := TSession.id_usuario;
    ObjGrupo.tipo           := 'G';

    if ParamsStr='E' then
    ObjGrupo.id_usuario_alt :=TSession.id_usuario;

    Try
      if ContGrupo.Salvar(ObjGrupo, AId) then
      begin
        msg             := 'Registro salvo com sucesso';
        ParamsCloseTela := 'S';
        Result  := true;
      end;
    Except on e:exception do
      begin
        msg   := 'Ocorreu um erro ao salvar: '+e.Message;
        exit;
      end;
    End;

  Finally
    FreeAndNil(ObjGrupo);
    FreeAndNil(ContGrupo);
  End;
end;

function TFrmGrupoCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if cxGrupo.text='' then
  begin
    msg     := 'Informe a descrição do grupo!';
    Result  := False;
    exit;
  end;

end;

end.

