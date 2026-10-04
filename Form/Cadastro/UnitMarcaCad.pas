unit UnitMarcaCad;

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
  ACBrBase, ACBrEnterTab, cxCheckBox, UnitBaseNovoCadastro, Data.DB, DBAccess,
  Uni, dxBevel,
  Model.Marca, Controller.Marca, Vcl.ButtonStylesAttributes, Vcl.StyledButton,
  cxStyles, cxGridTableView, cxClasses;

type
  TFrmMarcaCad = class(TFormNovoBaseCadastro)
    Label27: TLabel;
    cxCodigo: TcxTextEdit;
    cxMarca: TcxTextEdit;
    Label2: TLabel;
    cxAtivo: TcxCheckBox;
    Label3: TLabel;
    procedure cxCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;
  end;

var
  FrmMarcaCad: TFrmMarcaCad;
  ObjMarca  : TModelMarca;
  ContMarca : TMarcaController;

implementation

{$R *.dfm}

uses UConeSul, Vcl.Loading, Vcl.Session, uJKDialog;

procedure TFrmMarcaCad.cxCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0'..'9', #8, ^V, ^C, ^X]) then
        Key := #0;
end;

procedure TFrmMarcaCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmMarcaCad := Nil;
end;

procedure TFrmMarcaCad.FormShow(Sender: TObject);
begin
  inherited;
  if ParamsStr = 'N' then
  begin
    TitleText   := 'Nova Marca';
    cxMarca.SetFocus;
  end
  else
  begin
    TitleText   := 'Editar Marca';
    PopularCampos;
  end;
end;

procedure TFrmMarcaCad.PopularCampos;
begin
  inherited;
  ObjMarca      := Nil;
  ContMarca := Nil;

  ObjMarca      := TModelMarca.Create	;
  ContMarca     := TMarcaController.Create;
  Try
    try
      ObjMarca     := ContMarca.BuscarPorID(ParamsInt);

      if Assigned(ObjMarca) then
      begin
        cxcodigo.EditValue   := ObjMarca.codigo;
        cxMarca.EditValue    := ObjMarca.marca;
        cxativo.EditValue    := ObjMarca.ativo;

        cxMarca.SetFocus;
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
    ObjMarca.Free;
    ContMarca.Free;
  End;

end;

function TFrmMarcaCad.Salvar(out msg: string): Boolean;
var
AId:Integer;
begin
  Result        := False;

  ObjMarca      := nil;
  ContMarca     := nil;

  ObjMarca      := TModelMarca.Create	;
  ContMarca     := TMarcaController.Create;

  Try
    if ParamsStr='N' then
    ObjMarca.id_marca   := 0
    else
    ObjMarca.id_marca   := ParamsInt;
    ObjMarca.marca          := cxMarca.EditValue;
    ObjMarca.ativo         := cxativo.EditValue;
    ObjMarca.excluido      := 0;
    ObjMarca.id_empresa    := TSession.idempresa;
    ObjMarca.id_usuario    := TSession.id_usuario;
    ObjMarca.data_cadastro := Now;
    ObjMarca.Tipo          := 'M';

    if ParamsStr='E' then
    begin
      ObjMarca.id_usuario_alt := TSession.id_usuario;
      ObjMarca.Data_Alteracao := Now();
    end;
    Try
      if ContMarca.Salvar(ObjMarca, AId) then
      begin
        if AID = 0 then
        AID     := ParamsInt;
        msg     := 'Registro salvo com sucesso, Código: '+IntToStr(AId);
        Result  := true;
        ParamsCloseTela := 'S';
      end;
    Except on e:exception do
      begin
        msg   := 'Ocorreu um erro ao salvar: '+e.Message;
        exit;
      end;
    End;

  Finally
    FreeAndNil(ObjMarca);
    FreeAndNil(ContMarca);
  End;
end;

function TFrmMarcaCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if cxMarca.text='' then
  begin
    msg     := 'Informe a descrição da marca!';
    Result  := False;
    exit;
  end;

end;

end.

