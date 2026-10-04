unit UnitCentroCustoCad;

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
  cxGroupBox, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,Model.Custo;

type
  TFrmCustoCad = class(TFrmBaseCad)
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    procedure CarregarDados; override;
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;

    { Public declarations }
  end;

var
  FrmCustoCad: TFrmCustoCad;
  ModelCusto  :TModelCusto;

implementation

{$R *.dfm}

uses udm, Vcl.Navigation, uJKDialog;

{ TFrmCustoCad }

procedure TFrmCustoCad.CarregarDados;
begin
  inherited;

end;

procedure TFrmCustoCad.FormShow(Sender: TObject);
begin
  inherited;
  if TNavigation.ParamsStr = 'V' then
  begin
    lblTitulo.Caption := 'Visualizando Centro de Custo';
    CarregarDados;
    cxGroupBox1.Enabled := False;
    btnSalvar.Enabled   := false;
  end
  else if TNavigation.ParamsStr = 'E' then
  begin
    lblTitulo.Caption := 'Editando Centro de Custo';
    CarregarDados;
    edtdescricao.SetFocus;
  end
  else if TNavigation.ParamsStr = 'N' then
  begin
    lblTitulo.Caption := 'Novo Centro de Custo';
    edtdescricao.SetFocus;
  end;
end;

Function TFrmCustoCad.Salvar(out msg: string): Boolean;
begin
  Result  := False;
  ModelCusto             := TModelCusto.Create;

  Try
    try
      //Popular os campo para salvar

      ModelCusto.Descricao    := Trim(edtdescricao.Text);
      ModelCusto.Ativo        := edtativo.EditValue;

      if TNavigation.ParamsStr='N' then
      begin
        if ModelCusto.Novo(msg) then;
        Result  := True;
      end
      else
      begin
        ModelCusto.idcusto  := TNavigation.ParamInt;
        if ModelCusto.editar(msg) then;
        Result  := True;
      end;

    Except on e:exception do
      begin
        msg := msg+' :'+e.Message;
        raise;
      end;
    end;

  Finally
    ModelCusto.Free;
  End;
end;

function TFrmCustoCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if (edtdescricao.Text ='') then
  begin
    msg     := 'Informe um centro de custo!';
    Result  := False;
    Exit;
  end;

end;

end.
