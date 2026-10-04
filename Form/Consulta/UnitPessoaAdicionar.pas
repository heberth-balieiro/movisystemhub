unit UnitPessoaAdicionar;

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
  cxClasses, cxGridCustomView, cxGrid, Vcl.Menus, dxGDIPlusClasses, cxMaskEdit,System.JSON, ACBRUTIL,
  Vcl.ComCtrls, JvExExtCtrls, JvNavigationPane, cxContainer, cxGroupBox,
  cxTextEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  DBAccess, Uni, cxCheckBox, UnitBaseNovoPesquisaDiversos,
  Vcl.ButtonStylesAttributes, ACBrBase, ACBrEnterTab, Vcl.StyledButton,
  System.ImageList, Vcl.ImgList, cxImageList, Datasnap.DBClient, dxmdaset,
  Controller.LookupHelper, UnitGlobal, Controller.Pessoa,Model.Pessoa,
  UnitFrmWhatsAppMassa,
  Model.EleicaoEleitor,
  Controller.EleicaoEleitor;

  const
  UM_CHECK = WM_USER + 10000;

type
  TFrmPessoaAdicionar = class(TFormNovoBasePesquisaDiversas)
    Label2: TLabel;
    cxAtivo: TcxComboBox;
    BtnAdicionar: TStyledBitBtn;
    edtSecretaria: TcxLookupComboBox;
    Label3: TLabel;
    TabSecretaria: TClientDataSet;
    TabSecretariaid_secretaria: TIntegerField;
    TabSecretariacodigo: TIntegerField;
    TabSecretariarazao: TStringField;
    TabSecretariansecretaria: TStringField;
    dsSecretaria: TUniDataSource;
    mdPesquisa: TdxMemData;
    mdPesquisaid_socio: TIntegerField;
    mdPesquisacodigo: TIntegerField;
    mdPesquisamatricula: TIntegerField;
    mdPesquisanome: TStringField;
    mdPesquisacpf: TStringField;
    mdPesquisacelular: TStringField;
    mdPesquisawhatsapp: TStringField;
    mdPesquisaemail: TStringField;
    mdPesquisasituacao: TStringField;
    GridRecId: TcxGridDBColumn;
    Gridid_socio: TcxGridDBColumn;
    Gridcodigo: TcxGridDBColumn;
    Gridmatricula: TcxGridDBColumn;
    Gridnome: TcxGridDBColumn;
    Gridcpf: TcxGridDBColumn;
    Gridwhatsapp: TcxGridDBColumn;
    Gridemail: TcxGridDBColumn;
    Gridsituacao: TcxGridDBColumn;
    GridCheck: TcxGridDBColumn;
    mdPesquisachk: TBooleanField;
    mdPesquisanascimento: TDateField;
    Gridnascimento: TcxGridDBColumn;
    Label8: TLabel;
    edtlotacao: TcxLookupComboBox;
    Label9: TLabel;
    EdtCidade: TcxLookupComboBox;
    TabSindLotacao: TClientDataSet;
    TabSindLotacaoid_lotacao: TIntegerField;
    TabSindLotacaocodigo: TIntegerField;
    TabSindLotacaodescricao: TStringField;
    TabSindLotacaoativo: TStringField;
    TabSindLotacaonlotacao: TStringField;
    dsLotacao: TUniDataSource;
    TabCidade: TClientDataSet;
    TabCidadeid_cidade: TIntegerField;
    TabCidadecidade: TStringField;
    TabCidadeuf: TStringField;
    TabCidadencidade: TStringField;
    dsCidade: TUniDataSource;
    GridColumn1: TcxGridDBColumn;
    mdPesquisasocio_secretaria: TStringField;
    cxOrdenar: TcxComboBox;
    Label4: TLabel;
    mdPesquisasocio_deste: TDateField;
    BtnMarca: TStyledBitBtn;
    Btndesmarca: TStyledBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure GridCheckPropertiesChange(Sender: TObject);
    procedure GridFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnAdicionarClick(Sender: TObject);
    procedure BtnMarcaClick(Sender: TObject);
    procedure BtndesmarcaClick(Sender: TObject);
    
  private
    bookmark: TBookmark;
    procedure Check2(AGridView: TcxGridDBTableView);
    procedure MarcarTodos;
    procedure DesmarcarTodos;


    { Private declarations }
  public
    AOrigem     : String;
    AIDEleicao  :Integer;
    Procedure Pesquisa    ;override;
    { Public declarations }
  end;

var
  FrmPessoaAdicionar: TFrmPessoaAdicionar;
  ContPessoa  : TPessoaController;
  ObjPessoa   : TPESSOA;
  ObjEleitor  : TModelEleicaoEleitor;
implementation

{$R *.dfm}

Uses Vcl.Loading, UnitPrincipalNew, uJKDialog,Vcl.Session, System.IOUtils,System.Generics.Collections;

procedure TFrmPessoaAdicionar.BtnAdicionarClick(Sender: TObject);
var
  I, AIDRet: Integer;
  Marcado: Variant;
  NaoInseridos: TStringList;
  NomeAssociado: string;
begin

  if mdPesquisa.IsEmpty then
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
    Exit;
  end;

  mdPesquisa.DisableControls;
  try

    {$REGION 'Funcao para adicionar envio de mensagem'}

    if AOrigem = 'W' then
    begin

      if not FrmEnviarWhatsAppMassa.mdListaPessoa.Active then
          FrmEnviarWhatsAppMassa.mdListaPessoa.Open;

      // percorre pelos records do DataController
      for I := 0 to Grid.DataController.RecordCount - 1 do
      begin
        Marcado       := Grid.DataController.Values[I, GridCheck.Index];
        if VarIsNull(Marcado) then
          Continue;

        // Converte para boolean com tolerância
        if SameText(VarToStr(Marcado), 'True') or SameText(VarToStr(Marcado), '1') or SameText(VarToStr(Marcado), 'S') then
        begin
            FrmEnviarWhatsAppMassa.mdListaPessoa.Append;

            FrmEnviarWhatsAppMassa.mdListaPessoaid_socio.AsInteger       := Grid.DataController.Values[I, Gridid_socio.Index];
            FrmEnviarWhatsAppMassa.mdListaPessoacodigo.AsInteger         := Grid.DataController.Values[I, Gridcodigo.Index];
            FrmEnviarWhatsAppMassa.mdListaPessoamatricula.AsInteger      := Grid.DataController.Values[I, Gridmatricula.Index];
            FrmEnviarWhatsAppMassa.mdListaPessoanome.AsString            := Grid.DataController.Values[I, Gridnome.Index];
            FrmEnviarWhatsAppMassa.mdListaPessoacpf.AsString             := Grid.DataController.Values[I, Gridcpf.Index];
            //FrmEnviarWhatsAppMassa.mdListaPessoacelular.AsString         := Grid.DataController.Values[I, Gridcelular.Index];
            FrmEnviarWhatsAppMassa.mdListaPessoawhatsapp.AsString        := Grid.DataController.Values[I, Gridwhatsapp.Index];
            FrmEnviarWhatsAppMassa.mdListaPessoaemail.AsString           := Grid.DataController.Values[I, Gridemail.Index];
            if not VarIsNull(Grid.DataController.Values[I, Gridnascimento.Index]) then
            FrmEnviarWhatsAppMassa.mdListaPessoanascimento.AsDateTime    := Grid.DataController.Values[I, Gridnascimento.Index];
            FrmEnviarWhatsAppMassa.mdListaPessoasituacao.AsString        := 'Aguardando';



            FrmEnviarWhatsAppMassa.mdListaPessoa.Post;

        end;
      end;
    end;

    {$ENDREGION}

    {$REGION 'Funcao para adicionar eleitor'}

      if AOrigem = 'E' then
      begin
        ObjEleitor    := Nil;
        ObjEleitor    := TModelEleicaoEleitor.Create;
        NaoInseridos  := TStringList.Create;

        Try
          for I := 0 to Grid.DataController.RecordCount - 1 do
          begin
            Marcado := Grid.DataController.Values[I, GridCheck.Index];

            if VarIsNull(Marcado) then
              Continue;

            if SameText(VarToStr(Marcado), 'True') or SameText(VarToStr(Marcado), '1') or SameText(VarToStr(Marcado), 'S') then
            begin
              //Adiciona direto no banco de dados
              NomeAssociado := VarToStr(Grid.DataController.Values[I,Gridnome.Index]);

              ObjEleitor.id_eleitor   :=  0;
              ObjEleitor.id_eleicao   :=  AIDEleicao;
              ObjEleitor.id_associado :=  Grid.DataController.Values[I, Gridid_socio.Index];
              ObjEleitor.situacao     :=  'A';
              ObjEleitor.data_geracao :=  now;
              ObjEleitor.id_usuario   :=  TSession.ID_USUARIO;
              ObjEleitor.id_empresa   :=  TSession.IDEMPRESA;
              ObjEleitor.obs          := 'Eleitor marcado para votação';
              ObjEleitor.sinc_app     := 'N';

              if TEleicaoEleitorController.JaExisteNaEleicao(AIDEleicao, ObjEleitor.id_associado) then
              begin
                NaoInseridos.Add(NomeAssociado + ' - já cadastrado nesta eleição');
                Continue;
              end;

              try
                if not TEleicaoEleitorController.Salvar(ObjEleitor,AIDRet) then
                  NaoInseridos.Add(NomeAssociado + ' - não foi possível inserir');
              except
                on E: Exception do
                  NaoInseridos.Add(NomeAssociado + ' - ' + E.Message);
              end;
            end;
          end;
          if NaoInseridos.Count > 0 then
                ShowMessage(
                  'Os seguintes associados não foram inseridos:' + sLineBreak + sLineBreak +
                  NaoInseridos.Text
                );

        Finally
          NaoInseridos.Free;
          ObjEleitor.Free;
        End;

      end;

    {$ENDREGION}


  finally
    mdPesquisa.EnableControls;
  end;

  if AOrigem = 'W' then  
  FrmEnviarWhatsAppMassa.mdListaPessoa.First;

  FrmPessoaAdicionar.Close;
  //JKDialog('Sucesso','Pessoas marcadas adicionadas na lista.', tdSucesso);
end;

procedure TFrmPessoaAdicionar.BtndesmarcaClick(Sender: TObject);
begin
  inherited;
  DesmarcarTodos;
end;

procedure TFrmPessoaAdicionar.BtnLimparClick(Sender: TObject);
begin
  inherited;
  try
    edtSecretaria.EditValue := 0;
    mdPesquisa.Close;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmPessoaAdicionar.BtnMarcaClick(Sender: TObject);
begin
  inherited;
  MarcarTodos;
end;

procedure TFrmPessoaAdicionar.Check2(AGridView: TcxGridDBTableView);
var
  i: Integer;
  V: Variant;
  IsChecked: Boolean;
begin
  for i := 0 to AGridView.DataController.RecordCount - 1 do
  begin
    V := AGridView.DataController.Values[i, GridCheck.Index];
    IsChecked :=
      SameText(VarToStr(V), 'True') or SameText(VarToStr(V), '1') or SameText(VarToStr(V), 'S');

    AGridView.DataController.ChangeRowSelection(i, IsChecked);
  end;
end;

procedure TFrmPessoaAdicionar.DesmarcarTodos;
begin
  if mdPesquisa.IsEmpty then
    Exit;

  mdPesquisa.DisableControls;
  try
    mdPesquisa.First;
    while not mdPesquisa.Eof do
    begin
      mdPesquisa.Edit;
      mdPesquisachk.AsBoolean := False;
      mdPesquisa.Post;
      mdPesquisa.Next;
    end;
    mdPesquisa.First;
  finally
    mdPesquisa.EnableControls;
  end;
end;

procedure TFrmPessoaAdicionar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  AIDEleicao  := 0;
  FrmPessoaAdicionar  := nil;
end;

procedure TFrmPessoaAdicionar.FormShow(Sender: TObject);
begin
  inherited;
  if AOrigem = '' then
    AOrigem := 'W';

  ParamsTela  := 'Associados/Dependentes';
  TitleText   := 'Pesquisa de Associado';

  try
    TLookupHelper.CarregarLookup(
                  TabSecretaria,LookupSecretariaSql);
    TabSecretaria.First;

    TLookupHelper.CarregarLookup(
            TabSindLotacao,LookupLotacaoSql);
    TabSindLotacao.First;

    TLookupHelper.CarregarLookup(
            TabCidade,LookupCidadeSql);
    TabCidade.First;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmPessoaAdicionar.GridCheckPropertiesChange(Sender: TObject);
var
  ACheck: TcxCheckBox;
  AGridSite: TcxGridSite;
  AGridView: TcxGridDBTableView;
begin
  //Grid1 Diego

  ACheck    := Sender as TcxCheckBox;
  AGridSite := ACheck.Parent as TcxGridSite;
  AGridView := AGridSite.GridView as TcxGridDBTableView;
  Check2(AGridView);
end;

procedure TFrmPessoaAdicionar.GridFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
var
  AView: TcxGridDBTableView;
begin
  //Grid Diego
  AView := Sender as TcxGridDBTableView;
  PostMessage(Handle, UM_CHECK, Integer(AView), 0);
end;

procedure TFrmPessoaAdicionar.GridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  AHitTest: TcxCustomGridHitTest;
  AView: TcxGridDBTableView;
  I, J: integer;
begin
  //grid Diego
  AView := TcxGridDBTableView(TcxGridSite(Sender).GridView);
  AHitTest := AView.ViewInfo.GetHitTest(X,Y);
  if AHitTest is TcxGridRowIndicatorHitTest then
  begin
    I := TcxGridRowIndicatorHitTest(AHitTest).GridRecord.Index;
    J := GridCheck.Index;
    AView.DataController.Values[I, J] := True;
    Check2(AView);
  end;
end;

procedure TFrmPessoaAdicionar.MarcarTodos;
begin
if mdPesquisa.IsEmpty then
    Exit;

  mdPesquisa.DisableControls;
  try
    mdPesquisa.First;
    while not mdPesquisa.Eof do
    begin
      mdPesquisa.Edit;
      mdPesquisachk.AsBoolean := True;
      mdPesquisa.Post;
      mdPesquisa.Next;
    end;
    mdPesquisa.First;
  finally
    mdPesquisa.EnableControls;
  end;
end;

procedure TFrmPessoaAdicionar.Pesquisa;
var
List    : TObjectList<TPessoa>;
FiltroCampo, FiltroSituacao, FiltroOrdem : String;
FiltroSecretaria, FiltroLotacao, FiltroCidade: Integer;
begin
  inherited;
  try
    List      := Nil;
    FiltroCampo         := '';
    FiltroSituacao      := '';
    FiltroOrdem         := '';

    FiltroSecretaria    := 0;
    FiltroLotacao       := 0;
    FiltroCidade        := 0;

    if trim(edtBusca.Text) <> '' then
      FiltroCampo     := Trim(edtBusca.Text);

    if cxativo.ItemIndex > 0 then
      FiltroSituacao := UpperCase(cxAtivo.Text);

    case cxordenar.ItemIndex of
      0: FiltroOrdem := ' order by s.codigo';
      1: FiltroOrdem := ' order by s.matricula';
      2: FiltroOrdem := ' order by s.nome';
      3: FiltroOrdem := ' order by s.apelido';
      4: FiltroOrdem := ' order by sc.razao';
      5: FiltroOrdem := ' order by s.situacao';
    end;

    if edtsecretaria.Text <> '' then
      FiltroSecretaria  := edtsecretaria.EditValue;

    if edtlotacao.Text <> '' then
      FiltroLotacao  := edtlotacao.EditValue;

    if edtcidade.Text <> '' then
      FiltroCidade  := edtcidade.EditValue;



    ContPessoa      := TPessoaController.Create;

    Try
      List  := ContPessoa.ListarTodos(FiltroCampo,
                                      FiltroSituacao,
                                      FiltroOrdem,
                                      FiltroSecretaria,
                                      FiltroLotacao,
                                      FiltroCidade);

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
        mdPesquisaid_socio.AsInteger      := Item.idsocio;
        mdPesquisacodigo.AsInteger        := ITem.Codigo;
        mdPesquisamatricula.AsInteger     := Item.matricula;
        mdPesquisanome.AsString           := Item.nome;
        mdPesquisacpf.AsString            := Item.cpf;
        mdPesquisacelular.AsString        := Item.celular;
        mdPesquisawhatsapp.AsString       := Item.whatsapp;
        mdPesquisaemail.AsString          := Item.email;
        mdPesquisasituacao.AsString       := Item.situacao;
        mdPesquisachk.AsBoolean           := False;
        mdPesquisanascimento.AsDateTime   := Item.nascimento;
        if Item.socio_secretaria = '' then
        mdPesquisasocio_secretaria.AsString := 'Não Informado'
        else
        mdPesquisasocio_secretaria.AsString := Item.socio_secretaria;
        mdPesquisasocio_deste.AsDateTime  := item.sociodeste;

        mdPesquisa.Post;
      end;
      mdPesquisa.First;
      mdPesquisa.EnableControls;

    Finally
      FreeAndNil(ContPessoa);
      if Assigned(List) then
        List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

end.


