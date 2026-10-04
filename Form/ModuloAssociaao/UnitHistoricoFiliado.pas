unit UnitHistoricoFiliado;

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
  dxSkinXmas2008Blue, Vcl.ComCtrls, dxCore, cxDateUtils, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxMaskEdit, cxCalendar,
  cxTextEdit, cxGroupBox, cxButtonEdit,
  Model.Pessoa, Controller.Pessoa,Model.SindicatoHistorico, UConeSul, uJKDialog,
  Datasnap.DBClient, Controller.LookupHelper, UnitGlobal,
  Frame.HistoricoTimelineItem, Controller.SindicatoHistorico,System.Generics.Collections;

type
  TFrmHistoricoFiliado = class(TFormNovoBaseDiversos)
    cxGroupBox1: TcxGroupBox;
    lbsituacao: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
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
    Label23: TLabel;
    cxcpf: TcxButtonEdit;
    Label29: TLabel;
    cxnascimento: TcxDateEdit;
    Label1: TLabel;
    cxtelefone: TcxMaskEdit;
    Label13: TLabel;
    cxzap: TcxMaskEdit;
    Label2: TLabel;
    cxemail: TcxTextEdit;
    TabSecretaria: TClientDataSet;
    TabSecretariaid_secretaria: TIntegerField;
    TabSecretariacodigo: TIntegerField;
    TabSecretariarazao: TStringField;
    TabSecretariansecretaria: TStringField;
    dsSecretaria: TUniDataSource;
    TabSindProfissao: TClientDataSet;
    TabSindProfissaoid_profissao: TIntegerField;
    TabSindProfissaocodigo: TIntegerField;
    TabSindProfissaodescricao: TStringField;
    TabSindProfissaoativo: TStringField;
    TabSindProfissaonprofissao: TStringField;
    dsProfissao: TUniDataSource;
    TabSindLotacao: TClientDataSet;
    TabSindLotacaoid_lotacao: TIntegerField;
    TabSindLotacaocodigo: TIntegerField;
    TabSindLotacaodescricao: TStringField;
    TabSindLotacaoativo: TStringField;
    TabSindLotacaonlotacao: TStringField;
    dsLotacao: TUniDataSource;
    TabLocalTrabalho: TClientDataSet;
    TabLocalTrabalhoid_local: TIntegerField;
    TabLocalTrabalhodescricao: TStringField;
    TabLocalTrabalhonpesquisa: TStringField;
    dsLocalTrabalho: TUniDataSource;
    scrLinhaTempo: TScrollBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    Procedure CarregarDados(AID:integer);
    Procedure CarregarHistorico(Aid:integer);
    Procedure Visualizar(Sender: TObject);
    Procedure AdicionarItem(const AIdHistorico: integer;const ATitulo, ADescricao, AUsuario, ASituacao: string;
                           const ADataHora: TDate;const ACor: string; const AData, ADataDesfiliacao:TDate);
    procedure LimparHistorico;

    { Private declarations }
  public
    AIDRegistro :integer;
    { Public declarations }
  end;

var
  FrmHistoricoFiliado: TFrmHistoricoFiliado;
  ContPessoa      : TPessoaController;
  ObjPessoa       : TPESSOA;
  ObjHistorico    : TSindicatoHistorico;
implementation

{$R *.dfm}


procedure TFrmHistoricoFiliado.CarregarDados(AID: integer);
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
          cxcpf.EditValue          := objpessoa.cpf;
          cxnascimento.EditValue   := objpessoa.nascimento;
          cxtelefone.EditValue     := objpessoa.telefone;
          cxzap.EditValue          := objpessoa.whatsapp;
          cxemail.EditValue        := objpessoa.email;
          cxsecretaria.EditValue   := ObjPessoa.idescritorio;
          cxprofissao.EditValue    := ObjPessoa.idprofissao;
          cxlotacao.EditValue      := ObjPessoa.idlotacao;
          cxlocaltrabalho.EditValue:= ObjPessoa.id_localtrabalho;

          //Carregar historico

          CarregarHistorico(AID);

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

procedure TFrmHistoricoFiliado.CarregarHistorico(Aid: integer);
var
List    : TObjectList<TSindicatoHistorico>;
begin
  inherited;
  try
    Try
      LimparHistorico;
      List  := TSindicatoHistoricoController.buscarhistoricoporid(Aid);

      if (List = nil) or (List.Count = 0) then
      begin
        exit;
      end;

      for var Item in List do

      begin

        AdicionarItem(Item.id_historico,
                      Item.tipo,          //tipo
                      Item.observacao,    //descricao
                      Item.usuario,       //usuario
                      Item.situacao_nova, //situacao
                      Item.data_criacao,  //data criacao
                      Item.cor,            //cor
                      item.data_filiacao,   //filiacao data
                      Item.data_desfiliacao); //data desfiliacao
      end;


    Finally
      if Assigned(List) then
        List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmHistoricoFiliado.AdicionarItem(const AIdHistorico: integer;
  const ATitulo, ADescricao, AUsuario, ASituacao: string;
  const ADataHora: TDate; const ACor: string; const AData,ADataDesfiliacao:TDate);
var
  Frame: TFrameHistoricoTimelineItem;
begin
  Frame         := TFrameHistoricoTimelineItem.Create(scrLinhaTempo);
  Frame.Name    := '';
  Frame.Parent  := scrLinhaTempo;
  Frame.Align   := alTop;
  Frame.Configurar(AIdHistorico, ATitulo, ADescricao, ADataHora, AData, ADataDesfiliacao, AUsuario, ASituacao, ACor, False);
  Frame.OnVisualizar := Visualizar;
end;

procedure TFrmHistoricoFiliado.Visualizar(Sender: TObject);
var
  Frame: TFrameHistoricoTimelineItem;
begin
  if Sender is TFrameHistoricoTimelineItem then
  begin
    Frame := TFrameHistoricoTimelineItem(Sender);
    ShowMessage('ID do histórico: ' + Frame.IdHistorico.ToString);
  end;
end;

procedure TFrmHistoricoFiliado.LimparHistorico;
var
  I: Integer;
begin
  for I := scrLinhaTempo.ControlCount - 1 downto 0 do
    scrLinhaTempo.Controls[I].Free;
end;

procedure TFrmHistoricoFiliado.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  inherited;
  FrmHistoricoFiliado := nil;
end;

procedure TFrmHistoricoFiliado.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'Associados/Dependentes';
  TitleText   := 'Histórico Associado';
  TLookupHelper.CarregarLookup(
                  TabsindProfissao,LookupProfissaoSql);

  TLookupHelper.CarregarLookup(
                  TabsindLotacao,LookupLotacaoSql);

  TLookupHelper.CarregarLookup(
                  TabSecretaria,LookupSecretariaSql);

  TLookupHelper.CarregarLookup(
                  TabLocalTrabalho,LookupsindicatoLocalTrabalho);


  CarregarDados(AIDRegistro);

end;


end.
