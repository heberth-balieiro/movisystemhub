unit ULivroCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseCons, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, Vcl.Menus, frxClass, frxDBSet,
  ACBrBase, ACBrEnterTab, Vcl.Tabs, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, cxContainer,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar,Model.LivroCaixa, cxCurrencyEdit, frxExportBaseDialog, frxExportPDF,
  cxGroupBox;

type
  TFrmLivroCaixa = class(TFrmModeloConsulta)
    data1: TcxDateEdit;
    data2: TcxDateEdit;
    nTipo: TcxGridDBColumn;
    ndata: TcxGridDBColumn;
    nDoc: TcxGridDBColumn;
    nHistorico: TcxGridDBColumn;
    nentrada: TcxGridDBColumn;
    nSaida: TcxGridDBColumn;
    nSaldo: TcxGridDBColumn;
    nvalor: TcxGridDBColumn;
    N2: TMenuItem;
    BtnCusto: TMenuItem;
    cxStyleGridColl: TcxStyleRepository;
    cxStyleEntrada: TcxStyle;
    cxStyleSaida: TcxStyle;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    procedure FormShow(Sender: TObject);
    procedure BtnCustoClick(Sender: TObject);
    procedure data1KeyPress(Sender: TObject; var Key: Char);
    procedure data2KeyPress(Sender: TObject; var Key: Char);
    procedure edtBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure GridCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }
  public

    procedure OpenCadTela(id: integer;str:string);override;
    Procedure Pesquisa;override;
    Procedure editar;override;
    Procedure Excluir;override;
    Procedure Listagem;override;
    { Public declarations }
  end;

var
  FrmLivroCaixa: TFrmLivroCaixa;
  Model        : TModelLivroCaixa;
implementation

{$R *.dfm}

uses UnitLivroCaixaCad, Vcl.Navigation, uJKDialog, Vcl.Loading, UDM,
  UnitCentroCustoCad, Model.Empresa, Vcl.Session, UConeSul,System.DateUtils
  ;

{ TFrmLivroCaixa }


{ TFrmLivroCaixa }

procedure TFrmLivroCaixa.BtnCustoClick(Sender: TObject);
begin
  inherited;
  //cad custo

  TNavigation.ParamInt          := 0;
  TNavigation.ParamsStr         := 'N';
  TNavigation.OpenModal(TFrmCustoCad, FrmCustoCad);
end;

procedure TFrmLivroCaixa.data1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
    data2.SetFocus;
  end;
end;

procedure TFrmLivroCaixa.data2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
    edtbusca.SetFocus;
  end;
end;

procedure TFrmLivroCaixa.editar;
begin
  inherited;

  if not DM.TabConsLivroCaixa.Eof then
  begin
    if ds.DataSet.FieldByName('id').AsInteger > 0 then
    begin
      OpenCadTela(ds.DataSet.FieldByName('id').AsInteger,'E');
    end
    else
    JKDialog('Aviso','Selecione um registro da lista!', tdAlerta)
  end
  else
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  end;

end;

procedure TFrmLivroCaixa.edtBuscaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
    btnbusca.Click;
  end;
end;

procedure TFrmLivroCaixa.Excluir;
var
msg:string;
begin
  inherited;
    if not DM.TabConsLivroCaixa.Eof then
    begin

      if JKDialog('Aviso', 'Deseja excluir o registro selecionada?', tdMensagem)  then
      begin
          TLoading.Show(FrmLivroCaixa,'Excluindo registro aguarde...');
          TLoading.ExecuteThread(procedure
          begin
            Model   := TModelLivroCaixa.Create;
            Try
              Model.idlivro  := ds.DataSet.FieldByName('id').AsInteger;
              Model.Excluir(msg);

            Finally
              model.Free;
            End;
          end, TerminateDelete);

      end;

    end
    else
    begin
      JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
    end;
end;

procedure TFrmLivroCaixa.FormShow(Sender: TObject);
begin
  inherited;
  data1.EditValue := StartOfTheMonth(Date);
  data2.EditValue := EndOfTheMonth(Date);
end;

procedure TFrmLivroCaixa.GridCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  btneditar.Click;
end;

procedure TFrmLivroCaixa.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    btneditar.Click;
  end;
end;

procedure TFrmLivroCaixa.Listagem;
var
Model :TModelEmpresa;
msg:String;
TempImage: Timage;
begin
  inherited;

    if not DM.TabConsLivroCaixa.Eof then
    begin
      frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelLivroCaixa.fr3');
      Try
        DM.TabConsLivroCaixa.DisableControls;

        Model               := TModelEmpresa.Create;
        Try
          Model.idempresa   := TSession.IDEMPRESA;
          Model.SelectCabecalhoReport(msg);

          frxReport.Variables.Clear;
          frxReport.Variables['nrazao']          :=quotedstr(Model.razao);
          frxReport.Variables['nfantasia']       :=quotedstr(model.fantasia);
          frxReport.Variables['nendereco']       :=quotedstr(model.endereco);
          frxReport.Variables['nnumero']         :=quotedstr(model.numero);
          frxReport.Variables['nbairro']         :=quotedstr(model.bairro);
          frxReport.Variables['ntelefone']       :=quotedstr(model.telefone);
          frxReport.Variables['nfone1']          :=quotedstr(model.telefone2);
          frxReport.Variables['nfone2']          :=quotedstr(model.celular);
          frxReport.Variables['nemail']          :=quotedstr(model.email1);
          frxReport.Variables['ncnpj']           :=quotedstr(model.cnpj);
          frxReport.Variables['nie']             :=quotedstr(model.ie);

          try
            // Decodifica a imagem Base64 e carrega no fluxo de memória
            TempImage             := TImage.Create(nil);
            TConesul.ConvBase64Img(model.logo);
            TempImage.Picture     :=TConesul.nfoto;
            TConesul.nfoto.Free;
            TempImage.Picture.SaveToFile(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg')
          finally
            TempImage.Free;
          end;

          frxReport.Variables['wlogo']           :=quotedstr(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg');
          frxReport.Variables['ncep']            :=quotedstr(model.cep);
          frxReport.Variables['ncidade']         :=quotedstr(model.cidade);
          frxReport.Variables['filtro']          :=quotedstr('LIVRO CAIXA');

        Finally
          model.Free;
        End;

        frxReport.Report.PrepareReport();
        frxReport.ShowReport;
      Finally
        DM.TabConsLivroCaixa.First;
        DM.TabConsLivroCaixa.EnableControls;
      End;

    end
    else
    begin
      JKDialog('Aviso','Nenhum registro encontrato!', tdAlerta);
    end;
end;

procedure TFrmLivroCaixa.OpenCadTela(id: integer; str: string);
begin
  inherited;
  TNavigation.ExecuteOnClose    := Pesquisa;
  TNavigation.ParamInt          := id;
  TNavigation.ParamsStr         := Str;
  TNavigation.OpenModal(TFrmLivroCaixaCad, FrmLivroCaixaCad);
end;

procedure TFrmLivroCaixa.Pesquisa;
var
msg:string;
begin
  inherited;
  if (data1.Text ='') or (data2.Text='') then
    exit;

  Try
    TLoading.Show(FrmLivroCaixa,'Listando dados...');

    Model   := TModelLivroCaixa.Create;
    Try
      Try
        if Model.Localizar(msg, Tabsituacao.TabIndex, trim(edtBusca.Text),
                                 data1.date, data2.date) then

      Except on e:exception do
        begin
          JKDialog('Erro',msg, tdErro);
          raise;
        end;
      End;

    Finally
      Model.Free;
    End;
    {TLoading.ExecuteThread(procedure
        begin


        end, TerminatePesquisa);}
  Finally
    TLoading.Hide;
  End;
end;

end.
