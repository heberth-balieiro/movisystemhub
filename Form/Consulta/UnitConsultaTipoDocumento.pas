unit UnitConsultaTipoDocumento;

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
  Vcl.StdCtrls, Vcl.Buttons,System.Generics.Collections, cxContainer, cxGroupBox;

type
  TFrmConsultaTipoDocumento = class(TFrmModeloConsulta)
    GridColumn1: TcxGridDBColumn;
    GridColumn2: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
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
  FrmConsultaTipoDocumento: TFrmConsultaTipoDocumento;

implementation

{$R *.dfm}

uses Vcl.Navigation, UnitCadTipoDocumento, Controller.TipoDocumento, UDM,
  Model.TipoDocumento,  uJKDialog, Vcl.Validacoes;

{ TFrmConsultaTipoDocumento }

procedure TFrmConsultaTipoDocumento.editar;
begin
  inherited;
  if not DM.TabContipodoc.Eof then
  begin
    if ds.DataSet.FieldByName('id_documento').AsInteger > 0 then
    begin
      OpenCadTela(ds.DataSet.FieldByName('id_documento').AsInteger,'E');
    end
    else
    JKDialog('Aviso','Selecione um registro da lista!', tdAlerta)
  end
  else
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  end;
end;

procedure TFrmConsultaTipoDocumento.Excluir;
var
msg:string;
ModelVal    : TValidacao;
Controller  : TTipoDocumentoController;
begin
  inherited;
  if not DM.TabContipodoc.Eof then
  begin
    if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
    begin
      Controller  := TTipoDocumentoController.Create;
      try
        Try
          if Controller.Excluir(ds.DataSet.FieldByName('id_documento').AsInteger) then
          begin
            Pesquisa;
          end;
        except on e:exception do
          begin
          JKDialog('Erro','Erro ao exclui o registro.'+#13+e.Message, tdAlerta);
          end;
        end;

      Finally
        Controller.Free;
      End;

    end;

  end
  else
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  end;

end;

procedure TFrmConsultaTipoDocumento.FormShow(Sender: TObject);
begin
  inherited;
  Tela  := 'Documento';
end;

procedure TFrmConsultaTipoDocumento.OpenCadTela(id: integer; str: string);
begin
  inherited;
  TNavigation.ExecuteOnClose    := Pesquisa;
  TNavigation.ParamInt          := id;
  TNavigation.ParamsStr         := str;
  TNavigation.OpenModal(TFrmCadTipoDocumento, FrmCadTipoDocumento);
end;

procedure TFrmConsultaTipoDocumento.Pesquisa;
var
msg, FiltroAtivo,FiltroDescricao :string;
Controller  : TTipoDocumentoController;
Lista       : TObjectList<TTipoDocumento>;
begin
  inherited;
  FiltroAtivo     := '';
  FiltroDescricao := '';

  case Tabsituacao.TabIndex of
    1:FiltroAtivo := 'S';
    2:FiltroAtivo := 'N';
  end;

  if trim(edtBusca.Text) <> '' then
  begin
    FiltroDescricao := trim(edtBusca.Text);
  end;
  Controller := TTipoDocumentoController.Create;
  Try
    Lista   := Controller.ListarTodos(FiltroDescricao, FiltroAtivo);

    //popular TabConTipoDoc

    dm.TabContipodoc.DisableControls;
    try
      dm.TabContipodoc.EmptyDataSet;

      for var Item in Lista do
      begin
        dm.TabContipodoc.Append;
        dm.TabContipodoc.FieldByName('id_documento').AsInteger  := Item.Id_documento;
        dm.TabContipodoc.FieldByName('codigo').Asinteger        := Item.Codigo;
        dm.TabContipodoc.FieldByName('descricao').AsString      := Item.Descricao;
        dm.TabContipodoc.FieldByName('ativo').AsString          := Item.Ativo;
        dm.TabContipodoc.Post;
      end;
    finally
      Lista.Free;
      dm.TabContipodoc.EnableControls;
      dm.TabContipodoc.First;
    end;
  Finally
    Controller.Free;
  End;

end;

end.
