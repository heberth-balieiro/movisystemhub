unit UnitRelacaoAniversariante;

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
  cxCalendar, cxCheckBox, cxGroupBox;

type
  TFrmRelacaoniverConsulta = class(TFrmModeloConsulta)
    gCodigo: TcxGridDBColumn;
    gNome: TcxGridDBColumn;
    gApelido: TcxGridDBColumn;
    gNascimento: TcxGridDBColumn;
    gCelular: TcxGridDBColumn;
    gWhatsapp: TcxGridDBColumn;
    data1: TcxDateEdit;
    data2: TcxDateEdit;
    edtOrdem: TcxComboBox;
    edtPeriodo: TcxCheckBox;
    gidsocio: TcxGridDBColumn;
    Fechar1: TMenuItem;
    N2: TMenuItem;
    WhatsApp1: TMenuItem;
    frxReport: TfrxReport;
    procedure data1KeyPress(Sender: TObject; var Key: Char);
    procedure data2KeyPress(Sender: TObject; var Key: Char);
    procedure edtOrdemKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Fechar1Click(Sender: TObject);
    procedure WhatsApp1Click(Sender: TObject);
  private
    { Private declarations }
  public
    Procedure Pesquisa;override;
    Procedure Listagem;override;
    { Public declarations }
  end;

var
  FrmRelacaoniverConsulta: TFrmRelacaoniverConsulta;

implementation

{$R *.dfm}

uses Model.Socio, Vcl.Loading, uJKDialog, UDM, Vcl.Navigation, Vcl.Validacoes,
  Vcl.Session, UnitFrmWhatsAppMSG, Model.Empresa, UConeSul;

{ TFrmRelacaoniverConsulta }

procedure TFrmRelacaoniverConsulta.data1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
    data2.SetFocus;
  end;
end;

procedure TFrmRelacaoniverConsulta.data2KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
    edtordem.SetFocus;
  end;
end;

procedure TFrmRelacaoniverConsulta.edtOrdemKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
    btnbusca.Click;
  end;
end;

procedure TFrmRelacaoniverConsulta.Fechar1Click(Sender: TObject);
begin
  inherited;
  TNavigation.Close(Self);
end;

procedure TFrmRelacaoniverConsulta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key=vk_escape then
  TNavigation.Close(Self);
end;

procedure TFrmRelacaoniverConsulta.Listagem;
var
Model :TModelEmpresa;
msg:String;
TempImage: Timage;
begin
  inherited;

    if not DM.TabRelacaoAniversariante.Eof then
    begin
      frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelRelacaoAniversariantes.fr3');
      Try
        DM.TabRelacaoAniversariante.DisableControls;

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
          frxReport.Variables['filtro']          :=quotedstr('RELAÇÃO DE ANIVERSARIANTE');

        Finally
          model.Free;
        End;

        frxReport.Report.PrepareReport();
        frxReport.ShowReport;
      Finally
        DM.TabRelacaoAniversariante.First;
        DM.TabRelacaoAniversariante.EnableControls;
      End;

    end
    else
    begin
      JKDialog('Aviso','Nenhum registro encontrato!', tdAlerta);
    end;


end;

procedure TFrmRelacaoniverConsulta.Pesquisa;
var
msg:string;
Model :TModelSocio;
dia1,dia2,mes1,mes2:Integer;
begin
  inherited;

  if edtPeriodo.Checked then
  begin
    dia1    := strtoint(copy(data1.text, 1,2));
    dia2    := strtoint(copy(data2.text, 1,2));
    mes1    := strtoint(copy(data1.text, 4,2));
    mes2    := strtoint(copy(data2.text, 4,2));
  end
  else
  begin
    data1.editvalue  := now;
    data2.editvalue  := now;

    dia1    := strtoint(copy(data1.text, 1,2));
    dia2    := strtoint(copy(data2.text, 1,2));
    mes1    := strtoint(copy(data1.text, 4,2));
    mes2    := strtoint(copy(data2.text, 4,2));

  end;

  //TLoading.Show(FrmRelacaoniverConsulta,'Listando dados...');
  Try
    Model   := TModelSocio.Create;

    Try
      Try
        if not Model.RelacaoAniversariante(msg,dia1,dia2,mes1,mes2,edtOrdem.itemindex) then
        JKDialog('Aviso','Nenhuma informação encontrada!', tdAlerta);

      Except on e:exception do
        begin
          JKDialog('Erro',msg, tdErro);
          raise;
        end;
      End;

    Finally
      Model.Free;
    End;
   
  Finally
    //TLoading.Hide;
  End;
end;

procedure TFrmRelacaoniverConsulta.WhatsApp1Click(Sender: TObject);
var
ModelVal : TValidacao;
begin
  inherited;
  //
  ModelVal      := TValidacao.create;
  Try
    if not ModelVal.ValidarUsoWhatsApp(TSession.idempresa) then
    begin
      JKDialog('Aviso','Função não habilitada!', tdAlerta);
      exit;
    end;
  Finally
    ModelVal.free;
  End;


  if not DM.TabRelacaoAniversariante.Eof then
  begin
    if ds.DataSet.FieldByName('id_socio').AsInteger > 0 then
    begin
      FrmEnviarWhatsAppmsg                         := TFrmEnviarWhatsAppmsg.Create(Application);
      FrmEnviarWhatsAppmsg.ShowModal;
    end
    else
    JKDialog('Aviso','Nenhum registro listado para enviar!', tdAlerta);
  end
  else
  JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
end;

end.
