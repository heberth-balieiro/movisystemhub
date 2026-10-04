unit UnitCarteirinha_old;

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
  Vcl.Tabs, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxGDIPlusClasses, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Navigation, UDM, UnitPrincipal, Vcl.Loading,
  Model.Carteirinha, uJKDialog, Model.Empresa, Vcl.Session, UConeSul, DBAccess,
  Uni, Vcl.Validacoes, Vcl.ComCtrls;

type
  TFrmCarteira = class(TFrmModeloConsulta)
    Gmatricula: TcxGridDBColumn;
    gcodigo: TcxGridDBColumn;
    Associado: TcxGridDBColumn;
    cpf: TcxGridDBColumn;
    Secretaria: TcxGridDBColumn;
    digital: TcxGridDBColumn;
    validade: TcxGridDBColumn;
    btnImprimir: TMenuItem;
    frxDBCateira: TfrxDBDataset;
    frxRelatorio: TfrxReport;
    dscarteirinha: TUniDataSource;
    N2: TMenuItem;
    btnSincronizar: TMenuItem;
    PageControl: TPageControl;
    TabAssociado: TTabSheet;
    TabDependente: TTabSheet;
    cxGridDependente: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnSincronizarClick(Sender: TObject);
    procedure GridCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    Procedure Pesquisa;override;
    procedure OpenCadTela(id: integer;str:string);override;
    Procedure editar;override;
    Procedure Excluir;override;
    { Public declarations }
  end;

var
  FrmCarteira: TFrmCarteira;

implementation

{$R *.dfm}

{ TFrmCarteira }

Uses UnitCadCarteira;

procedure TFrmCarteira.btnImprimirClick(Sender: TObject);
var
Model     :TModelEmpresa;
Modelcat  :TModelCarteirinha;
msg:string;
TempImage: Timage;
begin
  inherited;
  //Imprimir Carteira

  if not DM.TabConsCarteira.Eof then
  begin

    FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelCarteiras_Modelo1.fr3');

      Model             := TModelEmpresa.Create;
      Modelcat          := TModelCarteirinha.Create;
      Try
         //Buscar dados da carteira
        Try
          Modelcat.ImprimirCarteira(ds.DataSet.FieldByName('id_socio').AsInteger);
        Finally
          Modelcat.Free;
        End;

        Model.idempresa   := TSession.IDEMPRESA;
        Model.SelectCabecalhoReport(msg);

        FrxRelatorio.Variables.Clear;
        FrxRelatorio.Variables['nrazao']          :=quotedstr(Model.razao);
        FrxRelatorio.Variables['nfantasia']       :=quotedstr(model.fantasia);
        FrxRelatorio.Variables['nendereco']       :=quotedstr(model.endereco);
        FrxRelatorio.Variables['nnumero']         :=quotedstr(model.numero);
        FrxRelatorio.Variables['nbairro']         :=quotedstr(model.bairro);
        FrxRelatorio.Variables['ntelefone']       :=quotedstr(model.telefone);
        FrxRelatorio.Variables['nfone1']          :=quotedstr(model.telefone2);
        FrxRelatorio.Variables['nfone2']          :=quotedstr(model.celular);
        FrxRelatorio.Variables['nemail']          :=quotedstr(model.email1);
        FrxRelatorio.Variables['ncnpj']           :=quotedstr(model.cnpj);
        FrxRelatorio.Variables['nie']             :=quotedstr(model.ie);

        TempImage   := TImage.Create(nil);
        try
          // Decodifica a imagem Base64 e carrega no fluxo de memória  logo da empresa

          TConesul.ConvBase64Img(model.logo);
          TempImage.Picture    :=TConesul.nfoto;
          TConesul.nfoto.Free;
          TempImage.Picture.SaveToFile(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg');
        finally
          TempImage.Free;
        end;

        TempImage   := TImage.Create(nil);
        try
          // foto do associado
          if DM.TabCarteirinhaImpresso.FieldByName('foto').AsString <>'' then
          begin
            TConesul.ConvBase64Img(dscarteirinha.dataset.FieldByName('foto').AsString);
            TempImage.Picture    :=TConesul.nfoto;
            TConesul.nfoto.Free;
            TempImage.Picture.SaveToFile(ExtractFilePath(Application.ExeName)+'Temp\Foto.jpeg');
          end;
        finally
          TempImage.Free;
        end;
        FrxRelatorio.Variables['nfoto']           :=quotedstr(ExtractFilePath(Application.ExeName)+'Temp\Foto.jpeg');
        FrxRelatorio.Variables['wlogo']           :=quotedstr(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg');
        FrxRelatorio.Variables['ncep']            :=quotedstr(model.cep);
        FrxRelatorio.Variables['ncidade']         :=quotedstr(model.cidade);
        FrxRelatorio.Variables['filtro']          :=quotedstr('Carteira ASMUV');

      Finally
        model.Free;
      End;

      FrxRelatorio.Report.PrepareReport();
      FrxRelatorio.ShowReport;
    

  end
  else
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  end;


end;

procedure TFrmCarteira.btnSincronizarClick(Sender: TObject);
var
ModelVal : TValidacao;
begin
  inherited;
  // verificar se esta habilitado para api
          ModelVal      := TValidacao.create;
          Try
            if ModelVal.ValidarUsoAppCarteiria(TSession.idempresa) then
            begin
              FrmPrincipal.Timeenvio  := 6;
              Frmprincipal.TSincronizarApp.Enabled:= False;
              Frmprincipal.TSincronizarApp.Enabled:= True;
            end;
          Finally
            ModelVal.free;
          End;
end;

procedure TFrmCarteira.editar;
begin
  inherited;
  if not DM.TabConsCarteira.Eof then
  begin
    if ds.DataSet.FieldByName('id_carteira').AsInteger > 0 then
    begin
      OpenCadTela(ds.DataSet.FieldByName('id_carteira').AsInteger,'E');
    end
    else
    JKDialog('Aviso','Selecione um registro da lista!', tdAlerta)
  end
  else
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  end;
end;

procedure TFrmCarteira.Excluir;
var
msg:string;
Model : TModelCarteirinha;
begin
  inherited;
  if not DM.TabConsCarteira.Eof then
    begin

      if JKDialog('Aviso', 'Deseja excluir a carteira selecionada?', tdMensagem)  then
      begin
          TLoading.Show(FrmCarteira,'Excluindo registro aguarde...');
          TLoading.ExecuteThread(procedure
          begin
            Model   := TModelCarteirinha.Create;
            Try
              Model.idcarteira  := ds.DataSet.FieldByName('id_carteira').AsInteger;
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

procedure TFrmCarteira.GridCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  editar;
end;

procedure TFrmCarteira.OpenCadTela(id: integer; str: string);
begin
  inherited;
  TNavigation.ParamInt          := id;
  TNavigation.ParamsStr         := str;
  TNavigation.OpenModal(TFrmCarteiraCad, FrmCarteiraCad);
end;

procedure TFrmCarteira.Pesquisa;
var
msg:string;
Model : TModelCarteirinha;
begin
  inherited;
  Try
    TLoading.Show(FrmCarteira,'Listando dados...');

    Model   := TModelCarteirinha.Create;
    Try
      Try
        ds.DataSet.Open;
        dm.TabConsCarteira.EmptyDataSet;

        if Model.Localizar(msg, Tabsituacao.TabIndex, trim(edtBusca.Text)) then
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
    TLoading.Hide;
  End;
end;

end.
