unit UnitVeiculoAnexoDoc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseAnexo, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue, Vcl.Menus, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB,
  cxDBData, ACBrBase, ACBrEnterTab, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxMaskEdit,
  cxButtonEdit, Vcl.StdCtrls, cxButtons, cxTextEdit, cxGroupBox, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ExtDlgs, Model.Anexo, DBAccess, Uni,
  System.NetEncoding, System.IOUtils, Winapi.ShellAPI;

type
  TFrmVeiculoAnexoDoc = class(TFrmAnexoPadrao)
    dsAnexo: TUniDataSource;
    GridDescricao: TcxGridDBColumn;
    GridExtensao: TcxGridDBColumn;
    GridColumn1: TcxGridDBColumn;
    //procedure FormShow(Sender: TObject);
    //procedure EdtCaminhoPropertiesButtonClick(Sender: TObject;
    //  AButtonIndex: Integer);
  private

    { Private declarations }
  public

//    Function Inserir(out msg: string): Boolean; override;
//    Function Validarcampos(out msg: string):Boolean;override;
//    Procedure CarregarDados; override;
//    Procedure Excluir; override;
//    function Visualizar(out msg: string): Boolean; override;
    { Public declarations }
  end;

var
  FrmVeiculoAnexoDoc: TFrmVeiculoAnexoDoc;


implementation

{$R *.dfm}

uses Vcl.Navigation, UConeSul, Vcl.Session, uJKDialog, UDM;

//procedure TFrmVeiculoAnexoDoc.CarregarDados;
//begin
//  inherited;
//  ModelAnexo   := TModelAnexo.Create;
//
//  Try
//    ModelAnexo.idempresa    := TSession.IDEMPRESA;
//
//    Try
//      if ModelAnexo.ListarAnexo(TNavigation.ParamInt,'VEICULO') then
//      begin
//
//      end;
//    except on e:exception do
//      begin
//        JKDialog('Erro','Erro ao carregar os anexos!', tdErro);
//        raise;
//      end;
//    End;
//
//  Finally
//    //ModelAnexo.Free;
//  End;
//
//end;
//
//procedure TFrmVeiculoAnexoDoc.EdtCaminhoPropertiesButtonClick(Sender: TObject;
//  AButtonIndex: Integer);
//begin
//  inherited;
//  //
//end;
//
//procedure TFrmVeiculoAnexoDoc.Excluir;
//begin
//  inherited;
//  ModelAnexo   := TModelAnexo.Create;
//
//  Try
//    Try
//      if ModelAnexo.ExcluirDados(dsanexo.DataSet.FieldByName('id_anexo').AsInteger, TSession.IDEMPRESA) then
//      begin
//        CarregarDados;
//        JKDialog('Sucesso','Anexo excluido do banco de dados.', tdsucesso);
//      end;
//    except on e:exception do
//      begin
//        JKDialog('Erro',e.Message, tdErro);
//        raise;
//      end;
//    End;
//
//  Finally
//    ModelAnexo.Free;
//  End;
//end;
//
//procedure TFrmVeiculoAnexoDoc.FormShow(Sender: TObject);
//begin
//  inherited;
//  Tela  := 'Controle Veículo';
//end;
//
//function TFrmVeiculoAnexoDoc.Inserir(out msg: string): Boolean;
//begin
//  Result  := False;
//
//  ModelAnexo      := TmodelAnexo.Create;
//
//  Try
//    ModelAnexo.idreferencia     :=  TNavigation.ParamInt;
//    ModelAnexo.referencia       :=  'VEICULO';
//    ModelAnexo.arquivo          :=  Trim(edtdescricao.Text);
//    ModelAnexo.extensao         :=  TConeSul.CapturarExtensaoArquivo(edtCaminho.Text);
//    ModelAnexo.base64           :=  TconeSul.ArquivoParaBase64(edtcaminho.Text);
//
//    ModelAnexo.idempresa        :=  TSession.IDEMPRESA;
//    ModelAnexo.idusuario        :=  TSession.ID_USUARIO;
//
//    try
//      if ModelAnexo.GravarDados then
//      begin
//        Result  := True;
//        msg     := 'Registro inserido no banco de dados.';
//        edtcaminho.Clear;
//        edtdescricao.Clear;
//        CarregarDados;
//      end;
//    Except on e:exception do
//      begin
//        ModelAnexo.Free;
//        msg:= 'Erro ao inserir o anexo.';
//        raise;
//      end;
//    end;
//
//  Finally
//    //ModelAnexo.Free;
//  End;
//
//end;
//
//function TFrmVeiculoAnexoDoc.Validarcampos(out msg: string): Boolean;
//begin
//  Result  := True;
//
//  if edtcaminho.Text='' then
//  begin
//    msg := 'Nenhum arquivo carregado para anaxar!';
//    Result  := False;
//    exit;
//  end;
//
//  if edtdescricao.Text= '' then
//  begin
//    msg := 'Informe uma descrição do arquivo!';
//    Result  := False;
//    exit;
//  end;
//end;
//
//function TFrmVeiculoAnexoDoc.Visualizar(out msg: string): Boolean;
//var
//  Base64, ext :String;
//begin
//  Result  := False;
//
//  if (dm.TabAnexo.RecordCount > 0) or (dsanexo.DataSet.FieldByName('id_anexo').AsInteger > 0) then
//  begin
//    ModelAnexo   := TModelAnexo.Create;
//    TConesul.LimparPasta(dm.nDirArquivo+'/Temp');
//
//    Try
//      Try
//        if ModelAnexo.Visualizar(dsanexo.DataSet.FieldByName('id_anexo').AsInteger, TSession.IDEMPRESA, Base64, ext) then
//        begin
//          VisualizarAnexo(base64, ext);
//          Result  := True;
//        end;
//      except on e:exception do
//        begin
//          msg   := 'Erro:' + e.Message;
//          JKDialog('Erro',e.Message, tdErro);
//          raise;
//        end;
//      End;
//
//    Finally
//      ModelAnexo.Free;
//    End;
//  end
//  else
//  Msg   := 'Selecione um registro!';
//
//end;

end.
