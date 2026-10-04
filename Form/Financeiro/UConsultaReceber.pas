unit UConsultaReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Dialogs, UnitBaseCons, cxGraphics, cxControls,
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
  Vcl.StdCtrls, Vcl.Buttons, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxDropDownEdit, cxTextEdit, cxMaskEdit, cxCalendar, cxGroupBox,
  Controller.Receber,
  Model.Receber, Datasnap.DBClient, cxCurrencyEdit, cxCheckBox, UnitPrincipalNew;


type
  TFrmConsReceber = class(TFrmModeloConsulta)
    data1: TcxDateEdit;
    data2: TcxDateEdit;
    EdtFiltropor: TcxComboBox;
    GridColumnPessoa: TcxGridDBColumn;
    GridColumnid_receber: TcxGridDBColumn;
    GridColumndata_emissao: TcxGridDBColumn;
    GridColumnVencimento: TcxGridDBColumn;
    GridColumnRecebimento: TcxGridDBColumn;
    GridColumnndoc: TcxGridDBColumn;
    GridColumnnumparcela: TcxGridDBColumn;
    GridColumnHstorico: TcxGridDBColumn;
    GridColumn9: TcxGridDBColumn;
    Baixar1: TMenuItem;
    BtnBaixar: TMenuItem;
    Anexo1: TMenuItem;
    Cobrana1: TMenuItem;
    EnviarporEmail1: TMenuItem;
    EnviarporWhatsapp1: TMenuItem;
    EnviarporWhatsapp2: TMenuItem;
    cxPeriodo: TcxGroupBox;
    TabReceber: TClientDataSet;
    TabReceberid_receber: TIntegerField;
    TabReceberdata_lancamento: TDateField;
    TabReceberdata_vencimento: TDateField;
    TabReceberdata_recebimento: TDateField;
    TabReceberdata_competencia: TDateField;
    TabRecebernumero_titulo: TStringField;
    TabRecebernumparcela: TStringField;
    TabRecebervalor_original: TCurrencyField;
    TabRecebervalor_recebido: TCurrencyField;
    TabReceberhistorico: TStringField;
    TabReceberrecebido: TStringField;
    TabReceberparcela: TIntegerField;
    TabRecebernmpessoa: TStringField;
    TabRecebernmapelido: TStringField;
    TabRecebernmpessoacompleto: TStringField;
    TabReceberwhatsapp: TStringField;
    TabReceberid_pessoa: TIntegerField;
    TabRecebernmdocumento: TStringField;
    GridAberta: TcxGridDBTableView;
    GridRecebido: TcxGridDBTableView;
    GridFaturado: TcxGridDBTableView;
    GridCancelado: TcxGridDBTableView;
    GridAbertaidreceber: TcxGridDBColumn;
    GridAbertadataemissao: TcxGridDBColumn;
    GridAbertadatavencimento: TcxGridDBColumn;
    GridAbertadocumento: TcxGridDBColumn;
    GridAbertanumero: TcxGridDBColumn;
    GridAbertahistorico: TcxGridDBColumn;
    GridAbertavalor: TcxGridDBColumn;
    GridAbertapessoa: TcxGridDBColumn;
    TabReceberatraso: TIntegerField;
    TabRecebervlrjuros: TCurrencyField;
    TabRecebervlrdesconto: TCurrencyField;
    TabRecebervlrmulta: TCurrencyField;
    GridAbertaatraso: TcxGridDBColumn;
    GridAbertajuros: TcxGridDBColumn;
    GridAbertadesconto: TcxGridDBColumn;
    GridAbertaMulta: TcxGridDBColumn;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Box: TcxGridDBColumn;
    TabReceberbox: TBooleanField;
    procedure FormShow(Sender: TObject);
    procedure edtBuscaChange(Sender: TObject);
    procedure data1KeyPress(Sender: TObject; var Key: Char);
    procedure data2KeyPress(Sender: TObject; var Key: Char);
    procedure EdtFiltroporKeyPress(Sender: TObject; var Key: Char);
    procedure edtBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimparClick(Sender: TObject);
    procedure GridAbertaStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure GridAbertaCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure BtnBaixarClick(Sender: TObject);
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
  FrmConsReceber  : TFrmConsReceber;
  ContrReceber    : TReceberController;
  ObjReceber      : TReceber;
implementation

{$R *.dfm}

uses Vcl.Navigation, ULancReceber, uJKDialog, System.Generics.Collections,
  UConeSul, Vcl.Loading, Vcl.PermissaoUsuario, Vcl.Session, Vcl.Forms,
  UBaixaReceber;

{ TFrmConsReceber }

procedure TFrmConsReceber.BtnBaixarClick(Sender: TObject);
var
  Permissao : TPermissaoUsuario;
  ListaIds  : TList<Integer>;
begin
  //Baixar

  FreeAndNil(TPermissaoUsuario.FInstance);
  Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,tela);

  if Permissao.TemPermissao('Permitir Baixar') then
  begin

    Try
      if not Tabreceber.Eof then
      begin

        ListaIds := TList<Integer>.Create;
        try
          TabReceber.DisableControls;
          try
            TabReceber.First;
            while not TabReceber.Eof do
            begin
              if TabReceberBox.AsBoolean then
                ListaIds.Add(TabReceberid_receber.AsInteger);

              TabReceber.Next;
            end;
          finally
            TabReceber.EnableControls;
          end;

          Try
            if ListaIds.Count = 0 then
            begin
              JKDialog('Alerta','Selecione um registro da lista!', tdAlerta);
              cxGrid.SetFocus;
              Exit;
            end;

            // aqui você abre a tela de baixa passando os IDs
            TNavigation.ParamInt      := 0;
            TNavigation.ParamsStr     := 'B';
            TNavigation.ParamsStrList := ListaIds;
            TNavigation.OpenModal(TFrmBaixaReceber, FrmBaixaReceber);

          except on E: Exception do
            JKDialog('Erro','Erro ao inserir:'+e.Message, tderro);
          end;

        finally
          ListaIds.Free;
        end;
      end
      else
      begin
        JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
        exit;
      end;

    Except on e:exception do
      begin
        JKDialog('Erro','Erro ao iniciar a baixa: '+#13+e.Message, tdErro);
        exit;
      end;
    End;

  end
  else
    JKDialog('Acesso Negado',
             'O seu perfil não tem permissão para utilizar.' + sLineBreak +
             'Por favor, entre em contato com o administrador do sistema.',
             tdAlerta);
end;

procedure TFrmConsReceber.btnLimparClick(Sender: TObject);
begin
  inherited;
  data1.EditValue         := Now;
  data2.EditValue         := Now;
  EdtFiltropor.ItemIndex  := 0;

end;

procedure TFrmConsReceber.data1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
    data2.setfocus;
  end;
end;

procedure TFrmConsReceber.data2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
    EdtFiltropor.setfocus;
  end;
end;

procedure TFrmConsReceber.editar;
begin
  inherited;
  if not TabReceber.Eof then
  begin

    if ds.DataSet.FieldByName('recebido').AsString <> 'Aberto' then
    begin
      JKDialog('Aviso','Título precisa esá aberto.'+#13+'Estorne para realizar a edição!', tdAlerta);
      exit;
    end;

    if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
    begin
      Try
        OpenCadTela(ds.DataSet.FieldByName('id_receber').AsInteger,'E');
      except on e:exception do
        begin
          JKDialog('Erro','Erro ao editar o registro.'+#13+e.Message, tdErro);
          exit;
        end;
      end;

    end;

  end
  else
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  end;
end;

procedure TFrmConsReceber.edtBuscaChange(Sender: TObject);
begin
  inherited;
  Pesquisa;
end;

procedure TFrmConsReceber.edtBuscaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
    btnbusca.Click;
  end;
end;

procedure TFrmConsReceber.EdtFiltroporKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
    edtBusca.setfocus;
  end;
end;

procedure TFrmConsReceber.Excluir;
begin
  inherited;
  if not TabReceber.Eof then
  begin

    if (TabReceberrecebido.AsString<>'Aberto') then
    begin
      JKDialog('Alerta','Título precisa está aberto!', tdAlerta);
      exit;
    end;

    //Cancelando uma carteira inativando e colocando como excluido 1;
    if JKDialog('Aviso', 'Deseja excluir o título selecionado?', tdMensagem)  then
    begin
      ContrReceber  := Nil;
      ContrReceber  := TReceberController.Create;

      Try
        TLoading.Show(FrmConsReceber,'Excluindo registro aguarde...');

        Try

          if ContrReceber.Excluir(TabReceberid_receber.AsInteger) then
          begin
            TLoading.Hide;
            JKDialog('Sucesso','Título excluido com sucesso!', tdSucesso);
            Pesquisa;
          end;
        Except on e:exception do
          begin
            TLoading.Hide;
            JKDialog('Erro','Ocorreu um erro ao tentar excluir: '+e.Message, tdErro);
            exit;
          end;
        End;
      Finally
        FreeAndNil(ContrReceber);
      End;

    end;

  end
  else
  begin
    JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
  end;
end;

procedure TFrmConsReceber.FormShow(Sender: TObject);
begin
  inherited;
  Tela  := TFrmConsReceber(sender).Caption;
  data1.Date    := now;
  data2.Date    := now;
  edtbusca.SetFocus;
end;

procedure TFrmConsReceber.GridAbertaCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  editar;
end;

procedure TFrmConsReceber.GridAbertaStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var
Vencimento: TDateTime;
begin
  if not ARecord.IsData then Exit;

  Vencimento := ARecord.Values[GridAbertadatavencimento.Index];

  // títulos vencidos
  if Vencimento < Date then
    AStyle := FrmPrincipalNew.GridVencido

  // títulos que vencem hoje
  else if Trunc(Vencimento) = Date then
    AStyle := FrmPrincipalNew.GridVencDia;


  {  //titulos vencidos
  if ARecord.Values[GridAbertadatavencimento.Index] < Now then
    AStyle := Frmprincipal.GridVencido;

    //titulos vence no dias
  if ARecord.Values[GridAbertadatavencimento.Index] = Now then
    AStyle := Frmprincipal.GridVencDia; }

end;

procedure TFrmConsReceber.OpenCadTela(id: integer; str: string);
begin
  inherited;
  TNavigation.ParamInt          := id;
  TNavigation.ParamsStr         := str;
  TNavigation.OpenModal(TFrmLancReceber, FrmLancReceber);
end;

procedure TFrmConsReceber.Pesquisa;
var
FiltroSituacao,FiltroTipoData, FiltroCampo :string;
DataInicial, DataFinal:TDate;
ObjReceberList: TObjectList<TReceber>;
I: Integer;
Rec: TcxCustomGridRecord;
begin
  inherited;
  ObjReceberList    := nil;
  FiltroSituacao    := '';
  FiltroTipoData    := '';
  FiltroCampo       := '';

  case EdtFiltropor.ItemIndex of
    0: FiltroTipoData := 'data_lancamento';
    1: FiltroTipoData := 'data_vencimento';
    2: FiltroTipoData := 'data_competencia';
    3: FiltroTipoData := 'data_competencia';
  end;

  if trim(edtBusca.Text) <> '' then
  begin
    FiltroCampo     := Trim(edtBusca.Text);
  end;

  DataInicial       := VarToDateTime(data1.EditValue);
  DataFinal         := VarToDateTime(data2.EditValue);

  if DataFinal < DataInicial then
  begin
    JKDialog('Aviso','Data final menor que a data inicial!', tdAlerta);
    exit;
  end;

  case TabSituacao.TabIndex of
    1:FiltroSituacao := 'A';
    2:FiltroSituacao := 'R';
    3:FiltroSituacao := 'F';
    4:FiltroSituacao := 'C';
  end;

  ContrReceber      := TReceberController.Create;

  Try
    Try
      ObjReceberList  := ContrReceber.ListarTodos(FiltroTipoData, FiltroCampo, FiltroSituacao, DataInicial, DataFinal);

      ds.DataSet.Open;
      Tabreceber.EmptyDataSet;
      //Se nao tem compra nem avanca
      if (ObjReceberList = nil) or (ObjReceberList.Count = 0) then
      begin
        JKDialog('Aviso','Nenhum registro encontrado!', tdAlerta);
        exit;
      end;

      //popular Tab
      TabReceber.DisableControls;
      Try

        for var Item in ObjReceberList do
        begin
          TabReceber.Append;

          TabReceberid_receber.AsInteger          := Item.Id_receber;
          TabReceberdata_lancamento.AsDateTime    := Item.Data_lancamento;
          TabReceberdata_vencimento.AsDateTime    := Item.Data_vencimento;
          TabReceberdata_recebimento.AsDateTime   := Item.Data_recebimento;
          TabReceberdata_competencia.AsDateTime   := Item.Data_competencia;
          TabRecebernumero_titulo.AsString        := Item.Numero_titulo;
          TabRecebernumparcela.AsString           := Item.numparcela;
          TabRecebervalor_original.AsCurrency     := Item.Valor_original;
          TabRecebervalor_recebido.AsCurrency     := Item.Valor_recebido;
          TabReceberhistorico.AsString            := Item.Historico;
          TabReceberrecebido.AsString             := Item.Recebido;
          TabReceberparcela.AsInteger             := Item.Parcela;
          TabRecebernmpessoa.AsString             := Item.nmpessoa;
          TabRecebernmapelido.AsString            := Item.nmapelido;
          TabRecebernmpessoacompleto.AsString     := Item.nmpessoacompleto;
          TabReceberwhatsapp.AsString             := Item.whatsapp;
          TabReceberid_pessoa.AsInteger           := Item.Id_pessoa;
          TabRecebernmdocumento.AsString          := Item.nmdocumento;
          TabReceberatraso.AsInteger              := 0;
          TabRecebervlrjuros.AsCurrency           := 0;
          TabRecebervlrdesconto.AsCurrency        := 0;
          TabRecebervlrmulta.AsCurrency           := 0;

          TabReceber.Post;
        end;

      Finally
        tabreceber.EnableControls;
        tabreceber.First;

        //Abrir subgrid
        for I := 0 to GridAberta.ViewData.RecordCount - 1 do
        begin
          Rec := GridAberta.ViewData.Records[I];
          if Rec is TcxGridGroupRow then
            TcxGridGroupRow(Rec).Expanded := True;
        end;

      End;

    except on e:exception do
      begin
        JKDialog('Erro','Erro ao pesquisa!', tderro);
        TConeSul.GravarLogErroTXT(TConeSul.GravarLogErroRtti(ObjReceberList, e.Message));
        exit;
      end;
    End;
  Finally
    FreeAndNil(ContrReceber);
    FreeAndNil(ObjReceberList);
  End;

end;

end.
