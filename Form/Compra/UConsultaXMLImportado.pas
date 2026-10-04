{   Tarefas da tela

  1 -OK Criar layout.
  2 -OK onshow passar dados da tela e carregamento de data
  3 -ok onclose colocar codigo nil
  4 -ok ordenar campos filtro
  5 -ok funcao de filtragem
  6 -ok funcao de limpar campos e gris.
  7 -ok funcao de novo mudar pra importar
  8 - funcao de editar.
  9 - funcao de visualizar xml
  10 - funcao de visualizar em pdf.
  11 - funcao para evento da nfe para manifestar ...
  12 - funcao de listagem
  13 - funcao de relatorio.
  14 -OK Criar unit da tela controller.
  15 -OK criar unit model.
  16 - Criar unit dao.
  17 - ler periodo do ini para intervalo de data
  18 -


}

unit UConsultaXMLImportado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormNovoBasePesquisa, cxGraphics,
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
  cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData,
  cxContainer, Vcl.ButtonStylesAttributes, System.ImageList, Vcl.ImgList,
  cxImageList, Vcl.Menus, cxGridTableView, cxClasses, DBAccess, Uni, ACBrBase,
  ACBrEnterTab, Vcl.StyledButton, cxMaskEdit, cxDropDownEdit, dxGDIPlusClasses,
  Vcl.ExtCtrls, cxTextEdit, cxGroupBox, Vcl.Buttons, Vcl.StdCtrls, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridDBTableView, cxGrid,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, dxmdaset, UController.DistribuicaoDFE, Model.DistribuicaoDFE,
  Vcl.Session, uJKDialog, cxBlobEdit, cxMemo,Winapi.ShellAPI;

type
  TFrmConsultaXMLImportado = class(TFormNovoBasePesquisa)
    cxdata2: TcxDateEdit;
    cxdata1: TcxDateEdit;
    Label6: TLabel;
    Label4: TLabel;
    mdPesquisa: TdxMemData;
    mdPesquisaid_doc: TIntegerField;
    mdPesquisansu: TIntegerField;
    mdPesquisatipo_documento: TStringField;
    mdPesquisachave_acesso: TStringField;
    mdPesquisacnpj_emitente: TStringField;
    mdPesquisax_nome_emitente: TStringField;
    mdPesquisanumero_nfe: TStringField;
    mdPesquisavalor_nfe: TCurrencyField;
    mdPesquisasituacao_manifesto: TStringField;
    mdPesquisadt_cadastro: TDateField;
    mdPesquisadh_emissao: TDateTimeField;
    GridRecId: TcxGridDBColumn;
    Gridid_doc: TcxGridDBColumn;
    Gridnsu: TcxGridDBColumn;
    Gridtipo_documento: TcxGridDBColumn;
    Gridchave_acesso: TcxGridDBColumn;
    Gridcnpj_emitente: TcxGridDBColumn;
    Gridx_nome_emitente: TcxGridDBColumn;
    Gridnumero_nfe: TcxGridDBColumn;
    Gridvalor_nfe: TcxGridDBColumn;
    Gridsituacao_manifesto: TcxGridDBColumn;
    Griddata_cadastro: TcxGridDBColumn;
    Griddh_emissao: TcxGridDBColumn;
    mdPesquisaschema_name: TStringField;
    mdPesquisaserie_nfe: TStringField;
    mdPesquisacaminho_arquivo: TStringField;
    ImprimirNFe1: TMenuItem;
    VisualizarXML1: TMenuItem;
    N2: TMenuItem;
    Manifestar1: TMenuItem;
    procedure BtnLimparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure VisualizarXML1Click(Sender: TObject);
  private
    procedure AbrirArquivo(const AArquivo: string);
    { Private declarations }
  public
    Procedure Novo        ;override;
    Procedure Pesquisa    ;override;
    Procedure Editar      ;override;
    Procedure Excluir     ;override;

    { Public declarations }
  end;

var
  FrmConsultaXMLImportado: TFrmConsultaXMLImportado;
  ObjDfe  : TModelDistribuicao;
  ContDFe : TDistribuicaoDFEController;
implementation

Uses System.Generics.Collections, System.DateUtils;

{$R *.dfm}

{ TFrmConsultaXMLImportado }

procedure TFrmConsultaXMLImportado.BtnLimparClick(Sender: TObject);
begin
  inherited;
  mdPesquisa.Close;
end;

procedure TFrmConsultaXMLImportado.Editar;
begin
  inherited;

end;

procedure TFrmConsultaXMLImportado.Excluir;
begin
  inherited;

end;

procedure TFrmConsultaXMLImportado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FrmConsultaXMLImportado := nil;
end;

procedure TFrmConsultaXMLImportado.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela        := 'Manifesto';
  TitleText         := 'Distribuição de DFe';
  cxdata1.EditValue := StartOfTheMonth(date);
  cxdata2.EditValue := EndOfTheMonth(date);
end;

procedure TFrmConsultaXMLImportado.Novo;
begin
  inherited;

end;

procedure TFrmConsultaXMLImportado.Pesquisa;
var
List    : TObjectList<TModelDistribuicao>;
nCampo, nSituacao : String;
begin
  inherited;
  try
    List      := Nil;
    nCampo    := '';
    nSituacao := '';

    ContDFe   := nil;

    if trim(edtBusca.Text) <> '' then
    nCampo     := Trim(edtBusca.Text);

    case cxAtivo.ItemIndex of
      1: nsituacao   := 'A';
      2: nsituacao   := 'F';
      3: nsituacao   := 'C';
    end;

    ContDFe       := TDistribuicaoDFEController.Create;

    Try
      List  := ContDFe.ListarTodos(nCampo, nsituacao, TSession.IDEMPRESA, cxdata1.EditValue, cxdata2.EditValue);

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

        mdPesquisaid_doc.AsInteger        := Item.id_doc;
        mdPesquisansu.AsString            := Item.nsu;
        mdPesquisatipo_documento.AsString := Item.tipo_documento;
        mdPesquisachave_acesso.AsString   := Item.chave_acesso;
        mdPesquisacnpj_emitente.AsString  := Item.cnpj_emitente;
        mdPesquisax_nome_emitente.AsString:= Item.x_nome_emitente;
        mdPesquisanumero_nfe.AsString     := Item.numero_nfe;
        mdPesquisavalor_nfe.AsFloat       := Item.valor_nfe;
        mdPesquisasituacao_manifesto.AsString := Item.situacao_manifesto;
        mdPesquisadt_cadastro.AsDateTime  := Item.dt_cadastro;
        mdPesquisadh_emissao.AsDateTime   := Item.dh_emissao;
        mdPesquisaschema_name.AsString    := Item.schema_name;
        mdPesquisaserie_nfe.AsString      := Item.serie_nfe;
        mdPesquisacaminho_arquivo.AsString:= Item.caminho_arquivo;

        mdPesquisa.Post;
      end;
      mdPesquisa.First;
      mdPesquisa.EnableControls;

    Finally
      FreeAndNil(ContDFe);
      if Assigned(List) then
        List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmConsultaXMLImportado.VisualizarXML1Click(Sender: TObject);
begin
  inherited;
  //Abrir xml
  AbrirArquivo(mdPesquisacaminho_arquivo.AsString);
end;

procedure TFrmConsultaXMLImportado.AbrirArquivo(const AArquivo: string);
begin
  if Trim(AArquivo) = '' then
    raise Exception.Create('Caminho do arquivo não informado.');

  if not FileExists(AArquivo) then
    raise Exception.Create('Arquivo não encontrado: ' + AArquivo);

  ShellExecute(0, 'open', PChar(AArquivo), nil, nil, SW_SHOWNORMAL);
end;


end.
