unit UnitSecretaria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Navigation, Vcl.Menus,
  dxGDIPlusClasses, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxMaskEdit, Vcl.ComCtrls, ACBrBase, ACBrEnterTab, frxClass, frxDBSet;

type
  TFrmSecretaria = class(TForm)
    pHeader: TPanel;
    Label4: TLabel;
    PanelInserir: TPanel;
    btnNovo: TSpeedButton;
    Paneleditar: TPanel;
    btnEditar: TSpeedButton;
    ds: TDataSource;
    pBusca: TPanel;
    Panel7: TPanel;
    btnBusca: TSpeedButton;
    edtBusca: TEdit;
    Popup: TPopupMenu;
    Listagem1: TMenuItem;
    Relatrio1: TMenuItem;
    PPopPap: TPanel;
    Image1: TImage;
    Panelexcluir: TPanel;
    btnexcluir: TSpeedButton;
    Tab: TTabControl;
    cxGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    coll1: TcxGridDBColumn;
    coll2: TcxGridDBColumn;
    coll3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    ACBrEnterTab1: TACBrEnterTab;
    frxRelatorio: TfrxReport;
    frxDBSecretariaListagem: TfrxDBDataset;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnexcluirClick(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure TabChange(Sender: TObject);
    procedure Listagem1Click(Sender: TObject);
  private
    bookmark: TBookmark;
    procedure OpenCadSede(id_Sede: integer; Str:String);
    procedure RefreshSede;
    Procedure Localiza;
    
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSecretaria: TFrmSecretaria;

implementation

{$R *.dfm}

uses UnitSecretariaCad, UDM, Model.Secretaria, Vcl.Loading, UnitPrincipal,
  uJKDialog, model.Empresa, Vcl.Session, UConeSul;

{$REGION 'Filtragem'}

procedure TFrmSecretaria.btnBuscaClick(Sender: TObject);
begin
  RefreshSede;
end;

procedure TFrmSecretaria.RefreshSede;
begin
  if dm.TabConsSecretaria.Active then
  ds.DataSet.Close;
  Localiza;
end;

procedure TFrmSecretaria.TabChange(Sender: TObject);
begin
  RefreshSede;
end;

procedure TFrmSecretaria.Listagem1Click(Sender: TObject);
var
Model   :TModelEmpresa;
msg:string;
TempImage: Timage;
begin
  //Listagem Secretaria
  if not dm.TabConsSecretaria.Eof then
  begin

    FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelSecretariaListagem.fr3');
    Try
      DM.TabConsSecretaria.DisableControls;

      Model             := TModelEmpresa.Create;
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
          TempImage   := TImage.Create(nil);
          TConesul.ConvBase64Img(model.logo);
          TempImage.Picture    :=TConesul.nfoto;
          TConesul.nfoto.Free;
          TempImage.Picture.SaveToFile(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg')

        finally
          TempImage.Free;
        end;

        FrxRelatorio.Variables['wlogo']           :=quotedstr(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg');
        FrxRelatorio.Variables['ncep']            :=quotedstr(model.cep);
        FrxRelatorio.Variables['ncidade']         :=quotedstr(model.cidade);
        FrxRelatorio.Variables['filtro']          :=quotedstr('Todos ativos/inativos');

      Finally
        model.Free;
      End;

      FrxRelatorio.Report.PrepareReport();
      FrxRelatorio.ShowReport;
    Finally
      DM.TabConsSecretaria.First;
      DM.TabConsSecretaria.EnableControls;
    End;

  end
  else
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  end;
end;

procedure TFrmSecretaria.Localiza;
var
Model : TModelsecretaria;
msg:string;
begin
  Try
    Model       := TModelsecretaria.Create;
    Model.Pesquisa(msg,Trim(edtbusca.Text),tab.TabIndex);
    cxgrid.SetFocus;
  Finally
    Model.Free;
  End;
end;


{$ENDREGION}


procedure TFrmSecretaria.OpenCadSede(id_sede: integer;Str:String);
begin
  TNavigation.ExecuteOnClose    := RefreshSede;
  TNavigation.ParamInt          := id_sede;
  TNavigation.ParamsStr         := Str;
  TNavigation.OpenModal(TFrmSecretariaCad, FrmSecretariaCad);
end;

procedure TFrmSecretaria.btnEditarClick(Sender: TObject);
begin
  if not dm.TabConsSecretaria.Eof then
  begin
    if ds.DataSet.FieldByName('id_secretaria').AsInteger > 0 then
    begin
      Try
        OpenCadSede(ds.DataSet.FieldByName('id_secretaria').AsInteger,'E');
      Finally
        RefreshSede;
      End;
    end
    else
    JKDialog('Aviso','Selecione um registro!', tdAlerta);
  end
  else
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  end;
end;

procedure TFrmSecretaria.btnexcluirClick(Sender: TObject);
var
Model : TModelSecretaria;
msg:string;
begin

  if not dm.TabConsSecretaria.Eof then
  begin

    if JKDialog('Aviso', 'Deseja excluir a secretaria selecionada?', tdMensagem)  then
    begin
       Try
         Try
            model               := TModelSecretaria.Create;
            model.idsecretaria  := ds.DataSet.FieldByName('id_secretaria').AsInteger;
            model.Delete(msg);
          Finally
            Model.Free;
          End;

       Finally
        RefreshSede;
       End;
    end;

  end
  else
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  end;
end;

procedure TFrmSecretaria.btnNovoClick(Sender: TObject);
begin
  OpenCadSede(0,'N');
end;

procedure TFrmSecretaria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    Frmsecretaria := nil;
end;

procedure TFrmSecretaria.Image1Click(Sender: TObject);
begin
  PopUp.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;


end.
