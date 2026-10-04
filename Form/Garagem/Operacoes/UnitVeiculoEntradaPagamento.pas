unit UnitVeiculoEntradaPagamento;


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
  cxCurrencyEdit, cxMemo, ACBrBase, ACBrEnterTab, cxCheckBox, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxCalendar, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.Menus, cxButtons,
  DBAccess, Uni, Datasnap.DBClient, cxSpinEdit;

type
  TFrmEntradaVeiculoPagamento = class(TForm)
    lblTitulo: TLabel;
    Paneltitulo: TPanel;
    cxGroupBox1: TcxGroupBox;
    ACBrEnter: TACBrEnterTab;
    Panelcancelar: TPanel;
    btnCancelar: TSpeedButton;
    PanelIncluir: TPanel;
    btnIncluir: TSpeedButton;
    cxGrid: TcxGrid;
    cxGridDB: TcxGridDBTableView;
    cxGridDocumento: TcxGridDBColumn;
    cxgriVlrParcela: TcxGridDBColumn;
    cxgridVencimento: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGroupBox2: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnInserirDados: TcxButton;
    btnExcluir: TcxButton;
    edtsubtotal: TcxCurrencyEdit;
    EdtTotal: TcxCurrencyEdit;
    edtpagamento: TcxLookupComboBox;
    edtqtde: TcxCurrencyEdit;
    Label5: TLabel;
    edtObs: TcxBlobEdit;
    dsDoc: TUniDataSource;
    dsPrazo: TUniDataSource;
    TabPagamento: TClientDataSet;
    TabPagamentoidcompra: TIntegerField;
    TabPagamentoid_prazo: TIntegerField;
    TabPagamentoprazo: TStringField;
    TabPagamentovalor: TCurrencyField;
    TabPagamentodatapagamento: TDateField;
    TabPagamentoparcelado: TStringField;
    TabPagamentonumeroparcelas: TIntegerField;
    TabPagamentogerarfinanceiro: TStringField;
    TabPagamentoobs: TStringField;
    TabPagamentostatusfin: TStringField;
    edtData: TcxDateEdit;
    Label6: TLabel;
    cxGridDBData: TcxGridDBColumn;
    Label10: TLabel;
    edtCadPrazo: TcxButtonEdit;
    edtentrada: TcxCurrencyEdit;
    Label7: TLabel;
    edtIntervalo: TcxSpinEdit;
    Label8: TLabel;
    cxGridDBNumero: TcxGridDBColumn;
    TabDocumento: TClientDataSet;
    TabDocumentoid_documento: TIntegerField;
    TabDocumentocodigo: TIntegerField;
    TabDocumentodescricao: TStringField;
    TabDocumentoncompleto: TStringField;
    TabPagamentodata_vencimento: TDateField;
    TabPagamentonumero_doc: TStringField;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnInserirDadosClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtentradaExit(Sender: TObject);
    
  private

    function ValidarCampos(out msg: string): Boolean;
    function Salvar(out msg: string): Boolean;
    procedure CarregarDocumento;
    procedure AtualizarTotal;
    { Private declarations }
  public
    idCompra:integer;
    numerocontrato:integer;

    var Subtotal : Double;
    var Total    : Double;
    { Public declarations }
  end;

var
  FrmEntradaVeiculoPagamento: TFrmEntradaVeiculoPagamento;

implementation

{$R *.dfm}

Uses Model.Compra, Vcl.Loading, Vcl.Session, uJKDialog, Vcl.Validacoes, UDM,
  Controller.LookupHelper, System.DateUtils, Model.EntradaVeiculoFinanceiro,
  Controller.EntradaVeiculoFinanceiro;

Procedure TfrmEntradaVeiculoPagamento.CarregarDocumento;
begin
  TLookupHelper.CarregarLookup(
                TabDocumento,'Select                              '+
                 ' id_documento,                                  '+
                 ' codigo,                                        '+
                 ' descricao,                                     '+
                 ' concat(codigo,'' | '',descricao) as ncompleto  '+
                 ' From tipo_documento                            '+
                 ' where ativo=''S''                              '+
                 ' and excluido=0                                 '+
                 ' order by codigo, descricao');
end;

procedure TFrmEntradaVeiculoPagamento.edtentradaExit(Sender: TObject);
begin
  AtualizarTotal;
end;

Procedure TfrmEntradaVeiculoPagamento.AtualizarTotal;
var
  Sub, Entrada, totalParcelar :Currency;
begin
  Sub     := edtsubtotal.EditValue;
  Entrada := edtentrada.EditValue;

  // Garante que não ultrapasse o subtotal
  if Entrada > Subtotal then
  begin
    JKDialog('Aviso','Valor de entrada não pode ser maior que o subtotal!', tdAlerta);
    edtEntrada.Value := 0;
    Entrada          := 0;
  end;

  totalParcelar := Sub - entrada;

  EdtTotal.EditValue    := totalParcelar;

end;

procedure TFrmEntradaVeiculoPagamento.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmEntradaVeiculoPagamento.btnExcluirClick(Sender: TObject);
begin
  if not TabPagamento.Active then
    Exit;

  if TabPagamento.RecordCount = 0 then
    Exit;

  with cxGridDB.controller do
  begin
    if SelectedRowCount <=0 then
    begin
      JKDialog('Aviso','Nenhum registro selecionado!', tdAlerta);
      Exit;
    end;

    if JKDialog('Aviso', 'Deseja realmente excluir o pagamento selecionado?', tdMensagem)  then
    begin
      TabPagamento.Delete;
    end;    
  end;  

  
end;

procedure TFrmEntradaVeiculoPagamento.btnIncluirClick(Sender: TObject);
var
msg :String;
begin
  //Gerar as parcelas

  if ValidarCampos(msg) then
  begin
    Try
       if Salvar(msg) then
        begin
          //JKDialog('Sucesso',msg, tdSucesso);
          Close;
          //TNavigation.CloseCamada(Self);
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

procedure TFrmEntradaVeiculoPagamento.btnInserirDadosClick(Sender: TObject);
var
  i, QtdeParcelas, IntervaloDias, iddocumento: Integer;
  DataBase, DataParcela: TDateTime;
  ValorTotal, ValorEntrada, ValorParcela, Subtotal: Currency;
  Documento, Observacao: String;
begin
  //Inserir TabelaTemporaria as parcelas geradas

  if (EdtTotal.EditValue=0) or (EdtTotal.Text='') then
  begin
    JKDialog('Aviso','Sem valor total informado!', tdAlerta);
    Exit;
  end;  

  if (edtpagamento.EditValue=0) or (edtpagamento.Text='') then
  begin
    JKDialog('Aviso','Selecione o tipo de documento!', tdAlerta);
    Exit;
  end;

  if (edtqtde.EditValue=0) or (edtqtde.Text='') then
  begin
    JKDialog('Aviso','Sem quantidade e parcelas!', tdAlerta);
    Exit;
  end;

  if not TabPagamento.Active then
    Exit;
  TabPagamento.DisableControls;

  try
    TabPagamento.EmptyDataSet;

    // Coleta dos valores dos campos da tela
    DataBase      := edtdata.EditValue;
    QtdeParcelas  := edtqtde.EditValue;
    IntervaloDias := StrToint(edtIntervalo.Text);
    ValorEntrada  := edtentrada.EditValue;
    Subtotal      := edtsubtotal.EditValue;
    ValorTotal    := EdtTotal.EditValue; // pode ser Subtotal + Entrada ou somente Subtotal
    iddocumento   := edtpagamento.EditValue;
    Documento     := edtpagamento.Text;
    Observacao    := trim(edtObs.Text);

    // Calcula o valor total parcelado
    if ValorEntrada > 0 then
      ValorParcela := (Subtotal - ValorEntrada) / QtdeParcelas
    else
      ValorParcela := ValorTotal / QtdeParcelas;

    // Geração das parcelas
    for i := 1 to QtdeParcelas do
    begin
      DataParcela := IncDay(DataBase, IntervaloDias * i);

      TabPagamento.Append;
      TabPagamento.FieldByName('idcompra').AsInteger        := IdCompra;
      TabPagamento.FieldByName('id_prazo').AsInteger        := iddocumento;
      TabPagamento.FieldByName('numero_doc').AsString       := intToStr(numerocontrato) +'/'+ IntTostr(i);
      TabPagamento.FieldByName('prazo').AsString            := Documento;
      TabPagamento.FieldByName('valor').AsFloat             := ValorParcela;
      TabPagamento.FieldByName('datapagamento').AsDateTime  := DataBase;
      TabPagamento.FieldByName('data_vencimento').AsDateTime:= DataParcela;
      if QtdeParcelas > 1 then
      TabPagamento.FieldByName('parcelado').AsString        := 'S'
      else
      TabPagamento.FieldByName('parcelado').AsString        := 'N';
      TabPagamento.FieldByName('numeroparcelas').AsInteger  := i;
      TabPagamento.FieldByName('gerarfinanceiro').AsString  := 'S';
      TabPagamento.FieldByName('obs').AsString              := Observacao;
      TabPagamento.FieldByName('statusfin').AsString        := 'N';
      TabPagamento.Post;

    end;
    TabPagamento.EnableControls;

    edtpagamento.EditValue  := 0;
    edtqtde.EditValue       := 1;
    edtIntervalo.EditValue  := 1;
    edtObs.Clear;
    edtpagamento.SetFocus;
     
  except on e:exception do
    begin
      JKDialog('Erro','Erro ao gerar os dados!', tdErro);
      raise;
    end;
  end;

end;

function TFrmEntradaVeiculoPagamento.Salvar(out msg: string): Boolean;
var
  ModelCompra   : TModelCompraVeiculo;
  VlrTotal, VlrTotalGerado:Currency;
  I,idr:Integer;

  ContrFinanceiro : TEntradaFinanceiroVeiculoController;
  ObjFinanceiro   : TEntradaVeiculoFinanceiro;

begin
  Result          := False;
  ContrFinanceiro := Nil;
  ObjFinanceiro   := Nil;

  //Validar dados.

  Vlrtotal        := EdtTotal.EditValue;
  VlrTotalGerado  := 0;

  TabPagamento.DisableControls;
  TabPagamento.First;
  for I := 0 to TabPagamento.RecordCount -1 do
  begin
    VlrTotalGerado  := VlrTotalGerado + TabPagamento.FieldByName('valor').AsCurrency;
    TabPagamento.Next;
  end;
  TabPagamento.EnableControls;

  if (VlrTotalGerado > Vlrtotal) or (VlrTotalGerado < Vlrtotal) then
  begin
    Result  := False;
    msg     := 'Valor gerado difere do valor total!';
    JKDialog('Aviso','Valor gerado difere do valor total!', tdAlerta);
    exit;
  end;

  //ModelCompra   := TModelCompraVeiculo.Create;
  ContrFinanceiro := TEntradaFinanceiroVeiculoController.Create;
  ObjFinanceiro   := TEntradaVeiculoFinanceiro.Create;


  Try
    TabPagamento.DisableControls;
    TabPagamento.First;

    // Laço para percorrer todos os registros
    while not TabPagamento.Eof do
    begin
      // Preenche os dados de cada registro da tabela temporária
      ObjFinanceiro.id_compra         := idCompra;
      ObjFinanceiro.id_prazo          := TabPagamento.FieldByName('id_prazo').AsInteger;
      ObjFinanceiro.forma_pagamento   := TabPagamento.FieldByName('prazo').AsString;
      ObjFinanceiro.valor             := TabPagamento.FieldByName('valor').AsCurrency;
      ObjFinanceiro.data_pagamento    := TabPagamento.FieldByName('datapagamento').AsDateTime;
      ObjFinanceiro.parcelado         := TabPagamento.FieldByName('parcelado').AsString;
      ObjFinanceiro.numero_parcelas   := TabPagamento.FieldByName('numeroparcelas').AsInteger;
      ObjFinanceiro.gerar_financeiro  := TabPagamento.FieldByName('gerarfinanceiro').AsString;
      ObjFinanceiro.observacao        := TabPagamento.FieldByName('obs').AsString;
      ObjFinanceiro.statusfin         := TabPagamento.FieldByName('statusfin').AsString;
      ObjFinanceiro.data_vencimento   := TabPagamento.FieldByName('data_vencimento').AsDateTime;
      ObjFinanceiro.numero_doc        := TabPagamento.FieldByName('numero_doc').AsString;

      ContrFinanceiro.Salvar(ObjFinanceiro,idr);
      Result  := True;
      TabPagamento.Next;
    end;

    TabPagamento.EnableControls;

  Finally
    FreeAndNil(ContrFinanceiro);
    FreeAndNil(ObjFinanceiro);
  End;
  
end;

function TFrmEntradaVeiculoPagamento.ValidarCampos(out msg: string): Boolean;
var
  Modelval  :TValidacao;
begin
  Result  := True;
end;

procedure TFrmEntradaVeiculoPagamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action                      := TCloseAction.caFree;
    FrmEntradaVeiculoPagamento  := nil;
end;

procedure TFrmEntradaVeiculoPagamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F5 then
  begin
    btnincluir.Click;
    key:=0;
  end;

  if key = vk_escape then
  begin
    btncancelar.Click;
    key:=0;
  end;

end;

procedure TFrmEntradaVeiculoPagamento.FormShow(Sender: TObject);
var
  msg:string;
begin

  Try
    CarregarDocumento;
  except on e:exception do
    begin
      JKDialog('Erro',msg+' :'+e.Message, tdErro);
      raise;
    end;
  End;

  edtsubtotal.EditValue       := SubTotal;
  EdtTotal.EditValue          := Total;
  edtData.EditValue           := Now;
end;

end.
