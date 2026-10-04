{

Tamanhos de telas

Padrão Grande    H600 x W650
Padrão Pequeno   H350 x W650 - Botões Salvar Top 235 Left 413 Botões cancelar top 235 left 531

}



unit UnitBaseNovoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormNovoBase, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.ExtCtrls, dxBevel, ACBrBase, ACBrEnterTab, Data.DB,
  DBAccess, Uni, Vcl.ButtonStylesAttributes, Vcl.StyledButton, cxStyles,
  cxGridTableView, cxClasses;

type
  TFormNovoBaseCadastro = class(TFormNovoBase)
    dxBevel1: TdxBevel;
    BtnSalvar: TStyledBitBtn;
    BtnCancelar: TStyledBitBtn;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    msg:string;
    Class var ParamsStr       :String;
    Class var ParamsInt       :Integer;
    Class var ParamsTela      :String;
    Class var ParamsCloseTela :String;
    Class var ParamsMsgTela   :String;

    function Salvar(out msg: string): Boolean; virtual; abstract;
    function ValidarCampos(out msg: string): Boolean; virtual; abstract;
    procedure PopularCampos; virtual; abstract;

    { Public declarations }
  end;

var
  FormNovoBaseCadastro: TFormNovoBaseCadastro;

implementation

{$R *.dfm}

uses uJKDialog;

procedure TFormNovoBaseCadastro.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFormNovoBaseCadastro.btnSalvarClick(Sender: TObject);
begin
  inherited;
  if ValidarCampos(msg) then
  begin
    Try
       if Salvar(msg) then
        begin
          if (ParamsMsgTela = 'S') or (ParamsMsgTela = '') then          
          JKDialog('Sucesso',msg, tdSucesso);
          if ParamsCloseTela = 'S' then
          Close;
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

procedure TFormNovoBaseCadastro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
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

end.
