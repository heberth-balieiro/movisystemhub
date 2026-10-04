unit UnitSubGrupoCad;

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
  cxGroupBox, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Data.DB,
   Model.SubGrupoPlano;

type
  TFrmSubgrupoCad = class(TFrmBaseCad)
    EdtTipo: TcxLookupComboBox;
    Label2: TLabel;
    dsGrupo: TDataSource;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    Procedure PopularGrupo;
    procedure CarregarDados; override;
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    { Public declarations }
  end;

var
  FrmSubgrupoCad: TFrmSubgrupoCad;
  Model         : TModelSubGrupoPlano;
implementation

{$R *.dfm}

uses UDM, Vcl.Navigation;

{ TFrmSubgrupoCad }

procedure TFrmSubgrupoCad.CarregarDados;
var
msg:string;
begin
  inherited;
  Model             := TModelSubGrupoPlano.Create;
  Try
    try
      if Model.LocalizarID(msg, TNavigation.ParamInt) then
      begin

        edtcodigo.EditValue     := Model.codigo;
        edtdescricao.EditValue  := Model.descricao;
        edtativo.EditValue      := Model.ativo;
        edtTipo.EditValue       := Model.idgrupo;
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

procedure TFrmSubgrupoCad.FormShow(Sender: TObject);
begin
  inherited;

  PopularGrupo;

  if TNavigation.ParamsStr = 'V' then
  begin
    lblTitulo.Caption := 'Visualizando Sub-Grupo de Plano de Conta';
    CarregarDados;
    cxGroupBox1.Enabled := False;
    btnSalvar.Enabled := false;
  end
  else if TNavigation.ParamsStr = 'E' then
  begin
    lblTitulo.Caption := 'Editando Sub-Grupo de Plano de Plano';
    CarregarDados;
    edtdescricao.SetFocus;
  end
  else if TNavigation.ParamsStr = 'N' then
  begin
    edtdescricao.SetFocus;
    edtativo.Checked := True;
  end;
end;

procedure TFrmSubgrupoCad.PopularGrupo;
begin
  //dm.PopularGrupoPlano;
end;

function TFrmSubgrupoCad.Salvar(out msg: string): Boolean;
begin
  Result  := False;
  Model             :=  TModelSubGrupoPlano.Create;
  Try
    try
      Model.Descricao   := Trim(edtdescricao.Text);
      Model.ativo       := edtativo.EditValue;
      Model.idgrupo     := edttipo.EditValue;

      if TNavigation.ParamsStr='N' then
      begin
        if Model.Novo(msg) then;
        Result  := True;
      end
      else
      begin
        Model.idsubgrupo  := TNavigation.ParamInt;
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

function TFrmSubgrupoCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if (edtdescricao.Text ='') or (Length(edtdescricao.Text) < 3) then
  begin
    msg     := 'Informe a descrição do Sub-grupo acima de 3 caracteres!';
    Result  := False;
    Exit;
  end;
end;

end.
