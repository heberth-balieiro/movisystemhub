unit UnitLocalizacao;

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
  ACBrBase, ACBrEnterTab, Vcl.Tabs, frxClass, frxDBSet,Model.localizacao, Controller.Localizacao,
  UFormNovoBasePesquisa, cxContainer, Vcl.ButtonStylesAttributes,
  System.ImageList, Vcl.ImgList, cxImageList, DBAccess, Uni, Vcl.StyledButton,
  cxMaskEdit, cxDropDownEdit, cxTextEdit, cxGroupBox, dxmdaset;

type
  TFrmLocalizacao = class(TFormNovoBasePesquisa)
    mdPesquisa: TdxMemData;
    mdPesquisaid_localizacao: TIntegerField;
    mdPesquisacodigo: TIntegerField;
    mdPesquisalocalizacao: TStringField;
    mdPesquisaativo: TStringField;
    GridRecId: TcxGridDBColumn;
    Gridid_localizacao: TcxGridDBColumn;
    Gridcodigo: TcxGridDBColumn;
    Gridlocalizacao: TcxGridDBColumn;
    Gridativo: TcxGridDBColumn;
    procedure BtnLimparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    
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
  FrmLocalizacao: TFrmLocalizacao;
  ContLoc     : TLocalizacaoController;
implementation

{$R *.dfm}

uses UnitLocalizacaoCad, UConeSul, Vcl.Loading, Vcl.Session,uJKDialog,
  UnitPrincipalNew,System.Generics.Collections;

procedure TFrmLocalizacao.BtnLimparClick(Sender: TObject);
begin
  inherited;
  mdPesquisa.Close;
end;

procedure TFrmLocalizacao.Editar;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
      begin
        if not Assigned(FrmLocalizacaoCad) then
        FrmLocalizacaoCad := TFrmLocalizacaoCad.Create(Application);
        FrmLocalizacaoCad.ParamsStr  := 'E';
        FrmLocalizacaoCad.ParamsInt  := mdPesquisaid_localizacao.AsInteger;
        if mdPesquisaid_localizacao.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;
        FrmLocalizacaoCad.Show;
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

procedure TFrmLocalizacao.Excluir;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
      begin
        Try
          ContLoc    := Nil;
          ContLoc    := TLocalizacaoController.Create;

          if mdPesquisaid_localizacao.AsInteger = 0 then
          begin
            JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
            exit;
          end;

          if ContLoc.Excluir(mdPesquisaid_localizacao.AsInteger) then
          begin
            Pesquisa;
            JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
          end;

        Finally
          FreeAndNil(ContLoc);
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

procedure TFrmLocalizacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmLocalizacao  := nil;
end;

procedure TFrmLocalizacao.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;
end;

procedure TFrmLocalizacao.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'Localizacao';
  TitleText   := 'Pesquisa de Localização';
end;

procedure TFrmLocalizacao.Listagem;
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

procedure TFrmLocalizacao.Novo;
begin
  inherited;
  if not Assigned(FrmLocalizacaoCad) then
  FrmLocalizacaoCad := TFrmLocalizacaoCad.Create(Application);
  FrmLocalizacaoCad.ParamsStr  := 'N';
  FrmLocalizacaoCad.ShowModal;
end;

procedure TFrmLocalizacao.Pesquisa;
var
List    : TObjectList<TModelLocalizacao>;
nCampo, nSituacao  : String;
begin
  inherited;
  try
    List    := Nil;
    nCampo  := '';

    if trim(edtBusca.Text) <> '' then
    nCampo     := Trim(edtBusca.Text);

    case cxAtivo.ItemIndex of
      1: nSituacao := 'S';
      2: nSituacao := 'N';
    end;

    ContLoc   := TLocalizacaoController.Create;

    Try
      List  := ContLoc.ListarTodos(nCampo, nSituacao);

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

        mdPesquisaid_localizacao.AsInteger      := Item.id_localizacao;
        mdPesquisacodigo.AsInteger              := Item.codigo;
        mdPesquisalocalizacao.AsString          := Item.localizacao;
        mdPesquisaativo.AsString                := Item.ativo;

        mdPesquisa.Post;
      end;
      mdPesquisa.First;
      mdPesquisa.EnableControls;

    Finally
      FreeAndNil(ContLoc);
      if Assigned(List) then
        List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmLocalizacao.Relatorio;
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

//procedure TFrmLocalizacao.btnListagemClick(Sender: TObject);
//var
//Model :TModelEmpresa;
//msg:String;
//TempImage: Timage;
//begin
//  //Listagem marca
//
//  Try
//    if not DM.TabConsLocalizacao.Eof then
//    begin
//      FrxRelatorio.LoadFromFile(ExtractFilePath(Application.ExeName) +'\Relatorio\RelListagemLocal.fr3');
//      Try
//        DM.TabConsLocalizacao.DisableControls;
//
//        Model               := TModelEmpresa.Create;
//        Try
//          Model.idempresa   := TSession.IDEMPRESA;
//          Model.SelectCabecalhoReport(msg);
//
//          FrxRelatorio.Variables.Clear;
//          FrxRelatorio.Variables['nrazao']          :=quotedstr(Model.razao);
//          FrxRelatorio.Variables['nfantasia']       :=quotedstr(model.fantasia);
//          FrxRelatorio.Variables['nendereco']       :=quotedstr(model.endereco);
//          FrxRelatorio.Variables['nnumero']         :=quotedstr(model.numero);
//          FrxRelatorio.Variables['nbairro']         :=quotedstr(model.bairro);
//          FrxRelatorio.Variables['ntelefone']       :=quotedstr(model.telefone);
//          FrxRelatorio.Variables['nfone1']          :=quotedstr(model.telefone2);
//          FrxRelatorio.Variables['nfone2']          :=quotedstr(model.celular);
//          FrxRelatorio.Variables['nemail']          :=quotedstr(model.email1);
//          FrxRelatorio.Variables['ncnpj']           :=quotedstr(model.cnpj);
//          FrxRelatorio.Variables['nie']             :=quotedstr(model.ie);
//
//          try
//            // Decodifica a imagem Base64 e carrega no fluxo de memória
//            TempImage             := TImage.Create(nil);
//            TConesul.ConvBase64Img(model.logo);
//            TempImage.Picture     :=TConesul.nfoto;
//            TConesul.nfoto.Free;
//            TempImage.Picture.SaveToFile(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg')
//          finally
//            TempImage.Free;
//          end;
//
//          FrxRelatorio.Variables['wlogo']           :=quotedstr(ExtractFilePath(Application.ExeName)+'Temp\Logo.jpeg');
//          FrxRelatorio.Variables['ncep']            :=quotedstr(model.cep);
//          FrxRelatorio.Variables['ncidade']         :=quotedstr(model.cidade);
//          FrxRelatorio.Variables['filtro']          :=quotedstr('Listagem de Localização');
//
//        Finally
//          model.Free;
//        End;
//
//        FrxRelatorio.Report.PrepareReport();
//        FrxRelatorio.ShowReport;
//      Finally
//        DM.TabConsLocalizacao.First;
//        DM.TabConsLocalizacao.EnableControls;
//      End;
//
//    end
//    else
//    begin
//      JKDialog('Aviso','Nenhum registro encontrato!', tdAlerta);
//    end;
//
//  Except
//
//  End;
//end;

