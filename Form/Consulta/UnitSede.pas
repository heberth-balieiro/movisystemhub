unit UnitSede;

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
  cxMaskEdit, UFormNovoBasePesquisa, cxContainer, Vcl.ButtonStylesAttributes,
  System.ImageList, Vcl.ImgList, cxImageList, DBAccess, Uni, ACBrBase,
  ACBrEnterTab, Vcl.StyledButton, cxDropDownEdit, cxTextEdit, cxGroupBox,
  dxmdaset,Model.Sede,Controller_Sede;

type
  TFrmSede = class(TFormNovoBasePesquisa)
    mdPesquisa: TdxMemData;
    mdPesquisaid_sede: TIntegerField;
    mdPesquisarazao: TStringField;
    mdPesquisafantasia: TStringField;
    mdPesquisacnpj: TStringField;
    mdPesquisatelefone: TStringField;
    mdPesquisacelular: TStringField;
    mdPesquisacidade: TStringField;
    GridRecId: TcxGridDBColumn;
    Gridid_sede: TcxGridDBColumn;
    Gridrazao: TcxGridDBColumn;
    Gridfantasia: TcxGridDBColumn;
    Gridcnpj: TcxGridDBColumn;
    Gridtelefone: TcxGridDBColumn;
    Gridcelular: TcxGridDBColumn;
    Gridcidade: TcxGridDBColumn;
    mdPesquisasedeprincipal: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Procedure Novo        ;override;
    Procedure Pesquisa    ;override;
    Procedure Editar      ;override;
    Procedure Excluir     ;override;
    Procedure Listagem    ;override;
    Procedure Relatorio   ;override;
    { Public declarations }
  end;

var
  FrmSede : TFrmSede;
  ContSede: TSedeController;
  ObjSede : TSede;

implementation

{$R *.dfm}

uses UnitSedeCad, Vcl.Loading, UnitPrincipalNew,uJKDialog, Vcl.PermissaoUsuario, Vcl.Session,System.Generics.Collections;

procedure TFrmSede.BtnLimparClick(Sender: TObject);
begin
  inherited;
  mdPesquisa.Close;
end;

procedure TFrmSede.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FrmSede := nil;
end;

procedure TFrmSede.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;
end;

procedure TFrmSede.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'SEDE';
  TitleText   := 'Pesquisa de SEDE';
end;

procedure TFrmSede.Novo;
begin
  inherited;
  if not Assigned(FrmSedeCad) then
  FrmSedeCad := TFrmSedeCad.Create(Application);
  FrmSedeCad.ParamsStr  := 'N';
  FrmSedeCad.ShowModal;
end;

procedure TFrmSede.Pesquisa;
var
List    : TObjectList<TSede>;
nCampo  : String;
begin
  inherited;
  try
    List    := Nil;
    nCampo  := '';

    if trim(edtBusca.Text) <> '' then
    nCampo     := Trim(edtBusca.Text);

    ContSede   := TSedeController.Create;

    Try
      List  := ContSede.ListarTodos(nCampo, '');

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

        mdPesquisaid_sede.AsInteger       := Item.id_sede;
        mdPesquisarazao.AsString          := Trim(Item.razao);
        mdPesquisafantasia.AsString       := Trim(Item.fantasia);
        mdPesquisacnpj.AsString           := Item.cnpj;
        mdPesquisatelefone.AsString       := Item.telefone;
        mdPesquisacelular.AsString        := Item.celular;
        mdPesquisacidade.AsString         := Item.ncidade;
        mdPesquisasedeprincipal.AsString  := Item.sedeprincipal;

        mdPesquisa.Post;
      end;
      mdPesquisa.First;
      mdPesquisa.EnableControls;

    Finally
      FreeAndNil(ContSede);
      if Assigned(List) then
        List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmSede.Editar;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
      begin
        if not Assigned(FrmSedeCad) then
        FrmSedeCad := TFrmSedeCad.Create(Application);
        FrmSedeCad.ParamsStr  := 'E';
        FrmSedeCad.ParamsInt  := mdPesquisaid_sede.AsInteger;
        if mdPesquisaid_sede.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;
        FrmSedeCad.Show;
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

procedure TFrmSede.Excluir;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
      begin
        Try
          ContSede    := Nil;
          ContSede    := TSedeController.Create;

          if mdPesquisaid_sede.AsInteger = 0 then
          begin
            JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
            exit;
          end;

          if mdPesquisasedeprincipal.AsString='S' then
          begin
            JKDialog('Alerta','Sede principal, não pode ser excluida.', tdAlerta);
            exit;
          end;

          if ContSede.Excluir(mdPesquisaid_sede.AsInteger) then
          begin
            Pesquisa;
            JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
          end;

        Finally
          FreeAndNil(ContSede);
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

procedure TFrmSede.Listagem;
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

procedure TFrmSede.Relatorio;
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
