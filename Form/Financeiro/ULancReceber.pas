unit ULancReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseCad, cxGraphics, cxControls,
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
  dxSkinXmas2008Blue, ACBrBase, ACBrEnterTab, cxCheckBox, cxTextEdit,
  cxGroupBox, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxButtonEdit, cxCurrencyEdit, cxBlobEdit,
  cxMemo, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxSpinEdit, Vcl.Menus, cxButtons, DBAccess, Uni,
  Datasnap.DBClient,
  Model.Receber, Controller.Receber,
  Controller.Receber.PlanoContas, Model.Receber.PlanoContas;

type
  TFrmLancReceber = class(TFrmBaseCad)
    Label2: TLabel;
    edtDataemissao: TcxDateEdit;
    edtdatavencimento: TcxDateEdit;
    Label7: TLabel;
    edtPessoa: TcxLookupComboBox;
    BtnCliVisualizar: TcxButtonEdit;
    BtnCliNovo: TcxButtonEdit;
    edtEmpresa: TcxLookupComboBox;
    Label3: TLabel;
    edtDoc: TcxLookupComboBox;
    Label5: TLabel;
    edtvalortotal: TcxCurrencyEdit;
    Label6: TLabel;
    btnDocPesq: TcxButtonEdit;
    btnDocIncluir: TcxButtonEdit;
    Label8: TLabel;
    Label9: TLabel;
    edtNatureza: TcxLookupComboBox;
    edtHistorico: TcxMemo;
    cxGrid: TcxGrid;
    ViewParcelas: TcxGridDBTableView;
    CollVencimento: TcxGridDBColumn;
    collDoc: TcxGridDBColumn;
    collParcela: TcxGridDBColumn;
    collValor: TcxGridDBColumn;
    cxGridParcelas: TcxGridLevel;
    edtParcela: TcxSpinEdit;
    Label10: TLabel;
    cxbuttonIncluir: TcxButton;
    cxButtonLimpar: TcxButton;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    edtPlano: TcxLookupComboBox;
    edtCusto: TcxLookupComboBox;
    edtvalorcaixa: TcxCurrencyEdit;
    cxGridCaixa: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumnPlano: TcxGridDBColumn;
    cxGridDBColumnCusto: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridDBColumnValor: TcxGridDBColumn;
    cxButtonExcluir: TcxButtonEdit;
    cxButtonInserir: TcxButtonEdit;
    cxCheckBox1: TcxCheckBox;
    TabCliente: TClientDataSet;
    TabClienteid_socio: TIntegerField;
    TabClientecliente: TStringField;
    TabClientecpf: TStringField;
    TabClientetelefone: TStringField;
    dsPessoa: TUniDataSource;
    TabCusto: TClientDataSet;
    TabCustoid_custo: TIntegerField;
    TabCustocusto: TStringField;
    TabDoc: TClientDataSet;
    TabDocid_documento: TIntegerField;
    TabDocdoc: TStringField;
    TabEmpresa: TClientDataSet;
    TabEmpresaid_empresa: TIntegerField;
    TabEmpresaempresa: TStringField;
    TabPlano: TClientDataSet;
    TabPlanoid_planoconta: TIntegerField;
    TabPlanoplano: TStringField;
    dsCusto: TUniDataSource;
    dsDoc: TUniDataSource;
    dsEmpresa: TUniDataSource;
    dsPlano: TUniDataSource;
    edtDatacompetencia: TcxDateEdit;
    Label15: TLabel;
    TabParcela: TClientDataSet;
    TabCaixa: TClientDataSet;
    TabCaixaid_plano: TIntegerField;
    TabCaixaid_custo: TIntegerField;
    TabCaixapercentual: TCurrencyField;
    TabCaixavalor: TCurrencyField;
    TabParcelaid_empresa: TIntegerField;
    TabParcelaid_natureza: TIntegerField;
    TabParceladata_emissao: TDateField;
    TabParceladata_vencimento: TDateField;
    TabParceladata_competencia: TDateField;
    TabParcelaid_pessoa: TIntegerField;
    TabParcelaid_documento: TIntegerField;
    TabParceladoc: TStringField;
    TabParcelavalororiginal: TCurrencyField;
    TabParcelahistorico: TStringField;
    TabParcelaparcela: TIntegerField;
    TabPlanodescricao: TStringField;
    TabCaixaplano: TStringField;
    dsCaixa: TUniDataSource;
    TabCustodescricao: TStringField;
    TabCaixacusto: TStringField;
    dsParcela: TUniDataSource;
    ViewParcelasColumn1: TcxGridDBColumn;
    TabDocdescricao: TStringField;
    TabParcelandoc: TStringField;
    TabNatureza: TClientDataSet;
    TabNaturezaid_natureza: TIntegerField;
    TabNaturezadescricao: TStringField;
    TabNaturezanatureza: TStringField;
    dsNatureza: TUniDataSource;
    procedure FormShow(Sender: TObject);
    procedure cxButtonEdit4PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxbuttonIncluirClick(Sender: TObject);
    procedure cxButtonLimparClick(Sender: TObject);
    procedure TabParcelaAfterPost(DataSet: TDataSet);
    procedure cxButtonInserirEnter(Sender: TObject);
   
  private
    Procedure ListarEmpresa;
    Procedure ListarNatureza;
    Procedure ListarPessoa;
    Procedure ListarDocumento;
    Procedure ListarPlano;
    Procedure ListarCusto;
    Procedure InserirLivrocaixa(idPlano, idCusto:Integer; vlr:Double);
    Procedure ExcluirLivrocaixa(idPlano, idCusto:Integer);
    Procedure LimparCampoCaixa;
    Procedure InserirParcelas;
    Procedure LimparParcelas;
    Procedure BloquearCamposParcelas;
    function ValidarInsert(out msg: string): Boolean;
    function SomaLivroCaixa(DataSet: TDataSet; const NomeCampo: string): Double;
    procedure GravarLivroCaixa(AID: Integer);
    procedure ButtonInserirCaixa;
    procedure AjustarLayout;
    { Private declarations }
  public
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure CarregarDados; override;
    { Public declarations }
  end;

var
  FrmLancReceber  : TFrmLancReceber;
  ModelReceberObj : TReceber;
  ControlReceber  : TReceberController;

  ModelRelPlanoObj   : TReceberPlano;
  ControlRelPlano : TReceberPlanoContasController;

implementation

{$R *.dfm}

uses Controller.LookupHelper, UnitGlobal, Vcl.Navigation, Vcl.Session,
  uJKDialog, UConeSul;

{ TFrmLancReceber }

{$REGION 'Procedure Listagem'}

procedure TFrmLancReceber.CarregarDados;
begin
  ModelReceberObj   := Nil;
  ControlReceber    := Nil;

  ModelReceberObj   := TReceber.Create;
  ControlReceber    := TReceberController.Create;

  Try
    ModelReceberObj   := ControlReceber.BuscarPorID(TNavigation.ParamInt);
    if Assigned(ModelReceberObj) then
    begin
      edtempresa.EditValue        := ModelReceberObj.Id_empresa;
      edtNatureza.EditValue       := ModelReceberObj.Id_natureza;
      edtDataemissao.EditValue    := ModelReceberObj.Data_lancamento;
      edtdatavencimento.EditValue := ModelReceberObj.Data_vencimento;
      edtDatacompetencia.EditValue:= ModelReceberObj.Data_competencia;
      edtPessoa.EditValue         := ModelReceberObj.Id_pessoa;
      edtDoc.EditValue            := ModelReceberObj.Id_documento;
      edtcodigo.EditValue         := ModelReceberObj.Numero_titulo;
      edtvalortotal.EditValue     := ModelReceberObj.Valor_original;
      edtHistorico.EditValue      := ModelReceberObj.Historico;

    end
    else
    JKDialog('Aviso','Não foi possivel carregar os dados.', tdAlerta);
  Finally
    FreeAndNil(ModelReceberObj);
    FreeAndNil(ControlReceber);
  End;

end;

Procedure TFrmLancReceber.BloquearCamposParcelas;
begin
  if not tabparcela.IsEmpty then
  begin
    edtNatureza.Enabled         := False;
    edtDataemissao.Enabled      := False;
    edtdatavencimento.Enabled   := False;
    edtDatacompetencia.Enabled  := False;
    edtPessoa.Enabled           := False;
    edtdoc.Enabled              := False;
    edtcodigo.Enabled           := False;
    edtvalortotal.Enabled       := False;
    edtHistorico.Enabled        := False;

    BtnCliVisualizar.Enabled    := False;
    BtnCliNovo.Enabled          := False;
    btnDocPesq.Enabled          := False;
    btnDocIncluir.Enabled       := False;  
  end
  else
  begin
    edtNatureza.Enabled         := true;
    edtDataemissao.Enabled      := true;
    edtdatavencimento.Enabled   := true;
    edtDatacompetencia.Enabled  := true;
    edtPessoa.Enabled           := true;
    edtdoc.Enabled              := true;
    edtcodigo.Enabled           := true;
    edtvalortotal.Enabled       := true;
    edtHistorico.Enabled        := true;

    BtnCliVisualizar.Enabled    := true;
    BtnCliNovo.Enabled          := true;
    btnDocPesq.Enabled          := true;
    btnDocIncluir.Enabled       := true; 
  end;
end;

Procedure TFrmLancReceber.InserirParcelas;
var
  i, QtdeParcela, NumeroBase : Integer;
  ValorTotal: Currency;
  DataPrimeira, DataVenc: TDate;
begin
  if not TabParcela.Active then
    TabParcela.Open;

  TabParcela.DisableControls;

  Try
    TabParcela.EmptyDataSet;

    QtdeParcela       := edtParcela.EditValue;
    ValorTotal        := edtvalortotal.EditValue;
    DataPrimeira      := edtdatavencimento.Date;
    NumeroBase        := StrToIntDef(edtcodigo.EditValue, 0);

    if (QtdeParcela <=0) or (ValorTotal <=0) then
    begin
      JKDialog('Aviso','Informe quantidade de parcelas e valor total!', tdAlerta);
      Exit;
    end;

    DataVenc          := DataPrimeira;

    for I := 1 to QtdeParcela do
    begin
      TabParcela.Append;
      TabParcelaid_empresa.AsInteger          := edtempresa.EditValue;
      TabParcelaid_natureza.AsInteger         := edtnatureza.EditValue;
      TabParceladata_emissao.AsDateTime       := edtdataemissao.Date;
      TabParceladata_vencimento.AsDateTime    := DataVenc;
      TabParceladata_competencia.AsDateTime   := edtdatacompetencia.Date;
      TabParcelaid_pessoa.AsInteger           := edtpessoa.EditValue;
      TabParcelaid_documento.AsInteger        := edtdoc.EditValue;
      TabParceladoc.AsString                  := IntToStr(NumeroBase);// edtcodigo.EditValue;
      TabParcelavalororiginal.AsCurrency      := edtvalortotal.EditValue;
      TabParcelahistorico.AsString            := edtHistorico.Text;
      TabParcelaparcela.AsInteger             := I;
      TabParcela.Post;

      dataVenc    := IncMonth(DataPrimeira,I);
      NumeroBase  := NumeroBase + 1;
    end;

  Finally
    TabParcela.First;
    TabParcela.EnableControls;
  End;

end;

Procedure TFrmLancReceber.LimparParcelas;
begin
  TabParcela.EmptyDataSet;
end;

Procedure TFrmLancReceber.InserirLivrocaixa(idPlano, idCusto:Integer; vlr:Double);
begin
  // Insere no dataset (ou via SQL)
  TabCaixa.Append;
  TabCaixa.FieldByName('id_plano').AsInteger := idPlano;
  TabCaixa.FieldByName('id_custo').AsInteger := idCusto;
  TabCaixa.FieldByName('percentual').AsFloat := 0;
  TabCaixa.FieldByName('valor').AsFloat      := vlr;
  TabCaixa.Post;
end;

Procedure TFrmLancReceber.ExcluirLivrocaixa(idPlano, idCusto:Integer);
begin
  if TabCaixa.Locate('id_plano;id_custo', VarArrayof([idplano,idcusto]), []) then
    TabCaixa.Delete;
end;

Procedure TFrmLancReceber.LimparCampoCaixa;
begin
  edtPlano.EditValue      := 0;
  edtcusto.EditValue      := 0;
  edtvalorcaixa.EditValue := 0;
  edtplano.SetFocus;
end;

procedure TFrmLancReceber.cxButtonEdit3PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  //excluir registro caixa
  if not TabCaixa.Active then
  begin
    JKDialog('Aviso','Tabela temporária não está ativa!', tdAlerta);
    Exit;
  end;

  if TabCaixa.RecordCount = 0 then
  begin
    JKDialog('Aviso','Não há registros para excluir!', tdAlerta);
    Exit;
  end;

  ExcluirLivrocaixa(dsCaixa.DataSet.FieldByName('id_plano').AsInteger, dscaixa.DataSet.FieldByName('id_custo').AsInteger);

end;

procedure TFrmLancReceber.cxButtonEdit4PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  //Inserir livro caixa

  ButtonInserirCaixa;
end;

procedure TFrmLancReceber.ButtonInserirCaixa;
begin
  if (edtPlano.EditValue=0) or (edtPlano.Text='') then
  begin
    JKDialog('Aviso','Selecione um plano de conta!', tdAlerta);
    exit;
  end;

  if (edtcusto.EditValue=0) or (edtcusto.Text='') then
  begin
    JKDialog('Aviso','Selecione um centro de custo!', tdAlerta);
    exit;
  end;

  if (edtvalorcaixa.EditValue=0) then
  begin
    JKDialog('Aviso','Informe um valor!', tdAlerta);
    exit;
  end;

  InserirLivrocaixa(edtPlano.EditValue,
                    edtcusto.EditValue,
                    edtvalorcaixa.EditValue
                    );
  LimparCampoCaixa;
end;

procedure TFrmLancReceber.cxbuttonIncluirClick(Sender: TObject);
var
msg:string;
begin
  //Inserir parcelas
  if ValidarInsert(msg) then
  begin
    InserirParcelas;
    JKDialog('Socesso','Parcela gerada com sucesso', tdSucesso);
  end
  else
  begin
    JKDialog('Aviso',msg, tdAlerta);
    exit;
  end;  

end;

procedure TFrmLancReceber.cxButtonInserirEnter(Sender: TObject);
begin
  ButtonInserirCaixa;
end;

procedure TFrmLancReceber.cxButtonLimparClick(Sender: TObject);
begin
  if not TabParcela.Active then
  begin
    JKDialog('Aviso','Tabela temporária não está ativa!', tdAlerta);
    Exit;
  end;

  LimparParcelas;
  BloquearCamposParcelas;
end;

procedure TFrmLancReceber.FormShow(Sender: TObject);
begin
  inherited;
  ListarPessoa;
  ListarCusto;
  ListarDocumento;
  ListarEmpresa;
  ListarPlano;
  ListarNatureza;

  if TNavigation.ParamsStr='N' then
  begin
    edtDataemissao.EditValue      := Date;
    edtdatavencimento.EditValue   := '';
    edtdatacompetencia.EditValue  := '';

    //bloquear e preencher a empresa so vai ser desbloqueado se tiver uma configuração para lança em empresa diferente que ainda nao tem
    edtEmpresa.Properties.ReadOnly:= True;
    edtEmpresa.EditValue          := TSession.IDEMPRESA;

    edtvalortotal.EditValue       := 0;
    edtNatureza.SetFocus;

  end
  else
  begin
    //Editar
    AjustarLayout;
    //Ajustar layout
    CarregarDados;


  end;


end;

Procedure TFrmLancReceber.AjustarLayout;
begin
  //703 original  447
  edtempresa.Properties.ReadOnly  := True;



  Label10.Visible         := False;
  edtParcela.Visible      := False;
  cxbuttonIncluir.Visible := False;
  cxButtonLimpar.Visible  := False;
  cxGrid.Visible          := False;
  cxGridCaixa.Height      := 330;

end;

procedure TFrmLancReceber.ListarCusto;
begin
  TLookupHelper.CarregarLookup(
    TabCusto,LookupCustoSql);
end;

procedure TFrmLancReceber.ListarDocumento;
begin
  TLookupHelper.CarregarLookup(
    TabDoc,LookupDocumentoSql);
end;

procedure TFrmLancReceber.ListarEmpresa;
begin
  TLookupHelper.CarregarLookup(
    TabEmpresa,LookupEmpresaSql);
end;

procedure TFrmLancReceber.ListarNatureza;
begin
  TLookupHelper.CarregarLookup(
    TabNatureza,LookupNaturezaOrigemRecSql);
end;

procedure TFrmLancReceber.ListarPessoa;
begin
  TLookupHelper.CarregarLookup(
    TabCliente,LookupPessoaSql);
end;

procedure TFrmLancReceber.ListarPlano;
begin
  TLookupHelper.CarregarLookup(
    TabPlano,LookupPlanoContaRecSql);
end;

procedure TFrmLancReceber.TabParcelaAfterPost(DataSet: TDataSet);
begin
  BloquearCamposParcelas;
end;

Procedure TFrmLancReceber.GravarLivroCaixa(AID:Integer);
var
RID :Integer;
begin
  ModelRelPlanoObj:= Nil;
  ControlRelPlano := Nil;

  ModelRelPlanoObj:= TReceberPlano.Create;
  ControlRelPlano := TReceberPlanoContasController.Create;

  Try
    TabCaixa.First;
    tabCaixa.DisableControls;

    Try
      while not Tabcaixa.eof do
      begin

        ModelRelPlanoObj.id_receber_plano    := 0;
        ModelRelPlanoObj.id_receber          := AID;
        ModelRelPlanoObj.id_plano            := Tabcaixaid_plano.AsInteger;
        ModelRelPlanoObj.id_custo            := Tabcaixaid_custo.AsInteger;
        ModelRelPlanoObj.valor               := Tabcaixavalor.AsCurrency;
        ModelRelPlanoObj.id_empresa          := edtEmpresa.EditValue;
        ModelRelPlanoObj.id_usuario          := Tsession.ID_USUARIO;

        Try
          ControlRelPlano.Salvar(ModelRelPlanoObj,RID);
        Except on e:exception do
          begin
            raise Exception.Create(e.Message);
            TConeSul.GravarLogErroTXT(TConeSul.GravarLogErroRtti(ModelRelPlanoObj, e.Message));
          end;
        End;

        TabCaixa.Next;
      end;

    Finally
      TabCaixa.First;
      TabCaixa.EnableControls;
    End;


  Finally
    FreeAndNil(ModelRelPlanoObj);
    FreeAndNil(ControlRelPlano);
  End;

end;

{$ENDREGION}

{$REGION 'Função'}

function TFrmLancReceber.Salvar(out msg: string): Boolean;
var
RetornoID:Integer;
begin
  Result          := False;
  ModelReceberObj := Nil;
  ControlReceber  := Nil;

  ModelReceberObj := TReceber.Create;
  ControlReceber  := TReceberController.Create;

  Try

    if TNavigation.ParamsStr='N' then
    begin
      TabParcela.First;
      TabParcela.DisableControls;

      While not TabParcela.eof do
      begin

        ModelReceberObj.Id_receber          := 0;
        ModelReceberObj.Id_empresa          := TabParcelaid_empresa.AsInteger;
        ModelReceberObj.Id_natureza         := TabParcelaid_natureza.AsInteger;
        ModelReceberObj.Id_pessoa           := TabParcelaid_pessoa.AsInteger;
        ModelReceberObj.Id_documento        := TabParcelaid_documento.AsInteger;
        ModelReceberObj.Id_usuario_criou    := TSession.ID_USUARIO;
        ModelReceberObj.Data_lancamento     := TabParceladata_emissao.AsDateTime;
        ModelReceberObj.Data_vencimento     := TabParceladata_vencimento.AsDateTime;
        ModelReceberObj.Data_competencia    := TabParceladata_competencia.AsDateTime;
        ModelReceberObj.Data_criacao        := now;
        ModelReceberObj.Numero_titulo       := TabParceladoc.AsString;
        ModelReceberObj.Valor_original      := TabParcelavalororiginal.AsCurrency;
        ModelReceberObj.Valor_recebido      := 0;
        ModelReceberObj.Historico           := TabParcelahistorico.AsString;
        ModelReceberObj.Recebido            := 'A';
        ModelReceberObj.Parcela             := TabParcelaparcela.AsInteger;

        Try
          if ControlReceber.Salvar(ModelReceberObj, RetornoID) then
          begin
            //Gravar Livro caixa
            Try
              GravarLivroCaixa(RetornoID);
            except on e:exception do
              begin
                msg := 'Ocorreu um erro ao salvar o livro caixa!'+#13+e.Message;
                TConeSul.GravarLogErroTXT(TConeSul.GravarLogErroRtti(ModelReceberObj, e.Message));
                exit;
              end;
            End;

          end
          else
          msg     := 'Ocorreu um erro ao salvar o documento!';

        Except on e:exception do
          begin
            msg := 'Ocorreu um erro ao salvar o documento: '+e.Message;
            TConeSul.GravarLogErroTXT(TConeSul.GravarLogErroRtti(ModelReceberObj, e.Message));
            exit;
          end;
        End;

        TabParcela.Next;
      end;

      msg     := 'Documento salvo com sucesso';
      Result  := True;

      TabParcela.EnableControls;
    end
    else
    begin
        //editar
        ModelReceberObj.Id_receber          := TNavigation.ParamInt;
        ModelReceberObj.Id_empresa          := edtempresa.EditValue;
        ModelReceberObj.Id_natureza         := edtnatureza.EditValue;
        ModelReceberObj.Id_pessoa           := edtpessoa.EditValue;
        ModelReceberObj.Id_documento        := edtdoc.EditValue;
        ModelReceberObj.Id_usuario_alterou  := TSession.ID_USUARIO;
        ModelReceberObj.Data_lancamento     := edtDataemissao.Date;
        ModelReceberObj.Data_vencimento     := edtdatavencimento.Date;
        ModelReceberObj.Data_competencia    := edtDatacompetencia.Date;
        ModelReceberObj.Numero_titulo       := edtcodigo.EditValue;
        ModelReceberObj.Valor_original      := edtvalortotal.EditValue;
        ModelReceberObj.Historico           := edtHistorico.Text;
        ModelReceberObj.Recebido            := 'A';

        Try
          if ControlReceber.Salvar(ModelReceberObj, RetornoID) then
          begin
            //Gravar Livro caixa
            {Try
              GravarLivroCaixa(RetornoID);
            except on e:exception do
              begin
                msg := 'Ocorreu um erro ao salvar o livro caixa!'+#13+e.Message;
                TConeSul.GravarLogErroTXT(TConeSul.GravarLogErroRtti(ModelReceberObj, e.Message));
                exit;
              end;
            End;}

          end
          else
          msg     := 'Ocorreu um erro ao salvar o documento!';

        Except on e:exception do
          begin
            msg := 'Ocorreu um erro ao salvar o documento: '+e.Message;
            TConeSul.GravarLogErroTXT(TConeSul.GravarLogErroRtti(ModelReceberObj, e.Message));
            exit;
          end;
        End;
        msg     := 'Documento salvo com sucesso';
        Result  := True;
    end;

  Finally
    FreeAndNil(ModelReceberObj);
    FreeAndNil(ControlReceber);
  End;
    
end;

Function TFrmLancReceber.ValidarInsert(out msg: string): Boolean;
var
DataEmissao, DataVencimento: TDate;
begin
  Result  := True;

  if (edtNatureza.EditValue=0) or (edtNatureza.Text='') then
  begin
    msg     := 'Selecione a natureza!';
    Result  := False;
    exit;  
  end;

  if VarIsNull(edtDataemissao.EditValue) or VarIsNull(edtdatavencimento.EditValue) or VarIsNull(edtDatacompetencia.EditValue) then
  begin
    msg     := 'Preencha as datas obrigatórias!';
    Result  := False;
    exit;
  end;

  DataEmissao    := edtDataEmissao.EditValue;
  DataVencimento := edtDataVencimento.EditValue;

  if DataVencimento < DataEmissao then
  begin
    msg     := 'Data de vencimento menor que a data de emissão!';
    Result  := False;
    exit;
  end;

  if edtDataemissao.EditValue > edtdatavencimento.EditValue  then
  begin
    msg     := 'Data de vencimento não pode ser menor que a data de emissão!';
    Result  := False;
    exit;
  end;

  if (edtPessoa.EditValue=0) or (edtpessoa.Text='') then
  begin
    msg     := 'Selecione uma pessoa!';
    Result  := False;
    exit;
  end;

  if (edtDoc.EditValue=0) or (edtDoc.Text='') then
  begin
    msg     := 'Selecione o tipo de documento!';
    Result  := False;
    exit;
  end;

  if edtcodigo.Text='' then
  begin
    msg     := 'Informe um número para o documento!';
    Result  := False;
    exit;
  end;

  if edtvalortotal.editvalue=0 then
  begin
    msg     := 'Informe o valor do documento!';
    Result  := False;
    exit;
  end;

  if edtHistorico.Text='' then
  begin
    msg     := 'Informe o histórico do documento!';
    Result  := False;
    exit;
  end;

  if TabCaixa.IsEmpty then
  begin
    msg     := 'Não foi informado o plano de contas!';
    Result  := False;
    exit;  
  end;
  
end;

function TFrmLancReceber.ValidarCampos(out msg: string): Boolean;
var
  TotalCaixa, ValorTitulo: Double;
begin
  Result  := True; 
  if TNavigation.ParamsStr='N' then
  begin
    if TabParcela.IsEmpty then
    begin
      msg     := 'Nenhuma parcela incluida!';
      Result  := False;
      exit;
    end;
  end;

  {TotalCaixa  := SomaLivroCaixa(TabCaixa, 'valor'); // supondo que o campo se chama "valor"
  ValorTitulo := edtvalortotal.EditValue;

  if TotalCaixa <> ValorTitulo then
  begin
    msg     := Format('Diferença encontrada: %.2f entre o valor fornecido e o plano de contas!' , [ValorTitulo - TotalCaixa]);
    Result  := False;
    exit;
  end;}
  
end;

function TFrmLancReceber.SomaLivroCaixa(DataSet: TDataSet; const NomeCampo: string): Double;
var
  Total: Double;
begin
  Total := 0;
  DataSet.DisableControls;
  try
    DataSet.First;
    while not DataSet.Eof do
    begin
      Total := Total + DataSet.FieldByName(NomeCampo).AsFloat;
      DataSet.Next;
    end;
  finally
    DataSet.EnableControls;
  end;
  Result := Total;
end;

{$ENDREGION}



end.
