unit UnitProdutoCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Navigation, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBasic,
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
  dxSkinXmas2008Blue, cxButtonEdit, cxMaskEdit, cxDropDownEdit, cxTextEdit,
  cxBlobEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxGroupBox,
  Vcl.ComCtrls, cxCurrencyEdit, cxCheckBox, dxGDIPlusClasses, dxBevel, ACBrBase,
  ACBrEnterTab, Data.DB, DBAccess, Uni,
  model.tabproduto, Controller.Produto, Datasnap.DBClient, UnitBaseNovoCadastro,
  Vcl.ButtonStylesAttributes, Vcl.StyledButton, uConfiguracaoService, acbrutil,
  UnitPermissao, UnitGrupoCad, UnitGlobal, UnitMarcaCad, UnitLocalizacaoCad,
  UnitUnidadeCad, cxStyles, cxGridTableView, cxClasses,
   Model.Estoque,Controller.Estoque;

type
  TFrmProdutoCad = class(TFormNovoBaseCadastro)
    dsMarca: TUniDataSource;
    dsGrupo: TUniDataSource;
    dsLocalizacao: TUniDataSource;
    dsUnidade: TUniDataSource;
    TabUnidade: TClientDataSet;
    TabMarca: TClientDataSet;
    TabMarcaid_marca: TIntegerField;
    TabMarcacodigo: TIntegerField;
    TabMarcamarca: TStringField;
    TabGrupo: TClientDataSet;
    TabGrupoid_grupo: TIntegerField;
    TabGrupocodigo: TIntegerField;
    TabGrupogrupo: TStringField;
    TabLocalizacao: TClientDataSet;
    TabLocalizacaoid_localizacao: TIntegerField;
    TabLocalizacaocodigo: TIntegerField;
    TabLocalizacaolocalizacao: TStringField;
    TabUnidadeid_unidade: TIntegerField;
    TabUnidadecodigo: TIntegerField;
    TabUnidadeuni: TStringField;
    TabUnidadeunidade: TStringField;
    Label26: TLabel;
    cxCodigo: TcxTextEdit;
    cxBarra: TcxTextEdit;
    Label27: TLabel;
    Label30: TLabel;
    cxGTIN: TcxTextEdit;
    cxRef: TcxTextEdit;
    dxBevel2: TdxBevel;
    edtFoto: TImage;
    Label31: TLabel;
    cxDescricao: TcxTextEdit;
    Label32: TLabel;
    Label1: TLabel;
    cxFiscal: TcxTextEdit;
    cxGrupo: TcxLookupComboBox;
    BtnGrupo: TcxButtonEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label33: TLabel;
    BtnMarca: TcxButtonEdit;
    cxLocalizacao: TcxLookupComboBox;
    BtnLocalizacao: TcxButtonEdit;
    cxTipo: TcxComboBox;
    Label5: TLabel;
    cxUnidade: TcxLookupComboBox;
    btnUnidade: TcxButtonEdit;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label22: TLabel;
    Label34: TLabel;
    cxprccompra: TcxCurrencyEdit;
    cxperccusto: TcxCurrencyEdit;
    cxprccusto: TcxCurrencyEdit;
    cxperclucro: TcxCurrencyEdit;
    cxprcvenda: TcxCurrencyEdit;
    cxprcpromocao: TcxCurrencyEdit;
    cxperccomissao: TcxCurrencyEdit;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    lbEstoque: TLabel;
    Label39: TLabel;
    cxestminimo: TcxCurrencyEdit;
    cxestmaximo: TcxCurrencyEdit;
    cxestatual: TcxCurrencyEdit;
    cxpeso: TcxCurrencyEdit;
    Label40: TLabel;
    Label41: TLabel;
    cxobs: TcxBlobEdit;
    cxaviso: TcxBlobEdit;
    cxativo: TcxCheckBox;
    cxaltdescricao: TcxCheckBox;
    cxexibirapp: TcxCheckBox;
    cxservico: TcxCheckBox;
    cxfracionado: TcxCheckBox;
    cxcontrolaestoque: TcxCheckBox;
    cxequipamento: TcxCheckBox;
    cxestoquenegativo: TcxCheckBox;
    cxmateriaprima: TcxCheckBox;
    cxMarca: TcxLookupComboBox;
    cxPrecom2: TcxCheckBox;
    cxusachapa: TcxCheckBox;
    cxlargura: TcxCurrencyEdit;
    Label6: TLabel;
    Label8: TLabel;
    cxaltura: TcxCurrencyEdit;
    Label11: TLabel;
    cxarea: TcxCurrencyEdit;
    cxqtde: TcxCurrencyEdit;
    Label13: TLabel;
    procedure edtFotoDblClick(Sender: TObject);
    procedure cxBarraKeyPress(Sender: TObject; var Key: Char);
    procedure cxGTINKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnGrupoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BtnMarcaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BtnLocalizacaoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnUnidadePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxusachapaClick(Sender: TObject);
    procedure cxlarguraPropertiesEditValueChanged(Sender: TObject);

  private
    procedure CalcularEstoqueM2;
    procedure AtualizarCamposChapa;
//    Function Salvar(out msg:string):Boolean;
//    Function ValidarCampos(out msg:string):Boolean;
//    Procedure CarregarDados;
//    function ValidarTamanhoImagem(caminhoImagem: string; larguraMax,
//      alturaMax: Integer): Boolean;
//    procedure ListarGrupoLookup;
//    procedure ListarLocalizaçãoLookup;
//    procedure ListarMarcaLookup;
//    procedure ListarModeloLookup;
//    procedure ListarPessoaLookup;
//    procedure ListarUnidadeLookup;

    { Private declarations }
  public
    function Salvar(out msg: string): Boolean; override;
    function ValidarCampos(out msg: string): Boolean; override;
    procedure PopularCampos; override;
    { Public declarations }
  end;

var
  FrmProdutoCad : TFrmProdutoCad;
  ObjProduto    : TTabProduto;
  ContrProduto  : TProdutoController;

  ContEstoque   : TEstoqueController;
  ObjEstoque    : TModelEstoque;

//  ObjProduto    : TTabProduto;
//  ObjEquipamento: TTabProdutoEquipamento;
//  ContrProduto  : TProdutoController;
//  ContrEquipamento : TProdutoEquipamentoController;
implementation

{$R *.dfm}

uses UConeSul, Vcl.Loading, Vcl.Session, uJKDialog, System.SysUtils, System.Math,
Controller.LookupHelper,Vcl.PermissaoUsuario;

procedure TFrmProdutoCad.BtnGrupoPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
Permissao   : TPermissaoUsuario;
begin
  inherited;
  Try  //grupo
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Grupo');

    if Permissao.TemPermissao('Permitir Criar Novo') then
    begin
      Try
        FrmGrupoCad             := TFrmGrupoCad.Create(Application);
        FrmGrupoCad.ParamsStr   := 'N';
        FrmGrupoCad.ShowModal;
      Finally
        TLookupHelper.CarregarLookup(
                    Tabgrupo,LookupGrupoSql);
      End;

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

procedure TFrmProdutoCad.BtnLocalizacaoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
Permissao   : TPermissaoUsuario;
begin
  inherited;
  Try       //Localizacao
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Localização');

    if Permissao.TemPermissao('Permitir Criar Novo') then
    begin
      Try
        FrmLocalizacaoCad             := TFrmLocalizacaoCad.Create(Application);
        FrmLocalizacaoCad.ParamsStr   := 'N';
        FrmLocalizacaoCad.ShowModal;
      Finally
        TLookupHelper.CarregarLookup(
                    TabLocalizacao,LookupLocalizacaoSql);
      End;

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

procedure TFrmProdutoCad.BtnMarcaPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
Permissao   : TPermissaoUsuario;
begin
  inherited;
  Try       //marca
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Marca');

    if Permissao.TemPermissao('Permitir Criar Novo') then
    begin
      Try
        FrmMarcaCad             := TFrmMarcaCad.Create(Application);
        FrmMarcaCad.ParamsStr   := 'N';
        FrmMarcaCad.ShowModal;
      Finally
        TLookupHelper.CarregarLookup(
                    TabMarca,LookupMarcaSql);
      End;

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

procedure TFrmProdutoCad.btnUnidadePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
Permissao   : TPermissaoUsuario;
begin
  inherited;
  Try       //uniade
    FreeAndNil(TPermissaoUsuario.FInstance);
    Permissao := TPermissaoUsuario.GetInstance(TSession.idperfiluser,'Unidade');

    if Permissao.TemPermissao('Permitir Criar Novo') then
    begin
      Try
        FrmUnidadeCad             := TFrmUnidadeCad.Create(Application);
        FrmUnidadeCad.ParamsStr   := 'N';
        FrmUnidadeCad.ShowModal;
      Finally
        TLookupHelper.CarregarLookup(
                    TabUnidade,LookupUnidadeSql);
      End;

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

procedure TFrmProdutoCad.cxBarraKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    Exit;

  if not CharInSet(Key, ['0'..'9', #8]) then
    Key := #0;
end;

procedure TFrmProdutoCad.cxGTINKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    Exit;

  if not CharInSet(Key, ['0'..'9', #8]) then
    Key := #0;
end;

procedure TFrmProdutoCad.cxlarguraPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalcularEstoqueM2;
end;

procedure TFrmProdutoCad.cxusachapaClick(Sender: TObject);
begin
  inherited;
  AtualizarCamposChapa;
end;

procedure TFrmProdutoCad.edtFotoDblClick(Sender: TObject);
var
  OpenDialog: TOpenDialog;
begin
  try
    OpenDialog := TOpenDialog.Create(nil);
    try
      OpenDialog.Filter := 'Imagens JPEG|*.jpg;*.jpeg|Imagens PNG|*.png;*.png';
      OpenDialog.Title := 'Selecione uma foto';

      if OpenDialog.Execute then
      begin
        edtfoto.Picture.LoadFromFile(OpenDialog.FileName);
      end;
    finally
      OpenDialog.Free;
    end;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmProdutoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  TConeSul.nfoto:=nil;
  FrmProdutoCad := Nil;
end;

procedure TFrmProdutoCad.FormShow(Sender: TObject);
begin
  inherited;
  Try
    TLookupHelper.CarregarLookup(
                  Tabgrupo,LookupGrupoSql);

    TLookupHelper.CarregarLookup(
                    TabMarca,LookupMarcaSql);

    TLookupHelper.CarregarLookup(
                    TabLocalizacao,LookupLocalizacaoSql);

    TLookupHelper.CarregarLookup(
                    TabUnidade,LookupUnidadeSql);


    if ParamsStr = 'N' then
    begin
      TitleText                 := 'Novo Produto/Serviço';
      cxativo.Checked           := True;
      cxservico.Checked         := False;
      cxfracionado.Checked      := False;
      cxequipamento.Checked     := False;
      cxaltdescricao.Checked    := False;
      cxexibirapp.Checked       := False;
      cxcontrolaestoque.Checked := True;
      cxestoquenegativo.Checked := False;
      cxmateriaprima.Checked    := False;
      cxbarra.SetFocus;
    end
    else
    begin
      TitleText                 := 'Editar Produto/Serviço';
      PopularCampos;
      cxqtde.Enabled            := False;
    end;

  Except on e:exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  End;
end;

procedure TFrmProdutoCad.PopularCampos;
begin
  try
    ObjProduto        := Nil;
    ContrProduto       := Nil;

    ObjProduto    := TTabProduto.Create;
    ContrProduto    := TProdutoController.Create;
    Try

        ObjProduto    := ContrProduto.BuscarPorID(ParamsInt);
        if Assigned(ObjProduto) then
        begin

          cxcodigo.EditValue        := ObjProduto.codigo;
          cxbarra.EditValue         := ObjProduto.cod_barras;
          cxgtin.EditValue          := ObjProduto.prod_gtin;
          cxref.EditValue           := ObjProduto.referencia;
          cxdescricao.EditValue     := ObjProduto.descricao;
          cxfiscal.EditValue        := ObjProduto.descricao_fiscal;
          cxgrupo.EditValue         := ObjProduto.id_grupo;
          cxmarca.EditValue         := ObjProduto.id_marca;
          cxlocalizacao.EditValue   := ObjProduto.id_localizacao;
          cxtipo.EditValue          := ObjProduto.tipo_produto;
          cxunidade.EditValue       := ObjProduto.id_unidade;
          cxprccompra.EditValue     := ObjProduto.prc_compra;
          cxperccusto.EditValue     := ObjProduto.per_custo;
          cxprccusto.EditValue      := ObjProduto.prc_custo;
          cxperclucro.EditValue     := ObjProduto.per_lucro;
          cxprcvenda.EditValue      := ObjProduto.prc_venda;
          cxprcpromocao.EditValue   := ObjProduto.prc_promocao;
          cxperccomissao.EditValue  := ObjProduto.prod_comissaoperc;
          cxestminimo.EditValue     := ObjProduto.estoque_minimo;
          cxestmaximo.EditValue     := ObjProduto.prod_estoque_maximo;
          cxestatual.EditValue      := ObjProduto.estoque_atual;
          cxpeso.EditValue          := ObjProduto.peso_kg;
          cxobs.EditValue           := ObjProduto.observacao;
          cxaviso.EditValue         := ObjProduto.avisos;
          cxativo.EditValue         := ObjProduto.ativo;
          cxservico.EditValue       := ObjProduto.servico;
          cxfracionado.EditValue    := ObjProduto.fracionado;
          cxequipamento.EditValue   := ObjProduto.prod_equipamento;
          cxaltdescricao.EditValue  := ObjProduto.alterar_descricao;
          cxexibirapp.EditValue     := ObjProduto.mostrar_app;
          cxcontrolaestoque.EditValue    := ObjProduto.controlaestoque;
          cxestoquenegativo.EditValue    := ObjProduto.prod_estoque_per_negativo;
          cxmateriaprima.EditValue       := ObjProduto.prod_materiaprima;
          cxprecom2.EditValue             := ObjProduto.preco_m2;

          cxarea.EditValue                :=ObjProduto.area_chapa;
          cxusachapa.EditValue            :=ObjProduto.usa_chapa;
          if objProduto.usa_chapa='S' then
          AtualizarCamposChapa;

          cxaltura.EditValue              :=ObjProduto.altura_chapa;
          cxlargura.EditValue             :=ObjProduto.largura_chapa;
          cxqtde.EditValue                :=ObjProduto.qtde_chapa;

          if ObjProduto.foto1 <> '' then
          begin
            TConesul.ConvBase64Img(ObjProduto.foto1);
            edtFoto.Picture         := TConeSul.nfoto;
            TConeSul.nfoto.Free;
          end;
          cxdescricao.SetFocus;
        end
        else
        begin
          JKDialog('Aviso','Não foi possivel carregar os dados.', tdAlerta);
          exit;
        end;

    Finally
      ObjProduto.Free;
      ContrProduto.Free;
    End;
  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmProdutoCad.Salvar(out msg: string): Boolean;
var
AId:Integer;
begin
  try
    Result      := False;
    ContrProduto  := nil;
    ObjProduto   := nil;

    ObjProduto    := TTabProduto.Create;
    ContrProduto  := TProdutoController.Create;

    Try
      if ParamsStr='N' then
      ObjProduto.id_produto     := 0
      else
      ObjProduto.id_produto     := ParamsInt;

      ObjProduto.codigo                 := 0;
      ObjProduto.cod_barras             := Trim(cxbarra.Text);
      ObjProduto.prod_gtin              := Trim(cxGtin.Text);
      ObjProduto.referencia             := Trim(cxref.Text);
      ObjProduto.descricao              := Trim(cxdescricao.Text);
      if cxfiscal.Text = '' then
      ObjProduto.descricao_fiscal       := Trim(cxdescricao.Text)
      else
      ObjProduto.descricao_fiscal       := Trim(cxfiscal.Text);

      ObjProduto.id_grupo               := cxgrupo.EditValue;
      ObjProduto.id_marca               := cxmarca.EditValue;
      ObjProduto.id_localizacao         := cxlocalizacao.EditValue;
      ObjProduto.tipo_produto           := Trim(cxtipo.Text);
      ObjProduto.id_unidade             := cxunidade.EditValue;

      ObjProduto.prc_compra             := cxprccompra.Value;
      ObjProduto.per_custo              := cxperccusto.Value;
      ObjProduto.prc_custo              := cxprccusto.Value;
      ObjProduto.per_lucro              := cxperclucro.Value;
      ObjProduto.prc_venda              := cxprcvenda.Value;
      ObjProduto.prc_promocao           := cxprcpromocao.Value;
      ObjProduto.prod_comissaoperc      := cxperccomissao.Value;

      ObjProduto.estoque_minimo         := cxestminimo.Value;
      ObjProduto.prod_estoque_maximo    := cxestmaximo.Value;
      ObjProduto.estoque_atual          := cxestatual.Value;
      ObjProduto.peso_kg                := cxpeso.Value;

      ObjProduto.observacao             := Trim(cxobs.Text);
      ObjProduto.avisos                 := Trim(cxaviso.Text);

      ObjProduto.ativo                  := cxativo.EditValue;
      ObjProduto.servico                := cxservico.EditValue;
      ObjProduto.fracionado             := cxfracionado.EditValue;
      ObjProduto.alterar_descricao      := cxaltdescricao.EditValue;
      ObjProduto.mostrar_app            := cxexibirapp.EditValue;
      ObjProduto.controlaestoque        := cxcontrolaestoque.EditValue;
      ObjProduto.prod_equipamento       := cxequipamento.EditValue;
      ObjProduto.prod_materiaprima      := cxmateriaprima.EditValue;
      ObjProduto.prod_estoque_per_negativo       := cxestoquenegativo.EditValue;
      ObjProduto.cad_produto            := 'P';

      if edtFoto.Picture.Graphic <> nil then
      begin
        ObjProduto.foto1      := TConeSul.ConvImgBase64(edtfoto);
        TConeSul.nfoto:= nil;
      end;

      ObjProduto.id_empresa             := TSession.idempresa;
      ObjProduto.data_cadastro          := Now;
      ObjProduto.id_usuario             := TSession.ID_USUARIO;
      ObjProduto.excluido               := 0;

      ObjProduto.preco_m2               := cxprecom2.EditValue;

      ObjProduto.area_chapa             := cxarea.EditValue;
      ObjProduto.usa_chapa              := cxusachapa.EditValue;
      ObjProduto.altura_chapa           := cxaltura.EditValue;
      ObjProduto.largura_chapa          := cxlargura.EditValue;
      ObjProduto.qtde_chapa             := cxqtde.EditValue;

      if ParamsStr='E' then
      begin
        ObjProduto.data_alteracao       := Now;
        ObjProduto.id_usuario_alt       := TSession.ID_USUARIO;
      end;

      if ContrProduto.GravarProduto(ObjProduto, AId) then
      begin
        if AID = 0 then
        AID     := ParamsInt;
        msg     := 'Registro salvo com sucesso, Código: '+IntToStr(AId);
        Result  := true;
        edtfoto.Picture:= nil;
        ParamsCloseTela := 'S';

        //Gravar Entrada no estoque produto novo
        ObjEstoque   := Nil;
        ContEstoque  := Nil;

        ContEstoque  := TEstoqueController.Create;
        ObjEstoque   := TModelEstoque.Create;

        Try
          ObjEstoque.id_estoque  := 0;
          ObjEstoque.id_produto  := AId;
          ObjEstoque.qtde        := cxestatual.Value;
          ObjEstoque.id_empresa  := TSession.idempresa;

          if ContEstoque.Salvar(ObjEstoque) then
          begin

          end;

        Finally
          FreeAndNil(ContEstoque);
          FreeAndNIl(ObjEstoque);
        End;

      end;

    Finally
      FreeAndNil(ContrProduto);
      FreeAndNil(ObjProduto);
    End;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

function TFrmProdutoCad.ValidarCampos(out msg: string): Boolean;
var
cod:integer;
begin
  try
    Result  := True;

    if (cxdescricao.Text='') then
    begin
      msg     := 'Informe uma descrição!';
      result  := False;
      Exit;
    end;

    if (cxgrupo.Text= '') or (cxgrupo.EditValue=0) then
    begin
      msg     := 'Selecione um grupo!';
      result  := False;
      Exit;
    end;

    if (cxmarca.Text= '') or (cxmarca.EditValue=0) then
    begin
      msg     := 'Selecione uma marca!';
      result  := False;
      Exit;
    end;

    if (cxlocalizacao.Text= '') or (cxlocalizacao.EditValue=0) then
    begin
      msg     := 'Selecione uma localizacao!';
      result  := False;
      Exit;
    end;

    if (cxunidade.Text= '') or (cxunidade.EditValue=0) then
    begin
      msg     := 'Selecione uma unidade!';
      result  := False;
      Exit;
    end;

    if (cxprcvenda.Text= '') or (cxprcvenda.EditValue=0) then
    begin
      msg     := 'Informe um preço de venda!';
      result  := False;
      Exit;
    end;

    //Validar se o cadastro já existe pelo cod de barra informado.
    if ParamsStr ='N' then
    begin
      if (TiraPontos(cxbarra.Text) <> '') then
      begin
        if TConfiguracaoService.ValidarCadastroExitProduto(cod,TiraPontos(cxbarra.Text)) then
        begin
          Result  := False;
          msg     := 'Produto já tem um cadastro com o mesmo código de barra!'+#13+'Código: '+inttostr(cod);
          exit;
        end;
      end;
    end;

  except on E: Exception do
    begin
      JKDialog('Erro','Ocorreu um erro:'+#13+e.Message, tderro);
    end;
  end;
end;

procedure TFrmProdutoCad.CalcularEstoqueM2;
var
  largura, altura, area, qtdChapas, totalM2: Double;
begin
  // Se não usa chapa, sai
  if not cxusachapa.Checked then
    Exit;

  // Converte valores
  largura   := cxlargura.EditValue;
  altura    := cxaltura.EditValue;
  qtdChapas := cxqtde.EditValue;

  // Valida dimensões
  if (largura <= 0) or (altura <= 0) then
  begin
    cxarea.EditValue := '0,000';
    Exit;
  end;

  // Calcula área
  area := largura * altura;
  cxarea.EditValue := FormatFloat('0.000', area);

  // Se informou chapas, calcula estoque
  if qtdChapas > 0 then
  begin
    totalM2 := qtdChapas * area;
    cxestatual.editvalue := totalM2;
  end;
end;

procedure TFrmProdutoCad.AtualizarCamposChapa;
var
  usaChapa: Boolean;
begin
  usaChapa        := cxusachapa.Checked;

  // Habilita / desabilita campos de chapa
  cxlargura.Enabled := usaChapa;
  cxaltura.Enabled  := usaChapa;
  cxqtde.Enabled    := usaChapa;
  cxarea.Enabled    := usaChapa;
  cxPrecom2.Checked := usaChapa;
  cxPrecom2.Properties.ReadOnly := usaChapa;
  lbEstoque.Caption := 'Estoque M²';
  cxfracionado.Checked  := usaChapa;
  cxfracionado.Properties.ReadOnly := usaChapa;
  if ParamsStr = 'E' then
  cxqtde.Enabled            := False;

  // Área sempre somente leitura
  cxarea.Properties.ReadOnly := True;

  // Estoque:
  // Se usa chapa, ideal é não deixar editar manualmente
  cxestatual.Properties.ReadOnly := usaChapa;

  // Se desmarcar, limpa campos de chapa (opcional)
  if not usaChapa then
  begin
    cxlargura.EditValue := 0;
    cxaltura.EditValue := 0;
    cxqtde.EditValue := 0;
    cxarea.EditValue := 0;
    lbEstoque.Caption := 'Estoque Atual';
    cxPrecom2.Checked := False;
    cxPrecom2.Properties.ReadOnly := false;
    cxfracionado.Checked := False;
    cxfracionado.Properties.ReadOnly := false;
  end;
end;

end.


//procedure TFrmProdutoCad.CarregarDados;
//var
//Produto : TModelProduto;
//msg:string;
//begin
//  Produto             := TModelproduto.Create;
//
//  Try
//    try
//
//      Produto.idproduto   := TNavigation.ParamInt;
//
//      if Produto.Select(msg) then
//      begin
//        //popular os campos
//        edtcodigo.EditValue     := produto.codigo;
//        edtdescricao.EditValue  := produto.descricao;
//        edtbarra.EditValue      := produto.codbarra;
//        edtreferencia.EditValue := produto.referencia;
//        edtdescfiscal.EditValue := produto.desfiscal;
//        edtmarca.EditValue      := produto.idmarca;
//        edtgrupo.EditValue      := produto.idgrupo;
//        edtlocalizacao.EditValue:= produto.idlocalizacao;
//        edttipo.Text            := produto.tipoproduto;
//        edtunidade.EditValue    := produto.idunidade;
//        if Produto.foto1 <> '' then
//        begin
//
//          TConesul.ConvBase64Img(Produto.foto1);
//          edtfoto.Picture         := TConeSul.nfoto;
//          TConeSul.nfoto.Free;
//        end;
//        //**********************//
//        edtcompra.EditValue     := produto.prccompra;
//        edtpercusto.EditValue   := produto.percusto;
//        edtprccusto.EditValue   := produto.prccusto;
//        edtperlucro.EditValue   := produto.perlucro;
//        edtprcvenda.EditValue   := produto.prcvenda;
//        edtestoqueminimo.EditValue  := produto.estoqueminimo;
//        edtestoqueinicial.EditValue := produto.estoqueinicial;
//        edtestoqueatual.EditValue   := produto.estoqueatual;
//        edtpeso.EditValue       := produto.pesokg;
//        edtpromocao.EditValue   := produto.prcpromocao;
//        //**********************//
//        edtaltdescricao.EditValue   := produto.altedescricao;
//        edtservico.EditValue        := produto.servico;
//        edtativo.EditValue          := produto.inativo;
//        edtmostrarapp.EditValue     := produto.mostrarapp;
//        edtfracionado.EditValue     := produto.fracionado;
//        edtestoque.EditValue        := produto.controlaestoque;
//        //**********************//
//        edtobs.Text             := produto.obs;
//        edtaviso.Text           := produto.aviso;
//        //**********************//
//        if Produto.foto2 <> '' then
//        begin
//          TConesul.ConvBase64Img(Produto.foto2);
//          foto2.Picture         := TConeSul.nfoto;
//          TConeSul.nfoto.Free;
//        end;
//
//        if Produto.foto3 <> '' then
//        begin
//          TConesul.ConvBase64Img(Produto.foto3);
//          foto3.Picture         := TConeSul.nfoto;
//          TConeSul.nfoto.Free;
//        end;
//      end;
//
//    Except on e:exception do
//      begin
//        msg := msg+' :'+e.Message;
//        raise;
//      end;
//    end;
//  Finally
//    Produto.Free;
//  End;
//end;

//procedure TFrmProdutoCad.edtcompraExit(Sender: TObject);
//var
//  prccusto  :Double;
//  prccompra :double;
//  percusto  :double;
//begin
//
//  if edtcompra.EditValue = null then
//  begin
//    edtcompra.EditValue := 0;
//    exit;
//  end;
//
//  prccompra := edtcompra.EditValue;
//  percusto  := edtpercusto.EditValue;
//  prccusto  := edtprccusto.EditValue;
//
//
//  prccusto  := SimpleRoundTo(prccompra +
//               (prccompra * percusto /100),-2);
//
//  edtprccusto.EditValue := prccusto;
//end;
//
//procedure TFrmProdutoCad.edtEquipamentoClick(Sender: TObject);
//begin
//  if Edtequipamento.Checked=True then
//  begin
//    TabEquipamento.TabVisible:= true;
//  end
//  else
//  TabEquipamento.TabVisible:= false;
//
//end;
//

//procedure TFrmProdutoCad.edtpercustoExit(Sender: TObject);
//var
//  prccusto  :Double;
//  prccompra :double;
//  percusto  :double;
//  prcvenda  :double;
//  prclucro  :double;
//begin
//
//  if edtpercusto.EditValue = null then
//  begin
//    edtpercusto.EditValue := 0;
//    exit;
//  end;
//
//
//  prccompra := edtcompra.EditValue;
//  percusto  := edtpercusto.EditValue;
//  prccusto  := edtprccusto.EditValue;
//  prclucro  := edtperlucro.EditValue;
//
//  prccusto  := SimpleRoundTo(prccompra +
//               (prccompra * percusto /100),-2);
//
//  prcvenda  := SimpleRoundTo(prccusto +
//                (prccusto * prclucro /100),-2);
//
//  edtprccusto.EditValue := prccusto;
//  edtprcvenda.EditValue := prcvenda;
//end;
//
//procedure TFrmProdutoCad.edtperlucroExit(Sender: TObject);
//var
//  prccusto  :Double;
//  prclucro  :double;
//  prcvenda  :double;
//begin
//  if edtperlucro.EditValue = null then
//  begin
//    edtperlucro.EditValue := 0;
//    exit;
//  end;
//
//  prccusto  := edtprccusto.EditValue;
//  prclucro  := edtperlucro.EditValue;
//
//  prcvenda  := SimpleRoundTo(prccusto +
//                (prccusto * prclucro /100),-2);
//
//  edtprcvenda.EditValue := prcvenda;
//end;
//
//procedure TFrmProdutoCad.edtprccustoExit(Sender: TObject);
//var
//  prccusto  :Double;
//  prccompra :double;
//  percusto  :double;
//  prcvenda  :double;
//  prclucro  :double;
//begin
//
//  if edtprccusto.EditValue = null then
//  begin
//    edtprccusto.EditValue := 0;
//    exit;
//  end;
//
//  prccompra := edtcompra.EditValue;
//  percusto  := edtpercusto.EditValue;
//  prccusto  := edtprccusto.EditValue;
//  prclucro  := edtperlucro.EditValue;
//
//  if edtcompra.EditValue >0 then
//
//  percusto  := SimpleRoundTo(((prccusto * 100) /
//                      prccompra) -100, -2);
//
//  edtpercusto.EditValue := percusto;
//
//  if edtpercusto.EditValue < 0 then
//  edtpercusto.EditValue := 0;
//
//  prcvenda  := SimpleRoundTo(prccusto +
//                (prccusto * prclucro /100),-2);
//
//  edtprcvenda.EditValue := prcvenda;
//end;
//
//procedure TFrmProdutoCad.edtprcvendaExit(Sender: TObject);
//var
//  prccusto  :Double;
//  prclucro  :double;
//  prcvenda  :double;
//begin
//  if edtprcvenda.EditValue = null then
//  begin
//    edtprcvenda.EditValue := 0;
//    exit;
//  end;
//
//  prcvenda  := edtprcvenda.EditValue;
//  prccusto  := edtprccusto.EditValue;
//
//  if edtcompra.EditValue > 0 then
//
//  prclucro  := ((prcvenda * 100)/
//                prccusto) -100;
//
//  edtperlucro.EditValue := prclucro;
//
//  if edtperlucro.EditValue < 0 then
//  edtperlucro.EditValue :=0;
//end;
//


//procedure TFrmProdutoCad.FormShow(Sender: TObject);
//begin
//  ListarGrupoLookup;
//  ListarLocalizaçãoLookup;
//  ListarMarcaLookup;
//  ListarPessoaLookup;
//  ListarUnidadeLookup;
//  TabValores.TabVisible := true;
//
//  if TNavigation.ParamsStr='V' then
//  begin
//    lblTitulo.Caption := 'Visualizando Produto';
//
//    if Tsession.oneOrdemServico='S' then
//    begin
//      edtEquipamento.Visible    := True;
//      ListarModeloLookup;
//      if edtEquipamento.Checked = true then
//      begin
//        edtEstoque.Checked      := False;
//        edtEstoque.Enabled      := False;
//        edtfracionado.Enabled   := False;
//        edtservico.Enabled      := False;
//      end;
//    end;
//
//    CarregarDados;
//
//    cxGroupBox1.Enabled := False;
//    btnSalvar.Enabled   := false;
//  end;
//
//  if TNavigation.ParamsStr='E' then
//  begin
//    lblTitulo.Caption := 'Editando Produto';
//    CarregarDados;
//    edtdescricao.SetFocus;
//
//    if Tsession.oneOrdemServico='S' then
//    begin
//      edtEquipamento.Visible    := True;
//      ListarModeloLookup;
//      if edtEquipamento.Checked = true then
//      begin
//        edtEstoque.Checked      := False;
//        edtEstoque.Enabled      := False;
//        edtfracionado.Enabled   := False;
//        edtservico.Enabled      := False;
//      end;
//    end;
//
//  end;
//
//  if TNavigation.ParamsStr = 'N' then
//  begin
//    edtdescricao.SetFocus;
//    edtativo.Checked        := True;
//    edtaltdescricao.Checked := False;
//    edtservico.Checked      := False;
//    edtmostrarapp.Checked   := False;
//    edtfracionado.Checked   := False;
//    edtEstoque.Checked      := True;
//
//    if Tsession.oneOrdemServico='S' then
//    begin
//      edtEquipamento.Visible    := True;
//      ListarModeloLookup;
//      if TNavigation.ParamsStrCompraOP <> '' then
//      begin
//        edtEstoque.Checked      := False;
//        edtEstoque.Enabled      := False;
//        edtfracionado.Enabled   := False;
//        edtservico.Enabled      := False;
//
//        EdtEquipamento.Checked  := True;
//        EdtCliente.EditValue    := StrToInt(TNavigation.ParamsStrCompraOP);
//      end;
//    end;
//
//  end;
//
//end;

//Function TFrmProdutoCad.Salvar(out msg: string): Boolean;
//var
//idequipamento :integer;
//begin
//  Result          := False;
//  ObjProduto      := Nil;
//  ObjEquipamento  := Nil;
//  ContrProduto    := Nil;
//  ContrEquipamento:= Nil;
//
//  ObjProduto      := TTabProduto.Create;
//  ContrProduto    := TProdutoController.create;
//
//
//  Try
//
//    //criar os dados no objeto
//    ObjProduto.id_produto             := TNavigation.ParamInt;
//    ObjProduto.codigo                 := 0;
//    ObjProduto.id_marca               := edtmarca.EditValue;
//    ObjProduto.id_grupo               := edtgrupo.EditValue;
//    ObjProduto.id_unidade             := edtunidade.EditValue;
//    ObjProduto.id_localizacao         := edtlocalizacao.EditValue;
//    ObjProduto.id_empresa             := TSession.idempresa;
//    ObjProduto.cod_barras             := Trim(edtbarra.Text);
//    ObjProduto.referencia             := Trim(edtreferencia.Text);
//    ObjProduto.tipo_produto           := edttipo.Text;
//    ObjProduto.descricao              := Trim(edtdescricao.Text);
//    if edtdescfiscal.Text = '' then
//    ObjProduto.descricao_fiscal       := Trim(edtdescricao.Text)
//    else
//    ObjProduto.descricao_fiscal       := Trim(edtdescfiscal.Text);
//    ObjProduto.servico                := edtservico.EditValue;
//    ObjProduto.ativo                  := edtativo.EditValue;
//    ObjProduto.prc_compra             := edtcompra.Value;
//    ObjProduto.per_custo              := edtpercusto.Value;
//    ObjProduto.prc_custo              := edtprccusto.Value;
//    ObjProduto.per_lucro              := edtperlucro.Value;
//    ObjProduto.prc_venda              := edtprcvenda.Value;
//    ObjProduto.estoque_minimo         := edtestoqueminimo.Value;
//    ObjProduto.estoque_inicial        := edtestoqueinicial.Value; //por atacado
//    ObjProduto.estoque_atual          := 0;
//    ObjProduto.peso_kg                := edtpeso.Value;
//    ObjProduto.prc_promocao           := edtpromocao.Value;
//    ObjProduto.observacao             := Trim(edtobs.Text);
//    ObjProduto.avisos                 := Trim(edtaviso.Text);
//    ObjProduto.mostrar_app            := edtmostrarapp.EditValue;
//    ObjProduto.alterar_descricao      := edtaltdescricao.EditValue;
//    ObjProduto.data_cadastro          := Now;
//    ObjProduto.data_alteracao         := Now;
//    ObjProduto.id_usuario             := TSession.ID_USUARIO;
//    ObjProduto.id_usuario_alt         := TSession.ID_USUARIO;
//    ObjProduto.excluido               := 0;
//    if edtFoto.Picture.Graphic <> nil then
//    ObjProduto.foto1                  := TConeSul.ConvImgBase64(edtfoto);
//    if Foto2.Picture.Graphic <> nil then
//    ObjProduto.foto2                  := TConeSul.ConvImgBase64(edtfoto);
//    if Foto3.Picture.Graphic <> nil then
//    ObjProduto.foto3                  := TConeSul.ConvImgBase64(edtfoto);
//    ObjProduto.fracionado             := edtfracionado.EditValue;
//    ObjProduto.controlaestoque        := edtestoque.EditValue;
//
//    if edtEquipamento.Checked = False then
//    ObjProduto.cad_produto            := 'P'
//    else
//    ObjProduto.cad_produto            := 'E';
//
//    Try
//      if not ContrProduto.GravarProduto(ObjProduto, TNavigation.ParamInt) then
//      begin
//        msg := 'Erro ao gravar os dados.';
//        exit;
//      end
//      else
//      begin
//        msg     := 'Dados gravado com sucesso.';
//        Result  := True;
//
//        //Gravar dado Equipamento
//        if TSession.oneOrdemServico = 'S' then
//        begin
//          if edtEquipamento.Checked = True then
//          begin
//            ObjEquipamento    := TTabProdutoEquipamento.Create;
//            ContrEquipamento  := TProdutoEquipamentoController.Create;
//
//            Try
//              ObjEquipamento.id_equipamento     := 0;
//              ObjEquipamento.id_produto         := TNavigation.ParamInt;
//              ObjEquipamento.id_cliente         := edtcliente.EditValue;
//              ObjEquipamento.tipo_equipamento   := EdtTipoequipamento.Text;
//              ObjEquipamento.numero_serie       := edtSerie.Text;
//              ObjEquipamento.num_patrimonio     := edtpatrimonio.Text;
//              ObjEquipamento.data_cadastro      := Now;
//              ObjEquipamento.id_empresa         := Tsession.IDEMPRESA;
//              ObjEquipamento.id_usuario         := Tsession.ID_USUARIO;
//              ObjEquipamento.id_modelo          := edtmodelo.EditValue;
//
//              Try
//                if not  ContrEquipamento.GravarEquipamento(ObjEquipamento, idequipamento) then
//                msg := msg + 'Erro no equipamento';
//              except on e:exception do
//               raise Exception.Create(e.message);
//              End;
//
//            Finally
//              FreeAndNil(ObjEquipamento);
//              FreeAndNil(ContrEquipamento);
//            End;
//
//          end;
//
//        end;
//
//      end;
//    except on e:exception do
//     raise Exception.Create(e.Message);
//    End;
//
//  Finally
//    FreeAndNil(ObjProduto);
//    FreeAndNil(ContrProduto);
//  End;
//
//end;
//

