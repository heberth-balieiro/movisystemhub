unit UBaixaReceber;

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
  cxCheckBox, ACBrBase, ACBrEnterTab, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.Menus, cxButtons,
  cxCurrencyEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar,
  Controller.Receber, Model.Receber, System.Generics.Collections,
  Datasnap.DBClient, DBAccess, Uni;

type
  TFrmBaixaReceber = class(TForm)
    lblTitulo: TLabel;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    Paneltitulo: TPanel;
    cxGroupBox1: TcxGroupBox;
    ACBrEnterTab1: TACBrEnterTab;
    cxGridTitulos: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGroupBox2: TcxGroupBox;
    cxbuttonIncluir: TcxButton;
    cxButtonLimpar: TcxButton;
    edtvalortotal: TcxCurrencyEdit;
    cxCurrencyEdit1: TcxCurrencyEdit;
    cxCurrencyEdit2: TcxCurrencyEdit;
    cxGroupBox3: TcxGroupBox;
    EdtEstado: TcxComboBox;
    edtDataemissao: TcxDateEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxGrid1: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    TabTitulos: TClientDataSet;
    TabTitulosid_receber: TIntegerField;
    TabTitulosdata_lancamento: TDateField;
    TabTitulosdata_vencimento: TDateField;
    TabTitulosnumero_titulo: TStringField;
    TabTitulosnumparcela: TStringField;
    TabTitulosvalor_original: TCurrencyField;
    TabTituloshistorico: TStringField;
    TabTitulosnmpessoa: TStringField;
    TabTitulosid_pessoa: TIntegerField;
    TabTitulosnmdocumento: TStringField;
    TabTitulosatraso: TIntegerField;
    TabTitulosvlrjuros: TCurrencyField;
    TabTitulosvlrmulta: TCurrencyField;
    DsTitulo: TUniDataSource;
    cxGridDBTableView1id_receber: TcxGridDBColumn;
    cxGridDBTableView1data_lancamento: TcxGridDBColumn;
    cxGridDBTableView1data_vencimento: TcxGridDBColumn;
    cxGridDBTableView1numero_titulo: TcxGridDBColumn;
    cxGridDBTableView1valor_original: TcxGridDBColumn;
    cxGridDBTableView1historico: TcxGridDBColumn;
    cxGridDBTableView1nmpessoa: TcxGridDBColumn;
    cxGridDBTableView1id_pessoa: TcxGridDBColumn;
    cxGridDBTableView1nmdocumento: TcxGridDBColumn;
    cxGridDBTableView1atraso: TcxGridDBColumn;
    cxGridDBTableView1vlrjuros: TcxGridDBColumn;
    cxGridDBTableView1vlrmulta: TcxGridDBColumn;
    cxGridDBTableView1Parcial: TcxGridDBColumn;
    cxGridDBTableView1totalrecebido: TcxGridDBColumn;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public

    function Salvar(out msg: string): Boolean;
    function ValidarCampos(out msg: string): Boolean;
    procedure CarregarDados;
    { Public declarations }
  end;

var
  FrmBaixaReceber : TFrmBaixaReceber;
  ControlReceber  : TReceberController;

implementation

{$R *.dfm}

Uses Udm, Vcl.Session, uJKDialog;

procedure TFrmBaixaReceber.CarregarDados;
var
  RecList: TObjectList<TReceber>;
begin
  ControlReceber    := Nil;

  ControlReceber    := TReceberController.Create;

  Try
    RecList         := ControlReceber.ListarBaixa(TNavigation.ParamsStrList);

    if (RecList = nil) or (RecList.Count = 0) then
    begin
      JKDialog('Aviso','Nenhum registro encontrado!', tdAlerta);
      exit;
    end;

    Try
      for var Item in RecList do
      begin
        TabTitulos.Append;
        TabTitulosid_receber.AsInteger      := Item.Id_receber;
        TabTitulosdata_lancamento.AsDateTime:= Item.Data_lancamento;
        TabTitulosdata_vencimento.AsDateTime:= Item.Data_vencimento;
        TabTitulosnumero_titulo.AsString    := Item.Numero_titulo;
        TabTitulosnumparcela.AsString       := Item.numparcela;
        TabTitulosvalor_original.AsCurrency := Item.Valor_original;
        TabTituloshistorico.AsString        := Item.Historico;
        TabTitulosnmpessoa.AsString         := Item.nmpessoa;
        TabTitulosid_pessoa.AsInteger       := Item.Id_pessoa;
        TabTitulosnmdocumento.AsString      := Item.nmdocumento;
        TabTitulosatraso.AsInteger          := 0;//Item.atraso;
        TabTitulosvlrjuros.AsCurrency       := 0;//Item.vlrjuros;
        TabTitulosvlrmulta.AsCurrency       := 0;//Item.vlrmulta;

        TabTitulos.Post;
      end;
      TabTitulos.First;
    Finally
      RecList.Free;
    End;

  Finally
    FreeAndNil(ControlReceber);
  End;
end;

procedure TFrmBaixaReceber.btnCancelarClick(Sender: TObject);
begin
  TNavigation.Close(Self);
end;

procedure TFrmBaixaReceber.btnSalvarClick(Sender: TObject);
var
msg :String;
begin
  //
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

procedure TFrmBaixaReceber.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action          := TCloseAction.caFree;
    FrmBaixaReceber := nil;

end;

procedure TFrmBaixaReceber.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_f5 then
  begin
    btnsalvar.Click;
    key:=0;
  end;

  if key = VK_ESCAPE then
  begin
    btncancelar.Click;
    key:=0;
  end;
end;

procedure TFrmBaixaReceber.FormShow(Sender: TObject);
begin
  CarregarDados;
end;

function TFrmBaixaReceber.Salvar(out msg: string): Boolean;
begin

end;

function TFrmBaixaReceber.ValidarCampos(out msg: string): Boolean;
begin

end;

end.
