unit UnitGrupoPlanoCad;

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
  cxGroupBox, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Model.GrupoPlano,
  Vcl.Navigation, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, UDM, Data.DB;

type
  TFrmGrupoPlanoCad = class(TFrmBaseCad)
    EdtTipo: TcxLookupComboBox;
    Label2: TLabel;
    dstipo: TDataSource;
    procedure FormShow(Sender: TObject);
  private
    Procedure PopularTipo;
    procedure CarregarDados; override;
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmGrupoPlanoCad: TFrmGrupoPlanoCad;
  Model           : TModelGrupoplano;
implementation

{$R *.dfm}

{ TFrmGrupoPlanoCad }

procedure TFrmGrupoPlanoCad.CarregarDados;
var
msg:string;
begin
  inherited;
  Model             := TModelGrupoplano.Create;
  Try
    try
      if Model.LocalizarID(msg, TNavigation.ParamInt) then
      begin

        edtcodigo.EditValue     := Model.codigo;
        edtdescricao.EditValue  := Model.descricao;
        edtativo.EditValue      := Model.ativo;
        edtTipo.EditValue       := Model.idtipoplano;
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

procedure TFrmGrupoPlanoCad.FormShow(Sender: TObject);
begin
  inherited;
  // Lógica específica para o formulário

  PopularTipo;

  if TNavigation.ParamsStr = 'V' then
  begin
    lblTitulo.Caption := 'Visualizando Grupo de Plano de Conta';
    CarregarDados;
    cxGroupBox1.Enabled := False;
    btnSalvar.Enabled := false;
  end
  else if TNavigation.ParamsStr = 'E' then
  begin
    lblTitulo.Caption := 'Editando Grupo de Plano de Plano';
    CarregarDados;
    edtdescricao.SetFocus;
  end
  else if TNavigation.ParamsStr = 'N' then
  begin
    edtdescricao.SetFocus;
    edtativo.Checked := True;
  end;
end;

procedure TFrmGrupoPlanoCad.PopularTipo;
var
msg:string;
begin
  //dm.PopularTipoPlano(msg);
end;

function TFrmGrupoPlanoCad.Salvar(out msg: string): Boolean;
begin
  Result  := False;
  Model             :=  TModelGrupoPlano.Create;
  Try
    try
      Model.Descricao   := Trim(edtdescricao.Text);
      Model.ativo       := edtativo.EditValue;
      Model.idtipoplano := edttipo.EditValue;

      if TNavigation.ParamsStr='N' then
      begin
        if Model.Novo(msg) then;
        Result  := True;
      end
      else
      begin
        Model.idgrupoplano  := TNavigation.ParamInt;
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

function TFrmGrupoPlanoCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if (edtdescricao.Text ='') or (Length(edtdescricao.Text) < 3) then
  begin
    msg     := 'Informe a descrição do grupo acima de 3 caracteres!';
    Result  := False;
    Exit;
  end;

end;

end.
