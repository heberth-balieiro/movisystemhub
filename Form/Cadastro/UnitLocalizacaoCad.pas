unit UnitLocalizacaoCad;

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
  Uni, dxBevel, Vcl.ButtonStylesAttributes, Vcl.StyledButton,model.Localizacao, Controller.Localizacao;

type
  TFrmLocalizacaoCad = class(TFormNovoBaseCadastro)
    cxDescricao: TcxTextEdit;
    Label3: TLabel;
    cxCodigo: TcxTextEdit;
    cxAtivo: TcxCheckBox;
    Label2: TLabel;
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
  FrmLocalizacaoCad: TFrmLocalizacaoCad;
  ObjLoc        : TModelLocalizacao;
  ConLoc        : TLocalizacaoController;

implementation

{$R *.dfm}

Uses Udm, Vcl.Session, uJKDialog;

procedure TFrmLocalizacaoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmLocalizacaoCad := Nil;
end;

procedure TFrmLocalizacaoCad.FormShow(Sender: TObject);
begin
  inherited;
  try
    if ParamsStr = 'N' then
    begin
      TitleText   := ' Nova Localização';
      cxdescricao.SetFocus;
    end
    else
    begin
      PopularCampos;
      TitleText   := ' Editar Localização';
      cxDescricao.SetFocus;
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmLocalizacaoCad.PopularCampos;
begin
  inherited;
  ConLoc      := Nil;
  ObjLoc      := Nil;
  try
    ConLoc    := TLocalizacaoController.Create;
    ObjLoc    := TModelLocalizacao.Create;

    Try
      if (ParamsInt=0) or (InttoStr(ParamsInt) = '') then
      raise Exception.Create('Nenhum ID passado no parâmetro.');

      ObjLoc    := ConLoc.BuscarPorID(ParamsInt);
      if Assigned(ObjLoc) then
      begin
        cxCodigo.EditValue      := ObjLoc.codigo;
        cxDescricao.EditValue   := ObjLoc.localizacao;
        cxAtivo.EditValue       := ObjLoc.ativo;
      end;
    Finally
      FreeAndNil(ConLoc);
      FreeAndNil(ObjLoc);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmLocalizacaoCad.Salvar(out msg: string): Boolean;
var
AId:Integer;
begin
  try
    Result      := False;
    ConLoc      := Nil;
    ObjLoc      := Nil;

    ConLoc      := TLocalizacaoController.Create;
    ObjLoc      := TModelLocalizacao.Create;

    Try
      if ParamsStr='N' then
      ObjLoc.id_localizacao     := 0
      else
      ObjLoc.id_localizacao     := ParamsInt;
      ObjLoc.localizacao        := Trim(cxdescricao.Text);
      ObjLoc.ativo              := cxativo.EditValue;
      ObjLoc.excluido           := 0;
      ObjLoc.id_empresa         := Tsession.IDEMPRESA;
      ObjLoc.id_usuario         := TSession.ID_USUARIO;

      if ParamsStr='E' then
      begin
        ObjLoc.data_alteracao   := now();
        ObjLoc.id_usuario_alt   := TSession.ID_USUARIO;
      end;

      if ConLoc.Salvar(ObjLoc, AId) then
      begin
        if AID = 0 then
        AID     := ParamsInt;
        msg     := 'Registro salvo com sucesso, Código: '+IntToStr(AId);
        Result  := true;
        ParamsCloseTela := 'S';
      end;

    Finally
      FreeAndNil(ConLoc);
      FreeAndNil(ObjLoc);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmLocalizacaoCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;
  if cxdescricao.Text='' then
  begin
    msg     := 'Informe uma descrição!';
    Result  := False;
    Exit;
  end;
end;

end.

