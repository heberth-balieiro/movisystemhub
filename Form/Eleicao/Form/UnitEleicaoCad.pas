{

 | Tipo         | Comportamento                                                              |
| ------------ | -------------------------------------------------------------------------- |
| `CHAPA`      | eleitor escolhe uma chapa completa                                         |
| `PRESIDENTE` | eleitor escolhe um candidato individual                                    |
| `COMISSAO`   | eleitor pode escolher membros/candidatos para uma comissão                 |
| `CONSELHO`   | semelhante à comissão, normalmente com quantidade máxima de escolhas       |
| `MISTA`      | mesma eleição possui votação por chapa **e** votação individual/por cargos |

}

unit UnitEleicaoCad;

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
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, cxMemo,DateUtils, ACBrBase,
  ACBrEnterTab, cxCheckBox, cxRadioGroup, Vcl.Validacoes,
  UnitBaseNovoCadastro, Vcl.ButtonStylesAttributes, Data.DB, DBAccess, Uni,
  Vcl.StyledButton, dxBevel, cxStyles, cxGridTableView, cxClasses, cxSpinEdit,
  Datasnap.DBClient,
  Model.Eleicao, Controller.Eleicao, Controller.LookupHelper, UnitGlobal,
  UConeSul,Model.EleicaoConfig, Controller.EleicaoConfig;

type
  TFrmEleicaoCad = class(TFormNovoBaseCadastro)
    Label20: TLabel;
    cxCodigo: TcxTextEdit;
    Label22: TLabel;
    cxdescricao: TcxTextEdit;
    cxtipo: TcxComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cxempresa: TcxLookupComboBox;
    BtnSede: TcxButtonEdit;
    cxstatus: TcxComboBox;
    cxobs: TcxBlobEdit;
    cxresponsavel: TcxLookupComboBox;
    cxanoinicial: TcxSpinEdit;
    cxanofinal: TcxSpinEdit;
    Label8: TLabel;
    dsUsuario: TUniDataSource;
    TabUsuario: TClientDataSet;
    TabUsuarioid_usuario: TIntegerField;
    TabUsuarionome: TStringField;
    TabUsuariologin: TStringField;
    TabUsuariosenha: TStringField;
    TabUsuarioid_funcionario: TIntegerField;
    TabSede: TClientDataSet;
    TabSedeid_sede: TIntegerField;
    TabSederazao: TStringField;
    TabSedefantasia: TStringField;
    TabSedecnpj: TStringField;
    TabSedecelular: TStringField;
    TabSedesedeprincipal: TStringField;
    TabSedensede: TStringField;
    cxAtivo: TcxCheckBox;
    cxDateEleicao: TcxDateEdit;
    Label9: TLabel;
    cxoperacao: TcxComboBox;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cxoperacaoPropertiesChange(Sender: TObject);
  private
    Procedure GravarConfig(AID:Integer);
    { Private declarations }
  public
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;
    { Public declarations }
  end;

var
  FrmEleicaoCad: TFrmEleicaoCad;
  ObjEleicao  : TModelEleicao;
  Conteleicao : TEleicaoController;

  ObjConfig :TModelEleicaoConfig;

implementation

{$R *.dfm}

Uses Vcl.Session, uJKDialog, uConfiguracaoService;

{ TFrmeleicaoCad }

procedure TFrmEleicaoCad.cxoperacaoPropertiesChange(Sender: TObject);
begin
  if cxoperacao.ItemIndex=1 then
  begin
    cxtipo.Properties.ReadOnly  := True;
    cxtipo.ItemIndex  := 0;
  end
  else
  cxtipo.Properties.ReadOnly  := False;

end;

procedure TFrmEleicaoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmeleicaoCad := nil;
end;

procedure TFrmEleicaoCad.FormShow(Sender: TObject);
begin
  inherited;
  //Tipo vamos deixar por chapa para depois implementar o restante
  cxtipo.ItemIndex  := 0;

  Try
    TLookupHelper.CarregarLookup(
                  TabSede,LookupSedeSql);

    TLookupHelper.CarregarLookup(
                  TabUsuario,LookupUsuarioLoginSql);

    if ParamsStr = 'N' then
    begin
      TitleText   := 'Nova Eleição/Assembleias';
      cxstatus.ItemIndex      := 0;
      //cxdata.EditValue    := date;
      cxDateEleicao.editvalue := date;
      cxresponsavel.EditValue := Tsession.ID_USUARIO;
      cxanoinicial.EditValue  := YearOf(date);
      cxanofinal.EditValue    := YearOf(date);
      Cxdescricao.SetFocus;
    end
    else
    begin
      TitleText   := 'Editar Eleição/Assembleia';
      cxdescricao.SetFocus;
      PopularCampos;
    end;

  except on E: Exception do
    Begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    End;
  End;
end;

procedure TFrmEleicaoCad.GravarConfig(AID: Integer);
var
AIDRet:integer;
begin
  ObjConfig    := nil;

  try
    ObjConfig  := TModelEleicaoConfig.Create;

    Try
      ObjConfig.IdConfig                    := 0;
      ObjConfig.IdEleicao                   := AID;
      ObjConfig.SituacaoInicial             := 'RASCUNHO';
      ObjConfig.ExigeHomologacaoFinal       := 'N';
      ObjConfig.PublicacaoAutomatica        := 'N';
      ObjConfig.ExigeAssociadoAtivo         := 'N';
      ObjConfig.ExigeAssociadoAdimplente    := 'N';
      ObjConfig.exige_tempo_minimo          := 'N';
      ObjConfig.TempoMinimoFiliacao         := 0;
      ObjConfig.BloqueiaPendenciaFinanceira := 'N';
      ObjConfig.BloqueiaAssociadoSuspenso   := 'N';
      ObjConfig.gerar_eleitores_aptos       := 'S';
      ObjConfig.data_hora_inicio            := now;
      ObjConfig.data_hora_fim               := now;
      ObjConfig.sinc_app                    := 'N';


      ObjConfig.idusuario                   := TSession.ID_USUARIO;
      ObjConfig.idempresa                   := TSession.IDEMPRESA;

      if TEleicaoConfigController.Salvar(ObjConfig, AIDRet) then

    Finally
      FreeAndNil(ObjConfig);
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmEleicaoCad.PopularCampos;
begin
  inherited;
  Conteleicao  := Nil;
  ObjEleicao   := Nil;
  try
    ObjEleicao  := TModelEleicao.Create;
    Conteleicao := TEleicaoController.create;

    Try
      if (ParamsInt=0) or (InttoStr(ParamsInt) = '') then
      raise Exception.Create('Nenhum ID passado no parâmetro.');

      ObjEleicao    := Conteleicao.BuscarPorID(ParamsInt);
      if Assigned(ObjEleicao) then
      begin
        cxcodigo.EditValue      := ObjEleicao.codigo;
        cxdescricao.EditValue   := ObjEleicao.nome;
        cxtipo.Text             := ObjEleicao.tipo;
        cxempresa.EditValue     := ObjEleicao.id_sede;
        cxanoinicial.EditValue  := ObjEleicao.ano;
        cxanofinal.EditValue    := ObjEleicao.ano_fim;
        //cxdata.EditValue        := ObjEleicao.data_cad;
        cxresponsavel.EditValue := ObjEleicao.id_responsavel;
        cxstatus.EditValue      := ObjEleicao.situacao;
        cxobs.EditValue         := ObjEleicao.descricao;
        cxativo.EditValue       := ObjEleicao.ativo;
        cxDateEleicao.editvalue := objeleicao.data;
        cxoperacao.EditValue    := ObjEleicao.operacao;
      end;

    Finally
      FreeAndNil(Conteleicao);
      FreeAndNil(ObjEleicao);
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmEleicaoCad.Salvar(out msg: string): Boolean;
var
AId:Integer;
begin
  Result       := False;
  Conteleicao  := nil;
  ObjEleicao   := nil;

  try
    ObjEleicao  := TModelEleicao.Create;
    Conteleicao := TEleicaoController.create;

    Try
      if ParamsStr='N' then
      ObjEleicao.id_eleicao     := 0
      else
      ObjEleicao.id_eleicao     := ParamsInt;
      ObjEleicao.nome           := Trim(cxdescricao.Text);
      ObjEleicao.descricao      := Trim(cxobs.Text);
      ObjEleicao.id_empresa     := TSession.IDEMPRESA;
      ObjEleicao.id_sede        := cxempresa.EditValue;
      ObjEleicao.ano            := cxanoinicial.EditValue;
      ObjEleicao.ano_fim        := cxanofinal.EditValue;
      ObjEleicao.data_cad       := date;
      ObjEleicao.ativo          := cxativo.EditValue;
      ObjEleicao.tipo           := cxtipo.Text;
      ObjEleicao.sinc_app       := 'N';
      ObjEleicao.id_responsavel := cxresponsavel.EditValue;
      ObjEleicao.situacao       := cxstatus.Text;
      objeleicao.data           := cxDateEleicao.editvalue;
      Objeleicao.operacao       := cxoperacao.Text;

      if Conteleicao.Salvar(ObjEleicao, AId) then
      begin
        if AID = 0 then
        AID     := ParamsInt;

        if ParamsStr='N' then
        GravarConfig(AID);

        msg     := 'Registro salvo com sucesso, ID: '+IntToStr(AID);
        Result  := true;
        ParamsCloseTela := 'S';
      end;

    Finally
      FreeAndNil(Conteleicao);
      FreeAndNil(ObjEleicao);
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmEleicaoCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  Try
    if cxDescricao.Text = '' then
    begin
      msg   := 'Informe uma descrição!';
      result:= False;
      exit;
    end;

    if cxtipo.ItemIndex=-1 then
    begin
      msg   := 'Selecione o tipo da eleição!';
      result:= False;
      exit;
    end;

    if (cxempresa.Text= '') or (cxempresa.EditValue=0) then
    begin
      msg   := 'Selecione uma entidade!';
      result:= False;
      exit;
    end;

    if (cxresponsavel.Text='') or (cxresponsavel.EditValue=0) then
    begin
      msg   := 'Selecione um responsável!';
      result:= False;
      exit;
    end;

  except on E: Exception do
    Begin
      JKDialog('Erro','Ocorreu um erro ao validar os campos:'+#13+e.Message, tderro);
    End;
  End;
end;

end.



