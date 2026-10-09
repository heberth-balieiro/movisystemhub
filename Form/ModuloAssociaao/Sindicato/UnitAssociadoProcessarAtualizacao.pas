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
  Controller.AssociadoAtualizacaoAPI, uJKDialog, Vcl.Session,
  Vcl.PermissaoUsuario;

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
    cxemailatual: TcxTextEdit;
    cxcelularatual: TcxTextEdit;
    cxwhatsappatual: TcxTextEdit;
    cxcepatual: TcxTextEdit;
    cxenderecoatual: TcxTextEdit;
    cxNumeroatual: TcxTextEdit;
    cxBairroatual: TcxTextEdit;
    cxComplementoatual: TcxTextEdit;
    cxCidadeAtual: TcxTextEdit;
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
    procedure BtnRejeitarClick(Sender: TObject);
    procedure BtnErroClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
  private
    FIdSocio: Integer;
    FIdSolicitacaoAPI: Int64;
    Procedure ProcessarCadastro(AID:Integer);
    Procedure LocalizarAssociadolocal(AMatricula:integer; ACPF:String);
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

procedure TFrmAssociadoProcessarAtualizacao.BtnErroClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
  Motivo: string;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Associados/Dependentes');

  if not Permissao.TemPermissao('Permitir Marcar com Erro') then
  begin
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
    Exit;
  end;

  if FIdSolicitacaoAPI <= 0 then
  begin
    JKDialog('Aviso','Nenhuma solicitação válida foi carregada.', tdAlerta);
    Exit;
  end;

  if not SameText(Trim(cxsituacao.Text), 'PENDENTE') then
  begin
    JKDialog('Aviso','Somente solicitações pendentes podem ser marcadas com erro.', tdAlerta);
    Exit;
  end;

  Motivo := Trim(cxobs.Text);

  if Motivo = '' then
  begin
    JKDialog('Aviso','Informe o motivo do erro no campo Observação.', tdAlerta);
    cxobs.SetFocus;
    Exit;
  end;

  if JKDialog('Confirmação', 'Confirma marcar esta atualização cadastral com erro?', tdMensagem) then
  begin
    try
      if TAssociadoAtualizacaoController.MarcarErro(
           FIdSolicitacaoAPI,
           TSession.idempresa,
           Motivo
         ) then
      begin
        cxsituacao.EditValue := 'ERRO';
        JKDialog('Sucesso','Atualização cadastral marcada com erro com sucesso.', tdSucesso);
        ModalResult := mrOk;
        FrmAssociadoProcessarAtualizacao.Close;
      end
      else
        JKDialog('Aviso',
                 'Não foi possível marcar a solicitação com erro.' + sLineBreak +
                 'Verifique se ela ainda está pendente.',
                 tdAlerta);
    except
      on E: Exception do
        JKDialog('Erro','Ocorreu um erro ao marcar a solicitação:' + sLineBreak + E.Message, tdErro);
    end;
  end
  else
    Exit;
end;

procedure TFrmAssociadoProcessarAtualizacao.BtnRejeitarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
  Motivo: string;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Associados/Dependentes');

  if not Permissao.TemPermissao('Permitir Rejeitar Cadastro') then
  begin
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
    Exit;
  end;

  if FIdSolicitacaoAPI <= 0 then
  begin
    JKDialog('Aviso','Nenhuma solicitação válida foi carregada.', tdAlerta);
    Exit;
  end;

  if not SameText(Trim(cxsituacao.Text), 'PENDENTE') then
  begin
    JKDialog('Aviso','Somente solicitações pendentes podem ser rejeitadas.', tdAlerta);
    Exit;
  end;

  Motivo := Trim(cxobs.Text);

  if Motivo = '' then
  begin
    JKDialog('Aviso','Informe o motivo da rejeição no campo Observação.', tdAlerta);
    cxobs.SetFocus;
    Exit;
  end;

  if JKDialog('Confirmação', 'Confirma a rejeição desta atualização cadastral?', tdMensagem)  then
  begin
    try
      if TAssociadoAtualizacaoController.Rejeitar(
           FIdSolicitacaoAPI,
           TSession.idempresa,
           Motivo
         ) then
      begin
        cxsituacao.EditValue := 'REJEITADO';
        JKDialog('Sucesso','Atualização cadastral rejeitada com sucesso.', tdSucesso);
        ModalResult     := mrOk;
        FrmAssociadoProcessarAtualizacao.Close;
      end
      else
        JKDialog('Aviso',
                 'Não foi possível rejeitar a solicitação.' + sLineBreak +
                 'Verifique se ela ainda está pendente.',
                 tdAlerta);
    except
      on E: Exception do
        JKDialog('Erro','Ocorreu um erro ao rejeitar a solicitação:' + sLineBreak + E.Message, tdErro);
    end;
  end
  else
  Exit;

end;

procedure TFrmAssociadoProcessarAtualizacao.BtnSalvarClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Associados/Dependentes');

  if not Permissao.TemPermissao('Permitir Salvar Cadastro') then
  begin
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
    Exit;
  end;

end;

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

function FormatarCEP(const AValor: string): string;
var
  S: string;
begin
  S := StringReplace(AValor, '-', '', [rfReplaceAll]);

  if Length(S) = 8 then
    Result := Copy(S, 1, 5) + '-' + Copy(S, 6, 3)
  else
    Result := AValor;
end;

function FormatarTelefone(const AValor: string): string;
var
  S: string;
begin
  S := AValor;
  S := StringReplace(S, '(', '', [rfReplaceAll]);
  S := StringReplace(S, ')', '', [rfReplaceAll]);
  S := StringReplace(S, '-', '', [rfReplaceAll]);
  S := StringReplace(S, ' ', '', [rfReplaceAll]);

  if Length(S) = 11 then
    Result :=
      '(' + Copy(S, 1, 2) + ') ' +
      Copy(S, 3, 5) + '-' +
      Copy(S, 8, 4)
  else if Length(S) = 10 then
    Result :=
      '(' + Copy(S, 1, 2) + ') ' +
      Copy(S, 3, 4) + '-' +
      Copy(S, 7, 4)
  else
    Result := AValor;
end;

procedure TFrmAssociadoProcessarAtualizacao.LocalizarAssociadolocal(AMatricula: integer; ACPF: String);
var
  LDadosAtuais: TAssociadoDadosAtuais;
begin
  LDadosAtuais := TAssociadoDadosAtuais.Create;
  try
    if TAssociadoAtualizacaoController.BuscarAssociadoVinculo(
      LDadosAtuais,
      AMatricula,
      TSession.idempresa,
      ACPF
    ) then
    begin
      cxemailatual.EditValue       := LDadosAtuais.Email_Atual;
      cxcelularatual.EditValue     := FormatarTelefone(LDadosAtuais.Celular_Atual);
      cxwhatsappatual.EditValue    := FormatarTelefone(LDadosAtuais.Whatsapp_Atual);
      cxcepatual.EditValue         := FormatarCEP(LDadosAtuais.Cep_Atual);
      cxenderecoatual.EditValue    := LDadosAtuais.Endereco_Atual;
      cxNumeroatual.EditValue      := LDadosAtuais.Numero_Atual;
      cxBairroatual.EditValue      := LDadosAtuais.Bairro_Atual;
      cxComplementoatual.EditValue := LDadosAtuais.Complemento_Atual;
      cxcidadeatual.EditValue      := LDadosAtuais.cidade_atual;
      FIdSocio := LDadosAtuais.Id_Socio;
    end
    else
    begin
      FIdSocio := 0;
      cxemailatual.Clear;
      cxcelularatual.Clear;
      cxwhatsappatual.Clear;
      cxcepatual.Clear;
      cxenderecoatual.Clear;
      cxNumeroatual.Clear;
      cxBairroatual.Clear;
      cxComplementoatual.Clear;
      cxcidadeatual.Clear;
      JKDialog('Aviso','Associado não localizado ou cadastro inativo.', tdAlerta);
    end;
  finally
    LDadosAtuais.Free;
  end;
end;

procedure TFrmAssociadoProcessarAtualizacao.ProcessarCadastro(AID: Integer);
begin
  FIdSolicitacaoAPI := 0;
  Obj := nil;
  try
    Obj := TAssociadoAtualizacao.Create;
    Try
      if (ParamsInt=0) or (InttoStr(ParamsInt) = '') then
        raise Exception.Create('Nenhum ID passado no parâmetro.');

      Obj := TAssociadoAtualizacaoController.BuscarPorID(ParamsInt);
      if Assigned(Obj) then
      begin
        FIdSolicitacaoAPI := Obj.Id_Solicitacao_API;

        cxid.EditValue              := Obj.Id_Solicitacao_API;
        cxidapi.EditValue           := Obj.Pessoa_Id_API;
        cxmatricula.EditValue       := Obj.Matricula;
        cxnome.EditValue            := Obj.Nome;
        cxcpf.EditValue             := Obj.CPF;
        cxtelefone.EditValue        := Obj.telefone_novo;
        cxwhatsapp.EditValue        := Obj.whatsapp_novo;
        cxemail.EditValue           := Obj.email_novo;
        cxsituacao.EditValue        := Obj.Situacao;
        cxobs.EditValue             := Obj.Erro;

        cxemailnovo.EditValue       := Obj.email_novo;
        cxCelularnovo.EditValue     := FormatarTelefone(Obj.telefone_novo);
        cxwhatsapp_novo.EditValue   := FormatarTelefone(Obj.whatsapp_novo);
        cxcepnovo.EditValue         := FormatarCEP(Obj.cep_novo);
        cxendereconovo.EditValue    := Obj.endereco_novo;
        cxnumeronovo.EditValue      := Obj.numero_novo;
        cxBairroNovo.EditValue      := Obj.bairro_novo;
        cxcomplementonovo.EditValue := Obj.complemento_novo;
        cxcidadenovo.EditValue      := Obj.cidade_nova;

        if Obj.Id_Solicitacao_API > 0 then
          LocalizarAssociadolocal(StrToint(Obj.Matricula), Obj.CPF);
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
