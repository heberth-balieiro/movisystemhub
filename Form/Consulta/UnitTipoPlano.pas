unit UnitTipoPlano;

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
  Vcl.Menus, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, dxGDIPlusClasses,
  ACBrBase, ACBrEnterTab, Vcl.Tabs, frxClass, frxDBSet;

type
  TFrmTipoPlano = class(TForm)
    pHeader: TPanel;
    Label4: TLabel;
    Panel2: TPanel;
    btnNovo: TSpeedButton;
    Panel3: TPanel;
    btneditar: TSpeedButton;
    ds: TDataSource;
    pBusca: TPanel;
    Panel7: TPanel;
    btnBusca: TSpeedButton;
    edtBusca: TEdit;
    cxGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    coll1: TcxGridDBColumn;
    coll3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Popup: TPopupMenu;
    btnvisualizar: TMenuItem;
    N1: TMenuItem;
    btnListagem: TMenuItem;
    Relatrio1: TMenuItem;
    PPopPap: TPanel;
    Image1: TImage;
    Panel1: TPanel;
    btnExcluir: TSpeedButton;
    PanelLimpar: TPanel;
    btnFiltro: TSpeedButton;
    TabSituacao: TTabSet;
    frxRelatorio: TfrxReport;
    frxDBListagemtipo: TfrxDBDataset;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btneditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnvisualizarClick(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
    procedure TabSituacaoChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure btnListagemClick(Sender: TObject);
    procedure cxGridDBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    
  private

    procedure OpenCadTela(id: integer;str:string);

    procedure RefreshTela;

    procedure TerminatePesquisa(Sender: TObject);
    procedure TerminateDelete(Sender: TObject);
    procedure CarregarDadosGrid;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTipoPlano: TFrmTipoPlano;

implementation

{$R *.dfm}

uses UnitTipoCad, UConeSul, UDM, Vcl.Loading, Vcl.Session,
  uJKDialog,  Model.Empresa, Model.Tipoplano;

procedure TFrmTipoPlano.OpenCadTela(id: integer;str:string);
begin
  TNavigation.ExecuteOnClose    := RefreshTela;
  TNavigation.ParamInt          := id;
  TNavigation.ParamsStr         := Str;
  TNavigation.OpenModal(TFrmTipoCad, FrmTipoCad);

end;

procedure TFrmTipoPlano.RefreshTela;
begin

  Try
    TLoading.Show(FrmTipoPlano,'Listando dados...');

    TLoading.ExecuteThread(procedure
        begin
          carregardadosgrid;
        end, TerminatePesquisa);
  Finally
    TLoading.Hide;
  End;

end;

procedure TFrmTipoPlano.TabSituacaoChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  RefreshTela;
end;

procedure TFrmTipoPlano.TerminateDelete(Sender: TObject);
begin
  TLoading.Hide;

  if Sender is TThread then
  if Assigned(TThread(Sender).FatalException) then
  begin
    JKDialog('Erro',Exception(TThread(sender).FatalException).Message, tdErro);
    exit;
  end;

  RefreshTela;
end;

procedure TFrmTipoPlano.TerminatePesquisa(Sender: TObject);
begin
  TLoading.Hide;

  if Sender is TThread then
  if Assigned(TThread(Sender).FatalException) then
  begin
    JKDialog('Erro',Exception(TThread(sender).FatalException).Message, tdErro);
    exit;
  end;

end;

procedure TFrmTipoPlano.btnBuscaClick(Sender: TObject);
begin
  RefreshTela;
end;

procedure TFrmTipoPlano.btneditarClick(Sender: TObject);
begin
  if not DM.TabConsTipoPlano.Eof then
  begin
    if ds.DataSet.FieldByName('id_tipo').AsInteger > 0 then
    begin
      OpenCadTela(ds.DataSet.FieldByName('id_tipo').AsInteger,'E');
    end
    else
    JKDialog('Aviso','Selecione um registro da lista!', tdAlerta)
  end
  else
  begin
    JKDialog('Aviso','Realize um filtro!', tdAlerta);
  end;
end;

procedure TFrmTipoPlano.btnExcluirClick(Sender: TObject);
var
Model : TModelTipoplano;
msg:string;
begin
  if not DM.TabConsTipoPlano.Eof then
  begin

    if JKDialog('Aviso', 'Deseja excluir o tipo selecionada?', tdMensagem)  then
    begin
        TLoading.Show(FrmTipoPlano,'Excluindo registro aguarde...');
        TLoading.ExecuteThread(procedure
        begin
          Try
            Model             := TModelTipoplano.Create;
            Model.idtipo      := ds.DataSet.FieldByName('id_tipo').AsInteger;
            Model.Excluir(msg);
          Finally
            Model.Free;
          End;
        end, TerminateDelete);
    end;

  end
  else
  begin
    JKDialog('Aviso','Realize um filtro!', tdAlerta);
  end;
end;

procedure TFrmTipoPlano.btnFiltroClick(Sender: TObject);
begin
  EdtBusca.Clear;
  RefreshTela;
end;

procedure TFrmTipoPlano.btnListagemClick(Sender: TObject);
var
Model :TModelEmpresa;
msg:String;
TempImage: Timage;
begin
  //Listagem grupo

  Try
    if not DM.TabConsTipoPlano.Eof then
    begin
      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelListagemTipo.fr3');
      Try
        DM.TabConsTipoPlano.DisableControls;

        Model               := TModelEmpresa.Create;
        Try
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

          FrxRelatorio.Variables['wlogo']           :=quotedstr(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg');
          FrxRelatorio.Variables['ncep']            :=quotedstr(model.cep);
          FrxRelatorio.Variables['ncidade']         :=quotedstr(model.cidade);
          FrxRelatorio.Variables['filtro']          :=quotedstr('Listagem de Grupo');

        Finally
          model.Free;
        End;

        FrxRelatorio.Report.PrepareReport();
        FrxRelatorio.ShowReport;
      Finally
        DM.TabConsTipoPlano.First;
        DM.TabConsTipoPlano.EnableControls;
      End;

    end
    else
    begin
      JKDialog('Aviso','Nenhum registro encontrato!', tdAlerta);
    end;

  Except

  End;
end;

procedure TFrmTipoPlano.btnNovoClick(Sender: TObject);
begin
  OpenCadTela(0,'N');
end;

procedure TFrmTipoPlano.btnvisualizarClick(Sender: TObject);
begin
  if not dm.TabConsTipoPlano.Eof then
  begin
    if ds.DataSet.FieldByName('id_tipo').AsInteger > 0 then
    begin

      OpenCadTela(ds.DataSet.FieldByName('id_tipo').AsInteger,'V');
    end
    else
    JKDialog('Aviso','Selecione um registro da lista!', tdAlerta);
  end
  else
  begin
    JKDialog('Aviso','Realize um filtro!', tdAlerta);
  end;
end;

procedure TFrmTipoPlano.CarregarDadosGrid;
var
Model : TModelTipoPlano;
msg:string;
begin

  Try
    Try
      Model    := TModelTipoPlano.Create;
      dm.TabConsTipoPlano.EmptyDataSet;
      ds.DataSet.Close;
      ds.DataSet.Open;

      if Model.Localizar(msg, Tabsituacao.TabIndex, trim(edtBusca.Text)) then
      //else
      //JKDialog('Aviso',msg, tdAlerta);

    Except on e:exception do
      begin
        JKDialog('Erro',msg, tdErro);
        raise;
      end;
    End;

  Finally
    Model.Free;
  End;
end;

procedure TFrmTipoPlano.cxGridDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  btneditar.Click;
end;

procedure TFrmTipoPlano.cxGridDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    btneditar.Click;
  end;
end;

procedure TFrmTipoPlano.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    DM.TabConsTipoPlano.Close;
    FrmTipoPlano := nil;
end;

end.
