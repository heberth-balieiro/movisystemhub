unit UnitContaCad;

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
  cxGroupBox, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,Model.Contas,
  cxCurrencyEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxMaskEdit, cxDropDownEdit,
  cxCalendar, UnitBaseNovoCadastro, Data.DB, DBAccess, dxBevel, Uni, Controller.ContaBancaria,
  Model.ContasBancaria, Vcl.ButtonStylesAttributes, Vcl.StyledButton, cxStyles,
  cxGridTableView, cxClasses, UConeSul;

type
  TFrmContasCad = class(TFormNovoBaseCadastro)
    Label7: TLabel;
    cxCodigo: TcxTextEdit;
    Label8: TLabel;
    cxCorrentista: TcxTextEdit;
    Label9: TLabel;
    cxBanco: TcxTextEdit;
    Label10: TLabel;
    cxAgencia: TcxTextEdit;
    cxConta: TcxTextEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    cxdatasaldo: TcxDateEdit;
    cxSaldo: TcxCurrencyEdit;
    cxAtivo: TcxCheckBox;
    procedure FormShow(Sender: TObject);
    procedure cxAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure cxContaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;
    { Public declarations }
  end;

var
  FrmContasCad: TFrmContasCad;
  ObjContas   : TContas;
  ContContas  : TContaController;
implementation

{$R *.dfm}

uses Vcl.Session, uJKDialog;

{ TFrmContasCad }

procedure TFrmContasCad.PopularCampos;
begin
  inherited;
  ObjContas     := nil;
  ContContas    := nil;


  ObjContas     := TContas.Create;
  ContContas    := TContaController.Create;
  Try
    try

      ObjContas := ContContas.BuscarPorID(ParamsInt);

      if Assigned(ObjContas) then
      begin
        cxCodigo.EditValue        := ObjContas.Codigo;
        cxBanco.EditValue         := ObjContas.banco;
        cxAgencia.EditValue       := ObjContas.agencia;
        cxConta.EditValue         := ObjContas.conta;
        cxCorrentista.EditValue   := ObjContas.correntista;
        cxSaldo.EditValue         := ObjContas.saldo;
        cxDataSaldo.EditValue     := Tconesul.ValidarDataNull(ObjContas.datasaldo);
        cxAtivo.EditValue         := ObjContas.ativo;

        cxBanco.SetFocus;
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
    ObjContas.Free;
    ContContas.Free;
  End;
end;

procedure TFrmContasCad.cxAgenciaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0'..'9', #8, ^V, ^C, ^X]) then
        Key := #0;
end;

procedure TFrmContasCad.cxContaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not CharInSet(Key, ['0'..'9', #8, ^V, ^C, ^X]) then
        Key := #0;
end;

procedure TFrmContasCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmContasCad  := nil;
end;

procedure TFrmContasCad.FormShow(Sender: TObject);
begin
  inherited;

  if ParamsStr = 'N' then
  begin
    TitleText         := 'Nova Conta';
    cxsaldo.EditValue := 0;
    cxativo.Checked   := true;
    cxBanco.SetFocus;
  end
  else
  begin
    TitleText   := 'Editar Conta';
    PopularCampos;
  end;

end;

function TFrmContasCad.Salvar(out msg: string): Boolean;
var
AId:Integer;
begin
  Result    := False;

  ObjContas := nil;
  ContContas:= nil;

  ContContas:= TContaController.Create;
  ObjContas := TContas.Create;

  Try
    if ParamsStr='N' then
    ObjContas.id_conta       := 0
    else
    ObjContas.id_conta       := ParamsInt;
    ObjContas.banco           := Trim(Cxbanco.Text);
    ObjContas.agencia         := trim(cxAgencia.Text);
    ObjContas.conta           := Trim(cxconta.Text);
    ObjContas.correntista     := Trim(cxcorrentista.Text);
    ObjContas.saldo           := cxsaldo.EditValue;
    if cxdatasaldo.EditValue = Null then
      ObjContas.datasaldo     := Nulldate
    else
    ObjContas.datasaldo       := cxdatasaldo.Date;
    ObjContas.datacriacao     := now;
    ObjContas.id_empresa      := Tsession.IDEMPRESA;
    ObjContas.id_usuario      := Tsession.ID_USUARIO;
    ObjContas.ativo           := cxAtivo.EditValue;
    ObjContas.excluido        := 0;

    if ParamsStr='E' then
    ObjContas.id_usuario_alt  := TSession.id_usuario;

    Try
      if ContContas.Salvar(ObjContas, AId) then
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
    FreeAndNil(ObjContas);
    FreeAndNil(ContContas);
  End;
end;

function TFrmContasCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if cxBanco.text='' then
  begin
    msg     := 'Informe o nome do banco!';
    Result  := False;
    exit;
  end;

  if (cxagencia.Text='')  or (Length(cxagencia.Text) < 3 ) then
  begin
    msg     := 'Informe uma agência!';
    Result  := False;
    exit;
  end;

  if (cxconta.Text='') then
  begin
    msg     := 'Informe uma conta!';
    Result  := False;
    exit;
  end;

  if (cxCorrentista.Text='') then
  begin
    msg     := 'Informe o nome do correntista!';
    Result  := False;
    exit;
  end;

end;

end.
