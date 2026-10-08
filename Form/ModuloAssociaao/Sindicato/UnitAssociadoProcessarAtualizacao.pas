unit UnitAssociadoProcessarAtualizacao;

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
  dxSkinXmas2008Blue, Vcl.ComCtrls, dxCore, cxDateUtils, cxMaskEdit,
  cxButtonEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCalendar, cxTextEdit, cxGroupBox, cxMemo,Model.AssociadoAtualizarAPI,
  Controller.AssociadoAtualizacaoAPI, uJKDialog;

type
  TFrmAssociadoProcessarAtualizacao = class(TFormNovoBaseCadastro)
    cxGroupBox1: TcxGroupBox;
    lbsituacao: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label23: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    cxid: TcxTextEdit;
    cxmatricula: TcxTextEdit;
    cxnome: TcxTextEdit;
    cxcpf: TcxButtonEdit;
    cxtelefone: TcxMaskEdit;
    cxwhatsapp: TcxMaskEdit;
    cxemail: TcxTextEdit;
    cxidapi: TcxTextEdit;
    Label9: TLabel;
    cxsituacao: TcxTextEdit;
    cxGroupBox2: TcxGroupBox;
    cxTextEdit3: TcxTextEdit;
    cxTextEdit4: TcxTextEdit;
    cxTextEdit5: TcxTextEdit;
    cxTextEdit6: TcxTextEdit;
    cxTextEdit7: TcxTextEdit;
    cxTextEdit8: TcxTextEdit;
    cxTextEdit9: TcxTextEdit;
    cxTextEdit10: TcxTextEdit;
    cxTextEdit11: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    cxGroupBox4: TcxGroupBox;
    Label14: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    cxemailnovo: TcxTextEdit;
    cxCelularnovo: TcxTextEdit;
    cxwhatsapp_novo: TcxTextEdit;
    cxcepnovo: TcxTextEdit;
    cxendereconovo: TcxTextEdit;
    cxnumeronovo: TcxTextEdit;
    cxBairroNovo: TcxTextEdit;
    cxcomplementonovo: TcxTextEdit;
    cxcidadenovo: TcxTextEdit;
    cxGroupBox3: TcxGroupBox;
    cxobs: TcxMemo;
    BtnRejeitar: TStyledBitBtn;
    BtnErro: TStyledBitBtn;
    BtnPesquisarAssociado: TStyledBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Procedure ProcessarCadastro(AID:Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAssociadoProcessarAtualizacao: TFrmAssociadoProcessarAtualizacao;
  Obj   :TAssociadoAtualizacao;
  Cont  :TAssociadoAtualizacaoController;
implementation

{$R *.dfm}

procedure TFrmAssociadoProcessarAtualizacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmAssociadoProcessarAtualizacao  := nil;
end;

procedure TFrmAssociadoProcessarAtualizacao.FormShow(Sender: TObject);
begin
  inherited;
  ParamsStr := 'N';
  ParamsTela:= 'Associados/Dependentes';
  TitleText := 'Processar Atualização Cadastral';

  Try
    ProcessarCadastro(ParamsInt);
  Finally

  End;
end;

procedure TFrmAssociadoProcessarAtualizacao.ProcessarCadastro(AID: Integer);
begin
  Obj      := Nil;
  try
    Obj    := TAssociadoAtualizacao.Create;
    Try
      if (ParamsInt=0) or (InttoStr(ParamsInt) = '') then
      raise Exception.Create('Nenhum ID passado no parâmetro.');

      Obj     := TAssociadoAtualizacaoController.BuscarPorID(ParamsInt);
      if Assigned(Obj) then
      begin

        cxid.EditValue        := Obj.Id_Solicitacao_API;
        cxidapi.EditValue     := Obj.Pessoa_Id_API;
        cxmatricula.EditValue := Obj.Matricula;
        cxnome.EditValue      := Obj.Nome;
        cxcpf.EditValue       := Obj.CPF;
        cxtelefone.EditValue  := Obj.telefone_novo;
        cxwhatsapp.EditValue  := Obj.whatsapp_novo;
        cxemail.EditValue     := Obj.email_novo;
        cxsituacao.EditValue  := Obj.Situacao;


        cxemailnovo.EditValue       := Obj.email_novo;
        cxCelularnovo.EditValue     := Obj.telefone_novo;
        cxwhatsapp_novo.EditValue   := Obj.whatsapp_novo;
        cxcepnovo.EditValue         := Obj.cep_novo;
        cxendereconovo.EditValue    := Obj.endereco_novo;
        cxnumeronovo.EditValue      := Obj.numero_novo;
        cxBairroNovo.EditValue      := Obj.bairro_novo;
        cxcomplementonovo.EditValue := Obj.complemento_novo;
        cxcidadenovo.EditValue      := Obj.cidade_nova;

      end;

    Finally
      FreeAndNil(Obj);
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

end.
