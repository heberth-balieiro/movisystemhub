unit UnitEleicaoConfiguracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseNovoCadastro,
  Vcl.ButtonStylesAttributes, cxStyles, cxGridTableView, cxClasses, Data.DB,
  DBAccess, Uni, ACBrBase, ACBrEnterTab, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.StyledButton, dxBevel, Vcl.ExtCtrls, cxGraphics, cxControls,
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
  dxSkinXmas2008Blue, cxTextEdit, cxCheckBox, cxMaskEdit, cxDropDownEdit,
  uJKDialog, Model.EleicaoConfig, Controller.EleicaoConfig, Vcl.Session,
  cxGroupBox, dxCore, dxColorEdit, cxBlobEdit, ACBrUtil, UConeSul,
  uConfiguracaoService, Vcl.ComCtrls, cxDateUtils, cxCalendar, Controller.Eleicao,
  cxSpinEdit, cxCurrencyEdit;

type
  TFrmEleicaoConfiguracao = class(TFormNovoBaseCadastro)
    cxexigehomologacao: TcxCheckBox;
    cxpublicacaoautomatica: TcxCheckBox;
    cxexigeativo: TcxCheckBox;
    cxexigeadimplente: TcxCheckBox;
    cxexigetempo: TcxCheckBox;
    cxbloqueiapendencia: TcxCheckBox;
    cxbloqueiasuspenso: TcxCheckBox;
    cxgeraraptos: TcxCheckBox;
    cxmeses: TcxTextEdit;
    Label2: TLabel;
    cxLogo: TcxGroupBox;
    edtlogo: TImage;
    cxGroupBox4: TcxGroupBox;
    cxbanner: TImage;
    Label12: TLabel;
    Label13: TLabel;
    cxDatainicio: TcxDateEdit;
    cxDatafim: TcxDateEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label22: TLabel;
    cxslug: TcxTextEdit;
    Label14: TLabel;
    cxExibicao: TcxTextEdit;
    Label1: TLabel;
    cxUrl: TcxTextEdit;
    cxPublicar: TcxCheckBox;
    Label6: TLabel;
    cxEmail: TcxTextEdit;
    Label10: TLabel;
    cxtelefone: TcxMaskEdit;
    Label5: TLabel;
    cxobs: TcxBlobEdit;
    Label11: TLabel;
    cxPrimaria: TdxColorEdit;
    Label9: TLabel;
    cxSecundaria: TdxColorEdit;
    Label3: TLabel;
    cxInstagram: TcxTextEdit;
    Label8: TLabel;
    cxFacebok: TcxTextEdit;
    Label7: TLabel;
    cxyoutube: TcxTextEdit;
    cxAberturaautomatica: TcxCheckBox;
    cxEncerramento: TcxCheckBox;
    cxVotosecreto: TcxCheckBox;
    cxresultadoparcial: TcxCheckBox;
    cxcontrolaquorum: TcxCheckBox;
    cxtipoquorum: TcxComboBox;
    Label4: TLabel;
    Label17: TLabel;
    cxquorumminimo: TcxSpinEdit;
    cxquorumpercentual: TcxCurrencyEdit;
    Label18: TLabel;
    cxquorumbase: TcxComboBox;
    cxControlapresenca: TcxCheckBox;
    cxExigePresenca: TcxCheckBox;
    Label19: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Label13DblClick(Sender: TObject);
    procedure Label12DblClick(Sender: TObject);
    procedure cxslugExit(Sender: TObject);
  private
    function ColorToHex(AColor: TColor): string;
    function HexToColor(const AHex: string): TColor;
    { Private declarations }
  public
    AIDEleicao:Integer;
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;
    { Public declarations }
  end;

var
  FrmEleicaoConfiguracao: TFrmEleicaoConfiguracao;
  ObjConfig :TModelEleicaoConfig;
implementation

{$R *.dfm}

function TFrmEleicaoConfiguracao.ColorToHex(AColor: TColor): string;
var
  C: Longint;
begin
  C := ColorToRGB(AColor);
  Result := Format('#%.2x%.2x%.2x', [
    GetRValue(C),
    GetGValue(C),
    GetBValue(C)
  ]);
end;

function TFrmEleicaoConfiguracao.HexToColor(const AHex: string): TColor;
var
  Hex: string;
  R, G, B: Integer;
begin
  Hex := StringReplace(AHex, '#', '', []);
  R := StrToInt('$' + Copy(Hex, 1, 2));
  G := StrToInt('$' + Copy(Hex, 3, 2));
  B := StrToInt('$' + Copy(Hex, 5, 2));
  Result := RGB(R, G, B);
end;

procedure TFrmEleicaoConfiguracao.Label12DblClick(Sender: TObject);
var
  OpenDialog: TOpenDialog;
begin
  // Cria um objeto TOpenDialog
  OpenDialog := TOpenDialog.Create(nil);
  try
    // Configurações do diálogo
    OpenDialog.Filter := 'Imagens JPEG|*.jpg;*.jpeg|Imagens PNG|*.png;*.png';
    OpenDialog.Title := 'Selecione um banner';

    // Exibe o diálogo e verifica se o usuário selecionou um arquivo
    if OpenDialog.Execute then
    begin
      cxbanner.Picture.LoadFromFile(OpenDialog.FileName)

    end;
  finally
   OpenDialog.Free;
  end;
end;

procedure TFrmEleicaoConfiguracao.Label13DblClick(Sender: TObject);
var
  OpenDialog: TOpenDialog;
begin
  // Cria um objeto TOpenDialog
  OpenDialog := TOpenDialog.Create(nil);
  try
    // Configurações do diálogo
    OpenDialog.Filter := 'Imagens JPEG|*.jpg;*.jpeg|Imagens PNG|*.png;*.png';
    OpenDialog.Title := 'Selecione uma foto';

    // Exibe o diálogo e verifica se o usuário selecionou um arquivo
    if OpenDialog.Execute then
    begin
      edtlogo.Picture.LoadFromFile(OpenDialog.FileName)

    end;
  finally
   OpenDialog.Free;
  end;
end;

procedure TFrmEleicaoConfiguracao.cxslugExit(Sender: TObject);
begin
  inherited;
  if cxslug.Text<> '' then
  cxurl.Text    := 'https://votacao.conesulsistemas.com.br/'+Trim(UpperCase(cxslug.Text));
end;

procedure TFrmEleicaoConfiguracao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmEleicaoConfiguracao  := nil;
end;

procedure TFrmEleicaoConfiguracao.FormShow(Sender: TObject);
begin
  inherited;
  try

    if not TConfiguracaoService.ValidarEmpresaAtivaWeb(TSession.IDEMPRESA) then
    begin
      cxPublicar.Enabled  := False;
    end;


    if ParamsStr = 'N' then
    begin
      TitleText         := ' Eleição/Assembleia Configuração';
      cxDatainicio.Date := now;
      cxDatafim.Date    := now;
    end
    else
    begin
      TitleText   := ' Eleição/Assembleia Configuração';
      PopularCampos;
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmEleicaoConfiguracao.PopularCampos;
begin
  inherited;
  ObjConfig     := Nil;

  try
    ObjConfig     := TModelEleicaoConfig.Create;

    Try
      ObjConfig    := TEleicaoConfigController.BuscarPorIDEleicao(ParamsInt);

      if Assigned(ObjConfig) then
      begin
        ParamsInt                       := ObjConfig.IdConfig;
        AIDEleicao                      := ObjConfig.IdEleicao;
        //cxSituacao.Text                 := ObjConfig.SituacaoInicial;
        cxexigehomologacao.EditValue    := ObjConfig.ExigeHomologacaoFinal;
        cxpublicacaoautomatica.EditValue:= ObjConfig.PublicacaoAutomatica;
        cxexigeativo.EditValue          := ObjConfig.ExigeAssociadoAtivo;
        cxexigeadimplente.EditValue     := ObjConfig.ExigeAssociadoAdimplente;
        cxexigetempo.EditValue          := ObjConfig.exige_tempo_minimo;
        cxmeses.EditValue               := ObjConfig.TempoMinimoFiliacao;
        cxbloqueiapendencia.EditValue   := ObjConfig.BloqueiaPendenciaFinanceira;
        cxbloqueiasuspenso.EditValue    := ObjConfig.BloqueiaAssociadoSuspenso;
        cxgeraraptos.EditValue          := ObjConfig.gerar_eleitores_aptos;

        cxslug.EditValue                := ObjConfig.Slug;
        cxExibicao.EditValue            := ObjConfig.NomeExibicao;
        cxobs.EditValue                 := ObjConfig.MensagemBoasVindas;
        cxUrl.EditValue                 := ObjConfig.UrlPublica;
        cxEmail.EditValue               := ObjConfig.Email;
        cxtelefone.EditValue            := ObjConfig.Telefone;
        if ObjConfig.CorPrimaria <> '' then
        cxPrimaria.ColorValue           := HexToColor(ObjConfig.CorPrimaria);
        if ObjConfig.CorSecundaria <> '' then        
        cxSecundaria.ColorValue         := HexToColor(ObjConfig.CorSecundaria);
        cxInstagram.EditValue           := ObjConfig.UrlInstagram;
        cxFacebok.EditValue             := ObjConfig.UrlFacebook;
        cxyoutube.EditValue             := ObjConfig.UrlYoutube;
        cxPublicar.EditValue            := ObjConfig.pagina_publicar;

        cxdatainicio.EditValue          := ObjConfig.data_hora_inicio;
        cxdatafim.EditValue             := ObjConfig.data_hora_fim;

        if ObjConfig.Logo <> '' then
        begin
          TConesul.ConvBase64Img(ObjConfig.Logo);
          edtlogo.Picture             := TConeSul.nfoto;
          TConeSul.nfoto.Free;
        end;

        if ObjConfig.Banner <> '' then
        begin
          TConesul.ConvBase64Img(ObjConfig.Banner);
          cxbanner.Picture             := TConeSul.nfoto;
          TConeSul.nfoto.Free;
        end;

        cxAberturaautomatica.EditValue         :=ObjConfig.abertura_automatica;
        cxEncerramento.EditValue               :=ObjConfig.encerramento_automatico;
        cxVotosecreto.EditValue                :=ObjConfig.votacao_secreta;
        cxresultadoparcial.EditValue           :=ObjConfig.exibir_resultado_parcial;
        cxpublicacaoautomatica.EditValue       :=ObjConfig.publicacao_resultado;
        cxcontrolaquorum.EditValue             :=ObjConfig.controlar_quorum;
        cxtipoquorum.Text                      :=ObjConfig.tipo_quorum;
        cxquorumminimo.EditValue               :=ObjConfig.quorum_minimo;
        cxquorumpercentual.EditValue           :=ObjConfig.quorum_percentual;
        cxquorumbase.Text                      :=ObjConfig.quorum_base;
        cxControlapresenca.EditValue           :=ObjConfig.controlar_presenca;
        cxExigePresenca.EditValue              :=ObjConfig.exigir_presenca_votacao;

      end
      else
      begin
        JKDialog('Aviso','Não foi possivel carregar os dados.', tdAlerta);
        exit;
      end;

    Finally
      FreeAndNil(ObjConfig);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmEleicaoConfiguracao.Salvar(out msg: string): Boolean;
var
AID:integer;
begin
  Result        := False;
  ObjConfig     := Nil;

  try
    ObjConfig     := TModelEleicaoConfig.Create;

    Try
      if ParamsStr='N' then
      ObjConfig.IdConfig                    := 0
      else
      ObjConfig.IdConfig                    := ParamsInt;
      ObjConfig.IdEleicao                   := AIDEleicao;
      ObjConfig.ExigeHomologacaoFinal       := cxexigehomologacao.EditValue;
      ObjConfig.PublicacaoAutomatica        := cxpublicacaoautomatica.EditValue;
      ObjConfig.ExigeAssociadoAtivo         := cxexigeativo.EditValue;
      ObjConfig.ExigeAssociadoAdimplente    := cxexigeadimplente.EditValue;
      ObjConfig.exige_tempo_minimo          := cxexigetempo.EditValue;
      ObjConfig.TempoMinimoFiliacao         := cxmeses.EditValue;
      ObjConfig.BloqueiaPendenciaFinanceira := cxbloqueiapendencia.EditValue;
      ObjConfig.BloqueiaAssociadoSuspenso   := cxbloqueiasuspenso.EditValue;
      ObjConfig.gerar_eleitores_aptos       := cxgeraraptos.EditValue;

      ObjConfig.idusuario                   := TSession.ID_USUARIO;
      ObjConfig.idempresa                   := TSession.IDEMPRESA;

      ObjConfig.Slug                        := Trim(cxslug.Text);
      ObjConfig.NomeExibicao                := trim(cxExibicao.Text);
      ObjConfig.MensagemBoasVindas          := Trim(cxobs.Text);
      ObjConfig.UrlPublica                  := Trim(cxUrl.Text);
      ObjConfig.Email                       := Trim(cxEmail.Text);
      ObjConfig.Telefone                    := Tirapontos(cxtelefone.Text);
      ObjConfig.CorPrimaria                 := ColorToHex(cxPrimaria.ColorValue);
      ObjConfig.CorSecundaria               := ColorToHex(cxSecundaria.ColorValue);
      ObjConfig.UrlInstagram                := Trim(cxInstagram.Text);
      ObjConfig.UrlFacebook                 := Trim(cxFacebok.Text);
      ObjConfig.UrlYoutube                  := Trim(cxyoutube.Text);
      ObjConfig.pagina_publicar             := cxPublicar.EditValue;

      ObjConfig.data_hora_inicio            := cxdatainicio.Date;
      ObjConfig.data_hora_fim               := cxdatafim.Date;

      if (edtlogo.Picture <> nil) and (edtlogo.Picture.Graphic <> nil) and (not edtlogo.Picture.Graphic.Empty) then
      ObjConfig.Logo                        := TConeSul.ConvImgBase64(edtlogo);

      if (cxbanner.Picture <> nil) and (cxbanner.Picture.Graphic <> nil) and (not cxbanner.Picture.Graphic.Empty) then
      ObjConfig.Banner                      := TConeSul.ConvImgBase64(cxbanner);
      ObjConfig.sinc_app                    := 'N';

      ObjConfig.abertura_automatica         := cxAberturaautomatica.EditValue;
      ObjConfig.encerramento_automatico     := cxEncerramento.EditValue;
      ObjConfig.votacao_secreta             := cxVotosecreto.EditValue;
      ObjConfig.exibir_resultado_parcial    := cxresultadoparcial.EditValue;
      ObjConfig.publicacao_resultado        := cxpublicacaoautomatica.EditValue;
      ObjConfig.controlar_quorum            := cxcontrolaquorum.EditValue;
      ObjConfig.tipo_quorum                 := cxtipoquorum.Text;
      ObjConfig.quorum_minimo               := cxquorumminimo.EditValue;
      ObjConfig.quorum_percentual           := cxquorumpercentual.EditValue;
      ObjConfig.quorum_base                 := cxquorumbase.Text;
      ObjConfig.controlar_presenca          := cxControlapresenca.EditValue;
      ObjConfig.exigir_presenca_votacao     := cxExigePresenca.EditValue;

      if ParamsStr='E' then
      begin
        ObjConfig.idusuarioalt              := TSession.id_usuario;
        ObjConfig.data_alteracao            := TSession.idempresa;
      end;

      if TEleicaoConfigController.Salvar(ObjConfig, AID) then
      begin
        msg     := 'Registro salvo com sucesso';
        Result  := true;
        ParamsCloseTela := 'S';
      end;

    Finally
      FreeAndNil(ObjConfig);
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmEleicaoConfiguracao.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if cxPublicar.Checked = True then
  begin
    if cxslug.Text='' then
    begin
      msg     := 'Informe um slug.';
      result  := False;
      exit;
    end;

    if cxExibicao.Text='Informe um nome para exibição.' then
    begin
      msg     := '';
      result  := False;
      exit;
    end;

    if cxUrl.Text='Nenhuma url gerada.' then
    begin
      msg     := '';
      result  := False;
      exit;
    end;

    if cxEmail.Text='Informe um e-mail.' then
    begin
      msg     := '';
      result  := False;
      exit;
    end;

  end;


end;

end.
