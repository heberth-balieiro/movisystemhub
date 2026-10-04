unit UnitCadCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseNovoCadastro, Data.DB, DBAccess,
  Uni, ACBrBase, ACBrEnterTab, Vcl.StdCtrls, Vcl.Buttons, dxBevel, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxCheckBox, cxTextEdit, cxMaskEdit,
  cxDropDownEdit,
  Model.Cidade, Controller.Cidade, Vcl.ButtonStylesAttributes, Vcl.StyledButton;

type
  TFrmCadCidade = class(TFormNovoBaseCadastro)
    Label1: TLabel;
    cxCodigo: TcxTextEdit;
    Label3: TLabel;
    cxCidade: TcxTextEdit;
    cxAtivo: TcxCheckBox;
    Label4: TLabel;
    cxEstado: TcxComboBox;
    cxIbge: TcxTextEdit;
    Label2: TLabel;
    procedure cxIbgeKeyPress(Sender: TObject; var Key: Char);
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
  FrmCadCidade: TFrmCadCidade;
  CidadeContr : TCidadeController;
  ObjCidade   : TCidade;
implementation

uses Vcl.Session, uJKDialog;

{$R *.dfm}

{ TFrmCadCidade }

procedure TFrmCadCidade.cxIbgeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0'..'9', #8, ^V, ^C, ^X]) then
    Key := #0;
end;

procedure TFrmCadCidade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmCadCidade  := Nil;
end;

procedure TFrmCadCidade.FormShow(Sender: TObject);
begin
  inherited;
  if ParamsStr = 'N' then
  begin
    TitleText   := 'Nova Cidade';
    cxCidade.SetFocus;
  end
  else
  begin
    TitleText   := 'Editar Cidade';
    PopularCampos;
  end;
end;

procedure TFrmCadCidade.PopularCampos;
begin
  inherited;
  CidadeContr     := Nil;
  ObjCidade       := Nil;

  CidadeContr     := TCidadeController.Create;
  ObjCidade       := TCidade.Create;
  Try
    try

      ObjCidade   := CidadeContr.BuscarPorID(ParamsInt);

      if Assigned(ObjCidade) then
      begin
        cxcodigo.EditValue      := ObjCidade.id_cidade;
        cxCidade.EditValue      := ObjCidade.cidade;
        cxEstado.EditValue      := ObjCidade.uf;
        cxIbge.EditValue        := ObjCidade.cid_ibge;
        if ObjCidade.inativo = 0 then
        cxativo.EditValue       := 'S'
        else
        cxativo.EditValue       := 'N';

        cxCidade.SetFocus;
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
    CidadeContr.Free;
    ObjCidade.Free;
  End;
end;

function TFrmCadCidade.Salvar(out msg: string): Boolean;
var
AId:Integer;
begin
  Result          := False;

  CidadeContr     := nil;
  ObjCidade       := nil;

  CidadeContr     := TCidadeController.Create;
  ObjCidade       := TCidade.Create;

  Try
    if ParamsStr='N' then
    ObjCidade.id_cidade       := 0
    else
    ObjCidade.id_cidade     := ParamsInt;
    ObjCidade.cidade        := Trim(cxcidade.Text);
    ObjCidade.uf            := cxEstado.EditValue;
    ObjCidade.cid_ibge      := StrToInt(cxibge.text);
    if cxativo.Checked then
    ObjCidade.inativo       := 0
    else
    ObjCidade.inativo       := 1;

    Try
      if CidadeContr.Salvar(ObjCidade, AId) then
      begin
        msg     := 'Registro salvo com sucesso';
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
    FreeAndNil(CidadeContr);
    FreeAndNil(ObjCidade);
  End;
end;

function TFrmCadCidade.ValidarCampos(out msg: string): Boolean;
begin
Result  := True;

  if cxCidade.text='' then
  begin
    msg     := 'Informe a descrição da cidade!';
    Result  := False;
    exit;
  end;

  if (cxEstado.Text='')  or (cxestado.ItemIndex=-1) then
  begin
    msg     := 'Selecione um estado!';
    Result  := False;
    exit;
  end;

end;

end.
