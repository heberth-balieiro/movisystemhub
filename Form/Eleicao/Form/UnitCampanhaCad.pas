unit UnitCampanhaCad;

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
  Vcl.ComCtrls, dxCore, cxDateUtils, cxSpinEdit, cxTimeEdit, cxCalendar, cxMemo,
  Data.DB, DBAccess, Uni, Model.Campanha, ACBrBase, ACBrEnterTab, cxCheckBox,
  Vcl.Validacoes;

type
  TFrmCampanhaCad = class(TForm)
    lblTitulo: TLabel;
    Paneltitulo: TPanel;
    cxGroupBox1: TcxGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtCodigo: TcxTextEdit;
    edtdata1: TcxDateEdit;
    edtdata2: TcxDateEdit;
    edthora1: TcxTimeEdit;
    edthora2: TcxTimeEdit;
    edteleicao: TcxLookupComboBox;
    edtdetalhe: TcxMemo;
    Label8: TLabel;
    edtauditoria: TcxComboBox;
    Label9: TLabel;
    ds: TUniDataSource;
    ACBrEnterTab1: TACBrEnterTab;
    Label27: TLabel;
    edtPublicada: TLabel;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    edtApi: TcxCheckBox;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    procedure PopularEleicao;
    Function Salvar(out msg:string):Boolean;
    Function ValidarCampos(out msg:string):Boolean;
    Procedure CarregarDados;
    function ValidarEleicaoExit(out msg: string): boolean;
    { Private declarations }
  public
    key:string;
    { Public declarations }
  end;

var
  FrmCampanhaCad  : TFrmCampanhaCad;
  Campanha        : TModelCampanha;
implementation

{$R *.dfm}

uses UDM, Vcl.Session, UnitValidador, uJKDialog, uConfiguracaoService;

procedure TFrmCampanhaCad.btnCancelarClick(Sender: TObject);
begin
  TNavigation.Close(Self);
end;

procedure TFrmCampanhaCad.btnSalvarClick(Sender: TObject);
var
msg :String;
begin
  if ValidarCampos(msg) then
  begin
    Try
       if Salvar(msg) then
        begin
          JKDialog('Sucesso',msg, tdSucesso);
          TNavigation.Close(Self);
        end
        else
        JKDialog('Aviso',msg, tdAlerta);

    Except on e:exception do
      begin
        JKDialog('Aviso',msg+' :'+e.Message, tdAlerta);
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

procedure TFrmCampanhaCad.CarregarDados;
var
msg:string;
begin

  Try
    try
      Campanha              := TModelCampanha.Create;
      Campanha.idCampanha   := TNavigation.ParamInt;

      if Campanha.Select(msg) then
      begin
        edtcodigo.EditValue     := Campanha.codigo;
        edtdata1.EditValue      := Campanha.dataini;
        edthora1.EditValue      := Campanha.horaini;
        edtdata2.EditValue      := Campanha.datafinal;
        edthora2.EditValue      := Campanha.horafinal;
        if Campanha.auditoria = 'NÃO' then
        edtauditoria.ItemIndex            := 1
        else
        edtauditoria.ItemIndex            := 0;
        edteleicao.EditValue    := Campanha.ideleicao;
        edtdetalhe.Lines.Add(Campanha.detalhes);
        edtApi.EditValue        := campanha.fechamentoautomatico;
      end;

    Except on e:exception do
      begin
        msg := msg+' :'+e.Message;
        raise;
      end;
    end;
  Finally
    Campanha.Free;
  End;
end;

procedure TFrmCampanhaCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    //FrmValidador.Close;
    FrmCampanhaCad := nil;
end;

procedure TFrmCampanhaCad.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F10 then
  begin
    btnsalvar.Click;
    key:=0;
  end;

  if key = vk_escape then
  begin
    btncancelar.Click;
    key:=0;
  end;
end;

procedure TFrmCampanhaCad.FormShow(Sender: TObject);
begin
  PopularEleicao;

  if TNavigation.ParamsStr='V' then
  begin
    lblTitulo.Caption := 'Visualizando Campanha';
    CarregarDados;
    cxGroupBox1.Enabled := False;
    btnSalvar.Enabled   := false;
  end;

  if TNavigation.ParamsStr='E' then
  begin
    lblTitulo.Caption := 'Editando Campanha';
    ds.DataSet.Open;
    CarregarDados;
    edtdata1.SetFocus;
  end;

  if TNavigation.ParamsStr = 'N' then
  edtdata1.SetFocus;
end;

Procedure TFrmCampanhaCad.PopularEleicao;
var
msg:string;
begin
  //dm.PopularEleicao(msg);
end;

function TFrmCampanhaCad.Salvar(out msg: string): Boolean;
var
id:integer;

begin
  Result  := False;
  Try
    try
      Campanha           :=  TModelCampanha.Create;
      if edtcodigo.Text <> '' then
      Campanha.codigo   :=  edtCodigo.EditValue;
      Campanha.dataini  :=  edtdata1.EditValue;
      Campanha.horaini  :=  edthora1.EditValue;
      Campanha.datafinal:=  edtdata2.EditValue;
      Campanha.horafinal:=  edthora2.EditValue;
      Campanha.auditoria:=  edtauditoria.Text;
      Campanha.ideleicao:=  edteleicao.EditValue;
      Campanha.detalhes :=  edtdetalhe.Text;
      Campanha.idempresa:=  TSession.IDEMPRESA;
      Campanha.idusuario:=  TSession.ID_USUARIO;
      Campanha.publicada:= 'N';
      campanha.chaveKey := TNavigation.ParamsKey;
      
      campanha.fechamentoautomatico := edtapi.EditValue;

      if TNavigation.ParamsStr='N' then
      begin
        if Campanha.Insert(msg,id) then;
        Result  := True;
      end
      else
      begin
        Campanha.idCampanha := TNavigation.ParamInt;
        if Campanha.Update(msg) then;
        Result  := True;
      end;


        if TConfiguracaoService.ValidarUsoAppCarteira(TSession.idempresa) then
        begin
          try
            TConfiguracaoService.SincronizarGravar(12, 0);
          except on e:exception do
            begin
              msg   := 'Erro ao gravar registro para sincronizar:'+#13+e.Message;
              raise;
            end;
          end;
        end;



    Except on e:exception do
      begin
        msg := msg+' :'+e.Message;
        raise;
      end;
    end;
  Finally
    Campanha.Free;
  End;
end;

function TFrmCampanhaCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if (edtdata1.Date=null) or (edtdata2.Date=null) or (edthora1.EditValue=0) or (edthora2.EditValue=0) then
  begin
    msg     := 'Informe a data e hora de inicio e fim da campanha!';
    Result  := False;
    Exit;
  end;

  if edtEleicao.Text='' then
  begin
    msg     :='Selecione uma eleição!';
    result  := false;
    Exit;
  end;

  //Validar se a eleicao já esta criada

  if TNavigation.ParamsStr = 'N' then
  begin
    if ValidarEleicaoExit(msg) then
    begin
      result  := False;
      exit;
    end;
  end;


end;

Function TFrmCampanhaCad.ValidarEleicaoExit(out msg:string):boolean;
var
Model:TModelCampanha;
begin
  //ValidarRegistro
  Try
    Model         :=TModelCampanha.Create;

    Model.ideleicao := edteleicao.EditValue;
    if model.ValidarRegistro(msg) then
    result  := True
    else
    result  := False;

  Finally

  End;
end;
end.
