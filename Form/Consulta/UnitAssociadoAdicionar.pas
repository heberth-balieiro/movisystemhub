unit UnitAssociadoAdicionar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Navigation, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic,
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
  dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Vcl.Menus, dxGDIPlusClasses, cxMaskEdit,System.JSON, ACBRUTIL,
  Vcl.ComCtrls, JvExExtCtrls, JvNavigationPane, cxContainer, cxGroupBox,
  cxTextEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  DBAccess, Uni, cxCheckBox;

  const
  UM_CHECK = WM_USER + 10000;

type
  TFrmAssociadoAdicionar = class(TForm)
    pHeader: TPanel;
    Label4: TLabel;
    Panel2: TPanel;
    btnNovo: TSpeedButton;
    dsAssociado: TDataSource;
    pBusca: TPanel;
    Panel7: TPanel;
    btnBusca: TSpeedButton;
    edtBusca: TEdit;
    PPopPap: TPanel;
    Image1: TImage;
    Popup: TPopupMenu;
    Listagem1: TMenuItem;
    Relatrio1: TMenuItem;
    EnviarWhatsApp1: TMenuItem;
    EnviarWhatsAppLote1: TMenuItem;
    N1: TMenuItem;
    ImportarPessoaJSON1: TMenuItem;
    N2: TMenuItem;
    TabPessoa: TTabControl;
    cxGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    coll1: TcxGridDBColumn;
    coll2: TcxGridDBColumn;
    coll3: TcxGridDBColumn;
    coll4: TcxGridDBColumn;
    coll5: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Panel1: TPanel;
    btnAcessar: TSpeedButton;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    PanelFiltro: TPanel;
    cxGroupBox1: TcxGroupBox;
    Label21: TLabel;
    edtSecretaria: TcxLookupComboBox;
    dsLotacao: TUniDataSource;
    Box: TcxGridDBColumn;
    MemoAdd: TMemo;
    idsocio: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBuscaClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure EnviarWhatsAppLote1Click(Sender: TObject);
    procedure ImportarPessoaJSON1Click(Sender: TObject);
    procedure TabPessoaChange(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BoxPropertiesEditValueChanged(Sender: TObject);
    procedure cxGridDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxGridDBTableView1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    bookmark: TBookmark;
    procedure OpenCadAssociado(id_associado: integer;Str:String);
    procedure RefreshClientes;
    Procedure Localizar;
    procedure ImportarJSONParaBanco(const FileName: string);
    procedure CarregarSecretaria;

    procedure Check2(AGridView: TcxGridDBTableView);
    procedure UmCheck2(var Message: TMessage);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAssociadoAdicionar: TFrmAssociadoAdicionar;

implementation

{$R *.dfm}

uses UnitAssociadoCad, UDM, Model.Socio, Vcl.Loading,  uJKDialog,
  UnitFrmWhatsApp, UnitFrmWhatsAppMassa, Vcl.Session, System.IOUtils;

procedure TFrmAssociadoAdicionar.OpenCadAssociado(id_associado: integer;Str:string);
begin
  //passar os dados para a classe
  TNavigation.ExecuteOnClose    := RefreshClientes;
  TNavigation.ParamInt          := id_associado;
  TNavigation.ParamsStr         := Str;
  TNavigation.OpenModal(TFrmAssociadoCad, FrmAssociadoCad);

end;

procedure TFrmAssociadoAdicionar.BoxPropertiesEditValueChanged(Sender: TObject);
var
  ACheck: TcxCheckBox;
  AGridSite: TcxGridSite;
  AGridView: TcxGridDBTableView;
begin
  //Grid1 Diego

  ACheck    := Sender as TcxCheckBox;
  AGridSite := ACheck.Parent as TcxGridSite;
  AGridView := AGridSite.GridView as TcxGridDBTableView;
  Check2(AGridView);
end;

procedure TFrmAssociadoAdicionar.btnAcessarClick(Sender: TObject);
begin
  close;
end;

procedure TFrmAssociadoAdicionar.btnBuscaClick(Sender: TObject);
begin
  RefreshClientes;
end;

procedure TFrmAssociadoAdicionar.btnNovoClick(Sender: TObject);
var
msg:string;
var
I, J :integer;
m:Integer;
begin

  memoAdd.Clear;
  J := Box.Index;

  if not dm.TabConsSocioWhats.Active then
  begin
    JKDialog('Alerta','Realize uma pesquisa!', tdAlerta);
    exit;
  end;

  with cxGridDBTableView1.Controller do
    for I := 0 to SelectedRecordCount - 1 do
      memoAdd.Lines.Add(VarToStr(cxGridDBTableView1.Controller.SelectedRecords[i].Values[1]));

  if memoAdd.Lines.Count = 0 then
  begin
    JKDialog('Alerta','Selecione um registro da lista!', tdAlerta);
    cxGrid.SetFocus;
    exit;
  end;

  Try
    For M := 0 to MemoAdd.Lines.Count -1  do
    begin
      //if DM.PopularPessoaWhatsAppMassaIndividual(msg,strtoint(Memoadd.Lines[M])) then
    end;
    JKDialog('Sucesso','Associado adicionado na lista.', tdSucesso);
    Memoadd.Clear;

  except on E: Exception do
    JKDialog('Erro','Erro ao inserir:'+e.Message, tderro);

  end;

  //Inserir pessoa na lista
  {
  if dm.TabConsSocioWhats.Active then
  begin

  if DM.PopularPessoaWhatsAppMassaIndividual(msg,dsassociado.DataSet.FieldByName('id_socio').AsInteger) then
  JKDialog('Sucesso','Associado adicionado na lista.', tdSucesso)
  else
  JKDialog('Aviso',msg, tdAlerta);

  end
  else
  JKDialog('Alerta','Realize uma pesquisa!', tdAlerta);
  }
end;

procedure TFrmAssociadoAdicionar.EnviarWhatsAppLote1Click(Sender: TObject);
begin
  //lote de envios

  Try
    FrmEnviarWhatsAppMassa                         := TFrmEnviarWhatsAppMassa.Create(Application);

    {FrmEnviarWhatsAppMassa.edtMensagem.EditValue   :=
                        ' Nome: '+dsAssociado.DataSet.FieldByName('nome').AsString+sLineBreak +
                        ' CPF: '+ dsAssociado.DataSet.FieldByName('cpf').AsString+sLineBreak +
                        ' Data Nascimento: '+ FormatDateTime('dd/mm/yyyy', dsAssociado.DataSet.FieldByName('nascimento').AsDateTime)+sLineBreak +
                        ' Email: '+dsAssociado.DataSet.FieldByName('email').AsString;
    }
    FrmEnviarWhatsAppMassa.ShowModal;
  Finally

  End;

end;

procedure TFrmAssociadoAdicionar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action        := TCloseAction.caFree;
    FrmAssociadoAdicionar  := nil;
end;

procedure TFrmAssociadoAdicionar.FormShow(Sender: TObject);
begin
  CarregarSecretaria;
end;

procedure TFrmAssociadoAdicionar.Image1Click(Sender: TObject);
begin
  //
  PopUp.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TFrmAssociadoAdicionar.ImportarPessoaJSON1Click(Sender: TObject);
var
  OpenDialog: TOpenDialog;
begin
  // Cria um objeto TOpenDialog
  OpenDialog := TOpenDialog.Create(nil);
  try
    // Configurações do diálogo
    //OpenDialog.Filter := 'Imagens JPEG|*.jpg;*.jpeg|Imagens PNG|*.png;*.png';
    OpenDialog.Title := 'Carregar JSON';

    // Exibe o diálogo e verifica se o usuário selecionou um arquivo
    if OpenDialog.Execute then
    begin
      ImportarJSONParaBanco(OpenDialog.FileName);
      
    end;
  finally

    OpenDialog.Free;
  end;


end;

procedure TFrmAssociadoAdicionar.ImportarJSONParaBanco(const FileName: string);
var
  Socio : TModelSocio;
  JSONString: string;
  JSONArray: TJSONArray;
  JSONObj: TJSONObject;
  JSONValue: TJSONValue;
  I, id:Integer;
  msg:string;
begin

  JSONString := TFile.ReadAllText(FileName);
  JSONArray := TJSONObject.ParseJSONValue(JSONString) as TJSONArray;

  Try
      Socio               :=  TModelSocio.Create;

      for I := 0 to JSONArray.Count - 1 do
      begin
        JSONObj := JSONArray.Items[I] as TJSONObject;

        socio.idempresa     := TSession.idempresa;
        Socio.idsede        := 1;
        Socio.matricula     := 200+I;
        Socio.sociodeste    := Strtodate(JSONObj.GetValue('data_nasc').Value);
        Socio.situacao      := 'S';
        Socio.nome          := JSONObj.GetValue('nome').Value;
        Socio.apelido       := JSONObj.GetValue('nome').Value;
        Socio.cep           := TiraPontos(JSONObj.GetValue('cep').Value);
        Socio.endereco      := Trim(JSONObj.GetValue('endereco').Value);
        Socio.numero        := JSONObj.GetValue('numero').Value;
        Socio.bairro        := Trim(JSONObj.GetValue('bairro').Value);
        Socio.complemento   := '';
        Socio.idcidade      := dm.BuscarCidadeMunicipio(0,JSONObj.GetValue('cidade').Value);
        Socio.telefone      := TiraPontos(JSONObj.GetValue('telefone_fixo').Value);
        Socio.celular       := TiraPontos(JSONObj.GetValue('celular').Value);
        Socio.whatsapp      := TiraPontos(JSONObj.GetValue('celular').Value);
        Socio.cpf           := TiraPontos(JSONObj.GetValue('cpf').Value);
        Socio.rg            := Trim(JSONObj.GetValue('rg').Value);
        Socio.orgao         := '';
        Socio.ctps          := '';
        Socio.serie         := '';
        Socio.pis           := '';
        Socio.sexo          := UpperCase(JSONObj.GetValue('sexo').Value);
        Socio.civil         := 'OUTROS';
        Socio.nascimento    := Strtodate(JSONObj.GetValue('data_nasc').Value);
        Socio.naturalde     := dm.BuscarCidadeMunicipio(0,JSONObj.GetValue('cidade').Value);
        Socio.email         := Trim(JSONObj.GetValue('email').Value);
        Socio.pai           := Trim(JSONObj.GetValue('pai').Value);
        Socio.mae           := trim(JSONObj.GetValue('mae').Value);
        Socio.profissao     := '';
        Socio.admissao      := Strtodate(JSONObj.GetValue('data_nasc').Value);
        Socio.obs           := '';
        Socio.cliente       := 'S';
        Socio.fornecedor    := 'N';
        Socio.envemail      := 'N';
        Socio.envwhats      := 'N';
        Socio.telefone2     := TiraPontos(JSONObj.GetValue('celular').Value);
        Socio.celular2      := TiraPontos(JSONObj.GetValue('celular').Value);
        Socio.aviso         := '';
        Socio.foto          := '';

        Try
          Socio.Insert(msg, id);
        Except on e:exception do
         raise Exception.Create(e.Message);
        End;
      end;


  Finally
    JSONArray.Free;
  End;
end;

procedure TFrmAssociadoAdicionar.CarregarSecretaria;
var
msg:string;
begin
  //dm.popularSecretaria(msg);
end;


procedure TFrmAssociadoAdicionar.Check2(AGridView: TcxGridDBTableView);
var
  i: integer;
begin
  for i:= 0 to AGridView.DataController.RecordCount - 1 do
    if AGridView.DataController.Values[i, box.Index] = true then
      AGridView.DataController.ChangeRowSelection(i, true)
    else
      AGridView.DataController.ChangeRowSelection(i, false);
end;

procedure TFrmAssociadoAdicionar.cxGridDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
  AView: TcxGridDBTableView;
begin
  //Grid Diego
  AView := Sender as TcxGridDBTableView;
  PostMessage(Handle, UM_CHECK, Integer(AView), 0);
end;

procedure TFrmAssociadoAdicionar.cxGridDBTableView1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  AHitTest: TcxCustomGridHitTest;
  AView: TcxGridDBTableView;
  I, J: integer;
begin
  //grid Diego
  AView := TcxGridDBTableView(TcxGridSite(Sender).GridView);
  AHitTest := AView.ViewInfo.GetHitTest(X,Y);
  if AHitTest is TcxGridRowIndicatorHitTest then
  begin
    I := TcxGridRowIndicatorHitTest(AHitTest).GridRecord.Index;
    J := box.Index;
    AView.DataController.Values[I, J] := True;
    Check2(AView);
  end;
end;

procedure TFrmAssociadoAdicionar.Localizar;
var
Socio : TModelSocio;
msg:string;
begin
  Try
    Socio    := TModelSocio.Create;
    dsAssociado.DataSet.Close;
    if edtsecretaria.EditValue=null then
    edtsecretaria.EditValue   :=0;

    Socio.PopularDataSetWhatsApp(msg,2,TabPessoa.TabIndex,edtsecretaria.EditValue, trim(edtBusca.Text));

    if msg = 'Consulta realizada com sucesso' then
    begin
      dsAssociado.DataSet.Open;
      cxgrid.SetFocus;
    end;

  Finally
    Socio.Free;
  End;
end;

procedure TFrmAssociadoAdicionar.RefreshClientes;
begin
  Localizar;
end;


procedure TFrmAssociadoAdicionar.TabPessoaChange(Sender: TObject);
begin
  RefreshClientes;
end;

procedure TFrmAssociadoAdicionar.UmCheck2(var Message: TMessage);
begin
  Check2(TcxGridDBTableView(Message.WParam));
end;

end.
