unit UnitCadCFOP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseNovoCadastro, Vcl.StdCtrls,
  Vcl.Buttons, dxBevel, Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
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
  dxSkinXmas2008Blue, cxMaskEdit, cxDropDownEdit, cxTextEdit, cxCheckBox,
  Model.CFOP, Controller.CFOP, ACBrBase, ACBrEnterTab, Data.DB, DBAccess, Uni,
  Vcl.ButtonStylesAttributes, Vcl.StyledButton, cxStyles, cxGridTableView,
  cxClasses;

type
  TFrmCadCFOP = class(TFormNovoBaseCadastro)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cxCodigo: TcxTextEdit;
    cxNatureza: TcxTextEdit;
    cxCFOP: TcxTextEdit;
    cxOperacao: TcxComboBox;
    Label5: TLabel;
    cxTipo: TcxComboBox;
    cxAtivo: TcxCheckBox;
    procedure cxCFOPKeyPress(Sender: TObject; var Key: Char);
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
  FrmCadCFOP: TFrmCadCFOP;
  CFOPContr : TCFOPController;
  ObjCFOP   : TCFOP;
implementation

{$R *.dfm}

uses Vcl.Session, uJKDialog;

{ TFrmCadCFOP }

procedure TFrmCadCFOP.cxCFOPKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
   if not CharInSet(Key, ['0'..'9', #8, ^V, ^C, ^X]) then
        Key := #0;
end;

procedure TFrmCadCFOP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmCadCFOP    := Nil;
end;

procedure TFrmCadCFOP.FormShow(Sender: TObject);
begin
  inherited;

  if ParamsStr = 'N' then
  begin
    TitleText   := 'Novo CFOP';
    cxNatureza.SetFocus;
  end
  else
  begin
    TitleText   := 'Editar CFOP';
    PopularCampos;
  end;
end;

procedure TFrmCadCFOP.PopularCampos;
begin
  inherited;

  ObjCFOP         := Nil;
  CFOPContr       := Nil;

  ObjCFOP         := TCFOP.Create;
  CFOPContr       := TCFOPController.Create;
  Try
    try

      ObjCFOP     := CFOPContr.BuscarPorID(ParamsInt);

      if Assigned(ObjCFOP) then
      begin
        cxcodigo.EditValue      := ObjCFOP.codigo;
        cxNatureza.EditValue    := ObjCFOP.natureza;
        cxcfop.EditValue        := ObjCFOP.cfop;
        cxoperacao.EditValue    := ObjCFOP.operacao;
        cxtipo.EditValue        := ObjCFOP.tipo;
        cxativo.EditValue       := ObjCFOP.ativo;

        cxnatureza.SetFocus;
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
    ObjCFOP.Free;
    CFOPContr.Free;
  End;

end;

function TFrmCadCFOP.Salvar(out msg: string): Boolean;
var
AId:Integer;
begin
  Result    := False;

  CFOPContr := nil;
  ObjCFOP   := nil;

  CFOPContr := TCFOPController.Create;
  ObjCFOP   := TCFOP.Create;

  Try
    if ParamsStr='N' then
    ObjCFOP.id_cfop       := 0
    else
    ObjCFOP.id_cfop       := ParamsInt;
    ObjCFOP.cfop          := cxcfop.EditValue;
    ObjCFOP.natureza      := Trim(cxNatureza.Text);
    ObjCFOP.operacao      := cxOperacao.EditValue;
    ObjCFOP.tipo          := cxTipo.EditValue;
    ObjCFOP.ativo         := cxativo.EditValue;
    ObjCFOP.excluido      := 0;
    ObjCFOP.id_empresa    := TSession.idempresa;
    ObjCFOP.id_usuario    := TSession.id_usuario;
    ObjCFOP.data_criacao  := Now;

    if ParamsStr='E' then
    ObjCFOP.id_usuario_alt:=TSession.id_usuario;

    Try
      if CFOPContr.Salvar(ObjCFOP, AId) then
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
    FreeAndNil(CFOPContr);
    FreeAndNil(ObjCFOP);
  End;
end;

function TFrmCadCFOP.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if cxNatureza.text='' then
  begin
    msg     := 'Informe a descrição da natureza!';
    Result  := False;
    exit;
  end;

  if (cxCFOP.Text='')  or (Length(cxCFOP.Text) < 4 ) then
  begin
    msg     := 'Informe um CFOP valído!';
    Result  := False;
    exit;
  end;

  if (cxOperacao.ItemIndex =-1) or (cxOperacao.Text='') then
  begin
    msg     := 'Selecione uma operação para a natureza!';
    Result  := False;
    exit;
  end;

  if (cxTipo.ItemIndex =-1) or (cxTipo.Text='') then
  begin
    msg     := 'Selecione uma tipo para a natureza!';
    Result  := False;
    exit;
  end;


end;

end.
