unit UnitPlanoContaCad;

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
  cxGroupBox, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Navigation, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Data.DB, UConeSul, UnitBaseNovoCadastro, DBAccess,
  Uni, dxBevel, Vcl.ButtonStylesAttributes, Vcl.StyledButton, cxStyles,
  cxGridTableView, cxClasses, Model.PlanoConta, Controller.PlanoContas,
  uJKDialog, Controller.LookupHelper, UnitGlobal, Vcl.Session, cxSpinEdit,
  Datasnap.DBClient;

type
  TDadosRecord = record
  AIDPai: Integer;
  AOrigem:String;
  ANivel:Integer;
  ATipo:String;
end;

type
  TFrmPlanoCad = class(TFormNovoBaseCadastro)
    Label1: TLabel;
    edtCodigo: TcxTextEdit;
    cxPai: TcxLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    cxDescricao: TcxTextEdit;
    cxnivel: TcxComboBox;
    cxAtivo: TcxCheckBox;
    cxaceita: TcxCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    cxtipo: TcxComboBox;
    Label6: TLabel;
    cxordem: TcxSpinEdit;
    Label7: TLabel;
    TabPlano: TClientDataSet;
    TabPlanoid_planoconta: TIntegerField;
    TabPlanocodigo: TStringField;
    TabPlanodescricao_completa: TStringField;
    TabPlanonivel: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);

  private
    FDados: TDadosRecord;
    { Private declarations }
  public
    { Public declarations }
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;

    property Dados: TDadosRecord read FDados write FDados;
  end;

var
  FrmPlanoCad: TFrmPlanoCad;
  ContPlano :TPlanoContaController;
  ObjPlano  :TModelPlanoconta;
implementation

{$R *.dfm}

{ TFrmPlanoCad }

procedure TFrmPlanoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmPlanoCad:= nil;
end;

procedure TFrmPlanoCad.FormShow(Sender: TObject);
begin
  inherited;
  Try
    TLookupHelper.CarregarLookup(
                  TabPlano,LookupPlanoContaSql);

    if ParamsStr = 'N' then
    begin
      TitleText   := 'Novo Cadastro de Plano de Contas';
      cxDescricao.SetFocus;
      cxaceita.Checked  := false;
      cxativo.Checked   := true;
      cxnivel.ItemIndex := 1;

      if dados.AOrigem = 'F' then
      begin
        cxPai.EditValue   := Dados.AIDPai;
        cxnivel.ItemIndex := dados.ANivel + 1;
        cxtipo.Text       := dados.ATipo;
        cxpai.Properties.ReadOnly   := true;
        cxnivel.Properties.ReadOnly := true;
        cxtipo.Properties.ReadOnly  := true;
        if cxnivel.ItemIndex=5 then
        cxnivel.Properties.ReadOnly := True
        else
        cxnivel.Properties.ReadOnly := False;

        ContPlano   := Nil;
        Try
          ContPlano := TPlanoContaController.Create;
          edtCodigo.EditValue   := ContPlano.GetNextPlanoContasCodigoByPai(Dados.AIDPai,dados.ATipo);
        Finally
          FreeandNil(ContPlano);
        End;
      end;

    end
    else
    begin
      TitleText   := 'Editar Cadastro de Plano de Contas';
      PopularCampos;
      cxDescricao.SetFocus;
    end;

  except on E: Exception do
    Begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    End;
  End;
end;

procedure TFrmPlanoCad.PopularCampos;
begin
  inherited;
  ContPlano  := Nil;
  ObjPlano   := Nil;
  try
    ContPlano :=TPlanoContaController.Create;
    ObjPlano  :=TModelPlanoconta.Create;

    Try
      if (ParamsInt=0) or (InttoStr(ParamsInt) = '') then
      raise Exception.Create('Nenhum ID passado no parâmetro.');

      ObjPlano    := ContPlano.BuscarPorID(ParamsInt);
      if Assigned(ObjPlano) then
      begin
        edtCodigo.EditValue   := ObjPlano.Codigo;
        cxDescricao.EditValue := Trim(ObjPlano.Descricao);
        cxPai.EditValue       := ObjPlano.id_pai;
        cxnivel.ItemIndex     := ObjPlano.nivel;
        cxtipo.EditValue      := ObjPlano.tipo;
        cxordem.EditValue     := ObjPlano.ordem;
        cxaceita.EditValue    := ObjPlano.aceita;
        cxAtivo.EditValue     := ObjPlano.Ativo;

        if ObjPlano.nivel >= 1 then
        begin
          cxtipo.Properties.ReadOnly  := True;
          cxnivel.Properties.ReadOnly := True;
          cxPai.Properties.ReadOnly   := True;
        end;

      end;
    Finally
      FreeAndNil(ContPlano);
      FreeAndNil(ObjPlano);
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmPlanoCad.Salvar(out msg: string): Boolean;
var
AId:Integer;
begin
  try
    Result     := False;
    ContPlano  := nil;
    ObjPlano   := nil;

    ContPlano  := TPlanoContaController.Create;
    ObjPlano   :=TModelPlanoconta.Create;

    Try
      if ParamsStr='N' then
      ObjPlano.Id_PlanoConta    := 0
      else
      ObjPlano.Id_PlanoConta    := ParamsInt;
      ObjPlano.Codigo           := edtcodigo.Text;
      ObjPlano.Descricao        := Trim(cxdescricao.Text);
      ObjPlano.id_pai           := cxPai.EditValue;
      ObjPlano.SaldoInicial     := 0;
      ObjPlano.Id_Usuario       := Tsession.ID_USUARIO;
      ObjPlano.Id_Empresa       := TSession.IDEMPRESA;
      ObjPlano.Ativo            := cxativo.EditValue;

      ObjPlano.nivel            := cxnivel.ItemIndex;
      ObjPlano.tipo             := cxtipo.Text;
      ObjPlano.aceita           := cxaceita.EditValue;
      ObjPlano.ordem            := cxordem.EditValue;

      if ParamsStr='E' then
      begin
        ObjPlano.Data_Alteracao   := Now;
        ObjPlano.Id_Usuario_Alt   := TSession.id_usuario;
      end;


      if ContPlano.Salvar(ObjPlano, AId) then
      begin
        if AID = 0 then
        AID     := ParamsInt;
        msg     := 'Registro salvo com sucesso, ID: '+IntToStr(AID);
        Result  := true;
        ParamsCloseTela := 'S';
      end;

    Finally
      FreeAndNil(ContPlano);
      FreeAndNil(ObjPlano);
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmPlanoCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  Try

    if cxdescricao.Text='' then
    begin
      msg   := 'Informe uma descrição!';
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

