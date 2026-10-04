unit UnitValidador;

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
  cxBlobEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxGroupBox;

type
  TFrmValidador = class(TForm)
    lblTitulo: TLabel;
    Paneltitulo: TPanel;
    cxGroupBox1: TcxGroupBox;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    Label2: TLabel;
    edtChave: TcxTextEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalvarClick(Sender: TObject);
  private
    procedure OpenCadTela(id: integer; str: string);
    procedure ValidarNovaCampanha;
    procedure Publicarcampanha;
    procedure Despublicarcampanha;
    procedure ValidarEditarCampanha;
    procedure ResultadoCampanha;
    procedure EncerrarCampanha;
   // function ConfiguracaoCampanha: Boolean;
    //procedure InserirCandidato(desc:string);
    { Private declarations }
  public
    Acao:String;
    idCampanha:Integer;
    { Public declarations }
  end;

var
  FrmValidador: TFrmValidador;

implementation

{$R *.dfm}

uses uJKDialog, Model.Membro, UnitCampanhaCad, Model.Campanha, Model.Candidato,
  Vcl.Session, UnitResultado;

procedure TFrmValidador.OpenCadTela(id: integer;str:string);
begin
  TNavigation.ParamInt          := id;
  TNavigation.ParamsStr         := str;
  TNavigation.OpenModal(TFrmCampanhaCad, FrmCampanhaCad);
end;

procedure TFrmValidador.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmValidador.btnSalvarClick(Sender: TObject);

begin
  if edtChave.Text = '' then
  begin
    JKDialog('Aviso','Informe a chave de segurança enviada via whatsapp', tdAlerta);
    exit;
  end;

  if acao = 'N' then
  begin
    ValidarNovaCampanha;
  end;

  if acao = 'P' then
  begin
    Publicarcampanha;
  end;

  if acao = 'D' then
  begin
    Despublicarcampanha;
  end;

  if acao = 'E' then
  begin
    ValidarEditarCampanha;
  end;

  if acao = 'R' then
  begin
    ResultadoCampanha;
  end;

  if acao = 'F' then
  begin
    EncerrarCampanha;
  end;

end;

Procedure TFrmValidador.ValidarNovaCampanha;
var
Membro:TModelMembro;
msg:string;
begin
Try
    Membro        := TModelMembro.Create;

    if membro.ValidarAcessoKey(msg,Trim(edtchave.Text)) then
    begin
      //se a chave for verdadeira
      Try
        TNavigation.ParamInt          := 0;
        TNavigation.ParamsStr         := 'N';
        TNavigation.ParamsKey         := Trim(edtchave.Text);
        TNavigation.OpenModal(TFrmCampanhaCad, FrmCampanhaCad);

      Finally
        FrmValidador.Close;
      End;
    end
    else
    begin
      JKDialog('Aviso','Verifique a chave digitada!', tdAlerta);
      exit;
    end;

  Finally
    //membro.Free;
  End;
end;

Procedure TFrmValidador.Publicarcampanha;
var
Model : TModelCampanha;
msg   : String;
begin
  Try
    Model := TModelCampanha.Create;
    Model.chaveKey    := edtchave.Text;
    model.idCampanha  := idcampanha;

    if Model.PublicarCampanha(msg) then
    begin
      //ConfiguracaoCampanha;
      JKDialog('Sucesso','Campanha publicada!', tdSucesso);
      FrmValidador.Close;
    end;

  Finally
    //Model.Free;
  End;
end;

Procedure TFrmValidador.Despublicarcampanha;
var
Model : TModelCampanha;
msg   : String;
begin
  Try
    Model := TModelCampanha.Create;
    Model.chaveKey    := edtchave.Text;
    model.idCampanha  := idcampanha;

    if Model.DespublicarCampanha(msg) then
    begin
      JKDialog('Sucesso','Campanha despublicada!', tdSucesso);
      FrmValidador.Close;
    end;

  Finally
    //Model.Free;
  End;
end;

Procedure TFrmValidador.ValidarEditarCampanha;
begin
  try

    TNavigation.ParamInt          := idcampanha;
    TNavigation.ParamsStr         := 'E';
    TNavigation.ParamsKey         := Trim(edtchave.Text);
    TNavigation.OpenModal(TFrmCampanhaCad, FrmCampanhaCad);

  finally
    FrmValidador.Close;
  end;
end;

Procedure TFrmValidador.ResultadoCampanha;
begin
  Try
    TNavigation.ParamInt          := idCampanha;
    TNavigation.ParamsStr         := '';
    TNavigation.OpenModal(TFrmResultado, FrmResultado);
  Finally
    FrmValidador.Close;
  End;
end;

Procedure TFrmValidador.EncerrarCampanha;
var
Model : TModelCampanha;
msg   : String;
begin
  Try
    Model := TModelCampanha.Create;
    Model.chaveKey    := edtchave.Text;
    model.idCampanha  := idcampanha;

    if Model.EncerrarCampanha(msg) then
    begin
      //ConfiguracaoCampanha;
      JKDialog('Sucesso','Campanha encerrada!', tdSucesso);
      FrmValidador.Close;
    end;

  Finally
    //Model.Free;
  End;
end;

procedure TFrmValidador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    FrmValidador := nil;
end;


end.
