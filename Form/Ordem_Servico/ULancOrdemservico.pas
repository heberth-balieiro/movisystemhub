{  Cliente silas

Status da O.S. sugeridos
Aberta
Em Orçamento
Aguardando Aprovação
Aprovada
Em Execução
Aguardando Peças
Pronto para Entrega
Entregue ao Cliente
Cancelada
Reprovada
Em Garantia
Finalizada Financeiramente

 Exemplo prático:
Cliente traz um celular para conserto:
ordem_servico
os_tipo = 'Orçamento'
os_status = 'Aberta'
historico_equipamento
tipo_evento = 'OS_ABERTA'
Técnico analisa:
tipo_evento = 'ORCAMENTO_REALIZADO'
status_equipamento = 'Aguardando Aprovação'
Cliente aprova:
ordem_servico.os_status = 'Aprovada'
histórico com tipo_evento = 'ORCAMENTO_APROVADO'
Técnico executa:
os_status = 'Em Execução'
histórico: INICIADO_REPARO
Finaliza:
os_status = 'Finalizada'
histórico: FINALIZADA_EXECUCAO

}




unit ULancOrdemservico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseOperacoes, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, ACBrBase, ACBrEnterTab, cxGroupBox,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, cxTextEdit, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxSpinEdit, cxTimeEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxButtonEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxMemo,
  cxBlobEdit, cxCheckBox, cxCustomListBox, cxListBox, Data.DB, DBAccess, Uni,
  Datasnap.DBClient, ACBRUTIL,
  Controllers.OrdemServico, Model.OrdemServico,
  Controller.Mensagem_Whatsapp,
  Model.Mensagem_Whatsapp, Vcl.ExtDlgs,ShellAPI,
  Model.HistoricoEquipamento, Controller.HistoricoEquipamento, dxOfficeSearchBox,
  cxMRUEdit, cxDBExtLookupComboBox;

type
  TFrmRecpOrdemServico = class(TFrmBaseOperacoes)
    Label1: TLabel;
    edtNumero: TcxTextEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtData: TcxDateEdit;
    edtHora: TcxTimeEdit;
    EdtStatus: TcxComboBox;
    EdtPrioridade: TcxComboBox;
    EdtGarantia: TcxComboBox;
    edtCliente: TcxLookupComboBox;
    BtnCliNovo: TcxButtonEdit;
    Label8: TLabel;
    EdtTipoOS: TcxComboBox;
    cxGroupBox2: TcxGroupBox;
    Label10: TLabel;
    EdtEstado: TcxComboBox;
    cxGroupBox3: TcxGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    EdtPrevisao: TcxDateEdit;
    Label15: TLabel;
    Edt_DescEquipamento: TcxLookupComboBox;
    edtDefeito: TcxBlobEdit;
    Label16: TLabel;
    edtObs: TcxMemo;
    BtnCliVisualizar: TcxButtonEdit;
    EdtSeguenciaEquip: TcxCheckBox;
    BtnEquipNovo: TcxButtonEdit;
    EdtGarantiaFinal: TcxDateEdit;
    Label11: TLabel;
    Label17: TLabel;
    TabCliente: TClientDataSet;
    TabClienteid_socio: TIntegerField;
    TabClientecliente: TStringField;
    TabClientecpf: TStringField;
    dsPessoa: TUniDataSource;
    TabVendedor: TClientDataSet;
    TabVendedorid_funcionario: TIntegerField;
    TabVendedorfunc: TStringField;
    TabVendedorcpf: TStringField;
    dsResponsavel: TUniDataSource;
    lbrascunho: TLabel;
    TabEquipamento: TClientDataSet;
    TabEquipamentoid_produto: TIntegerField;
    TabEquipamentocodigo: TIntegerField;
    TabEquipamentonumero_serie: TStringField;
    TabEquipamentonum_patrimonio: TStringField;
    TabEquipamentomarca: TStringField;
    TabEquipamentonmmodelo: TStringField;
    Dsequipamento: TUniDataSource;
    TabEquipamentonmcompleto: TStringField;
    btnAnexoNovo: TcxButtonEdit;
    btnAnexoExcluir: TcxButtonEdit;
    FlowPanel1: TFlowPanel;
    OpenPictureDialog1: TOpenPictureDialog;
    Label9: TLabel;
    EdtTecnico: TcxLookupComboBox;
    BtnTecNovo: TcxButtonEdit;
    Label19: TLabel;
    edtwhats: TcxMaskEdit;
    TabClientetelefone: TStringField;
    Label14: TLabel;
    Label18: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure BtnCliNovoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BtnTecNovoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BtnEquipNovoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtClienteExit(Sender: TObject);
    procedure btnAnexoNovoClick(Sender: TObject);
    procedure btnAnexoExcluirPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtClientePropertiesEditValueChanged(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnCliVisualizarPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    idOrdem:integer;
    ImgSelecionada: TImage;
    Function InserirOrdem:Boolean;
    Procedure PreencherCampos;
    Procedure ListaPessoa;
    Procedure ListaTecnico;
    Procedure ListaEquipamento;
    Procedure CarregarDadosOS;
    Procedure LimparCampos;
    Function GravarOSBase(out msg:string):Boolean;
    Function EnviarMensagemWhatsApp:Boolean;
    function RecuperarToken: string;
    Function Gravarequipamento:Boolean;
    procedure ImgClick(Sender: TObject);
    procedure ImgMouseEnter(Sender: TObject);
    procedure ImgMouseLeave(Sender: TObject);
    procedure ImgDblClick(Sender: TObject);
    Function GravarFotoBase:Boolean;
    procedure LimparFlowPanel1;
    Function GravarHistoricoEquipamento:Boolean;
  public
    { Public declarations }
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
  end;

var
  FrmRecpOrdemServico : TFrmRecpOrdemServico;
  ObjOrdem            : TOrdemServico;
  ControllerOrdem     : TOrdemServicoController;
  ContrMensagem       : TMensagemWhatsappController;
  ObjMensagem         : TMensagemWhatsapp;
  ObjEquipamento      : TOrdemServicoEquipamento;
  Contequipamento     : TOrdemServicoequipamentoController;
  ObjFoto             : TOrdemServicoFoto;
  ContFoto            : TOrdemServicoFotoController;
  ObjHistorico        : THistoricoEquipamento;
  ContHistorico       : THistoricoEquipamentoController;
implementation

{$R *.dfm}

uses Vcl.Navigation, uJKDialog, Controller.LookupHelper,
  Vcl.Session, UDM, uConfiguracaoService, UConeSul, Vcl.Validacoes,
  Model.Usuario, UnitPessoaCad, Vcl.PermissaoUsuario, UnitProdutoCad,
  UnitFuncionarioCad, System.Generics.Collections, UFrmPesquisaCliente;

Function TFrmRecpOrdemServico.GravarHistoricoEquipamento:Boolean;
var
idRet:integer;
begin

  Result          := False;
  ObjHistorico    := Nil;
  ContHistorico   := Nil;

  if Edt_DescEquipamento.EditValue=0 then
  exit;


  ObjHistorico    := THistoricoEquipamento.Create;
  ContHistorico   := THistoricoEquipamentoController.Create;

  Try
    ObjHistorico.id_historico         := 0;
    ObjHistorico.id_produto           := Edt_DescEquipamento.EditValue;
    ObjHistorico.data_evento          := Now;
    ObjHistorico.tipo_evento          := 'OS_aberta';
    ObjHistorico.descricao            := '';
    ObjHistorico.id_usuario           := TSession.ID_USUARIO;
    ObjHistorico.id_ordem_servico     := idOrdem;
    ObjHistorico.observacao           := '';
    ObjHistorico.status_equipamento   := 'Recebido';
    ObjHistorico.id_cliente           := edtCliente.EditValue;
    ObjHistorico.id_tecnico           := EdtTecnico.EditValue;

    if not ContHistorico.GravarHistorico(ObjHistorico,idret) then
    raise Exception.Create('Erro ao gravar histórico do equipamento.');

  Finally
    FreeAndNIl(ObjHistorico);
    FreeAndNil(ContHistorico);
  End;
  Result  := true;
end;

Function TFrmRecpOrdemServico.GravarFotoBase:Boolean;
var
  i: Integer;
  Panel: TPanel;
  Img: TImage;
  FilePath, Ext, Base64Str: string;
begin
  Result          := False;
  ObjFoto  := Nil;
  //Contfoto := Nil;


  for i := 0 to FlowPanel1.ControlCount - 1 do
  begin
    if FlowPanel1.Controls[i] is TPanel then
    begin
      Panel   := TPanel(FlowPanel1.Controls[i]);
      if (Panel.ControlCount > 0) and (Panel.Controls[0] is TImage) then
      begin
        Img         := TImage(Panel.Controls[0]);
        FilePath    := Img.Hint;
        Ext         := ExtractFileExt(FilePath);
        Base64Str   := TconeSul.ConvImgBase64(img);

        ObjFoto     := TOrdemServicoFoto.Create;
        ContFoto    := TOrdemServicoFotoController.Create;

        Try

          ObjFoto.id                 := 0;
          ObjFoto.id_ordem           := idOrdem;
          ObjFoto.id_produto         := Edt_DescEquipamento.EditValue;
          ObjFoto.anexo              := Base64Str;
          ObjFoto.caminho            := FilePath;
          ObjFoto.ext                := Ext;
          ObjFoto.id_usuario         := Tsession.ID_USUARIO;
          ObjFoto.id_empresa         := TSession.IDEMPRESA;

          if not Contfoto.GravarFoto(ObjFoto) then
           raise Exception.Create('Erro ao gravar uma das fotos.');

        Finally
          FreeAndNIl(ObjFoto);
          FreeAndNil(Contfoto);
        End;

      end;
    end;
  end;

  result  := true;

end;

Function TFrmRecpOrdemServico.Gravarequipamento:boolean;
begin
  Result          := False;
  ObjEquipamento  := Nil;
  Contequipamento := Nil;

  ObjEquipamento  := TOrdemServicoEquipamento.Create;
  Contequipamento := TOrdemServicoequipamentoController.Create;

  Try
    ObjEquipamento.id                 := 0;
    ObjEquipamento.id_ordem           := idOrdem;
    ObjEquipamento.id_produto         := Edt_DescEquipamento.EditValue;
    ObjEquipamento.estado             := edtEstado.Text;
    ObjEquipamento.defeito_reclamado  := Trim(edtdefeito.Text);
    ObjEquipamento.id_usuario         := Tsession.ID_USUARIO;
    ObjEquipamento.id_empresa         := TSession.IDEMPRESA;

    Try
      if Contequipamento.GravarEquipamento(ObjEquipamento) then
      Result  := true;
    except on e:exception do
      raise Exception.Create(e.message);
    End;

  Finally
    FreeAndNIl(ObjEquipamento);
    FreeAndNil(Contequipamento);
  End;

end;

Function TFrmRecpOrdemServico.EnviarMensagemWhatsApp:Boolean;
var
MensagemFormatada, msgPadrao:String;
vNome, vApelido,  vCodigo, vMatricula, vWhatsapp,FoneDigitado,FoneFormatado, vCpf, DescEquipamento:string;
Variaveis: TDictionary<string, string>;
begin
      result          := false;
      ContrMensagem   := Nil;
      ObjMensagem     := Nil;
      DescEquipamento := '';
      vNome           := '';
      vApelido        := '';
      vCodigo         := '';
      vMatricula      := '';
      vWhatsapp       := '';
      FoneDigitado    := '';
      FoneFormatado   := '';
      vCpf            := '';
      MensagemFormatada := '';
      msgPadrao         := '';

      if not TConfiguracaoService.RetornoMensagemPadraoWhatsApp(msgPadrao, 'id_msgpadraowhatsappordem', Tsession.IDEMPRESA) then
      begin
        Exit;
      end
      else
      begin

        if TConfiguracaoService.RetornoDadosClienteMensagem(vNome, vApelido,  vCodigo, vMatricula, vWhatsapp, vCpf, edtCliente.EditValue) then
        begin

          //dados Equipamento
          if not TConfiguracaoService.RetornoDescricaoEquipamento(DescEquipamento,Edt_DescEquipamento.EditValue) then
          DescEquipamento := 'Sem informação do equipamento';

          //Alimentar Variaveis com os dados
          {$REGION 'Variaveis Mensagem'}
            Variaveis := TDictionary<string, string>.Create;
            Try
              Variaveis.Add('[Nome]'                  , Trim(vNome));
              Variaveis.Add('[Empresa]'               , TSession.RAZAO);
              Variaveis.Add('[CPF]'                   , vCpf);
              Variaveis.Add('[Código]'                , vCodigo);
              Variaveis.Add('[Numero_os]'             , EdtNumero.Text);
              Variaveis.Add('[Data_os]'               , EdtData.Text);
              Variaveis.Add('[Hora_os]'               , Edthora.Text);
              Variaveis.Add('[Status_os]'             , EdtStatus.Text);
              Variaveis.Add('[Tipo_os]'               , Edttipoos.Text);
              Variaveis.Add('[Nome_tecnico]'          , Edttecnico.Text);
              Variaveis.Add('[Descricao_equipamento]' , DescEquipamento);

              MensagemFormatada := TConeSul.SubstituirVariaveisMensagem(msgPadrao, Variaveis);

            Finally
              FreeAndNIl(Variaveis);
            End;
          {$ENDREGION}

          FoneFormatado           :=  tirapontos(vWhatsapp);
          FoneDigitado            :=  tirapontos(edtwhats.Text);

          if (FoneDigitado = '') and (FoneFormatado = '') then
          Exit;

          ContrMensagem := TMensagemWhatsappController.Create;
          ObjMensagem   := TMensagemWhatsapp.Create;

          Try
            //Montar os dados no objeto
            ObjMensagem.id_zap            := 0;
            ObjMensagem.mensagem          := MensagemFormatada;
            ObjMensagem.url               := '';
            ObjMensagem.nomepessoa        := Trim(vNome);
            ObjMensagem.id_pessoa         := EdtCliente.EditValue;
            if FoneDigitado <> '' then
            ObjMensagem.fone              := FoneDigitado
            else
            ObjMensagem.fone              := FoneFormatado;
            ObjMensagem.status            := 'A';
            ObjMensagem.anexobase         := '';
            ObjMensagem.ext               := '';
            ObjMensagem.tipo              := 'M';
            ObjMensagem.token             := RecuperarToken;
            ObjMensagem.nomeinstancia     := TConeSul.Crypt('C',TSession.RAZAO);

            if ContrMensagem.GravarMensagem(ObjMensagem) then
            Result  := True;
          Finally
            FreeAndNil(ContrMensagem);
            FreeAndNil(ObjMensagem);
          End;

        end;

      end;

end;

Function TFrmRecpOrdemServico.RecuperarToken:string;
var
ModelVal : TValidacao;
Token    : String;
begin
  //validar instancia por funcionario
    result  := '';
    ModelVal      := TValidacao.create;
    Try
      if ModelVal.InstanciaPorFunc(TSession.IDEMPRESA) then
      begin
        //Por Funcionario
        if TConfiguracaoService.RetornoInstanciaWhatsAppFuncionario(token, TSession.ID_USUARIO) then
        Result      := Trim(Token);
      end
      else
      begin
        //Instancia por empresa
        if ModelVal.TokenWhatsapp(token,TSession.IDEMPRESA) then
        Result      := Trim(Token);
      end;
    Finally
      ModelVal.Free;
    End;

end;

Function TFrmRecpOrdemServico.GravarOSBase(out msg:string):Boolean;
var
Retemail:String;
begin
  //Gravar os Banco de dados
  Result          := False;
  ObjOrdem        := Nil;
  ControllerOrdem := Nil;

  ObjOrdem        := TOrdemServico.Create;
  ControllerOrdem := TOrdemServicoController.Create;

  Try

    ObjOrdem.id_os              := idOrdem;
    ObjOrdem.os_numero          := EdtNumero.EditValue;
    ObjOrdem.os_data            := edtdata.EditValue;
    ObjOrdem.os_hora            := edthora.EditValue;
    ObjOrdem.os_status          := edtstatus.Text;
    ObjOrdem.os_prioridade      := edtprioridade.Text;
    ObjOrdem.os_garantia        := edtgarantia.Text;
    ObjOrdem.os_tipo            := edttipoos.Text;
    ObjOrdem.os_id_cliente      := edtcliente.EditValue;
    ObjOrdem.os_id_tecnico      := edttecnico.EditValue;
    ObjOrdem.os_previsao        := edtprevisao.EditValue;
    ObjOrdem.os_garantia_final  := edtgarantiafinal.EditValue;
    ObjOrdem.os_obs             := Trim(edtobs.Text);

    Try
      if not ControllerOrdem.GravarOrdem(ObjOrdem, idOrdem) then
      begin
        msg := 'Erro ao gravar a ordem de serviço.';
        exit;
      end
      else
      begin
        msg     := 'Ordem de serviço gravada com sucesso.';
        Result  := True;

        Gravarequipamento;
        GravarFotoBase;
        GravarHistoricoEquipamento;

        if TConfiguracaoService.ValidarUsoWhatsApp(TSession.IDEMPRESA) and
        TConfiguracaoService.ValidarPessoaReceberWhatsApp(edtCliente.EditValue,Retemail) then
        EnviarMensagemWhatsApp;
      end;
    except on e:exception do
      begin
        msg   := 'Erro ao gravar os dados da ordem de serviço:'+#13+e.Message;
        raise Exception.Create(msg);
      end;
    End;

  Finally
    FreeAndNil(ObjOrdem);
    FreeAndNil(ControllerOrdem);
  End;


end;

Procedure TFrmRecpOrdemServico.LimparCampos;
begin
  edtObs.Clear;
  EdtPrevisao.EditValue         := now;
  EdtGarantiaFinal.EditValue    := now;
  //Limpar dados do equipamento.
  Edt_DescEquipamento.EditValue := 0;
  edtDefeito.Clear;
  edtestado.ItemIndex           := 4;
  LimparFlowPanel1;
end;

procedure TFrmRecpOrdemServico.LimparFlowPanel1;
var
  i: Integer;
begin
  // Percorre de trás pra frente para evitar erros ao remover
  for i := FlowPanel1.ControlCount - 1 downto 0 do
  begin
    FlowPanel1.Controls[i].Free;
  end;
end;

function TFrmRecpOrdemServico.Salvar(out msg: string): Boolean;
var
RetTelefone:String;
begin
  Result          := False;
  ObjOrdem        := Nil;
  ControllerOrdem := Nil;

  ObjOrdem        := TOrdemServico.Create;
  ControllerOrdem := TOrdemServicoController.Create;

  Try

    ObjOrdem.id_os              := idOrdem;
    ObjOrdem.os_numero          := EdtNumero.EditValue;
    ObjOrdem.os_data            := edtdata.EditValue;
    ObjOrdem.os_hora            := edthora.EditValue;
    ObjOrdem.os_status          := edtstatus.Text;
    ObjOrdem.os_prioridade      := edtprioridade.Text;
    ObjOrdem.os_garantia        := edtgarantia.Text;
    ObjOrdem.os_tipo            := edttipoos.Text;
    ObjOrdem.os_id_cliente      := edtcliente.EditValue;
    ObjOrdem.os_id_tecnico      := edttecnico.EditValue;
    ObjOrdem.os_previsao        := edtprevisao.EditValue;
    ObjOrdem.os_garantia_final  := edtgarantiafinal.EditValue;
    ObjOrdem.os_obs             := Trim(edtobs.Text);

    Try
      if not ControllerOrdem.GravarOrdem(ObjOrdem, idOrdem) then
      begin
        msg := 'Erro ao gravar a ordem de serviço.';
        exit;
      end
      else
      begin
        msg     := 'Ordem de serviço gravada com sucesso.';
        Result  := True;

        Gravarequipamento;
        GravarFotoBase;
        GravarHistoricoEquipamento;

        if TConfiguracaoService.ValidarUsoWhatsApp(TSession.IDEMPRESA) and
        TConfiguracaoService.ValidarPessoaReceberWhatsApp(edtCliente.EditValue,RetTelefone) then
        EnviarMensagemWhatsApp;
      end;
    except on e:exception do
      begin
        msg   := 'Erro ao gravar os dados da ordem de serviço:'+#13+e.Message;
        raise Exception.Create(msg);
      end;
    End;

  Finally
    FreeAndNil(ObjOrdem);
    FreeAndNil(ControllerOrdem);
  End;

end;

function TFrmRecpOrdemServico.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if (edtData.Text='') then
  begin
    msg     := 'Informe a data de entrada!';
    Result  := False;
    exit;
  end;

  if (EdtCliente.Text='') or (edtCliente.EditValue=0) then
  begin
    msg     := 'Selecione um cliente!';
    Result  := False;
    exit;
  end;

  if (EdtTecnico.Text='') or (edtTecnico.EditValue=0) then
  begin
    msg     := 'Selecione um técnico!';
    Result  := False;
    exit;
  end;


end;

procedure TFrmRecpOrdemServico.btnAnexoExcluirPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  //Excluir Anexo Selecionado
  if Assigned(ImgSelecionada) then
  begin
    // Remove o painel da imagem
    ImgSelecionada.Parent.Free;
    ImgSelecionada := nil;
  end
  else
    ShowMessage('Selecione uma imagem para excluir.');

end;

procedure TFrmRecpOrdemServico.btnAnexoNovoClick(Sender: TObject);
var
  Panel: TPanel;
  Img: TImage;
  BtnExcluir: TButton;
begin
  if OpenPictureDialog1.Execute then
  begin

    Panel                   := TPanel.Create(FlowPanel1);
    Panel.Parent            := FlowPanel1;
    Panel.Width             := 80;
    Panel.Height            := 80;
    Panel.BevelOuter        := bvNone;
    Panel.AlignWithMargins  := True;

    Img             := TImage.Create(Panel);
    Img.Parent      := Panel;
    Img.Align       := alClient;
    Img.AlignWithMargins  := true;
    Img.Height      := 80;
    Img.Cursor      := crHandPoint;
    Img.Stretch     := True;
    Img.Proportional:= True;
    Img.Transparent := False;
    Img.Picture.LoadFromFile(OpenPictureDialog1.FileName); // cuidado com erro se for inválido
    Img.Hint        := OpenPictureDialog1.FileName;//guarda o caminho da foto

    // Efeitos visuais
    Img.OnMouseEnter := ImgMouseEnter;
    Img.OnMouseLeave := ImgMouseLeave;
    Img.OnDblClick   := ImgDblClick;
    Img.OnClick      := ImgClick;

  end;
end;

procedure TFrmRecpOrdemServico.ImgMouseEnter(Sender: TObject);
begin
  if Sender is TImage then
    TPanel(TImage(Sender).Parent).BevelOuter := bvRaised;
  TImage(Sender).Cursor := crHandPoint;
end;

procedure TFrmRecpOrdemServico.ImgMouseLeave(Sender: TObject);
begin
  if Sender is TImage then
    TPanel(TImage(Sender).Parent).BevelOuter := bvNone;
end;

procedure TFrmRecpOrdemServico.ImgClick(Sender: TObject);
begin
  //selecionar para excluir
  if Sender is TImage then
  begin
    // Remove destaque anterior
    if Assigned(ImgSelecionada) then
    begin
      TPanel(ImgSelecionada.Parent).Color      := clBtnFace;
      TPanel(ImgSelecionada.Parent).BevelOuter := bvNone;
    end;

    // Define nova imagem selecionada
    ImgSelecionada := TImage(Sender);
    TPanel(ImgSelecionada.Parent).Color := $00FFD5A0; // cor clara tipo laranja
    TPanel(ImgSelecionada.Parent).BevelOuter := bvRaised; // adiciona relevo
  end;



  {if Sender is TImage then
  begin
    // Marca a nova imagem como selecionada
    if Assigned(ImgSelecionada) then
      TPanel(ImgSelecionada.Parent).Color := clBtnFace; // remove destaque anterior

    ImgSelecionada := TImage(Sender);
    TPanel(ImgSelecionada.Parent).Color := clSkyBlue; // destaque da imagem selecionada
  end;}


end;

procedure TFrmRecpOrdemServico.ImgDblClick(Sender: TObject);
var
  FilePath: string;
begin
  if Sender is TImage then
  begin
    FilePath        := TImage(Sender).Hint; // vamos usar Hint para guardar o caminho
    ShellExecute(0, 'open', PChar(FilePath), nil, nil, SW_SHOWNORMAL);
  end;
end;

procedure TFrmRecpOrdemServico.btnCancelarClick(Sender: TObject);
var
  msg:string;
begin
  //Aqui vamos chegar se a O.S esta ainda em rascunho e alertar o usuario
  ControllerOrdem := Nil;

  if lbrascunho.Tag = 1 then
  begin

    if JKDialog('Aviso', 'Ordem de serviço não foi salvo!'+#13+'Confirmar sair sem salvar os dados?', tdMensagem)  then
    begin

      ControllerOrdem     := TOrdemServicoController.Create;

      Try

        Try
          if ControllerOrdem.Excluir(idOrdem) then
          begin
            inherited;
          end;
        except on e:exception do
          begin
            JKDialog('Erro','Erro ao exclui o registro.'+#13+e.Message, tdAlerta);
          end;
        end;

      Finally
        ControllerOrdem.free;
      End;
    end;
  end
  else
  if lbrascunho.Tag = 0 then
  inherited;

end;

procedure TFrmRecpOrdemServico.BtnCliNovoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
msg:string;
Permissao   : TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Pessoa');

  if Permissao.TemPermissao('Permitir Criar Novo') then
  begin
    Try
      FrmPessoaCad             := TFrmPessoaCad.Create(Application);
      TNavigation.ParamInt    := 0;
      TNavigation.ParamsStr   := 'N';

      FrmPessoaCad.ShowModal;
    Finally
      ListaPessoa;
    End;

  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmRecpOrdemServico.BtnCliVisualizarPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  //Chama a tela de Pesquisa de Pessoa
  FrmPesquisaCliente            := TFrmPesquisaCliente.Create(Application);
  Try
    FrmPesquisaCliente.Origem     := 'Ordem';
    TNavigation.ParamOrdemInt          := 0;

    if FrmPesquisaCliente.ShowModal = mrOk then
    begin
      if TNavigation.ParamOrdemInt > 0 then
        edtCliente.EditValue := TNavigation.ParamOrdemInt;
    end;

  Finally
    FrmPesquisaCliente.Free;
  End;
end;

procedure TFrmRecpOrdemServico.BtnEquipNovoPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
msg:string;
Permissao   : TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Produto');

  if Permissao.TemPermissao('Permitir Criar Novo') then
  begin
    Try
      FrmProdutoCad           := TFrmProdutoCad.Create(Application);
      TNavigation.ParamInt    := 0;
      TNavigation.ParamsStr   := 'N';
      if (EdtCliente.EditValue> 0) or (edtCliente.Text <> '') then
      TNavigation.ParamsStrCompraOP := IntToStr(edtcliente.EditValue);

      FrmProdutoCad.ShowModal;
    Finally
      ListaEquipamento;
    End;

  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmRecpOrdemServico.btnSalvarClick(Sender: TObject);
var
msg:string;
begin

   if edtseguenciaequip.Checked= True then
   begin
    if not ValidarCampos(msg) then
    begin
      JKDialog('Aviso',msg, tdAlerta);
      exit;
    end;

    //Gravar os dados ja preenchido
    if not GravarOSBase(msg) then
    begin
      exit;
    end
    else
    begin
      lbrascunho.Tag    := 0;
      InserirOrdem;
      CarregarDadosOS;
      LimparCampos;
      Edtdata.SetFocus;
      lbrascunho.Tag    := 1;
    end;
   end
   else
    inherited;

end;

procedure TFrmRecpOrdemServico.BtnTecNovoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
msg:string;
Permissao   : TPermissaoUsuario;
begin
  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Funcionário');

  if Permissao.TemPermissao('Permitir Criar Novo') then
  begin
    Try
      FrmFuncionarioCad             := TFrmFuncionarioCad.Create(Application);
      TNavigation.ParamInt    := 0;
      TNavigation.ParamsStr   := 'N';

      FrmFuncionarioCad.ShowModal;
    Finally
      ListaTecnico;
    End;

  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

Procedure TFrmRecpOrdemServico.CarregarDadosOS;
begin
  ObjOrdem        := Nil;
  ControllerOrdem := Nil;

  ObjOrdem        := TOrdemServico.Create;
  ControllerOrdem := TOrdemServicoController.Create;

  Try
    ObjOrdem      := ControllerOrdem.BuscarPorId(idOrdem);

    if Assigned(ObjOrdem) then
    begin
      edtnumero.EditValue         := ObjOrdem.os_numero;
      edtdata.EditValue           := ObjOrdem.os_data;
      edthora.EditValue           := ObjOrdem.os_hora;
      edtstatus.Text              := ObjOrdem.os_status;
      edtPrioridade.Text          := ObjOrdem.os_prioridade;
      edtgarantia.Text            := ObjOrdem.os_garantia;
      edttipoos.Text              := ObjOrdem.os_tipo;
      edtPrevisao.EditValue       := ObjOrdem.os_previsao;
      Edtgarantiafinal.EditValue  := ObjOrdem.os_garantia_final;

      if edtseguenciaequip.Checked= True then
      begin
        EdtCliente.EditValue      := ObjOrdem.os_id_cliente;
        edttecnico.EditValue      := ObjOrdem.os_id_tecnico;
      end;

    end
    else
      JKDialog('Aviso','Não foi possivel carregar os dados.', tdAlerta);

  Finally
    FreeAndNil(ObjOrdem);
    FreeAndNil(ControllerOrdem);
  End;
end;

procedure TFrmRecpOrdemServico.edtClienteExit(Sender: TObject);
begin
  if Edtcliente.Text <>'' then
  begin
    ListaEquipamento;
  end;
end;

procedure TFrmRecpOrdemServico.edtClientePropertiesEditValueChanged(
  Sender: TObject);
var
  IdSelecionado: Variant;
begin
  IdSelecionado     := edtCliente.EditValue;

  if not VarIsNull(IdSelecionado) then
  begin
    // Localiza o cliente no ClientDataSet
    if Tabcliente.Locate('id_socio', IdSelecionado, []) then
    begin
      edtwhats.Text := Tabcliente.FieldByName('whatsapp').AsString;
    end
    else
      edtwhats.Clear;
  end
  else
    edtwhats.Clear;
end;

Function TFrmRecpOrdemServico.InserirOrdem:Boolean;
begin
  Result          := False;
  ObjOrdem        := Nil;
  ControllerOrdem := Nil;

  ObjOrdem        := TOrdemServico.Create;
  ControllerOrdem := TOrdemServicoController.Create;

  Try

    ObjOrdem.id_os              := 0;
    ObjOrdem.os_numero          := 0;
    ObjOrdem.os_data            := Now;
    ObjOrdem.os_hora            := time;
    ObjOrdem.os_status          := 'Em andamento';
    ObjOrdem.os_prioridade      := 'Média';
    ObjOrdem.os_garantia        := 'Não';
    ObjOrdem.os_tipo            := 'Orçamento';
    if edtseguenciaequip.Checked= True then
    ObjOrdem.os_id_cliente      := EdtCliente.EditValue
    else
    ObjOrdem.os_id_cliente      := -1;
    if edtseguenciaequip.Checked= True then
    ObjOrdem.os_id_tecnico      := edttecnico.EditValue
    else
    ObjOrdem.os_id_tecnico      := -1;
    ObjOrdem.os_previsao        := Now;
    ObjOrdem.os_garantia_final  := Now;
    ObjOrdem.id_empresa         := TSession.idempresa;
    ObjOrdem.id_usuario         := TSession.ID_USUARIO;

    if not ControllerOrdem.GravarOrdem(ObjOrdem, idOrdem) then
    Result  := False
    else
    Result  := True;

  Finally
    FreeAndNil(ObjOrdem);
    FreeAndNil(ControllerOrdem);
  End;

end;

Procedure TFrmRecpOrdemServico.ListaPessoa;
begin
  TLookupHelper.CarregarLookup(
                TabCliente,'Select DISTINCT                                             '+
                           ' s.id_socio,                                        '+
                           ' Concat(s.codigo,'' | '',s.nome,'' | '', s.cpf) as cliente, '+
                           ' s.cpf, s.whatsapp                                              '+
                           ' from socio s                                       '+
                           ' where situacao=''ATIVO'' and s.excluido=0                          '+
                           ' and (s.cliente =''S'' or s.fornecedor=''S'') order by s.nome ');
end;

Procedure TFrmRecpOrdemServico.ListaTecnico;
begin
  //Criar um campo para falar que ele e um tecnico
  TLookupHelper.CarregarLookup(TabVendedor, 'Select DISTINCT                                     '+
                           ' F.id_funcionario,                          '+
                           ' Concat(F.codigo,'' | '',F.nome) as Func,   '+
                           ' F.cpf                                      '+
                           ' From funcionario f                         '+
                           ' where id_funcionario >0                    '+
                           ' and ativo=''S''                          '+
                           ' and vendedor=''S'' order by Func');
end;

Procedure TFrmRecpOrdemServico.ListaEquipamento;
begin
  TLookupHelper.CarregarLookup(TabEquipamento,
         'Select                                                  '+
         ' p.id_produto, p.codigo, p.descricao,                   '+
         ' e.tipo_equipamento, e.numero_serie, e.num_patrimonio,  '+
         ' m.marca as nmmarca,                                    '+
         ' g.grupo as nmmodelo,                                    '+
         ' Concat(p.codigo,'' | '',e.numero_serie,'' | '',p.descricao,'' | '',g.grupo,'' | '',m.marca) as nmcompleto'+
         ' From Produto p                                         '+
         ' Inner Join produto_equipamento e                       '+
         ' on p.id_produto = e.id_produto                         '+
         ' Inner Join Marca m                                     '+
         ' on p.id_marca = m.id_marca                             '+
         ' Inner Join grupo g                                     '+
         ' on e.id_modelo = g.id_grupo                            '+
         ' where p.cad_produto=''E''                              '+
         ' and p.ativo=''S''                                      '+
         ' and p.excluido=0                                       '+
         ' and e.id_cliente='+ IntToStr(EdtCliente.EditValue));



end;

Procedure TFrmRecpOrdemServico.PreencherCampos;
begin
  Edtdata.EditValue         := Now;
  Edthora.EditValue         := Time;
  EdtStatus.ItemIndex       := 0;
  EdtPrioridade.ItemIndex   := 1;
  EdtGarantia.ItemIndex     := 1;
  edtTipoos.ItemIndex       := 0;
  EdtSeguenciaEquip.Checked := False;
  EdtEstado.ItemIndex       := 4;
end;

procedure TFrmRecpOrdemServico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
msg:string;
Permissao   : TPermissaoUsuario;
begin
  inherited;

  if key = vk_F2 then
  begin
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Produto');

    if Permissao.TemPermissao('Permitir Criar Novo') then
    begin
      Try
        FrmProdutoCad           := TFrmProdutoCad.Create(Application);
        TNavigation.ParamInt    := 0;
        TNavigation.ParamsStr   := 'N';
        if (EdtCliente.EditValue> 0) or (edtCliente.Text <> '') then
        TNavigation.ParamsStrCompraOP := IntToStr(edtcliente.EditValue);

        FrmProdutoCad.ShowModal;
      Finally
        ListaEquipamento;
      End;

    end
    else
      JKDialog('Acesso Negado',
               'O seu perfil não tem permissão para utilizar.' + sLineBreak +
               'Por favor, entre em contato com o administrador do sistema.',
               tdAlerta);
      key:=0;
  end;

  if key = vk_F3 then
  begin
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Pessoa');

    if Permissao.TemPermissao('Permitir Criar Novo') then
    begin
      Try

        //15/05/2025 Abrir cadastro de pessoa

          FrmPessoaCad            := TFrmPessoaCad.Create(Application);
          TNavigation.ParamInt    := 0;
          TNavigation.ParamsStr   := 'N';

          FrmPessoaCad.ShowModal;

      Finally
        ListaPessoa;
      End;
    end
    else
      JKDialog('Acesso Negado',
               'O seu perfil não tem permissão para utilizar.' + sLineBreak +
               'Por favor, entre em contato com o administrador do sistema.',
               tdAlerta);
    key:=0;
  end;

end;

procedure TFrmRecpOrdemServico.FormShow(Sender: TObject);
begin
  inherited;

  if TNavigation.ParamsStr='N' then
  begin
    if not InserirOrdem then
    begin
      JKDialog('Erro',
             'Não foi possivel iniciar uma nova ordem de serviço.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
      btncancelar.Click;
    end
    else
    begin
      PreencherCampos;
      ListaPessoa;
      ListaTecnico;
      CarregarDadosOS;
      Edtdata.SetFocus;
      lbrascunho.Tag  := 1; // Fica no modo edição novo.
    end;

  end;

end;

end.
