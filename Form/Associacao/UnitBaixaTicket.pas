unit UnitBaixaTicket;

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
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, dxGDIPlusClasses, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxDropDownEdit, cxTextEdit, cxMaskEdit, cxCalendar,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, cxCurrencyEdit,
  cxBlobEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, DBAccess, Uni,
  cxCheckBox;

type
  TFrmBaixaTicket = class(TFrmBaseOperacoes)
    pHeader: TPanel;
    pBusca: TPanel;
    pPesquisa: TPanel;
    btnBusca: TSpeedButton;
    edtBusca: TEdit;
    pLimpar: TPanel;
    btnLimpar: TSpeedButton;
    data1: TcxDateEdit;
    data2: TcxDateEdit;
    EdtFiltro: TcxComboBox;
    cxGrid: TcxGrid;
    Grid: TcxGridDBTableView;
    Gridemissao: TcxGridDBColumn;
    Griddesconto: TcxGridDBColumn;
    Gridpagamento: TcxGridDBColumn;
    Gridticket: TcxGridDBColumn;
    Gridsocio: TcxGridDBColumn;
    Gridconvenio: TcxGridDBColumn;
    GridSituacao: TcxGridDBColumn;
    Gridvalor: TcxGridDBColumn;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    dsTicket: TUniDataSource;
    GridSelecao: TcxGridDBColumn;
    edtpagamento: TcxDateEdit;
    Label32: TLabel;
    edtobs: TcxBlobEdit;
    Label1: TLabel;
    GridVlrPago: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure GridSelecaoPropertiesEditValueChanged(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    Function ValidarSelecao(out msg:string):Boolean;
    { Private declarations }
  public
    function Salvar(out msg: string): Boolean; override;
    { Public declarations }
  end;

var
  FrmBaixaTicket: TFrmBaixaTicket;

implementation

{$R *.dfm}

uses System.DateUtils, Model.Tickets_old, uJKDialog, UDM,
  Vcl.Navigation, Vcl.Session;

procedure TFrmBaixaTicket.btnBuscaClick(Sender: TObject);
var
Model : TModelticket;
begin
  inherited;

  Model   := TModelticket.Create;
    Try
      Try
        if Model.LocalizarBaixa(trim(edtBusca.Text),EdtFiltro.ItemIndex, data1.date, data2.date) then
      Except on e:exception do
        begin
          JKDialog('Erro','Erro ao pesquisar ticket: '+e.Message, tdErro);
          raise;
        end;
      End;

    Finally
      FreeAndNil(Model);
    End;
end;

procedure TFrmBaixaTicket.btnLimparClick(Sender: TObject);
begin
  inherited;
  dsticket.DataSet.Close;
  edtbusca.Clear;
  data1.EditValue := StartOfTheMonth(date);
  data2.EditValue := EndOfTheMonth(date);
  edtbusca.SetFocus;
  edtFiltro.ItemIndex := 0;
end;

procedure TFrmBaixaTicket.btnSalvarClick(Sender: TObject);
var
msg :String;
begin
  //
  if ValidarSelecao(msg) then
  begin
    Try
       if Salvar(msg) then
        begin
          JKDialog('Sucesso',msg, tdSucesso);

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

procedure TFrmBaixaTicket.FormShow(Sender: TObject);
begin
  inherited;
  self.SetFocus;
  data1.EditValue := StartOfTheMonth(date);
  data2.EditValue := EndOfTheMonth(date);
  edtpagamento.EditValue  := date;
  edtbusca.SetFocus;
end;

procedure TFrmBaixaTicket.GridSelecaoPropertiesEditValueChanged(
  Sender: TObject);
var
  GridView: TcxGridDBTableView;
  FocusedRecord: TcxCustomGridRecord;
  ACheckBoxValue: Variant;
  ColumnIndex: Integer;
begin
  inherited;
  //if not (Sender is TcxGridDBTableView) then Exit;
 {
  GridView := TcxGridDBTableView(Sender);
  FocusedRecord := GridView.Controller.FocusedRecord;

  if (FocusedRecord = nil) or (Dm.TabConsTicketBaixa.IsEmpty) then Exit;

  // Obtém o índice da coluna "selecao"
  ColumnIndex := GridView.GetColumnByFieldName('selecao').Index;

  // Obtém o valor da célula selecionada corretamente
  ACheckBoxValue := FocusedRecord.Values[ColumnIndex];

  if not (Dm.TabConsTicketBaixa.State in [dsEdit, dsInsert]) then
    Dm.TabConsTicketBaixa.Edit;

  if ACheckBoxValue = True then
  begin
    Dm.TabConsTicketBaixa.FieldByName('selecao').AsString := 'True';
    Dm.TabConsTicketBaixa.FieldByName('vlrpago').AsFloat :=
    Dm.TabConsTicketBaixa.FieldByName('valor_ticket').AsFloat;
  end
  else
  begin
    Dm.TabConsTicketBaixa.FieldByName('selecao').AsString := 'False';
    Dm.TabConsTicketBaixa.FieldByName('vlrpago').AsFloat := 0;
  end;
  // Salva a alteração
  Dm.TabConsTicketBaixa.Post; }
end;

function TFrmBaixaTicket.Salvar(out msg: string): Boolean;
var
Model : TModelticket;
begin
//
  result  := False;


  Model   := TModelticket.Create;
    Try
      Try
        Dm.TabConsTicketBaixa.DisableControls;
        try
          Dm.TabConsTicketBaixa.First;
          while not Dm.TabConsTicketBaixa.Eof do
          begin
            if Dm.TabConsTicketBaixa.FieldByName('selecao').AsString = 'True' then
            begin
              model.RegistratBaixa(Dm.TabConsTicketBaixa.FieldByName('id_ticket').AsInteger,
                                  Dm.TabConsTicketBaixa.FieldByName('id_socio').AsInteger,
                                  Tsession.ID_USUARIO,
                                  edtpagamento.Date,
                                  Trim(edtobs.Text),
                                  Dm.TabConsTicketBaixa.FieldByName('vlrpago').AsFloat,
                                  Dm.TabConsTicketBaixa.FieldByName('valor_ticket').AsFloat,
                                  Time()
                                  );
            end;
            Dm.TabConsTicketBaixa.Next;
          end;
        finally
          result  := True;
          msg := 'Ticket baixado e registrado!';
          btnbusca.Click;
          edtobs.Clear;
          Dm.TabConsTicketBaixa.EnableControls;
        end;

      Except on e:exception do
        begin
          JKDialog('Erro','Erro ao baixar ticket: '+e.Message, tdErro);
          raise;
        end;
      End;

    Finally
      FreeAndNil(Model);
    End;

end;

function TFrmBaixaTicket.ValidarSelecao(out msg: string): Boolean;
var
I:integer;
begin
  Result  := False;
  Msg     := 'Nenhum ticket selecionado!';

  if (Dm.TabConsTicketBaixa.Active) and (not Dm.TabConsTicketBaixa.IsEmpty) then
  begin
    Dm.TabConsTicketBaixa.DisableControls;
    Dm.TabConsTicketBaixa.First;
    Try
      while not Dm.TabConsTicketBaixa.Eof do
      begin
        if Dm.TabConsTicketBaixa.FieldByName('selecao').AsString = 'True' then
        begin
          Result := True;
          msg := '';  // Limpa a mensagem, pois encontrou um selecionado
          Break;  // Sai do loop, pois não precisa mais verificar
        end;
        Dm.TabConsTicketBaixa.Next;
      end;

    Finally
      Dm.TabConsTicketBaixa.First;
      Dm.TabConsTicketBaixa.EnableControls;
    End;

  end;

  if (edtpagamento.Text='') then
  begin
    Result  := False;
    msg     := 'Informe a data de pagamento!';
    exit;
  end;


end;

end.
