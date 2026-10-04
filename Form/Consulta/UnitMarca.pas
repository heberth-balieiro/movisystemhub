unit UnitMarca;

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
  cxClasses, cxGridCustomView, cxGrid, Vcl.Menus, dxGDIPlusClasses, ACBrBase,
  ACBrEnterTab, Vcl.Tabs, frxClass, frxDBSet, UFormNovoBasePesquisa,
  cxContainer, System.ImageList, Vcl.ImgList, cxImageList, DBAccess, Uni,
  cxMaskEdit, cxDropDownEdit, cxTextEdit, cxGroupBox,
  model.Marca, Controller.Marca, dxmdaset, System.Generics.Collections,
  Vcl.ButtonStylesAttributes, Vcl.StyledButton;

type
  TFrmMarca = class(TFormNovoBasePesquisa)
    Popup: TPopupMenu;
    btnvisualizar: TMenuItem;
    frxRelatorio: TfrxReport;
    frxDBListagemMarca: TfrxDBDataset;
    mdPesquisa: TdxMemData;
    mdPesquisaid_marca: TIntegerField;
    mdPesquisacodigo: TIntegerField;
    mdPesquisamarca: TStringField;
    mdPesquisaativo: TStringField;
    GridRecId: TcxGridDBColumn;
    Gridid_marca: TcxGridDBColumn;
    Gridcodigo: TcxGridDBColumn;
    Gridmarca: TcxGridDBColumn;
    Gridativo: TcxGridDBColumn;
    procedure btnLimparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure Novo        ;override;
    Procedure Pesquisa    ;override;
    Procedure Editar      ;override;
    Procedure Excluir     ;override;
    Procedure Listagem    ;override;
    Procedure Relatorio   ;override;
  end;

var
  FrmMarca: TFrmMarca;
  ObjMarca: TModelMarca;
  ContMarca : TMarcaController;

implementation

{$R *.dfm}

uses UnitMarcaCad, Vcl.Loading, uJKDialog, UConeSul, Vcl.Session;

procedure TFrmMarca.btnLimparClick(Sender: TObject);
begin
  inherited;
  mdPesquisa.Close;
end;

procedure TFrmMarca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmMarca  := nil;
end;

procedure TFrmMarca.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;
end;

procedure TFrmMarca.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'MARCA';
  TitleText   := 'Pesquisa de Marca';
end;

procedure TFrmMarca.Listagem;
begin
  inherited;
  try
    JKDialog('Alerta','Funcionalidade em desenvolvimento.', tdAlerta);
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmMarca.Novo;
begin
  inherited;
  if not Assigned(FrmMarcaCad) then
  FrmMarcaCad := TFrmMarcaCad.Create(Application);
  FrmMarcaCad.ParamsStr  := 'N';
  FrmMarcaCad.ShowModal;
end;

procedure TFrmMarca.Editar;
begin
  inherited;
  Try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
      begin
        if not Assigned(FrmMarcaCad) then
        FrmMarcaCad := TFrmMarcaCad.Create(Application);
        FrmMarcaCad.ParamsStr  := 'E';
        FrmMarcaCad.ParamsInt  := mdPesquisaid_marca.AsInteger;
        if mdPesquisaid_marca.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;
        FrmMarcaCad.Show;
      end;
    end
    else
    begin
      JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmMarca.Excluir;
begin
  inherited;
  Try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
      begin

          ContMarca    := Nil;
          ContMarca    := TMarcaController.Create;

          if mdPesquisaid_marca.AsInteger = 0 then
          begin
            JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
            exit;
          end;

          Try
            if ContMarca.ExcluidoCancelado(mdPesquisaid_marca.AsInteger, TSession.ID_USUARIO) then
            begin
              Pesquisa;
              JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
            end;
          Finally
            FreeAndNil(ContMarca);
          End;
      end;

    end
    else
    begin
      JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmMarca.Pesquisa;
var
List    : TObjectList<TModelMarca>;
nCampo, nSituacao  : String;
begin
  inherited;
  List    := Nil;
  nCampo  := '';

  Try
    if trim(edtBusca.Text) <> '' then
    nCampo     := Trim(edtBusca.Text);


    case cxAtivo.ItemIndex of
      1: nSituacao := 'S';
      2: nSituacao := 'N';
    end;

    ContMarca      := TMarcaController.Create;

    Try
      List  := ContMarca.ListarTodos(nCampo, nSituacao);

      mdPesquisa.Close;
      mdPesquisa.FieldDefs.Clear;

      if (List = nil) or (List.Count = 0) then
      begin
        mdPesquisa.Close;
        exit;
      end;

      if not mdPesquisa.Active then
        mdPesquisa.Open;

      mdPesquisa.DisableControls;

      for var Item in List do
      begin
        mdPesquisa.Append;
        mdPesquisaid_marca.AsInteger    := Item.id_marca;
        mdPesquisacodigo.AsInteger      := Item.Codigo;
        mdPesquisamarca.AsString        := Item.Marca;
        mdPesquisaativo.AsString        := Item.Ativo;
        mdPesquisa.Post;
      end;
      mdPesquisa.First;
      mdPesquisa.EnableControls;

    Finally
      FreeAndNil(ContMarca);
      if Assigned(List) then
        List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmMarca.Relatorio;
begin
  inherited;
  try
    JKDialog('Alerta','Funcionalidade em desenvolvimento.', tdAlerta);
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

end.
