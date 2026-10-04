unit UnitBemCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitBaseNovoCadastro,
  Vcl.ButtonStylesAttributes, cxStyles, cxGridTableView, cxClasses, Data.DB,
  DBAccess, Uni, ACBrBase, ACBrEnterTab, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.StyledButton, dxBevel, Vcl.ExtCtrls, cxGraphics, cxControls,
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
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxButtonEdit, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxCalendar, cxCurrencyEdit, cxSpinEdit, cxBlobEdit, cxCheckBox,
  Model.Bem, Controller.Bem, Controller.LookupHelper, UnitGlobal, UConeSul,
  Datasnap.DBClient;

type
  TFrmBemCad = class(TFormNovoBaseCadastro)
    Label7: TLabel;
    cxCodigo: TcxTextEdit;
    Label8: TLabel;
    cxdescricao: TcxTextEdit;
    cxtombamento: TcxTextEdit;
    Label1: TLabel;
    cxcategoria: TcxLookupComboBox;
    Label2: TLabel;
    BtnSede: TcxButtonEdit;
    cxgrupo: TcxLookupComboBox;
    cxButtonEdit1: TcxButtonEdit;
    Label3: TLabel;
    cxlocalizacao: TcxLookupComboBox;
    cxButtonEdit2: TcxButtonEdit;
    Label4: TLabel;
    Label5: TLabel;
    cxdepartamento: TcxLookupComboBox;
    cxButtonEdit3: TcxButtonEdit;
    Label6: TLabel;
    cxmodelo: TcxTextEdit;
    cxmarca: TcxLookupComboBox;
    cxButtonEdit4: TcxButtonEdit;
    Label9: TLabel;
    Label10: TLabel;
    cxserie: TcxTextEdit;
    cxdata: TcxDateEdit;
    Label11: TLabel;
    cxvalor: TcxCurrencyEdit;
    Label12: TLabel;
    cxnota: TcxTextEdit;
    Label13: TLabel;
    cxvida: TcxSpinEdit;
    Label14: TLabel;
    Label15: TLabel;
    cxfornecedor: TcxLookupComboBox;
    cxButtonEdit5: TcxButtonEdit;
    cxsituacao: TcxComboBox;
    Label36: TLabel;
    Label59: TLabel;
    cxobs: TcxBlobEdit;
    cxativo: TcxCheckBox;
    TabGrupo: TClientDataSet;
    TabGrupoid_grupo: TIntegerField;
    TabGrupocodigo: TIntegerField;
    TabGrupogrupo: TStringField;
    dsGrupo: TUniDataSource;
    TabLocalizacao: TClientDataSet;
    TabLocalizacaoid_localizacao: TIntegerField;
    TabLocalizacaocodigo: TIntegerField;
    TabLocalizacaolocalizacao: TStringField;
    dsLocalizacao: TUniDataSource;
    TabMarca: TClientDataSet;
    TabMarcaid_marca: TIntegerField;
    TabMarcacodigo: TIntegerField;
    TabMarcamarca: TStringField;
    dsMarca: TUniDataSource;
    TabFornecedor: TClientDataSet;
    dsFornecedor: TUniDataSource;
    TabFornecedorid_socio: TIntegerField;
    TabFornecedorcliente: TStringField;
    TabFornecedorcpf: TStringField;
    TabFornecedorwhatsapp: TStringField;
    TabFornecedoraviso: TStringField;
    dscategoria: TUniDataSource;
    Tabcategoria: TClientDataSet;
    Tabcategoriaid_categoria: TIntegerField;
    Tabcategoriadescricao: TStringField;
    Tabcategorianpesquisa: TStringField;
    TabDepartamento: TClientDataSet;
    dsDepartamento: TUniDataSource;
    TabDepartamentoid_departamento: TIntegerField;
    TabDepartamentodescricao: TStringField;
    TabDepartamentonpesquisa: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;
    { Public declarations }
  end;

var
  FrmBemCad: TFrmBemCad;
  Obj       :TModelBem;

implementation

{$R *.dfm}

Uses Vcl.Session, uJKDialog;

{ TFrmBemCad }

procedure TFrmBemCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmBemCad := nil;
end;

procedure TFrmBemCad.FormShow(Sender: TObject);
begin
  inherited;
  Try

    TLookupHelper.CarregarLookup(
                    TabCategoria,LookupCategoria);

    TLookupHelper.CarregarLookup(
                    TabDepartamento,LookupDepartamento);

    TLookupHelper.CarregarLookup(
                  Tabgrupo,LookupGrupoSql);

    TLookupHelper.CarregarLookup(
                    TabMarca,LookupMarcaSql);

    TLookupHelper.CarregarLookup(
                    TabLocalizacao,LookupLocalizacaoSql);

    TLookupHelper.CarregarLookup(
                    TabFornecedor,LookupPessoaFornecedorSql);


    if ParamsStr = 'N' then
    begin
      TitleText   := 'Novo Bem';

    end
    else
    begin
      TitleText   := 'Editar Bem';

      PopularCampos;
    end;

  except on E: Exception do
    Begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    End;
  End;
end;

procedure TFrmBemCad.PopularCampos;
begin
  inherited;
  Obj      := Nil;
  try
    Obj    := TModelBem.Create;
    Try
      if (ParamsInt=0) or (InttoStr(ParamsInt) = '') then
      raise Exception.Create('Nenhum ID passado no parâmetro.');

      Obj     := TBemController.BuscarPorID(ParamsInt);
      if Assigned(Obj) then
      begin
        cxcodigo.EditValue      := obj.codigo;
        cxdescricao.EditValue   := obj.descricao;
        cxtombamento.EditValue  := obj.tombamento;
        cxmodelo.EditValue      := obj.modelo;
        cxcategoria.EditValue   := obj.id_categoria;
        cxlocalizacao.EditValue := obj.id_localizacao;
        cxgrupo.EditValue       := obj.id_grupo;
        cxdepartamento.EditValue:= obj.id_departamento;
        cxmarca.EditValue       := obj.id_marca;
        cxserie.EditValue       := obj.numero_serie;
        cxdata.EditValue        := obj.data_aquisicao;
        cxvida.EditValue        := obj.vida_util_meses;
        cxvalor.EditValue       := obj.valor_aquisicao;
        cxnota.EditValue        := obj.nota_fiscal;
        cxfornecedor.EditValue  := obj.id_fornecedor;
        cxsituacao.Text         := obj.situacao;
        cxobs.EditValue         := obj.observacao;
        cxativo.EditValue       := obj.ativo;

      end;

    Finally
      FreeAndNil(Obj);
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmBemCad.Salvar(out msg: string): Boolean;
var
AId:Integer;
begin
  Result       := False;
  Obj          := nil;

  try
    Obj        := TModelBem.Create;
    Try
      if ParamsStr='N' then
      Obj.id_bem               := 0
      else
      Obj.id_bem                := ParamsInt;
      Obj.descricao             := Trim(cxdescricao.Text);
      Obj.tombamento            := Trim(cxtombamento.Text);
      Obj.id_categoria          := cxcategoria.EditValue;
      Obj.id_grupo              := cxgrupo.EditValue;
      Obj.id_localizacao        := cxlocalizacao.EditValue;
      Obj.id_departamento       := cxdepartamento.EditValue;
      Obj.id_marca              := cxmarca.EditValue;
      Obj.modelo                := Trim(cxmodelo.Text);
      Obj.numero_serie          := trim(cxserie.Text);
      Obj.data_aquisicao        := TConesul.ValidarDataNull(cxdata.EditValue);
      Obj.valor_aquisicao       := cxvalor.EditValue;
      Obj.vida_util_meses       := cxvida.EditValue;
      Obj.id_fornecedor         := cxfornecedor.EditValue;
      Obj.nota_fiscal           := Trim(cxnota.Text);
      Obj.observacao            := Trim(cxobs.Text);
      Obj.ativo                 := cxativo.EditValue;
      Obj.id_usuario            := TSession.ID_USUARIO;
      Obj.id_empresa            := TSession.IDEMPRESA;
      obj.situacao              := cxsituacao.Text;

      if TBemController.Salvar(Obj, AId, msg) then
      begin
        if AID = 0 then
        AID     := ParamsInt;
        msg     := 'Registro salvo com sucesso, ID: '+IntToStr(AID);
        Result  := true;
        ParamsCloseTela := 'S';
      end;

    Finally
      FreeAndNil(Obj);
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmBemCad.ValidarCampos(out msg: string): Boolean;
begin
  Result  := true;

  Try
    if cxDescricao.Text = '' then
    begin
      msg   := 'Informe uma descrição!';
      result:= False;
      exit;
    end;

    if (cxcategoria.Text='') or (cxcategoria.EditValue=0) then
    begin
      msg   := 'Selecione uma categoria!';
      result:= False;
      exit;
    end;

    if (cxlocalizacao.Text='') or (cxlocalizacao.EditValue=0) then
    begin
      msg   := 'Selecione uma localização!';
      result:= False;
      exit;
    end;

    if (cxgrupo.Text='') or (cxgrupo.EditValue=0) then
    begin
      msg   := 'Selecione um grupo!';
      result:= False;
      exit;
    end;

    if (cxdepartamento.Text='') or (cxdepartamento.EditValue=0) then
    begin
      msg   := 'Selecione um departamento!';
      result:= False;
      exit;
    end;

    if (cxmarca.Text='') or (cxmarca.EditValue=0) then
    begin
      msg   := 'Selecione uma marca!';
      result:= False;
      exit;
    end;

    if cxdata.Text ='' then
    begin
      msg   := 'Informe uma data!';
      result:= False;
      exit;
    end;

    if (cxsituacao.Text ='') or (cxsituacao.ItemIndex=-1) then
    begin
      msg   := 'Informe uma situação!';
      result:= False;
      exit;
    end;

  except on E: Exception do
    Begin
      JKDialog('Erro','Ocorreu um erro ao validar os campos:'+#13+e.Message, tderro);
    End;
  End;

end;

end.
