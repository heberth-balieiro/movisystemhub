unit UnitCadAutorizacao;

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
  cxGroupBox, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxMaskEdit, cxDropDownEdit, cxCalendar, cxBlobEdit,
  UnitBaseNovoCadastro, Vcl.ButtonStylesAttributes, Data.DB, DBAccess, Uni,
  Vcl.StyledButton, dxBevel, cxSpinEdit,Controller.Autorizacao,Model.Autorizacao,
  uJKDialog, cxStyles, cxGridTableView, cxClasses;

type
  TFrmCadAutorizacao = class(TFormNovoBaseCadastro)
    Label1: TLabel;
    Label3: TLabel;
    cxNome: TcxTextEdit;
    cxdata: TcxDateEdit;
    cxAutorizou: TcxTextEdit;
    cxQtde: TcxSpinEdit;
    Label2: TLabel;
    cxObs: TcxBlobEdit;
    Label4: TLabel;
    Label5: TLabel;
    cxSincronizar: TcxCheckBox;
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
  FrmCadAutorizacao: TFrmCadAutorizacao;
  ContAut       : TAutorizacaoController;
  ObjAut        : TModelautorizacao;

implementation

{$R *.dfm}

uses Vcl.Navigation, Vcl.Session, uConfiguracaoService;

{ TFrmCadAutorizacao }

procedure TFrmCadAutorizacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmCadAutorizacao := nil;
end;

procedure TFrmCadAutorizacao.FormShow(Sender: TObject);
begin
  inherited;

  try
    if ParamsStr = 'N' then
    begin
      TitleText   := ' Nova Autorização';
      cxdata.EditValue  := now();
      cxdata.SetFocus;
    end
    else
    begin
      PopularCampos;
      TitleText   := ' Editar Autorização';
      cxData.SetFocus;
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmCadAutorizacao.PopularCampos;
begin
  inherited;
  try
    ObjAut        := Nil;
    ContAut       := Nil;

    ContAut       := TAutorizacaoController.Create;
    ObjAut        := TModelautorizacao.Create;

    Try
      ObjAut      := ContAut.BuscarPorID(ParamsInt);
      if Assigned(ObjAut) then
      begin
        cxdata.EditValue            := ObjAut.data;
        cxnome.EditValue            := ObjAut.nome;
        cxqtde.EditValue            := ObjAut.qtdepessoa;
        cxAutorizou.EditValue       := ObjAut.pessoaautorizou;
        cxobs.EditValue             := ObjAut.obs;
        cxSincronizar.EditValue     := ObjAut.enviarapp;

        cxData.SetFocus;
      end
      else
      begin
        JKDialog('Aviso','Não foi possivel carregar os dados.', tdAlerta);
        exit;
      end;

    Finally
      ObjAut.Free;
      ContAut.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmCadAutorizacao.Salvar(out msg: string): Boolean;
var
AId:Integer;
begin
  Result        := False;
  ContAut       := Nil;
  ObjAut        := Nil;

  try
    ContAut     := TAutorizacaoController.Create;
    ObjAut      := TModelautorizacao.Create;

    Try
      if ParamsStr='N' then
      ObjAut.id_autorizacao     := 0
      else
      ObjAut.id_autorizacao     := ParamsInt;

      ObjAut.data               := cxdata.EditValue;
      ObjAut.nome               := Trim(cxnome.Text);
      ObjAut.qtdepessoa         := cxqtde.EditValue;
      ObjAut.obs                := Trim(cxobs.Text);
      ObjAut.pessoaautorizou    := Trim(cxAutorizou.Text);
      ObjAut.idusuario          := Tsession.ID_USUARIO;
      ObjAut.enviarapp          := cxSincronizar.EditValue;
      if cxSincronizar.Checked= true then
      ObjAut.sinc_app           := 'S'
      else
      ObjAut.sinc_app           := 'N';

      if ContAut.Salvar(ObjAut, AId) then
      begin
        if AID = 0 then
        AID     := ParamsInt;
        msg     := 'Registro salvo com sucesso, ID: '+IntToStr(AId);
         if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
          begin
            try
              TConfiguracaoService.SincronizarGravar(16, AId);
            except on e:exception do
              begin
                msg   := e.Message;
                raise;
              end;
            end;
          end;
        Result  := true;
        ParamsCloseTela := 'S';
      end;

    Finally
      FreeAndNil(ContAut);
      FreeAndNil(ObjAut);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmCadAutorizacao.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if (cxnome.Text='') or (cxnome.EditValue = null) then
  begin
    msg     := 'Informe um nome!';
    Result  := False;
    Exit;
  end;

  if (cxQtde.EditValue=0) then
  begin
    msg     := 'Informe a quantidade autorizada!';
    Result  := False;
    Exit;
  end;

  if (cxAutorizou.Text='') then
  begin
    msg     := 'Informe o nome da pessoa que autorizou!';
    Result  := False;
    Exit;
  end;

end;

end.




