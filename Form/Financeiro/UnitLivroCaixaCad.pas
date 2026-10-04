unit UnitLivroCaixaCad;

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
  cxDateUtils, cxMaskEdit, cxDropDownEdit, cxCalendar, cxCurrencyEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxMemo, Data.DB, model.LivroCaixa;

type
  TFrmLivroCaixaCad = class(TFrmBaseCad)
    edtData: TcxDateEdit;
    edtOperacao: TcxComboBox;
    edtvalor: TcxCurrencyEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtCusto: TcxLookupComboBox;
    edtConta: TcxLookupComboBox;
    Label7: TLabel;
    edtHistorico: TcxMemo;
    Label8: TLabel;
    edtlancamento: TcxCheckBox;
    dsCusto: TDataSource;
    dsPlano: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure edtOperacaoPropertiesChange(Sender: TObject);
  private
    Procedure CarregarPlano;
    procedure CarregarCusto;

    { Private declarations }
  public
    procedure CarregarDados; override;
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;

    { Public declarations }
  end;

var
  FrmLivroCaixaCad: TFrmLivroCaixaCad;
  ModelLC         : TModelLivroCaixa;

implementation

{$R *.dfm}

uses Vcl.Navigation, UDM, Vcl.Validacoes, Vcl.Session;

{ TFrmLivroCaixaCad }

procedure TFrmLivroCaixaCad.CarregarDados;
var
msg:string;
begin
  inherited;

  ModelLC             := TModelLivroCaixa.Create;

  Try
    try
      if ModelLC.LocalizarID(msg, TNavigation.ParamInt) then
      begin

        //Popular com os dados
        edtCodigo.EditValue         := ModelLC.Codigo;
        edtData.EditValue           := ModelLC.DataLan;
        edtOperacao.Text            := ModelLC.Operacao;
        edtDescricao.EditValue      := ModelLC.DocNumero;
        edtvalor.EditValue          := ModelLC.Valor;
        edtCusto.EditValue          := ModelLC.IdCusto;
        edtConta.EditValue          := ModelLC.IdPlano;
        edtHistorico.EditValue      := ModelLC.Historico;

      end;

    Except on e:exception do
      begin
        msg := msg+' :'+e.Message;
        raise;
      end;
    end;

  Finally
    ModelLC.Free;
  End;

end;

procedure TFrmLivroCaixaCad.CarregarPlano;
begin
  Try
//    case edtoperacao.ItemIndex of
//      //0: dm.PopularPlanoConta('C');
//      //1: dm.PopularPlanoConta('D');
//    end;

  Except on e:exception do
   raise Exception.Create(e.Message);
  End;
end;

Procedure TFrmLivroCaixaCad.CarregarCusto;
begin
  Try
    //dm.PopularCentroCusto;
  except on e:exception do
    raise exception.Create(e.Message);
  End;
end;

procedure TFrmLivroCaixaCad.edtOperacaoPropertiesChange(Sender: TObject);
var
ModelVal  :TValidacao;
idc,idd,idcusto:integer;
begin
  inherited;
  CarregarPlano;

  //Popular plano de conta e centro de custo se houver configuração aplicada.
  ModelVal      := TValidacao.create;
  Try
    if ModelVal.LivroCaixaPlanoConfigurado(idc,idd,idcusto,TSession.IDEMPRESA) then
    begin
      edtCusto.EditValue      := idcusto;

      case edtOperacao.ItemIndex of
        0:edtConta.EditValue  := idc;
        1:edtConta.EditValue  := idd;
      end;
    end;
  Finally
    ModelVal.free;
  End;

end;

procedure TFrmLivroCaixaCad.FormShow(Sender: TObject);
begin
  inherited;
  CarregarCusto;

  if TNavigation.ParamsStr = 'V' then
  begin
    lblTitulo.Caption := 'Visualizando Livro Caixa';
    CarregarDados;
    cxGroupBox1.Enabled := False;
    btnSalvar.Enabled   := false;
    edtlancamento.Visible:= False;
  end
  else if TNavigation.ParamsStr = 'E' then
  begin
    lblTitulo.Caption := 'Editando Livro Caixa';
    edtlancamento.Visible:= False;
    CarregarDados;
    edtdata.SetFocus;
  end
  else if TNavigation.ParamsStr = 'N' then
  begin
    edtdata.EditValue := Now;
    edtdata.SetFocus;
  end;

end;

function TFrmLivroCaixaCad.Salvar(out msg: string): Boolean;
begin
  Result  := False;
  ModelLC             := TModelLivroCaixa.Create;

  Try
    try
      //Popular os campo para salvar

      ModelLC.DataLan     := EdtData.EditValue;
      ModelLC.Operacao    := edtoperacao.Text;
      ModelLC.DocNumero   := Trim(edtdescricao.text);

      case edtoperacao.ItemIndex of
      0:begin
          ModelLC.VlrEntrada  := edtvalor.EditValue;
          ModelLC.VlrSaida    := 0;
          ModelLC.Saldo       := 0;
        end;
      1:begin
          ModelLC.VlrEntrada  := 0;
          ModelLC.VlrSaida    := edtvalor.EditValue;
          ModelLC.Saldo       := 0;
        end;
      end;

      ModelLC.Historico   := trim(edthistorico.Text);
      ModelLC.Valor       := edtvalor.EditValue;
      ModelLC.IdPlano     := edtconta.EditValue;
      ModelLC.IdCusto     := edtcusto.EditValue;


      if TNavigation.ParamsStr='N' then
      begin
        if ModelLC.Novo(msg) then;
        Result  := True;
      end
      else
      begin
        ModelLC.idlivro  := TNavigation.ParamInt;
        if ModelLC.editar(msg) then;
        Result  := True;
      end;

    Except on e:exception do
      begin
        msg := msg+' :'+e.Message;
        raise;
      end;
    end;

  Finally
    ModelLC.Free;
  End;

end;

function TFrmLivroCaixaCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if (edtdata.Text ='') then
  begin
    msg     := 'Selecione uma data para o lançamento!';
    Result  := False;
    Exit;
  end;

  if edtoperacao.ItemIndex =-1 then
  begin
    msg     := 'Selecione um tipo de operação para o lançamento!';
    Result  := False;
    Exit;
  end;

  if edtDescricao.Text = '' then
  begin
    msg     := 'Informe um número para o lançamento!';
    Result  := False;
    Exit;
  end;

  if (edtvalor.EditValue=0) or (edtvalor.Text='') then
  begin
    msg     := 'Informe um valor para o lançamento!';
    Result  := False;
    Exit;
  end;

  if (edtCusto.EditValue=0) or (edtcusto.Text='') then
  begin
    msg     := 'Selecione um centro de custo!';
    Result  := False;
    Exit;
  end;

  if (edtconta.EditValue=0) or (edtconta.Text='') then
  begin
    msg     := 'Selecione um plano de conta!';
    Result  := False;
    Exit;
  end;

  if edthistorico.Text = '' then
  begin
    msg     := 'Informe um histórico para o lançamento!';
    Result  := False;
    Exit;
  end;

end;

end.
