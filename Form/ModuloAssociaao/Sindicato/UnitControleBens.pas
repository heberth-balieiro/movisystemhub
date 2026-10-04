unit UnitControleBens;

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
  Vcl.StdCtrls, Vcl.Buttons, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxBlobEdit, cxCurrencyEdit,
  cxGroupBox, UFormNovoBasePesquisa, Vcl.ButtonStylesAttributes,
  System.ImageList, Vcl.ImgList, cxImageList, DBAccess, Uni, ACBrBase,
  ACBrEnterTab, Vcl.StyledButton, dxmdaset,Controller.bem,Model.Bem,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, UnitBemCad,
  Datasnap.DBClient, Controller.LookupHelper, UnitGlobal, UnitAnexo,
  cxImageComboBox;

type
  TFrmControleBens = class(TFormNovoBasePesquisa)
    frxImpressao: TfrxReport;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    btnAnexo: TMenuItem;
    mdPesquisa: TdxMemData;
    GridRecId: TcxGridDBColumn;
    Gridid_ticket: TcxGridDBColumn;
    Gridvalor_ticket: TcxGridDBColumn;
    Griddata_ticket: TcxGridDBColumn;
    Griddata_desconto: TcxGridDBColumn;
    Griddata_pagamento: TcxGridDBColumn;
    Gridcodigo: TcxGridDBColumn;
    Gridconvenio: TcxGridDBColumn;
    Gridsituacao: TcxGridDBColumn;
    Gridmotivo: TcxGridDBColumn;
    Gridobs_cancelamento: TcxGridDBColumn;
    Label3: TLabel;
    Label4: TLabel;
    cxcategoria: TcxLookupComboBox;
    cxdepartamento: TcxLookupComboBox;
    TabDepartamento: TClientDataSet;
    TabDepartamentoid_departamento: TIntegerField;
    TabDepartamentodescricao: TStringField;
    TabDepartamentonpesquisa: TStringField;
    dsDepartamento: TUniDataSource;
    Tabcategoria: TClientDataSet;
    Tabcategoriaid_categoria: TIntegerField;
    Tabcategoriadescricao: TStringField;
    Tabcategorianpesquisa: TStringField;
    dscategoria: TUniDataSource;
    mdPesquisaid_bem: TIntegerField;
    mdPesquisadescricao: TStringField;
    mdPesquisamodelo: TStringField;
    mdPesquisadepartamento: TStringField;
    mdPesquisalocalizacao: TStringField;
    mdPesquisasituacao: TStringField;
    mdPesquisavalor: TFloatField;
    mdPesquisacodigo: TIntegerField;
    mdPesquisatem_anexo: TIntegerField;
    GridColumn1: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure btnAnexoClick(Sender: TObject);
    
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
  FrmControleBens: TFrmControleBens;
  Obj     : TModelBem;
implementation

{$R *.dfm}

uses Vcl.Navigation, UnitTicketsCad, UnitPrincipalNew,
  uJKDialog, System.DateUtils, Vcl.Session, System.IniFiles,
  Vcl.PermissaoUsuario, System.Generics.Collections;

{ TFrmControleBens }

procedure TFrmControleBens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmControleBens  := Nil;
end;

procedure TFrmControleBens.FormCreate(Sender: TObject);
begin
  inherited;
  if not mdPesquisa.Active then
  mdPesquisa.Open;
end;

procedure TFrmControleBens.FormShow(Sender: TObject);
begin
  inherited;
  ParamsTela  := 'Bem';
  TitleText   := 'Controle de Bens';

  TLookupHelper.CarregarLookup(
                    TabCategoria,LookupCategoria);

  TLookupHelper.CarregarLookup(
                    TabDepartamento,LookupDepartamento);



end;

procedure TFrmControleBens.Novo;
begin
  inherited;
  if not Assigned(FrmBemCad) then
  FrmBemCad := TFrmBemCad.Create(Application);
  FrmBemCad.ParamsStr  := 'N';
  FrmBemCad.ShowModal;
end;

procedure TFrmControleBens.Pesquisa;
var
List    : TObjectList<TmodelBem>;
nCampo, situacao : String;
AIdCategoria    :Integer;
AIDDepartamento :integer;
begin
  inherited;
  try
    List            := Nil;
    nCampo          := '';
    situacao        := '';
    AIdCategoria    := 0;
    AIDDepartamento := 0;

    if trim(edtBusca.Text) <> '' then
    nCampo     := Trim(edtBusca.Text);

    case cxativo.ItemIndex of
      1:situacao:= 'S';
      2:situacao:= 'N';
    end;

    if (cxcategoria.Text <>'') or (cxcategoria.EditValue > 0) then
    AIdCategoria  := cxcategoria.EditValue;

    if (cxdepartamento.Text <>'') or (cxdepartamento.EditValue > 0) then
    AIDDepartamento  := cxdepartamento.EditValue;


    Try
      List  := TBemController.ListarTodos(nCampo, situacao, AIdCategoria, AIDDepartamento);

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

        mdPesquisaid_bem.AsInteger      := Item.id_bem;
        mdPesquisacodigo.AsInteger      := Item.codigo;
        mdPesquisadescricao.AsString    := Item.descricao;
        mdPesquisamodelo.AsString       := Item.modelo;
        mdPesquisadepartamento.AsString := Item.departamento;
        mdPesquisalocalizacao.AsString  := Item.localizacao;
        mdPesquisasituacao.AsString     := Item.situacao;
        mdPesquisavalor.AsFloat         := Item.valor_aquisicao;
        mdPesquisatem_anexo.AsInteger   := Item.tem_anexo;
        mdPesquisa.Post;
      end;
      mdPesquisa.First;
      mdPesquisa.EnableControls;

    Finally
      FreeAndNil(ContTicket);
      if Assigned(List) then
        List.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmControleBens.btnAnexoClick(Sender: TObject);
var
  Permissao: TPermissaoUsuario;
begin
  try
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,ParamsTela);
    if Permissao.TemPermissao('Permitir Anexar') then
    begin
      if not mdPesquisa.Eof then
      begin
        if JKDialog('Aviso', 'Deseja anexar no registro selecionado?', tdMensagem)  then
        begin
          if not Assigned(FrmAnexo) then
          FrmAnexo                  := TFrmAnexo.Create(Application);
          FrmAnexo.ParamsStr        := 'N';
          FrmAnexo.ATipoReferencia  := FrmControleBens.Name;
          FrmAnexo.ARefTela         := ParamsTela;
          FrmAnexo.ParamsInt        := mdPesquisaid_bem.AsInteger;

          if mdPesquisaid_bem.AsInteger = 0 then
          begin
            JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
            exit;
          end;
          FrmAnexo.ShowModal;
        end;
      end
      else
      begin
        JKDialog('Aviso','Realize uma pesquisa!', tdAlerta);
      end;
    end
    else
      JKDialog('Acesso Negado',
               'O seu perfil não tem permissão para utilizar.' + sLineBreak +
               'Por favor, entre em contato com o administrador do sistema.',
               tdAlerta);
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;

end;

procedure TFrmControleBens.BtnLimparClick(Sender: TObject);
begin
  inherited;
  cxcategoria.EditValue     :=0;
  cxdepartamento.EditValue  :=0;
end;

procedure TFrmControleBens.Editar;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja editar o registro selecionado?', tdMensagem)  then
      begin
        if not Assigned(FrmBemCad) then
        FrmBemCad := TFrmBemCad.Create(Application);
        FrmBemCad.ParamsStr  := 'E';
        FrmBemCad.ParamsInt  := mdPesquisaid_bem.AsInteger;
        if mdPesquisaid_bem.AsInteger = 0 then
        begin
          JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
          exit;
        end;
        FrmBemCad.Show;
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

procedure TFrmControleBens.Excluir;
begin
  inherited;
  try
    if not mdPesquisa.Eof then
    begin
      if JKDialog('Aviso', 'Deseja excluir o registro selecionado?', tdMensagem)  then
      begin

          if mdPesquisaid_bem.AsInteger = 0 then
          begin
            JKDialog('Alerta','Nenhum registro selecionado.', tdAlerta);
            exit;
          end;

          if TBemController.Excluir(mdPesquisaid_bem.AsInteger, Tsession.ID_USUARIO, TSession.IDEMPRESA) then
          begin
            Pesquisa;
            JKDialog('Sucesso','Registro excluido com sucesso!', tdsucesso);
          end;
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

procedure TFrmControleBens.Listagem;
begin
  inherited;

end;

procedure TFrmControleBens.Relatorio;
begin
  inherited;

end;

end.


