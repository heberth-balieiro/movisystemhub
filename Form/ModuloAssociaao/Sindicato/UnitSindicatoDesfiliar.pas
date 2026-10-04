unit UnitSindicatoDesfiliar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormNovoBaseDiversos, cxStyles,
  cxGridTableView, cxClasses, Data.DB, DBAccess, Uni, ACBrBase, ACBrEnterTab,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, cxGraphics, cxControls,
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
  dxSkinXmas2008Blue, cxGroupBox, Vcl.ComCtrls, dxCore, cxDateUtils, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxTextEdit, dxGDIPlusClasses, dxBevel,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxBlobEdit,
  Vcl.ButtonStylesAttributes, Vcl.StyledButton,
  Model.Pessoa, Controller.Pessoa, UConeSul, uJKDialog, Datasnap.DBClient,
  Controller.LookupHelper, UnitGlobal, cxMemo, cxCheckBox,Model.SindicatoHistorico,
  Vcl.Session, uConfiguracaoService, Vcl.PermissaoUsuario, frxClass, frxDBSet,
  dxmdaset, frxRich
  ;

type
  TFrmSindicatoDesfiliar = class(TFormNovoBaseDiversos)
    cxResumo: TcxGroupBox;
    cxGroupBox1: TcxGroupBox;
    lbsituacao: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dxBevel1: TdxBevel;
    cxfoto: TImage;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    cxcodigo: TcxTextEdit;
    cxmatricula: TcxTextEdit;
    cxfiliado: TcxDateEdit;
    cxnome: TcxTextEdit;
    cxprofissao: TcxLookupComboBox;
    cxlotacao: TcxLookupComboBox;
    cxlocaltrabalho: TcxLookupComboBox;
    cxsecretaria: TcxLookupComboBox;
    Label1: TLabel;
    cxDatadesfiliar: TcxDateEdit;
    Label36: TLabel;
    edtsituacao: TcxComboBox;
    Label34: TLabel;
    BtnSalvar: TStyledBitBtn;
    BtnCancelar: TStyledBitBtn;
    TabLocalTrabalho: TClientDataSet;
    TabLocalTrabalhoid_local: TIntegerField;
    TabLocalTrabalhodescricao: TStringField;
    TabLocalTrabalhonpesquisa: TStringField;
    dsLocalTrabalho: TUniDataSource;
    TabSecretaria: TClientDataSet;
    TabSecretariaid_secretaria: TIntegerField;
    TabSecretariacodigo: TIntegerField;
    TabSecretariarazao: TStringField;
    TabSecretariansecretaria: TStringField;
    dsSecretaria: TUniDataSource;
    TabSindLotacao: TClientDataSet;
    TabSindLotacaoid_lotacao: TIntegerField;
    TabSindLotacaocodigo: TIntegerField;
    TabSindLotacaodescricao: TStringField;
    TabSindLotacaoativo: TStringField;
    TabSindLotacaonlotacao: TStringField;
    dsLotacao: TUniDataSource;
    TabSindProfissao: TClientDataSet;
    TabSindProfissaoid_profissao: TIntegerField;
    TabSindProfissaocodigo: TIntegerField;
    TabSindProfissaodescricao: TStringField;
    TabSindProfissaoativo: TStringField;
    TabSindProfissaonprofissao: TStringField;
    dsProfissao: TUniDataSource;
    TabSindEmpresa: TClientDataSet;
    TabSindEmpresasind_id_empresa: TIntegerField;
    TabSindEmpresacodigo: TIntegerField;
    TabSindEmpresadescricao: TStringField;
    TabSindEmpresaid_sede: TIntegerField;
    TabSindEmpresaativo: TStringField;
    TabSindEmpresanempresa: TStringField;
    dsEmpresa: TUniDataSource;
    Label41: TLabel;
    cxEmpresa: TcxLookupComboBox;
    Label3: TLabel;
    Label10: TLabel;
    cxresponsavel: TcxLookupComboBox;
    cxobs: TcxMemo;
    cxdocumento: TcxTextEdit;
    Label12: TLabel;
    cxGroupBox2: TcxGroupBox;
    edtbloqueado: TcxCheckBox;
    cxinativarcadastro: TcxCheckBox;
    cxinativarcarteira: TcxCheckBox;
    TabResponsavel: TClientDataSet;
    TabResponsavelid_usuario: TIntegerField;
    TabResponsavelnome: TStringField;
    TabResponsavelid_funcionario: TIntegerField;
    dsresponsavel: TUniDataSource;
    dsMotivo: TUniDataSource;
    TabMotivo: TClientDataSet;
    TabMotivoid_motivo: TIntegerField;
    TabMotivodescricao: TStringField;
    TabMotivonpesquisa: TStringField;
    cxmotivo: TcxLookupComboBox;
    frxEspelho: TfrxReport;
    frxDbEspelho: TfrxDBDataset;
    mdEspelho: TdxMemData;
    mdEspelhonome: TStringField;
    mdEspelhocivil: TStringField;
    mdEspelhoprofissao: TStringField;
    mdEspelhomatricula: TIntegerField;
    mdEspelholotacao: TStringField;
    mdEspelhorg: TStringField;
    mdEspelhocpf: TStringField;
    mdEspelhoendereco: TStringField;
    mdEspelhofone: TStringField;
    mdEspelhowhatsapp: TStringField;
    mdEspelhoemail: TStringField;
    mdEspelhodata_desfiliacao: TDateField;
    mdEspelhomotivodesfiliacao: TStringField;
    mdEspelhoobs: TStringField;
    mdEspelhoprotocolo: TStringField;
    frxRichObject1: TfrxRichObject;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Procedure CarregarDados(AID:integer);
    function Salvar(out msg:string):boolean;
    function ValidarCampos(out msg: string):boolean;
    procedure CarregarEspelho;
    { Private declarations }
  public
    AIDRegistro :integer;
    ASituacao   :String;
    msg         :string;
    { Public declarations }
  end;

var
  FrmSindicatoDesfiliar: TFrmSindicatoDesfiliar;
  ContPessoa      : TPessoaController;
  ObjPessoa       : TPESSOA;
  ObjHistorico    : TSindicatoHistorico;
implementation

{$R *.dfm}

procedure TFrmSindicatoDesfiliar.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrmSindicatoDesfiliar.BtnSalvarClick(Sender: TObject);
begin
  if ValidarCampos(msg) then
    begin
      Try
         if Salvar(msg) then
         begin
          JKDialog('Sucesso',msg, tdSucesso);
          Close;
         end;

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

procedure TFrmSindicatoDesfiliar.CarregarDados(AID: integer);
begin
  try
    ObjPessoa        := Nil;
    ContPessoa       := Nil;

    ObjPessoa        := TPESSOA.Create;
    ContPessoa       := TPessoaController.Create;
    Try

        ObjPessoa    := ContPessoa.BuscarPorID(AID);
        if Assigned(ObjPessoa) then
        begin

          cxcodigo.EditValue       := ObjPessoa.codigo;
          cxmatricula.EditValue    := ObjPessoa.matricula;
          cxfiliado.EditValue      := TConeSul.ValidarDataNull(ObjPessoa.sociodeste);
          cxnome.EditValue         := ObjPessoa.nome;
          cxprofissao.EditValue    := ObjPessoa.idprofissao;
          cxlotacao.EditValue      := ObjPessoa.idlotacao;
          cxlocaltrabalho.EditValue:= ObjPessoa.id_localtrabalho;
          cxsecretaria.EditValue   := ObjPessoa.idescritorio;
          cxEmpresa.EditValue      := Objpessoa.sindidempresa;
          ASituacao                := objpessoa.situacao;
          if ObjPessoa.foto <> '' then
          begin
            TConesul.ConvBase64Img(ObjPessoa.foto);
            cxFoto.Picture         := TConeSul.nfoto;
            TConeSul.nfoto.Free;
          end;

          //Popular MD
          mdEspelho.Close;
          mdEspelho.FieldDefs.Clear;

          if not mdEspelho.Active then
          mdEspelho.Open;

          mdEspelho.Append;
          mdEspelhonome.AsString      := ObjPessoa.nome;
          mdEspelhocivil.AsString     := ObjPessoa.civil;
          mdEspelhoprofissao.AsString := cxprofissao.Text;
          mdEspelhomatricula.AsInteger:= ObjPessoa.matricula;
          mdEspelholotacao.AsString   := cxlotacao.Text;
          mdEspelhorg.AsString        := ObjPessoa.rg + ' - ' + ObjPessoa.orgao;
          mdEspelhocpf.AsString       := ObjPessoa.cpf;
          mdEspelhoendereco.AsString  := ObjPessoa.endereco+' Nº: '+ObjPessoa.numero + ' Bairro: '+ ObjPessoa.bairro + ' Cidade: '+ObjPessoa.cidade;
          mdEspelhofone.AsString      := ObjPessoa.telefone;
          mdEspelhowhatsapp.AsString  := ObjPessoa.whatsapp;
          mdEspelhoemail.AsString     := ObjPessoa.email;

        end
        else
        begin
          JKDialog('Aviso','Não foi possivel carregar os dados.', tdAlerta);
          exit;
        end;

    Finally
      ObjPessoa.Free;
      ContPessoa.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmSindicatoDesfiliar.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  inherited;
  FrmSindicatoDesfiliar :=nil;
end;

procedure TFrmSindicatoDesfiliar.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdespelho.Active then
    mdespelho.Open;
end;

procedure TFrmSindicatoDesfiliar.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'Associados/Dependentes';
  TitleText   := 'Desfiliar Associado';

  TLookupHelper.CarregarLookup(
                  TabsindProfissao,LookupProfissaoSql);

  TLookupHelper.CarregarLookup(
                  TabSindEmpresa,LookupEmpresaSindsql);

  TLookupHelper.CarregarLookup(
                  TabsindLotacao,LookupLotacaoSql);

  TLookupHelper.CarregarLookup(
                  TabSecretaria,LookupSecretariaSql);

  TLookupHelper.CarregarLookup(
                  TabLocalTrabalho,LookupsindicatoLocalTrabalho);

  TLookupHelper.CarregarLookup(
                  TabResponsavel,LookupUsuarioLoginSql);

  TLookupHelper.CarregarLookup(
                  TabMotivo,LookupSindicatoMotivoDesfiliar);


  CarregarDados(AIDRegistro);
  cxDatadesfiliar.SetFocus;
  cxresponsavel.EditValue   := TSession.ID_USUARIO;
end;

function TFrmSindicatoDesfiliar.Salvar(out msg:string):boolean;
begin
  Result  := false;
  try
    ContPessoa    := nil;
    ObjHistorico  := nil;

    ContPessoa    := TPessoaController.Create;
    ObjHistorico  := TSindicatoHistorico.Create;

    Try
      ObjHistorico.id_historico           := 0;
      ObjHistorico.id_associado           := AIDRegistro;
      ObjHistorico.data_filiacao          := cxfiliado.EditValue;
      ObjHistorico.data_desfiliacao       := cxDatadesfiliar.EditValue;
      ObjHistorico.situacao_anterior      := ASituacao;
      ObjHistorico.situacao_nova          := edtsituacao.Text;
      ObjHistorico.id_motivo              := cxmotivo.EditValue;
      ObjHistorico.observacao             := Trim(cxobs.Text);
      ObjHistorico.id_usuario             := cxresponsavel.EditValue;
      ObjHistorico.documento_protocolo    := Trim(cxdocumento.Text);
      ObjHistorico.id_empresa_anterior    := cxEmpresa.EditValue;
      ObjHistorico.id_secretaria_anterior := cxsecretaria.EditValue;
      ObjHistorico.id_lotacao_anterior    := cxlotacao.EditValue;
      ObjHistorico.id_profissao_anterior  := cxprofissao.EditValue;
      ObjHistorico.matricula_anterior     := cxmatricula.EditValue;
      ObjHistorico.bloqueou_desconto      := edtbloqueado.EditValue;
      ObjHistorico.inativar_cadastro      := cxinativarcadastro.EditValue;
      ObjHistorico.inativar_carteira      := cxinativarcarteira.EditValue;
      ObjHistorico.id_empresa             := TSession.idempresa;
      ObjHistorico.data_criacao           := Now;
      ObjHistorico.cor                    := 'clRed';
      ObjHistorico.tipo                   := 'DESFILIAÇÃO';

      //atualizar md
      mdEspelhodata_desfiliacao.AsDateTime:= cxDatadesfiliar.EditValue;
      mdEspelhomotivodesfiliacao.AsString := cxmotivo.Text;
      mdEspelhoobs.AsString               := cxobs.Text;
      mdEspelhoprotocolo.AsString         := cxdocumento.Text;
      mdEspelho.Post;

      if ContPessoa.DesfiliarAssociado(ObjHistorico) then
      begin
        msg     := 'Registro salvo com sucesso.';
        Result:= true;
        if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
        begin
          TConfiguracaoService.SincronizarGravar(4, AIDRegistro);
        end;
        CarregarEspelho;
      end;

    Finally
      FreeAndNil(ContPessoa);
      FreeAndNil(ObjHistorico);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmSindicatoDesfiliar.ValidarCampos(out msg: string):boolean;
begin
  Result  := True;

  if cxDatadesfiliar.text='' then
  begin
    msg     := 'Informe uma data!';
    Result  := False;
    exit;
  end;

  if edtsituacao.text='' then
  begin
    msg     := 'Informe uma situação!';
    Result  := False;
    exit;
  end;

  if (cxmotivo.text='') or (cxmotivo.EditValue=0) then
  begin
    msg     := 'Informe um motivo!';
    Result  := False;
    exit;
  end;

  if (cxresponsavel.text='') or (cxresponsavel.EditValue=0) then
  begin
    msg     := 'Informe um responsável!';
    Result  := False;
    exit;
  end;


end;

procedure TFrmSindicatoDesfiliar.CarregarEspelho;
begin
  frxEspelho.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelRequerimentoFiliadoDesfiliar.fr3');
  frxEspelho.Report.PrepareReport();
  frxEspelho.ShowReport;
end;

end.
