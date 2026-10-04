unit UnitRelatorioTicket;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseRelatorio, cxGraphics,
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
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, Data.DB, DBAccess, Uni, frxClass, frxDBSet,
  frxExportBaseDialog, frxExportPDF, frxExportCSV, frxExportRTF;

type
  TFrmRelatorioTicket = class(TForm)
    dsAssociado: TUniDataSource;
    dsconvenio: TUniDataSource;
    dsSecretaria: TUniDataSource;
    dsUsuario: TUniDataSource;
    frxImpressao: TfrxReport;
    frxTicketRelatorio: TfrxDBDataset;
    frxTicketTotalizado: TfrxDBDataset;
    Paneltitulo: TPanel;
    lblTitulo: TLabel;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    Panel2: TPanel;
    btnCancelar: TSpeedButton;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtdata1: TcxDateEdit;
    edtdata2: TcxDateEdit;
    edtBuscar: TcxComboBox;
    edtsituacao: TcxComboBox;
    edtassociado: TcxLookupComboBox;
    edtconvenio: TcxLookupComboBox;
    edtSecretaria: TcxLookupComboBox;
    edtordem: TcxComboBox;
    edtrelatorio: TcxComboBox;
    edtusuario: TcxLookupComboBox;
    ACBrEnterTab2: TACBrEnterTab;
    frxRTFExport1: TfrxRTFExport;
    frxCSVExport1: TfrxCSVExport;
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    function Visualizar(out msg: string): Boolean;
    function ValidarCampos(out msg: string): Boolean;
    { Public declarations }
  end;

var
  FrmRelatorioTicket: TFrmRelatorioTicket;

implementation

{$R *.dfm}

uses UDM, uJKDialog, System.DateUtils, Model.Tickets_old, UDMRelatorio,
  Model.Empresa, UConeSul, Vcl.Session, Vcl.Navigation;

procedure TFrmRelatorioTicket.btnCancelarClick(Sender: TObject);
begin
  FrmRelatorioTicket.Close;
end;

procedure TFrmRelatorioTicket.btnSalvarClick(Sender: TObject);
var
msg :String;
begin
  //
  if ValidarCampos(msg) then
  begin
    Try
       if Visualizar(msg) then
        begin
          //JKDialog('Sucesso',msg, tdSucesso);
          //TNavigation.Close(Self);
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

procedure TFrmRelatorioTicket.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    FrmRelatorioTicket := nil;
end;

procedure TFrmRelatorioTicket.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmRelatorioTicket.FormShow(Sender: TObject);
var
msg:string;
begin

  Try
   // DM.PopularSindAssociado(msg);
  except on e:exception do
    begin
      JKDialog('Erro',' Erro ao carregar dados do associado: '+#13+E.Message, tdErro);
    end;
  End;

  try
    //dm.PopularConvenioTicket;
  except on e:exception do
    begin
      JKDialog('Erro',' Erro ao carregar dados do convênio: '+#13+E.Message, tdErro);
    end;
  end;

  try
    //dm.popularSecretaria(msg);
  except on e:exception do
    begin
      JKDialog('Erro',' Erro ao carregar dados do convênio: '+#13+E.Message, tdErro);
    end;
  end;

  try
    //dm.PopularUsuarioLogin;
  except on e:exception do
    begin
      JKDialog('Erro',' Erro ao carregar dados do convênio: '+#13+E.Message, tdErro);
    end;
  end;

  edtdata1.EditValue := StartOfTheMonth(date);
  edtdata2.EditValue := EndOfTheMonth(date);


  edtdata1.SetFocus;
end;

function TFrmRelatorioTicket.ValidarCampos(out msg: string): Boolean;
begin
  Result  := True;

  if (edtdata1.Text='') then
  begin
    Msg     := 'Informe a data inícial!';
    Result  := False;
    exit;
  end;

  if (edtdata2.Text='') then
  begin
    Msg     := 'Informe a data final!';
    Result  := False;
    exit;
  end;

  if (edtBuscar.ItemIndex = -1) or (edtbuscar.Text='') then
  begin
    Msg     := 'Selecione a opção de busca!';
    Result  := False;
    exit;
  end;

  if (edtsituacao.ItemIndex = -1) or (edtsituacao.Text='') then
  begin
    Msg     := 'Selecione a situação!';
    Result  := False;
    exit;
  end;

  if (edtordem.ItemIndex = -1) or (edtordem.Text='') then
  begin
    Msg     := 'Selecione a ordem do relatório!';
    Result  := False;
    exit;
  end;

  if (edtrelatorio.ItemIndex = -1) or (edtrelatorio.Text='') then
  begin
    Msg     := 'Selecione o modelo de relatório!';
    Result  := False;
    exit;
  end;

end;

function TFrmRelatorioTicket.Visualizar(out msg: string): Boolean;
var
model     : TModelTicket;
ModelEmp  : TModelEmpresa;
TempImage: Timage;
begin
  Result                := False;
  Model                 :=  TModelTicket.Create;

  Try
    try

        case edtrelatorio.ItemIndex of
          0,1,2,3,4:
          begin
            if Model.RelatorioTicket(edtdata1.Date,
                            edtdata2.Date,
                            edtBuscar.ItemIndex,
                            edtsituacao.ItemIndex,
                            edtordem.ItemIndex,
                            edtassociado.EditValue,
                            edtconvenio.EditValue,
                            edtSecretaria.EditValue,
                            edtusuario.EditValue
                            ) then
            begin
              Result  := true;
              //Chama o relatorio
              frxImpressao.Variables.Clear;

              case edtrelatorio.ItemIndex of
                0: begin
                  frxImpressao.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelTicketSimples.fr3');
                  frxImpressao.Variables['filtro']          :=quotedstr('Listagem de ticket simples período de '+edtdata1.Text+' até '+edtdata2.Text);
                  end;
                1: begin
                    frxImpressao.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelTicketCompleto.fr3');
                    frxImpressao.Variables['filtro']          :=quotedstr('Listagem de ticket completo período de '+edtdata1.Text+' até '+edtdata2.Text);
                  end;
                2: begin
                    frxImpressao.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelTicketAgrupadoAssociado.fr3');
                    frxImpressao.Variables['filtro']          :=quotedstr('Listagem de ticket período de '+edtdata1.Text+' até '+edtdata2.Text);
                  end;
                3: begin
                    frxImpressao.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelTicketAgrupadoSecretaria.fr3');
                    frxImpressao.Variables['filtro']          :=quotedstr('Listagem de ticket período de '+edtdata1.Text+' até '+edtdata2.Text);
                   end;
                4: begin
                    frxImpressao.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelTicketAgrupadoConvenio.fr3');
                    frxImpressao.Variables['filtro']          :=quotedstr('Listagem de ticket período de '+edtdata1.Text+' até '+edtdata2.Text);
                   end;

              end;

              ModelEmp               := TModelEmpresa.Create;
              Try
                ModelEmp.idempresa   := TSession.IDEMPRESA;
                ModelEmp.SelectCabecalhoReport(msg);

                frxImpressao.Variables['nrazao']          :=quotedstr(ModelEmp.razao);
                frxImpressao.Variables['nfantasia']       :=quotedstr(ModelEmp.fantasia);
                frxImpressao.Variables['nendereco']       :=quotedstr(ModelEmp.endereco);
                frxImpressao.Variables['nnumero']         :=quotedstr(ModelEmp.numero);
                frxImpressao.Variables['nbairro']         :=quotedstr(ModelEmp.bairro);
                frxImpressao.Variables['ntelefone']       :=quotedstr(ModelEmp.telefone);
                frxImpressao.Variables['nfone1']          :=quotedstr(ModelEmp.telefone2);
                frxImpressao.Variables['nfone2']          :=quotedstr(ModelEmp.celular);
                frxImpressao.Variables['nemail']          :=quotedstr(ModelEmp.email1);
                frxImpressao.Variables['ncnpj']           :=quotedstr(ModelEmp.cnpj);
                frxImpressao.Variables['nie']             :=quotedstr(ModelEmp.ie);

                try
                  // Decodifica a imagem Base64 e carrega no fluxo de memória
                  TempImage             := TImage.Create(nil);
                  TConesul.ConvBase64Img(ModelEmp.logo);
                  TempImage.Picture     :=TConesul.nfoto;
                  TConesul.nfoto.Free;
                  TempImage.Picture.SaveToFile(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg')
                finally
                  TempImage.Free;
                end;

                frxImpressao.Variables['wlogo']           :=quotedstr(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg');
                frxImpressao.Variables['ncep']            :=quotedstr(ModelEmp.cep);
                frxImpressao.Variables['ncidade']         :=quotedstr(ModelEmp.cidade);


              Finally
                FreeAndNil(ModelEmp);
              End;

              frxImpressao.Report.PrepareReport();
              frxImpressao.PrintOptions.ShowDialog := True;
              frxImpressao.ShowReport;

            end
            else
            msg := 'Nenhuma informação encontrada!';
          end;
          5:
          begin
            //Totalizado

            if Model.RelatorioTotalizadoTicket(edtdata1.Date,
                            edtdata2.Date,
                            edtBuscar.ItemIndex,
                            edtsituacao.ItemIndex,
                            edtordem.ItemIndex,
                            edtassociado.EditValue,
                            edtconvenio.EditValue,
                            edtSecretaria.EditValue,
                            edtusuario.EditValue
                            ) then
            begin
              Result  := true;
              //Chama o relatorio
              frxImpressao.Variables.Clear;

              case edtrelatorio.ItemIndex of
                5: begin
                  frxImpressao.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelTicketTotalizadoAssociado.fr3');
                  frxImpressao.Variables['filtro']          :=quotedstr('Listagem de ticket simples período de '+edtdata1.Text+' até '+edtdata2.Text);
                  end;

              end;

              ModelEmp               := TModelEmpresa.Create;
              Try
                ModelEmp.idempresa   := TSession.IDEMPRESA;
                ModelEmp.SelectCabecalhoReport(msg);

                frxImpressao.Variables['nrazao']          :=quotedstr(ModelEmp.razao);
                frxImpressao.Variables['nfantasia']       :=quotedstr(ModelEmp.fantasia);
                frxImpressao.Variables['nendereco']       :=quotedstr(ModelEmp.endereco);
                frxImpressao.Variables['nnumero']         :=quotedstr(ModelEmp.numero);
                frxImpressao.Variables['nbairro']         :=quotedstr(ModelEmp.bairro);
                frxImpressao.Variables['ntelefone']       :=quotedstr(ModelEmp.telefone);
                frxImpressao.Variables['nfone1']          :=quotedstr(ModelEmp.telefone2);
                frxImpressao.Variables['nfone2']          :=quotedstr(ModelEmp.celular);
                frxImpressao.Variables['nemail']          :=quotedstr(ModelEmp.email1);
                frxImpressao.Variables['ncnpj']           :=quotedstr(ModelEmp.cnpj);
                frxImpressao.Variables['nie']             :=quotedstr(ModelEmp.ie);

                try
                  // Decodifica a imagem Base64 e carrega no fluxo de memória
                  TempImage             := TImage.Create(nil);
                  TConesul.ConvBase64Img(ModelEmp.logo);
                  TempImage.Picture     :=TConesul.nfoto;
                  TConesul.nfoto.Free;
                  TempImage.Picture.SaveToFile(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg')
                finally
                  TempImage.Free;
                end;

                frxImpressao.Variables['wlogo']           :=quotedstr(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg');
                frxImpressao.Variables['ncep']            :=quotedstr(ModelEmp.cep);
                frxImpressao.Variables['ncidade']         :=quotedstr(ModelEmp.cidade);


              Finally
                FreeAndNil(ModelEmp);
              End;

              frxImpressao.Report.PrepareReport();
              frxImpressao.PrintOptions.ShowDialog := True;
              frxImpressao.ShowReport;

            end
            else
            msg := 'Nenhuma informação encontrada!';

          end;
        end;

    Except on e:exception do
      begin
        msg:= 'Erro ao carregar relatório: '+e.Message;
        raise;
      end;
    end;

  Finally
    FreeAndNil(model);
  End;
end;

end.
